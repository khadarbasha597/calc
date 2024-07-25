import 'package:flutter/material.dart';

import 'calculator.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _navigatetocal();
  }
  _navigatetocal()async{
    await Future.delayed(Duration(seconds: 3),(){});
    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context)=> Calculator())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/icon.png'),
                  fit: BoxFit.cover,  // Adjust the fit property as needed (cover, contain, etc.)
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text(
                  'Calculator',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.orange,
              backgroundColor: Colors.grey,

            ),
          ],
        ),
      ),
    );
  }
}
