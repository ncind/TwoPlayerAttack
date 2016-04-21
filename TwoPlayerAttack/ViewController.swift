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
    @IBOutlet weak var btnRestart: UIButton!
    @IBOutlet weak var lblRestart: UILabel!
    @IBOutlet weak var lblPlayerAttack: UILabel!
    @IBOutlet weak var lblEnemyAttack: UILabel!
    
    var displayMessage: String = ""
    var currentPlayer: Enemy!
    var currentEnemy: Enemy!
    var winString: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStart()
        
    }
    
    
    func gameStart(){
        lblMessage.text = "Welcome !"
        currentPlayer = Kimara(startingHp: 50, attackPwr: 20)
        currentEnemy = DevilWizard(startingHp: 60, attackPwr: 15)
        btnRestart.hidden = true
        lblRestart.hidden = true
        btnEnemyAttack.hidden = false
        btnPlayerAttack.hidden = false
        lblEnemyAttack.hidden = false
        lblPlayerAttack.hidden = false
        btnPlayerAttack.enabled = true
        btnEnemyAttack.enabled = true
        
        
    }
    
    @IBAction func onRestartBtnTouch(sender: AnyObject) {
        gameStart()
    }
    
    @IBAction func onEnemyAttackBtnTouch(sender: AnyObject) {
        
        btnPlayerAttack.enabled = false
        currentPlayer.attempAttack(currentEnemy.attackPwr)
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enablePlayerButton", userInfo: nil, repeats: false)
        
        
        if !getGameState(){
            findWinner()
            lblMessage.text = winString
            endGame()
        }
        
        
    }
    
    
    @IBAction func onPlayerAttackBtnTouch(sender: AnyObject) {
        
        
        btnEnemyAttack.enabled = false
        currentEnemy.attempAttack(currentPlayer.attackPwr)
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enableEnemyButton", userInfo: nil, repeats: false)
        
        
        if !getGameState() {
            findWinner()
            lblMessage.text = winString
            endGame()
        }
        
    }
    
    
    func enablePlayerButton() {
        btnPlayerAttack.enabled = true
    }
    
    func enableEnemyButton() {
        btnEnemyAttack.enabled = true
    }
    
    func getGameState() -> Bool{
        
        if (currentPlayer.hp <= 0) || (currentEnemy.hp <= 0) {
            return false
        }
        else {
            return true
        }
        
    }
    
    func findWinner() {
        if currentPlayer.hp <= 0 {
            winString = "Kimara is the Winnner !"
        }
        else if currentEnemy.hp <= 0 {
            winString = "Devil Wizard is the Winner ! "
            
        }
        
    }
    
    func endGame() {
        btnEnemyAttack.enabled = false
        btnPlayerAttack.enabled = false
        btnEnemyAttack.hidden = true
        btnPlayerAttack.hidden = true
        lblEnemyAttack.hidden = true
        lblPlayerAttack.hidden = true
        btnRestart.hidden = false
        lblRestart.hidden = false
        
    }
}

