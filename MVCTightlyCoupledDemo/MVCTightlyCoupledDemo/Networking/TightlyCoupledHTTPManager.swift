//
//  TightlyCoupledHTTPManager.swift
//  MVCTightlyCoupledDemo
//
//  Created by Jyoti on 24/08/2022.
//

import Foundation
class TightlyCoupledManager {
    var data = Data()
    public func geturl(urlString : String) {
        let urlObj = URL(string: urlString)
        if let usableURL = urlObj {
            let request = URLRequest(url: usableURL)
            let task = URLSession.shared.dataTask(with: request) { data, response, Error in
                self.data = data!
                print(data!)
            }
            task.resume()
        }
    }
}
