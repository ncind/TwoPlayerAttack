//
//  ViewController.swift
//  TwoPlayerAttack
//
//  Created by Nikhil Pagidala on 4/20/16.
//  Copyright © 2016 Nikhil Pagidala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnEnemyAttack: UIButton!
    @IBOutlet weak var btnPlayerAttack: UIButton!
    @IBOutlet weak var lblMessage: UILabel!
    
    var displayMessage: String = ""
    var player: Enemy!
    var enemy: Enemy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    func getRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0{
        
            enemy = Kimara(startingHp: 50, attackPwr: 20)
            btnEnemyAttack.enabled = true
            btnPlayerAttack.enabled = false
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
            btnPlayerAttack.enabled = true
            btnEnemyAttack.enabled = false
        }
        
        
    
    
    
    }
    
    
   
    @IBAction func onEnemyAttackBtnTouch(sender: AnyObject) {
    }
    
    
    @IBAction func onPlayerAttackBtnTouch(sender: AnyObject) {
    }
  
}

