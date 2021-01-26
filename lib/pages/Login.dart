import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter login demo",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 75),
            child: Center(
              child: FlutterLogo(
                size: 75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 11),
                  prefixIcon: Icon(

                    Icons.email,size: 20,
                    color: Colors.grey,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 11),
                  prefixIcon: Icon(
                    Icons.https,size: 20,
                    color: Colors.grey,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                child: Center(
                  child: Text('Login',style: TextStyle(color: Colors.white),),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),

            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Create an account",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
