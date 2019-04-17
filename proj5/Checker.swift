//
//  Checker.swift
//  proj5
//
//  Created by sakamotoyuya on 2019/04/17.
//  Copyright © 2019 sakamotoyuya. All rights reserved.
//

import UIKit
enum ErrorCode{
    case over
    case under
}

class Checker: NSObject {
    
    /// 入力値が0から10かチェックする
    ///
    /// - Parameter num: 入力値を指定する
    /// - Returns: 入力値が範囲外(範囲：0 < 入力値 < 10)の場合ErrorCodeを返却する、正常の場合nilとする。
    func check(_ num:Int) -> ErrorCode?{
        var result:ErrorCode?
        if(num > 10){
            result = ErrorCode.over
        }else if(num < 0){
            result = ErrorCode.under
        }
        return result
    }
    
    /// 入力値にプラス1する
    ///
    /// - Parameter num: 値を指定する
    /// - Returns: 入力値+1した値を返却する
    func plusOne(_ num:Int) -> Int{
        let result = num + 1
        for _ in hani{
            let atai = 1
            _ = check(atai)
        }
        return result
    }
    
    /// 入力値にプラス1する
    ///
    /// - Parameter num: 値を指定する
    /// - Returns: 入力値+1した値を返却する
    func plusOne(_ num:Int) -> (ErrorCode?,Int){
        //値のチェック処理呼び出し
        let error = check(num)
        let result = num + 1
        for _ in hani{
            let atai = 1
            _ = check(atai)
        }
        return (error,result)
    }

}
