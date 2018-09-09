//
//  AddContactViewController.swift
//  ContactsList
//
//  Created by Mitchell Socia on 9/9/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

protocol AddContactViewControllerDelegate: class {
    func addContactViewControllerDidCancel(_ controller: AddContactViewController)
    
    func addItemViewController(_ controller: AddContactViewController, didFinishAdding item: ContactListItems)
    
}

class AddContactViewController: UITableViewController {
    
    weak var delegate: AddContactViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}

    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
        delegate?.addContactViewControllerDidCancel(self)
        
    }

    @IBAction func done() {
        navigationController?.popViewController(animated: true)
        
        let item = ContactListItems()
        item.name = nameTextField.text!
        item.number = numberTextField.text!
        
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
}
