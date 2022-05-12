//
//  ViewController.swift
//  HW10
//
//  Created by Evgeny on 5.05.22.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var TextLabel: UILabel!

    var currentNumber: String = ""
    var previousNumber: String = ""
    var useCase: String = ""
    @IBOutlet weak var Division: UIButton!
    @IBOutlet weak var Multiply: UIButton!
    @IBOutlet weak var Minus: UIButton!
    @IBOutlet weak var Plus: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapACButton() {
        currentNumber = ""
        TextLabel.text = "0"
    }
    
    @IBAction func didTapMinusButton() {
        if checkDot(Number: currentNumber) == true {
            currentNumber = String((Double(currentNumber) ?? 0) * -1)
            TextLabel.text = currentNumber
        } else {
            currentNumber = String((Int(currentNumber) ?? 0) * -1)
            TextLabel.text = currentNumber
        }
    }

    @IBAction func didTapButtonProcent() {
        currentNumber = String((Double(currentNumber) ?? 0) / 100)
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonDivision() {
        if useCase == "Division" {
            useCase = ""
            Division.backgroundColor = .systemOrange
        } else
        {
            if previousNumber.isEmpty {
                previousNumber = currentNumber
                currentNumber = ""
            }
            useCase = "Division"
            Division.backgroundColor = .darkGray
            Multiply.backgroundColor = .systemOrange
            Minus.backgroundColor = .systemOrange
            Plus.backgroundColor = .systemOrange
        }
    }
    
    @IBAction func didTapButtonOne() {
        currentNumber.append("1")
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonTwo() {
        currentNumber.append("2")
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonThree() {
        currentNumber.append("3")
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonMultiply() {
        if useCase == "Multiply" {
            useCase = ""
            Multiply.backgroundColor = .systemOrange
        } else
        {
            if previousNumber.isEmpty {
                previousNumber = currentNumber
                currentNumber = ""
            }
            useCase = "Multiply"
            Division.backgroundColor = .systemOrange
            Multiply.backgroundColor = .darkGray
            Minus.backgroundColor = .systemOrange
            Plus.backgroundColor = .systemOrange
        }
    }
    
    @IBAction func didTapButtonFour() {
        currentNumber.append("4")
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonFive() {
        currentNumber.append("5")
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonSix() {
        currentNumber.append("6")
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonMinusNumber() {
        if useCase == "Minus" {
            useCase = ""
            Minus.backgroundColor = .systemOrange
        } else
        {
            if previousNumber.isEmpty {
                previousNumber = currentNumber
                currentNumber = ""
            }
            useCase = "Minus"
            Division.backgroundColor = .systemOrange
            Multiply.backgroundColor = .systemOrange
            Minus.backgroundColor = .darkGray
            Plus.backgroundColor = .systemOrange
        }
    }
    
    @IBAction func didTapButtonSeven() {
        currentNumber.append("7")
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonEight() {
        currentNumber.append("8")
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonNine() {
        currentNumber.append("9")
        TextLabel.text = currentNumber
    }
    
    @IBAction func didTapButtonPlusNumber() {
        if useCase == "Plus" {
            useCase = ""
            Plus.backgroundColor = .systemOrange
        } else
        {
            if previousNumber.isEmpty {
                previousNumber = currentNumber
                currentNumber = ""
            }
            useCase = "Plus"
            Division.backgroundColor = .systemOrange
            Multiply.backgroundColor = .systemOrange
            Minus.backgroundColor = .systemOrange
            Plus.backgroundColor = .darkGray
        }
    }
    
    @IBAction func didTapButtonButtonZero() {
        if currentNumber.isEmpty {
            currentNumber.append("0.")
        }
        else {
        currentNumber.append("0")
        TextLabel.text = currentNumber
        }
    }
    
    @IBAction func didTapButtonButtonDot() {
        if checkDot(Number: currentNumber) == true {
            
        } else {
            if currentNumber.isEmpty {
                currentNumber.append("0.")
                TextLabel.text = currentNumber
            }
            else {
            currentNumber.append(".")
            TextLabel.text = currentNumber
        }
    }
    }
    
    @IBAction func didTapButtonButtonEquals() {
        if previousNumber.isEmpty {
        } else {
            if checkDot(Number: currentNumber) == true || checkDot(Number: previousNumber) == true {
                var bufferDouble: Double
                
                switch useCase {
                case "Plus":
                    bufferDouble = Double(currentNumber)! + Double(previousNumber)!
                    currentNumber = String(bufferDouble)
                    TextLabel.text = currentNumber
                    previousNumber = ""
                case "Minus":
                    bufferDouble = Double(currentNumber)! - Double(previousNumber)!
                    currentNumber = String(bufferDouble)
                    TextLabel.text = currentNumber
                    previousNumber = ""
                case "Division":
                    bufferDouble = Double(currentNumber)! / Double(previousNumber)!
                    currentNumber = String(bufferDouble)
                    TextLabel.text = currentNumber
                    previousNumber = ""
                case "Multiply":
                    bufferDouble = Double(currentNumber)! * Double(previousNumber)!
                    currentNumber = String(bufferDouble)
                    TextLabel.text = currentNumber
                    previousNumber = ""
                default:
                    break
                }
            } else
            {
                var bufferInt = Int(currentNumber)! + Int(previousNumber)!
                switch useCase {
                case "Plus":
                    bufferInt = Int(currentNumber)! + Int(previousNumber)!
                    currentNumber = String(bufferInt)
                    TextLabel.text = currentNumber
                    previousNumber = ""
                case "Minus":
                    bufferInt = Int(previousNumber)! - Int(currentNumber)!
                    currentNumber = String(bufferInt)
                    TextLabel.text = currentNumber
                    previousNumber = ""
                case "Division":
                    bufferInt = Int(previousNumber)! / Int(currentNumber)!
                    currentNumber = String(bufferInt)
                    TextLabel.text = currentNumber
                    previousNumber = ""
                case "Multiply":
                    bufferInt = Int(currentNumber)! * Int(previousNumber)!
                    currentNumber = String(bufferInt)
                    TextLabel.text = currentNumber
                    previousNumber = ""
                default:
                    break
                }
            }
        }
        useCase = ""
        Division.backgroundColor = .systemOrange
        Multiply.backgroundColor = .systemOrange
        Minus.backgroundColor = .systemOrange
        Plus.backgroundColor = .systemOrange
    }
    
    func checkDot(Number: String) -> Bool {
        let Dot = "."
        
        if Number.contains(Dot) {
            return true
        }
        else {
            return false
        }
    }
    
}
