@interface ManageStorageThermometer
- (NSArray)sections;
- (NSString)dimmedSectionColor;
- (NSString)otherAppsDisplayLabel;
- (NSString)usageLabel;
- (_TtC14iCloudSettings24ManageStorageThermometer)init;
- (id)init:(id)a3;
@end

@implementation ManageStorageThermometer

- (NSArray)sections
{
  return (NSArray *)sub_262A11D64((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings24ManageStorageThermometer_sections, (void (*)(void))type metadata accessor for ManageStorageThermometerSection);
}

- (NSString)otherAppsDisplayLabel
{
  return (NSString *)sub_2629FD268();
}

- (NSString)dimmedSectionColor
{
  return (NSString *)sub_2629FD268();
}

- (NSString)usageLabel
{
  return (NSString *)sub_2629FD268();
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageThermometer.init(_:)(v3);
}

- (_TtC14iCloudSettings24ManageStorageThermometer)init
{
  result = (_TtC14iCloudSettings24ManageStorageThermometer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end