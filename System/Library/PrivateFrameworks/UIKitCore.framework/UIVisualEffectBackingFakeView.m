@interface UIVisualEffectBackingFakeView
@end

@implementation UIVisualEffectBackingFakeView

BOOL __49___UIVisualEffectBackingFakeView_setViewEffects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

@end