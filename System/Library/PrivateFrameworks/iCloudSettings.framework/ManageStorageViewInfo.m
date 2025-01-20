@interface ManageStorageViewInfo
- (NSArray)specifiers;
- (NSArray)tips;
- (NSString)storageHeaderText;
- (NSString)title;
- (_TtC14iCloudSettings21ManageStorageViewInfo)init;
- (_TtC14iCloudSettings22ManageStorageBarColors)storageBarColors;
- (id)init:(id)a3;
@end

@implementation ManageStorageViewInfo

- (NSString)title
{
  return (NSString *)sub_2629FD268();
}

- (NSString)storageHeaderText
{
  return (NSString *)sub_2629FD268();
}

- (_TtC14iCloudSettings22ManageStorageBarColors)storageBarColors
{
  return (_TtC14iCloudSettings22ManageStorageBarColors *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR____TtC14iCloudSettings21ManageStorageViewInfo_storageBarColors));
}

- (NSArray)specifiers
{
  return (NSArray *)sub_2629FD2E4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings21ManageStorageViewInfo_specifiers, (void (*)(void))type metadata accessor for ManageStorageSpecifier);
}

- (NSArray)tips
{
  return (NSArray *)sub_2629FD2E4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings21ManageStorageViewInfo_tips, (void (*)(void))type metadata accessor for ManageStorageTip);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageViewInfo.init(_:)(v3);
}

- (_TtC14iCloudSettings21ManageStorageViewInfo)init
{
  result = (_TtC14iCloudSettings21ManageStorageViewInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings21ManageStorageViewInfo_storageBarColors));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end