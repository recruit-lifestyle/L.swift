//
//  main.swift
//  L.swift
//
//  Created by Yuki Nagai on 9/2/15.
//  Copyright © 2015 Recruit Lifestyle Co., Ltd. All rights reserved.
//

import Foundation

/**
TODO: Warning
*/

/**
Localizable.strings NSURLs for each root directory
*/
private func localizableFiles(directory: NSURL) -> [NSURL] {
    var files = [NSURL]()
    let fileManager = NSFileManager.defaultManager()
    guard let enumerator = fileManager.enumeratorAtURL(
        directory,
        includingPropertiesForKeys: [NSURLNameKey, NSURLIsDirectoryKey],
        options: [.SkipsHiddenFiles, .SkipsPackageDescendants],
        errorHandler: nil) else {
            return [NSURL]()
    }
    for url in enumerator {
        guard let url = url as? NSURL else {
            continue
        }
        if url.lastPathComponent == "Localizable.strings" {
            files.append(url)
        }
    }
    return files
}

/**
Sorted localizable keys in each Localizable.strings
*/
private func localizableKeys(files: [NSURL]) -> [String] {
    var keys = Set<String>()
    for file in files {
        guard let dictionary = NSDictionary(contentsOfURL: file) as? [String: String] else {
            continue
        }
        keys = keys.union(dictionary.keys)
    }
    return Array(keys).sort()
}

private func writeContentsIfChanged(contents: String, path: NSURL) {
    
}

// MARK - main
/**
arguments should contain only one for search root path.

- parameter arguments: command line arguments
*/
private func main(arguments: [String]) {
    if arguments.count != 2 {
        fatalError("Usage: ./L.swift <Search Root Path> ...")
    }
    let directory = NSURL(fileURLWithPath: arguments[1], isDirectory: true)
    let files = localizableFiles(directory)
    let keys = localizableKeys(files)
    let root = Node(name: "L")
    for key in keys {
        root.appendChild(key)
    }
    // write file if we have changes
    let fileName = "L.generated.swift"
    let fileURL = directory.URLByAppendingPathComponent(fileName)
    let contents = root.description
    // compare with existing
    let fileContents: String
    do {
        fileContents = try String(contentsOfURL: fileURL, encoding: NSUTF8StringEncoding)
    } catch {
        fileContents = ""
    }
    if fileContents == contents {
        // Do nothing
        return
    }
    do {
        try contents.writeToURL(fileURL, atomically: true, encoding: NSUTF8StringEncoding)
    } catch let error {
        fatalError("\(error)")
    }
}
// 実行
main(Process.arguments)
