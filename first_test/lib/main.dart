import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToGamePage() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const GamePage()));
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                "Click the button for help",
              ),
              ElevatedButton(
                onPressed: navigateToGamePage,
                child: const Icon(Icons.map),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GoogleMapController mapController;

  final LatLng acilia = const LatLng(41.783790, 12.360890);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PROVA'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: acilia,
            zoom: 11.0,
          ),
          zoomControlsEnabled: false,
          buildingsEnabled: true,
          compassEnabled: false,
          mapType: MapType.normal,
          onCameraIdle: () {
            const Scaffold(
              body:  Center(
                child: 
                 Text("MOVITEEEEE")),
            );
          },
        ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Click the button to return to the Home Page"),
              ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: "profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.groups,
            ),
            label: "play",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_events_outlined,
            ),
            label: "leaderboard",
          ),
        ],
      ),
    );
  }
}
