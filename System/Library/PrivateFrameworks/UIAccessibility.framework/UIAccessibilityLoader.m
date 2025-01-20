@interface UIAccessibilityLoader
+ (BOOL)_accessibilityServerStarted;
+ (BOOL)_accessibilityStringLocalizationCategoriesLoaded;
+ (BOOL)_accessibilityUIKitBundleLoaded;
+ (id)_accessibilityBundlesForBundle:(id)a3;
+ (void)_accessibilityInitializeRuntimeOverrides;
+ (void)_accessibilityReenabled;
+ (void)_accessibilityStartMiniServer;
+ (void)_accessibilityStartServer;
+ (void)_accessibilityStopServer;
+ (void)_accessibilityUpdateSafeCategoryThread;
+ (void)_performInitialAccessibilityBundleLoad:(BOOL)a3 monitorForFutureLoadEvents:(BOOL)a4 trackingMode:(int64_t)a5;
+ (void)_stringLocalizationStarted:(id)a3;
+ (void)loadAccessibilityBundle:(id)a3 didLoadCallback:(id)a4 loadSubbundles:(BOOL)a5;
+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4;
+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4 force:(BOOL)a5 loadAllAccessibilityInfo:(BOOL)a6;
+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4 forceLoad:(BOOL)a5 loadSubbundles:(BOOL)a6 loadAllAccessibilityInfo:(BOOL)a7;
@end

@implementation UIAccessibilityLoader

+ (void)_performInitialAccessibilityBundleLoad:(BOOL)a3 monitorForFutureLoadEvents:(BOOL)a4 trackingMode:(int64_t)a5
{
  BOOL v6 = a4;
  if (a3 || a4)
  {
    v8 = [MEMORY[0x1E4F48310] defaultLoader];
    v9 = v8;
    if (!v6 || ([v8 shouldAutoloadAccessibilityCodeItems] & 1) == 0)
    {
      [v9 setLoadEventWillOccurBlock:&__block_literal_global];
      [v9 setShouldLoadAccessibilityCodeItemBlock:&__block_literal_global_269];
      [v9 setDidLoadAccessibilityCodeItemBlock:&__block_literal_global_272];
      [v9 setLoadEventDidOccurBlock:&__block_literal_global_277];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_286;
      v10[3] = &unk_1E59B88D8;
      id v11 = v9;
      BOOL v12 = v6;
      BOOL v13 = a3;
      [v11 beginTrackingLoadedCodeItemsWithMode:a5 completion:v10 targetQueue:0];
    }
  }
}

void __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    v4 = AXLogLoading();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F2DB000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXLaunchTime", (const char *)&unk_19F34FEBA, v5, 2u);
    }
  }
}

uint64_t __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_266()
{
  return 1;
}

void __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v6 = a3;
  id v7 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_3;
  v10[3] = &unk_1E59B8848;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) principalClass];
  if (AXShouldLogValidationErrors())
  {
    uint64_t v3 = AXLogLoading();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v4;
      __int16 v8 = 2114;
      id v9 = v2;
      _os_log_impl(&dword_19F2DB000, v3, OS_LOG_TYPE_DEBUG, "Will initialize AX on Bundle '%{public}@'. Principal class: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  [v2 accessibilityInitializeBundle];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_274(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v6 = a4;
  if (a2)
  {
    if (a3)
    {
      uint64_t v7 = +[UIAccessibilityInformationLoader sharedInstance];
      [v7 setNeedsLoadAccessibilityInformation];
    }
    v6[2](v6);
  }
  else
  {
    __int16 v8 = AXLogLoading();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v10 = [v9 processName];
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_19F2DB000, v8, OS_LOG_TYPE_INFO, "Initial load did occur %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_279;
    block[3] = &unk_1E59B88B0;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_279(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  AXPerformSafeBlock();
  uint64_t v2 = +[UIAccessibilityInformationLoader sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];

  uint64_t v3 = AXLogLoading();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  v5 = (id *)MEMORY[0x1E4F43630];
  if (v4)
  {
    int v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)*MEMORY[0x1E4F43630], "_accessibilityIsSystemAppServer"));
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19F2DB000, v3, OS_LOG_TYPE_INFO, "Load system app %@", (uint8_t *)&v10, 0xCu);
  }
  if ([*v5 _accessibilityIsSystemAppServer]) {
    +[UIAccessibilityLoader _didLoadSystemAppAccessibilityBundle];
  }
  if (AXProcessCanContactSystemWideServer())
  {
    uint64_t v7 = [*v5 _accessibilityBundleIdentifier];
    UIAccessibilityPostNotification(0xBD7u, v7);
  }
  _gUIAXIsApplicationAccessiblityReady = 1;
  __int16 v8 = AXLogLoading();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXLaunchTime", (const char *)&unk_19F34FEBA, (uint8_t *)&v10, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_2_280()
{
  [(id)*MEMORY[0x1E4F43630] _accessibilityInitialize];
  v0 = AXLogLoading();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19F2DB000, v0, OS_LOG_TYPE_INFO, "UIApp ax initialize", v1, 2u);
  }
}

