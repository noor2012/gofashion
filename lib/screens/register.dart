import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gofashion/widgets/CustomTextField.dart';
import 'package:http/http.dart' as http;
import 'homePage.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  late bool showprogress ;

  @override
  void initState() {
    showprogress = false;
    super.initState();
  }
  GlobalKey<FormState> globalKey = GlobalKey();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  Future register()async{
    var url = 'https://127.0.0.1:3306/TestAPI/api/seller/register.php';
    Map mapdata = {
      'name' : name.text,
      'email' : email.text,
      'password' : password.text
    };
    Map<String,String> requestHeader = {
      'Content-type' : 'application/json'
    };
    http.Response response = await http.post(Uri.parse(url),body: mapdata,
        headers: requestHeader);
    var data = json.decode(response.body);
    print(data);
    if(data == 401){
      showprogress = false;
      Fluttertoast.showToast(
          msg: "Email already exists!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16);
    }else{
      Fluttertoast.showToast(
          msg: "User Registered Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF006FFF),
                  Color(0xFF008FFF),
                  Color(0xFF006FFF),
            ]),
        ),
        child: Form(
          key: globalKey,
          child: Stack(
            children: [
              // Container(
              //   height:size.height ,
              //   width: size.width,
              //   child:Image.asset("images/Screenshot - 03_08_2021 , 06_05_11 م.png",fit: BoxFit.fill,) ,
              // ),
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.14,
                        ),
                        Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Cairo',
                              fontStyle: FontStyle.italic,
                              fontSize: size.width * 0.13,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        CustomTextField(
                          errortext: 'Name can not be empty!',
                          controller: name,
                          text: "Name",
                          iconData: Icons.email,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        CustomTextField(
                          errortext: 'E-mail can not be empty!',
                          controller: email,
                          text: "E-mail",
                          iconData: Icons.email,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        CustomTextField(
                          errortext: 'Password can not be empty!',
                          controller: password,
                          text: "Password",
                          iconData: Icons.lock,
                          icon: Icons.remove_red_eye,
                        ),
                        SizedBox(
                          height: size.height * 0.09,
                        ),
                        MaterialButton(
                          elevation: 6,
                          color: Colors.white,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 100.0,vertical: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            if(globalKey.currentState!.validate()){
                              register();
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                            }
                            // if (globalKey.currentState!.validate()) {
                            //   globalKey.currentState!.save();
                            //   try {
                            //     auth.Signin(
                            //         email.text, password.text);
                            //
                            //     Navigator.pushReplacement(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 HomePage()));
                            //   } catch (e) {
                            //     Scaffold.of(context).showSnackBar(SnackBar(
                            //       backgroundColor: Colors.white,
                            //       content: Text(
                            //         "invalid!",
                            //         style: TextStyle(
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 16),
                            //       ),),);
                            //   }
                            // }
                          },
                          child:  showprogress?
                          SizedBox(
                            height:30, width:30,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.orange[100],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                            ),
                          ):Text(
                            "Register",
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: size.width * 0.06,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.05),
                            ),
                            SizedBox(width: size.width * 0.02,),
                            GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()));
                                },
                                child: Text(
                                  "Signin",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.05),
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
