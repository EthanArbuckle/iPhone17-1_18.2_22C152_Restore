@interface NSObject
@end

@implementation NSObject

void __63__NSObject_ConformsToProtocolCached__conformsToProtocolCached___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_MergedGlobals_1100;
  _MergedGlobals_1100 = (uint64_t)v0;
}

uint64_t __56__NSObject_UIAccessibilityAction__accessibilityActivate__block_invoke()
{
  _AXSApplicationAccessibilitySetEnabled();
  id v0 = (void *)UIApp;
  return [v0 _accessibilityInit];
}

uint64_t __89__NSObject_UIAccessibilityPrivate____accessibilityRequestGuidedAccessSession_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__NSObject_AccessibilityActivation___keyboardActivate__block_invoke(uint64_t a1)
{
  [(id)UIApp _enqueueHIDEvent:*(void *)(a1 + 32)];
  v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

@end