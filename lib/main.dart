import 'package:flutter/material.dart';
import 'package:movie_application/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black54),
      initialRoute: '/',
      routes: {
        '/': (context) => AppHomePage(),
        '/category': (context) => category(),
      },
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  State<AppHomePage> createState() => AppHomePageState();
}

class AppHomePageState extends State<AppHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MovieList(),
    category(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GoStream",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent.shade700,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(_selectedIndex, (index) {
        setState(() {
          _selectedIndex = index;
        });
      }),
    );
  }
}

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        MovieHeader(),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              'TRENDING',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        MovieRow([
          MovieItem(
              'Avengers End Game',
              'https://cdn.marvel.com/content/1x/avengersendgame_lob_crd_05_2.jpg',
              8.2),
          MovieItem(
              'Iron Man 3',
              'https://cdn.marvel.com/content/1x/ironman3_lob_crd_01_10.jpg',
              9.0),
        ]),
        SizedBox(height: 20),
        MovieRow([
          MovieItem('Eternals',
              'https://cdn.marvel.com/content/1x/eternals_lob_crd_06.jpg', 8.7),
          MovieItem(
              'Black Widow',
              'https://cdn.marvel.com/content/1x/blackwidow_lob_crd_06.jpg',
              9.3),
        ]),
        SizedBox(height: 20),
        MovieRow([
          MovieItem(
              'Black Panther',
              'https://cdn.marvel.com/content/1x/blackpanther_lob_crd_01_4.jpg',
              7.9),
          MovieItem(
              'Doctor Strange',
              'https://cdn.marvel.com/content/1x/doctorstrange_lob_crd_01_6.jpg',
              8.8),
        ]),
        SizedBox(height: 20),
      ],
    );
  }
}

class MovieHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 170,
          width: 480,
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Image.network(
            'https://i.ebayimg.com/images/g/EWgAAOSwyP5aJeiu/s-l1200.webp',
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Star Wars: The Last Jedi',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class MovieItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;

  MovieItem(this.title, this.imageUrl, this.rating);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: Image.network(
            imageUrl,
            height: 200,
            width: 130,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 3),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 18,
            ),
            Text(
              rating.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MovieRow extends StatelessWidget {
  final List<MovieItem> items;

  MovieRow(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        for (var item in items) ...[
          item,
          SizedBox(width: 20),
        ],
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar(this.selectedIndex, this.onItemTapped);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: selectedIndex == 0 ? Colors.red : Colors.white,
            ),
            onPressed: () {
              if (selectedIndex != 0) {
                onItemTapped(0);
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.category,
              color: selectedIndex == 1 ? Colors.red : Colors.white,
            ),
            onPressed: () {
              if (selectedIndex != 1) {
                onItemTapped(1);
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: selectedIndex == 2 ? Colors.red : Colors.white,
            ),
            onPressed: () {
              if (selectedIndex != 2) {
                onItemTapped(2);
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: selectedIndex == 3 ? Colors.red : Colors.white,
            ),
            onPressed: () {
              if (selectedIndex != 3) {
                onItemTapped(3);
              }
            },
          ),
        ],
      ),
    );
  }
}
