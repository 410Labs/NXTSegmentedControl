//
//  ExampleViewController.swift
//  NXTSegmentedControl
//
//  Created by Patrick Mick on 5/5/16.
//  Copyright © 2016 Patrick Mick. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sectionTitles = ["test1", "test2"]
        let segmentedControl = NXTSegmentedControl(withSectionTitles: sectionTitles)
        segmentedControl.frame = CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 200, height: 40))
        segmentedControl.backgroundColor = UIColor.greenColor()
        self.view.addSubview(segmentedControl)
    }
}
