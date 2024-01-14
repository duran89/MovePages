//
//  DetailViewController.swift
//  MovePages
//
//  Created by 권정근 on 1/14/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: 메인 페이지에서 데이터 받을 변수
    // MARK: 데이터를 주고 받을 때는 변수를 통할 것
    var mainMessage: String?

    
    // 디테일 라벨 설정
    private var detailLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .green
        return label
    }()
    
    // 버튼 구현
    private var BackToMainButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        button.backgroundColor = UIColor.green
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        
        // 버튼 함수 구현
        button.addTarget(Any?.self, action: #selector(backToMain), for: .touchUpInside)
        return button
    }()
    
    // 버튼 함수
    @objc func backToMain() {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        view.addSubview(detailLabel)
        view.addSubview(BackToMainButton)
        
        detailLabel.text = mainMessage
        configureConstraints()
    }
    
    // 제약 조건
    func configureConstraints() {
        
        let detailLabelContraints = [
            detailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        let moveToDetailButtonConstraints = [
            BackToMainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            BackToMainButton.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 20),
            BackToMainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            BackToMainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        
        NSLayoutConstraint.activate(detailLabelContraints)
        NSLayoutConstraint.activate(moveToDetailButtonConstraints)
    }
}
