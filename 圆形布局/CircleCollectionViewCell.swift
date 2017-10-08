//
//  CircleCollectionViewCell.swift
//  圆形布局
//
//  Created by mac on 2017/9/30.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell,UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var imgview: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor =     UIColor.clear
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if   gestureRecognizer.isKind(of: UITapGestureRecognizer.self){
            return   true
        }
        return false
    }
    override func awakeFromNib() {
        backgroundColor = UIColor.init(red: 1.0, green: 0, blue: 0, alpha: 0.4)
        
        super.awakeFromNib()
        
    }
    
    
}
