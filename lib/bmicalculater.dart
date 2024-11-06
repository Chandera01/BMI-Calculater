import 'package:flutter/material.dart';

class BmiFirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BmiFirstScreen();
}
class _BmiFirstScreen extends State<BmiFirstScreen>{

  String bmiStatus = "BMI Status";
  String result = "0";
  TextEditingController ageController = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();

  //Gender Selection
  String selectedGender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 70,
            ),
          ),
          Stack(
            alignment: Alignment.center, // Align text to center of the image
            children: [
              Container(
                child: Center(
                  child: Image.asset(
                    "asset/image/heart-removebg-preview.png",
                    height: 350,
                    width: 350,
                  ),
                ),
              ),
              // This container is now placed on top of the image
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text(
                    "$result",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Color(0xffeb6f62), // Set the text color to stand out
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text("${bmiStatus}",style: TextStyle(fontSize: 45,color: Color(0xff28a68d)),),

          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  selectedGender = "Male";
                  setState(() {

                  });
                },
                child: Column(
                  children: [
                    Text("Male",style: TextStyle(fontSize: 20,color: selectedGender=="Male" ? Colors.blue : Colors.black),),
                    Image.asset("asset/image/male.png",color: selectedGender=="Male" ? Colors.blue : null,),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  selectedGender = "Female";
                  setState(() {

                  });
                },
                child: Column(
                  children: [
                    Text("Female",style: TextStyle(fontSize: 20,color: selectedGender =="Female" ? Colors.pink:Colors.black),),
                    Image.asset("asset/image/female.png",color: selectedGender =="Female" ? Colors.pink : null ,),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text("Age"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: ageController,
                          decoration:  InputDecoration(
                            hintText: "Enter AGE",
                            border:  OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  height: 55,
                  color: Color(0xffd8d8d8),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Height"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: heightcontroller,
                          decoration:  InputDecoration(
                            hintText: "Height(cm)",
                              border:  OutlineInputBorder(
                                  borderSide: BorderSide.none,
                              )
                          ),
                        ),
                      )
                       ],
                  ),
                ),
                Container(
                  width: 2,
                  height: 55,
                  color: Color(0xffd8d8d8),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Weight"),
                      TextField(
                        controller: weightcontroller,
                        decoration: InputDecoration(
                          hintText: "Weight(kg)",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          /*Expanded(
            child: SizedBox(
              height: 2,
            ),
          ),*/
          //Calculated Bmi
          Container(
            height: 70,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){

              double weight = double.parse(weightcontroller.text);
              double height = double.parse(heightcontroller.text)/100;

              double bmi = weight / (height*height);

              result = bmi.toStringAsFixed(1);
              print(result);

              if (bmi < 18.5) {
                bmiStatus = "Underweight";
              } else if (bmi >= 18.5 && bmi < 24.9) {
                bmiStatus = "Healthy";
              } else if (bmi >= 25 && bmi < 29.9) {
                bmiStatus = "Overweight";
              } else {
                bmiStatus = "Obesity";
              }


              setState(() {

              });


            }, child: Text("Calculate BMI",style: TextStyle(fontSize: 30),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff88cfc7),
                  foregroundColor: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )
              ),),
          )
        ],
      ),
    );
  }
}