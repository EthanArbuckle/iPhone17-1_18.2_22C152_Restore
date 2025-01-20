@interface SBApplicationLibraryObserver
+ (SBApplicationLibraryObserver)new;
- (NSArray)placeholders;
- (SBApplicationLibraryObserver)init;
- (SBApplicationLibraryObserver)initWithAppLibrary:(id)a3 splashBoardController:(id)a4;
- (id)_appBundleIDsForApplications:(id)a3;
- (id)suspendCalloutsAssertionWithReason:(id)a3;
- (void)_addObserver:(id)a3 table:(id)a4;
- (void)_didAddApplications:(id)a3;
- (void)_didAddPlaceholders:(id)a3;
- (void)_didCancelPlaceholders:(id)a3;
- (void)_didChangeNetworkUsage:(BOOL)a3;
- (void)_didDemoteApplications:(id)a3;
- (void)_didRemoveApplications:(id)a3;
- (void)_didReplaceApplications:(id)a3;
- (void)_didUpdateApplications:(id)a3;
- (void)_removeObserver:(id)a3 table:(id)a4;
- (void)_waitForLaunchImageGenerationForApplications:(id)a3;
- (void)addApplicationLifecycleObserver:(id)a3;
- (void)addPlaceholderLifecycleObserver:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeApplicationLifecycleObserver:(id)a3;
- (void)removePlaceholderLifecycleObserver:(id)a3;
@end

@implementation SBApplicationLibraryObserver

+ (SBApplicationLibraryObserver)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"SBApplicationLibraryObserver.m" lineNumber:49 description:@"-[SBApplicationLibraryObserver new] is unavailable."];

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SBApplicationLibraryObserver;
  return (SBApplicationLibraryObserver *)objc_msgSendSuper2(&v6, "new");
}

- (SBApplicationLibraryObserver)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBApplicationLibraryObserver.m" lineNumber:54 description:@"-[SBApplicationLibraryObserver init] is unavailable."];

  v6.receiver = self;
  v6.super_class = (Class)SBApplicationLibraryObserver;
  return [(SBApplicationLibraryObserver *)&v6 init];
}

