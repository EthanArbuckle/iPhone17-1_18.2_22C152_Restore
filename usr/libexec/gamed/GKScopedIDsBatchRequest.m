@interface GKScopedIDsBatchRequest
- (GKScopedIDsBatchRequest)init;
- (NSArray)gameBundleIDs;
- (NSArray)playerIDs;
@end

@implementation GKScopedIDsBatchRequest

- (NSArray)playerIDs
{
  return (NSArray *)sub_10017601C(self, (uint64_t)a2, (void (*)(void))ScopedIDsBatchRequest.playerIDs.getter);
}

- (NSArray)gameBundleIDs
{
  return (NSArray *)sub_10017601C(self, (uint64_t)a2, (void (*)(void))ScopedIDsBatchRequest.gameBundleIDs.getter);
}

- (GKScopedIDsBatchRequest)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end