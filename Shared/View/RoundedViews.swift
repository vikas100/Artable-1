//
//  RoundedViews.swift
//  Artable
//
//  Created by МакЛарен on 2/7/19.
//  Copyright © 2019 Asset Ryskul. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}

class RoundedView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = AppColors.Blue.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
    }
}

class RoundedImage: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}
