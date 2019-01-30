import 'package:flutter/material.dart';
import 'package:flutter_app_signup_login/login_signup/auth.dart';
import 'package:flutter_app_signup_login/login_signup/login_page.dart';
import 'package:flutter_app_signup_login/home_page/home_page.dart';

class RootPage extends StatefulWidget{

  RootPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _RootPage();
}

enum AuthStatus{

  notSignIn,
  signIn
}


class _RootPage extends State<RootPage>{

  AuthStatus authStatus=AuthStatus.notSignIn;



  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId){

      setState(() {
        authStatus=userId==null ? AuthStatus.notSignIn: AuthStatus.signIn;

      });


    });
  }

  void _signIn(){

    setState(() {

      authStatus=AuthStatus.signIn;
    });

  }
  void _signOut(){

    setState(() {

      authStatus=AuthStatus.notSignIn;
    });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch(authStatus) {
      case AuthStatus.notSignIn:

        return new LoginPage(
            auth: widget.auth,
            onSignIn: _signIn,
        );


      case AuthStatus.signIn:

        return new HomePage(
          auth: widget.auth,
          onSignOut: _signOut,
        );
    }

  }
}