//
//  AddItemControllerViewController.swift
//  Checklist
//
//  Created by antonio martin moreno on 08/05/2018.
//  Copyright © 2018 antonio martin moreno. All rights reserved.
//

import UIKit

class AddItemControllerViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFld: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Handle the text field’s user input through delegate callbacks.
        textFld.delegate = self //TO HIDE THE KEYBOARD

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textFld.resignFirstResponder()
        return true
    }
    
    // do something with the text before you close the keyboard
    func textFieldDidEndEditing(_ textField: UITextField) {
        // mealNameLabel.text = textField.text
    }

}
