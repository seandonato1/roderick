//
//  CollidingGuy.swift
//  Roderick
//
//  Created by Sean Donato on 2/16/20.
//  Copyright © 2020 Sean Donato. All rights reserved.
//

import UIKit

enum position {
    case left
    case right
    case center
}
class CollidingGuy: UIImageView {

    var pos : position
    
    override init(image: UIImage?) {
        pos = .center
        super.init(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
