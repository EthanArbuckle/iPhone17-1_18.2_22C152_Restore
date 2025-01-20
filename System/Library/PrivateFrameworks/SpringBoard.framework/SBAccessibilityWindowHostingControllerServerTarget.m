@interface SBAccessibilityWindowHostingControllerServerTarget
@end

@implementation SBAccessibilityWindowHostingControllerServerTarget

void __91___SBAccessibilityWindowHostingControllerServerTarget_registerWindowWithContextID_atLevel___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained registerWindowWithContextID:a1[5] atLevel:a1[6]];
}

void __85___SBAccessibilityWindowHostingControllerServerTarget_unregisterWindowWithContextID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained unregisterWindowWithContextID:*(void *)(a1 + 40)];
}

@end