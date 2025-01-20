@interface UIHomeAffordanceObserverProxyInteraction
@end

@implementation UIHomeAffordanceObserverProxyInteraction

uint64_t __71___UIHomeAffordanceObserverProxyInteraction_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  if (v3)
  {
    v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [v4 stringWithFormat:@"<%@: %p>", v6, v3];
  }
  else
  {
    v7 = @"(nil)";
  }

  id v8 = (id)[v2 appendObject:v7 withName:@"view"];
  uint64_t result = [*(id *)(a1 + 32) hasDebugStyle];
  if ((result & 1) == 0) {
    return (uint64_t)(id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 56) != 0 withName:@"hasRegistered"];
  }
  return result;
}

id __71___UIHomeAffordanceObserverProxyInteraction_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  v4 = [WeakRetained succinctDescription];
  id v5 = (id)[v2 appendObject:v4 withName:@"homeAffordanceNotifier"];

  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"registrationToken"];
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", @"lastNotifiedHomeAffordanceFrameIntersection", *(double *)(*(void *)(a1 + 40) + 72), *(double *)(*(void *)(a1 + 40) + 80), *(double *)(*(void *)(a1 + 40) + 88), *(double *)(*(void *)(a1 + 40) + 96));
}

@end