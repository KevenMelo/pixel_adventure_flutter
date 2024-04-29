import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

import '../actors/player.dart';

class Level extends World {
  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('Level-01.tmx', Vector2.all(16));

    add(level);
    final spawnPointerLayer = level.tileMap.getLayer<ObjectGroup>('spawnpoint');

    for (var e in spawnPointerLayer!.objects) {
      switch (e.class_) {
        case 'player':
          final player = Player(
            character: 'Mask Dude',
            position: Vector2(e.x, e.y),
          );
          add(player);

          break;
        default:
      }
    }

    return super.onLoad();
  }
}
