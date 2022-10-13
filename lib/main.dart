// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'constans.dart';
import 'test-cevaplari.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.teal,
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> iconssCek = [];

  TestVeri test_1 = TestVeri(); //bunu yapmamaızın sebebi nesne tabanlı programlama olan "Abstraction / Soyutlama" ve bu bir obje,

  void butonFonksiyonu(bool secilenButon) {
    if (test_1.testBittiMi()) 
    {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('OYUN BİTTİ'),
            content: const Text('Yeniden başlamak için butuna basın..'),
            actions: <Widget>[
              TextButton(
                child: const Text('Yeniden Başla!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      setState(() {
        test_1.indexSifirla();
        iconssCek = [];
      });
      
    }
    else {
      setState(() {
        if (test_1.getSoruYaniti() == secilenButon) {
          iconssCek.add(kDogruCek);
          test_1.sonrakiSoru();
        } else {
          iconssCek.add(kYanlisCek);
          test_1.sonrakiSoru();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Wrap(
          children: const <Widget>[
            Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(''),
            ),
            ),
          ],
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: const <Widget>[
            Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                '📚 BİR BİLGİM VAR 📚',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ],
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 5,
          spacing: 5,
          children: iconssCek,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        butonFonksiyonu(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.green[400],
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        butonFonksiyonu(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
