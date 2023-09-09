import 'dart:developer';

import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController wt = TextEditingController(text: '178');

  TextEditingController hgt = TextEditingController(text: '74');
  // Declaration
  String resultString = '23.4';
  double result = 0.0;
  double hgtSquare = 0.0;
  bool weight = true;

  bool isEditing = false;

  String texth = '178';
  String textw = '74';

// Function to check if editing or not the textfield
  void toggleEdit() {
    setState(() {
      isEditing = !isEditing;
      if (isEditing) {
        wt.text = textw;
        hgt.text = texth;
      }
    });
  }

// Function to update the Text from Textfield
  void updateText(String newText) {
    setState(() {
      texth = newText;
      textw = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Color.fromRGBO(23, 27, 52, 100),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      backgroundColor: Color.fromRGBO(17, 19, 42, 100),
      // Single child scroll view to allow for pixels to go down
      //otherwise pixel error will show
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0), // main padding from all borders
          child: Column(
            children: [
              // Row since we want containers side by side
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(23, 27, 52, 100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.female,
                        size: 100,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        // To give circular shape and the color and selection
                        // color of border as blue
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(23, 27, 52, 100),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        )),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.male,
                        size: 100,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                width: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(25, 27, 52, 100),
                ),
                // Padding inside the container to adjust title
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    // Alignment of the title to center
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Text(
                          'Your height in CM',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // To detect if box is selected or not
                        GestureDetector(
                          onTap: toggleEdit,
                          child: isEditing
                              // If selected accept value and update the same
                              ? TextField(
                                  controller: hgt,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                  onChanged: updateText,
                                  keyboardType: TextInputType.number,
                                )
                              // If not selected then the static value
                              // remains same
                              : Text(
                                  texth,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // To give spacing
              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                width: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(25, 27, 52, 100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Text(
                          'Your weight in KG',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: toggleEdit,
                          child: isEditing
                              ? TextField(
                                  controller: wt,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                  onChanged: updateText,
                                  keyboardType: TextInputType.number,
                                )
                              : Text(
                                  textw,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your BMI',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              // The result converted to string
              Text(
                resultString,
                // '23.4',
                style: TextStyle(fontSize: 70, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              // Calculate button to run the logic to give result
              ElevatedButton(
                onPressed: () {
                  // Formula = wight(kg) * height(m)^2
                  result = double.parse(wt.text) /
                      (double.parse(hgt.text) /
                          100 *
                          double.parse(hgt.text) /
                          100);
                  // Checking for output (developer log)
                  log(result.toString());
                  setState(() {}); // Update the value
                  // Convert the double to string to display
                  resultString = result.toStringAsFixed(2);
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(600, 70),
                  backgroundColor: Color.fromRGBO(49, 56, 128, 100),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
