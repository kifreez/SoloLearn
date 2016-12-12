//
//  ItemTableViewController.swift
//  Sololearn
//
//  Created by Kif on 08.12.16.
//  Copyright © 2016 KifApp. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {

    var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()

//        loadSampleItems()

        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func unwindToList(sender:UIStoryboardSegue){
        let srcViewCon = sender.source as? ViewController
        let item = srcViewCon?.item
        if srcViewCon != nil && item?.name != "" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                //Update an exesting meal
                items[selectedIndexPath.row] = item!
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
            let newIndexPath = NSIndexPath(row: items.count, section: 0)
            items.append(item!)
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
            }
        saveItems()
        }
    }
/*
    func loadSampleItems() {
        items += [Item(name:"Item1"), Item(name:"Item2"), Item(name:"Item3")]
    }
*/
    func saveItems() {
        let isSaved = NSKeyedArchiver.archiveRootObject(items, toFile: Item.ArchiveURL.path)
        if !isSaved {
            print("Failed to save item!")
        }
    }

    func loadItems() -> [Item]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Item.ArchiveURL.path) as? [Item]
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "itemTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier, for: indexPath) as! itemTableViewCell
        let item = items[indexPath.row]

        cell.nameLabel.text = item.name

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destination as? ViewController

            if let selectedCell = sender as? itemTableViewCell{
                let indexPath = tableView.indexPath(for: selectedCell)!
                let selectedItem = items[indexPath.row]
                detailVC?.item = selectedItem
            }

        } else if segue.identifier == "AddItem" {

        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: indexPath.row)
            saveItems()
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

}
