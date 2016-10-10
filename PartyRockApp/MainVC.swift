//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Mike Sabens on 10/6/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRockData = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-G4RYCZsaw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where the Sun Goes Down")
    
        let p2 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-G4RYCZsaw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Anthem")

        let p3 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-G4RYCZsaw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Helo Computer!")
        
        let p4 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-G4RYCZsaw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Hmmm That's The One!")

        let p5 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-G4RYCZsaw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "RW McQuarters")

        
        partyRockData.append(p1)
        partyRockData.append(p2)
        partyRockData.append(p3)
        partyRockData.append(p4)
        partyRockData.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    //telling apple how to recycle cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRockData[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
            
        } else {
            
            return UITableViewCell()
        }
        
    }
    
    //how many rows do we want in the table view? We want as many rows as are in the array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRockData.count
        
        
    }
    //when the user taps on the row in the actual cell - this is what happens!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRockData[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destinationViewController as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRockData = party
            }
        }
    }

}
