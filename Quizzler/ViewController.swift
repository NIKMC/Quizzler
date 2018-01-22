//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    let MESSAGE : String = "You've finished all the questions, do you want to start over?"
    var score : Int = 0
    lazy var totalCount : Int = allQuestions.list.count
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer(currentAnswer: pickedAnswer)
        questionNumber += 1
        updateUI()
        
    }
    
    
    func updateUI() {
        if questionNumber < totalCount {
            scoreLabel.text = "Score: \(score)"
            progressBar.frame.size.width = (view.frame.size.width / CGFloat(totalCount)) * CGFloat(questionNumber + 1)
            progressLabel.text = "\(questionNumber + 1) / \(totalCount)"
        } else {
            scoreLabel.text = "Score: \(score)"
        }
        nextQuestion()
    }
    

    func nextQuestion() {
        if questionNumber < totalCount {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            let alert = UIAlertController(title: "Awesome", message: MESSAGE, preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { /*[weak self]*/ UIAlertAction in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer(currentAnswer: Bool) {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == currentAnswer {
            ProgressHUD.showSuccess("Correct!")
            score += 1
        } else {
            ProgressHUD.showError("Wrong!")
        }
    }

    
    func startOver() {
        questionNumber = 0
        score = 0
        updateUI()
    }
}
