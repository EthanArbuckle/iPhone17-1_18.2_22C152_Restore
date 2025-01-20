@interface SBApplicationController
+ (SBApplicationController)sharedInstance;
+ (id)_sharedInstanceCreateIfNecessary:(BOOL)a3;
+ (id)sharedInstanceIfExists;
+ (void)_setClearAllLegacySnapshotsWhenLoaded:(BOOL)a3;
+ (void)_setClearSystemAppSnapshotsWhenLoaded:(BOOL)a3;
- (BOOL)_appLayoutContainsOnlyResizableApps:(id)a3;
- (Class)_appClassForInfo:(id)a3;
- (SBApplicationController)init;
- (id)_allApplicationsFilteredBySystem:(BOOL)a3;
- (id)_appInfosToBundleIDs:(id)a3;
- (id)_appLibrary;
- (id)_appLibraryObserver;
- (id)_appProtectionCoordinator;
- (id)_applicationRestrictionMonitoringServer;
- (id)_loadApplicationFromApplicationInfo:(id)a3;
- (id)_lock_applicationWithBundleIdentifier:(id)a3;
- (id)_splashBoardController;
- (id)allApplications;
- (id)allBundleIdentifiers;
- (id)allInstalledApplications;
- (id)allSplashBoardApplications;
- (id)alwaysAvailableApplicationBundleIdentifiers;
- (id)applicationForDisplayItem:(id)a3;
- (id)applicationWithBundleIdentifier:(id)a3;
- (id)applicationWithPid:(int)a3;
- (id)bundleIdentifiersWithVisibilityOverrideHidden;
- (id)cameraApplication;
- (id)clockApplication;
- (id)dataActivationApplication;
- (id)faceTimeApp;
- (id)iPodOutApplication;
- (id)inCallServiceApp;
- (id)loginApplication;
- (id)mapsApplication;
- (id)mobilePhone;
- (id)musicApplication;
- (id)notesApplication;
- (id)recentlyUsedBundleIDs;
- (id)restrictionController;
- (id)runningApplications;
- (id)setupApplication;
- (id)splashBoardSystemApplications;
- (id)testFlightApplication;
- (id)webApplication;
- (void)_finishDeferredMajorVersionMigrationTasks_FlushLegacySnapshots;
- (void)_finishDeferredMajorVersionMigrationTasks_FlushSystemSnapshots;
- (void)_loadApplications:(id)a3 remove:(id)a4;
- (void)_memoryWarningReceived;
- (void)_removeApplicationsFromModelWithBundleIdentifier:(id)a3 forInstall:(BOOL)a4 withReason:(id)a5;
- (void)_sendInstalledAppsDidChangeNotification:(id)a3 removed:(id)a4 replaced:(id)a5 updated:(id)a6;
- (void)_updateVisibilityOverrides;
- (void)_updateVisibilityOverridesInBackground;
- (void)applicationRestrictionsMayHaveChanged;
- (void)applicationsAdded:(id)a3;
- (void)applicationsDemoted:(id)a3;
- (void)applicationsRemoved:(id)a3;
- (void)applicationsReplaced:(id)a3;
- (void)applicationsUpdated:(id)a3;
- (void)dealloc;
- (void)requestUninstallApplication:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)requestUninstallApplicationWithBundleIdentifier:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)uninstallApplication:(id)a3;
- (void)waitForUninstallsToComplete:(double)a3;
@end

@implementation SBApplicationController

- (id)runningApplications
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(SBApplicationController *)self allApplications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 processState];
        int v11 = [v10 isRunning];

        if (v11) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allApplications
{
  p_applicationsLock = &self->_applicationsLock;
  os_unfair_lock_lock(&self->_applicationsLock);
  v4 = [(NSMutableDictionary *)self->_applicationsByBundleIdentifier allValues];
  os_unfair_lock_unlock(p_applicationsLock);
  return v4;
}

+ (id)_sharedInstanceCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || _sharedInstanceCreateIfNecessary__sharedApplicationController)
  {
    pthread_mutex_lock(&_sharedInstanceCreateIfNecessary__sharedApplicationControllerLock);
    if (_sharedInstanceCreateIfNecessary__sharedApplicationController) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = !v3;
    }
    if (!v5)
    {
      kdebug_trace();
      uint64_t v6 = objc_alloc_init(SBApplicationController);
      uint64_t v7 = (void *)_sharedInstanceCreateIfNecessary__sharedApplicationController;
      _sharedInstanceCreateIfNecessary__sharedApplicationController = (uint64_t)v6;

      kdebug_trace();
    }
    pthread_mutex_unlock(&_sharedInstanceCreateIfNecessary__sharedApplicationControllerLock);
    id v4 = (id)_sharedInstanceCreateIfNecessary__sharedApplicationController;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (SBApplicationController)sharedInstance
{
  return (SBApplicationController *)[a1 _sharedInstanceCreateIfNecessary:1];
}

