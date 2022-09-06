import 'dart:async';
import 'package:test2/models/user.dart';
import 'package:test2/Database/database_helper.dart';
import 'package:test2/utils/network_util.dart';

import '../models/user.dart';
import '../utils/network_util.dart';

class RestData {

  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login( String username, String password) {
    return new Future.value(new User(username, password));
    //async {
    //String flagLogged = "logged";
    //simulate internet connection by selecting the local database to check if user has already been registered
    //var user = new User(null, username, password, null);
    //var db = new DatabaseHelper();
    //var userRetorno = new User(null,null,null,null);
   // userRetorno = (await db.selectUser(user));
    //if(userRetorno!= null){
     // flagLogged = "logged";
      //return new Future.value(new User(null, username, password,flagLogged));
   // }else {
     // flagLogged = "not";
    //  return new Future.value(new User(null, username, password,flagLogged));
    }
  }
//}
