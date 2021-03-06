//
//  ViewController.swift
//  X-O
//
//  Created by Abdullah Almunaikh on 6/20/20.
//  Copyright © 2020 Abdullah Almunaikh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    @IBOutlet weak var B7: UIButton!
    @IBOutlet weak var B8: UIButton!
    @IBOutlet weak var B9: UIButton!
    
    @IBOutlet weak var oScore: UILabel!
    @IBOutlet weak var xScore: UILabel!
    
    
    
    
    
    
    
    @IBOutlet weak var TurnLable: UILabel!
    var buttons: [UIButton] = []
    override func viewDidLoad() {
        buttons = [B1, B2, B3, B4, B5, B6, B7, B8, B9]
        
        
    }
    
    
    
    
    let impact = UIImpactFeedbackGenerator()
    
    
    var oCounter = 0
    var xCounter = 0
    
    var counter = 0
    
    @IBAction func press(_ sender: UIButton) {
        
        impact.impactOccurred()
        
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            TurnLable.text = "O Turn"
        } else {
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.blue, for: .normal)
            TurnLable.text = "X Turn"
        }
        counter += 1
        sender.isEnabled = false
        
        theWinner(winner: "X")
        theWinner(winner: "O")
        
        
        
    }
    @IBAction func resetTapped() {
        restartGame()
        
    }
    
    
    func theWinner(winner: String){
        
        oScore.text = String(oCounter)
        
        
        
        if (B1.titleLabel?.text == winner && B2.titleLabel?.text == winner && B3.titleLabel?.text == winner) ||
            (B4.titleLabel?.text == winner && B5.titleLabel?.text == winner && B6.titleLabel?.text == winner) ||
            (B7.titleLabel?.text == winner && B8.titleLabel?.text == winner && B9.titleLabel?.text == winner) ||
            (B1.titleLabel?.text == winner && B5.titleLabel?.text == winner && B9.titleLabel?.text == winner) ||
            (B3.titleLabel?.text == winner && B5.titleLabel?.text == winner && B7.titleLabel?.text == winner) ||
            (B2.titleLabel?.text == winner && B5.titleLabel?.text == winner && B8.titleLabel?.text == winner) ||
            (B1.titleLabel?.text == winner && B4.titleLabel?.text == winner && B7.titleLabel?.text == winner) ||
            (B3.titleLabel?.text == winner && B6.titleLabel?.text == winner && B9.titleLabel?.text == winner) {
            
            
            
            if self.xCounter == 2 && self.xCounter > self.oCounter || self.oCounter == 2 && self.oCounter > self.xCounter{
                let winCountroller = UIAlertController(title: "The Final Winner is ... \(winner)!", message: "tap Restart to restart the game", preferredStyle: .alert)
                let winaction = UIAlertAction(title: "Restart", style: .cancel) { (alert) in
                    
                    self.restartGame()
                    
                }
                winCountroller.addAction(winaction)
                present(winCountroller, animated: true, completion: nil)

            }else if winner == "X"{
                
                self.xCounter += 1
                self.xScore.text = String(self.xCounter)
            }else{
                
                self.oCounter += 1
                self.oScore.text = String(self.oCounter)
            }
            
            
            
            let alertCountroller = UIAlertController(title: "\(winner) Wins!", message: "Press the button to continue", preferredStyle: .alert)
            let alertaction = UIAlertAction(title: "continue", style: .cancel) { (alert) in
                
                for b in self.buttons {
                    b.setTitle("", for: .normal)
                    b.titleLabel?.text = ""
                    b.isEnabled = true
                }
                self.counter = 0
                
            }
            alertCountroller.addAction(alertaction)
            present(alertCountroller, animated: true, completion: nil)
            self.TurnLable.text = "X Turn"
            
        }
    }
    
    func restartGame() {
        oCounter = 0
        xCounter = 0
        for b in buttons {
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }
        counter = 0
        TurnLable.text = "X Turn"
        self.oScore.text = String(self.oCounter)
        self.xScore.text = String(self.xCounter)
        
    }
}