- (SBApplicationLibraryObserver)initWithAppLibrary:(id)a3 splashBoardController:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v50 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    v42 = [NSString stringWithUTF8String:"-[SBApplicationLibraryObserver initWithAppLibrary:splashBoardController:]"];
    [v41 handleFailureInFunction:v42 file:@"SBApplicationLibraryObserver.m" lineNumber:59 description:@"this call must be made on the main thread"];
  }
  kdebug_trace();
  v72.receiver = self;
  v72.super_class = (Class)SBApplicationLibraryObserver;
  v7 = [(SBApplicationLibraryObserver *)&v72 init];
  if (v7)
  {
    dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("com.apple.springboard.applibrary.observer", 0, MEMORY[0x1E4F14428]);
    mainQueueProxy = v7->_mainQueueProxy;
    v7->_mainQueueProxy = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    placeholdersByBundleID = v7->_placeholdersByBundleID;
    v7->_placeholdersByBundleID = v10;

    uint64_t v12 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
    applicationObservers = v7->_applicationObservers;
    v7->_applicationObservers = (NSHashTable *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
    placeholderObservers = v7->_placeholderObservers;
    v7->_placeholderObservers = (NSHashTable *)v14;

    objc_storeStrong((id *)&v7->_appLibrary, a3);
    objc_storeStrong((id *)&v7->_splashBoardController, a4);
    objc_initWeak(&location, v7);
    appLibrary = v7->_appLibrary;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke;
    v69[3] = &unk_1E6AF7F50;
    v43 = &v70;
    objc_copyWeak(&v70, &location);
    id v17 = (id)[(FBSApplicationLibrary *)appLibrary observeDidAddPlaceholdersWithBlock:v69];
    v18 = v7->_appLibrary;
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_2;
    v67[3] = &unk_1E6AF7F50;
    v44 = &v68;
    objc_copyWeak(&v68, &location);
    id v19 = (id)[(FBSApplicationLibrary *)v18 observeDidCancelPlaceholdersWithBlock:v67];
    v20 = v7->_appLibrary;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_3;
    v65[3] = &unk_1E6AF7F50;
    v45 = &v66;
    objc_copyWeak(&v66, &location);
    id v21 = (id)[(FBSApplicationLibrary *)v20 observeDidAddApplicationsWithBlock:v65];
    v22 = v7->_appLibrary;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_4;
    v63[3] = &unk_1E6B0E218;
    v46 = &v64;
    objc_copyWeak(&v64, &location);
    id v23 = (id)[(FBSApplicationLibrary *)v22 observeDidReplaceApplicationsWithBlock:v63];
    v24 = v7->_appLibrary;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_5;
    v61[3] = &unk_1E6B0E218;
    v47 = &v62;
    objc_copyWeak(&v62, &location);
    id v25 = (id)[(FBSApplicationLibrary *)v24 observeDidUpdateApplicationsWithBlock:v61];
    v26 = v7->_appLibrary;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_6;
    v59[3] = &unk_1E6AF7F50;
    v48 = &v60;
    objc_copyWeak(&v60, &location);
    id v27 = (id)[(FBSApplicationLibrary *)v26 observeDidRemoveApplicationsWithBlock:v59];
    v28 = v7->_appLibrary;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_7;
    v57[3] = &unk_1E6AF7F50;
    objc_copyWeak(&v58, &location);
    id v29 = (id)[(FBSApplicationLibrary *)v28 observeDidDemoteApplicationsWithBlock:v57];
    v30 = v7->_appLibrary;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_8;
    v55[3] = &unk_1E6AF80B8;
    objc_copyWeak(&v56, &location);
    id v31 = (id)[(FBSApplicationLibrary *)v30 observeDidChangeNetworkUsageWithBlock:v55];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v32 = [(FBSApplicationLibrary *)v7->_appLibrary allPlaceholders];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v73 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v52 != v34) {
            objc_enumerationMutation(v32);
          }
          v36 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v37 = v7->_placeholdersByBundleID;
          v38 = objc_msgSend(v36, "bundleIdentifier", v43, v44, v45, v46, v47, v48, v49);
          [(NSMutableDictionary *)v37 setObject:v36 forKey:v38];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v73 count:16];
      }
      while (v33);
    }

    v39 = [MEMORY[0x1E4F74230] sharedConnection];
    [v39 registerObserver:v7];

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);
    objc_destroyWeak(v48);
    objc_destroyWeak(v47);
    objc_destroyWeak(v46);
    objc_destroyWeak(v45);
    objc_destroyWeak(v44);
    objc_destroyWeak(v43);
    objc_destroyWeak(&location);
  }
  kdebug_trace();

  return v7;
}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didAddPlaceholders:v3];
}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didCancelPlaceholders:v3];
}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didAddApplications:v3];
}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didReplaceApplications:v3];
}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didUpdateApplications:v3];
}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didRemoveApplications:v3];
}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didDemoteApplications:v3];
}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_8(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didChangeNetworkUsage:a2];
}

- (NSArray)placeholders
{
  return (NSArray *)[(NSMutableDictionary *)self->_placeholdersByBundleID allValues];
}

- (id)suspendCalloutsAssertionWithReason:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBApplicationLibraryObserver.m", 118, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = [NSString stringWithUTF8String:"-[SBApplicationLibraryObserver suspendCalloutsAssertionWithReason:]"];
    [v25 handleFailureInFunction:v26 file:@"SBApplicationLibraryObserver.m" lineNumber:119 description:@"this call must be made on the main thread"];
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__128;
  v43 = __Block_byref_object_dispose__128;
  id v44 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F4F690]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke;
  v35[3] = &unk_1E6AFA6F8;
  id v7 = v6;
  id v36 = v7;
  v37 = self;
  v38 = &v39;
  dispatch_queue_t v8 = (void *)MEMORY[0x1D948C7A0](v35);
  id v9 = objc_alloc(MEMORY[0x1E4F4F668]);
  uint64_t v10 = MEMORY[0x1E4F14428];
  id v11 = MEMORY[0x1E4F14428];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_31;
  v32[3] = &unk_1E6B0E240;
  uint64_t v34 = &v39;
  id v12 = v8;
  id v33 = v12;
  v13 = (void *)[v9 initWithInfo:0 timeout:v10 forResponseOnQueue:v32 withHandler:0.0];

  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  id v29 = __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_33;
  v30 = &unk_1E6AF5300;
  id v14 = v12;
  id v31 = v14;
  [v13 setInvalidationHandler:&v27];
  uint64_t v15 = [NSString stringWithFormat:@"%p: %@", v13, v5, v27, v28, v29, v30];
  v16 = (void *)v40[5];
  v40[5] = v15;

  id v17 = SBLogAppLibrary();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = v40[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v46 = v18;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "adding suspendCalloutsAssertion '%@'", buf, 0xCu);
  }

  suspendCalloutsAssertionReasons = self->_suspendCalloutsAssertionReasons;
  if (suspendCalloutsAssertionReasons)
  {
    [(NSMutableSet *)suspendCalloutsAssertionReasons addObject:v40[5]];
  }
  else
  {
    v20 = [MEMORY[0x1E4F1CA80] setWithObject:v40[5]];
    id v21 = self->_suspendCalloutsAssertionReasons;
    self->_suspendCalloutsAssertionReasons = v20;

    v22 = SBLogAppLibrary();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "suspending callouts", buf, 2u);
    }

    dispatch_suspend((dispatch_object_t)self->_mainQueueProxy);
  }

  _Block_object_dispose(&v39, 8);
  return v13;
}

