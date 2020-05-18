//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Adjusts font size to fix button's width
        choice1.titleLabel?.adjustsFontSizeToFitWidth = true
        choice2.titleLabel?.adjustsFontSizeToFitWidth = true
        choice3.titleLabel?.adjustsFontSizeToFitWidth = true
        
        updateUI()
    }

    // Connect True and False burrons
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // Choice1 / Choice2 / Choice3
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        // Check if user answer is correct or not
        if userGotItRight  {
            // Correct --> button's background to green
            sender.backgroundColor = UIColor.green
        } else {
            // False --> button's background to red
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        // Execute updateUI function after 0.5 seconds
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // Update question and reset buttons color
    @objc func updateUI() {
        // Update question text
        questionLabel.text = quizBrain.getQuestionText()
        // Update progress bar
        progressBar.progress = quizBrain.getProgress()
        // Update score
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        // Update choices labels
        let x = quizBrain.getChoice1()
        let y = quizBrain.getChoice2()
        let z = quizBrain.getChoice3()
        choice1.setTitle(x, for: .normal)
        choice2.setTitle(y, for: .normal)
        choice3.setTitle(z, for: .normal)

        // Reset button's color
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
}

