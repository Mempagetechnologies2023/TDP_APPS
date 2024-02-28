import 'package:flutter/material.dart';
import 'Agewisebooths.dart';
import 'Boothissues.dart';
import 'Districts/Kodangal.dart';
import 'Influencerbooths.dart';
import 'authservice.dart';

class BootList extends StatelessWidget {
  const BootList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text("Admin Page",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),),
        actions: [
          IconButton(
            onPressed: () {
              AuthService authService = AuthService();
              authService.logOutUser(context);
            },
            icon: const Icon(Icons.logout,),
            color: Colors.black,
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 210,
                  child: MaterialButton(
                    padding: EdgeInsets.all(20),
                    textColor: Colors.black,
                    color: Colors.white,
                    child: Text('Booths',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.green[900]),),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Kodangalbooths()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 100,
                  width: 210,
                  child: MaterialButton(
                    padding: EdgeInsets.all(20),
                    textColor: Colors.black,
                    color: Colors.white,
                    child: Text('Age Wise',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.green[900]),),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Agewisebooths()));
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 100,
                  width: 210,
                  child: MaterialButton(
                    padding: EdgeInsets.all(20),
                    textColor: Colors.black,
                    color: Colors.white,
                    child: Text(
                      'Influencers',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20,color: Colors.green[900]),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Influencerbooths()));
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 100,
                  width: 210,
                  child: MaterialButton(
                    padding: EdgeInsets.all(20),
                    textColor: Colors.black,
                    color: Colors.white,
                    child: Text(
                      'Booth Issues',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800,color: Colors.green[900]),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BoothIssues()));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
