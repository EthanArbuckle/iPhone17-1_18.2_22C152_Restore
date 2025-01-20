@interface AllBackdropViews
@end

@implementation AllBackdropViews

void ___AllBackdropViews_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  v1 = (void *)qword_1EB25E668;
  qword_1EB25E668 = v0;

  _MergedGlobals_69 = _AXSEnhanceBackgroundContrastEnabled() != 0;
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:objc_opt_class() selector:sel_adjustGraphicsQualityForAccessibilityIfNeeded_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
  [v2 addObserver:objc_opt_class() selector:sel_adjustGraphicsQualityForAccessibilityIfNeeded_ name:@"UIAccessibilityReduceTransparencyStatusDidChangeNotification" object:0];
}

@end