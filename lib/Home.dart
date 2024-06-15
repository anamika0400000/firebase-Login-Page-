import 'package:flutter/material.dart';
import 'package:flutter_application_6/login.dart';
import 'package:flutter_application_6/signup.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.push((context), MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            },
          )
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.push((context), MaterialPageRoute(builder: (context) {
                  return Signup_Page();
                }));
              },
            );
          },
        ),
      ),
      body: Center(
        child: Text(
          "Hello, Wellcome",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
