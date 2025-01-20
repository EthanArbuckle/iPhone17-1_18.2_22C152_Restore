@interface ManageStorageConfirmation
- (NSArray)actions;
- (NSString)subTitle;
- (NSString)title;
- (_TtC14iCloudSettings25ManageStorageConfirmation)init;
- (id)init:(id)a3;
@end

@implementation ManageStorageConfirmation

- (NSString)title
{
  return (NSString *)sub_2629FD268();
}

- (NSString)subTitle
{
  return (NSString *)sub_2629FD268();
}

- (NSArray)actions
{
  return (NSArray *)sub_2629FD2E4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings25ManageStorageConfirmation_actions, (void (*)(void))type metadata accessor for ManageStorageAction);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageConfirmation.init(_:)(v3);
}

- (_TtC14iCloudSettings25ManageStorageConfirmation)init
{
  result = (_TtC14iCloudSettings25ManageStorageConfirmation *)_swift_stdlib_reportUnimplementedInitializer();
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