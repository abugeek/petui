import 'package:flutter/material.dart';

import 'package:petui/constants.dart';
import 'package:petui/screens/aboutScreen.dart';
import '/models/drawerItems.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 40, left: 15),
      color: primaryGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black45,
                child: Icon(Icons.person),
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Miroslava Savitskaya',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Active status',
                    style: TextStyle(
                      color: Colors.white30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: drawerItems
                .map(
                  (element) => Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AboutScreen();
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            element['icon'],
                            color: Colors.white60,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            element['title'],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            children: [
              const Icon(
                Icons.settings,
                color: Colors.white54,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 1.5,
                height: 20,
                color: Colors.white38,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Log out',
                style: TextStyle(
                  color: Colors.white30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
