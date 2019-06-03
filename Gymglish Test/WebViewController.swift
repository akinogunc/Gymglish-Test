//
//  WebViewController.swift
//  Gymglish Test
//
//  Created by AKIN on 3.06.2019.
//  Copyright © 2019 AKIN. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var websiteLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string : websiteLink)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
