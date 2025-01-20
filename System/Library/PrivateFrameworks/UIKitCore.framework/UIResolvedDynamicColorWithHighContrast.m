@interface UIResolvedDynamicColorWithHighContrast
@end

@implementation UIResolvedDynamicColorWithHighContrast

id ___UIResolvedDynamicColorWithHighContrast_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _traitCollectionByReplacingNSIntegerValue:a2 forTraitToken:0x1ED3F5B08];
  v4 = [*(id *)(a1 + 40) _resolvedColorWithTraitCollection:v3];

  return v4;
}

@end