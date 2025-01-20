@interface PeopleSuggestionsJointEvent
- (NSString)description;
- (_TtC15ReportingPlugin27PeopleSuggestionsJointEvent)init;
@end

@implementation PeopleSuggestionsJointEvent

- (NSString)description
{
  v2 = self;
  sub_25B3D2C5C();

  v3 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15ReportingPlugin27PeopleSuggestionsJointEvent)init
{
  result = (_TtC15ReportingPlugin27PeopleSuggestionsJointEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp;
  uint64_t v3 = sub_25B3DCC98();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end