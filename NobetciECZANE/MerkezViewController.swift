//
//  MerkezViewController.swift
//  NobetciECZANE
//
//  Created by Türker Sandal on 3.05.2019.
//  Copyright © 2019 Türker Sandal. All rights reserved.
//

import UIKit

class MerkezViewController: UIViewController , UITabBarDelegate,UITableViewDataSource {
  
    
    struct Title : Decodable{
        
        let success :Bool?
        let result :[Result]
        
        enum CodingKeys : String ,CodingKey{
            case success
            case result    = "result"
        }
    }
    struct Result:Decodable {
        
        let name:String?
        let dist:String?
        let address:String?
        let phone:String?
        let loc:String?
    }
    
    
   
    var ilce = String()
    @IBOutlet weak var tableview : UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var eczaneAdlar:[String] = []
    var eczaneAdres : [String] = []
    var eczaneDist: [String] = []
    var eczanePhone: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        activityIndicator.startAnimating()
        JsonParse()
        tableview.rowHeight = 225
        
        
        
    }
   
    
    
    func JsonParse(){
        let url = "https://api.collectapi.com/saglik/nobetciEczane?il=Edirne&ilce="+ilce+"&apiKey=5PFEa2ygfc3Pv1n0hujJcY:2XgKmISn1C32ppwKkv8WkC"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!){(data,response,error) in
            guard let dataN  = data else{return}
            do{
                
                let eczane = try
                    JSONDecoder().decode(Title.self ,from: dataN)
                for eczaneN in eczane.result{
                    
                    
                    self.eczaneAdlar.append(eczaneN.name!)
                    self.eczaneAdres.append(eczaneN.address!)
                    if(eczaneN.dist == "Semt Bulunamadı"){
                        
                        self.eczaneDist.append(self.ilce)
                    }
                    else{
                        self.eczaneDist.append(eczaneN.dist!)
                    }
                    self.eczanePhone.append(eczaneN.phone!)
                    
                    
                    DispatchQueue.main.async {
                      
                        self.tableview?.reloadData()
                    }
                }
                
               
            }
            catch{
                print("We got an error!!!")
            }
            }.resume()
        
        
    }
    
   
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        return eczaneAdlar.count
        
        
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.name?.text = eczaneAdlar[indexPath.row]
        cell.adress?.text = eczaneAdres[indexPath.row]
        cell.phone?.text = eczanePhone[indexPath.row]
        cell.dist?.text = eczaneDist[indexPath.row]
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        
        return cell
    }
    
   
}
