@interface UIAccessibilityLegacyLoader
+ (BOOL)_accessibilityShouldSortBundlesBeforeLoading;
+ (id)_accessibilityBundlesForBundle:(id)a3;
+ (id)_axBundleForBundle:(id)a3;
+ (int64_t)_accessibilityLoadingPriorityForBundle:(id)a3;
+ (void)_accessibilityLoadSubbundles:(id)a3;
+ (void)initialize;
+ (void)loadAccessibilityBundle:(id)a3 didLoadCallback:(id)a4 loadSubbundles:(BOOL)a5;
+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4 forceLoad:(BOOL)a5 loadSubbundles:(BOOL)a6 loadAllAccessibilityInfo:(BOOL)a7;
+ (void)loadExtendedAccessibilityBundles;
@end

@implementation UIAccessibilityLegacyLoader

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_14);
  }
}

void __41__UIAccessibilityLegacyLoader_initialize__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  v1 = [NSString stringWithFormat:@"%@/%@", @"/System/Library/PrivateFrameworks", @"UIAccessibility.framework"];
  id v12 = [v0 bundleWithPath:v1];

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = (void *)MEMORY[0x1E4F1C978];
  v4 = [v12 pathForResource:@"DeniedBundles" ofType:@"plist"];
  v5 = [v3 arrayWithContentsOfFile:v4];
  uint64_t v6 = [v2 setWithArray:v5];
  v7 = (void *)_DeniedBundles;
  _DeniedBundles = v6;

  uint64_t v8 = [objc_allocWithZone(MEMORY[0x1E4F1CA80]) init];
  v9 = (void *)_LoadedBundles;
  _LoadedBundles = v8;

  uint64_t v10 = [objc_allocWithZone(MEMORY[0x1E4F28E08]) init];
  v11 = (void *)_BundleLock;
  _BundleLock = v10;
}

+ (void)loadExtendedAccessibilityBundles
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3CA890](a1, a2);
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [a1 _axBundleForBundle:v4];
  uint64_t v6 = AXLogLoading();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = [v4 bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = (uint64_t)v7;
    __int16 v25 = 2114;
    v26 = v5;
    _os_log_impl(&dword_19F2DB000, v6, OS_LOG_TYPE_DEBUG, "Loading AX for '%{public}@'. AXBundle '%{public}@'", buf, 0x16u);
  }
  uint64_t v8 = [v5 infoDictionary];
  v9 = [v8 objectForKey:@"SupportsAsynchronousLoad"];
  int v10 = [v9 BOOLValue];

  v11 = AXLogLoading();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F2DB000, v11, OS_LOG_TYPE_INFO, "Bundle supports asynchronous load", buf, 2u);
    }

    UIAccessibilityPostNotification(0xFA0u, 0);
    [a1 loadAccessibilityBundleForBundle:v4 didLoadCallback:&__block_literal_global_288];
    v21[2] = MEMORY[0x1E4F143A8];
    v21[3] = 3221225472;
    v21[4] = __63__UIAccessibilityLegacyLoader_loadExtendedAccessibilityBundles__block_invoke_294;
    v21[5] = &unk_1E59B9B18;
    v13 = (id *)v22;
    v22[0] = v5;
    v22[1] = a1;
    id v14 = v5;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    if (v12)
    {
      v15 = [v5 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = (uint64_t)v15;
      _os_log_impl(&dword_19F2DB000, v11, OS_LOG_TYPE_INFO, "%{public}@: Loading synchronously", buf, 0xCu);
    }
    [a1 loadAccessibilityBundleForBundle:v4 didLoadCallback:&__block_literal_global_288];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__UIAccessibilityLegacyLoader_loadExtendedAccessibilityBundles__block_invoke_296;
    v20[3] = &unk_1E59B9B18;
    v13 = (id *)v21;
    v21[0] = v5;
    v21[1] = a1;
    id v16 = v5;
    v17 = (void (**)(void))_Block_copy(v20);
    if (_UIApplicationIsExtension())
    {
      v18 = AXLogLoading();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v24 = 0x3FE0000000000000;
        _os_log_impl(&dword_19F2DB000, v18, OS_LOG_TYPE_INFO, "Accessibility bundles: Delaying load by %fs", buf, 0xCu);
      }

      _UIAXInitializeConstantValues();
      dispatch_time_t v19 = dispatch_time(0, 500000000);
      dispatch_after(v19, MEMORY[0x1E4F14428], v17);
    }
    else
    {
      v17[2](v17);
    }
  }
}

