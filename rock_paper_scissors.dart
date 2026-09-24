import 'dart:io';

const List<String> movesNgaMadawat = ['rock', 'paper', 'scissors'];

String getNameSaPlayer(int numberSaPlayer) {
  stdout.write('Player $numberSaPlayer, Enter your name: ');
  String? inputtedNameSaPlayer = stdin.readLineSync();

  if (inputtedNameSaPlayer == null || inputtedNameSaPlayer.trim().isEmpty) {
    String defaultNgaName = 'Player $numberSaPlayer';

    print('(No name entered. Using Player $numberSaPlayer)');
    return defaultNgaName;
  }
  return inputtedNameSaPlayer;
}
