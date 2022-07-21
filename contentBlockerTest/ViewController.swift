//
//  ViewController.swift
//  contentBlockerTest
//
//  Created by Daniyal Dehleh on 2022-07-21.
//

import SafariServices
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reload()
    }

    
    
    func reload(){
        SFContentBlockerManager.getStateOfContentBlocker(withIdentifier: "contentBlockerTest.contentBlockerTest.contentBlocker") { (state, error) in
            guard let stateValue = state else { return }
            print(stateValue)
            if stateValue.isEnabled {
                print("content blocker extension is enabled")
                SFContentBlockerManager.reloadContentBlocker(withIdentifier:"contentBlockerTest.contentBlockerTest.contentBlocker"){
                    error in guard error == nil else{
                        print("failed to reload content blocker", error!)
                        return
                    }
                    print("successfuly reloaded content blocker")
                }
                
            }
            else{
                print("content blocker state not enabled from settings")
            }
            
        }

}

}
