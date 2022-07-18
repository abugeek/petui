import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Future<void>? _launched;

  String url = 'https://www.youtube.com/c/TheGrowingDeveloper/';

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blueGrey.shade300,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await Share.share(
                          'check out the project https://github.com/abugeek/petui',
                          subject: 'PetUI created with Flutter');
                    },
                    icon: const Icon(
                      Icons.ios_share_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 55),
            child: const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 26,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Huge Thanks to the YouTube channel '),
                  TextSpan(
                    text: '"The Growing Developer" ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  TextSpan(
                      text:
                          'for helping me learn the concepts of building beautiful UI using Flutter.'),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.youtube,
                  color: Colors.red,
                  size: 50,
                ),
                onPressed: () {
                  launchURL(url);
                  url = 'https://www.youtube.com/c/TheGrowingDeveloper/';
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
