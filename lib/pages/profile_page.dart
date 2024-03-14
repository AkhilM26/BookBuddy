import 'package:akhil_book_buddy/pages/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:akhil_book_buddy/pages/home_page.dart';


class ProfilePage extends StatelessWidget {
  final String userName;
  final String language;
  final Function changeLanguage;

  const ProfilePage({Key? key, required this.userName, required this.language, required this.changeLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      backgroundColor: Colors.cyanAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage : AssetImage('assets/profile.png'),
              radius: 100,
            ),
            Text(
                "Name: $userName",
                    style: TextStyle( fontSize: 25),
            ),
            Text(
                "Language: $language",
              style: TextStyle( fontSize: 25),
            ),
            Text(
                "change Language: ",
              style: TextStyle( fontSize: 25),
            ),
            DropdownButton<String>(
              value: language,
              items: const [
                DropdownMenuItem(
                  value: "English",
                  child: Text(
                      "English",
                    style: TextStyle( fontSize: 25),
                  ),
                ),
                DropdownMenuItem(
                  value: "Kannada",
                  child: Text(
                      "Kannada",
                    style: TextStyle( fontSize: 25),
                  ),
                ),
                DropdownMenuItem(
                  value: "Hindi",
                  child: Text(
                      "Hindi",
                    style: TextStyle( fontSize: 25),
                  ),
                ),
                DropdownMenuItem(
                  value: "Telugu",
                  child: Text(
                      "Telugu",
                    style: TextStyle( fontSize: 25),
                  ),
                ),
              ],
              onChanged: (value) => changeLanguage,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()), // Replace with your home page
              ),
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
