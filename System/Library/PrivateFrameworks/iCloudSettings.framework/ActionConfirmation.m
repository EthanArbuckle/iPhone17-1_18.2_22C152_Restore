@interface ActionConfirmation
- (NSArray)actions;
- (NSString)message;
- (NSString)title;
- (_TtC14iCloudSettings18ActionConfirmation)init;
- (id)init:(id)a3;
@end

@implementation ActionConfirmation

- (NSString)title
{
  return (NSString *)sub_2629FD268();
}

- (NSString)message
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings18ActionConfirmation_message);
}

- (NSArray)actions
{
  return (NSArray *)sub_262ADAAF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings18ActionConfirmation_actions, v2, (void (*)(uint64_t))type metadata accessor for Action);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ActionConfirmation.init(_:)(v3);
}

- (_TtC14iCloudSettings18ActionConfirmation)init
{
  result = (_TtC14iCloudSettings18ActionConfirmation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end