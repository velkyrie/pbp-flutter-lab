import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/mywatchlist.dart';

class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage ({Key? key,
      required this.watched,
        required this.title,
        required this.rating,
        required this.releaseDate,
        required this.review,
  }) : super(key: key);

  final watched;
  final title;
  final rating;
  final releaseDate;
  final review;

  @override
  State<MyDetailsPage> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Watch List'), centerTitle: false),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Routing the menu to the main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Routing the menu to form page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Budget Data'),
              onTap: () {
                // Routing the menu to the main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
              },
            ),
            ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyWatchlistPage()),
                );
              },
            ),
          ],
        ),
      ),

        body: Column(
        children:[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${widget.title}',
                style: const TextStyle(fontSize:23, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 0, 6.0, 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan> [
                      const TextSpan(text: 'Release Date: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text:'${widget.releaseDate}')
                    ]
                  )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan> [
                          const TextSpan(text: 'Rating: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text:'${widget.rating}'),
                          const TextSpan(text:'/5')
                        ]
                    )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan> [
                          const TextSpan(text: 'Status: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text:'${widget.watched}')
                        ]
                    )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Wrap(
              children: [
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan> [
                          const TextSpan(text: 'Review:\n', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text:'${widget.review}')
                        ]
                    )
                ),
              ],
            ),
          ),
        ]
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size.fromHeight(40),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
    );
  }
}
