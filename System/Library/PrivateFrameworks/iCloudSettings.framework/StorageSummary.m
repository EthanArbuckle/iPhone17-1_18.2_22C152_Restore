@interface StorageSummary
- (NSString)storageBarColor;
- (NSString)storageBarLabel;
- (NSString)subscriptionLabel;
- (NSString)usageLabel;
- (_TtC14iCloudSettings14StorageSummary)init;
- (_TtC14iCloudSettings6Action)action;
- (id)init:(id)a3;
- (unint64_t)totalStorageInBytes;
- (unint64_t)usedStorageInBytes;
@end

@implementation StorageSummary

- (NSString)subscriptionLabel
{
  return (NSString *)sub_2629FD268();
}

- (NSString)storageBarLabel
{
  return (NSString *)sub_2629FD268();
}

- (NSString)storageBarColor
{
  return (NSString *)sub_2629FD268();
}

- (unint64_t)totalStorageInBytes
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC14iCloudSettings14StorageSummary_totalStorageInBytes);
}

- (unint64_t)usedStorageInBytes
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC14iCloudSettings14StorageSummary_usedStorageInBytes);
}

- (NSString)usageLabel
{
  return (NSString *)sub_2629FD268();
}

- (_TtC14iCloudSettings6Action)action
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC14iCloudSettings14StorageSummary_action));
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return StorageSummary.init(_:)(v3);
}

- (_TtC14iCloudSettings14StorageSummary)init
{
  result = (_TtC14iCloudSettings14StorageSummary *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings14StorageSummary_action);
}

@end