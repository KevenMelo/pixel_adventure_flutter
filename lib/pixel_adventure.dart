import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:pixel_adventure/levels/level.dart';

class PixelAdventure extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211F30);

  @override
  final world = Level();
  @override
  final CameraComponent camera =
      CameraComponent.withFixedResolution(width: 640, height: 360);

  @override
  FutureOr<void> onLoad() {
    camera.world = world;
    camera.viewfinder.anchor = Anchor.topLeft;
    addAll([camera, world]);
    return super.onLoad();
  }
}
