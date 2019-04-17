//
//  ViewController.swift
//  proj5
//
//  Created by sakamotoyuya on 2019/04/17.
//  Copyright © 2019 sakamotoyuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let num = 11
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        test1()
        test2()
        test3()
    }

    /*
     目的
     呼出元で入力した値が正常か異常かを判断して処理をしたい。
     swiftでエラー処理を使用してわかりやすい使い方を考える。
     */
    
    /*
     こちらの場合は値をチェックする処理を別途呼び出す必要がある。
     */
    /// 入力値にプラス1した値を表示する処理
    func test1(){
        let checker = Checker()
        
        //値のチェック処理呼び出し
        let error = checker.check(num)
        //エラーの種別ごとの処理をswitchで実装
        switch error{
        case .over?: break
        //入力値over時の処理
        case .under?: break
        //入力値under時の処理
        case .none:
            //正常時の場合
            let val:Int = checker.plusOne(num)
            print(val)
        }
    }
    
    /*
     こちらの場合は値をチェックする処理の呼び出しは不要。
     */
    /// 入力値にプラス1した値を表示する処理
    func test2(){
        let checker = Checker()
        
        //値のチェック処理呼び出し
        let result:(ErrorCode?,Int) = checker.plusOne(num)
        //エラーの種別ごとの処理をswitchで実装
        switch result.0{
        case .over?: break
        //入力値over時の処理
        case .under?: break
        //入力値under時の処理
        case .none:
            //正常時の場合
            print(result.1)
        }
    }

    /*
     こちらの場合は値をチェックする処理の呼び出しは不要。
     */
    /// 入力値にプラス1した値を表示する処理
    func test3(){
        let checker = TestError()
        do{
            print(try checker.plusOne(num))
        }
            /*
             チェックが正常の場合は以下のルートは通らない
             */
        catch NumError.over{
            //入力値over時の処理
        }catch NumError.under{
            //入力値under時の処理
        }catch{
            /*
             他の例外が起きた時の処理、この場合、本ルートは実際には
             通ることはないが記載しないとビルドエラーとなるため記載する。
             */
        }
    }
}

