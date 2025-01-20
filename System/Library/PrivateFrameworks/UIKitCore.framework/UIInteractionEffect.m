@interface UIInteractionEffect
@end

@implementation UIInteractionEffect

void __59___UIInteractionEffect_deprecated__prepareAnimatorIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateFromTransformer:v3];
}

@end