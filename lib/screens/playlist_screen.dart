import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playList;

  const PlaylistScreen({
    Key? key,
    required this.playList,
  }) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 140.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LeadingButton(
                icon: Icons.chevron_left,
                onTap: () => debugPrint('Go Back'),
                tooltipMsg: 'Back',
              ),
              const SizedBox(width: 16.0),
              _LeadingButton(
                icon: Icons.chevron_right,
                onTap: () => debugPrint('Go Forward'),
                tooltipMsg: 'Forward',
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => debugPrint('My Account'),
            icon: const Icon(Icons.account_circle_outlined, size: 30.0),
            label: const Text('My Name'),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            padding: const EdgeInsets.only(),
            onPressed: () => debugPrint('Show List'),
            icon: const Icon(Icons.keyboard_arrow_down, size: 30.0),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFAF1018),
              Theme.of(context).backgroundColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, 0.3],
          ),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
            children: [
              PlaylistHeader(playlist: widget.playList),
              TracksList(tracks: widget.playList.songs),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeadingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String tooltipMsg;

  const _LeadingButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.tooltipMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMsg,
      textStyle: const TextStyle(
        color: Colors.white60,
        fontWeight: FontWeight.w100,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
              color: Colors.black26, shape: BoxShape.circle),
          child: Icon(icon, size: 28.0),
        ),
      ),
    );
  }
}