- (id)applicationForDisplayItem:(id)a3
{
  id v4 = a3;
  if ([v4 type] && objc_msgSend(v4, "type") != 3)
  {
    if ([v4 type] == 5)
    {
      uint64_t v6 = [(SBApplicationController *)self webApplication];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    BOOL v5 = [v4 bundleIdentifier];
    uint64_t v6 = [(SBApplicationController *)self applicationWithBundleIdentifier:v5];
  }
  return v6;
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  p_applicationsLock = &self->_applicationsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_applicationsLock);
  uint64_t v6 = [(SBApplicationController *)self _lock_applicationWithBundleIdentifier:v5];

  os_unfair_lock_unlock(p_applicationsLock);
  return v6;
}

- (id)_lock_applicationWithBundleIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_applicationsByBundleIdentifier objectForKey:a3];
}

+ (id)sharedInstanceIfExists
{
  return (id)[a1 _sharedInstanceCreateIfNecessary:0];
}

- (id)applicationWithPid:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 < 1)
  {
    v9 = 0;
  }
  else
  {
    uint64_t v3 = *(void *)&a3;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(SBApplicationController *)self runningApplications];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      SEL v18 = a2;
      v9 = 0;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v13 = [v12 processState];
          int v14 = [v13 pid];

          if (v14 == v3)
          {
            if (v9)
            {
              long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
              [v16 handleFailureInMethod:v18, self, @"SBApplicationController.m", 332, @"shouldn't ever have two apps with the same pid %d: app1=%@ app2=%@", v3, v9, v12 object file lineNumber description];
            }
            id v15 = v12;

            v9 = v15;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

- (BOOL)_appLayoutContainsOnlyResizableApps:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SBApplicationController__appLayoutContainsOnlyResizableApps___block_invoke;
  v6[3] = &unk_1E6AFB4A0;
  v6[4] = &v7;
  [v3 enumerate:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)setupApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.purplebuddy"];
}

void __63__SBApplicationController__appLayoutContainsOnlyResizableApps___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = +[SBApplicationController sharedInstance];
    uint64_t v8 = [v6 bundleIdentifier];

    int v11 = [v7 applicationWithBundleIdentifier:v8];

    uint64_t v9 = v11;
    if (v11)
    {
      char v10 = [v11 supportsChamoisViewResizing];
      uint64_t v9 = v11;
      if ((v10 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        *a4 = 1;
      }
    }
  }
}

void __65__SBApplicationController__updateVisibilityOverridesInBackground__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(a1 + 32) objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        v5 |= [v8 update];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);

    if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__SBApplicationController__updateVisibilityOverridesInBackground__block_invoke_2;
      block[3] = &unk_1E6AF4AC0;
      block[4] = *(void *)(a1 + 40);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
  }
}

- (id)_applicationRestrictionMonitoringServer
{
  return self->_restrictionMonitoringServer;
}

- (id)restrictionController
{
  return self->_restrictionController;
}

- (id)_appProtectionCoordinator
{
  return self->_appProtectionCoordinator;
}

- (id)dataActivationApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.DataActivation"];
}

- (id)cameraApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.camera"];
}

