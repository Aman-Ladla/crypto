import 'package:http/http.dart' as http;
import 'dart:convert';

class Fetch {
  final apikey = "B436B1A9-9DDB-4ADE-871F-E23CD41BA135";

  final String s;

  Fetch({this.s});

  Future<dynamic> getBTC() async {
    http.Response response = await http.get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/BTC/$s?apikey=$apikey"));

    var body = response.body;

    var data = jsonDecode(body);

    double x = data['rate'];

    return x.toStringAsFixed(2);
  }

  Future<dynamic> getETH() async {
    http.Response response = await http.get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/ETH/$s?apikey=$apikey"));

    var body = response.body;

    var data = jsonDecode(body);

    double x = data['rate'];

    return x.toStringAsFixed(2);
  }

  Future<dynamic> getLTC() async {
    http.Response response = await http.get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/LTC/$s?apikey=$apikey"));

    if (response.statusCode == 200) {
      var body = response.body;

      var data = jsonDecode(body);

      double x = data['rate'];

      return x.toStringAsFixed(2);
    } else {
      return null;
    }
  }
}
