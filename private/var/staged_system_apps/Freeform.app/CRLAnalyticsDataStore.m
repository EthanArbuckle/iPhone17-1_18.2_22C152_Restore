@interface CRLAnalyticsDataStore
- (_TtC8Freeform21CRLAnalyticsDataStore)init;
- (void)checkEndToEndEncryptionSupport;
- (void)dealloc;
- (void)kvsDidChangeExternally:(id)a3;
@end

@implementation CRLAnalyticsDataStore

- (void)dealloc
{
  v2 = self;
  CRLAnalyticsDataStore.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform21CRLAnalyticsDataStore_lastSeenUserIDRotationDate, &qword_101672EB0);
}

- (void)kvsDidChangeExternally:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_1005E703C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)checkEndToEndEncryptionSupport
{
  v2 = self;
  sub_1005E7E98();
}

- (_TtC8Freeform21CRLAnalyticsDataStore)init
{
  result = (_TtC8Freeform21CRLAnalyticsDataStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end