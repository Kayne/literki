import 'package:audioplayers/audioplayers.dart';

class LetterSound {
  LetterSound._() {
    _player.audioCache = AudioCache(prefix: '');
  }

  static final LetterSound instance = LetterSound._();

  final AudioPlayer _player = AudioPlayer();

  Future<void> play(String letter) async {
    await playClip('${letter.toUpperCase()}.wav');
  }

  Future<void> playClip(String filename) async {
    try {
      await _player.stop();
      await _player.play(AssetSource('assets/literki_dzwieki/$filename'));
    } catch (_) {
      // Silently ignore — sound is a nice-to-have.
    }
  }
}
