//
//  Network.swift
//  apollo tutorial
//
//  Created by Aleksey on 03.08.2022.
//

import Foundation

enum Network {
  
  static var endpoint: URL {
    return URL(string: "https://countries.trevorblades.com/")!
  }
  
  enum Result<T> {
    case success(T)
    case error(Error)
  }
  
}
