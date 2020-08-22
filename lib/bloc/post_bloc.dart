import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:posts_repository_bloc/data/post_repository.dart';
import 'bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;
  PostBloc(this.repository) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostEvent) {
      yield PostLoading();
      try {
        final posts = await repository.getAllPosts();
        yield PostLoaded(posts);
      } catch (e) {
        yield PostError(e.toString());
      }
    }
  }
}
