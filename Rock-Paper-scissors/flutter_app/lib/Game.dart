import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  var _imagemApp = AssetImage("image/padrao.png");
  var _mensagem = "Choice an option below";

  void _selectedOption(String userChoice){

    var option = ["stone", "paper", "scissor"];
    var number = Random().nextInt(3);
    var appChoice = option[number];

    print("App's choice: " + appChoice);
    print("User's choice: " + userChoice);


    //App's image choice exibition
    switch( appChoice ){
      case "stone" :
        setState(() {
          this._imagemApp = AssetImage("image/pedra.png");
        });
        break;
      case "paper" :
        setState(() {
          this._imagemApp = AssetImage("image/papel.png");
        });
        break;
      case "scissor" :
        setState(() {
          this._imagemApp = AssetImage("image/tesoura.png");
        });
        break;
    }

    //Winner's validation
    //User win
    if(
    (userChoice == "stone" && appChoice == "scissor") ||
        (userChoice == "scissor" && appChoice == "paper") ||
        (userChoice == "paper" && appChoice == "stone")
    ){
      setState(() {
        this._mensagem = "Congratulations!!! You won :)";
      });
      //User win
    }else if(
    (appChoice == "stone" && userChoice == "scissor") ||
        (appChoice == "scissor" && userChoice == "paper") ||
        (appChoice == "paper" && userChoice == "stone")
    ){
      setState(() {
        this._mensagem = "You lose :(";
      });
    }else{
      setState(() {
        this._mensagem = "Draw ;)";
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //1) text
          //2) image
          //3) text resultado
          //4) Linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "App's choice",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectedOption("stone") ,
                child: Image.asset("image/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedOption("paper") ,
                child: Image.asset("image/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedOption("scissor") ,
                child: Image.asset("image/tesoura.png", height: 100,),
              )
              /*
              Image.asset("image/pedra.png", height: 100,),
              Image.asset("image/papel.png", height: 100,),
              Image.asset("image/tesoura.png", height: 100,)
              */
            ],
          )
        ],
      ),
    );
  }
}
