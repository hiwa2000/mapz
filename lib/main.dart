import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Mapz',
      material: (_, __) => MaterialAppData(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
      ),
      cupertino: (_, __) => CupertinoAppData(
        theme: const CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: CupertinoColors.activeBlue,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  get _pageTexts => [
    'Home Page',
    'Map Page',
    'State Page',
    'Profile Page',
  ];

  final _pageColors = [
    Colors.red,
    const Color.fromARGB(255, 22, 225, 29),
    Colors.blue,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('Mapz'),
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              _pageTexts[_currentIndex],
              style: TextStyle(
                color: _pageColors[_currentIndex],
                fontSize: 24.0,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              color: Colors.orange, // Hintergrundfarbe für den Stack
              child: const Center(
                child: Text(
                  'Overlay über der AppBar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavBar: PlatformNavBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).home,
              color: _pageColors[0],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              color: _pageColors[1],
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).info,
              color: _pageColors[2],
            ),
            label: 'State',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).person,
              color: _pageColors[3],
            ),
            label: 'Profile',
          ),
        ],
        itemChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
