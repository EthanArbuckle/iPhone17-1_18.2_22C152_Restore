@interface UISceneKeyboardProxyLayerForwardingStateMachine
@end

@implementation UISceneKeyboardProxyLayerForwardingStateMachine

id __78___UISceneKeyboardProxyLayerForwardingStateMachine_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 24);
  if (v3 > 2) {
    v4 = @"(unknown)";
  }
  else {
    v4 = off_1E52EB280[v3];
  }
  return (id)[v2 appendObject:v4 withName:@"state" skipIfNil:1];
}

void __72___UISceneKeyboardProxyLayerForwardingStateMachine__noteHostedInWindow___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _noteHostedInWindow:WeakRetained[5]];
}

@end