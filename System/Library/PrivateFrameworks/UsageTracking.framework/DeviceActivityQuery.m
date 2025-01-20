@interface DeviceActivityQuery
- (_TtC18UsageTrackingAgent19DeviceActivityQuery)init;
- (_TtC18UsageTrackingAgent19DeviceActivityQuery)initWithBundleIdentifiers:(id)a3 categoryIdentifiers:(id)a4 domains:(id)a5 interval:(id)a6;
@end

@implementation DeviceActivityQuery

- (_TtC18UsageTrackingAgent19DeviceActivityQuery)initWithBundleIdentifiers:(id)a3 categoryIdentifiers:(id)a4 domains:(id)a5 interval:(id)a6
{
  v18[1] = a6;
  uint64_t v7 = type metadata accessor for DateInterval();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for Identifier(0);
  sub_100037064((unint64_t *)&qword_100095200, type metadata accessor for Identifier);
  v13 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18UsageTrackingAgent19DeviceActivityQuery_bundleIdentifiers) = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18UsageTrackingAgent19DeviceActivityQuery_categoryIdentifiers) = v13;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18UsageTrackingAgent19DeviceActivityQuery_domains) = v14;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)self + OBJC_IVAR____TtC18UsageTrackingAgent19DeviceActivityQuery_interval, v11, v7);
  v15 = (objc_class *)type metadata accessor for DeviceActivityQuery();
  v19.receiver = self;
  v19.super_class = v15;
  v16 = [(DeviceActivityQuery *)&v19 init];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v16;
}

- (_TtC18UsageTrackingAgent19DeviceActivityQuery)init
{
  result = (_TtC18UsageTrackingAgent19DeviceActivityQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18UsageTrackingAgent19DeviceActivityQuery_interval;
  uint64_t v4 = type metadata accessor for DateInterval();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end