import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lessone_11/dashboard.dart';
import 'package:lessone_11/home_page_less12.dart';
import 'package:lessone_11/storage_utils.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StorageUtils.isFirstTimeLogin()?DashBoard():HomePageLess12()
    );
  }
}
