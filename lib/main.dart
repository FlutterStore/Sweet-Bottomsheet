import 'package:flutter/material.dart';
import 'package:sweetsheet/sweetsheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SweetSheet _sweetSheet = SweetSheet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SweetSheet',style: TextStyle(fontSize: 15),),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: LargeButton(
            context: context,
            text: "Sweet Sheet",
            onClick: () {
              _sweetSheet.show(
                context: context,
                description: const Text(
                  'Place your order. Please confirm the placement of your order : Iphone X 128GB',
                  style: TextStyle(color: Color(0xff2D3748),fontSize: 15),
                ),
                color: CustomSheetColor(
                  main: Colors.white,
                  accent:  Colors.green,
                  icon:  Colors.green,
                ),
                icon: Icons.local_shipping,
                positive: SweetSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  title: 'CONTINUE',
                ),
                negative: SweetSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  title: 'CANCEL',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  final BuildContext context;
  final String text;
  final VoidCallback onClick;

  const LargeButton({
    Key? key,
    required this.context,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Container(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}