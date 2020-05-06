//
//  NewEventViewController.swift
//  Agenda
//
//  Created by Joseph Shur on 5/2/20.
//  Copyright © 2020 Joseph Shur. All rights reserved.
//

import UIKit

var selectedDate = Date()

var timeStamp = "\(DateFormatter.localizedString(from: selectedDate, dateStyle: .long, timeStyle: .short))"

class NewEventViewController: UIViewController {
    
    @IBOutlet weak var eventCancelButton: UIBarButtonItem!
    
    @IBOutlet weak var eventDoneButton: UIBarButtonItem!
    
    @IBOutlet weak var newEventDatePicker: UIDatePicker!
    
    @IBOutlet weak var newEventTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func addEvent() {
        events.append(_: "\(newEventTextField.text!)")
        newEventTextField.text = " "
        EventsViewController().eventTableView?.reloadData()
    }
    
    @IBAction func eventCancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func eventDoneButtonTapped(_ sender: Any) {
        timeStamp = "\(DateFormatter.localizedString(from: newEventDatePicker.date, dateStyle: .long, timeStyle: .short))"
        selectedDate = newEventDatePicker.date
        dismiss(animated: true, completion: nil)
        newEventTextField.text = "\(timeStamp): \(newEventTextField.text!)"
    }
}
