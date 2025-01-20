@interface ICSHomeDataModel
- (ICSHomeDataModel)init;
- (NSString)description;
- (_TtC14iCloudSettings10HeaderCard)headerCard;
- (_TtC14iCloudSettings10UpsellCard)upsellCard;
- (_TtC14iCloudSettings14BackupViewInfo)backupViewInfo;
- (_TtC14iCloudSettings14SettingsFooter)settingsFooter;
- (_TtC14iCloudSettings14iCloudAppsCard)icloudAppsCard;
- (_TtC14iCloudSettings14iCloudPlusCard)icloudPlusCard;
- (_TtC14iCloudSettings21ManageStorageViewInfo)manageStorageViewInfo;
- (_TtC14iCloudSettings6Action)manageSubscriptionsAction;
- (_TtC14iCloudSettings6Action)preLaunchAction;
- (id)init:(id)a3;
@end

@implementation ICSHomeDataModel

- (_TtC14iCloudSettings10HeaderCard)headerCard
{
  return (_TtC14iCloudSettings10HeaderCard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___ICSHomeDataModel_headerCard));
}

- (_TtC14iCloudSettings10UpsellCard)upsellCard
{
  return (_TtC14iCloudSettings10UpsellCard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___ICSHomeDataModel_upsellCard));
}

- (_TtC14iCloudSettings14iCloudPlusCard)icloudPlusCard
{
  return (_TtC14iCloudSettings14iCloudPlusCard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR___ICSHomeDataModel_icloudPlusCard));
}

- (_TtC14iCloudSettings14iCloudAppsCard)icloudAppsCard
{
  return (_TtC14iCloudSettings14iCloudAppsCard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR___ICSHomeDataModel_icloudAppsCard));
}

- (_TtC14iCloudSettings21ManageStorageViewInfo)manageStorageViewInfo
{
  return (_TtC14iCloudSettings21ManageStorageViewInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                + OBJC_IVAR___ICSHomeDataModel_manageStorageViewInfo));
}

- (_TtC14iCloudSettings14BackupViewInfo)backupViewInfo
{
  return (_TtC14iCloudSettings14BackupViewInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR___ICSHomeDataModel_backupViewInfo));
}

- (_TtC14iCloudSettings6Action)preLaunchAction
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___ICSHomeDataModel_preLaunchAction));
}

- (_TtC14iCloudSettings6Action)manageSubscriptionsAction
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___ICSHomeDataModel_manageSubscriptionsAction));
}

- (_TtC14iCloudSettings14SettingsFooter)settingsFooter
{
  return (_TtC14iCloudSettings14SettingsFooter *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR___ICSHomeDataModel_settingsFooter));
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return iCloudHomeDataModel.init(_:)(v3);
}

- (NSString)description
{
  v2 = self;
  iCloudHomeDataModel.description.getter();

  uint64_t v3 = (void *)sub_262B04448();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (ICSHomeDataModel)init
{
  result = (ICSHomeDataModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSHomeDataModel_settingsFooter);
}

@end