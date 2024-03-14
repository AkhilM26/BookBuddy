import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:akhil_book_buddy/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = "";
  bool isDarkTheme = false;
  String userName = "John Doe";
  String language = "English";

  void switchTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  void changeLanguage(String newLanguage) {
    setState(() {
      language = newLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      home: MyHomePage(
        isDarkTheme: isDarkTheme,
        switchTheme: switchTheme,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final bool isDarkTheme;
  final Function switchTheme;
  final books = [
    {"title": "The Lord of the Rings", "author": "J.R.R. Tolkien", "available": true},
    {"title": "Pride and Prejudice", "author": "Jane Austen", "available": false},
    {"title": "To Kill a Mockingbird", "author": "Harper Lee", "available": true},
    {"title": "A Tale of Two Cities", "author": "Charles Dickens", "available": true},
    {"title": "Harry Potter and the Philosopher's Stone", "author": "Lew Wallace", "available": false},
    {"title": "And Then There Were None ", "author": "Louise Hay", "available": true},
    {"title": "The Lion, the Witch and the Wardrobe", "author": "Johanna Spyri", "available": true},
    {"title": "The Da Vinci Code", "author": "Benjamin Spock", "available": false},
    {"title": "The Catcher in the Rye", "author": "Anna Sewell", "available": true},
    {"title": "One Hundred Years of Solitude", "author": "Jack Higgins", "available": true},

  ];

  MyHomePage({Key? key, required this.isDarkTheme, required this.switchTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => switchTheme,
          ),
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ProfilePage(userName: 'Akhil', language: 'English', changeLanguage: FlutterError.demangleStackTrace,))))
        ],
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: "Search Book",
              prefixIcon: const Icon(Icons.search), // Add search icon as prefix
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(
                      "${books[index]["title"]}",
                    ),
                    // title: Text(books[index]["title"]),
                    subtitle: Text(
                        "by ${books[index]["author"]}" +  "${(books[index]["available"] != null ? " - Available" : " - Not Available")}"),
                  );
                },
              ),
            ),
          ),
          Switch(
            value: isDarkTheme,
            onChanged: (value) => switchTheme(),
          ),
        ],
      ),
    );
  }
}
