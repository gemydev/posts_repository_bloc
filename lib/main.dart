import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'data/post_repository.dart';
import 'home.dart';


main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => PostBloc(PostRepositoryApi())..add(FetchPosts()),
          child: Home(),
        ));
  }
}

