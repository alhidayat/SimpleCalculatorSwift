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
    var tipCalc = TipCalc(amountBeforeTax: 25.0 , tipPercentage: 20)
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [tipCalc.amountBeforeTax])
        tipPercentageLabel.text = String(format: "Tip %d:", arguments: [Int(tipCalc.tipPercentage)])
        calcTip()
    }
    
    func calcTip()
    {
        guard let safeAmount = amountBeforeTaxTextField.text else{
            return
        }
        if let amount = Float(safeAmount){
        tipCalc = TipCalc(amountBeforeTax: amount  , tipPercentage: Float(tipPercentageSlider.value/100))
        updateUI()
        }
    }
    
    func updateUI()
    {
        let billAmount = tipCalc.calculateTip()
        resultLabel.text = String(format: "Total : $%.2f  Tip : $%.2f", billAmount, tipCalc.tipAmount)
    }
    
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
    
    @IBAction func tipSliderChanged(_ sender: UISlider!) {
        tipPercentageLabel.text = "Tip \(UInt(sender.value))%:"
        calcTip()
        updateUI()
    }
    
}



