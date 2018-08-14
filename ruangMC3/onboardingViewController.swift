//
//  onboardingViewController.swift
//  ruangMC3
//
//  Created by Julianti Cahyadi on 14/08/18.
//  Copyright © 2018 yanti. All rights reserved.
//

import UIKit

class onboardingViewController: UIViewController , UIScrollViewDelegate {

    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var image: [String] = ["os1","os2","os3","os4"]
    
     var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControll.numberOfPages = image.count
        
        
        
        for index in 0..<image.count
        {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: image[index])
            
            self.scrollView.addSubview(imgView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(image.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       var pageNumber = scrollView.contentOffset.x /
            scrollView.frame.size.width
        
        pageControll.currentPage = Int(pageNumber)
    }
}
