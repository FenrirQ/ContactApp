//
//  DataService.swift
//  ContactApp
//
//  Created by Quang Ly Hoang on 8/22/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import Foundation

class DataService {
    static let shared: DataService = DataService()
    
    private init() {}
    
    private var context = Database.getContext()
    
    //Get mảng person từ database
    private var _people: [Person]?
    
    var people: [Person] {
        if _people == nil {
            do {
                _people = try context.fetch(Person.fetchRequest())
            } catch {
                return []
            }
        }
        return _people ?? []
    }
    
    //MARK: Tạo mảng section và mảng row trong section
    private var _nameSection: [String] = []
    
    var nameSection: [String] {
        if _nameSection.isEmpty {
            self.createNameArrayAndSection()
        }
        return _nameSection
    }
    
    private var _nameArray: [[String]] = []
    
    var nameArray: [[String]] {
        if _nameArray.isEmpty {
            self.createNameArrayAndSection()
        }
        return _nameArray
    }
    
    //tạo mảng ban đầu cho section và row
    func createNameArrayAndSection() {
        var nameArr = [String]()
        for person in people {
            if let firstName = person.firstName, let lastName = person.lastName {
                let string = firstName + " " + lastName
                nameArr.append(string)
            } else {
                let string = (person.firstName ?? "") + (person.lastName ?? "")
                nameArr.append(string)
            }
        }
        nameArr.sort()
        for arr in groupArray(strings: nameArr) {
            guard let letter = arr.first?.characters.first else {return}
            _nameSection.append(String(letter))
            _nameArray.append(arr)
        }
    }
    
        //Nhóm name theo chữ cái đầu
    private func groupArray(strings: [String]) -> [[String]] {
        let groupedContacts = strings.reduce([[String]]()) {
            guard var last = $0.last else { return [[$1]] }
            var collection = $0
            if last.first!.characters.first == $1.characters.first {
                last += [$1]
                collection[collection.count - 1] = last
            } else {
                collection += [[$1]]
            }
            return collection
        }
        return groupedContacts
    }
    
}
