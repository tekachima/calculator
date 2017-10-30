//
//  ViewController.swift
//  Calculator
//
// Created by Teemu Kangas
// iOS Swift training education 2017
/*
     Example and shrinking code using (UI)tags from
     https://www.youtube.com/watch?v=AG2QDwmj64A
 */
import UIKit

class ViewController: UIViewController {

    var numberValue : Double = 0;
    var NumberOld : Double = 0;
    var DoMathFunction = false
    var operation = 0;
    
    @IBOutlet weak var NumberDisplay: UILabel!

    @IBAction func Numbers(_ sender: UIButton)
    {
        //If doing Math function show operation in label
        if DoMathFunction == true
        {
            NumberDisplay.text = String(sender.tag-1)
            numberValue = Double(NumberDisplay.text!)!
            DoMathFunction = false//reset boolean so we are setting next number
        }
        else
        {
            //Convert to String and force wrap, get number from UITag
            NumberDisplay.text = NumberDisplay.text! + String( sender.tag-1)
            numberValue = Double(NumberDisplay.text!)!
        }
    }
    
    @IBAction func controlButtons(_ sender: UIButton)
    {   //Check that numberdisplay isnt empty and senderbutton isnt "C" clear and isnt "="
        if (NumberDisplay.text != "" && sender.tag != 11 && sender.tag != 16)
        {
            NumberOld = Double(NumberDisplay.text!)!
            //Functions
            if sender.tag == 12// Divide
            {
                NumberDisplay.text = "/";
            }
            else if sender.tag == 13//Multiply
            {
                NumberDisplay.text = "x";
            }
            else if sender.tag == 14//Minus
            {
                NumberDisplay.text = "-";
            }
            else if sender.tag == 15//Plus
            {
                NumberDisplay.text = "+";
            }
            
            operation = sender.tag
            DoMathFunction = true;
        }
        else if sender.tag == 16// "=" pressed finish show calculations
        {
            if operation == 12
            {
                NumberDisplay.text = String(NumberOld / numberValue)
            }
            else if operation == 13
            {
                NumberDisplay.text = String(NumberOld * numberValue)
            }
            else if operation == 14
            {
                NumberDisplay.text = String(NumberOld - numberValue)
            }
            else if operation == 15
            {
                NumberDisplay.text = String(NumberOld + numberValue)
            }
        }
        else if sender.tag == 11//Reset "C" all variables
        {
            NumberDisplay.text = ""
            NumberOld = 0;
            numberValue = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

