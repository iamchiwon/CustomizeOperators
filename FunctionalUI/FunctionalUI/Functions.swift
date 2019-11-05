//
//  Functions.swift
//  FunctionalUI
//
//  Created by iamchiwon on 2019/10/29.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import Foundation

infix operator ~>: LogicalDisjunctionPrecedence

@discardableResult
func ~> <A, B, C>(_ f1: @escaping (A) -> B,
                  _ f2: @escaping (B) -> C) -> (A) -> C {
    { a in
        f2(f1(a))
    }
}

@discardableResult
func run<T>(_ f: (()) -> T) -> T {
    f(())
}

func just<T>(_ f: @escaping () -> T) -> () -> T {
    {
        f()
    }
}

func map<T, U>(_ setter: @escaping (T) -> U) -> (T) -> U {
    { t in
        setter(t)
    }
}
