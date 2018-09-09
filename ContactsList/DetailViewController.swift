//
//  DetailViewController.swift
//  ContactsList
//
//  Created by Mitchell Socia on 9/9/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameDetailLabel: UILabel!
    

    
    var name = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameDetailLabel.text = name
     
        
//        nameDetailLabel.text = "\(ContactListItems)"
        
        // Do any additional setup after loading the view.
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

}
