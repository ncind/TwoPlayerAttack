//
//  DevilWizard.swift
//  TwoPlayerAttack
//
//  Created by Nikhil Pagidala on 4/20/16.
//  Copyright © 2016 Nikhil Pagidala. All rights reserved.
//

import Foundation

class DevilWizard: Enemy{
    
    override var loot: [String]{
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String{
        return "Devil Wizard"
    }
}