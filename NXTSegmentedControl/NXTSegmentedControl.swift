//
//  NXTSegmentedControl.swift
//  NXTSegmentedControl
//
//  Created by Patrick Mick on 5/5/16.
//  Copyright © 2016 Patrick Mick. All rights reserved.
//

import Foundation
import UIKit

internal extension UIEdgeInsets {
    static var zero: UIEdgeInsets {
        return UIEdgeInsets()
    }
    
    init(_ edge: CGFloat) {
        self.init(top: edge, left: edge, bottom: edge, right: edge)
    }
}

internal extension UIView {
    func constrainFillingSuperview() {
        self.constrainFillingSuperview(insets: UIEdgeInsets.zero)
    }
    
    func constrainFillingSuperview(insets insets: UIEdgeInsets) {
        guard let superview = self.superview else {
            fatalError("Attempting to make a view that has no superview fill its superview")
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraintEqualToAnchor(superview.topAnchor, constant: insets.top).active = true
        self.bottomAnchor.constraintEqualToAnchor(superview.bottomAnchor, constant: -insets.bottom).active = true
        self.leftAnchor.constraintEqualToAnchor(superview.leftAnchor, constant: insets.left).active = true
        self.rightAnchor.constraintEqualToAnchor(superview.rightAnchor, constant: -insets.right).active = true
    }
}

class NXTSegmentedControl: UIControl {
    
    var numberOfSegments: UInt {
        get {
            return 0
        }
    }
    
    var selectedSegmentIndex: UInt {
        get {
            return 0
        }
    }
    
    var thumbEdgeInset: CGFloat = 0
    var thumbColor: UIColor = UIColor.blueColor()
    
    private let stackView: UIStackView
    
    init(withSectionTitles titles: [String]) {
        let labels: [UILabel] = titles.map {
            let label = UILabel()
            label.text = $0
            label.textAlignment = .Center
            label.backgroundColor = UIColor.redColor()
            return label
        }
        
        self.stackView = UIStackView(arrangedSubviews: labels)
        self.stackView.axis = .Horizontal
        self.stackView.distribution = .FillEqually
        self.stackView.spacing = 5
        
        super.init(frame: CGRect.zero)
        
        self.addSubview(self.stackView)
        self.stackView.constrainFillingSuperview(insets: UIEdgeInsets(5))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: Is this the most *swifty* way to name a method? Set feels weird
    func setSelectedSegmentIndex(index: UInt, animated: Bool = false) {
        
    }
    
    func titleForSegmentAtIndex(index: UInt) -> String {
        return ""
    }
    
    // title text attributes were used before to keep the API similar to UISegmentedControl, but it's just a little hard to work with even if the UIControlState property means that we might have a lot of properties.
}
