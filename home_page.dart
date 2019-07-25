import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

class HomePage extends StatefulWidget {
   List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  final List<MaterialColor> _colors = [Colors.blue,Colors.indigo,Colors.red,Colors.green,Colors.brown];
   
  


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Crypto App',textAlign:TextAlign.center),
      ),
      body: _cryptoWidget(),
    );
  }
  Widget _cryptoWidget(){
    return new Container(
      child: new Column(
      children: <Widget>[
       new Flexible(
        child: new ListView.builder(
          itemCount: widget.currencies.length,
          itemBuilder: (BuildContext context,int index) {
            final Map currency = widget.currencies[index];
            var rand = new Random();
            int k = rand.nextInt(5);
            final MaterialColor color = _colors[k%5];

            return _getListItemUi(currency,color); 
          },
        ),
      )
      ]
    ));

  }
  ListTile _getListItemUi(Map currency,MaterialColor color){
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency['name'][0])
      ),
      title: new Text(currency['name'],
      style: new TextStyle(fontWeight: FontWeight.bold),
      
      ),
       subtitle: _getSubtitleText(currency['price_usd'],currency['percent_change_1h']),
       isThreeLine: true,
    );

  }
  Widget _getSubtitleText(String price,String pc){
    TextSpan priceTextWidget = new TextSpan(text:"\$$price\n",
    style: new TextStyle(color: Colors.black)
    );
    String pct = "1 hour: $pc%";
    TextSpan pctwidget;
    if(double.parse(pc)>0){
      pctwidget = new TextSpan(text: pct,
      style: new TextStyle(color: Colors.green)); 
    }
    else {
       pctwidget = new TextSpan(text: pct,
      style: new TextStyle(color: Colors.red)); 
    }
    return new RichText(
      text: new TextSpan(
       children: [priceTextWidget,pctwidget] 
      ),
    ); 
     
  }  
}