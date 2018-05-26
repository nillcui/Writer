//
//  ViewController.swift
//  Writer
//
//  Created by NillCui on 2018/5/26.
//  Copyright © 2018年 NillCui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildTableView()
    }

    var tableView : UITableView?
    func buildTableView() -> Void {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
//        tableView!.separatorStyle = .none
        tableView!.delegate = self
        tableView!.dataSource = self
//        tableView!.layoutMargins = UIEdgeInsets.zero
//        tableView!.separatorInset = UIEdgeInsets.zero
        tableView!.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        view.addSubview(tableView!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            print("cell alloc")
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell!.textLabel!.text = "sssss"
        
//        cell!.selectionStyle = .none
        return cell!
    }
}

