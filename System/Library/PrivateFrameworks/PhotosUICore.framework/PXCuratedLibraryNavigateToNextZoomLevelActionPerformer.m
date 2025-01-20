@interface PXCuratedLibraryNavigateToNextZoomLevelActionPerformer
@end

@implementation PXCuratedLibraryNavigateToNextZoomLevelActionPerformer

uint64_t __85___PXCuratedLibraryNavigateToNextZoomLevelActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:*(void *)(a1 + 32)];
}

@end