import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon:Icon(Icons.account_circle),
            iconSize: 30.0,
            onPressed: (){},
        ),
        title: Text('Food Delivery'),
        actions: <Widget>[
          TextButton(
              onPressed: (){},
              child: Text(
                'Cart(5)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                )
              )
          )
        ],
      ),
    );
  }
}