uint64_t __104__UIAccessibilityLoader__performInitialAccessibilityBundleLoad_monitorForFutureLoadEvents_trackingMode___block_invoke_286(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setShouldAutoloadAccessibilityCodeItems:*(unsigned __int8 *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 41))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 setAccessibilityCodeItemsNeedLoaded];
  }
  return result;
}

+ (void)_accessibilityStartServer
{
  uint64_t v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F2DB000, v2, OS_LOG_TYPE_INFO, "AX Start server", buf, 2u);
  }

  uint64_t v3 = [MEMORY[0x1E4F48918] sharedManager];
  int v4 = [v3 started];

  if (v4)
  {
    v5 = AXLogLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int v6 = "Ignoring UIAccessibilityLoader _accessibilityStartServer for this process because the AXSimpleRuntimeManager was used!";
LABEL_9:
      _os_log_impl(&dword_19F2DB000, v5, OS_LOG_TYPE_INFO, v6, buf, 2u);
    }
  }
  else
  {
    if (!AXDisallowsUIBasedAccessibilityFeatures())
    {
      AXPerformBlockOnMainThread();
      return;
    }
    v5 = AXLogLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int v6 = "Not start application accessibility server - this client opts out of accessibility";
      goto LABEL_9;
    }
  }
}

uint64_t __50__UIAccessibilityLoader__accessibilityStartServer__block_invoke(uint64_t a1)
{
  _accessibilityServerStarted = 1;
  uint64_t v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F2DB000, v2, OS_LOG_TYPE_INFO, "AX Begin loading server", buf, 2u);
  }

  AXDevicePrimeDisplayManager();
  [*(id *)(a1 + 32) _accessibilityStartMiniServer];
  if (AX_USING_LEGACY_LOADER_onceToken != -1) {
    dispatch_once(&AX_USING_LEGACY_LOADER_onceToken, &__block_literal_global_429);
  }
  if (!AX_USING_LEGACY_LOADER__UsesLegacyLoader) {
    return [*(id *)(a1 + 32) _performInitialAccessibilityBundleLoad:1 monitorForFutureLoadEvents:1 trackingMode:2];
  }
  uint64_t v3 = AXLogLoading();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXLaunchTime", (const char *)&unk_19F34FEBA, v5, 2u);
  }

  return +[UIAccessibilityLegacyLoader loadExtendedAccessibilityBundles];
}

+ (void)_accessibilityUpdateSafeCategoryThread
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)*MEMORY[0x1E4F43630] applicationState];
  uint64_t v3 = [MEMORY[0x1E4F483A8] sharedInstance];
  [v3 setInstallSafeCategoriesOffMainThread:v2 != 0];

  int v4 = AXLogValidations();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = [NSNumber numberWithBool:v2 != 0];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_19F2DB000, v4, OS_LOG_TYPE_DEBUG, "Safe categories installing on background thread %@", (uint8_t *)&v6, 0xCu);
  }
}

+ (void)_accessibilityStartMiniServer
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((_accessibilityMiniServerStarted & 1) == 0)
  {
    uint64_t v2 = AXLogLoading();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F2DB000, v2, OS_LOG_TYPE_DEBUG, "Accessibility Started (Mini-Server)", buf, 2u);
    }

    _accessibilityMiniServerStarted = 1;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v3 = *MEMORY[0x1E4F43710];
    v22[0] = *MEMORY[0x1E4F43648];
    v22[1] = v3;
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
          int v10 = [MEMORY[0x1E4F28F08] mainQueue];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __54__UIAccessibilityLoader__accessibilityStartMiniServer__block_invoke;
          v16[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
          v16[4] = a1;
          id v11 = (id)[v9 addObserverForName:v8 object:0 queue:v10 usingBlock:v16];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v5);
    }

    uint64_t v12 = (void *)MEMORY[0x19F3CA890]();
    [a1 accessibilityShouldEnumerateContainerElementsArrayDirectly];
    id v13 = self;
    [a1 _accessibilityInitializeRuntimeOverrides];
    [a1 _accessibilityUpdateSafeCategoryThread];
    _UIAccessibilityStart();
    if (AXProcessIsSystemApplication())
    {
      if (AX_USING_LEGACY_LOADER_onceToken != -1) {
        dispatch_once(&AX_USING_LEGACY_LOADER_onceToken, &__block_literal_global_429);
      }
      if (AX_USING_LEGACY_LOADER__UsesLegacyLoader) {
        +[UIAccessibilityLegacyLoader loadExtendedAccessibilityBundles];
      }
      else {
        [a1 _performInitialAccessibilityBundleLoad:1 monitorForFutureLoadEvents:1 trackingMode:2];
      }
    }
    _AccessibilityUIKitBundledLoaded = 1;
  }
}