- (void)_updateVisibilityOverridesInBackground
{
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_systemAppsVisibilityOverrides copy];
  uint64_t v4 = dispatch_get_global_queue(25, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBApplicationController__updateVisibilityOverridesInBackground__block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v3;
  uint64_t v8 = self;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (SBApplicationController)init
{
  v51.receiver = self;
  v51.super_class = (Class)SBApplicationController;
  id v2 = [(SBApplicationController *)&v51 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_applicationsLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applicationsByBundleIdentifier = v3->_applicationsByBundleIdentifier;
    v3->_applicationsByBundleIdentifier = v4;

    uint64_t v6 = [[SBApplicationRestrictionController alloc] initWithDataSource:v3];
    restrictionController = v3->_restrictionController;
    v3->_restrictionController = v6;

    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    systemAppsVisibilityOverrides = v3->_systemAppsVisibilityOverrides;
    v3->_systemAppsVisibilityOverrides = v8;

    long long v10 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    preventLaunchBundleIDs = v3->_preventLaunchBundleIDs;
    v3->_preventLaunchBundleIDs = v10;

    long long v12 = objc_alloc_init(SBReverseCountedSemaphore);
    uninstallationReverseSemaphore = v3->_uninstallationReverseSemaphore;
    v3->_uninstallationReverseSemaphore = v12;

    int v14 = (void *)MEMORY[0x1E4F96418];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __31__SBApplicationController_init__block_invoke;
    v49[3] = &unk_1E6AF9058;
    uint64_t v15 = v3;
    v50 = v15;
    uint64_t v16 = [v14 monitorWithConfiguration:v49];
    processMonitor = v15->_processMonitor;
    v15->_processMonitor = (RBSProcessMonitor *)v16;

    SEL v18 = (void *)MEMORY[0x1E4F628D8];
    long long v19 = +[SBApplication _appStateKeysToPrefetch];
    [v18 setPrefetchedKeys:v19];

    id v20 = objc_alloc_init(MEMORY[0x1E4F628F0]);
    [v20 setApplicationInfoClass:objc_opt_class()];
    [v20 setApplicationPlaceholderClass:objc_opt_class()];
    [v20 setAllowConcurrentLoading:1];
    char v21 = [MEMORY[0x1E4F73138] inUserSessionLoginUI];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __31__SBApplicationController_init__block_invoke_41;
    v47[3] = &__block_descriptor_33_e28_B16__0__LSApplicationProxy_8l;
    char v48 = v21;
    [v20 setInstalledApplicationFilter:v47];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F628E8]) initWithConfiguration:v20];
    appLibrary = v15->_appLibrary;
    v15->_appLibrary = (FBSApplicationLibrary *)v22;

    uint64_t v24 = v15->_appLibrary;
    v25 = FBSystemAppBundleID();
    uint64_t v26 = [(FBSApplicationLibrary *)v24 installedApplicationWithBundleIdentifier:v25];
    systemAppInfo = v15->_systemAppInfo;
    v15->_systemAppInfo = (SBApplicationInfo *)v26;

    v28 = [MEMORY[0x1E4F62420] mainConfiguration];
    v29 = [SBSplashBoardController alloc];
    v30 = [[SBSplashBoardLaunchRequestProvider alloc] initWithApplicationController:v15 displayConfiguration:v28];
    uint64_t v31 = [(XBApplicationController *)v29 initWithMainDisplayConfiguration:v28 applicationProvider:v15 launchRequestProvider:v30];
    splashBoardController = v15->_splashBoardController;
    v15->_splashBoardController = (SBSplashBoardController *)v31;

    v33 = [[SBApplicationLibraryObserver alloc] initWithAppLibrary:v15->_appLibrary splashBoardController:v15->_splashBoardController];
    appLibraryObserver = v15->_appLibraryObserver;
    v15->_appLibraryObserver = v33;

    [(SBApplicationLibraryObserver *)v15->_appLibraryObserver addApplicationLifecycleObserver:v15];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v15, (CFNotificationCallback)_appIconVisibilityPreferencesChanged, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    kdebug_trace();
    v36 = [(FBSApplicationLibrary *)v15->_appLibrary allInstalledApplications];
    [(SBApplicationController *)v15 _loadApplications:v36 remove:0];

    kdebug_trace();
    v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v15 selector:sel__memoryWarningReceived name:*MEMORY[0x1E4F43670] object:0];
    if (__SBShouldClearSystemAppSnapshotsWhenInitialized) {
      [(SBApplicationController *)v15 _finishDeferredMajorVersionMigrationTasks_FlushSystemSnapshots];
    }
    if (__SBShouldClearAllLegacySnapshotsWhenInitialized) {
      [(SBApplicationController *)v15 _finishDeferredMajorVersionMigrationTasks_FlushLegacySnapshots];
    }
    v38 = [MEMORY[0x1E4FA5F80] sharedInstance];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __31__SBApplicationController_init__block_invoke_2_53;
    v45[3] = &unk_1E6AF4AC0;
    v39 = v15;
    v46 = v39;
    [v38 performAfterFirstUnlockSinceBootUsingBlock:v45];

    v40 = objc_alloc_init(SBAppProtectionCoordinator);
    appProtectionCoordinator = v39->_appProtectionCoordinator;
    v39->_appProtectionCoordinator = v40;

    uint64_t v42 = objc_opt_new();
    restrictionMonitoringServer = v39->_restrictionMonitoringServer;
    v39->_restrictionMonitoringServer = (SBApplicationRestrictionMonitoringServer *)v42;

    [(SBApplicationRestrictionController *)v3->_restrictionController addObserver:v39->_restrictionMonitoringServer];
  }
  return v3;
}

void __31__SBApplicationController_init__block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setEvents:2];
  uint64_t v4 = [MEMORY[0x1E4F96430] predicateMatchingProcessTypeApplication];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v3 setPredicates:v5];

  [v3 setServiceClass:33];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__SBApplicationController_init__block_invoke_2;
  v6[3] = &unk_1E6AFD4D0;
  id v7 = *(id *)(a1 + 32);
  [v3 setPreventLaunchUpdateHandle:v6];
}

void __31__SBApplicationController_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__SBApplicationController_init__block_invoke_3;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __31__SBApplicationController_init__block_invoke_3(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v9 = [v8 bundleIdentifier];

        if (v9)
        {
          long long v10 = [v8 bundleIdentifier];
          [v2 addObject:v10];
        }
        else
        {
          long long v10 = [v8 processIdentity];
          long long v11 = [v10 embeddedApplicationIdentifier];

          if (v11)
          {
            long long v12 = [v10 embeddedApplicationIdentifier];
            [v2 addObject:v12];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v5);
  }

  long long v13 = (void *)[v2 mutableCopy];
  [v13 minusSet:*(void *)(*(void *)(a1 + 40) + 96)];
  v32 = (void *)[*(id *)(*(void *)(a1 + 40) + 96) mutableCopy];
  [v32 minusSet:v2];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 96), v2);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        long long v19 = [*(id *)(a1 + 40) applicationWithBundleIdentifier:v18];
        id v20 = SBLogCommon();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v21)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v18;
            _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "termination assertion acquired for %{public}@", buf, 0xCu);
          }

          [v19 _setLaunchPrevented:1];
        }
        else
        {
          if (v21)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v18;
            _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "termination assertion acquired for %{public}@ (app not found)", buf, 0xCu);
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v15);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = v32;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * k);
        v28 = [*(id *)(a1 + 40) applicationWithBundleIdentifier:v27];
        v29 = SBLogCommon();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v30)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v27;
            _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "termination assertion released for %{public}@", buf, 0xCu);
          }

          [v28 _setLaunchPrevented:0];
        }
        else
        {
          if (v30)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v27;
            _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "termination assertion released for %{public}@ (app not found)", buf, 0xCu);
          }
        }
        uint64_t v31 = [(id)SBApp applicationAutoLaunchService];
        [v31 _noteTerminationAssertionRemovedForApplication:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v24);
  }
}

