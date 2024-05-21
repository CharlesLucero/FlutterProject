import 'package:flutter/material.dart';
import 'package:maya/screens/loginpage.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Image(
                image: NetworkImage(
                    'https://media.licdn.com/dms/image/D4D12AQF6ZXuEBjhWhA/article-cover_image-shrink_600_2000/0/1712917783907?e=2147483647&v=beta&t=5HiSyqZ2-pz2oRc8ST5LybP0qViMYVa12TbJg57IWYg'),
                width: 290, // Set the desired width
              ),
              // Space between image and text
              const Text(
                "Continue to enhance your skill",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.9, // Adjusting line height to reduce space
                ),
              ),
              const SizedBox(height: 250), // Space between text and button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Loginpage(),
                            ),
                          ); // Add your onPressed code here!
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 181, 187, 181), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(13), // Border radius
                          ),
                          minimumSize: const Size.fromHeight(55),
                        ),
                        child: const Text(
                          'Start',
                          style: TextStyle(
                              height: 1.9,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height:
                      35), // Adding some space between the button and the text label
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'A simple Flutter app displays quotes using Provider state management',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
