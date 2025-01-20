@interface RecordStoreRegistry
- (id)assetStore;
- (id)deletingStoreFor:(int64_t)a3;
- (id)recordStoreFor:(int64_t)a3;
- (void)registerRecordStoreWithType:(int64_t)a3 store:(id)a4;
@end

@implementation RecordStoreRegistry

- (id)recordStoreFor:(int64_t)a3
{
  v3 = (void *)sub_223380A6C(a3);
  return v3;
}

- (id)deletingStoreFor:(int64_t)a3
{
  v3 = (void *)sub_223380B0C(a3);
  return v3;
}

- (id)assetStore
{
  v2 = (void *)sub_223380BD8();
  return v2;
}

- (void)registerRecordStoreWithType:(int64_t)a3 store:(id)a4
{
  swift_beginAccess();
  swift_unknownObjectRetain_n();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *(void *)self->recordStore;
  *(void *)self->recordStore = 0x8000000000000000;
  sub_2233CE930((uint64_t)a4, a3, isUniquelyReferenced_nonNull_native);
  *(void *)self->recordStore = v8;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_unknownObjectRelease();
  swift_release();
}

@end