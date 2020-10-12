//
//  LoginViewController.swift
//  Brinquedo
//
//  Created by COTEMIG on 08/10/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var txt_senha: UITextField!
    @IBOutlet weak var txt_nome: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func Login(_ sender: Any) {
        guard let txt_nome = txt_nome.text,
            !txt_nome.isEmpty,
            let txt_senha = txt_senha.text,
            !txt_senha.isEmpty else{
                
                let alert = UIAlertController(title: "Oops!", message: "Insira valores vlidos", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                present(alert, animated: true)
            return
        }
        
      
        
        
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon/"){
             var   urlRequest = URLRequest(url: url)
            
            
            let parametros = ["user": txt_nome,
                              "senha": txt_senha
            ]
            
            do{
                let jsondata = try JSONSerialization.data(withJSONObject: parametros, options: .prettyPrinted)
                urlRequest.httpBody = jsondata
            }catch{
                print("Erro de parse")
            }
            
           
            
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "content=type")
            
            
            URLSession.shared.dataTask(with: urlRequest) {(data, reponse, error)
                if let data = data{
                    
                    DispatchQueue.main.async {
                      
                   performSegue(withIdentifier: "LoginSegue", sender: nil)
                    }
                }
                
                }.resume()
        }
        
    }
    
    
    
    
    
}
