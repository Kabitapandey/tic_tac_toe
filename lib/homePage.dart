import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _StateHomePage createState() => _StateHomePage();
}

class _StateHomePage extends State<HomePage> {
// To add icon image
  var cross = Icon(Icons.cancel, size: 80);
  var circle = Icon(
    Icons.circle,
    size: 80,
  );
  var edit = Icon(Icons.crop_square_outlined, size: 80.0);

  bool isCross = true;
  String message;
  List<String> gameState;

  // Initialize box with empty value
  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = '';
    super.initState();
  }

  // To play a game
  playGame(int index) {
    if (gameState[index] == "empty") {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = "circle";
        }
      });
      isCross = !isCross;
      checkWin();
    }
  }

  // Reset game
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = '';
    });
  }

// to get icon image
  Icon getImage(String title) {
    switch (title) {
      case 'empty':
        return edit;
        break;
      case 'cross':
        return cross;
        break;

      case 'circle':
        return circle;
        break;
    }
  }

// check for winning
  checkWin() {
    if (gameState[0] != 'empty' &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = gameState[0] + " win";
      });
    } else if (gameState[3] != 'empty' &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = gameState[3] + " win";
      });
    } else if (gameState[6] != 'empty' &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = gameState[6] + " win";
      });
      resetGame();
    } else if (gameState[0] != 'empty' &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = gameState[0] + " win";
      });
      resetGame();
    } else if (gameState[1] != 'empty' &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = gameState[1] + " win";
      });
    } else if (gameState[2] != 'empty' &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = gameState[2] + " win";
      });
    } else if (gameState[0] != 'empty' &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = gameState[0] + " win";
      });
    } else if (gameState[2] != 'empty' &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = gameState[2] + " win";
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        this.message = "Game draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0),
                  itemCount: gameState.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 100.0,
                        width: 100.0,
                        child: MaterialButton(
                          onPressed: () => playGame(index),
                          child: getImage(gameState[index]),
                        ));
                  },
                ),
              ),
              Text(
                "$message",
                style: TextStyle(fontSize: 50.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: resetGame,
                child: Text("Reset",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0)),
                color: Colors.blue[900],
              )
            ],
          ),
        ));
  }
}
