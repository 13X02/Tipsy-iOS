//
//  ViewController.swift
//  Tipsy
//
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    var tip = 0.10
    var noOfPeople = 2
    var billAmount : Float?
    var calculatorBrain = CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        deSelectButton()
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle
        
        calculatorBrain.updateTip(tipPercent : buttonTitle!)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        noOfPeople = Int(sender.value)
        calculatorBrain.updatePeople(noOfPeople)
        splitNumberLabel.text  = String(noOfPeople)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
       
        if billTextField != nil{
            calculatorBrain.updateBill(billTextField.text!)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult"{
            
            calculatorBrain.calculateSplitBill()
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.billAmount = calculatorBrain.getBill()
            destinationVC.tip = calculatorBrain.getTip()
            destinationVC.noOfPeople = noOfPeople
        }
        
    }
    func deSelectButton(){
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        zeroPctButton.isSelected = false
    }
}

