import 'package:flutter/foundation.dart';
import '../models/word.dart';
import '../services/database_helper.dart';

class WordProvider with ChangeNotifier {
  List<Word> _words = [];
  List<Word> get words => _words;

  Future<void> loadWords() async {
    _words = await DatabaseHelper.instance.getAllWords();
    notifyListeners();
  }

  Future<void> addWord(String word, String definition) async {
    final newWord = Word(
      word: word,
      definition: definition,
      dateAdded: DateTime.now(),
    );
    final addedWord = await DatabaseHelper.instance.insertWord(newWord);
    _words.add(addedWord);
    notifyListeners();
  }

  Future<void> deleteWord(int id) async {
    await DatabaseHelper.instance.deleteWord(id);
    _words.removeWhere((word) => word.id == id);
    notifyListeners();
  }
}