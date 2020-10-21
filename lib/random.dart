import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandomWords extends StatefulWidget {
  @override
  RandomwordState createState() => RandomwordState();
}

class RandomwordState extends State<RandomWords> {
  final _random = <WordPair>[];

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _random.length) {
          _random.addAll(generateWordPairs().take(10));
        }

        return _buildrow(_random[index]);
      },
    );
  }

  Widget _buildrow(WordPair pair) {
    return ListTile(
        title: Text(
      pair.asPascalCase,
      style: TextStyle(fontSize: 18.0),
    ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Words'),
      ),
      body: _buildList(),
    );
  }
}
