import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyCounter extends StatefulWidget{
  var price;
  MyCounter(this.price);
  @override
  counterClass createState() => counterClass(this.price);
}

class counterClass extends State<MyCounter> {
  var price;
  int discount = 0;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  counterClass(var price) {this.price = price;}

  @override
  void initState() {super.initState();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: scaffoldKey,
        appBar: AppBar(
          title: Text("Offer App",
                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Current Product Price: ',
                    style: TextStyle(color: Colors.green, fontSize: 18)),
                Text('${price} L.E',
                    style: TextStyle(color: Colors.pink,fontSize: 21)),
              ],),
            Padding(padding: EdgeInsets.all(20),),

            Row(
              children: [
                Text('Set offer to the product',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold )),
              ],
            ),
            Padding(padding: EdgeInsets.all(10),),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 50,
                  child: FloatingActionButton(
                     child: Text('+',
                            style: TextStyle(color: Colors.black,fontSize: 22,),),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                     ),
                    onPressed: increamentDiscount,
                  ),
                ),
                Padding(padding: EdgeInsets.all(20),),
                Text(
                   '${discount} %',
                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.all(20),),
                SizedBox(
                  width: 80,
                  height: 50,
                  child: FloatingActionButton(
                    child: Text('-',
                      style: TextStyle(color: Colors.black,fontSize: 22,),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: decreamentDiscount,
                  ),
                ),
              ],),
            Padding(padding: EdgeInsets.all(20),),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Price After apply offer: ',
                    style: TextStyle(fontSize: 18)),
                Text(
                    '${((discount/100)*price) + price} L.E',
                    style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      )
    );
  }

  void increamentDiscount() {
    setState(() {
      if(discount<100) {
        discount+=10;
      }
    });
  }

  void decreamentDiscount() {
    setState(() {
      if(discount>0) {
        discount-=10;
      }
    });
  }
}