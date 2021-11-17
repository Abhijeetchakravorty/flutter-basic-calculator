import 'package:flutter/material.dart';
class CalcButton extends StatelessWidget {
        final String text;
        final Function callback;
        const CalcButton({
                Key? key,
                required this.text,
                required this.callback,
        }): super(key: key);
        
        @override
        Widget build(BuildContext context) {                
                return Container(
                        margin: EdgeInsets.all(10),
                        child: SizedBox(
                                height: 65,
                                width: 65,
                                child: ElevatedButton(
                                        style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor: Colors.teal,
                                                onSurface: Colors.grey,
                                                elevation: 3,
                                                textStyle: TextStyle(fontSize: 20),
                                                shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(50)
                                                )
                                        ),
                                        child: Text(text), 
                                        onPressed: () {
                                                callback(text);
                                        }
                                )
                        ),
                );
        }
}