//
//  TemplateViewController.swift
//  Writer
//
//  Created by Ming Cui on 2018/5/28.
//  Copyright © 2018年 Ming Cui. All rights reserved.
//

import UIKit

class TemplateViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    var collectionView : UICollectionView?
    var nextAction : ((_ temeplateContent :String ) -> Void)?
    
    let array = [["A", "B"], ["C", "D", "E"], ["F", "G", "H", "I", "J", "K"], ["L", "M", "N"]]
    
    let idealCellWidth: CGFloat = 100
    let margin: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "选择模版"

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .done, target: self, action: #selector(closeMe))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一步", style: .done, target: self, action: #selector(goNext))
        
        configCollectionView()
    }
    
    func configCollectionView() {
        
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 90, height: 100)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets.init(top: 15, left: 0, bottom: 0, right: 0)

        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        
        collectionView?.backgroundColor = .groupTableViewBackground
        //        collectionView?.contentInsetAdjustmentBehavior = .always
        self.view.addSubview(collectionView!)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    public func registNextAction(_ nextAction: @escaping (_ temeplateContent :String) -> Void) -> Void {
        self.nextAction = nextAction
    }

    @objc func closeMe() {
        self.dismiss(animated: true) {        }
    }
    
    @objc func goNext() {
        self.dismiss(animated: false) { }
        if (self.nextAction != nil) {
            self.nextAction!("hiii")
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .cyan
        return cell
    }
}
