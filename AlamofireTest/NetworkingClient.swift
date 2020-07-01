//
//  NetworkingClient.swift
//  AlamofireTest
//
//  Created by Yuki Shinohara on 2020/06/30.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
// 

import Foundation
import Alamofire

class NetworkingClient {
    
    typealias WebServiceResponse = ([[String:Any]]?, Error?) -> Void
    //WebServiceResponseという名前の型を作る
    
    func execute(_ url: URL, completion: @escaping WebServiceResponse){
        
        //execute関数を実行すると取得する値がWebServiceResponseの形になり
        
        AF.request(url).validate().responseJSON { response in
        //受け取ったresponseによってWebServiceResponseの型に情報を流し込む
        //その値を使って表示するのがVCにて行われる
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.value as? [[String:Any]]{
                completion(jsonArray, nil)
            } else if let jsonDict = response.value as? [String:Any]{
                completion([jsonDict], nil)
            }
        }
    }
}
