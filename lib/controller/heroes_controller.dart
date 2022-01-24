import 'package:conduit/conduit.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';

class HeroesController extends ResourceController {
  HeroesController(this.context);

  final ManagedContext context;

  final _heroes = [
    {'id': 11, 'name': 'Batman'},
    {'id': 12, 'name': 'Wonder Woman'},
    {'id': 13, 'name': 'The Flash'},
    {'id': 14, 'name': 'Super Man'},
    {'id': 15, 'name': 'Aquaman'},
  ];

  @Operation.get()
  Future<Response> getAllHeroes() async {
    return Response.ok(_heroes);
  }

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') int id) async {
    final ids = _heroes.firstWhere((hero) => hero['id'] == id);

    if (id == ids['id']) {
      return Response.ok(ids);
    } else {
      return Response.notFound();
    }
  }
}
