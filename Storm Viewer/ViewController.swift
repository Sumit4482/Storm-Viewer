//
//  ViewController.swift
//  Storm Viewer
//
//  Created by E5000855 on 03/06/24.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()

    
    override func viewDidLoad() {
        self.navigationItem.title = "Strom Viewer"
        super.viewDidLoad()
        pictures = ["img1", "img2", "img3","img4","img5","img6","img7","img8","img9","img10"]
     
        
        //THis code is iterating through the main bundle of the app
        // here we are directly access the images in the assets folder
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
//        print(items)
//        for item in items{
//            if item.hasPrefix("img"){
//                pictures.append(item)
//                
//            }
//        }
        print(pictures)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      print("View Will Appear Called")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        print("View Will Disappear  Called")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

