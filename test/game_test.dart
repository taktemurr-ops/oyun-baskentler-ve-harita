import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_baskentler_ve_harita/oyun_baskentler_ve_harita.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(baskentlerConfig.title.length, 33);
    expect(baskentlerConfig.tagline.length, 33);
    for (final s in baskentlerConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(baskentlerConfig.gameId, baskentlerId);
    expect(baskentlerRules.gameId, baskentlerId);
    expect(baskentlerConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(baskentlerRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: baskentlerId, optionalMechanics: baskentlerRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(baskentlerRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
