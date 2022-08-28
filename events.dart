// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';
import '../services/constants.dart' as c;
import 'package:page_transition/page_transition.dart';
import '../pages/team2.dart';
import '../pages/home.dart';
import '../pages/schedule.dart';
// ignore: must_be_immutable
class Events extends StatefulWidget {
  // ignore: non_constant_identifier_names
  int events_type;
  // ignore: non_constant_identifier_names
  Events({Key? key, required this.events_type,}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Events> createState() => _EventsState(events_type: events_type);
}

class _EventsState extends State<Events> {
  // ignore: non_constant_identifier_names
  int events_type;
  _EventsState({ required this.events_type,}) ;
  Future<void> navigateToTeams(context) async {
    Navigator.push(
        context, PageTransition(
      child: const Team(),
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds:500 ),
    ));
  }
  Future<void> navigateToEvents(context,int category) async {
    Navigator.push(
        context, PageTransition(
      child: Events(events_type: category),
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds:500 ),
    ));
  }
  Future<void> navigateToHome(context) async {
    Navigator.push(
        context, PageTransition(
      child: const Home(),
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds:500 ),
    ));
  }
  Future<void> navigateToDay(context, int a) async {
    Navigator.push(
        context, PageTransition(
      child: Schedule(day: a),
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds:500 ),
    ));
  }
  Future<void> navigateToDescription(context,int category, String a) async {
    late Widget ret;
    if(category == 1) {
      ret = c.Sporting[c.Sporting1.indexOf(a)];
    }
    if(category == 2) {
      ret = c.OffStage[c.Offstage1.indexOf(a)];
    }
    if(category == 3) {
      ret = c.OnStage[c.Onstage1.indexOf(a)];
    }
    Navigator.push(
        context, PageTransition(
      child: ret,
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds:500 ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List Event =[];
    List Event2 =[];
    if(events_type == 1)
    {
      Event = c.Sporting1.getRange(0, c.Sporting1.length~/2).toList();
      Event2 = c.Sporting1.getRange(c.Sporting1.length~/2, c.Sporting1.length).toList();
      print("YOU ARE FATAL");
      print(Event);
      print(Event2);
    }
    if(events_type == 2)
    {
      Event = c.Offstage1.getRange(0, c.Offstage1.length~/2).toList();
      Event2 = c.Offstage1.getRange(c.Offstage1.length~/2, c.Offstage1.length).toList();
      print("YOU ARE FATAL");
      print(Event);
      print(Event2);
    }
    if(events_type == 3)
    {

      Event = c.Onstage1.getRange(0, c.Onstage1.length~/2).toList();
      Event2 = c.Onstage1.getRange(c.Onstage1.length~/2, c.Onstage1.length).toList();
      print("YOU ARE FATAL");
      print(Event);
      print(Event2);
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width:0.05*width, height: 0.1),
            TextButton(onPressed: (){navigateToHome(context);},  child: const Text("Home", style: TextStyle(color: Colors.white, fontFamily: 'Xavier1',fontSize: 20)),),
            TextButton(onPressed: (){navigateToDay(context,1);}, child: const Text("Schedule", style: TextStyle(color: Colors.white, fontFamily: 'Xavier1', fontSize: 20)), ),
            TextButton(onPressed: (){},style: TextButton.styleFrom(backgroundColor: Colors.blue[800]), child: const Text("Events", style: TextStyle(color: Colors.white, fontFamily: 'Xavier1', fontSize: 20)),),
            TextButton(onPressed: (){navigateToTeams(context);}, child: const Text("Teams", style: TextStyle(color: Colors.white, fontFamily: 'Xavier1', fontSize: 20)),),
            SizedBox(width:0.05*width, height: 0.1),
          ],
        ),
        centerTitle: true,

      ),
      body : Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),

        child : Column(
          children: [
            const SizedBox(height:50),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children : const [
                        Text(
                          'EVENTS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: 'Xavier1',
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                      indent: 0,
                      endIndent: 0,
                      height: 55,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextButton(
                            onPressed: (){
                              navigateToEvents(context,1);
                            },
                            child: const Text(
                              'SPORTING',
                              style : TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontFamily: 'Xavier2',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextButton(
                            onPressed: (){
                              navigateToEvents(context,2);
                            },
                            child: const Text(
                              'OFF STAGE',
                              style : TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontFamily: 'Xavier2',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextButton(
                            onPressed: (){
                              navigateToEvents(context,3);
                            },
                            child: const Text(
                              'ON STAGE',
                              style : TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontFamily: 'Xavier2',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                      indent: 0,
                      endIndent: 0,
                      height: 55,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width:width*0.06),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:
                          Event.map((event1){
                            return ClipRRect(
                              borderRadius: BorderRadius.zero,
                              child: InkWell(
                                onTap:(){
                                  navigateToDescription(context,events_type,event1);
                                },
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 0.15*width,
                                      width: 0.15*width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("${"images/"+event1}.png"),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:0.1*width, height:10),
                                  ],
                                ),
                              ),
                            );

                          }).toList(),

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:
                          Event2.map((event2){
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: InkWell(
                                onTap:(){
                                  navigateToDescription(context,events_type,event2);
                                },
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 0.15*width,
                                      width: 0.15*width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("${"images/"+event2}.png"),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:0.1*width, height:10),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(width:width*0.06),
                      ],
                    ),
                    SizedBox(height:10),
                    Container(
                      color: const Color(0xff2F303A),
                      height: ((1.6/5)*height),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                const SizedBox(height:5, width:10),
                                const Text("Location", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                                Container(
                                  height: (3.5/5)*((1.6/5)*height),
                                  width: (1/5.5)*width,
                                  color: Colors.black,
                                ),
                                const Text("30 Mother Teresa Sarani, Kolkata-700016", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                              ]
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:const [
                                SizedBox(height:0, width:10),
                                Text("Contact Us", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                                Text("Gmail: xuberancetechteam2022@gmail.com", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                                Text("Phone1: 9876543210", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                                Text("Phone2: 0123456789", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                              ]
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:const [
                                SizedBox(height:0, width:10),
                                Text("Social Handles", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                                Text("Facebook", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                                Text("Instagram", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                                Text("Twitter", style: TextStyle(color: Colors.white, fontFamily: 'Xavier3'),),
                              ]
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

}