//
//  IlceViewController.swift
//  NobetciECZANE
//
//  Created by Türker Sandal on 3.05.2019.
//  Copyright © 2019 Türker Sandal. All rights reserved.
//

import UIKit

class IlceViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
  
    

    var ilceler : [String] = ["Merkez","Havsa","Kesan","Enez","Ipsala","Lalapasa","Meric","Suloglu","Uzunkopru"]
    @IBOutlet weak var tableview:UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ilceler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = self.tableview?.dequeueReusableCell(withIdentifier:  "cell") as! UITableViewCell
        cell.textLabel?.text = ilceler[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = self.tableview?.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)
        let itemName = currentCell?.textLabel!.text
        
        var StoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = StoryBoard.instantiateViewController(withIdentifier: "MerkezViewController") as? MerkezViewController
        viewController?.ilce=itemName!
        self.navigationController?.pushViewController(viewController!, animated: true)
        
      
    }
    

}
