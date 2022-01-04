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
    @State  var empty_temp = false ;
    @State  var email_valid = false ;
    @State  var username_valid = false ;
    @State  var password_valid = false ;
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
                           Alert(title: Text("WARNING !"), message: Text("all text box should be filled"))
                                                }
                /*.alert(isPresented: $email_valid) {
                           Alert(title: Text("WARNING !"), message: Text("email address not valid pattern "))
                       }
                .alert(isPresented: $password_valid) {
                           Alert(title: Text("WARNING !"), message: Text("password not valid pattern "))
                       }
                .alert(isPresented: $username_valid) {
                    Alert(title: Text("WARNING !"), message: Text("Username not valid pattern "))
                }
            */
            
            }
            Text("Don't have an account ?")
        }.padding()
    }
    func go()
    {

        username_proto(var: username)
        password_proto(var: password)
       email_proto(var: email)

           
    
    }
    
    func username_proto(`var` s1 : String)
    {
        if s1.isEmpty {
            print("it is empty ")
            empty_temp = true
        }
        else
        {
          
        username_valid = isValidUsername(UsernameString: s1)
            print(s1)
        }
        }
    
    func password_proto(`var` s2 : String)
    {  if s2.isEmpty {
        print("it is empty ")
        empty_temp = true
    }
        else
        {
            password_valid = isValidPassword(PasswordString: s2)
        print(s2)
        }
    }
    func email_proto(`var` s3 : String)
    {  if s3.isEmpty {
        print("it is empty ")
        empty_temp = true
    }
        else
        {
            email_valid = isValidEmailAddress(emailAddressString: s3)
            print(s3)
        }
    }
    
    
    func isValidUsername( UsernameString : String) -> Bool
    {
      
      var returnValue3 = false
      let emailRegEx = "[A-Z]"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = UsernameString as NSString
          let results = regex.matches(in: UsernameString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue3 = false
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue3 = false
      }
      
      return  returnValue3
  }

    
    func isValidEmailAddress(emailAddressString: String) -> Bool
    {
      
      var returnValue2 = false
      let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = emailAddressString as NSString
          let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue2 = true
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue2 = true
      }
      
      return  returnValue2
  }

    func isValidPassword(PasswordString: String) -> Bool {
      
      var returnValue1 = false
        var emailRegEx = "[A-Z]"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = PasswordString as NSString
          let results = regex.matches(in: PasswordString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue1 = true
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue1 = true
      }
        emailRegEx = "[a-z]"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = PasswordString as NSString
            let results = regex.matches(in: PasswordString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue1 = true
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue1 = true
        }
        
        emailRegEx = "[0-9]"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = PasswordString as NSString
            let results = regex.matches(in: PasswordString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue1 = true
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue1 = true
        }
        
        
        if PasswordString.count < 8
        {
            returnValue1 = true
            
        }
        
      return  returnValue1
  }
    
    
   
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
