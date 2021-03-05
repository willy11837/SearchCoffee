//
//  DetailViewController.swift
//  SearchCoffee
//
//  Created by Willy Kang on 2021/2/28.
//

import UIKit

class DetailViewController: UIViewController {
    
    let cafe: Coffee
    
    init?(coder: NSCoder, cafe: Coffee) {
        self.cafe = cafe
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var cafeNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cheapLabel: UILabel!
    @IBOutlet weak var limit_timeLabel: UILabel!
    @IBOutlet weak var wifiLabel: UILabel!
    @IBOutlet weak var socketLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transformInfo()
    }
    
    func transformInfo() {
        // 自動換行
        cafeNameLabel.numberOfLines = 0
        cafeNameLabel.text = cafe.name
        addressLabel.text = cafe.address
        //        addressLabel.numberOfLines = 0
        
        
        if cafe.socket == "" {
            socketLabel.text = "無資訊"
            socketLabel.textColor = UIColor.red
        } else if cafe.socket == "no" {
            socketLabel.text = "少量插座" + " 👎🏽"
        } else if cafe.socket == "maybe"{
            socketLabel.text = "一般，依座位分配"
        }else if cafe.socket == "yes"{
            socketLabel.text = "很多插座" + " ✌🏽"
        }
        
        if cafe.limited_time == "" {
            limit_timeLabel.text = "沒有資訊"
            limit_timeLabel.textColor = UIColor.red
        } else if cafe.limited_time == "no" {
            limit_timeLabel.text = "一律不限時" + " ✌🏽"
        } else if cafe.limited_time == "maybe" {
            limit_timeLabel.text = "假日或客滿限時"
        } else if cafe.limited_time == "yes" {
            limit_timeLabel.text = "有限時" + " 👎🏽"
        }
        
        if cafe.wifi == 0.0 {
            wifiLabel.text = String("無提供Wi-Fi")
            wifiLabel.textColor = UIColor.red
        } else if cafe.wifi == 1.0{
            wifiLabel.text = String("⭐️")
        } else if cafe.wifi == 2.0{
            wifiLabel.text = String("⭐️⭐️")
        } else if cafe.wifi == 3.0{
            wifiLabel.text = String("⭐️⭐️⭐️")
        } else if cafe.wifi == 4.0{
            wifiLabel.text = String("⭐️⭐️⭐️⭐️")
        } else if cafe.wifi == 5.0{
            wifiLabel.text = String("⭐️⭐️⭐️⭐️⭐️")
        }
        
        if cafe.cheap == 0 {
            cheapLabel.text = String("無資訊")
            cheapLabel.textColor = UIColor.red
        } else if cafe.cheap == 1{
            cheapLabel.text = String("$")
        } else if cafe.cheap == 2{
            cheapLabel.text = String("$$")
        } else if cafe.cheap == 3{
            cheapLabel.text = String("$$$")
        } else if cafe.cheap == 4{
            cheapLabel.text = String("$$$$")
        } else if cafe.cheap == 5{
            cheapLabel.text = String("$$$$$")
        }
    }
}
