@interface WFTrigger(BiomeContext)
+ (uint64_t)unregisterContextSyncClient;
- (uint64_t)hasRemotePublisher;
- (uint64_t)publisherWithScheduler:()BiomeContext;
- (uint64_t)remotePublisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFTrigger(BiomeContext)

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = a5;
  [v5 raise:v6 format:@"-[WFTrigger shouldFireInResponseToEvent:] must be overridden"];
  v7[2](v7, 0);
}

- (uint64_t)remotePublisherWithScheduler:()BiomeContext
{
  return 0;
}

- (uint64_t)hasRemotePublisher
{
  return 0;
}

- (uint64_t)publisherWithScheduler:()BiomeContext
{
  return 0;
}

+ (uint64_t)unregisterContextSyncClient
{
  return 0;
}

@end