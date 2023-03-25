import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'halaman-detail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Diseases'),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: listDisease.length,
          itemBuilder: (context, index) {
            final Diseases disease = listDisease[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HalamanDetail(disease: disease);
                }));
              },
              child: Card(
                child: Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 3,
                        child: Image.network(disease.imgUrls)),
                    textSedang(disease.name),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Widget textSedang(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}