void __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) signal]
    && [*(id *)(*(void *)(a1 + 40) + 24) containsObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
  {
    v2 = SBLogAppLibrary();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "removing suspendCalloutsAssertion '%@'", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    if (![*(id *)(*(void *)(a1 + 40) + 24) count])
    {
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = *(void **)(v4 + 24);
      *(void *)(v4 + 24) = 0;

      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 40) + 32));
      id v6 = SBLogAppLibrary();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "resuming callouts", (uint8_t *)&v7, 2u);
      }
    }
  }
}

void __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];
  uint64_t v5 = [v4 code];

  if (v5 != 5)
  {
    id v6 = SBLogAppLibrary();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_31_cold_1(a1, (uint64_t)v3, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_33(uint64_t a1)
{
}

- (void)addApplicationLifecycleObserver:(id)a3
{
}

- (void)removeApplicationLifecycleObserver:(id)a3
{
}

- (void)addPlaceholderLifecycleObserver:(id)a3
{
}

- (void)removePlaceholderLifecycleObserver:(id)a3
{
}

- (void)_addObserver:(id)a3 table:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (v6 && ([v5 containsObject:v6] & 1) == 0) {
    [v5 addObject:v6];
  }
}

- (void)_removeObserver:(id)a3 table:(id)a4
{
  if (a3) {
    objc_msgSend(a4, "removeObject:");
  }
}

- (void)_waitForLaunchImageGenerationForApplications:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_1D85BA000, "XBCapture", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  id v6 = objc_alloc_init(MEMORY[0x1E4FA58C8]);
  [v6 setContentTypeMask:2];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4FA58C0]) initWithApplicationInfo:*(void *)(*((void *)&v18 + 1) + 8 * v10)];
        [v11 deleteSnapshotsMatchingPredicate:v6];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  splashBoardController = self->_splashBoardController;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__SBApplicationLibraryObserver__waitForLaunchImageGenerationForApplications___block_invoke;
  v16[3] = &unk_1E6AF4AC0;
  id v14 = v12;
  id v17 = v14;
  [(XBApplicationController *)splashBoardController captureOrUpdateLaunchImagesForApplications:v7 firstImageIsReady:v16 completion:0];
  dispatch_time_t v15 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v14, v15);

  os_activity_scope_leave(&state);
}

intptr_t __77__SBApplicationLibraryObserver__waitForLaunchImageGenerationForApplications___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_didAddPlaceholders:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    mainQueueProxy = self->_mainQueueProxy;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__SBApplicationLibraryObserver__didAddPlaceholders___block_invoke;
    v6[3] = &unk_1E6AF5290;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_sync(mainQueueProxy, v6);
  }
}

void __52__SBApplicationLibraryObserver__didAddPlaceholders___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 40);
        uint64_t v9 = [v7 bundleIdentifier];
        [v8 setObject:v7 forKey:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *(id *)(*(void *)(a1 + 40) + 56);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * j), "applicationPlaceholdersAdded:", *(void *)(a1 + 32), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)_didCancelPlaceholders:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    mainQueueProxy = self->_mainQueueProxy;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__SBApplicationLibraryObserver__didCancelPlaceholders___block_invoke;
    v6[3] = &unk_1E6AF5290;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_sync(mainQueueProxy, v6);
  }
}

