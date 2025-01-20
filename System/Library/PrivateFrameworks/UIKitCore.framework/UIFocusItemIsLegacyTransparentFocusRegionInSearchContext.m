@interface UIFocusItemIsLegacyTransparentFocusRegionInSearchContext
@end

@implementation UIFocusItemIsLegacyTransparentFocusRegionInSearchContext

void ___UIFocusItemIsLegacyTransparentFocusRegionInSearchContext_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = _UIFocusItemSafeCast(a2);
  v6 = v5;
  if (v5)
  {
    v9 = v5;
    int IsViewOrRespondsToSelector = _UIFocusItemIsViewOrRespondsToSelector(v5);
    v6 = v9;
    if (IsViewOrRespondsToSelector)
    {
      char v8 = [v9 _isTransparentFocusRegion];
      v6 = v9;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
}

@end