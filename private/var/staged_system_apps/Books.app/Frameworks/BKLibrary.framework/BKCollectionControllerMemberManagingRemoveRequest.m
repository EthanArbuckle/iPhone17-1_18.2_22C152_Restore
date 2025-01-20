@interface BKCollectionControllerMemberManagingRemoveRequest
- (BKCollectionControllerMemberManagingRemoveRequest)init;
- (BKCollectionControllerMemberManagingRemoveRequest)initWithStoreID:(id)a3 collectionID:(id)a4;
- (NSString)collectionID;
- (NSString)storeID;
@end

@implementation BKCollectionControllerMemberManagingRemoveRequest

- (NSString)storeID
{
  return (NSString *)sub_82068();
}

- (NSString)collectionID
{
  return (NSString *)sub_82068();
}

- (BKCollectionControllerMemberManagingRemoveRequest)initWithStoreID:(id)a3 collectionID:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_93A60();
  uint64_t v8 = v7;
  uint64_t v9 = sub_93A60();
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_storeID);
  uint64_t *v10 = v6;
  v10[1] = v8;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_collectionID);
  uint64_t *v11 = v9;
  v11[1] = v12;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return [(BKCollectionControllerMemberManagingRemoveRequest *)&v14 init];
}

- (BKCollectionControllerMemberManagingRemoveRequest)init
{
  result = (BKCollectionControllerMemberManagingRemoveRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end