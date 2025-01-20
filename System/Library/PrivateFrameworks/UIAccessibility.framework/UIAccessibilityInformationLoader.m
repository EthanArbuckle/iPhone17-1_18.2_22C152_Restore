@interface UIAccessibilityInformationLoader
+ (id)sharedInstance;
- (id)_init;
- (void)_coalesceTimerFired:(id)a3;
- (void)_loadAccessibilityInformationOnMainThread:(BOOL)a3;
- (void)_setNeedsLoadAccessibilityInformationOnMainThread;
- (void)loadAccessibilityInformation;
- (void)setNeedsLoadAccessibilityInformation;
@end

@implementation UIAccessibilityInformationLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance__SharedInfoLoader;

  return v2;
}

uint64_t __50__UIAccessibilityInformationLoader_sharedInstance__block_invoke()
{
  sharedInstance__SharedInfoLoader = [[UIAccessibilityInformationLoader alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityInformationLoader;
  return [(UIAccessibilityInformationLoader *)&v3 init];
}

- (void)loadAccessibilityInformation
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(UIAccessibilityInformationLoader *)self _loadAccessibilityInformationOnMainThread:0];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__UIAccessibilityInformationLoader_loadAccessibilityInformation__block_invoke;
    block[3] = &unk_1E59B9300;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __64__UIAccessibilityInformationLoader_loadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAccessibilityInformationOnMainThread:0];
}

- (void)setNeedsLoadAccessibilityInformation
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(UIAccessibilityInformationLoader *)self _setNeedsLoadAccessibilityInformationOnMainThread];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__UIAccessibilityInformationLoader_setNeedsLoadAccessibilityInformation__block_invoke;
    block[3] = &unk_1E59B9300;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __72__UIAccessibilityInformationLoader_setNeedsLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setNeedsLoadAccessibilityInformationOnMainThread];
}

