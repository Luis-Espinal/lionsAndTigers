//
//  LionCub.swift
//  lionsAndTigers
//
//  Created by Luis Espinal on 10/6/14.
//  Copyright (c) 2014 Luis Espinal. All rights reserved.
//

import Foundation

class LionCub:Lion {
    
    var isMale = false
    
    
 
    func rubLionCubsBelly () {
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar () {
        super.roar()
        println("LionCub: Growl Growl")
    }
    
    override func randomFact() -> String {
        
        var randomFactString:String
        
        if isMale {
            randomFactString = "Cubs are usually hidden in dense bush for approximately six weeks."
        } else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks."
        }
        return randomFactString
    }
        
}