import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_trialroom/screens/profile_screen.dart';
import 'package:flutter_app_trialroom/screens/signup_page.dart';

import 'methods.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(), 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return LoginScreen();
          } 
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
      );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 
  

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          
      
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
                // ignore: prefer_const_constructors
                Center(
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 48,
                      color: Colors.black,
                    ),),
                ), 
                
                const SizedBox(
                  height: 80,
                ),
      
               /* Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: const Text(
                    "EMAIL",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black,
                    ),),
                ), */
      
                  TextField(
                    controller: emailController,

                   

                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Color.fromARGB(255, 0, 0, 0),
                    cursorHeight: 25,
                    
                     decoration: InputDecoration(
                       fillColor: Color.fromARGB(255, 145, 71, 71),
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Color.fromARGB(255, 193, 114, 114), width: 2),
                         borderRadius: BorderRadius.circular(10.0)
                       ),
                       hintText: "Email",
                       prefixIcon: Icon(Icons.mail, color: Colors.black,),
      )),
                       
          
                  
                    
                 const SizedBox(
                   height: 50,
                 ), 
                  
                
               /* Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: const Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black,
                    ),),
                ), */
      
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
                       hintText: "Password",
                       prefixIcon: Icon(Icons.lock, color: Colors.black,),
                       
                     ),
                  ),
              
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black,
                        ),),
      
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUp()),
                            );
                          }, 
                          child: const Text(
                              "Signup",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.black,
                              ),),)
                    ],
                  ),
                ),
      
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        
                        onPressed: () async{
                          User? user = await loginUsingEmailPassword(email: emailController.text, password: passwordController.text);
                          if(user != null){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => ProfileScreen()),
                            );
                          }
                        }, 
                        child: const Text(
                          "    Login    ",
                          style: TextStyle(color: Color.fromARGB(255, 13, 14, 14) ,fontSize: 19, fontWeight: FontWeight.bold,),),
                          style: ElevatedButton.styleFrom(primary: const Color.fromRGBO(255, 222, 218, 1)),
                        
                        ),
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

