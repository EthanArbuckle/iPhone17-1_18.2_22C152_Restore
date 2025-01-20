@interface PHFetchOptions
- (void)npto_includeCompanionSyncedAssetSourceTypes;
@end

@implementation PHFetchOptions

- (void)npto_includeCompanionSyncedAssetSourceTypes
{
  unint64_t v3 = [(PHFetchOptions *)self includeAssetSourceTypes] | 0x40;

  [(PHFetchOptions *)self setIncludeAssetSourceTypes:v3];
}

@end