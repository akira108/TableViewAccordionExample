//
//  DatePickerCell.swift
//  TableViewAccordionExample
//
//  Created by Akira Iwaya on 2016/02/02.
//  Copyright © 2016年 akira108. All rights reserved.
//

import UIKit

class DatePickerCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
