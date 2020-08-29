import 'package:flutter/material.dart';
import 'package:spelling/theme.dart';

import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.defaultMode,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputController = TextEditingController();

  int errorType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                Icons.font_download,
                color: Theme.of(context).primaryColor,
                size: 40.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Spelling Generator",
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: 250, maxWidth: 350),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                  style: Theme.of(context).textTheme.display3,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                  controller: inputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    labelText: 'Inserire Codice',
                    errorText: _errorType(),
                    errorStyle: TextStyle(fontSize: 15),
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  focusNode: null),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.only(
                        left: 50, right: 50, top: 20, bottom: 20),
                    color: Theme.of(context).buttonColor,
                    onPressed: _showSpelledDialog,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      'Cerca',
                      style: Theme.of(context).textTheme.display2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSpelledDialog() async {
    String text = inputController.text;

    if (text.length == 0) {
      setState(() {
        errorType = 0;
      });
      return;
    }

    if (text.contains(new RegExp(r'[0-9]'))) {
      setState(() {
        errorType = 1;
      });
      return;
    }

    if (text.contains(new RegExp(r'[!@$#<>?":_`~;[\]\\|=+)(*&^%-]'))) {
      setState(() {
        errorType = 2;
      });
      return;
    }

    setState(() {
      errorType = -1;
    });

    List<String> spelled = getSpelling(text);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Spelling'),
          content: Container(
              height: spelled.length * 19.toDouble(),
              width: 0,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: spelled.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Row(children: [
                      Container(
                        width: 15,
                        child: Text(
                          spelled[index][0],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(spelled[index]),
                    ]);
                  })),
        );
      },
    );
  }

  String _errorType() {
    switch (errorType) {
      case 0:
        return 'E\' necessario inserire il codice'; // empty train code
      case 1:
        return 'Il codice contiene numeri'; //invalid train code (number)
      case 2:
        return 'Il codice contiene caratteri speciali'; //invalid train code (special character)
      default:
        return null;
    }
  }
}
