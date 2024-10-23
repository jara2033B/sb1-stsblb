class Word {
  final int? id;
  final String word;
  final String definition;
  final DateTime dateAdded;

  Word({
    this.id,
    required this.word,
    required this.definition,
    required this.dateAdded,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'definition': definition,
      'dateAdded': dateAdded.toIso8601String(),
    };
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      id: map['id'],
      word: map['word'],
      definition: map['definition'],
      dateAdded: DateTime.parse(map['dateAdded']),
    );
  }
}