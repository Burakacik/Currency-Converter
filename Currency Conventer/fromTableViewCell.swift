//
//  fromTableViewCell.swift
//  Currency Conventer
//
//  Created by Burak AÇIK on 6.08.2022.
//

import UIKit

class fromTableViewCell: UITableViewCell {
    @IBOutlet weak var fromCurrencySybolLabel: UILabel!
    @IBOutlet weak var fromCurrencyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
