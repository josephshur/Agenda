//
//  NewTaskViewController.swift
//  Agenda
//
//  Created by Joseph Shur on 4/30/20.
//  Copyright © 2020 Joseph Shur. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    let randomTasks = ["Brush teeth","Refill gas","Do 100 push-ups","Finish current homework","Go for a walk","Walk the dog","Buy groceries","File taxes","Deposit your check","Check mailbox","Take a nap","Clean bedroom","Make some plans!","Buy a lottery ticket","Apply for a job"]
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var newTaskTextField: UITextField!
    @IBOutlet weak var randomTaskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addTaskToEvent(isToggled: Bool) {
        newTaskTextField.text = NewEventViewController().newEventTextField.text!
        events.append(_: NewEventViewController().newEventTextField.text!)
        EventsViewController().eventTableView.reloadData()
    }
    
    func addTask() {
        addTaskToEvent(isToggled: true)
        tasks.append(_: newTaskTextField.text!)
        TasksViewController().tasksTableView?.reloadData()
    }
    
    func addRandomTask() {
        let randomIndex = Int.random(in: 0..<randomTasks.count)
        
        newTaskTextField.text = randomTasks[randomIndex]
        tasks.append(_: newTaskTextField.text!)
        TasksViewController().tasksTableView?.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
 
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        addTask()
    }
    @IBAction func randomTaskButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        addRandomTask()
    }
    
}