void __55__SBApplicationLibraryObserver__didCancelPlaceholders___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*(void *)(a1 + 40) + 40);
        uint64_t v8 = [*(id *)(*((void *)&v18 + 1) + 8 * v6) bundleIdentifier];
        [v7 removeObjectForKey:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 40) + 56);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "applicationPlaceholdersCancelled:", *(void *)(a1 + 32), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)_didAddApplications:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  mainQueueProxy = self->_mainQueueProxy;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __52__SBApplicationLibraryObserver__didAddApplications___block_invoke;
  uint64_t v12 = &unk_1E6AF5290;
  id v6 = v4;
  id v13 = v6;
  long long v14 = self;
  dispatch_sync(mainQueueProxy, &v9);
  id v7 = XBLogFileManifest();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend(v6, "bs_map:", &__block_literal_global_407, v9, v10, v11, v12);
    *(_DWORD *)buf = 138543362;
    long long v16 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Applications were added. Updating launch images for: %{public}@", buf, 0xCu);
  }
  [(SBApplicationLibraryObserver *)self _waitForLaunchImageGenerationForApplications:v6];
}

void __52__SBApplicationLibraryObserver__didAddApplications___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        id v7 = [v11 bundleIdentifier];

        uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v7];
        if (v12)
        {
          [v3 addObject:v12];
          [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:v7];
        }
        else
        {
          [v2 addObject:v11];
        }

        ++v9;
        uint64_t v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }
  id v13 = (void *)MEMORY[0x1E4F624D8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__SBApplicationLibraryObserver__didAddApplications___block_invoke_2;
  v19[3] = &unk_1E6AF4E00;
  uint64_t v14 = *(void *)(a1 + 40);
  id v20 = v3;
  uint64_t v21 = v14;
  id v22 = v2;
  id v15 = v2;
  id v16 = v3;
  uint64_t v17 = [v13 eventWithName:@"Applications Added" handler:v19];
  long long v18 = [MEMORY[0x1E4F624E0] sharedInstance];
  [v18 executeOrAppendEvent:v17];
}

void __52__SBApplicationLibraryObserver__didAddApplications___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 56);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v17;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v6++) applicationPlaceholdersInstalled:*(void *)(a1 + 32)];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v4);
    }
  }
  if ([*(id *)(a1 + 48) count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 40) + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "applicationsAdded:", *(void *)(a1 + 48), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

uint64_t __52__SBApplicationLibraryObserver__didAddApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)_didReplaceApplications:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectEnumerator];
  uint64_t v5 = [v4 allObjects];

  mainQueueProxy = self->_mainQueueProxy;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke;
  long long v13 = &unk_1E6AF5290;
  id v7 = v5;
  id v14 = v7;
  long long v15 = self;
  dispatch_sync(mainQueueProxy, &v10);
  if (objc_msgSend(v7, "count", v10, v11, v12, v13))
  {
    uint64_t v8 = XBLogFileManifest();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_msgSend(v7, "bs_map:", &__block_literal_global_51_2);
      *(_DWORD *)buf = 138543362;
      long long v17 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Applications were replaced. Updating launch images for: %{public}@", buf, 0xCu);
    }
    [(SBApplicationLibraryObserver *)self _waitForLaunchImageGenerationForApplications:v7];
  }
}

void __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        id v7 = [v11 bundleIdentifier];

        long long v12 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v7];
        if (v12)
        {
          [v3 addObject:v12];
          [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:v7];
        }
        else
        {
          [v2 addObject:v11];
        }

        ++v9;
        uint64_t v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }
  long long v13 = (void *)MEMORY[0x1E4F624D8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke_2;
  v19[3] = &unk_1E6AF4E00;
  uint64_t v14 = *(void *)(a1 + 40);
  id v20 = v3;
  uint64_t v21 = v14;
  id v22 = v2;
  id v15 = v2;
  id v16 = v3;
  long long v17 = [v13 eventWithName:@"Applications Updated" handler:v19];
  uint64_t v18 = [MEMORY[0x1E4F624E0] sharedInstance];
  [v18 executeOrAppendEvent:v17];
}

void __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 56);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v17;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v6++) applicationPlaceholdersInstalled:*(void *)(a1 + 32)];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v4);
    }
  }
  if ([*(id *)(a1 + 48) count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 40) + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "applicationsReplaced:", *(void *)(a1 + 48), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

uint64_t __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)_didUpdateApplications:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SBApplicationLibraryObserver__didUpdateApplications___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __55__SBApplicationLibraryObserver__didUpdateApplications___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectEnumerator];
  uint64_t v3 = [v2 allObjects];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 40) + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "applicationsUpdated:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_appBundleIDsForApplications:(id)a3
{
  return (id)objc_msgSend(a3, "bs_map:", &__block_literal_global_53_2);
}

uint64_t __61__SBApplicationLibraryObserver__appBundleIDsForApplications___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)_didRemoveApplications:(id)a3
{
  id v4 = a3;
  mainQueueProxy = self->_mainQueueProxy;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SBApplicationLibraryObserver__didRemoveApplications___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_sync(mainQueueProxy, v7);
}

