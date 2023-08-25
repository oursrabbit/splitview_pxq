import 'package:flutter/material.dart';
import 'package:splitview_pxq/splitview_pxq.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth= MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SplitViewPXQ(
          spliter: Container(color: Colors.pink,),
          direction: SplitViewDirection.horizontal,
          size: [200, 200, 0], // last size will be never used
          spliterSize: 20,
          spliterOverlapSplitView: true,
          children:[
            SplitViewPXQ(
              spliter: Container(color: Colors.deepPurple,),
              direction: SplitViewDirection.vertical,
              size: [200, 200, 0], // last size will be never used
              spliterSize: 20,
              spliterOverlapSplitView: false,
              children: [
                Container(color: Colors.blue,),
                Container(color: Colors.tealAccent,),
                Container(color: Colors.purple,),
              ],
            ),
            Container(color: Colors.orangeAccent,),
            Container(color: Colors.yellow,),
          ],
        ),
      )
    );
  }
}
