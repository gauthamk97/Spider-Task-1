//
//  ViewController.swift
//  Spider_Task 1
//
//  Created by Gautham Kumar on 14/06/16.
//  Copyright © 2016 Gautham Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var Picker: UIPickerView!
    @IBOutlet weak var RollNoTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var AppDevCheckbox: CheckBox!
    @IBOutlet weak var WebDevCheckbox: CheckBox!
    @IBOutlet weak var TronicsCheckbox: CheckBox!
    @IBOutlet weak var AlgorithmsCheckbox: CheckBox!
    
    var PickerArray = ["CSE","ECE","EEE","Mechanical","Chemical","Civil","Metallurgy","Production","ICE","Architecture"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addDoneButtonOnKeyboard()
        
        Picker.delegate = self
        Picker.dataSource = self
        
        //Creating appropriate keyboards
        NameTextField.autocapitalizationType = UITextAutocapitalizationType.Words
        NameTextField.returnKeyType = UIReturnKeyType.Next
        RollNoTextField.keyboardType = UIKeyboardType.NumberPad
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == NameTextField {
            RollNoTextField.becomeFirstResponder()
        }
        else {
            RollNoTextField.resignFirstResponder()
        }
        return true
    }

    @IBAction func ChangeStoryboardClick(sender: AnyObject) {
        
        //Erasing TextFields
        NameTextField.text = ""
        RollNoTextField.text = ""
        
        //Erasing Checkboxes
        AppDevCheckbox.setImage(UIImage(named: "unchecked_checkbox"), forState: UIControlState.Normal)
        WebDevCheckbox.setImage(UIImage(named: "unchecked_checkbox"), forState: UIControlState.Normal)
        TronicsCheckbox.setImage(UIImage(named: "unchecked_checkbox"), forState: UIControlState.Normal)
        AlgorithmsCheckbox.setImage(UIImage(named: "unchecked_checkbox"), forState: UIControlState.Normal)
        
        // Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
        
        // Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewControllerWithIdentifier("InitialController") as UIViewController
        
        // Display the new view controller.
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerArray.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Adding the Done Button on Numpad for Roll Number Text Field
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.Default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViewController.doneButtonAction))
        
        let items = NSMutableArray()
        items.addObject(flexSpace)
        items.addObject(done)
        
        doneToolbar.items = [done]
        doneToolbar.sizeToFit()
        
        //self.textView.inputAccessoryView = doneToolbar
        self.RollNoTextField.inputAccessoryView = doneToolbar
        
    }
    
    func doneButtonAction()
    {
        self.RollNoTextField.resignFirstResponder()
    }
    
    @IBAction func CheckboxClick(sender: CheckBox) {
        if sender.isChecked == false {
            sender.setImage(UIImage(named: "checked_checkbox"), forState: UIControlState.Normal)
            sender.isChecked = true
        }
        else {
            sender.setImage(UIImage(named: "unchecked_checkbox"), forState: UIControlState.Normal)
            sender.isChecked = false
        }
        
    }
    

}

