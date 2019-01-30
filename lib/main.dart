import 'package:flutter/material.dart';
import 'package:flutter_app_signup_login/login_signup/auth.dart';
import 'root_page/root_page.dart';
void main(){
  runApp(new MyApp());



}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter login page',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(auth: new Auth()),
    );
  }
}

