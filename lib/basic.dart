import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  // List<String> Balls = List.filled(45, 'MintBall');

  List<Ball> balls = List.filled(9, Ball(colorImage: randomColor(), opa: 1, scale: 4.8));

  double ball_padding = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('B a l l',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: <Widget>[
                    //여기다 그대로, expanded와 padding을 넣으니 화면에 그려지나, 경고창.

                    ...ballList(balls),
                  ]
              ),
              SizedBox(height: 50,),
              ButtonTheme(
                  minWidth: 100,
                  height: 60,
                  child: RaisedButton(
                      child: Icon(Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      ),
                      color: Colors.orangeAccent,
                      onPressed: (){
                        setState(() {
                          //Balls.fillRange(0, 7, 'PurpleBall'); // index 0~6
                          //balls.forEach( (element) => element.colorImage=randomColor() );
                          for(int i=0; i<balls.length; i++){
                            balls[i].colorImage=randomColor();
                            print(balls[i].colorImage);
                          }
                          for(int i=0; i<balls.length; i++){
                            print('$i ${balls[i].colorImage}');
                          }
                        });
                      }
                  )
              )
            ],
          ),
        ),
      ),
    );
  }


  /*
  ballsList
  Ball 리스트를 받아와서, 공들로 이루어진 위젯들의 리스트를 반환한다.
   */

  ////////List<double> ball_scale=List.generate(7, (index) => 4.8);    //밖으로 꺼내오니까 변경되긴 함.
  int _myDuration = 1;
  double _myOpacity = 1;

  List<Widget> ballList(List<Ball> balls){
    //double ball_padding=3;
    //double ball_scale=4.8;   //밖으로 꺼내면 변경되긴 함.

    ///////////  List<String> save_color= [''];

///////////  List<String> Balls = List.filled(7, 'MintBall');
    List<Widget> list = List.generate(9, (index) =>
        InkWell(
          child: AnimatedOpacity(
            duration: Duration(seconds: _myDuration),
            opacity: _myOpacity,
            child: Stack( //공 이미지 , 공의 숫자
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'images/${balls[index].colorImage}.png',
                  scale: balls[index].scale,
                ),

                Text('$index',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),

          /*
          *Ball을 클릭 할 경우 ( 비활성화 )
          */
          onTap: (){
            setState(() {   //setState가 있어야 reFresh가 됨.
              //ball_scale=6;  //바뀌지 않는다면,,,
              if(balls[index].colorImage != 'GreyBall') {
                //  save_color= Balls[index];
                // print(save_color);
                balls[index].colorImage = 'GreyBall';

                // ball_scale[index]=8;  //스케일을 줄이면 정렬 길이에 문제가 있어서, 투명도로 변경.
              }
              else {
                balls[index].colorImage = randomColor();
              }
              print('ball tap');
            }
            );

          },
        )
    );

    return list;

  }

}

class Ball{
  String colorImage = 'MintBall';
  double opa = 1;
  double scale =4.8;

  Ball({this.colorImage, this.opa, this.scale});
}


String randomColor(){
  int ball;
  String colorBall;


  ball = Random().nextInt(7);

  switch (ball) {
    case 0:
      colorBall = 'GreenBall';
      break;
    case 1:
      colorBall = 'MintBall';
      break;
    case 2:
      colorBall = 'OrangeBall';
      break;
    case 3:
      colorBall = 'PinkBall';
      break;
    case 4:
      colorBall = 'PurpleBall';
      break;
    case 5:
      colorBall = 'RedBall';
      break;
    case 6:
      colorBall = 'YellowBall';
      break;
  }

  return colorBall;
}
