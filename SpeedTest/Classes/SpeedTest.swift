//
//  SpeedTest.swift
//  Pods-SpeedTest_Example
//
//  Created by Amir Shayegh on 2018-10-23.
//

import Foundation
import Alamofire

class SpeedTest {


    func begin() {
        let startTime = CFAbsoluteTimeGetCurrent()
        var avgspeed: Int = 0
        var downloadSize: Int = 0

    }

    func getSampleImage() {
        guard let url = URL(string: "www.google.com") else {return}
        Alamofire.request(url, method: .get).responseData { (response) in
            if let size = response.value {

            }
        }
    }
}
