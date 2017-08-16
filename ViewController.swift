//
//  ViewController.swift
//  MiraclePill
//
//  Created by Scott Youse on 8/11/17.
//  Copyright © 2017 SMY App Works. All rights reserved.
//

import UIKit


//Extension to hide keyboard when screenis tapped
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var statePickerBtn: UIButton!
    
    @IBOutlet weak var pageView: UIScrollView!
   
    @IBOutlet weak var successImage: UIImageView!
    @IBOutlet weak var orderMore: UIButton!
    @IBOutlet weak var buyNowOutlet: UIButton!

    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var zipText: UITextField!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryText: UITextField!
    
    
    let states = ["Pick a State...", "Alaska", "Alabama", "Arkansas", "American Samoa", "Arizona", "California", "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia", "Guam", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Virgin Islands", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statePicker.dataSource = self
        statePicker.delegate = self
        //call to hide keyboard when screen tapped
        self.hideKeyboardWhenTappedAround()
        
        nameText.delegate = self
        addressText.delegate = self
        cityText.delegate = self
        zipText.delegate = self
        countryText.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        if textfield == nameText {
            addressText.becomeFirstResponder()
        }else if textfield == addressText {
            cityText.becomeFirstResponder()
        }else if textfield == cityText {
            zipText.becomeFirstResponder()
        }else if textfield == zipText {
            countryText.becomeFirstResponder()
        }else {
            countryText.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = false
        zipLabel.isHidden = true
        zipText.isHidden = true
        countryLabel.isHidden = true
        countryText.isHidden = true
        buyNowOutlet.isHidden = true

    }

 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        zipLabel.isHidden = false
        zipText.isHidden = false
        countryLabel.isHidden = false
        countryText.isHidden = false
        buyNowOutlet.isHidden = false
        
    }
    
    @IBAction func buyNow(_ sender: Any) {
        pageView.isHidden = true
        successImage.isHidden = false
        orderMore.isHidden = false
      
    }
    
    @IBAction func orderMoreAction(_ sender: Any) {
        pageView.isHidden = false
        successImage.isHidden = true
        orderMore.isHidden = true
        
    }
    
    
    
}

