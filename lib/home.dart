// ignore_for_file: camel_case_types

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:project_venture/finance_news.dart';
import 'package:project_venture/pv_updates.dart';
import 'package:project_venture/fetch_data.dart';
import 'package:project_venture/quiz.dart';

import 'opportunities.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int currentIndex = 0;

  List pages = [
    const FetchData(),
    const News(),
    const Opportunities(),
    const Quiz()
  ];

  void onTap(int index){
    setState((){
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9ffcff),
      appBar: AppBar(
        centerTitle: false,
        title: const Text('PV Updates', style: TextStyle(color: Color(0xFF000080)),),
        backgroundColor: const Color(0xFF9ffcff),
      ),
      bottomNavigationBar: 
      BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label:'Updates'),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label:'News'),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label:'Opportunities'),
          BottomNavigationBarItem(icon: Icon(Icons.games), label:'Quiz')
        ], 
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF000080),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFF9ffcff),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 0,

      
      ),

      body: pages[currentIndex],


    );
  }
}