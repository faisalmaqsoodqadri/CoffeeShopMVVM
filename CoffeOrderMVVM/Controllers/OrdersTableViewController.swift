//
//  OrdersTableviewController.swift
//  CoffeOrderMVVM
//
//  Created by Faisal Maqsood Qadri on 29/04/2021.
//

import Foundation
import UIKit

class OrdersTableViewController : UITableViewController {
 
  
  
  var orderListViewModel = OrderListViewModel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    populateOrders()
  }
  
  
  func populateOrders() {
    
    guard let coffeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
      
      fatalError("URL issue")
  }
    
    
    let resource = Resource<[Order]> (url: coffeOrdersURL)
    
    WebService().load(resource: resource) {[weak self] result in
      
      switch result {
      case .success(let orders):
       
        self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
        self?.tableView.reloadData()
        
        
      case .failure(let error):
        print(error)
      
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return orderListViewModel.ordersViewModel.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let vm = self.orderListViewModel.orderViewModel(at: indexPath)
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableviewCell", for: indexPath)
    
    
    
    return cell
    
  }
  
}