uint64_t __31__SBApplicationController_init__block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(unsigned char *)(a1 + 32))
  {
    uint64_t v5 = [v3 correspondingApplicationRecord];
    id v7 = [v5 managementDomain];
    id v8 = v7;
    uint64_t v6 = !v7 || [v7 isEqualToString:*MEMORY[0x1E4F22328]];
    goto LABEL_9;
  }
  uint64_t v5 = [v3 bundleIdentifier];
  if (([v5 isEqualToString:@"com.apple.LoginUI"] & 1) == 0)
  {
    id v8 = [v4 bundleIdentifier];
    uint64_t v9 = FBSystemAppBundleID();
    uint64_t v6 = [v8 isEqualToString:v9];

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v6 = 1;
LABEL_10:

  return v6;
}

void __31__SBApplicationController_init__block_invoke_2_53(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SBApplicationController_init__block_invoke_3_54;
  block[3] = &unk_1E6AF4AC0;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __31__SBApplicationController_init__block_invoke_3_54(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisibilityOverridesInBackground];
}

- (void)dealloc
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"SBApplicationController.m", 285, @"%@ does not dealloc", objc_opt_class() object file lineNumber description];

  v5.receiver = self;
  v5.super_class = (Class)SBApplicationController;
  [(SBApplicationController *)&v5 dealloc];
}

- (id)allBundleIdentifiers
{
  p_applicationsLocuint64_t k = &self->_applicationsLock;
  os_unfair_lock_lock(&self->_applicationsLock);
  id v4 = [(NSMutableDictionary *)self->_applicationsByBundleIdentifier allKeys];
  os_unfair_lock_unlock(p_applicationsLock);
  return v4;
}

- (void)uninstallApplication:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 bundleIdentifier];
  objc_super v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v10 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Uninstall application: %{public}@", buf, 0xCu);
  }

  [(SBApplicationController *)self _removeApplicationsFromModelWithBundleIdentifier:v4 forInstall:0 withReason:@"User Requested"];
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [(SBApplicationController *)self _sendInstalledAppsDidChangeNotification:0 removed:v6 replaced:0 updated:0];

  [(SBReverseCountedSemaphore *)self->_uninstallationReverseSemaphore increment];
  appLibrary = self->_appLibrary;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __48__SBApplicationController_uninstallApplication___block_invoke;
  v8[3] = &unk_1E6AF5350;
  v8[4] = self;
  [(FBSApplicationLibrary *)appLibrary uninstallApplication:v4 completion:v8];
}

uint64_t __48__SBApplicationController_uninstallApplication___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) decrement];
}

- (void)requestUninstallApplication:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = [a3 bundleIdentifier];
  [(SBApplicationController *)self requestUninstallApplicationWithBundleIdentifier:v9 options:a4 withCompletion:v8];
}

- (void)requestUninstallApplicationWithBundleIdentifier:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  appLibraryObserver = self->_appLibraryObserver;
  uint64_t v11 = [NSString stringWithFormat:@"requesting uninstall of %@", v8];
  long long v12 = [(SBApplicationLibraryObserver *)appLibraryObserver suspendCalloutsAssertionWithReason:v11];

  id v13 = objc_alloc_init(MEMORY[0x1E4F628F8]);
  [v13 setUserInitiated:1];
  if (v6) {
    [v13 setShowsArchiveOption:1];
  }
  appLibrary = self->_appLibrary;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__SBApplicationController_requestUninstallApplicationWithBundleIdentifier_options_withCompletion___block_invoke;
  v17[3] = &unk_1E6AF5E98;
  id v18 = v12;
  id v19 = v9;
  id v15 = v12;
  id v16 = v9;
  [(FBSApplicationLibrary *)appLibrary uninstallApplication:v8 withOptions:v13 completion:v17];
}

void __98__SBApplicationController_requestUninstallApplicationWithBundleIdentifier_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__SBApplicationController_requestUninstallApplicationWithBundleIdentifier_options_withCompletion___block_invoke_2;
  block[3] = &unk_1E6AFCAC8;
  id v6 = v3;
  id v8 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __98__SBApplicationController_requestUninstallApplicationWithBundleIdentifier_options_withCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 userInfo];
    id v10 = [v3 objectForKey:*MEMORY[0x1E4F28A50]];

    id v4 = [v10 domain];
    if ([v4 isEqualToString:*MEMORY[0x1E4F62548]]) {
      BOOL v5 = [v10 code] == 4;
    }
    else {
      BOOL v5 = 0;
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void, BOOL, void))(v8 + 16))(v8, 0, v5, 0);
    }
    [*(id *)(a1 + 40) invalidate];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
    else
    {
      id v9 = *(void **)(a1 + 40);
      [v9 invalidate];
    }
  }
}

