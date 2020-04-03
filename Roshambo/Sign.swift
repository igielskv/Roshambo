//
//  Sign.swift
//  Roshambo
//
//  Created by Manoli on 03/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import Foundation

enum Sign: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    var action: String {
        switch self {
        case .rock:
            return "crushes"
        case .paper:
            return "covers"
        case .scissors:
            return "cut"
        }
    }
    
    func beats(_ otherSign: Sign) -> Bool {
        switch (self, otherSign) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return true;
        default:
            return false;
        }
    }
    
    static func random() -> Sign {
        switch arc4random() % 3 {
        case 0:
            return .rock
        case 1:
            return .paper
        default:
            return .scissors
        }
    }
}
