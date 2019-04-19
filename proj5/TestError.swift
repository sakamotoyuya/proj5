//
//  TestError.swift
//  proj5
//
//  Created by sakamotoyuya on 2019/04/17.
//  Copyright © 2019 sakamotoyuya. All rights reserved.
//

import UIKit
let hani = 0 ... 1000000

/// 独自エラーをthrowさせるにはErrorを継承させる必要がある
enum NumError:Error{
    case over
    case under
}

class TestError: NSObject {
    
    /// 入力値が0から10かチェックする
    ///
    /// - Parameter num: 入力値を指定する
    /// - Throws: 入力値が範囲外(範囲：0 < 入力値 < 10)の場合NumErrorを投げる
    private func check(_ num:Int) throws{
        if(num > 10){
            throw NumError.over
        }else if(num < 0){
            throw NumError.under
        }
    }
    
    /// 入力値にプラス1する
    ///
    /// - Parameter num: 値を指定する
    /// - Returns: 入力値+1した値を返却する
    /// - Throws:入力値が範囲外(範囲：0 < 入力値 < 10)の場合NumErrorを投げる
    func plusOne(_ num:Int) throws -> Int{
        /* 伝播させる確認 */
        try check(num)
        let result = num + 1
        for _ in hani{
            let atai = 1
            _ = try check(atai)
        }
        return result
    }
    
}
