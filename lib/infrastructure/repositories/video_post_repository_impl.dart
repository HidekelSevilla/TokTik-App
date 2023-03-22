import 'package:toktik/domain/datasources/video_posts_datasources.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class VideoPostRepositoryImpl implements VideoPostsRepository {
  final VideoPostDatasource videoDatasource;

  VideoPostRepositoryImpl({required this.videoDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoDatasource.getTrendingVideosByPage(page); 
  }
}
