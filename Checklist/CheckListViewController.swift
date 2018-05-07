//
//  ViewController.swift
//  Checklist
//
//  Created by antonio martin moreno on 07/05/2018.
//  Copyright © 2018 antonio martin moreno. All rights reserved.
//

import UIKit

class TheCell: UITableViewCell{
    @IBOutlet weak var textField: UITextField!

}

class CheckListViewController: UITableViewController {
    
    let cellId = 1000 //tag id
    var items = [CheckListItem]()
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("hello world")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for index in 0...4 {
            let row = createNewItem(someText: "new cow \(index)")
            items.append(row)
        }
    }
    
    //  gives the total number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    //  writes the content of the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath) // as TheCell!
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    //  mark/unmark the cells
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //  setup the mark icon (old version)
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        let item = items[indexPath.row]
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    //  setup the mark icon
    func configureCheckmark(for cell: UITableViewCell, with item: CheckListItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

    //  setup text
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UITextField
        label.text = item.text
    }
    
    func createNewItem(someText: String, checked: Bool = false) -> CheckListItem{
        let item = CheckListItem()
        item.text = someText
        item.checked = checked
        return item
    }
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        let item = createNewItem(someText: "new cow")
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    @IBAction func doCow() {
        print("do cow!!...")
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //1
        items.remove(at: indexPath.row)
        // 2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

