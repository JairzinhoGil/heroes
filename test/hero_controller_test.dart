import 'harness/app.dart';

void main() {
  final harness = Harness()..install();

  test("validate that the sixth hero is called Batman.", () async {
    await harness.agent!.post("/heroes", body: {'name': 'Batman'});

    final response = await harness.agent!.get("/heroes");

    final body = await response?.body.decode();
    expect(body[5]['name'], 'Batman');
  });

  test("GET /heroes returns 200 OK", () async {
    final response = await harness.agent!.get("/heroes");
    expectResponse(response, 200);
  });

  test("validate the new heroes his name are Batman", () async {
    final response =
        await harness.agent!.post("/heroes", body: {'name': 'Batman'});

    expectResponse(response, 200,
        body: {'id': greaterThan(0), 'name': 'Batman'});

    // final body = await response?.body.decode();
    // expect(response?.statusCode, 200);
    // expect(body, {'id': greaterThan(0), 'name': 'Batman'});
  });

  test("validate that the firts hero is called Mr. Nice", () async {
    final response = await harness.agent!.get("/heroes");

    final body = await response?.body.decode();
    expect(body[0]['name'], 'Mr. Nice');
  });

  test("validate that the second hero is called Narco", () async {
    final response = await harness.agent!.get("/heroes");

    final body = await response?.body.decode();
    expect(body[1]['name'], 'Narco');
  });

  test("validate that the third hero is called bombasto", () async {
    final response = await harness.agent!.get("/heroes");

    final body = await response?.body.decode();
    expect(body[2]['name'], 'Bombasto');
  });

  test("validate that the fourth hero is called Celeritas", () async {
    final response = await harness.agent!.get("/heroes");

    final body = await response?.body.decode();
    expect(body[3]['name'], 'Celeritas');
  });

  test("validate that the fifth hero is called Magneta", () async {
    final response = await harness.agent!.get("/heroes");

    final body = await response?.body.decode();
    expect(body[4]['name'], 'Magneta');
  });
}
