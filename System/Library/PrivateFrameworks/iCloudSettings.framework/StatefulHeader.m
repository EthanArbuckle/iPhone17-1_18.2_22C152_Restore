@interface StatefulHeader
- (NSArray)actions;
- (NSDictionary)impressionPayload;
- (NSString)impressionUrlString;
- (NSString)layoutType;
- (NSString)subTitle;
- (_TtC14iCloudSettings14StatefulHeader)init;
- (id)init:(id)a3;
@end

@implementation StatefulHeader

- (NSString)layoutType
{
  return (NSString *)sub_2629FD268();
}

- (NSString)subTitle
{
  return (NSString *)sub_2629FD268();
}

- (NSArray)actions
{
  return (NSArray *)sub_262ADAAF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings14StatefulHeader_actions, v2, (void (*)(uint64_t))type metadata accessor for Action);
}

- (NSString)impressionUrlString
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings14StatefulHeader_impressionUrlString);
}

- (NSDictionary)impressionPayload
{
  return (NSDictionary *)sub_262AD9424((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings14StatefulHeader_impressionPayload);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return StatefulHeader.init(_:)(v3);
}

- (_TtC14iCloudSettings14StatefulHeader)init
{
  result = (_TtC14iCloudSettings14StatefulHeader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end