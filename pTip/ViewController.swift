//
//  ViewController.swift
//  pTip
//
//  Created by Paul Weinstein on 3/12/17.
//  Copyright © 2017 Paul Weinstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // UI elements
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Load default settings
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipKey")
        
        if intValue == 0 {
            tipControl.selectedSegmentIndex = 0
        } else if intValue == 1 {
            tipControl.selectedSegmentIndex = 3
        }

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // Load default settings
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipKey")
        
        if intValue == 0 {
            tipControl.selectedSegmentIndex = 0
        } else if intValue == 1 {
            tipControl.selectedSegmentIndex = 3
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTab(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func CalcTip(sender: AnyObject) {
    
        // tip array
        let tipPercent = [ 0.15, 0.18, 0.20, 0.25 ]

        // tip calc
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // tip display
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    

    
    @IBOutlet weak var billField: UITextField!

}

