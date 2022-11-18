import 'package:flutter/material.dart';
import 'package:random_meme/api_fetching.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  String imageUrl = "https://i.redd.it/a0meru7bv6z91.jpg";
  void updateImage() async {
    String image = await api_fetching.api_fetch();

    setState(() {
      imageUrl = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Random MeMe"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .5,
              width: double.infinity,
              child: Image(
                image: NetworkImage(imageUrl),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  updateImage();
                },
                child: Text("New MeMe"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
