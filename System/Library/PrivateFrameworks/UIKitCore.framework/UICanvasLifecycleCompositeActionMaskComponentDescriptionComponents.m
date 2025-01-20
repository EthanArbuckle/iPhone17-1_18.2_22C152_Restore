@interface UICanvasLifecycleCompositeActionMaskComponentDescriptionComponents
@end

@implementation UICanvasLifecycleCompositeActionMaskComponentDescriptionComponents

uint64_t ___UICanvasLifecycleCompositeActionMaskComponentDescriptionComponents_block_invoke(uint64_t a1, unsigned int a2)
{
  if (a2 > 6) {
    v2 = &stru_1ED0E84C0;
  }
  else {
    v2 = off_1E52E0568[a2];
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];
}

@end