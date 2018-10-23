//
//  SpeedTest.swift
//  Pods-SpeedTest_Example
//
//  Created by Amir Shayegh on 2018-10-23.
//

import Foundation
import Alamofire

public class SpeedTest {

    public static let shared: SpeedTest = SpeedTest()

    private init() {}

    public func test(completion: @escaping (_ speed: String) -> Void ) {
        let startTime = CFAbsoluteTimeGetCurrent()
        getSample { (result) in
            let stopTime = CFAbsoluteTimeGetCurrent()
            if let r = result {
                print("total size: \(r.count)")
                let speed = self.getSpeed(startTime: startTime, stopTime: stopTime, bytesReceived: r.count)
                print("speed: \(speed)")
                return completion(speed)
            }
        }
    }

    func getSample(completion: @escaping (_ data: Data?) -> Void) {
        guard let url = URL(string: "https://github.com/AmirShayegh/SpeedTest/blob/master/SpeedTest/Assets/sample.jpg") else {return}
        Alamofire.request(url, method: .get).responseData { (response) in
            if let data = response.value {
                return completion(data)
            } else {
                return completion(nil)
            }
        }
    }


     func getSpeed(startTime: CFAbsoluteTime, stopTime: CFAbsoluteTime, bytesReceived: Int) -> String {
        let elapsed = stopTime - startTime
        guard elapsed != 0  else {
            return "0"
        }

        var s = ""
        if (bytesReceived < 1024) {
            s = "\(bytesReceived)Bytes/s"
        } else if(bytesReceived < 1048576) {
            let kb = bytesReceived / 1024
            s = "\(kb)Kb/s"

        } else if(bytesReceived < 1073741824) {
            let mb = bytesReceived / 1048576
            s = "\(mb)MB/s"
        } else {
            let gb = bytesReceived / 1073741824
            s = "\(gb)GB/s"
        }

        //        let speed = elapsed != 0 ? Double(bytesReceived) / elapsed / 1024.0 / 1024.0 : -1
        return s
    }
}
