@interface PXAssetEditOperationManager
@end

@implementation PXAssetEditOperationManager

uint64_t __85__PXAssetEditOperationManager_AdditionalPerformersHook__registerAdditionalPerformers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  int IsToggleDepth = PXAssetEditOperationTypeIsToggleDepth();
  objc_opt_class();
  uint64_t v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && IsToggleDepth) {
    uint64_t v4 = [v2 hasEditableDepth];
  }

  return v4;
}

uint64_t __85__PXAssetEditOperationManager_AdditionalPerformersHook__registerAdditionalPerformers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int IsVariation = PXAssetEditOperationTypeIsVariation();
  objc_opt_class();
  uint64_t v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && IsVariation)
  {
    id v5 = v2;
    [v5 videoCpVisibilityState];
    if ([v5 isPhotoIris]) {
      uint64_t v4 = PHVideoComplementVisibilityStateSupportsVariationChanges();
    }
    else {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

@end