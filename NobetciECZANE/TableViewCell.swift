//
//  TableViewCell.swift
//  NobetciECZANE
//
//  Created by Türker Sandal on 4.05.2019.
//  Copyright © 2019 Türker Sandal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var adress: UILabel?
    @IBOutlet weak var resim: UIImageView?
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var dist: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
