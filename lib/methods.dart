import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<User?> creatAccount(String email, String password, String confirmPassword) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      if (user != Null && password == confirmPassword){
        print("Signup successful");
        return user;
      }
      else{
        print("Signup unsuccessful");
        return user;
      }

      
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<User?> loginUsingEmailPassword({ required String email, required String password}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential  usercredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = usercredential.user; 
    } on FirebaseAuthException catch(e){
      if (e.code == "user-not-found"){
        print("No user found for that email");
      }
    }
    return user;
  }

  