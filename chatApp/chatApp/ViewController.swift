//
//  ViewController.swift
//  chatApp
//
//  Created by David Rothschild on 1/18/16.
//  Copyright © 2016 Dave Rothschild. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var socket: SocketIOClient?
    
    
    
//    @IBAction func connectButtonPressed(sender: UIButton) {
//        socket = SocketIOClient(socketURL: urlLabel.text!)
//        socket?.connect()
//        socket?.on("connect") { data, ack in
//            print("iOS::WE ARE USING SOCKETS!")
//        }
//        
//    }
    
//    let socket = SocketIOClient(socketURL: "http://192.168.1.233:6789")
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        socket.connect()
//        socket.on("connect") { data, ack in
//            print("iOS::WE ARE USING SOCKETS!")
//        }
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}