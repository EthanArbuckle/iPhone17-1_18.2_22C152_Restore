@interface BACollectionIDData
- (BACollectionIDData)init;
- (BACollectionIDData)initWithCollectionID:(id)a3 collectionMemberCount:(unint64_t)a4;
@end

@implementation BACollectionIDData

- (BACollectionIDData)initWithCollectionID:(id)a3 collectionMemberCount:(unint64_t)a4
{
  uint64_t v6 = sub_27DDB0();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BACollectionIDData_collectionID);
  uint64_t *v7 = v6;
  v7[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BACollectionIDData_collectionMemberCount) = (Class)a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BridgedCollectionIDData();
  return [(BACollectionIDData *)&v10 init];
}

- (BACollectionIDData)init
{
  result = (BACollectionIDData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end