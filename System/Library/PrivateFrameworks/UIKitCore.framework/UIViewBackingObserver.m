@interface UIViewBackingObserver
@end

@implementation UIViewBackingObserver

void __40___UIViewBackingObserver_sharedObserver__block_invoke()
{
  v0 = objc_alloc_init(_UIViewBackingObserver);
  v1 = (void *)_MergedGlobals_1065;
  _MergedGlobals_1065 = (uint64_t)v0;
}

uint64_t __50___UIViewBackingObserver_observe_forKeyPath_once___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) additionalObservers];
  [v2 removeObject:*(void *)(a1 + 40)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

@end