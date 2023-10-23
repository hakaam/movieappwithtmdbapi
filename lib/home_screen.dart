import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieappwithtmdbapi/api/api.dart';
import 'package:movieappwithtmdbapi/widgets/moviews_slider.dart';
import 'package:movieappwithtmdbapi/widgets/trending_slider.dart';

import 'models/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upCommingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().gettrendingMovies();
    topRatedMovies = Api().gettopRatedMovies();
    upCommingMovies=Api().getUpCommingMovies();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('FlutFlex'),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trending Movies',
                        style: GoogleFonts.aBeeZee(fontSize: 25),
                      ),
                      SizedBox(height: 32),
                      SizedBox(
                        child: FutureBuilder(
                          future: trendingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return TrendingSlider(
                                snapshot: snapshot,
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                        'Top rated movies',
                        style: GoogleFonts.aBeeZee(fontSize: 25),
                      ),
                      SizedBox(height: 32),
                      SizedBox(
                        child: FutureBuilder(
                          future: topRatedMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return MoviesSlider(
                                snapshot: snapshot,
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                        'Upcoming movies',
                        style: GoogleFonts.aBeeZee(fontSize: 25),
                      ),
                      SizedBox(height: 32),
                      SizedBox(
                        child: FutureBuilder(
                          future: upCommingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return MoviesSlider(
                                snapshot: snapshot,
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
