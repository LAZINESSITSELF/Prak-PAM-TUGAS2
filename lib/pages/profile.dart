import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tugas2/login.dart';

final Uri _url = Uri.parse('https://www.instagram.com/bayu_amm?igsh=enA1OTYxYWFoa3Fm');

class Profile extends StatelessWidget {
  final String username;

  const Profile({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Text("Username :", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              Text(username, style: const TextStyle(
                fontSize: 30,
              ),),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: _launchUrl, 
                child: const Text("About")
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                }, 
                child: const Text("Logout")
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

}