//
//  ViewController.swift
//  ContactsList
//
//  Created by Mitchell Socia on 9/7/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController, AddContactViewControllerDelegate {
    func addContactViewControllerDidCancel(_ controller: AddContactViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddContactViewController, didFinishAdding item: ContactListItems) {
        navigationController?.popViewController(animated: true)
        
        let newRowIndex = contactListItems.count
        contactListItems.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
    var contactListItems: [ContactListItems] = []
    var valueToPass: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        populateContactListItems()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactListItems.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        valueToPass = currentCell.textLabel?.text
        performSegue(withIdentifier: "DetailViewController", sender: self)
//        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
//        detailViewController?.name = contactListItems[indexPath.row].name
//        detailViewController?.number = contactListItems[indexPath.row].number
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListItem", for: indexPath)
        
        cell.textLabel?.text = "\(contactListItems[indexPath.row].name) - \(contactListItems[indexPath.row].number)"
        
        return cell
        
        }
    
    @IBAction func addItem(_ sender: Any) {
        let newRowIndex = contactListItems.count
        
        let newItem = ContactListItems()
        newItem.name = "title"
        newItem.number = "author"
        contactListItems.append(newItem)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddContact" {
            let controller = segue.destination as! AddContactViewController
            controller.delegate = self
        }
        if segue.identifier == "ShowContactDetail" {
            let controller = segue.destination as! DetailViewController
            controller.name = valueToPass!
        }
    }
    
    func populateContactListItems() {
        let tasks = ["Greg": "2486664444", "Frank": "8109229416", "Bert": "8109382132", "Brian" : "2486664433", "Samuel" : "5172903050"]
        
        for task in tasks {
            let item = ContactListItems()
            item.name = task.key
            item.number = task.value
            contactListItems.append(item)
        }
    }
    
}

