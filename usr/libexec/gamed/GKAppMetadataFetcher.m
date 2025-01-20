@interface GKAppMetadataFetcher
+ (id)createFor:(id)a3 language:(id)a4 bag:(id)a5 error:(id *)a6;
- (GKAppMetadataFetcher)init;
- (void)fetchWithBundleIDs:(NSArray *)a3 adamIDs:(NSArray *)a4 batchSize:(int64_t)a5 ttl:(double)a6 refreshExpiredCompletion:(id)a7 completionHandler:;
@end

@implementation GKAppMetadataFetcher

+ (id)createFor:(id)a3 language:(id)a4 bag:(id)a5 error:(id *)a6
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  swift_unknownObjectRetain();
  id v13 = sub_100169C38(v7, v9, v10, v12, (uint64_t)a5);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (void)fetchWithBundleIDs:(NSArray *)a3 adamIDs:(NSArray *)a4 batchSize:(int64_t)a5 ttl:(double)a6 refreshExpiredCompletion:(id)a7 completionHandler:
{
  uint64_t v8 = v7;
  v14 = _Block_copy(a7);
  v15 = _Block_copy(v8);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  *(void *)(v16 + 32) = a5;
  *(double *)(v16 + 40) = a6;
  *(void *)(v16 + 48) = v14;
  *(void *)(v16 + 56) = v15;
  *(void *)(v16 + 64) = self;
  v17 = a3;
  v18 = a4;
  v19 = self;

  sub_10000D83C((uint64_t)&unk_100326448, v16);
}

- (GKAppMetadataFetcher)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR___GKAppMetadataFetcher_network;

  sub_100016C38((uint64_t)v3);
}

@end