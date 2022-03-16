//
//  ResultViewController.swift
//  Personal Quiz App
//
//  Created by Сергей Рудь on 16.03.22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var yourAnimalType: UILabel!
    @IBOutlet var yourAnimalDescription: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
    }
}
