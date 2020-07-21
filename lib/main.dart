import 'package:flutter/material.dart';
import 'package:libra_app/model/BusModel.dart';
import 'package:libra_app/select_seat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AllBuses(),
    );
  }
}

class AllBuses extends StatefulWidget {
  @override
  _AllBusesState createState() => _AllBusesState();
}

class _AllBusesState extends State<AllBuses> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Select Bus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: buses.length,
          itemBuilder: (context,index)=> InkWell(
            splashColor: Colors.orange,
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSeat()));
            },
            
            child: SingleCard( buses: buses[index],))),
      )
    );
  }
}


class SingleCard extends StatelessWidget {
  final Buses buses;

  const SingleCard({Key key, this.buses}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    return Card(
              elevation: 2,
              child: Container(
                  height: height * 0.3,
                  width: width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'from:    ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              buses.from,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'departure time:    ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '${buses.departure_time} ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('to:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300)),
                            Text(
                              '        ${buses.to}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Center(
                          child: SizedBox(
                              height: height * 0.15,
                              child: Image(
                                  image: AssetImage('assets/images/bus.jpg'))),
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(buses.vehicleName),
                                Text('${buses.avalableSeat} avalable seat(s)')
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 35,
                              width: 100,
                              child: Center(
                                child: Text('View Seats', style: TextStyle(
                                  color: Colors.white,
                                      fontSize: 16, fontWeight: FontWeight.w300)),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            );
  }
}