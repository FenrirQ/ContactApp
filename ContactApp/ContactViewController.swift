//
//  ContactViewController.swift
//  ContactApp
//
//  Created by Quang Ly Hoang on 8/22/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    
    @IBOutlet weak var contactTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactTableView.dataSource = self
        
//        let arr : [Array<Any?>] = [["Quang", nil, nil, "0949223592", false, true],
//                                   ["Bo", nil, "Home", "0983627122", false, true],
//                                   ["Me", nil, "Home", "0948554878", true, true],
//                                   ["A Vinh", nil, "Home", "01694736979", false, true],
//                                   ["A Long", nil, nil, "0868113139", false, false],
//                                   ["Luong Ga", nil, nil, "0975970801", true, false],
//                                   ["Hien", "CB", "K59", "01666894886", true, false],
//                                   ["Sang", "CB", "K59", "0989779325", false, false],
//                                   ["Hung", "CD", "K59", "01646310004", true, false],
//                                   ["A Thang", nil, "Big0", "01239180123", true, false],
//                                   ["Dai", "CB", "K59", "0977654075", false, false]]
//        
//        let context = Database.getContext()
//        for per in arr {
//            let person = Person(context: context)
//            person.firstName = per[0] as? String
//            person.lastName = per[1] as? String
//            person.company = per[2] as? String
//            person.phoneNumber = per[3] as? String
//            person.isIOS = per[4] as! Bool
//            person.isFavorite = per[5] as! Bool
//            Database.saveContext()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ContactViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataService.shared.nameSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.nameArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = DataService.shared.nameArray[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return DataService.shared.nameSection[section]
    }
}
