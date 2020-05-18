//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Lean Caro on 15/05/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {

    /*
    let text: String
    let answer: String
    let correctAnswer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }*/

    let text: String
    var choices = [String]()
    let correctAnswer: String

     init(q: String, a: [String], c: String) {
        text = q
        choices = a
        correctAnswer = c
        
    }
    
}
