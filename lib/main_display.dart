import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'fetching_data.dart';

class PriceScreen extends StatefulWidget {
  final list;

  PriceScreen({this.list});

  @override
  _PriceScreenState createState() => _PriceScreenState(a: list);
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  final List a;

  _PriceScreenState({this.a});

  var btc;
  var eth;
  var ltc;

  var btcT;
  var ethT;
  var ltcT;

  void update(String s) async {
    Fetch fetch = Fetch(s: s);
    btcT = await fetch.getBTC();
    ethT = await fetch.getETH();
    ltcT = await fetch.getLTC();
    setState(() {
      if (btc != null && eth != null && ltc != null) {
        btc = btcT;
        eth = ethT;
        ltc = ltcT;
        selectedCurrency = s;
      } else {
        SnackBar(
          content: Text("Something went wrong"),
          duration: Duration(seconds: 2),
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    btc = widget.list[0];
    eth = widget.list[1];
    ltc = widget.list[2];

    //update('USD');
  }

  List<DropdownMenuItem<String>> getCurrencies() {
    List<DropdownMenuItem<String>> a = [];

    for (int i = 0; i < currenciesList.length; i++) {
      var x = DropdownMenuItem<String>(
          child: Text(currenciesList[i]), value: currenciesList[i]);

      a.add(x);
    }

    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Converter"),
        backgroundColor: Colors.green[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[400],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                child: Text(
                  "1 BTC = $btc $selectedCurrency",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[400],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                child: Text(
                  "1 ETH = $eth $selectedCurrency",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green[400],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                child: Text(
                  "1 LTC = $ltc $selectedCurrency",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            color: Colors.green[400],
            alignment: Alignment.center,
            child: DropdownButton(
              value: selectedCurrency,
              items: getCurrencies(),
              onChanged: (value) {
                update(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
