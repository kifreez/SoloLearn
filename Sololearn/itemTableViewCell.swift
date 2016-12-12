//
//  itemTableViewCell.swift
//  Sololearn
//
//  Created by Kif on 08.12.16.
//  Copyright © 2016 KifApp. All rights reserved.
//

import UIKit

class itemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
