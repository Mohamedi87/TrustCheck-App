import 'dart:math';  
import 'package:flutter/material.dart';  
import 'widgets.dart';  

class MyHomePage extends StatefulWidget {  
  const MyHomePage({super.key, required this.title});  
  final String title;  

  @override  
  State<MyHomePage> createState() => _MyHomePageState();  
}  

class _MyHomePageState extends State<MyHomePage> {  
  int num1 = Random().nextInt(100);  
  int num2 = Random().nextInt(100);  
  late String operation = generateRandomOperation();  
  bool? isCorrect;  

  void generateNumbers() {  
    setState(() {  
      num1 = Random().nextInt(100);  
      num2 = Random().nextInt(100);  
    });  
  }  

  String generateRandomOperation() {  
    final operations = ['+', '-', '/', '*'];  
    return operations[Random().nextInt(operations.length)];  
  }  

  bool checkAnswer(String userAnswer) {  
    int result = 0;  
    switch (operation) {  
      case '+':  
        result = (num1 + num2);  
        break;  
      case '-':  
        result = (num1 - num2);  
        break;  
      case '*':  
        result = (num1 * num2);  
        break;  
      case '/':  
        result = num1 ~/ num2;  
        break;  
    }  

    int userValue = int.tryParse(userAnswer) ?? 0;  

    return userValue == result;  
  }  

  @override  
  Widget build(BuildContext context) {  
    TextEditingController answerController = TextEditingController();  
    return Scaffold(  
      appBar: AppBar(  
        centerTitle: true,  
        title: Text(  
          widget.title,  
          style: const TextStyle(  
            fontSize: 24,  
            fontWeight: FontWeight.bold,  
          ),  
        ),  
      ),  
      body: SafeArea(  
        child: ListView(children: [  
          Column(  
            children: [  
              Container(  
                alignment: const Alignment(0, -0.92),  
                child: const Text(  
                  'أدخل الإجابة الصحيحة',  
                  style: TextStyle(  
                    fontSize: 18,  
                    fontWeight: FontWeight.w300,  
                    color: Colors.black,  
                    height: 1.7,  
                  ),  
                ),  
              ),  
              _buildReadOnlyTextField(num1.toString(), context),  
              Container(  
                margin: const EdgeInsets.only(top: 22),  
                child: Text(  
                  operation,  
                  style: const TextStyle(  
                    fontSize: 30,  
                  ),  
                ),  
              ),  
              _buildReadOnlyTextField(num2.toString(), context),  
              Container(  
                margin: const EdgeInsets.only(top: 22),  
                child: const Text(  
                  '=',  
                  style: TextStyle(  
                    fontSize: 32,  
                  ),  
                ),  
              ),  
              _buildAnswerInputField(answerController),  
              _buildSubmitButton(answerController),  
              const SizedBox(height: 20),  
              assetImage(isCorrect),  
              const SizedBox(height: 30),  
              Align(  
                alignment: Alignment.bottomCenter,  
                child: Padding(  
                  padding: const EdgeInsets.only(bottom: 10),  
                  child: Container(  
                    padding: const EdgeInsets.only(bottom: 10),  
                    child: const Text(  
                      'Developed by : Mohamed Haj Mousa',  
                      textAlign: TextAlign.center,  
                      style: TextStyle(  
                        fontSize: 17,  
                        fontWeight: FontWeight.bold,  
                        color: Colors.black,  
                      ),  
                    ),  
                  ),  
                ),  
              )  
            ],  
          ),  
        ]),  
      ),  
    );  
  }  

  Container _buildReadOnlyTextField(String text, BuildContext context) {  
    return Container(  
      constraints: const BoxConstraints(maxWidth: 180),  
      margin: const EdgeInsets.only(top: 30),  
      alignment: Alignment.center,  
      child: TextField(  
        readOnly: true,  
        controller: TextEditingController(text: text),  
        textAlign: TextAlign.center,  
        style: const TextStyle(  
          fontSize: 20,  
        ),  
        cursorWidth: 1,  
        decoration: const InputDecoration(  
          border: OutlineInputBorder(  
            borderRadius: BorderRadius.all(Radius.circular(10)),  
            borderSide: BorderSide(  
              color: Colors.black,  
              width: 2.0,  
            ),  
          ),  
        ),  
      ),  
    );  
  }  

  Container _buildAnswerInputField(TextEditingController controller) {  
    return Container(  
      constraints: const BoxConstraints(maxWidth: 180),  
      margin: const EdgeInsets.only(top: 30),  
      alignment: Alignment.center,  
      child: TextField(  
        controller: controller,  
        textAlign: TextAlign.center,  
        style: const TextStyle(  
          fontSize: 20,  
        ),  
        cursorWidth: 1,  
        decoration: const InputDecoration(  
          border: OutlineInputBorder(  
            borderRadius: BorderRadius.all(Radius.circular(10)),  
            borderSide: BorderSide(  
              color: Colors.black,  
              width: 2.0,  
            ),  
          ),  
        ),  
      ),  
    );  
  }  

  Widget _buildSubmitButton(TextEditingController answerController) {  
    return Container(  
      margin: const EdgeInsets.only(top: 22),  
      child: OutlinedButton(  
        style: OutlinedButton.styleFrom(  
          backgroundColor: Colors.white,  
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),  
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(10),  
            side: const BorderSide(  
              width: 1.0,  
            ),  
          ),  
        ),  
        onPressed: () {  
          final userAnswer = answerController.text;  
          setState(() {  
            isCorrect = checkAnswer(userAnswer);  
          });  
        },  
        child: const Text(  
          'أدخل',  
          style: TextStyle(  
            fontSize: 22,  
            fontWeight: FontWeight.bold,  
          ),  
        ),  
      ),  
    );  
  }  
}