void __55__SBApplicationLibraryObserver__didRemoveApplications___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F624D8];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __55__SBApplicationLibraryObserver__didRemoveApplications___block_invoke_2;
  uint64_t v14 = &unk_1E6AF5290;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v15 = v3;
  uint64_t v16 = v4;
  uint64_t v5 = [v2 eventWithName:@"Applications Removed" handler:&v11];
  id v6 = [MEMORY[0x1E4F624E0] sharedInstance];
  [v6 executeOrAppendEvent:v5];

  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  uint64_t v7 = _os_activity_create(&dword_1D85BA000, "XBInvalidate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &v10);

  id v8 = XBLogFileManifest();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = objc_msgSend(*(id *)(a1 + 40), "_appBundleIDsForApplications:", *(void *)(a1 + 32), v10.opaque[0], v10.opaque[1], v11, v12, v13, v14);
    *(_DWORD *)buf = 138543362;
    long long v18 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary removed applications. Removing launch images for %{public}@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 8) removeCachedLaunchImagesForApplications:*(void *)(a1 + 32) forgettingApps:1];
  os_activity_scope_leave(&v10);
}

void __55__SBApplicationLibraryObserver__didRemoveApplications___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 48);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "applicationsRemoved:", *(void *)(a1 + 32), (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (void)_didDemoteApplications:(id)a3
{
  id v4 = a3;
  mainQueueProxy = self->_mainQueueProxy;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SBApplicationLibraryObserver__didDemoteApplications___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_sync(mainQueueProxy, v7);
}

void __55__SBApplicationLibraryObserver__didDemoteApplications___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F624D8];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __55__SBApplicationLibraryObserver__didDemoteApplications___block_invoke_2;
  uint64_t v14 = &unk_1E6AF5290;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v15 = v3;
  uint64_t v16 = v4;
  uint64_t v5 = [v2 eventWithName:@"Applications Demoted" handler:&v11];
  id v6 = [MEMORY[0x1E4F624E0] sharedInstance];
  [v6 executeOrAppendEvent:v5];

  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  long long v7 = _os_activity_create(&dword_1D85BA000, "XBInvalidate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &v10);

  id v8 = XBLogFileManifest();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = objc_msgSend(*(id *)(a1 + 40), "_appBundleIDsForApplications:", *(void *)(a1 + 32), v10.opaque[0], v10.opaque[1], v11, v12, v13, v14);
    *(_DWORD *)buf = 138543362;
    long long v18 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary demoted applications. Removing launch images for %{public}@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 8) removeCachedLaunchImagesForApplications:*(void *)(a1 + 32) forgettingApps:1];
  os_activity_scope_leave(&v10);
}

void __55__SBApplicationLibraryObserver__didDemoteApplications___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 48);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "applicationsDemoted:", *(void *)(a1 + 32), (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (void)_didChangeNetworkUsage:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__SBApplicationLibraryObserver__didChangeNetworkUsage___block_invoke;
  v3[3] = &unk_1E6AF5D38;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __55__SBApplicationLibraryObserver__didChangeNetworkUsage___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "applicationPlaceholdersNetworkUsageChanged:", *(unsigned __int8 *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  mainQueueProxy = self->_mainQueueProxy;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__SBApplicationLibraryObserver_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(mainQueueProxy, block);
}

void __105__SBApplicationLibraryObserver_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogAppLibrary();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "restriction update: profile change", buf, 2u);
  }

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "applicationRestrictionsMayHaveChanged", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  mainQueueProxy = self->_mainQueueProxy;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__SBApplicationLibraryObserver_profileConnectionDidReceiveProfileListChangedNotification_userInfo___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(mainQueueProxy, block);
}

void __99__SBApplicationLibraryObserver_profileConnectionDidReceiveProfileListChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogAppLibrary();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "visibility update: profile change", buf, 2u);
  }

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "applicationVisibilityMayHaveChanged", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderObservers, 0);
  objc_storeStrong((id *)&self->_applicationObservers, 0);
  objc_storeStrong((id *)&self->_placeholdersByBundleID, 0);
  objc_storeStrong((id *)&self->_mainQueueProxy, 0);
  objc_storeStrong((id *)&self->_suspendCalloutsAssertionReasons, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_splashBoardController, 0);
}

void __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_31_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "unexpected response from suspendCalloutsAssertion '%@' : %@", (uint8_t *)&v4, 0x16u);
}

@end