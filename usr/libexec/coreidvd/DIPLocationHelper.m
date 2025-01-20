@interface DIPLocationHelper
- (_TtC8coreidvd17DIPLocationHelper)init;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation DIPLocationHelper

- (_TtC8coreidvd17DIPLocationHelper)init
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for DIPLocationHelper());
  v3 = (_TtC8coreidvd17DIPLocationHelper *)sub_1002D79F0(0, 0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

- (void)dealloc
{
  id v2 = self;
  sub_1002D6448();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd17DIPLocationHelper_location);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_100025C28(0, &qword_100729D78);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_1002D74BC(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1002D8108(v6);
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1002D8350(a4);
}

@end