void __63__UIAccessibilityLegacyLoader_loadExtendedAccessibilityBundles__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = AXLogLoading();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int IsSystemAppServer = _UIAXAppIsSystemAppServer();
    v7 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v8 = [v7 processName];
    int v9 = 134218498;
    uint64_t v10 = a4;
    __int16 v11 = 1024;
    int v12 = IsSystemAppServer;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_19F2DB000, v5, OS_LOG_TYPE_INFO, "Main bundle finished loading: load type: %ld - is system app server: %d (%@)", (uint8_t *)&v9, 0x1Cu);
  }
  if (!a4)
  {
    if (_UIAXAppIsSystemAppServer()) {
      +[UIAccessibilityLoader _didLoadSystemAppAccessibilityBundle];
    }
  }
}

void __63__UIAccessibilityLegacyLoader_loadExtendedAccessibilityBundles__block_invoke_294(uint64_t a1)
{
  [*(id *)(a1 + 40) _accessibilityLoadSubbundles:*(void *)(a1 + 32)];
  v1 = +[UIAccessibilityInformationLoader sharedInstance];
  [v1 setNeedsLoadAccessibilityInformation];

  UIAccessibilityPostNotification(0xFA1u, 0);
}

uint64_t __63__UIAccessibilityLegacyLoader_loadExtendedAccessibilityBundles__block_invoke_296(uint64_t a1)
{
  return [*(id *)(a1 + 40) _accessibilityLoadSubbundles:*(void *)(a1 + 32)];
}

+ (id)_axBundleForBundle:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 isLoaded])
  {
    id v8 = 0;
LABEL_27:
    id v8 = v8;
    v22 = v8;
    goto LABEL_29;
  }
  v4 = [v3 accessibilityBundlePath];
  v5 = [v4 lastPathComponent];
  uint64_t v6 = [v5 stringByDeletingPathExtension];

  v7 = [v4 pathExtension];
  if (([v7 isEqualToString:@"assistantUIBundle"] & 1) != 0
    || ([v7 isEqualToString:@"siriUIBundle"] & 1) != 0)
  {
    int v31 = 1;
  }
  else
  {
    int v31 = [v7 isEqualToString:@"siriUIPresentationBundle"];
  }
  int v9 = [v7 isEqualToString:@"uibundle"];
  int v10 = [v7 isEqualToString:@"app"];
  int v11 = [v7 isEqualToString:@"qldisplay"];
  int v12 = [v7 isEqualToString:@"framework"];
  int v13 = [v7 isEqualToString:@"bundle"];
  int v14 = [v7 isEqualToString:@"appex"];
  int v15 = [v7 isEqualToString:@"fpenroll"];
  if (v12)
  {
    id v16 = @"Framework";
LABEL_19:
    v17 = [v6 stringByAppendingString:v16];
    v18 = [v17 stringByAppendingPathExtension:kUIAccessibilityBundleExtension];

    goto LABEL_20;
  }
  if (v31)
  {
    id v16 = @"-Assistant";
    goto LABEL_19;
  }
  if (v11)
  {
    id v16 = @"-QuickLook";
    goto LABEL_19;
  }
  if (v9)
  {
    id v16 = @"-SBPlugin";
    goto LABEL_19;
  }
  if (v10)
  {
    id v16 = @"App";
    goto LABEL_19;
  }
  if (v14)
  {
    id v16 = @"-AppExtension";
    goto LABEL_19;
  }
  if (v13 || v15)
  {
    v18 = [v6 stringByAppendingPathExtension:kUIAccessibilityBundleExtension];
LABEL_20:
    uint64_t v19 = [MEMORY[0x1E4F28B50] accessibilityLocalBundleWithLastPathComponent:v18];
    if (v19
      || ([MEMORY[0x1E4F28B50] accessibilityBundleWithLastPathComponent:v18],
          (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = (id)v19;
    }
    else
    {
      if (AXIsInternalInstall())
      {
        id v8 = [MEMORY[0x1E4F28B50] accessibilityInternalBundleWithLastPathComponent:v18];
      }
      else
      {
        id v8 = 0;
      }
      if (v8) {
        char v24 = 1;
      }
      else {
        char v24 = v31;
      }
      if ((v24 & 1) == 0)
      {
        __int16 v25 = @"~ipad";
        if (([v6 hasSuffix:@"~ipad"] & 1) != 0
          || (__int16 v25 = @"~iphone", [v6 hasSuffix:@"~iphone"]))
        {
          uint64_t v26 = [v6 stringByReplacingOccurrencesOfString:v25 withString:&stru_1EF1680E8];

          uint64_t v6 = (void *)v26;
        }
        uint64_t v27 = [v6 stringByAppendingPathExtension:kUIAccessibilityBundleExtension];

        id v8 = [MEMORY[0x1E4F28B50] accessibilityBundleWithLastPathComponent:v27];
        v18 = v27;
      }
      if (!v8)
      {
        v28 = [v3 bundleIdentifier];

        if (v28)
        {
          v29 = [v3 bundleIdentifier];
          v30 = [v29 stringByAppendingPathExtension:kUIAccessibilityBundleExtension];

          id v8 = [MEMORY[0x1E4F28B50] accessibilityBundleWithLastPathComponent:v30];
        }
        else
        {
          id v8 = 0;
        }
      }
    }
    v20 = AXLogLoading();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v33 = v8 != 0;
      *(_WORD *)&v33[4] = 2114;
      *(void *)&v33[6] = v3;
      __int16 v34 = 2114;
      v35 = v18;
      _os_log_debug_impl(&dword_19F2DB000, v20, OS_LOG_TYPE_DEBUG, "Loading Sub-bundle [%d]: %{public}@ [%{public}@]", buf, 0x1Cu);
    }

    int v21 = 1;
    goto LABEL_26;
  }
  v18 = AXLogLoading();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v33 = v4;
    _os_log_impl(&dword_19F2DB000, v18, OS_LOG_TYPE_INFO, "Not servicing %@ because it's not a known type of bundle", buf, 0xCu);
  }
  int v21 = 0;
  id v8 = 0;
