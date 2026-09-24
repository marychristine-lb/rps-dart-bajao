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

String kuhaSaMoveSaPlayer(String ngalanSaPlayer) {
  String? validatedNgaMove;

  do {
    stdout.write('$nameSaPlayer, Enter your move (rock/paper/scissor): ');
    String? inputtedNaMoveSaPlayer = stdin.readLineSync();

    validatedNgaMove = validationSaMove(inputtedNaMoveSaPlayer);

    if (validatedNgaMove == null) {
      print(
        'Invalid Code, Enter only the given choices (rock/paper/scissors). Try again.',
      );
    }
  } while (validatedNgaMove == null);

  return validatedNgaMove;
}

String? validationSaMove(String? inputtedNaMoveSaPlayer) {
  if (inputtedNaMoveSaPlayer == null) {
    return null;
  }
  String processedNgaInputSaPlayer = inputtedNaMoveSaPlayer
      .trim()
      .toLowerCase();

  if (movesNgaMadawat.contains(processedNgaInputSaPlayer)) {
    return processedNgaInputSaPlayer;
  } else {
    return null;
  }
}
