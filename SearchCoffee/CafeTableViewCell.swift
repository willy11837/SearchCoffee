//
//  TabCafeleViewCell.swift
//  SearchCoffee
//
//  Created by Willy Kang on 2021/2/28.
//

import UIKit

class CafeTableViewCell: UITableViewCell {

    @IBOutlet weak var cafeNameLabel: UILabel!
    @IBOutlet weak var cafeAddressLabel: UILabel!
    @IBOutlet weak var cafeOpenTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cafeNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
