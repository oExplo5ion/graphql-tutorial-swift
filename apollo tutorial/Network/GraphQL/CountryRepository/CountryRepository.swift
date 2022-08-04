//
//  Apollo.swift
//  apollo tutorial
//
//  Created by Aleksey on 03.08.2022.
//

import Foundation
import Apollo

class CountryRepository: NetworkProvider {
  
  // MARK: - Functions
  func getSpecificCountry(completion: @escaping (Network.Result<SpecifyCountryQuery.Data>) -> Void) {
    fetch(query: SpecifyCountryQuery(), completion: completion)
  }
  
  func getCountryByCode(code: String, completion: @escaping (Network.Result<CountryByCodeQuery.Data>) -> Void) {
    fetch(query: CountryByCodeQuery(code: code), completion: completion)
  }
  
}
