//
//  ViewController.swift
//  TableViewInTableHeaderView
//
//  Created by Alexey Ivanov on 30.08.16.
//  Copyright © 2016 Alexey Ivanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeaderViewHeightConstraint: NSLayoutConstraint!
    
    lazy var innerTableViewController: InnerTableViewController! = {
        return self.childViewControllers.first as! InnerTableViewController
    }()
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tableHeaderViewHeightConstraint.constant = innerTableViewController.tableView.contentSize.height
        self.tableView.resizeTableHeaderView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

extension UITableView {
    
    func resizeTableHeaderView(){
        if let headerView = self.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
            var frame = headerView.frame
            frame.size.height = height
            headerView.frame = frame
            self.tableHeaderView = headerView
            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "dynamic cell row \((indexPath as NSIndexPath).row)"
        
        return cell
    }
}

