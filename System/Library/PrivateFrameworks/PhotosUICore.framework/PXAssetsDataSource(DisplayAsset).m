@interface PXAssetsDataSource(DisplayAsset)
- (void)displayAssetAtIndexPath:()DisplayAsset;
- (void)indexPathForDisplayAsset:()DisplayAsset hintIndexPath:;
@end

@implementation PXAssetsDataSource(DisplayAsset)

- (void)indexPathForDisplayAsset:()DisplayAsset hintIndexPath:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)off_1E5DA55E0);
  [a1 identifier];
  PXSimpleIndexPathFromIndexPath();
}

- (void)displayAssetAtIndexPath:()DisplayAsset
{
  id v4 = a3;
  [a1 identifier];
  PXSimpleIndexPathFromIndexPath();
}

@end