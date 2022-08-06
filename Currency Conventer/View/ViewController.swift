//
//  ViewController.swift
//  Currency Conventer
//
//  Created by Burak AÇIK on 5.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fromTableView: UITableView!
    @IBOutlet weak var toTableView: UITableView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var symbols = [String]()
    var names = [String]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromTableView.delegate = self
        fromTableView.dataSource = self
        toTableView.delegate = self
        toTableView.dataSource = self
        
        // Symbols
        let semaphore = DispatchSemaphore(value: 0)

        let url = "https://api.apilayer.com/fixer/symbols"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("9GgNBsdcumNqfjhnTxVgK9u3Dgr0H8IZ", forHTTPHeaderField: "apikey")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                
                DispatchQueue.main.async {
                    if let currency = jsonResponse["symbols"] as? [String : String] {
                        for (key, value) in currency {
                            self.symbols.append(key)
                            self.names.append(value)
                        }
                        self.fromTableView.reloadData()
                        self.toTableView.reloadData()
                    }
                }
            } catch {
                print("error")
            }
            
         // print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        
        
    }
    @IBAction func convertButtonClicked(_ sender: Any) {
        
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == fromTableView {
            return symbols.count
        }else{ //toTableView
            return symbols.count        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == fromTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fromCell", for: indexPath) as! fromTableViewCell
            cell.fromCurrencySybolLabel.text = symbols[indexPath.row]
            cell.fromCurrencyNameLabel.text = names[indexPath.row]
            return cell
        }else{ // toTableView
            let cell = tableView.dequeueReusableCell(withIdentifier: "toCell", for: indexPath) as! toTableViewCell
            cell.toCurrencySymbolLabel.text = symbols[indexPath.row]
            cell.toCurrencyNameLabel.text = names[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == fromTableView {
            
        }
    }
    
    
}
 

