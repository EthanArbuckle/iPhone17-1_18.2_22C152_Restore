uint64_t _AXSAutomationEnabled()
{
  if (_AXSAutomationEnabled_onceToken != -1) {
    dispatch_once(&_AXSAutomationEnabled_onceToken, &__block_literal_global_2129);
  }
  return _kAXSCacheAutomationEnabled;
}

uint64_t _AXSAutomationPreferredLocalization()
{
  if (_AXSAutomationPreferredLocalization_onceToken != -1) {
    dispatch_once(&_AXSAutomationPreferredLocalization_onceToken, &__block_literal_global_2137);
  }
  return _AXSAutomationPreferredLocalization_loc;
}

uint64_t _AXSAutomationLocalizedStringLookupInfoEnabled()
{
  if (_AXSAutomationLocalizedStringLookupInfoEnabled_onceToken != -1) {
    dispatch_once(&_AXSAutomationLocalizedStringLookupInfoEnabled_onceToken, &__block_literal_global_2135);
  }
  return _kAXSCacheAutomationLocalizedStringLookup;
}

uint64_t _AXSPhotosensitiveMitigationEnabled()
{
  if (_AXSPhotosensitiveMitigationEnabled_onceToken != -1) {
    dispatch_once(&_AXSPhotosensitiveMitigationEnabled_onceToken, &__block_literal_global_2453);
  }
  return _kAXSCachePhotosensitiveMitigationEnabled;
}

uint64_t _AXSCommandAndControlEnabled()
{
  if (_AXSCommandAndControlEnabled_onceToken != -1) {
    dispatch_once(&_AXSCommandAndControlEnabled_onceToken, &__block_literal_global_1876);
  }
  return _kAXSCacheCommandAndControlEnabled;
}

uint64_t _AXSHighContrastFocusIndicatorsEnabled()
{
  if (_AXSHighContrastFocusIndicatorsEnabled_onceToken != -1) {
    dispatch_once(&_AXSHighContrastFocusIndicatorsEnabled_onceToken, &__block_literal_global_2371);
  }
  return _kAXSCacheHighContrastFocusIndicatorsEnabled;
}

uint64_t ___accessibilityEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.ax", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAccessibilityEnabledPreference, @"com.apple.accessibility.cache.ax");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAccessibilityEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAccessibilityEnabled = result;
  }
  return result;
}

void __cachedAppID_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)cachedAppID_CachedAppID;
  cachedAppID_CachedAppID = v0;
}

void __AXDisallowsUIBasedAccessibilityFeatures_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  if (([v1 isEqualToString:@"druid"] & 1) != 0
    || ([v1 isEqualToString:@"pointeruid"] & 1) != 0
    || ([v1 isEqualToString:@"nsattributedstringagent"] & 1) != 0
    || [v1 isEqualToString:@"IntelligentLight"])
  {
    AXDisallowsUIBasedAccessibilityFeatures_DisallowedForClient = 1;
  }
}

uint64_t _AXSGrayscaleEnabled()
{
  uint64_t v0 = +[AccessibilitySupportOverrides shared];
  id v1 = [v0 grayscale];

  if (v1)
  {
    id v2 = +[AccessibilitySupportOverrides shared];
    v3 = [v2 grayscale];
    uint64_t v4 = [v3 BOOLValue];
  }
  else
  {
    if (_AXSGrayscaleEnabled_onceToken != -1) {
      dispatch_once(&_AXSGrayscaleEnabled_onceToken, &__block_literal_global_1942);
    }
    return _kAXSCacheGrayscaleEnabled;
  }
  return v4;
}

BOOL _AXSReduceMotionReduceSlideTransitionsEnabled()
{
  return AXSGetCachedPreference((unsigned int *)&_kAXSCacheReduceMotionReduceSlideTransitions, &_AXSReduceMotionReduceSlideTransitionsEnabled_onceToken, kAXSReduceMotionReduceSlideTransitionsPreference, @"com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions", kAXSReduceMotionReduceSlideTransitionsChangedNotification) == 1;
}

void ___willGetPrefValue_block_invoke_2(uint64_t a1)
{
  if (([(id)PrefsChangedNotifications containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    [(id)PrefsChangedNotifications addObject:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40)) {
      id v2 = *(uint64_t (**)())(a1 + 40);
    }
    else {
      id v2 = _handlePrefsChangedNotification;
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v4 = *(const __CFString **)(a1 + 32);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)v2, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

id _AXSClarityBoardEnabledDirectory()
{
  uint64_t v0 = AXCPSharedResourcesDirectory();
  if (v0)
  {
    id v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:AXCPSharedResourcesDirectory()];
    id v2 = [v1 URLByAppendingPathComponent:@"Library/Accessibility" isDirectory:1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void *_AXSCopyPreferredContentSizeCategoryNameApp(const __CFString *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(id)AXCPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"])
  {
    v12 = AXSupportLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      _AXSCopyPreferredContentSizeCategoryNameApp_cold_1();
    }

    return 0;
  }
  CFStringRef v2 = a1;
  if (!a1) {
    CFStringRef v2 = (const __CFString *)[(id)AXCPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
  }
  v3 = (void *)CFPreferencesCopyAppValue(@"UIPreferredContentSizeCategoryName", v2);
  CFStringRef v4 = AXSupportLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)v16 = v2;
    *(_WORD *)&v16[8] = 2112;
    *(void *)&v16[10] = a1;
    __int16 v17 = 2112;
    v18 = v3;
    _os_log_debug_impl(&dword_190274000, v4, OS_LOG_TYPE_DEBUG, "CF Read Category Name: domain = %@, appID = %@ value = %@", buf, 0x20u);
  }

  v5 = AXSupportLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v16 = a1 != 0;
    *(_WORD *)&v16[4] = 2112;
    *(void *)&v16[6] = v3;
    _os_log_impl(&dword_190274000, v5, OS_LOG_TYPE_DEFAULT, "Read CategoryName: per-app = %d, category name = %@", buf, 0x12u);
  }

  if (a1 && !v3)
  {
    if (cachedAppID_onceToken != -1) {
      dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
    }
    if (cachedAppID_CachedAppID && CFStringCompare(a1, (CFStringRef)cachedAppID_CachedAppID, 0))
    {
      id v14 = 0;
      v6 = (void *)[objc_alloc((Class)getLSApplicationRecordClass()) initWithBundleIdentifier:a1 allowPlaceholder:0 error:&v14];
      id v7 = v14;
      if (v7)
      {
        v8 = AXSupportLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          _copyValuePreferenceApp_cold_1();
        }
      }
      v3 = [v6 dataContainerURL];

      if (v3)
      {
        v9 = [v6 dataContainerURL];
        uint64_t v10 = [v9 path];

        v3 = (void *)_CFPreferencesCopyAppValueWithContainer();
        v11 = AXSupportLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v16 = v10;
          *(_WORD *)&v16[8] = 2112;
          *(void *)&v16[10] = a1;
          __int16 v17 = 2112;
          v18 = v3;
          _os_log_debug_impl(&dword_190274000, v11, OS_LOG_TYPE_DEBUG, "CF Read Category Name from Container: domain = %@, appID = %@, category name = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x20u);
        }
      }
      return v3;
    }
    return 0;
  }
  return v3;
}

const void *AXCPSharedResourcesDirectory()
{
  pthread_mutex_lock(&AXCPSharedResourcesDirectory_lock);
  uid_t v0 = geteuid();
  if (!v0) {
    uid_t v0 = getuid();
  }
  if (AXCPSharedResourcesDirectory_pathDictionary)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)AXCPSharedResourcesDirectory_pathDictionary, (const void *)v0);
    if (Value) {
      goto LABEL_13;
    }
  }
  else
  {
    AXCPSharedResourcesDirectory_pathDictionary = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  }
  pw_dir = getenv("IPHONE_SHARED_RESOURCES_DIRECTORY");
  if (pw_dir || (v3 = getpwuid(v0)) != 0 && (pw_dir = v3->pw_dir) != 0)
  {
    Value = CFStringCreateWithFileSystemRepresentation(0, pw_dir);
    if (Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)AXCPSharedResourcesDirectory_pathDictionary, (const void *)v0, Value);
      CFRelease(Value);
    }
  }
  else
  {
    Value = 0;
  }
LABEL_13:
  pthread_mutex_unlock(&AXCPSharedResourcesDirectory_lock);
  return Value;
}

BOOL _AXSIncreaseButtonLegibility()
{
  uid_t v0 = +[AccessibilitySupportOverrides shared];
  id v1 = [v0 onOffLabels];

  if (!v1) {
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheIncreaseButtonLegibility, &_AXSIncreaseButtonLegibility_onceToken, kAXSIncreaseButtonLegibilityPreference, @"com.apple.accessibility.cache.increase.button.legibility", (uint64_t)kAXSIncreaseButtonLegibilityNotification) == 1;
  }
  CFStringRef v2 = +[AccessibilitySupportOverrides shared];
  v3 = [v2 onOffLabels];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

BOOL _AXSDifferentiateWithoutColorEnabled()
{
  uid_t v0 = +[AccessibilitySupportOverrides shared];
  id v1 = [v0 differentiateWithoutColor];

  if (!v1) {
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheDifferentiateWithoutColor, &_AXSDifferentiateWithoutColorEnabled_onceToken, kAXSDifferentiateWithoutColorPreference, @"com.apple.accessibility.cache.differentiate.without.color", (uint64_t)kAXSDifferentiateWithoutColorChangedNotification) == 1;
  }
  CFStringRef v2 = +[AccessibilitySupportOverrides shared];
  v3 = [v2 differentiateWithoutColor];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

void _AXSApplicationAccessibilitySetEnabled(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v6 = 67109378;
    int v7 = a1;
    __int16 v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Application accessibility enabled: %d, %@", (uint8_t *)&v6, 0x12u);
  }
  pthread_mutex_lock(&_AXSAccessibilityEnabledLock);
  _kAXSCacheApplicationAccessibilityEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSApplicationAccessibilityEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);
  uint64_t v4 = AXSupportLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 67109120;
    int v7 = a1;
    _os_log_impl(&dword_190274000, v4, OS_LOG_TYPE_DEFAULT, "Stored App AX setting: %d", (uint8_t *)&v6, 8u);
  }

  pthread_mutex_unlock(&_AXSAccessibilityEnabledLock);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.cache.app.ax", 0, 0, 1u);
  _updateAccessibilitySettings();
}

void _updateAccessibilitySettings()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v0 = _AXSApplicationAccessibilityEnabled();
  if (_AXSZoomTouchEnabled()
    || _AXSVoiceOverTouchEnabled()
    || _AXSGuidedAccessRequiresApplicationAccessibility()
    || _AXSQuickSpeakEnabled())
  {
    goto LABEL_49;
  }
  if (_AXSAssistiveTouchEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1810);
  }
  if (_kAXSAssistiveTouchEnabledCache) {
    goto LABEL_49;
  }
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
  }
  if (_kAXSCacheSwitchControlEnabled) {
    goto LABEL_49;
  }
  if (_AXSHearingAidsPaired_onceToken != -1) {
    dispatch_once(&_AXSHearingAidsPaired_onceToken, &__block_literal_global_1979);
  }
  if (_kAXSCacheHearingAidPaired || _AXSSpeakThisEnabled() || _AXSDefaultRouteForCall()) {
    goto LABEL_49;
  }
  if (_AXSLocalizationCaptionMode_onceToken != -1) {
    dispatch_once(&_AXSLocalizationCaptionMode_onceToken, &__block_literal_global_2131);
  }
  if (_kAXSCacheLocalizationCaptionModeEnabled
    || _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSLetterFeedbackEnabledPreference, 0, (uint64_t)_handleLetterFeedbackPrefsChangedNotification)|| _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSPhoneticFeedbackEnabledPreference, 0, (uint64_t)_handlePhoneticFeedbackPrefsChangedNotification)|| _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSQuickTypePredictionFeedbackEnabledPreference, 0, (uint64_t)_handleQuickTypePredictionFeedbackPrefsChangedNotification)|| _AXSWordFeedbackEnabled())
  {
    goto LABEL_49;
  }
  if (_AXSClipTracerAccessibilityModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSClipTracerAccessibilityModeEnabled_onceToken, &__block_literal_global_2181);
  }
  if (_kAXSCacheClipTracerAccessibilityModeEnabled) {
    goto LABEL_49;
  }
  if (_AXSNocturneAccessibilityModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSNocturneAccessibilityModeEnabled_onceToken, &__block_literal_global_2179);
  }
  if (_kAXSCacheNocturneAccessibilityModeEnabled) {
    goto LABEL_49;
  }
  if (_AXSAuditInspectionModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSAuditInspectionModeEnabled_onceToken, &__block_literal_global_2177);
  }
  if (_kAXSCacheAuditInspectionModeModeEnabled) {
    goto LABEL_49;
  }
  if (_AXSCommandAndControlEnabled_onceToken != -1) {
    dispatch_once(&_AXSCommandAndControlEnabled_onceToken, &__block_literal_global_1876);
  }
  if (_kAXSCacheCommandAndControlEnabled) {
    goto LABEL_49;
  }
  if (_AXSCommandAndControlCarPlayEnabled_onceToken != -1) {
    dispatch_once(&_AXSCommandAndControlCarPlayEnabled_onceToken, &__block_literal_global_1879);
  }
  if (_kAXSCacheCommandAndControlCarPlayEnabled) {
    goto LABEL_49;
  }
  if (_AXSAutomationEnabled_onceToken != -1) {
    dispatch_once(&_AXSAutomationEnabled_onceToken, &__block_literal_global_2129);
  }
  if (_kAXSCacheAutomationEnabled || _AXSFullKeyboardAccessEnabled()) {
    goto LABEL_49;
  }
  if (_AXSWatchControlEnabled_onceToken != -1) {
    dispatch_once(&_AXSWatchControlEnabled_onceToken, &__block_literal_global_2451);
  }
  if (_kAXSCacheWatchControlEnabled || _AXSHoverTextEnabled()) {
    goto LABEL_49;
  }
  if (_AXSHoverTextTypingEnabled_onceToken != -1) {
    dispatch_once(&_AXSHoverTextTypingEnabled_onceToken, &__block_literal_global_2345);
  }
  if (_kAXSCacheHoverTextTypingEnabled) {
    goto LABEL_49;
  }
  if (_AXSProcessIsSpringBoard_onceToken != -1) {
    dispatch_once(&_AXSProcessIsSpringBoard_onceToken, &__block_literal_global_2526);
  }
  if (_AXSProcessIsSpringBoard__AXSProcessIsSpringBoard == 1 && _AXSBackgroundSoundsEnabled())
  {
LABEL_49:
    BOOL v1 = 1;
  }
  else
  {
    _AXSInvertColorsEnabled();
    BOOL v1 = _kAXSCacheInvertColorsGlobal == 1;
  }
  int v2 = v1 | v0;
  if (!(v1 | v0))
  {
    v3 = _AXSTripleClickCopyOptions();
    if (_AXSTripleClickContainsOption((BOOL)v3, 5) || _AXSTripleClickContainsOption((BOOL)v3, 8))
    {
      int v2 = 1;
      if (!v3) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
    int v2 = 0;
    if (v3) {
LABEL_54:
    }
      CFRelease(v3);
  }
LABEL_55:
  uint64_t v4 = AXSupportLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109632;
    v9[1] = v0;
    __int16 v10 = 1024;
    int v11 = v2;
    __int16 v12 = 1024;
    int v13 = _kAXSCacheAccessibilityEnabled;
    _os_log_impl(&dword_190274000, v4, OS_LOG_TYPE_DEFAULT, "AXS AccessibilityEnabled: (app ax: %d), ax settings: %d, cached: %d", (uint8_t *)v9, 0x14u);
  }

  if (_kAXSCacheAccessibilityEnabled != v2)
  {
    v5 = AXSupportLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      _updateAccessibilitySettings_cold_2();
    }

    _kAXSCacheAccessibilityEnabled = v2;
    int v6 = (const void **)MEMORY[0x1E4F1CFC8];
    if (v2) {
      int v6 = (const void **)MEMORY[0x1E4F1CFD0];
    }
    _setPreferenceAppWithNotification((const __CFString *)kAXSAccessibilityEnabledPreference, 0, *v6, 0);
  }
  int v7 = AXSupportLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    _updateAccessibilitySettings_cold_1(v7);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.cache.ax", 0, 0, 1u);
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  if (_AXSFullKeyboardAccessEnabled_onceToken != -1) {
    dispatch_once(&_AXSFullKeyboardAccessEnabled_onceToken, &__block_literal_global_1881);
  }
  return _kAXSCacheFullKeyboardAccessEnabled;
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  if (_AXSProcessIsSiri_onceToken != -1) {
    dispatch_once(&_AXSProcessIsSiri_onceToken, &__block_literal_global_2836);
  }
  if (_AXSProcessIsSiri__AXSProcessIsSiri == 1)
  {
    if (_AXSClarityBoardEnabled_onceToken != -1) {
      dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
    }
    if (_AXSClarityBoardEnabled_isEnabled) {
      return 1;
    }
  }
  if (AXDisallowsUIBasedAccessibilityFeatures_onceToken != -1) {
    dispatch_once(&AXDisallowsUIBasedAccessibilityFeatures_onceToken, &__block_literal_global_2477);
  }
  if (AXDisallowsUIBasedAccessibilityFeatures_DisallowedForClient) {
    return 0;
  }
  _AXSAccessibilityEnabled();
  if (_AXSApplicationAccessibilityEnabled_onceToken != -1) {
    dispatch_once(&_AXSApplicationAccessibilityEnabled_onceToken, &__block_literal_global_1842);
  }
  return _kAXSCacheApplicationAccessibilityEnabled;
}

uint64_t _AXSHoverTextEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  if (_AXSHoverTextEnabled_onceToken != -1) {
    dispatch_once(&_AXSHoverTextEnabled_onceToken, &__block_literal_global_2343);
  }
  return _kAXSCacheHoverTextEnabled;
}

uint64_t _AXSZoomTouchEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  if (_AXSZoomTouchEnabled_onceToken != -1) {
    dispatch_once(&_AXSZoomTouchEnabled_onceToken, &__block_literal_global_2361);
  }
  return _kAXSCacheZoomTouchEnabled;
}

uint64_t _AXSSpeakThisEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1) {
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_2002);
  }
  if (_kAXSCacheSpeechSettingsDisabledByManagedConfiguration) {
    return 0;
  }
  if (_AXSSpeakThisEnabled_onceToken != -1) {
    dispatch_once(&_AXSSpeakThisEnabled_onceToken, &__block_literal_global_2125);
  }
  return _kAXSCacheSpeakThisEnabled;
}

BOOL _AXSReduceMotionAutoplayVideoPreviewsEnabled()
{
  int v0 = AXSGetCachedPreference(&_kAXSCacheReduceMotionAutoplayVideoPreviews, &_AXSReduceMotionAutoplayVideoPreviewsEnabled_onceToken, kAXSReduceMotionAutoplayVideoPreviewsPreference, @"com.apple.accessibility.cache.reduce.motion.autoplay.video.previews", kAXSReduceMotionAutoplayVideoPreviewsChangedNotification);
  if (_AXSVoiceOverTouchEnabled()) {
    return v0 == 1;
  }
  else {
    return v0 != 0;
  }
}

BOOL _AXSVoiceOverTouchEnabled()
{
  if (VoiceOverTemporaryOverride)
  {
    if (cachedAppID_onceToken != -1) {
      dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
    }
    if (cachedAppID_CachedAppID
      && ([(id)cachedAppID_CachedAppID hasPrefix:@"com.apple."] & 1) == 0)
    {
      return VoiceOverTemporaryOverride == 1;
    }
  }
  if (_initializeVoiceOverCacheListener_onceToken != -1) {
    dispatch_once(&_initializeVoiceOverCacheListener_onceToken, &__block_literal_global_2969);
  }
  return _kAXSCacheVoiceOverTouchEnabled != 0;
}

uint64_t _getPrefBooleanValueWithCustomCallback(__CFString *a1, int a2, uint64_t a3)
{
  uint64_t v4 = _copyPrefValueWithCustomCallback(a1, a3);
  uint64_t v5 = a2 != 0;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = [v4 BOOLValue];
    }
  }

  return v5;
}

void *_copyPrefValueWithCustomCallback(__CFString *a1, uint64_t a2)
{
  if (_willGetPrefValue_onceToken != -1) {
    dispatch_once(&_willGetPrefValue_onceToken, &__block_literal_global_2815);
  }
  uint64_t v4 = [(__CFString *)a1 stringByAppendingString:@".notification"];
  uint64_t v5 = PrefsChangedNotificationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___willGetPrefValue_block_invoke_2;
  v8[3] = &unk_1E568C120;
  id v9 = v4;
  uint64_t v10 = a2;
  id v6 = v4;
  dispatch_sync(v5, v8);

  return _copyValuePreferenceApp(a1, 0, 0);
}

void __AXSGetCachedSmartInvert_block_invoke_2()
{
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  uint64_t v0 = cachedAppID_CachedAppID;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.invert.colors", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (v0)
  {
    CFStringRef v2 = (const __CFString *)[@"com.apple.accessibility.cache.invert.colors" stringByAppendingString:v0];
    v3 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v3, 0, (CFNotificationCallback)_axsHandlePrefChangedApp, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

void __AXSGetCachedPreference_block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, *(CFStringRef *)(a1 + 32), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (*(void *)(a1 + 40))
    {
      v3 = *(void **)(a1 + 32);
      if (v3) {
        CFStringRef v4 = (const __CFString *)[v3 stringByAppendingString:x0];
      }
      else {
        CFStringRef v4 = 0;
      }
      uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v5, 0, (CFNotificationCallback)_axsHandlePrefChangedApp, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
}

BOOL _AXSTripleClickContainsOption(BOOL a1, int a2)
{
  BOOL v2 = a1;
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    v6.length = CFArrayGetCount((CFArrayRef)v2);
    v6.location = 0;
    BOOL v2 = CFArrayContainsValue((CFArrayRef)v2, v6, v3) != 0;
    CFRelease(v3);
  }
  return v2;
}

uint64_t _AXSQuickSpeakEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1) {
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_2002);
  }
  if (_kAXSCacheSpeechSettingsDisabledByManagedConfiguration) {
    return 0;
  }
  if (_AXSQuickSpeakEnabled_onceToken != -1) {
    dispatch_once(&_AXSQuickSpeakEnabled_onceToken, &__block_literal_global_2004);
  }
  return _kAXSCacheQuickSpeakEnabled;
}

void _updateAccessibilitySettings_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = _kAXSCacheAccessibilityEnabled;
  _os_log_debug_impl(&dword_190274000, log, OS_LOG_TYPE_DEBUG, "Update, AX Enabled: %d", (uint8_t *)v1, 8u);
}

void _setPreferenceAppWithNotification(const __CFString *a1, __CFString *a2, const void *a3, const __CFString *a4)
{
  v33[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    __int16 v8 = getenv("__AX_UNIT_TEST_SETTER");
    if (v8 && !strcmp(v8, "TRUE")) {
      goto LABEL_13;
    }
    if (!CFEqual(a1, (CFTypeRef)kAXSRosebudLoggingEnabledPreference)
      && !CFEqual(a1, (CFTypeRef)kAXSSpeechSynthesisOptionsPreference))
    {
      goto LABEL_48;
    }
    id v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    id v9 = (uint64_t (*)(uint64_t))getAXProcessIsBackboardSymbolLoc_ptr;
    v30 = getAXProcessIsBackboardSymbolLoc_ptr;
    if (!getAXProcessIsBackboardSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAXProcessIsBackboardSymbolLoc_block_invoke;
      v32 = (__CFString *)&unk_1E568C0A0;
      v33[0] = &v27;
      uint64_t v10 = (void *)AccessibilityUtilitiesLibrary();
      int v11 = dlsym(v10, "AXProcessIsBackboard");
      *(void *)(*(void *)(v33[0] + 8) + 24) = v11;
      getAXProcessIsBackboardSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(v33[0] + 8) + 24);
      id v9 = (uint64_t (*)(uint64_t))v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (!v9) {
      _setPreferenceAppWithNotification_cold_4();
    }
    if ((v9(v12) & 1) == 0)
    {
LABEL_13:
      geteuid();
    }
    else
    {
LABEL_48:
      if (geteuid())
      {
        if (CFEqual(a1, (CFTypeRef)kAXSAccessibilityNeedsMicrophoneOnLockScreenPreference))
        {
          CFPreferencesSetAppValue(a1, a3, (CFStringRef)kAXSAssistiveTouchPreferenceDomain);
LABEL_23:
          if (a4)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, a4, 0, 0, 1u);
          }
          return;
        }
        if (a2) {
          CFStringRef v17 = a2;
        }
        else {
          CFStringRef v17 = (const __CFString *)kAXSAccessibilityPreferenceDomain;
        }
        if (a2)
        {
          id v18 = objc_alloc((Class)getLSApplicationRecordClass());
          id v27 = 0;
          uint64_t v19 = (void *)[v18 initWithBundleIdentifier:a2 allowPlaceholder:0 error:&v27];
          id v20 = v27;
          if (v20)
          {
            v21 = AXSupportLogCommon();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              _copyValuePreferenceApp_cold_1();
            }
          }
          v22 = [v19 dataContainerURL];
          uint64_t v23 = [v22 path];

          if (v23)
          {
            if (([(__CFString *)a2 hasPrefix:@"com.apple."] & 1) == 0)
            {
LABEL_42:
              _CFPreferencesSetValueWithContainer();
              v26 = AXSupportLogCommon();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v23;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = a1;
                *(_WORD *)&buf[22] = 2112;
                v32 = a2;
                LOWORD(v33[0]) = 2112;
                *(void *)((char *)v33 + 2) = a3;
                _os_log_debug_impl(&dword_190274000, v26, OS_LOG_TYPE_DEBUG, "CF Save to Container: domain = %@, preference = %@, appID = %@, value = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x2Au);
              }

              goto LABEL_23;
            }
            char v24 = 0;
LABEL_39:
            CFPreferencesSetValue(a1, a3, v17, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
            v25 = AXSupportLogCommon();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v17;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a1;
              *(_WORD *)&buf[22] = 2112;
              v32 = a2;
              LOWORD(v33[0]) = 2112;
              *(void *)((char *)v33 + 2) = a3;
              _os_log_debug_impl(&dword_190274000, v25, OS_LOG_TYPE_DEBUG, "CF Save: domain = %@, preference = %@, appID = %@, value = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x2Au);
            }

            if (v24) {
              goto LABEL_23;
            }
            goto LABEL_42;
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        char v24 = 1;
        goto LABEL_39;
      }
    }
    if (!a2)
    {
      uint64_t v14 = AXUtilsBackBoardServer();
      if (objc_opt_respondsToSelector())
      {
        v15 = AXSupportLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          _setPreferenceAppWithNotification_cold_1();
        }

        [v14 setAccessibilityPreferenceAsMobile:a1 value:a3 notification:a4];
      }

      goto LABEL_23;
    }
    int v13 = AXSupportLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      _setPreferenceAppWithNotification_cold_2();
    }
  }
}

void sub_190277564(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long buf)
{
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(a1);
    uint64_t v14 = AXSupportLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_190274000, v14, OS_LOG_TYPE_DEFAULT, "Error setting mobile pref: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1902772FCLL);
  }
  _Unwind_Resume(a1);
}

uint64_t _AXSWordFeedbackEnabled()
{
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1) {
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_2002);
  }
  if (_kAXSCacheSpeechSettingsDisabledByManagedConfiguration) {
    return 0;
  }
  BOOL v1 = (__CFString *)kAXSWordFeedbackEnabledPreference;

  return _getPrefBooleanValueWithCustomCallback(v1, 0, (uint64_t)_handleWordFeedbackPrefsChangedNotification);
}

__CFArray *_AXSTripleClickCopyOptions()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFNumberRef v0 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSTripleClickPreference, 0, 0);
  if (v0)
  {
    CFNumberRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue(v1, kCFNumberIntType, &valuePtr);
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      uint64_t v5 = Mutable;
      if (valuePtr)
      {
        if (valuePtr == 3)
        {
          for (uint64_t i = 0; i != 3; ++i)
          {
            int v19 = dword_1902A1ACC[i];
            CFNumberRef v7 = CFNumberCreate(v3, kCFNumberIntType, &v19);
            CFArrayAppendValue(v5, v7);
            CFRelease(v7);
          }
        }
        else
        {
          CFArrayAppendValue(Mutable, v1);
        }
      }
      _AXSSetTripleClickOptions(v5);
    }
    else
    {
      CFTypeID v8 = CFGetTypeID(v1);
      if (v8 == CFArrayGetTypeID()) {
        uint64_t v5 = (__CFArray *)CFRetain(v1);
      }
      else {
        uint64_t v5 = 0;
      }
    }
    CFRelease(v1);
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (_AXSGuidedAccessEnabled())
  {
    if (_AXSTripleClickContainsOption((BOOL)v5, 7))
    {
      id v9 = AXSupportLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [NSNumber numberWithUnsignedInt:7];
        int valuePtr = 138412290;
        v21 = v10;
        _os_log_impl(&dword_190274000, v9, OS_LOG_TYPE_DEFAULT, "Found GA (%@) in list of triple click options from preferences. Removing it from preferences, as it should be returned dynamically.", (uint8_t *)&valuePtr, 0xCu);
      }
      _AXSSetTripleClickOptions(v5);
      if (v5) {
        CFRetain(v5);
      }
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v12 = [NSNumber numberWithUnsignedInt:7];
      [v11 addObject:v12];

      if (v5)
      {
        [v11 addObjectsFromArray:v5];
        CFRelease(v5);
      }
      uint64_t v5 = (__CFArray *)CFRetain(v11);
    }
  }
  if ((_os_feature_enabled_impl() & 1) == 0 && _AXSTripleClickContainsOption((BOOL)v5, 27))
  {
    id v13 = (void *)[(__CFArray *)v5 mutableCopy];

    [v13 removeObject:&unk_1EDFC03B0];
    uint64_t v5 = (__CFArray *)v13;
  }
  if ((_os_feature_enabled_impl() & 1) == 0 && _AXSTripleClickContainsOption((BOOL)v5, 28))
  {
    uint64_t v14 = (void *)[(__CFArray *)v5 mutableCopy];

    [v14 removeObject:&unk_1EDFC03C8];
    uint64_t v5 = (__CFArray *)v14;
  }
  if ((_os_feature_enabled_impl() & 1) == 0 && _AXSTripleClickContainsOption((BOOL)v5, 31))
  {
    v15 = (void *)[(__CFArray *)v5 mutableCopy];

    [v15 removeObject:&unk_1EDFC03E0];
    uint64_t v5 = (__CFArray *)v15;
  }
  if (!AXRuntimeCheck_SupportsLiveCaptions() && _AXSTripleClickContainsOption((BOOL)v5, 29))
  {
    v16 = (void *)[(__CFArray *)v5 mutableCopy];

    [v16 removeObject:&unk_1EDFC03F8];
    uint64_t v5 = (__CFArray *)v16;
  }
  if ((AXRuntimeCheck_SupportsOnDeviceEyeTracking() & 1) == 0 && _AXSTripleClickContainsOption((BOOL)v5, 42))
  {
    CFStringRef v17 = (void *)[(__CFArray *)v5 mutableCopy];

    [v17 removeObject:&unk_1EDFC0410];
    return (__CFArray *)v17;
  }
  return v5;
}

uint64_t _AXSGuidedAccessEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  if (_AXSGuidedAccessEnabled_onceToken != -1) {
    dispatch_once(&_AXSGuidedAccessEnabled_onceToken, &__block_literal_global_1897);
  }
  return _kAXSCacheGuidedAccessEnabled;
}

BOOL _AXSGuidedAccessRequiresApplicationAccessibility()
{
  if (_AXSGuidedAccessEnabledByManagedConfiguration_onceToken != -1) {
    dispatch_once(&_AXSGuidedAccessEnabledByManagedConfiguration_onceToken, &__block_literal_global_1905);
  }
  return _kAXSCacheGuidedAccessEnabledByManagedConfiguration || _AXSGuidedAccessEnabled() != 0;
}

uint64_t _AXSDefaultRouteForCall()
{
  if ((_AXSDefaultRouteForCall_didRegister & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_defaultRouteChangeCallback, (CFStringRef)kAXSDefaultRouteChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    _defaultRouteChangeCallback();
    _AXSDefaultRouteForCall_didRegister = 1;
  }
  return _kAXSCachedDefaultRouteForCall;
}

void _defaultRouteChangeCallback()
{
  CFNumberRef v0 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSDefaultRouteForCallPreference, 0, 0);
  if (v0)
  {
    CFNumberRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFNumberGetTypeID()) {
      CFNumberGetValue(v1, kCFNumberIntType, &_kAXSCachedDefaultRouteForCall);
    }
    else {
      _kAXSCachedDefaultRouteForCall = 0;
    }
    CFRelease(v1);
  }
  else
  {
    _kAXSCachedDefaultRouteForCall = 0;
  }
}

uint64_t AXRuntimeCheck_SupportsOnDeviceEyeTracking()
{
  if (AXRuntimeCheck_isANEDeviceH13plus_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_isANEDeviceH13plus_onceToken, &__block_literal_global_2);
  }
  if (!AXRuntimeCheck_isANEDeviceH13plus_isANEH13plus) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

BOOL AXRuntimeCheck_SupportsLiveCaptions()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    CFNumberRef v0 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
    if ([v0 isEqualToString:@"en"])
    {
      if (AXRuntimeCheck_HasANE_onceToken != -1) {
        dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_3);
      }
      BOOL v1 = AXRuntimeCheck_HasANE__hasANE != 0;
    }
    else
    {
      BOOL v1 = 0;
    }
  }
  else
  {
    BOOL v1 = 0;
  }
  CFTypeID v2 = AXLogLiveTranscription();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFAllocatorRef v3 = [NSNumber numberWithBool:v1];
    CFStringRef v4 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
    uint64_t v5 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
    CFRange v6 = NSNumber;
    if (AXRuntimeCheck_HasANE_onceToken != -1) {
      dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_3);
    }
    CFNumberRef v7 = [v6 numberWithBool:AXRuntimeCheck_HasANE__hasANE];
    int v9 = 138413058;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Live captions supported: %@ [%@,%@,%@]", (uint8_t *)&v9, 0x2Au);
  }
  return v1;
}

id AXLogLiveTranscription()
{
  if (AXLogLiveTranscription_onceToken != -1) {
    dispatch_once(&AXLogLiveTranscription_onceToken, &__block_literal_global_475);
  }
  CFNumberRef v0 = (void *)AXLogLiveTranscription___logObj;

  return v0;
}

uint64_t _AXSUseSingleSystemColor()
{
  if (_AXSUseSingleSystemColor_onceToken != -1) {
    dispatch_once(&_AXSUseSingleSystemColor_onceToken, &__block_literal_global_2373);
  }
  return _kAXSCacheUseSingleSystemColor;
}

BOOL _AXSButtonShapesEnabled()
{
  CFNumberRef v0 = +[AccessibilitySupportOverrides shared];
  BOOL v1 = [v0 buttonShapes];

  if (!v1) {
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheButtonShapes, &_AXSButtonShapesEnabled_onceToken, kAXSButtonShapesEnabledPreference, @"com.apple.accessibility.cache.button.shapes.enabled", (uint64_t)kAXSButtonShapesEnabledNotification) == 1;
  }
  CFTypeID v2 = +[AccessibilitySupportOverrides shared];
  CFAllocatorRef v3 = [v2 buttonShapes];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

void __AXSGetCachedPreference_block_invoke_3(uint64_t a1)
{
  CFNumberRef NumberPreference = (const __CFNumber *)_getNumberPreference(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  int valuePtr = -1;
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    if (valuePtr != -1)
    {
      CFAllocatorRef v3 = *(int **)(a1 + 48);
      if (valuePtr != *v3)
      {
        int *v3 = valuePtr;
        if (*(void *)(a1 + 56))
        {
          uint64_t v4 = AXSupportLogCommon();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
            __AXSGetCachedPreference_block_invoke_3_cold_1();
          }

          LocalCenter = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(LocalCenter, *(CFNotificationName *)(a1 + 56), 0, 0, 1u);
        }
      }
    }
  }
}

void __AXSGetCachedSmartInvert_block_invoke()
{
  CFNumberRef v0 = preferencesQueue();
  dispatch_async(v0, &__block_literal_global_1720);

  CFNumberRef NumberPreference = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSInvertColorsEnabledPreference, 0);
  int valuePtr = -1;
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    _kAXSCacheInvertColorsGlobal = valuePtr;
    _kAXSCacheInvertColors = valuePtr;
    CFTypeID v2 = AXSupportLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __AXSGetCachedSmartInvert_block_invoke_cold_2();
    }

    CFAllocatorRef v3 = AXSupportLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_3();
    }
  }
  else
  {
    if (MADisplayFilterPrefGetCategoryEnabled()) {
      BOOL v4 = MADisplayFilterPrefGetType() == 512;
    }
    else {
      BOOL v4 = 0;
    }
    _kAXSCacheInvertColorsGlobal = v4;
    _kAXSCacheInvertColors = v4;
    if (_kAXSWriteableClient) {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_2917);
    }
  }
  AXSInitializeAsynchronouslyPerAppSmartInvert();
}

void __AXSGetCachedPreference_block_invoke(uint64_t a1)
{
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  uint64_t v2 = cachedAppID_CachedAppID;
  CFAllocatorRef v3 = preferencesQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AXSGetCachedPreference_block_invoke_2;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  block[5] = v2;
  dispatch_async(v3, block);

  CFNumberRef NumberPreference = (const __CFNumber *)_getNumberPreference(*(const __CFString **)(a1 + 40), 0);
  int valuePtr = -1;
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    **(_DWORD **)(a1 + 48) = valuePtr;
  }
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __AXSGetCachedPreference_block_invoke_3;
  v6[3] = &__block_descriptor_64_e5_v8__0l;
  v6[4] = *(void *)(a1 + 40);
  v6[5] = v2;
  long long v7 = *(_OWORD *)(a1 + 48);
  dispatch_after(v5, MEMORY[0x1E4F14428], v6);
}

id preferencesQueue()
{
  if (preferencesQueue_onceToken != -1) {
    dispatch_once(&preferencesQueue_onceToken, &__block_literal_global_2515);
  }
  CFNumberRef v0 = (void *)preferencesQueue_PreferencesQueue;

  return v0;
}

uint64_t _getBooleanPreference(const __CFString *a1, char *a2)
{
  BOOL v4 = (void *)MEMORY[0x192FCB1D0]();
  dispatch_time_t v5 = _copyValuePreferenceApp(a1, 0, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 BOOLValue];
    char v7 = 1;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  CFTypeID v8 = _AXBooleanPreferencesWithNonZeroDefaultValues();
  uint64_t v6 = [v8 containsObject:a1];

  char v7 = 0;
  if (a2) {
LABEL_5:
  }
    *a2 = v7;
LABEL_6:

  return v6;
}

id _getNumberPreference(const __CFString *a1, const __CFString *a2)
{
  BOOL v4 = (void *)MEMORY[0x192FCB1D0]();
  dispatch_time_t v5 = _copyValuePreferenceApp(a1, a2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    char v7 = _AXNumberPreferencesWithNonZeroDefaultValues();
    id v6 = [v7 objectForKeyedSubscript:a1];
  }
  return v6;
}

void *_copyValuePreferenceApp(const __CFString *cf1, const __CFString *a2, unsigned char *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 1;
  }
  if (a2) {
    uint64_t v6 = (uint64_t)a2;
  }
  else {
    uint64_t v6 = kAXSAccessibilityPreferenceDomain;
  }
  if (CFEqual(cf1, (CFTypeRef)kAXSEnabledSoundDetectionStatePreference)) {
    uint64_t v6 = kAXSSoundDetectionPreferenceDomain;
  }
  if (CFEqual(cf1, (CFTypeRef)kAXSAccessibilityNeedsMicrophoneOnLockScreenPreference)) {
    CFStringRef v7 = (const __CFString *)kAXSAssistiveTouchPreferenceDomain;
  }
  else {
    CFStringRef v7 = (const __CFString *)v6;
  }
  if (!geteuid())
  {
    v16 = AXUtilsBackBoardServer();
    [v16 setPreferenceRetrievalRequiresValidConnection:0];
    uint64_t v17 = [v16 accessibilityPreferenceAsMobile:cf1 domain:v7];
    if (v17)
    {
      CFTypeID v8 = (void *)v17;

      return v8;
    }
    CFTypeID v8 = (void *)CFPreferencesCopyValue(cf1, v7, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);

    if (v8) {
      return v8;
    }
  }
  CFTypeID v8 = (void *)CFPreferencesCopyAppValue(cf1, v7);
  int v9 = AXSupportLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = (uint64_t)v7;
    __int16 v22 = 2112;
    CFStringRef v23 = cf1;
    __int16 v24 = 2112;
    CFStringRef v25 = a2;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_debug_impl(&dword_190274000, v9, OS_LOG_TYPE_DEBUG, "CF Read: domain = %@, preference = %@, appID = %@ uint64_t result = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x2Au);
  }

  if (a2 && !v8)
  {
    if (cachedAppID_onceToken != -1) {
      dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
    }
    if (!cachedAppID_CachedAppID || CFEqual(a2, (CFStringRef)cachedAppID_CachedAppID)) {
      goto LABEL_33;
    }
    id v19 = 0;
    uint64_t v10 = (void *)[objc_alloc((Class)getLSApplicationRecordClass()) initWithBundleIdentifier:a2 allowPlaceholder:0 error:&v19];
    id v11 = v19;
    if (v11)
    {
      uint64_t v12 = AXSupportLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        _copyValuePreferenceApp_cold_1();
      }
    }
    CFTypeID v8 = [v10 dataContainerURL];

    if (v8)
    {
      __int16 v13 = [v10 dataContainerURL];
      uint64_t v14 = [v13 path];

      CFTypeID v8 = (void *)_CFPreferencesCopyValueWithContainer();
      __int16 v15 = AXSupportLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        uint64_t v21 = v14;
        __int16 v22 = 2112;
        CFStringRef v23 = cf1;
        __int16 v24 = 2112;
        CFStringRef v25 = a2;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_debug_impl(&dword_190274000, v15, OS_LOG_TYPE_DEBUG, "CF Read from Container: domain = %@, preference = %@, appID = %@, value = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x2Au);
      }
    }
  }
  if (v8) {
    return v8;
  }
LABEL_33:
  if (a2)
  {
    CFTypeID v8 = 0;
    if (!a3) {
      return v8;
    }
    goto LABEL_41;
  }
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1731);
  }
  CFTypeID v8 = (void *)CFPreferencesCopyValue(cf1, (CFStringRef)_AXSAccessibilityPreferenceDomain_Domain, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (a3)
  {
LABEL_41:
    if (!v8) {
      *a3 = 0;
    }
  }
  return v8;
}

id AXSupportLogCommon()
{
  if (AXSupportLogCommon_onceToken != -1) {
    dispatch_once(&AXSupportLogCommon_onceToken, &__block_literal_global_4);
  }
  CFNumberRef v0 = (void *)AXSupportLogCommon___logObj;

  return v0;
}

id _AXNumberPreferencesWithNonZeroDefaultValues()
{
  if (_AXNumberPreferencesWithNonZeroDefaultValues_onceToken != -1) {
    dispatch_once(&_AXNumberPreferencesWithNonZeroDefaultValues_onceToken, &__block_literal_global_1736);
  }
  CFNumberRef v0 = (void *)_AXNumberPreferencesWithNonZeroDefaultValues_NumberPreferencesWithNonZeroDefaultValues;

  return v0;
}

id _AXBooleanPreferencesWithNonZeroDefaultValues()
{
  if (_AXBooleanPreferencesWithNonZeroDefaultValues_onceToken != -1) {
    dispatch_once(&_AXBooleanPreferencesWithNonZeroDefaultValues_onceToken, &__block_literal_global_1733);
  }
  CFNumberRef v0 = (void *)_AXBooleanPreferencesWithNonZeroDefaultValues_BooleanPreferencesWithNonZeroDefaultValues;

  return v0;
}

void AXSInitializeAsynchronouslyPerAppSmartInvert()
{
  dispatch_time_t v0 = dispatch_time(0, 500000000);
  BOOL v1 = MEMORY[0x1E4F14428];

  dispatch_after(v0, v1, &__block_literal_global_1716);
}

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_190274000, v0, v1, "Updated cache: preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)", v2, v3, v4, v5, v6);
}

void __AXSGetCachedSmartInvert_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_190274000, v0, v1, "Read Global: preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)", v2, v3, v4, v5, v6);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

BOOL _AXSEnhanceBackgroundContrastEnabled()
{
  dispatch_time_t v0 = +[AccessibilitySupportOverrides shared];
  uint64_t v1 = [v0 reduceTransparency];

  if (!v1) {
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheEnhanceBackgroundContrast, &_AXSEnhanceBackgroundContrastEnabled_onceToken, kAXSEnhanceBackgroundContrastPreference, @"com.apple.accessibility.cache.enhance.background.contrast", (uint64_t)kAXSEnhanceBackgroundContrastChangedNotification) == 1;
  }
  uint64_t v2 = +[AccessibilitySupportOverrides shared];
  uint64_t v3 = [v2 reduceTransparency];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

BOOL _AXSReduceMotionEnabled()
{
  dispatch_time_t v0 = +[AccessibilitySupportOverrides shared];
  uint64_t v1 = [v0 reduceMotion];

  if (!v1) {
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheReduceMotion, &_AXSReduceMotionEnabled_onceToken, kAXSReduceMotionPreference, @"com.apple.accessibility.cache.reduce.motion", @"com.apple.accessibility.cache.reduce.motion") == 1;
  }
  uint64_t v2 = +[AccessibilitySupportOverrides shared];
  uint64_t v3 = [v2 reduceMotion];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

uint64_t _AXSAccessibilityEnabled()
{
  if (_AXSAccessibilityEnabled_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityEnabled_onceToken, &__block_literal_global_1834);
  }
  if (_AXSAccessibilityEnabled_isPreBoard | _AXSAccessibilityEnabled_isCheckerBoard)
  {
    if (_accessibilityEnabled_onceToken != -1) {
      dispatch_once(&_accessibilityEnabled_onceToken, &__block_literal_global_1832);
    }
    return 1;
  }
  if (_AXLoadsBundlesUnconditionallyForUnmanagedASAM_onceToken != -1) {
    dispatch_once(&_AXLoadsBundlesUnconditionallyForUnmanagedASAM_onceToken, &__block_literal_global_2832);
  }
  if (_AXLoadsBundlesUnconditionallyForUnmanagedASAM_LoadsBundlesUnconditionallyForUnmanagedASAM)
  {
    if (_AXHasUnmanagedASAMEntitlement_entitlementOnceToken != -1) {
      dispatch_once(&_AXHasUnmanagedASAMEntitlement_entitlementOnceToken, &__block_literal_global_2834);
    }
    if (_AXHasUnmanagedASAMEntitlement_hasUnmanagedASAMEntitlement) {
      return 1;
    }
  }
  if (_accessibilityEnabled_onceToken != -1) {
    dispatch_once(&_accessibilityEnabled_onceToken, &__block_literal_global_1832);
  }
  char v0 = _kAXSCacheAccessibilityEnabled;
  BOOL v1 = _AXSInvertColorsEnabled();
  if (_AXSShouldLoadInvertBundles_onceToken != -1)
  {
    BOOL v4 = v1;
    dispatch_once(&_AXSShouldLoadInvertBundles_onceToken, &__block_literal_global_2);
    BOOL v1 = v4;
  }
  return (v1 | v0 | _kAXSystemUIProcessShouldLoadInvertBundles);
}

BOOL _AXSInvertColorsEnabled()
{
  char v0 = +[AccessibilitySupportOverrides shared];
  BOOL v1 = [v0 smartInvert];

  if (v1)
  {
    uint64_t v2 = +[AccessibilitySupportOverrides shared];
    uint64_t v3 = [v2 smartInvert];
    uint64_t v4 = [v3 BOOLValue];
  }
  else
  {
    if (AXSGetCachedSmartInvert_onceToken != -1) {
      dispatch_once(&AXSGetCachedSmartInvert_onceToken, &__block_literal_global_1718);
    }
    return _kAXSCacheInvertColors == 1;
  }
  return v4;
}

BOOL _AXSEnhanceTextLegibilityEnabled()
{
  char v0 = +[AccessibilitySupportOverrides shared];
  BOOL v1 = [v0 boldText];

  if (!v1) {
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheEnhanceTextLegibility, &_AXSEnhanceTextLegibilityEnabled_onceToken, kAXSEnhanceTextLegibilityPreference, @"com.apple.accessibility.cache.enhance.text.legibility", (uint64_t)kAXSEnhanceTextLegibilityChangedNotification) == 1;
  }
  uint64_t v2 = +[AccessibilitySupportOverrides shared];
  uint64_t v3 = [v2 boldText];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

BOOL _AXDarkenSystemColors()
{
  char v0 = +[AccessibilitySupportOverrides shared];
  BOOL v1 = [v0 increaseContrast];

  if (!v1) {
    return AXSGetCachedPreference(&_kAXSCacheDarkenSystemColors, &_AXDarkenSystemColors_onceToken, kAXSDarkenSystemColorsEnabledPreference, @"com.apple.accessibility.cache.darken.system.colors.enabled", (uint64_t)kAXSDarkenSystemColorsEnabledNotification) == 1;
  }
  uint64_t v2 = +[AccessibilitySupportOverrides shared];
  uint64_t v3 = [v2 increaseContrast];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

uint64_t AXSGetCachedPreference(unsigned int *a1, dispatch_once_t *predicate, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __AXSGetCachedPreference_block_invoke;
  v7[3] = &__block_descriptor_64_e5_v8__0l;
  v7[4] = a4;
  v7[5] = a3;
  v7[6] = a1;
  v7[7] = a5;
  if (*predicate != -1) {
    dispatch_once(predicate, v7);
  }
  return *a1;
}

uint64_t _AXSUseDarkerKeyboard()
{
  return 0;
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
  }
  return _kAXSCacheSwitchControlEnabled;
}

uint64_t _AXSAssistiveTouchEnabled()
{
  if (_AXSAssistiveTouchEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1810);
  }
  return _kAXSAssistiveTouchEnabledCache;
}

uint64_t _AXSClarityBoardEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  return _AXSClarityBoardEnabled_isEnabled;
}

uint64_t _AXSReduceMotionAutoplayAnimatedImagesEnabled()
{
  if (_AXSReduceMotionAutoplayAnimatedImagesEnabled_onceToken != -1) {
    dispatch_once(&_AXSReduceMotionAutoplayAnimatedImagesEnabled_onceToken, &__block_literal_global_2367);
  }
  return _kAXSCacheReduceMotionAutoplayAnimatedImagesEnabled;
}

uint64_t _AXSMossdeepEnabled()
{
  return 0;
}

uint64_t _AXSIsNonUIBuild()
{
  return os_variant_has_factory_content();
}

uint64_t _AXSAllowOpaqueTouchGestures()
{
  char v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSAllowOpaqueTouchGesturesPreference, &v1);
  if (v1) {
    return result;
  }
  else {
    return 1;
  }
}

void ___initializePublicAPINotificationListeners_block_invoke()
{
  if (s_axDidInitializeListeners_block_invoke_3_onceToken != -1) {
    dispatch_once(&s_axDidInitializeListeners_block_invoke_3_onceToken, &__block_literal_global_2829);
  }
}

uint64_t __preferencesQueue_block_invoke()
{
  preferencesQueue_PreferencesQueue = (uint64_t)dispatch_queue_create("com.apple.accessibility.perappprefs.queue", 0);

  return MEMORY[0x1F41817F8]();
}

BOOL _AXSPrefersNonBlinkingCursorIndicator()
{
  return AXSGetCachedPreference((unsigned int *)&_kAXSCachePrefersNonBlinkingCursorIndicator, &_AXSPrefersNonBlinkingCursorIndicator_onceToken, kAXSPrefersNonBlinkingCursorIndicatorPreference, @"com.apple.accessibility.cache.non.blinking.cursor.status", kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification) == 1;
}

uint64_t __AXSupportLogCommon_block_invoke()
{
  AXSupportLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSupportCommon");

  return MEMORY[0x1F41817F8]();
}

uint64_t AXDisallowsUIBasedAccessibilityFeatures()
{
  if (AXDisallowsUIBasedAccessibilityFeatures_onceToken != -1) {
    dispatch_once(&AXDisallowsUIBasedAccessibilityFeatures_onceToken, &__block_literal_global_2477);
  }
  return AXDisallowsUIBasedAccessibilityFeatures_DisallowedForClient;
}

uint64_t _AXSAuditInspectionModeEnabled()
{
  if (_AXSAuditInspectionModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSAuditInspectionModeEnabled_onceToken, &__block_literal_global_2177);
  }
  return _kAXSCacheAuditInspectionModeModeEnabled;
}

uint64_t AXSGetPreferenceValue(const __CFString *a1, const __CFString *a2)
{
  uint64_t v2 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  CFNumberRef NumberPreference = (const __CFNumber *)_getNumberPreference(a1, a2);
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }
  return v2;
}

uint64_t _AXSProcessDrawsAssistiveUI()
{
  if (_AXSProcessDrawsAssistiveUI_onceToken != -1) {
    dispatch_once(&_AXSProcessDrawsAssistiveUI_onceToken, &__block_literal_global_1966);
  }
  return _AXSProcessDrawsAssistiveUI_result;
}

CFStringRef _AXSCopyPreferredContentSizeCategoryName()
{
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  if (cachedAppID_CachedAppID)
  {
    CFStringRef v0 = (const __CFString *)_AXSCopyPreferredContentSizeCategoryNameApp((const __CFString *)cachedAppID_CachedAppID);
    if (v0)
    {
      CFStringRef v1 = v0;
      CFTypeID v2 = CFGetTypeID(v0);
      if (v2 == CFStringGetTypeID() && CFStringGetLength(v1)) {
        return v1;
      }
      CFRelease(v1);
    }
  }

  return (const __CFString *)_AXSCopyPreferredContentSizeCategoryNameApp(0);
}

uint64_t ___initializeVoiceOverCacheListener_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.vot", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSVoiceOverTouchEnabledPreference, @"com.apple.accessibility.cache.vot");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheVoiceOverTouchEnabled = result;
  }
  return result;
}

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke()
{
  if (_AXSProcessLoadsInvertBundlesForPerAppSmartInvert())
  {
    if (_AXSProcessIsSpringBoard_onceToken != -1) {
      dispatch_once(&_AXSProcessIsSpringBoard_onceToken, &__block_literal_global_2526);
    }
    if (_AXSProcessIsSpringBoard__AXSProcessIsSpringBoard == 1) {
      CFPreferencesSetValue(@"AXSSystemUIProcessAppSmartInvertEnabledPreference", (CFPropertyListRef)*MEMORY[0x1E4F1CFC8], (CFStringRef)kAXSAccessibilityPreferenceDomain, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandleSystemUILoadInvertBundles, @"com.apple.accessibility.system.ui.process.load.invert.bundles", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  CFStringRef v1 = (const __CFString *)kAXSInvertColorsEnabledPreference;
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  CFNumberRef NumberPreference = (const __CFNumber *)_getNumberPreference(v1, (const __CFString *)cachedAppID_CachedAppID);
  int valuePtr = -1;
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    uint64_t v3 = AXSupportLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_4();
    }

    if (valuePtr != -1 && valuePtr != _kAXSCacheInvertColors)
    {
      _kAXSCacheInvertColors = valuePtr;
      uint64_t v4 = AXSupportLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_3();
      }

      if (valuePtr == 1)
      {
        if ((_AXSProcessLoadsInvertBundlesForPerAppSmartInvert() & 1) == 0)
        {
          uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(v5, @"com.apple.accessibility.system.ui.process.load.invert.bundles", 0, 0, 1u);
          uint8_t v6 = AXLogInvertColorsLoadBundles();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
            __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_2();
          }
        }
        if (_kAXSCacheInvertColors != _kAXSCacheInvertColorsGlobal)
        {
          CFStringRef v7 = AXSupportLogCommon();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_1();
          }

          LocalCenter = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSAccessibilityEnabledNotification, 0, 0, 1u);
          uint64_t v9 = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(v9, (CFNotificationName)kAXSAccessibilityEnabledNotification, 0, 0, 1u);
        }
      }
      uint64_t v10 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v10, kAXSInvertColorsEnabledNotification, 0, 0, 1u);
    }
  }
}

uint64_t _AXSProcessLoadsInvertBundlesForPerAppSmartInvert()
{
  if (_AXSProcessLoadsInvertBundlesForPerAppSmartInvert_onceToken != -1) {
    dispatch_once(&_AXSProcessLoadsInvertBundlesForPerAppSmartInvert_onceToken, &__block_literal_global_2518);
  }
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  uint64_t v0 = cachedAppID_CachedAppID;
  CFStringRef v1 = (void *)_AXSProcessLoadsInvertBundlesForPerAppSmartInvert_appIDs;

  return [v1 containsObject:v0];
}

uint64_t _AXSReduceMotionEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionPreference, a1);
}

uint64_t _AXSInvertColorsEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSInvertColorsEnabledPreference, a1);
}

uint64_t _AXSIncreaseButtonLegibilityApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSIncreaseButtonLegibilityPreference, a1);
}

uint64_t _AXSEnhanceTextLegibilityEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSEnhanceTextLegibilityPreference, a1);
}

uint64_t _AXDarkenSystemColorsApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, a1);
}

void ___initializePublicAPINotificationListeners_block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.captioning", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFStringRef v1 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.mono.audio", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  char v2 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v2, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.quick.speak", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.differentiate.without.color", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.enhance.background.contrast", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (_initializeVoiceOverCacheListener_onceToken != -1) {
    dispatch_once(&_initializeVoiceOverCacheListener_onceToken, &__block_literal_global_2969);
  }
  uint8_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.grayscale", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFStringRef v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v7, 0, (CFNotificationCallback)_axsHandleMusicHapticActiveStatusChanged, (CFStringRef)_kAXSMusicHapticsActiveStatusDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  s_axDidInitializeListeners = 1;
}

uint64_t _AXSHapticMusicEnabled()
{
  uint64_t result = AXDeviceSupportsHapticMusic();
  if (result)
  {
    if (_AXSHapticMusicEnabled_onceToken != -1) {
      dispatch_once(&_AXSHapticMusicEnabled_onceToken, &__block_literal_global_2421);
    }
    return _kAXSCacheHapticMusicEnabled;
  }
  return result;
}

id get_ANEDeviceInfoClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_ANEDeviceInfoClass_softClass;
  uint64_t v7 = get_ANEDeviceInfoClass_softClass;
  if (!get_ANEDeviceInfoClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __get_ANEDeviceInfoClass_block_invoke;
    v3[3] = &unk_1E568C0A0;
    v3[4] = &v4;
    __get_ANEDeviceInfoClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19027A8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AppleNeuralEngineLibraryCore()
{
  if (!AppleNeuralEngineLibraryCore_frameworkLibrary) {
    AppleNeuralEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AppleNeuralEngineLibraryCore_frameworkLibrary;
}

uint64_t __AXLogLiveTranscription_block_invoke()
{
  AXLogLiveTranscription___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXLiveTranscription");

  return MEMORY[0x1F41817F8]();
}

BOOL _AXSPrefersHorizontalTextLayout()
{
  return AXSGetCachedPreference((unsigned int *)&_kAXSCachePrefersHorizontalText, &_AXSPrefersHorizontalTextLayout_onceToken, kAXSPrefersHorizontalTextPreference, @"com.apple.accessibility.cache.prefers.horizontal.text", kAXSPrefersHorizontalTextNotification) == 1;
}

uint64_t ___willGetPrefValue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.accessibility.cachedprefs.queue", 0);
  id v1 = (void *)PrefsChangedNotificationQueue;
  PrefsChangedNotificationQueue = (uint64_t)v0;

  PrefsChangedNotifications = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);

  return MEMORY[0x1F41817F8]();
}

void _axsHandlePrefChanged(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___axsHandlePrefChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

BOOL _AXHasBooleanEntitlement(const __CFString *a1)
{
  CFStringGetCStringPtr(a1, 0x8000100u);
  id v1 = (void *)xpc_copy_entitlement_for_self();
  char v2 = v1;
  if (v1) {
    BOOL value = xpc_BOOL_get_value(v1);
  }
  else {
    BOOL value = 0;
  }

  return value;
}

uint64_t _AXSVisualAlertEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  if (_AXSVisualAlertEnabled_onceToken != -1) {
    dispatch_once(&_AXSVisualAlertEnabled_onceToken, &__block_literal_global_2183);
  }
  return _kAXSCacheVisualAlertEnabled;
}

void ___axsHandlePrefChanged_block_invoke(uint64_t a1)
{
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  CFStringRef v2 = (const __CFString *)cachedAppID_CachedAppID;
  uint64_t v4 = *(const void **)(a1 + 32);
  uint64_t v3 = (CFTypeRef *)(a1 + 32);
  if (CFEqual(v4, @"com.apple.accessibility.cache.button.shapes.enabled"))
  {
    CFStringRef v5 = (const __CFString *)kAXSButtonShapesEnabledPreference;
    CFStringRef v6 = kAXSButtonShapesEnabledNotification;
    uint64_t v7 = (int *)&_kAXSCacheButtonShapes;
LABEL_5:
    _updateCachePreferenceAndRepostNotification(v5, v6, v2, v7);
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.use.darker.keyboard.enabled"))
  {
    _getBooleanPreference((const __CFString *)kAXSUseDarkerKeyboardPreference, 0);
    if (kAXSUseDarkerKeyboardEnabledNotification)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSUseDarkerKeyboardEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSUseDarkerKeyboardEnabledNotification;
LABEL_15:
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v12, 0, 0, 1u);
        goto LABEL_6;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.darken.system.colors.enabled"))
  {
    CFStringRef v5 = (const __CFString *)kAXSDarkenSystemColorsEnabledPreference;
    CFStringRef v6 = kAXSDarkenSystemColorsEnabledNotification;
    uint64_t v7 = (int *)&_kAXSCacheDarkenSystemColors;
    goto LABEL_5;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.VibrationDisabled"))
  {
    _kAXSCacheVibrationDisabled = _getBooleanPreference((const __CFString *)kAXSVibrationDisabledPreference, 0);
    if (kAXSVibrationDisabledPreferenceDidChangeNotification)
    {
      __int16 v13 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v13, (CFNotificationName)kAXSVibrationDisabledPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSVibrationDisabledPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.use.prominent.focus.indicators"))
  {
    _kAXSCacheHighContrastFocusIndicatorsEnabled = _getBooleanPreference((const __CFString *)kAXSHighContrastFocusIndicatorsEnabledPreference, 0);
    if (kAXSHighContrastFocusIndicatorsEnabledNotification)
    {
      uint64_t v21 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v21, (CFNotificationName)kAXSHighContrastFocusIndicatorsEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSHighContrastFocusIndicatorsEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.use.single.system.color.enabled"))
  {
    _kAXSCacheUseSingleSystemColor = _getBooleanPreference((const __CFString *)kAXSUseSingleSystemColorPreference, 0);
    if (kAXSUseSingleSystemColorNotification)
    {
      CFStringRef v25 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v25, (CFNotificationName)kAXSUseSingleSystemColorNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSUseSingleSystemColorNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.increase.button.legibility"))
  {
    CFStringRef v5 = (const __CFString *)kAXSIncreaseButtonLegibilityPreference;
    CFStringRef v6 = kAXSIncreaseButtonLegibilityNotification;
    uint64_t v7 = (int *)&_kAXSCacheIncreaseButtonLegibility;
    goto LABEL_5;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.differentiate.without.color"))
  {
    CFStringRef v5 = (const __CFString *)kAXSDifferentiateWithoutColorPreference;
    CFStringRef v6 = kAXSDifferentiateWithoutColorChangedNotification;
    uint64_t v7 = (int *)&_kAXSCacheDifferentiateWithoutColor;
    goto LABEL_5;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.reduce.motion"))
  {
    CFStringRef v5 = (const __CFString *)kAXSReduceMotionPreference;
    CFStringRef v6 = kAXSReduceMotionChangedNotification;
    uint64_t v7 = (int *)&_kAXSCacheReduceMotion;
    goto LABEL_5;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.reduce.motion.autoplay.messages.effects"))
  {
    _kAXSCacheReduceMotionAutoplayMessagesEffectsEnabled = _getBooleanPreference((const __CFString *)kAXSReduceMotionAutoplayMessagesEffectsPreference, 0);
    if (kAXSReduceMotionAutoplayMessagesEffectsChangedNotification)
    {
      id v27 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v27, (CFNotificationName)kAXSReduceMotionAutoplayMessagesEffectsChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSReduceMotionAutoplayMessagesEffectsChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.reduce.motion.autoplay.animated.images"))
  {
    _kAXSCacheReduceMotionAutoplayAnimatedImagesEnabled = _getBooleanPreference((const __CFString *)kAXSReduceMotionAutoplayAnimatedImagesPreference, 0);
    if (kAXSReduceMotionAutoplayAnimatedImagesChangedNotification)
    {
      uint64_t v28 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v28, (CFNotificationName)kAXSReduceMotionAutoplayAnimatedImagesChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSReduceMotionAutoplayAnimatedImagesChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.reduce.motion.autoplay.video.previews"))
  {
    CFStringRef v5 = (const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference;
    CFStringRef v6 = (const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsChangedNotification;
    uint64_t v7 = (int *)&_kAXSCacheReduceMotionAutoplayVideoPreviews;
    goto LABEL_5;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions"))
  {
    CFStringRef v5 = (const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference;
    CFStringRef v6 = (const __CFString *)kAXSReduceMotionReduceSlideTransitionsChangedNotification;
    uint64_t v7 = (int *)&_kAXSCacheReduceMotionReduceSlideTransitions;
    goto LABEL_5;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.enhance.background.contrast"))
  {
    CFStringRef v5 = (const __CFString *)kAXSEnhanceBackgroundContrastPreference;
    CFStringRef v6 = kAXSEnhanceBackgroundContrastChangedNotification;
    uint64_t v7 = (int *)&_kAXSCacheEnhanceBackgroundContrast;
    goto LABEL_5;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.enhance.text.legibility"))
  {
    CFStringRef v5 = (const __CFString *)kAXSEnhanceTextLegibilityPreference;
    CFStringRef v6 = kAXSEnhanceTextLegibilityChangedNotification;
    uint64_t v7 = (int *)&_kAXSCacheEnhanceTextLegibility;
    goto LABEL_5;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.zoom"))
  {
    _kAXSCacheZoomTouchEnabled = _getBooleanPreference((const __CFString *)kAXSZoomTouchEnabledPreference, 0);
    if (kAXSZoomTouchEnabledNotification)
    {
      uint64_t v29 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v29, (CFNotificationName)kAXSZoomTouchEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSZoomTouchEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.livespeech"))
  {
    _kAXSCacheLiveSpeechEnabled = _getBooleanPreference((const __CFString *)kAXSLiveSpeechEnabledPreference, 0);
    if (kAXSLiveSpeechEnabledNotification)
    {
      v30 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v30, (CFNotificationName)kAXSLiveSpeechEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSLiveSpeechEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.hovertext"))
  {
    _kAXSCacheHoverTextEnabled = _getBooleanPreference((const __CFString *)kAXSHoverTextEnabledPreference, 0);
    if (kAXSHoverTextEnabledNotification)
    {
      v31 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v31, (CFNotificationName)kAXSHoverTextEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSHoverTextEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.hovertext.fontsize.change"))
  {
    _kAXSCachedHoverTextFontSize = _getFloatPreference((const __CFString *)kAXSHoverTextFontSizePreference, 0, 0);
    if (kAXSHoverTextFontSizeChangedNotification)
    {
      v32 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v32, (CFNotificationName)kAXSHoverTextFontSizeChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSHoverTextFontSizeChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.hovertext.backgroundopacity.change"))
  {
    _kAXSCachedHoverTextBackgroundOpacity = _getFloatPreference((const __CFString *)kAXSHoverTextBackgroundOpacityPreference, 0, 0);
    if (kAXSHoverTextBackgroundOpacityChangedNotification)
    {
      v33 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v33, (CFNotificationName)kAXSHoverTextBackgroundOpacityChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSHoverTextBackgroundOpacityChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.hovertext.displaymode.change"))
  {
    _kAXSCachedHoverTextDisplayMode = (uint64_t)_getFloatPreference((const __CFString *)kAXSHoverTextDisplayModePreference, 0, 0);
    if (kAXSHoverTextDisplayModeChangedNotification)
    {
      v34 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v34, (CFNotificationName)kAXSHoverTextDisplayModeChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSHoverTextDisplayModeChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.hovertext.typing"))
  {
    _kAXSCacheHoverTextTypingEnabled = _getBooleanPreference((const __CFString *)kAXSHoverTextTypingEnabledPreference, 0);
    if (kAXSHoverTextTypingEnabledNotification)
    {
      v35 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v35, (CFNotificationName)kAXSHoverTextTypingEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSHoverTextTypingEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.hovertext.typing.displaymode.change"))
  {
    _kAXSCacheHoverTextTypingDisplayMode = (uint64_t)_getFloatPreference((const __CFString *)kAXSHoverTextTypingDisplayModePreference, 0, 0);
    if (kAXSHoverTextTypingDisplayModeChangedNotification)
    {
      v36 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v36, (CFNotificationName)kAXSHoverTextTypingDisplayModeChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSHoverTextTypingDisplayModeChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.ast"))
  {
    _kAXSAssistiveTouchEnabledCache = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchEnabledPreference, 0);
    if (kAXSAssistiveTouchEnabledNotification)
    {
      v37 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v37, (CFNotificationName)kAXSAssistiveTouchEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAssistiveTouchEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.vot"))
  {
    _kAXSCacheVoiceOverTouchEnabled = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledPreference, 0);
    if (kAXSVoiceOverTouchEnabledNotification)
    {
      v38 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v38, (CFNotificationName)kAXSVoiceOverTouchEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSVoiceOverTouchEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.bsi"))
  {
    _kAXSCacheBrailleScreenInputEnabled = _getBooleanPreference((const __CFString *)kAXSBrailleScreenInputEnabledPreference, 0);
    if (kAXSBrailleScreenInputEnabledNotification)
    {
      v39 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v39, (CFNotificationName)kAXSBrailleScreenInputEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSBrailleScreenInputEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.AXSCacheVoiceOverSpeakTimeOnWakeNotification"))
  {
    _kAXSCacheVoiceOverSpeakTimeOnWake = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchSpeakTimeOnWakePreference, 0);
    if (kAXSVoiceOverTouchSpeakTimeOnWakeChangedNotification)
    {
      v40 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v40, (CFNotificationName)kAXSVoiceOverTouchSpeakTimeOnWakeChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSVoiceOverTouchSpeakTimeOnWakeChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.AXSCacheWalkieTalkieTapToTalkNotification"))
  {
    _kAXSCacheWalkieTalkieTapToTalk = _getBooleanPreference((const __CFString *)kAXSWalkieTalkieTapToTalkPreference, 0);
    if (kAXSWalkieTalkieTapToTalkChangedNotification)
    {
      v41 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v41, (CFNotificationName)kAXSWalkieTalkieTapToTalkChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSWalkieTalkieTapToTalkChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.AXSCacheAppSwitcherAutoSelectNotification"))
  {
    _kAXSCacheAppSwitcherAutoSelect = _getBooleanPreference((const __CFString *)kAXSAppSwitcherAutoSelectPreference, 0);
    if (kAXSAppSwitcherAutoSelectChangedNotification)
    {
      v42 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v42, (CFNotificationName)kAXSAppSwitcherAutoSelectChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAppSwitcherAutoSelectChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.visual.alert"))
  {
    _kAXSCacheVisualAlertEnabled = _getBooleanPreference((const __CFString *)kAXSVisualAlertEnabledPreference, 0);
    if (kAXSVisualAlertEnabledNotification)
    {
      v43 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v43, (CFNotificationName)kAXSVisualAlertEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSVisualAlertEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.earpiece.noise"))
  {
    _kAXSCacheEarpieceNoiseCancellation = _getBooleanPreference((const __CFString *)kAXSEarpieceNoiseCancellationPreference, 0);
    if (kAXSEarpieceNoiseCancellationEnabledNotification)
    {
      v44 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v44, (CFNotificationName)kAXSEarpieceNoiseCancellationEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSEarpieceNoiseCancellationEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.extendedvoiceisolationmodes"))
  {
    _kAXSCacheExtendedVoiceIsolationMediaModesEnabled = _getBooleanPreference((const __CFString *)kAXSExtendedVoiceIsolationMediaModesEnabledPreference, 0);
    if (kAXSExtendedVoiceIsolationMediaModesEnabledNotification)
    {
      v45 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v45, (CFNotificationName)kAXSExtendedVoiceIsolationMediaModesEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSExtendedVoiceIsolationMediaModesEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.lock.to.end.call"))
  {
    _kAXSCachePhoneLockToEndCall = _getBooleanPreference((const __CFString *)kAXSPhoneLockToEndCallPreference, 0);
    if (kAXSPhoneLockToEndCallNotification)
    {
      v46 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v46, (CFNotificationName)kAXSPhoneLockToEndCallNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSPhoneLockToEndCallNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.mono.audio"))
  {
    _kAXSCacheMonoAudioEnabled = _getBooleanPreference((const __CFString *)kAXSMonoAudioEnabledPreference, 0);
    if (kAXSMonoAudioEnabledNotification)
    {
      v47 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v47, (CFNotificationName)kAXSMonoAudioEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSMonoAudioEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.alwaysshowvolume"))
  {
    _kAXSCacheAlwaysShowVolumeControlsEnabled = _getBooleanPreference((const __CFString *)kAXSAlwaysShowVolumeControlEnabledPreference, 0);
    if (kAXSAlwaysShowVolumeControlEnabledNotification)
    {
      v48 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v48, (CFNotificationName)kAXSAlwaysShowVolumeControlEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAlwaysShowVolumeControlEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.hac.audio"))
  {
    _kAXSCacheHearingAidComplianceEnabled = _getBooleanPreference((const __CFString *)kAXSHearingAidCompliancePreference, 0);
    if (kAXSHearingAidComplianceNotification)
    {
      v49 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v49, (CFNotificationName)kAXSHearingAidComplianceNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSHearingAidComplianceNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.grayscale"))
  {
    _kAXSCacheGrayscaleEnabled = _getBooleanPreference((const __CFString *)kAXSGrayscaleEnabledPreference, 0);
    if (kAXSGrayscaleEnabledNotification)
    {
      v50 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v50, kAXSGrayscaleEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = kAXSGrayscaleEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.invert.colors"))
  {
    _updateCacheSmartInvertAndRepostNotification(v2);
    _invalidateAllCacheSmartInvertPreferences();
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.classic.invert.colors"))
  {
    _kAXSCacheClassicInvertColorsEnabled = _getBooleanPreference((const __CFString *)kAXSClassicInvertColorsPreference, 0);
    v51 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v51, (CFNotificationName)kAXSClassicInvertColorsEnabledNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
    }
    if (!_AXSCurrentProcessIsWebContent_IsWebContent)
    {
      v52 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v52, (CFNotificationName)kAXSClassicInvertColorsEnabledNotification, 0, 0, 1u);
      DarwinNotifyCenter = CFNotificationCenterGetLocalCenter();
      CFStringRef v12 = kAXSInvertColorsEnabledNotification;
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.displayfilter.showinitialalert"))
  {
    _kAXSCacheDisplayFilterShowInitialAlert = _getBooleanPreference((const __CFString *)kAXSDisplayFilterShowInitialAlertPreference, 0);
    if (kAXSDisplayShowInitialAlertNotification)
    {
      v53 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v53, (CFNotificationName)kAXSDisplayShowInitialAlertNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSDisplayShowInitialAlertNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.quick.speak"))
  {
    _kAXSCacheQuickSpeakEnabled = _getBooleanPreference((const __CFString *)kAXSQuickSpeakEnabledPreference, 0);
    if (kAXSQuickSpeakEnabledNotification)
    {
      v54 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v54, (CFNotificationName)kAXSQuickSpeakEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSQuickSpeakEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.quick.speak.highlight.text"))
  {
    _kAXSCacheQuickSpeakHighlightTextEnabled = _getBooleanPreference((const __CFString *)kAXSQuickSpeakHighlightTextEnabledPreference, 0);
    if (kAXSQuickSpeakHighlightTextEnabledNotification)
    {
      v55 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v55, (CFNotificationName)kAXSQuickSpeakHighlightTextEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSQuickSpeakHighlightTextEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.internal.logvalidationerrors"))
  {
    _kAXSCacheLogValidationErrors = _getBooleanPreference((const __CFString *)kAXSLogValidationErrorsPreference, 0);
    if (kAXSLogValidationErrorsNotification)
    {
      v56 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v56, (CFNotificationName)kAXSLogValidationErrorsNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSLogValidationErrorsNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.internal.reportvalidationerrors"))
  {
    _kAXSCacheReportValidationErrors = _getBooleanPreference((const __CFString *)kAXSReportValidationErrorsPreference, 0);
    if (kAXSReportValidationErrorsNotification)
    {
      v57 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v57, (CFNotificationName)kAXSReportValidationErrorsNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSReportValidationErrorsNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.internal.crashonvalidationerrors"))
  {
    _kAXSCacheCrashOnValidationErrors = _getBooleanPreference((const __CFString *)kAXSCrashOnValidationErrorsPreference, 0);
    if (kAXSCrashOnValidationErrorsNotification)
    {
      v58 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v58, (CFNotificationName)kAXSCrashOnValidationErrorsNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSCrashOnValidationErrorsNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.web.accessibility.events.enabled"))
  {
    _getBooleanPreference((const __CFString *)kAXSWebAccessibilityEventsEnabledPreference, 0);
    if (kAXSWebAccessibilityEventsEnabledNotification)
    {
      v59 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v59, (CFNotificationName)kAXSWebAccessibilityEventsEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSWebAccessibilityEventsEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.allows.notification"))
  {
    _kAXSCacheWebProcessAllowsSecondaryThreadEnabled = _getBooleanPreference((const __CFString *)kAXSWebProcessAllowsSecondaryThreadEnabledPreference, 0);
    if (kAXSWebProcessAllowsSecondaryThreadEnabledNotification)
    {
      v60 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v60, (CFNotificationName)kAXSWebProcessAllowsSecondaryThreadEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSWebProcessAllowsSecondaryThreadEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.allow.app.customization"))
  {
    _kAXSCachePointerAllowAppCustomizationEnabled = _getBooleanPreference((const __CFString *)kAXSPointerAllowAppCustomizationEnabledPreference, 0);
    if (kAXSPointerAllowAppCustomizationPreferenceDidChangeNotification)
    {
      v61 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v61, (CFNotificationName)kAXSPointerAllowAppCustomizationPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSPointerAllowAppCustomizationPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.inertia"))
  {
    _kAXSCachePointerInertiaEnabled = _getBooleanPreference((const __CFString *)kAXSPointerInertiaEnabledPreference, 0);
    if (kAXSPointerInertiaPreferenceDidChangeNotification)
    {
      v62 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v62, (CFNotificationName)kAXSPointerInertiaPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSPointerInertiaPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.effect.scaling"))
  {
    _kAXSCachePointerEffectScalingEnabled = _getBooleanPreference((const __CFString *)kAXSPointerEffectScalingEnabledPreference, 0);
    if (kAXSPointerEffectScalingPreferenceDidChangeNotification)
    {
      v63 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v63, (CFNotificationName)kAXSPointerEffectScalingPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSPointerEffectScalingPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.size.multiplier"))
  {
    _kAXSCachePointerSizeMultiplier = _getFloatPreference((const __CFString *)kAXSPointerSizeMultiplierPreference, 0, 0);
    if (kAXSPointerSizeMultiplierPreferenceDidChangeNotification)
    {
      v64 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v64, (CFNotificationName)kAXSPointerSizeMultiplierPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSPointerSizeMultiplierPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.increased.contrast"))
  {
    _kAXSCachePointerIncreasedContrastEnabled = _getBooleanPreference((const __CFString *)kAXSPointerIncreasedContrastEnabledPreference, 0);
    if (kAXSPointerIncreasedContrastPreferenceDidChangeNotification)
    {
      v65 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v65, (CFNotificationName)kAXSPointerIncreasedContrastPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSPointerIncreasedContrastPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.auto.hide"))
  {
    _kAXSCachePointerAutoHideEnabled = _getBooleanPreference((const __CFString *)kAXSPointerAutoHideEnabledPreference, 0);
    if (kAXSPointerAutoHidePreferenceDidChangeNotification)
    {
      v66 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v66, (CFNotificationName)kAXSPointerAutoHidePreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSPointerAutoHidePreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.auto.hide.duration"))
  {
    _kAXSCachePointerAutoHideDuration = _getFloatPreference((const __CFString *)kAXSPointerAutoHideDurationPreference, 0, 0);
    if (kAXSPointerAutoHideDurationPreferenceDidChangeNotification)
    {
      v67 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v67, (CFNotificationName)kAXSPointerAutoHideDurationPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSPointerAutoHideDurationPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.stroke.color.width"))
  {
    _kAXSCachePointerStrokeColorWidth = _getFloatPreference((const __CFString *)kAXSPointerStrokeColorWidthPreference, 0, 0);
    if (!kAXSPointerStrokeColorPreferenceDidChangeNotification) {
      goto LABEL_6;
    }
    v68 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v68, (CFNotificationName)kAXSPointerStrokeColorPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
    }
    if (_AXSCurrentProcessIsWebContent_IsWebContent) {
      goto LABEL_6;
    }
    goto LABEL_368;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.stroke.color"))
  {
    char v210 = 1;
    CFNumberRef v69 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSPointerStrokeColorPreference, 0, &v210);
    CFNumberRef v70 = v69;
    if (v210 && v69)
    {
      CFTypeID v71 = CFGetTypeID(v69);
      if (v71 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v70, kCFNumberIntType, buf);
        _kAXSCachePointerStrokeColor = *(_DWORD *)buf;
      }
    }
    else if (!v69)
    {
LABEL_354:
      if (!kAXSPointerStrokeColorPreferenceDidChangeNotification) {
        goto LABEL_6;
      }
      v75 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v75, (CFNotificationName)kAXSPointerStrokeColorPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (_AXSCurrentProcessIsWebContent_IsWebContent) {
        goto LABEL_6;
      }
LABEL_368:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v12 = (const __CFString *)kAXSPointerStrokeColorPreferenceDidChangeNotification;
      goto LABEL_15;
    }
    CFRelease(v70);
    goto LABEL_354;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.voiceover.option"))
  {
    char v210 = 1;
    CFNumberRef v72 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSPointerVoiceOverCursorOptionPreference, 0, &v210);
    CFNumberRef v73 = v72;
    if (v210 && v72)
    {
      CFTypeID v74 = CFGetTypeID(v72);
      if (v74 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v73, kCFNumberIntType, buf);
        _kAXSCachePointerVoiceOverCursorOption = *(_DWORD *)buf;
      }
    }
    else if (!v72)
    {
LABEL_363:
      if (kAXSPointerVoiceOverCursorOptionPreferenceDidChangeNotification)
      {
        v77 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v77, (CFNotificationName)kAXSPointerVoiceOverCursorOptionPreferenceDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSPointerVoiceOverCursorOptionPreferenceDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    CFRelease(v73);
    goto LABEL_363;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.voiceover.speak.under.pointer"))
  {
    _kAXSCacheVoiceOverSpeakUnderPointer = _getBooleanPreference((const __CFString *)kAXSVoiceOverSpeakUnderPointerPreference, 0);
    if (!kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification) {
      goto LABEL_6;
    }
    v76 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v76, (CFNotificationName)kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
    }
    if (_AXSCurrentProcessIsWebContent_IsWebContent) {
      goto LABEL_6;
    }
    goto LABEL_385;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.voiceover.speak.under.pointer"))
  {
    _kAXSCacheVoiceOverSpeakUnderPointerDelay = _getFloatPreference((const __CFString *)kAXSVoiceOverSpeakUnderPointerDelayPreference, 0, 0);
    if (!kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification) {
      goto LABEL_6;
    }
    v78 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v78, (CFNotificationName)kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
    }
    if (_AXSCurrentProcessIsWebContent_IsWebContent) {
      goto LABEL_6;
    }
LABEL_385:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v12 = (const __CFString *)kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification;
    goto LABEL_15;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.pointer.scale.with.zoom.level"))
  {
    _kAXSCachePointerScaleWithZoomLevelEnabled = _getBooleanPreference((const __CFString *)kAXSPointerScaleWithZoomLevelEnabledPreference, 0);
    if (kAXSPointerScaleWithZoomLevelPreferenceDidChangeNotification)
    {
      v79 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v79, (CFNotificationName)kAXSPointerScaleWithZoomLevelPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSPointerScaleWithZoomLevelPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheMotionCuesActiveDidChangeNotification))
  {
    _kAXSCacheMotionCuesActive = _getBooleanPreference(@"AXSMotionCuesActive", 0);
    if (!kAXSMotionCuesPreferenceDidChangeNotification) {
      goto LABEL_6;
    }
    v80 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v80, (CFNotificationName)kAXSMotionCuesPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken == -1) {
      goto LABEL_401;
    }
LABEL_400:
    dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
    goto LABEL_401;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheMotionCuesShouldShowBannerDidChangeNotification))
  {
    _kAXSCacheMotionCuesShouldShowBanner = _getBooleanPreference(@"AXSMotionCuesShouldShowBanner", 0);
    if (!kAXSMotionCuesPreferenceDidChangeNotification) {
      goto LABEL_6;
    }
    v81 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v81, (CFNotificationName)kAXSMotionCuesPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
      goto LABEL_400;
    }
LABEL_401:
    if (_AXSCurrentProcessIsWebContent_IsWebContent) {
      goto LABEL_6;
    }
    goto LABEL_426;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheMotionCuesDidChangeNotification))
  {
    _kAXSCacheMotionCuesEnabled = _getBooleanPreference((const __CFString *)kAXSMotionCuesEnabledPreference, 0);
    if (!kAXSMotionCuesPreferenceDidChangeNotification) {
      goto LABEL_6;
    }
    v82 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v82, (CFNotificationName)kAXSMotionCuesPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
      goto LABEL_400;
    }
    goto LABEL_401;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheMotionCuesModeDidChangeNotification))
  {
    char v210 = 1;
    CFNumberRef v83 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSMotionCuesModePreference, 0, &v210);
    CFNumberRef v84 = v83;
    if (v210 && v83)
    {
      CFTypeID v85 = CFGetTypeID(v83);
      if (v85 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v84, kCFNumberIntType, buf);
        _kAXSCacheMotionCuesMode = *(_DWORD *)buf;
      }
    }
    else if (!v83)
    {
LABEL_414:
      if (!kAXSMotionCuesPreferenceDidChangeNotification) {
        goto LABEL_6;
      }
      v87 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v87, (CFNotificationName)kAXSMotionCuesPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (_AXSCurrentProcessIsWebContent_IsWebContent) {
        goto LABEL_6;
      }
LABEL_426:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v12 = (const __CFString *)kAXSMotionCuesPreferenceDidChangeNotification;
      goto LABEL_15;
    }
    CFRelease(v84);
    goto LABEL_414;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheHapticMusicDidChangeNotification))
  {
    _kAXSCacheHapticMusicEnabled = _getBooleanPreference((const __CFString *)kAXSHapticMusicEnabledPreference, 0);
    if (kAXSHapticMusicPreferenceDidChangeNotification)
    {
      v86 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v86, (CFNotificationName)kAXSHapticMusicPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSHapticMusicPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheAudioDonationSiriImprovementDidChangeNotification))
  {
    _kAXSCacheAudioDonationSiriImprovementEnabled = _getBooleanPreference((const __CFString *)kAXSAudioDonationSiriImprovementEnabledPreference, 0);
    if (kAXSAudioDonationSiriImprovementPreferenceDidChangeNotification)
    {
      v88 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v88, (CFNotificationName)kAXSAudioDonationSiriImprovementPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAudioDonationSiriImprovementPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.isolated.tree.mode"))
  {
    char v210 = 1;
    CFNumberRef v89 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSIsolatedTreeModeEnabledPreference, 0, &v210);
    CFNumberRef v90 = v89;
    if (v210 && v89)
    {
      CFTypeID v91 = CFGetTypeID(v89);
      if (v91 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v90, kCFNumberIntType, buf);
        _kAXSCacheIsolatedTreeMode = *(_DWORD *)buf;
      }
    }
    else if (!v89)
    {
LABEL_441:
      if (kAXSIsolatedTreeModePreferenceDidChangeNotification)
      {
        v93 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v93, (CFNotificationName)kAXSIsolatedTreeModePreferenceDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSIsolatedTreeModePreferenceDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    CFRelease(v90);
    goto LABEL_441;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.back.tap.enabled"))
  {
    _kAXSCacheBackTapEnabled = _getBooleanPreference((const __CFString *)kAXSBackTapEnabledPreference, 0);
    if (kAXSBackTapEnabledDidChangeNotification)
    {
      v92 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v92, (CFNotificationName)kAXSBackTapEnabledDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSBackTapEnabledDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.braille.input.connection.changed"))
  {
    _kAXSCacheBrailleInputDeviceConnected = _getBooleanPreference((const __CFString *)kAXSBrailleInputDeviceConnectedPreference, 0);
    if (kAXSBrailleInputDeviceConnectedDidChangeNotification)
    {
      v94 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v94, (CFNotificationName)kAXSBrailleInputDeviceConnectedDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSBrailleInputDeviceConnectedDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.apple.tv.simple.gestures"))
  {
    _kAXSCacheAppleTVSimpleGesturesEnabled = _getBooleanPreference((const __CFString *)kAXSAppleTVSimpleGesturesEnabledPreference, 0);
    if (kAXSAppleTVRemoteSimpleGesturesEnabledNotification)
    {
      v95 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v95, (CFNotificationName)kAXSAppleTVRemoteSimpleGesturesEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAppleTVRemoteSimpleGesturesEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.apple.tv.live.tv.buttons"))
  {
    _kAXSCacheAppleTVForceLiveTVButtonsEnabled = _getBooleanPreference((const __CFString *)kAXSAppleTVForceLiveTVButtonsEnabledPreference, 0);
    if (kAXSAppleTVRemoteForceLiveTVButtonsEnabledNotification)
    {
      v96 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v96, (CFNotificationName)kAXSAppleTVRemoteForceLiveTVButtonsEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAppleTVRemoteForceLiveTVButtonsEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.AppleTVRemoteClickpadTapsForDirectionalNavigationEnabled"))
  {
    _kAXSCacheAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled = _getBooleanPreference((const __CFString *)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledPreference, 0);
    if (kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledNotification)
    {
      v97 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v97, (CFNotificationName)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.AppleTVScaledUIEnabled"))
  {
    _kAXSCacheAppleTVScaledUIEnabled = _getBooleanPreference((const __CFString *)kAXSAppleTVScaledUIEnabledPreference, 0);
    if (kAXSAppleTVScaledUIEnabledNotification)
    {
      v98 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v98, (CFNotificationName)kAXSAppleTVScaledUIEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAppleTVScaledUIEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.AutomaticSubtitlesShowWhenLanguageMismatch"))
  {
    _kAXSCacheAutomaticSubtitlesShowWhenLanguageMismatch = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowWhenLanguageMismatchPreference, 0);
    if (kAXSAutomaticSubtitlesShowWhenLanguageMismatchEnabledNotification)
    {
      v99 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v99, (CFNotificationName)kAXSAutomaticSubtitlesShowWhenLanguageMismatchEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAutomaticSubtitlesShowWhenLanguageMismatchEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.AutomationSubtitlesShowOnSkipBack"))
  {
    _kAXSCacheAutomaticSubtitlesShowOnSkipBack = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowOnSkipBackPreference, 0);
    if (kAXSAutomaticSubtitlesShowOnSkipBackEnabledNotification)
    {
      v100 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v100, (CFNotificationName)kAXSAutomaticSubtitlesShowOnSkipBackEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAutomaticSubtitlesShowOnSkipBackEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.AutomationSubtitlesShowWhenMuted"))
  {
    _kAXSCacheAutomaticSubtitlesShowWhenMuted = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowWhenMutedPreference, 0);
    if (kAXSAutomaticSubtitlesShowWhenMutedEnabledNotification)
    {
      v101 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v101, (CFNotificationName)kAXSAutomaticSubtitlesShowWhenMutedEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAutomaticSubtitlesShowWhenMutedEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.show.audio.transcriptions"))
  {
    _kAXSCacheShowAudioTranscriptionsEnabled = _getBooleanPreference((const __CFString *)kAXSShowAudioTranscriptionsEnabled, 0);
    if (kAXSShowAudioTranscriptionsChangedNotification)
    {
      v102 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v102, (CFNotificationName)kAXSShowAudioTranscriptionsChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSShowAudioTranscriptionsChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.live.headphone.level.enabled"))
  {
    _kAXSCacheLiveHeadphoneLevelEnabled = _getBooleanPreference((const __CFString *)kAXSLiveHeadphoneLevelEnabledPreference, 0);
    if (kAXSLiveHeadphoneLevelEnabledDidChangeNotification)
    {
      v103 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v103, (CFNotificationName)kAXSLiveHeadphoneLevelEnabledDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSLiveHeadphoneLevelEnabledDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"_AXNotification_AXSEnabledSoundDetectionState"))
  {
    _kAXSCacheSoundDetectionState = _getBooleanPreference((const __CFString *)kAXSEnabledSoundDetectionStatePreference, 0);
    if (kAXSSoundDetectionStateDidChangeNotification)
    {
      v104 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v104, (CFNotificationName)kAXSSoundDetectionStateDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSSoundDetectionStateDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.watch.typetosiri.enabled"))
  {
    _kAXSCacheWatchTypeToSiriEnabled = _getBooleanPreference((const __CFString *)kAXSWatchTypeToSiriEnabledPreference, 0);
    if (kAXSWatchTypeToSiriEnabledDidChangeNotification)
    {
      v105 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v105, (CFNotificationName)kAXSWatchTypeToSiriEnabledDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSWatchTypeToSiriEnabledDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.watch.quickactions.state"))
  {
    int v106 = _AXSWatchQuickActionsEnabled();
    if (!CFEqual(*v3, @"com.apple.accessibility.cache.watch.quickactions.state")) {
      goto LABEL_569;
    }
    char v210 = 1;
    CFNumberRef v107 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSWatchQuickActionsStatePreference, 0, &v210);
    CFNumberRef v108 = v107;
    if (v210 && v107)
    {
      CFTypeID v109 = CFGetTypeID(v107);
      if (v109 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v108, kCFNumberIntType, buf);
        _kAXSCacheWatchQuickActionsState = *(_DWORD *)buf;
      }
    }
    else if (!v107)
    {
LABEL_547:
      if (kAXSWatchQuickActionsStateDidChangeNotification)
      {
        v113 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v113, (CFNotificationName)kAXSWatchQuickActionsStateDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          v116 = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v117 = (const __CFString *)kAXSWatchQuickActionsStateDidChangeNotification;
LABEL_568:
          CFNotificationCenterPostNotification(v116, v117, 0, 0, 1u);
          goto LABEL_569;
        }
      }
      goto LABEL_569;
    }
    CFRelease(v108);
    goto LABEL_547;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.watch.quickactions.banner.appearance"))
  {
    char v210 = 1;
    CFNumberRef v110 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSWatchQuickActionBannerAppearancePreference, 0, &v210);
    CFNumberRef v111 = v110;
    if (v210 && v110)
    {
      CFTypeID v112 = CFGetTypeID(v110);
      if (v112 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v111, kCFNumberIntType, buf);
        _kAXSCacheWatchQuickActionBannerAppearance = *(_DWORD *)buf;
      }
    }
    else if (!v110)
    {
LABEL_557:
      if (kAXSWatchQuickActionBannerAppearanceDidChangeNotification)
      {
        v115 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v115, (CFNotificationName)kAXSWatchQuickActionBannerAppearanceDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSWatchQuickActionBannerAppearanceDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    CFRelease(v111);
    goto LABEL_557;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.watch.control.enabled"))
  {
    int v106 = _AXSWatchQuickActionsEnabled();
    if (CFEqual(*v3, @"com.apple.accessibility.cache.watch.control.enabled"))
    {
      _kAXSCacheWatchControlEnabled = _getBooleanPreference((const __CFString *)kAXSWatchControlEnabledPreference, 0);
      if (kAXSWatchControlEnabledDidChangeNotification)
      {
        v114 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v114, (CFNotificationName)kAXSWatchControlEnabledDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          v116 = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v117 = (const __CFString *)kAXSWatchControlEnabledDidChangeNotification;
          goto LABEL_568;
        }
      }
    }
LABEL_569:
    if (v106 != _AXSWatchQuickActionsEnabled())
    {
      DarwinNotifyCenter = CFNotificationCenterGetLocalCenter();
      CFStringRef v12 = (const __CFString *)kAXSWatchQuickActionsEnabledDidChangeNotification;
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.rosebud.logging.enabled"))
  {
    _kAXSCacheRosebudLoggingEnabled = _getBooleanPreference((const __CFString *)kAXSRosebudLoggingEnabledPreference, 0);
    goto LABEL_6;
  }
  if (!CFEqual(*v3, @"com.apple.accessibility.cache.speech.synth.options"))
  {
    if (CFEqual(*v3, @"com.apple.accessibility.cache.twice.remote.screen.enabled"))
    {
      _kAXSCacheTwiceRemoteScreenEnabled = _getBooleanPreference((const __CFString *)kAXSTwiceRemoteScreenEnabledPreference, 0);
      if (kAXSTwiceRemoteScreenNotification)
      {
        v121 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v121, (CFNotificationName)kAXSTwiceRemoteScreenNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSTwiceRemoteScreenNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.twice.remote.screen.platform"))
    {
      _kAXSCacheTwiceRemoteScreenPlatform = _getBooleanPreference((const __CFString *)kAXSTwiceRemoteScreenPlatformPreference, 0);
      if (kAXSTwiceRemoteScreenPlatformNotification)
      {
        v122 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v122, (CFNotificationName)kAXSTwiceRemoteScreenPlatformNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSTwiceRemoteScreenPlatformNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.carplay.enhance.text.legibility"))
    {
      _kAXSCacheCarPlayEnhanceTextLegibility = _getBooleanPreference(@"CarPlayEnhancedTextLegibilityEnabled", 0);
      if (kAXSCarPlayEnhanceTextLegibilityChangedNotification)
      {
        v123 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v123, (CFNotificationName)kAXSCarPlayEnhanceTextLegibilityChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSCarPlayEnhanceTextLegibilityChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.pse.mitigation"))
    {
      _kAXSCachePhotosensitiveMitigationEnabled = _getBooleanPreference(@"PhotosensitiveMitigation", 0);
      if (kAXSPhotosensitiveMitigationEnabledNotification)
      {
        v124 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v124, (CFNotificationName)kAXSPhotosensitiveMitigationEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSPhotosensitiveMitigationEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.pse.visual.debugging"))
    {
      _kAXSCachePhotosensitiveVisualDebuggingEnabled = _getBooleanPreference(@"PhotosensitiveVisualDebugging", 0);
      if (kAXSPhotosensitiveVisualDebuggingEnabledNotification)
      {
        v125 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v125, (CFNotificationName)kAXSPhotosensitiveVisualDebuggingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSPhotosensitiveVisualDebuggingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.pse.source.copy.debugging"))
    {
      _kAXSCachePhotosensitiveSourceCopyDebuggingEnabled = _getBooleanPreference(@"PhotosensitiveSourceCopyDebugging", 0);
      if (kAXSPhotosensitiveSourceCopyDebuggingEnabledNotification)
      {
        v126 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v126, (CFNotificationName)kAXSPhotosensitiveSourceCopyDebuggingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSPhotosensitiveSourceCopyDebuggingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.ax")
      || CFEqual(*v3, @"com.apple.accessibility.cache.app.ax"))
    {
      pthread_mutex_lock(&_AXSAccessibilityEnabledLock);
      _kAXSCacheAccessibilityEnabled = _getBooleanPreference((const __CFString *)kAXSAccessibilityEnabledPreference, 0);
      _kAXSCacheApplicationAccessibilityEnabled = _getBooleanPreference((const __CFString *)kAXSApplicationAccessibilityEnabledPreference, 0);
      v127 = AXSupportLogCommon();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
      {
        int v128 = CFEqual(*v3, @"com.apple.accessibility.cache.app.ax");
        *(_DWORD *)buf = 67109632;
        int v214 = v128;
        __int16 v215 = 1024;
        int v216 = _kAXSCacheAccessibilityEnabled;
        __int16 v217 = 1024;
        int v218 = _kAXSCacheApplicationAccessibilityEnabled;
        _os_log_impl(&dword_190274000, v127, OS_LOG_TYPE_INFO, "Update on AX Enabled Notification, App Notification: %d, AX Enabled: %d, AX App Enabled: %d", buf, 0x14u);
      }

      pthread_mutex_unlock(&_AXSAccessibilityEnabledLock);
      if (CFEqual(*v3, @"com.apple.accessibility.cache.ax"))
      {
        v129 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v129, (CFNotificationName)kAXSAccessibilityEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSAccessibilityEnabledNotification;
          goto LABEL_15;
        }
      }
      else if (CFEqual(*v3, @"com.apple.accessibility.cache.app.ax"))
      {
        v131 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v131, (CFNotificationName)kAXSApplicationAccessibilityEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSApplicationAccessibilityEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.large.text.change"))
    {
      _kAXSCachedPreferredFontSize = _getFloatPreference((const __CFString *)kAXSPreferredFontSizePreference, 0, 0);
      if (kAXSPreferredFontSizeChangedNotification)
      {
        v130 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v130, (CFNotificationName)kAXSPreferredFontSizeChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSPreferredFontSizeChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.vot.speaking.rate"))
    {
      _getFloatPreference((const __CFString *)kAXSVoiceOverTouchSpeakingRatePreference, 0, 0);
      if (kAXSVoiceOverTouchSpeakingRateChangedNotification)
      {
        v132 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v132, (CFNotificationName)kAXSVoiceOverTouchSpeakingRateChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSVoiceOverTouchSpeakingRateChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.vot.volume"))
    {
      _kAXSCachedVoiceOverVolume = _getFloatPreference((const __CFString *)kAXSVoiceOverTouchVolumePreference, 0, 0);
      if (kAXSVoiceOverTouchVolumeChangedNotification)
      {
        v133 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v133, (CFNotificationName)kAXSVoiceOverTouchVolumeChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSVoiceOverTouchVolumeChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.guided.access"))
    {
      _kAXSCacheGuidedAccessEnabled = _getBooleanPreference((const __CFString *)kAXSGuidedAccessEnabledPreference, 0);
      if (!kAXSGuidedAccessEnabledNotification) {
        goto LABEL_6;
      }
      v134 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v134, (CFNotificationName)kAXSGuidedAccessEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken == -1) {
        goto LABEL_672;
      }
      goto LABEL_671;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.gax.haspasscode"))
    {
      _kAXSCacheGuidedAccessHasPasscode = _getBooleanPreference((const __CFString *)kAXSGuidedAccessHasPasscodePreference, 0);
      if (kAXSGuidedAccessHasPasscodeNotification)
      {
        v135 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v135, (CFNotificationName)kAXSGuidedAccessHasPasscodeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSGuidedAccessHasPasscodeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.guided.access.via.mdm"))
    {
      _kAXSCacheGuidedAccessEnabledByManagedConfiguration = _getBooleanPreference((const __CFString *)kAXSGuidedAccessEnabledByManagedConfigurationPreference, 0);
      if (!kAXSGuidedAccessEnabledNotification) {
        goto LABEL_6;
      }
      v136 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v136, (CFNotificationName)kAXSGuidedAccessEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken == -1) {
        goto LABEL_672;
      }
LABEL_671:
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
LABEL_672:
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSGuidedAccessEnabledNotification;
        goto LABEL_15;
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.zoom.speakunderfinger"))
    {
      _kAXSCacheZoomSpeakUnderFingerEnabled = _getBooleanPreference((const __CFString *)kAXSZoomSpeakUnderFingerEnabledPreference, 0);
      if (kAXSZoomSpeakUnderFingerEnabledNotification)
      {
        v137 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v137, (CFNotificationName)kAXSZoomSpeakUnderFingerEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSZoomSpeakUnderFingerEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.zoom.smoothscaling"))
    {
      _kAXSCacheZoomTouchSmoothScalingDisabled = _getBooleanPreference((const __CFString *)kAXSZoomTouchSmoothScalingPreference, 0);
      if (kAXSZoomTouchSmoothScalingNotification)
      {
        v138 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v138, (CFNotificationName)kAXSZoomTouchSmoothScalingNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSZoomTouchSmoothScalingNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.zoom.readyForObservers"))
    {
      _kAXSCacheZoomTouchReadyForObservers = _getBooleanPreference((const __CFString *)kAXSZoomTouchReadyForObserversPreference, 0);
      if (kAXSZoomTouchReadyForObserversNotification)
      {
        v139 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v139, (CFNotificationName)kAXSZoomTouchReadyForObserversNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSZoomTouchReadyForObserversNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.switch.control"))
    {
      _kAXSCacheSwitchControlEnabled = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchScannerEnabledPreference, 0);
      if (kAXSAssistiveTouchScannerEnabledNotification)
      {
        v140 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v140, (CFNotificationName)kAXSAssistiveTouchScannerEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSAssistiveTouchScannerEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.dwell.control"))
    {
      _kAXSCacheDwellControlEnabled = _getBooleanPreference((const __CFString *)kAXSDwellControlEnabledPreference, 0);
      if (kAXSDwellControlEnabledNotification)
      {
        v141 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v141, (CFNotificationName)kAXSDwellControlEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSDwellControlEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.clarityui"))
    {
      _kAXSCacheClarityUIEnabled = _getBooleanPreference((const __CFString *)kAXSClarityUIEnabledPreference, 0);
      if (kAXSClarityUIEnabledNotification)
      {
        v142 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v142, (CFNotificationName)kAXSClarityUIEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSClarityUIEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.command.and.control"))
    {
      _kAXSCacheCommandAndControlEnabled = _getBooleanPreference((const __CFString *)kAXSCommandAndControlEnabledPreference, 0);
      if (kAXSCommandAndControlEnabledNotification)
      {
        v143 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v143, (CFNotificationName)kAXSCommandAndControlEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSCommandAndControlEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.command.and.control.carplay"))
    {
      _kAXSCacheCommandAndControlCarPlayEnabled = _getBooleanPreference((const __CFString *)kAXSCommandAndControlCarPlayEnabledPreference, 0);
      if (kAXSCommandAndControlCarPlayEnabledNotification)
      {
        v144 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v144, (CFNotificationName)kAXSCommandAndControlCarPlayEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSCommandAndControlCarPlayEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.speak.this"))
    {
      _kAXSCacheSpeakThisEnabled = _getBooleanPreference((const __CFString *)kAXSSpeakThisEnabledPreference, 0);
      if (kAXSSpeakThisEnabledNotification)
      {
        v145 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v145, (CFNotificationName)kAXSSpeakThisEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSSpeakThisEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.speak.this.highlight.visible"))
    {
      _kAXSCacheSpeakThisHighlightVisible = _getBooleanPreference((const __CFString *)kAXSSpeakThisHighlightVisiblePreference, 0);
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.generic.accessibility.client"))
    {
      _kAXSCacheGenericAccessibilityClientEnabled = _getBooleanPreference((const __CFString *)kAXSGenericAccessibilityClientEnabledPreference, 0);
      if (kAXSGenericAccessibilityClientEnabledNotification)
      {
        v146 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v146, (CFNotificationName)kAXSGenericAccessibilityClientEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSGenericAccessibilityClientEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.needs.camera.cache"))
    {
      _kAXSCacheNeedsCameraOnLockScreen = _getBooleanPreference((const __CFString *)kAXSAccessibilityNeedsCameraOnLockScreenPreference, 0);
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.needs.microphone.cache"))
    {
      _kAXSCacheNeedsMicrophoneOnLockScreen = _getBooleanPreference((const __CFString *)kAXSAccessibilityNeedsMicrophoneOnLockScreenPreference, 0);
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.full.keyboard.access"))
    {
      _kAXSCacheFullKeyboardAccessEnabled = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessEnabledPreference, 0);
      if (kAXSFullKeyboardAccessEnabledNotification)
      {
        v147 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v147, (CFNotificationName)kAXSFullKeyboardAccessEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSFullKeyboardAccessEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.full.keyboard.access.focus.ring"))
    {
      _kAXSCacheFullKeyboardAccessFocusRingEnabled = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessFocusRingEnabledPreference, 0);
      if (kAXSFullKeyboardAccessFocusRingEnabledNotification)
      {
        v148 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v148, (CFNotificationName)kAXSFullKeyboardAccessFocusRingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSFullKeyboardAccessFocusRingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.full.keyboard.access.passthrough.mode"))
    {
      _kAXSCacheFullKeyboardAccessPassthroughModeEnabled = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessPassthroughModeEnabledPreference, 0);
      if (kAXSFullKeyboardAccessPassthroughModeEnabledNotification)
      {
        v149 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v149, (CFNotificationName)kAXSFullKeyboardAccessPassthroughModeEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSFullKeyboardAccessPassthroughModeEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"_AXSCacheLiveTranscriptionNotification"))
    {
      _kAXSCacheLiveTranscriptionEnabled = _getBooleanPreference((const __CFString *)kAXSLiveTranscriptionEnabledPreference, 0);
      if (kAXSLiveTranscriptionEnabledDidChangeNotification)
      {
        v150 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v150, (CFNotificationName)kAXSLiveTranscriptionEnabledDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSLiveTranscriptionEnabledDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.ui.focus.ring"))
    {
      _kAXSCacheUIFocusRingEnabled = _getBooleanPreference((const __CFString *)kAXSUIFocusRingEnabledPreference, 0);
      if (kAXSUIFocusRingEnabledNotification)
      {
        v151 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v151, (CFNotificationName)kAXSUIFocusRingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSUIFocusRingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.non.blinking.cursor.status"))
    {
      _kAXSCachePrefersNonBlinkingCursorIndicator = _getBooleanPreference((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, 0);
      if (kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification)
      {
        v152 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v152, (CFNotificationName)kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.prefers.horizontal.text"))
    {
      CFStringRef v5 = (const __CFString *)kAXSPrefersHorizontalTextPreference;
      CFStringRef v6 = (const __CFString *)kAXSPrefersHorizontalTextNotification;
      uint64_t v7 = (int *)&_kAXSCachePrefersHorizontalText;
      goto LABEL_5;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.SpatialAudioHeadTracking.notification"))
    {
      char v210 = 1;
      CFNumberRef v153 = (const __CFNumber *)_copyValuePreferenceApp(@"AXSSpatialAudioHeadTracking", 0, &v210);
      CFNumberRef v154 = v153;
      if (v210 && v153)
      {
        CFTypeID v155 = CFGetTypeID(v153);
        if (v155 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v154, kCFNumberIntType, buf);
          _kAXSCacheSpatialAudioHeadTracking = *(int *)buf;
        }
      }
      else if (!v153)
      {
        goto LABEL_808;
      }
      CFRelease(v154);
LABEL_808:
      if (!kAXSAirPodSpatialAudioLockToDeviceChangedNotification) {
        goto LABEL_6;
      }
      v157 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v157, (CFNotificationName)kAXSAirPodSpatialAudioLockToDeviceChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken == -1) {
        goto LABEL_816;
      }
LABEL_815:
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
LABEL_816:
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v12 = (const __CFString *)kAXSAirPodSpatialAudioLockToDeviceChangedNotification;
        goto LABEL_15;
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.airpod.spatial.audio.lock.to.device"))
    {
      _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled = _getBooleanPreference(@"AXSAirPodsSpatialAudioLockToDevice", 0);
      if (!kAXSAirPodSpatialAudioLockToDeviceChangedNotification) {
        goto LABEL_6;
      }
      v156 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v156, (CFNotificationName)kAXSAirPodSpatialAudioLockToDeviceChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken == -1) {
        goto LABEL_816;
      }
      goto LABEL_815;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.pencil.extended.squeeze.range"))
    {
      _kAXSCachePencilExtendedSqueezeRangeEnabled = _getBooleanPreference(@"AXSPencilExtendedSqueezeRangeEnabledPreference", 0);
      if (kAXSPencilExtendedSqueezeRangeEnabledChangedNotification)
      {
        v158 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v158, (CFNotificationName)kAXSPencilExtendedSqueezeRangeEnabledChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSPencilExtendedSqueezeRangeEnabledChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.captioning"))
    {
      DarwinNotifyCenter = CFNotificationCenterGetLocalCenter();
      CFStringRef v12 = (const __CFString *)kAXSClosedCaptioningChangedNotification;
      goto LABEL_15;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.vo.usage.confirm"))
    {
      _kAXSCacheVoiceOverUsageConfirmation = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchUsageConfirmedPreference, 0);
      if (kAXSVoiceOverTouchUsageConfirmedNotification)
      {
        v159 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v159, (CFNotificationName)kAXSVoiceOverTouchUsageConfirmedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSVoiceOverTouchUsageConfirmedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.vo.user.has.read.no.home.button.gesture"))
    {
      _kAXSCacheVOTUserHasReadNoHomeButtonGesture = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchUserHasReadNoHomeButtonGesturePreference, 0);
      if (kAXSVoiceOverTouchUserHasReadNoHomeButtonGestureNotification)
      {
        v160 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v160, (CFNotificationName)kAXSVoiceOverTouchUserHasReadNoHomeButtonGestureNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSVoiceOverTouchUserHasReadNoHomeButtonGestureNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.vo.screen.curtain"))
    {
      _kAXSCacheVoiceOverScreenCurtain = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchScreenCurtainPreference, 0);
      if (kAXSVoiceOverTouchScreenCurtainNotification)
      {
        v161 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v161, (CFNotificationName)kAXSVoiceOverTouchScreenCurtainNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSVoiceOverTouchScreenCurtainNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.automation.localized.lookup"))
    {
      _kAXSCacheAutomationLocalizedStringLookup = _getBooleanPreference((const __CFString *)kAXSAutomationLocalizedStringLookupInfoEnabledPreference, 0);
      if (_kAXSAutomationLocalizedStringLookupInfoEnabledNotification)
      {
        v162 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v162, (CFNotificationName)_kAXSAutomationLocalizedStringLookupInfoEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)_kAXSAutomationLocalizedStringLookupInfoEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.resting.home.button.unlock"))
    {
      _kAXSCacheRestingHomeButtonUnlockEnabled = _getBooleanPreference((const __CFString *)kAXSRestingHomeButtonUnlockPreference, 0);
      if (kAXSRestingHomeButtonUnlockEnabledNotification)
      {
        v163 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v163, (CFNotificationName)kAXSRestingHomeButtonUnlockEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSRestingHomeButtonUnlockEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.passcode.purchases"))
    {
      _kAXSCachePasscodeForPurchases = _getBooleanPreference((const __CFString *)kAXSPasscodeForPurchasesPreference, 0);
      if (kAXSCachePasscodeForPurchasesNotification)
      {
        v164 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v164, (CFNotificationName)kAXSCachePasscodeForPurchasesNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSCachePasscodeForPurchasesNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.resting.pearl.unlock"))
    {
      _kAXSCacheRestingPearlUnlockEnabled = _getBooleanPreference((const __CFString *)kAXSRestingPearlUnlockPreference, 0);
      if (kAXSRestingPearlUnlockEnabledNotification)
      {
        v165 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v165, (CFNotificationName)kAXSRestingPearlUnlockEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSRestingPearlUnlockEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.perl.auth.haptics"))
    {
      _kAXSCachePearlAuthenticationHapticsEnabled = _getBooleanPreference((const __CFString *)kAXSPearlAuthenticationHapticsPreference, 0);
      if (kAXSPearlAuthenticationHapticsEnabledNotification)
      {
        v166 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v166, (CFNotificationName)kAXSPearlAuthenticationHapticsEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSPearlAuthenticationHapticsEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.attention.awareness"))
    {
      _kAXSCacheAttentionAwarenessFeaturesEnabled = _getBooleanPreference((const __CFString *)kAXSAttentionAwarenessFeaturesEnabledPreference, 0);
      if (kAXSAttentionAwarenessFeaturesEnabledNotification)
      {
        v167 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v167, (CFNotificationName)kAXSAttentionAwarenessFeaturesEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSAttentionAwarenessFeaturesEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.internal.axinspector"))
    {
      _kAXSCacheAXInspectorEnabled = _getBooleanPreference((const __CFString *)kAXSAXInspectorPreference, 0);
      if (kAXSAXInspectorEnabledNotification)
      {
        v168 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v168, (CFNotificationName)kAXSAXInspectorEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSAXInspectorEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.automation.enabled"))
    {
      _kAXSCacheAutomationEnabled = _getBooleanPreference((const __CFString *)kAXSAutomationEnabledPreference, 0);
      if (kAXSAutomationEnabledNotification)
      {
        v169 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v169, (CFNotificationName)kAXSAutomationEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSAutomationEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.siri.semantic.context.enabled"))
    {
      _kAXSCacheSiriSemanticContextEnabled = _getBooleanPreference((const __CFString *)kAXSSiriSemanticContextEnabledPreference, 0);
      if (kAXSSiriSemanticContextEnabledNotification)
      {
        v170 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v170, (CFNotificationName)kAXSSiriSemanticContextEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSSiriSemanticContextEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.clip.tracer.enabled"))
    {
      _kAXSCacheClipTracerAccessibilityModeEnabled = _getBooleanPreference((const __CFString *)kAXSClipTracerAccessibilityModeEnabledPreference, 0);
      if (kAXSClipTracerAccessibilityModeNotification)
      {
        v171 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v171, (CFNotificationName)kAXSClipTracerAccessibilityModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSClipTracerAccessibilityModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.nocturne.enabled"))
    {
      _kAXSCacheNocturneAccessibilityModeEnabled = _getBooleanPreference((const __CFString *)kAXSNocturneAccessibilityModeEnabledPreference, 0);
      if (kAXSNocturneAccessibilityModeNotification)
      {
        v172 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v172, (CFNotificationName)kAXSNocturneAccessibilityModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSNocturneAccessibilityModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.audit.inspection.mode"))
    {
      _kAXSCacheAuditInspectionModeModeEnabled = _getBooleanPreference((const __CFString *)kAXSAuditInspectionModeEnabledPreference, 0);
      if (kAXSAuditInspectionModeNotification)
      {
        v173 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v173, (CFNotificationName)kAXSAuditInspectionModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSAuditInspectionModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.lower.case.keyboard.enabled"))
    {
      _kAXSCacheLowercaseKeyboardEnabled = _getBooleanPreference((const __CFString *)kAXSLowerCaseKeyboardEnabledPreference, 0);
      if (kAXSLowercaseKeyboardDisplayPreferenceNotification)
      {
        v174 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v174, (CFNotificationName)kAXSLowercaseKeyboardDisplayPreferenceNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSLowercaseKeyboardDisplayPreferenceNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.forcetouch.sensitivity.changed"))
    {
      _kAXSCachedForceTouchSensitivity = _getFloatPreference((const __CFString *)kAXSForceTouchSensitivityPreference, 0, 0);
      if (kAXSForceTouchSensitivityChangedNotification)
      {
        v175 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v175, (CFNotificationName)kAXSForceTouchSensitivityChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSForceTouchSensitivityChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.forcetouch.timing.changed"))
    {
      char v210 = 1;
      CFNumberRef v176 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSForceTouchTimingPreference, 0, &v210);
      CFNumberRef v177 = v176;
      if (v210 && v176)
      {
        CFTypeID v178 = CFGetTypeID(v176);
        if (v178 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v177, kCFNumberIntType, buf);
          *(float *)&_kAXSCachedForceTouchTiming = (float)*(int *)buf;
        }
      }
      else if (!v176)
      {
LABEL_953:
        if (kAXSForceTouchTimingChangedNotification)
        {
          v180 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v180, (CFNotificationName)kAXSForceTouchTimingChangedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
          }
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFStringRef v12 = (const __CFString *)kAXSForceTouchTimingChangedNotification;
            goto LABEL_15;
          }
        }
        goto LABEL_6;
      }
      CFRelease(v177);
      goto LABEL_953;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.forcetouch.enabled.changed"))
    {
      _kAXSCachedForceTouchEnabled = _getBooleanPreference((const __CFString *)kAXSForceTouchEnabledPreference, 0);
      if (kAXSForceTouchEnabledPreferenceNotification)
      {
        v179 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v179, (CFNotificationName)kAXSForceTouchEnabledPreferenceNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSForceTouchEnabledPreferenceNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.hearing.aid.ringtone.streaming"))
    {
      _kAXSCacheHearingAidRingtonStreamingEnabled = _getBooleanPreference((const __CFString *)kAXSHearingAidRingtoneStreamingPreference, 0);
      if (kAXSHearingAidRingtoneStreamPreferenceChangedNotification)
      {
        v181 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v181, (CFNotificationName)kAXSHearingAidRingtoneStreamPreferenceChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSHearingAidRingtoneStreamPreferenceChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.automation.hitpoint_warping.enabled"))
    {
      _kAXSCacheAutomationHitpointWarpingEnabled = _getBooleanPreference((const __CFString *)kAXSAutomationHitpointWarpingEnabledPreference, 0);
      if (kAXSAutomationHitpointWarpingEnabledNotification)
      {
        v182 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v182, (CFNotificationName)kAXSAutomationHitpointWarpingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSAutomationHitpointWarpingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.AXSUSBRMDisablersNotification"))
    {
      char v210 = 1;
      CFNumberRef v183 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSUSBRMDisablersPreference, 0, &v210);
      CFNumberRef v184 = v183;
      if (v210 && v183)
      {
        CFTypeID v185 = CFGetTypeID(v183);
        if (v185 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v184, kCFNumberIntType, buf);
          _kAXSCacheUSBRMDisablers = *(_DWORD *)buf;
        }
      }
      else if (!v183)
      {
LABEL_987:
        if (kAXSUSBRMDisablersChangedNotification)
        {
          v187 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v187, (CFNotificationName)kAXSUSBRMDisablersChangedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
          }
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFStringRef v12 = (const __CFString *)kAXSUSBRMDisablersChangedNotification;
            goto LABEL_15;
          }
        }
        goto LABEL_6;
      }
      CFRelease(v184);
      goto LABEL_987;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.loc.caption.mode.enabled"))
    {
      _kAXSCacheLocalizationCaptionModeEnabled = _getBooleanPreference((const __CFString *)kAXSLocalizationCaptionModeEnabledPreference, 0);
      if (kAXSLocalizationCaptionModeNotification)
      {
        v186 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v186, (CFNotificationName)kAXSLocalizationCaptionModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSLocalizationCaptionModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.softwaretty"))
    {
      _kAXSCacheSoftwareTTYEnabled = _getBooleanPreference((const __CFString *)kAXSSoftwareTTYPreference, 0);
      if (kAXSSoftwareTTYChangedNotification)
      {
        v188 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v188, (CFNotificationName)kAXSSoftwareTTYChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSSoftwareTTYChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.homebuttonassistant"))
    {
      char v210 = 1;
      CFNumberRef v189 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSHomeButtonAssistantPreference, 0, &v210);
      CFNumberRef v190 = v189;
      if (v210 && v189)
      {
        CFTypeID v191 = CFGetTypeID(v189);
        if (v191 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v190, kCFNumberIntType, buf);
          _kAXSHomeButtonAssistant = *(_DWORD *)buf;
        }
      }
      else if (!v189)
      {
LABEL_1014:
        if (kAXSHomeButtonAssistantChangedNotification)
        {
          v193 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v193, (CFNotificationName)kAXSHomeButtonAssistantChangedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
          }
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFStringRef v12 = (const __CFString *)kAXSHomeButtonAssistantChangedNotification;
            goto LABEL_15;
          }
        }
        goto LABEL_6;
      }
      CFRelease(v190);
      goto LABEL_1014;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.switch.control.useextendedkeyboardpredictions"))
    {
      _kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled = _getBooleanPreference((const __CFString *)kAXSSwitchControlUseExtendedKeyboardPredictionsEnabledPreference, 0);
      if (kAXSSwitchControlUseExtendedKeyboardPredictionsChangedNotification)
      {
        v192 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v192, (CFNotificationName)kAXSSwitchControlUseExtendedKeyboardPredictionsChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSSwitchControlUseExtendedKeyboardPredictionsChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.assistivetouch.useextendedkeyboardpredictions"))
    {
      _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchUseExtendedKeyboardPredictionsEnabledPreference, 0);
      if (kAXSAssistiveTouchUseExtendedKeyboardPredictionsChangedNotification)
      {
        v194 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v194, (CFNotificationName)kAXSAssistiveTouchUseExtendedKeyboardPredictionsChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSAssistiveTouchUseExtendedKeyboardPredictionsChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.secure.intent.provider"))
    {
      char v210 = 1;
      CFNumberRef v195 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSSecureIntentProviderPreference, 0, &v210);
      CFNumberRef v196 = v195;
      if (v210 && v195)
      {
        CFTypeID v197 = CFGetTypeID(v195);
        if (v197 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v196, kCFNumberIntType, buf);
          _kAXSCacheSecureIntentProviderPreference = *(_DWORD *)buf;
        }
      }
      else if (!v195)
      {
LABEL_1039:
        if (kAXSSecureIntentProviderChangedNotification)
        {
          v198 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v198, (CFNotificationName)kAXSSecureIntentProviderChangedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
          }
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFStringRef v12 = (const __CFString *)kAXSSecureIntentProviderChangedNotification;
            goto LABEL_15;
          }
        }
        goto LABEL_6;
      }
      CFRelease(v196);
      goto LABEL_1039;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.hearing.aid.paired"))
    {
      _kAXSCacheHearingAidPaired = _getBooleanPreference((const __CFString *)kAXSHearingAidPairedPreference, 0);
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.performance.testing.mode"))
    {
      _kAXSCacheInPerformanceTestMode = _getBooleanPreference((const __CFString *)kAXSInPerformanceTestModePreference, 0);
      if (kAXSInPerformanceTestModeNotification)
      {
        v199 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v199, (CFNotificationName)kAXSInPerformanceTestModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSInPerformanceTestModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, @"com.apple.accessibility.cache.FaceTimeCaptions"))
    {
      _kAXSCacheFaceTimeCaptionsEnabled = _getBooleanPreference((const __CFString *)kAXSFaceTimeCaptionsPreference, 0);
      if (kAXFaceTimeCaptionsChangedNotification)
      {
        v200 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v200, (CFNotificationName)kAXFaceTimeCaptionsChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXFaceTimeCaptionsChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (!CFEqual(*v3, @"com.apple.accessibility.cache.vot.media.ducking.mode"))
    {
      if (CFEqual(*v3, @"com.apple.accessibility.cache.vo.usage.tutorial.confirm"))
      {
        _kAXSCacheVoiceOverTutorialUsageConfirmation = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchTutorialUsageConfirmedPreference, 0);
        if (kAXSVoiceOverTouchTutorialUsageConfirmedNotification)
        {
          v204 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v204, (CFNotificationName)kAXSVoiceOverTouchTutorialUsageConfirmedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
          }
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFStringRef v12 = (const __CFString *)kAXSVoiceOverTouchTutorialUsageConfirmedNotification;
            goto LABEL_15;
          }
        }
      }
      goto LABEL_6;
    }
    char v210 = 1;
    CFNumberRef v201 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchMediaDuckingModePreference, 0, &v210);
    CFNumberRef v202 = v201;
    if (v210 && v201)
    {
      CFTypeID v203 = CFGetTypeID(v201);
      if (v203 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v202, kCFNumberIntType, buf);
        _kAXSCachedVoiceOverMediaDuckingMode = *(int *)buf;
      }
    }
    else if (!v201)
    {
LABEL_1070:
      if (kAXSVoiceOverTouchMediaDuckingModeChangedNotification)
      {
        v205 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v205, (CFNotificationName)kAXSVoiceOverTouchMediaDuckingModeChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
        }
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFStringRef v12 = (const __CFString *)kAXSVoiceOverTouchMediaDuckingModeChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    CFRelease(v202);
    goto LABEL_1070;
  }
  char v210 = 1;
  CFNumberRef v118 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSSpeechSynthesisOptionsPreference, 0, &v210);
  CFNumberRef v119 = v118;
  if (v210 && v118)
  {
    CFTypeID v120 = CFGetTypeID(v118);
    if (v120 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v119, kCFNumberIntType, buf);
      _kAXSCacheSpeechSynthesisOptions = *(int *)buf;
    }
  }
  else if (!v118)
  {
    goto LABEL_6;
  }
  CFRelease(v119);
LABEL_6:
  if (CFEqual(*v3, @"com.apple.accessibility.cache.resting.home.button.unlock"))
  {
    CFTypeID v8 = AXSupportLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v214 = _kAXSCacheRestingHomeButtonUnlockEnabled;
      uint64_t v9 = "Received update for resting unlock: %d";
LABEL_19:
      _os_log_impl(&dword_190274000, v8, OS_LOG_TYPE_INFO, v9, buf, 8u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.automation.enabled"))
  {
    CFTypeID v8 = AXSupportLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v214 = _kAXSCacheAutomationEnabled;
      uint64_t v9 = "Received update for automation: %d";
      goto LABEL_19;
    }
LABEL_20:

    return;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.HasActive2DBrailleDisplay"))
  {
    _AXSVoiceOverTouchUpdateActive2DBrailleDisplays();
    return;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.speech.settings.disabled.by.mc"))
  {
    _kAXSCacheSpeechSettingsDisabledByManagedConfiguration = _getBooleanPreference((const __CFString *)kAXSSpeechSettingsDisabledByManagedConfigurationPreference, 0);
    long long v206 = 0u;
    long long v207 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    v211[0] = kAXSQuickSpeakEnabledNotification;
    v211[1] = kAXSSpeakThisEnabledNotification;
    v211[2] = kAXSWordFeedbackEnabledNotification;
    CFTypeID v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v211, 3, 0];
    uint64_t v14 = [v8 countByEnumeratingWithState:&v206 objects:v212 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v207;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v207 != v16) {
            objc_enumerationMutation(v8);
          }
          CFStringRef v18 = *(const __CFString **)(*((void *)&v206 + 1) + 8 * i);
          id v19 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v19, v18, 0, 0, 1u);
          id v20 = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(v20, v18, 0, 0, 1u);
        }
        uint64_t v15 = [v8 countByEnumeratingWithState:&v206 objects:v212 count:16];
      }
      while (v15);
    }
    goto LABEL_20;
  }
  if (CFEqual(*v3, @"com.apple.accessibility.cache.increase.brightness.floor.enabled"))
  {
    _kAXSCacheIncreaseBrightnessFloorEnabled = _getBooleanPreference((const __CFString *)kAXSIncreaseBrightnessFloorEnabledPreference, 0);
    if (kAXSIncreaseBrightnessFloorEnabledDidChangeNotification)
    {
      __int16 v22 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v22, (CFNotificationName)kAXSIncreaseBrightnessFloorEnabledDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        CFStringRef v23 = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v24 = (const __CFString *)kAXSIncreaseBrightnessFloorEnabledDidChangeNotification;
LABEL_65:
        CFNotificationCenterPostNotification(v23, v24, 0, 0, 1u);
      }
    }
  }
  else if (CFEqual(*v3, @"com.apple.accessibility.cache.mix.to.uplink.notification"))
  {
    _kAXSCacheAllowsMixToUplink = _getBooleanPreference(@"AXSAllowsMixToUplinkPreference", 0);
    if (kAXSAllowsMixToUplinkDidChangeNotification)
    {
      __int16 v26 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v26, (CFNotificationName)kAXSAllowsMixToUplinkDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
      }
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        CFStringRef v23 = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v24 = (const __CFString *)kAXSAllowsMixToUplinkDidChangeNotification;
        goto LABEL_65;
      }
    }
  }
}

__CFString *AXSystemRootDirectory()
{
  return @"/";
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return [@"/" stringByAppendingPathComponent:@"System/Library/AccessibilityBundles"];
}

id AXCBundle()
{
  dispatch_queue_t v0 = (void *)AXCBundle_CUBundle;
  if (!AXCBundle_CUBundle)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXCoreUtilities"];
    CFStringRef v2 = (void *)AXCBundle_CUBundle;
    AXCBundle_CUBundle = v1;

    dispatch_queue_t v0 = (void *)AXCBundle_CUBundle;
  }

  return v0;
}

id AXCLanguageToCanonicalPlistPath()
{
  dispatch_queue_t v0 = AXCBundle();
  uint64_t v1 = [v0 pathForResource:@"AXLanguageToLocale" ofType:@"plist"];

  return v1;
}

id AXCLanguageFallbackPlistPath()
{
  dispatch_queue_t v0 = AXCBundle();
  uint64_t v1 = [v0 pathForResource:@"AXLanguageToFallback" ofType:@"plist"];

  return v1;
}

id AXCLanguageToLocales()
{
  if (AXCLanguageToLocales_onceToken != -1) {
    dispatch_once(&AXCLanguageToLocales_onceToken, &__block_literal_global_0);
  }
  dispatch_queue_t v0 = (void *)AXCLanguageToLocales_LanguageToLangLocale;

  return v0;
}

void __AXCLanguageToLocales_block_invoke()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1C9E8]);
  AXCLanguageToCanonicalPlistPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 initWithContentsOfFile:v3];
  CFStringRef v2 = (void *)AXCLanguageToLocales_LanguageToLangLocale;
  AXCLanguageToLocales_LanguageToLangLocale = v1;
}

id AXCLanguageToFallbacks()
{
  if (AXCLanguageToFallbacks_onceToken != -1) {
    dispatch_once(&AXCLanguageToFallbacks_onceToken, &__block_literal_global_19);
  }
  id v0 = (void *)AXCLanguageToFallbacks_LanguageToFallback;

  return v0;
}

void __AXCLanguageToFallbacks_block_invoke()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1C9E8]);
  AXCLanguageFallbackPlistPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 initWithContentsOfFile:v3];
  CFStringRef v2 = (void *)AXCLanguageToFallbacks_LanguageToFallback;
  AXCLanguageToFallbacks_LanguageToFallback = v1;
}

uint64_t AXAccessibilityMacCatalystBundlesDirectory()
{
  return [@"/" stringByAppendingPathComponent:@"System/iOSSupport/System/Library/AccessibilityBundles"];
}

void AXBackgroundLog(void *a1, os_log_type_t a2, void *a3)
{
  CFStringRef v5 = a1;
  id v6 = a3;
  if (os_log_type_enabled(v5, a2))
  {
    if (_AXBackgroundLoggingQueue_onceToken != -1) {
      dispatch_once(&_AXBackgroundLoggingQueue_onceToken, &__block_literal_global_490);
    }
    uint64_t v7 = _AXBackgroundLoggingQueue__queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AXBackgroundLog_block_invoke;
    block[3] = &unk_1E568BE48;
    id v10 = v6;
    uint64_t v9 = v5;
    os_log_type_t v11 = a2;
    dispatch_async(v7, block);
  }
}

uint64_t __AXBackgroundLog_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

id AXLogCommon()
{
  if (AXLogCommon_onceToken != -1) {
    dispatch_once(&AXLogCommon_onceToken, &__block_literal_global_1);
  }
  id v0 = (void *)AXLogCommon___logObj;

  return v0;
}

uint64_t __AXLogCommon_block_invoke()
{
  AXLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXCommon");

  return MEMORY[0x1F41817F8]();
}

id AXRuntimeLogCommon()
{
  if (AXRuntimeLogCommon_onceToken != -1) {
    dispatch_once(&AXRuntimeLogCommon_onceToken, &__block_literal_global_7);
  }
  id v0 = (void *)AXRuntimeLogCommon___logObj;

  return v0;
}

uint64_t __AXRuntimeLogCommon_block_invoke()
{
  AXRuntimeLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXRuntimeCommon");

  return MEMORY[0x1F41817F8]();
}

id AXRuntimeLogPID()
{
  if (AXRuntimeLogPID_onceToken != -1) {
    dispatch_once(&AXRuntimeLogPID_onceToken, &__block_literal_global_10);
  }
  id v0 = (void *)AXRuntimeLogPID___logObj;

  return v0;
}

uint64_t __AXRuntimeLogPID_block_invoke()
{
  AXRuntimeLogPID___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXRuntimePID");

  return MEMORY[0x1F41817F8]();
}

id AXRuntimeLogNotifications()
{
  if (AXRuntimeLogNotifications_onceToken != -1) {
    dispatch_once(&AXRuntimeLogNotifications_onceToken, &__block_literal_global_13);
  }
  id v0 = (void *)AXRuntimeLogNotifications___logObj;

  return v0;
}

uint64_t __AXRuntimeLogNotifications_block_invoke()
{
  AXRuntimeLogNotifications___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXRuntimeNotifications");

  return MEMORY[0x1F41817F8]();
}

id AXRuntimeLogSerialization()
{
  if (AXRuntimeLogSerialization_onceToken != -1) {
    dispatch_once(&AXRuntimeLogSerialization_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)AXRuntimeLogSerialization___logObj;

  return v0;
}

uint64_t __AXRuntimeLogSerialization_block_invoke()
{
  AXRuntimeLogSerialization___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXRuntimeSerialization");

  return MEMORY[0x1F41817F8]();
}

id AXRuntimeLogElementFetcher()
{
  if (AXRuntimeLogElementFetcher_onceToken != -1) {
    dispatch_once(&AXRuntimeLogElementFetcher_onceToken, &__block_literal_global_19_0);
  }
  id v0 = (void *)AXRuntimeLogElementFetcher___logObj;

  return v0;
}

uint64_t __AXRuntimeLogElementFetcher_block_invoke()
{
  AXRuntimeLogElementFetcher___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXRuntimeElementFetcher");

  return MEMORY[0x1F41817F8]();
}

id AXTTSLogCommon()
{
  if (AXTTSLogCommon_onceToken != -1) {
    dispatch_once(&AXTTSLogCommon_onceToken, &__block_literal_global_22);
  }
  id v0 = (void *)AXTTSLogCommon___logObj;

  return v0;
}

uint64_t __AXTTSLogCommon_block_invoke()
{
  AXTTSLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTTSCommon");

  return MEMORY[0x1F41817F8]();
}

id AXTTSLogRange()
{
  if (AXTTSLogRange_onceToken != -1) {
    dispatch_once(&AXTTSLogRange_onceToken, &__block_literal_global_25);
  }
  id v0 = (void *)AXTTSLogRange___logObj;

  return v0;
}

uint64_t __AXTTSLogRange_block_invoke()
{
  AXTTSLogRange___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTTSRange");

  return MEMORY[0x1F41817F8]();
}

id AXTTSLogVoiceBank()
{
  if (AXTTSLogVoiceBank_onceToken != -1) {
    dispatch_once(&AXTTSLogVoiceBank_onceToken, &__block_literal_global_28);
  }
  id v0 = (void *)AXTTSLogVoiceBank___logObj;

  return v0;
}

uint64_t __AXTTSLogVoiceBank_block_invoke()
{
  AXTTSLogVoiceBank___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "TTSVB");

  return MEMORY[0x1F41817F8]();
}

id AXTTSLogResourceManager()
{
  if (AXTTSLogResourceManager_onceToken != -1) {
    dispatch_once(&AXTTSLogResourceManager_onceToken, &__block_literal_global_31);
  }
  id v0 = (void *)AXTTSLogResourceManager___logObj;

  return v0;
}

uint64_t __AXTTSLogResourceManager_block_invoke()
{
  AXTTSLogResourceManager___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTTSResourceManager");

  return MEMORY[0x1F41817F8]();
}

id AXTTSLogResourceMigration()
{
  if (AXTTSLogResourceMigration_onceToken != -1) {
    dispatch_once(&AXTTSLogResourceMigration_onceToken, &__block_literal_global_34);
  }
  id v0 = (void *)AXTTSLogResourceMigration___logObj;

  return v0;
}

uint64_t __AXTTSLogResourceMigration_block_invoke()
{
  AXTTSLogResourceMigration___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTTSResourceMigration");

  return MEMORY[0x1F41817F8]();
}

id AXTTSLogKona()
{
  if (AXTTSLogKona_onceToken != -1) {
    dispatch_once(&AXTTSLogKona_onceToken, &__block_literal_global_37);
  }
  id v0 = (void *)AXTTSLogKona___logObj;

  return v0;
}

uint64_t __AXTTSLogKona_block_invoke()
{
  AXTTSLogKona___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTTSKona");

  return MEMORY[0x1F41817F8]();
}

id AXLogEventTap()
{
  if (AXLogEventTap_onceToken != -1) {
    dispatch_once(&AXLogEventTap_onceToken, &__block_literal_global_40);
  }
  id v0 = (void *)AXLogEventTap___logObj;

  return v0;
}

uint64_t __AXLogEventTap_block_invoke()
{
  AXLogEventTap___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXEventTap");

  return MEMORY[0x1F41817F8]();
}

id AXLogIPC()
{
  if (AXLogIPC_onceToken != -1) {
    dispatch_once(&AXLogIPC_onceToken, &__block_literal_global_43);
  }
  id v0 = (void *)AXLogIPC___logObj;

  return v0;
}

uint64_t __AXLogIPC_block_invoke()
{
  AXLogIPC___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXIPC");

  return MEMORY[0x1F41817F8]();
}

id AXLogDisplay()
{
  if (AXLogDisplay_onceToken != -1) {
    dispatch_once(&AXLogDisplay_onceToken, &__block_literal_global_46);
  }
  id v0 = (void *)AXLogDisplay___logObj;

  return v0;
}

uint64_t __AXLogDisplay_block_invoke()
{
  AXLogDisplay___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXDisplay");

  return MEMORY[0x1F41817F8]();
}

id AXLogUserInterfaceService()
{
  if (AXLogUserInterfaceService_onceToken != -1) {
    dispatch_once(&AXLogUserInterfaceService_onceToken, &__block_literal_global_49);
  }
  id v0 = (void *)AXLogUserInterfaceService___logObj;

  return v0;
}

uint64_t __AXLogUserInterfaceService_block_invoke()
{
  AXLogUserInterfaceService___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXUserInterfaceService");

  return MEMORY[0x1F41817F8]();
}

id AXLogUIViewService()
{
  if (AXLogUIViewService_onceToken != -1) {
    dispatch_once(&AXLogUIViewService_onceToken, &__block_literal_global_52);
  }
  id v0 = (void *)AXLogUIViewService___logObj;

  return v0;
}

uint64_t __AXLogUIViewService_block_invoke()
{
  AXLogUIViewService___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXUIViewService");

  return MEMORY[0x1F41817F8]();
}

id AXLogBrokenHomeButton()
{
  if (AXLogBrokenHomeButton_onceToken != -1) {
    dispatch_once(&AXLogBrokenHomeButton_onceToken, &__block_literal_global_55);
  }
  id v0 = (void *)AXLogBrokenHomeButton___logObj;

  return v0;
}

uint64_t __AXLogBrokenHomeButton_block_invoke()
{
  AXLogBrokenHomeButton___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXBrokenHomeButton");

  return MEMORY[0x1F41817F8]();
}

id AXLogMIDI()
{
  if (AXLogMIDI_onceToken != -1) {
    dispatch_once(&AXLogMIDI_onceToken, &__block_literal_global_58);
  }
  id v0 = (void *)AXLogMIDI___logObj;

  return v0;
}

uint64_t __AXLogMIDI_block_invoke()
{
  AXLogMIDI___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMIDI");

  return MEMORY[0x1F41817F8]();
}

id AXLogDataMigrator()
{
  if (AXLogDataMigrator_onceToken != -1) {
    dispatch_once(&AXLogDataMigrator_onceToken, &__block_literal_global_61);
  }
  id v0 = (void *)AXLogDataMigrator___logObj;

  return v0;
}

uint64_t __AXLogDataMigrator_block_invoke()
{
  AXLogDataMigrator___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXDataMigrator");

  return MEMORY[0x1F41817F8]();
}

id AXLogDragging()
{
  if (AXLogDragging_onceToken != -1) {
    dispatch_once(&AXLogDragging_onceToken, &__block_literal_global_64);
  }
  id v0 = (void *)AXLogDragging___logObj;

  return v0;
}

uint64_t __AXLogDragging_block_invoke()
{
  AXLogDragging___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXDragging");

  return MEMORY[0x1F41817F8]();
}

id AXLogSettings()
{
  if (AXLogSettings_onceToken != -1) {
    dispatch_once(&AXLogSettings_onceToken, &__block_literal_global_67);
  }
  id v0 = (void *)AXLogSettings___logObj;

  return v0;
}

uint64_t __AXLogSettings_block_invoke()
{
  AXLogSettings___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSettings");

  return MEMORY[0x1F41817F8]();
}

id AXLogSiriShortcuts()
{
  if (AXLogSiriShortcuts_onceToken != -1) {
    dispatch_once(&AXLogSiriShortcuts_onceToken, &__block_literal_global_70);
  }
  id v0 = (void *)AXLogSiriShortcuts___logObj;

  return v0;
}

uint64_t __AXLogSiriShortcuts_block_invoke()
{
  AXLogSiriShortcuts___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSiriShortcuts");

  return MEMORY[0x1F41817F8]();
}

id AXLogAssertions()
{
  if (AXLogAssertions_onceToken != -1) {
    dispatch_once(&AXLogAssertions_onceToken, &__block_literal_global_73);
  }
  id v0 = (void *)AXLogAssertions___logObj;

  return v0;
}

uint64_t __AXLogAssertions_block_invoke()
{
  AXLogAssertions___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAssertions");

  return MEMORY[0x1F41817F8]();
}

id AXLogTimeProfile()
{
  if (AXLogTimeProfile_onceToken != -1) {
    dispatch_once(&AXLogTimeProfile_onceToken, &__block_literal_global_76);
  }
  id v0 = (void *)AXLogTimeProfile___logObj;

  return v0;
}

uint64_t __AXLogTimeProfile_block_invoke()
{
  AXLogTimeProfile___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTimeProfile");

  return MEMORY[0x1F41817F8]();
}

id AXLogMemoryProfile()
{
  if (AXLogMemoryProfile_onceToken != -1) {
    dispatch_once(&AXLogMemoryProfile_onceToken, &__block_literal_global_79);
  }
  id v0 = (void *)AXLogMemoryProfile___logObj;

  return v0;
}

uint64_t __AXLogMemoryProfile_block_invoke()
{
  AXLogMemoryProfile___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMemoryProfile");

  return MEMORY[0x1F41817F8]();
}

id AXLogLookingGlass()
{
  if (AXLogLookingGlass_onceToken != -1) {
    dispatch_once(&AXLogLookingGlass_onceToken, &__block_literal_global_82);
  }
  id v0 = (void *)AXLogLookingGlass___logObj;

  return v0;
}

uint64_t __AXLogLookingGlass_block_invoke()
{
  AXLogLookingGlass___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXLookingGlass");

  return MEMORY[0x1F41817F8]();
}

id AXLogLookingGlassUI()
{
  if (AXLogLookingGlassUI_onceToken != -1) {
    dispatch_once(&AXLogLookingGlassUI_onceToken, &__block_literal_global_85);
  }
  id v0 = (void *)AXLogLookingGlassUI___logObj;

  return v0;
}

uint64_t __AXLogLookingGlassUI_block_invoke()
{
  AXLogLookingGlassUI___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXLookingGlassUI");

  return MEMORY[0x1F41817F8]();
}

id AXLogAccessories()
{
  if (AXLogAccessories_onceToken != -1) {
    dispatch_once(&AXLogAccessories_onceToken, &__block_literal_global_88);
  }
  id v0 = (void *)AXLogAccessories___logObj;

  return v0;
}

uint64_t __AXLogAccessories_block_invoke()
{
  AXLogAccessories___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAccessories");

  return MEMORY[0x1F41817F8]();
}

id AXLogUI()
{
  if (AXLogUI_onceToken != -1) {
    dispatch_once(&AXLogUI_onceToken, &__block_literal_global_91);
  }
  id v0 = (void *)AXLogUI___logObj;

  return v0;
}

uint64_t __AXLogUI_block_invoke()
{
  AXLogUI___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXUI");

  return MEMORY[0x1F41817F8]();
}

id AXLogBackboardServer()
{
  if (AXLogBackboardServer_onceToken != -1) {
    dispatch_once(&AXLogBackboardServer_onceToken, &__block_literal_global_94);
  }
  id v0 = (void *)AXLogBackboardServer___logObj;

  return v0;
}

uint64_t __AXLogBackboardServer_block_invoke()
{
  AXLogBackboardServer___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXBackboardServer");

  return MEMORY[0x1F41817F8]();
}

id AXLogSpringboardServer()
{
  if (AXLogSpringboardServer_onceToken != -1) {
    dispatch_once(&AXLogSpringboardServer_onceToken, &__block_literal_global_97);
  }
  id v0 = (void *)AXLogSpringboardServer___logObj;

  return v0;
}

uint64_t __AXLogSpringboardServer_block_invoke()
{
  AXLogSpringboardServer___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSpringboardServer");

  return MEMORY[0x1F41817F8]();
}

id AXLogSystemApp()
{
  if (AXLogSystemApp_onceToken != -1) {
    dispatch_once(&AXLogSystemApp_onceToken, &__block_literal_global_100);
  }
  id v0 = (void *)AXLogSystemApp___logObj;

  return v0;
}

uint64_t __AXLogSystemApp_block_invoke()
{
  AXLogSystemApp___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSystemApp");

  return MEMORY[0x1F41817F8]();
}

id AXLogPhysicalInteraction()
{
  if (AXLogPhysicalInteraction_onceToken != -1) {
    dispatch_once(&AXLogPhysicalInteraction_onceToken, &__block_literal_global_103);
  }
  id v0 = (void *)AXLogPhysicalInteraction___logObj;

  return v0;
}

uint64_t __AXLogPhysicalInteraction_block_invoke()
{
  AXLogPhysicalInteraction___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXPhysicalInteraction");

  return MEMORY[0x1F41817F8]();
}

id AXLogAudioRouting()
{
  if (AXLogAudioRouting_onceToken != -1) {
    dispatch_once(&AXLogAudioRouting_onceToken, &__block_literal_global_106);
  }
  id v0 = (void *)AXLogAudioRouting___logObj;

  return v0;
}

uint64_t __AXLogAudioRouting_block_invoke()
{
  AXLogAudioRouting___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAudioRouting");

  return MEMORY[0x1F41817F8]();
}

id ASTLogCommon()
{
  if (ASTLogCommon_onceToken != -1) {
    dispatch_once(&ASTLogCommon_onceToken, &__block_literal_global_109);
  }
  id v0 = (void *)ASTLogCommon___logObj;

  return v0;
}

uint64_t __ASTLogCommon_block_invoke()
{
  ASTLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "ASTCommon");

  return MEMORY[0x1F41817F8]();
}

id ASTLogMouse()
{
  if (ASTLogMouse_onceToken != -1) {
    dispatch_once(&ASTLogMouse_onceToken, &__block_literal_global_112);
  }
  id v0 = (void *)ASTLogMouse___logObj;

  return v0;
}

uint64_t __ASTLogMouse_block_invoke()
{
  ASTLogMouse___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "ASTMouse");

  return MEMORY[0x1F41817F8]();
}

id AXLogAggregate()
{
  if (AXLogAggregate_onceToken != -1) {
    dispatch_once(&AXLogAggregate_onceToken, &__block_literal_global_115);
  }
  id v0 = (void *)AXLogAggregate___logObj;

  return v0;
}

uint64_t __AXLogAggregate_block_invoke()
{
  AXLogAggregate___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAggregate");

  return MEMORY[0x1F41817F8]();
}

id AXLogUIA()
{
  if (AXLogUIA_onceToken != -1) {
    dispatch_once(&AXLogUIA_onceToken, &__block_literal_global_118);
  }
  id v0 = (void *)AXLogUIA___logObj;

  return v0;
}

uint64_t __AXLogUIA_block_invoke()
{
  AXLogUIA___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXUIA");

  return MEMORY[0x1F41817F8]();
}

id AXLogLocCaptionPanel()
{
  if (AXLogLocCaptionPanel_onceToken != -1) {
    dispatch_once(&AXLogLocCaptionPanel_onceToken, &__block_literal_global_121);
  }
  id v0 = (void *)AXLogLocCaptionPanel___logObj;

  return v0;
}

uint64_t __AXLogLocCaptionPanel_block_invoke()
{
  AXLogLocCaptionPanel___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXLocCaptionPanel");

  return MEMORY[0x1F41817F8]();
}

id AXLogContextKit()
{
  if (AXLogContextKit_onceToken != -1) {
    dispatch_once(&AXLogContextKit_onceToken, &__block_literal_global_124);
  }
  id v0 = (void *)AXLogContextKit___logObj;

  return v0;
}

uint64_t __AXLogContextKit_block_invoke()
{
  AXLogContextKit___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXContextKit");

  return MEMORY[0x1F41817F8]();
}

id AXLogPronunciations()
{
  if (AXLogPronunciations_onceToken != -1) {
    dispatch_once(&AXLogPronunciations_onceToken, &__block_literal_global_127);
  }
  id v0 = (void *)AXLogPronunciations___logObj;

  return v0;
}

uint64_t __AXLogPronunciations_block_invoke()
{
  AXLogPronunciations___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXPronunciations");

  return MEMORY[0x1F41817F8]();
}

id AXLogBrailleHW()
{
  if (AXLogBrailleHW_onceToken != -1) {
    dispatch_once(&AXLogBrailleHW_onceToken, &__block_literal_global_130);
  }
  id v0 = (void *)AXLogBrailleHW___logObj;

  return v0;
}

uint64_t __AXLogBrailleHW_block_invoke()
{
  AXLogBrailleHW___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXBrailleHW");

  return MEMORY[0x1F41817F8]();
}

id AXLogBluetooth()
{
  if (AXLogBluetooth_onceToken != -1) {
    dispatch_once(&AXLogBluetooth_onceToken, &__block_literal_global_133);
  }
  id v0 = (void *)AXLogBluetooth___logObj;

  return v0;
}

uint64_t __AXLogBluetooth_block_invoke()
{
  AXLogBluetooth___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXBluetooth");

  return MEMORY[0x1F41817F8]();
}

id AXLogFocusEngine()
{
  if (AXLogFocusEngine_onceToken != -1) {
    dispatch_once(&AXLogFocusEngine_onceToken, &__block_literal_global_136);
  }
  id v0 = (void *)AXLogFocusEngine___logObj;

  return v0;
}

uint64_t __AXLogFocusEngine_block_invoke()
{
  AXLogFocusEngine___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXFocusEngine");

  return MEMORY[0x1F41817F8]();
}

id AXLogSoundBoard()
{
  if (AXLogSoundBoard_onceToken != -1) {
    dispatch_once(&AXLogSoundBoard_onceToken, &__block_literal_global_139);
  }
  id v0 = (void *)AXLogSoundBoard___logObj;

  return v0;
}

uint64_t __AXLogSoundBoard_block_invoke()
{
  AXLogSoundBoard___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSoundBoard");

  return MEMORY[0x1F41817F8]();
}

id FKALogCommon()
{
  if (FKALogCommon_onceToken != -1) {
    dispatch_once(&FKALogCommon_onceToken, &__block_literal_global_142);
  }
  id v0 = (void *)FKALogCommon___logObj;

  return v0;
}

uint64_t __FKALogCommon_block_invoke()
{
  FKALogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "FKACommon");

  return MEMORY[0x1F41817F8]();
}

id GAXLogCommon()
{
  if (GAXLogCommon_onceToken != -1) {
    dispatch_once(&GAXLogCommon_onceToken, &__block_literal_global_145);
  }
  id v0 = (void *)GAXLogCommon___logObj;

  return v0;
}

uint64_t __GAXLogCommon_block_invoke()
{
  GAXLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "GAXCommon");

  return MEMORY[0x1F41817F8]();
}

id GAXLogTimeRestrictions()
{
  if (GAXLogTimeRestrictions_onceToken != -1) {
    dispatch_once(&GAXLogTimeRestrictions_onceToken, &__block_literal_global_148);
  }
  id v0 = (void *)GAXLogTimeRestrictions___logObj;

  return v0;
}

uint64_t __GAXLogTimeRestrictions_block_invoke()
{
  GAXLogTimeRestrictions___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "GAXTimeRestrictions");

  return MEMORY[0x1F41817F8]();
}

id GAXLogIntegrity()
{
  if (GAXLogIntegrity_onceToken != -1) {
    dispatch_once(&GAXLogIntegrity_onceToken, &__block_literal_global_151);
  }
  id v0 = (void *)GAXLogIntegrity___logObj;

  return v0;
}

uint64_t __GAXLogIntegrity_block_invoke()
{
  GAXLogIntegrity___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "GAXIntegrity");

  return MEMORY[0x1F41817F8]();
}

id GAXLogAppLaunching()
{
  if (GAXLogAppLaunching_onceToken != -1) {
    dispatch_once(&GAXLogAppLaunching_onceToken, &__block_literal_global_154);
  }
  id v0 = (void *)GAXLogAppLaunching___logObj;

  return v0;
}

uint64_t __GAXLogAppLaunching_block_invoke()
{
  GAXLogAppLaunching___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "GAXAppLaunching");

  return MEMORY[0x1F41817F8]();
}

id GAXLogBlockedTouches()
{
  if (GAXLogBlockedTouches_onceToken != -1) {
    dispatch_once(&GAXLogBlockedTouches_onceToken, &__block_literal_global_157);
  }
  id v0 = (void *)GAXLogBlockedTouches___logObj;

  return v0;
}

uint64_t __GAXLogBlockedTouches_block_invoke()
{
  GAXLogBlockedTouches___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "GAXBlockedTouches");

  return MEMORY[0x1F41817F8]();
}

id AXLogInvertColors()
{
  if (AXLogInvertColors_onceToken != -1) {
    dispatch_once(&AXLogInvertColors_onceToken, &__block_literal_global_160);
  }
  id v0 = (void *)AXLogInvertColors___logObj;

  return v0;
}

uint64_t __AXLogInvertColors_block_invoke()
{
  AXLogInvertColors___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXInvertColors");

  return MEMORY[0x1F41817F8]();
}

id AXLogInvertColorsTraversal()
{
  if (AXLogInvertColorsTraversal_onceToken != -1) {
    dispatch_once(&AXLogInvertColorsTraversal_onceToken, &__block_literal_global_163);
  }
  id v0 = (void *)AXLogInvertColorsTraversal___logObj;

  return v0;
}

uint64_t __AXLogInvertColorsTraversal_block_invoke()
{
  AXLogInvertColorsTraversal___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXInvertColorsTraversal");

  return MEMORY[0x1F41817F8]();
}

id AXLogInvertColorsLoadBundles()
{
  if (AXLogInvertColorsLoadBundles_onceToken != -1) {
    dispatch_once(&AXLogInvertColorsLoadBundles_onceToken, &__block_literal_global_166);
  }
  id v0 = (void *)AXLogInvertColorsLoadBundles___logObj;

  return v0;
}

uint64_t __AXLogInvertColorsLoadBundles_block_invoke()
{
  AXLogInvertColorsLoadBundles___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXInvertColorsLoadBundles");

  return MEMORY[0x1F41817F8]();
}

id AXLogMuseAccessibility()
{
  if (AXLogMuseAccessibility_onceToken != -1) {
    dispatch_once(&AXLogMuseAccessibility_onceToken, &__block_literal_global_169);
  }
  id v0 = (void *)AXLogMuseAccessibility___logObj;

  return v0;
}

uint64_t __AXLogMuseAccessibility_block_invoke()
{
  AXLogMuseAccessibility___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMuseAccessibility");

  return MEMORY[0x1F41817F8]();
}

id AXLogAppAccessibility()
{
  if (AXLogAppAccessibility_onceToken != -1) {
    dispatch_once(&AXLogAppAccessibility_onceToken, &__block_literal_global_172);
  }
  id v0 = (void *)AXLogAppAccessibility___logObj;

  return v0;
}

uint64_t __AXLogAppAccessibility_block_invoke()
{
  AXLogAppAccessibility___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAppAccessibility");

  return MEMORY[0x1F41817F8]();
}

id AXLogAppCompareGeometry()
{
  if (AXLogAppCompareGeometry_onceToken != -1) {
    dispatch_once(&AXLogAppCompareGeometry_onceToken, &__block_literal_global_175);
  }
  id v0 = (void *)AXLogAppCompareGeometry___logObj;

  return v0;
}

uint64_t __AXLogAppCompareGeometry_block_invoke()
{
  AXLogAppCompareGeometry___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAppCompareGeometry");

  return MEMORY[0x1F41817F8]();
}

id AXLogValidations()
{
  if (AXLogValidations_onceToken != -1) {
    dispatch_once(&AXLogValidations_onceToken, &__block_literal_global_178);
  }
  id v0 = (void *)AXLogValidations___logObj;

  return v0;
}

uint64_t __AXLogValidations_block_invoke()
{
  AXLogValidations___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXValidations");

  return MEMORY[0x1F41817F8]();
}

id AXLogValidationRunner()
{
  if (AXLogValidationRunner_onceToken != -1) {
    dispatch_once(&AXLogValidationRunner_onceToken, &__block_literal_global_181);
  }
  id v0 = (void *)AXLogValidationRunner___logObj;

  return v0;
}

uint64_t __AXLogValidationRunner_block_invoke()
{
  AXLogValidationRunner___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXValidationRunner");

  return MEMORY[0x1F41817F8]();
}

id AXLogElementTraversal()
{
  if (AXLogElementTraversal_onceToken != -1) {
    dispatch_once(&AXLogElementTraversal_onceToken, &__block_literal_global_184);
  }
  id v0 = (void *)AXLogElementTraversal___logObj;

  return v0;
}

uint64_t __AXLogElementTraversal_block_invoke()
{
  AXLogElementTraversal___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXElementTraversal");

  return MEMORY[0x1F41817F8]();
}

id AXLogFirstElement()
{
  if (AXLogFirstElement_onceToken != -1) {
    dispatch_once(&AXLogFirstElement_onceToken, &__block_literal_global_187);
  }
  id v0 = (void *)AXLogFirstElement___logObj;

  return v0;
}

uint64_t __AXLogFirstElement_block_invoke()
{
  AXLogFirstElement___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXFirstElement");

  return MEMORY[0x1F41817F8]();
}

id AXLogHitTest()
{
  if (AXLogHitTest_onceToken != -1) {
    dispatch_once(&AXLogHitTest_onceToken, &__block_literal_global_190);
  }
  id v0 = (void *)AXLogHitTest___logObj;

  return v0;
}

uint64_t __AXLogHitTest_block_invoke()
{
  AXLogHitTest___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXHitTest");

  return MEMORY[0x1F41817F8]();
}

id AXLogScrollToVisible()
{
  if (AXLogScrollToVisible_onceToken != -1) {
    dispatch_once(&AXLogScrollToVisible_onceToken, &__block_literal_global_193);
  }
  id v0 = (void *)AXLogScrollToVisible___logObj;

  return v0;
}

uint64_t __AXLogScrollToVisible_block_invoke()
{
  AXLogScrollToVisible___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXScrollToVisible");

  return MEMORY[0x1F41817F8]();
}

id AXLogVisibleFrame()
{
  if (AXLogVisibleFrame_onceToken != -1) {
    dispatch_once(&AXLogVisibleFrame_onceToken, &__block_literal_global_196);
  }
  id v0 = (void *)AXLogVisibleFrame___logObj;

  return v0;
}

uint64_t __AXLogVisibleFrame_block_invoke()
{
  AXLogVisibleFrame___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXVisibleFrame");

  return MEMORY[0x1F41817F8]();
}

id AXLogOpaqueElements()
{
  if (AXLogOpaqueElements_onceToken != -1) {
    dispatch_once(&AXLogOpaqueElements_onceToken, &__block_literal_global_199);
  }
  id v0 = (void *)AXLogOpaqueElements___logObj;

  return v0;
}

uint64_t __AXLogOpaqueElements_block_invoke()
{
  AXLogOpaqueElements___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXOpaqueElements");

  return MEMORY[0x1F41817F8]();
}

id AXLogLoading()
{
  if (AXLogLoading_onceToken != -1) {
    dispatch_once(&AXLogLoading_onceToken, &__block_literal_global_202);
  }
  id v0 = (void *)AXLogLoading___logObj;

  return v0;
}

uint64_t __AXLogLoading_block_invoke()
{
  AXLogLoading___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXLoading");

  return MEMORY[0x1F41817F8]();
}

id AXLogVectorKit()
{
  if (AXLogVectorKit_onceToken != -1) {
    dispatch_once(&AXLogVectorKit_onceToken, &__block_literal_global_205);
  }
  id v0 = (void *)AXLogVectorKit___logObj;

  return v0;
}

uint64_t __AXLogVectorKit_block_invoke()
{
  AXLogVectorKit___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXVectorKit");

  return MEMORY[0x1F41817F8]();
}

id AXLogRemoteElement()
{
  if (AXLogRemoteElement_onceToken != -1) {
    dispatch_once(&AXLogRemoteElement_onceToken, &__block_literal_global_208);
  }
  id v0 = (void *)AXLogRemoteElement___logObj;

  return v0;
}

uint64_t __AXLogRemoteElement_block_invoke()
{
  AXLogRemoteElement___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXRemoteElement");

  return MEMORY[0x1F41817F8]();
}

id AXLogEscape()
{
  if (AXLogEscape_onceToken != -1) {
    dispatch_once(&AXLogEscape_onceToken, &__block_literal_global_211);
  }
  id v0 = (void *)AXLogEscape___logObj;

  return v0;
}

uint64_t __AXLogEscape_block_invoke()
{
  AXLogEscape___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXEscape");

  return MEMORY[0x1F41817F8]();
}

id MAGLogCommon()
{
  if (MAGLogCommon_onceToken != -1) {
    dispatch_once(&MAGLogCommon_onceToken, &__block_literal_global_214);
  }
  id v0 = (void *)MAGLogCommon___logObj;

  return v0;
}

uint64_t __MAGLogCommon_block_invoke()
{
  MAGLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "MAGCommon");

  return MEMORY[0x1F41817F8]();
}

id MAGLogBrightness()
{
  if (MAGLogBrightness_onceToken != -1) {
    dispatch_once(&MAGLogBrightness_onceToken, &__block_literal_global_217);
  }
  id v0 = (void *)MAGLogBrightness___logObj;

  return v0;
}

uint64_t __MAGLogBrightness_block_invoke()
{
  MAGLogBrightness___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "MAGBrightness");

  return MEMORY[0x1F41817F8]();
}

id AXLogMotionCues()
{
  if (AXLogMotionCues_onceToken != -1) {
    dispatch_once(&AXLogMotionCues_onceToken, &__block_literal_global_220);
  }
  id v0 = (void *)AXLogMotionCues___logObj;

  return v0;
}

uint64_t __AXLogMotionCues_block_invoke()
{
  AXLogMotionCues___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMotionCues");

  return MEMORY[0x1F41817F8]();
}

id AXLogSpeechAssetDownload()
{
  if (AXLogSpeechAssetDownload_onceToken != -1) {
    dispatch_once(&AXLogSpeechAssetDownload_onceToken, &__block_literal_global_223);
  }
  id v0 = (void *)AXLogSpeechAssetDownload___logObj;

  return v0;
}

uint64_t __AXLogSpeechAssetDownload_block_invoke()
{
  AXLogSpeechAssetDownload___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSpeechAssetDownload");

  return MEMORY[0x1F41817F8]();
}

id AXLogCharacterVoices()
{
  if (AXLogCharacterVoices_onceToken != -1) {
    dispatch_once(&AXLogCharacterVoices_onceToken, &__block_literal_global_226);
  }
  id v0 = (void *)AXLogCharacterVoices___logObj;

  return v0;
}

uint64_t __AXLogCharacterVoices_block_invoke()
{
  AXLogCharacterVoices___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXCharacterVoices");

  return MEMORY[0x1F41817F8]();
}

id AXLogSpeechSynthesis()
{
  if (AXLogSpeechSynthesis_onceToken != -1) {
    dispatch_once(&AXLogSpeechSynthesis_onceToken, &__block_literal_global_229);
  }
  id v0 = (void *)AXLogSpeechSynthesis___logObj;

  return v0;
}

uint64_t __AXLogSpeechSynthesis_block_invoke()
{
  AXLogSpeechSynthesis___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSpeechSynthesis");

  return MEMORY[0x1F41817F8]();
}

id AXLogOrator()
{
  if (AXLogOrator_onceToken != -1) {
    dispatch_once(&AXLogOrator_onceToken, &__block_literal_global_232);
  }
  id v0 = (void *)AXLogOrator___logObj;

  return v0;
}

uint64_t __AXLogOrator_block_invoke()
{
  AXLogOrator___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXOrator");

  return MEMORY[0x1F41817F8]();
}

id AXLogSpeakSelection()
{
  if (AXLogSpeakSelection_onceToken != -1) {
    dispatch_once(&AXLogSpeakSelection_onceToken, &__block_literal_global_235);
  }
  id v0 = (void *)AXLogSpeakSelection___logObj;

  return v0;
}

uint64_t __AXLogSpeakSelection_block_invoke()
{
  AXLogSpeakSelection___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSpeakSelection");

  return MEMORY[0x1F41817F8]();
}

id AXLogSpeakTyping()
{
  if (AXLogSpeakTyping_onceToken != -1) {
    dispatch_once(&AXLogSpeakTyping_onceToken, &__block_literal_global_238);
  }
  id v0 = (void *)AXLogSpeakTyping___logObj;

  return v0;
}

uint64_t __AXLogSpeakTyping_block_invoke()
{
  AXLogSpeakTyping___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSpeakTyping");

  return MEMORY[0x1F41817F8]();
}

id AXLogSpeakScreen()
{
  if (AXLogSpeakScreen_onceToken != -1) {
    dispatch_once(&AXLogSpeakScreen_onceToken, &__block_literal_global_241);
  }
  id v0 = (void *)AXLogSpeakScreen___logObj;

  return v0;
}

uint64_t __AXLogSpeakScreen_block_invoke()
{
  AXLogSpeakScreen___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSpeakScreen");

  return MEMORY[0x1F41817F8]();
}

id AXLogSpeakFingerManager()
{
  if (AXLogSpeakFingerManager_onceToken != -1) {
    dispatch_once(&AXLogSpeakFingerManager_onceToken, &__block_literal_global_244);
  }
  id v0 = (void *)AXLogSpeakFingerManager___logObj;

  return v0;
}

uint64_t __AXLogSpeakFingerManager_block_invoke()
{
  AXLogSpeakFingerManager___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSpeakFingerManager");

  return MEMORY[0x1F41817F8]();
}

id AXLogSpokenContentTextProcessing()
{
  if (AXLogSpokenContentTextProcessing_onceToken != -1) {
    dispatch_once(&AXLogSpokenContentTextProcessing_onceToken, &__block_literal_global_247);
  }
  id v0 = (void *)AXLogSpokenContentTextProcessing___logObj;

  return v0;
}

uint64_t __AXLogSpokenContentTextProcessing_block_invoke()
{
  AXLogSpokenContentTextProcessing___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSpokenContentTextProcessing");

  return MEMORY[0x1F41817F8]();
}

id SWCHLogCommon()
{
  if (SWCHLogCommon_onceToken != -1) {
    dispatch_once(&SWCHLogCommon_onceToken, &__block_literal_global_250);
  }
  id v0 = (void *)SWCHLogCommon___logObj;

  return v0;
}

uint64_t __SWCHLogCommon_block_invoke()
{
  SWCHLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "SWCHCommon");

  return MEMORY[0x1F41817F8]();
}

id SWCHLogElementNav()
{
  if (SWCHLogElementNav_onceToken != -1) {
    dispatch_once(&SWCHLogElementNav_onceToken, &__block_literal_global_253);
  }
  id v0 = (void *)SWCHLogElementNav___logObj;

  return v0;
}

uint64_t __SWCHLogElementNav_block_invoke()
{
  SWCHLogElementNav___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "SWCHElementNav");

  return MEMORY[0x1F41817F8]();
}

id SWCHLogPauseResume()
{
  if (SWCHLogPauseResume_onceToken != -1) {
    dispatch_once(&SWCHLogPauseResume_onceToken, &__block_literal_global_256);
  }
  id v0 = (void *)SWCHLogPauseResume___logObj;

  return v0;
}

uint64_t __SWCHLogPauseResume_block_invoke()
{
  SWCHLogPauseResume___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "SWCHPauseResume");

  return MEMORY[0x1F41817F8]();
}

id SWCHLogHW()
{
  if (SWCHLogHW_onceToken != -1) {
    dispatch_once(&SWCHLogHW_onceToken, &__block_literal_global_259);
  }
  id v0 = (void *)SWCHLogHW___logObj;

  return v0;
}

uint64_t __SWCHLogHW_block_invoke()
{
  SWCHLogHW___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "SWCHHW");

  return MEMORY[0x1F41817F8]();
}

id SWCHLogMenu()
{
  if (SWCHLogMenu_onceToken != -1) {
    dispatch_once(&SWCHLogMenu_onceToken, &__block_literal_global_262);
  }
  id v0 = (void *)SWCHLogMenu___logObj;

  return v0;
}

uint64_t __SWCHLogMenu_block_invoke()
{
  SWCHLogMenu___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "SWCHMenu");

  return MEMORY[0x1F41817F8]();
}

id AXLogTapticTime()
{
  if (AXLogTapticTime_onceToken != -1) {
    dispatch_once(&AXLogTapticTime_onceToken, &__block_literal_global_265);
  }
  id v0 = (void *)AXLogTapticTime___logObj;

  return v0;
}

uint64_t __AXLogTapticTime_block_invoke()
{
  AXLogTapticTime___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTapticTime");

  return MEMORY[0x1F41817F8]();
}

id AXLogTouchAccommodations()
{
  if (AXLogTouchAccommodations_onceToken != -1) {
    dispatch_once(&AXLogTouchAccommodations_onceToken, &__block_literal_global_268);
  }
  id v0 = (void *)AXLogTouchAccommodations___logObj;

  return v0;
}

uint64_t __AXLogTouchAccommodations_block_invoke()
{
  AXLogTouchAccommodations___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTouchAccommodations");

  return MEMORY[0x1F41817F8]();
}

id AXLogIDS()
{
  if (AXLogIDS_onceToken != -1) {
    dispatch_once(&AXLogIDS_onceToken, &__block_literal_global_271);
  }
  id v0 = (void *)AXLogIDS___logObj;

  return v0;
}

uint64_t __AXLogIDS_block_invoke()
{
  AXLogIDS___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXIDS");

  return MEMORY[0x1F41817F8]();
}

id VOTLogCommon()
{
  if (VOTLogCommon_onceToken != -1) {
    dispatch_once(&VOTLogCommon_onceToken, &__block_literal_global_274);
  }
  id v0 = (void *)VOTLogCommon___logObj;

  return v0;
}

uint64_t __VOTLogCommon_block_invoke()
{
  VOTLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTCommon");

  return MEMORY[0x1F41817F8]();
}

id VOTLogLayoutChange()
{
  if (VOTLogLayoutChange_onceToken != -1) {
    dispatch_once(&VOTLogLayoutChange_onceToken, &__block_literal_global_277);
  }
  id v0 = (void *)VOTLogLayoutChange___logObj;

  return v0;
}

uint64_t __VOTLogLayoutChange_block_invoke()
{
  VOTLogLayoutChange___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTLayoutChange");

  return MEMORY[0x1F41817F8]();
}

id VOTLogHandwriting()
{
  if (VOTLogHandwriting_onceToken != -1) {
    dispatch_once(&VOTLogHandwriting_onceToken, &__block_literal_global_280);
  }
  id v0 = (void *)VOTLogHandwriting___logObj;

  return v0;
}

uint64_t __VOTLogHandwriting_block_invoke()
{
  VOTLogHandwriting___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTHandwriting");

  return MEMORY[0x1F41817F8]();
}

id VOTLogSpeech()
{
  if (VOTLogSpeech_onceToken != -1) {
    dispatch_once(&VOTLogSpeech_onceToken, &__block_literal_global_283);
  }
  id v0 = (void *)VOTLogSpeech___logObj;

  return v0;
}

uint64_t __VOTLogSpeech_block_invoke()
{
  VOTLogSpeech___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTSpeech");

  return MEMORY[0x1F41817F8]();
}

id VOTLogICloud()
{
  if (VOTLogICloud_onceToken != -1) {
    dispatch_once(&VOTLogICloud_onceToken, &__block_literal_global_286);
  }
  id v0 = (void *)VOTLogICloud___logObj;

  return v0;
}

uint64_t __VOTLogICloud_block_invoke()
{
  VOTLogICloud___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTICloud");

  return MEMORY[0x1F41817F8]();
}

id VOTLogAudio()
{
  if (VOTLogAudio_onceToken != -1) {
    dispatch_once(&VOTLogAudio_onceToken, &__block_literal_global_289);
  }
  id v0 = (void *)VOTLogAudio___logObj;

  return v0;
}

uint64_t __VOTLogAudio_block_invoke()
{
  VOTLogAudio___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTAudio");

  return MEMORY[0x1F41817F8]();
}

id VOTLogElement()
{
  if (VOTLogElement_onceToken != -1) {
    dispatch_once(&VOTLogElement_onceToken, &__block_literal_global_292);
  }
  id v0 = (void *)VOTLogElement___logObj;

  return v0;
}

uint64_t __VOTLogElement_block_invoke()
{
  VOTLogElement___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTElement");

  return MEMORY[0x1F41817F8]();
}

id VOTLogEvent()
{
  if (VOTLogEvent_onceToken != -1) {
    dispatch_once(&VOTLogEvent_onceToken, &__block_literal_global_295);
  }
  id v0 = (void *)VOTLogEvent___logObj;

  return v0;
}

uint64_t __VOTLogEvent_block_invoke()
{
  VOTLogEvent___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTEvent");

  return MEMORY[0x1F41817F8]();
}

id VOTLogBraille()
{
  if (VOTLogBraille_onceToken != -1) {
    dispatch_once(&VOTLogBraille_onceToken, &__block_literal_global_298);
  }
  id v0 = (void *)VOTLogBraille___logObj;

  return v0;
}

uint64_t __VOTLogBraille_block_invoke()
{
  VOTLogBraille___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTBraille");

  return MEMORY[0x1F41817F8]();
}

id VOTLogBrailleGestures()
{
  if (VOTLogBrailleGestures_onceToken != -1) {
    dispatch_once(&VOTLogBrailleGestures_onceToken, &__block_literal_global_301);
  }
  id v0 = (void *)VOTLogBrailleGestures___logObj;

  return v0;
}

uint64_t __VOTLogBrailleGestures_block_invoke()
{
  VOTLogBrailleGestures___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTBrailleGestures");

  return MEMORY[0x1F41817F8]();
}

id VOTLogNotifications()
{
  if (VOTLogNotifications_onceToken != -1) {
    dispatch_once(&VOTLogNotifications_onceToken, &__block_literal_global_304);
  }
  id v0 = (void *)VOTLogNotifications___logObj;

  return v0;
}

uint64_t __VOTLogNotifications_block_invoke()
{
  VOTLogNotifications___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTNotifications");

  return MEMORY[0x1F41817F8]();
}

id VOTLogKeyboard()
{
  if (VOTLogKeyboard_onceToken != -1) {
    dispatch_once(&VOTLogKeyboard_onceToken, &__block_literal_global_307);
  }
  id v0 = (void *)VOTLogKeyboard___logObj;

  return v0;
}

uint64_t __VOTLogKeyboard_block_invoke()
{
  VOTLogKeyboard___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTKeyboard");

  return MEMORY[0x1F41817F8]();
}

id VOTLogTVFocus()
{
  if (VOTLogTVFocus_onceToken != -1) {
    dispatch_once(&VOTLogTVFocus_onceToken, &__block_literal_global_310);
  }
  id v0 = (void *)VOTLogTVFocus___logObj;

  return v0;
}

uint64_t __VOTLogTVFocus_block_invoke()
{
  VOTLogTVFocus___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTTVFocus");

  return MEMORY[0x1F41817F8]();
}

id VOTLogTVExplorer()
{
  if (VOTLogTVExplorer_onceToken != -1) {
    dispatch_once(&VOTLogTVExplorer_onceToken, &__block_literal_global_313);
  }
  id v0 = (void *)VOTLogTVExplorer___logObj;

  return v0;
}

uint64_t __VOTLogTVExplorer_block_invoke()
{
  VOTLogTVExplorer___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTTVExplorer");

  return MEMORY[0x1F41817F8]();
}

id VOTLogIAP()
{
  if (VOTLogIAP_onceToken != -1) {
    dispatch_once(&VOTLogIAP_onceToken, &__block_literal_global_316);
  }
  id v0 = (void *)VOTLogIAP___logObj;

  return v0;
}

uint64_t __VOTLogIAP_block_invoke()
{
  VOTLogIAP___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTIAP");

  return MEMORY[0x1F41817F8]();
}

id VOTLogLifeCycle()
{
  if (VOTLogLifeCycle_onceToken != -1) {
    dispatch_once(&VOTLogLifeCycle_onceToken, &__block_literal_global_319);
  }
  id v0 = (void *)VOTLogLifeCycle___logObj;

  return v0;
}

uint64_t __VOTLogLifeCycle_block_invoke()
{
  VOTLogLifeCycle___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTLifeCycle");

  return MEMORY[0x1F41817F8]();
}

id VOTLogMagicTap()
{
  if (VOTLogMagicTap_onceToken != -1) {
    dispatch_once(&VOTLogMagicTap_onceToken, &__block_literal_global_322);
  }
  id v0 = (void *)VOTLogMagicTap___logObj;

  return v0;
}

uint64_t __VOTLogMagicTap_block_invoke()
{
  VOTLogMagicTap___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTMagicTap");

  return MEMORY[0x1F41817F8]();
}

id VOTLogRotor()
{
  if (VOTLogRotor_onceToken != -1) {
    dispatch_once(&VOTLogRotor_onceToken, &__block_literal_global_325);
  }
  id v0 = (void *)VOTLogRotor___logObj;

  return v0;
}

uint64_t __VOTLogRotor_block_invoke()
{
  VOTLogRotor___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTRotor");

  return MEMORY[0x1F41817F8]();
}

id VOTLogQuickSettings()
{
  if (VOTLogQuickSettings_onceToken != -1) {
    dispatch_once(&VOTLogQuickSettings_onceToken, &__block_literal_global_328);
  }
  id v0 = (void *)VOTLogQuickSettings___logObj;

  return v0;
}

uint64_t __VOTLogQuickSettings_block_invoke()
{
  VOTLogQuickSettings___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTQuickSettings");

  return MEMORY[0x1F41817F8]();
}

id VOTLogSimpleTap()
{
  if (VOTLogSimpleTap_onceToken != -1) {
    dispatch_once(&VOTLogSimpleTap_onceToken, &__block_literal_global_331);
  }
  id v0 = (void *)VOTLogSimpleTap___logObj;

  return v0;
}

uint64_t __VOTLogSimpleTap_block_invoke()
{
  VOTLogSimpleTap___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTSimpleTap");

  return MEMORY[0x1F41817F8]();
}

id AXLogPunctuationStorage()
{
  if (AXLogPunctuationStorage_onceToken != -1) {
    dispatch_once(&AXLogPunctuationStorage_onceToken, &__block_literal_global_334);
  }
  id v0 = (void *)AXLogPunctuationStorage___logObj;

  return v0;
}

uint64_t __AXLogPunctuationStorage_block_invoke()
{
  AXLogPunctuationStorage___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXPunctuationStorage");

  return MEMORY[0x1F41817F8]();
}

id VOTLogActivities()
{
  if (VOTLogActivities_onceToken != -1) {
    dispatch_once(&VOTLogActivities_onceToken, &__block_literal_global_337);
  }
  id v0 = (void *)VOTLogActivities___logObj;

  return v0;
}

uint64_t __VOTLogActivities_block_invoke()
{
  VOTLogActivities___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTActivities");

  return MEMORY[0x1F41817F8]();
}

id VOTLogWebPageMovement()
{
  if (VOTLogWebPageMovement_onceToken != -1) {
    dispatch_once(&VOTLogWebPageMovement_onceToken, &__block_literal_global_340);
  }
  id v0 = (void *)VOTLogWebPageMovement___logObj;

  return v0;
}

uint64_t __VOTLogWebPageMovement_block_invoke()
{
  VOTLogWebPageMovement___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTWebPageMovement");

  return MEMORY[0x1F41817F8]();
}

id VOTLogCommands()
{
  if (VOTLogCommands_onceToken != -1) {
    dispatch_once(&VOTLogCommands_onceToken, &__block_literal_global_343);
  }
  id v0 = (void *)VOTLogCommands___logObj;

  return v0;
}

uint64_t __VOTLogCommands_block_invoke()
{
  VOTLogCommands___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTCommands");

  return MEMORY[0x1F41817F8]();
}

id VOTLogImageExplorer()
{
  if (VOTLogImageExplorer_onceToken != -1) {
    dispatch_once(&VOTLogImageExplorer_onceToken, &__block_literal_global_346);
  }
  id v0 = (void *)VOTLogImageExplorer___logObj;

  return v0;
}

uint64_t __VOTLogImageExplorer_block_invoke()
{
  VOTLogImageExplorer___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "VOTImageExplorer");

  return MEMORY[0x1F41817F8]();
}

id AXLogVisualAlerts()
{
  if (AXLogVisualAlerts_onceToken != -1) {
    dispatch_once(&AXLogVisualAlerts_onceToken, &__block_literal_global_349);
  }
  id v0 = (void *)AXLogVisualAlerts___logObj;

  return v0;
}

uint64_t __AXLogVisualAlerts_block_invoke()
{
  AXLogVisualAlerts___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXVisualAlerts");

  return MEMORY[0x1F41817F8]();
}

id AXLogRTT()
{
  if (AXLogRTT_onceToken != -1) {
    dispatch_once(&AXLogRTT_onceToken, &__block_literal_global_352);
  }
  id v0 = (void *)AXLogRTT___logObj;

  return v0;
}

uint64_t __AXLogRTT_block_invoke()
{
  AXLogRTT___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXRTT");

  return MEMORY[0x1F41817F8]();
}

id AXLogUltron()
{
  if (AXLogUltron_onceToken != -1) {
    dispatch_once(&AXLogUltron_onceToken, &__block_literal_global_355);
  }
  id v0 = (void *)AXLogUltron___logObj;

  return v0;
}

uint64_t __AXLogUltron_block_invoke()
{
  AXLogUltron___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXUltron");

  return MEMORY[0x1F41817F8]();
}

id AXLogUltronKShot()
{
  if (AXLogUltronKShot_onceToken != -1) {
    dispatch_once(&AXLogUltronKShot_onceToken, &__block_literal_global_358);
  }
  id v0 = (void *)AXLogUltronKShot___logObj;

  return v0;
}

uint64_t __AXLogUltronKShot_block_invoke()
{
  AXLogUltronKShot___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXUltronKShot");

  return MEMORY[0x1F41817F8]();
}

id AXLogAudiogram()
{
  if (AXLogAudiogram_onceToken != -1) {
    dispatch_once(&AXLogAudiogram_onceToken, &__block_literal_global_361);
  }
  id v0 = (void *)AXLogAudiogram___logObj;

  return v0;
}

uint64_t __AXLogAudiogram_block_invoke()
{
  AXLogAudiogram___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAudiogram");

  return MEMORY[0x1F41817F8]();
}

id AXLogDisplayFilters()
{
  if (AXLogDisplayFilters_onceToken != -1) {
    dispatch_once(&AXLogDisplayFilters_onceToken, &__block_literal_global_364);
  }
  id v0 = (void *)AXLogDisplayFilters___logObj;

  return v0;
}

uint64_t __AXLogDisplayFilters_block_invoke()
{
  AXLogDisplayFilters___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXDisplayFilters");

  return MEMORY[0x1F41817F8]();
}

id ZOOMLogCommon()
{
  if (ZOOMLogCommon_onceToken != -1) {
    dispatch_once(&ZOOMLogCommon_onceToken, &__block_literal_global_367);
  }
  id v0 = (void *)ZOOMLogCommon___logObj;

  return v0;
}

uint64_t __ZOOMLogCommon_block_invoke()
{
  ZOOMLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "ZOOMCommon");

  return MEMORY[0x1F41817F8]();
}

id ZOOMLogEvents()
{
  if (ZOOMLogEvents_onceToken != -1) {
    dispatch_once(&ZOOMLogEvents_onceToken, &__block_literal_global_370);
  }
  id v0 = (void *)ZOOMLogEvents___logObj;

  return v0;
}

uint64_t __ZOOMLogEvents_block_invoke()
{
  ZOOMLogEvents___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "ZOOMEvents");

  return MEMORY[0x1F41817F8]();
}

id AXLogUnitTesting()
{
  if (AXLogUnitTesting_onceToken != -1) {
    dispatch_once(&AXLogUnitTesting_onceToken, &__block_literal_global_373);
  }
  id v0 = (void *)AXLogUnitTesting___logObj;

  return v0;
}

uint64_t __AXLogUnitTesting_block_invoke()
{
  AXLogUnitTesting___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXUnitTesting");

  return MEMORY[0x1F41817F8]();
}

id AXLogPerfTesting()
{
  if (AXLogPerfTesting_onceToken != -1) {
    dispatch_once(&AXLogPerfTesting_onceToken, &__block_literal_global_376);
  }
  id v0 = (void *)AXLogPerfTesting___logObj;

  return v0;
}

uint64_t __AXLogPerfTesting_block_invoke()
{
  AXLogPerfTesting___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXPerfTesting");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogCommon()
{
  if (AXMediaLogCommon_onceToken != -1) {
    dispatch_once(&AXMediaLogCommon_onceToken, &__block_literal_global_379);
  }
  id v0 = (void *)AXMediaLogCommon___logObj;

  return v0;
}

uint64_t __AXMediaLogCommon_block_invoke()
{
  AXMediaLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaCommon");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogSettings()
{
  if (AXMediaLogSettings_onceToken != -1) {
    dispatch_once(&AXMediaLogSettings_onceToken, &__block_literal_global_382);
  }
  id v0 = (void *)AXMediaLogSettings___logObj;

  return v0;
}

uint64_t __AXMediaLogSettings_block_invoke()
{
  AXMediaLogSettings___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaSettings");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogService()
{
  if (AXMediaLogService_onceToken != -1) {
    dispatch_once(&AXMediaLogService_onceToken, &__block_literal_global_385);
  }
  id v0 = (void *)AXMediaLogService___logObj;

  return v0;
}

uint64_t __AXMediaLogService_block_invoke()
{
  AXMediaLogService___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaService");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogEngineCache()
{
  if (AXMediaLogEngineCache_onceToken != -1) {
    dispatch_once(&AXMediaLogEngineCache_onceToken, &__block_literal_global_388);
  }
  id v0 = (void *)AXMediaLogEngineCache___logObj;

  return v0;
}

uint64_t __AXMediaLogEngineCache_block_invoke()
{
  AXMediaLogEngineCache___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaEngineCache");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogEnginePriority()
{
  if (AXMediaLogEnginePriority_onceToken != -1) {
    dispatch_once(&AXMediaLogEnginePriority_onceToken, &__block_literal_global_391);
  }
  id v0 = (void *)AXMediaLogEnginePriority___logObj;

  return v0;
}

uint64_t __AXMediaLogEnginePriority_block_invoke()
{
  AXMediaLogEnginePriority___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaEnginePriority");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogScreenGrab()
{
  if (AXMediaLogScreenGrab_onceToken != -1) {
    dispatch_once(&AXMediaLogScreenGrab_onceToken, &__block_literal_global_394);
  }
  id v0 = (void *)AXMediaLogScreenGrab___logObj;

  return v0;
}

uint64_t __AXMediaLogScreenGrab_block_invoke()
{
  AXMediaLogScreenGrab___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaScreenGrab");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogOCR()
{
  if (AXMediaLogOCR_onceToken != -1) {
    dispatch_once(&AXMediaLogOCR_onceToken, &__block_literal_global_397);
  }
  id v0 = (void *)AXMediaLogOCR___logObj;

  return v0;
}

uint64_t __AXMediaLogOCR_block_invoke()
{
  AXMediaLogOCR___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaOCR");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogMLElement()
{
  if (AXMediaLogMLElement_onceToken != -1) {
    dispatch_once(&AXMediaLogMLElement_onceToken, &__block_literal_global_400);
  }
  id v0 = (void *)AXMediaLogMLElement___logObj;

  return v0;
}

uint64_t __AXMediaLogMLElement_block_invoke()
{
  AXMediaLogMLElement___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaMLElement");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogTextProcessing()
{
  if (AXMediaLogTextProcessing_onceToken != -1) {
    dispatch_once(&AXMediaLogTextProcessing_onceToken, &__block_literal_global_403);
  }
  id v0 = (void *)AXMediaLogTextProcessing___logObj;

  return v0;
}

uint64_t __AXMediaLogTextProcessing_block_invoke()
{
  AXMediaLogTextProcessing___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaTextProcessing");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogElementVision()
{
  if (AXMediaLogElementVision_onceToken != -1) {
    dispatch_once(&AXMediaLogElementVision_onceToken, &__block_literal_global_406);
  }
  id v0 = (void *)AXMediaLogElementVision___logObj;

  return v0;
}

uint64_t __AXMediaLogElementVision_block_invoke()
{
  AXMediaLogElementVision___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaElementVision");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogTextLayout()
{
  if (AXMediaLogTextLayout_onceToken != -1) {
    dispatch_once(&AXMediaLogTextLayout_onceToken, &__block_literal_global_409);
  }
  id v0 = (void *)AXMediaLogTextLayout___logObj;

  return v0;
}

uint64_t __AXMediaLogTextLayout_block_invoke()
{
  AXMediaLogTextLayout___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaTextLayout");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogResults()
{
  if (AXMediaLogResults_onceToken != -1) {
    dispatch_once(&AXMediaLogResults_onceToken, &__block_literal_global_412);
  }
  id v0 = (void *)AXMediaLogResults___logObj;

  return v0;
}

uint64_t __AXMediaLogResults_block_invoke()
{
  AXMediaLogResults___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaResults");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogTracking()
{
  if (AXMediaLogTracking_onceToken != -1) {
    dispatch_once(&AXMediaLogTracking_onceToken, &__block_literal_global_415);
  }
  id v0 = (void *)AXMediaLogTracking___logObj;

  return v0;
}

uint64_t __AXMediaLogTracking_block_invoke()
{
  AXMediaLogTracking___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaTracking");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogOutput()
{
  if (AXMediaLogOutput_onceToken != -1) {
    dispatch_once(&AXMediaLogOutput_onceToken, &__block_literal_global_418);
  }
  id v0 = (void *)AXMediaLogOutput___logObj;

  return v0;
}

uint64_t __AXMediaLogOutput_block_invoke()
{
  AXMediaLogOutput___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaOutput");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogSpeech()
{
  if (AXMediaLogSpeech_onceToken != -1) {
    dispatch_once(&AXMediaLogSpeech_onceToken, &__block_literal_global_421);
  }
  id v0 = (void *)AXMediaLogSpeech___logObj;

  return v0;
}

uint64_t __AXMediaLogSpeech_block_invoke()
{
  AXMediaLogSpeech___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaSpeech");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogSounds()
{
  if (AXMediaLogSounds_onceToken != -1) {
    dispatch_once(&AXMediaLogSounds_onceToken, &__block_literal_global_424);
  }
  id v0 = (void *)AXMediaLogSounds___logObj;

  return v0;
}

uint64_t __AXMediaLogSounds_block_invoke()
{
  AXMediaLogSounds___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaSounds");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogHaptics()
{
  if (AXMediaLogHaptics_onceToken != -1) {
    dispatch_once(&AXMediaLogHaptics_onceToken, &__block_literal_global_427);
  }
  id v0 = (void *)AXMediaLogHaptics___logObj;

  return v0;
}

uint64_t __AXMediaLogHaptics_block_invoke()
{
  AXMediaLogHaptics___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaHaptics");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogCaptionDescriptions()
{
  if (AXMediaLogCaptionDescriptions_onceToken != -1) {
    dispatch_once(&AXMediaLogCaptionDescriptions_onceToken, &__block_literal_global_430);
  }
  id v0 = (void *)AXMediaLogCaptionDescriptions___logObj;

  return v0;
}

uint64_t __AXMediaLogCaptionDescriptions_block_invoke()
{
  AXMediaLogCaptionDescriptions___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaCaptionDescriptions");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogDiagnostics()
{
  if (AXMediaLogDiagnostics_onceToken != -1) {
    dispatch_once(&AXMediaLogDiagnostics_onceToken, &__block_literal_global_433);
  }
  id v0 = (void *)AXMediaLogDiagnostics___logObj;

  return v0;
}

uint64_t __AXMediaLogDiagnostics_block_invoke()
{
  AXMediaLogDiagnostics___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaDiagnostics");

  return MEMORY[0x1F41817F8]();
}

id AXMediaLogLanguageTranslation()
{
  if (AXMediaLogLanguageTranslation_onceToken != -1) {
    dispatch_once(&AXMediaLogLanguageTranslation_onceToken, &__block_literal_global_436);
  }
  id v0 = (void *)AXMediaLogLanguageTranslation___logObj;

  return v0;
}

uint64_t __AXMediaLogLanguageTranslation_block_invoke()
{
  AXMediaLogLanguageTranslation___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXMediaLanguageTranslation");

  return MEMORY[0x1F41817F8]();
}

id AXLogAirPodSettings()
{
  if (AXLogAirPodSettings_onceToken != -1) {
    dispatch_once(&AXLogAirPodSettings_onceToken, &__block_literal_global_439);
  }
  id v0 = (void *)AXLogAirPodSettings___logObj;

  return v0;
}

uint64_t __AXLogAirPodSettings_block_invoke()
{
  AXLogAirPodSettings___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAirPodSettings");

  return MEMORY[0x1F41817F8]();
}

id AXLogAssetLoader()
{
  if (AXLogAssetLoader_onceToken != -1) {
    dispatch_once(&AXLogAssetLoader_onceToken, &__block_literal_global_442);
  }
  id v0 = (void *)AXLogAssetLoader___logObj;

  return v0;
}

uint64_t __AXLogAssetLoader_block_invoke()
{
  AXLogAssetLoader___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAssetLoader");

  return MEMORY[0x1F41817F8]();
}

id AXLogAssetDaemon()
{
  if (AXLogAssetDaemon_onceToken != -1) {
    dispatch_once(&AXLogAssetDaemon_onceToken, &__block_literal_global_445);
  }
  id v0 = (void *)AXLogAssetDaemon___logObj;

  return v0;
}

uint64_t __AXLogAssetDaemon_block_invoke()
{
  AXLogAssetDaemon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAssetDaemon");

  return MEMORY[0x1F41817F8]();
}

id AXPlatformTranslationLogCommon()
{
  if (AXPlatformTranslationLogCommon_onceToken != -1) {
    dispatch_once(&AXPlatformTranslationLogCommon_onceToken, &__block_literal_global_448);
  }
  id v0 = (void *)AXPlatformTranslationLogCommon___logObj;

  return v0;
}

uint64_t __AXPlatformTranslationLogCommon_block_invoke()
{
  AXPlatformTranslationLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXPlatformTranslationCommon");

  return MEMORY[0x1F41817F8]();
}

id AXLogTemp()
{
  if (AXLogTemp_onceToken != -1) {
    dispatch_once(&AXLogTemp_onceToken, &__block_literal_global_451);
  }
  id v0 = (void *)AXLogTemp___logObj;

  return v0;
}

uint64_t __AXLogTemp_block_invoke()
{
  AXLogTemp___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTemp");

  return MEMORY[0x1F41817F8]();
}

id BRLLogTranslation()
{
  if (BRLLogTranslation_onceToken != -1) {
    dispatch_once(&BRLLogTranslation_onceToken, &__block_literal_global_454);
  }
  id v0 = (void *)BRLLogTranslation___logObj;

  return v0;
}

uint64_t __BRLLogTranslation_block_invoke()
{
  BRLLogTranslation___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "BRLTranslation");

  return MEMORY[0x1F41817F8]();
}

id AXLogBackTap()
{
  if (AXLogBackTap_onceToken != -1) {
    dispatch_once(&AXLogBackTap_onceToken, &__block_literal_global_457);
  }
  id v0 = (void *)AXLogBackTap___logObj;

  return v0;
}

uint64_t __AXLogBackTap_block_invoke()
{
  AXLogBackTap___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXBackTap");

  return MEMORY[0x1F41817F8]();
}

id AXLogSoundActions()
{
  if (AXLogSoundActions_onceToken != -1) {
    dispatch_once(&AXLogSoundActions_onceToken, &__block_literal_global_460);
  }
  id v0 = (void *)AXLogSoundActions___logObj;

  return v0;
}

uint64_t __AXLogSoundActions_block_invoke()
{
  AXLogSoundActions___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXSoundActions");

  return MEMORY[0x1F41817F8]();
}

id CLFLogCommon()
{
  if (CLFLogCommon_onceToken != -1) {
    dispatch_once(&CLFLogCommon_onceToken, &__block_literal_global_463);
  }
  id v0 = (void *)CLFLogCommon___logObj;

  return v0;
}

uint64_t __CLFLogCommon_block_invoke()
{
  CLFLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "CLFCommon");

  return MEMORY[0x1F41817F8]();
}

id CLFLogSettings()
{
  if (CLFLogSettings_onceToken != -1) {
    dispatch_once(&CLFLogSettings_onceToken, &__block_literal_global_466);
  }
  id v0 = (void *)CLFLogSettings___logObj;

  return v0;
}

uint64_t __CLFLogSettings_block_invoke()
{
  CLFLogSettings___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "CLFSettings");

  return MEMORY[0x1F41817F8]();
}

id HTLogCommon()
{
  if (HTLogCommon_onceToken != -1) {
    dispatch_once(&HTLogCommon_onceToken, &__block_literal_global_469);
  }
  id v0 = (void *)HTLogCommon___logObj;

  return v0;
}

uint64_t __HTLogCommon_block_invoke()
{
  HTLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "HTCommon");

  return MEMORY[0x1F41817F8]();
}

id LiveSpeechLogCommon()
{
  if (LiveSpeechLogCommon_onceToken != -1) {
    dispatch_once(&LiveSpeechLogCommon_onceToken, &__block_literal_global_472);
  }
  id v0 = (void *)LiveSpeechLogCommon___logObj;

  return v0;
}

uint64_t __LiveSpeechLogCommon_block_invoke()
{
  LiveSpeechLogCommon___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "LiveSpeechCommon");

  return MEMORY[0x1F41817F8]();
}

id AXLogTwiceRemoteScreen()
{
  if (AXLogTwiceRemoteScreen_onceToken != -1) {
    dispatch_once(&AXLogTwiceRemoteScreen_onceToken, &__block_literal_global_478);
  }
  id v0 = (void *)AXLogTwiceRemoteScreen___logObj;

  return v0;
}

uint64_t __AXLogTwiceRemoteScreen_block_invoke()
{
  AXLogTwiceRemoteScreen___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXTwiceRemoteScreen");

  return MEMORY[0x1F41817F8]();
}

id AXLogHapticMusic()
{
  if (AXLogHapticMusic_onceToken != -1) {
    dispatch_once(&AXLogHapticMusic_onceToken, &__block_literal_global_481);
  }
  id v0 = (void *)AXLogHapticMusic___logObj;

  return v0;
}

uint64_t __AXLogHapticMusic_block_invoke()
{
  AXLogHapticMusic___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXHapticMusic");

  return MEMORY[0x1F41817F8]();
}

id AXLogAVS()
{
  if (AXLogAVS_onceToken != -1) {
    dispatch_once(&AXLogAVS_onceToken, &__block_literal_global_484);
  }
  id v0 = (void *)AXLogAVS___logObj;

  return v0;
}

uint64_t __AXLogAVS_block_invoke()
{
  AXLogAVS___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXAVS");

  return MEMORY[0x1F41817F8]();
}

id AXLogHearingTest()
{
  if (AXLogHearingTest_onceToken != -1) {
    dispatch_once(&AXLogHearingTest_onceToken, &__block_literal_global_487);
  }
  id v0 = (void *)AXLogHearingTest___logObj;

  return v0;
}

uint64_t __AXLogHearingTest_block_invoke()
{
  AXLogHearingTest___logObj = (uint64_t)os_log_create("com.apple.Accessibility", "AXHearingTest");

  return MEMORY[0x1F41817F8]();
}

uint64_t _AXSIsInternalUIBuild()
{
  return os_variant_has_internal_ui();
}

uint64_t _AXSSetWriteableClient(uint64_t result)
{
  _kAXSWriteableClient = result;
  return result;
}

uint64_t AXSAccessibilityUtilitiesPath()
{
  id v0 = AXSystemRootDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/AccessibilityUtilities.framework"];

  return v1;
}

uint64_t _AXSCopyPathForAccessibilityBundle(uint64_t a1)
{
  CFStringRef v2 = AXAccessibilityBundlesDirectory();
  id v3 = [NSString stringWithFormat:@"%@.axbundle", a1];
  uint64_t v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

void sub_19028883C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void _axsHandlePrefChangedApp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___axsHandlePrefChangedApp_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void _axsHandleSystemUILoadInvertBundles()
{
  if (_AXSProcessLoadsInvertBundlesForPerAppSmartInvert())
  {
    id v0 = AXLogInvertColorsLoadBundles();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
      _axsHandleSystemUILoadInvertBundles_cold_1();
    }

    if (!_kAXSystemUIProcessShouldLoadInvertBundles)
    {
      if (_AXSProcessIsSpringBoard_onceToken != -1) {
        dispatch_once(&_AXSProcessIsSpringBoard_onceToken, &__block_literal_global_2526);
      }
      if (_AXSProcessIsSpringBoard__AXSProcessIsSpringBoard == 1)
      {
        uint64_t v1 = AXLogInvertColorsLoadBundles();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v3 = 0;
          _os_log_impl(&dword_190274000, v1, OS_LOG_TYPE_DEFAULT, "Saving SystemUIProcessShouldLoadInvertBundles as true", v3, 2u);
        }

        CFPreferencesSetValue(@"AXSSystemUIProcessAppSmartInvertEnabledPreference", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], (CFStringRef)kAXSAccessibilityPreferenceDomain, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      }
    }
    _kAXSystemUIProcessShouldLoadInvertBundles = 1;
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, kAXSInvertColorsEnabledNotification, 0, 0, 1u);
  }
}

uint64_t _AXSShouldLoadInvertBundles()
{
  if (_AXSShouldLoadInvertBundles_onceToken != -1) {
    dispatch_once(&_AXSShouldLoadInvertBundles_onceToken, &__block_literal_global_2);
  }
  return _kAXSystemUIProcessShouldLoadInvertBundles;
}

uint64_t AXSGetCachedSmartInvert()
{
  if (AXSGetCachedSmartInvert_onceToken != -1) {
    dispatch_once(&AXSGetCachedSmartInvert_onceToken, &__block_literal_global_1718);
  }
  return _kAXSCacheInvertColors;
}

CFStringRef AXCPCopySharedResourcesPreferencesDomainForDomain(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v3 = AXCPSharedResourcesDirectory();
  return CFStringCreateWithFormat(v2, 0, @"%@/Library/Preferences/%@", v3, a1);
}

uint64_t _AXSDisableDomainSynching(uint64_t result)
{
  _AXDisableSynching = result;
  return result;
}

uint64_t _AXSVideosPreferenceDomain()
{
  if (_AXSVideosPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSVideosPreferenceDomain_onceToken, &__block_literal_global_1726);
  }
  return _AXSVideosPreferenceDomain_Domain;
}

uint64_t _AXSAccessibilityPreferenceDomain()
{
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1731);
  }
  return _AXSAccessibilityPreferenceDomain_Domain;
}

uint64_t _AXSHearingAidsPaired()
{
  if (_AXSHearingAidsPaired_onceToken != -1) {
    dispatch_once(&_AXSHearingAidsPaired_onceToken, &__block_literal_global_1979);
  }
  return _kAXSCacheHearingAidPaired;
}

uint64_t _AXSLocalizationCaptionMode()
{
  if (_AXSLocalizationCaptionMode_onceToken != -1) {
    dispatch_once(&_AXSLocalizationCaptionMode_onceToken, &__block_literal_global_2131);
  }
  return _kAXSCacheLocalizationCaptionModeEnabled;
}

uint64_t _AXSLetterFeedbackEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSLetterFeedbackEnabledPreference, 0, (uint64_t)_handleLetterFeedbackPrefsChangedNotification);
}

uint64_t _AXSPhoneticFeedbackEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSPhoneticFeedbackEnabledPreference, 0, (uint64_t)_handlePhoneticFeedbackPrefsChangedNotification);
}

uint64_t _AXSQuickTypePredictionFeedbackEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSQuickTypePredictionFeedbackEnabledPreference, 0, (uint64_t)_handleQuickTypePredictionFeedbackPrefsChangedNotification);
}

uint64_t _AXSClipTracerAccessibilityModeEnabled()
{
  if (_AXSClipTracerAccessibilityModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSClipTracerAccessibilityModeEnabled_onceToken, &__block_literal_global_2181);
  }
  return _kAXSCacheClipTracerAccessibilityModeEnabled;
}

uint64_t _AXSNocturneAccessibilityModeEnabled()
{
  if (_AXSNocturneAccessibilityModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSNocturneAccessibilityModeEnabled_onceToken, &__block_literal_global_2179);
  }
  return _kAXSCacheNocturneAccessibilityModeEnabled;
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  if (_AXSCommandAndControlCarPlayEnabled_onceToken != -1) {
    dispatch_once(&_AXSCommandAndControlCarPlayEnabled_onceToken, &__block_literal_global_1879);
  }
  return _kAXSCacheCommandAndControlCarPlayEnabled;
}

uint64_t _AXSWatchControlEnabled()
{
  if (_AXSWatchControlEnabled_onceToken != -1) {
    dispatch_once(&_AXSWatchControlEnabled_onceToken, &__block_literal_global_2451);
  }
  return _kAXSCacheWatchControlEnabled;
}

uint64_t _AXSHoverTextTypingEnabled()
{
  if (_AXSHoverTextTypingEnabled_onceToken != -1) {
    dispatch_once(&_AXSHoverTextTypingEnabled_onceToken, &__block_literal_global_2345);
  }
  return _kAXSCacheHoverTextTypingEnabled;
}

CFBooleanRef _AXSBackgroundSoundsEnabled()
{
  CFBooleanRef result = (const __CFBoolean *)_copyValuePreferenceApp(@"comfortSoundsEnabled", @"com.apple.ComfortSounds", 0);
  if (result)
  {
    CFBooleanRef v1 = result;
    uint64_t Value = CFBooleanGetValue(result);
    CFRelease(v1);
    return (const __CFBoolean *)Value;
  }
  return result;
}

BOOL _AXSInvertColorsEnabledGlobalCached()
{
  return _kAXSCacheInvertColorsGlobal == 1;
}

void _AXSAccessibilitySetiTunesPreference(__CFString *a1, void *a2)
{
  _setPreferenceAppWithNotification(a1, 0, a2, (const __CFString *)[(__CFString *)a1 stringByAppendingString:@".notification"]);
  id v5 = a2;
  if (CFEqual(a1, (CFTypeRef)kAXSVoiceOverTouchEnabledByiTunesPreference))
  {
    _kAXSCacheVoiceOverTouchEnabled = [v5 BOOLValue];
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSZoomTouchEnabledByiTunesPreference))
  {
    _kAXSCacheZoomTouchEnabled = [v5 BOOLValue];
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSInvertColorsEnabledByiTunesPreference))
  {
    _AXSInvertColorsSetEnabled([v5 BOOLValue]);
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSMonoAudioEnabledByiTunesPreference))
  {
    _kAXSCacheMonoAudioEnabled = [v5 BOOLValue];
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSAssistiveTouchEnabledByiTunesPreference))
  {
    _kAXSAssistiveTouchEnabledCache = [v5 BOOLValue];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSiTunesAccessibilityStatusChangedNotification, 0, 0, 1u);
}

void _AXSInvertColorsSetEnabled(int a1)
{
  _kAXSCacheInvertColorsGlobal = a1 != 0;
  _AXSInvertColorsSetEnabledApp(_kAXSCacheInvertColorsGlobal, 0);
  _AXSInvertColorsDisplaySetEnabled(a1);
  char v4 = 0;
  int BooleanPreference = _getBooleanPreference((const __CFString *)kAXSInvertColorsEnabledByiTunesPreference, &v4);
  if (v4) {
    BOOL v3 = BooleanPreference == a1;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSInvertColorsEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
}

CFNumberRef _AXSAccessibilityCopyiTunesPreference(const void *a1)
{
  char valuePtr = 0;
  if (CFEqual(a1, (CFTypeRef)kAXSVoiceOverTouchEnabledByiTunesPreference))
  {
    AppBooleanuint64_t Value = _AXSVoiceOverTouchEnabled();
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSZoomTouchEnabledByiTunesPreference))
  {
    AppBooleanuint64_t Value = _AXSZoomTouchEnabled();
  }
  else
  {
    if (!CFEqual(a1, (CFTypeRef)kAXSInvertColorsEnabledByiTunesPreference))
    {
      if (CFEqual(a1, (CFTypeRef)kAXSMonoAudioEnabledByiTunesPreference))
      {
        if (_AXSMonoAudioEnabled_onceToken != -1) {
          dispatch_once(&_AXSMonoAudioEnabled_onceToken, &__block_literal_global_1983);
        }
        char v4 = _kAXSCacheMonoAudioEnabled;
      }
      else
      {
        if (!CFEqual(a1, (CFTypeRef)kAXSAssistiveTouchEnabledByiTunesPreference))
        {
          if (CFEqual(a1, (CFTypeRef)kAXSSpeakAutoCorrectionsEnabledByiTunesPreference))
          {
            AppBooleanuint64_t Value = CFPreferencesGetAppBooleanValue((CFStringRef)kAXSSpeakCorrectionsEnabledPreference, (CFStringRef)kAXSAccessibilityPreferenceDomain, 0);
          }
          else
          {
            if (!CFEqual(a1, (CFTypeRef)kAXSClosedCaptioningEnabledByiTunesPreference)) {
              return CFNumberCreate(0, kCFNumberCharType, &valuePtr);
            }
            AppBooleanuint64_t Value = _AXSClosedCaptionsEnabled();
          }
          goto LABEL_7;
        }
        if (_AXSAssistiveTouchEnabled_onceToken != -1) {
          dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1810);
        }
        char v4 = _kAXSAssistiveTouchEnabledCache;
      }
      char valuePtr = v4;
      return CFNumberCreate(0, kCFNumberCharType, &valuePtr);
    }
    AppBooleanuint64_t Value = _AXSInvertColorsEnabled();
  }
LABEL_7:
  char valuePtr = AppBooleanValue;
  return CFNumberCreate(0, kCFNumberCharType, &valuePtr);
}

uint64_t _AXSMonoAudioEnabled()
{
  if (_AXSMonoAudioEnabled_onceToken != -1) {
    dispatch_once(&_AXSMonoAudioEnabled_onceToken, &__block_literal_global_1983);
  }
  return _kAXSCacheMonoAudioEnabled;
}

CFBooleanRef _AXSClosedCaptionsEnabled()
{
  if (_AXSClosedCaptionsEnabled_onceToken != -1) {
    dispatch_once(&_AXSClosedCaptionsEnabled_onceToken, &__block_literal_global_1952);
  }
  CFBooleanRef result = (const __CFBoolean *)MACaptionAppearancePrefCopyPreferAccessibleCaptions();
  if (result)
  {
    CFBooleanRef v1 = result;
    uint64_t Value = CFBooleanGetValue(result);
    CFRelease(v1);
    return (const __CFBoolean *)Value;
  }
  return result;
}

void _removePreference(const __CFString *a1, const __CFString *a2)
{
  _setPreferenceAppWithNotification(a1, 0, 0, a2);

  _updateAccessibilitySettings();
}

void *_AXSCopyPreferenceValue(const __CFString *a1, unsigned char *a2)
{
  return _copyValuePreferenceApp(a1, 0, a2);
}

void _AXSetPreferenceWithNotification(const __CFString *a1, const void *a2, const __CFString *a3)
{
  _setPreferenceAppWithNotification(a1, 0, a2, a3);

  _updateAccessibilitySettings();
}

float _getFloatPreference(const __CFString *a1, uint64_t a2, unsigned char *a3)
{
  id v5 = (void *)MEMORY[0x192FCB1D0]();
  if (a3) {
    *a3 = 1;
  }
  id v6 = _copyValuePreferenceApp(a1, 0, 0);
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v6 floatValue];
    float v8 = v7;
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    float v8 = 3.4028e38;
  }

  return v8;
}

void _AXSAssistiveTouchKickstart()
{
}

void _kickstartProcess(char *service_name)
{
  kern_return_t v2;
  BOOL v3;
  kern_return_t v4;
  NSObject *v5;
  mach_msg_id_t v6;
  const char *v7;
  const char *v8;
  uint8_t *p_msg;
  NSObject *v10;
  uint32_t v11;
  mach_msg_return_t v12;
  mach_msg_return_t v13;
  mach_port_t sp;
  uint8_t buf[4];
  char *v16;
  __int16 v17;
  mach_msg_return_t v18;
  __int16 v19;
  mach_port_t v20;
  mach_msg_header_t msg;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  CFStringRef v24 = *MEMORY[0x1E4F143B8];
  sp = 0;
  CFAllocatorRef v2 = bootstrap_look_up(*MEMORY[0x1E4F14638], service_name, &sp);
  if (sp) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    *(void *)&msg.msgh_bits = 0x1800001413;
    msg.msgh_remote_port = sp;
    msg.msgh_local_port = 0;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1776;
    CFStringRef v12 = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
    if (!v12) {
      return;
    }
    __int16 v13 = v12;
    id v5 = AXSupportLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = service_name;
      uint64_t v17 = 1024;
      CFStringRef v18 = v13;
      id v19 = 1024;
      id v20 = sp;
      float v8 = "Could not kickstart %s [%d - port: %d]";
      p_msg = buf;
      id v10 = v5;
      os_log_type_t v11 = 24;
      goto LABEL_12;
    }
  }
  else
  {
    char v4 = v2;
    id v5 = AXSupportLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = sp;
      float v7 = bootstrap_strerror(v4);
      msg.msgh_bits = 136315906;
      *(void *)&msg.msgh_size = service_name;
      LOWORD(msg.msgh_local_port) = 1024;
      *(mach_port_t *)((char *)&msg.msgh_local_port + 2) = v4;
      HIWORD(msg.msgh_voucher_port) = 1024;
      msg.msgh_id = v6;
      __int16 v22 = 2080;
      CFStringRef v23 = v7;
      float v8 = "Could not look up process with name: %s [%d - port: %d] - error: %s";
      p_msg = (uint8_t *)&msg;
      id v10 = v5;
      os_log_type_t v11 = 34;
LABEL_12:
      _os_log_error_impl(&dword_190274000, v10, OS_LOG_TYPE_ERROR, v8, p_msg, v11);
    }
  }
}

void _setValuePreference(const __CFString *a1, const void *a2, const __CFString *a3)
{
}

uint64_t _isProcessDistributedNotificationSender()
{
  if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
    dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
  }
  return _AXSCurrentProcessIsWebContent_IsWebContent ^ 1u;
}

uint64_t _AXSCurrentProcessIsWebContent()
{
  if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
    dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
  }
  return _AXSCurrentProcessIsWebContent_IsWebContent;
}

void _AXSForcePreferenceUpdate(const __CFString *a1)
{
  if (CFEqual(a1, (CFTypeRef)kAXSVoiceOverTouchEnabledPreference))
  {
    _kAXSCacheVoiceOverTouchEnabled = _getBooleanPreference(a1, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSVoiceOverTouchEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSBrailleScreenInputEnabledPreference))
  {
    _kAXSCacheBrailleScreenInputEnabled = _getBooleanPreference(a1, 0);
    BOOL v3 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v3, (CFNotificationName)kAXSBrailleScreenInputEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSHoverTextEnabledPreference))
  {
    _kAXSCacheHoverTextEnabled = _getBooleanPreference(a1, 0);
    char v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v4, (CFNotificationName)kAXSHoverTextEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSHoverTextTypingEnabledPreference))
  {
    _kAXSCacheHoverTextTypingEnabled = _getBooleanPreference(a1, 0);
    id v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v5, (CFNotificationName)kAXSHoverTextTypingEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSLiveSpeechEnabledPreference))
  {
    _kAXSCacheLiveSpeechEnabled = _getBooleanPreference(a1, 0);
    id v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v6, (CFNotificationName)kAXSLiveSpeechEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSZoomTouchEnabledPreference))
  {
    _kAXSCacheZoomTouchEnabled = _getBooleanPreference(a1, 0);
    float v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v7, (CFNotificationName)kAXSZoomTouchEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSMonoAudioEnabledPreference))
  {
    _kAXSCacheMonoAudioEnabled = _getBooleanPreference(a1, 0);
    float v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v9 = (const __CFString *)kAXSMonoAudioEnabledNotification;
    CFNotificationCenterPostNotification(v8, v9, 0, 0, 1u);
  }
}

id _axsPrefsToNotificationMap()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = kAXSHoverTextEnabledPreference;
  v2[1] = kAXSZoomTouchEnabledPreference;
  v3[0] = @"com.apple.accessibility.cache.hovertext";
  v3[1] = @"com.apple.accessibility.cache.zoom";
  v2[2] = kAXSVoiceOverTouchEnabledPreference;
  v2[3] = kAXSBrailleScreenInputEnabledPreference;
  v3[2] = @"com.apple.accessibility.cache.vot";
  v3[3] = @"com.apple.accessibility.cache.bsi";
  id v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];

  return v0;
}

uint64_t _AXSInUnitTestMode()
{
  return _inUnitTestMode;
}

void _AXSSetInUnitTestMode(int a1)
{
  _inUnitTestMode = a1;
  int v2 = _AXSApplicationAccessibilityEnabled();
  if (a1 || !v2)
  {
    int v4 = _AXSApplicationAccessibilityEnabled();
    if (!a1 || v4) {
      return;
    }
    uint64_t v3 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v3 = 0;
  }

  _AXSApplicationAccessibilitySetEnabled(v3);
}

uint64_t _AXSFaceTimeCaptionsEnabled()
{
  if (_AXSFaceTimeCaptionsEnabled_onceToken != -1) {
    dispatch_once(&_AXSFaceTimeCaptionsEnabled_onceToken, &__block_literal_global_1764);
  }
  return _kAXSCacheFaceTimeCaptionsEnabled;
}

void ObservePreferenceLocal(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __ObservePreferenceLocal_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  void v2[4] = a1;
  v2[5] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void _AXSSetFaceTimeCaptionsEnabled(uint64_t a1)
{
  _kAXSCacheFaceTimeCaptionsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSFaceTimeCaptionsPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.FaceTimeCaptions");

  _updateAccessibilitySettings();
}

uint64_t _AXSInPerformanceTestMode()
{
  if (_AXSInPerformanceTestMode_onceToken != -1) {
    dispatch_once(&_AXSInPerformanceTestMode_onceToken, &__block_literal_global_1766);
  }
  return _kAXSCacheInPerformanceTestMode;
}

void _AXSSetInPerformanceTestMode(uint64_t a1)
{
  _kAXSCacheInPerformanceTestMode = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSInPerformanceTestModePreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.performance.testing.mode");

  _updateAccessibilitySettings();
}

uint64_t _AXSCurrentAccessibilitySettingsCanSupportLoginUI()
{
  id v0 = [MEMORY[0x1E4F28B50] bundleWithPath:AXSAccessibilityUtilitiesPath()];
  [v0 load];

  if (_AXSVoiceOverTouchEnabled()) {
    return 0;
  }
  if (_AXSAssistiveTouchEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1810);
  }
  if (_kAXSAssistiveTouchEnabledCache) {
    return 0;
  }
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
  }
  if (_kAXSCacheSwitchControlEnabled
    || _AXSZoomTouchEnabled()
    || _AXSInvertColorsEnabled()
    || _AXSReduceWhitePointEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || _AXSEnhanceTextLegibilityEnabled()
    || _AXDarkenSystemColors()
    || _AXSEnhanceBackgroundContrastEnabled())
  {
    return 0;
  }
  if (_AXSHearingAidsPaired_onceToken != -1) {
    dispatch_once(&_AXSHearingAidsPaired_onceToken, &__block_literal_global_1979);
  }
  if (_kAXSCacheHearingAidPaired) {
    return 0;
  }
  int v2 = [NSClassFromString(&cfstr_Axsettings.isa) valueForKey:@"sharedInstance"];
  uint64_t v3 = [v2 valueForKey:@"touchAccommodationsEnabled"];
  uint64_t v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

uint64_t _AXSScreenFilterApplied()
{
  return 0;
}

uint64_t _AXSReduceWhitePointEnabled()
{
  uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
  if (result) {
    return MADisplayFilterPrefGetType() == 128;
  }
  return result;
}

void _AXSSetAllowOpaqueTouchGestures(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAllowOpaqueTouchGesturesPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)kAXSAllowOpaqueTouchGesturesChangedNotification);

  _updateAccessibilitySettings();
}

uint64_t _AXSPencilExtendedSqueezeRangeEnabled()
{
  if (_AXSPencilExtendedSqueezeRangeEnabled_onceToken != -1) {
    dispatch_once(&_AXSPencilExtendedSqueezeRangeEnabled_onceToken, &__block_literal_global_1793);
  }
  return _kAXSCachePencilExtendedSqueezeRangeEnabled;
}

void _AXSSetPencilExtendedSqueezeRangeEnabled(uint64_t a1)
{
  _kAXSCachePencilExtendedSqueezeRangeEnabled = a1 != 0;
  _setPreferenceAppWithNotification(@"AXSPencilExtendedSqueezeRangeEnabledPreference", 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pencil.extended.squeeze.range");

  _updateAccessibilitySettings();
}

uint64_t _AXSSpatialAudioHeadTracking()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v6 = 0;
  id v0 = _copyValuePreferenceApp(@"AXSAirPodsSpatialAudioLockToDevice", 0, &v6);
  if (v0) {
    BOOL v1 = v6 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    int v2 = AXLogAirPodSettings();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      float v8 = v0;
      _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_INFO, "Migrated lock to device to spatial audio %@", buf, 0xCu);
    }

    if ([v0 BOOLValue]) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 0;
    }
    _kAXSCacheSpatialAudioHeadTracking = v3;
    _setPreferenceAppWithNotification(@"AXSSpatialAudioHeadTracking", 0, (const void *)[NSNumber numberWithLong:], @"com.apple.accessibility.SpatialAudioHeadTracking.notification");
    _setPreferenceAppWithNotification(@"AXSAirPodsSpatialAudioLockToDevice", 0, 0, 0);
  }
  if (_AXSSpatialAudioHeadTracking_onceToken != -1) {
    dispatch_once(&_AXSSpatialAudioHeadTracking_onceToken, &__block_literal_global_1795);
  }
  uint64_t v4 = _kAXSCacheSpatialAudioHeadTracking;

  return v4;
}

void _AXSSetSpatialAudioHeadTracking(uint64_t a1)
{
  _kAXSCacheSpatialAudioHeadTracking = a1;
  BOOL v1 = (const void *)[NSNumber numberWithLong:a1];

  _setPreferenceAppWithNotification(@"AXSSpatialAudioHeadTracking", 0, v1, @"com.apple.accessibility.SpatialAudioHeadTracking.notification");
}

uint64_t _AXSAirPodsSpatialAudioLockToDevice()
{
  if (_AXSAirPodsSpatialAudioLockToDevice_onceToken != -1) {
    dispatch_once(&_AXSAirPodsSpatialAudioLockToDevice_onceToken, &__block_literal_global_1797);
  }
  return _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled;
}

void _AXSSetAirPodsSpatialAudioLockToDevice(uint64_t a1)
{
  _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled = a1 != 0;
  _setPreferenceAppWithNotification(@"AXSAirPodsSpatialAudioLockToDevice", 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.airpod.spatial.audio.lock.to.device");

  _updateAccessibilitySettings();
}

id AXSAirPodsDictionaryForPreference(const __CFString *a1)
{
  char v4 = 0;
  BOOL v1 = _copyValuePreferenceApp(a1, 0, &v4);
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id AXSAirPodsUpdatedDictionaryForPreference(const __CFString *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  char v6 = AXSAirPodsDictionaryForPreference(a1);
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    float v7 = (void *)[v6 mutableCopy];
  }
  else
  {
    float v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  float v8 = v7;
  [v7 setObject:v5 forKeyedSubscript:a2];

  return v8;
}

id _AXSAirPodSettingForDevice(const __CFString *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = AXSAirPodsDictionaryForPreference(a1);
    char v4 = v3;
    if (v3)
    {
      id v5 = [v3 objectForKeyedSubscript:a2];
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    float v7 = AXLogAirPodSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      _AXSAirPodSettingForDevice_cold_1();
    }

    id v6 = 0;
  }

  return v6;
}

void _AXSAirPodSettingSetForDevice(const __CFString *a1, uint64_t a2, const __CFString *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a2)
  {
    float v8 = AXSAirPodsUpdatedDictionaryForPreference(a1, a2, v7);
    _setPreferenceAppWithNotification(a1, 0, v8, a3);
    uint64_t v9 = AXLogAirPodSettings();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412802;
      CFStringRef v11 = a1;
      __int16 v12 = 2112;
      uint64_t v13 = a2;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_190274000, v9, OS_LOG_TYPE_INFO, "Setting airpods %@:%@ %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    float v8 = AXLogAirPodSettings();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      _AXSAirPodSettingSetForDevice_cold_1();
    }
  }
}

uint64_t _AXSAirPodsNoiseCancellationWithOneUnit(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsNoiseCancellationWithOneUnitPreference;
  objc_opt_class();
  uint64_t v3 = _AXSAirPodSettingForDevice(v2, a1);
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

void _AXSSetAirPodsNoiseCancellationWithOneUnit(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = (const __CFString *)kAXSAirPodsNoiseCancellationWithOneUnitPreference;
  CFStringRef v4 = (const __CFString *)kAXSAirPodsNoiseCancellationWithOneUnitChangedNotification;
  id v5 = [NSNumber numberWithUnsignedChar:a1];
  _AXSAirPodSettingSetForDevice(v3, a2, v4, v5);
}

float _AXSAirPodsTapSpeed(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsTouchTapSpeedPreference;
  objc_opt_class();
  CFStringRef v3 = _AXSAirPodSettingForDevice(v2, a1);
  CFStringRef v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    float v6 = 0.25;
  }

  return v6;
}

void _AXSSetAirPodsTapSpeed(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsTouchTapSpeedPreference;
  CFStringRef v3 = (const __CFString *)kAXSAirPodsTapSpeedChangedNotification;
  [NSNumber numberWithFloat:];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v2, a1, v3, v4);
}

uint64_t _AXSAirPodsDefaultToneVolume(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsDefaultToneVolumePreference;
  objc_opt_class();
  CFStringRef v3 = _AXSAirPodSettingForDevice(v2, a1);
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 unsignedIntValue];
  }
  else {
    uint64_t v5 = 80;
  }

  return v5;
}

void _AXSSetAirPodsDefaultToneVolume(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = (const __CFString *)kAXSAirPodsDefaultToneVolumePreference;
  CFStringRef v4 = (const __CFString *)kAXSAirPodsDefaultToneVolumeChangedNotification;
  id v5 = [NSNumber numberWithUnsignedInt:a1];
  _AXSAirPodSettingSetForDevice(v3, a2, v4, v5);
}

uint64_t _AXSAirPodsToneVolume(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsToneVolumePreference;
  objc_opt_class();
  CFStringRef v3 = _AXSAirPodSettingForDevice(v2, a1);
  CFStringRef v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 unsignedIntValue];
  }
  else {
    uint64_t v5 = 80;
  }

  return v5;
}

uint64_t _AXSHeadsetCaseTonesEnabled(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSHeadsetCaseTonesPreference;
  objc_opt_class();
  CFStringRef v3 = _AXSAirPodSettingForDevice(v2, a1);
  CFStringRef v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 BOOLValue];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void _AXSSetHeadsetCaseTonesEnabled(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = (const __CFString *)kAXSHeadsetCaseTonesPreference;
  CFStringRef v4 = (const __CFString *)kAXSHeadsetCaseTonesChangedNotification;
  id v5 = [NSNumber numberWithUnsignedChar:a1];
  _AXSAirPodSettingSetForDevice(v3, a2, v4, v5);
}

void _AXSSetAirPodsToneVolume(unsigned int a1, uint64_t a2)
{
  if (a1 >= 0x64) {
    unsigned int v3 = 100;
  }
  else {
    unsigned int v3 = a1;
  }
  if (v3 <= 0xF) {
    uint64_t v4 = 15;
  }
  else {
    uint64_t v4 = v3;
  }
  CFStringRef v5 = (const __CFString *)kAXSAirPodsToneVolumePreference;
  CFStringRef v6 = (const __CFString *)kAXSAirPodsToneVolumeChangedNotification;
  id v7 = [NSNumber numberWithUnsignedInt:v4];
  _AXSAirPodSettingSetForDevice(v5, a2, v6, v7);
}

float _AXSAirPodsHoldDuration(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsHoldDurationPreference;
  objc_opt_class();
  unsigned int v3 = _AXSAirPodSettingForDevice(v2, a1);
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    float v6 = 0.5;
  }

  return v6;
}

void _AXSSetAirPodsHoldDuration(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsHoldDurationPreference;
  CFStringRef v3 = (const __CFString *)kAXSAirPodsHoldDurationChangedNotification;
  [NSNumber numberWithFloat:];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v2, a1, v3, v4);
}

uint64_t _AXSAirPodsVolumeSwipeEnabled(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsVolumeSwipeEnabledPreference;
  objc_opt_class();
  CFStringRef v3 = _AXSAirPodSettingForDevice(v2, a1);
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 BOOLValue];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void _AXSSetAirPodsVolumeSwipeEnabled(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = (const __CFString *)kAXSAirPodsVolumeSwipeEnabledPreference;
  CFStringRef v4 = (const __CFString *)kAXSAirPodsVolumeSwipeEnabledChangedNotification;
  id v5 = [NSNumber numberWithUnsignedChar:a1];
  _AXSAirPodSettingSetForDevice(v3, a2, v4, v5);
}

float _AXSAirPodsVolumeSwipeDuration(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsVolumeSwipeDurationPreference;
  objc_opt_class();
  CFStringRef v3 = _AXSAirPodSettingForDevice(v2, a1);
  CFStringRef v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    float v6 = 0.5;
  }

  return v6;
}

void _AXSSetAirPodsVolumeSwipeDuration(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)kAXSAirPodsVolumeSwipeDurationPreference;
  CFStringRef v3 = (const __CFString *)kAXSAirPodsVolumeSwipeDurationChangedNotification;
  [NSNumber numberWithFloat:];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v2, a1, v3, v4);
}

float _AXSOpaqueTouchTapSpeed()
{
  char v1 = 0;
  float result = _getFloatPreference((const __CFString *)kAXSOpaqueTouchTapSpeedPreference, 0, &v1);
  if (!v1) {
    return 0.5;
  }
  return result;
}

void _AXSSetOpaqueTouchTapSpeed(float a1)
{
  float v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSOpaqueTouchTapSpeedPreference, kCFNumberFloatType, &v1, (__CFString *)kAXSOpaqueTouchTapSpeedChangedNotification, 0);
}

void _AXSSetAccessibilityHasNoticedOpaqueTouchDevice(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSOpaqueTouchDeviceEverNoticedPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);

  _updateAccessibilitySettings();
}

uint64_t _AXSAccessibilityHasNoticedOpaqueTouchDevice()
{
  char v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSOpaqueTouchDeviceEverNoticedPreference, &v1);
  if (v1) {
    return result;
  }
  else {
    return 0;
  }
}

void AXCatchUserDefaultsInconsistencies()
{
  if (!_AXSCanDisableApplicationAccessibility() && !_AXSApplicationAccessibilityEnabled())
  {
    id v0 = AXLogCommon();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v1 = 0;
      _os_log_impl(&dword_190274000, v0, OS_LOG_TYPE_INFO, "Checking for user defaults inconsistencies and can't disable AX just yet.", v1, 2u);
    }

    _AXSApplicationAccessibilitySetEnabled(1);
  }
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v0 = _AXSAccessibilityEnablers();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v1 = [v0 allKeys];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v7 = [v0 objectForKey:v6];
        int v8 = v7[2]();

        if (v8)
        {
          int v10 = AXLogCommon();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v6;
            _os_log_impl(&dword_190274000, v10, OS_LOG_TYPE_DEFAULT, "Still an ax enabler: %@", buf, 0xCu);
          }

          uint64_t v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_13:

  return v9;
}

void AXBeginListeningToUserDefaultsChanges()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  char v1 = [v0 bundleIdentifier];
  char v2 = [v1 isEqualToString:@"com.apple.backboardd"];

  if (v2)
  {
    ObservePreferenceDistributed(kAXSLiveSpeechEnabledPreference, @"com.apple.accessibility.cache.livespeech");
    ObservePreferenceDistributed(kAXSHoverTextEnabledPreference, @"com.apple.accessibility.cache.hovertext");
    ObservePreferenceDistributed(kAXSZoomTouchEnabledPreference, @"com.apple.accessibility.cache.zoom");
    ObservePreferenceDistributed(kAXSVoiceOverTouchEnabledPreference, @"com.apple.accessibility.cache.vot");
    ObservePreferenceDistributed(kAXSBrailleScreenInputEnabledPreference, @"com.apple.accessibility.cache.bsi");
    [(id)DefaultsObserver startObservingPreference:kAXSVoiceOverTouchEnabledPreference andPerformBlock:&__block_literal_global_1799];
    ObservePreferenceDistributed(kAXSAssistiveTouchEnabledPreference, @"com.apple.accessibility.cache.ast");
    [(id)DefaultsObserver startObservingPreference:kAXSAssistiveTouchEnabledPreference andPerformBlock:&__block_literal_global_1802];
    ObservePreferenceDistributed(kAXSDwellControlEnabledPreference, @"com.apple.accessibility.cache.dwell.control");
    ObservePreferenceDistributed(kAXSVisualAlertEnabledPreference, @"com.apple.accessibility.cache.visual.alert");
    ObservePreferenceDistributed(kAXSMonoAudioEnabledPreference, @"com.apple.accessibility.cache.mono.audio");
    ObservePreferenceDistributed(kAXSAlwaysShowVolumeControlEnabledPreference, @"com.apple.accessibility.cache.alwaysshowvolume");
    ObservePreferenceDistributed(kAXSEarpieceNoiseCancellationPreference, @"com.apple.accessibility.cache.earpiece.noise");
    ObservePreferenceDistributed(kAXSExtendedVoiceIsolationMediaModesEnabledPreference, @"com.apple.accessibility.cache.extendedvoiceisolationmodes");
    ObservePreferenceDistributed(kAXSHearingAidCompliancePreference, @"com.apple.accessibility.cache.hac.audio");
    ObservePreferenceDistributed(kAXSGrayscaleEnabledPreference, @"com.apple.accessibility.cache.grayscale");
    ObservePreferenceDistributed(kAXSDisplayFilterShowInitialAlertPreference, @"com.apple.accessibility.cache.displayfilter.showinitialalert");
    ObservePreferenceDistributed(kAXSSpeechSettingsDisabledByManagedConfigurationPreference, @"com.apple.accessibility.cache.speech.settings.disabled.by.mc");
    ObservePreferenceDistributed(kAXSQuickSpeakEnabledPreference, @"com.apple.accessibility.cache.quick.speak");
    ObservePreferenceDistributed(kAXSQuickSpeakHighlightTextEnabledPreference, @"com.apple.accessibility.cache.quick.speak.highlight.text");
    ObservePreferenceDistributed(kAXSApplicationAccessibilityEnabledPreference, @"com.apple.accessibility.cache.app.ax");
    [(id)DefaultsObserver startObservingPreference:kAXSApplicationAccessibilityEnabledPreference andPerformBlock:&__block_literal_global_1804];
    ObservePreferenceDistributed(kAXSAssistiveTouchScannerEnabledPreference, @"com.apple.accessibility.cache.switch.control");
    [(id)DefaultsObserver startObservingPreference:kAXSAssistiveTouchScannerEnabledPreference andPerformBlock:&__block_literal_global_1806];
    ObservePreferenceDistributed(kAXSAccessibilityEnabledPreference, @"com.apple.accessibility.cache.ax");
    ObservePreferenceDistributed(kAXSGuidedAccessEnabledPreference, @"com.apple.accessibility.cache.guided.access");
    ObservePreferenceDistributed(kAXSGuidedAccessEnabledByManagedConfigurationPreference, @"com.apple.accessibility.cache.guided.access.via.mdm");
    ObservePreferenceDistributed(kAXSGuidedAccessHasPasscodePreference, @"com.apple.accessibility.cache.gax.haspasscode");
    ObservePreferenceDistributed(kAXSZoomSpeakUnderFingerEnabledPreference, @"com.apple.accessibility.cache.zoom.speakunderfinger");
    ObservePreferenceDistributed(kAXSZoomTouchSmoothScalingPreference, @"com.apple.accessibility.cache.zoom.smoothscaling");
    ObservePreferenceDistributed(kAXSZoomTouchReadyForObserversPreference, @"com.apple.accessibility.cache.zoom.readyForObservers");
    ObservePreferenceDistributed(kAXSLogValidationErrorsPreference, @"com.apple.accessibility.cache.internal.logvalidationerrors");
    ObservePreferenceDistributed(kAXSReportValidationErrorsPreference, @"com.apple.accessibility.cache.internal.reportvalidationerrors");
    ObservePreferenceDistributed(kAXSCrashOnValidationErrorsPreference, @"com.apple.accessibility.cache.internal.crashonvalidationerrors");
    ObservePreferenceDistributed(kAXSInPerformanceTestModePreference, @"com.apple.accessibility.cache.performance.testing.mode");
    ObservePreferenceDistributed(kAXSAXInspectorPreference, @"com.apple.accessibility.cache.internal.axinspector");
    ObservePreferenceDistributed(kAXSClosedCaptioningEnabledByiTunesPreference, @"com.apple.accessibility.cache.captioning");
    ObservePreferenceDistributed(kAXSVoiceOverTouchUsageConfirmedPreference, @"com.apple.accessibility.cache.vo.usage.confirm");
    ObservePreferenceDistributed(kAXSVoiceOverTouchUserHasReadNoHomeButtonGesturePreference, @"com.apple.accessibility.cache.vo.user.has.read.no.home.button.gesture");
    ObservePreferenceDistributed(kAXSVoiceOverTouchScreenCurtainPreference, @"com.apple.accessibility.cache.vo.screen.curtain");
    ObservePreferenceDistributed(kAXSAutomationLocalizedStringLookupInfoEnabledPreference, @"com.apple.accessibility.cache.automation.localized.lookup");
    ObservePreferenceDistributed(kAXSAutomationEnabledPreference, @"com.apple.accessibility.cache.automation.enabled");
    ObservePreferenceDistributed(kAXSAutomationHitpointWarpingEnabledPreference, @"com.apple.accessibility.cache.automation.hitpoint_warping.enabled");
    ObservePreferenceDistributed(kAXSSiriSemanticContextEnabledPreference, @"com.apple.accessibility.cache.siri.semantic.context.enabled");
    ObservePreferenceDistributed(kAXSPreferredFontSizePreference, @"com.apple.accessibility.cache.large.text.change");
    ObservePreferenceDistributed(kAXSVoiceOverTouchSpeakingRatePreference, @"com.apple.accessibility.cache.vot.speaking.rate");
    ObservePreferenceDistributed(kAXSVoiceOverTouchVolumePreference, @"com.apple.accessibility.cache.vot.volume");
    ObservePreferenceDistributed(kAXSVoiceOverTouchMediaDuckingModePreference, @"com.apple.accessibility.cache.vot.media.ducking.mode");
    ObservePreferenceDistributed(kAXSVoiceOverTouchTutorialUsageConfirmedPreference, @"com.apple.accessibility.cache.vo.usage.tutorial.confirm");
    ObservePreferenceDistributed(kAXSEnhanceTextLegibilityPreference, @"com.apple.accessibility.cache.enhance.text.legibility");
    ObservePreferenceDistributed(kAXSEnhanceBackgroundContrastPreference, @"com.apple.accessibility.cache.enhance.background.contrast");
    ObservePreferenceDistributed(kAXSReduceMotionPreference, @"com.apple.accessibility.cache.reduce.motion");
    ObservePreferenceDistributed(kAXSReduceMotionAutoplayMessagesEffectsPreference, @"com.apple.accessibility.cache.reduce.motion.autoplay.messages.effects");
    ObservePreferenceDistributed(kAXSReduceMotionAutoplayAnimatedImagesPreference, @"com.apple.accessibility.cache.reduce.motion.autoplay.animated.images");
    ObservePreferenceDistributed(kAXSReduceMotionAutoplayVideoPreviewsPreference, @"com.apple.accessibility.cache.reduce.motion.autoplay.video.previews");
    ObservePreferenceDistributed(kAXSReduceMotionReduceSlideTransitionsPreference, @"com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions");
    ObservePreferenceDistributed(kAXSIncreaseButtonLegibilityPreference, @"com.apple.accessibility.cache.increase.button.legibility");
    ObservePreferenceDistributed(kAXSButtonShapesEnabledPreference, @"com.apple.accessibility.cache.button.shapes.enabled");
    ObservePreferenceDistributed(kAXSUseDarkerKeyboardPreference, @"com.apple.accessibility.cache.use.darker.keyboard.enabled");
    ObservePreferenceDistributed(kAXSDarkenSystemColorsEnabledPreference, @"com.apple.accessibility.cache.darken.system.colors.enabled");
    ObservePreferenceDistributed(kAXSHighContrastFocusIndicatorsEnabledPreference, @"com.apple.accessibility.cache.use.prominent.focus.indicators");
    ObservePreferenceDistributed(kAXSUseSingleSystemColorPreference, @"com.apple.accessibility.cache.use.single.system.color.enabled");
    ObservePreferenceDistributed(kAXSLowerCaseKeyboardEnabledPreference, @"com.apple.accessibility.cache.lower.case.keyboard.enabled");
    ObservePreferenceDistributed(kAXSHearingAidRingtoneStreamingPreference, @"com.apple.accessibility.cache.hearing.aid.ringtone.streaming");
    ObservePreferenceDistributed(kAXSVoiceOverTouchSpeakTimeOnWakePreference, @"com.apple.accessibility.cache.AXSCacheVoiceOverSpeakTimeOnWakeNotification");
    ObservePreferenceDistributed(kAXSWalkieTalkieTapToTalkPreference, @"com.apple.accessibility.cache.AXSCacheWalkieTalkieTapToTalkNotification");
    ObservePreferenceDistributed(kAXSAppSwitcherAutoSelectPreference, @"com.apple.accessibility.cache.AXSCacheAppSwitcherAutoSelectNotification");
    ObservePreferenceDistributed(kAXSHoverTextFontSizePreference, @"com.apple.accessibility.cache.hovertext.fontsize.change");
    ObservePreferenceDistributed(kAXSHoverTextBackgroundOpacityPreference, @"com.apple.accessibility.cache.hovertext.backgroundopacity.change");
    ObservePreferenceDistributed(kAXSHoverTextDisplayModePreference, @"com.apple.accessibility.cache.hovertext.displaymode.change");
    ObservePreferenceDistributed(kAXSHoverTextTypingDisplayModePreference, @"com.apple.accessibility.cache.hovertext.typing.displaymode.change");
    ObservePreferenceDistributed(kAXSForceTouchEnabledPreference, @"com.apple.accessibility.cache.forcetouch.enabled.changed");
    ObservePreferenceDistributed(kAXSForceTouchSensitivityPreference, @"com.apple.accessibility.cache.forcetouch.sensitivity.changed");
    ObservePreferenceDistributed(kAXSForceTouchTimingPreference, @"com.apple.accessibility.cache.forcetouch.timing.changed");
    ObservePreferenceDistributed(kAXSIncreaseBrightnessFloorEnabledPreference, @"com.apple.accessibility.cache.increase.brightness.floor.enabled");
    [(id)DefaultsObserver startObservingPreference:kAXSInvertColorsEnabledPreference andPerformBlock:&__block_literal_global_1808];
    [(id)DefaultsObserver startObservingPreference:kAXSClassicInvertColorsPreference andPerformBlock:&__block_literal_global_1808];
    ObservePreferenceDistributed(kAXSInvertColorsEnabledPreference, @"com.apple.accessibility.cache.invert.colors");
    ObservePreferenceDistributed(kAXSClassicInvertColorsPreference, @"com.apple.accessibility.cache.classic.invert.colors");
    AXCatchUserDefaultsInconsistencies();
  }
  else
  {
    uint64_t v3 = AXSupportLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_190274000, v3, OS_LOG_TYPE_DEFAULT, "This process is not responsible for listening to AX user defaults changes. Please file a bug.", v4, 2u);
    }
  }
}

void ObservePreferenceDistributed(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __ObservePreferenceDistributed_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  void v2[4] = a1;
  v2[5] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __AXBeginListeningToUserDefaultsChanges_block_invoke()
{
  int BooleanPreference = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledPreference, 0);
  char v3 = 0;
  int v1 = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledByiTunesPreference, &v3);
  if (v3) {
    BOOL v2 = v1 == BooleanPreference;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  if (BooleanPreference)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
    }
    if (_kAXSCacheSwitchControlEnabled) {
      _AXSAssistiveTouchScannerSetEnabled(0);
    }
    _AXSApplicationAccessibilitySetEnabled(1);
    _kickstartProcess("com.apple.VoiceOverTouch");
  }
}

void __AXBeginListeningToUserDefaultsChanges_block_invoke_2()
{
  if (_getBooleanPreference((const __CFString *)kAXSAssistiveTouchEnabledPreference, 0))
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
    }
    if (_kAXSCacheSwitchControlEnabled) {
      _AXSAssistiveTouchScannerSetEnabled(0);
    }
    _kickstartProcess("com.apple.assistivetouchd");
  }
  else
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchHardwareEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:0], (const __CFString *)kAXSAssistiveTouchHardwareChangedNotification);
    _updateAccessibilitySettings();
  }
}

void __AXBeginListeningToUserDefaultsChanges_block_invoke_3()
{
  if (!_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(1);
  }
}

void __AXBeginListeningToUserDefaultsChanges_block_invoke_4()
{
  if (_getBooleanPreference((const __CFString *)kAXSAssistiveTouchScannerEnabledPreference, 0))
  {
    _disableConflictingSettingsForSwitchControl();
    _AXSApplicationAccessibilitySetEnabled(1);
    _kickstartProcess("com.apple.assistivetouchd");
  }
}

void _disableConflictingSettingsForSwitchControl()
{
  if (_AXSAssistiveTouchEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1810);
  }
  if (_kAXSAssistiveTouchEnabledCache) {
    _AXSAssistiveTouchSetEnabled(0);
  }
  if (_AXSVoiceOverTouchEnabled()) {
    _AXSVoiceOverTouchSetEnabled(0);
  }
  if (_AXSFullKeyboardAccessEnabled())
  {
    _kAXSCacheFullKeyboardAccessEnabled = 0;
    _setPreferenceAppWithNotification((const __CFString *)kAXSFullKeyboardAccessEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:0], @"com.apple.accessibility.cache.full.keyboard.access");
    _updateAccessibilitySettings();
    if (_AXSCanDisableApplicationAccessibility())
    {
      _AXSApplicationAccessibilitySetEnabled(0);
    }
  }
}

uint64_t __AXBeginListeningToUserDefaultsChanges_block_invoke_5()
{
  char v5 = 1;
  int v0 = AXSGetPreferenceValue((const __CFString *)kAXSInvertColorsEnabledPreference, 0);
  int BooleanPreference = _getBooleanPreference((const __CFString *)kAXSClassicInvertColorsPreference, &v5);
  BOOL v3 = v0 == 1 || BooleanPreference != 0;
  return _AXSInvertColorsDisplaySetEnabled(v3);
}

BOOL _AXSInvertColorsEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSInvertColorsEnabledPreference, 0) == 1;
}

uint64_t _AXSInvertColorsDisplaySetEnabled(int a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  BOOL v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Invert colors HW display toggled: %d", (uint8_t *)v4, 8u);
  }

  if (a1)
  {
    MADisplayFilterPrefSetType();
    return MADisplayFilterPrefSetCategoryEnabled();
  }
  uint64_t result = MADisplayFilterPrefGetType();
  if (result == 512)
  {
    uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
    if (result) {
      return MADisplayFilterPrefSetCategoryEnabled();
    }
  }
  return result;
}

void _AXSAssistiveTouchSetEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSAssistiveTouchEnabledCache = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.ast");
  _updateAccessibilitySettings();
  if (!v1)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchHardwareEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:0], (const __CFString *)kAXSAssistiveTouchHardwareChangedNotification);
    _updateAccessibilitySettings();
  }
  char v3 = 0;
  int BooleanPreference = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchEnabledByiTunesPreference, &v3);
  if (v3 && BooleanPreference != v1)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  if (v1)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
    }
    if (_kAXSCacheSwitchControlEnabled) {
      _AXSAssistiveTouchScannerSetEnabled(0);
    }
  }
}

uint64_t _AXSDwellControlEnabled()
{
  if (_AXSDwellControlEnabled_onceToken != -1) {
    dispatch_once(&_AXSDwellControlEnabled_onceToken, &__block_literal_global_1812);
  }
  return _kAXSCacheDwellControlEnabled;
}

void _AXSDwellControlSetEnabled(uint64_t a1)
{
  _kAXSCacheDwellControlEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSDwellControlEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.dwell.control");

  _updateAccessibilitySettings();
}

uint64_t _AXSSoundActionEnabledForSwitchControl()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v0 = [NSClassFromString(&cfstr_Axsettings.isa) valueForKey:@"sharedInstance"];
  int v1 = [v0 valueForKey:@"assistiveTouchSwitches"];

  if (v1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = [*(id *)(*((void *)&v11 + 1) + 8 * v6) source:v11];
          char v8 = [v7 isEqualToString:@"SCATSwitchSourceSound"];

          if (v8)
          {
            uint64_t v9 = 1;
            goto LABEL_12;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v9 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t _AXSSwitchControlEnabledAndNeedsCameraOnLockScreen()
{
  if (_AXSSwitchControlEnabledAndNeedsCameraOnLockScreen_onceToken != -1) {
    dispatch_once(&_AXSSwitchControlEnabledAndNeedsCameraOnLockScreen_onceToken, &__block_literal_global_1820);
  }
  uint64_t v0 = _kAXSCacheSwitchControlNeedsCameraOnLockScreen;
  int v1 = _kAXSCacheNeedsCameraOnLockScreen;
  if (_kAXSCacheNeedsCameraOnLockScreen)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
    }
    int v1 = _kAXSCacheSwitchControlEnabled != 0;
  }
  _kAXSCacheSwitchControlNeedsCameraOnLockScreen = v1;
  if (v0 != v1)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSSwitchControlNeedsCameraOnLockScreenNotification, 0, 0, 1u);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSSwitchControlNeedsCameraOnLockScreenNotification, 0, 0, 1u);
    return _kAXSCacheSwitchControlNeedsCameraOnLockScreen;
  }
  return v0;
}

void _AXSSetAccessibilityNeedsCameraOnLockScreen(uint64_t a1)
{
  _kAXSCacheNeedsCameraOnLockScreen = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAccessibilityNeedsCameraOnLockScreenPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.needs.camera.cache");

  _updateAccessibilitySettings();
}

uint64_t _AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen()
{
  if (_AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen_onceToken != -1) {
    dispatch_once(&_AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen_onceToken, &__block_literal_global_1822);
  }
  uint64_t v0 = _kAXSCacheSwitchControlNeedsMicrophoneOnLockScreen;
  int v1 = _kAXSCacheNeedsMicrophoneOnLockScreen;
  if (_kAXSCacheNeedsMicrophoneOnLockScreen)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
    }
    int v1 = _kAXSCacheSwitchControlEnabled != 0;
  }
  _kAXSCacheSwitchControlNeedsMicrophoneOnLockScreen = v1;
  if (v0 != v1)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSSwitchControlNeedsMicrophoneOnLockScreenNotification, 0, 0, 1u);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSSwitchControlNeedsMicrophoneOnLockScreenNotification, 0, 0, 1u);
    return _kAXSCacheSwitchControlNeedsMicrophoneOnLockScreen;
  }
  return v0;
}

void _AXSSetAccessibilityNeedsMicrophoneOnLockScreen(uint64_t a1)
{
  _kAXSCacheNeedsMicrophoneOnLockScreen = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAccessibilityNeedsMicrophoneOnLockScreenPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.needs.microphone.cache");

  _updateAccessibilitySettings();
}

uint64_t _AXSAssistiveTouchRepairIncarnationModeEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSAssistiveTouchRepairIncarnationModePreference, 0, (uint64_t)_handleAssistiveTouchPrefsChangedNotification);
}

void _handleAssistiveTouchPrefsChangedNotification()
{
}

void _AXSAssistiveTouchSetRepairIncarnationModeEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchRepairIncarnationModePreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);
  _updateAccessibilitySettings();
  _AXSAssistiveTouchSetEnabled(a1);

  _AXSAssistiveTouchSetUIEnabled(a1);
}

void _AXSAssistiveTouchSetUIEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchUIEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);

  _updateAccessibilitySettings();
}

uint64_t _AXSAssistiveTouchUIEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSAssistiveTouchUIEnabledPreference, 0, (uint64_t)_handleAssistiveTouchPrefsChangedNotification);
}

uint64_t _AXSAssistiveTouchHardwareEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSAssistiveTouchHardwareEnabledPreference, 0, (uint64_t)_handleAssistiveTouchPrefsChangedNotification);
}

void _AXSAssistiveTouchSetHardwareEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchHardwareEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)kAXSAssistiveTouchHardwareChangedNotification);
  _updateAccessibilitySettings();
  if (a1)
  {
    if (_AXSAssistiveTouchEnabled_onceToken != -1) {
      dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1810);
    }
    if (!_kAXSAssistiveTouchEnabledCache)
    {
      _AXSAssistiveTouchSetEnabled(a1);
      _AXSAssistiveTouchSetUIEnabled(0);
    }
  }
  else
  {
    if (_AXSAssistiveTouchEnabled_onceToken != -1) {
      dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1810);
    }
    if (_kAXSAssistiveTouchEnabledCache)
    {
      uint64_t PrefBooleanValueWithCustomCallback = _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSAssistiveTouchUIEnabledPreference, 0, (uint64_t)_handleAssistiveTouchPrefsChangedNotification);
      if (!PrefBooleanValueWithCustomCallback)
      {
        _AXSAssistiveTouchSetEnabled(PrefBooleanValueWithCustomCallback);
      }
    }
  }
}

void _AXSAssistiveTouchScannerSetEnabled(uint64_t a1)
{
  int v1 = a1;
  if (_kAXSCacheSwitchControlEnabled != a1)
  {
    _kAXSCacheSwitchControlEnabled = a1;
    _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchScannerEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.switch.control");
    _updateAccessibilitySettings();
  }
  if (v1)
  {
    _disableConflictingSettingsForSwitchControl();
    _kickstartProcess("com.apple.assistivetouchd");
  }
}

uint64_t _AXSAccessibilitySecureIntentProvider()
{
  if (_AXSAccessibilitySecureIntentProvider_onceToken != -1) {
    dispatch_once(&_AXSAccessibilitySecureIntentProvider_onceToken, &__block_literal_global_1826);
  }
  return _kAXSCacheSecureIntentProviderPreference;
}

void _AXSAccessibilitySetSecureIntentProvider(uint64_t a1)
{
  _kAXSCacheSecureIntentProviderPreference = a1;
  CFStringRef v1 = (const __CFString *)kAXSSecureIntentProviderPreference;
  id v2 = (const void *)[NSNumber numberWithUnsignedInt:a1];

  _setPreferenceAppWithNotification(v1, 0, v2, @"com.apple.accessibility.cache.secure.intent.provider");
}

BOOL _AXSExtendedKeyboardPredictionsEnabled()
{
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
  }
  if (_kAXSCacheSwitchControlEnabled)
  {
    if (_AXSSwitchControlExtendedKeyboardPredictionsEnabled_onceToken != -1) {
      dispatch_once(&_AXSSwitchControlExtendedKeyboardPredictionsEnabled_onceToken, &__block_literal_global_1828);
    }
    if (_kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled) {
      return 1;
    }
  }
  if (_AXSAssistiveTouchEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1810);
  }
  if (!_kAXSAssistiveTouchEnabledCache) {
    return 0;
  }
  if (_AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_onceToken, &__block_literal_global_1830);
  }
  return _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled != 0;
}

uint64_t _AXSSwitchControlExtendedKeyboardPredictionsEnabled()
{
  if (_AXSSwitchControlExtendedKeyboardPredictionsEnabled_onceToken != -1) {
    dispatch_once(&_AXSSwitchControlExtendedKeyboardPredictionsEnabled_onceToken, &__block_literal_global_1828);
  }
  return _kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled;
}

uint64_t _AXSAssistiveTouchExtendedKeyboardPredictionsEnabled()
{
  if (_AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_onceToken, &__block_literal_global_1830);
  }
  return _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled;
}

void _AXSSwitchControlExtendedKeyboardPredictionsSetEnabled(uint64_t a1)
{
  _kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSwitchControlUseExtendedKeyboardPredictionsEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.switch.control.useextendedkeyboardpredictions");

  _updateAccessibilitySettings();
}

void _AXSAssistiveTouchExtendedKeyboardPredictionsSetEnabled(uint64_t a1)
{
  _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchUseExtendedKeyboardPredictionsEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.assistivetouch.useextendedkeyboardpredictions");

  _updateAccessibilitySettings();
}

uint64_t _AXSDidInitializeNotificationListeners()
{
  return s_axDidInitializeListeners;
}

uint64_t _accessibilityEnabled()
{
  if (_accessibilityEnabled_onceToken != -1) {
    dispatch_once(&_accessibilityEnabled_onceToken, &__block_literal_global_1832);
  }
  return _kAXSCacheAccessibilityEnabled;
}

void _AXSSetAccessibilityEnabled()
{
  if (!_kAXSCacheAccessibilityEnabled)
  {
    _kAXSCacheAccessibilityEnabled = 1;
    _setPreferenceAppWithNotification((const __CFString *)kAXSAccessibilityEnabledPreference, 0, (const void *)*MEMORY[0x1E4F1CFD0], @"com.apple.accessibility.cache.ax");
  }
}

void _AXSTripleClickAddOption(uint64_t a1)
{
  if ((_isComputedTripleClickOption(a1) & 1) == 0)
  {
    id v2 = _AXSTripleClickCopyOptions();
    uint64_t v6 = v2;
    if (v2) {
      id v3 = (id)[(__CFArray *)v2 mutableCopy];
    }
    else {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v4 = v3;
    uint64_t v5 = [NSNumber numberWithUnsignedInt:a1];
    if (([(__CFArray *)v6 containsObject:v5] & 1) == 0)
    {
      [v4 addObject:v5];
      _AXSSetTripleClickOptions(v4);
    }
  }
}

uint64_t _isComputedTripleClickOption(uint64_t a1)
{
  id v2 = _computedTripleClickOptions();
  id v3 = [NSNumber numberWithUnsignedInt:a1];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

void _AXSSetTripleClickOptions(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:a1];
  uint64_t v3 = [a1 count];
  if (v3 != [v2 count])
  {
    uint64_t v4 = AXSupportLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      _AXSSetTripleClickOptions_cold_1();
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = _computedTripleClickOptions();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v2, "containsObject:", v10, (void)v16))
        {
          long long v11 = (void *)[v2 mutableCopy];
          [v11 removeObject:v10];

          id v2 = v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  long long v12 = [v2 array];
  long long v13 = AXLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = a1;
    _os_log_impl(&dword_190274000, v13, OS_LOG_TYPE_DEFAULT, "Setting triple click options: %@", buf, 0xCu);
  }

  if (os_variant_has_internal_ui())
  {
    long long v14 = AXLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v15;
      _os_log_impl(&dword_190274000, v14, OS_LOG_TYPE_DEFAULT, "Setting triple click options: %@", buf, 0xCu);
    }
  }
  _setPreferenceAppWithNotification((const __CFString *)kAXSTripleClickPreference, 0, v12, 0);
  _didUpdateTripleClickOptions();
}

void _AXSTripleClickRemoveOption(uint64_t a1)
{
  if ((_isComputedTripleClickOption(a1) & 1) == 0)
  {
    id v2 = _AXSTripleClickCopyOptions();
    uint64_t v7 = v2;
    if (v2) {
      id v3 = (id)[(__CFArray *)v2 mutableCopy];
    }
    else {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v4 = v3;
    uint64_t v5 = [NSNumber numberWithUnsignedInt:a1];
    uint64_t v6 = [v4 indexOfObject:v5];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v4 removeObjectAtIndex:v6];
      _AXSSetTripleClickOptions(v4);
    }
  }
}

void _AXSHandleTripleClickHomeButtonPress()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = AXUtilsBackBoardServer();
  if (objc_opt_respondsToSelector())
  {
    [v0 tripleClickHomeButtonPress];
  }
  else
  {
    CFStringRef v1 = AXSupportLogCommon();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v2 = 0;
      _os_log_impl(&dword_190274000, v1, OS_LOG_TYPE_DEFAULT, "BB Server does not respond to triple click", v2, 2u);
    }
  }
}

void sub_19028D254(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    uint64_t v10 = AXSupportLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_190274000, v10, OS_LOG_TYPE_DEFAULT, "couldn't message BB server: %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x19028D228);
  }
  _Unwind_Resume(exception_object);
}

id AXUtilsBackBoardServer()
{
  if (AXUtilsBackBoardServer_onceToken != -1) {
    dispatch_once(&AXUtilsBackBoardServer_onceToken, &__block_literal_global_2838);
  }
  uint64_t v0 = [NSClassFromString(&cfstr_Axbackboardser_0.isa) valueForKey:@"server"];

  return v0;
}

void sub_19028D390(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    uint64_t v10 = AXSupportLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_190274000, v10, OS_LOG_TYPE_DEFAULT, "couldn't load AXBackBoardServer: %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x19028D33CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _AXSHandleHomeButtonPressSwallowedForGuidedAccess()
{
  CFStringRef v1 = AXUtilsBackBoardServer();
  if (objc_opt_respondsToSelector()) {
    [v1 homeClickSwallowedForGuidedAccess];
  }
  return MEMORY[0x1F41817F8]();
}

void sub_19028D554(_Unwind_Exception *a1)
{
}

uint64_t _AXSTripleClickIsComputedOption(uint64_t a1)
{
  return _isComputedTripleClickOption(a1);
}

uint64_t _AXSTripleClickCopyAllComputedOptions()
{
  return objc_claimAutoreleasedReturnValue();
}

id _computedTripleClickOptions()
{
  if (_computedTripleClickOptions_onceToken != -1) {
    dispatch_once(&_computedTripleClickOptions_onceToken, &__block_literal_global_2846);
  }
  uint64_t v0 = (void *)_computedTripleClickOptions_ComputedOptions;

  return v0;
}

uint64_t _didUpdateTripleClickOptions()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSTripleHomeEnabledNotification, 0, 0, 1u);

  return _updateAccessibilitySettings();
}

uint64_t _AXSGenericAccessibilityClientEnabled()
{
  if (_AXSGenericAccessibilityClientEnabled_onceToken != -1) {
    dispatch_once(&_AXSGenericAccessibilityClientEnabled_onceToken, &__block_literal_global_1863);
  }
  return _kAXSCacheGenericAccessibilityClientEnabled;
}

void _AXSSetGenericAccessibilityClientEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheGenericAccessibilityClientEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGenericAccessibilityClientEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.generic.accessibility.client");
  _updateAccessibilitySettings();
  if (v1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v2 = 0;
  }

  _AXSApplicationAccessibilitySetEnabled(v2);
}

uint64_t _AXSClarityUIEnabled()
{
  if (_AXSClarityUIEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityUIEnabled_onceToken, &__block_literal_global_1865);
  }
  return _kAXSCacheClarityUIEnabled;
}

uint64_t _AXSClarityUISetEnabled(uint64_t a1)
{
  _kAXSCacheClarityUIEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSClarityUIEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.clarityui");
  _updateAccessibilitySettings();

  return _didUpdateTripleClickOptions();
}

id _AXSStandardBundleIdentifierForClarityBundleIdentifier(void *a1)
{
  return _AXSClarityUIConvertBundleIdentifier(a1, 1);
}

id _AXSClarityUIConvertBundleIdentifier(void *a1, int a2)
{
  id v3 = a1;
  if (_AXSClarityUIConvertBundleIdentifier_onceToken != -1) {
    dispatch_once(&_AXSClarityUIConvertBundleIdentifier_onceToken, &__block_literal_global_2859);
  }
  uint64_t v4 = &_AXSClarityUIConvertBundleIdentifier_ClarityToStandardBundleIdentifiers;
  if (!a2) {
    uint64_t v4 = &_AXSClarityUIConvertBundleIdentifier_StandardToClarityBundleIdentifiers;
  }
  id v5 = [(id)*v4 objectForKeyedSubscript:v3];
  if (!v5) {
    id v5 = v3;
  }

  return v5;
}

id _AXSClarityBundleIdentifierForStandardBundleIdentifier(void *a1)
{
  return _AXSClarityUIConvertBundleIdentifier(a1, 0);
}

void _AXSCommandAndControlSetEnabled(uint64_t a1)
{
  int v1 = a1;
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  _kAXSCacheCommandAndControlEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSCommandAndControlEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.command.and.control");
  _updateAccessibilitySettings();
  if (v1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      goto LABEL_6;
    }
    uint64_t v2 = 0;
  }
  _AXSApplicationAccessibilitySetEnabled(v2);
LABEL_6:
  id v3 = AXSupportLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl(&dword_190274000, v3, OS_LOG_TYPE_DEFAULT, "Set Voice Control enabled: %d", (uint8_t *)v4, 8u);
  }

  if (v1) {
    _kickstartProcess("com.apple.commandandcontrol");
  }
}

void _AXSCommandAndControlCarPlaySetEnabled(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Set Voice Control CarPlay enabled: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheCommandAndControlCarPlayEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSCommandAndControlCarPlayEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.command.and.control.carplay");
  _updateAccessibilitySettings();
  if (a1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
    _kickstartProcess("com.apple.commandandcontrol");
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

void _AXSFullKeyboardAccessSetEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheFullKeyboardAccessEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSFullKeyboardAccessEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.full.keyboard.access");
  _updateAccessibilitySettings();
  if (v1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
    }
    if (_kAXSCacheSwitchControlEnabled) {
      _AXSAssistiveTouchScannerSetEnabled(0);
    }
    _kickstartProcess("com.apple.fullkeyboardaccess");
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

uint64_t _AXSFullKeyboardAccessFocusRingEnabled()
{
  if (_AXSFullKeyboardAccessFocusRingEnabled_onceToken != -1) {
    dispatch_once(&_AXSFullKeyboardAccessFocusRingEnabled_onceToken, &__block_literal_global_1884);
  }
  return _kAXSCacheFullKeyboardAccessFocusRingEnabled;
}

void _AXSFullKeyboardAccessSetFocusRingEnabled(uint64_t a1)
{
  _kAXSCacheFullKeyboardAccessFocusRingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSFullKeyboardAccessFocusRingEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.full.keyboard.access.focus.ring");

  _updateAccessibilitySettings();
}

uint64_t _AXSFullKeyboardAccessPassthroughModeEnabled()
{
  if (_AXSFullKeyboardAccessPassthroughModeEnabled_onceToken != -1) {
    dispatch_once(&_AXSFullKeyboardAccessPassthroughModeEnabled_onceToken, &__block_literal_global_1886);
  }
  return _kAXSCacheFullKeyboardAccessPassthroughModeEnabled;
}

void _AXSFullKeyboardAccessSetPassthroughModeEnabled(uint64_t a1)
{
  _kAXSCacheFullKeyboardAccessPassthroughModeEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSFullKeyboardAccessPassthroughModeEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.full.keyboard.access.passthrough.mode");

  _updateAccessibilitySettings();
}

uint64_t _AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation()
{
  if (_AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_onceToken != -1) {
    dispatch_once(&_AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_onceToken, &__block_literal_global_1888);
  }
  return _AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_UsesSimulatedKeyboard;
}

uint64_t _AXSLiveTranscriptionEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  if (_AXSLiveTranscriptionEnabled_onceToken != -1) {
    dispatch_once(&_AXSLiveTranscriptionEnabled_onceToken, &__block_literal_global_1893);
  }
  return _kAXSCacheLiveTranscriptionEnabled;
}

void _AXSLiveTranscriptionSetEnabled(uint64_t a1)
{
  _kAXSCacheLiveTranscriptionEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveTranscriptionEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"_AXSCacheLiveTranscriptionNotification");

  _updateAccessibilitySettings();
}

uint64_t _AXSLiveTranscriptionInCallEnabled()
{
  return 1;
}

uint64_t _AXSLiveTranscriptionMicOn()
{
  return _getBooleanPreference((const __CFString *)_kAXSLiveTranscriptionMicOnPreference, 0);
}

void _AXSLiveTranscriptionSetMicOn(uint64_t a1)
{
  CFStringRef v1 = (const __CFString *)_kAXSLiveTranscriptionMicOnPreference;
  uint64_t v2 = (const void *)[NSNumber numberWithUnsignedChar:a1];
  CFStringRef v3 = (const __CFString *)kAXSLiveTranscriptionMicOnDidChangeNotification;

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

uint64_t _AXSLiveTranscriptionPaused()
{
  return _getBooleanPreference((const __CFString *)_kAXSLiveTranscriptionPausedPreference, 0);
}

void _AXSLiveTranscriptionSetPaused(uint64_t a1)
{
  CFStringRef v1 = (const __CFString *)_kAXSLiveTranscriptionPausedPreference;
  uint64_t v2 = (const void *)[NSNumber numberWithUnsignedChar:a1];
  CFStringRef v3 = (const __CFString *)kAXSLiveTranscriptionPausedDidChangeNotification;

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

void *_AXSLiveTranscriptionCopyTextColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSLiveTranscriptionTextColorPreference, 0, 0);
}

void _AXSLiveTranscriptionSetTextColorData(const void *a1)
{
}

void *_AXSLiveTranscriptionCopyBackgroundColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSLiveTranscriptionBackgroundColorPreference, 0, 0);
}

void _AXSLiveTranscriptionSetBackgroundColorData(const void *a1)
{
}

uint64_t _AXSLiveTranscriptionScreenshotHidingEnabled()
{
  char v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSLiveTranscriptionScreenshotHidingPreference, &v1);
  if (v1) {
    return result;
  }
  else {
    return 1;
  }
}

void _AXSLiveTranscriptionSetScreenshotHidingEnabled(uint64_t a1)
{
  CFStringRef v1 = (const __CFString *)kAXSLiveTranscriptionScreenshotHidingPreference;
  uint64_t v2 = (const void *)[NSNumber numberWithUnsignedChar:a1];
  CFStringRef v3 = (const __CFString *)kAXSLiveTranscriptionScreenshotHidingDidChangeNotification;

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

void *_AXSLiveCaptionsNubbitIdleOpacity()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSLiveCaptionsNubbitIdleOpacityPreference, 0, 0);
}

void _AXSLiveCaptionsSetNubbitIdleOpacity(const void *a1)
{
}

void *_AXSLiveCaptionsCopyContentSizeCategoryName()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSLiveCaptionsContentSizeCategoryNamePreference, 0, 0);
}

void _AXSLiveCaptionsSetContentSizeCategoryName(const void *a1)
{
}

uint64_t _AXSLiveCaptionsBoldTextEnabled()
{
  uint64_t v0 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  CFNumberRef NumberPreference = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSLiveCaptionsBoldTextChangePreference, 0);
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }
  return v0;
}

void _AXSLiveCaptionsSetBoldTextEnabled(uint64_t a1)
{
  CFStringRef v1 = (const __CFString *)kAXSLiveCaptionsBoldTextChangePreference;
  uint64_t v2 = (const void *)[NSNumber numberWithInt:a1];
  CFStringRef v3 = (const __CFString *)kAXSLiveCaptionsBoldTextChangeNotification;

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

uint64_t _AXSUIFocusRingEnabled()
{
  if (_AXSUIFocusRingEnabled_onceToken != -1) {
    dispatch_once(&_AXSUIFocusRingEnabled_onceToken, &__block_literal_global_1895);
  }
  return _kAXSCacheUIFocusRingEnabled;
}

void _AXSSetUIFocusRingEnabled(uint64_t a1)
{
  _kAXSCacheUIFocusRingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSUIFocusRingEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.ui.focus.ring");

  _updateAccessibilitySettings();
}

BOOL _AXSPrefersNonBlinkingCursorIndicatorGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, 0) == 1;
}

uint64_t _AXSPrefersNonBlinkingCursorIndicatorApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, a1);
}

void _AXSSetPrefersNonBlinkingCursorIndicator(int a1)
{
  _AXSSetPrefersNonBlinkingCursorIndicatorApp(a1 != 0, 0);
}

void _AXSSetPrefersNonBlinkingCursorIndicatorApp(int a1, __CFString *a2)
{
  int v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSPrefersNonBlinkingCursorIndicatorPreference, a1, (void (*)(void))_AXSPrefersNonBlinkingCursorIndicator);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, a2, &_kAXSCachePrefersNonBlinkingCursorIndicator, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, kCFNumberIntType, &v4, @"com.apple.accessibility.cache.non.blinking.cursor.status", a2);
}

void _subscribeOnCacheNotificationsIfNeeded(uint64_t a1, int a2, void (*a3)(void))
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
    dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
  }
  if (_AXSCurrentProcessIsWebContent_IsWebContent)
  {
    if (a3) {
      a3();
    }
    uint64_t v6 = AXSupportLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      uint64_t v8 = a1;
      __int16 v9 = 1024;
      int v10 = a2;
      _os_log_impl(&dword_190274000, v6, OS_LOG_TYPE_INFO, "API Setting value for Web: preference = %@, BOOL value = %d", (uint8_t *)&v7, 0x12u);
    }
  }
}

void _updateCachePreferenceAfterChange(const __CFString *a1, CFStringRef theString1, int *a3, int a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v14 = a4;
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  uint64_t v7 = cachedAppID_CachedAppID;
  if (!theString1)
  {
    uint64_t v11 = &v14;
    CFStringRef v9 = a1;
    CFStringRef v10 = (const __CFString *)cachedAppID_CachedAppID;
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  if (cachedAppID_CachedAppID
    && CFEqual(theString1, (CFStringRef)cachedAppID_CachedAppID))
  {
    uint64_t v8 = &v14;
    CFStringRef v9 = a1;
    CFStringRef v10 = (const __CFString *)v7;
    uint64_t v11 = 0;
LABEL_8:
    *a3 = _fetchCachePreference(v9, v10, v11, v8);
  }
  long long v12 = AXSupportLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = *a3;
    *(_DWORD *)buf = 138412802;
    CFStringRef v16 = theString1;
    __int16 v17 = 2112;
    CFStringRef v18 = a1;
    __int16 v19 = 1024;
    int v20 = v13;
    _os_log_debug_impl(&dword_190274000, v12, OS_LOG_TYPE_DEBUG, "Settings Update Cache Value: appID = %@, preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)", buf, 0x1Cu);
  }
}

void _setNumberPreferenceApp(const __CFString *a1, CFNumberType a2, const void *a3, __CFString *a4, __CFString *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, a3);
    CFStringRef v9 = AXSupportLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412802;
      uint64_t v11 = a5;
      __int16 v12 = 2112;
      CFStringRef v13 = a1;
      __int16 v14 = 2112;
      CFNumberRef v15 = v8;
      _os_log_debug_impl(&dword_190274000, v9, OS_LOG_TYPE_DEBUG, "Settings Setting Value: appID = %@, preference = %@, BOOL value = %@ (-1 - empty, 0 - false, 1 - true)", (uint8_t *)&v10, 0x20u);
    }

    if (a4)
    {
      if (a5) {
        a4 = (__CFString *)[(__CFString *)a4 stringByAppendingString:a5];
      }
    }
    _setPreferenceAppWithNotification(a1, a5, v8, a4);
    CFRelease(v8);
  }
}

BOOL _AXSPrefersHorizontalTextLayoutGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSPrefersHorizontalTextPreference, 0) == 1;
}

uint64_t _AXSPrefersHorizontalTextLayoutApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSPrefersHorizontalTextPreference, a1);
}

void _AXSSetPrefersHorizontalTextLayout(int a1)
{
  _AXSSetPrefersHorizontalTextLayoutApp(a1 != 0, 0);
}

void _AXSSetPrefersHorizontalTextLayoutApp(int a1, __CFString *a2)
{
  int v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSPrefersHorizontalTextPreference, a1, (void (*)(void))_AXSPrefersHorizontalTextLayout);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSPrefersHorizontalTextPreference, a2, (int *)&_kAXSCachePrefersHorizontalText, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPrefersHorizontalTextPreference, kCFNumberIntType, &v4, @"com.apple.accessibility.cache.prefers.horizontal.text", a2);
}

void _AXSGuidedAccessStartSession()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v1 = (const __CFString *)kAXSGuidedAccessActivateNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v1, 0, 0, 1u);
}

uint64_t _AXSGuidedAccessEnabledNoCaching()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  CFStringRef v1 = (const __CFString *)kAXSGuidedAccessEnabledPreference;

  return _getBooleanPreference(v1, 0);
}

uint64_t _AXSAutoBrightnessEnabled()
{
  Boolean keyExistsAndHasValidFormat = 0;
  LODWORD(result) = CFPreferencesGetAppBooleanValue(@"BKEnableALS", @"com.apple.backboardd", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    return result;
  }
  else {
    return 1;
  }
}

uint64_t _AXSGuidedAccessSetEnabled(uint64_t a1)
{
  _kAXSCacheGuidedAccessEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGuidedAccessEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.guided.access");
  _updateAccessibilitySettings();

  return _didUpdateTripleClickOptions();
}

uint64_t _AXSGuidedAccessEnabledByManagedConfiguration()
{
  if (_AXSGuidedAccessEnabledByManagedConfiguration_onceToken != -1) {
    dispatch_once(&_AXSGuidedAccessEnabledByManagedConfiguration_onceToken, &__block_literal_global_1905);
  }
  return _kAXSCacheGuidedAccessEnabledByManagedConfiguration;
}

void _AXSGuidedAccessSetEnabledByManagedConfiguration(uint64_t a1)
{
  _kAXSCacheGuidedAccessEnabledByManagedConfiguration = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGuidedAccessEnabledByManagedConfigurationPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.guided.access.via.mdm");

  _updateAccessibilitySettings();
}

uint64_t _AXSGuidedAccessHasPasscode()
{
  if (_AXSGuidedAccessHasPasscode_onceToken != -1) {
    dispatch_once(&_AXSGuidedAccessHasPasscode_onceToken, &__block_literal_global_1907);
  }
  return _kAXSCacheGuidedAccessHasPasscode;
}

void _AXSGuidedAccessSetHasPasscode(uint64_t a1)
{
  _kAXSCacheGuidedAccessHasPasscode = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGuidedAccessHasPasscodePreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.gax.haspasscode");

  _updateAccessibilitySettings();
}

BOOL _AXSSideButtonClickSpeedEnabled()
{
  char v4 = 0;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSSideButtonClickSpeedPreference, 0, &v4);
  if (v4) {
    BOOL v1 = FloatPreference < 0.0;
  }
  else {
    BOOL v1 = 1;
  }
  float v2 = FloatPreference + -0.4;
  if (v1) {
    float v2 = 0.0;
  }
  return fabsf(v2) > 0.01;
}

float _AXSSideButtonClickSpeed()
{
  char v2 = 0;
  float result = _getFloatPreference((const __CFString *)kAXSSideButtonClickSpeedPreference, 0, &v2);
  if (v2) {
    BOOL v1 = result < 0.0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0.4;
  }
  return result;
}

void _AXSSetSideButtonClickSpeed(float a1)
{
  if (fabsf(a1 + -1.2) >= 0.01)
  {
    if (fabsf(a1 + -0.7) >= 0.01)
    {
      if (fabsf(a1 + -0.4) >= 0.01) {
        return;
      }
      int v4 = 1053609165;
      float v1 = 0.0;
    }
    else
    {
      int v4 = 1060320051;
      float v1 = 0.3;
    }
  }
  else
  {
    int v4 = 1067030938;
    float v1 = 0.8;
  }
  BOOL v2 = _AXSSideButtonClickSpeedEnabled();
  _setNumberPreferenceApp((const __CFString *)kAXSSideButtonClickSpeedPreference, kCFNumberFloatType, &v4, (__CFString *)kAXSSideButtonClickSpeedChangedNotification, 0);
  if (v2 != fabsf(v1) > 0.01)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSSideButtonClickSpeedEnabledNotification, 0, 0, 1u);
  }
}

BOOL _AXSHomeClickEnabled()
{
  char v4 = 0;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSHomeClickSpeedPreference, 0, &v4);
  if (v4) {
    BOOL v1 = FloatPreference < 0.0;
  }
  else {
    BOOL v1 = 1;
  }
  float v2 = FloatPreference + -0.35;
  if (v1) {
    float v2 = 0.0;
  }
  return fabsf(v2) > 0.01;
}

float _AXSHomeClickSpeed()
{
  char v2 = 0;
  float result = _getFloatPreference((const __CFString *)kAXSHomeClickSpeedPreference, 0, &v2);
  if (v2) {
    BOOL v1 = result < 0.0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0.35;
  }
  return result;
}

void _AXSHomeClickSetSpeed(float a1)
{
  if (fabsf(a1 + -0.7) >= 0.01)
  {
    if (fabsf(a1 + -0.5) >= 0.01)
    {
      if (fabsf(a1 + -0.35) >= 0.01) {
        return;
      }
      int v4 = 1051931443;
      float v1 = 0.34;
    }
    else
    {
      int v4 = 1056964608;
      float v1 = 0.49;
    }
  }
  else
  {
    int v4 = 1060320051;
    float v1 = 0.69;
  }
  BOOL v2 = _AXSHomeClickEnabled();
  _setNumberPreferenceApp((const __CFString *)kAXSHomeClickSpeedPreference, kCFNumberFloatType, &v4, (__CFString *)kAXSHomeClickSpeedChangedNotification, 0);
  if (v2 != fabsf(v1) > 0.01)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSHomeClickEnabledNotification, 0, 0, 1u);
  }
}

float _AXSLockClickDownPressDurationScaleFactor()
{
  char v3 = 0;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSHomeClickSpeedPreference, 0, &v3);
  if (v3) {
    BOOL v1 = FloatPreference < 0.0;
  }
  else {
    BOOL v1 = 1;
  }
  float result = FloatPreference / 0.35;
  if (v1) {
    return 1.0;
  }
  return result;
}

float _AXSLockClickVarianceScaleFactor()
{
  char v3 = 0;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSHomeClickSpeedPreference, 0, &v3);
  if (v3) {
    BOOL v1 = FloatPreference < 0.0;
  }
  else {
    BOOL v1 = 1;
  }
  float result = FloatPreference / 0.35;
  if (v1) {
    return 1.0;
  }
  return result;
}

uint64_t _AXSPearlAuthenticationHapticsEnabled()
{
  if (_AXSPearlAuthenticationHapticsEnabled_onceToken != -1) {
    dispatch_once(&_AXSPearlAuthenticationHapticsEnabled_onceToken, &__block_literal_global_1909);
  }
  return _kAXSCachePearlAuthenticationHapticsEnabled;
}

void _AXSSetPearlAuthenticationHapticsEnabled(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Set pearl-auth haptics: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCachePearlAuthenticationHapticsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPearlAuthenticationHapticsPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.perl.auth.haptics");
  _updateAccessibilitySettings();
}

uint64_t _AXSPearlRestingUnlock()
{
  unsigned __int8 v1 = 0;
  _getBooleanPreference((const __CFString *)kAXSRestingPearlUnlockPreference, (char *)&v1);
  return v1;
}

uint64_t _AXSPearlRestingUnlockEverSet()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = AXSupportLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = _kAXSCacheRestingPearlUnlockEnabled;
    _os_log_impl(&dword_190274000, v0, OS_LOG_TYPE_DEFAULT, "Retrieving pearl-resting unlock: %d", (uint8_t *)v2, 8u);
  }

  if (_AXSPearlRestingUnlockEverSet_onceToken != -1) {
    dispatch_once(&_AXSPearlRestingUnlockEverSet_onceToken, &__block_literal_global_1911);
  }
  return _kAXSCacheRestingPearlUnlockEnabled;
}

void _AXSPearlSetRestingUnlock(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Set pearl-resting unlock: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheRestingPearlUnlockEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSRestingPearlUnlockPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.resting.home.button.unlock");
  _updateAccessibilitySettings();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  if (_AXSAttentionAwarenessFeaturesEnabled_twiceToken != -1) {
    dispatch_once(&_AXSAttentionAwarenessFeaturesEnabled_twiceToken, &__block_literal_global_1913);
  }
  if (!_AXSAttentionAwarenessFeaturesEnabled_supported) {
    return 0;
  }
  uint64_t v0 = AXSupportLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    _AXSAttentionAwarenessFeaturesEnabled_cold_1(v0);
  }

  if (_AXSAttentionAwarenessFeaturesEnabled_onceToken != -1) {
    dispatch_once(&_AXSAttentionAwarenessFeaturesEnabled_onceToken, &__block_literal_global_1919);
  }
  return _kAXSCacheAttentionAwarenessFeaturesEnabled;
}

void _AXSSetAttentionAwarenessFeaturesEnabled(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Set attention aware: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheAttentionAwarenessFeaturesEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAttentionAwarenessFeaturesEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.attention.awareness");
  _updateAccessibilitySettings();
}

uint64_t _AXSUserEnabledPasscodeForPurchases()
{
  if (_AXSUserEnabledPasscodeForPurchases_onceToken != -1) {
    dispatch_once(&_AXSUserEnabledPasscodeForPurchases_onceToken, &__block_literal_global_1921);
  }
  return _kAXSCachePasscodeForPurchases;
}

void _AXSSetUserEnabledPasscodeForPurchases(uint64_t a1)
{
  _kAXSCachePasscodeForPurchases = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPasscodeForPurchasesPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.passcode.purchases");

  _updateAccessibilitySettings();
}

uint64_t _AXSHomeButtonRestingUnlockEverSet()
{
  unsigned __int8 v1 = 0;
  _getBooleanPreference((const __CFString *)kAXSRestingHomeButtonUnlockPreference, (char *)&v1);
  return v1;
}

uint64_t _AXSHomeButtonRestingUnlockPreferredForDevice()
{
  int v0 = MGGetSInt32Answer();
  uint64_t result = 0;
  if (v0 == 2) {
    return MGGetBoolAnswer();
  }
  return result;
}

uint64_t _AXSHomeButtonRestingUnlock()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (_kAXSCacheRestingHomeButtonUnlockEnabled == -1) {
    _kAXSCacheRestingHomeButtonUnlockEnabled = _AXSHomeButtonRestingUnlockPreferredForDevice();
  }
  int v0 = AXSupportLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = _kAXSCacheRestingHomeButtonUnlockEnabled;
    _os_log_impl(&dword_190274000, v0, OS_LOG_TYPE_DEFAULT, "Retrieving resting unlock: %d", (uint8_t *)v2, 8u);
  }

  if (_AXSHomeButtonRestingUnlock_onceToken != -1) {
    dispatch_once(&_AXSHomeButtonRestingUnlock_onceToken, &__block_literal_global_1929);
  }
  return _kAXSCacheRestingHomeButtonUnlockEnabled;
}

void _AXSHomeButtonSetRestingUnlock(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Set resting unlock: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheRestingHomeButtonUnlockEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSRestingHomeButtonUnlockPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.resting.home.button.unlock");
  _updateAccessibilitySettings();
}

uint64_t _AXSAXInspectorEnabled()
{
  if (_AXSAXInspectorEnabled_onceToken != -1) {
    dispatch_once(&_AXSAXInspectorEnabled_onceToken, &__block_literal_global_1931);
  }
  return _kAXSCacheAXInspectorEnabled;
}

uint64_t _AXSLogValidationErrors()
{
  if (_AXSLogValidationErrors_onceToken != -1) {
    dispatch_once(&_AXSLogValidationErrors_onceToken, &__block_literal_global_1933);
  }
  return _kAXSCacheLogValidationErrors;
}

void _AXSSetLogValidationErrors(uint64_t a1)
{
  _kAXSCacheLogValidationErrors = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLogValidationErrorsPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.internal.logvalidationerrors");

  _updateAccessibilitySettings();
}

uint64_t _AXSReportValidationErrors()
{
  if (_AXSReportValidationErrors_onceToken != -1) {
    dispatch_once(&_AXSReportValidationErrors_onceToken, &__block_literal_global_1935);
  }
  return _kAXSCacheReportValidationErrors;
}

void _AXSSetReportValidationErrors(uint64_t a1)
{
  _kAXSCacheReportValidationErrors = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSReportValidationErrorsPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.internal.reportvalidationerrors");

  _updateAccessibilitySettings();
}

uint64_t _AXSCrashOnValidationErrors()
{
  if (_AXSCrashOnValidationErrors_onceToken != -1) {
    dispatch_once(&_AXSCrashOnValidationErrors_onceToken, &__block_literal_global_1937);
  }
  return _kAXSCacheCrashOnValidationErrors;
}

void _AXSSetCrashOnValidationErrors(uint64_t a1)
{
  _kAXSCacheCrashOnValidationErrors = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSCrashOnValidationErrorsPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.internal.crashonvalidationerrors");

  _updateAccessibilitySettings();
}

uint64_t _AXSClassicInvertColorsEnabled()
{
  if (_AXSClassicInvertColorsEnabled_onceToken != -1) {
    dispatch_once(&_AXSClassicInvertColorsEnabled_onceToken, &__block_literal_global_1939);
  }
  return _kAXSCacheClassicInvertColorsEnabled;
}

BOOL _AXSInvertColorsEnabledAppCached(BOOL result)
{
  if (result)
  {
    CFStringRef v1 = (const __CFString *)result;
    int valuePtr = -1;
    BOOL v2 = cachedSmartInvertPreferences();
    CFNumberRef v3 = (const __CFNumber *)[v2 valueForKey:v1];

    if (!v3 || (CFNumberGetValue(v3, kCFNumberIntType, &valuePtr), int v4 = valuePtr, valuePtr == -2))
    {
      unsigned int v16 = -1;
      CFNumberRef NumberPreference = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSInvertColorsEnabledPreference, v1);
      if (!NumberPreference || (CFNumberGetValue(NumberPreference, kCFNumberIntType, &v16), v16 == -1))
      {
        int v6 = _kAXSCacheInvertColorsGlobal;
        if (_kAXSCacheInvertColorsGlobal == -1) {
          int v6 = 0;
        }
        unsigned int v16 = v6;
      }
      uint64_t v7 = cachedSmartInvertPreferences();
      CFNumberRef v8 = [NSNumber numberWithInt:v16];
      [v7 setValue:v8 forKey:v1];

      CFStringRef v9 = cachedSmartInvertPreferences();
      CFNumberRef v10 = (const __CFNumber *)[v9 valueForKey:v1];

      if (valuePtr != -2)
      {
        CFStringRef v11 = (const __CFString *)[@"com.apple.accessibility.cache.invert.colors" stringByAppendingString:v1];
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandleSmartInvertPrefChangedApp, v11, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        CFStringRef v13 = AXSupportLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          _AXSInvertColorsEnabledAppCached_cold_2();
        }
      }
      if (v10) {
        CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
      }
      __int16 v14 = AXSupportLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        _AXSInvertColorsEnabledAppCached_cold_1();
      }

      int v4 = valuePtr;
    }
    return v4 == 1;
  }
  return result;
}

id cachedSmartInvertPreferences()
{
  if (cachedSmartInvertPreferences_onceToken != -1) {
    dispatch_once(&cachedSmartInvertPreferences_onceToken, &__block_literal_global_2919);
  }
  int v0 = (void *)cachedSmartInvertPreferences_CachedSmartInvertPreferences;

  return v0;
}

void _axsHandleSmartInvertPrefChangedApp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:a3];
  [v3 replaceOccurrencesOfString:@"com.apple.accessibility.cache.invert.colors" withString:&stru_1EDFBF138 options:0 range:NSMakeRange(0, [v3 length])];
  _invalidateCacheSmartInvertPreference((uint64_t)v3);
}

void _AXSInvertColorsSetEnabledApp(int a1, __CFString *a2)
{
  int v6 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSInvertColorsEnabledPreference, a1, (void (*)(void))_AXSInvertColorsEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSInvertColorsEnabledPreference, a2, &_kAXSCacheInvertColors, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSInvertColorsEnabledPreference, kCFNumberIntType, &v6, @"com.apple.accessibility.cache.invert.colors", a2);
  if (v6 == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSPreLoadInvertColorsEnabledNotification, 0, 0, 1u);
  }
  _updateAccessibilitySettings();
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v5, (CFNotificationName)kAXSInvertColorsStatusDidChangeNotification, 0, 0, 1u);
}

void _AXSClassicInvertColorsSetEnabled(uint64_t a1)
{
  if (a1 && _AXSInvertColorsEnabled()) {
    _AXSInvertColorsSetEnabled(0);
  }
  _kAXSCacheClassicInvertColorsEnabled = a1;
  _AXSInvertColorsDisplaySetEnabled(a1);
  _setPreferenceAppWithNotification((const __CFString *)kAXSClassicInvertColorsPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.classic.invert.colors");

  _updateAccessibilitySettings();
}

uint64_t _AXSSetInDataMigrationMode(uint64_t result)
{
  _InDataMigrationMode = result != 0;
  return result;
}

uint64_t _AXSInDataMigrationMode()
{
  return _InDataMigrationMode;
}

void _AXSInvertColorsMarkInvertColorsPreloadComplete()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFStringRef v1 = kAXSInvertColorsEnabledNotification;

  CFNotificationCenterPostNotification(LocalCenter, v1, 0, 0, 1u);
}

uint64_t _AXSInvertColorsReloadPreferenceImmediately()
{
  return _getBooleanPreference((const __CFString *)kAXSInvertColorsEnabledPreference, 0);
}

uint64_t _AXSDisplayFilterColorEnabled()
{
  return MADisplayFilterPrefGetCategoryEnabled();
}

uint64_t _AXSDisplayFilterColorSetEnabled(uint64_t a1)
{
  MADisplayFilterPrefSetCategoryEnabled();
  uint64_t result = MADisplayFilterPrefGetType();
  if (result == 1)
  {
    return _AXSGrayscaleSetEnabled(a1);
  }
  return result;
}

uint64_t _AXSGrayscaleSetEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheGrayscaleEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGrayscaleEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.grayscale");
  _updateAccessibilitySettings();
  if (v1)
  {
    MADisplayFilterPrefSetType();
  }
  else
  {
    uint64_t result = MADisplayFilterPrefGetType();
    if (result != 1) {
      return result;
    }
    uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
    if (!result) {
      return result;
    }
  }

  return MADisplayFilterPrefSetCategoryEnabled();
}

void _AXSUpdateGrayscaleEnabledCache()
{
  if (MADisplayFilterPrefGetCategoryEnabled()) {
    BOOL v0 = MADisplayFilterPrefGetType() == 1;
  }
  else {
    BOOL v0 = 0;
  }
  _kAXSCacheGrayscaleEnabled = v0;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGrayscaleEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:], 0);
  _updateAccessibilitySettings();
  _setPreferenceAppWithNotification((const __CFString *)kAXSDidCheckGrayscalePreference, 0, (const void *)[NSNumber numberWithUnsignedChar:1], 0);

  _updateAccessibilitySettings();
}

uint64_t _AXSRedGreenFilterEnabled()
{
  uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
  if (result) {
    return MADisplayFilterPrefGetType() == 2;
  }
  return result;
}

uint64_t _AXSRedGreenFilterSetEnabled(int a1)
{
  if (a1)
  {
    MADisplayFilterPrefSetType();
  }
  else
  {
    uint64_t result = MADisplayFilterPrefGetType();
    if (result != 2) {
      return result;
    }
    uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
    if (!result) {
      return result;
    }
  }

  return MADisplayFilterPrefSetCategoryEnabled();
}

uint64_t _AXSRedGreenFilterIntensity()
{
  return MEMORY[0x1F40ED018]();
}

uint64_t _AXSRedGreenFilterSetIntensity()
{
  MADisplayFilterPrefSuspendNotifications();
  MADisplayFilterPrefSetRedColorCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);

  return MADisplayFilterPrefSuspendNotifications();
}

uint64_t _AXSGreenRedFilterEnabled()
{
  uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
  if (result) {
    return MADisplayFilterPrefGetType() == 4;
  }
  return result;
}

uint64_t _AXSGreenRedFilterSetEnabled(int a1)
{
  if (a1)
  {
    MADisplayFilterPrefSetType();
  }
  else
  {
    uint64_t result = MADisplayFilterPrefGetType();
    if (result != 4) {
      return result;
    }
    uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
    if (!result) {
      return result;
    }
  }

  return MADisplayFilterPrefSetCategoryEnabled();
}

uint64_t _AXSGreenRedFilterIntensity()
{
  return MEMORY[0x1F40ED010]();
}

uint64_t _AXSGreenRedFilterSetIntensity()
{
  MADisplayFilterPrefSuspendNotifications();
  MADisplayFilterPrefSetGreenColorCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);

  return MADisplayFilterPrefSuspendNotifications();
}

uint64_t _AXSBlueYellowFilterEnabled()
{
  uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
  if (result) {
    return MADisplayFilterPrefGetType() == 8;
  }
  return result;
}

uint64_t _AXSBlueYellowFilterSetEnabled(int a1)
{
  if (a1)
  {
    MADisplayFilterPrefSetType();
  }
  else
  {
    uint64_t result = MADisplayFilterPrefGetType();
    if (result != 8) {
      return result;
    }
    uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
    if (!result) {
      return result;
    }
  }

  return MADisplayFilterPrefSetCategoryEnabled();
}

uint64_t _AXSBlueYellowFilterIntensity()
{
  return MEMORY[0x1F40ED000]();
}

uint64_t _AXSBlueYellowFilterSetIntensity()
{
  MADisplayFilterPrefSuspendNotifications();
  MADisplayFilterPrefSetBlueColorCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);

  return MADisplayFilterPrefSuspendNotifications();
}

uint64_t _AXSColorTintFilterEnabled()
{
  uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
  if (result) {
    return MADisplayFilterPrefGetType() == 16;
  }
  return result;
}

uint64_t _AXSColorTintSetEnabled(int a1)
{
  if (a1)
  {
    MADisplayFilterPrefSetType();
  }
  else
  {
    uint64_t result = MADisplayFilterPrefGetType();
    if (result != 16) {
      return result;
    }
    uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
    if (!result) {
      return result;
    }
  }

  return MADisplayFilterPrefSetCategoryEnabled();
}

uint64_t _AXSScreenFilterShowInitialAlert()
{
  if (_AXSScreenFilterShowInitialAlert_onceToken != -1) {
    dispatch_once(&_AXSScreenFilterShowInitialAlert_onceToken, &__block_literal_global_1947);
  }
  return _kAXSCacheDisplayFilterShowInitialAlert;
}

void _AXSScreenFilterSetShowInitialAlert(uint64_t a1)
{
  _kAXSCacheDisplayFilterShowInitialAlert = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSDisplayFilterShowInitialAlertPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.displayfilter.showinitialalert");

  _updateAccessibilitySettings();
}

uint64_t _AXSDisableScreenFilters()
{
  if (_AXSInvertColorsEnabled()) {
    _AXSInvertColorsSetEnabled(0);
  }
  uint64_t result = _AXSGrayscaleEnabled();
  if (result)
  {
    return _AXSGrayscaleSetEnabled(0);
  }
  return result;
}

void *_AXSCachedValueForBrightnessFilter(const void *a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)_copyValuePreferenceApp((const __CFString *)kAXSCachedBrightnessFiltersPreference, 0, 0);
  if (!v2) {
    return 0;
  }
  CFDictionaryRef v3 = v2;
  int v4 = [[(id)CFDictionaryGetValue(v2, a1) copy];
  CFRelease(v3);

  return v4;
}

void _AXSSetCacheForBrightnessFilter(const void *a1, const void *a2)
{
  CFDictionaryRef v4 = (const __CFDictionary *)_copyValuePreferenceApp((const __CFString *)kAXSCachedBrightnessFiltersPreference, 0, 0);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    CFIndex Count = CFDictionaryGetCount(v4);
    MutableCopy = CFDictionaryCreateMutableCopy(0, Count, v5);
    CFRelease(v5);
    if (a2) {
      CFDictionarySetValue(MutableCopy, a1, a2);
    }
    else {
      CFDictionaryRemoveValue(MutableCopy, a1);
    }
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    MutableCopy = Mutable;
    if (a2) {
      CFDictionaryAddValue(Mutable, a1, a2);
    }
  }
  _setPreferenceAppWithNotification((const __CFString *)kAXSCachedBrightnessFiltersPreference, 0, MutableCopy, (const __CFString *)kAXSCachedBrightnessFiltersPreferenceChangedNotification);

  CFRelease(MutableCopy);
}

void _AXSClosedCaptionsSetEnabled(int a1)
{
  if (a1) {
    MACaptionAppearanceDisplayType v2 = kMACaptionAppearanceDisplayTypeAlwaysOn;
  }
  else {
    MACaptionAppearanceDisplayType v2 = kMACaptionAppearanceDisplayTypeAutomatic;
  }
  MACaptionAppearanceSetDisplayType(kMACaptionAppearanceDomainDefault, v2);
  MACaptionAppearancePrefSetPreferAccessibleCaptions();
  char v7 = 0;
  int BooleanPreference = _getBooleanPreference((const __CFString *)kAXSClosedCaptioningEnabledByiTunesPreference, &v7);
  if (v7) {
    BOOL v4 = BooleanPreference == a1;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSClosedCaptioningEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileipod.notify.MovieClosedCaptioningEnabledSetting", 0, 0, 1u);
  int v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v6, @"com.apple.accessibility.cache.captioning", 0, 0, 1u);
}

uint64_t _AXSExtendedVoiceIsolationMediaModesEnabled()
{
  if (_AXSExtendedVoiceIsolationMediaModesEnabled_onceToken != -1) {
    dispatch_once(&_AXSExtendedVoiceIsolationMediaModesEnabled_onceToken, &__block_literal_global_1954);
  }
  return _kAXSCacheExtendedVoiceIsolationMediaModesEnabled;
}

void _AXSSetExtendedVoiceIsolationMediaModesEnabled(uint64_t a1)
{
  _kAXSCacheExtendedVoiceIsolationMediaModesEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSExtendedVoiceIsolationMediaModesEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.extendedvoiceisolationmodes");

  _updateAccessibilitySettings();
}

void *_AXSCopyPreferredContentSizeCategoryNameGlobal()
{
  return _AXSCopyPreferredContentSizeCategoryNameApp(0);
}

void _AXSSetPreferredContentSizeCategoryName(const void *a1)
{
}

void _AXSSetPreferredContentSizeCategoryNameApp(const void *a1, __CFString *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v20 = 0;
    BOOL v4 = (void *)[objc_alloc((Class)getLSApplicationRecordClass()) initWithBundleIdentifier:a2 allowPlaceholder:0 error:&v20];
    id v5 = v20;
    if (v5)
    {
      int v6 = AXSupportLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        _copyValuePreferenceApp_cold_1();
      }
    }
    char v7 = [v4 dataContainerURL];
    uint64_t v8 = [v7 path];

    if (v8)
    {
      if (![(__CFString *)a2 hasPrefix:@"com.apple."])
      {
LABEL_17:
        _CFPreferencesSetAppValueWithContainer();
        __int16 v14 = AXSupportLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)__int16 v22 = v8;
          *(_WORD *)&v22[8] = 2112;
          *(void *)&v22[10] = a2;
          *(_WORD *)&v22[18] = 2112;
          uint64_t v23 = a1;
          _os_log_debug_impl(&dword_190274000, v14, OS_LOG_TYPE_DEBUG, "CF Save CategoryName to Container: domain = %@, appID = %@, category name = %@", buf, 0x20u);
        }

        CFNumberRef v15 = AXSupportLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)__int16 v22 = a1;
          _os_log_impl(&dword_190274000, v15, OS_LOG_TYPE_DEFAULT, "Saved CategoryName to Contaier: category name = %@", buf, 0xCu);
        }

        goto LABEL_22;
      }
      char v9 = 0;
    }
    else
    {
      char v9 = 1;
    }
    CFStringRef v10 = a2;
  }
  else
  {
    CFStringRef v10 = (const __CFString *)[(id)AXCPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
    uint64_t v8 = 0;
    char v9 = 1;
  }
  CFPreferencesSetAppValue(@"UIPreferredContentSizeCategoryName", a1, v10);
  int v11 = CFPreferencesAppSynchronize(v10);
  __int16 v12 = AXSupportLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)__int16 v22 = v10;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = a2;
    *(_WORD *)&v22[18] = 2112;
    uint64_t v23 = a1;
    _os_log_debug_impl(&dword_190274000, v12, OS_LOG_TYPE_DEBUG, "CF Save CategoryName: domain = %@, appID = %@, category name = %@", buf, 0x20u);
  }

  CFStringRef v13 = AXSupportLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v22 = a2 != 0;
    *(_WORD *)&v22[4] = 2112;
    *(void *)&v22[6] = a1;
    *(_WORD *)&v22[14] = 1024;
    *(_DWORD *)&v22[16] = v11;
    _os_log_impl(&dword_190274000, v13, OS_LOG_TYPE_DEFAULT, "Saved CategoryName to Domain: per-app = %d, category name = %@, synced = %d", buf, 0x18u);
  }

  if ((v9 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_22:
  unsigned int v16 = AXSupportLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uid_t v17 = geteuid();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v22 = a2 != 0;
    *(_WORD *)&v22[4] = 2112;
    *(void *)&v22[6] = a1;
    *(_WORD *)&v22[14] = 1024;
    *(_DWORD *)&v22[16] = v17 != 0;
    _os_log_impl(&dword_190274000, v16, OS_LOG_TYPE_DEFAULT, "Saved CategoryName: per-app = %d, category name = %@, usermode = %d", buf, 0x18u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSApplePreferredContentSizeCategoryNotification, 0, 0, 1u);
  if (_inUnitTestMode)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSApplePreferredContentSizeCategoryNotification, 0, 0, 1u);
  }
}

id getLSApplicationRecordClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  BOOL v0 = (void *)getLSApplicationRecordClass_softClass;
  uint64_t v7 = getLSApplicationRecordClass_softClass;
  if (!getLSApplicationRecordClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    _DWORD v3[2] = __getLSApplicationRecordClass_block_invoke;
    v3[3] = &unk_1E568C0A0;
    v3[4] = &v4;
    __getLSApplicationRecordClass_block_invoke((uint64_t)v3);
    BOOL v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_190291504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _AXSLargeTextUsesExtendedRange()
{
  return CFPreferencesGetAppIntegerValue((CFStringRef)kLargeTextUsesExtendedRange, (CFStringRef)kPreferencesFrameworkDomain, 0) == 1;
}

void _AXSSetLargeTextUsesExtendedRange(int a1)
{
  CFStringRef v1 = (const __CFString *)kLargeTextUsesExtendedRange;
  MACaptionAppearanceDisplayType v2 = (const void *)[NSNumber numberWithInteger:a1 != 0];
  CFStringRef v3 = (const __CFString *)kPreferencesFrameworkDomain;

  CFPreferencesSetAppValue(v1, v2, v3);
}

float _AXSPreferredFontSize()
{
  if (_AXSPreferredFontSize_onceToken != -1) {
    dispatch_once(&_AXSPreferredFontSize_onceToken, &__block_literal_global_1962);
  }
  return *(float *)&_kAXSCachedPreferredFontSize;
}

void _AXSPreferredFontSizeSetSize(float a1)
{
  float v1 = a1;
  _kAXSCachedPreferredFontSize = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPreferredFontSizePreference, kCFNumberFloatType, &v1, @"com.apple.accessibility.cache.large.text.change", 0);
}

uint64_t _AXSPhoneLockToEndCallEnabled()
{
  if (_AXSPhoneLockToEndCallEnabled_onceToken != -1) {
    dispatch_once(&_AXSPhoneLockToEndCallEnabled_onceToken, &__block_literal_global_1964);
  }
  return _kAXSCachePhoneLockToEndCall;
}

void _AXSPhoneLockToEndCallSetEnabled(uint64_t a1)
{
  _kAXSCachePhoneLockToEndCall = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPhoneLockToEndCallPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.lock.to.end.call");

  _updateAccessibilitySettings();
}

void _AXSSetDefaultRouteForCall(int a1)
{
  int v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSDefaultRouteForCallPreference, kCFNumberIntType, &v1, (__CFString *)kAXSDefaultRouteChangedNotification, 0);
  _AXSSetAccessibilityEnabled();
}

float _AXSScreenContrast()
{
  char v1 = 1;
  float result = _getFloatPreference((const __CFString *)kAXSScreenConstrastPreference, 0, &v1);
  if (!v1) {
    return 0.0;
  }
  return result;
}

void _AXSSetScreenContrast(float a1)
{
  float v1 = a1;
  if (_getFloatPreference((const __CFString *)kAXSScreenConstrastPreference, 0, 0) != a1) {
    _setNumberPreferenceApp((const __CFString *)kAXSScreenConstrastPreference, kCFNumberFloatType, &v1, (__CFString *)kAXSScreenContrastChangedNotification, 0);
  }
}

uint64_t _AXSEarpieceNoiseCancellationEnabled()
{
  if (_AXSEarpieceNoiseCancellationEnabled_onceToken != -1) {
    dispatch_once(&_AXSEarpieceNoiseCancellationEnabled_onceToken, &__block_literal_global_1977);
  }
  return _kAXSCacheEarpieceNoiseCancellation;
}

void _AXSEarpieceNoiseCancellationSetEnabled(uint64_t a1)
{
  _kAXSCacheEarpieceNoiseCancellation = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSEarpieceNoiseCancellationPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.earpiece.noise");

  _updateAccessibilitySettings();
}

void _AXSHearingAidsSetPaired(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  MACaptionAppearanceDisplayType v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_INFO, "Setting hearing aids paired: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheHearingAidPaired = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHearingAidPairedPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.hearing.aid.paired");
  _updateAccessibilitySettings();
}

uint64_t _AXSHearingAidRingtoneStreamingEnabled()
{
  if (_AXSHearingAidRingtoneStreamingEnabled_onceToken != -1) {
    dispatch_once(&_AXSHearingAidRingtoneStreamingEnabled_onceToken, &__block_literal_global_1981);
  }
  return _kAXSCacheHearingAidRingtonStreamingEnabled;
}

void _AXSHearingAidRingtoneStreamingSetEnabled(uint64_t a1)
{
  _kAXSCacheHearingAidRingtonStreamingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHearingAidRingtoneStreamingPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)kAXSHearingAidRingtoneStreamPreferenceChangedNotification);

  _updateAccessibilitySettings();
}

void _AXSMonoAudioSetEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheMonoAudioEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSMonoAudioEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.mono.audio");
  _updateAccessibilitySettings();
  char v4 = 0;
  int BooleanPreference = _getBooleanPreference((const __CFString *)kAXSMonoAudioEnabledByiTunesPreference, &v4);
  if (v4) {
    BOOL v3 = BooleanPreference == v1;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSMonoAudioEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
}

uint64_t _AXSAlwaysShowVolumeControlEnabled()
{
  if (_AXSAlwaysShowVolumeControlEnabled_onceToken != -1) {
    dispatch_once(&_AXSAlwaysShowVolumeControlEnabled_onceToken, &__block_literal_global_1985);
  }
  return _kAXSCacheAlwaysShowVolumeControlsEnabled;
}

void _AXSAlwaysShowVolumeControlSetEnabled(uint64_t a1)
{
  _kAXSCacheAlwaysShowVolumeControlsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAlwaysShowVolumeControlEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.alwaysshowvolume");

  _updateAccessibilitySettings();
}

uint64_t _AXSHearingAidComplianceEnabled()
{
  if (_AXSHearingAidComplianceEnabled_onceToken != -1) {
    dispatch_once(&_AXSHearingAidComplianceEnabled_onceToken, &__block_literal_global_1987);
  }
  return _kAXSCacheHearingAidComplianceEnabled;
}

void _AXSHearingAidComplianceSetEnabled(uint64_t a1)
{
  _kAXSCacheHearingAidComplianceEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHearingAidCompliancePreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.hac.audio");

  _updateAccessibilitySettings();
}

uint64_t _AXSHearingDevicePairedEars()
{
  BOOL v0 = _copyValuePreferenceApp((const __CFString *)kAXSHearingDevicePairedEarsPreference, 0, 0);
  uint64_t v1 = [v0 unsignedIntegerValue];

  return v1;
}

void _AXSHearingSetDevicePairedEars(uint64_t a1)
{
  CFStringRef v1 = (const __CFString *)kAXSHearingDevicePairedEarsPreference;
  MACaptionAppearanceDisplayType v2 = (const void *)[NSNumber numberWithUnsignedLong:a1];
  CFStringRef v3 = (const __CFString *)kAXSHearingDevicePairedEarsPreferenceChangedNotification;

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

id _AXSHearingDevicePairedUUIDs()
{
  BOOL v0 = _copyValuePreferenceApp((const __CFString *)kAXSHearingDevicePairedUUIDsPreference, 0, 0);

  return v0;
}

void _AXSHearingSetDevicePairedUUIDs(const void *a1)
{
}

uint64_t _AXSHearingDeviceStreamingEars()
{
  BOOL v0 = _copyValuePreferenceApp((const __CFString *)kAXSHearingDeviceStreamingEarsPreference, 0, 0);
  uint64_t v1 = [v0 unsignedIntegerValue];

  return v1;
}

void _AXSHearingSetDeviceStreamingEars(uint64_t a1)
{
  CFStringRef v1 = (const __CFString *)kAXSHearingDeviceStreamingEarsPreference;
  MACaptionAppearanceDisplayType v2 = (const void *)[NSNumber numberWithUnsignedLong:a1];
  CFStringRef v3 = (const __CFString *)kAXSHearingDeviceStreamingEarsPreferenceChangedNotification;

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

uint64_t _AXSSoftwareTTYEnabled()
{
  if (_AXSSoftwareTTYEnabled_onceToken != -1) {
    dispatch_once(&_AXSSoftwareTTYEnabled_onceToken, &__block_literal_global_1989);
  }
  return _kAXSCacheSoftwareTTYEnabled;
}

void _AXSSoftwareTTYSetEnabled(uint64_t a1)
{
  _kAXSCacheSoftwareTTYEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSoftwareTTYPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.softwaretty");

  _updateAccessibilitySettings();
}

id _AXSHearingCCAllOptions()
{
  if (_AXSHearingCCAllOptions_registerOnce != -1) {
    dispatch_once(&_AXSHearingCCAllOptions_registerOnce, &__block_literal_global_1991);
  }
  BOOL v0 = (void *)_AXSHearingCCAllOptions_hearingCCOptions;

  return v0;
}

id _AXSHearingCCEnabledOptions()
{
  char v3 = 0;
  BOOL v0 = _copyValuePreferenceApp((const __CFString *)kAXSHearingCCOptionsPreference, 0, &v3);
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v1 = v0;
  }
  else {
    id v1 = 0;
  }

  return v1;
}

void _AXSHearingCCSetEnabledOptions(const void *a1)
{
  if (a1) {
    _setPreferenceAppWithNotification((const __CFString *)kAXSHearingCCOptionsPreference, 0, a1, (const __CFString *)kAXSHearingCCOptionsNotification);
  }
}

double _AXSLeftRightAudioBalance()
{
  int valuePtr = 0;
  CFNumberRef v0 = (const __CFNumber *)CFPreferencesCopyValue((CFStringRef)kAXSLeftRightBalancePreference, (CFStringRef)kAXSAccessibilityPreferenceDomain, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (!v0) {
    return 0.0;
  }
  CFNumberRef v1 = v0;
  CFTypeID TypeID = CFNumberGetTypeID();
  if (TypeID == CFGetTypeID(v1)) {
    CFNumberGetValue(v1, kCFNumberFloatType, &valuePtr);
  }
  CFRelease(v1);
  LODWORD(result) = valuePtr;
  return result;
}

uint64_t _AXSSetLeftRightAudioBalance(float a1)
{
  float valuePtr = a1;
  CFNumberRef v1 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  CFPreferencesSetAppValue((CFStringRef)kAXSLeftRightBalancePreference, v1, (CFStringRef)kAXSAccessibilityPreferenceDomain);
  CFRelease(v1);
  return notify_post("com.apple.coreaudio.aqmeBalance");
}

uint64_t _AXSHomeButtonAssistant()
{
  if (_AXSHomeButtonAssistant_onceToken != -1) {
    dispatch_once(&_AXSHomeButtonAssistant_onceToken, &__block_literal_global_2000);
  }
  return _kAXSHomeButtonAssistant;
}

void _AXSSetHomeButtonAssistant(uint64_t a1)
{
  _kAXSHomeButtonAssistant = a1;
  CFStringRef v1 = (const __CFString *)kAXSHomeButtonAssistantPreference;
  MACaptionAppearanceDisplayType v2 = (const void *)[NSNumber numberWithUnsignedInt:a1];

  _setPreferenceAppWithNotification(v1, 0, v2, @"com.apple.accessibility.cache.homebuttonassistant");
}

uint64_t _AXSSpeechSettingsDisabledByManagedConfiguration()
{
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1) {
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_2002);
  }
  return _kAXSCacheSpeechSettingsDisabledByManagedConfiguration;
}

void _AXSSpeechSettingsSetDisabledByManagedConfiguration(uint64_t a1)
{
  _kAXSCacheSpeechSettingsDisabledByManagedConfiguration = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSpeechSettingsDisabledByManagedConfigurationPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.speech.settings.disabled.by.mc");

  _updateAccessibilitySettings();
}

void _AXSQuickSpeakSetEnabled(uint64_t a1)
{
  if (!a1) {
    _setPreferenceAppWithNotification((const __CFString *)kAXSQuickSpeakLocaleForLanguagePreference, 0, 0, (const __CFString *)kAXSQuickSpeakLocaleForLanguageNotification);
  }
  _kAXSCacheQuickSpeakEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSQuickSpeakEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.quick.speak");

  _updateAccessibilitySettings();
}

void *_AXSQuickSpeakCopyPreferredLocalesForLanguages()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSQuickSpeakLocaleForLanguagePreference, 0, 0);
}

void _AXSQuickSpeakSetPreferredLocaleForLanguage(const void *a1, const void *a2)
{
  CFDictionaryRef v4 = (const __CFDictionary *)_copyValuePreferenceApp((const __CFString *)kAXSQuickSpeakLocaleForLanguagePreference, 0, 0);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    CFIndex Count = CFDictionaryGetCount(v4);
    MutableCopy = CFDictionaryCreateMutableCopy(0, Count, v5);
    CFRelease(v5);
    CFDictionarySetValue(MutableCopy, a2, a1);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryAddValue(MutableCopy, a2, a1);
  }
  _setPreferenceAppWithNotification((const __CFString *)kAXSQuickSpeakLocaleForLanguagePreference, 0, MutableCopy, (const __CFString *)kAXSQuickSpeakLocaleForLanguageNotification);

  CFRelease(MutableCopy);
}

uint64_t _AXSQuickSpeakHighlightTextEnabled()
{
  if (_AXSQuickSpeakHighlightTextEnabled_onceToken != -1) {
    dispatch_once(&_AXSQuickSpeakHighlightTextEnabled_onceToken, &__block_literal_global_2006);
  }
  return _kAXSCacheQuickSpeakHighlightTextEnabled;
}

void _AXSQuickSpeakSetHighlightTextEnabled(uint64_t a1)
{
  _kAXSCacheQuickSpeakHighlightTextEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSQuickSpeakHighlightTextEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.quick.speak.highlight.text");

  _updateAccessibilitySettings();
}

id _AXSAccessibilityEnablers()
{
  if (_AXSAccessibilityEnablers_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityEnablers_onceToken, &__block_literal_global_2008);
  }
  CFNumberRef v0 = (void *)_AXSAccessibilityEnablers_Enablers;

  return v0;
}

uint64_t _AXSSiriSemanticContextEnabled()
{
  if (_AXSSiriSemanticContextEnabled_onceToken != -1) {
    dispatch_once(&_AXSSiriSemanticContextEnabled_onceToken, &__block_literal_global_2142);
  }
  return _kAXSCacheSiriSemanticContextEnabled;
}

uint64_t _AXSZoomSpeakUnderFingerEnabled()
{
  if (_AXSZoomSpeakUnderFingerEnabled_onceToken != -1) {
    dispatch_once(&_AXSZoomSpeakUnderFingerEnabled_onceToken, &__block_literal_global_2357);
  }
  return _kAXSCacheZoomSpeakUnderFingerEnabled;
}

uint64_t _AXSAccessibilityNeedsMiniServer()
{
  return 0;
}

uint64_t _AXSSpeakThisEnabledNoCaching()
{
  if (_AXSClarityBoardEnabled_onceToken != -1) {
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1867);
  }
  if (_AXSClarityBoardEnabled_isEnabled) {
    return 0;
  }
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1) {
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_2002);
  }
  if (_kAXSCacheSpeechSettingsDisabledByManagedConfiguration) {
    return 0;
  }
  CFStringRef v1 = (const __CFString *)kAXSSpeakThisEnabledPreference;

  return _getBooleanPreference(v1, 0);
}

void _AXSSetSpeakThisEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheSpeakThisEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSpeakThisEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.speak.this");
  _updateAccessibilitySettings();
  if (v1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      goto LABEL_6;
    }
    uint64_t v2 = 0;
  }
  _AXSApplicationAccessibilitySetEnabled(v2);
LABEL_6:

  _updateAccessibilitySettings();
}

uint64_t _AXSSpeakThisHighlightVisible()
{
  if (_AXSSpeakThisHighlightVisible_onceToken != -1) {
    dispatch_once(&_AXSSpeakThisHighlightVisible_onceToken, &__block_literal_global_2127);
  }
  return _kAXSCacheSpeakThisHighlightVisible;
}

void _AXSSpeakThisSetHighlightVisible(uint64_t a1)
{
  if (_kAXSWriteableClient) {
    goto LABEL_5;
  }
  uint64_t v2 = AXLogSpeakScreen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    _AXSSpeakThisSetHighlightVisible_cold_1();
  }

  if (_kAXSWriteableClient)
  {
LABEL_5:
    _kAXSCacheSpeakThisHighlightVisible = a1;
    _setPreferenceAppWithNotification((const __CFString *)kAXSSpeakThisHighlightVisiblePreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.speak.this.highlight.visible");
    _updateAccessibilitySettings();
  }
}

void _AXSSetAutomationEnabled(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Setting automation enabled: %d", (uint8_t *)v4, 8u);
  }

  _kAXSCacheAutomationEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.automation.enabled");
  _updateAccessibilitySettings();
  if (a1)
  {
    uint64_t v3 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v3 = 0;
  }
  _AXSApplicationAccessibilitySetEnabled(v3);
}

void _AXSSetLocalizationCaptionModeEnabled(uint64_t a1)
{
  _kAXSCacheLocalizationCaptionModeEnabled = a1;
  _AXSAutomationLocalizedStringLookupInfoSetEnabled(a1);
  _setPreferenceAppWithNotification((const __CFString *)kAXSLocalizationCaptionModeEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.loc.caption.mode.enabled");
  _updateAccessibilitySettings();
  if (a1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v2 = 0;
  }

  _AXSApplicationAccessibilitySetEnabled(v2);
}

void _AXSAutomationLocalizedStringLookupInfoSetEnabled(uint64_t a1)
{
  _kAXSCacheAutomationLocalizedStringLookup = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationLocalizedStringLookupInfoEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.automation.localized.lookup");

  _updateAccessibilitySettings();
}

uint64_t _AXSAutomationHitpointWarpingEnabled()
{
  if (_AXSAutomationHitpointWarpingEnabled_onceToken != -1) {
    dispatch_once(&_AXSAutomationHitpointWarpingEnabled_onceToken, &__block_literal_global_2133);
  }
  return _kAXSCacheAutomationHitpointWarpingEnabled;
}

void _AXSAutomationSetHitpointWarpingEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationHitpointWarpingEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.automation.hitpoint_warping.enabled");

  _updateAccessibilitySettings();
}

void _AXSAutomationSetFauxTableViewCellsEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationEnableFauxTableViewCellsPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);

  _updateAccessibilitySettings();
}

uint64_t _AXSAutomationFauxTableViewCellsEnabled()
{
  char v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSAutomationEnableFauxTableViewCellsPreference, &v1);
  if (v1) {
    return result;
  }
  else {
    return 1;
  }
}

void _AXSAutomationSetFauxCollectionViewCellsEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationEnableFauxCollectionCellsPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);

  _updateAccessibilitySettings();
}

uint64_t _AXSAutomationFauxCollectionViewCellsEnabled()
{
  return _getBooleanPreference((const __CFString *)kAXSAutomationEnableFauxCollectionCellsPreference, 0);
}

void _AXSSetSiriSemanticContextEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheSiriSemanticContextEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSiriSemanticContextEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.siri.semantic.context.enabled");
  _updateAccessibilitySettings();
  if (v1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v2 = 0;
  }

  _AXSApplicationAccessibilitySetEnabled(v2);
}

uint64_t _AXSContextKitContextIsLoneEnabler()
{
  return 0;
}

uint64_t _AXSContextKitAppIsAllowed()
{
  if (_AXSContextKitAppIsAllowed_DidSetAllowedList == 1) {
    return _AXSContextKitAppIsAllowed_IsOnAllowedlist;
  }
  _AXSContextKitAppIsAllowed_DidSetAllowedList = 1;
  int v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v1 bundleIdentifier];

  if (![v2 hasPrefix:@"com.apple"]
    || ([v2 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.news"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.iBooks"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.mobilenotes"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.Pages"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.Keynote"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.Numbers"] & 1) != 0
    || [v2 isEqualToString:@"com.apple.siri.context.companion"])
  {
    _AXSContextKitAppIsAllowed_IsOnAllowedlist = 1;
  }
  uint64_t IsAllowed = _AXSContextKitAppIsAllowed();
  _AXSContextKitAppIsAllowed_IsOnAllowedlist = IsAllowed;

  return IsAllowed;
}

uint64_t _AXSContextKitContextIsLoneApplicationAccessibilityEnabler()
{
  return 0;
}

void _AXSSetAuditInspectionModeEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheAuditInspectionModeModeEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAuditInspectionModeEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.audit.inspection.mode");
  _updateAccessibilitySettings();
  if (v1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v2 = 0;
  }

  _AXSApplicationAccessibilitySetEnabled(v2);
}

void _AXSSetNocturneAccessibilityModeEnabled(uint64_t a1)
{
  _kAXSCacheNocturneAccessibilityModeEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSNocturneAccessibilityModeEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.nocturne.enabled");
  _updateAccessibilitySettings();
  if (a1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      goto LABEL_6;
    }
    uint64_t v2 = 0;
  }
  _AXSApplicationAccessibilitySetEnabled(v2);
LABEL_6:

  _AXSAutomationLocalizedStringLookupInfoSetEnabled(a1);
}

void _AXSSetClipTracerAccessibilityModeEnabled(uint64_t a1)
{
  _kAXSCacheClipTracerAccessibilityModeEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSClipTracerAccessibilityModeEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.clip.tracer.enabled");
  _updateAccessibilitySettings();
  if (a1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      goto LABEL_6;
    }
    uint64_t v2 = 0;
  }
  _AXSApplicationAccessibilitySetEnabled(v2);
LABEL_6:

  _AXSAutomationLocalizedStringLookupInfoSetEnabled(a1);
}

void _AXSVisualAlertSetEnabled(uint64_t a1)
{
  _kAXSCacheVisualAlertEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVisualAlertEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.visual.alert");

  _updateAccessibilitySettings();
}

CFComparisonResult _langSort(const __CFDictionary *a1, const __CFDictionary *a2)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"RotorItem");
  CFStringRef v4 = (const __CFString *)CFDictionaryGetValue(a2, @"RotorItem");

  return CFStringCompare(Value, v4, 1uLL);
}

uint64_t _AXSVoiceOverTouchLanguageRotorItemsExist()
{
  uint64_t result = (uint64_t)_copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchLanguageRotorPreference, 0, 0);
  if (result)
  {
    CFRelease((CFTypeRef)result);
    return 1;
  }
  return result;
}

uint64_t AXRetrieveSupportedAccessibilityLanguages()
{
  if (AXRetrieveSupportedAccessibilityLanguages_registerOnce != -1) {
    dispatch_once(&AXRetrieveSupportedAccessibilityLanguages_registerOnce, &__block_literal_global_2188);
  }
  return AXRetrieveSupportedAccessibilityLanguages_Langauges;
}

void __AXRetrieveSupportedAccessibilityLanguages_block_invoke()
{
  id v5 = [MEMORY[0x1E4F1CA80] set];
  CFNumberRef v0 = AXCLanguageToLocales();
  int v1 = [v0 allValues];
  [v5 addObjectsFromArray:v1];

  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_2191];
  CFStringRef v4 = (void *)AXRetrieveSupportedAccessibilityLanguages_Langauges;
  AXRetrieveSupportedAccessibilityLanguages_Langauges = v3;
}

uint64_t __AXRetrieveSupportedAccessibilityLanguages_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 compare:];
}

CFArrayRef _AXSVoiceOverTouchCopyLanguageRotorItems(int a1)
{
  CFArrayRef v1 = (const __CFArray *)_copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchLanguageRotorPreference, 0, 0);
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v1)
  {
    CFArrayRef v3 = v1;
    CFArrayRef MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v1);
    CFRelease(v3);
  }
  else
  {
    CFArrayRef MutableCopy = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  }
  uint64_t Count = CFArrayGetCount(MutableCopy);
  Mutable = CFSetCreateMutable(v2, Count, MEMORY[0x1E4F1D548]);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, i);
      CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"RotorItem");
      CFSetAddValue(Mutable, Value);
    }
  }
  if (AXRetrieveSupportedAccessibilityLanguages_registerOnce != -1) {
    dispatch_once(&AXRetrieveSupportedAccessibilityLanguages_registerOnce, &__block_literal_global_2188);
  }
  CFArrayRef v10 = (const __CFArray *)AXRetrieveSupportedAccessibilityLanguages_Langauges;
  CFIndex v11 = CFArrayGetCount((CFArrayRef)AXRetrieveSupportedAccessibilityLanguages_Langauges);
  if (v11 == CFArrayGetCount(MutableCopy) || (CFIndex v12 = CFArrayGetCount(v10), v12 < 1))
  {
    int v15 = 0;
  }
  else
  {
    CFIndex v13 = v12;
    CFIndex v14 = 0;
    int v15 = 0;
    unsigned int v16 = (const void *)*MEMORY[0x1E4F1CFC8];
    do
    {
      uid_t v17 = CFArrayGetValueAtIndex(v10, v14);
      if (!CFSetContainsValue(Mutable, v17))
      {
        CFStringRef v18 = CFDictionaryCreateMutable(v2, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionaryAddValue(v18, @"RotorItem", v17);
        CFDictionaryAddValue(v18, @"Enabled", v16);
        CFArrayAppendValue(MutableCopy, v18);
        CFRelease(v18);
        int v15 = 1;
      }
      ++v14;
    }
    while (v13 != v14);
  }
  CFArrayRef Copy = CFArrayCreateCopy(v2, MutableCopy);
  CFRelease(Mutable);
  CFRelease(MutableCopy);
  if (a1 && v15) {
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchLanguageRotorPreference, 0, Copy, 0);
  }
  return Copy;
}

uint64_t _AXSVoiceOverTouchEnabledThroughAccessory()
{
  char v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledThroughAccessoryPreference, &v1);
  if (v1) {
    return result;
  }
  else {
    return 0;
  }
}

void _AXSVoiceOverTouchSetEnabledThroughAccessory(uint64_t a1)
{
  if (a1) {
    _AXSVoiceOverTouchSetUsageConfirmed(a1);
  }
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchEnabledThroughAccessoryPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)kAXSVoiceOverTouchEnabledThroughAccessoryNotification);

  _updateAccessibilitySettings();
}

void _AXSVoiceOverTouchSetUsageConfirmed(uint64_t a1)
{
  _kAXSCacheVoiceOverUsageConfirmation = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchUsageConfirmedPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.vo.usage.confirm");

  _updateAccessibilitySettings();
}

void *_AXSVoiceOverTouchCopyBrailleBluetoothDisplay()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleBluetoothDisplayPreference, 0, 0);
}

void _AXSVoiceOverTouchSetBrailleBluetoothDisplay(const void *a1)
{
}

void *_AXSVoiceOverTouchCopyTactileGraphicsDisplay()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchTactileGraphicsDisplayPreference, 0, 0);
}

void _AXSVoiceOverTouchSetTactileGraphicsDisplay(const void *a1)
{
}

uint64_t _AXSVoiceOverTouchActive2DBrailleDisplays()
{
  if (_AXSVoiceOverTouchActive2DBrailleDisplays_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverTouchActive2DBrailleDisplays_onceToken, &__block_literal_global_2196);
  }
  return _kAXSCacheActive2DBrailleDisplays;
}

CFTypeID _AXSVoiceOverTouchUpdateActive2DBrailleDisplays()
{
  if (_kAXSCacheActive2DBrailleDisplays)
  {
    CFRelease((CFTypeRef)_kAXSCacheActive2DBrailleDisplays);
    _kAXSCacheActive2DBrailleDisplays = 0;
  }
  char v5 = 0;
  CFNumberRef v0 = _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverHasActive2DBrailleDisplayPreference, 0, &v5);
  if (v5) {
    BOOL v1 = v0 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1 || (v2 = (uint64_t)v0, v3 = CFGetTypeID(v0), CFTypeID result = CFArrayGetTypeID(), v3 != result))
  {
    CFTypeID result = (CFTypeID)CFRetain(MEMORY[0x1E4F1CBF0]);
    uint64_t v2 = result;
  }
  _kAXSCacheActive2DBrailleDisplays = v2;
  return result;
}

void _AXSVoiceOverTouchSetActive2DBrailleDisplays(const void *a1)
{
}

void *_AXSVoiceOverTouchCopyBrailleTableIdentifier()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleTableIdentifierPreference, 0, 0);
}

void _AXSVoiceOverTouchSetBrailleTableIdentifier(const void *a1)
{
}

uint64_t _AXSVoiceOverTouchBrailleVirtualStatusAlignment()
{
  char v4 = 0;
  CFNumberRef v0 = _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleVirtualStatusAlignmentPreference, 0, &v4);
  BOOL v1 = v0;
  if (v4) {
    uint64_t v2 = [v0 integerValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void _AXSVoiceOverTouchSetBrailleVirtualStatusAlignment(uint64_t a1)
{
  uint64_t v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleVirtualStatusAlignmentPreference, kCFNumberCFIndexType, &v1, (__CFString *)kAXSVoiceOverTouchBrailleVirtualStatusAlignmentChangedNotification, 0);
}

uint64_t _AXSVoiceOverTouchBrailleMasterStatusCellIndex()
{
  CFPreferencesAppSynchronize((CFStringRef)kAXSAccessibilityPreferenceDomain);
  char v3 = 0;
  CFNumberRef v0 = _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleMasterStatusCellIndexPreference, 0, &v3);
  uint64_t v1 = [v0 integerValue];

  return v1;
}

uint64_t _AXSVoiceOverTouchUIEnabled()
{
  return _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchUIEnabledPreference, 0);
}

void _AXSVoiceOverTouchSetUIEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchUIEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);

  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverTouchShouldRouteToSpeakerWithProximity()
{
  char v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchShouldRouteToSpeakerWithProximityPreference, &v1);
  if (v1) {
    return result;
  }
  else {
    return 1;
  }
}

void _AXSVoiceOverTouchSetShouldRouteToSpeakerWithProximity(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchShouldRouteToSpeakerWithProximityPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);

  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverTouchSpeakTimeOnWake()
{
  if (_AXSVoiceOverTouchSpeakTimeOnWake_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverTouchSpeakTimeOnWake_onceToken, &__block_literal_global_2198);
  }
  return _kAXSCacheVoiceOverSpeakTimeOnWake;
}

void _AXSVoiceOverTouchSetSpeakTimeOnWake(uint64_t a1)
{
  _kAXSCacheVoiceOverSpeakTimeOnWake = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchSpeakTimeOnWakePreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.AXSCacheVoiceOverSpeakTimeOnWakeNotification");

  _updateAccessibilitySettings();
}

uint64_t _AXSWalkieTalkieTapToTalkEnabled()
{
  if (_AXSWalkieTalkieTapToTalkEnabled_onceToken != -1) {
    dispatch_once(&_AXSWalkieTalkieTapToTalkEnabled_onceToken, &__block_literal_global_2200);
  }
  return _kAXSCacheWalkieTalkieTapToTalk;
}

void _AXSWalkieTalkieSetTapToTalkEnabled(uint64_t a1)
{
  _kAXSCacheWalkieTalkieTapToTalk = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWalkieTalkieTapToTalkPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.AXSCacheWalkieTalkieTapToTalkNotification");

  _updateAccessibilitySettings();
}

uint64_t _AXSAppSwitcherAutoSelectEnabled()
{
  if (_AXSAppSwitcherAutoSelectEnabled_onceToken != -1) {
    dispatch_once(&_AXSAppSwitcherAutoSelectEnabled_onceToken, &__block_literal_global_2202);
  }
  return _kAXSCacheAppSwitcherAutoSelect;
}

void _AXSAppSwitcherSetAutoSelectEnabled(uint64_t a1)
{
  _kAXSCacheAppSwitcherAutoSelect = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppSwitcherAutoSelectPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.AXSCacheAppSwitcherAutoSelectNotification");

  _updateAccessibilitySettings();
}

uint64_t _AXSCharacterVoiceDefaultSupportedLanguages()
{
  if (_AXSCharacterVoiceDefaultSupportedLanguages_onceToken != -1) {
    dispatch_once(&_AXSCharacterVoiceDefaultSupportedLanguages_onceToken, &__block_literal_global_2204);
  }
  return _AXSCharacterVoiceDefaultSupportedLanguages_supportedLanguages;
}

uint64_t _AXSCharacterVoiceSupportedForLocale(uint64_t result)
{
  if (result)
  {
    char v1 = (void *)MEMORY[0x192FCACA0]();
    return _AXSCharacterVoiceSupportedForLocaleIdentifier(v1);
  }
  return result;
}

uint64_t _AXSCharacterVoiceSupportedForLocaleIdentifier(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 1;
  }
  if (_AXSCharacterVoiceDefaultSupportedLanguages_onceToken != -1) {
    dispatch_once(&_AXSCharacterVoiceDefaultSupportedLanguages_onceToken, &__block_literal_global_2204);
  }
  CFArrayRef v2 = (const __CFArray *)_AXSCharacterVoiceDefaultSupportedLanguages_supportedLanguages;
  v20.length = CFArrayGetCount((CFArrayRef)_AXSCharacterVoiceDefaultSupportedLanguages_supportedLanguages);
  v20.location = 0;
  if (CFArrayContainsValue(v2, v20, a1)) {
    return 1;
  }
  char v4 = [a1 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  char v5 = [v4 lowercaseString];

  if (([v5 isEqualToString:@"ca-es"] & 1) != 0
    || ([v5 hasPrefix:@"ca"] & 1) != 0)
  {
    uint64_t v6 = @"es-ES";
  }
  else
  {
    if (![v5 hasPrefix:@"nb"]) {
      goto LABEL_10;
    }
    uint64_t v6 = @"no-NO";
  }

  char v5 = v6;
LABEL_10:
  if ([(__CFArray *)v2 containsObject:v5])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v7 = [v5 rangeOfString:@"-"];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = v5;
    }
    else
    {
      id v8 = [v5 substringToIndex:v7 + 1];
    }
    char v9 = v8;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CFArrayRef v10 = v2;
    uint64_t v3 = [(__CFArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v3)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v10);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hasPrefix:", v9, (void)v14))
          {
            uint64_t v3 = 1;
            goto LABEL_27;
          }
        }
        uint64_t v3 = [(__CFArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_27:
  }
  return v3;
}

void _AXSVoiceOverTouchSetEnabledAppTemporaryOverride(uint64_t a1)
{
  VoiceOverTemporaryOverride = a1;
  LocalCenter = CFNotificationCenterGetLocalCenter();

  CFNotificationCenterPostNotification(LocalCenter, @"com.apple.accessibility.cache.vot", 0, 0, 1u);
}

void _AXSVoiceOverTouchSetEnabled(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = AXSupportLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_INFO, "Requesting VoiceOver enabled: %d", (uint8_t *)v6, 8u);
  }

  _kAXSCacheVoiceOverTouchEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.vot");
  _updateAccessibilitySettings();
  LOBYTE(v6[0]) = 0;
  int BooleanPreference = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledByiTunesPreference, (char *)v6);
  if (LOBYTE(v6[0]) && BooleanPreference != a1)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  if (a1)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
    }
    if (_kAXSCacheSwitchControlEnabled) {
      _AXSAssistiveTouchScannerSetEnabled(0);
    }
    _kickstartProcess("com.apple.VoiceOverTouch");
    uint64_t v4 = 1;
  }
  else
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSBrailleInputDeviceConnectedPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:0], @"com.apple.accessibility.cache.braille.input.connection.changed");
    _updateAccessibilitySettings();
    int v5 = _AXSCanDisableApplicationAccessibility();
    uint64_t v4 = 0;
    if (!v5) {
      return;
    }
  }
  _AXSApplicationAccessibilitySetEnabled(v4);
}

void _AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage(uint64_t a1)
{
  if (a1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
    _AXSVoiceOverTouchSetUsageConfirmed(1);
  }

  _AXSVoiceOverTouchSetEnabled(a1);
}

uint64_t _AXSVoiceOverTouchUsageConfirmed()
{
  if (_AXSVoiceOverTouchUsageConfirmed_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverTouchUsageConfirmed_onceToken, &__block_literal_global_2326);
  }
  return _kAXSCacheVoiceOverUsageConfirmation;
}

uint64_t _AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription()
{
  if (_AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription_onceToken, &__block_literal_global_2328);
  }
  return _kAXSCacheVOTUserHasReadNoHomeButtonGesture;
}

void _AXSVoiceOverTouchSetUserHasReadNoHomeButtonGestureDescription(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchUserHasReadNoHomeButtonGesturePreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.vo.user.has.read.no.home.button.gesture");

  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverTouchScreenCurtainEnabled()
{
  if (_AXSVoiceOverTouchScreenCurtainEnabled_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverTouchScreenCurtainEnabled_onceToken, &__block_literal_global_2330);
  }
  return _kAXSCacheVoiceOverScreenCurtain;
}

void _AXSVoiceOverTouchSetScreenCurtainEnabled(uint64_t a1)
{
  _kAXSCacheVoiceOverScreenCurtain = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchScreenCurtainPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.vo.screen.curtain");

  _updateAccessibilitySettings();
}

float _AXSVoiceOverTouchVolume()
{
  if (_AXSVoiceOverTouchVolume_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverTouchVolume_onceToken, &__block_literal_global_2332);
  }
  return *(float *)&_kAXSCachedVoiceOverVolume;
}

void _AXSVoiceOverTouchSetVolume(float a1)
{
  float v1 = fminf(fmaxf(a1, 0.01), 1.0);
  _kAXSCachedVoiceOverVolume = LODWORD(v1);
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchVolumePreference, kCFNumberFloatType, &v1, @"com.apple.accessibility.cache.vot.volume", 0);
}

float _AXSVoiceOverTouchSpeakingRate()
{
  CFNumberRef v0 = [NSClassFromString(&cfstr_Axsettings.isa) valueForKey:@"sharedInstance"];
  float v1 = [v0 valueForKey:@"voiceOverSpeakingRate"];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

void _AXSVoiceOverTouchSetLanguageRotorItems(const void *a1)
{
  if (a1) {
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchLanguageRotorPreference, 0, a1, (const __CFString *)kAXSVoiceOverTouchLanguageRotorChangedNotification);
  }
}

void *_AXSVoiceOverTouchCopyBrailleLanguageRotorItems()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleLanguageRotorPreference, 0, 0);
}

void _AXSVoiceOverTouchSetBrailleLanguageRotorItems(const void *a1)
{
  if (a1) {
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchBrailleLanguageRotorPreference, 0, a1, (const __CFString *)kAXSVoiceOverTouchBrailleLanguageRotorChangedNotification);
  }
}

void _AXSVoiceOverTouchSetBrailleMasterStatusCellIndex(uint64_t a1)
{
  uint64_t v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleMasterStatusCellIndexPreference, kCFNumberCFIndexType, &v1, (__CFString *)kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification, 0);
}

CFIndex _AXSVoiceOverTouchBrailleContractionMode()
{
  CFPreferencesAppSynchronize((CFStringRef)kAXSAccessibilityPreferenceDomain);
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue((CFStringRef)kAXSVoiceOverTouchBrailleContractionModePreference, (CFStringRef)kAXSAccessibilityPreferenceDomain, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 1;
  }
  return result;
}

void _AXSVoiceOverTouchSetBrailleContractionMode(uint64_t a1)
{
  uint64_t v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleContractionModePreference, kCFNumberCFIndexType, &v1, (__CFString *)kAXSVoiceOverTouchBrailleContractionModeChangedNotification, 0);
}

uint64_t _AXSVoiceOverTouchBrailleEightDotMode()
{
  char v1 = 1;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchBrailleEightDotModePreference, &v1);
  if (v1) {
    return result;
  }
  else {
    return 1;
  }
}

void _AXSVoiceOverTouchSetBrailleEightDotMode(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchBrailleEightDotModePreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)kAXSVoiceOverTouchBrailleEightDotModeChangedNotification);

  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverTouchBrailleDisplayDisconnectOnSleep()
{
  char v1 = 1;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchBrailleDisplayDisconnectOnSleepPreference, &v1);
  if (v1) {
    return result;
  }
  else {
    return 1;
  }
}

void _AXSVoiceOverTouchSetBrailleDisplayDisconnectOnSleep(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchBrailleDisplayDisconnectOnSleepPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)kAXSVoiceOverTouchBrailleBrailleDisplayDisconnectOnSleepChangedNotification);

  _updateAccessibilitySettings();
}

void _AXSVoiceOverTouchSetTypingMode(uint64_t a1)
{
  char v1 = (__CFString *)kAXSVoiceOverTouchTypingModePreference;
  float v2 = (const void *)[NSNumber numberWithLong:a1];
  CFStringRef v3 = (const __CFString *)[(__CFString *)v1 stringByAppendingString:@".notification"];

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

uint64_t _AXSVoiceOverTouchTypingMode()
{
  CFNumberRef v0 = _copyPrefValueWithCustomCallback((__CFString *)kAXSVoiceOverTouchTypingModePreference, (uint64_t)_handleVoiceOverTypingModeChangedNotification);
  if (v0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v1 = [v0 integerValue];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

void _handleVoiceOverTypingModeChangedNotification()
{
}

uint64_t _AXSWebAccessibilityEventsEnabled()
{
  return 1;
}

void _AXSSetWebAccessibilityEventsEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSWebAccessibilityEventsEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.web.accessibility.events.enabled");

  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverMediaDuckingMode()
{
  if (_AXSVoiceOverMediaDuckingMode_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverMediaDuckingMode_onceToken, &__block_literal_global_2337);
  }
  return _kAXSCachedVoiceOverMediaDuckingMode;
}

void _AXSVoiceOverMediaDuckingSetMode(uint64_t a1)
{
  uint64_t v1 = a1;
  _kAXSCachedVoiceOverMediaDuckingMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchMediaDuckingModePreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.vot.media.ducking.mode", 0);
}

uint64_t _AXSVoiceOverTouchTutorialUsageConfirmed()
{
  if (_AXSVoiceOverTouchTutorialUsageConfirmed_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverTouchTutorialUsageConfirmed_onceToken, &__block_literal_global_2339);
  }
  return _kAXSCacheVoiceOverTutorialUsageConfirmation;
}

void _AXSVoiceOverTouchSetTutorialUsageConfirmed(uint64_t a1)
{
  _kAXSCacheVoiceOverTutorialUsageConfirmation = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchTutorialUsageConfirmedPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.vo.usage.tutorial.confirm");

  _updateAccessibilitySettings();
}

uint64_t _AXSBrailleScreenInputEnabled()
{
  uint64_t result = _AXSVoiceOverTouchEnabled();
  if (result)
  {
    if (_AXSBrailleScreenInputEnabled_onceToken != -1) {
      dispatch_once(&_AXSBrailleScreenInputEnabled_onceToken, &__block_literal_global_2341);
    }
    return _kAXSCacheBrailleScreenInputEnabled;
  }
  return result;
}

void _AXSBrailleScreenInputSetEnabled(uint64_t a1)
{
  _kAXSCacheBrailleScreenInputEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSBrailleScreenInputEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.bsi");

  _updateAccessibilitySettings();
}

void _AXSHoverTextSetEnabled(uint64_t a1)
{
  _kAXSCacheHoverTextEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.hovertext");

  _updateAccessibilitySettings();
}

void _AXSHoverTextTypingSetEnabled(uint64_t a1)
{
  _kAXSCacheHoverTextTypingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.hovertext.typing");

  _updateAccessibilitySettings();
}

uint64_t _AXSHoverTextTypingDisplayMode()
{
  if (_AXSHoverTextTypingDisplayMode_onceToken != -1) {
    dispatch_once(&_AXSHoverTextTypingDisplayMode_onceToken, &__block_literal_global_2347);
  }
  return _kAXSCacheHoverTextTypingDisplayMode;
}

void _AXSHoverTextTypingSetDisplayMode(uint64_t a1)
{
  uint64_t v1 = a1;
  _kAXSCacheHoverTextTypingDisplayMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSHoverTextTypingDisplayModePreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.hovertext.typing.displaymode.change", 0);
}

void *_AXSHoverTextTypingCopyFontName()
{
  uint64_t result = _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingFontNamePreference, 0, 0);
  if (!result)
  {
    CFStringRef v1 = (const __CFString *)kAXSHoverTextFontNamePreference;
    return _copyValuePreferenceApp(v1, 0, 0);
  }
  return result;
}

void *_AXSHoverTextCopyFontName()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextFontNamePreference, 0, 0);
}

void _AXSHoverTextTypingSetFontName(const void *a1)
{
}

void *_AXSHoverTextTypingCopyTextColorData()
{
  uint64_t result = _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingTextColorDataPreference, 0, 0);
  if (!result)
  {
    CFStringRef v1 = (const __CFString *)kAXSHoverTextTextColorDataPreference;
    return _copyValuePreferenceApp(v1, 0, 0);
  }
  return result;
}

void *_AXSHoverTextCopyTextColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTextColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetTextColorData(const void *a1)
{
}

void *_AXSHoverTextTypingCopyInsertionPointColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingInsertionPointColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetInsertionPointColorData(const void *a1)
{
}

void *_AXSHoverTextTypingCopyBackgroundColorData()
{
  uint64_t result = _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingBackgroundColorDataPreference, 0, 0);
  if (!result)
  {
    CFStringRef v1 = (const __CFString *)kAXSHoverTextBackgroundColorDataPreference;
    return _copyValuePreferenceApp(v1, 0, 0);
  }
  return result;
}

void *_AXSHoverTextCopyBackgroundColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextBackgroundColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetBackgroundColorData(const void *a1)
{
}

void *_AXSHoverTextTypingCopyBorderColorData()
{
  uint64_t result = _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingBorderColorDataPreference, 0, 0);
  if (!result)
  {
    CFStringRef v1 = (const __CFString *)kAXSHoverTextBorderColorDataPreference;
    return _copyValuePreferenceApp(v1, 0, 0);
  }
  return result;
}

void *_AXSHoverTextCopyBorderColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextBorderColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetBorderColorData(const void *a1)
{
}

void *_AXSHoverTextTypingCopyTextStyle()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingTextStylePreference, 0, 0);
}

void _AXSHoverTextTypingSetTextStyle(const void *a1)
{
}

void *_AXSHoverTextTypingCopyMisspelledTextColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingMisspelledTextColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetMisspelledTextColorData(const void *a1)
{
}

void *_AXSHoverTextTypingCopyAutocorrectedTextColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingAutocorrectedTextColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetAutocorrectedTextColorData(const void *a1)
{
}

float _AXSHoverTextFontSize()
{
  if (_AXSHoverTextFontSize_onceToken != -1) {
    dispatch_once(&_AXSHoverTextFontSize_onceToken, &__block_literal_global_2349);
  }
  return *(float *)&_kAXSCachedHoverTextFontSize;
}

void _AXSHoverTextSetFontSize(float a1)
{
  float v1 = a1;
  _kAXSCachedHoverTextFontSize = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSHoverTextFontSizePreference, kCFNumberFloatType, &v1, @"com.apple.accessibility.cache.hovertext.fontsize.change", 0);
}

void _AXSHoverTextSetFontName(const void *a1)
{
}

void _AXSHoverTextSetTextColorData(const void *a1)
{
}

void *_AXSHoverTextCopyInsertionPointColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextInsertionPointColorDataPreference, 0, 0);
}

void _AXSHoverTextSetInsertionPointColorData(const void *a1)
{
}

void _AXSHoverTextSetBackgroundColorData(const void *a1)
{
}

void _AXSHoverTextSetBorderColorData(const void *a1)
{
}

float _AXSHoverTextBackgroundOpacity()
{
  if (_AXSHoverTextBackgroundOpacity_onceToken != -1) {
    dispatch_once(&_AXSHoverTextBackgroundOpacity_onceToken, &__block_literal_global_2351);
  }
  return *(float *)&_kAXSCachedHoverTextBackgroundOpacity;
}

float _AXSHoverTextSetBackgroundOpacity(float a1)
{
  double v1 = a1;
  if (v1 < 0.35) {
    double v1 = 0.35;
  }
  *(float *)&int v2 = fmin(v1, 1.0);
  int v4 = v2;
  _kAXSCachedHoverTextBackgroundOpacity = v2;
  _setNumberPreferenceApp((const __CFString *)kAXSHoverTextBackgroundOpacityPreference, kCFNumberFloatType, &v4, @"com.apple.accessibility.cache.hovertext.backgroundopacity.change", 0);
  return result;
}

uint64_t _AXSHoverTextDisplayMode()
{
  if (_AXSHoverTextDisplayMode_onceToken != -1) {
    dispatch_once(&_AXSHoverTextDisplayMode_onceToken, &__block_literal_global_2353);
  }
  return _kAXSCachedHoverTextDisplayMode;
}

void _AXSHoverTextSetDisplayMode(uint64_t a1)
{
  uint64_t v1 = a1;
  _kAXSCachedHoverTextDisplayMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSHoverTextDisplayModePreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.hovertext.displaymode.change", 0);
}

void *_AXSHoverTextCopyContentSize()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextContentSizePreference, 0, 0);
}

void _AXSHoverTextSetContentSize(const void *a1)
{
}

uint64_t _AXSLiveSpeechEnabled()
{
  if (_AXSLiveSpeechEnabled_onceToken != -1) {
    dispatch_once(&_AXSLiveSpeechEnabled_onceToken, &__block_literal_global_2355);
  }
  return _kAXSCacheLiveSpeechEnabled;
}

void _AXSLiveSpeechSetEnabled(uint64_t a1)
{
  _kAXSCacheLiveSpeechEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveSpeechEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.livespeech");

  _updateAccessibilitySettings();
}

uint64_t _AXSZoomTouchToggledByVoiceOver()
{
  return _getBooleanPreference((const __CFString *)kAXSZoomTouchToggledByVoiceOverPreference, 0);
}

void _AXSZoomTouchSetToggledByVoiceOver(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchToggledByVoiceOverPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);

  _updateAccessibilitySettings();
}

uint64_t _AXSZoomTouchToggledByPreferenceSwitch()
{
  return _getBooleanPreference((const __CFString *)kAXSZoomTouchToggledByPreferenceSwitchPreference, 0);
}

void _AXSZoomTouchSetToggledByPreferenceSwitch(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchToggledByPreferenceSwitchPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);

  _updateAccessibilitySettings();
}

void _AXSZoomSpeakUnderFingerSetEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheZoomSpeakUnderFingerEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomSpeakUnderFingerEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.zoom.speakunderfinger");
  _updateAccessibilitySettings();
  if (_AXSZoomTouchEnabled())
  {
    if (v1)
    {
      uint64_t v2 = 1;
    }
    else
    {
      if (!_AXSCanDisableApplicationAccessibility()) {
        return;
      }
      uint64_t v2 = 0;
    }
    _AXSApplicationAccessibilitySetEnabled(v2);
  }
}

uint64_t _AXSZoomTouchSmoothScalingDisabled()
{
  if (_AXSZoomTouchSmoothScalingDisabled_onceToken != -1) {
    dispatch_once(&_AXSZoomTouchSmoothScalingDisabled_onceToken, &__block_literal_global_2359);
  }
  return _kAXSCacheZoomTouchSmoothScalingDisabled;
}

void _AXSZoomTouchSetSmoothScalingDisabled(uint64_t a1)
{
  _kAXSCacheZoomTouchSmoothScalingDisabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchSmoothScalingPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.zoom.smoothscaling");

  _updateAccessibilitySettings();
}

void _AXSZoomTouchSetEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheZoomTouchEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.zoom");
  _updateAccessibilitySettings();
  char v5 = 0;
  int BooleanPreference = _getBooleanPreference((const __CFString *)kAXSZoomTouchEnabledByiTunesPreference, &v5);
  if (v5) {
    BOOL v3 = BooleanPreference == v1;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  if (_AXSZoomSpeakUnderFingerEnabled_onceToken != -1) {
    dispatch_once(&_AXSZoomSpeakUnderFingerEnabled_onceToken, &__block_literal_global_2357);
  }
  if (_kAXSCacheZoomSpeakUnderFingerEnabled)
  {
    if (v1)
    {
      uint64_t v4 = 1;
    }
    else
    {
      if (!_AXSCanDisableApplicationAccessibility()) {
        return;
      }
      uint64_t v4 = 0;
    }
    _AXSApplicationAccessibilitySetEnabled(v4);
  }
}

uint64_t _AXSZoomTouchReadyForObservers()
{
  if (_AXSZoomTouchReadyForObservers_onceToken != -1) {
    dispatch_once(&_AXSZoomTouchReadyForObservers_onceToken, &__block_literal_global_2363);
  }
  return _kAXSCacheZoomTouchReadyForObservers;
}

void _AXSZoomTouchSetReadyForObservers(uint64_t a1)
{
  _kAXSCacheZoomTouchReadyForObservers = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchReadyForObserversPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.zoom.readyForObservers");

  _updateAccessibilitySettings();
}

BOOL _AXSEnhanceTextLegibilityEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSEnhanceTextLegibilityPreference, 0) == 1;
}

void _AXSSetEnhanceTextLegibilityEnabled(int a1)
{
  _AXSSetEnhanceTextLegibilityEnabledApp(a1 != 0, 0);
}

void _AXSSetEnhanceTextLegibilityEnabledApp(int a1, __CFString *a2)
{
  int v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSEnhanceTextLegibilityPreference, a1, (void (*)(void))_AXSEnhanceTextLegibilityEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSEnhanceTextLegibilityPreference, a2, (int *)&_kAXSCacheEnhanceTextLegibility, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSEnhanceTextLegibilityPreference, kCFNumberIntType, &v4, @"com.apple.accessibility.cache.enhance.text.legibility", a2);
}

uint64_t _AXSCarPlayEnhanceTextLegibilityEnabled()
{
  if (_AXSCarPlayEnhanceTextLegibilityEnabled_onceToken != -1) {
    dispatch_once(&_AXSCarPlayEnhanceTextLegibilityEnabled_onceToken, &__block_literal_global_2365);
  }
  return _kAXSCacheCarPlayEnhanceTextLegibility;
}

void _AXSSetCarPlayEnhanceTextLegibilityEnabled(uint64_t a1)
{
  _kAXSCacheCarPlayEnhanceTextLegibility = a1;
  _setPreferenceAppWithNotification(@"CarPlayEnhancedTextLegibilityEnabled", 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.carplay.enhance.text.legibility");

  _updateAccessibilitySettings();
}

uint64_t _AXSEnhanceTextTrackingEnabled()
{
  return _getBooleanPreference((const __CFString *)kAXSEnhanceTextTrackingPreference, 0);
}

void _AXSSetEnhanceTextTrackingEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSEnhanceTextTrackingPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], 0);

  _updateAccessibilitySettings();
}

BOOL _AXSEnhanceBackgroundContrastEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSEnhanceBackgroundContrastPreference, 0) == 1;
}

uint64_t _AXSEnhanceBackgroundContrastEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSEnhanceBackgroundContrastPreference, a1);
}

void _AXSSetEnhanceBackgroundContrastEnabled(int a1)
{
  _AXSSetEnhanceBackgroundContrastEnabledApp(a1 != 0, 0);
}

void _AXSSetEnhanceBackgroundContrastEnabledApp(int a1, __CFString *a2)
{
  int v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSEnhanceBackgroundContrastPreference, a1, (void (*)(void))_AXSEnhanceBackgroundContrastEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSEnhanceBackgroundContrastPreference, a2, (int *)&_kAXSCacheEnhanceBackgroundContrast, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSEnhanceBackgroundContrastPreference, kCFNumberIntType, &v4, @"com.apple.accessibility.cache.enhance.background.contrast", a2);
}

BOOL _AXSDifferentiateWithoutColorEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSDifferentiateWithoutColorPreference, 0) == 1;
}

uint64_t _AXSDifferentiateWithoutColorEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSDifferentiateWithoutColorPreference, a1);
}

void _AXSSetDifferentiateWithoutColorEnabled(int a1)
{
  _AXSSetDifferentiateWithoutColorEnabledApp(a1 != 0, 0);
}

void _AXSSetDifferentiateWithoutColorEnabledApp(int a1, __CFString *a2)
{
  int v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSDifferentiateWithoutColorPreference, a1, (void (*)(void))_AXSDifferentiateWithoutColorEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSDifferentiateWithoutColorPreference, a2, (int *)&_kAXSCacheDifferentiateWithoutColor, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSDifferentiateWithoutColorPreference, kCFNumberIntType, &v4, @"com.apple.accessibility.cache.differentiate.without.color", a2);
}

BOOL _AXSReduceMotionEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionPreference, 0) == 1;
}

void _AXSSetReduceMotionEnabled(int a1)
{
  _AXSSetReduceMotionEnabledApp(a1 != 0, 0);
  char v6 = 0;
  uint64_t v2 = _copyValuePreferenceApp((const __CFString *)kAXSPointerAllowAppCustomizationEnabledPreference, 0, &v6);
  BOOL v3 = v2;
  if (v6)
  {
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  _AXSPointerAllowAppCustomizationSetEnabled(a1 == 0);
  if (v3) {
LABEL_3:
  }
    CFRelease(v3);
LABEL_4:
  char v6 = 0;
  int v4 = _copyValuePreferenceApp((const __CFString *)kAXSPointerInertiaEnabledPreference, 0, &v6);
  char v5 = v4;
  if (v6)
  {
    if (!v4) {
      return;
    }
  }
  else
  {
    _AXSPointerEffectScalingSetEnabled(a1 == 0);
    if (!v5) {
      return;
    }
  }
  CFRelease(v5);
}

void _AXSSetReduceMotionEnabledApp(int a1, __CFString *a2)
{
  int v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSReduceMotionPreference, a1, (void (*)(void))_AXSReduceMotionEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSReduceMotionPreference, a2, (int *)&_kAXSCacheReduceMotion, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSReduceMotionPreference, kCFNumberIntType, &v4, @"com.apple.accessibility.cache.reduce.motion", a2);
}

void _AXSPointerAllowAppCustomizationSetEnabled(uint64_t a1)
{
  _kAXSCachePointerAllowAppCustomizationEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerAllowAppCustomizationEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pointer.allow.app.customization");

  _updateAccessibilitySettings();
}

void _AXSPointerEffectScalingSetEnabled(uint64_t a1)
{
  _kAXSCachePointerEffectScalingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerEffectScalingEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pointer.effect.scaling");

  _updateAccessibilitySettings();
}

void _AXSSetReduceMotionAutoplayAnimatedImagesEnabled(uint64_t a1)
{
  _kAXSCacheReduceMotionAutoplayAnimatedImagesEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSReduceMotionAutoplayAnimatedImagesPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.reduce.motion.autoplay.animated.images");

  _updateAccessibilitySettings();
}

BOOL _AXSReduceMotionReduceSlideTransitionsEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference, 0) == 1;
}

uint64_t _AXSReduceMotionReduceSlideTransitionsEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference, a1);
}

void _AXSSetReduceMotionReduceSlideTransitionsEnabled(int a1)
{
  _AXSSetReduceMotionReduceSlideTransitionsEnabledApp(a1 != 0, 0);
}

void _AXSSetReduceMotionReduceSlideTransitionsEnabledApp(int a1, __CFString *a2)
{
  int v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSReduceMotionReduceSlideTransitionsPreference, a1, (void (*)(void))_AXSReduceMotionReduceSlideTransitionsEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference, a2, (int *)&_kAXSCacheReduceMotionReduceSlideTransitions, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference, kCFNumberIntType, &v4, @"com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions", a2);
}

uint64_t _AXSReduceMotionAutoplayMessagesEffectsEnabled()
{
  if (_AXSReduceMotionAutoplayMessagesEffectsEnabled_onceToken != -1) {
    dispatch_once(&_AXSReduceMotionAutoplayMessagesEffectsEnabled_onceToken, &__block_literal_global_2369);
  }
  return _kAXSCacheReduceMotionAutoplayMessagesEffectsEnabled;
}

void _AXSSetReduceMotionAutoplayMessagesEffectsEnabled(uint64_t a1)
{
  _kAXSCacheReduceMotionAutoplayMessagesEffectsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSReduceMotionAutoplayMessagesEffectsPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.reduce.motion.autoplay.messages.effects");

  _updateAccessibilitySettings();
}

BOOL _AXSReduceMotionAutoplayVideoPreviewsEnabledValueFromValueRespectingVoiceOverDefault(int a1)
{
  if (_AXSVoiceOverTouchEnabled()) {
    return a1 == 1;
  }
  else {
    return a1 != 0;
  }
}

BOOL _AXSReduceMotionAutoplayVideoPreviewsEnabledGlobal()
{
  int v0 = AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference, 0);
  if (_AXSVoiceOverTouchEnabled()) {
    return v0 == 1;
  }
  else {
    return v0 != 0;
  }
}

uint64_t _AXSReduceMotionAutoplayVideoPreviewsEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference, a1);
}

void _AXSSetReduceMotionAutoplayVideoPreviewsEnabled(int a1)
{
  _AXSSetReduceMotionAutoplayVideoPreviewsEnabledApp(a1 != 0, 0);
}

void _AXSSetReduceMotionAutoplayVideoPreviewsEnabledApp(int a1, __CFString *a2)
{
  int v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSReduceMotionAutoplayVideoPreviewsPreference, a1, (void (*)(void))_AXSReduceMotionAutoplayVideoPreviewsEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference, a2, (int *)&_kAXSCacheReduceMotionAutoplayVideoPreviews, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference, kCFNumberIntType, &v4, @"com.apple.accessibility.cache.reduce.motion.autoplay.video.previews", a2);
}

uint64_t _AXSUpdateWebAccessibilitySettings()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v0 = AXLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190274000, v0, OS_LOG_TYPE_DEFAULT, "Updating web accessibility settings", buf, 2u);
  }

  _updateBoolCachePreferenceAndRepostNotification((const __CFString *)kAXSAccessibilityEnabledPreference, @"com.apple.accessibility.cache.ax", (unsigned __int8 *)&_kAXSCacheAccessibilityEnabled);
  _updateBoolCachePreferenceAndRepostNotification((const __CFString *)kAXSApplicationAccessibilityEnabledPreference, @"com.apple.accessibility.cache.app.ax", (unsigned __int8 *)&_kAXSCacheApplicationAccessibilityEnabled);
  _updateCachePreferenceAndRepostNotification((const __CFString *)kAXSIncreaseButtonLegibilityPreference, kAXSIncreaseButtonLegibilityNotification, 0, (int *)&_kAXSCacheIncreaseButtonLegibility);
  _updateCachePreferenceAndRepostNotification((const __CFString *)kAXSReduceMotionPreference, kAXSReduceMotionChangedNotification, 0, (int *)&_kAXSCacheReduceMotion);
  _updateCachePreferenceAndRepostNotification((const __CFString *)kAXSEnhanceTextLegibilityPreference, kAXSEnhanceTextLegibilityChangedNotification, 0, (int *)&_kAXSCacheEnhanceTextLegibility);
  _updateCachePreferenceAndRepostNotification((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, kAXSDarkenSystemColorsEnabledNotification, 0, (int *)&_kAXSCacheDarkenSystemColors);
  int v9 = -1;
  _updateCachePreferenceAndRepostNotification(@"AXSAirPodsSpatialAudioLockToDevice", (const __CFString *)kAXSAirPodSpatialAudioLockToDeviceChangedNotification, 0, &v9);
  _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled = v9 == 1;
  int v1 = AXLogCommon();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = [NSNumber numberWithUnsignedChar:_kAXSCacheAccessibilityEnabled];
    BOOL v3 = [NSNumber numberWithUnsignedChar:_kAXSCacheApplicationAccessibilityEnabled];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v2;
    __int16 v11 = 2112;
    CFIndex v12 = v3;
    _os_log_impl(&dword_190274000, v1, OS_LOG_TYPE_DEFAULT, "New accessibility: %@, app ax: %@", buf, 0x16u);
  }
  char v8 = 0;
  CFNumberRef v4 = (const __CFNumber *)_copyValuePreferenceApp(@"AXSSpatialAudioHeadTracking", 0, &v8);
  CFNumberRef v5 = v4;
  if (v8 && v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID())
    {
      *(void *)buf = 0;
      CFNumberGetValue(v5, kCFNumberCFIndexType, buf);
      _kAXSCacheSpatialAudioHeadTracking = *(void *)buf;
    }
    goto LABEL_10;
  }
  if (v4) {
LABEL_10:
  }
    CFRelease(v5);
  _updateCacheSmartInvertAndRepostNotification(0);
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSGrayscaleEnabledPreference, 0);
  _kAXSCacheGrayscaleEnabled = result;
  return result;
}

void _updateBoolCachePreferenceAndRepostNotification(const __CFString *a1, const __CFString *a2, unsigned __int8 *a3)
{
  *a3 = _fetchCachePreference(a1, 0, 0, 0) == 1;
  CFTypeID v6 = AXSupportLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    _updateBoolCachePreferenceAndRepostNotification_cold_1((uint64_t)a1, a3, v6);
  }

  postNotification(a2);
}

void _updateCachePreferenceAndRepostNotification(const __CFString *a1, const __CFString *a2, const __CFString *a3, int *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *a4 = _fetchCachePreference(a1, a3, 0, 0);
  char v8 = AXSupportLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = *a4;
    int v10 = 138412802;
    CFStringRef v11 = a3;
    __int16 v12 = 2112;
    CFStringRef v13 = a1;
    __int16 v14 = 1024;
    int v15 = v9;
    _os_log_debug_impl(&dword_190274000, v8, OS_LOG_TYPE_DEBUG, "Update Cache Value On Notification: appID = %@, preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)", (uint8_t *)&v10, 0x1Cu);
  }

  postNotification(a2);
}

void _updateCacheSmartInvertAndRepostNotification(const __CFString *a1)
{
  int v1 = -1;
  int valuePtr = -1;
  CFNumberRef NumberPreference = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSInvertColorsEnabledPreference, a1);
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    BOOL v3 = AXSupportLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      _updateCacheSmartInvertAndRepostNotification_cold_4();
    }

    int v1 = valuePtr;
  }
  _kAXSCacheInvertColors = v1;
  CFNumberRef v4 = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSInvertColorsEnabledPreference, 0);
  if (v4)
  {
    CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    _kAXSCacheInvertColorsGlobal = valuePtr;
    CFNumberRef v5 = AXSupportLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      _updateCacheSmartInvertAndRepostNotification_cold_3();
    }
  }
  if (_kAXSCacheInvertColors == -1) {
    _kAXSCacheInvertColors = _kAXSCacheInvertColorsGlobal;
  }
  CFTypeID v6 = AXSupportLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    _updateCacheSmartInvertAndRepostNotification_cold_2();
  }

  if (_kAXSCacheInvertColors == 1 && _kAXSCacheInvertColorsGlobal != 1)
  {
    uint64_t v7 = AXSupportLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      _updateCacheSmartInvertAndRepostNotification_cold_1();
    }

    if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
    }
    if (!_AXSCurrentProcessIsWebContent_IsWebContent)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSAccessibilityEnabledNotification, 0, 0, 1u);
    }
  }
  postNotification(kAXSInvertColorsEnabledNotification);
}

BOOL _AXSIncreaseButtonLegibilityGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSIncreaseButtonLegibilityPreference, 0) == 1;
}

void _AXSSetIncreaseButtonLegibility(int a1)
{
  _AXSSetIncreaseButtonLegibilityApp(a1 != 0, 0);
}

void _AXSSetIncreaseButtonLegibilityApp(int a1, __CFString *a2)
{
  int v3 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSIncreaseButtonLegibilityPreference, kCFNumberIntType, &v3, @"com.apple.accessibility.cache.increase.button.legibility", a2);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSIncreaseButtonLegibilityPreference, a2, (int *)&_kAXSCacheIncreaseButtonLegibility, v3);
}

BOOL _AXSButtonShapesEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSButtonShapesEnabledPreference, 0) == 1;
}

uint64_t _AXSButtonShapesEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSButtonShapesEnabledPreference, a1);
}

void _AXSSetButtonShapesEnabled(int a1)
{
  _AXSSetButtonShapesEnabledApp(a1 != 0, 0);
}

void _AXSSetButtonShapesEnabledApp(int a1, __CFString *a2)
{
  int v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSButtonShapesEnabledPreference, a1, (void (*)(void))_AXSButtonShapesEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSButtonShapesEnabledPreference, a2, (int *)&_kAXSCacheButtonShapes, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSButtonShapesEnabledPreference, kCFNumberIntType, &v4, @"com.apple.accessibility.cache.button.shapes.enabled", a2);
}

uint64_t _AXSSetReduceWhitePointEnabled(int a1)
{
  if (a1)
  {
    MADisplayFilterPrefSetType();
  }
  else
  {
    uint64_t result = MADisplayFilterPrefGetType();
    if (result != 128) {
      return result;
    }
    uint64_t result = MADisplayFilterPrefGetCategoryEnabled();
    if (!result) {
      return result;
    }
  }

  return MADisplayFilterPrefSetCategoryEnabled();
}

void _AXSSetUseDarkerKeyboard(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSUseDarkerKeyboardPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.use.darker.keyboard.enabled");

  _updateAccessibilitySettings();
}

void _AXSSetHighContrastFocusIndicatorsEnabled(uint64_t a1)
{
  _kAXSCacheHighContrastFocusIndicatorsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHighContrastFocusIndicatorsEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.use.prominent.focus.indicators");

  _updateAccessibilitySettings();
}

void _AXSSetUseSingleSystemColor(uint64_t a1)
{
  _kAXSCacheUseSingleSystemColor = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSUseSingleSystemColorPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.use.single.system.color.enabled");

  _updateAccessibilitySettings();
}

float _AXSSingleSystemColorValues()
{
  return 0.34902;
}

uint64_t _AXSNamedSingleSystemColor()
{
  int v0 = _copyValuePreferenceApp((const __CFString *)kAXSNamedSystemColorChoicePreference, 0, 0);
  if (v0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v1 = [v0 intValue];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

void _AXSSetNamedSingleSystemColor(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSNamedSystemColorChoicePreference, 0, (const void *)[NSNumber numberWithUnsignedInt:a1], (const __CFString *)[kAXSNamedSystemColorChoicePreference stringByAppendingString:@".notification"]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.cache.use.single.system.color.enabled", 0, 0, 1u);
}

BOOL _AXDarkenSystemColorsGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, 0) == 1;
}

void _AXSSetDarkenSystemColors(uint64_t a1)
{
  _AXSSetDarkenSystemColorsApp(a1 != 0, 0);

  _AXSPointerIncreasedContrastSetEnabled(a1);
}

void _AXSSetDarkenSystemColorsApp(int a1, __CFString *a2)
{
  int v3 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, kCFNumberIntType, &v3, @"com.apple.accessibility.cache.darken.system.colors.enabled", a2);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, a2, (int *)&_kAXSCacheDarkenSystemColors, v3);
}

void _AXSPointerIncreasedContrastSetEnabled(uint64_t a1)
{
  _kAXSCachePointerIncreasedContrastEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerIncreasedContrastEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pointer.increased.contrast");

  _updateAccessibilitySettings();
}

uint64_t _AXSShakeToUndoDisabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSShakeToUndoDisabledPreference, 0, (uint64_t)_handleShakeToUndoDisabledPreferenceDidChangeNotification);
}

void _handleShakeToUndoDisabledPreferenceDidChangeNotification()
{
}

void _AXSSetShakeToUndoDisabled(uint64_t a1)
{
  uint64_t v1 = (__CFString *)kAXSShakeToUndoDisabledPreference;
  uint64_t v2 = (const void *)[NSNumber numberWithUnsignedChar:a1];
  CFStringRef v3 = (const __CFString *)[(__CFString *)v1 stringByAppendingString:@".notification"];

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

uint64_t _AXSVibrationDisabled()
{
  if (_AXSVibrationDisabled_onceToken != -1) {
    dispatch_once(&_AXSVibrationDisabled_onceToken, &__block_literal_global_2375);
  }
  return _kAXSCacheVibrationDisabled;
}

void _AXSSetVibrationDisabled(uint64_t a1)
{
  _kAXSCacheVibrationDisabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVibrationDisabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.VibrationDisabled");
  _updateAccessibilitySettings();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"VibrationDisabledPreferenceDidChange", 0, 0, 1u);
}

uint64_t _AXSForceTouchEnabled()
{
  if (_AXSForceTouchEnabled_onceToken != -1) {
    dispatch_once(&_AXSForceTouchEnabled_onceToken, &__block_literal_global_2380);
  }
  return _kAXSCachedForceTouchEnabled;
}

void _AXSSetForceTouchEnabled(uint64_t a1)
{
  _kAXSCachedForceTouchEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSForceTouchEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.forcetouch.enabled.changed");

  _updateAccessibilitySettings();
}

uint64_t _AXSForceTouchTimeDuration()
{
  if (_AXSForceTouchTimeDuration_onceToken != -1) {
    dispatch_once(&_AXSForceTouchTimeDuration_onceToken, &__block_literal_global_2382);
  }
  return *(float *)&_kAXSCachedForceTouchTiming;
}

void _AXSSetForceTouchTimeDuration(unsigned int a1)
{
  unsigned int v1 = a1;
  *(float *)&_kAXSCachedForceTouchTiming = (float)a1;
  _setNumberPreferenceApp((const __CFString *)kAXSForceTouchTimingPreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.forcetouch.timing.changed", 0);
}

float _AXSForceTouchSensitivity()
{
  if (_AXSForceTouchSensitivity_onceToken != -1) {
    dispatch_once(&_AXSForceTouchSensitivity_onceToken, &__block_literal_global_2384);
  }
  return *(float *)&_kAXSCachedForceTouchSensitivity;
}

void _AXSSetForceTouchSensitivity(float a1)
{
  float v1 = fminf(fmaxf(a1, 0.8), 1.2);
  _kAXSCachedForceTouchSensitivity = LODWORD(v1);
  _setNumberPreferenceApp((const __CFString *)kAXSForceTouchSensitivityPreference, kCFNumberFloatType, &v1, @"com.apple.accessibility.cache.forcetouch.sensitivity.changed", 0);
}

uint64_t _AXSLowercaseKeyboardDisplayEnabled()
{
  if (_AXSLowercaseKeyboardDisplayEnabled_onceToken != -1) {
    dispatch_once(&_AXSLowercaseKeyboardDisplayEnabled_onceToken, &__block_literal_global_2386);
  }
  return _kAXSCacheLowercaseKeyboardEnabled;
}

void _AXSSetLowercaseKeyboardDisplayEnabled(uint64_t a1)
{
  _kAXSCacheLowercaseKeyboardEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLowerCaseKeyboardEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.lower.case.keyboard.enabled");

  _updateAccessibilitySettings();
}

uint64_t _AXSSlowKeysEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSSlowKeysEnabledPreference, 0, (uint64_t)_handleSlowKeysEnabledPreferenceDidChangeNotification);
}

void _handleSlowKeysEnabledPreferenceDidChangeNotification()
{
}

void _AXSSetSlowKeysEnabled(uint64_t a1)
{
  float v1 = (__CFString *)kAXSSlowKeysEnabledPreference;
  uint64_t v2 = (const void *)[NSNumber numberWithUnsignedChar:a1];
  CFStringRef v3 = (const __CFString *)[(__CFString *)v1 stringByAppendingString:@".notification"];

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

double _AXSSlowKeysAcceptanceDelay()
{
  return _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSSlowKeysAcceptanceDelayPreference, (uint64_t)_handleSlowKeysAcceptanceDelayPreferenceDidChangeNotification, 0.3);
}

double _getPrefTimeIntervalValueWithCustomCallback(__CFString *a1, uint64_t a2, double a3)
{
  int v4 = _copyPrefValueWithCustomCallback(a1, a2);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 doubleValue];
      a3 = v5;
    }
  }

  return a3;
}

void _handleSlowKeysAcceptanceDelayPreferenceDidChangeNotification()
{
}

void _AXSSetSlowKeysAcceptanceDelay()
{
  int v0 = (__CFString *)kAXSSlowKeysAcceptanceDelayPreference;
  float v1 = (const void *)[NSNumber numberWithDouble:];
  CFStringRef v2 = (const __CFString *)[(__CFString *)v0 stringByAppendingString:@".notification"];

  _setPreferenceAppWithNotification(v0, 0, v1, v2);
}

uint64_t _AXSKeyRepeatEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSKeyRepeatEnabledPreference, 1, 0);
}

void _AXSSetKeyRepeatEnabled(uint64_t a1)
{
  float v1 = (__CFString *)kAXSKeyRepeatEnabledPreference;
  CFStringRef v2 = (const void *)[NSNumber numberWithUnsignedChar:a1];
  CFStringRef v3 = (const __CFString *)[(__CFString *)v1 stringByAppendingString:@".notification"];

  _setPreferenceAppWithNotification(v1, 0, v2, v3);
}

double _AXSKeyRepeatInterval()
{
  double PrefTimeIntervalValueWithCustomCallback = _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSKeyRepeatIntervalPreference, 0, 0.1);
  if (_getPrefBooleanValueWithCustomCallback((__CFString *)kAXSSlowKeysEnabledPreference, 0, (uint64_t)_handleSlowKeysEnabledPreferenceDidChangeNotification))
  {
    double v1 = _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSSlowKeysAcceptanceDelayPreference, (uint64_t)_handleSlowKeysAcceptanceDelayPreferenceDidChangeNotification, 0.3);
    if (PrefTimeIntervalValueWithCustomCallback < v1) {
      return v1;
    }
  }
  return PrefTimeIntervalValueWithCustomCallback;
}

void _AXSSetKeyRepeatInterval()
{
  int v0 = (__CFString *)kAXSKeyRepeatIntervalPreference;
  double v1 = (const void *)[NSNumber numberWithDouble:];
  CFStringRef v2 = (const __CFString *)[(__CFString *)v0 stringByAppendingString:@".notification"];

  _setPreferenceAppWithNotification(v0, 0, v1, v2);
}

double _AXSKeyRepeatDelay()
{
  double PrefTimeIntervalValueWithCustomCallback = _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSKeyRepeatDelayPreference, 0, 0.4);
  if (_getPrefBooleanValueWithCustomCallback((__CFString *)kAXSSlowKeysEnabledPreference, 0, (uint64_t)_handleSlowKeysEnabledPreferenceDidChangeNotification))
  {
    double v1 = _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSSlowKeysAcceptanceDelayPreference, (uint64_t)_handleSlowKeysAcceptanceDelayPreferenceDidChangeNotification, 0.3);
    if (PrefTimeIntervalValueWithCustomCallback < v1) {
      return v1;
    }
  }
  return PrefTimeIntervalValueWithCustomCallback;
}

void _AXSSetKeyRepeatDelay()
{
  int v0 = (__CFString *)kAXSKeyRepeatDelayPreference;
  double v1 = (const void *)[NSNumber numberWithDouble:];
  CFStringRef v2 = (const __CFString *)[(__CFString *)v0 stringByAppendingString:@".notification"];

  _setPreferenceAppWithNotification(v0, 0, v1, v2);
}

void _handlePhoneticFeedbackPrefsChangedNotification()
{
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1731);
  }
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v1 = (const __CFString *)kAXSPhoneticFeedbackEnabledNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v1, 0, 0, 1u);
}

void _AXSSetPhoneticFeedbackEnabled(uint64_t a1)
{
  int v1 = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPhoneticFeedbackEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)[kAXSPhoneticFeedbackEnabledPreference stringByAppendingString:@".notification"]);
  _updateAccessibilitySettings();
  if (v1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v2 = 0;
  }

  _AXSApplicationAccessibilitySetEnabled(v2);
}

void _handleLetterFeedbackPrefsChangedNotification()
{
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1731);
  }
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v1 = (const __CFString *)kAXSLetterFeedbackEnabledNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v1, 0, 0, 1u);
}

void _AXSSetLetterFeedbackEnabled(uint64_t a1)
{
  int v1 = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLetterFeedbackEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)[kAXSLetterFeedbackEnabledPreference stringByAppendingString:@".notification"]);
  _updateAccessibilitySettings();
  if (v1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v2 = 0;
  }

  _AXSApplicationAccessibilitySetEnabled(v2);
}

void _handleQuickTypePredictionFeedbackPrefsChangedNotification()
{
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1731);
  }
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v1 = (const __CFString *)kAXSQuickTypePredictionFeedbackEnabledNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v1, 0, 0, 1u);
}

void _AXSSetQuickTypePredictionFeedbackEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSQuickTypePredictionFeedbackEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)[kAXSQuickTypePredictionFeedbackEnabledPreference stringByAppendingString:@".notification"]);

  _updateAccessibilitySettings();
}

void _handleWordFeedbackPrefsChangedNotification()
{
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1731);
  }
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v1 = (const __CFString *)kAXSWordFeedbackEnabledNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v1, 0, 0, 1u);
}

void _AXSSetWordFeedbackEnabled(uint64_t a1)
{
  int v1 = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWordFeedbackEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)[kAXSWordFeedbackEnabledPreference stringByAppendingString:@".notification"]);
  _updateAccessibilitySettings();
  if (v1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v2 = 0;
  }

  _AXSApplicationAccessibilitySetEnabled(v2);
}

uint64_t _AXSWebProcessAllowsSecondaryThreadAccess()
{
  if (_AXSWebProcessAllowsSecondaryThreadAccess_onceToken != -1) {
    dispatch_once(&_AXSWebProcessAllowsSecondaryThreadAccess_onceToken, &__block_literal_global_2388);
  }
  return _kAXSCacheWebProcessAllowsSecondaryThreadEnabled;
}

void _AXSSetWebProcessAllowsSecondaryThreadAccess(uint64_t a1)
{
  _kAXSCacheWebProcessAllowsSecondaryThreadEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWebProcessAllowsSecondaryThreadEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.allows.notification");

  _updateAccessibilitySettings();
}

uint64_t _AXSPointerAllowAppCustomizationEnabled()
{
  if (_AXSPointerAllowAppCustomizationEnabled_onceToken != -1) {
    dispatch_once(&_AXSPointerAllowAppCustomizationEnabled_onceToken, &__block_literal_global_2395);
  }
  return _kAXSCachePointerAllowAppCustomizationEnabled;
}

void _AXSPointerInertiaSetEnabled(uint64_t a1)
{
  _kAXSCachePointerInertiaEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerInertiaEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pointer.inertia");

  _updateAccessibilitySettings();
}

uint64_t _AXSPointerInertiaEnabled()
{
  if (_AXSPointerInertiaEnabled_onceToken != -1) {
    dispatch_once(&_AXSPointerInertiaEnabled_onceToken, &__block_literal_global_2397);
  }
  return _kAXSCachePointerInertiaEnabled;
}

uint64_t _AXSPointerEffectScalingEnabled()
{
  if (_AXSPointerEffectScalingEnabled_onceToken != -1) {
    dispatch_once(&_AXSPointerEffectScalingEnabled_onceToken, &__block_literal_global_2399);
  }
  return _kAXSCachePointerEffectScalingEnabled;
}

void _AXSPointerSetSizeMultiplier(float a1)
{
  float v1 = fminf(a1, 5.0);
  if (v1 < 1.0) {
    float v1 = 1.0;
  }
  float v2 = v1;
  _kAXSCachePointerSizeMultiplier = LODWORD(v1);
  _setNumberPreferenceApp((const __CFString *)kAXSPointerSizeMultiplierPreference, kCFNumberFloatType, &v2, @"com.apple.accessibility.cache.pointer.size.multiplier", 0);
}

float _AXSPointerSizeMultiplier()
{
  if (_AXSPointerSizeMultiplier_onceToken != -1) {
    dispatch_once(&_AXSPointerSizeMultiplier_onceToken, &__block_literal_global_2401);
  }
  return *(float *)&_kAXSCachePointerSizeMultiplier;
}

BOOL _AXSPointerShouldShowCenterPoint()
{
  if (_AXSPointerSizeMultiplier_onceToken != -1) {
    dispatch_once(&_AXSPointerSizeMultiplier_onceToken, &__block_literal_global_2401);
  }
  return *(float *)&_kAXSCachePointerSizeMultiplier >= 3.0;
}

uint64_t _AXSPointerIncreasedContrastEnabled()
{
  if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
    dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
  }
  return _kAXSCachePointerIncreasedContrastEnabled;
}

void _AXSPointerAutoHideSetEnabled(uint64_t a1)
{
  _kAXSCachePointerAutoHideEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerAutoHideEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pointer.auto.hide");

  _updateAccessibilitySettings();
}

uint64_t _AXSPointerAutoHideEnabled()
{
  if (_AXSPointerAutoHideEnabled_onceToken != -1) {
    dispatch_once(&_AXSPointerAutoHideEnabled_onceToken, &__block_literal_global_2405);
  }
  return _kAXSCachePointerAutoHideEnabled;
}

void _AXSPointerSetAutoHideDuration(float a1)
{
  float v1 = a1;
  _kAXSCachePointerAutoHideDuration = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPointerAutoHideDurationPreference, kCFNumberFloatType, &v1, @"com.apple.accessibility.cache.pointer.auto.hide.duration", 0);
}

float _AXSPointerAutoHideDuration()
{
  if (_AXSPointerAutoHideDuration_onceToken != -1) {
    dispatch_once(&_AXSPointerAutoHideDuration_onceToken, &__block_literal_global_2407);
  }
  return *(float *)&_kAXSCachePointerAutoHideDuration;
}

void _AXSPointerSetStrokeColorWidth(float a1)
{
  float v1 = a1;
  _kAXSCachePointerStrokeColorWidth = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPointerStrokeColorWidthPreference, kCFNumberFloatType, &v1, @"com.apple.accessibility.cache.pointer.stroke.color.width", 0);
}

float _AXSPointerStrokeColorWidth()
{
  if (_AXSPointerStrokeColorWidth_onceToken != -1) {
    dispatch_once(&_AXSPointerStrokeColorWidth_onceToken, &__block_literal_global_2409);
  }
  return *(float *)&_kAXSCachePointerStrokeColorWidth;
}

void _AXSPointerSetStrokeColor(int a1)
{
  int v1 = a1;
  _kAXSCachePointerStrokeColor = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSPointerStrokeColorPreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.pointer.stroke.color", 0);
}

uint64_t _AXSPointerStrokeColor()
{
  if (_AXSPointerStrokeColor_onceToken != -1) {
    dispatch_once(&_AXSPointerStrokeColor_onceToken, &__block_literal_global_2411);
  }
  return _kAXSCachePointerStrokeColor;
}

uint64_t _AXSPointerStrokeColorValues(int a1, float *a2, float *a3, float *a4, _DWORD *a5)
{
  switch(a1)
  {
    case 1:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      float v9 = 1.0;
      float v10 = 1.0;
      float v11 = 1.0;
      goto LABEL_31;
    case 2:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = -0.25;
      if (!_kAXSCachePointerIncreasedContrastEnabled) {
        float v9 = 0.0;
      }
      float v10 = flt_1902A1A18[_kAXSCachePointerIncreasedContrastEnabled == 0];
      float v11 = 0.75;
      float v14 = 1.0;
      goto LABEL_29;
    case 3:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v15 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = 0.75;
      if (!_kAXSCachePointerIncreasedContrastEnabled) {
        float v9 = 1.0;
      }
      float v10 = flt_1902A1A08[_kAXSCachePointerIncreasedContrastEnabled == 0];
      uint64_t v16 = (float *)&unk_1902A1A10;
      goto LABEL_19;
    case 4:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v15 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = flt_1902A19F0[_kAXSCachePointerIncreasedContrastEnabled == 0];
      float v10 = flt_1902A19F8[_kAXSCachePointerIncreasedContrastEnabled == 0];
      uint64_t v16 = (float *)&unk_1902A1A00;
LABEL_19:
      float v11 = v16[v15];
      goto LABEL_31;
    case 5:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      BOOL v17 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = 0.75;
      float v18 = 1.0;
      uint64_t v19 = (float *)&unk_1902A19E8;
      goto LABEL_26;
    case 6:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      BOOL v17 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = 0.75;
      float v18 = 1.0;
      uint64_t v19 = (float *)&unk_1902A19E0;
LABEL_26:
      if (v13) {
        float v9 = v18;
      }
      float v10 = v19[v17];
      float v11 = -0.25;
      float v14 = 0.0;
LABEL_29:
      if (v13) {
        float v11 = v14;
      }
LABEL_31:
      *a2 = v9;
      *a3 = v10;
      *a4 = v11;
      *a5 = 1065353216;
      uint64_t result = 1;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t _ASTVirtualTrackpadColorValues(int a1, float *a2, float *a3, float *a4, _DWORD *a5)
{
  switch(a1)
  {
    case 0:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      float v9 = flt_1902A1A20[_kAXSCachePointerIncreasedContrastEnabled == 0];
      float v10 = v9;
      float v11 = v9;
      goto LABEL_34;
    case 1:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      float v9 = 1.0;
      float v10 = 1.0;
      float v11 = 1.0;
      goto LABEL_34;
    case 2:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = -0.25;
      if (!_kAXSCachePointerIncreasedContrastEnabled) {
        float v9 = 0.0;
      }
      float v10 = flt_1902A1A18[_kAXSCachePointerIncreasedContrastEnabled == 0];
      float v11 = 0.75;
      float v14 = 1.0;
      goto LABEL_32;
    case 3:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v15 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = 0.75;
      if (!_kAXSCachePointerIncreasedContrastEnabled) {
        float v9 = 1.0;
      }
      float v10 = flt_1902A1A08[_kAXSCachePointerIncreasedContrastEnabled == 0];
      uint64_t v16 = (float *)&unk_1902A1A10;
      goto LABEL_22;
    case 4:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v15 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = flt_1902A19F0[_kAXSCachePointerIncreasedContrastEnabled == 0];
      float v10 = flt_1902A19F8[_kAXSCachePointerIncreasedContrastEnabled == 0];
      uint64_t v16 = (float *)&unk_1902A1A00;
LABEL_22:
      float v11 = v16[v15];
      goto LABEL_34;
    case 5:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      BOOL v17 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = 0.75;
      float v18 = 1.0;
      uint64_t v19 = (float *)&unk_1902A19E8;
      goto LABEL_29;
    case 6:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1) {
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_2403);
      }
      BOOL v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      BOOL v17 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      float v9 = 0.75;
      float v18 = 1.0;
      uint64_t v19 = (float *)&unk_1902A19E0;
LABEL_29:
      if (v13) {
        float v9 = v18;
      }
      float v10 = v19[v17];
      float v11 = -0.25;
      float v14 = 0.0;
LABEL_32:
      if (v13) {
        float v11 = v14;
      }
LABEL_34:
      *a2 = v9;
      *a3 = v10;
      *a4 = v11;
      *a5 = 1065353216;
      uint64_t result = 1;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void _AXSPointerSetVoiceOverCursorOption(int a1)
{
  int v1 = a1;
  _kAXSCachePointerVoiceOverCursorOption = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSPointerVoiceOverCursorOptionPreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.pointer.voiceover.option", 0);
}

uint64_t _AXSPointerVoiceOverCursorOption()
{
  if (_AXSPointerVoiceOverCursorOption_onceToken != -1) {
    dispatch_once(&_AXSPointerVoiceOverCursorOption_onceToken, &__block_literal_global_2413);
  }
  return _kAXSCachePointerVoiceOverCursorOption;
}

void _AXSVoiceOverSpeakUnderPointerSetEnabled(uint64_t a1)
{
  _kAXSCacheVoiceOverSpeakUnderPointer = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverSpeakUnderPointerPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.voiceover.speak.under.pointer");

  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverSpeakUnderPointerEnabled()
{
  if (_AXSVoiceOverSpeakUnderPointerEnabled_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverSpeakUnderPointerEnabled_onceToken, &__block_literal_global_2415);
  }
  return _kAXSCacheVoiceOverSpeakUnderPointer;
}

void _AXSVoiceOverSpeakUnderPointerSetDelay(float a1)
{
  float v1 = a1;
  _kAXSCacheVoiceOverSpeakUnderPointerDelay = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverSpeakUnderPointerDelayPreference, kCFNumberFloatType, &v1, @"com.apple.accessibility.cache.voiceover.speak.under.pointer", 0);
}

float _AXSVoiceOverSpeakUnderPointerDelay()
{
  if (_AXSVoiceOverSpeakUnderPointerDelay_onceToken != -1) {
    dispatch_once(&_AXSVoiceOverSpeakUnderPointerDelay_onceToken, &__block_literal_global_2417);
  }
  return *(float *)&_kAXSCacheVoiceOverSpeakUnderPointerDelay;
}

void _AXSPointerScaleWithZoomLevelSetEnabled(uint64_t a1)
{
  _kAXSCachePointerScaleWithZoomLevelEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerScaleWithZoomLevelEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pointer.scale.with.zoom.level");

  _updateAccessibilitySettings();
}

uint64_t _AXSPointerScaleWithZoomLevelEnabled()
{
  if (_AXSPointerScaleWithZoomLevelEnabled_onceToken != -1) {
    dispatch_once(&_AXSPointerScaleWithZoomLevelEnabled_onceToken, &__block_literal_global_2419);
  }
  return _kAXSCachePointerScaleWithZoomLevelEnabled;
}

void _AXSSetHapticMusicEnabled(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  float v2 = AXLogHapticMusic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = [NSNumber numberWithUnsignedChar:a1];
    int v4 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v5 = 138412546;
    CFTypeID v6 = v3;
    __int16 v7 = 2112;
    char v8 = v4;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Enabling haptic music: %@: %@", (uint8_t *)&v5, 0x16u);
  }
  _kAXSCacheHapticMusicEnabled = a1 != 0;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHapticMusicEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)_kAXSCacheHapticMusicDidChangeNotification);
  _updateAccessibilitySettings();
}

void _AXSSetAudioDonationSiriImprovementEnabled(uint64_t a1)
{
  _kAXSCacheAudioDonationSiriImprovementEnabled = a1 != 0;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAudioDonationSiriImprovementEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)_kAXSCacheAudioDonationSiriImprovementDidChangeNotification);

  _updateAccessibilitySettings();
}

uint64_t _AXSAudioDonationSiriImprovementEnabled()
{
  if (_AXSAudioDonationSiriImprovementEnabled_onceToken != -1) {
    dispatch_once(&_AXSAudioDonationSiriImprovementEnabled_onceToken, &__block_literal_global_2423);
  }
  return _kAXSCacheAudioDonationSiriImprovementEnabled;
}

void _AXSSetMotionCuesActive(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  float v2 = AXLogMotionCues();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = [NSNumber numberWithUnsignedChar:a1];
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Set motion cues active: %@", (uint8_t *)&v4, 0xCu);
  }
  _kAXSCacheMotionCuesActive = a1 != 0;
  _setPreferenceAppWithNotification(@"AXSMotionCuesActive", 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)_kAXSCacheMotionCuesActiveDidChangeNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSMotionCuesActive()
{
  if (_AXSMotionCuesActive_onceToken != -1) {
    dispatch_once(&_AXSMotionCuesActive_onceToken, &__block_literal_global_2425);
  }
  return _kAXSCacheMotionCuesActive;
}

void _AXSSetMotionCuesShouldShowBanner(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  float v2 = AXLogMotionCues();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = [NSNumber numberWithUnsignedChar:a1];
    int v4 = 138412290;
    int v5 = v3;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Set motion cues shouldShowBanner: %@", (uint8_t *)&v4, 0xCu);
  }
  _kAXSCacheMotionCuesShouldShowBanner = a1 != 0;
  _setPreferenceAppWithNotification(@"AXSMotionCuesShouldShowBanner", 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)_kAXSCacheMotionCuesShouldShowBannerDidChangeNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSMotionCuesShouldShowBanner()
{
  if (_AXSMotionCuesShouldShowBanner_onceToken != -1) {
    dispatch_once(&_AXSMotionCuesShouldShowBanner_onceToken, &__block_literal_global_2427);
  }
  return _kAXSCacheMotionCuesShouldShowBanner;
}

void _AXSSetMotionCuesEnabled(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v2 = AXLogMotionCues();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_190274000, v2, OS_LOG_TYPE_DEFAULT, "Set enabled=%{BOOL}d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheMotionCuesEnabled = a1 != 0;
  _setPreferenceAppWithNotification((const __CFString *)kAXSMotionCuesEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)_kAXSCacheMotionCuesDidChangeNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSMotionCuesEnabled()
{
  if (_AXSMotionCuesEnabled_onceToken != -1) {
    dispatch_once(&_AXSMotionCuesEnabled_onceToken, &__block_literal_global_2429);
  }
  return _kAXSCacheMotionCuesEnabled;
}

void _AXSSetMotionCuesMode(unsigned int a1)
{
}

void _AXSSetMotionCuesModeAndShowBanner(unsigned int a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = a1;
  if (_AXSMotionCuesMode_onceToken != -1) {
    dispatch_once(&_AXSMotionCuesMode_onceToken, &__block_literal_global_2431);
  }
  if (a2 && _kAXSCacheMotionCuesMode != a1) {
    _AXSSetMotionCuesShouldShowBanner(1);
  }
  uint64_t v4 = AXLogMotionCues();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v8 = a1;
    _os_log_impl(&dword_190274000, v4, OS_LOG_TYPE_DEFAULT, "Set mode=%d", buf, 8u);
  }

  if (a1 > 1)
  {
    if (a1 == 2)
    {
      if (_AXSMotionCuesEnabled_onceToken != -1) {
        dispatch_once(&_AXSMotionCuesEnabled_onceToken, &__block_literal_global_2429);
      }
      if (_kAXSCacheMotionCuesEnabled)
      {
        uint64_t v5 = 0;
        goto LABEL_18;
      }
    }
  }
  else
  {
    if (_AXSMotionCuesEnabled_onceToken != -1) {
      dispatch_once(&_AXSMotionCuesEnabled_onceToken, &__block_literal_global_2429);
    }
    if (!_kAXSCacheMotionCuesEnabled)
    {
      uint64_t v5 = 1;
LABEL_18:
      _AXSSetMotionCuesEnabled(v5);
    }
  }
  _kAXSCacheMotionCuesMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSMotionCuesModePreference, kCFNumberIntType, &v6, (__CFString *)_kAXSCacheMotionCuesModeDidChangeNotification, 0);
}

uint64_t _AXSMotionCuesMode()
{
  if (_AXSMotionCuesMode_onceToken != -1) {
    dispatch_once(&_AXSMotionCuesMode_onceToken, &__block_literal_global_2431);
  }
  return _kAXSCacheMotionCuesMode;
}

void _AXSSetIsolatedTreeMode(int a1)
{
  int v1 = a1;
  _kAXSCacheIsolatedTreeMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSIsolatedTreeModeEnabledPreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.isolated.tree.mode", 0);
}

uint64_t _AXSIsolatedTreeMode()
{
  if (_AXSIsolatedTreeMode_onceToken != -1) {
    dispatch_once(&_AXSIsolatedTreeMode_onceToken, &__block_literal_global_2433);
  }
  return _kAXSCacheIsolatedTreeMode;
}

void _AXSSetShowAudioTranscriptions(uint64_t a1)
{
  _kAXSCacheShowAudioTranscriptionsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSShowAudioTranscriptionsEnabled, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.show.audio.transcriptions");

  _updateAccessibilitySettings();
}

uint64_t _AXSShowAudioTranscriptions()
{
  if (_AXSShowAudioTranscriptions_onceToken != -1) {
    dispatch_once(&_AXSShowAudioTranscriptions_onceToken, &__block_literal_global_2435);
  }
  return _kAXSCacheShowAudioTranscriptionsEnabled;
}

uint64_t _AXSBackTapEnabled()
{
  if (_AXSBackTapEnabled_onceToken != -1) {
    dispatch_once(&_AXSBackTapEnabled_onceToken, &__block_literal_global_2437);
  }
  return _kAXSCacheBackTapEnabled;
}

void _AXSBackTapSetEnabled(uint64_t a1)
{
  _kAXSCacheBackTapEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSBackTapEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.back.tap.enabled");

  _updateAccessibilitySettings();
}

void _AXSBrailleInputDeviceSetConnected(uint64_t a1)
{
  _kAXSCacheBrailleInputDeviceConnected = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSBrailleInputDeviceConnectedPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.braille.input.connection.changed");

  _updateAccessibilitySettings();
}

uint64_t _AXSBrailleInputDeviceConnected()
{
  uint64_t result = _AXSVoiceOverTouchEnabled();
  if (result)
  {
    if (_AXSBrailleInputDeviceConnected_onceToken != -1) {
      dispatch_once(&_AXSBrailleInputDeviceConnected_onceToken, &__block_literal_global_2439);
    }
    return _kAXSCacheBrailleInputDeviceConnected;
  }
  return result;
}

uint64_t _AXSLiveHeadphoneLevelEnabled()
{
  if (_AXSLiveHeadphoneLevelEnabled_onceToken != -1) {
    dispatch_once(&_AXSLiveHeadphoneLevelEnabled_onceToken, &__block_literal_global_2441);
  }
  return _kAXSCacheLiveHeadphoneLevelEnabled;
}

void _AXSLiveHeadphoneLevelSetEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveHeadphoneLevelEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], (const __CFString *)kAXSLiveHeadphoneLevelEnabledDidChangeNotification);

  _updateAccessibilitySettings();
}

CFTypeRef _AXSLiveHeadphoneLevelAutomationSampleData()
{
  int v0 = _copyValuePreferenceApp((const __CFString *)kAXSLiveHeadphoneLevelAutomationSampleDataPreference, 0, 0);

  return CFAutorelease(v0);
}

void _AXSLiveHeadphoneLevelSetAutomationSampleData(const void *a1)
{
}

uint64_t __AXSSoundDetectionState()
{
  if (__AXSSoundDetectionState_onceToken != -1) {
    dispatch_once(&__AXSSoundDetectionState_onceToken, &__block_literal_global_2443);
  }
  return _kAXSCacheSoundDetectionState;
}

uint64_t _AXSSoundDetectionRunning()
{
  if (__AXSSoundDetectionState_onceToken != -1) {
    dispatch_once(&__AXSSoundDetectionState_onceToken, &__block_literal_global_2443);
  }
  int v0 = _kAXSCacheSoundDetectionState;
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1) {
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1824);
  }
  unsigned int v1 = _kAXSCacheSwitchControlEnabled;
  if (_kAXSCacheSwitchControlEnabled) {
    unsigned int v1 = _AXSSoundActionEnabledForSwitchControl() != 0;
  }
  if (v0) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t _AXSWatchTypeToSiriEnabled()
{
  if (_AXSWatchTypeToSiriEnabled_onceToken != -1) {
    dispatch_once(&_AXSWatchTypeToSiriEnabled_onceToken, &__block_literal_global_2445);
  }
  return _kAXSCacheWatchTypeToSiriEnabled;
}

void _AXSWatchTypeToSiriSetEnabled(uint64_t a1)
{
  _kAXSCacheWatchTypeToSiriEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWatchTypeToSiriEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.watch.typetosiri.enabled");

  _updateAccessibilitySettings();
}

uint64_t _AXSWatchQuickActionsState()
{
  if (_AXSWatchQuickActionsState_onceToken != -1) {
    dispatch_once(&_AXSWatchQuickActionsState_onceToken, &__block_literal_global_2447);
  }
  return _kAXSCacheWatchQuickActionsState;
}

void _AXSWatchQuickActionsSetState(int a1)
{
  int v1 = a1;
  _kAXSCacheWatchQuickActionsState = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSWatchQuickActionsStatePreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.watch.quickactions.state", 0);
}

uint64_t _AXSWatchQuickActionsEnabled()
{
  if (_AXSWatchQuickActionsState_onceToken != -1) {
    dispatch_once(&_AXSWatchQuickActionsState_onceToken, &__block_literal_global_2447);
  }
  int v0 = _kAXSCacheWatchQuickActionsState;

  return _AXSWatchQuickActionsResolvedEnabledStateForState(v0);
}

uint64_t _AXSWatchQuickActionsResolvedEnabledStateForState(int a1)
{
  if (a1 == 2) {
    return 0;
  }
  if (a1) {
    return 1;
  }
  if (_AXSWatchControlEnabled_onceToken != -1) {
    dispatch_once(&_AXSWatchControlEnabled_onceToken, &__block_literal_global_2451);
  }
  return _kAXSCacheWatchControlEnabled;
}

uint64_t _AXSWatchQuickActionBannerAppearance()
{
  if (_AXSWatchQuickActionBannerAppearance_onceToken != -1) {
    dispatch_once(&_AXSWatchQuickActionBannerAppearance_onceToken, &__block_literal_global_2449);
  }
  return _kAXSCacheWatchQuickActionBannerAppearance;
}

void _AXSWatchQuickActionSetBannerAppearance(int a1)
{
  int v1 = a1;
  _kAXSCacheWatchQuickActionBannerAppearance = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSWatchQuickActionBannerAppearancePreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.watch.quickactions.banner.appearance", 0);
}

void _AXSWatchControlSetEnabled(uint64_t a1)
{
  int v1 = a1;
  _kAXSCacheWatchControlEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWatchControlEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.watch.control.enabled");
  _updateAccessibilitySettings();
  if (v1)
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility()) {
      return;
    }
    uint64_t v2 = 0;
  }

  _AXSApplicationAccessibilitySetEnabled(v2);
}

void _AXSPhotosensitiveMitigationSetEnabled(uint64_t a1)
{
  _kAXSCachePhotosensitiveMitigationEnabled = a1;
  _setPreferenceAppWithNotification(@"PhotosensitiveMitigation", 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pse.mitigation");

  _updateAccessibilitySettings();
}

uint64_t _AXSPhotosensitiveSourceCopyDebuggingEnabled()
{
  if (_AXSPhotosensitiveSourceCopyDebuggingEnabled_onceToken != -1) {
    dispatch_once(&_AXSPhotosensitiveSourceCopyDebuggingEnabled_onceToken, &__block_literal_global_2455);
  }
  return _kAXSCachePhotosensitiveSourceCopyDebuggingEnabled;
}

void _AXSPhotosensitiveSourceCopyDebuggingSetEnabled(uint64_t a1)
{
  _kAXSCachePhotosensitiveSourceCopyDebuggingEnabled = a1;
  _setPreferenceAppWithNotification(@"PhotosensitiveSourceCopyDebugging", 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pse.source.copy.debugging");

  _updateAccessibilitySettings();
}

uint64_t _AXSPhotosensitiveVisualDebuggingEnabled()
{
  if (_AXSPhotosensitiveVisualDebuggingEnabled_onceToken != -1) {
    dispatch_once(&_AXSPhotosensitiveVisualDebuggingEnabled_onceToken, &__block_literal_global_2457);
  }
  return _kAXSCachePhotosensitiveVisualDebuggingEnabled;
}

void _AXSPhotosensitiveVisualDebuggingSetEnabled(uint64_t a1)
{
  _kAXSCachePhotosensitiveVisualDebuggingEnabled = a1;
  _setPreferenceAppWithNotification(@"PhotosensitiveVisualDebugging", 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.pse.visual.debugging");

  _updateAccessibilitySettings();
}

uint64_t _AXSTwiceRemoteScreenEnabled()
{
  if (_AXSTwiceRemoteScreenEnabled_onceToken != -1) {
    dispatch_once(&_AXSTwiceRemoteScreenEnabled_onceToken, &__block_literal_global_2459);
  }
  return _kAXSCacheTwiceRemoteScreenEnabled;
}

void _AXSTwiceRemoteScreenSetEnabled(uint64_t a1)
{
  _kAXSCacheTwiceRemoteScreenEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSTwiceRemoteScreenEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.twice.remote.screen.enabled");

  _updateAccessibilitySettings();
}

uint64_t _AXSTwiceRemoteScreenPlatform()
{
  if (_AXSTwiceRemoteScreenPlatform_onceToken != -1) {
    dispatch_once(&_AXSTwiceRemoteScreenPlatform_onceToken, &__block_literal_global_2461);
  }
  return _kAXSCacheTwiceRemoteScreenPlatform;
}

void _AXSTwiceRemoteScreenSetPlatform(uint64_t a1)
{
  uint64_t v1 = a1;
  _kAXSCacheTwiceRemoteScreenPlatform = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSTwiceRemoteScreenPlatformPreference, kCFNumberCFIndexType, &v1, @"com.apple.accessibility.cache.twice.remote.screen.platform", 0);
}

uint64_t _AXSIncreaseBrightnessFloorEnabled()
{
  if (_AXSIncreaseBrightnessFloorEnabled_onceToken != -1) {
    dispatch_once(&_AXSIncreaseBrightnessFloorEnabled_onceToken, &__block_literal_global_2463);
  }
  return _kAXSCacheIncreaseBrightnessFloorEnabled;
}

void _AXSIncreaseBrightnessFloorSetEnabled(uint64_t a1)
{
  _kAXSCacheIncreaseBrightnessFloorEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSIncreaseBrightnessFloorEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.increase.brightness.floor.enabled");

  _updateAccessibilitySettings();
}

void _AXSSetAppleTVRemoteUsesSimpleGestures(uint64_t a1)
{
  _kAXSCacheAppleTVSimpleGesturesEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppleTVSimpleGesturesEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.apple.tv.simple.gestures");

  _updateAccessibilitySettings();
}

uint64_t _AXSAppleTVRemoteUsesSimpleGestures()
{
  if (_AXSAppleTVRemoteUsesSimpleGestures_onceToken != -1) {
    dispatch_once(&_AXSAppleTVRemoteUsesSimpleGestures_onceToken, &__block_literal_global_2465);
  }
  return _kAXSCacheAppleTVSimpleGesturesEnabled;
}

void _AXSSetAppleTVRemoteForceLiveTVButtons(uint64_t a1)
{
  _kAXSCacheAppleTVForceLiveTVButtonsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppleTVForceLiveTVButtonsEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.apple.tv.live.tv.buttons");

  _updateAccessibilitySettings();
}

uint64_t _AXSAppleTVRemoteForceLiveTVButtons()
{
  if (_AXSAppleTVRemoteForceLiveTVButtons_onceToken != -1) {
    dispatch_once(&_AXSAppleTVRemoteForceLiveTVButtons_onceToken, &__block_literal_global_2467);
  }
  return _kAXSCacheAppleTVForceLiveTVButtonsEnabled;
}

void _AXSSetAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled(uint64_t a1)
{
  _kAXSCacheAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.AppleTVRemoteClickpadTapsForDirectionalNavigationEnabled");

  _updateAccessibilitySettings();
}

uint64_t _AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled()
{
  if (_AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled_onceToken != -1) {
    dispatch_once(&_AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled_onceToken, &__block_literal_global_2469);
  }
  return _kAXSCacheAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled;
}

void _AXSSetAppleTVScaledUIEnabled(uint64_t a1)
{
  _kAXSCacheAppleTVScaledUIEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppleTVScaledUIEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.AppleTVScaledUIEnabled");

  _updateAccessibilitySettings();
}

uint64_t _AXSAppleTVScaledUIEnabled()
{
  if (_AXSAppleTVScaledUIEnabled_onceToken != -1) {
    dispatch_once(&_AXSAppleTVScaledUIEnabled_onceToken, &__block_literal_global_2471);
  }
  return _kAXSCacheAppleTVScaledUIEnabled;
}

uint64_t _AXSGetUSBRMDisablers()
{
  if (_AXSGetUSBRMDisablers_onceToken != -1) {
    dispatch_once(&_AXSGetUSBRMDisablers_onceToken, &__block_literal_global_2473);
  }
  return _kAXSCacheUSBRMDisablers;
}

void _AXSSetUSBRMDisablers(int a1)
{
  int v1 = a1;
  _kAXSCacheUSBRMDisablers = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSUSBRMDisablersPreference, kCFNumberIntType, &v1, @"com.apple.accessibility.cache.AXSUSBRMDisablersNotification", 0);
}

const void *_AXSCopySettingsDataBlobForBuddy()
{
  int v0 = (const void *)[getAXBuddyDataPackageClass() dataBlobForBuddy];
  int v1 = v0;
  if (v0) {
    CFRetain(v0);
  }
  return v1;
}

id getAXBuddyDataPackageClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  int v0 = (void *)getAXBuddyDataPackageClass_softClass;
  uint64_t v7 = getAXBuddyDataPackageClass_softClass;
  if (!getAXBuddyDataPackageClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    _DWORD v3[2] = __getAXBuddyDataPackageClass_block_invoke;
    v3[3] = &unk_1E568C0A0;
    v3[4] = &v4;
    __getAXBuddyDataPackageClass_block_invoke((uint64_t)v3);
    int v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19029CB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXSRestoreSettingsFromDataBlobForBuddy(uint64_t a1)
{
  id AXBuddyDataPackageClass = getAXBuddyDataPackageClass();

  return [AXBuddyDataPackageClass restoreDataBlobForBuddy:a1];
}

uint64_t _AXSResetAccessibilityFeatures()
{
  uint64_t v0 = AXUtilsBackBoardServer();
  if (v0)
  {
    uint64_t v2 = (void *)v0;
    if (objc_opt_respondsToSelector()) {
      [v2 resetAccessibilityFeatures];
    }
  }

  return MEMORY[0x1F4181820]();
}

id AXNSLocalizedStringForLocale(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  if (a4)
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    id v10 = a5;
    id v11 = a3;
    id v12 = a2;
    id v13 = a1;
    CFURLRef v14 = [a4 bundleURL];
    BOOL v15 = CFBundleCreate(v9, v14);

    uint64_t v16 = AXLocalizedStringForLocale((uint64_t)v13, (uint64_t)v12, (int)v11, v15, v10);

    if (v15) {
      CFRelease(v15);
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

CFTypeRef AXLocalizedStringForLocale(uint64_t a1, uint64_t a2, int a3, CFBundleRef bundle, void *a5)
{
  if (!bundle) {
    return 0;
  }
  unsigned int v8 = (void *)MEMORY[0x1E4F28B50];
  CFURLRef v9 = CFBundleCopyBundleURL(bundle);
  id v10 = [v8 bundleWithURL:v9];

  id v11 = AXLocalizationForLocale(a5, v10);
  id v12 = (void *)CFBundleCopyLocalizedStringForLocalization();
  id v13 = v12;
  if (v11)
  {
    if (v12)
    {
      if (([v12 isEqualToString:a2] & 1) == 0
        && (a2 || ![v13 isEqualToString:a1]))
      {
        goto LABEL_10;
      }
      CFRelease(v13);
    }
    id v13 = (void *)CFBundleCopyLocalizedStringForLocalization();
  }
LABEL_10:
  CFTypeRef v15 = CFAutorelease(v13);

  return v15;
}

id AXLocalizationForLocale(void *a1, void *a2)
{
  uint64_t v2 = 0;
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28B50];
    id v5 = a1;
    uint64_t v6 = [a2 localizations];
    v10[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    unsigned int v8 = [v4 preferredLocalizationsFromArray:v6 forPreferences:v7];

    uint64_t v2 = [v8 firstObject];
  }

  return v2;
}

uint64_t _AXSVoltaDataCollectionEnabled()
{
  return 0;
}

uint64_t AXSVoltaDataDirectory()
{
  return 0;
}

uint64_t _AXSAutomaticSubtitlesShowWhenLanguageMismatch()
{
  if (_AXSAutomaticSubtitlesShowWhenLanguageMismatch_onceToken != -1) {
    dispatch_once(&_AXSAutomaticSubtitlesShowWhenLanguageMismatch_onceToken, &__block_literal_global_2492);
  }
  return _kAXSCacheAutomaticSubtitlesShowWhenLanguageMismatch;
}

void _AXSSetAutomaticSubtitlesShowWhenLanguageMismatch(uint64_t a1)
{
  _kAXSCacheAutomaticSubtitlesShowWhenLanguageMismatch = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomaticSubtitlesShowWhenLanguageMismatchPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.AutomaticSubtitlesShowWhenLanguageMismatch");

  _updateAccessibilitySettings();
}

uint64_t _AXSAutomaticSubtitlesShowWhenMuted()
{
  if (_AXSAutomaticSubtitlesShowWhenMuted_onceToken != -1) {
    dispatch_once(&_AXSAutomaticSubtitlesShowWhenMuted_onceToken, &__block_literal_global_2494);
  }
  return _kAXSCacheAutomaticSubtitlesShowWhenMuted;
}

void _AXSSetAutomaticSubtitlesShowWhenMuted(uint64_t a1)
{
  _kAXSCacheAutomaticSubtitlesShowWhenMuted = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomaticSubtitlesShowWhenMutedPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.AutomationSubtitlesShowWhenMuted");

  _updateAccessibilitySettings();
}

uint64_t _AXSAutomaticSubtitlesShowOnSkipBack()
{
  if (_AXSAutomaticSubtitlesShowOnSkipBack_onceToken != -1) {
    dispatch_once(&_AXSAutomaticSubtitlesShowOnSkipBack_onceToken, &__block_literal_global_2496);
  }
  return _kAXSCacheAutomaticSubtitlesShowOnSkipBack;
}

void _AXSSetAutomaticSubtitlesShowOnSkipBack(uint64_t a1)
{
  _kAXSCacheAutomaticSubtitlesShowOnSkipBack = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomaticSubtitlesShowOnSkipBackPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.AutomationSubtitlesShowOnSkipBack");

  _updateAccessibilitySettings();
}

uint64_t _AXSRosebudLoggingEnabled()
{
  if (_AXSRosebudLoggingEnabled_onceToken != -1) {
    dispatch_once(&_AXSRosebudLoggingEnabled_onceToken, &__block_literal_global_2498);
  }
  return _kAXSCacheRosebudLoggingEnabled;
}

void _AXSRosebudLoggingSetEnabled(uint64_t a1)
{
  _kAXSCacheRosebudLoggingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSRosebudLoggingEnabledPreference, 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.rosebud.logging.enabled");

  _updateAccessibilitySettings();
}

uint64_t _AXSSpeechSynthesisOptions()
{
  if (!os_variant_has_internal_ui()) {
    return 0;
  }
  if (_AXSSpeechSynthesisOptions_onceToken != -1) {
    dispatch_once(&_AXSSpeechSynthesisOptions_onceToken, &__block_literal_global_2500);
  }
  return _kAXSCacheSpeechSynthesisOptions;
}

void _AXSSpeechSynthesisSetOptions(uint64_t a1)
{
  uint64_t v2 = a1;
  if (os_variant_has_internal_ui())
  {
    _kAXSCacheSpeechSynthesisOptions = a1;
    _setNumberPreferenceApp((const __CFString *)kAXSSpeechSynthesisOptionsPreference, kCFNumberCFIndexType, &v2, @"com.apple.accessibility.cache.speech.synth.options", 0);
  }
}

uint64_t _AXSAllowsMixToUplink()
{
  if (_AXSAllowsMixToUplink_onceToken != -1) {
    dispatch_once(&_AXSAllowsMixToUplink_onceToken, &__block_literal_global_2505);
  }
  return _kAXSCacheAllowsMixToUplink;
}

void _AXSSetAllowsMixToUplink(uint64_t a1)
{
  _kAXSCacheAllowsMixToUplink = a1;
  _setPreferenceAppWithNotification(@"AXSAllowsMixToUplinkPreference", 0, (const void *)[NSNumber numberWithUnsignedChar:a1], @"com.apple.accessibility.cache.mix.to.uplink.notification");

  _updateAccessibilitySettings();
}

CFBooleanRef _AXSOnDeviceEyeTrackingEnabled()
{
  CFBooleanRef result = (const __CFBoolean *)_copyValuePreferenceApp(@"AssistiveTouchMouseOnDeviceEyeTrackingEnabledPreference", @"com.apple.AssistiveTouch", 0);
  if (result)
  {
    CFBooleanRef v1 = result;
    uint64_t Value = CFBooleanGetValue(result);
    CFRelease(v1);
    return (const __CFBoolean *)Value;
  }
  return result;
}

void *__getAXProcessIsBackboardSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AccessibilityUtilitiesLibrary();
  CFBooleanRef result = dlsym(v2, "AXProcessIsBackboard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsBackboardSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AccessibilityUtilitiesLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    _DWORD v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    void v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E568C0C0;
    uint64_t v4 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary) {
    AccessibilityUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void ___axsHandlePrefChangedApp_block_invoke(uint64_t a1)
{
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  CFStringRef v2 = (const __CFString *)cachedAppID_CachedAppID;
  long long v3 = *(const void **)(a1 + 32);
  if (cachedAppID_CachedAppID)
  {
    if (!CFEqual(v3, (CFTypeRef)[@"com.apple.accessibility.cache.enhance.text.legibility" stringByAppendingString:cachedAppID_CachedAppID]))
    {
      if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)[@"com.apple.accessibility.cache.button.shapes.enabled" stringByAppendingString:v2]))
      {
        if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)[@"com.apple.accessibility.cache.darken.system.colors.enabled" stringByAppendingString:v2]))
        {
          if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)[@"com.apple.accessibility.cache.increase.button.legibility" stringByAppendingString:v2]))
          {
            if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)[@"com.apple.accessibility.cache.differentiate.without.color" stringByAppendingString:v2]))
            {
              if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)[@"com.apple.accessibility.cache.enhance.background.contrast" stringByAppendingString:v2]))
              {
                if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)[@"com.apple.accessibility.cache.prefers.horizontal.text" stringByAppendingString:v2]))
                {
                  if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)[@"com.apple.accessibility.cache.reduce.motion" stringByAppendingString:v2]))
                  {
                    if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)[@"com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions" stringByAppendingString:v2]))
                    {
                      if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)[@"com.apple.accessibility.cache.reduce.motion.autoplay.video.previews" stringByAppendingString:v2]))
                      {
                        uint64_t v4 = *(const void **)(a1 + 32);
                        uint64_t v5 = (__CFString *)[@"com.apple.accessibility.cache.invert.colors" stringByAppendingString:v2];
                        goto LABEL_39;
                      }
LABEL_34:
                      CFStringRef v6 = (const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference;
                      CFStringRef v7 = (const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsChangedNotification;
                      unsigned int v8 = (int *)&_kAXSCacheReduceMotionAutoplayVideoPreviews;
                      goto LABEL_35;
                    }
LABEL_32:
                    CFStringRef v6 = (const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference;
                    CFStringRef v7 = (const __CFString *)kAXSReduceMotionReduceSlideTransitionsChangedNotification;
                    unsigned int v8 = (int *)&_kAXSCacheReduceMotionReduceSlideTransitions;
                    goto LABEL_35;
                  }
LABEL_30:
                  CFStringRef v6 = (const __CFString *)kAXSReduceMotionPreference;
                  CFStringRef v7 = kAXSReduceMotionChangedNotification;
                  unsigned int v8 = (int *)&_kAXSCacheReduceMotion;
                  goto LABEL_35;
                }
LABEL_28:
                CFStringRef v6 = (const __CFString *)kAXSPrefersHorizontalTextPreference;
                CFStringRef v7 = (const __CFString *)kAXSPrefersHorizontalTextNotification;
                unsigned int v8 = (int *)&_kAXSCachePrefersHorizontalText;
                goto LABEL_35;
              }
LABEL_26:
              CFStringRef v6 = (const __CFString *)kAXSEnhanceBackgroundContrastPreference;
              CFStringRef v7 = kAXSEnhanceBackgroundContrastChangedNotification;
              unsigned int v8 = (int *)&_kAXSCacheEnhanceBackgroundContrast;
              goto LABEL_35;
            }
LABEL_24:
            CFStringRef v6 = (const __CFString *)kAXSDifferentiateWithoutColorPreference;
            CFStringRef v7 = kAXSDifferentiateWithoutColorChangedNotification;
            unsigned int v8 = (int *)&_kAXSCacheDifferentiateWithoutColor;
            goto LABEL_35;
          }
LABEL_22:
          CFStringRef v6 = (const __CFString *)kAXSIncreaseButtonLegibilityPreference;
          CFStringRef v7 = kAXSIncreaseButtonLegibilityNotification;
          unsigned int v8 = (int *)&_kAXSCacheIncreaseButtonLegibility;
          goto LABEL_35;
        }
LABEL_20:
        CFStringRef v6 = (const __CFString *)kAXSDarkenSystemColorsEnabledPreference;
        CFStringRef v7 = kAXSDarkenSystemColorsEnabledNotification;
        unsigned int v8 = (int *)&_kAXSCacheDarkenSystemColors;
        goto LABEL_35;
      }
LABEL_18:
      CFStringRef v6 = (const __CFString *)kAXSButtonShapesEnabledPreference;
      CFStringRef v7 = kAXSButtonShapesEnabledNotification;
      unsigned int v8 = (int *)&_kAXSCacheButtonShapes;
      goto LABEL_35;
    }
  }
  else if (!CFEqual(v3, @"com.apple.accessibility.cache.enhance.text.legibility"))
  {
    if (!CFEqual(*(CFTypeRef *)(a1 + 32), @"com.apple.accessibility.cache.button.shapes.enabled"))
    {
      if (!CFEqual(*(CFTypeRef *)(a1 + 32), @"com.apple.accessibility.cache.darken.system.colors.enabled"))
      {
        if (!CFEqual(*(CFTypeRef *)(a1 + 32), @"com.apple.accessibility.cache.increase.button.legibility"))
        {
          if (!CFEqual(*(CFTypeRef *)(a1 + 32), @"com.apple.accessibility.cache.differentiate.without.color"))
          {
            if (!CFEqual(*(CFTypeRef *)(a1 + 32), @"com.apple.accessibility.cache.enhance.background.contrast"))
            {
              if (!CFEqual(*(CFTypeRef *)(a1 + 32), @"com.apple.accessibility.cache.prefers.horizontal.text"))
              {
                if (!CFEqual(*(CFTypeRef *)(a1 + 32), @"com.apple.accessibility.cache.reduce.motion"))
                {
                  if (!CFEqual(*(CFTypeRef *)(a1 + 32), @"com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions"))
                  {
                    if (!CFEqual(*(CFTypeRef *)(a1 + 32), @"com.apple.accessibility.cache.reduce.motion.autoplay.video.previews"))
                    {
                      uint64_t v4 = *(const void **)(a1 + 32);
                      uint64_t v5 = @"com.apple.accessibility.cache.invert.colors";
LABEL_39:
                      if (CFEqual(v4, v5))
                      {
                        _updateCacheSmartInvertAndRepostNotification(v2);
                      }
                      return;
                    }
                    goto LABEL_34;
                  }
                  goto LABEL_32;
                }
                goto LABEL_30;
              }
              goto LABEL_28;
            }
            goto LABEL_26;
          }
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  CFStringRef v6 = (const __CFString *)kAXSEnhanceTextLegibilityPreference;
  CFStringRef v7 = kAXSEnhanceTextLegibilityChangedNotification;
  unsigned int v8 = (int *)&_kAXSCacheEnhanceTextLegibility;
LABEL_35:

  _updateCachePreferenceAndRepostNotification(v6, v7, v2, v8);
}

void _invalidateAllCacheSmartInvertPreferences()
{
  cachedSmartInvertPreferences();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_2566];
}

void ___invalidateAllCacheSmartInvertPreferences_block_invoke(uint64_t a1, uint64_t a2)
{
}

void _invalidateCacheSmartInvertPreference(uint64_t a1)
{
  CFStringRef v2 = cachedSmartInvertPreferences();
  [v2 setValue:&unk_1EDFC0470 forKey:a1];

  long long v3 = AXSupportLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    _invalidateCacheSmartInvertPreference_cold_1();
  }
}

uint64_t __ObservePreferenceLocal_block_invoke(uint64_t a1)
{
  if (_kAXSCacheFaceTimeCaptionsNotification_block_invoke_onceToken != -1) {
    dispatch_once(&_kAXSCacheFaceTimeCaptionsNotification_block_invoke_onceToken, &__block_literal_global_2588);
  }
  CFStringRef v2 = (void *)DefaultsObserver;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 startObservingPreference:v3 andBroadcastDarwinNotification:v4 postGlobally:0];
}

void __ObservePreferenceLocal_block_invoke_2()
{
  if (!DefaultsObserver)
  {
    DefaultsObserver = objc_alloc_init(AXSupportDefaultsObserver);
    MEMORY[0x1F41817F8]();
  }
}

uint64_t __ObservePreferenceDistributed_block_invoke(uint64_t a1)
{
  if (_kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled_block_invoke_2_onceToken != -1) {
    dispatch_once(&_kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled_block_invoke_2_onceToken, &__block_literal_global_2609);
  }
  CFStringRef v2 = (void *)DefaultsObserver;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 startObservingPreference:v3 andBroadcastDarwinNotification:v4 postGlobally:1];
}

void __ObservePreferenceDistributed_block_invoke_2()
{
  if (!DefaultsObserver)
  {
    DefaultsObserver = objc_alloc_init(AXSupportDefaultsObserver);
    MEMORY[0x1F41817F8]();
  }
}

uint64_t _handlePrefsChangedNotification()
{
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1731);
  }
  CFStringRef v0 = (const __CFString *)_AXSAccessibilityPreferenceDomain_Domain;

  return CFPreferencesAppSynchronize(v0);
}

void _handlePreferenceChangeWithLocalNotification(const __CFString *a1)
{
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1731);
  }
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  LocalCenter = CFNotificationCenterGetLocalCenter();

  CFNotificationCenterPostNotification(LocalCenter, a1, 0, 0, 1u);
}

void _axsHandleMusicHapticActiveStatusChanged()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4F31200] object:0];
}

void __AXUtilsBackBoardServer_block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] bundleWithPath:AXSAccessibilityUtilitiesPath()];
  [v0 load];
}

void ___computedTripleClickOptions_block_invoke()
{
  id v0 = (void *)_computedTripleClickOptions_ComputedOptions;
  _computedTripleClickOptions_ComputedOptions = (uint64_t)&unk_1EDFC0548;
}

uint64_t _fetchCachePreference(const __CFString *a1, const __CFString *a2, int *p_valuePtr, int *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int valuePtr = -1;
  if (a4)
  {
    int v7 = *a4;
    int valuePtr = *a4;
  }
  else
  {
    CFNumberRef NumberPreference = (const __CFNumber *)_getNumberPreference(a1, a2);
    if (!NumberPreference) {
      goto LABEL_9;
    }
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    CFURLRef v9 = AXSupportLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v15 = a2;
      __int16 v16 = 2112;
      CFStringRef v17 = a1;
      __int16 v18 = 1024;
      int v19 = valuePtr;
      _os_log_debug_impl(&dword_190274000, v9, OS_LOG_TYPE_DEBUG, "Read Local: appID = %@, preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)", buf, 0x1Cu);
    }

    int v7 = valuePtr;
  }
  if (v7 != -1)
  {
LABEL_8:
    p_int valuePtr = &valuePtr;
    goto LABEL_10;
  }
LABEL_9:
  if (!p_valuePtr)
  {
    CFNumberRef v11 = (const __CFNumber *)_getNumberPreference(a1, 0);
    if (v11)
    {
      CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
      id v12 = AXSupportLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v15 = a2;
        __int16 v16 = 2112;
        CFStringRef v17 = a1;
        __int16 v18 = 1024;
        int v19 = valuePtr;
        _os_log_debug_impl(&dword_190274000, v12, OS_LOG_TYPE_DEBUG, "Read Global: appID = %@, preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)", buf, 0x1Cu);
      }
    }
    goto LABEL_8;
  }
LABEL_10:
  if (*p_valuePtr == -1) {
    return 0;
  }
  else {
    return *p_valuePtr;
  }
}

void ___updateInvertColorsValueFromMediaAccessibility_block_invoke()
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSInvertColorsEnabledPreference, 0, (const void *)[NSNumber numberWithInt:_kAXSCacheInvertColors], 0);

  _updateAccessibilitySettings();
}

uint64_t __cachedSmartInvertPreferences_block_invoke()
{
  cachedSmartInvertPreferences_CachedSmartInvertPreferences = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

Class __getLSApplicationRecordClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    _DWORD v3[2] = (void *)3221225472;
    v3[3] = __CoreServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E568C140;
    uint64_t v5 = 0;
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreServicesLibraryCore_frameworkLibrary) {
    __getLSApplicationRecordClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("LSApplicationRecord");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLSApplicationRecordClass_block_invoke_cold_2();
  }
  getLSApplicationRecordClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void postNotification(const __CFString *a1)
{
  if (a1)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, a1, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1) {
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_2390);
    }
    if (!_AXSCurrentProcessIsWebContent_IsWebContent)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, a1, 0, 0, 1u);
    }
  }
}

Class __getAXBuddyDataPackageClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary();
  Class result = objc_getClass("AXBuddyDataPackage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXBuddyDataPackageClass_block_invoke_cold_1();
  }
  getAXBuddyDataPackageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t AXRuntimeCheck_HasANE()
{
  if (AXRuntimeCheck_HasANE_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_3);
  }
  return AXRuntimeCheck_HasANE__hasANE;
}

uint64_t AXRuntimeCheck_isANEDeviceH13plus()
{
  if (AXRuntimeCheck_isANEDeviceH13plus_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_isANEDeviceH13plus_onceToken, &__block_literal_global_2);
  }
  return AXRuntimeCheck_isANEDeviceH13plus_isANEH13plus;
}

uint64_t AXRuntimeCheck_SupportsMedina()
{
  if (AXRuntimeCheck_SupportsMedina_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_SupportsMedina_onceToken, &__block_literal_global_5);
  }
  return AXRuntimeCheck_SupportsMedina__supportsMedina;
}

void sub_19029E92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXRuntimeCheck_SupportsNearbyDeviceControl()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    if (AXDeviceIsPhone() || AXDeviceIsPod())
    {
      return 1;
    }
    else
    {
      return AXDeviceIsWatch();
    }
  }
  return result;
}

uint64_t AXRuntimeCheck_SupportsMacAXV2()
{
  if (AXRuntimeCheck_SupportsMacAXV2_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_SupportsMacAXV2_onceToken, &__block_literal_global_12);
  }
  return AXRuntimeCheck_SupportsMacAXV2__supportsMacAXV2;
}

uint64_t AXRuntimeCheck_VoiceOverSupportsNeuralVoices()
{
  if (AXRuntimeCheck_VoiceOverSupportsNeuralVoices_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_VoiceOverSupportsNeuralVoices_onceToken, &__block_literal_global_15);
  }
  return AXRuntimeCheck_VoiceOverSupportsNeuralVoices__supportsMacAXV2;
}

BOOL AXRuntimeCheck_MauiSSE()
{
  if (AXRuntimeCheck_MauiSSE_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_MauiSSE_onceToken, &__block_literal_global_18);
  }
  if (AXRuntimeCheck_MauiSSE__mauiSSE) {
    return 1;
  }
  if (AXRuntimeCheck_MauiSSEOnly_onceToken_MauiSSEOnly != -1) {
    dispatch_once(&AXRuntimeCheck_MauiSSEOnly_onceToken_MauiSSEOnly, &__block_literal_global_24);
  }
  return AXRuntimeCheck_MauiSSEOnly__ffEnabled_MauiSSEOnly != 0;
}

uint64_t AXRuntimeCheck_MauiSSEOnly()
{
  if (AXRuntimeCheck_MauiSSEOnly_onceToken_MauiSSEOnly != -1) {
    dispatch_once(&AXRuntimeCheck_MauiSSEOnly_onceToken_MauiSSEOnly, &__block_literal_global_24);
  }
  return AXRuntimeCheck_MauiSSEOnly__ffEnabled_MauiSSEOnly;
}

uint64_t AXRuntimeCheck_PerVoiceSettings()
{
  if (AXRuntimeCheck_PerVoiceSettings_onceToken_PerVoiceSettings != -1) {
    dispatch_once(&AXRuntimeCheck_PerVoiceSettings_onceToken_PerVoiceSettings, &__block_literal_global_21);
  }
  return AXRuntimeCheck_PerVoiceSettings__ffEnabled_PerVoiceSettings;
}

uint64_t AXRuntimeCheck_SiriSSEOnly()
{
  if (AXRuntimeCheck_SiriSSEOnly_onceToken_SiriSSEOnly != -1) {
    dispatch_once(&AXRuntimeCheck_SiriSSEOnly_onceToken_SiriSSEOnly, &__block_literal_global_27);
  }
  return AXRuntimeCheck_SiriSSEOnly__ffEnabled_SiriSSEOnly;
}

uint64_t AXRuntimeCheck_SpeakUp()
{
  if (AXRuntimeCheck_SpeakUp_onceToken_SpeakUp != -1) {
    dispatch_once(&AXRuntimeCheck_SpeakUp_onceToken_SpeakUp, &__block_literal_global_30);
  }
  return AXRuntimeCheck_SpeakUp__ffEnabled_SpeakUp;
}

uint64_t AXRuntimeCheck_MediaAnalysisSupport()
{
  if (AXRuntimeCheck_MediaAnalysisSupport_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_MediaAnalysisSupport_onceToken, &__block_literal_global_33);
  }
  return AXRuntimeCheck_MediaAnalysisSupport__supportsMediaAnalysisServices;
}

uint64_t AXRuntimeCheck_ScreenRecognitionSupport()
{
  if (AXRuntimeCheck_ScreenRecognitionSupport_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_ScreenRecognitionSupport_onceToken, &__block_literal_global_36);
  }
  return AXRuntimeCheck_ScreenRecognitionSupport__supportsScreenRecognition;
}

uint64_t AXRuntimeCheck_SupportsFocusEverywhere()
{
  return 0;
}

uint64_t AXRuntimeCheck_SoundRecognitionMedinaSupportEnabled()
{
  if (AXRuntimeCheck_SupportsMedina_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_SupportsMedina_onceToken, &__block_literal_global_5);
  }
  if (!AXRuntimeCheck_SupportsMedina__supportsMedina) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

uint64_t AXRuntimeCheck_SoundRecognitionMedinaKShotEnrollmentEnabled()
{
  if (AXRuntimeCheck_SupportsMedina_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_SupportsMedina_onceToken, &__block_literal_global_5);
  }
  return 0;
}

uint64_t AXRuntimeCheck_SupportsIncreaseBrightnessFloor()
{
  if (AXRuntimeCheck_SupportsIncreaseBrightnessFloor_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_SupportsIncreaseBrightnessFloor_onceToken, &__block_literal_global_46_0);
  }
  return AXRuntimeCheck_SupportsIncreaseBrightnessFloor__supportsIncreaseBrightnessFloor;
}

uint64_t AXRuntimeCheck_SupportsDoseAnalysis()
{
  if (AXRuntimeCheck_SupportsDoseAnalysis_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_SupportsDoseAnalysis_onceToken, &__block_literal_global_49_0);
  }
  return AXRuntimeCheck_SupportsDoseAnalysis__supportsDoseAnalysis;
}

uint64_t AXRuntimeCheck_SupportsVoiceoverIndepedentVolume()
{
  if (AXRuntimeCheck_SupportsVoiceoverIndepedentVolume_onceToken != -1) {
    dispatch_once(&AXRuntimeCheck_SupportsVoiceoverIndepedentVolume_onceToken, &__block_literal_global_52_0);
  }
  return AXRuntimeCheck_SupportsVoiceoverIndepedentVolume__supportsVoiceoverIndepedentVolume;
}

uint64_t __AppleNeuralEngineLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleNeuralEngineLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMGGetBoolAnswerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  CFStringRef v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  uint64_t v10 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    _DWORD v4[2] = (void *)3221225472;
    v4[3] = __libMobileGestaltLibraryCore_block_invoke;
    v4[4] = &unk_1E568C190;
    uint64_t v5 = &v7;
    uint64_t v6 = v4;
    long long v11 = xmmword_1E568C170;
    uint64_t v12 = 0;
    v8[3] = _sl_dlopen();
    libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(v5[1] + 24);
    CFStringRef v2 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2) {
    __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "MGGetBoolAnswer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMGGetBoolAnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19029F2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libMobileGestaltLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL AXDeviceIsPad()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  }
  return AXDeviceGetType__AXDeviceType == 3;
}

uint64_t AXDeviceGetType()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  }
  return AXDeviceGetType__AXDeviceType;
}

BOOL AXDeviceIsPhone()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  }
  return AXDeviceGetType__AXDeviceType == 1;
}

uint64_t __AXDeviceGetType_block_invoke()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  id v0 = (uint64_t (*)(__CFString *, uint64_t))getMGGetSInt32AnswerSymbolLoc_ptr;
  uint64_t v7 = getMGGetSInt32AnswerSymbolLoc_ptr;
  if (!getMGGetSInt32AnswerSymbolLoc_ptr)
  {
    CFBooleanRef v1 = (void *)libMobileGestaltLibrary();
    v5[3] = (uint64_t)dlsym(v1, "MGGetSInt32Answer");
    getMGGetSInt32AnswerSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    id v0 = (uint64_t (*)(__CFString *, uint64_t))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    __AXDeviceGetType_block_invoke_cold_1();
  }
  uint64_t result = v0(@"DeviceClassNumber", 0xFFFFFFFFLL);
  int v3 = result - 1;
  if (result - 1) <= 0xA && ((0x46Fu >> v3)) {
    AXDeviceGetType__AXDeviceType = qword_1902A1BC0[v3];
  }
  return result;
}

void sub_19029F558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AXDeviceIsPod()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  }
  return AXDeviceGetType__AXDeviceType == 2;
}

BOOL AXDeviceIsWatch()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  }
  return AXDeviceGetType__AXDeviceType == 5;
}

uint64_t AXDeviceSupportsHapticMusic()
{
  if (AXDeviceSupportsHapticMusic_onceToken != -1) {
    dispatch_once(&AXDeviceSupportsHapticMusic_onceToken, &__block_literal_global_3);
  }
  return AXDeviceSupportsHapticMusic_Supported;
}

uint64_t __AXDeviceSupportsHapticMusic_block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    int v18 = -1431778695;
    long long v17 = xmmword_1902A1B08;
    if (soft_MGIsDeviceOfType((uint64_t)&v17)) {
      goto LABEL_11;
    }
    int v16 = -121925081;
    long long v15 = xmmword_1902A1B1C;
    if (soft_MGIsDeviceOfType((uint64_t)&v15)) {
      goto LABEL_11;
    }
    int v14 = -820493242;
    long long v13 = xmmword_1902A1B30;
    if (soft_MGIsDeviceOfType((uint64_t)&v13)) {
      goto LABEL_11;
    }
    int v12 = -235416490;
    long long v11 = xmmword_1902A1B44;
    if (soft_MGIsDeviceOfType((uint64_t)&v11)) {
      goto LABEL_11;
    }
    int v10 = -61007701;
    long long v9 = xmmword_1902A1B58;
    if (soft_MGIsDeviceOfType((uint64_t)&v9)) {
      goto LABEL_11;
    }
    int v8 = -1843102369;
    long long v7 = xmmword_1902A1B6C;
    if ((soft_MGIsDeviceOfType((uint64_t)&v7) & 1) != 0
      || (int v6 = -427474227, v5 = xmmword_1902A1B80, (soft_MGIsDeviceOfType((uint64_t)&v5) & 1) != 0)
      || (int v4 = 1477534141, v3 = xmmword_1902A1B94, (soft_MGIsDeviceOfType((uint64_t)&v3) & 1) != 0)
      || (int v2 = -232427879, v1 = xmmword_1902A1BA8, (soft_MGIsDeviceOfType((uint64_t)&v1) & 1) != 0))
    {
LABEL_11:
      uint64_t result = 0;
    }
    else
    {
      uint64_t result = soft_MGGetBoolAnswer();
    }
    AXDeviceSupportsHapticMusic_Supported = result;
  }
  return result;
}

uint64_t soft_MGIsDeviceOfType(uint64_t a1)
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v2 = (uint64_t (*)(uint64_t))getMGIsDeviceOfTypeSymbolLoc_ptr;
  int v8 = getMGIsDeviceOfTypeSymbolLoc_ptr;
  if (!getMGIsDeviceOfTypeSymbolLoc_ptr)
  {
    long long v3 = (void *)libMobileGestaltLibrary();
    v6[3] = (uint64_t)dlsym(v3, "MGIsDeviceOfType");
    getMGIsDeviceOfTypeSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    int v2 = (uint64_t (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    soft_MGIsDeviceOfType_cold_1();
  }
  return v2(a1);
}

void sub_19029F920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MGGetBoolAnswer()
{
  uint64_t v3 = 0;
  int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  id v0 = (uint64_t (*)(__CFString *))getMGGetBoolAnswerSymbolLoc_ptr_0;
  int v6 = getMGGetBoolAnswerSymbolLoc_ptr_0;
  if (!getMGGetBoolAnswerSymbolLoc_ptr_0)
  {
    long long v1 = (void *)libMobileGestaltLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MGGetBoolAnswer");
    getMGGetBoolAnswerSymbolLoc_ptr_0 = (_UNKNOWN *)v4[3];
    id v0 = (uint64_t (*)(__CFString *))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_MGGetBoolAnswer_cold_1();
  }
  return v0(@"cBy4BcYs5YWtFHbBpt4C6A");
}

void sub_19029FA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMGGetSInt32AnswerSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)libMobileGestaltLibrary();
  uint64_t result = dlsym(v2, "MGGetSInt32Answer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMGGetSInt32AnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t libMobileGestaltLibrary()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = libMobileGestaltLibraryCore_frameworkLibrary_0;
  uint64_t v8 = libMobileGestaltLibraryCore_frameworkLibrary_0;
  if (!libMobileGestaltLibraryCore_frameworkLibrary_0)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    _DWORD v2[2] = (void *)3221225472;
    v2[3] = __libMobileGestaltLibraryCore_block_invoke_0;
    void v2[4] = &unk_1E568C190;
    uint64_t v3 = &v5;
    int v4 = v2;
    long long v9 = xmmword_1E568C1B0;
    uint64_t v10 = 0;
    v6[3] = _sl_dlopen();
    libMobileGestaltLibraryCore_frameworkLibrary_0 = *(void *)(v3[1] + 24);
    uint64_t v0 = v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0) {
    libMobileGestaltLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

void sub_19029FBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libMobileGestaltLibraryCore_block_invoke_0(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libMobileGestaltLibraryCore_frameworkLibrary_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMGIsDeviceOfTypeSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)libMobileGestaltLibrary();
  uint64_t result = dlsym(v2, "MGIsDeviceOfType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMGIsDeviceOfTypeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMGGetBoolAnswerSymbolLoc_block_invoke_0(uint64_t a1)
{
  int v2 = (void *)libMobileGestaltLibrary();
  uint64_t result = dlsym(v2, "MGGetBoolAnswer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMGGetBoolAnswerSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __AXSGetCachedPreference_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_190274000, v0, v1, "Sending Update UI notification: preference = %@, cache = %d (-1 - empty, 0 - false, 1 - true)");
}

void _axsHandleSystemUILoadInvertBundles_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_190274000, v0, v1, "Per-App SmartInvert is true for some launched app", v2, v3, v4, v5, v6);
}

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_190274000, v0, v1, "Init Per-App Smart Invert ON, AX Enabled: true", v2, v3, v4, v5, v6);
}

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_190274000, v0, v1, "Send Notification to SystemUI Processes", v2, v3, v4, v5, v6);
}

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_190274000, v0, v1, "Read Local: preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)", v2, v3, v4, v5, v6);
}

void _updateAccessibilitySettings_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_190274000, v0, v1, "Sending notification, kAXSAccessibilityEnabledPreference", v2, v3, v4, v5, v6);
}

void _copyValuePreferenceApp_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_190274000, v0, v1, "Request for application info error: %@", v2, v3, v4, v5, v6);
}

void _setPreferenceAppWithNotification_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v2 = 2112;
  uint64_t v3 = 0;
  _os_log_debug_impl(&dword_190274000, v0, OS_LOG_TYPE_DEBUG, "Save as Mobile preference: %@, appID = %@", v1, 0x16u);
}

void _setPreferenceAppWithNotification_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_190274000, v0, v1, "Error setting Per-App Setting pref: %@", v2, v3, v4, v5, v6);
}

void _setPreferenceAppWithNotification_cold_4()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL AXProcessIsBackboard_Soft(void)"];
  [v0 handleFailureInFunction:v1 file:@"AccessibilitySupport.m" lineNumber:54 description:@"%s", dlerror()];

  __break(1u);
}

void _AXSAirPodSettingForDevice_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_190274000, v0, v1, "Need to pass in the device address to %@", v2, v3, v4, v5, v6);
}

void _AXSAirPodSettingSetForDevice_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_190274000, v0, v1, "No device address for setting%@", v2, v3, v4, v5, v6);
}

void _AXSSetTripleClickOptions_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_190274000, v0, OS_LOG_TYPE_FAULT, "Invalid attempt to insert duplicates into the triple click menu: %@", v1, 0xCu);
}

void _AXSAttentionAwarenessFeaturesEnabled_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = _kAXSCacheAttentionAwarenessFeaturesEnabled;
  _os_log_debug_impl(&dword_190274000, log, OS_LOG_TYPE_DEBUG, "Retrieved attention aware: %d", (uint8_t *)v1, 8u);
}

void _AXSInvertColorsEnabledAppCached_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_190274000, v0, v1, "Fetched cachedSmartInvertPreferences to App: appID = %@, res = %d (-1 - empty, 0 - false, 1 - true)");
}

void _AXSInvertColorsEnabledAppCached_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_190274000, v0, OS_LOG_TYPE_DEBUG, "Registered for SmartInvert Notifications for App = %@", v1, 0xCu);
}

void _AXSCopyPreferredContentSizeCategoryNameApp_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_190274000, v0, v1, "PreferredContentSizeCategoryNameApp AX_UIKIT_PREF_PATH is NULL", v2, v3, v4, v5, v6);
}

void _AXSSpeakThisSetHighlightVisible_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_190274000, v0, v1, "Only backboardd is allowed to set the highlight's visibility.", v2, v3, v4, v5, v6);
}

void _updateBoolCachePreferenceAndRepostNotification_cold_1(uint64_t a1, unsigned __int8 *a2, NSObject *a3)
{
  LODWORD(v3) = 0;
  WORD2(v3) = 2112;
  *(void *)((char *)&v3 + 6) = a1;
  HIWORD(v3) = 1024;
  OUTLINED_FUNCTION_8(&dword_190274000, (uint64_t)a2, a3, "Update Cache Value On Notification: appID = %@, preference = %@, uint64_t result = %d", 138412802, v3, *a2);
}

void _updateCacheSmartInvertAndRepostNotification_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_190274000, v0, v1, "Update on Notification, Per-App Smart Invert is ON, AX Enabled: true", v2, v3, v4, v5, v6);
}

void _updateCacheSmartInvertAndRepostNotification_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_190274000, v0, OS_LOG_TYPE_DEBUG, "Updated Cache: appID = %@, preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)", v1, 0x1Cu);
}

void _updateCacheSmartInvertAndRepostNotification_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_190274000, v0, v1, "Read Global: appID = %@, preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)");
}

void _updateCacheSmartInvertAndRepostNotification_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_190274000, v0, v1, "Read Local: appID = %@, preference = %@, uint64_t result = %d (-1 - empty, 0 - false, 1 - true)");
}

void AccessibilityUtilitiesLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccessibilityUtilitiesLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"AccessibilitySupport.m" lineNumber:50 description:@"%s", *a1];

  __break(1u);
}

void _invalidateCacheSmartInvertPreference_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_190274000, v0, OS_LOG_TYPE_DEBUG, "Invalidate cachedSmartInvertPreferences to App: appID = %@", v1, 0xCu);
}

void __getLSApplicationRecordClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreServicesLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"AccessibilitySupport.m" lineNumber:64 description:@"%s", *a1];

  __break(1u);
}

void __getLSApplicationRecordClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getLSApplicationRecordClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"AccessibilitySupport.m" lineNumber:65 description:@"Unable to find class %s", "LSApplicationRecord"];

  __break(1u);
}

void __getAXBuddyDataPackageClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getAXBuddyDataPackageClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"AccessibilitySupport.m" lineNumber:51 description:@"Unable to find class %s", "AXBuddyDataPackage"];

  __break(1u);
}

void __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *libMobileGestaltLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"AXFeatureRuntimeSupport.m" lineNumber:36 description:@"%s" a1];

  __break(1u);
}

void __AXDeviceGetType_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"MGDeviceClass soft_MGGetSInt32Answer(CFStringRef, SInt32)"];
  [v0 handleFailureInFunction:v1 file:@"SoftGestalt.h" lineNumber:12 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MGIsDeviceOfType_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"_Bool soft_MGIsDeviceOfType(uint8_t *)"];
  [v0 handleFailureInFunction:v1 file:@"SoftGestalt.h" lineNumber:13 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MGGetBoolAnswer_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"_Bool soft_MGGetBoolAnswer(CFStringRef)"];
  [v0 handleFailureInFunction:v1 file:@"SoftGestalt.h" lineNumber:15 description:@"%s", dlerror()];

  __break(1u);
}

void libMobileGestaltLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *libMobileGestaltLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"SoftGestalt.h" lineNumber:11 description:@"%s", *a1];

  __break(1u);
  CFArrayAppendValue(v4, v5);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1F40D74B0]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C20](locale);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t MACaptionAppearancePrefCopyPreferAccessibleCaptions()
{
  return MEMORY[0x1F40ECFD0]();
}

uint64_t MACaptionAppearancePrefSetPreferAccessibleCaptions()
{
  return MEMORY[0x1F40ECFE0]();
}

void MACaptionAppearanceSetDisplayType(MACaptionAppearanceDomain domain, MACaptionAppearanceDisplayType displayType)
{
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return MEMORY[0x1F40ED008]();
}

uint64_t MADisplayFilterPrefGetType()
{
  return MEMORY[0x1F40ED020]();
}

uint64_t MADisplayFilterPrefSetBlueColorCorrectionIntensity()
{
  return MEMORY[0x1F40ED028]();
}

uint64_t MADisplayFilterPrefSetCategoryEnabled()
{
  return MEMORY[0x1F40ED030]();
}

uint64_t MADisplayFilterPrefSetGreenColorCorrectionIntensity()
{
  return MEMORY[0x1F40ED038]();
}

uint64_t MADisplayFilterPrefSetRedColorCorrectionIntensity()
{
  return MEMORY[0x1F40ED040]();
}

uint64_t MADisplayFilterPrefSetType()
{
  return MEMORY[0x1F40ED048]();
}

uint64_t MADisplayFilterPrefSuspendNotifications()
{
  return MEMORY[0x1F40ED050]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x1F40D8F40]();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1F40D8F58]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x1F40D8FB0]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1F40D8FD0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1F40CA568](*(void *)&r);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1F40CD640]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1F40CED30]();
}