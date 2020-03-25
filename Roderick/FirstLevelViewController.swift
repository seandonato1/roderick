//
//  FirstLevelViewController.swift
//  Roderick
//
//  Created by Sean Donato on 2/11/20.
//  Copyright © 2020 Sean Donato. All rights reserved.
//

import UIKit

class FirstLevelViewController: UIViewController,UIGestureRecognizerDelegate {

    var road : UIImageView?
    
    var roadImages : [UIImage]?
    
    var guy : UIImageView?
    var bottomConstraint : NSLayoutConstraint!
    
    var centerX : NSLayoutConstraint!
    var swipeUp : UISwipeGestureRecognizer?

    var tapLeft : UITapGestureRecognizer?
    var tapRight : UITapGestureRecognizer?
    
    var leftView : UIView?
    var rightView : UIView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.backgroundColor = .white
        let guyimg = UIImage(named: "guyTrans")
        let img = UIImage(named: "roadA")
        let img2 = UIImage(named: "roadB")
        let img3 = UIImage(named: "roadC")

        roadImages = [img2 ?? UIImage()]
        roadImages?.append(img3 ?? UIImage())
        roadImages?.append(img ?? UIImage())

        guy = UIImageView(image: guyimg)
        guy?.contentMode = .scaleAspectFit
        road = UIImageView(image: img)
        self.view.addSubview(road!)
        
        
        road?.translatesAutoresizingMaskIntoConstraints = false
        road?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 180).isActive = true
        road?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        road?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        road?.contentMode = .scaleAspectFit
        road?.animationImages = roadImages!
        road?.animationDuration = 1
        road?.animationRepeatCount = 0
        road?.startAnimating()
        
        self.view.addSubview(guy!)
        guy?.translatesAutoresizingMaskIntoConstraints = false
        guy?.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        centerX = NSLayoutConstraint(item: guy!, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        centerX.isActive = true
        
        bottomConstraint = NSLayoutConstraint(item: guy!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        swipeUp = UISwipeGestureRecognizer()
        swipeUp!.direction = .up
        swipeUp!.delegate = self
        
        self.view.addGestureRecognizer(swipeUp!)
        
        let halfway = self.view.frame.width/2

        tapLeft = UITapGestureRecognizer()
        
        tapRight = UITapGestureRecognizer()

        tapLeft?.delegate = self
        tapRight?.delegate = self
        
        rightView = UIView(frame: CGRect(x: halfway, y: 0, width: halfway, height: self.view.frame.height))
        
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: halfway, height: self.view.frame.height))

        
        self.view.addSubview(rightView!)
        self.view.addSubview(leftView!)

        rightView?.addGestureRecognizer(tapRight!)
        leftView?.addGestureRecognizer(tapLeft!)

       // animateRoad()
        // Do any additional setup after loading the view.
    }
    

    func animateRoad(){
        
        UIView.animateKeyframes(withDuration: 100, delay: 0, options: .calculationModeCubic, animations: {
            
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.road!.image = UIImage(named: "roadB")
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.road!.image = UIImage(named: "roadC")
            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.road!.image = UIImage(named: "roadA")
            }
            
        }, completion: nil)
    }
    
    func animateGuyUp(){
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.bottomConstraint.constant = -300
            self.view.layoutIfNeeded()
        }) { (true) in
            self.animateGuyDown()
        }
        

    }
    
  
    func animateGuyDown(){
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.bottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }) { (true) in

        }
    }
    
    var guyLeft = false
    var guyRight = false
    
    func animateGuySide(direction : Int){
           
        if(guyLeft == true || guyRight == true){
        guyLeft = false
        guyRight = false

           UIView.animate(withDuration: 0.5, animations: {
               
               self.centerX.constant = 0
               self.view.layoutIfNeeded()
        
           }) { (true) in

           }

       }else if(direction == 0){
            
            guyLeft = true
            guyRight = false
            UIView.animate(withDuration: 0.5) {
                self.centerX.constant = -100
                self.view.layoutIfNeeded()

            }
        }else if(direction == 1){
            
            guyLeft = false
            guyRight = true
            UIView.animate(withDuration: 0.5) {
                self.centerX.constant = 100
                self.view.layoutIfNeeded()

            }
        }
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if(gestureRecognizer == swipeUp){

            animateGuyUp()
            
        }else if(gestureRecognizer.isKind(of: UITapGestureRecognizer.self)){
            
            let halfway = self.view.frame.width/2
            
            if(gestureRecognizer.location(ofTouch: 0, in: self.view).x < halfway){
                
                animateGuySide(direction: 0)
                
            }else{
                
                animateGuySide(direction: 1)

            }
        }
        
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
