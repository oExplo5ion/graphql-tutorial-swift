//
//  ViewController.swift
//  apollo tutorial
//
//  Created by Aleksey on 03.08.2022.
//

import UIKit

class ViewController: UIViewController {
  
  let repo = CountryRepository()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    repo.getSpecificCountry { result in
      switch result {
      case .success(let graphResult):
        print("===getSpecificCountry===")
        guard let model = graphResult.country else { return }
        print(model.emoji)
      case .error(let error):
        print(error)
      }
    }
    
    repo.getCountryByCode(code: "US") { result in
      switch result {
      case .success(let graphResult):
        print("===getCountryByCode===")
        guard let model = graphResult.country else { return }
        print(model.emoji)
      case .error(let error):
        print(error)
      }
    }
  }

}

