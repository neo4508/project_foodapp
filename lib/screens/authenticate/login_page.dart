import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test2/Database/database_helper.dart';
import 'package:test2/models/user.dart';
import 'package:test2/screens/authenticate/login_presenter.dart';
import 'package:test2/screens/authenticate/register.dart';

import '../../Database/database_helper.dart';
import '../../models/user.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  late BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  late String _username,_password;
  //String _email, _password;

  late LoginPagePresenter _presenter;

  LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _register() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      setState(() {
        _isLoading = true;
        form!.save();
        _presenter.doLogin(_username, _password); //_email
      });
    }
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new ElevatedButton(
      onPressed: _submit,
      child: Row (
        children: [
          Icon(Icons.login),
          Text("login")
        ],
      ) ,

    );
    var registerBtn = new ElevatedButton(
      //padding: const EdgeInsets.all(10.0),
      onPressed: _register,
      child: Row (
        children: [
          Text("register")
        ],
      ) ,
    );
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Login Page",
          textScaleFactor: 4.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val!, //_email
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Username",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val!,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                ),
              )
            ],
          ),
        ),
        new Padding(
            padding: const EdgeInsets.all(10.0),
            child: loginBtn),

        new Padding(
            padding: const EdgeInsets.all(10.0),
            child: registerBtn),
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar("Login not successful");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    // TODO: implement onLoginSuccess
    if(user.username == ""){
      _showSnackBar("Login not successful");
    }else{
      _showSnackBar(user.toString());
    }
    setState(()async {
      _isLoading = false;
    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    //if(user.flaglogged == "logged"){
     // print("Logged");
    Navigator.of(context).pushNamed("/home");
    //}else{
    //  print("Not Logged");
    //}
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BuildContext>('_ctx', _ctx));
    properties.add(DiagnosticsProperty<bool>('_isLoading', _isLoading));
  }
}