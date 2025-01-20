@interface UIApplication(UIAccessibility)
- (BOOL)_accessibilityIsAppReadyToBeProbed;
- (double)_accessibilityMaximumAllowedOutOfBoundsPercent;
- (id)accessibilityKeyboardKeyDispatchOverride;
- (id)accessibilityLastGesturedTextInputStatusChange;
- (uint64_t)setAccessibilityLastGesturedTextInputStatusChange:()UIAccessibility;
- (void)_accessibilitySetIsDictationListeningOverride:()UIAccessibility;
- (void)setAccessibilityKeyboardKeyDispatchOverride:()UIAccessibility;
@end

@implementation UIApplication(UIAccessibility)

- (id)accessibilityLastGesturedTextInputStatusChange
{
  return objc_getAssociatedObject(a1, &__UIApplication__accessibilityLastGesturedTextInputStatusChange);
}

- (uint64_t)setAccessibilityLastGesturedTextInputStatusChange:()UIAccessibility
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityKeyboardKeyDispatchOverride
{
  return objc_getAssociatedObject(a1, &__UIApplication__accessibilityKeyboardKeyDispatchOverride);
}

- (void)setAccessibilityKeyboardKeyDispatchOverride:()UIAccessibility
{
  id v3 = _Block_copy(aBlock);
  __UIAccessibilitySetAssociatedObject();
}

- (double)_accessibilityMaximumAllowedOutOfBoundsPercent
{
  if (UIAccessibilityIsWidgetExtension_onceToken != -1) {
    dispatch_once(&UIAccessibilityIsWidgetExtension_onceToken, &__block_literal_global_595);
  }
  double result = 0.5;
  if (!UIAccessibilityIsWidgetExtension_IsWidget) {
    return 1.0;
  }
  return result;
}

- (BOOL)_accessibilityIsAppReadyToBeProbed
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  char v5 = 0;
  AXPerformSafeBlock();
  if (AXProcessIsSpringBoard())
  {
    _AXLogWithFacility();
    BOOL v0 = 0;
  }
  else if (*((unsigned char *)v7 + 24))
  {
    BOOL v0 = *((unsigned char *)v3 + 24) != 0;
  }
  else
  {
    BOOL v0 = 1;
    if ((_accessibilityIsAppReadyToBeProbed_EmittedLogSpew & 1) == 0)
    {
      _AXLogWithFacility();
      _accessibilityIsAppReadyToBeProbed_EmittedLogSpew = 1;
    }
  }
  _Block_object_dispose(&v2, 8);
  _Block_object_dispose(&v6, 8);
  return v0;
}

- (void)_accessibilitySetIsDictationListeningOverride:()UIAccessibility
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19F2DB000, v5, OS_LOG_TYPE_DEFAULT, "Set dictation override: %@", (uint8_t *)&v6, 0xCu);
  }

  [a1 _accessibilitySetRetainedValue:v4 forKey:@"_accessibilityIsDictationListeningOverride"];
}

@end