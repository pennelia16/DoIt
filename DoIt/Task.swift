//
//  Task.swift
//  DoIt
//
//  Created by coop on 2020-05-06.
//  Copyright © 2020 coop. All rights reserved.
//

class Task {
    
    var text: String
    var important: Bool
    
    init(text: String, important: Bool = false) {
        self.text = text
        self.important = important
    }
}
