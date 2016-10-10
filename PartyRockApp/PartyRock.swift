//
//  PartyRock.swift
//  PartyRockApp
//
//  Created by Mike Sabens on 10/6/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import Foundation

//Defining a class for each Video - it has an Image (with URL), a Video URL, and a Video Title
class PartyRock {
    
    //declaring variables
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    //creating getters
    var imageURL: String {
        return _imageURL
    }
    
    var videoURL: String {
        return _videoURL
    }
    
    var videoTitle: String {
        return _videoTitle
    }

    
    //Initialization
    init(imageURL: String, videoURL: String, videoTitle: String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
    
    
}
