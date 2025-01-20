@interface PXPhotoLibraryProcessingProgressRowCell
@end

@implementation PXPhotoLibraryProcessingProgressRowCell

void __66___PXPhotoLibraryProcessingProgressRowCell_updateDisplayedContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleBriefDescriptionResultsWithTitle:v6 image:v5];
}

@end