LABEL_26:

  if (v21) {
    goto LABEL_27;
  }
  v22 = 0;
LABEL_29:

  return v22;
}

+ (void)_accessibilityLoadSubbundles:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AXLogLoading();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v4 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    int v13 = v6;
    _os_log_impl(&dword_19F2DB000, v5, OS_LOG_TYPE_DEBUG, "Loading sub-bundles from %{public}@", buf, 0xCu);
  }
  v7 = [a1 _accessibilityBundlesForBundle:v4];
  uint64_t v8 = [v7 count];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke;
  v11[3] = &__block_descriptor_48_e25_v32__0__NSBundle_8Q16_B24l;
  v11[4] = a1;
  v11[5] = v8;
  [v7 enumerateObjectsUsingBlock:v11];
  int v10 = v4;
  id v9 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2;
  v10[3] = &unk_1E59B9B40;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v6;
  uint64_t v13 = a3;
  uint64_t v14 = v7;
  id v8 = v5;
  id v9 = _Block_copy(v10);
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = AXLogLoading();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19F2DB000, v2, OS_LOG_TYPE_DEBUG, "  Loading sub-bundle %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) loadAccessibilityBundleForBundle:*(void *)(a1 + 32) didLoadCallback:0 forceLoad:0 loadSubbundles:1 loadAllAccessibilityInfo:*(void *)(a1 + 48) == *(void *)(a1 + 56) - 1];
}

void __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_355(uint64_t a1)
{
  [(id)*MEMORY[0x1E4F43630] _accessibilityInitialize];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2_356;
  block[3] = &unk_1E59B9300;
  id v3 = *(id *)(a1 + 32);
  if (_LoadedBundles_block_invoke_onceToken != -1) {
    dispatch_once(&_LoadedBundles_block_invoke_onceToken, block);
  }
}

void __60__UIAccessibilityLegacyLoader__accessibilityLoadSubbundles___block_invoke_2_356(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = AXLogLoading();
  if (os_signpost_enabled(v2))
  {
    LOWORD(v5) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXLaunchTime", (const char *)&unk_19F34FEBA, (uint8_t *)&v5, 2u);
  }

  id v3 = AXLogLoading();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(a1 + 32) bundleIdentifier];
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_19F2DB000, v3, OS_LOG_TYPE_INFO, "Loaded Accessibility for %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

