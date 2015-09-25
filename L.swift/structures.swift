//
//  structures.swift
//  L.swift
//
//  Created by Yuki Nagai on 9/3/15.
//  Copyright © 2015 Recruit Lifestyle Co., Ltd. All rights reserved.
//

import Foundation

/**
Structures in L.swift

Nodes will be ["One", "Two"] for the key: "One.Two.Three"
Using class to append children recursively.
*/
internal class Node {
    let name: String
    var nodes = [Node]()
    var leafs = [Leaf]()
    
    var description: String {
        return description()
    }
    
    init(name: String) {
        self.name = name
    }
    
    func appendChild(key: String, depth: Int = 0) {
        // ScreenName..ItemName should be converted into ScreenName.itemNode
        let components = key.componentsSeparatedByString(".").filter { !$0.isEmpty }
        let count = components.count
        if count <= depth {
            return
        }
        // TODO: supporting hyphen-separated name
        let name = components[depth]
        if count == depth + 1 {
            // It should be a leaf
            // Leaf duplicated won't happen because keys should not be duplicated
            // Leaf name's first letter is lowercase
            let startIndex = name.startIndex
            let tailRange = name.startIndex.advancedBy(1)..<name.endIndex
            let leafName = name[startIndex...startIndex].lowercaseString + name[tailRange]
            let leaf = Leaf(name: leafName, key: key)
            leafs.append(leaf)
        } else {
            // It should be a node
            // Node name should be captialized
            // TODO: capitalizing make AboutViewController Aboutviewcontroller
            let startIndex = name.startIndex
            let tailRange = name.startIndex.advancedBy(1)..<name.endIndex
            let nodeName = name[startIndex...startIndex].uppercaseString + name[tailRange]
            var node: Node?
            for sibling in nodes {
                if sibling.name == nodeName {
                    node = sibling
                    break
                }
            }
            if node == nil {
                // if not exists, new node
                node = Node(name: nodeName)
                nodes.append(node!)
            }
            // recursive
            node?.appendChild(key, depth: depth + 1)
        }
    }
    
    func description(depth: Int = 0) -> String {
        var lines = ["struct \(name) {".withSpaces(depth)]
        for sibling in nodes {
            lines.append(sibling.description(depth + 1))
        }
        for leaf in leafs {
            lines.append(leaf.description(depth + 1))
        }
        lines.append("}".withSpaces(depth))
        return lines.joinWithSeparator("\n")
    }
}

/**
Localizable keys in L.swift

Leaf will be "Three" for the key: "One.Two.Three"
*/
internal class Leaf {
    /// Last component of the key for the static let name
    let name: String
    /// Full of localizable key
    let key: String
    
    var description: String {
        return description()
    }
    
    init(name: String, key: String) {
        self.name = name
        self.key = key
    }
    
    func description(depth: Int = 0) -> String {
        return "static let \(name) = \"\(key)\"".withSpaces(depth)
    }
}

extension String {
    private func withSpaces(depth: Int) -> String {
        return Array(count: depth, repeatedValue: "    ").joinWithSeparator("") + self
    }
}
