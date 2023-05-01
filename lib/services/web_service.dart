import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/response_model.dart';

class WebService {
  Future<List<Entries>?> fetchentries() async {
    var url = Uri.parse('https://api.publicapis.org/entries');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responsedata = jsonDecode(response.body);
      var output = Response.fromJson(responsedata);

      return output.entries;
    } else {
      throw ("Error");
    }
  }
}
