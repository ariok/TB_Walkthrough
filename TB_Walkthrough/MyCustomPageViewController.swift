//
//  MyCustomPageViewController.swift
//  TB_Walkthrough
//
//  Created by Yari D'areglia on 12/03/16.
//  Copyright © 2016 Bitwaker. All rights reserved.
//

import UIKit

class MyCustomPageViewController: BWWalkthroughPageViewController {

    @IBOutlet var backgroundView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.zPosition = -1000
        view.layer.isDoubleSided = false
        self.backgroundView.layer.masksToBounds = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func walkthroughDidScroll(position: CGFloat, offset: CGFloat) {
        var tr = CATransform3DIdentity
        tr.m34 = -1/1000.0
        view.layer.transform = CATransform3DRotate(tr, CGFloat(M_PI)  * (1.0 - offset), 0.5,1, 0.2)
    }
}
