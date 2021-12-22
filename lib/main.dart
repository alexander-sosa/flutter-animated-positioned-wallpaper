import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<double> vPos;
  List<double> vPos2;
  List<double> vPos22;
  List<double> vPos23;
  List<double> vPos24;
  int pos = 0;

  List<double> aligns;

  @override
  Widget build(BuildContext context) {
    // por cualquier cambio en la jerarquia de widgets, se actualiza

    var screen = MediaQuery.of(context).size;
    vPos = [0, screen.height/2, 0, 0,
      0, 0, screen.width/2, 0,
      screen.height/2, 0, 0, 0,
      0, 0, 0, screen.width/2
    ]; // top, bottom, left, right


    aligns = [
      -0.8, -0.8,
      0.8, -0.8,
      0.8, 0.8,
      -0.8, 0.8
    ];

    vPos2 = [0, screen.height, 0, screen.width,
      0, screen.height/2, 0, screen.width/2,
    ]; // top, bottom, left, right

    vPos22 = [screen.height, 0, screen.width, 0,
      screen.height/2, 0, screen.width/2, 0,
    ];

    vPos23 = [0, screen.height, screen.width, 0,
      0, screen.height/2, screen.width/2, 0,
    ]; // top, bottom, left, right

    vPos24 = [screen.height, 0, 0, screen.width,
      screen.height/2, 0, 0, screen.width/2
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Stack( // se sugiere usar stacks para los animateds
          children: [
            cuadro2(vPos2[0 + pos * 4], vPos2[1 + pos * 4], vPos2[2 + pos * 4], vPos2[3 + pos * 4], Colors.cyan),
            cuadro2(vPos22[0 + pos * 4], vPos22[1 + pos * 4], vPos22[2 + pos * 4], vPos22[3 + pos * 4], Colors.amber),
            cuadro2(vPos23[0 + pos * 4], vPos23[1 + pos * 4], vPos23[2 + pos * 4], vPos23[3 + pos * 4], Colors.red),
            cuadro2(vPos24[0 + pos * 4], vPos24[1 + pos * 4], vPos24[2 + pos * 4], vPos24[3 + pos * 4], Colors.lightGreen),
          ],
        ) ,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
            onPressed: (){
              setState(() {
                //pos = (pos + 1) % 4; // sentido horario
                //pos = (pos + 4 - 1) % 4; // sentido anti horario

                pos = (pos + 1) % 2; // sentido anti horario
              });
            }
        ),
      ),
    );
  }

  Widget cuadro(){
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      child: Container(color: Colors.cyan),
      top: vPos[0 + pos * 4],
      bottom: vPos[1 + pos * 4],
      left: vPos[2 + pos * 4],
      right: vPos[3 + pos * 4],
    );
  }

  Widget cuadro2(arriba, abajo, izq, der, clr){
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      child: Container(color: clr),
      top: arriba,
      bottom: abajo,
      left: izq,
      right: der,
    );
  }

  Widget circle(){
    return Align(
      alignment: Alignment(aligns[0 + pos * 2], aligns[1 + pos * 2]),
      child: Container(
        width: 50,
        height: 50,
        child: AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          child: Container(color: Colors.cyan),
          top: vPos[0 + pos * 4],
          bottom: vPos[1 + pos * 4],
          left: vPos[2 + pos * 4],
          right: vPos[3 + pos * 4],
        ),
      ),
    );
  }

}