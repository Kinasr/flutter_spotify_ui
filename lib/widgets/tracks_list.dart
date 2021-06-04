import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/current_track_model.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      dataRowHeight: 54.0,
      headingTextStyle: Theme.of(context).textTheme.overline?.copyWith(fontSize: 12.0),
      columns: const [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map((s) {
        final selected = context.watch<CurrentTrackModel>().selected?.id == s.id;
        final textStyle = TextStyle(
            color: selected
                ? Theme.of(context).accentColor
                : Theme.of(context).iconTheme.color);
        return DataRow(
          cells: [
            DataCell(
              Text(s.title, style: textStyle),
            ),
            DataCell(
              Text(s.artist, style: textStyle),
            ),
            DataCell(
              Text(s.album, style: textStyle),
            ),
            DataCell(
              Text(s.duration, style: textStyle),
            ),
          ],
          selected: selected,
          onSelectChanged: (_) => context.read<CurrentTrackModel>().selectTrack(s),
        );
      }).toList(),
    );
  }
}
