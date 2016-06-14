//
//  CheckBox.swift
//  Spider_Task 1
//
//  Created by Gautham Kumar on 14/06/16.
//  Copyright © 2016 Gautham Kumar. All rights reserved.
//

//A lot has been commented out here. The comments represent an alternate way to create checkboxes.

import UIKit

class CheckBox: UIButton {

    /*let checkedImage = UIImage(named: "checked_checkbox")
    let uncheckedImage = UIImage(named: "unchecked_checkbox")*/
    
    var isChecked: Bool = false/* {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, forState: UIControlState.Normal)
            }
            else {
                self.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }*/
}
