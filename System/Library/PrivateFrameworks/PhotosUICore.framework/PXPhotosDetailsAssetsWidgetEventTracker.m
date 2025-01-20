@interface PXPhotosDetailsAssetsWidgetEventTracker
@end

@implementation PXPhotosDetailsAssetsWidgetEventTracker

void __67___PXPhotosDetailsAssetsWidgetEventTracker__invalidateVisibleState__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) updater];
  [v1 setNeedsUpdateOf:sel__updateVisibleState];
}

@end