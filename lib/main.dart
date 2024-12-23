import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ubiint/AddWidgets.dart';
import 'package:ubiint/firebase_options.dart';
import 'package:uuid/uuid.dart';




 Future<void>  main() async
{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(

 );

  runApp(Intern());
}


class Intern extends StatelessWidget {
  const Intern({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: MainPage(status: {},),
    );
  }

}


/*
class MainPage extends StatefulWidget {
  Map status = {};

  MainPage({super.key, required this.status});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool errorStatus = false;
  final TextEditingController textDetails = TextEditingController();

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();

  String? photoUrl;
  XFile? selectedFile;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Assignment App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(25),
            width: _width,
            height: _height * 0.70,
            child: Card(
              color: Colors.green.shade50,
              child: (widget.status.isEmpty)
                  ? const Center(
                child: Text(
                  "No Widgets is Added",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              )
                  : Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (errorStatus)
                      const Center(
                        child: Text(
                          "Add at least one widget to Save",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    if (widget.status['text'])
                      TextField(
                        controller: textDetails,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          border: const OutlineInputBorder(),
                          hintText: "Enter Text",
                        ),
                      )
                    else
                      const SizedBox(height: 70),
                    const SizedBox(height: 30),
                    if (widget.status['image'])
                      InkWell(
                        onTap: () async {
                          selectedFile = await _imagePicker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade300,
                          ),
                          height: 100,
                          width: _width,
                          child: Center(
                            child: selectedFile != null && photoUrl == null
                                ? Image.file(
                              File(selectedFile!.path),
                              fit: BoxFit.cover,
                            )
                                : const Text("Upload Image"),
                          ),
                        ),
                      )
                    else
                      const SizedBox(height: 100),
                    const SizedBox(height: 30),
                    if (widget.status['button'])
                      ElevatedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.black),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.green.shade300,
                          ),
                        ),
                        onPressed: () async {
                          errorStatus = await saveFunction(
                            status: widget.status,
                          );
                          setState(() {
                            errorStatus;
                          });
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    else
                      const SizedBox(),
                    const SizedBox(height: 30),
                    if (photoUrl != null)
                      Image.network(photoUrl!, height: 100, width: _width),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addwidgets(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Add Widgets",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                const BorderSide(color: Colors.black),
              ),
              backgroundColor: MaterialStateProperty.all(
                Colors.green.shade300,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> saveFunction({required Map status}) async {
    if (status['button'] == true && status['image'] == false && status['text'] == false) {
      return true;
    } else {
      if (selectedFile != null) {
        String fileName =
            DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
        Reference ref = _firebaseStorage.ref().child("uploads/$fileName");
        UploadTask uploadTask = ref.putFile(
          File(selectedFile!.path),
        );

        TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
        photoUrl = await snapshot.ref.getDownloadURL();
        setState(() {});
      }
      if (textDetails.text.isNotEmpty) {
        print("Text Details: ${textDetails.text}");
      }
      print("Data to be stored on Firebase");
    }
    return false;
  }
}
*/

