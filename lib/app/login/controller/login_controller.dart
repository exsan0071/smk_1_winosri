import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? selectedName;
  bool isGuru = true;
  bool isRemember = false;
  List categoryList = [];
  TextEditingController usernameControler = TextEditingController(text: '');
  TextEditingController passwordControler = TextEditingController(text: '');
  void tokenCache(String token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString("token", token);
  }
}
