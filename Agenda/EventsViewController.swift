//
//  EventsViewController.swift
//  Agenda
//
//  Created by Joseph Shur on 4/29/20.
//  Copyright © 2020 Joseph Shur. All rights reserved.
//

import UIKit

let now = "\(DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .short))"

var events: [String] = ["Beginning of Summer", "First Day of Classes Fall 2020", "Deadline to submit application for blah blah","Finish the mobile app"]

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var eventTableView: UITableView!
    
    @IBOutlet weak var addEventButton: UIBarButtonItem!
    
    @IBOutlet weak var taskSwitch: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eventTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
        eventTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        cell.textLabel?.text = "\(events[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
        }
    }

    @IBAction func taskSwitchTapped(_ sender: UISwitch) {
        NewTaskViewController().addTaskToEvent(isToggled: sender.isOn)
        if sender.isOn {
            print("switch toggled on")
        }
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
