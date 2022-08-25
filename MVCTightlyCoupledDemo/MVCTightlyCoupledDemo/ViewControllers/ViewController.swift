//
//  ViewController.swift
//  MVCTightlyCoupledDemo
//
//  Created by Jyoti on 24/08/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelDownloaded: UILabel!
    var dataDownloaded = 0 {
        didSet {
            DispatchQueue.main.async(execute : {
                [weak self] () -> Void in
                guard let  self = self else {return}
                self.labelDownloaded.text = "Objects downloaded : \(self.dataDownloaded)"
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAPICallClicked(_ sender: UIButton) {
        let httpManager = TightlyCoupledManager()
        httpManager.geturl(urlString: baseUrl + breachesExtensionURL)
        dataDownloaded += httpManager.data.count
    }
}

