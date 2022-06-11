import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/notifikasi/data.dart';
import '../../more/views/more.dart';
import '../widget/body.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  List<Data> listNotifikasi = [];
  final List<String> imgList = [
    'assets/images/siswa-oke.png',
    'assets/images/mujahidin-wonosari.png',
    'assets/images/1637720771-banner.png'
  ];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  int screenBar = 0;
  final List<Widget> csreen = [
    const MorePage(),
    const Body(),
  ];
  Widget curenCreen = const Body();
  final PageStorageBucket bucket = PageStorageBucket();
}
