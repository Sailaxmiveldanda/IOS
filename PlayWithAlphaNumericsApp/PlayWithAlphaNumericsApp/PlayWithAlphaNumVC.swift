//
//  PlayWithAlphaNumVC.swift
//  PlayWithAlphaNumericsApp
//
//  Created by Veldanda,Sailaxmi on 9/12/23.
//

import UIKit

class PlayWithAlphaNumVC: UIViewController {
    
    @IBOutlet weak var headerLBL: UILabel!
    @IBOutlet weak var firstNumLBL: UILabel!
    @IBOutlet weak var secondNumLBL: UILabel!
    @IBOutlet weak var firstStrTF: UITextField!
    @IBOutlet weak var secondStrTF: UITextField!
    @IBAction func numberSWCH(_ sender: UISwitch) {
        let numswch = sender.isOn
        if numberswchbtn.isEnabled{
            generatebtn.isEnabled = numswch
            firststepperbtn.isEnabled = numswch
            secondstepperbtn.isEnabled = numswch
        }
    }
    
    @IBAction func stringSWCH(_ sender: UISwitch) {
        let strswch = sender.isOn
        if stringswchbtn.isEnabled{
            manipulatebtn.isEnabled = strswch
            firstStrTF.isEnabled = strswch
            secondStrTF.isEnabled = strswch
        }
        else{
            manipulatebtn.isOpaque = sender.isOpaque
        }
    }
    
    
    @IBOutlet var optionsSWCH: [UISwitch]!
    @IBAction func firstNumStepper(_ sender: UIStepper) {
        firstNumLBL.text = String(Int(sender.value))
    }
    
    @IBAction func secondNumStepper(_ sender: UIStepper) {
        secondNumLBL.text = String(Int(sender.value))
    }
    
    @IBOutlet var numberStepper: [UIStepper]!
    @IBOutlet weak var messageTV: UITextView!
    
    
    @IBAction func generatePattern(_ sender: UIButton) {
        var rows=0
        var colum=0
        if let firstnum = self.firstNumLBL.text, let res1 = Int(firstnum) {
                rows=res1
        }
        if let secnum = self.secondNumLBL.text, let res2 = Int(secnum) {
                colum=res2
        }
        messageTV.text=""
    
        if(rows==0 && colum==0){
            messageTV.text="First Number is Invalid. Please provide a value greater than zero"
        }
        else if(rows==0 && colum>0){
            messageTV.text="First Number is Invalid. Please provide a value greater than zero"
        }
        else if(rows>0 && colum==0){
            messageTV.text="Second Number is Invalid. Please provide a value greater than zero"
        }
        else{
            for num in (1...rows){
            for cols in (1...colum){
            if( num==1 || num==rows){
                messageTV.text += String("❄️ ")
            }
            else if (cols==1 || cols==colum){
                messageTV.text += String("❄️ ")
            }
            else{
                if(num==cols){
                messageTV.text += String("🎅 ")
                }
                else if((num+cols)%2==0){
                messageTV.text += String("🎅 ")
                }
                else{
                messageTV.text += String("🌲 ")
                }
                            
        }
    }
            messageTV.text += "\n"
                    }
                    
                }
    }
    
    
    @IBAction func manipulateStrings(_ sender: UIButton) {
        guard let firststr = firstStrTF.text , let secondstr = secondStrTF.text else{
            messageTV.text = "Invalid input. Please Provide valid strings"
            return
        }
        messageTV.text = ""
        if firststr.isEmpty{
            messageTV.text = "First String is Invalid. Plase provide atleast one character"
        }else if secondstr.isEmpty{
            messageTV.text = "Second String is Invalid. Plase provide atleast one character"
        }else{
            let concatstr = firststr + secondstr
            messageTV.text = "Concatenation of two Strings results in \"\(concatstr)\"\n"
            let lowercasestr = concatstr.lowercased()
            var vowel_count = 0
            var cons_count = 0
            for charcter in concatstr{
                switch charcter{
                case "a","e","i","o","u":
                    vowel_count += 1
                default:
                    cons_count += 1
                }}
            messageTV.text += "Number of vowels in \"\(concatstr)\"  is \(vowel_count).\n"
            messageTV.text += "Number of consonats in \"\(concatstr)\" is \(cons_count).\n"
            var unique_count = 0
            var reverse_str = ""
            for character in lowercasestr{
                var Uniquech = true
                for innerch in reverse_str{
                    if character == innerch{
                        Uniquech = false
                        break
                    }
                }
                if Uniquech {
                    unique_count += 1
                }
                reverse_str = String(character) + reverse_str
            }
            messageTV.text += "Number of Unique Characters in \"\(concatstr)\" is \(unique_count).\n"
            let reverse = String(concatstr.reversed())
            messageTV.text += "The reversal of \"\(concatstr)\" results in \"\(reverse)\""
        }
    }
    
    
    @IBOutlet var stringAndPatternBTN: [UIButton]!
    
    
    @IBAction func OnReset(_ sender: UIButton) {
        messageTV.text = ""
        firstNumLBL.text = "0"
        secondNumLBL.text = "0"
        firstStrTF.text = ""
        secondStrTF.text = ""
        numberswchbtn.isOn = false
        stringswchbtn.isOn = false
        generatebtn.isEnabled = false
        manipulatebtn.isEnabled = false
        firststepperbtn.isEnabled = false
        secondstepperbtn.isEnabled = false
        firststepperbtn.value = 0
        secondstepperbtn.value = 0
        firstStrTF.isEnabled = false
        secondStrTF.isEnabled = false
    }
    
    
    @IBOutlet weak var numberswchbtn: UISwitch!
    
    @IBOutlet weak var stringswchbtn: UISwitch!
    
    
    @IBOutlet weak var firststepperbtn: UIStepper!
    
    
    @IBOutlet weak var secondstepperbtn: UIStepper!
    
    
    @IBOutlet weak var generatebtn: UIButton!
    
    
    @IBOutlet weak var manipulatebtn: UIButton!
    
    func disableUIElements(){
        numberStepper.forEach { $0.isEnabled = false }
        firstStrTF.isEnabled = false
        secondStrTF.isEnabled = false
        stringAndPatternBTN.forEach { $0.isEnabled = false }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerLBL.text = String(format: "%@\nPlay with AlphaNumerics™","\u{0c38}\u{0c4d}\u{0c35}\u{0c3e}\u{0c17}\u{0c24}\u{0c02}")
        disableUIElements()
        messageTV.text = ""
        numberswchbtn.isOn = false
        stringswchbtn.isOn = false
                // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
