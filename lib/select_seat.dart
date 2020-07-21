
import 'package:flutter/material.dart';
import 'package:libra_app/SuccessPage.dart';
import 'package:libra_app/model/seatModel.dart';
import 'package:toast/toast.dart';


class SelectSeat extends StatefulWidget {
  @override
  _SelectSeatState createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  
List<int> selectedSeat=[];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Select Seat(s)'),
      ),
      body: SingleChildScrollView(
              child: Container(
          height: height,
          width: width,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Center(
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  elevation: 3,
                  child: Container(
                      height: height * 0.5,
                      width: width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Seat(
                          choosenSeat: (value){
                           setState(() {
                              selectedSeat=value;
                           });
                            print(value);
                          },
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _iconDetail('assets/images/available.png', 'Available'),
                  _iconDetail('assets/images/selected.png', 'Selected'),
                  _iconDetail('assets/images/unavailable.png', 'Unavailable'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                splashColor: Colors.grey,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessPage(seat: selectedSeat,)));
                },
                              child: Material(
                  borderRadius: BorderRadius.circular(12),
                  elevation: 10,
                  child: Container(
                    child: Center(child: Text('Continue', style: TextStyle(color: Colors.white),)),
                    width: 200,
                    height: 46,
                    decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _iconDetail(String url, String detail) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(url),
        ),
        Center(child: Text(detail))
      ],
    );
  }
}

class Seat extends StatefulWidget {
  final Function(List<int>) choosenSeat;

  const Seat({Key key, this.choosenSeat}) : super(key: key);
  @override
  _SeatState createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  List<int> selectedSeat = [];

  addSeat(int index) {
    var isSelceted = selectedSeat.contains(index);

    if (isSelceted) {
      selectedSeat.remove(index);
      

    } else {
      selectedSeat.add(index);
    }
    widget.choosenSeat(selectedSeat);

    // print(selectedSeat);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        _firstRow(),
        SizedBox(
          height: 20,
        ),
        _secondRow(),
        SizedBox(
          height: 20,
        ),
        _thirdRow(),
        SizedBox(
          height: 20,
        ),
        _fouthRow(),
        SizedBox(
          height: 20,
        ),
        _lastRow()
      ],
    );
  }

  _firstRow() {
    return Row(
      children: <Widget>[
        _steeringIcon(),
        Spacer(),
        _singleIcon(seats[0].avalable, seats[0].seatNumber),
        SizedBox(
          width: 20,
        ),
        _singleIcon(seats[1].avalable, seats[1].seatNumber)
      ],
    );
  }

  _secondRow() {
    return Row(
      children: <Widget>[
        _singleIcon(seats[2].avalable, seats[2].seatNumber),
        SizedBox(
          width: 20,
        ),
        _singleIcon(seats[3].avalable, seats[3].seatNumber),
        SizedBox(
          width: 20,
        ),
        _singleIcon(seats[4].avalable, seats[4].seatNumber),
        Spacer()
      ],
    );
  }

  _thirdRow() {
    return Row(
      children: <Widget>[
        _singleIcon(seats[5].avalable, seats[5].seatNumber),
        SizedBox(
          width: 20,
        ),
        _singleIcon(seats[6].avalable, seats[6].seatNumber),
        Spacer(),
        _singleIcon(seats[7].avalable, seats[7].seatNumber)
      ],
    );
  }

  _fouthRow() {
    return Row(
      children: <Widget>[
        _singleIcon(seats[8].avalable, seats[8].seatNumber),
        SizedBox(
          width: 20,
        ),
        _singleIcon(seats[9].avalable, seats[9].seatNumber),
        Spacer(),
        _singleIcon(seats[10].avalable, seats[10].seatNumber)
      ],
    );
  }

  _lastRow() {
    return Row(
      children: <Widget>[
        _singleIcon(seats[11].avalable, seats[11].seatNumber),
        Spacer(),
        _singleIcon(seats[12].avalable, seats[12].seatNumber),
        Spacer(),
        _singleIcon(seats[13].avalable, seats[13].seatNumber),
        Spacer(),
        _singleIcon(seats[14].avalable, seats[14].seatNumber)
      ],
    );
  }

  _singleIcon(bool available, String index) {
    var valueToInt = int.parse(index);
    return InkWell(
      onTap: available
          ? () {
              setState(() {
                addSeat(valueToInt);
              });
            }
          : () {
              Toast.show("the Seat is not available", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
            },
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 50,
            width: 50,
            child: selectedSeat.contains(valueToInt)
                ? Image.asset('assets/images/selected.png')
                : Image.asset(available
                    ? 'assets/images/available.png'
                    : 'assets/images/unavailable.png'),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child: selectedSeat.contains(valueToInt)
                    ? Text(
                        index,
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        index,
                        style: TextStyle(
                            fontSize: 19,
                            color: available ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
          )
        ],
      ),
    );
  }

  _steeringIcon() {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image.asset('assets/images/steering.png'),
    );
  }
}
