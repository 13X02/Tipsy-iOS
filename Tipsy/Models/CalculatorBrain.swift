//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Abhijith H on 25/10/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation


struct CalculatorBrain{
    
    var tip : Double = 0.10
    var noOfPeople : Int?
    var billAmount : Float?
    var splitTip : Float?
    mutating func updateTip(tipPercent : String){
        let titleMinusPercentage = tipPercent.dropLast()
        
        let buttonTitleAsNumber = Double(titleMinusPercentage)
        
        tip = buttonTitleAsNumber! / 100
    }
    
    mutating func updatePeople(_ nop : Int){
        noOfPeople = nop
    }
    mutating func updateBill(_ bill : String){
        billAmount = Float(bill)
    }
    mutating func calculateSplitBill(){
        let tipAmount = billAmount ?? 0.0 * Float(tip ?? 0.10)
        let totalBillAmount = billAmount ?? 0.0 + tipAmount
        splitTip = totalBillAmount / Float(noOfPeople ?? 2)
        
    }
    func getTip() -> Int{
        return Int(tip * 100)
    }
    func getBill() -> Float{
        return splitTip!
    }
    
}
