//
//  toTableViewCell.swift
//  Currency Conventer
//
//  Created by Burak AÇIK on 6.08.2022.
//

import UIKit

class toTableViewCell: UITableViewCell {
    @IBOutlet weak var toCurrencySymbolLabel: UILabel!
    @IBOutlet weak var toCurrencyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
