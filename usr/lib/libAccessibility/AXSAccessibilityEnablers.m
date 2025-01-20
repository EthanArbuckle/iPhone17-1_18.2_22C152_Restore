@interface AXSAccessibilityEnablers
@end

@implementation AXSAccessibilityEnablers

uint64_t ___AXSAccessibilityEnablers_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_AXSAccessibilityEnablers_Enablers;
  _AXSAccessibilityEnablers_Enablers = (uint64_t)v0;

  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2011 forKey:@"_AXSAutomationEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2016 forKey:@"_AXSLocalizationCaptionMode"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2021 forKey:@"_AXSVoiceOverTouchEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2026 forKey:@"_AXSAssistiveTouchScannerEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2031 forKey:@"_AXSSpeakThisEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2036 forKey:@"_AXSSiriSemanticContextEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2041 forKey:@"_AXSClipTracerAccessibilityModeEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2046 forKey:@"_AXSNocturneAccessibilityModeEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2051 forKey:@"_AXSWordFeedbackEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2056 forKey:@"_AXSLetterFeedbackEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2061 forKey:@"_AXSPhoneticFeedbackEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2066 forKey:@"_AXSAuditInspectionModeEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2071 forKey:@"_AXSHoverTextEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2076 forKey:@"_AXSHoverTextTypingEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2082 forKey:@"_AXSZoomSpeakUnderFingerEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2087 forKey:@"_AXSCommandAndControlEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2092 forKey:@"_AXSCommandAndControlCarPlayEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2097 forKey:@"_AXSFullKeyboardAccessEnabled"];
  [(id)_AXSAccessibilityEnablers_Enablers setObject:&__block_literal_global_2102 forKey:@"_AXSWatchControlEnabled"];
  v2 = (void *)_AXSAccessibilityEnablers_Enablers;

  return [v2 setObject:&__block_literal_global_2107 forKey:@"_inUnitTestMode"];
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_2()
{
  _kAXSCacheAutomationEnabled = _getBooleanPreference((const __CFString *)kAXSAutomationEnabledPreference, 0);
  if (_AXSAutomationEnabled_onceToken != -1) {
    dispatch_once(&_AXSAutomationEnabled_onceToken, &__block_literal_global_2129);
  }
  return _kAXSCacheAutomationEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_3()
{
  if (_AXSLocalizationCaptionMode_onceToken != -1) {
    dispatch_once(&_AXSLocalizationCaptionMode_onceToken, &__block_literal_global_2131);
  }
  return _kAXSCacheLocalizationCaptionModeEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_5()
{
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
  }
  return _kAXSCacheSwitchControlEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_7()
{
  if (_AXSSiriSemanticContextEnabled_onceToken != -1) {
    dispatch_once(&_AXSSiriSemanticContextEnabled_onceToken, &__block_literal_global_2142);
  }
  return _kAXSCacheSiriSemanticContextEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_8()
{
  if (_AXSClipTracerAccessibilityModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSClipTracerAccessibilityModeEnabled_onceToken, &__block_literal_global_2181);
  }
  return _kAXSCacheClipTracerAccessibilityModeEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_9()
{
  if (_AXSNocturneAccessibilityModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSNocturneAccessibilityModeEnabled_onceToken, &__block_literal_global_2179);
  }
  return _kAXSCacheNocturneAccessibilityModeEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_11()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSLetterFeedbackEnabledPreference, 0, (uint64_t)_handleLetterFeedbackPrefsChangedNotification);
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_12()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSPhoneticFeedbackEnabledPreference, 0, (uint64_t)_handlePhoneticFeedbackPrefsChangedNotification);
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_13()
{
  if (_AXSAuditInspectionModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSAuditInspectionModeEnabled_onceToken, &__block_literal_global_2177);
  }
  return _kAXSCacheAuditInspectionModeModeEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_15()
{
  if (_AXSHoverTextTypingEnabled_onceToken != -1) {
    dispatch_once(&_AXSHoverTextTypingEnabled_onceToken, &__block_literal_global_2345);
  }
  return _kAXSCacheHoverTextTypingEnabled;
}

BOOL ___AXSAccessibilityEnablers_block_invoke_16()
{
  if (_AXSZoomSpeakUnderFingerEnabled_onceToken != -1) {
    dispatch_once(&_AXSZoomSpeakUnderFingerEnabled_onceToken, &__block_literal_global_2357);
  }
  return _kAXSCacheZoomSpeakUnderFingerEnabled && _AXSZoomTouchEnabled() != 0;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_17()
{
  if (_AXSCommandAndControlEnabled_onceToken != -1) {
    dispatch_once(&_AXSCommandAndControlEnabled_onceToken, &__block_literal_global_1876);
  }
  return _kAXSCacheCommandAndControlEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_18()
{
  if (_AXSCommandAndControlCarPlayEnabled_onceToken != -1) {
    dispatch_once(&_AXSCommandAndControlCarPlayEnabled_onceToken, &__block_literal_global_1879);
  }
  return _kAXSCacheCommandAndControlCarPlayEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_20()
{
  if (_AXSWatchControlEnabled_onceToken != -1) {
    dispatch_once(&_AXSWatchControlEnabled_onceToken, &__block_literal_global_2451);
  }
  return _kAXSCacheWatchControlEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_21()
{
  return _inUnitTestMode;
}

@end