//
//  CheckListItem.swift
//  Checklist
//
//  Created by antonio martin moreno on 07/05/2018.
//  Copyright © 2018 antonio martin moreno. All rights reserved.
//

import Foundation

class CheckListItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
