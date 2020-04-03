//
//  InitialViewController.swift
//  Roshambo
//
//  Created by Manoli on 02/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func rockButtonTapped(_ sender: UIButton) {
        let resultViewController: ResultViewController
        resultViewController = storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
        
        resultViewController.match = Match(playerSign: .rock)
        
        present(resultViewController, animated: true, completion: nil)
    }
    
    @IBAction func paperButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "fromViewController", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let resultViewController = segue.destination as! ResultViewController
        
        // Pass the selected object to the new view controller.
        if segue.identifier == "fromViewController" {
            resultViewController.match = Match(playerSign: .paper)
        } else if segue.identifier == "fromScissorsButton" {
            resultViewController.match = Match(playerSign: .scissors)
        }
    }

}