uint64_t __54__UIAccessibilityLoader__accessibilityStartMiniServer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityUpdateSafeCategoryThread];
}

+ (void)_accessibilityReenabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AXLogLoading();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
  uint64_t v4 = (id *)MEMORY[0x1E4F43630];
  if (v3)
  {
    int v5 = [(id)*MEMORY[0x1E4F43630] _accessibilityIsSystemAppServer];
    v8[0] = 67109376;
    v8[1] = v5;
    __int16 v9 = 1024;
    int v10 = _AXSApplicationAccessibilityEnabled();
    _os_log_impl(&dword_19F2DB000, v2, OS_LOG_TYPE_INFO, "Accessibility Reenabled [system server: %d] [app ax enabled: %d], ", (uint8_t *)v8, 0xEu);
  }

  if ([*v4 _accessibilityIsSystemAppServer]
    && _AXSApplicationAccessibilityEnabled())
  {
    _UIAXPostAccessibilityLoadedNotification();
  }
  if (_AXSApplicationAccessibilityEnabled())
  {
    uint64_t v6 = [*v4 _accessibilityBundleIdentifier];
    UIAccessibilityPostNotification(0xBD7u, v6);
  }
  if (_AXSApplicationAccessibilityEnabled())
  {
    if (CFAbsoluteTimeGetCurrent() - *(double *)&_accessibilityReenabled_LastLoadAll > 3.0)
    {
      uint64_t v7 = +[UIAccessibilityInformationLoader sharedInstance];
      [v7 setNeedsLoadAccessibilityInformation];

      _accessibilityReenabled_LastLoadAll = CFAbsoluteTimeGetCurrent();
    }
  }
}

+ (void)_accessibilityStopServer
{
  uint64_t v2 = AXLogLoading();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19F2DB000, v2, OS_LOG_TYPE_DEBUG, "Accessibility Stopped", v4, 2u);
  }

  _accessibilityServerStarted = 0;
  BOOL v3 = (id *)MEMORY[0x1E4F43630];
  if (objc_opt_respondsToSelector()) {
    [*v3 accessibilityDisable];
  }
}

+ (BOOL)_accessibilityServerStarted
{
  return _accessibilityServerStarted;
}

+ (BOOL)_accessibilityUIKitBundleLoaded
{
  return _AccessibilityUIKitBundledLoaded;
}

+ (BOOL)_accessibilityStringLocalizationCategoriesLoaded
{
  return _UIAXDidLoadStringLocalizationCategoriesValue;
}

+ (void)_accessibilityInitializeRuntimeOverrides
{
  BOOL v3 = AXLogLoading();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_19F2DB000, v3, OS_LOG_TYPE_DEBUG, "Accessibility Initialize Runtime Overrides", v5, 2u);
  }

  if (_accessibilityInitializeRuntimeOverrides_onceToken != -1) {
    dispatch_once(&_accessibilityInitializeRuntimeOverrides_onceToken, &__block_literal_global_297);
  }
  if (_AXSAutomationLocalizedStringLookupInfoEnabled() || _AXSAutomationPreferredLocalization())
  {
    [a1 _stringLocalizationStarted:0];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:a1 selector:sel__stringLocalizationStarted_ name:*MEMORY[0x1E4FB8FB0] object:0];
  }
  [a1 _accessibilityInitializeSubclassRuntimeOverrides];
}

void __65__UIAccessibilityLoader__accessibilityInitializeRuntimeOverrides__block_invoke()
{
  id v0 = [MEMORY[0x1E4F483A8] sharedInstance];
  [v0 performValidations:&__block_literal_global_300 withPreValidationHandler:&__block_literal_global_333 postValidationHandler:&__block_literal_global_342 safeCategoryInstallationHandler:&__block_literal_global_345];
}

