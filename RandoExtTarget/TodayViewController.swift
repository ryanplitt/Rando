//
//  TodayViewController.swift
//  RandoExtTarget
//
//  Created by Ryan Plitt on 2/20/17.
//  Copyright © 2017 Ryan Plitt. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    // MARK: - Outlets
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputStepper: UIStepper!
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    

    // MARK: - Actions
    
    @IBAction func goButtonTapped(_ sender: Any) {
        let randomNumber = arc4random_uniform(UInt32(inputStepper.value))
        outputLabel.text = String(randomNumber)
    }
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNumberLabel.text = String(Int(inputStepper.value))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
