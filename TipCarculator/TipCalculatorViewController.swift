//
//  TipCalculatorViewController.swift
//  TipCarculator
//
//  Created by Al Hidayat on 10/30/17.
//  Copyright © 2017 Coding Ceria. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!

    
    // MARK: - Properties
    var tipCalc = TipCalc(amountBeforeTax: 25.00, tipPercentage: 0.2)
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [tipCalc.amountBeforeTax])
        tipPercentageLabel.text = String(format: "Tip %d%%:", arguments: [Int(tipCalc.tipPercentage * 100)])
    }
    
    func calcTip()
    {
        tipCalc.tipPercentage = Float(tipPercentageSlider.value)
        tipCalc.amountBeforeTax = ((amountBeforeTaxTextField.text) as NSString).floatValue
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI()
    {
        resultLabel.text = String(format: "Total: $%0.2f Tip: $%0.2f", argument: [tipCalc.totalAmount, tipCalc.tipAmount])
    }
    
    // MARK: - UIConrol     Events
    
    @IBAction func amountBeforeTaxTexFieldChanged(_ sender: Any)
    {
        print("text field value changed")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == amountBeforeTaxTextField {
            textField.resignFirstResponder()
            calcTip()
        }

        return true
    }

}

































