import 'package:heroes/heroes.dart';
import 'package:conduit_test/conduit_test.dart';

export 'package:heroes/heroes.dart';
export 'package:conduit_test/conduit_test.dart';
export 'package:test/test.dart';
export 'package:conduit/conduit.dart';

/// A testing harness for heroes.
///
/// A harness for testing an conduit application. Example test file:
///
///         void main() {
///           Harness harness = Harness()..install();
///
///           test("GET /path returns 200", () async {
///             final response = await harness.agent.get("/path");
///             expectResponse(response, 200);
///           });
///         }
///
class Harness extends TestHarness<HeroesChannel> with TestHarnessORMMixin {
  @override
  ManagedContext get context => channel!.context;

  @override
  Future onSetUp() async {
    await resetData();
  }

  @override
  Future onTearDown() async {}

  @override
  Future seed() async {
    final heroNames = ["Mr. Nice", "Narco", "Bombasto", "Celeritas", "Magneta"];

    for (final heroName in heroNames) {
      await context.persistentStore?.execute(
          "INSERT INTO _Hero (name) VALUES (@name)",
          substitutionValues: {"name": heroName});
    }
  }
}
