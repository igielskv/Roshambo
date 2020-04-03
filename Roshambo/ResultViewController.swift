//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Manoli on 02/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var match: Match?
    
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let match = match {
            messageLabel.text = messageFor(match: match)
            resultImage.image = imageFor(match: match)
        }
    }
    
    func messageFor(match: Match) -> String {
        var message = ""
        
        if match.result == .won {
            message = "\(match.playerSign.rawValue) \(match.playerSign.action) \(match.randomSign.rawValue). "
        } else if match.result == .lost {
            message = "\(match.randomSign.rawValue) \(match.randomSign.action) \(match.playerSign.rawValue). "
        }
        
        return message + match.result.rawValue
    }

    func imageFor(match: Match) -> UIImage {
        var imageName: String
        
        switch match.result {
        case .won:
            imageName = match.playerSign.rawValue + match.playerSign.action.capitalized + match.randomSign.rawValue
        case .lost:
            imageName = match.randomSign.rawValue + match.randomSign.action.capitalized + match.playerSign.rawValue
        default:
            imageName = "itsATie"
        }
        
        return UIImage(named: imageName)!
    }
    
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
