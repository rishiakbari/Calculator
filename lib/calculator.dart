import 'package:demo/button_value.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key,});

  static const routeName = '/first';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> with SingleTickerProviderStateMixin  {

  String number1 = "";  // .0-9
  String operand = ""; // +-*/
  String number2 = "";//  .0-9

  @override
  Widget build(BuildContext context) {
    final screenSized = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor:const  Color(0xFF080708),
        resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            //OUTPUT
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child:  Text(
                    '$number1$operand$number2'.isEmpty
                    ?"0"
                    :'$number1$operand$number2',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFe6e8e6)
                  ),
                  textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),

            // BUTTON
            Wrap(
              children:
              Btn.buttonValues.map((value) => 
              SizedBox(
                width: value == Btn.n0 ? screenSized.width/2  :  (screenSized.width/4),
                height: screenSized.height/9,
                child: buildButton(value)
                ),
              ).
              toList(),
            )
          ],
        ),
      ),
    );
  }

  void onBtnTap(String value){

    // appendValue(value);
  }
  

//   void appendValue(String value){

//      // if is oprend and "."
//     if(value!=Btn.dot && int.tryParse(value)==null){

//       if(operand.isNotEmpty && number2.isNotEmpty){

//       }
//       operand = value;
//     }
//     // assign value to number1 variable
//     else if(number1.isEmpty || operand.isEmpty){

//       // check if value  is "." || ex: number = "1.2"
//       if(value == Btn.dot && number1.contains(Btn.dot))return;
//       if(value == Btn.dot && (number1.isEmpty || number1 == Btn.n0))return;
//       // number1 = "" | "0"
//       value = "0.";
//     }
//     number1 += value;
//   }

//   // assign value to number2 variable
//   else if(number2.isEmpty || operand.isNotEmpty){

//       // number1="1.2"
//       if(value == Btn.dot && number2.contains(Btn.dot))return;
//       if(value == Btn.dot && (number2.isEmpty || number2 == Btn.n0))return;
//       // number1 = "" | "0"
//       value = "0.";
//     }

//     number2 += value;
// }
//       number1 += value;
//       operand += value;
//       number2 += value;

//     setState(() {
      
//     });
// }


  Widget buildButton(value){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: [Btn.del,Btn.clr]
        .contains(value)?
       const Color(0xFF2C2C2C)
        :[
          Btn.per,
          Btn.multiply,
          Btn.add,
          Btn.subtract,
          Btn.calculate,
          Btn.divide,
          ].contains(value)?const Color(0xFF2C2C2C):Colors.black,
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
          color: Colors.black45
          ),
          borderRadius: BorderRadius.circular(100)),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
            value, 
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
            ),
          ),
      ),
    );

  }
}