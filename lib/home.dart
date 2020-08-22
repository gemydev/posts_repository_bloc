import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Posts'),
      ),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return CircularProgressIndicator();
            } else if (state is PostLoaded) {
              return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, i) {
                    return Card(
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(state.posts[i].title),
                        subtitle: Text(state.posts[i].id.toString()),
                      ),
                    );
                  });
            } else if (state is PostError) {
              return Text(state.message);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
