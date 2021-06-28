import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study work with APIs',
      home: MyHomePage(title: 'Товары'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final config = getConfig();

  getProducts() async {
    var url = Uri.parse('${config['apiUrl']}/products?page=1&per_page=10');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${config['token']}',
    });
    print('Token : ${config['token']}');
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Тут должны быть товары'),
      ),
    );
  }
}
