//
//  TipCalc.swift
//  TipCarculator
//
//  Created by Al Hidayat on 10/30/17.
//  Copyright © 2017 Coding Ceria. All rights reserved.
//

import Foundation

class TipCalc
{
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    
    init(amountBeforeTax: Float, tipPercentage: Float)
    {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    public func calculateTip() -> Float
    {
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = amountBeforeTax + tipAmount
        return totalAmount
    }
}
