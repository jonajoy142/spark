import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:social_media_integration/HomePage.dart';
import 'package:social_media_integration/auth_service.dart';
import 'package:social_media_integration/auth_service.dart';

import 'auth_service.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen2 extends StatefulWidget {
  String name;
  String imageUrl;
  String email;
  HomeScreen2(
      {Key? key,
      required this.imageUrl,
      required this.name,
       this.email="jona@gmail.com"})
      : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  var user;

  void get() {
    setState(() {
      user = Firebaseservices().userDetails!;
    });
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text('Social Media Integration App'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.imageUrl),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(widget.name),
            SizedBox(
              height: 20,
            ),
            Text(widget.email),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await Firebaseservices().signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );


    // var crossAxisAlignment;
    // return Container(
    //   child: Scaffold(
    //     backgroundColor: Color.fromARGB(255, 225, 216, 216),
    //     // backgroundColor: Colors.pink[200],
    //     appBar: AppBar(
    //       //backgroundColor: const Color.fromARGB(255, 173, 129, 63),
    //       backgroundColor: Colors.pink,
    //       title: const Text(
    //         "GetInTouch",
    //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    //       ),
    //       centerTitle: true,
    //     ),
    //     body: Center(
    //       child: Container(
    //         width: 300,
    //         height: 480,
    //         decoration: BoxDecoration(
    //           color: Color.fromARGB(255, 140, 171, 218),
    //           borderRadius: const BorderRadius.all(Radius.circular(20)),
    //           border: Border.all(
    //             width: 1,
    //             color: Color.fromARGB(255, 98, 212, 244),
    //           ),
    //         ),
    //         child: Container(
    //           margin: const EdgeInsets.only(bottom: 50),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Container(
    //                 child: CircleAvatar(
    //                   backgroundColor: Colors.white,
    //                   backgroundImage: NetworkImage(widget.imageUrl),
    //                   radius: 36,
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               //Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
    //               Container(
    //                 child: Text(
    //                   widget.name,
    //                   style: const TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 21),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 25,
    //               ),
    //               Text(widget.email,
    //                   style: const TextStyle(
    //                       //color: Color.fromARGB(255, 5, 57, 134),
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white,
    //                       fontSize: 21)),
    //               const SizedBox(
    //                 height: 35,
    //               ),
    //               Container(
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Container(
    //                       width: 130,
    //                       height: 38,
    //                       child: ElevatedButton(
    //                         style: ElevatedButton.styleFrom(
    //                           backgroundColor: Colors.pink,
    //                         ),
    //                         onPressed: () async {
    //                           await Firebaseservices().signOut();

    //                           Navigator.pushReplacement(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) => MyHomePage()));

    //                           // final facebookLogin = FacebookLogin();
    //                           // await facebookLogin.logOut();
    //                           // await FirebaseAuth.instance.signOut();
    //                         },
    //                         child: const Text(
    //                           "Logout",
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.bold, fontSize: 18),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
