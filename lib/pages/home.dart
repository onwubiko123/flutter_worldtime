
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};

  @override
  Widget build(BuildContext context) {

    data =data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set background
    String bgimage = data['isDaytime'] ? 'day1.jpg' : 'night1.jpg';
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/day1.jpg'),
                fit:BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time':result['time'],
                          'location': result['location'],
                          'isDaytime' :result['isDaytime'],
                          'flag' : result['flag']
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                        'Edit Location',
                            style: TextStyle(
                        color: Colors.grey[300],
                    )
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
       ),
    );
  }
}
