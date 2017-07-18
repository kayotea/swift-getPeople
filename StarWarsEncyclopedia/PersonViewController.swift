//
//  PersonViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Placoderm on 7/17/17.
//  Copyright © 2017 Placoderm. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    var personInfo: NSDictionary?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personGender: UILabel!
    @IBOutlet weak var personBirthYear: UILabel!
    @IBOutlet weak var personMass: UILabel!
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = personInfo {
            
            //print ("PERSON RECEIVED:\(person)")
            personName.text = "\(person["name"]!)"
            personGender.text = "Gender: \(person["gender"]!)"
            personBirthYear.text = "Birth Year: \(person["birth_year"]!)"
            personMass.text = "Mass: \(person["mass"]!)"
            
        } else {
            print ("person not found")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
