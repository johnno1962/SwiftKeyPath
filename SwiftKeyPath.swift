//
//  SwiftKeyPath.swift
//  SwiftKeyPath
//
//  Created by John Holdsworth on 20/03/2017.
//  Copyright © 2017 John Holdsworth. All rights reserved.
//

import Foundation

@_silgen_name("_getAnyPointer")
func _getAnyPointer<T>(_ value: T) -> UnsafeRawPointer?

func getValue<T>(keyPath:[String], type: T.Type, from: Any) -> T? {
    if keyPath.count == 0 {
        return _getAnyPointer(from)?.assumingMemoryBound(to: T.self).pointee
    }
    var keyPath = keyPath
    let target = keyPath[0]
    keyPath.remove(at: 0)
    for (name, child) in Mirror(reflecting: from).children {
        if name == target {
            return getValue(keyPath: keyPath, type: type, from: child)
        }
    }
    return nil
}

extension NSObject {
    func valueFor<T>(keyPath:String, type: T.Type) -> T? {
        return getValue(keyPath: keyPath.components(separatedBy: "."), type: type, from: self)
    }
}
