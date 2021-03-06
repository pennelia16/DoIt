//
//  ListTasksViewController.swift
//  DoIt
//
//  Created by coop on 2020-05-06.
//  Copyright © 2020 coop. All rights reserved.
//

import UIKit

class ListTasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks: [Task] = []
    var selectedIndex = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗\(task.text)"
            cell.textLabel?.textColor = UIColor.red
        } else {
            cell.textLabel?.text = task.text
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "viewTaskScreen", sender: task)
    }
    
    func initializeTasks() {
        tasks = [Task(text: "Finish tutorial"), Task(text: "Go for a walk"), Task(text: "Make banana bread", important: true)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeTasks()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "addItemScreen", sender: nil) // temporary
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemScreen" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.prevVC = self
        } else if segue.identifier == "viewTaskScreen" {
            let nextVC = segue.destination as! ViewTaskViewController
            nextVC.prevVC = self
            nextVC.task = sender as! Task
        }
        
    }
}

