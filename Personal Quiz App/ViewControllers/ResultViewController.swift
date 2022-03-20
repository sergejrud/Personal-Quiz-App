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
        updateResult()
    }
    
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal?) {
        yourAnimalType.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        yourAnimalDescription.text = animal?.definition ?? ""
    }
}
