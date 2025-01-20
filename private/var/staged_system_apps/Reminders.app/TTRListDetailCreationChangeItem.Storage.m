@interface TTRListDetailCreationChangeItem.Storage
- (id)copyWithZone:(void *)a3;
@end

@implementation TTRListDetailCreationChangeItem.Storage

- (id)copyWithZone:(void *)a3
{
  swift_retain();
  TTRListDetailCreationChangeItem.Storage.copy(with:)(v5);
  swift_release();
  sub_100038D28(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_100038CD8((uint64_t)v5);
  return v3;
}

@end