import 'package:flutter/material.dart';
import 'package:flutter_app_trialroom/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_trialroom/screens/profile_screen.dart';

import '../methods.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController confirmPasswordController = new TextEditingController();

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          
        
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
                // ignore: prefer_const_constructors
                Center(
                  child: const Text(
                    "SIGNUP",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 48,
                      color: Colors.black,
                    ),),
                ), 
                
                const SizedBox(
                  height: 50,
                ),
        
            
        
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Color.fromARGB(255, 0, 0, 0),
                    cursorHeight: 25,
                    
                     decoration: InputDecoration(
                       fillColor: Color.fromRGBO(250, 250, 250, 1),
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Color.fromRGBO(228, 228, 230, 1), width: 2),
                         borderRadius: BorderRadius.circular(10.0)
                       ),
                       hintText: "Email",
                       prefixIcon: Icon(Icons.mail, color: Colors.black,),
        )),
                       
          
                  
                    
                 const SizedBox(
                   height: 30,
                 ), 
                  
                
             
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    cursorColor: Color.fromARGB(255, 0, 0, 0),
                    cursorHeight: 25,
                    
                     decoration: InputDecoration(
                       fillColor: Color.fromRGBO(250, 250, 250, 1),
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Color.fromRGBO(228, 228, 230, 1), width: 2),
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                       hintText: "Create Password",
                       prefixIcon: Icon(Icons.lock, color: Colors.black,),
                       
                     ),
                  ),
        
                  const SizedBox(
                   height: 30,
                 ), 
                  
                
             
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    cursorColor: Color.fromARGB(255, 0, 0, 0),
                    cursorHeight: 25,
                    
                     decoration: InputDecoration(
                       fillColor: Color.fromRGBO(250, 250, 250, 1),
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Color.fromRGBO(228, 228, 230, 1), width: 2),
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                       hintText: "Confirm Password",
                       prefixIcon: Icon(Icons.lock, color: Colors.black,),
                       
                     ),
                  ),
              
                  const SizedBox(
                   height: 30,
                 ), 
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black,
                        ),),
        
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyApp()),
                            );
                          }, 
                          child: const Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.black,
                              ),),)
                    ],
                  ),
        
                  const SizedBox(
                   height: 30,
                 ),
        
                  Center(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        
                        onPressed: () {
                          creatAccount(emailController.text, passwordController.text, confirmPasswordController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: ((context) => const ProfileScreen())),
                          );        
                          }, 
                        child: const Text(
                          "    Signup    ",
                          style: TextStyle(color: Color.fromARGB(255, 13, 14, 14) ,fontSize: 19, fontWeight: FontWeight.bold,),),
                          style: ElevatedButton.styleFrom(primary: const Color.fromRGBO(255, 222, 218, 1)),
                        
                        ),
                    ),
                  ),
                
              
            ],
        ),
          ),
          ),
      ),
    );
  }
}