import 'dart:io';
import 'dart:math';
import 'package:characters/characters.dart';

enum Mood {
  excited('\u{1F60E}', 'взволнованный'),
  happy('\u{1F600}', 'счастливый'),
  surprised('\u{1F928}', 'удивлённый'),
  inLove('\u{1F496}', 'влюблённый'),
  laughing('\u{1F923}', 'смеющийся');

  final String emoji;
  final String description;

  const Mood(this.emoji, this.description);
}

void main() {
  print('Введите ваше имя:');
  String name = stdin.readLineSync()!;

  print('Генерируем случайное настроение...');

  Random r = Random();

  Mood mood = Mood.values[r.nextInt(Mood.values.length)];
  int energy = r.nextInt(10) + 1;

  print(
    'Привет, $name! Твое настроение: '
    '${mood.emoji} ${mood.description} (энергия: $energy/10)',
  );

  int code = mood.emoji.runes.first;
  print(
    'Юникод вашего эмодзи: '
    'U+${code.toRadixString(16).toUpperCase()}',
  );

  print('Хотите просмотреть сложные эмодзи? (/нет):');
  String answer = stdin.readLineSync()!;

  if (answer != '/нет') {
    print('Введите комбинацию эмодзи:');
    String input = stdin.readLineSync()!;

    print('Анализ строки "$input":');
    print('- 16-битных единиц: ${input.length}');
    print('- Кодовых точек: ${input.runes.length}');
    print('- Реальных символов: ${input.characters.length}');

    int i = 1;
    for (int rune in input.runes) {
      print(
        'Символ $i: ${String.fromCharCode(rune)} '
        '→ U+${rune.toRadixString(16).toUpperCase()}',
      );
      i++;
    }
  }

  print('Спасибо, приходите снова!');
}