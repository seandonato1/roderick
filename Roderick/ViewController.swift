//
//  ViewController.swift
//  Roderick
//
//  Created by Sean Donato on 2/11/20.
//  Copyright © 2020 Sean Donato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        button = UIButton()
        
        button?.setTitle("start", for: .normal)
        button?.backgroundColor = .blue
        self.view.addSubview(button!)
        button?.translatesAutoresizingMaskIntoConstraints = false
        button?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        button?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        button?.addTarget(self, action: #selector(goToLevelOne), for: .touchUpInside)        // Do any additional setup after loading the view.
    }
    
    @objc func goToLevelOne(){
        let vc = FirstLevelViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
