@interface FMLocationProvider
- (_TtC6FindMy18FMLocationProvider)init;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateHeading:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation FMLocationProvider

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  v7 = self;
  sub_1000192F8(a4);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_100006060(0, (unint64_t *)&unk_1006BEAA0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_100020940(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100014A48(v7);
}

- (_TtC6FindMy18FMLocationProvider)init
{
  return (_TtC6FindMy18FMLocationProvider *)sub_10000EF08();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_100536B4C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  swift_release();
}

@end