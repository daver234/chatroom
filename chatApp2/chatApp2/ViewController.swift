//
//  ViewController.swift
//  chatApp2
//
//  Created by David Rothschild on 1/19/16.
//  Copyright © 2016 Dave Rothschild. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var socket: SocketIOClient?
    // let socket = SocketIOClient(socketURL: "http://192.168.1.233:6789")
    
    @IBOutlet weak var urlLabel: UITextField!
    
    @IBOutlet weak var urlSendText: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var messages = [""]
    
    @IBAction func sendButtonPressed(sender: UIButton) {
        socket?.emit("messageToServer", urlSendText.text!)
        self.tableView.reloadData()
    }
    
    
    @IBAction func connectButtonPressed(sender: UIButton) {
        socket = SocketIOClient(socketURL: urlLabel.text!)
        socket!.connect()
        socket!.on("connect") { data, ack in
            print("iOS::WE ARE USING SOCKETS!")
        }
        socket?.on("messageFromServer") { data, ack in
            print("\(data)")
            let d = data
                self.messages.append(d[0]["message"] as! String)
            
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        // if the cell has a text label, set it to the model that is corresponding to the row in array
        cell.textLabel?.text = urlSendText.text!
        // return cell so that Table View knows what to draw in each row
        return cell
    }

}