//
//
// class MainPage extends StatefulWidget {
//   Map status = {};
//
//   MainPage({super.key, required this.status});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   bool errorStatus = false;
//   final TextEditingController textDetails = TextEditingController();
//
//   final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
//   final ImagePicker _imagePicker = ImagePicker();
//
//   String? photoUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     double _width = MediaQuery.of(context).size.width;
//     double _height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text("Assignment App"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.all(25),
//             width: _width,
//             height: _height * 0.70,
//             child: Card(
//               color: Colors.green.shade50,
//               child: (widget.status.isEmpty)
//                   ? const Center(
//                 child: Text(
//                   "No Widgets is Added",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                   ),
//                 ),
//               )
//                   : Container(
//                 margin: const EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     if (errorStatus)
//                       const Center(
//                         child: Text(
//                           "Add at least one widget to Save",
//                           style: TextStyle(fontSize: 30),
//                         ),
//                       ),
//                     if (widget.status['text'])
//                       TextField(
//                         controller: textDetails,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.grey.shade50,
//                           border: const OutlineInputBorder(),
//                           hintText: "Enter Text",
//                         ),
//                       )
//                     else
//                       const SizedBox(height: 70),
//                     const SizedBox(height: 30),
//                     if (widget.status['image'])
//                       InkWell(
//                         onTap: () async {
//                           XFile? file = await _imagePicker.pickImage(
//                             source: ImageSource.gallery,
//                           );
//                           if (file != null) {
//                             String fileName =
//                                 DateTime.now().millisecondsSinceEpoch
//                                     .toString() +
//                                     '.jpg';
//                             var ref = _firebaseStorage
//                                 .ref()
//                                 .child("uploads/$fileName");
//                             var uploadTask = ref.putFile(
//                               File(file.path),
//                             );
//
//                             TaskSnapshot snapshot =
//                             await uploadTask.whenComplete(() {});
//                             String url = await snapshot.ref.getDownloadURL();
//                             setState(() {
//                               photoUrl = url;
//                             });
//                           }
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.grey.shade300,
//                           ),
//                           height: 200,
//                           width: _width,
//                           child: photoUrl == null
//                               ? const Center(
//                             child: Text("Upload Image"),
//                           )
//                               : Image.network(photoUrl!,fit: BoxFit.fill,),
//                         ),
//                       )
//                     else
//                       const SizedBox(height: 200),
//                     const SizedBox(height: 30),
//                     if (widget.status['button'])
//                       ElevatedButton(
//                         style: ButtonStyle(
//                           side: MaterialStateProperty.all(
//                             const BorderSide(color: Colors.black),
//                           ),
//                           shape: MaterialStateProperty.all(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                           ),
//                           backgroundColor: MaterialStateProperty.all(
//                             Colors.green.shade300,
//                           ),
//                         ),
//                         onPressed: () async {
//                           errorStatus = await saveFunction(
//                             status: widget.status,
//                           );
//                           setState(() {
//                             errorStatus;
//                           });
//                         },
//                         child: const Text(
//                           "Save",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       )
//                     else
//                       const SizedBox(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Addwidgets(),
//                 ),
//               );
//             },
//             child: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Text(
//                 "Add Widgets",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             style: ButtonStyle(
//               side: MaterialStateProperty.all(
//                 const BorderSide(color: Colors.black),
//               ),
//               backgroundColor: MaterialStateProperty.all(
//                 Colors.green.shade300,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<bool> saveFunction({required Map status}) async {
//     if (status['button'] == true && status['image'] == false && status['text'] == false) {
//       return true;
//     } else {
//       if (photoUrl != null) {
//         print("Image URL: $photoUrl");
//       }
//       if (textDetails.text.isNotEmpty) {
//         print("Text Details: ${textDetails.text}");
//       }
//       print("Data to be stored on Firebase");
//     }
//     return false;
//   }
// }


// ! original coee
class MainPage extends StatefulWidget {

   Map status={};


   MainPage({ super.key,required this.status});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool errorStatus=false;
  final TextEditingController textDetails=TextEditingController();


 final FirebaseStorage _firebaseStorage=FirebaseStorage.instance;
 final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;

 late XFile file;
 String photoUrl="";
 String replaceText="";

  @override
  Widget build(BuildContext context) {


    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    final ImagePicker _imagePicker=ImagePicker();







    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Text("Assignment App"),
        centerTitle: true,

      ),


