import 'package:flutter/material.dart';
import 'package:movieappwithtmdbapi/models/movie.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/constant.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, required this.movie});
  final Movie movie;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          leading: Container(
            margin: EdgeInsets.only(top: 8, left: 16),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Color(0xFF23272E),
                borderRadius: BorderRadius.circular(8)),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded)),
          ),
          backgroundColor: Color(0xFF23272E),
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              widget.movie.title,
              style: GoogleFonts.belleza(
                  fontSize: 17, fontWeight: FontWeight.w600),
            ),
            background: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  '${Constants.imagePath}${widget.movie.posterPath}'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overview',
                  style: GoogleFonts.openSans(
                      fontSize: 30, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                 '${widget.movie.overview}',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text(
                              'Release date:',
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.movie.releaseDate,
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),


                        ),
                        child: Row(
                          children: [
                            Text(
                              'Rating:',
                              style: GoogleFonts.roboto(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              '${widget.movie.voteAverage.toStringAsFixed(1)}/10',
                              style: GoogleFonts.roboto(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )



                          ],

                        ),


                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
