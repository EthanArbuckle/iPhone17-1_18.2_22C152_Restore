@interface BKCollectionControllerMemberManagingModifyResponse
- (BKCollectionControllerMemberManagingModifyResponse)init;
- (BKCollectionControllerMemberManagingModifyResponse)initWithAssetID:(id)a3 assetContentType:(int64_t)a4 collectionTitle:(id)a5;
- (NSString)assetID;
- (NSString)collectionTitle;
- (int64_t)assetContentType;
@end

@implementation BKCollectionControllerMemberManagingModifyResponse

- (NSString)assetID
{
  return (NSString *)sub_82068();
}

- (int64_t)assetContentType
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetContentType);
}

- (NSString)collectionTitle
{
  return (NSString *)sub_82068();
}

- (BKCollectionControllerMemberManagingModifyResponse)initWithAssetID:(id)a3 assetContentType:(int64_t)a4 collectionTitle:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_93A60();
  uint64_t v10 = v9;
  uint64_t v11 = sub_93A60();
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetID);
  uint64_t *v12 = v8;
  v12[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetContentType) = (Class)a4;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_collectionTitle);
  uint64_t *v13 = v11;
  v13[1] = v14;
  v16.receiver = self;
  v16.super_class = ObjectType;
  return [(BKCollectionControllerMemberManagingModifyResponse *)&v16 init];
}

- (BKCollectionControllerMemberManagingModifyResponse)init
{
  result = (BKCollectionControllerMemberManagingModifyResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end