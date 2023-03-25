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
        title: Text(widget.disease.name),
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
              Text(widget.disease.name),
              Text('Disease Name\n' + widget.disease.name),
              Text('Plant Name\n' + widget.disease.plantName),
              Text('Ciri - ciri'),
              for (var ciri in widget.disease!.nutshell) Text(ciri + "."),
              Text('Disease ID\n' + widget.disease.id),
              Text('Sympton\n' + widget.disease.symptom),
            ],
          )
        ],
      ),
    );
  }
}
