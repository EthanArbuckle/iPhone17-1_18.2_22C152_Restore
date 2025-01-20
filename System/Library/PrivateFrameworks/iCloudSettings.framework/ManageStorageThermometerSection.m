@interface ManageStorageThermometerSection
- (NSString)bundleId;
- (NSString)displayLabel;
- (_TtC14iCloudSettings31ManageStorageThermometerSection)init;
- (double)storagePercentage;
- (id)init:(id)a3;
@end

@implementation ManageStorageThermometerSection

- (NSString)bundleId
{
  return (NSString *)sub_2629FD268();
}

- (NSString)displayLabel
{
  return (NSString *)sub_2629FD268();
}

- (double)storagePercentage
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC14iCloudSettings31ManageStorageThermometerSection_storagePercentage);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageThermometerSection.init(_:)(v3);
}

- (_TtC14iCloudSettings31ManageStorageThermometerSection)init
{
  result = (_TtC14iCloudSettings31ManageStorageThermometerSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end