//
//  DetailTableViewController.swift
//  NobetciECZANE
//
//  Created by Türker Sandal on 10.05.2019.
//  Copyright © 2019 Türker Sandal. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

   

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        

        return cell
    }
    

  

}
