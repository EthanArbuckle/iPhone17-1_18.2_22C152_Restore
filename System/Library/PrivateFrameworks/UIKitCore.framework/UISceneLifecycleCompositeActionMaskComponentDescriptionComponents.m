@interface UISceneLifecycleCompositeActionMaskComponentDescriptionComponents
@end

@implementation UISceneLifecycleCompositeActionMaskComponentDescriptionComponents

uint64_t ___UISceneLifecycleCompositeActionMaskComponentDescriptionComponents_block_invoke(uint64_t a1, unsigned int a2)
{
  if (a2 > 6) {
    v2 = &stru_1ED0E84C0;
  }
  else {
    v2 = off_1E52F1A08[a2];
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];
}

@end