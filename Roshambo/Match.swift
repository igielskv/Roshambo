//
//  Match.swift
//  Roshambo
//
//  Created by Manoli on 03/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import Foundation

struct Match {
    let playerSign: Sign
    let randomSign = Sign.random()
    
    enum MatchResult: String {
        case won = "You Won!"
        case lost = "You Lost!"
        case tie = "It's a Tie!"
    }

    var result: MatchResult {
        if playerSign == randomSign {
            return .tie
        } else {
            if playerSign.beats(randomSign) {
                return .won
            } else {
                return .lost
            }
        }
    }
}
