//
//  MainViewModel.swift
//  DaliyPicture
//
//  Created by guhui on 2022/10/19.
//

import Foundation
import Combine
import Alamofire
import UIKit

class MainViewModel : ObservableObject{
    @Published var message = "no data"
    @Published var image: UIImage? = nil
    
    private var cancelable = Set<AnyCancellable>()
    
    private func loadFoo() -> AnyPublisher<String,AFError> {
       return AF.request("https://httpbin.org/get?foo=bar")
                .validate(statusCode: 200..<300)
                .publishString()
                .value()
    }
    
    private func loadDaliyPictureJson() -> AnyPublisher<BingResponse,AFError> {
        return AF.request("https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN")
            .validate(statusCode: 200..<300)
            .publishDecodable(type:BingResponse.self)
            .value()
    }
    
    private func loadImage(_ imageUrl:String) -> AnyPublisher<UIImage?,AFError>{
        return AF.request(imageUrl)
            .validate(statusCode: [200])
            .publishData()
            .value()
            .map {
                UIImage(data: $0)
            }
            .eraseToAnyPublisher()
    }
            
    
    func load() {
        loadDaliyPictureJson()
            .flatMap {
                [unowned self] r -> AnyPublisher<UIImage?,AFError>in
                self.message = r.images[0].title
                let imageUrl = ("https://cn.bing.com\(r.images[0].url)") 
                return self.loadImage(imageUrl)
            }
            .sink {
                [weak self] result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    self?.message = error.localizedDescription
                }
            }
            receiveValue:{
                [unowned self] res in
                self.image = res
            }
            .store(in: &cancelable)
            
    }
}
