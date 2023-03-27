//
//  ViewController.swift
//  getapicalling
//
//  Created by R93 on 28/03/23.
//

import UIKit

struct getapi: Codable
{
    var userId: Int
    var id : Int
    var title: String
    var body : String
}


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    var array : [getapi] = []

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       getdata()
    }
    
    func getdata()
    {
        let url = URL(string:"https://jsonplaceholder.typicode.com/posts")
        var ur = URLRequest(url:url!)
        ur.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: ur) { data, response, error in
            do {
                if error == nil
                {
                    self.array = try JSONDecoder().decode([getapi].self, from: data!)
                    print(self.array)
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.label1.text = "\(array[indexPath.row])"
        cell.label2.text = "\(array[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


}