- (void)waitForUninstallsToComplete:(double)a3
{
  if (![(SBReverseCountedSemaphore *)self->_uninstallationReverseSemaphore waitWithTimeout:a3])
  {
    id v3 = SBLogAppLibrary();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationController waitForUninstallsToComplete:](v3);
    }
  }
}

- (id)alwaysAvailableApplicationBundleIdentifiers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(SBApplicationController *)self allApplications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v9 isInternalApplication] & 1) != 0
          || [v9 isSystemApplication])
        {
          id v10 = [v9 info];
          if ([v10 hasHiddenTag])
          {
          }
          else
          {
            int v11 = [v9 isSetup];

            if (!v11) {
              continue;
            }
          }
          long long v12 = [v9 bundleIdentifier];
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  id v13 = (void *)[v3 copy];
  return v13;
}

- (id)musicApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.Music"];
}

- (id)mobilePhone
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.mobilephone"];
}

- (id)faceTimeApp
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.facetime"];
}

- (id)inCallServiceApp
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.InCallService"];
}

- (id)clockApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.mobiletimer"];
}

- (id)iPodOutApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.iphoneos.iPodOut"];
}

- (id)mapsApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.Maps"];
}

- (id)webApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.webapp"];
}

- (id)loginApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.LoginUI"];
}

- (id)testFlightApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.TestFlight"];
}

- (id)notesApplication
{
  return [(SBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.mobilenotes"];
}

- (id)allSplashBoardApplications
{
  return [(SBApplicationController *)self _allApplicationsFilteredBySystem:0];
}

- (id)splashBoardSystemApplications
{
  return [(SBApplicationController *)self _allApplicationsFilteredBySystem:1];
}

- (id)allInstalledApplications
{
  return (id)[(FBSApplicationLibrary *)self->_appLibrary allInstalledApplications];
}

- (id)_allApplicationsFilteredBySystem:(BOOL)a3
{
  id v4 = [(FBSApplicationLibrary *)self->_appLibrary allInstalledApplications];
  if ([v4 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __60__SBApplicationController__allApplicationsFilteredBySystem___block_invoke;
    v8[3] = &__block_descriptor_33_e34_B32__0__SBApplicationInfo_8Q16_B24l;
    BOOL v9 = a3;
    uint64_t v5 = [v4 indexesOfObjectsPassingTest:v8];
    uint64_t v6 = [v4 objectsAtIndexes:v5];

    id v4 = (void *)v6;
  }
  return v4;
}

uint64_t __60__SBApplicationController__allApplicationsFilteredBySystem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 32) && [v3 type] != 1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v4 usesSplashBoard];
  }

  return v5;
}

- (id)recentlyUsedBundleIDs
{
  dispatch_time_t v2 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  id v3 = [v2 recentAppLayouts];

  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SBApplicationController_recentlyUsedBundleIDs__block_invoke;
  v7[3] = &unk_1E6AFD538;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __48__SBApplicationController_recentlyUsedBundleIDs__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__SBApplicationController_recentlyUsedBundleIDs__block_invoke_2;
  v3[3] = &unk_1E6AF9EF0;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerate:v3];
}

void __48__SBApplicationController_recentlyUsedBundleIDs__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (![v6 type])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 bundleIdentifier];
    [v4 addObject:v5];
  }
}

- (id)_splashBoardController
{
  return self->_splashBoardController;
}

- (id)_appLibrary
{
  return self->_appLibrary;
}

- (id)_appLibraryObserver
{
  return self->_appLibraryObserver;
}

+ (void)_setClearSystemAppSnapshotsWhenLoaded:(BOOL)a3
{
  __SBShouldClearSystemAppSnapshotsWhenInitialized = a3;
}

+ (void)_setClearAllLegacySnapshotsWhenLoaded:(BOOL)a3
{
  __SBShouldClearAllLegacySnapshotsWhenInitialized = a3;
}

- (void)_finishDeferredMajorVersionMigrationTasks_FlushSystemSnapshots
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v3 = _os_activity_create(&dword_1D85BA000, "XBMigration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(SBApplicationController *)self allApplications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 isSystemApplication] & 1) != 0
          || [v8 isInternalApplication])
        {
          [v8 flushSnapshotsForAllScenes];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  os_activity_scope_leave(&state);
}

- (void)_finishDeferredMajorVersionMigrationTasks_FlushLegacySnapshots
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v3 = _os_activity_create(&dword_1D85BA000, "XBMigration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = [(SBApplicationController *)self allApplications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) flushSnapshotsForAllScenesIncludingAllLegacyImages];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }

  os_activity_scope_leave(&state);
}

