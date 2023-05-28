import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'favorites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isliked = false;
  String wordpaisfav = " ";
  List<String> favs = [];
  WordPair randword = WordPair('hello', 'world');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.favorite_outline_rounded),
        title: Text("Shared Pref Demo"),
      ),
      body: Container(
        color: Colors.orange[50],
        child: Row(
          children: [
            Container(
              color: Colors.white,
              width: 50,
              child: Column(
                children: [
                  const SizedBox(
                    height: 11,
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.home,
                            color: Colors.deepOrange,
                            size: 35,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.deepOrange,
                            size: 35,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Favourites(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Wrap(
                      children: [
                        Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "$randword",
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            wordpaisfav = randword.toString();
                            favs.add(wordpaisfav);
                          });
                        },
                        icon: Icon(Icons.favorite_outline_rounded),
                        label: Text("Like"),
                      ),
                      const SizedBox(width: 10,),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            randword = WordPair.random();
                          });
                        },
                        child: Text("Next"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
