//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by coop on 2020-05-06.
//  Copyright © 2020 coop. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    var prevVC: ListTasksViewController = ListTasksViewController()
    
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var taskNameTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
   // @IBAction func onSwitch(_ sender: Any) {
   // }
    
    @IBAction func addTask(_ sender: Any) {
        let task = Task(text: taskNameTextBox.text!, important: importantSwitch.isOn)
        prevVC.tasks.append(task)
        prevVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
