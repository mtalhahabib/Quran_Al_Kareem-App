
import 'package:flutter/material.dart';
import 'package:untitled/qiblah/qiblah.dart';

import 'Quran/surah.dart';
import 'recitation/tilawat.dart';
import 'mosque_map.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    SurahPage(),
    Tilaawat(),
    MapPage(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _pages,
        index:_selectedIndex,

      ),
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home',
              backgroundColor: Colors.green

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed_sharp),
            label: 'Qiblah',

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined,),
            label: 'Near Me',

          ),



        ],


      ),

    );
  }
}
