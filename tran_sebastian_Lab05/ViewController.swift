//
//  ViewController.swift
//  tran_sebastian_Lab05
//
//  Created by Tran, Sebastian on 12/9/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.inputTempField.delegate = self
        
        FinalTemp.text = "--"
        
        if (tempConverter.scale == .celcius){
            inputTempUnit.text = "°C"
            finalTempUnit.text = "°F"
        }
        else {
            inputTempUnit.text = "°F"
            finalTempUnit.text = "°C"
        }
        
    }
    
    let tempConverter = TempConverter()

    @IBOutlet weak var FinalTemp: UILabel!
    @IBOutlet weak var finalTempUnit: UILabel!
    @IBOutlet weak var inputTempUnit: UILabel!
    @IBOutlet weak var inputTempField: UITextField!
    
    @IBAction func convertTempButton(_ sender: Any) {
        let userData = inputTempField.text!
        
        if let inputTemp = Double(userData) {
            tempConverter.inputTemp = inputTemp
        }
        else {
            tempConverter.inputTemp = -500
        }
        
        if (tempConverter.converetedTemp == nil){
            FinalTemp.text = "N/A"
        }
        else {
            FinalTemp.text = String(Int(tempConverter.converetedTemp!))
        }
    }
    
    
    @IBAction func convertTempUnit(_ sender: Any) {
        tempConverter.switchScale()
        handleSwitchScale()
    }
    
    @objc func handleSwitchScale () {
        FinalTemp.text = "--"
        
        if (tempConverter.scale == .fahrenheit){
            finalTempUnit.text = "°C"
            inputTempUnit.text = "°F"
        }
        else {
            finalTempUnit.text = "°F"
            inputTempUnit.text = "°C"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTempField.resignFirstResponder()
        return true
    }
    
}

