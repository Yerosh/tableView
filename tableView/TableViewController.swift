//
//  TableViewController.swift
//  tableView
//
//  Created by Yernur Adilbek on 10/16/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array = ["1", "2", "3", "4", "5"]
    
//    var arrayNames = ["Benedict", "Martin", "Mark", "Endrew", "Lara"]
//    var arraySurnames = ["Cumberbatch", "Freeman", "Gatiss", "Scott", "Pulver"]
//    var arrayImage = ["benedict", "martin", "mark", "endrew", "lara"]
    
    var arrayPersons = [Person(name: "Benedict", surname: "Cumberbatch", imageName: "benedict"),
                        Person(name: "Martin", surname: "Freeman", imageName: "martin"),
                        Person(name: "Mark", surname: "Gatiss", imageName: "mark"),
                        Person(name: "Endrew", surname: "Scott", imageName: "endrew"),
                        Person(name: "Lara", surname: "Pulver", imageName: "lara")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        
        let identifier = (indexPath.row % 2 == 0) ? "Cell1" : "Cell2"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
      
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = arrayPersons[indexPath.row].name
        
        let labelSurname = cell.viewWithTag(1002) as! UILabel
        labelSurname.text = arrayPersons[indexPath.row].surname
        
        let imageView = cell.viewWithTag(1003) as! UIImageView
        imageView.image = UIImage(named: arrayPersons[indexPath.row].imageName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.person = arrayPersons[indexPath.row]
        
        navigationController?.show(vc, sender: self)
    }
    
    @IBAction func addPerson(_ sender: Any) {
        arrayPersons.append(Person(name: "Username", surname: "Usersurname", imageName: "avatar"))
        
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            arrayPersons.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
