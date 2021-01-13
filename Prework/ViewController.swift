//
//  ViewController.swift
//  Prework
//
//  Created by Levi Gerber on 1/9/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var overallTotalLabel: UILabel!
    @IBOutlet weak var tipRateLabel: UILabel!
    @IBOutlet weak var tipRateSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * Double(tipRateSlider.value)
        let total = bill + tip
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total/peopleStepper.value)
        overallTotalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func updatePeopleLabel(_ sender: Any) {
        peopleLabel.text = String(format: "%.0f", peopleStepper.value)
    }
    @IBAction func updateTipSlider(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.2]
        tipRateSlider.setValue(Float(tipPercentages[tipControl.selectedSegmentIndex]), animated: true)
        updateTipRate(sender)
        calculateTip(sender)
    }
    @IBAction func updateTipRate(_ sender: Any) {
        tipRateLabel.text = String(format: "%.0f%%", tipRateSlider.value*100)
    }
}

