//
//  ViewController.swift
//  Sololearn
//
//  Created by Kif on 05.12.16.
//  Copyright © 2016 KifApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var item : Item?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var toDoList: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isInAddMode = presentingViewController is UINavigationController

        if isInAddMode{
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = item {
            textField.text = item.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? UIBarButtonItem, sender === saveButton {
            let name = textField.text ?? ""
            item = Item(name: name)
        }
    }


}

