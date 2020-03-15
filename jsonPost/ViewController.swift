//
//  ViewController.swift
//  jsonPost
//
//  Created by test1 on 3/14/20.
//  Copyright © 2020 test1. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self

    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
       
       
       override func viewWillAppear(_ animated: Bool) {

           super.viewWillAppear(true)
           PostDataServer.instance.fetchAllPosts { (success) in
               if success {
                   self.tv.reloadData()
               }
           }
       }


}



extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(DataService.instance.categories.count)
    
        return PostDataServer.instance.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomeCell", for: indexPath) as! CustomeTableViewCell
      
        cell.LabelCell.text = PostDataServer.instance.posts[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        return 45
    }
    
    
}

