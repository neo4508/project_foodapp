import 'package:flutter/material.dart';
import 'package:test2/main.dart';
import 'package:test2/screens/home_screen.dart';
import 'package:test2/screens/authenticate/login_page.dart';
import 'package:test2/screens/authenticate/register.dart';
void main() => runApp( MyApp());
final routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => HomeScreen(),
  //'/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => LoginPage(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.orange
      ),
      home: HomeScreen()
    );
  }
}
class Homepage extends StatelessWidget{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final RegisterButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage())),
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 300.0,
                  child: Image.asset(
                    "assets/images/Mapps_logo.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                loginButon,
                SizedBox(
                  height: 35.0,
                ),
                RegisterButon,
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
        tooltip: 'Increment',
        child: Icon(Icons.pin_drop_outlined),
      ),
    );
  }
}
