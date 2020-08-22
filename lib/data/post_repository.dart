import 'dart:convert';
import 'package:http/http.dart';
import 'post_model.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts();
}

class PostRepositoryApi extends PostRepository {
  @override
  Future<List<Post>> getAllPosts() async {
    final response = await get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Post>((item) => Post.fromJson(item)).toList();
    } else {
      throw Exception('Can not load posts');
    }
  }
}
