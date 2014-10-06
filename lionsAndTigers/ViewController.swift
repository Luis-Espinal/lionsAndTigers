//
//  ViewController.swift
//  lionsAndTigers
//
//  Created by Luis Espinal on 9/22/14.
//  Copyright (c) 2014 Luis Espinal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[(Tiger) ] = []
    var myLions:[Lion] = []
    
    var currentIndex = 0
    var currentAnimal = (species: "Tiger", index : 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage (named:"BengalTiger.jpg")
        
//        myTiger.chuff()
        myTiger.chuffANumberOfTimes(3)
        myTiger.chuffANumberOfTimes(5, isLoud: false)
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        
        self.myTigers.append(myTiger)
        
        
        println("My Tiger's name is \(myTiger.name) and his breed is \(myTiger.breed) and the image is \(myTiger.image)")
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        
        self.currentIndex = 0
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)

        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)

        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)

        
        
        myTiger.chuffANumberOfTimes(3)
        secondTiger.chuffANumberOfTimes(2)
//            secondTiger.chuff()
//            thirdTiger.chuff()
//            fourthTiger.chuff()
        
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        
        var lion = Lion()
        
            lion.age = 4
            lion.isAlphaMale = false
            lion.image = UIImage (named:"Lion.jpg")
            lion.name = "Mufasa"
            lion.subspecies = "West African"
        
        var lioness = Lion()
        
            lion.age = 3
            lion.isAlphaMale = false
            lion.image = UIImage(named: "Lioness.jpeg")
            lion.name = "Sarabi"
            lion.subspecies = "Barbary"
        
        self.myLions += [lion, lioness]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    
    
    
    func updateAnimal (){
        switch currentAnimal {
        case ("Tiger", _) :
            let randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
            currentAnimal = ("Lion", randomIndex)
        default :
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
        
    }
    
    func updateView (){
        
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
                self.randomFactLabel.hidden = false
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.myLions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.hidden = true
            }

            }, completion: { (finished: Bool) -> () in
        })
        
    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        //updateTiger()
        updateAnimal()
        updateView()
    }

    func updateTiger () {
        
        var randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        
        while self.currentIndex == randomIndex {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        }
        self.currentIndex = randomIndex
        
        
        let tiger = myTigers [randomIndex]
        
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            
            }, completion: { (finished: Bool) -> () in
        })
        
    }
    
}