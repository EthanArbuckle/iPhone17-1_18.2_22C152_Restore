@interface BSUIContextMenuAssetPropertyProvider
- (BOOL)isOwned;
- (BOOL)isStoreAsset;
- (BSUIContextMenuAssetPropertyProvider)init;
- (NSString)assetID;
- (int64_t)assetType;
@end

@implementation BSUIContextMenuAssetPropertyProvider

- (NSString)assetID
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIContextMenuAssetPropertyProvider_assetInfo);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_71044(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v6(v4, v5);

  NSString v8 = sub_2E43E0();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (int64_t)assetType
{
  v2 = self;
  int64_t v3 = sub_286660();

  return v3;
}

- (BOOL)isOwned
{
  int64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIContextMenuAssetPropertyProvider_assetInfo);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_71044(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 152);
  v7 = self;
  char v8 = v6(v4, v5);

  return v8 & 1;
}

- (BOOL)isStoreAsset
{
  int64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIContextMenuAssetPropertyProvider_assetInfo);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_71044(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 288);
  v7 = self;
  v6(v4, v5);
  uint64_t v9 = v8;

  if (v9) {
    swift_bridgeObjectRelease();
  }
  return v9 != 0;
}

- (BSUIContextMenuAssetPropertyProvider)init
{
  result = (BSUIContextMenuAssetPropertyProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end