@interface iCloudAppsCard
- (NSArray)apps;
- (NSString)detailLabel;
- (NSString)statusColor;
- (NSString)subtitle;
- (NSString)title;
- (_TtC14iCloudSettings14iCloudAppsCard)init;
- (id)init:(id)a3;
@end

@implementation iCloudAppsCard

- (NSString)title
{
  return (NSString *)sub_2629FD268();
}

- (NSString)subtitle
{
  return (NSString *)sub_2629FD268();
}

- (NSString)detailLabel
{
  return (NSString *)sub_2629FD268();
}

- (NSString)statusColor
{
  return (NSString *)sub_2629FD268();
}

- (NSArray)apps
{
  return (NSArray *)sub_262ADAAF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings14iCloudAppsCard_apps, v2, (void (*)(uint64_t))type metadata accessor for iCloudApp);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return iCloudAppsCard.init(_:)(v3);
}

- (_TtC14iCloudSettings14iCloudAppsCard)init
{
  result = (_TtC14iCloudSettings14iCloudAppsCard *)_swift_stdlib_reportUnimplementedInitializer();
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