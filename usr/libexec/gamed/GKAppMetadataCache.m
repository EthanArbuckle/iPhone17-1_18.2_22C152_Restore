@interface GKAppMetadataCache
- (GKAppMetadataCache)init;
- (GKAppMetadataCache)initWithPlayerID:(id)a3 language:(id)a4 error:(id *)a5;
- (void)deleteAllWithCompletionHandler:(id)a3;
@end

@implementation GKAppMetadataCache

- (GKAppMetadataCache)initWithPlayerID:(id)a3 language:(id)a4 error:(id *)a5
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (GKAppMetadataCache *)sub_1001CFE3C(v5, v7, v8, v9);
}

- (void)deleteAllWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  swift_retain();

  sub_10000D83C((uint64_t)&unk_1003285B8, v5);
}

- (GKAppMetadataCache)init
{
}

@end