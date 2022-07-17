import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../constants.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

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
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
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
                          'check out my website https://example.com',
                          subject: 'Look what I made!');
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
            margin: EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                  tag: 1, child: Image.asset('assets/images/pet-cat2.png')),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: 'whiteContainerStack',
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: shadowList,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: shadowList,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFF224645),
                      borderRadius: BorderRadius.circular(23),
                      boxShadow: shadowList,
                    ),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF224645),
                        borderRadius: BorderRadius.circular(23),
                        boxShadow: shadowList,
                      ),
                      child: const Center(
                        child: Text(
                          'Adoption',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
