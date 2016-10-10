//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Mike Sabens on 10/6/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    //set video URL
    
    private var _partyRock: PartyRock!
    
    //create getter and setter
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize data to pass        
        videoTitleLabel.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
    }


}
