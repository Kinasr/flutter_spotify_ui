import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/spotify_logo.png",
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTap(
            iconData: Icons.home,
            title: 'Home',
            onTap: () {},
          ),
          _SideMenuIconTap(
            iconData: Icons.search,
            title: 'Search',
            onTap: () {},
          ),
          _SideMenuIconTap(
            iconData: Icons.audiotrack,
            title: 'Radio',
            onTap: () {},
          ),
          const SizedBox(height: 12.0),
          const _LibraryPlaylists(),
        ],
      ),
    );
  }
}

class _SideMenuIconTap extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTap({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  const _LibraryPlaylists({Key? key}) : super(key: key);

  @override
  __LibraryPlaylistsState createState() => __LibraryPlaylistsState();
}

class __LibraryPlaylistsState extends State<_LibraryPlaylists> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            buildList(
              context: context,
              title: 'YOUR LIBRARY',
              listItems: yourLibrary,
            ),
            const SizedBox(height: 24.0),
            buildList(
              context: context,
              title: 'PLAYLISTS',
              listItems: playlists,
            ),
          ],
        ),
      ),
    );
  }

  Column buildList({
    required BuildContext context,
    required String title,
    required List<String> listItems,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Divider(thickness: 1.0, endIndent: 100.0),
        ...listItems
            .map((e) => ListTile(
                  dense: true,
                  title: Text(
                    e,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => debugPrint(e),
                ))
            .toList(),
      ],
    );
  }
}
