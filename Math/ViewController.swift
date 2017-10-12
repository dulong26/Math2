//
//  ViewController.swift
//  Math
//
//  Created by Nguyen Quynh Chi on 10/12/17.
//  Copyright © 2017 silverpear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNum1: UILabel!
    @IBOutlet weak var lbNum2: UILabel!
    @IBOutlet weak var lbMath: UILabel!
    
    @IBOutlet weak var btResult1: UIButton!
    @IBOutlet weak var btResult2: UIButton!
    @IBOutlet weak var btResult3: UIButton!
    
    @IBOutlet weak var lbRight: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    var countRight = 0, countWrong = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setNumber()
    }

    func setNumber() {
        let num1 = Int(arc4random_uniform(5)) + 1
        let num2 = Int(arc4random_uniform(5)) + 1
        let randomMath = Int(arc4random_uniform(2))
        lbNum1.text = String(num1)
        lbNum2.text = String(num2)
        if randomMath == 0 {
            lbMath.text = "+"
        } else {
            lbMath.text = "-"
        }
        
        setResult(numA: num1, numB: num2, sign: randomMath)
    }
    
    func setResult(numA: Int, numB: Int, sign: Int) {
        var result: Int
        if sign == 0 {
            result = numA + numB
        } else {
            result = numA - numB
        }
        
        let resultArray = [numA, numB, result]
        var rand1, rand2, rand3: Int
        rand1 = Int(arc4random_uniform(3))
        repeat {
            rand2 = Int(arc4random_uniform(3))
            rand3 = Int(arc4random_uniform(3))
        } while (rand2 == rand1)||(rand3 == rand2)||(rand1 == rand3)
        
        btResult1.setTitle(String(resultArray[rand1]), for: .normal)
        btResult2.setTitle(String(resultArray[rand2]), for: .normal)
        btResult3.setTitle(String(resultArray[rand3]), for: .normal)
    }
 
    
    @IBAction func btAction(_ sender: UIButton) {
        let num1 = Int(lbNum1.text!)
        let num2 = Int(lbNum2.text!)
        let sign = lbMath.text!
        var result: Int
        
        if sign == "+" {
            result = num1! + num2!
        } else {
            result = num1! - num2!
        }
        if sender.currentTitle == String(result) {
            countRight += 1
            lbRight.text = "Right: " + String(countRight)
        } else {
            countWrong += 1
            lbWrong.text = "Wrong: " + String(countWrong)
        }
        setNumber()
    }
    

}

