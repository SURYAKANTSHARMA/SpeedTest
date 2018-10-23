//
//  ViewController.swift
//  SpeedTest
//
//  Created by amirshayegh on 10/23/2018.
//  Copyright (c) 2018 amirshayegh. All rights reserved.
//

import UIKit
import SpeedTest

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SpeedTest.shared.test { (speed) in
            print(speed)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

