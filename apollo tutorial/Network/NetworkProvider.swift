//
//  NetworkRepository.swift
//  apollo tutorial
//
//  Created by Aleksey on 03.08.2022.
//

import Foundation
import Apollo

class NetworkProvider {
  
  // MARK: - Types
  enum Errors: String, Error, LocalizedError {
    case couldNotGetData = "Could not get data"
    var errorDescription: String? { return rawValue }
  }
  
  // MARK: - Proporties
  private lazy var apollo = ApolloClient(url: Network.endpoint)
  
  // MARK: - Functions
  @discardableResult
  func fetch<Query: GraphQLQuery>(query: Query, completion: @escaping ((Network.Result<Query.Data>) -> Void)) -> Cancellable {
    print("🌍 fetch: \(query.operationName)")
    let fetch = apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
      switch result {
      case .success(let graphResult):
        if let error = graphResult.errors?.first {
          print("🌍⚠️ fetch error: \(query.operationName)")
          completion(.error(error))
          return
        }
        guard let data = graphResult.data else {
          print("🌍⚠️ fetch error: \(Errors.couldNotGetData)")
          completion(.error(Errors.couldNotGetData))
          return
        }
        print("🌍✅ fetch success: \(query.operationName)")
        completion(.success(data))
      case .failure(let error):
        print("🌍⚠️ fetch error: \(error)")
        completion(.error(error))
      }
    }
    return fetch
  }
  
}
