//
//  Question.swift
//  Quizzler
//
//  Created by Иван Никитин on 19/01/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(question: String, correctAnswer: Bool) {
        self.questionText = question
        self.answer = correctAnswer
    }
    
}
