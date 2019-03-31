//
//  HoltTableViewCell.swift
//  CaptainHoltSoundBoard
//
//  Created by ADG RIT 18 on 30/03/19.
//  Copyright © 2019 ADG RIT 18. All rights reserved.
//

import UIKit

class HoltTableViewCell: UITableViewCell {

    @IBOutlet weak var TrackNumber: UILabel!
    @IBOutlet weak var TrackName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
