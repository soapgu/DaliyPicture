//
//  BingResponse.swift
//  DaliyPicture
//
//  Created by guhui on 2022/10/19.
//

import Foundation

struct BingResponse : Codable {
    struct DaliyImage: Codable {
        var startdate: String
        var url: String
        var urlbase: String
        var title: String
    }
    
    var images:[DaliyImage]
}
