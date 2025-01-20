@interface UnknownDiscoveryTrampoline
- (_TtC12searchpartyd26UnknownDiscoveryTrampoline)init;
- (void)fetchEncryptedPayloadForUnknownBeacon:(id)a3 completion:(id)a4;
- (void)startDiscoveryWithScanRate:(int64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)startUnknownDiscoveryWithCompletion:(id)a3;
- (void)stopUnknownDiscoveryWithCompletion:(id)a3;
@end

@implementation UnknownDiscoveryTrampoline

- (void)startUnknownDiscoveryWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10041D36C((uint64_t)sub_1001E06E0, v5);

  swift_release();
}

- (void)startDiscoveryWithScanRate:(int64_t)a3 timeout:(double)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_10041D36C((uint64_t)sub_1001E06E0, v7);

  swift_release();
}

- (void)stopUnknownDiscoveryWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10041DBCC((uint64_t)sub_1001DF814, v5);

  swift_release();
}

- (void)fetchEncryptedPayloadForUnknownBeacon:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_10041E430(v8, (uint64_t)sub_1007C7CA8, v7);

  swift_release();
}

- (_TtC12searchpartyd26UnknownDiscoveryTrampoline)init
{
  result = (_TtC12searchpartyd26UnknownDiscoveryTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end