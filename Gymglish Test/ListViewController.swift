//
//  ListViewController.swift
//  Gymglish Test
//
//  Created by AKIN on 3.06.2019.
//  Copyright © 2019 AKIN. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var websiteNames = [String]()
    var websiteLinks = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Websites"
        initializeWebsites()
        tableView.reloadData()
    }
    
    func initializeWebsites(){
        websiteNames = ["Gymglish",
                        "Frantastique",
                        "Vatefaireconjuguer",
                        "Rich Morning",
                        "The Word of the Month",
                        "Anglais cpf",
                        "Comment Utiliser Son cpf",
                        "Gymglish Studio",
                        "Anglais Conjugaison",
                        "The Delavigne Corporation"]
        
        websiteLinks = ["https://www.gymglish.com/",
                        "https://www.frantastique.com/",
                        "https://www.vatefaireconjuguer.com/",
                        "https://www.richmorning.com/",
                        "https://www.thewordofthemonth.com/",
                        "https://www.anglais-cpf.fr/",
                        "https://www.comment-utiliser-son-cpf.fr/",
                        "https://www.gymglish.com/fr/studio",
                        "http://www.anglais-conjugaison.com/",
                        "https://www.delavignecorp.com/"]

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websiteNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListViewCell
        cell.webPageName.text = websiteNames[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let webViewController = storyboard.instantiateViewController(withIdentifier: "webview") as! WebViewController
        webViewController.websiteLink = websiteLinks[indexPath.row]
        self.navigationController?.pushViewController(webViewController, animated: true)

    }
}
