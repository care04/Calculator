//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Care Farrar on 1/20/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    var answerR: String?
    var opperator: String?
    var firstNumber: String?
    var isNegitave = false
    var hasDecimal = false
    @IBOutlet weak var CalcLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func Numbers(_ sender: UIButton) {
        if CalcLabel.text?.count == 0 {
            if sender.tag != 0 {
                CalcLabel.text! += String(sender.tag)
            }
        }else if answerR?.count ?? 0 > 0 {
            clear()
            CalcLabel.text! += String(sender.tag)
        } else if CalcLabel.text?.count ?? 0 > 0  {
            CalcLabel.text! += String(sender.tag)
        }
    }
    
    @IBAction func function(_ sender: ButtonForCalc) {
        if sender.tag == 10 {
            clear()
        } else if sender.tag == 11 {
            makeNumberNegitave()
        } else if sender.tag == 12 /*delete*/{
            if CalcLabel.text?.count ?? 0 > 0 {
                if answerR?.count ?? 0 == 0 {
                    CalcLabel.text?.removeLast()
                }
            }
        } else if sender.tag == 13 /*divide*/{
            assignFirstNumber()
            opperator = "/"
        } else if sender.tag == 14 /*multiply*/{
            assignFirstNumber()
            opperator = "*"
        } else if sender.tag == 15 /*subtract*/{
            assignFirstNumber()
            opperator = "-"
        } else if sender.tag == 16 /*add*/{
            assignFirstNumber()
            opperator = "+"
        } else if sender.tag == 17 /*answer*/{
            getAnswer()
            firstNumber = nil
            CalcLabel.text = ""
            CalcLabel.text = answerR
            hasDecimal = false
        } else if sender.tag == 18 {
            addOrRemoveDecimal()
            
        }
    }
    
    func clear() {
        answerR = nil
        opperator = nil
        firstNumber = nil
        isNegitave = false
        hasDecimal = false
        CalcLabel.text = ""
    }
    
    func getAnswer() {
        if opperator?.count ?? 0 > 0 {
            if opperator == "+" {
                answerR = String(Double(firstNumber!)! + Double(CalcLabel.text!)!)
                opperator = nil
            } else if opperator == "-" {
                answerR = String(Double(firstNumber!)! - Double(CalcLabel.text!)!)
                opperator = nil
            } else if opperator == "*" {
                answerR = String(Double(firstNumber!)! * Double(CalcLabel.text!)!)
                opperator = nil
            } else {
                answerR = String(Double(firstNumber!)! / Double(CalcLabel.text!)!)
                opperator = nil
            }
        }
    }
    func assignFirstNumber() {
        if CalcLabel.text!.count > 0 {
            if firstNumber?.count ?? "".count > 0{
                print("this")
            } else {
                firstNumber = CalcLabel.text!
                CalcLabel.text! = ""
            }
        }
    }
    
    func addOrRemoveDecimal() {
        if CalcLabel.text != "" {
            if hasDecimal == false {
                CalcLabel.text = CalcLabel.text! + "."
                hasDecimal = true
            } else {
                CalcLabel.text = CalcLabel.text!
            }
        }
    }
    
    func makeNumberNegitave() {
        if CalcLabel.text != "" {
            if isNegitave == false {
                CalcLabel.text = "-\(CalcLabel.text ?? "")"
                isNegitave = true
            } else {
                CalcLabel.text?.removeFirst()
                isNegitave = false
            }
        }
    }
}
