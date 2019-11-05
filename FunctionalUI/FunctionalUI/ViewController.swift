//
//  ViewController.swift
//  FunctionalUI
//
//  Created by iamchiwon on 2019/10/29.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import UIKit

infix operator ~>: LogicalDisjunctionPrecedence

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        run(
            just { UIView() }
                ~> addSubView(view)
                ~> map { v in
                    v.backgroundColor = .systemGray
                    v ~> self.view
                }
        )

        let green = run(
            just { UIView() }
                ~> addSubView(view)
                ~> map { v -> UIView in
                    v.backgroundColor = .systemGreen
                    return v
                }
                ~> map { v -> UIView in
                    v.topAnchor ~> self.view.topAnchor + 50
                    v.leftAnchor ~> self.view.leftAnchor + 50
                    v.rightAnchor ~> self.view.rightAnchor - 50
                    v.heightAnchor ~> 200
                    return v
                }
        )

        let yellow = run(
            just { UIView() }
                ~> addSubView(view)
                ~> map { v -> UIView in
                    v.backgroundColor = .systemYellow
                    return v
                }
                ~> map { v -> UIView in
                    v.topAnchor ~> green.topAnchor + 100
                    v.centerXAnchor ~> self.view.centerXAnchor
                    v.widthAnchor ~> 200
                    v.heightAnchor ~> 200
                    return v
                }
        )

        run(
            just { UIView() }
                ~> addSubView(view)
                ~> map { v -> UIView in
                    v.backgroundColor = .systemRed
                    return v
                }
                ~> map { v -> UIView in
                    v.centerXAnchor ~> yellow.centerXAnchor
                    v.centerYAnchor ~> yellow.centerYAnchor
                    v.widthAnchor ~> yellow.widthAnchor * 0.5
                    v.heightAnchor ~> yellow.heightAnchor * 0.5
                    return v
                }
        )
    }
}
