@interface ManageStorageSpecifier
- (NSString)identifier;
- (NSString)subTitle;
- (NSString)title;
- (_TtC14iCloudSettings19ManageStorageAction)action;
- (_TtC14iCloudSettings22ManageStorageSpecifier)init;
- (id)init:(id)a3;
@end

@implementation ManageStorageSpecifier

- (NSString)identifier
{
  return (NSString *)sub_2629FD268();
}

- (NSString)title
{
  return (NSString *)sub_2629FD268();
}

- (NSString)subTitle
{
  return (NSString *)sub_2629FD268();
}

- (_TtC14iCloudSettings19ManageStorageAction)action
{
  return (_TtC14iCloudSettings19ManageStorageAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR____TtC14iCloudSettings22ManageStorageSpecifier_action));
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageSpecifier.init(_:)(v3);
}

- (_TtC14iCloudSettings22ManageStorageSpecifier)init
{
  result = (_TtC14iCloudSettings22ManageStorageSpecifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings22ManageStorageSpecifier_action);
}

@end