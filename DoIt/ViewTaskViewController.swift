//
//  ViewTaskViewController.swift
//  DoIt
//
//  Created by coop on 2020-05-06.
//  Copyright © 2020 coop. All rights reserved.
//

import UIKit

class ViewTaskViewController: UIViewController {

    var prevVC: ListTasksViewController = ListTasksViewController()
    var task = Task(text: "")
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completeTaskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task.important {
            taskNameLabel.text = "❗\(task.text)"
            taskNameLabel.textColor = UIColor.red
        } else {
            taskNameLabel.text = task.text
        }
    }
    
    @IBAction func completeTask(_ sender: Any) {
        prevVC.tasks.remove(at: prevVC.selectedIndex)
        prevVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}
