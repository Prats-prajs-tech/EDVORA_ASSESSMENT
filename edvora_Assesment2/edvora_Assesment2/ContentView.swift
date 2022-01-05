//
//  ContentView.swift
//  edvora_Assesment2
//
//  Created by ppratik on 04/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack
        {
            
            Image("1")
            user_pass_email()
    
        
        }
        
    }
}


struct user_pass_email : View
{
    @State  var username: String = "" ;
    @State  var password: String = "" ;
    @State  var email: String = "" ;
    @State  var value1 : Int = 0 ;

    @State  var empty_temp = false ;
    @State  var email_valid: Int = 0 ;
    @State  var username_valid : Int = 0 ;
    @State  var password_valid : Int = 0 ;
    let lightGreyColor = Color(red: 239.0/255.0 , green: 243.0/255.0 , blue: 244.0/255.0)
   // var v1 = UILabel()
  var body: some View
    {
        VStack{
           
            TextField("text field", text: $username)
                .border(.secondary)
                .cornerRadius(5.0)
                .background(lightGreyColor)
                SecureField("password", text:$password)
                .border(.secondary)
                .cornerRadius(5.0)
                .background(lightGreyColor)
            TextField("email", text: $email)
                .border(.secondary)
                .cornerRadius(5.0)
                .background(lightGreyColor)
            Label("Forgotten password?",systemImage: "")
            ZStack{
            Text("LOGIN")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.brown)
                            .cornerRadius(15.0)
                Button("", action: go)
                
                .frame(width: 302, height: 52)
                .buttonStyle(.bordered)
                
                .alert(isPresented: $empty_temp) {
                    switch value1
                    {
                    case 1:     return Alert(title: Text("WARNING !"), message: Text("all text box should be filled"))
                          
                        
                    case 4: return Alert(title: Text("WARNING !"), message: Text("email address not valid pattern "))
                        
                    case 3: return  Alert(title: Text("WARNING !"), message: Text("password not valid pattern "))
                        
                        
                    case 2: return   Alert(title: Text("WARNING !"), message: Text("Username not valid pattern "))
                   
                    default:
                        return Alert(title: Text("WARNING !"), message: Text(" no "))
                    }
                
                }
            
            
            }
            Text("Don't have an account ?")
        }.padding()
    }
    func go()
    {
        empty_temp = false
        if username.isEmpty{
            empty_temp = true
            value1 = 1
        }
       else if password.isEmpty{
            empty_temp = true
            value1 = 1
        }
       else if password.isEmpty{
            empty_temp = true
            value1 = 1
        }
        else{
        username_proto(var: username)
        password_proto(var: password)
       email_proto(var: email)
        }
           
    
    }
    
    func username_proto( var s1 : String)
    {
        username_valid = isValidUsername(UsernameString: s1)
        if username_valid == 1
        {
            empty_temp = true

         value1 = 2
            
        }
            print(s1)
    }
    func password_proto(var s2 : String)
    {
        password_valid = isValidPassword(PasswordString: s2)
        if password_valid == 1
        {            empty_temp = true

         value1 = 3
        }
        print(s2)
    }
    func email_proto(var s3 : String)
    {
            email_valid = isValidEmailAddress(emailAddressString: s3)
        if email_valid == 1
        {            empty_temp = true

         value1 = 4
        }
            print(s3)
    }
    
    func isValidUsername( UsernameString : String) -> Int
    {
      var returnValue3 = 1
      let emailRegEx = "[A-Z]"
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = UsernameString as NSString
          let results = regex.matches(in: UsernameString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue3 = 0
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue3 = 0
      }
      
      return  returnValue3
  }

    
    func isValidEmailAddress(emailAddressString: String) -> Int
    {
      
      var returnValue2 = 0
      let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = emailAddressString as NSString
          let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue2 = 1
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue2 = 1
      }
      
      return  returnValue2
  }

    func isValidPassword(PasswordString: String) -> Int {
      
      var returnValue1 = 0
        var emailRegEx = "[A-Z]"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = PasswordString as NSString
          let results = regex.matches(in: PasswordString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue1 = 1
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue1 = 1
      }
        emailRegEx = "[a-z]"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = PasswordString as NSString
            let results = regex.matches(in: PasswordString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue1 = 1
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue1 = 1
        }
        
        emailRegEx = "[0-9]"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = PasswordString as NSString
            let results = regex.matches(in: PasswordString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue1 = 1
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue1 = 1
        }
        
        
        if PasswordString.count < 8
        {
            returnValue1 = 1
            
        }
        
      return  returnValue1
  }
    
    
   
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
