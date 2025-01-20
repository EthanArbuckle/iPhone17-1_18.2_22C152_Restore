@interface BSUIAssetActionModifyResponse
- (BSUIAssetActionModifyResponse)init;
- (BSUIAssetActionModifyResponse)initWithCollectionTitle:(id)a3 assetID:(id)a4 assetContentType:(int64_t)a5;
- (NSString)assetID;
- (NSString)collectionTitle;
- (int64_t)assetContentType;
@end

@implementation BSUIAssetActionModifyResponse

- (NSString)collectionTitle
{
  return (NSString *)sub_1064FC();
}

- (NSString)assetID
{
  return (NSString *)sub_1064FC();
}

- (int64_t)assetContentType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BSUIAssetActionModifyResponse_assetContentType);
}

- (BSUIAssetActionModifyResponse)initWithCollectionTitle:(id)a3 assetID:(id)a4 assetContentType:(int64_t)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_2E4420();
  uint64_t v10 = v9;
  uint64_t v11 = sub_2E4420();
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___BSUIAssetActionModifyResponse_collectionTitle);
  uint64_t *v12 = v8;
  v12[1] = v10;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___BSUIAssetActionModifyResponse_assetID);
  uint64_t *v13 = v11;
  v13[1] = v14;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIAssetActionModifyResponse_assetContentType) = (Class)a5;
  v16.receiver = self;
  v16.super_class = ObjectType;
  return [(BSUIAssetActionModifyResponse *)&v16 init];
}

- (BSUIAssetActionModifyResponse)init
{
  result = (BSUIAssetActionModifyResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end