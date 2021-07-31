import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'views/inputpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //function get datadari db
  Future<List>? getData() async {
    final response = await http.get(
      Uri.parse(
        'http://192.168.100.109/backendflutter/getdata.php',
      ),
    );
    return json.decode(response.body);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD APPS'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            return ItemList(
              list: snapshot.data,
            );
          } else {
            return Center(
              child: Text('Loading'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          //nanti dulu
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => InputData(),
            ),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Card(
              child: ListTile(
                title: Text(list![i]['item_name']),
                leading: Icon(
                  Icons.widgets,
                ),
                subtitle: Text(
                  list![i]['stock'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
