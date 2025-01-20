@interface CRLAnalyticsOSSignpostManager
+ (_TtC8Freeform29CRLAnalyticsOSSignpostManager)shared;
- (_TtC8Freeform29CRLAnalyticsOSSignpostManager)init;
- (void)beginSignpostIntervalWithName:(id)a3 with:(id)a4;
- (void)endSignpostIntervalFor:(id)a3;
- (void)endSignpostIntervalWithName:(id)a3;
@end

@implementation CRLAnalyticsOSSignpostManager

+ (_TtC8Freeform29CRLAnalyticsOSSignpostManager)shared
{
  if (qword_10166F2C0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10171AB80;

  return (_TtC8Freeform29CRLAnalyticsOSSignpostManager *)v2;
}

- (void)beginSignpostIntervalWithName:(id)a3 with:(id)a4
{
  sub_10055A764();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  CRLAnalyticsOSSignpostManager.beginSignpostInterval(name:with:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)endSignpostIntervalFor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  CRLAnalyticsOSSignpostManager.endSignpostInterval(for:)((CRLCanvasRep_optional *)a3);
}

- (void)endSignpostIntervalWithName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CRLAnalyticsOSSignpostManager.endSignpostInterval(name:)(v4);
}

- (_TtC8Freeform29CRLAnalyticsOSSignpostManager)init
{
  result = (_TtC8Freeform29CRLAnalyticsOSSignpostManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8Freeform29CRLAnalyticsOSSignpostManager_signposter;
  uint64_t v3 = type metadata accessor for OSSignposter();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();

  swift_release();
}

@end