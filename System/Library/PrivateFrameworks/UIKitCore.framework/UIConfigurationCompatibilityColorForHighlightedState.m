@interface UIConfigurationCompatibilityColorForHighlightedState
@end

@implementation UIConfigurationCompatibilityColorForHighlightedState

id ___UIConfigurationCompatibilityColorForHighlightedState_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:a2];
  v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

@end