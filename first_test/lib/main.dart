import 'package:flutter/material.dart';

Color colore = Colors.black87;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final Color icon_color = (Colors.black87);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Color.fromARGB(255, 71, 71, 71),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToHelpPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HelpPage()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
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
                onPressed: navigateToHelpPage,
                child: const Icon(Icons.help),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Page"),
      ),
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
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.black87,
          ),
          label: "profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.groups,
            color: Colors.black87,
          ),
          label: "play",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.emoji_events_outlined,
            color: Colors.black87,
          ),
          label: "leaderboard",
        ),
      ]),
    );
  }
}
