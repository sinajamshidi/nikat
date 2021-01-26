import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class JsonParser extends StatefulWidget {
  @override
  _JsonParserState createState() => _JsonParserState();
}

class _JsonParserState extends State<JsonParser> {
  List Articles = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("News")),
      ),
      body: _bodyBuilding(),
    );
  }

  Widget _bodyBuilding() {
    return new Container(
      child: ListView.builder(
          itemCount: Articles.length,
          itemBuilder: (BuildContext context, indext) {
            var article = Articles[indext];

            return new Card(
              elevation: 10,
              margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
              child: ListTile(
                subtitle: ListTile(
                  title: Text(
                    article['title'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Detailed: " + " " + article['description'],
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                title: Image.network(
                  article['urlToImage'],
                  height: 200,
                  width: 200,
                ),
              ),
            );
          }),
    );
  }

  void getdata() async {
    var url =
        'https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=3309b7e1283f41c7b1d4b5e63c915c33';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      Articles = jsonResponse['articles'];

      setState(() {});
    }
  }
}
