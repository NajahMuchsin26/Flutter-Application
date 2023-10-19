import 'package:flutter/material.dart';
import 'package:movie_application/category.dart';
import 'package:movie_application/main.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailFilm(),
    );
  }
}

class DetailFilm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bagian atas dengan gambar horizontal 1/4 bagian atas
        movieHeader(),
        ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            MovieInfoRow(
              title: 'Decibel',
              year: '2023',
              genre: 'Drama',
              rating: 8.2,
            ),
            SizedBox(height: 10),
            MovieSinopsis(),
            SizedBox(height: 20),
            MovieButton(text: 'Trailer'),
            SizedBox(height: 20),
            MovieButton(text: 'Watch Movie')
          ],
        ),
      ],
    );
  }
}

class movieHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://cdn0-production-images-kly.akamaized.net/fPwNfVbT1ySSemb8F2oU3RbTFr0=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4455767/original/054291300_1686057782-Decibel.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MovieInfoRow extends StatelessWidget {
  final String title;
  final String year;
  final String genre;
  final double rating;

  MovieInfoRow({
    required this.title,
    required this.year,
    required this.genre,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'https://cdn0-production-images-kly.akamaized.net/fPwNfVbT1ySSemb8F2oU3RbTFr0=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4455767/original/054291300_1686057782-Decibel.jpg',
          width: 150,
          height: 180,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildInfoRow("JUDUL", title),
            _buildInfoRow("TAHUN", year),
            _buildInfoRow("GENRE", genre),
            _buildRatingRow("RATING", rating),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Container(
          width: 60,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 5), // Spacer
        Container(
          width: 100,
          child: Text(
            ': $value',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingRow(String label, double rating) {
    return Row(
      children: [
        Container(
          width: 65,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          ':',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Container(
          child: Icon(
            Icons.star,
            color: Colors.yellow,
            size: 18,
          ),
        ),
        Text(
          rating.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class MovieSinopsis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SINOPSIS',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Mantan perwira Angkatan Laut, Do-yeong mengidap gangguan stres pascatrauma usai selamat dari kecelakaan kapal selam yang menewaskan rekan-rekannya. Sekalipun kini dipandang sebagai pahlawan oleh masyarakat, ia terus menyimpan rasa bersalah serta tersiksa oleh sikap keluarga yang menjauh darinya.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class MovieButton extends StatelessWidget {
  final String text;

  MovieButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.red[400],
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