+ (int64_t)_accessibilityLoadingPriorityForBundle:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 _accessibilityIntegerValueForKey:@"axBundlePriority"];
  if (!v4)
  {
    int64_t v4 = AXBundleLoadingPriorityDefault;
    int v5 = [v3 safeStringForKey:@"_resolvedPath"];
    if ([v5 hasSuffix:@"UIKit.framework"])
    {
      int64_t v4 = AXBundleLoadingPriorityUIKit;
    }
    else if ([v5 hasSuffix:@"TVMLKit.framework"])
    {
      int64_t v4 = AXBundleLoadingPriorityTVMLKit;
    }
    else if ([v5 hasSuffix:@"ControlCenterUI.framework"])
    {
      int64_t v4 = AXBundleLoadingPriorityControlCenterUI;
    }
    else if ([v5 hasSuffix:@"ControlCenterUIKit.framework"])
    {
      int64_t v4 = AXBundleLoadingPriorityControlCenterUIKit;
    }
    else if ([v5 hasSuffix:@"MessageUI.framework"])
    {
      int64_t v4 = AXBundleLoadingPriorityMessageUI;
    }
    else if ([v5 hasSuffix:@"framework"])
    {
      int64_t v4 = AXBundleLoadingPriorityFramework;
    }
    else if ([v5 hasSuffix:@"bundle"])
    {
      int64_t v4 = AXBundleLoadingPriorityBundle;
    }
    [v3 _accessibilitySetIntegerValue:v4 forKey:@"axBundlePriority"];
  }
  return v4;
}

+ (BOOL)_accessibilityShouldSortBundlesBeforeLoading
{
  return 1;
}

+ (void)loadAccessibilityBundleForBundle:(id)a3 didLoadCallback:(id)a4 forceLoad:(BOOL)a5 loadSubbundles:(BOOL)a6 loadAllAccessibilityInfo:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v12 accessibilityBundlePath];
    [(id)_BundleLock lock];
    int v15 = (void *)_DeniedBundles;
    id v16 = [v14 lastPathComponent];
    LODWORD(v15) = [v15 containsObject:v16];

    [(id)_BundleLock unlock];
    if (v15)
    {
      v17 = AXLogLoading();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v12;
        v18 = "Bundle in deny list: %{public}@";
LABEL_12:
        _os_log_impl(&dword_19F2DB000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0xCu);
      }
    }
    else if ((AXProcessIsSystemApplication() & 1) != 0 {
           || ([v14 lastPathComponent],
    }
               uint64_t v19 = objc_claimAutoreleasedReturnValue(),
               int v20 = [v19 hasPrefix:@"Assistant"],
               v19,
               !v20))
    {
      int v21 = [v14 lastPathComponent];
      int v22 = [v21 hasSuffix:@"axbundle"];

      if (!v22)
      {
        [(id)_BundleLock lock];
        int v23 = [(id)_LoadedBundles containsObject:v14];
        [(id)_BundleLock unlock];
        if (!v23 || v9)
        {
          char v24 = AXLogLoading();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v35 = v12;
            _os_log_impl(&dword_19F2DB000, v24, OS_LOG_TYPE_DEBUG, "Attempting to load: %{public}@", buf, 0xCu);
          }

          [v12 _cfBundle];
          if (([v12 isLoaded] & 1) != 0 || v9)
          {
            [(id)_BundleLock lock];
            [(id)_LoadedBundles addObject:v14];
            [(id)_BundleLock unlock];
            uint64_t v26 = [a1 _axBundleForBundle:v12];
            __int16 v25 = v26;
            if (v13 && !v26) {
              (*((void (**)(id, void, void, void))v13 + 2))(v13, 0, 0, 0);
            }
            uint64_t v28 = MEMORY[0x1E4F143A8];
            uint64_t v29 = 3221225472;
            v30 = __130__UIAccessibilityLegacyLoader_loadAccessibilityBundleForBundle_didLoadCallback_forceLoad_loadSubbundles_loadAllAccessibilityInfo___block_invoke;
            int v31 = &unk_1E59B9B88;
            id v32 = v13;
            BOOL v33 = a7;
            uint64_t v27 = _Block_copy(&v28);
            objc_msgSend(a1, "loadAccessibilityBundle:didLoadCallback:loadSubbundles:", v25, v27, v8, v28, v29, v30, v31);
          }
          else
          {
            __int16 v25 = AXLogLoading();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v35 = v12;
              _os_log_impl(&dword_19F2DB000, v25, OS_LOG_TYPE_DEBUG, "Bundle not loaded? %{public}@", buf, 0xCu);
            }
          }

          goto LABEL_16;
        }
LABEL_14:
        if (v13) {
          (*((void (**)(id, void, void, void))v13 + 2))(v13, 0, 0, 0);
        }
LABEL_16:

        goto LABEL_17;
      }
      v17 = AXLogLoading();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v12;
        v18 = "Bundle is an axbundle, don't load again: %{public}@";
        goto LABEL_12;
      }
    }
    else
    {
      v17 = AXLogLoading();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v12;
        v18 = "Bundle is assistant not inside system app: %{public}@";
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
LABEL_17:
}

