import 'package:flutter/material.dart';
import 'package:kuispraktpm/disease_data.dart';

class HalamanDetail extends StatefulWidget {
  final Diseases disease;
  const HalamanDetail({Key? key, required this.disease}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Diseases'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              String text = "Ditambah ke favorite";
              SnackBar snackBar = SnackBar(
                content: Text(text),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Image.network(widget.disease.imgUrls),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textBesar(widget.disease.name),
              textSedang('Disease Name'),
              textKecil(widget.disease.name),
              textSedang('Plant Name'),
              textKecil(widget.disease.plantName),
              textSedang('Ciri - ciri'),
              for (var ciri in widget.disease!.nutshell) textKecil(ciri + " "),
              textSedang('Disease ID'),
              textKecil(widget.disease.id),
              textSedang('Sympton'),
              textKecil(widget.disease.symptom),
            ],
          )
        ],
      ),
    );
  }
}

Widget textBesar(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
}

Widget textSedang(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
}

Widget textKecil(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 16),
    textAlign: TextAlign.center,
  );
}
