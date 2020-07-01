//
//  ViewController.swift
//  AlamofireTest
//
//  Created by Yuki Shinohara on 2020/06/30.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit
//import Alamofire

class ViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    private let netWorkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func executeRequest(_ sender: Any) {
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        netWorkingClient.execute(urlToExecute) { (json, error) in
//            typealias WebServiceResponse = ([[String:Any]]?, Error?) -> Void
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
    }
    
}

