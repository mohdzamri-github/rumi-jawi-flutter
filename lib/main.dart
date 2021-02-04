import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rumi_jawi_map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'One';
  String rumi;
  Map rj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rumi 2 Jawi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // DropdownButton<String>(
            //   value: dropdownValue,
            //   icon: Icon(Icons.arrow_downward),
            //   iconSize: 24,
            //   elevation: 16,
            //   style: TextStyle(color: Colors.deepPurple),
            //   underline: Container(
            //     height: 2,
            //     color: Colors.deepPurpleAccent,
            //   ),
            //   onChanged: (String newValue) {
            //     setState(() {
            //       dropdownValue = newValue;
            //     });
            //     print(newValue);
            //   },
            //   items: <String>['One', 'Two', 'Free', 'Four']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                // obscureText: true,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Rumi',
                ),
                onSubmitted: (String value) {
                  print(value);
                  rumi = value;
                  print(rumi);
                  rj = rumiJawiOther(rumi);
                  rj.keys.forEach((element) {
                    print('$element => ${rj[element]}');
                  });
                  setState(() {
                    rumi = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(
                  // text: dropdownValue,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                  children: [
                    TextSpan(text: rumi),
                    TextSpan(text: ' => '),
                    TextSpan(text: rumiJawi(rumi))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(
                    text: rj.toString(),
                    style: TextStyle(fontSize: 20.0, color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {}

String rumiJawi(rumi) {
  if (myRumiJawi.keys.contains(rumi)) {
    print(rumi);
    return myRumiJawi[rumi];
  } else {
    print('Null');
    return null;
  }
}

Map rumiJawiOther(rumi) {
  var r = Map();



  String ber = 'ber$rumi';
  String memper = 'memper$rumi';
  String diper = 'diper$rumi';
  String diKan = 'di${rumi}kan';
  String pemAn = 'pem${rumi}an';
  String perse = 'perse$rumi';
  String pem = 'pem$rumi';
  String an = '${rumi}an';
  String ke = 'ke$rumi';
  String keAn = 'ke${rumi}an';
  String pe = 'pe$rumi';
  String nya = '${rumi}nya';
  String ter = 'ter$rumi';
  String berke = 'berke$rumi';

  myRumiJawi.keys.forEach((element) {
    if (element.contains(ber)) r[element] = myRumiJawi[element];
    if (element.contains(memper)) r[element] = myRumiJawi[element];
    if (element.contains(diper)) r[element] = myRumiJawi[element];
    if (element.contains(pemAn)) r[element] = myRumiJawi[element];
    if (element.contains(pem)) r[element] = myRumiJawi[element];
    if (element.contains(perse)) r[element] = myRumiJawi[element];
    if (element.contains(an)) r[element] = myRumiJawi[element];
    if (element.contains(ke)) r[element] = myRumiJawi[element];
    if (element.contains(keAn)) r[element] = myRumiJawi[element];
    if (element.contains(pe)) r[element] = myRumiJawi[element];
    if (element.contains(nya)) r[element] = myRumiJawi[element];
    if (element.contains(ter)) r[element] = myRumiJawi[element];
    if (element.contains(berke)) r[element] = myRumiJawi[element];
    if (element.contains(diKan)) r[element] = myRumiJawi[element];
  });

  return r;
}
