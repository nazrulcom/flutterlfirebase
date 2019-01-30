import 'package:flutter/material.dart';
import 'package:flutter_app_signup_login/login_signup/auth.dart';

class LoginPage extends StatefulWidget {

  LoginPage({this.auth,this.onSignIn});
  final BaseAuth auth;
  final VoidCallback onSignIn;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();

}

enum FormType{

  login,
  register
}


class _LoginPageState extends State<LoginPage>{

  final formKey=new GlobalKey<FormState>();


  String _email;
  String _password;
 FormType _formType = FormType.login;


  bool validateAndSave(){

    final form=formKey.currentState;

    if(form.validate()) {
      form.save();

   return true;
    }
    return false;


  }

  // data su

  void validateSubmitData() async{

    if(validateAndSave()) {

      try {

        if(_formType==FormType.login) {
         String userId= await widget.auth.signInWithEmailAndPassword(_email, _password);

          print('Signin user: $userId');
        }else{

          String userId= await widget.auth.createUserWithEmailAndPassword(_email, _password);

          print('Register user: $userId');

        }

        widget.onSignIn();
      }catch (e) {

        print('Erro:$e');

      }
    }
  }

  void moveToRegistration(){
formKey.currentState.reset();

    setState(() {
      _formType=FormType.register;


    });

  }

  void moveToLogin(){
    formKey.currentState.reset();

    setState(() {
      _formType=FormType.login;


    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Login Page'),
        ),
        body: new Container(
          padding: EdgeInsets.all(16.0),
            child: new Form(

              key: formKey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildInputs()+buildSubmitButtons(),
                  
                ))
        )
    );
  }

  List<Widget> buildInputs(){

    return [ new TextFormField(
      decoration: new InputDecoration(labelText: 'Email'),
      validator: (value)=>value.isEmpty ? 'Email can\'t be empty':null,
      onSaved: (value)=>_email=value,

    ),
    new TextFormField(
      decoration: new InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value)=>value.isEmpty ? 'Password can\'t be empty':null,
      onSaved: (value)=>_password=value,


    ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
            child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
            onPressed: validateSubmitData),


        new FlatButton(
          child: new Text(
              'Create an account', style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToRegistration,
        )

      ];
    } else {
      return [
        new RaisedButton(
            child: new Text('Create an account', style: new TextStyle(fontSize: 20.0)),
            onPressed: validateSubmitData),


        new FlatButton(
          child: new Text(
              'Have an account ? Login', style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        )


      ];
    }
  }
}