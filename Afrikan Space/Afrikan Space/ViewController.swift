//
//  ViewController.swift
//  Afrikan Space
//
//  Created by Jean Edy on 20.11.2020.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var ShowExternalLink = "true"
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://afrikan.space"
        let request = URLRequest(url: URL(string: url)!)
        self.webView.load(request)
        
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "loading" {
            
            if webView.isLoading {
                
                activityIndicator.startAnimating()
                activityIndicator.isHidden = false
                
            }else {
                
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                
            }
            
        }
        
    }

}
