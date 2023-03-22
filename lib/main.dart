import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource.impl.dart';
import 'package:toktik/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostRepositoryImpl(videoDatasource: LocalVideoDatasourceImpl());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage(),
        )
      ],
      child: MaterialApp(
          title: 'TokTikj',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
