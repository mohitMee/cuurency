import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './home_page.dart';
void main() async {
  List currencies = await getCurrencies();
   
   runApp(new MyApp(currencies));

}
class MyApp extends StatelessWidget {
  final List currencies;
  MyApp(this.currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink
      ),
      home: new HomePage(currencies),
       
    );
  }
}

Future<List> getCurrencies() async {
  String cryptoUrl="https://api.coinmarketcap.com/v1/ticker/";
  http.Response response = await http.get(cryptoUrl);
  return jsonDecode(response.body);
}