import 'package:crypto_converter/main_display.dart';
import 'package:flutter/material.dart';
import 'fetching_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var btc;
  var eth;
  var ltc;
  List a = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start('USD');
  }

  void start(String p) async {
    Fetch fetch = Fetch(s: p);
    btc = await fetch.getBTC();
    eth = await fetch.getETH();
    ltc = await fetch.getLTC();
    a.add(btc);
    a.add(eth);
    a.add(ltc);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PriceScreen(list: a);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.black,
          size: 100.0,
        ),
      ),
    );
  }
}
