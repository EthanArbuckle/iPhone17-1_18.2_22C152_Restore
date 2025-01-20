@interface BKCollectionControllerMemberManagingAddRequest
- (BKCollectionControllerMemberManagingAddRequest)init;
- (BKCollectionControllerMemberManagingAddRequest)initWithStoreID:(id)a3 collectionID:(id)a4 forceToTop:(BOOL)a5;
- (BOOL)forceToTop;
- (NSString)collectionID;
- (NSString)storeID;
@end

@implementation BKCollectionControllerMemberManagingAddRequest

- (NSString)storeID
{
  return (NSString *)sub_82068();
}

- (NSString)collectionID
{
  return (NSString *)sub_82068();
}

- (BOOL)forceToTop
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_forceToTop);
}

- (BKCollectionControllerMemberManagingAddRequest)initWithStoreID:(id)a3 collectionID:(id)a4 forceToTop:(BOOL)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_93A60();
  uint64_t v10 = v9;
  uint64_t v11 = sub_93A60();
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_storeID);
  uint64_t *v12 = v8;
  v12[1] = v10;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_collectionID);
  uint64_t *v13 = v11;
  v13[1] = v14;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_forceToTop) = a5;
  v16.receiver = self;
  v16.super_class = ObjectType;
  return [(BKCollectionControllerMemberManagingAddRequest *)&v16 init];
}

- (BKCollectionControllerMemberManagingAddRequest)init
{
  result = (BKCollectionControllerMemberManagingAddRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end