uint64_t __65__UIAccessibilityLoader__accessibilityInitializeRuntimeOverrides__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v3 bundleIdentifier];
  char v5 = [v4 hasPrefix:*MEMORY[0x1E4F482D8]];

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreen", @"_updateTraits", "v", 0);
    objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"UIScreen", @"_enumerateScreensWithBlock:", "v", "@?", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardImpl", @"taskQueue", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardTaskQueue", @"waitUntilAllTasksAreFinished", "v", 0);
    [v2 validateClass:@"__SwiftNull"];
    [v2 validateClass:@"__SwiftValue"];
  }

  return 1;
}

uint64_t __65__UIAccessibilityLoader__accessibilityInitializeRuntimeOverrides__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"UIAccessibilityRuntimeLoad"];
  [v2 setOverrideProcessName:@"UIAccessibility framework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x1F41061B8]();
}

void __65__UIAccessibilityLoader__accessibilityInitializeRuntimeOverrides__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  _AXInitializeSafeSwiftValueSupport();
  [v2 installSafeCategory:@"NSObjectAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NSBundleAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIAccessibilityElementSuperCategory" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITouchesEventAccessibility" canInteractWithTargetClass:1];
}

+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4
{
}

+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4 force:(BOOL)a5 loadAllAccessibilityInfo:(BOOL)a6
{
}

+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4 forceLoad:(BOOL)a5 loadSubbundles:(BOOL)a6 loadAllAccessibilityInfo:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v11 = a4;
  if (AX_USING_LEGACY_LOADER_onceToken != -1) {
    dispatch_once(&AX_USING_LEGACY_LOADER_onceToken, &__block_literal_global_429);
  }
  if (AX_USING_LEGACY_LOADER__UsesLegacyLoader) {
    +[UIAccessibilityLegacyLoader loadAccessibilityBundleForBundle:v12 didLoadCallback:v11 forceLoad:v9 loadSubbundles:v8 loadAllAccessibilityInfo:v7];
  }
}

+ (void)loadAccessibilityBundle:(id)a3 didLoadCallback:(id)a4 loadSubbundles:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v7 = a4;
  if (AX_USING_LEGACY_LOADER_onceToken != -1) {
    dispatch_once(&AX_USING_LEGACY_LOADER_onceToken, &__block_literal_global_429);
  }
  if (AX_USING_LEGACY_LOADER__UsesLegacyLoader) {
    +[UIAccessibilityLegacyLoader loadAccessibilityBundle:v8 didLoadCallback:v7 loadSubbundles:v5];
  }
}

+ (id)_accessibilityBundlesForBundle:(id)a3
{
  id v3 = a3;
  if (AX_USING_LEGACY_LOADER_onceToken != -1) {
    dispatch_once(&AX_USING_LEGACY_LOADER_onceToken, &__block_literal_global_429);
  }
  if (AX_USING_LEGACY_LOADER__UsesLegacyLoader)
  {
    uint64_t v4 = +[UIAccessibilityLegacyLoader _accessibilityBundlesForBundle:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (void)_stringLocalizationStarted:(id)a3
{
  if ((_AXSAutomationLocalizedStringLookupInfoEnabled() || _AXSAutomationPreferredLocalization())
    && _stringLocalizationStarted__onceToken != -1)
  {
    dispatch_once(&_stringLocalizationStarted__onceToken, &__block_literal_global_361);
  }
}

void __52__UIAccessibilityLoader__stringLocalizationStarted___block_invoke()
{
  id v0 = [MEMORY[0x1E4F483A8] sharedInstance];
  [v0 performValidations:&__block_literal_global_363 withPreValidationHandler:&__block_literal_global_365 postValidationHandler:&__block_literal_global_370 safeCategoryInstallationHandler:&__block_literal_global_372];
}

uint64_t __52__UIAccessibilityLoader__stringLocalizationStarted___block_invoke_2()
{
  return 1;
}

uint64_t __52__UIAccessibilityLoader__stringLocalizationStarted___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"String localization for Automation - UIAccessibility"];
  [v2 setOverrideProcessName:@"String localization for Automation - UIAccessibility"];
  [v2 setDebugBuild:0];

  return MEMORY[0x1F41061B8]();
}

void __52__UIAccessibilityLoader__stringLocalizationStarted___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"NSStringAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NSPlaceholderStringAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NSConcreteAttributedStringAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NSConcreteMutableAttributedStringAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NSKeyedArchiverAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"__NSCFStringAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXPTranslationObjectAccessibility" canInteractWithTargetClass:1];

  _UIAXDidLoadStringLocalizationCategoriesValue = 1;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"AXUILocalizationLoaded" object:0];
}

@end