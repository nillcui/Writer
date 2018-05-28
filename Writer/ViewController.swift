//
//  ViewController.swift
//  Writer
//
//  Created by NillCui on 2018/5/26.
//  Copyright © 2018年 NillCui. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var arrList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrList = ["111", "222", "333", "444", "555", "666", "777", "888", "999", "000", "aaa"]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            print("cell alloc")
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell!.textLabel!.text = arrList[indexPath.row]
        
//        cell!.selectionStyle = .none
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "删除") { (action, view, finished) in
//            self.arrList.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            
//            finished(true)
            
        }
        
        
        let archiveAction = UIContextualAction(style: .normal, title: "归档") { (action, view, finished) in
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, archiveAction])
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let act1 = UITableViewRowAction(style: .normal, title: "act1") { (action, indexPath) in
            NSLog("111:")
        }
        
        let act2 = UITableViewRowAction(style: .default, title: "act2") { (action, indexPath) in
            NSLog("222:")
        }
        
        return [act1,act2]
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "del"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let templateVC = TemplateViewController()
        templateVC.registNextAction { (tempContent) in
            
            let layout = UICollectionViewFlowLayout()
            let composeVC = ComposeViewController()
            self.navigationController?.pushViewController(composeVC, animated: true)
        }
        let naviVC = UINavigationController(rootViewController: templateVC)
        self.present(naviVC, animated: true) { }
    }
}

