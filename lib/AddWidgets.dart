import 'package:flutter/material.dart';
import 'package:ubiint/main.dart';



class Addwidgets extends StatefulWidget {
  const Addwidgets({super.key});

  @override
  State<Addwidgets> createState() => _AddwidgetsState();
}

class _AddwidgetsState extends State<Addwidgets> {


  bool isTextChecked=false;
  bool isImageChecked=false;
  bool isButtonChecked=false;


  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade50,

        body: Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Card(
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Checkbox(
                          checkColor: Colors.white, // Color of the checkmark
                          activeColor: Colors.green, // Color of the checkbox when checked
                          shape: CircleBorder(eccentricity: 0.9),
                          value: isTextChecked,
                          onChanged: (val) {
                            setState(() {
                              isTextChecked = val ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Text Widget",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30,),

                Card(
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Checkbox(
                          checkColor: Colors.white, // Color of the checkmark
                          activeColor: Colors.green, // Color of the checkbox when checked
                          shape: CircleBorder(eccentricity: 0.9),
                          value: isImageChecked,
                          onChanged: (val) {
                            setState(() {
                              isImageChecked = val ?? false; // Properly toggle the value
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Image Widget",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 30,),
                Card(
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Checkbox(
                          checkColor: Colors.white, // Color of the checkmark
                          activeColor: Colors.green, // Color of the checkbox when checked
                          shape: CircleBorder(eccentricity: 0.9),
                          value: isButtonChecked,
                          onChanged: (val) {
                            setState(() {
                              isButtonChecked = val ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Button Widget",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),



                SizedBox(height: 70,),
                ElevatedButton(



                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: Colors.black
                        )
                      ),

                      backgroundColor: MaterialStateProperty.all(
                          Colors.green.shade300
                      ),
                    ),
                    onPressed: (){


                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(status: {
                    'button':isButtonChecked,
                    'text':isTextChecked,
                    'image':isImageChecked

                  })));

                }, child: Text(

                  "Import Widgets",style: TextStyle(

                  color: Colors.black
                ),))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
