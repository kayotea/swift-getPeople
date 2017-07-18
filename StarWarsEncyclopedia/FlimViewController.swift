//
//  FlimViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Placoderm on 7/17/17.
//  Copyright © 2017 Placoderm. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {

    var filmInfo: NSDictionary?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmReleaseDate: UILabel!
    @IBOutlet weak var filmDirector: UILabel!
    @IBOutlet weak var filmOpeningCrawl: UILabel!
    
    @IBAction func backToFilmsButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated:true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        
        if let film = filmInfo {
            
            filmTitle.text = "\(film["title"]!)"
            filmReleaseDate.text = "Release Date: \(film["release_date"]!)"
            filmDirector.text = "Director: \(film["director"]!)"
            filmOpeningCrawl.text = "\(film["opening_crawl"]!)"
            
        } else {
            print ("film not found")
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
