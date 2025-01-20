@interface _PUEmptyAssetsDataSource
- (id)indexPathForAssetCollection:(id)a3;
- (id)indexPathForAssetReference:(id)a3;
- (int64_t)numberOfSubItemsAtIndexPath:(id)a3;
@end

@implementation _PUEmptyAssetsDataSource

- (id)indexPathForAssetCollection:(id)a3
{
  return 0;
}

- (id)indexPathForAssetReference:(id)a3
{
  return 0;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  return 0;
}

@end