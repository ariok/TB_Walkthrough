//
//  MainViewController.swift
//  TB_Walkthrough
//
//  Created by Yari D'areglia on 12/03/16.
//  Copyright © 2016 Bitwaker. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, BWWalkthroughViewControllerDelegate {

    var needWalkthrough:Bool = true
    var walkthrough:BWWalkthroughViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if needWalkthrough {
            self.presentWalkthrough()
        }
    }

    @IBAction func presentWalkthrough(){
        
        let stb = UIStoryboard(name: "Main", bundle: nil)
        walkthrough = stb.instantiateViewController(withIdentifier: "container") as! BWWalkthroughViewController
        let page_one = stb.instantiateViewController(withIdentifier: "page_1")
        let page_two = stb.instantiateViewController(withIdentifier: "page_2")
        let page_three = stb.instantiateViewController(withIdentifier: "page_3")
        let page_four = stb.instantiateViewController(withIdentifier: "page_4")
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.addViewController(vc: page_one)
        walkthrough.addViewController(vc: page_two)
        walkthrough.addViewController(vc: page_three)
        walkthrough.addViewController(vc: page_four)
        
        self.present(walkthrough, animated: true) {
            ()->() in
            self.needWalkthrough = false
        }
    }
}


extension MainViewController{
    
    func walkthroughCloseButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func walkthroughPageDidChange(_ pageNumber: Int) {
        if (self.walkthrough.numberOfPages - 1) == pageNumber{
            self.walkthrough.closeButton?.isHidden = false
        }else{
            self.walkthrough.closeButton?.isHidden = true
        }
    }
    
}
