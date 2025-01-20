@interface BSUIAssetActionModifyRequest
- (BSUIAssetActionModifyRequest)init;
- (BSUIAssetActionModifyRequest)initWithStoreID:(id)a3 collectionID:(id)a4 tracker:(id)a5;
- (NSString)collectionID;
- (NSString)storeID;
- (_TtC13BookAnalytics9BATracker)tracker;
@end

@implementation BSUIAssetActionModifyRequest

- (NSString)storeID
{
  return (NSString *)sub_1064FC();
}

- (NSString)collectionID
{
  return (NSString *)sub_1064FC();
}

- (_TtC13BookAnalytics9BATracker)tracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR___BSUIAssetActionModifyRequest_tracker));
}

- (BSUIAssetActionModifyRequest)initWithStoreID:(id)a3 collectionID:(id)a4 tracker:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_2E4420();
  uint64_t v10 = v9;
  uint64_t v11 = sub_2E4420();
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___BSUIAssetActionModifyRequest_storeID);
  uint64_t *v12 = v8;
  v12[1] = v10;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___BSUIAssetActionModifyRequest_collectionID);
  uint64_t *v13 = v11;
  v13[1] = v14;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIAssetActionModifyRequest_tracker) = (Class)a5;
  v17.receiver = self;
  v17.super_class = ObjectType;
  id v15 = a5;
  return [(BSUIAssetActionModifyRequest *)&v17 init];
}

- (BSUIAssetActionModifyRequest)init
{
  result = (BSUIAssetActionModifyRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIAssetActionModifyRequest_tracker);
}

@end