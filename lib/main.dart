import 'package:flutter/material.dart';
import 'package:navigation_observer/screens/page1.dart';
import 'package:navigation_observer/screens/page2.dart';
import 'package:navigation_observer/screens/page3.dart';
import 'package:navigation_observer/screens/page4.dart';

void main() {
  runApp(const MyApp());
}

RouteObserver observer = RouteObserver();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => MyHomePage(),
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
        '/page4': (context) => Page4(),
      },
      navigatorObservers: [observer],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with RouteAware {

  @override
  void didChangeDependencies() {
    observer.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed('/page1');
              }, child: Text('go to page1')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('pop')),
            )
          ],
        ),
      ),
    );
  }
}