void __130__UIAccessibilityLegacyLoader_loadAccessibilityBundleForBundle_didLoadCallback_forceLoad_loadSubbundles_loadAllAccessibilityInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 16))(v8, a2, v7, a4);
  }
  BOOL v9 = AXLogLoading();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543362;
    id v12 = v7;
    _os_log_impl(&dword_19F2DB000, v9, OS_LOG_TYPE_DEBUG, "Finished loading axbundle: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  if (*(unsigned char *)(a1 + 40))
  {
    int v10 = +[UIAccessibilityInformationLoader sharedInstance];
    [v10 setNeedsLoadAccessibilityInformation];
  }
}

+ (void)loadAccessibilityBundle:(id)a3 didLoadCallback:(id)a4 loadSubbundles:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    goto LABEL_16;
  }
  if (([v7 isLoaded] & 1) == 0)
  {
    id v18 = 0;
    char v10 = [v7 loadAndReturnError:&v18];
    id v11 = v18;
    if (v10)
    {
      uint64_t v12 = [v7 principalClass];
      uint64_t v13 = AXLogLoading();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        id v20 = v7;
        __int16 v21 = 2114;
        uint64_t v22 = v12;
        _os_log_impl(&dword_19F2DB000, v13, OS_LOG_TYPE_DEBUG, "AX Bundle principal class: %{public}@ %{public}@", buf, 0x16u);
      }

      if (!v12) {
        goto LABEL_15;
      }
      v17 = v8;
      id v16 = v7;
      AXPerformBlockOnMainThread();

      uint64_t v14 = v17;
    }
    else
    {
      uint64_t v14 = AXLogLoading();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[UIAccessibilityLegacyLoader loadAccessibilityBundle:didLoadCallback:loadSubbundles:](v7, (uint64_t)v11, v14);
      }
    }

LABEL_15:
    goto LABEL_16;
  }
  if (v5)
  {
    int v15 = +[UIAccessibilityLoader _accessibilityBundlesForBundle:v7];
    id v9 = v15;
    AXPerformBlockOnMainThread();
  }
  if (v8) {
    (*((void (**)(id, uint64_t, id, uint64_t))v8 + 2))(v8, 1, v7, 1);
  }
LABEL_16:
}

uint64_t __86__UIAccessibilityLegacyLoader_loadAccessibilityBundle_didLoadCallback_loadSubbundles___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 48) accessibilityInitializeBundle];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __86__UIAccessibilityLegacyLoader_loadAccessibilityBundle_didLoadCallback_loadSubbundles___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        +[UIAccessibilityLoader loadAccessibilityBundleForBundle:didLoadCallback:](UIAccessibilityLoader, "loadAccessibilityBundleForBundle:didLoadCallback:", *(void *)(*((void *)&v6 + 1) + 8 * v5++), 0, (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

+ (id)_accessibilityBundlesForBundle:(id)a3
{
  id v3 = a3;
  [v3 principalClass];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend((id)objc_msgSend(v3, "principalClass"), "accessibilityBundles"),
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] allFrameworks];
    long long v6 = [MEMORY[0x1E4F28B50] allBundles];
    long long v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
    [v7 axSafelyAddObjectsFromArray:v6];
    [v7 axSafelyAddObjectsFromArray:v5];
    long long v8 = [MEMORY[0x1E4F28B50] mainBundle];
    [v7 removeObject:v8];

    long long v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v7 removeObject:v9];

    id v4 = v7;
    if (+[UIAccessibilityLegacyLoader _accessibilityShouldSortBundlesBeforeLoading])
    {
      char v10 = AXLogLoading();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19F2DB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BundleSort", (const char *)&unk_19F34FEBA, buf, 2u);
      }

      [v4 sortUsingComparator:&__block_literal_global_389];
      uint64_t v11 = AXLogLoading();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_19F2DB000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BundleSort", (const char *)&unk_19F34FEBA, v13, 2u);
      }
    }
  }

  return v4;
}

uint64_t __62__UIAccessibilityLegacyLoader__accessibilityBundlesForBundle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int64_t v5 = +[UIAccessibilityLegacyLoader _accessibilityLoadingPriorityForBundle:a2];
  int64_t v6 = +[UIAccessibilityLegacyLoader _accessibilityLoadingPriorityForBundle:v4];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

+ (void)loadAccessibilityBundle:(void *)a1 didLoadCallback:(uint64_t)a2 loadSubbundles:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [a1 bundleURL];
  int v6 = 138543618;
  long long v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_19F2DB000, a3, OS_LOG_TYPE_ERROR, "Unable to load AX Bundle: %{public}@ [%{public}@]", (uint8_t *)&v6, 0x16u);
}

@end