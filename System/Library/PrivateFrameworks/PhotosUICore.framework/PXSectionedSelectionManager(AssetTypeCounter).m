@interface PXSectionedSelectionManager(AssetTypeCounter)
- (PXAssetSelectionTypeCounter)assetTypeCounter;
@end

@implementation PXSectionedSelectionManager(AssetTypeCounter)

- (PXAssetSelectionTypeCounter)assetTypeCounter
{
  objc_getAssociatedObject(a1, (const void *)PXAssetTypeCounterKey);
  v2 = (PXAssetSelectionTypeCounter *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [a1 selectionSnapshot];
    v4 = [v3 dataSource];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v2 = [[PXAssetSelectionTypeCounter alloc] initWithSelectionManager:a1];
      objc_setAssociatedObject(a1, (const void *)PXAssetTypeCounterKey, v2, (void *)1);
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

@end