import 'package:flutter/material.dart';
import 'package:flutter_app_signup_login/login_signup/auth.dart';
class HomePage extends StatelessWidget{

  HomePage({this.auth,this.onSignOut});

  final BaseAuth auth;
  final VoidCallback onSignOut;

  void _signout() async{

    try{

      await auth.signout();
      onSignOut;
    }catch(e){
      print(e);

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome'),
        actions: <Widget>[
          new FlatButton( child: new Text('Logout',style: TextStyle(fontSize: 17.0,color: Colors.white),),
          onPressed: _signout,
          )
        ],
      ),
      body: new Container(
        child: new Center(
          child: new Text('Welcome',style: new TextStyle(fontSize: 32.0),),
        ),
      ),
    );
  }
}