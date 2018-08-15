//
//  PageControlViewController.swift
//  ruangMC3
//
//  Created by Julianti Cahyadi on 14/08/18.
//  Copyright © 2018 yanti. All rights reserved.
//

import UIKit

class PageControlViewController: UIPageViewController , UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else
        {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else
        {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else
        {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else
        {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count > nextIndex else
        {
            return nil
        }
        
        guard orderedViewControllers.count > nextIndex else
        {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    

    var pageControl = UIPageControl()
    
    
    
    lazy var orderedViewControllers: [UIViewController] =
        {
            return [self.newVC(viewController: "screen1"),
                    self.newVC(viewController: "screen2"),
                    self.newVC(viewController: "screen3"),
                    self.newVC(viewController: "screen4")
            ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        if let firstViewcontroller = orderedViewControllers.first
        {
            setViewControllers([firstViewcontroller], direction: .forward, animated: true, completion: nil)
        }
        
        configurePageControl()
     
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
        
        
    }
    
    func configurePageControl()
    {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.tintColor = .black
        pageControl.currentPage  = 0
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .black
        
        self.view.addSubview(pageControl)
    }
    
    
    func newVC(viewController: String)-> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
   

}
