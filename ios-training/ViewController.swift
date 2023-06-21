//
//  ViewController.swift
//  ios-training
//
//  Created by 小木曽佑介 on 2023/06/20.
//

import UIKit
import YumemiWeather

class ViewController: UIViewController {



    @IBOutlet weak var weatherImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func reloadButtomTapped(_ sender: UIButton) {
        Task {
            guard let result = await fetchWeather() else { return }

            switch result {
            case "sunny":
                weatherImageView.image = UIImage(named: "Sunny")
                weatherImageView.tintColor = .red
            case "cloudy":
                weatherImageView.image = UIImage(named: "Cloudy")
                weatherImageView.tintColor = .gray
            case "rainy":
                weatherImageView.image = UIImage(named: "Rainy")
                weatherImageView.tintColor = .blue
            default:
                return
            }
        }
    }

    func fetchWeather() async -> String? {
        let result = try? YumemiWeather.fetchWeatherCondition(at: "tokyo")
        return result
    }






}

