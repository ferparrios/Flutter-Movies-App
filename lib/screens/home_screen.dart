import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movie_provider.dart';
import 'package:peliculas_app/search/search_delegate.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);
    // print(moviesProvider.onDisplayMOvies);


    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas en Cines'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children:  [
              // main card
              CardSwiper(movies: moviesProvider.onDisplayMOvies,),

              //Listado de peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
              
            ],
          ),
        ));
  }
}
