import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:social_media_integration/auth_service.dart';
import 'package:social_media_integration/detailPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          child: Column(children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            gradient: LinearGradient(
                colors: [
                  Color(0xff955cd1),
                  Color(0xff3fa2fa),
                ],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                stops: [0.5, .95]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              Expanded(
                flex: 2,
                // ignore: prefer_const_constructors
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  // ignore: prefer_const_constructors
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Social Media Integration",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: CircleAvatar(
                              child: Image.asset('assets/img/spark.jpg'),
                              radius: 70,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Login With",
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: SignInButton(Buttons.Google,
                                onPressed: () async {
                              await Firebaseservices().sigInWithGoogle();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailPage()));
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              width: 300,
                              height: 50,
                              child: SignInButton(
                                Buttons.FacebookNew,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        )
      ])),
    );
  }
}
