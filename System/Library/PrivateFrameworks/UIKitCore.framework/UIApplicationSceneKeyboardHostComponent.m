@interface UIApplicationSceneKeyboardHostComponent
@end

@implementation UIApplicationSceneKeyboardHostComponent

uint64_t __85___UIApplicationSceneKeyboardHostComponent_setHardwareKeyboardExclusivityIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHardwareKeyboardExclusivityIdentifier:*(void *)(a1 + 32)];
}

void __83___UIApplicationSceneKeyboardHostComponent_suppressKeyboardFocusRequestsForReason___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    --WeakRetained[5];
    v2 = WeakRetained;
    [WeakRetained evaluateKeyboardSuppressionSettingForActiveAssertions];
    WeakRetained = v2;
  }
}

uint64_t __97___UIApplicationSceneKeyboardHostComponent_evaluateKeyboardSuppressionSettingForActiveAssertions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSuppressKeyboardFocusRequests:*(unsigned __int8 *)(a1 + 32)];
}

@end