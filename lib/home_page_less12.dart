import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lessone_11/dashboard.dart';
import 'package:lessone_11/storage_utils.dart';
class HomePageLess12 extends StatefulWidget {
  const HomePageLess12({super.key});

  @override
  State<HomePageLess12> createState() => _HomePageLess12State();
}

class _HomePageLess12State extends State<HomePageLess12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 2.0,
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile',style: TextStyle(fontSize: 30.0),),
            Gap(20.0),
            ElevatedButton(onPressed: () {
              StorageUtils.setLoginData(true);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=>DashBoard()));

            },
              child: Text('Logout',
                style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple
            ),
            ),

          ],
        ),
      ),
    );
  }
}
