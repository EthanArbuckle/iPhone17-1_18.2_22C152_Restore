@interface UIKeyWindowSceneObserver
@end

@implementation UIKeyWindowSceneObserver

void __61___UIKeyWindowSceneObserver_observerDeliveryPolicyDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIKeyWindowSceneObserver evaluateTargetOfEventDeferringEnvironments]((uint64_t)WeakRetained);
}

@end