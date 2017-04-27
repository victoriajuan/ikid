//
//  KnockViewController.swift
//  ikid
//
//  Created by Vicky Juan on 4/27/17.
//  Copyright © 2017 Victoria Juan. All rights reserved.
//

import UIKit

class KnockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var firstViewController : KnockFirstViewController!
    var secondViewController : KnockSecondViewController!
    var thirdViewController : KnockThirdViewController!
    var fourthViewController : KnockFourthViewController!
    
    fileprivate func firstBuilder() {
        if firstViewController == nil {
            firstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Seventh")
                as! KnockFirstViewController
        }
    }
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Eighth")
                as! KnockSecondViewController
        }
    }
    fileprivate func thirdBuilder() {
        if thirdViewController == nil {
            thirdViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Ninth")
                as! KnockThirdViewController
        }
    }
    fileprivate func fourthBuilder() {
        if fourthViewController == nil {
            fourthViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Tenth")
                as! KnockFourthViewController
        }
    }

    @IBAction func switchViews(_ sender: Any) {
        secondBuilder()
        firstBuilder()
        thirdBuilder()
        fourthBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(firstViewController, to: secondViewController)
        } else if secondViewController != nil &&
            secondViewController?.view.superview != nil{
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            thirdViewController.view.frame = view.frame
            switchViewController(secondViewController, to: thirdViewController)
        }else if thirdViewController != nil &&
            thirdViewController?.view.superview != nil{
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            fourthViewController.view.frame = view.frame
            switchViewController(thirdViewController, to: fourthViewController)
        }else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(fourthViewController, to: firstViewController)
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }


}
