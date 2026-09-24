import 'dart:io';

///nag import para maka input

///nag initialize ug list nga naay sulod sa mga moves
const List<String> movesNgaMadawat = ['rock', 'paper', 'scissors'];

///function para makakauha sa name sa player
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

///function para makuha ang move sa player
String kuhaSaMoveSaPlayer(String ngalanSaPlayer) {
  String? validatedNgaMove;

  do {
    stdout.write('$ngalanSaPlayer, Enter your move (rock/paper/scissor): ');
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

///function para ivalidate if ang move kay naa sa valid moves
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

///function para ma-identify ang winner base sa move sa mga players
String? kinsaAngDaog(
  String moveSaPlayer1,
  String moveSaPlayer2,
  String nameSaPlayer1,
  String nameSaPlayer2,
) {
  if (moveSaPlayer1 == moveSaPlayer2) {
    return null;
  }

  if ((moveSaPlayer1 == 'rock' && moveSaPlayer2 == 'scissors') ||
      (moveSaPlayer1 == 'paper' && moveSaPlayer2 == 'rock') ||
      (moveSaPlayer1 == 'scissors' && moveSaPlayer2 == 'paper')) {
    return nameSaPlayer1;
  } else {
    return nameSaPlayer2;
  }
}

///main function
void main() {
  print('=== ROCK, PAPER, SCISSORS ===');

  String player1NgaName = getNameSaPlayer(1);
  String player2NgaName = getNameSaPlayer(2);

  int scoreSaPlayer1 = 0;
  int scoreSaPlayer2 = 0;
  int numberSaRound = 1;
  String playUtro;

  do {
    print('\n Round $numberSaRound');

    String moveSaPlayer1 = kuhaSaMoveSaPlayer(player2NgaName);

    for (int i = 0; i < 30; i++) {
      print('');
    }
    print('(screen cleared)');

    String moveSaPlayer2 = kuhaSaMoveSaPlayer(player2NgaName);

    print(
      '\n $player1NgaName chose $moveSaPlayer1 \n $player2NgaName chose $moveSaPlayer2',
    );

    String? daog = kinsaAngDaog(
      moveSaPlayer1,
      moveSaPlayer2,
      player1NgaName,
      player2NgaName,
    );

    if (daog == null) {
      print('Result: ${daog ?? "It's a Draw!"}');
    } else {
      print('Result: $daog Wins the Round!');
      if (daog == player1NgaName) {
        scoreSaPlayer1++;
      } else {
        scoreSaPlayer2++;
      }
    }

    print(
      'Scores:\n $player1NgaName: $scoreSaPlayer1\n $player2NgaName: $scoreSaPlayer2',
    );

    stdout.write('Paly Again? (y/n): ');
    playUtro = stdin.readLineSync()?.trim().toLowerCase() ?? 'n';

    numberSaRound++;
  } while (playUtro == 'y');

  print('===== FINAL SCORE =====');
  print('$player1NgaName: $scoreSaPlayer1 \n $player2NgaName: $scoreSaPlayer2');

  if (scoreSaPlayer1 > scoreSaPlayer2) {
    print('Overall Winner: $player1NgaName');
  } else if (scoreSaPlayer2 > scoreSaPlayer1) {
    print('Overall Winner: $player2NgaName');
  } else {
    print('Overall Winner: It\'s a Tie!');
  }
}
