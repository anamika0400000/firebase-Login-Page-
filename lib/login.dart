import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/Home.dart';
import 'package:flutter_application_6/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController Pass1 = TextEditingController();
    TextEditingController email1 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text("Login Page"),
          automaticallyImplyLeading: false),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                  controller: email1,
                  decoration: InputDecoration(
                      hintText: "Mail Id", border: OutlineInputBorder())),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: Pass1,
                decoration: InputDecoration(
                    hintText: "Password", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // ignore: unused_local_variable
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email1.text, password: Pass1.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePAge();
                    }));
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
                },
                child: Text('Login'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Dont Have an account "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Signup_Page();
                      }));
                    },
                    child: Text("Signup"),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
