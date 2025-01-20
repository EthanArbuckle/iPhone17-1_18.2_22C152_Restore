@interface PXSectionedSelectionManager(PUOneUpSelectionIndicatorCompatibility)
- (uint64_t)pu_isAssetReferenceSelected:()PUOneUpSelectionIndicatorCompatibility;
- (uint64_t)pu_registerSelectionIndicatorObserver:()PUOneUpSelectionIndicatorCompatibility;
- (uint64_t)pu_unregisterSelectionIndicatorObserver:()PUOneUpSelectionIndicatorCompatibility;
@end

@implementation PXSectionedSelectionManager(PUOneUpSelectionIndicatorCompatibility)

- (uint64_t)pu_isAssetReferenceSelected:()PUOneUpSelectionIndicatorCompatibility
{
  v4 = [a3 indexPath];
  v5 = [a1 selectionSnapshot];
  v6 = [v5 dataSource];
  [v6 identifier];

  PXSimpleIndexPathFromIndexPath();
  memset(v9, 0, sizeof(v9));
  uint64_t v7 = [v5 isIndexPathSelected:v9];

  return v7;
}

- (uint64_t)pu_unregisterSelectionIndicatorObserver:()PUOneUpSelectionIndicatorCompatibility
{
  return [a1 unregisterChangeObserver:a3 context:PhotosUICoreSelectionManagerObservationContext_47920];
}

- (uint64_t)pu_registerSelectionIndicatorObserver:()PUOneUpSelectionIndicatorCompatibility
{
  return [a1 registerChangeObserver:a3 context:PhotosUICoreSelectionManagerObservationContext_47920];
}

@end