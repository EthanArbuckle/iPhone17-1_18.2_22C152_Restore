@interface PNAssetFetcher
+ (id)fetchAssetsWithOptions:(id)a3;
- (PNAssetFetcher)init;
@end

@implementation PNAssetFetcher

+ (id)fetchAssetsWithOptions:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  v5 = (void *)static AssetFetcher.fetchAssets(options:)((uint64_t)v4);

  return v5;
}

- (PNAssetFetcher)init
{
  return (PNAssetFetcher *)AssetFetcher.init()();
}

@end