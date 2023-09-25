//
//  ViewController.swift
//  ExamPractice
//
//  Created by Sailaxmi Veldanda on 9/24/23.
//

import UIKit

class ViewController: UIViewController {
    let datePattern = #"^\d{1,2}[\/]\d{1,2}[\/]\d{4}$"#

    @IBOutlet weak var onewayBTN: UIButton!
    
    @IBOutlet weak var roundwayBTN: UIButton!
    
    @IBOutlet weak var custNameTF: UITextField!
    @IBOutlet weak var cityFromTF: UITextField!
    @IBOutlet weak var cityToTF: UITextField!
    @IBOutlet weak var departureDateTF: UITextField!
    @IBOutlet weak var returnDateTF: UITextField!
    
    @IBOutlet weak var numPassTF: UITextField!
    
    @IBOutlet weak var bookTicketBTN: UIButton!
        
    @IBOutlet weak var ticketConfirmationBTN: UITextView!
    
    
    @IBAction func oneWayTrip(_ sender: UIButton) {
        self.roundwayBTN.isEnabled = false
        self.returnDateTF.isEnabled = false
    }
    
    @IBAction func roundTrip(_ sender: UIButton) {
        self.onewayBTN.isEnabled = false
        self.returnDateTF.isEnabled = true
    }
    
    @IBAction func bookTicket(_ sender: UIButton) {
        guard let custName = self.custNameTF.text, !custName.isEmpty else{return}
        guard let fromTf = self.cityFromTF.text ,  !fromTf.isEmpty else{return}
        guard let toTf = self.cityToTF.text, !toTf.isEmpty else{return}
        guard let departureDate = self.departureDateTF.text , !departureDate.isEmpty ,
              departureDate.range(of: self.datePattern, options: .regularExpression) != nil else{
            self.ticketConfirmationBTN.text = "Invalid Departure Date."
            return
        }
        if self.returnDateTF.isEnabled{
            guard let returnDate = self.returnDateTF.text , !returnDate.isEmpty ,
                  returnDate.range(of: self.datePattern, options: .regularExpression) != nil else{
                self.ticketConfirmationBTN.text = "Invalid return Date."
                return
            }
        }
        
        guard let numpass = self.numPassTF.text , !numpass.isEmpty ,
              let numpass = Double(numpass), numpass >= 1.0 else
        {
            self.ticketConfirmationBTN.text = "Invalid input."
            return
        }
        var ticketprice : Double
        switch numpass{
        case 1...3:
            ticketprice = self.onewayBTN.isEnabled ? numpass * 890.50 : numpass * 1205.35
        case 4...6:
            ticketprice = self.onewayBTN.isEnabled ? numpass * 439.77 : numpass * 631.25
        case 7...:
            ticketprice = self.onewayBTN.isEnabled ? numpass * 375.09 :
            numpass * 491.21
        default:
            ticketprice = 0.0
        }
        let formater = NumberFormatter()
        formater.numberStyle = .currency
        guard let formaterprice = formater.string(from: ticketprice as NSNumber) else{return}
        self.ticketConfirmationBTN.text = "Congragulations \(custName.capitalized)!\nYour trip from \(fromTf.capitalized) to \(toTf.capitalized) is confirmed for the ticket price of \(formaterprice).\nYour departure date is \(departureDate)"
        self.bookTicketBTN.isEnabled = false
    }
    
    @IBAction func clear(_ sender: UIButton) {
        self.onewayBTN.isEnabled = true
        self.roundwayBTN.isEnabled = true
        self.custNameTF.text = ""
        self.cityFromTF.text = ""
        self.cityToTF.text = ""
        self.departureDateTF.text = ""
        self.returnDateTF.text = ""
        self.numPassTF.text = ""
        self.bookTicketBTN.isEnabled = true
        self.returnDateTF.isEnabled = true
        self.ticketConfirmationBTN.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ticketConfirmationBTN.text = ""
    }


}

