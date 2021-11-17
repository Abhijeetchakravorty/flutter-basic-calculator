import 'package:flutter/material.dart';
import './widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
        runApp(TabsApp());
}

class TabsApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
                return MaterialApp(
                        home: DefaultTabController(
                                length: 2,
                                child: Scaffold(
                                        appBar: AppBar(
                                                bottom: const TabBar(
                                                                tabs: [
                                                                        Tab(icon: Icon(Icons.add)),
                                                                        Text('Notes')
                                                                ],
                                                        ),
                                                        title: const Text('Utility App'),
                                        ),
                                        body: TabBarView(
                                                children: [
                                                        CalcApp(),
                                                        NoteApp(),
                                                ],
                                        ),
                                ),
                        ),
                );
        }
}

class NoteApp extends StatefulWidget{
        NoteApp({
                Key ? key
        }): super(key: key);

        @override
        NotesAppState createState() => NotesAppState();
}

class NotesAppState extends State<NoteApp> {
        @override
        Widget build(BuildContext context) {
                return MaterialApp(
                        title: 'Calculator',
                        home: Scaffold(
                                body: Column(children: [
                                        TextField(
                                                decoration: InputDecoration(
                                                        hintText: "Type your notes"
                                                )
                                        )
                                ],)
                        )
                );
        }
}

class CalcApp extends StatefulWidget {
        CalcApp({
                Key ? key
        }): super(key: key);

        @override
        CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State < CalcApp > {
        String _history = '';
        String _expression = '';

        void numClick(String text) {
                setState(() {
                        _expression += text;
                });
        }

        void allClear(String text) {
                setState(() {
                        _history = '';
                        _expression = '';
                });
        }

        void clear(String text) {
                setState(() {
                        _expression = '';
                });
        }

        void evaluate(String text) {
                Parser p = Parser();
                Expression exp = p.parse(_expression);
                ContextModel cm = ContextModel();
                double eval = exp.evaluate(EvaluationType.REAL, cm);

                setState(() {
                        _history = _expression;
                        _expression = eval.toString();
                });
        }

        @override
        Widget build(BuildContext context) {
                return MaterialApp(
                        title: 'Calculator',
                        home: Scaffold(
                                backgroundColor: Color(0xFF283637),
                                body: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: < Widget > [
                                                Container(
                                                        padding: EdgeInsets.all(12),
                                                        child: Text(
                                                                _history,
                                                                style: TextStyle(
                                                                        fontSize: 24,
                                                                        color: Color(0xFF545F61),
                                                                ),
                                                        ),
                                                        alignment: Alignment(1, 1),
                                                ),
                                                Container(
                                                        padding: EdgeInsets.all(12),
                                                        child: Text(
                                                                _expression,
                                                                style: TextStyle(
                                                                        fontSize: 48,
                                                                        color: Colors.white,
                                                                ),
                                                        ),
                                                        alignment: Alignment(1, 1),
                                                ),
                                                Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: < Widget > [
                                                                Center(
                                                                        child: CalcButton(text: 'AC', callback: allClear),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: 'C', callback: clear),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '%', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '/', callback: numClick),
                                                                ),
                                                        ]),
                                                Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: < Widget > [
                                                                Center(
                                                                        child: CalcButton(text: '7', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '8', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '9', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '*', callback: numClick),
                                                                ),
                                                        ]),
                                                Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: < Widget > [
                                                                Center(
                                                                        child: CalcButton(text: '4', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '5', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '6', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '-', callback: numClick),
                                                                ),
                                                        ]),
                                                Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: < Widget > [
                                                                Center(
                                                                        child: CalcButton(
                                                                                text: '1',
                                                                                callback: numClick,
                                                                        ),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '2', callback: numClick, ),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '3', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '+', callback: numClick),
                                                                ),
                                                        ]),
                                                Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: < Widget > [
                                                                Center(
                                                                        child: CalcButton(text: '.', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '0', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '00', callback: numClick),
                                                                ),
                                                                Center(
                                                                        child: CalcButton(text: '=', callback: evaluate),
                                                                ),
                                                        ])
                                        ],
                                )
                        )
                );
        }
}