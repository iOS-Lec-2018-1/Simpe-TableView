//
//  ViewController.swift
//  Simple TableView
//
//  Created by 김종현 on 2018. 4. 30..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var animalnames = ["Cat", "Monkey", "Dog"]
    var animalimages = ["cat", "monkey", "dog"]
    var animalLoc = ["부산시 양정동", "서울시 광화문", "제주시 서귀표"]
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // UIViewController와 Delegate 연결
        myTableView.delegate = self
        myTableView.dataSource = self
    
    }
    
    // UITableViewDataSoure
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalnames.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "\(section) Setction Header"
        } else {
            return "\(section) Section Header"
        }
    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        if section == 0 {
//            return "\(section) Section Footer"
//        } else {
//            return "\(section) Section Footer"
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if indexPath.section == 0 {
        // cell에 image 넣기
            let myImage = UIImage(named:animalimages[indexPath.row])
            cell.imageView?.image = myImage
        } else {
            let myImage = UIImage(named:"monkey.png")
            cell.imageView?.image = myImage
        }
        
        // cell에 text 넣기
        cell.textLabel?.text = animalnames[indexPath.row]
        
        // cell에 detailText 넣기
//        cell.detailTextLabel?.text = String(indexPath.row)
        cell.detailTextLabel?.text = animalLoc[indexPath.row]
        
        return cell
    }
    
    // cell을 selcet 했을때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mySection = indexPath.section
        let myRow = indexPath.row
        
        let myAnimal = animalnames[indexPath.row]
        
        print("I selected \(mySection) Section \(myRow) Row")
        print(myAnimal)
        
        let alert = UIAlertController(title: myAnimal, message: "Section \(mySection), Row \(myRow)", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "확인", style: .default) {
            (action: UIAlertAction) -> Void in
            
            // alertController 생성
            let popup = UIAlertController(title: myAnimal, message: "", preferredStyle: .alert)
            let popupAction = UIAlertAction(title: "You selected Section \(mySection) Row \(myRow)", style: .default, handler:nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            popup.addAction(popupAction)
            popup.addAction(cancelAction)
            self.present(popup, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    // cell의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        count = count + 1
        print(count)
        return 100.0
    }
}


