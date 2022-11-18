import 'dart:convert';
import 'package:http/http.dart';

class api_fetching {
  static api_fetch() async {
    Response response = await get(
      Uri.parse("https://meme-api.herokuapp.com/gimme"),
    );

    Map data = jsonDecode(response.body);

    return data["url"];
  }
}
