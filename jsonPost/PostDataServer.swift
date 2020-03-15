//
//  File.swift
//  JSON
//
//  Created by test1 on 3/11/20.
//  Copyright © 2020 test1. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

//categry dataSever THIS IS THE LINK WHERE I'LL BE GETTING MY POSTS FROM JSON FILE
typealias CompletionHandler2 = (_ Success: Bool) -> ()
let API_URL2 = "http://blog-api.turathalanbiaa.com/api/posttpagination"


class PostDataServer {
    
    static let instance = PostDataServer()
    var posts =  [Post]()
    
    
    func fetchAllPosts(completion: @escaping CompletionHandler2){
        Alamofire.request(API_URL2).responseJSON { response in
            if response.error == nil {
                
                guard let data = response.data else { return }
                do {
                    let json =  try JSON(data: data)
                    let responseCode = response.response?.statusCode
                    if responseCode == 200 {
                        self.clearPosts()
                        let PostsArray:[JSON] = json.arrayValue
                        for posts in PostsArray {
                            let id = posts["id"].intValue
                            let name = posts["name"].stringValue
                            let userId = posts["userId"].stringValue
                            let title = posts["title"].stringValue
                            let content = posts["content"].stringValue
                            let image = posts["image"].stringValue
                            let categoryId = posts["categoryId"].stringValue
                            let tags = posts["tags"].stringValue
                            let picture = posts["picture"].stringValue
                            let rate = posts["rate"].intValue
                            let view = posts["view"].intValue
                            let status = posts["status"].intValue
                            
                           let posts = Post(userId: userId, id: id, title: title, content: content, image: image, categoryId: categoryId, tags: tags, name: name, picture: picture, rate: rate, view: view, status: status)
                            self.posts.append(posts)
                            completion(true)
                        }
                    }else{
                        completion(false)
                    }
                }catch {
                    completion(false)
                }
            }else{
                completion(false)
            }
        }
    }
    
    
    func clearPosts(){
        self.posts.removeAll()
    }
    
    
}