- (void)_memoryWarningReceived
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  dispatch_time_t v2 = [(SBApplicationController *)self allApplications];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) purgeCaches];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_sendInstalledAppsDidChangeNotification:(id)a3 removed:(id)a4 replaced:(id)a5 updated:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v10 && [v10 count]) {
    [v14 setObject:v10 forKey:@"SBInstalledApplicationsAddedBundleIDs"];
  }
  if (v12 && [v12 count]) {
    [v14 setObject:v12 forKey:@"SBInstalledApplicationsReplacedBundleIDs"];
  }
  if (v13 && [v13 count]) {
    [v14 setObject:v13 forKey:@"SBInstalledApplicationsUpdatedBundleIDs"];
  }
  if (v11 && [v11 count]) {
    [v14 setObject:v11 forKey:@"SBInstalledApplicationsRemovedBundleIDs"];
  }
  uint64_t v15 = [v14 allKeys];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    [(SBApplicationRestrictionController *)self->_restrictionController noteApplicationIdentifiersDidChangeWithAdded:v10 replaced:v12 removed:v11];
    long long v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 postNotificationName:@"SBInstalledApplicationsDidChangeNotification" object:self userInfo:v14];

    long long v18 = SBLogAppLibrary();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v20 = 138544130;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v11;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2114;
      id v27 = v13;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "Installed apps did change.\nAdded: %{public}@\nRemoved: %{public}@\nReplaced: %{public}@\nUpdated: %{public}@", (uint8_t *)&v20, 0x2Au);
    }

    id v19 = SBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138544130;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v11;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2114;
      id v27 = v13;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Installed apps did change.\nAdded: %{public}@\nRemoved: %{public}@\nReplaced: %{public}@\nUpdated: %{public}@", (uint8_t *)&v20, 0x2Au);
    }
  }
}

- (Class)_appClassForInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bundleIdentifier];
  if ([v3 type] == 1 && (objc_msgSend(v4, "isEqualToString:", @"com.apple.camera") & 1) == 0) {
    [v3 representsWebApplication];
  }
  uint64_t v5 = (objc_class *)(id)objc_opt_class();

  return v5;
}

- (id)_loadApplicationFromApplicationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(_SBLoadApplicationResult);
  uint64_t v6 = [v4 bundleIdentifier];
  long long v7 = [v4 bundleURL];
  long long v8 = [v4 bundleURL];
  long long v9 = [v8 path];

  id v10 = [v4 dataContainerURL];
  id v11 = [v10 path];

  uint64_t v12 = [(SBApplicationController *)self applicationWithBundleIdentifier:v6];
  id v13 = (void *)v12;
  if (v5) {
    v5->_update = v12 != 0;
  }
  if (v6)
  {
    id v14 = [v9 pathExtension];
    int v15 = [v14 isEqualToString:@"app"];

    if (v15)
    {
      uint64_t v16 = objc_msgSend(objc_alloc(-[SBApplicationController _appClassForInfo:](self, "_appClassForInfo:", v4)), "initWithApplicationInfo:", v4);
      if (v16)
      {
        if (![v13 isSystemApplication]
          || [v16 isSystemApplication])
        {
          if (v5) {
            v5->_success = 1;
          }
          __int16 v24 = v11;
          if (v13) {
            [(SBApplicationController *)self _removeApplicationsFromModelWithBundleIdentifier:v6 forInstall:1 withReason:@"Update"];
          }
          os_unfair_lock_lock(&self->_applicationsLock);
          [(NSMutableDictionary *)self->_applicationsByBundleIdentifier setObject:v16 forKey:v6];
          os_unfair_lock_unlock(&self->_applicationsLock);
          long long v17 = [v16 info];
          uint64_t v18 = [v17 visibilityOverride];

          if (!v18)
          {
            id v11 = v24;
            goto LABEL_24;
          }
          id v11 = v24;
          id v19 = [[SBAppVisibilityPreferences alloc] initWithDefaultVisible:v18 == 1 bundleID:v6 containerPath:v24];
          if (v19)
          {
            [(NSMutableDictionary *)self->_systemAppsVisibilityOverrides setObject:v19 forKey:v6];
            if (![(SBAppVisibilityPreferences *)v19 isCurrentlyVisible])
            {
              cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
              self->_cachedSystemAppsWithVisibilityOverrideHidden = 0;
            }
          }
          goto LABEL_23;
        }
        [NSString stringWithFormat:@"ERROR: Attempt to replace system application with a user application, which is disallowed.", v6];
      }
      else
      {
        [NSString stringWithFormat:@"ERROR: Unable to load application (id=%@) because SBApplication's initializer returned nil.", v6];
      }
      id v19 = (SBAppVisibilityPreferences *)objc_claimAutoreleasedReturnValue();
      if (v5) {
        objc_setProperty_nonatomic_copy(v5, v22, v19, 16);
      }
LABEL_23:

      goto LABEL_24;
    }
  }
  uint64_t v16 = [NSString stringWithFormat:@"ERROR: Unable to load application because there is no bundle identifier (id=%@) or the bundle is not an app bundle (url=%@) for application info %@.", v6, v7, v4];
  if (v5) {
    objc_setProperty_nonatomic_copy(v5, v21, v16, 16);
  }
