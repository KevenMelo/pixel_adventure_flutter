import 'dart:async';

import 'package:flame/components.dart';

import '../pixel_adventure.dart';

enum PlayerState { idle, run, jump, fall, hit, death }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  Player({position, required this.character}) : super(position: position);
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runAnimation;
  late final SpriteAnimation jumpAnimation;
  late final SpriteAnimation fallAnimation;
  late final SpriteAnimation hitAnimation;
  late final SpriteAnimation deathAnimation;
  String character;
  static const defaultStepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = _spriteAnimation('Idle (32x32).png', 11);

    runAnimation = _spriteAnimation('Run (32x32).png', 12);

    jumpAnimation = _spriteAnimation('Jump (32x32).png', 1);

    fallAnimation = _spriteAnimation('Fall (32x32).png', 1);

    hitAnimation = _spriteAnimation('Hit (32x32).png', 7);

    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.run: runAnimation,
      PlayerState.jump: jumpAnimation,
      PlayerState.fall: fallAnimation,
      PlayerState.hit: hitAnimation,
    };

    current = PlayerState.idle;
  }

  _spriteAnimation(String archive, int amount) {
    return SpriteAnimation.fromFrameData(
      gameRef.images.fromCache('Main Characters/$character/$archive'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: defaultStepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
