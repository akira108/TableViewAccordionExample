//
//  ViewController.swift
//  TableViewAccordionExample
//
//  Created by Akira Iwaya on 2016/02/02.
//  Copyright © 2016年 akira108. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let datePickerRow = 1;
    
    var openDatePicker = false
    
    var date = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView .dequeueReusableCellWithIdentifier("DateCell", forIndexPath: indexPath) as! DateCell
            cell.dateLabel.text = "\(date)"
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("DatePickerCell", forIndexPath: indexPath) as! DatePickerCell
            cell.datePicker .addTarget(self, action: "handleChange:", forControlEvents: UIControlEvents.ValueChanged)
            
            return cell
        }
    }
    
    func updateCell() {
        for cell in self.tableView.visibleCells where cell is DateCell {
            let dateCell = cell as! DateCell
            dateCell.dateLabel.text = "\(date)"
        }
    }
    
    func handleChange(sender: UIDatePicker) {
        print(sender.date)
        date = sender.date
        updateCell()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            openDatePicker = !openDatePicker;
            
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == datePickerRow {
            if openDatePicker {
                return 216;
            } else {
                return 0;
            }
        } else {
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }

}

