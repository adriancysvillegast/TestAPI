//
//  HomeViewModel.swift
//  test
//
//  Created by Adriancys Jesus Villegas Toro on 23/2/24.
//

import Foundation
protocol HomeViewModelDelegate : AnyObject {
    func updateView(values: Set<ChurkModal>)
}
class HomeViewModel {
    
    // MARK: - properties
    
    let url: String = "https://api.chucknorris.io/jokes/random"
    var arrayJokes : Set<ChurkModal> = []
    private let apiManager: APIManager
    weak var delegate: HomeViewModelDelegate?
    
    // MARK: - Init
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    
     // MARK: - methods
    
    func getData() {
        Task {
            while arrayJokes.count < 16 {
                do {
                    let joke = try await apiManager.getData()
                    arrayJokes.insert(joke)
                    print(arrayJokes.count)
                } catch APIError.errorUrl {
                    print("error url")
                }catch APIError.errorApi {
                    print("error API")
                }catch {
                    print("error")
                }
            }
            
            if arrayJokes.count >= 16 {
                delegate?.updateView(values: arrayJokes)
            }
        }
    }
    
}
