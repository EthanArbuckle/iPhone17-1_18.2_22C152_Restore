@interface ManageStorageApp
- (BOOL)applySystemStyle;
- (BOOL)fetchLocally;
- (BOOL)showInAppList;
- (NSArray)bundleIds;
- (NSString)detailLabel;
- (NSString)detailLabelColor;
- (NSString)label;
- (NSString)thermometerUsageLabel;
- (_TtC14iCloudSettings16ManageStorageApp)init;
- (_TtC14iCloudSettings19ManageStorageAction)action;
- (_TtC14iCloudSettings23ManageStorageAppIconURL)detailViewIconUrls;
- (_TtC14iCloudSettings23ManageStorageAppIconURL)iconUrls;
- (id)init:(id)a3;
@end

@implementation ManageStorageApp

- (NSString)label
{
  return (NSString *)sub_2629FD268();
}

- (NSString)detailLabel
{
  return (NSString *)sub_2629FD268();
}

- (NSString)detailLabelColor
{
  return (NSString *)sub_2629FD268();
}

- (NSArray)bundleIds
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_262B04548();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (BOOL)fetchLocally
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_fetchLocally);
}

- (BOOL)applySystemStyle
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_applySystemStyle);
}

- (_TtC14iCloudSettings23ManageStorageAppIconURL)iconUrls
{
  return (_TtC14iCloudSettings23ManageStorageAppIconURL *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_iconUrls));
}

- (_TtC14iCloudSettings23ManageStorageAppIconURL)detailViewIconUrls
{
  return (_TtC14iCloudSettings23ManageStorageAppIconURL *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_detailViewIconUrls));
}

- (_TtC14iCloudSettings19ManageStorageAction)action
{
  return (_TtC14iCloudSettings19ManageStorageAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_action));
}

- (NSString)thermometerUsageLabel
{
  return (NSString *)sub_2629FD268();
}

- (BOOL)showInAppList
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_showInAppList);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageApp.init(_:)(v3);
}

- (_TtC14iCloudSettings16ManageStorageApp)init
{
  result = (_TtC14iCloudSettings16ManageStorageApp *)_swift_stdlib_reportUnimplementedInitializer();
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
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_category);
  unint64_t v4 = *(void *)&self->label[OBJC_IVAR____TtC14iCloudSettings16ManageStorageApp_category];

  sub_2629C7738(v3, v4);
}

@end