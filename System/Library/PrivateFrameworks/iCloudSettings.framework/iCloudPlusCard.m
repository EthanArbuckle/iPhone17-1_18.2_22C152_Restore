@interface iCloudPlusCard
- (NSArray)features;
- (NSString)title;
- (_TtC14iCloudSettings14iCloudPlusCard)init;
- (id)init:(id)a3;
@end

@implementation iCloudPlusCard

- (NSString)title
{
  return (NSString *)sub_2629FD268();
}

- (NSArray)features
{
  return (NSArray *)sub_262ADAAF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings14iCloudPlusCard_features, v2, (void (*)(uint64_t))type metadata accessor for Feature);
}

- (id)init:(id)a3
{
  return (id)sub_262AD71C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))iCloudPlusCard.init(_:));
}

- (_TtC14iCloudSettings14iCloudPlusCard)init
{
  result = (_TtC14iCloudSettings14iCloudPlusCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end