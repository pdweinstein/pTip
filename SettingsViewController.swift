//
//  SettingsViewController.swift
//  pTip
//
//  Created by Paul Weinstein on 3/12/17.
//  Copyright © 2017 Paul Weinstein. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Load default settings
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipKey")
        
        settingsControl.selectedSegmentIndex = intValue
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSelect(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(settingsControl.selectedSegmentIndex, forKey: "tipKey")
        defaults.synchronize()
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
