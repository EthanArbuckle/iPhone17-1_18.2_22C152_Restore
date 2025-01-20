@interface TPSAssetCacheController
+ (id)sharedInstance;
- (id)newDataCache;
@end

@implementation TPSAssetCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_6 != -1) {
    dispatch_once(&sharedInstance_predicate_6, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance_gTPSAssetCacheController;
  return v2;
}

uint64_t __41__TPSAssetCacheController_sharedInstance__block_invoke()
{
  v0 = [(TPSDataCacheController *)[TPSAssetCacheController alloc] initWithIdentifier:@"TPSAssetCacheIdentifier" directoryName:@"Assets" maxCacheSize:125829120 URLSessionDataType:2];
  uint64_t v1 = sharedInstance_gTPSAssetCacheController;
  sharedInstance_gTPSAssetCacheController = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)newDataCache
{
  v2 = objc_alloc_init(TPSDataCache);
  [(TPSDataCache *)v2 setCacheType:2];
  [(TPSDataCache *)v2 setMaxAge:21600];
  return v2;
}

@end