      body: Column(
        children: [


          Container(
            margin: EdgeInsets.all(25),
            width: _width,
            height: _height*0.70,

            child: Card(
                color: Colors.green.shade50,

                child:(widget.status.isEmpty)?
                Center(
                  child: (Text("No Widgets is Added",style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 30,

                  ),)),
                ):
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          (errorStatus)?Center(
                            child: (Text("Add atleast one widget to Save",style: TextStyle(
                              fontSize: 30
                            ),)),
                          ):(SizedBox()),

                         (widget.status['text'])?

                         (replaceText.length==0)
                         ?
                         (TextField(
                           controller: textDetails,

                           decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.grey.shade300,
                             border: InputBorder.none
                                 ,hintText: "Enter Text",
                             hintStyle: TextStyle(
                               color: Colors.black,

                             )
                           ),
                         )):(Text("$replaceText",style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,

                           color: Colors.black
                         ),)):


                         SizedBox(height: 70,),
                          SizedBox(height: 30,),


                          (widget.status['image'])?

                          (photoUrl.length==0)? InkWell(
                            onTap: () async{
                             await _imagePicker.pickImage(source: ImageSource.gallery).then((f) async {
                               // Firebase Storage COde

                               if(f!=null)
                                 {

                                   setState(() {
                                     file=f;
                                   });
                                   print("file returned from image is ${file}");
                                 }










                             });


                            },
                            child: (Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Colors.grey.shade300
                              ),
                              height: 200,
                              width: _width,
                              child: Center(child: Text("Upload Image")),
                            )),
                          ):Expanded(child: Image.file(File(file.path),width: _width,height: 200,fit: BoxFit.fill,))
                              
                              
                              :



                          (SizedBox(height: 200,)),


                          SizedBox(height: 50,),


                          (widget.status['button'])?(
                              ElevatedButton(

                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    BorderSide(
                                      color: Colors.black
                                    ),

                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)
                                    ),

                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.green.shade300
                                  )
                                ),
                            onPressed: () async{

                             errorStatus=await  saveFunction(status: widget.status);
                              setState(() {
                                errorStatus;
                              });
                            },
                            child: Text("Save",style: TextStyle(
                              color: Colors.black
                            ),),
                          )):SizedBox(

                          )



                        ],
                      ),
                    )





            ),
          ),


          SizedBox(height: 20,),
          ElevatedButton(





              onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>Addwidgets()));

          }, child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text("Add Widgets",style: TextStyle(
              color: Colors.black,
              fontSize: 18
            ),),
          )

          ,style: ButtonStyle(

            side: MaterialStateProperty.all(
                BorderSide(
                    color: Colors.black
                )
            ),

            backgroundColor: MaterialStateProperty.all(
              Colors.green.shade300
            ),
          ),
          )




        ],
      ),

    );
  }



  Future<bool> saveFunction({required Map status}) async
  {


    if(status['button']==true && status['image']==false && status['text']==false)
      {
        return true;
      }
    else if(status['button']==true && status['image']==true && status['text']==false)
      {

        // Image needs to be stored on firebase
        saveImageInFirebase();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green.shade300,

            content: Text("SUCCESSFULLY SAVED IMAGE IN FIREBASE")));
        print("Data to be stored on Firebase");

      }
    else if(status['button']==true && status['image']==true && status['text']==true)
      {
        // Image and text to be stored on firebase

       await saveTextInFireBase();
       await saveImageInFirebase();

       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           backgroundColor: Colors.green.shade300,
           content: Text("SUCCESSFULLY SAVED")));

      }
    else if(status['button']==true && status['image']==false && status['text']==true)
      {
        await saveTextInFireBase();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green.shade300,
            content: Text("SUCCESSFULLY SAVED TEXT IN FIREBASE")));

      }


    return false;
  }


  Future<void> saveImageInFirebase() async
  {


    var dataPath= await _firebaseStorage.ref().child("INTERNSHIP").child("${Uuid().v4()}.jpg");

    File f=File(file.path);
    print("Fiel is $f");
    await dataPath.putFile(f).then((val) async{
      print("file inserted");

    photoUrl=await val.ref.getDownloadURL().toString();
    print("pho $photoUrl");

    });
    setState(() {
      photoUrl;
    });
  }


  Future<void> saveTextInFireBase() async
  {
    var txt=textDetails.text.toString();
  if(txt.isNotEmpty)

    await firebaseFirestore.collection("INTERNSHIP").doc().set({

      "data":txt
    });

    setState(() {
      replaceText=txt;
    });
  }

}


