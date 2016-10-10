//
//  PartyCellTableViewCell.swift
//  PartyRockApp
//
//  Created by Mike Sabens on 10/6/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //pass data into a cell each time a view is recycled
    func updateUI(partyRock: PartyRock) {
        
        //Sets the title of each table view cell based on the available video titles in the array.
        videoTitle.text = partyRock.videoTitle
        
        
        //Going out and fetching images from the internet on a background thread, then once it has downloaded, places it in the cell to be used.
        let url = URL(string: partyRock.imageURL)
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch  {
                //handle the error
            }
        }
        
    }


}