LABEL_24:

  return v5;
}

- (id)_appInfosToBundleIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "bundleIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_loadApplications:(id)a3 remove:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(SBApplicationController *)self _preLoadApplications];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v6];
  [v8 removeObject:self->_systemAppInfo];
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v45 = v7;
  long long v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v7];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v62 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(SBApplicationInfo **)(*((void *)&v61 + 1) + 8 * i);
        long long v15 = [(SBApplicationInfo *)v14 bundleIdentifier];
        uint64_t v16 = [(SBApplicationController *)self applicationWithBundleIdentifier:v15];
        if (v16)
        {
          systemAppInfo = self->_systemAppInfo;

          if (v14 != systemAppInfo)
          {
            [v8 removeObject:v14];
            [v50 addObject:v14];
          }
        }
        else
        {
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
    }
    while (v11);
  }

  if ([v50 count])
  {
    uint64_t v18 = SBLogAppLibrary();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v66 = v50;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "Reloading application states for '%@' as they have been updated.", buf, 0xCu);
    }
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v58 != v22) {
          objc_enumerationMutation(v19);
        }
        __int16 v24 = [*(id *)(*((void *)&v57 + 1) + 8 * j) bundleIdentifier];
        [(SBApplicationController *)self _removeApplicationsFromModelWithBundleIdentifier:v24 forInstall:0 withReason:@"Removed from the system."];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v21);
  }
  v46 = v19;

  v47 = v8;
  id v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v8];
  [v25 unionSet:v50];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v48 = v25;
  uint64_t v52 = [v48 countByEnumeratingWithState:&v53 objects:v69 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v54;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v54 != v51) {
          objc_enumerationMutation(v48);
        }
        id v27 = *(void **)(*((void *)&v53 + 1) + 8 * v26);
        uint64_t v28 = (void *)MEMORY[0x1D948C4D0]();
        uint64_t v29 = [(SBApplicationController *)self _loadApplicationFromApplicationInfo:v27];
        uint64_t v30 = v29;
        if (v29)
        {
          if (*(unsigned char *)(v29 + 9)) {
            uint64_t v31 = 11;
          }
          else {
            uint64_t v31 = 10;
          }
          if (*(unsigned char *)(v29 + 8))
          {
            v32 = @"Application replaced";
            if (!*(unsigned char *)(v29 + 9)) {
              v32 = @"Application added";
            }
          }
          else
          {
            v32 = *(__CFString **)(v29 + 16);
          }
        }
        else
        {
          v32 = 0;
          uint64_t v31 = 10;
        }
        v33 = v32;
        long long v34 = (void *)MEMORY[0x1E4F78060];
        long long v35 = [v27 bundleIdentifier];
        long long v36 = [NSString stringWithFormat:@"%@", v33];
        [v34 logStep:v31 byParty:10 phase:3 success:1 forBundleID:v35 description:v36];

        long long v37 = [v27 bundleIdentifier];
        if (!v30 || !*(unsigned char *)(v30 + 8))
        {
          long long v38 = SBLogAppLibrary();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            if (v30) {
              long long v39 = *(void **)(v30 + 16);
            }
            else {
              long long v39 = 0;
            }
            *(_DWORD *)buf = 138543618;
            id v66 = v37;
            __int16 v67 = 2114;
            v68 = v39;
            id v40 = v39;
            _os_log_error_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_ERROR, "*** Application failed to load in 'loadApplications': %{public}@: %{public}@", buf, 0x16u);
          }
          [v47 removeObject:v27];
          [v50 removeObject:v27];
          [v46 addObject:v27];
        }

        ++v26;
      }
      while (v52 != v26);
      uint64_t v41 = [v48 countByEnumeratingWithState:&v53 objects:v69 count:16];
      uint64_t v52 = v41;
    }
    while (v41);
  }

  long long v42 = [(SBApplicationController *)self _appInfosToBundleIDs:v47];
  long long v43 = [(SBApplicationController *)self _appInfosToBundleIDs:v50];
  long long v44 = [(SBApplicationController *)self _appInfosToBundleIDs:v46];
  [(SBApplicationController *)self _sendInstalledAppsDidChangeNotification:v42 removed:v44 replaced:v43 updated:0];
}

- (void)_removeApplicationsFromModelWithBundleIdentifier:(id)a3 forInstall:(BOOL)a4 withReason:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  if (!a4)
  {
    long long v9 = (void *)MEMORY[0x1E4F78060];
    uint64_t v10 = [NSString stringWithFormat:@"Application removed for reason: %@", v8];
    [v9 logStep:12 byParty:10 phase:3 success:1 forBundleID:v16 description:v10];
  }
  uint64_t v11 = [(SBApplicationController *)self applicationWithBundleIdentifier:v16];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 setUninstalled:1];
    if (!a4) {
      SBWorkspaceKillApplication(v12, 0, @"uninstalling app", 0);
    }
  }
  long long v13 = [(NSMutableDictionary *)self->_systemAppsVisibilityOverrides objectForKey:v16];
  long long v14 = v13;
  if (v13)
  {
    if (([v13 isCurrentlyVisible] & 1) == 0)
    {
      cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
      self->_cachedSystemAppsWithVisibilityOverrideHidden = 0;
    }
    [(NSMutableDictionary *)self->_systemAppsVisibilityOverrides removeObjectForKey:v16];
  }
  os_unfair_lock_lock(&self->_applicationsLock);
  [(NSMutableDictionary *)self->_applicationsByBundleIdentifier removeObjectForKey:v16];
  os_unfair_lock_unlock(&self->_applicationsLock);
}

