//
//  Item.swift
//  Sololearn
//
//  Created by Kif on 08.12.16.
//  Copyright © 2016 KifApp. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {

    var name: String

    init(name: String) {
        self.name = name
        super.init()
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        self.init(name: name)
    }

    static let Dir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = Dir.appendingPathComponent("items")


}
