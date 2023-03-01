import 'dart:convert';

import 'package:http/http.dart' as http;

class Apihelper {
  Apihelper._();
  static final Apihelper apihelper = Apihelper._();
  Future<Map?> Getdata() async {
    String Peopleapi = "https://randomuser.me/api/";
    Uri Myurl = Uri.parse(Peopleapi);
    http.Response response = await http.get(Myurl);
    if (response.statusCode == 200) {
      Map? data = jsonDecode(response.body);
      return data;
    }
    return null;
  }
}
