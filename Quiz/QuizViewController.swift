//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [[Any]]()
        
        //------------------------ここから下にクイズを書く------------------------//
        tmpArray.append(["しんのすけの好きな食べ物は？", "チョコビ", "ハンバーグ", "ピーマン", 2])
        tmpArray.append(["しんのすけがリアルおままごと好んでよくする遊びは？", "リアルおままごと", "おにごっこ", "変身ごっこ",4])
        tmpArray.append(["しんのすけの母、みさえの年齢は?","２２歳", "２９歳", "３１歳", 3])
        tmpArray.append(["しんのすけの母、みさえの短所は？", "酒癖が悪い", "体力がない", "金使いが荒い",2])
        tmpArray.append(["しんのすけの父、ひろしのは働いている職場は？", "海山商事", "双葉商事", "春日部商事",3])
        tmpArray.append(["しんのすけの父、ひろしの好きな食べ物は？", "うどん", "肉じゃが", "グラタン", 3])
        tmpArray.append(["しんのすけが実名げ挙げた好みの女性は？", "ローラ", "北川景子", "深田恭子", 4])
        tmpArray.append(["しんのすけの年齢は？","5歳","１２歳","７歳",2])
        tmpArray.append(["しんのすけの特技は？","英語","お尻芸","車の運転",2])
        tmpArray.append(["しんのすけの妹の誕生日は？","２月４日","３月３日","９月２７日",4])
        
        //------------------------ここから上にクイズを書く------------------------//
        
        quizArray = tmpArray.shuffled()
        // 問題をシャッフルしてquizArrayに格納する
        
        
        while (tmpArray.count > 0) {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        choiceQuiz()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
    
    
    
}


