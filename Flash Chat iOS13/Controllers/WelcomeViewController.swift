//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Ej Dogar on 21/02/2023.
//


import UIKit
import CLTypingLabel
class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "⚡️FlashChat"
       
    }
    

}
