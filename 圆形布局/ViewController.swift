//
//  ViewController.swift
//  圆形布局
//
//  Created by mac on 2017/9/30.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

import Alamofire
import  SwiftyJSON
import SDWebImage
class Girl {
    var id : String!
    var createdAt : String!
    var desc : String!
    var publishedAt : String!
    var source : String!
    var type : String!
    var url : String!
    var used : Bool!
    var who : String!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        id = json["_id"].stringValue
        createdAt = json["createdAt"].stringValue
        desc = json["desc"].stringValue
        publishedAt = json["publishedAt"].stringValue
        source = json["source"].stringValue
        type = json["type"].stringValue
        url = json["url"].stringValue
        used = json["used"].boolValue
        who = json["who"].stringValue
    }
}
typealias girlsblock = (_ girls:[Girl]) -> Void
class networktask {
    
    var  taskid:Int!
    
    init(_ page:Int) {
        
        self.taskid = page
        
    }
    func    starttask(_ result:@escaping girlsblock){
        let   url = "http://gank.io/api/data/%E7%A6%8F%E5%88%A9/10/" +  String.init(format: "%d", self.taskid)
        var  girls:[Girl]  = [Girl]()
        Alamofire.request(url).responseJSON { (response) in
            
            let   results = JSON.init(response.result.value as! [String:Any])
            
            for  json in  results["results"].array!{
                let  girl = Girl.init(fromJson: json)
                girls.append(girl)
            }
            result(girls)
        }
    }
    
    
    
}

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource  {
    
    var  girls:[Girl] = [Girl]()
    
    var  sections:Int = 0
    @IBOutlet  weak  var   collectionview:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        let  task1 = networktask(1)
        
        task1.starttask { (girls) in
            self.girls = girls
      
       
//            let  count = girls.count
            
//            self.sections = (count + 2 - 1 )/2
            self.collectionview.reloadData()
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return   1
//        print(self.sections)
//        return  self.sections
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //最后一个
//        if section ==  self.sections - 1 &&  section * 2 != self.girls.count{
//           return  1
//        }
//
//        return 2
        return  self.girls.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CircleCollectionViewCell
//        let  section = indexPath.section
        let   row = indexPath.row
        
//        let  girlurl = self.girls[section*2 + row].url
        let  girlurl = self.girls[row].url
        cell.imgview.sd_setImage(with: URL.init(string: girlurl!))
        return  cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return  CGSize.init(width: appwidth/2.0, height: appwidth/2.0)
//    }
    
}

