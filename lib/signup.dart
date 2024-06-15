import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_6/Home.dart';
import 'package:flutter_application_6/login.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController Pass = TextEditingController();
    TextEditingController email = TextEditingController();
    return Scaffold(
        appBar: AppBar( backgroundColor: Colors.white70,title: Text("Signup"), automaticallyImplyLeading: false),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Email',border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: Pass,
                decoration: InputDecoration(hintText: 'Password',border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var users = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email.text, password: Pass.text);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePAge();
                      },
                    ));
                    print(users);
                  },
                  child: Text('Sign up')),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have a account "),
                  TextButton(
                      onPressed: () {
                        Navigator.push((context),
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: Text("Login"))
                ],
              )
            ],
          ),
        ));
  }
}
