import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/baselink.dart';
import 'dart:convert';

import '../controller/login_controller.dart';
import '../models/jurusan_models.dart';

class GetDataLogin {
  final LoginController loginC = Get.put(LoginController());
  final BaseLInkController baseLinkC = Get.put(BaseLInkController());
  //link data base api
  Future firebaseMessagingGetToken() async {
    try {
      SharedPreferences getToken = await SharedPreferences.getInstance();
      String? auth = getToken.getString("token");
      String? tokenD = await loginC.messaging.getToken() as String;
      final headers = {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': '$auth',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse(baseLinkC.baseUrlUrlLaucer3 + '/api/siswa/profil'));
      request.fields.addAll({'notiftoken': tokenD});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(await response.stream.bytesToString());
      } else {
        // ignore: avoid_print
        print(response.reasonPhrase);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future getUserJurusan() async {
    try {
      final response =
          await http.get(Uri.parse(baseLinkC.baseUrlUrlLaucer3 + '/api/kelas'));
      // ignore: avoid_print
      print(response.statusCode);
      if (response.statusCode != 200) {
        // ignore: avoid_print
        print("TIDAK DAPAT DATA DARI SERVER");
        return null;
      } else {
        final data = jsonDecode(response.body)['data'];

        for (Map<String, dynamic> i in data) {
          loginC.categoryList.add(DataJurusan.fromJson(i));
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
