@interface RangingProxy
- (NSString)description;
- (_TtC17proximitycontrold12RangingProxy)init;
- (void)dealloc;
- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5;
- (void)session:(id)a3 didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a4;
- (void)session:(id)a3 didUpdateLocalMotionState:(int64_t)a4;
- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)session:(id)a3 suspendedWithReason:(int64_t)a4;
- (void)sessionDidStartRunning:(id)a3;
- (void)sessionSuspensionEnded:(id)a3;
@end

@implementation RangingProxy

- (void)dealloc
{
  v2 = self;
  sub_10019E178();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC17proximitycontrold12RangingProxy__session;
  uint64_t v4 = sub_10000A38C(&qword_10036AFC8);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (_TtC17proximitycontrold12RangingProxy)init
{
  result = (_TtC17proximitycontrold12RangingProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_1001A2870();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001A5E68(v7);
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1001A6100();
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  sub_100019E10(0, &qword_10036AF70);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  v10 = self;
  sub_1001A6368(v8, a5);

  swift_bridgeObjectRelease();
}

- (void)sessionDidStartRunning:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1001F63A0();
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 ulog:40 message:v7];

  sub_10019CF5C();
  sub_10018CD78();

  swift_release();
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  sub_100019E10(0, &qword_10036AF70);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  unint64_t v8 = self;
  sub_1001A6488(v6);

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1001A6810(a4);
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_1001A69AC(v11, a5, a6);
}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001A71C0();
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1001A7500(a4);
}

- (void)session:(id)a3 didUpdateLocalMotionState:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1001A36F8(v5);
}

@end