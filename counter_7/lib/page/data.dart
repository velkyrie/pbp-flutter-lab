import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/mywatchlist.dart';


class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override 
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
        centerTitle: false
      ),
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
                              MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
                            );
                          },
                        ),
          ],
        ),
      ),
      body: 
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          for(var item in Data.dataBudget)
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item[0], // judul
                            style: const TextStyle(fontSize: 25)
                          ),
                          Text(item[3].toString(), // tanggal yang harus dicast ke string
                            style: const TextStyle(fontSize: 12)
                          ),
                        ],
                        ),
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Rp${item[1].toString()}' // nominal
                          ),
                          Text('${item[2]}' // jenis
                          ),
                        ],
                        ),
                    ),

                  ],
                ),
              ),
            ),
        ],)
        ),
      );
    
  }
}