//
//  ViewController.swift
//  MovePages
//
//  Created by 권정근 on 1/14/24.
//

import UIKit

class ViewController: UIViewController {
    
    // 라벨 구현
    private var mainLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "메인 화면"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .green
        return label
    }()
    
    
    
    // 버튼 구현
    private var moveToDetailButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        button.backgroundColor = UIColor.green
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        
        // 다음 페이지로 이동 함수
        button.addTarget(Any?.self, action: #selector(moveToDetail), for: .touchUpInside)
        
        return button
    }()
    
    // 버튼 함수 구현
    @objc func moveToDetail() {
        let detailVC = DetailViewController()
        
        detailVC.mainMessage = "성공"
        
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        view.addSubview(mainLabel)
        view.addSubview(moveToDetailButton)
        
        configureConstraints()
    }
    
    // 제약 조건
    func configureConstraints() {
        
        let mainLabelContraints = [
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        let moveToDetailButtonConstraints = [
            moveToDetailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moveToDetailButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            moveToDetailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            moveToDetailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        
        NSLayoutConstraint.activate(mainLabelContraints)
        NSLayoutConstraint.activate(moveToDetailButtonConstraints)
    }
}

