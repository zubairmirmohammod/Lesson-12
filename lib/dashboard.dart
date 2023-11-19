import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lessone_11/home_page_less12.dart';
import 'package:lessone_11/storage_utils.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  final _key= GlobalKey<FormState>();
  TextEditingController nameCtrl= TextEditingController();
  TextEditingController emailCtrl= TextEditingController();
  TextEditingController passCtrl= TextEditingController();

  bool secureText= true;
  final greenColor=Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: greenColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _key,
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox (height: 20.0),
                    CircleAvatar(
                      radius: 40.0,
                      backgroundColor:greenColor,
                      child: Icon (Icons.person,size: 60.0),
                    ),
                    Gap(20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: TextFormField(
                        controller: nameCtrl,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your name',
                          contentPadding: EdgeInsets.only(left: 10.0)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty Field';
                          }
                        },
                      ),
                    ),

                    Gap(20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: TextFormField(
                        controller: emailCtrl,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.only(left: 10.0)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty Field';
                          }
                        },

                      ),
                    ),
                    Gap (20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: TextFormField(
                        controller: passCtrl,
                        obscureText: secureText,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                            contentPadding: EdgeInsets.only(left: 10.0,top: 15.0),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                secureText=!secureText;
                              });
                            },
                              child: Icon (
                                secureText?Icons.remove_red_eye_outlined: Icons.remove_red_eye,color: Colors.deepPurple,))
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty Field';
                          }
                        },

                      ),
                    ),

                    Gap(30.0),
                     Container(
                       width: MediaQuery.of(context).size.width,
                       child: ElevatedButton(onPressed: (){

                         if(_key.currentState!.validate()) {
                           _key.currentState!.save();
                           StorageUtils.setLoginData(false);
                           Navigator.push(context,MaterialPageRoute(builder: (_)=>HomePageLess12()));
                           print(nameCtrl.text);
                           print(emailCtrl.text);
                           print(passCtrl.text);

                         }


                       } ,
                         style: ElevatedButton.styleFrom(backgroundColor: greenColor),
                         child: Text('Registration', style: TextStyle (fontSize: 20.0),),),
                     ),

                

                  ],

                ),
              ),
            ),
          ),
        ),
      )
      );
  }
}
