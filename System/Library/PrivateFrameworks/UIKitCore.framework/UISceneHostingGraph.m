@interface UISceneHostingGraph
@end

@implementation UISceneHostingGraph

void __38___UISceneHostingGraph_sharedInstance__block_invoke()
{
  id v0 = [[_UISceneHostingGraph alloc] _init];
  v1 = (void *)_MergedGlobals_1_13;
  _MergedGlobals_1_13 = (uint64_t)v0;
}

void __76___UISceneHostingGraph_observeLocalWindowGraphHostingContextID_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = v3;
    BSDispatchMain();
  }
}

uint64_t __76___UISceneHostingGraph_observeLocalWindowGraphHostingContextID_withHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

@end