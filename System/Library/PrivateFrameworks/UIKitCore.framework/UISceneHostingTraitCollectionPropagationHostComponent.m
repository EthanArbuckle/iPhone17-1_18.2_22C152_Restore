@interface UISceneHostingTraitCollectionPropagationHostComponent
@end

@implementation UISceneHostingTraitCollectionPropagationHostComponent

void __77___UISceneHostingTraitCollectionPropagationHostComponent_setTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTraitCollection:v3];
  id v5 = [*(id *)(a1 + 32) _tintColor];
  [v4 setTintColor:v5];
}

@end