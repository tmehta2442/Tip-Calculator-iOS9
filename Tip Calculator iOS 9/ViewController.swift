//
//  ViewController.swift
//  Tip Calculator iOS 9
//
//  Created by Tejas Mehta on 1/12/16.
//  Copyright © 2016 Tejas Mehta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtMealCost: UITextField!
    @IBOutlet weak var txtTipPercentage: UITextField!

    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblTipTotal: UILabel!
    
    var mealCost = ""
    var tipPercentage = ""
    
    var totalTip : Float = 0.0
    var totalMealCost : Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnCalculateACTION(sender: UIButton) {
        
        calculatTip()
    }

    @IBAction func btnClearACTION(sender: UIButton) {
        
        clear()
    }
    
    func calculatTip(){
        mealCost = txtMealCost.text!
        tipPercentage = txtTipPercentage.text!
        
        let fMealCost = Float(mealCost)
        let fTipPercentage = Float(tipPercentage)
        
        totalTip = fMealCost! * (fTipPercentage! / 100 )
        totalMealCost = fMealCost! + totalTip
        printTip()
    }
    
    func printTip(){
        
        let formatTip = String(format: "%0.2f", totalTip)
        let formatTotal = String(format: "%0.2f", totalMealCost)
        
        lblTip.text = "Tip: $\(formatTip)"
        lblTipTotal.text = "$\(formatTotal)"
    }
    
    func clear(){
        txtMealCost.text = ""
        txtTipPercentage.text = ""
        
        lblTip.text = "Tip: $0.00"
        lblTipTotal.text = "$0.00"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hideKeyboards()
    }
    
    func hideKeyboards(){
        txtMealCost.resignFirstResponder()
        txtTipPercentage.resignFirstResponder()
    }
}

