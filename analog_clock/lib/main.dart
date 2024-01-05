import 'package:analog_clock/UI/style.dart';
import 'package:analog_clock/UI/time_model.dart';
import 'package:analog_clock/Widgets/clock_widget.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

void main(){
  runApp(MyApp()) ;
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(Object context) {
    
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

}


class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomepageState();

}

class _HomepageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clock'),
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 30,
        backgroundColor: Colors.black,
        foregroundColor: Colors.tealAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              //now we need to upgrade the clock value each seconds
              
              TimerBuilder.periodic(Duration(seconds: 1), builder: (context){

                  var currentTime = DateTime.now();
                  // String _period = DateTime.now().period == DayPeriod.am ? "AM" : "PM";

                  //let's set the digital clock string values
                  String seconds = currentTime.second < 10 ?"0${currentTime.second}":"${currentTime.second}";
                  String minutes = currentTime.minute < 10 ?"0${currentTime.minute}":"${currentTime.minute}";
                  String hours = currentTime.hour < 10 ?"0${currentTime.hour}":"${currentTime.hour}";

                  return Column(
                    
                    children: [
                      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text("Today", style: AppStyle.mainTextThin,),
                             Text("$hours:$minutes:$seconds", style: AppStyle.mainText,),
                          ],
                        ),
                        
                        Center(
                          child: ClockWidget(TimeModel(
                            currentTime.hour,
                            currentTime.minute, 
                            currentTime.second
                        )
                      )
                    ),
                  ],
                );
              }
              // From this point another time zone started and clock's work is finished.
              ),
              SizedBox(
                height: 60.0,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select another Time Zone", style: TextStyle(fontSize: 18.0),),
                Divider(
                color: Colors.black45,
                )
              ],
            ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                    children: [                      
                      Container(
                        margin: EdgeInsets.only(right: 24.0),
                        width: MediaQuery.of(context).size.width - 52,
                        height: 100.0,
                        padding: EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: AppStyle.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Dhaka", style: AppStyle.mainTextWhite,),
                                Text("${DateTime.now().hour}:${DateTime.now().minute}", style: AppStyle.mainTextWhite,),
                              ],
                            ),
                            SizedBox(height: 8.0,),
                            Text("Today", style: AppStyle.mainTextThinWhite,)
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 24.0),
                        width: MediaQuery.of(context).size.width - 52,
                        height: 100.0,
                        padding: EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: AppStyle.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Mymensingh", style: AppStyle.mainTextWhite,),
                                Text("${DateTime.now().hour}:${DateTime.now().minute}", style: AppStyle.mainTextWhite,),
                              ],
                            ),
                            SizedBox(height: 8.0,),
                            Text("Today", style: AppStyle.mainTextThinWhite,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
       ),
       bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.watch_later), label: "Clock"),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Alarm"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "StopWatch"),          
          BottomNavigationBarItem(icon: Icon(Icons.timelapse_outlined), label: "Timer"),
        ]
      ),
    );
  }
}

