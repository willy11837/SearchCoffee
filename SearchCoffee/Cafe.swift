//
//  CafeInfo.swift
//  SearchCoffee
//
//  Created by Willy Kang on 2021/2/28.
//

import Foundation

//原本的API資料
struct Coffee: Codable {
    var id: String?
    var name: String?
    var city: String?
    var wifi: Float?
    var seat: Float?
    var quiet: Float?
    var tasty: Float?
    var cheap: Float?
    var music: Float?
    var url: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    var limited_time: String?
    var socket: String?
    var standing_desk: String?
    var mrt: String?
    var open_time: String?
}
class CoffeeResult {
    static var shareData = [Coffee]()
}
