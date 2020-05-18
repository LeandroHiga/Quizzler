//
//  Choice.swift
//  Quizzler-iOS13
//
//  Created by Lean Caro on 16/05/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Choice {
    let choice1: String
    let choice2: String
    let choice3: String
    
    init(x: String, y: String, z: String) {
        self.choice1 = x
        self.choice2 = y
        self.choice3 = z
    }
}
