


import 'package:flutter/material.dart';



class SuccessPage extends StatelessWidget {
  final List<int> seat;

  const SuccessPage({Key key, this.seat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Selected Seat'),),
      body: Column(
        children: <Widget>[
          Text('Congratulations  below are the seat you choose', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
          Text('Im sorry for the icons i used i find it deficult to get exact icons'),
          Expanded(child: ListView(
            children: seat.map((e) => ListTile(title: Text('Seat Number  $e'),)).toList(),
          ))



        ],
      ),
      
    );
  }
}