- (void)_loadAccessibilityInformationOnMainThread:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (AXShouldLogValidationErrors())
  {
    v4 = AXLogLoading();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      _os_log_impl(&dword_19F2DB000, v4, OS_LOG_TYPE_INFO, "loading ax info. wasCoalesced: %i", buf, 8u);
    }
  }
  v40 = [MEMORY[0x1E4F42738] sharedApplication];
  [v40 _accessibilityLoadAccessibilityInformation];
  v39 = [v40 safeValueForKey:@"delegate"];
  if (objc_opt_respondsToSelector()) {
    [v39 _accessibilityLoadAccessibilityInformation];
  }
  [v40 _accessibilityRegisterForDictationLifecycleNotifications];
  *(void *)buf = 0;
  v56 = buf;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__3;
  v59 = __Block_byref_object_dispose__3;
  id v60 = 0;
  uint64_t v47 = MEMORY[0x1E4F143A8];
  uint64_t v48 = 3221225472;
  v49 = __78__UIAccessibilityInformationLoader__loadAccessibilityInformationOnMainThread___block_invoke;
  v50 = &unk_1E59B89A0;
  v51 = buf;
  AXPerformSafeBlock();
  if (*((void *)v56 + 5))
  {
    id v5 = objc_allocWithZone(MEMORY[0x1E4F1CA48]);
    v6 = (void *)[v5 initWithArray:*((void *)v56 + 5)];
    v7 = [MEMORY[0x1E4F1CA80] set];
    v8 = (void *)MEMORY[0x1E4F42FF8];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __78__UIAccessibilityInformationLoader__loadAccessibilityInformationOnMainThread___block_invoke_2;
    v45[3] = &unk_1E59B98A8;
    id v9 = v6;
    id v46 = v9;
    [v8 _traverseViewControllerHierarchyWithDelayedRelease:v45];
    *(void *)&long long v10 = 138412290;
    long long v38 = v10;
    while (1)
    {
      if (!objc_msgSend(v9, "count", v38))
      {

        goto LABEL_69;
      }
      v11 = [v9 lastObject];
      [v9 removeLastObject];
      if (([v7 containsObject:v11] & 1) == 0) {
        break;
      }
LABEL_67:
    }
    [v7 addObject:v11];
    [v11 _accessibilityLoadAccessibilityInformation];
    if (AXShouldLogValidationErrors())
    {
      v12 = AXLogLoading();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v53 = v38;
        v54 = v11;
        _os_log_impl(&dword_19F2DB000, v12, OS_LOG_TYPE_DEBUG, "loading ax info on %@", v53, 0xCu);
      }
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v13 = [v11 _accessibilityLoadAccessibilityInformationSupplementaryItems];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          if (([v7 containsObject:v17] & 1) == 0) {
            [v9 addObject:v17];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v14);
    }

    v18 = (objc_class *)objc_opt_class();
    if (_AXStrictIsKindOfClass(v11, v18))
    {
      v19 = [v11 rootViewController];
      if (v19) {
        [v9 addObject:v19];
      }
    }
    v20 = (objc_class *)objc_opt_class();
    if (_AXStrictIsKindOfClass(v11, v20))
    {
      v21 = [MEMORY[0x1E4F42FF8] viewControllerForView:v11];
      if (v21) {
        [v9 addObject:v21];
      }
      v22 = [v11 safeValueForKey:@"subviews"];
      if (v22) {
        [v9 addObjectsFromArray:v22];
      }
      v23 = (objc_class *)objc_opt_class();
      if (_AXStrictIsKindOfClass(v11, v23))
      {
        v24 = [v11 delegate];
        v25 = v24;
        if (v24 && ([v24 isProxy] & 1) == 0) {
          [v9 addObject:v25];
        }
      }
      v26 = (objc_class *)objc_opt_class();
      if (_AXStrictIsKindOfClass(v11, v26))
      {
        v27 = [v11 safeValueForKey:@"items"];
        if (v27) {
          [v9 addObjectsFromArray:v27];
        }
      }
    }
    else
    {
      v28 = (objc_class *)objc_opt_class();
      if (_AXStrictIsKindOfClass(v11, v28))
      {
        v53[0] = 0;
        objc_opt_class();
        v29 = [v11 safeValueForKey:@"_leftBarButtonItems"];
        v21 = __UIAccessibilityCastAsClass();

        if (v53[0]) {
          abort();
        }
        if (v21) {
          [v9 addObjectsFromArray:v21];
        }
        v53[0] = 0;
        objc_opt_class();
        v30 = [v11 safeValueForKey:@"_rightBarButtonItems"];
        v22 = __UIAccessibilityCastAsClass();

        if (v53[0]) {
          abort();
        }
        if (!v22) {
          goto LABEL_66;
        }
      }
      else
      {
        v31 = (objc_class *)objc_opt_class();
        if (!_AXStrictIsKindOfClass(v11, v31)) {
          goto LABEL_67;
        }
        v21 = [v11 safeValueForKey:@"presentedViewController"];
        if (v21) {
          [v9 addObject:v21];
        }
        v32 = (objc_class *)objc_opt_class();
        if (_AXStrictIsKindOfClass(v11, v32))
        {
          v33 = [v11 safeValueForKey:@"navigationBar"];
          if (v33) {
            [v9 addObject:v33];
          }
          v34 = [v11 safeValueForKey:@"toolbar"];
          if (v34) {
            [v9 addObject:v34];
          }
          v35 = [v11 safeValueForKey:@"viewControllers"];
          if (v35) {
            [v9 addObjectsFromArray:v35];
          }
        }
        v36 = (objc_class *)objc_opt_class();
        if (_AXStrictIsKindOfClass(v11, v36))
        {
          v37 = [v11 safeValueForKeyPath:@"_panelImpl.panelController"];
          if (v37) {
            [v9 addObject:v37];
          }
        }
        v22 = [v11 safeValueForKey:@"childViewControllers"];
        if (!v22) {
          goto LABEL_66;
        }
      }
      [v9 addObjectsFromArray:v22];
    }
LABEL_66:

    goto LABEL_67;
  }
LABEL_69:
  _Block_object_dispose(buf, 8);
}

uint64_t __78__UIAccessibilityInformationLoader__loadAccessibilityInformationOnMainThread___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)*MEMORY[0x1E4F43630] _accessibilityAllWindowsOnlyVisibleWindows:0];

  return MEMORY[0x1F41817F8]();
}

uint64_t __78__UIAccessibilityInformationLoader__loadAccessibilityInformationOnMainThread___block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  if (a3) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (void)_coalesceTimerFired:(id)a3
{
}

- (void)_setNeedsLoadAccessibilityInformationOnMainThread
{
  [(NSTimer *)self->_coalesceTimer invalidate];
  self->_coalesceTimer = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__coalesceTimerFired_ selector:0 userInfo:0 repeats:0.5];

  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end