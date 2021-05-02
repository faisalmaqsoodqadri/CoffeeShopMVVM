//
//  OrderViewModel.swift
//  CoffeOrderMVVM
//
//  Created by Faisal Maqsood Qadri on 01/05/2021.
//

import Foundation

class OrderListViewModel {
  var ordersViewModel = [OrderViewModel]()
  
  init() {
    self.ordersViewModel = [OrderViewModel]()
  }
}

extension OrderListViewModel {
  
  func orderViewModel(at index: Int) -> OrderViewModel {
    return self.ordersViewModel[index]
  }
  
}

struct OrderViewModel {
  let order : Order
  
}

extension OrderViewModel   {
  
  var name : String {
    
    return self.order.name
  
  }
  
  
  var email : String {
    
    return self.order.name
  
  }
  
  
  var type : String {
    
    return self.order.name
  
  }
  
  
  var size : String {
    
    return self.order.name
  
  }
  
  
  
  
  
}


