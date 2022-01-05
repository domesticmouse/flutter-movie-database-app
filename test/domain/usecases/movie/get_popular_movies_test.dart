import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockMovieRepository mockMovieRpository;
  late GetPopularMovies usecase;

  setUp(() {
    mockMovieRpository = MockMovieRepository();
    usecase = GetPopularMovies(mockMovieRpository);
  });

  final tMovies = <Movie>[];

  test(
    'should get list of movie from the repository',
    () async {
      // arrange
      when(mockMovieRpository.getPopularMovies())
          .thenAnswer((_) async => Right(tMovies));

      // act
      final result = await usecase.execute();

      // assert
      expect(result, Right(tMovies));
    },
  );
}
