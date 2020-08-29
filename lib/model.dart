List<String> getSpelling(String code) {
  Map words = {
    "A": "ANCONA",
    "B": "BOLOGNA",
    "C": "COMO",
    "D": "DOMODOSSOLA",
    "E": "EMPOLI",
    "F": "FIRENZE",
    "G": "GENOVA",
    "H": "HOTEL",
    "I": "IMOLA",
    "J": "JOLLY",
    "K": "KURSAAL",
    "L": "LIVORNO",
    "M": "MILANO",
    "N": "NAPOLI",
    "O": "OTRANTO",
    "P": "PALERMO",
    "Q": "QUADRO",
    "R": "ROMA",
    "S": "SAVONA",
    "T": "TORINO",
    "U": "UDINE",
    "V": "VENEZIA",
    "W": "WASHINGTON",
    "X": "ICS",
    "Y": "YORK",
    "Z": "ZARA"
  };

  List<String> result = new List();

  code.toUpperCase().replaceAll(" ", "").runes.forEach((int rune) {
    var character = new String.fromCharCode(rune);
    result.add(words[character]);
  });

  return result;
}
