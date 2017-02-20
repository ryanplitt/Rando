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
        let randomNumber = arc4random_uniform(UInt32(inputStepper.value)) + 1
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
            self.outputLabel.alpha = 0.0
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
                self.outputLabel.text = String(randomNumber)
                self.outputLabel.alpha = 1.0
            }, completion: { (_) in
                //
            })
        }
    }
    
    @IBAction func quickButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: { 
            self.inputNumberLabel.alpha = 0.0
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
                self.inputStepper.value = Double(sender.tag)
                self.inputNumberLabel.text = String(Int(self.inputStepper.value))
                self.inputNumberLabel.alpha = 1.0
            }, completion: nil)
        }
        goButtonTapped(self)
    }
    
    
    
    @IBAction func inputStepperValueChanged(_ sender: Any) {
        inputNumberLabel.text = String(Int(inputStepper.value))
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNumberLabel.text = ""
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
