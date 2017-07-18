//
//  ViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Placoderm on 7/14/17.
//  Copyright © 2017 Placoderm. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
    
    // Hardcoded data for now
    var people = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllPeople(completionHandler: {
            
            data, response, error in
            do {
                
                //try converting the JSON object to "Foundation Tyes" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
                    if let results = jsonResult["results"] as? NSArray {
                        
                        let resultsArray = results as! [NSDictionary]
                        self.people = resultsArray
                        self.tableView.reloadData()
                        
                        //for person in results {
                            //let personDict = person as! NSDictionary
                            //self.people.append(personDict["name"]! as! String)
                        //}
                    }
                    
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print ("Something went wrong")
            }
        })
        
        // specify the url that we will be sending the GET request to
        //let url = URL(string: "http://swapi.co/api/people")
        // create a URLSession to handle the request tasks
        //let session = URLSession.shared
        // create a "data task" to make the request and run completion handler
        //let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            //data, response, error in
            // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
            // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
            //do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                //if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    //print(jsonResult)
                    
                    //if let results = jsonResult["results"] {
                        // coercing the results object as an NSArray and then storing that in resultsArray
                        //let resultsArray = results as! [NSDictionary]
                        
                        //self.people = resultsArray
                        //print (self.people)
                        //self.tableView.reloadData()
                    //}
                //}
                //run on the main queue - speed up UI
                //DispatchQueue.main.async {
                    //self.tableView.reloadData()
                //}
            //} catch {
                //print(error)
            //}
        //})
        // execute the task and then wait for the response
        // to run the completion handler. This is async!
        //task.resume()
    }
    
    //navigate to info about particular character - 
    //listen for tap on accessory button
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "LookAtPerson", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //check sender
        if sender != nil {
            
            let navigationController = segue.destination as! UINavigationController
            let personViewController = navigationController.topViewController as! PersonViewController
            
            let indexPath = sender as! NSIndexPath //sender used
            //print("SENDER: \(indexPath)")
            let person = people[indexPath.row]
            //print("PERSON: \(person)")
            
            personViewController.personInfo = person
            personViewController.indexPath = indexPath
            
        }
        //if sender does not exist somehow
        else {
            
            let navigationController = segue.destination as! UINavigationController
            let personViewController = navigationController.topViewController as! PersonViewController
                        
            personViewController.personInfo = nil
            personViewController.indexPath = nil
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("PeopleViewController viewWillAppear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()// Create a generic cell
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]["name"]! as? String
        cell.accessoryType = UITableViewCellAccessoryType.detailButton
        
        return cell// return the cell so that it can be rendered
    }
    
    //@IBAction func unwindToPeopleView(sender: UIStoryboardSegue)
    //{
        //print(sender)
    //}
}

