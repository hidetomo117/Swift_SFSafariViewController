//
//  ViewController.swift
//  Swift_SFSafariViewController
//
//  Created by hidetomo on 2019/05/25.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit
import SafariServices

final class MainViewController: UIViewController {

    // MARK:- View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func tappedSafariButton(_ sender: UIButton) {
        openSafariViewController()
    }
}

// MARK: - Private method

private extension MainViewController {

    private func openSafariViewController () {
     
        let googleUrl = NSURL(string: "https://www.google.co.jp/")
        
        guard let url = googleUrl, let absoluteURL = url.absoluteURL else {
            fatalError()
        }
        
        let vc = SFSafariViewController(url: absoluteURL)
        vc.delegate = self
        
        present(vc, animated: false, completion: nil)
    }
}

// MARK: SFSafariViewControllerDelegate

extension MainViewController: SFSafariViewControllerDelegate {
    
    /// ユーザーアクションによりViewControllerがUIActivityViewControllerを表示しようとしている場合に呼び出し(UIActivityをカスタムできる)
    func safariViewController(_ controller: SFSafariViewController, activityItemsFor URL: URL, title: String?) -> [UIActivity] {
        return [UIActivity()]
    }
    
    /// ユーザーアクションによりViewControllerがUIActivityViewControllerを表示しようとしている場合に呼び出し(特定のUIActivityTypeを除外できる)
    func safariViewController(_ controller: SFSafariViewController, excludedActivityTypesFor URL: URL, title: String?) -> [UIActivity.ActivityType] {
        // 除外したいActivityTypeを配列で返却する(以下の場合はリーディングリストを除外)
        return [UIActivity.ActivityType.addToReadingList]
    }

    /// 完了ボタン押下
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
    }

    /// 読み込み完了
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
    }

    /// 初期ページのロード中にブラウザが別のURLにリダイレクトされた場合に呼び出し
    func safariViewController(_ controller: SFSafariViewController, initialLoadDidRedirectTo URL: URL) {
    }
}
