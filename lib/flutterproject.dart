import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("flutter project"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          elevation: 0,
        ),
        backgroundColor: Colors.blueAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: Image.network("https://image.freepik.com/free-vector/eye-camera-logo_53295-268.jpg"),
                color: Colors.red,
                height: 300,
                width: 100,
              ),
            ),
            Text("Welcome")
          ],
        )
    );
  }
}

class firstflutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.yellow,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Container(
                    child: Image.network("https://image.shutterstock.com/image-vector/happy-cartoon-puppy-sitting-portrait-260nw-582282628.jpg",
                      height: 20,
                      width: 20,
                    ),
                    height: 300,
                    width: 300,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(150)
                    ),
                  ),
                ),
              ],
            ),
          )
      );


  }
}