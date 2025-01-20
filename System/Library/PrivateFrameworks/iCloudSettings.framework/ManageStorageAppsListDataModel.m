@interface ManageStorageAppsListDataModel
- (NSArray)apps;
- (NSString)description;
- (NSString)genericErrorMessage;
- (NSString)secondaryAppsSectionLabel;
- (_TtC14iCloudSettings24ManageStorageThermometer)thermometer;
- (_TtC14iCloudSettings30ManageStorageAppsListDataModel)init;
- (id)init:(id)a3;
- (int64_t)primaryAppsSectionCount;
@end

@implementation ManageStorageAppsListDataModel

- (NSArray)apps
{
  return (NSArray *)sub_262A11D64((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListDataModel_apps, (void (*)(void))type metadata accessor for ManageStorageApp);
}

- (NSString)genericErrorMessage
{
  return (NSString *)sub_2629FD268();
}

- (_TtC14iCloudSettings24ManageStorageThermometer)thermometer
{
  return (_TtC14iCloudSettings24ManageStorageThermometer *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListDataModel_thermometer);
}

- (int64_t)primaryAppsSectionCount
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListDataModel_primaryAppsSectionCount);
}

- (NSString)secondaryAppsSectionLabel
{
  return (NSString *)sub_2629FD268();
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageAppsListDataModel.init(_:)(v3);
}

- (NSString)description
{
  v2 = self;
  sub_262A11914();

  uint64_t v3 = (void *)sub_262B04448();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC14iCloudSettings30ManageStorageAppsListDataModel)init
{
  result = (_TtC14iCloudSettings30ManageStorageAppsListDataModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListDataModel_thermometer));

  swift_bridgeObjectRelease();
}

@end