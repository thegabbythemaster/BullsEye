//
//  ViewController.swift
//  BullsEye
//
//  Created by Gabby Gonzalez on 2/4/21.
//

import UIKit

class ViewController: UIViewController {
    //used to save the data until user hits button
    
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        slider.setValue(50.0, animated: true)
    }
    /*creates the alert
     an iOS component which shows a message
     with a title "Hello world"
     a message that states "this is my first app"
     and a single button labeled Awesome
 */
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5{
            title = "You almost had it!"
            if difference == 1{
                points += 50
            }
        }else if difference < 10{
            title = "Pretty good!"
        }else{
            title = "Not even close..."
        }
        score += points
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default){ _ in self.startNewRound()}
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    

    @IBAction func startNewGame() {
            round = 0
            score = 0
            startNewRound()
    }
    
    func updateLabels(){
        //converts int to string for label text type
        //can also do "\(targetValue)"
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

