import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key});

  @override
  LoginpageState createState() => LoginpageState();
}

class LoginpageState extends State<Loginpage> {
  int _currentStep = 0;

  final List<String> stepImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiTc_iXFzTsyd3P3EiZL59Uq2IeU5spYlBJh2RiRd1bQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThIFh7wdQtB1StJgC_wOXliQ_dPgbKRdNq9nhnlT-mrA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3qQaouLnPTzYDLmXxDXBFJGUE7ATD9AorrOeW1ja2Cg14WR3H6BVCNxSiaF2qeUOYsN0&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-D0_WS9GogTGQoQIrRG6EjZaVN_Wku94tAlJ6mEB6iw&s',
  ];

  final List<String> stepDescriptions = ['MAP', 'USER', 'CALENDAR', 'CHECK'];

  String getCurrentDate() {
    final DateTime now = DateTime.now();
    return DateFormat('MMMM d, yyyy').format(now);
  }

  String getCurrentTime() {
    final DateTime now = DateTime.now();
    return DateFormat('hh:mm:ss a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13.13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm4o84vQ6iCG2dAhIXdxbvtNJoR2qwhsVwy80Xt3sGQw&s',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: List.generate(_getSteps().length * 2 - 1, (index) {
                  if (index % 2 == 0) {
                    int stepIndex = index ~/ 2;
                    return Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentStep = stepIndex;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentStep >= stepIndex
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  stepImages[stepIndex],
                                  height: 30.0,
                                  width: 30.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            stepDescriptions[stepIndex],
                            style: const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Container(
                        height: 1.20,
                        color: Colors.black,
                      ),
                    );
                  }
                }),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: _currentStep == 1
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CHARLES JOSHUA B. LUCERO',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 70, 99, 194)),
                            ),
                            Text(
                              'UNIVERSITY OF SAINT LOUIS - TUGUEGARAO',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'BACHELOR OF SCIENCE IN INFORMATION TECHNOLOGY',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 94, 93, 92)),
                            ),
                          ],
                        )
                      : _currentStep == 2
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.calendar_today),
                                    const SizedBox(width: 10),
                                    Text(
                                      getCurrentDate(),
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.access_time),
                                    const SizedBox(width: 10),
                                    Text(
                                      getCurrentTime(),
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : FlutterMap(
                              options: const MapOptions(
                                center: LatLng(14.5995, 120.9842),
                                zoom: 8,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName: 'com.example.app',
                                ),
                                RichAttributionWidget(
                                  attributions: [
                                    TextSourceAttribution(
                                      'OpenStreetMap contributors',
                                      onTap: () async {
                                        final url =
                                            'https://openstreetmap.org/copyright';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_left, size: 40.0),
                          onPressed: _currentStep > 0
                              ? () {
                                  setState(() {
                                    _currentStep--;
                                  });
                                }
                              : null,
                        ),
                        const Text(
                          'Back',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_right, size: 40.0),
                          onPressed: _currentStep < _getSteps().length - 1
                              ? () {
                                  setState(() {
                                    _currentStep++;
                                  });
                                }
                              : null,
                        ),
                        const Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Step> _getSteps() {
    return [
      Step(
        title: const Text('1'),
        content: Container(),
        isActive: _currentStep == 0,
      ),
      Step(
        title: const Text('2'),
        content: Container(),
        isActive: _currentStep == 1,
      ),
      Step(
        title: const Text('3'),
        content: Container(),
        isActive: _currentStep == 2,
      ),
      Step(
        title: const Text('4'),
        content: Container(),
        isActive: _currentStep == 3,
      ),
    ];
  }
}
