import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie_application/main.dart';
import 'package:movie_application/detail.dart';

// void main() {
//   runApp(category());
// }

class category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categoryList(),
    );
  }
}

class categoryList extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'CATEGORY',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        MovieList('Action', [
          MovieItem('Decibel',
              'https://cdn.cgv.id/uploads/movie/compressed/22032200.jpg', 8.2),
          MovieItem('The Childe',
              'https://cdn.cgv.id/uploads/movie/compressed/23013400.jpg', 9.0),
          MovieItem('The Roundup',
              'https://cdn.cgv.id/uploads/movie/compressed/22009300.jpg', 7.5),
          MovieItem(
              'Fast X',
              'https://movies.universalpictures.com/media/fstx-montage1sheet2-rgb-1-64108e93e63dd-1.jpg',
              8.8),
          MovieItem(
              'Extravtion 2',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6fizNzdu8Tjdouj3avaO4QmsHRHpQNHC4mG7NewjcVlVdJWpA',
              7.9),
          MovieItem(
              'Blue Beetle',
              'https://cms.cinepolis.co.id/Gallery/MOV/Movie/Thumbnail/26da352c3101454ba8cb2447da0fb21b.jpg',
              9.0),
        ]),
        SizedBox(height: 30),
        MovieList('Romance', [
          MovieItem(
              'Be With You',
              'https://asset.kompas.com/crops/1qhqpZTRpaMRjW-0osOn5TEe9dw=/128x85:1152x768/750x500/data/photo/2020/06/30/5efb21ff469ea.jpeg',
              8.8),
          MovieItem('Friendzone',
              'https://cdn.cgv.id/uploads/movie/compressed/19006200.jpg', 9.0),
          MovieItem(
              'Kushi',
              'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR1F07xC8vXcmSx1jlGUPlAWrYSNNnJI1v_ii14Nw4f7hPCCbwN',
              6.5),
          MovieItem(
              'Rebecca',
              'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSiES_szDeeu8l-nIuey8UteOw7pL8VMhyZEEhE8KCcb2uFrqOg',
              7.8),
          MovieItem(
              'Me Before You',
              'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRYoaJ5YKRIR8ZZVhj-z3pEhQpJ3VHsqOG9RTBzP5KpmpEolvjf',
              9.1),
          MovieItem(
              'La La Land',
              'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/178c2a0f654a66eda07ca098fa243728b6bc7c5f4359863860e12c50be3b8e39._RI_TTW_.jpg',
              7.5),
        ]),
        SizedBox(height: 30),
        MovieList('Horror', [
          MovieItem(
              'Alive',
              'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQkQT9cSSis5q40Ezj58v1k2Lfn_llWmCe7djfVDiyyTPxHIttt',
              9.2),
          MovieItem('The Hunt',
              'https://cdn.cgv.id/uploads/movie/pictures/21002500.jpg', 8.0),
          MovieItem(
              'Rampant',
              'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTq1kSbIlWtJuQeG0aQw5JH5SdMTen2ekTp0m8AM6MSbpwwNHDW',
              8.5),
          MovieItem(
              'Beast',
              'https://movies.universalpictures.com/media/bst-poster3-560x880-62d59603751ed-1.jpg',
              6.0),
          MovieItem(
              'Revenge',
              'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQGWLpPGBdlTnRvYNqMce4hOvksusTAkORIeULjOga5oMBCKHUF',
              7.4),
          MovieItem('Fire Starter',
              'https://cdn.cgv.id/uploads/movie/compressed/22008100.jpg', 9.0),
        ]),
        SizedBox(height: 20),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final String categoryTitle;
  final List<MovieItem> movieItems;

  MovieList(this.categoryTitle, this.movieItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                categoryTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: MovieRow(movieItems),
          ),
        ],
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;

  MovieItem(this.title, this.imageUrl, this.rating);

  // Tambahkan properti detailFilm
  final Widget detailFilm = Detail();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Detail(), // Navigasi ke kelas DetailFilm
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(5),
            child: Image.network(
              imageUrl,
              height: 200,
              width: 130,
              fit: BoxFit.cover,
            ),
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
          SizedBox(
            width: 20,
          )
        ]
      ],
    );
  }
}