- (void)_updateVisibilityOverrides
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_systemAppsVisibilityOverrides;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = -[NSMutableDictionary objectForKey:](self->_systemAppsVisibilityOverrides, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        v6 |= [v9 update];
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);

    if (v6)
    {
      cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
      self->_cachedSystemAppsWithVisibilityOverrideHidden = 0;

      [(SBApplicationRestrictionController *)self->_restrictionController noteVisibilityOverridesDidChange];
    }
  }
  else
  {
  }
}

uint64_t __65__SBApplicationController__updateVisibilityOverridesInBackground__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40);
  return [v4 noteVisibilityOverridesDidChange];
}

- (void)applicationsAdded:(id)a3
{
}

- (void)applicationsReplaced:(id)a3
{
}

- (void)applicationsUpdated:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  locuint64_t k = &self->_applicationsLock;
  os_unfair_lock_lock(&self->_applicationsLock);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "bundleIdentifier", lock);
        long long v14 = [(SBApplicationController *)self _lock_applicationWithBundleIdentifier:v13];

        if (v14)
        {
          long long v15 = [v12 bundleIdentifier];
          [v5 addObject:v15];

          uint64_t v16 = [v12 bundleIdentifier];
          [v6 setObject:v14 forKey:v16];

          uint64_t v17 = [v12 bundleIdentifier];
          [v7 setObject:v12 forKey:v17];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        __int16 v24 = objc_msgSend(v6, "objectForKey:", v23, lock);
        id v25 = [v7 objectForKey:v23];
        [v24 setInfo:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v20);
  }

  [(SBApplicationController *)self _sendInstalledAppsDidChangeNotification:0 removed:0 replaced:0 updated:v18];
}

- (void)applicationsRemoved:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  os_unfair_lock_lock(&self->_applicationsLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "bundleIdentifier", (void)v14);
        long long v13 = [(SBApplicationController *)self _lock_applicationWithBundleIdentifier:v12];

        if (!v13) {
          [v5 removeObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_applicationsLock);
  if ([v5 count]) {
    [(SBApplicationController *)self _loadApplications:0 remove:v5];
  }
}

- (void)applicationsDemoted:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  os_unfair_lock_lock(&self->_applicationsLock);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v12 = [v11 bundleIdentifier];
        long long v13 = [(SBApplicationController *)self _lock_applicationWithBundleIdentifier:v12];

        if (!v13) {
          [v5 removeObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_applicationsLock);
  if ([v5 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "bundleIdentifier", (void)v22);
          [(SBApplicationController *)self _removeApplicationsFromModelWithBundleIdentifier:v19 forInstall:0 withReason:@"Demotion"];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
    uint64_t v21 = [(SBApplicationController *)self _appInfosToBundleIDs:v20];

    [(SBApplicationController *)self _sendInstalledAppsDidChangeNotification:0 removed:v21 replaced:0 updated:0];
  }
}

- (void)applicationRestrictionsMayHaveChanged
{
}

- (id)bundleIdentifiersWithVisibilityOverrideHidden
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
  if (!cachedSystemAppsWithVisibilityOverrideHidden)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableDictionary count](self->_systemAppsVisibilityOverrides, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = self->_systemAppsVisibilityOverrides;
    uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
          long long v11 = -[NSMutableDictionary objectForKey:](self->_systemAppsVisibilityOverrides, "objectForKey:", v10, (void)v16);
          long long v12 = v11;
          if (v11 && ([v11 isCurrentlyVisible] & 1) == 0) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    long long v13 = (NSSet *)[v4 copy];
    id v14 = self->_cachedSystemAppsWithVisibilityOverrideHidden;
    self->_cachedSystemAppsWithVisibilityOverrideHidden = v13;

    cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
  }
  return cachedSystemAppsWithVisibilityOverrideHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionMonitoringServer, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_preventLaunchBundleIDs, 0);
  objc_storeStrong((id *)&self->_uninstallationReverseSemaphore, 0);
  objc_storeStrong((id *)&self->_appProtectionCoordinator, 0);
  objc_storeStrong((id *)&self->_splashBoardController, 0);
  objc_storeStrong((id *)&self->_systemAppInfo, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_appLibraryObserver, 0);
  objc_storeStrong((id *)&self->_restrictionController, 0);
  objc_storeStrong((id *)&self->_cachedSystemAppsWithVisibilityOverrideHidden, 0);
  objc_storeStrong((id *)&self->_systemAppsVisibilityOverrides, 0);
  objc_storeStrong((id *)&self->_applicationsByBundleIdentifier, 0);
}

- (void)waitForUninstallsToComplete:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for app uninstallation to complete", v1, 2u);
}

@end