@interface BrowserWindowController
+ (id)_printWindowToSceneMapping;
- (BOOL)cloudTabsEnabled;
- (BrowserWindowController)initWithBrowserSavedState:(id)a3;
- (BrowserWindowController)initWithBrowserSavedState:(id)a3 perSitePreferencesVendor:(id)a4 browserControllerUIDelegateProvider:(id)a5;
- (BrowserWindowController)initWithTabGroupManager:(id)a3 browserState:(id)a4 pinnedTabsManager:(id)a5 perSitePreferencesVendor:(id)a6 shouldMergeAllWindowsIfNeeded:(BOOL)a7 browserControllerUIDelegateProvider:(id)a8;
- (BrowserWindowController)initWithTabGroupManager:(id)a3 pinnedTabsManager:(id)a4;
- (CloudTabStore)cloudTabStore;
- (NSArray)browserControllers;
- (NSString)frontmostProfileIdentifier;
- (PinnedTabsManager)pinnedTabsManager;
- (_SFPageZoomPreferenceManager)privateBrowsingPageZoomManager;
- (_SFPerSitePreferencesVendor)perSitePreferencesVendor;
- (id)_allNormalLocalTabs;
- (id)_browserWindowsToPersist;
- (id)_mergeAndSaveWindowStates:(id)a3 intoWindowState:(id)a4;
- (id)_mergeWindowStates:(id)a3 intoWindowState:(id)a4;
- (id)_newAutomationWindowWithSceneID:(id)a3;
- (id)_printWindowToSceneMapping;
- (id)_sceneIDToLocalGroupTabs;
- (id)browserControllerWithUUID:(id)a3;
- (id)oldestTabsWithLimit:(unint64_t)a3 inPrivateBrowsing:(BOOL)a4;
- (id)tabDocumentWithUUID:(id)a3;
- (id)tabWithUUID:(id)a3;
- (id)tabsInPrivateBrowsing:(BOOL)a3;
- (id)tabsOlderThan:(id)a3 inPrivateBrowsing:(BOOL)a4;
- (id)uiDelegateForBrowserController:(id)a3;
- (id)windowForSceneID:(id)a3 options:(id)a4;
- (int64_t)modeForNewWindowUserActivity:(id)a3;
- (unint64_t)numberOfTabsInPrivateBrowsing:(BOOL)a3;
- (void)_createCloudTabsStore;
- (void)_destroyCloudTabsStore;
- (void)_mergeTabsFromCloudTabsForDeviceRestoration:(id)a3;
- (void)_mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing:(BOOL)a3;
- (void)_restoreWindowsFromBrowserSavedState:(id)a3;
- (void)_restoreWindowsWithState:(id)a3 shouldMergeAllWindowsIfNeeded:(BOOL)a4;
- (void)_windowDidClose:(id)a3;
- (void)cloudTabStore:(id)a3 didReceiveTabCloseRequest:(id)a4;
- (void)cloudTabStore:(id)a3 didUpdateDevicesFromCloudKitWithError:(id)a4;
- (void)cloudTabStoreDidGetCachedDevicesFromCloudKit:(id)a3;
- (void)dealloc;
- (void)dispatchNavigationIntent:(id)a3;
- (void)handleNavigationIntent:(id)a3 completion:(id)a4;
- (void)mergeAllWindowsIntoWindow:(id)a3;
- (void)openNewWindowInFrontmostProfileWithPrivateBrowsingEnabled:(BOOL)a3 fromWindow:(id)a4;
- (void)openNewWindowWithPrivateBrowsingEnabled:(BOOL)a3 fromWindow:(id)a4;
- (void)removeWindowsNotMatchingSceneIDs:(id)a3 supportsMultipleScenes:(BOOL)a4;
- (void)restoreEducationDeviceCloudTabs:(id)a3 animated:(BOOL)a4;
- (void)restoreEducationDeviceTabs;
- (void)saveBrowserState;
- (void)saveCloudTabs;
- (void)saveCloudTabsUsingCloudTabStore:(id)a3;
- (void)setCloudTabsEnabled:(BOOL)a3;
- (void)setFrontmostProfileIdentifier:(id)a3;
- (void)setUpAutomationWindowWithCompletionHandler:(id)a3;
- (void)tearDownAutomationWindow;
- (void)updateCloudTabUpdatesEnabled;
- (void)updateCloudTabsForEnteringBackground;
- (void)updateCloudTabsForEnteringForeground;
@end

@implementation BrowserWindowController

- (NSArray)browserControllers
{
  return self->_browserControllers;
}

- (void)setFrontmostProfileIdentifier:(id)a3
{
}

- (NSString)frontmostProfileIdentifier
{
  return self->_frontmostProfileIdentifier;
}

- (void)updateCloudTabUpdatesEnabled
{
  v3 = +[FeatureManager sharedFeatureManager];
  int v4 = [v3 isCloudTabsAvailable];

  if (v4)
  {
    cloudTabStore = self->_cloudTabStore;
    if (!cloudTabStore)
    {
      [(BrowserWindowController *)self _createCloudTabsStore];
      cloudTabStore = self->_cloudTabStore;
    }
    uint64_t v6 = [(CloudTabStore *)cloudTabStore cloudTabsAreEnabled];
  }
  else
  {
    [(BrowserWindowController *)self _destroyCloudTabsStore];
    uint64_t v6 = 0;
  }
  [(BrowserWindowController *)self setCloudTabsEnabled:v6];
}

- (void)setCloudTabsEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_cloudTabsEnabled != a3)
  {
    self->_cloudTabsEnabled = a3;
    if (!a3) {
      [(CloudTabStore *)self->_cloudTabStore clearTabsForCurrentDevice];
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    int v4 = self->_browserControllers;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "cloudTabsEnabledDidChange", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (PinnedTabsManager)pinnedTabsManager
{
  return self->_pinnedTabsManager;
}

- (id)uiDelegateForBrowserController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_UIDelegatesByBrowserController objectForKey:v4];
  if (!v5)
  {
    browserControllerUIDelegateProvider = (void (**)(id, id))self->_browserControllerUIDelegateProvider;
    if (browserControllerUIDelegateProvider)
    {
      uint64_t v5 = browserControllerUIDelegateProvider[2](browserControllerUIDelegateProvider, v4);
      if (v5) {
        [(NSMapTable *)self->_UIDelegatesByBrowserController setObject:v5 forKey:v4];
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (_SFPerSitePreferencesVendor)perSitePreferencesVendor
{
  return self->_perSitePreferencesVendor;
}

- (CloudTabStore)cloudTabStore
{
  return self->_cloudTabStore;
}

- (void)_createCloudTabsStore
{
  v3 = +[CloudTabStore sharedCloudTabStore];
  cloudTabStore = self->_cloudTabStore;
  self->_cloudTabStore = v3;

  [(CloudTabStore *)self->_cloudTabStore setDelegate:self];
  uint64_t v5 = self->_cloudTabStore;
  [(CloudTabStore *)v5 startObservingTabStoreStateChanges];
}

- (BrowserWindowController)initWithTabGroupManager:(id)a3 browserState:(id)a4 pinnedTabsManager:(id)a5 perSitePreferencesVendor:(id)a6 shouldMergeAllWindowsIfNeeded:(BOOL)a7 browserControllerUIDelegateProvider:(id)a8
{
  BOOL v9 = a7;
  id v33 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)BrowserWindowController;
  v19 = [(BrowserWindowController *)&v34 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_tabGroupManager, a3);
    objc_storeStrong((id *)&v20->_perSitePreferencesVendor, a6);
    uint64_t v21 = [v18 copy];
    id browserControllerUIDelegateProvider = v20->_browserControllerUIDelegateProvider;
    v20->_id browserControllerUIDelegateProvider = (id)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:0];
    UIDelegatesByBrowserController = v20->_UIDelegatesByBrowserController;
    v20->_UIDelegatesByBrowserController = (NSMapTable *)v23;

    objc_storeStrong((id *)&v20->_pinnedTabsManager, a5);
    v25 = [v15 windowStates];
    v26 = objc_msgSend(v25, "safari_mapObjectsUsingBlock:", &__block_literal_global_28);

    v27 = [MEMORY[0x1E4F78558] settings];
    [v27 validateWindowSettingsWithUUIDs:v26];

    [(BrowserWindowController *)v20 _restoreWindowsWithState:v15 shouldMergeAllWindowsIfNeeded:v9];
    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v29 = *MEMORY[0x1E4FB6F10];
    v30 = +[FeatureManager sharedFeatureManager];
    [v28 addObserver:v20 selector:sel__cloudTabFeatureAvailabilityDidChange_ name:v29 object:v30];

    [(BrowserWindowController *)v20 updateCloudTabUpdatesEnabled];
    v31 = v20;
  }
  return v20;
}

- (void)_restoreWindowsWithState:(id)a3 shouldMergeAllWindowsIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a3 windowStates];
  uint64_t v7 = v6;
  if (v4)
  {
    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v8 = [v7 firstObject];
      uint64_t v9 = [(BrowserWindowController *)self _mergeAndSaveWindowStates:v7 intoWindowState:v8];

      uint64_t v7 = (void *)v9;
    }
    long long v10 = [v7 firstObject];
    [v10 setSceneID:0];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__BrowserWindowController__restoreWindowsWithState_shouldMergeAllWindowsIfNeeded___block_invoke;
  v13[3] = &unk_1E6D7B360;
  v13[4] = self;
  objc_msgSend(v7, "safari_mapObjectsUsingBlock:", v13);
  long long v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  browserControllers = self->_browserControllers;
  self->_browserControllers = v11;
}

- (void)updateCloudTabsForEnteringForeground
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E102C000, log, OS_LOG_TYPE_DEBUG, "Fetching data from CloudKit when entering foreground", v1, 2u);
}

- (void)cloudTabStore:(id)a3 didUpdateDevicesFromCloudKitWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = v6;
      uint64_t v9 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      int v10 = 138543362;
      long long v11 = v9;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_INFO, "Did update devices from CloudKit syncing with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Did update devices from CloudKit syncing", (uint8_t *)&v10, 2u);
    }
    [(BrowserWindowController *)self _mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing:1];
  }
}

- (void)cloudTabStoreDidGetCachedDevicesFromCloudKit:(id)a3
{
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_INFO, "Did get cached CloudTab devices", v5, 2u);
  }
  [(BrowserWindowController *)self _mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing:0];
}

- (void)_mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing:(BOOL)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (self->_consideredMergingCloudTabsForDeviceRestoration)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_INFO, "Already considered merging CloudTabs for device restoration", buf, 2u);
    }
  }
  else
  {
    BOOL v44 = a3;
    v46 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v43 = *MEMORY[0x1E4F788C0];
    id v5 = objc_msgSend(v46, "objectForKey:");
    if (v5)
    {
      uint64_t v6 = [(CloudTabStore *)self->_cloudTabStore currentDeviceUUID];
      v45 = [v6 UUIDString];

      if ([v5 isEqualToString:v45])
      {
        self->_consideredMergingCloudTabsForDeviceRestoration = 1;
        BOOL v7 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v45;
          _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_DEFAULT, "Not attempting to merge CloudTabs because restoration is not necessary (saved UUID: %{public}@, current UUID: %{public}@)", buf, 0x16u);
        }
      }
      else
      {
        self->_consideredMergingCloudTabsForDeviceRestoration = v44;
        if (v44)
        {
          uint64_t v9 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v5;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v45;
            _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Finished syncing for CloudTabs restoration (saved UUID: %{public}@, current UUID: %{public}@)", buf, 0x16u);
          }
          [v46 setObject:v45 forKey:v43];
          [v46 setObject:v5 forKey:@"uuidOfCloudTabDeviceUsedForRestoration"];
        }
        v42 = [(CloudTabStore *)self->_cloudTabStore allSyncedCloudTabDevices];
        BOOL v10 = [v42 count] == 0;
        long long v11 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v12)
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v5;
            _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_DEFAULT, "No tab was found for merging from a CloudTabs device with UUID %{public}@", buf, 0xCu);
          }
        }
        else
        {
          if (v12)
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v5;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v45;
            _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to find device with UUID: %{public}@ to restore from. Current CloudTab device UUID is: %{public}@", buf, 0x16u);
          }
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v13 = v42;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v57 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v52;
LABEL_19:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v52 != v15) {
                objc_enumerationMutation(v13);
              }
              id v17 = *(void **)(*((void *)&v51 + 1) + 8 * v16);
              id v18 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = v18;
                v20 = [v17 uuid];
                *(_DWORD *)buf = 138543362;
                *(void *)&buf[4] = v20;
                _os_log_impl(&dword_1E102C000, v19, OS_LOG_TYPE_DEFAULT, "Found CloudTabs device with UUID %{public}@", buf, 0xCu);
              }
              uint64_t v21 = [v17 uuid];
              char v22 = [v21 isEqualToString:v5];

              if (v22) {
                break;
              }
              if (v14 == ++v16)
              {
                uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v57 count:16];
                if (v14) {
                  goto LABEL_19;
                }
                goto LABEL_27;
              }
            }
            id v23 = v17;

            if (!v23) {
              goto LABEL_37;
            }
            v24 = [v23 tabs];
            BOOL v25 = [v24 count] == 0;
            v26 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
            BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            if (v25)
            {
              if (v27)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1E102C000, v26, OS_LOG_TYPE_DEFAULT, "No tabs found from CloudTabs for device restoration", buf, 2u);
              }
            }
            else
            {
              if (v27)
              {
                v28 = v26;
                uint64_t v29 = [v24 count];
                *(_DWORD *)buf = 134217984;
                *(void *)&buf[4] = v29;
                _os_log_impl(&dword_1E102C000, v28, OS_LOG_TYPE_DEFAULT, "Found %zu tabs in CloudTabs device for restoration", buf, 0xCu);
              }
              v30 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
              v31 = [v23 lastModified];
              [v31 timeIntervalSinceReferenceDate];
              objc_msgSend(v30, "setDouble:forKey:", @"lastModifiedTimeOfCloudTabDeviceUsedForRestoration");

              if (!v44)
              {
                v32 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1E102C000, v32, OS_LOG_TYPE_DEFAULT, "Found cached CloudTabs device to restore", buf, 2u);
                }
                self->_consideredMergingCloudTabsForDeviceRestoration = 1;
                [v46 setObject:v45 forKey:v43];
                id v33 = [v23 uuid];
                [v46 setObject:v33 forKey:@"uuidOfCloudTabDeviceUsedForRestoration"];
              }
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              uint64_t v56 = 0;
              objc_super v34 = (void *)*MEMORY[0x1E4FB2608];
              v50[0] = MEMORY[0x1E4F143A8];
              v50[1] = 3221225472;
              v50[2] = __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke;
              v50[3] = &unk_1E6D77CE0;
              v50[4] = buf;
              uint64_t v35 = [v34 beginBackgroundTaskWithName:@"com.apple.mobilesafari.CloudTabRestorationBackgroundTask" expirationHandler:v50];
              *(void *)(*(void *)&buf[8] + 24) = v35;
              v36 = [MEMORY[0x1E4F97FB8] sharedProxy];
              v47[0] = MEMORY[0x1E4F143A8];
              v47[1] = 3221225472;
              v47[2] = __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke_28;
              v47[3] = &unk_1E6D7B2E8;
              v49 = buf;
              v47[4] = self;
              id v48 = v24;
              [v36 getCloudTabContainerManateeStateWithCompletionHandler:v47];

              _Block_object_dispose(buf, 8);
            }
          }
          else
          {
LABEL_27:

LABEL_37:
            v37 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E102C000, v37, OS_LOG_TYPE_DEFAULT, "No cloud tab device found for tab restoration", buf, 2u);
            }
            if (v44)
            {
              v38 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                v39 = v38;
                uint64_t v40 = [v13 count];
                unint64_t v41 = [(WBSCloudTabStore *)self->_cloudTabStore totalSyncedCloudTabDeviceCount];
                *(_DWORD *)buf = 134218240;
                *(void *)&buf[4] = v40;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v41;
                _os_log_impl(&dword_1E102C000, v39, OS_LOG_TYPE_DEFAULT, "Did not find device after syncing finished; device count: %zu; unfiltered device count: %zu",
                  buf,
                  0x16u);
              }
            }
          }
        }
      }
    }
    else
    {
      self->_consideredMergingCloudTabsForDeviceRestoration = 1;
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Not attempting to merge tabs from CloudTabs device because no device identifier was found for restoration", buf, 2u);
      }
    }
  }
}

BrowserController *__82__BrowserWindowController__restoreWindowsWithState_shouldMergeAllWindowsIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t v6 = [v3 uuid];
    BOOL v7 = [v3 sceneID];
    int v10 = 138543618;
    long long v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Loading window from saved state: uuid = %{public}@, sceneID = %{public}@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = [[BrowserController alloc] initWithWindowState:v3 browserWindowController:*(void *)(a1 + 32) tabGroupManager:*(void *)(*(void *)(a1 + 32) + 56)];

  return v8;
}

- (id)windowForSceneID:(id)a3 options:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F22488], "_sf_windowCreationActivityFromSceneConnectionOptions:", a4);
  if ([(BrowserWindowController *)self modeForNewWindowUserActivity:v7] == 2)
  {
    uint64_t v8 = [(BrowserWindowController *)self _newAutomationWindowWithSceneID:v6];
    goto LABEL_14;
  }
  browserControllers = self->_browserControllers;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __52__BrowserWindowController_windowForSceneID_options___block_invoke;
  v28[3] = &unk_1E6D77F50;
  id v10 = v6;
  id v29 = v10;
  uint64_t v11 = [(NSArray *)browserControllers safari_firstObjectPassingTest:v28];
  if (!v11)
  {
    uint64_t v8 = [(NSArray *)self->_browserControllers safari_firstObjectPassingTest:&__block_literal_global_47_0];
    uint64_t v15 = [(BrowserController *)v8 windowState];
    uint64_t v16 = [v15 uuid];
    id v17 = [v15 sceneID];
    [(BrowserController *)v8 adoptSceneID:v10];
    id v18 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v31 = v16;
      __int16 v32 = 2114;
      id v33 = v17;
      __int16 v34 = 2114;
      id v35 = v10;
      _os_log_impl(&dword_1E102C000, v18, OS_LOG_TYPE_DEFAULT, "Adopting window during matching: uuid = %{public}@, sceneID = %{public}@ -> %{public}@", buf, 0x20u);
    }

    if (v8) {
      goto LABEL_13;
    }
    id v19 = objc_alloc(MEMORY[0x1E4FB60D8]);
    v20 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v21 = [v20 UUIDString];
    uint64_t v14 = (void *)[v19 initWithUUID:v21 sceneID:v10];

    [v14 setNewlyCreated:1];
    [(WBTabGroupManager *)self->_tabGroupManager saveWindowState:v14 completionHandler:0];
    uint64_t v8 = [[BrowserController alloc] initWithWindowState:v14 browserWindowController:self tabGroupManager:self->_tabGroupManager];
    char v22 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v22;
      v24 = [v14 uuid];
      *(_DWORD *)buf = 138543618;
      v31 = v24;
      __int16 v32 = 2114;
      id v33 = v10;
      _os_log_impl(&dword_1E102C000, v23, OS_LOG_TYPE_DEFAULT, "Creating new window: uuid = %{public}@, sceneID = %{public}@", buf, 0x16u);
    }
    BOOL v25 = [(NSArray *)self->_browserControllers arrayByAddingObject:v8];
    v26 = self->_browserControllers;
    self->_browserControllers = v25;

    goto LABEL_12;
  }
  uint64_t v8 = (BrowserController *)v11;
  __int16 v12 = WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    uint64_t v14 = [(BrowserController *)v8 UUID];
    *(_DWORD *)buf = 138543618;
    v31 = v14;
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_DEFAULT, "Found existing window by sceneID: uuid = %{public}@, sceneID = %{public}@", buf, 0x16u);

LABEL_12:
  }
LABEL_13:

LABEL_14:
  return v8;
}

- (int64_t)modeForNewWindowUserActivity:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, "_sf_windowCreationMode");
    BOOL v7 = v6;
    if (v6)
    {
      int64_t v8 = [v6 integerValue];
    }
    else
    {
      uint64_t v9 = objc_msgSend(v5, "_sf_windowCreationNavigationIntent");
      id v10 = [v9 sourceWindowUUID];
      uint64_t v11 = [(BrowserWindowController *)self browserControllerWithUUID:v10];

      int64_t v8 = [v11 isPrivateBrowsingEnabled];
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

uint64_t __83__BrowserWindowController_removeWindowsNotMatchingSceneIDs_supportsMultipleScenes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 windowState];
  id v4 = [v3 sceneID];

  if (v4) {
    uint64_t v5 = [*(id *)(a1 + 32) containsObject:v4] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __52__BrowserWindowController_windowForSceneID_options___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 windowState];
  id v3 = [v2 sceneID];
  uint64_t v4 = WBSIsEqual();

  return v4;
}

id __173__BrowserWindowController_initWithTabGroupManager_browserState_pinnedTabsManager_perSitePreferencesVendor_shouldMergeAllWindowsIfNeeded_browserControllerUIDelegateProvider___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 uuid];

  id v6 = (void *)[v4 initWithUUIDString:v5];
  return v6;
}

- (void)removeWindowsNotMatchingSceneIDs:(id)a3 supportsMultipleScenes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  browserControllers = self->_browserControllers;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__BrowserWindowController_removeWindowsNotMatchingSceneIDs_supportsMultipleScenes___block_invoke;
  v25[3] = &unk_1E6D77F50;
  id v8 = v6;
  id v26 = v8;
  uint64_t v9 = [(NSArray *)browserControllers safari_filterObjectsUsingBlock:v25];
  if ([(NSArray *)self->_browserControllers count] == 1
    && [v9 count] == 1
    && (!v4 || (unint64_t)[v8 count] <= 1))
  {
    id v10 = [v9 objectAtIndexedSubscript:0];
    uint64_t v11 = [v8 anyObject];
    [v10 adoptSceneID:v11];
    __int16 v12 = [v10 windowState];
    id v13 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      uint64_t v15 = [v12 uuid];
      uint64_t v16 = [v12 sceneID];
      *(_DWORD *)buf = 138543874;
      id v29 = v15;
      __int16 v30 = 2114;
      v31 = v16;
      __int16 v32 = 2114;
      id v33 = v11;
      _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_DEFAULT, "Adopting window during pruning: uuid = %{public}@, sceneID = %{public}@ -> %{public}@", buf, 0x20u);
    }
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v9;
    uint64_t v17 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v10);
          }
          -[BrowserWindowController _windowDidClose:](self, "_windowDidClose:", *(void *)(*((void *)&v21 + 1) + 8 * v20++), (void)v21);
        }
        while (v18 != v20);
        uint64_t v18 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v18);
    }
  }
}

- (BrowserWindowController)initWithBrowserSavedState:(id)a3
{
  return [(BrowserWindowController *)self initWithBrowserSavedState:a3 perSitePreferencesVendor:0 browserControllerUIDelegateProvider:0];
}

- (BrowserWindowController)initWithBrowserSavedState:(id)a3 perSitePreferencesVendor:(id)a4 browserControllerUIDelegateProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BrowserWindowController;
  uint64_t v11 = [(BrowserWindowController *)&v23 init];
  __int16 v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_perSitePreferencesVendor, a4);
    uint64_t v13 = [v10 copy];
    id browserControllerUIDelegateProvider = v12->_browserControllerUIDelegateProvider;
    v12->_id browserControllerUIDelegateProvider = (id)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:0];
    UIDelegatesByBrowserController = v12->_UIDelegatesByBrowserController;
    v12->_UIDelegatesByBrowserController = (NSMapTable *)v15;

    browserControllers = v12->_browserControllers;
    v12->_browserControllers = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(BrowserWindowController *)v12 _restoreWindowsFromBrowserSavedState:v8];
    uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v19 = *MEMORY[0x1E4FB6F10];
    uint64_t v20 = +[FeatureManager sharedFeatureManager];
    [v18 addObserver:v12 selector:sel__cloudTabFeatureAvailabilityDidChange_ name:v19 object:v20];

    [(BrowserWindowController *)v12 updateCloudTabUpdatesEnabled];
    long long v21 = v12;
  }

  return v12;
}

- (BrowserWindowController)initWithTabGroupManager:(id)a3 pinnedTabsManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 browserState];
  id v9 = [(BrowserWindowController *)self initWithTabGroupManager:v7 browserState:v8 pinnedTabsManager:v6 perSitePreferencesVendor:0 shouldMergeAllWindowsIfNeeded:0 browserControllerUIDelegateProvider:0];

  return v9;
}

- (void)dealloc
{
  [(BrowserWindowController *)self _destroyCloudTabsStore];
  v3.receiver = self;
  v3.super_class = (Class)BrowserWindowController;
  [(BrowserWindowController *)&v3 dealloc];
}

- (id)tabsInPrivateBrowsing:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_browserControllers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "tabController", (void)v16);
        __int16 v12 = v11;
        if (a3) {
          [v11 privateUnpinnedTabs];
        }
        else {
        uint64_t v13 = [v11 normalUnpinnedTabs];
        }
        [v5 addObjectsFromArray:v13];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v14 = (void *)[v5 copy];
  return v14;
}

- (unint64_t)numberOfTabsInPrivateBrowsing:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = self->_browserControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "tabController", (void)v14);
        uint64_t v11 = v10;
        if (a3) {
          [v10 privateUnpinnedTabs];
        }
        else {
        __int16 v12 = [v10 normalUnpinnedTabs];
        }
        v7 += [v12 count];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)tabsOlderThan:(id)a3 inPrivateBrowsing:(BOOL)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  unint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  v28 = v5;
  uint64_t v8 = [v6 dateByAddingComponents:v5 toDate:v7 options:0];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = self->_browserControllers;
  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = [*(id *)(*((void *)&v35 + 1) + 8 * i) tabController];
        long long v17 = v16;
        if (a4) {
          [v16 privateUnpinnedTabs];
        }
        else {
        long long v18 = [v16 normalUnpinnedTabs];
        }
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v32 != v22) {
                objc_enumerationMutation(v19);
              }
              long long v24 = *(void **)(*((void *)&v31 + 1) + 8 * j);
              [v24 lastActivationTime];
              if (v25 <= v10) {
                [v11 addObject:v24];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v21);
        }
      }
      uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);
  }

  id v26 = (void *)[v11 copy];
  return v26;
}

- (id)oldestTabsWithLimit:(unint64_t)a3 inPrivateBrowsing:(BOOL)a4
{
  id v5 = [(BrowserWindowController *)self tabsInPrivateBrowsing:a4];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 sortUsingComparator:&__block_literal_global_14];
  if ([v6 count] <= a3) {
    a3 = [v6 count];
  }
  unint64_t v7 = objc_msgSend(v6, "subarrayWithRange:", 0, a3);

  return v7;
}

uint64_t __65__BrowserWindowController_oldestTabsWithLimit_inPrivateBrowsing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [a2 lastActivationTime];
  uint64_t v6 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  unint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 lastActivationTime];
  double v9 = v8;

  double v10 = [v7 dateWithTimeIntervalSinceReferenceDate:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)browserControllerWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_browserControllers;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = objc_msgSend(v9, "UUID", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)tabDocumentWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_browserControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "tabController", (void)v13);
      char v11 = [v10 tabDocumentWithUUID:v4];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    char v11 = 0;
  }

  return v11;
}

- (id)tabWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_browserControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "tabController", (void)v13);
      char v11 = [v10 tabWithUUID:v4];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    char v11 = 0;
  }

  return v11;
}

- (_SFPageZoomPreferenceManager)privateBrowsingPageZoomManager
{
  privateBrowsingPageZoomManager = self->_privateBrowsingPageZoomManager;
  if (!privateBrowsingPageZoomManager)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F98CD8]) initWithDatabaseURL:0];
    id v5 = [MEMORY[0x1E4F97FB8] sharedProxy];
    [v4 setSyncProxy:v5];

    uint64_t v6 = (_SFPageZoomPreferenceManager *)[objc_alloc(MEMORY[0x1E4F3AFF8]) initWithPerSitePreferencesStore:v4];
    uint64_t v7 = self->_privateBrowsingPageZoomManager;
    self->_privateBrowsingPageZoomManager = v6;

    uint64_t v8 = [(BrowserWindowController *)self perSitePreferencesVendor];
    uint64_t v9 = [v8 pageZoomPreferenceManager];
    [(_SFPageZoomPreferenceManager *)self->_privateBrowsingPageZoomManager setFallbackPreferenceManager:v9];

    privateBrowsingPageZoomManager = self->_privateBrowsingPageZoomManager;
  }
  return privateBrowsingPageZoomManager;
}

- (id)_allNormalLocalTabs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_browserControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "tabController", (void)v15);
        double v10 = [v9 activeTabGroup];
        char v11 = [v10 isSyncable];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = [v9 normalTabs];
          [v3 addObjectsFromArray:v12];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  long long v13 = (void *)[v3 copy];
  return v13;
}

- (id)_sceneIDToLocalGroupTabs
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = self->_browserControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v10 = objc_msgSend(v9, "tabController", (void)v19);
        char v11 = [v10 activeTabGroup];
        char v12 = [v11 isLocal];

        if ((v12 & 1) == 0)
        {
          long long v13 = [v9 windowStateData];
          long long v14 = [v13 sceneID];

          if (v14)
          {
            long long v15 = [v9 windowState];
            long long v16 = [v15 localTabGroup];
            long long v17 = [v16 tabs];

            if ([v17 count]) {
              [v3 setObject:v17 forKeyedSubscript:v14];
            }
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_destroyCloudTabsStore
{
  [(CloudTabStore *)self->_cloudTabStore stopObservingTabStoreStateChanges];
  [(CloudTabStore *)self->_cloudTabStore setDelegate:0];
  cloudTabStore = self->_cloudTabStore;
  self->_cloudTabStore = 0;
}

- (void)saveCloudTabs
{
  cloudTabStore = self->_cloudTabStore;
  id v5 = [(BrowserWindowController *)self _allNormalLocalTabs];
  id v4 = [(BrowserWindowController *)self _sceneIDToLocalGroupTabs];
  -[CloudTabStore saveCurrentDeviceTabs:sceneIDToLocalGroupTabs:](cloudTabStore, v5, v4);
}

- (void)updateCloudTabsForEnteringBackground
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(WBSCloudTabStore *)self->_cloudTabStore pruneExpiredDevicesFromCloudKit];
  objc_super v3 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v3 reportTabUpdatedWithUpdateType:6];

  uint64_t v22 = 0;
  objc_super v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = *MEMORY[0x1E4FB2748];
  id v4 = (void *)*MEMORY[0x1E4FB2608];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke;
  v21[3] = &unk_1E6D77CE0;
  v21[4] = &v22;
  uint64_t v5 = [v4 beginBackgroundTaskWithName:@"com.apple.mobilesafari.SynchronizeCloudTabs" expirationHandler:v21];
  v23[3] = v5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke_23;
  v20[3] = &unk_1E6D77CE0;
  v20[4] = &v22;
  uint64_t v6 = (void *)MEMORY[0x1E4E42950](v20);
  BOOL v7 = [(CloudTabStore *)self->_cloudTabStore canSaveCloudTabsForCurrentDevice];
  cloudTabStore = self->_cloudTabStore;
  if (v7)
  {
    uint64_t v9 = [(BrowserWindowController *)self _allNormalLocalTabs];
    double v10 = [(BrowserWindowController *)self _sceneIDToLocalGroupTabs];
    -[CloudTabStore saveCurrentDeviceTabsForEnteringBackground:sceneIDToLocalGroupTabs:completion:](cloudTabStore, v9, v10, v6);
  }
  else
  {
    [(CloudTabStore *)self->_cloudTabStore saveCurrentDeviceCloudTabsForEnteringBackground:0 completion:v6];
  }
  if (+[WBUFeatureManager accessLevel] == 2)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    char v11 = self->_browserControllers;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          long long v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "tabController", (void)v16);
          [v15 updateEducationTabsLastSyncDate];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v26 count:16];
      }
      while (v12);
    }
  }
  _Block_object_dispose(&v22, 8);
}

uint64_t __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke_cold_1(v2);
  }
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke_23(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

- (void)restoreEducationDeviceTabs
{
  id v3 = [(NSArray *)self->_browserControllers firstObject];
  v2 = [v3 tabController];
  [v2 restoreEducationDeviceTabs];
}

- (void)restoreEducationDeviceCloudTabs:(id)a3 animated:(BOOL)a4
{
  BOOL v18 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v22 = self;
  long long v19 = [(NSArray *)self->_browserControllers firstObject];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v5;
  uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v8 = [v7 uuid];
        if (!v8)
        {
          uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
        }
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = v22->_browserControllers;
        uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
LABEL_10:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = [*(id *)(*((void *)&v24 + 1) + 8 * v13) tabController];
            long long v15 = [v7 url];
            long long v16 = [v14 tabForURL:v15];

            if (v16) {
              break;
            }
            if (v11 == ++v13)
            {
              uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v11) {
                goto LABEL_10;
              }
              goto LABEL_16;
            }
          }
        }
        else
        {
LABEL_16:

          long long v16 = [v7 url];
          uint64_t v9 = [v7 title];
          id v17 = (id)[v19 loadURLInNewTab:v16 title:v9 UUID:v8 inBackground:1 animated:v18 restoringCloudTab:1];
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }
}

void __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_DEFAULT, "Background task expired for restoring CloudTabs", v3, 2u);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748]) {
    objc_msgSend((id)*MEMORY[0x1E4FB2608], "endBackgroundTask:");
  }
}

void __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke_28(void *a1, char a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke_29;
    block[3] = &unk_1E6D78908;
    id v3 = (void *)a1[5];
    block[4] = a1[4];
    id v4 = v3;
    uint64_t v5 = a1[6];
    id v8 = v4;
    uint64_t v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "Not restoring tabs from CloudTabs for browser state because the container does not use Manatee", buf, 2u);
    }
    if (*(void *)(*(void *)(a1[6] + 8) + 24) != *MEMORY[0x1E4FB2748]) {
      objc_msgSend((id)*MEMORY[0x1E4FB2608], "endBackgroundTask:");
    }
  }
}

uint64_t __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke_29(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _mergeTabsFromCloudTabsForDeviceRestoration:*(void *)(a1 + 40)];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    id v3 = (void *)*MEMORY[0x1E4FB2608];
    return objc_msgSend(v3, "endBackgroundTask:");
  }
  return result;
}

- (void)_mergeTabsFromCloudTabsForDeviceRestoration:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    *(_DWORD *)buf = 134217984;
    uint64_t v75 = [v3 count];
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Merging %ld tabs from CloudTabs for device restoration", buf, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v67 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v12 = [v11 sceneID];
        if (!v12)
        {
          uint64_t v13 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
          uint64_t v12 = @"SAFARI_NO_SCENE_ID";
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_DEFAULT, "CloudTab does not have a sceneID. Categorize it under tabs without a scene id", buf, 2u);
            uint64_t v12 = @"SAFARI_NO_SCENE_ID";
          }
        }
        uint64_t v14 = [v6 objectForKeyedSubscript:v12];
        if (!v14)
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
          [v6 setObject:v14 forKeyedSubscript:v12];
        }
        [v14 addObject:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v8);
  }

  id v48 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v15 = self->_browserControllers;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v63 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        uint64_t v21 = [v20 windowStateData];
        uint64_t v22 = [v21 sceneID];

        if (v22) {
          [v48 setObject:v20 forKeyedSubscript:v22];
        }
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v17);
  }

  v47 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v45 = self->_browserControllers;
  uint64_t v23 = [(NSArray *)v45 countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v49 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v59 != v49) {
          objc_enumerationMutation(v45);
        }
        long long v26 = *(void **)(*((void *)&v58 + 1) + 8 * k);
        long long v27 = [v26 UUID];
        long long v28 = [v27 UUIDString];

        if (v28)
        {
          long long v29 = v6;
          long long v30 = [v26 windowState];
          long long v31 = [v30 localTabGroup];
          long long v32 = [v31 tabs];

          long long v33 = [MEMORY[0x1E4F1CA80] set];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v34 = v32;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v70 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v55;
            do
            {
              for (uint64_t m = 0; m != v36; ++m)
              {
                if (*(void *)v55 != v37) {
                  objc_enumerationMutation(v34);
                }
                v39 = [*(id *)(*((void *)&v54 + 1) + 8 * m) url];
                if (v39) {
                  [v33 addObject:v39];
                }
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v54 objects:v70 count:16];
            }
            while (v36);
          }

          [v47 setObject:v33 forKeyedSubscript:v28];
          uint64_t v6 = v29;
        }
      }
      uint64_t v24 = [(NSArray *)v45 countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v24);
  }

  uint64_t v40 = [(NSArray *)self->_browserControllers firstObject];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __71__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestoration___block_invoke;
  v50[3] = &unk_1E6D7B338;
  id v51 = v48;
  id v52 = v40;
  id v53 = v47;
  id v41 = v47;
  id v42 = v40;
  id v43 = v48;
  [v6 enumerateKeysAndObjectsUsingBlock:v50];
}

void __71__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestoration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 objectForKeyedSubscript:v5];
  if (!v8)
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v5;
      _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Did not find browser controller for scene ID %{public}@, falling back to the first one", buf, 0xCu);
    }
    id v8 = *(id *)(a1 + 40);
  }
  uint64_t v10 = [v8 UUID];
  uint64_t v11 = [v10 UUIDString];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __71__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestoration___block_invoke_35;
  uint64_t v17 = &unk_1E6D7B310;
  id v12 = v11;
  id v18 = v12;
  id v19 = *(id *)(a1 + 48);
  uint64_t v13 = objc_msgSend(v7, "safari_filterObjectsUsingBlock:", &v14);

  if (objc_msgSend(v13, "count", v14, v15, v16, v17)) {
    [v8 loadCloudTabsForDeviceRestoration:v13];
  }
}

uint64_t __71__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestoration___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = [a2 url];
  if (v3)
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
      uint64_t v5 = [v4 containsObject:v3] ^ 1;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    uint64_t v5 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "CloudTab to restore has no URL", v8, 2u);
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)cloudTabStore:(id)a3 didReceiveTabCloseRequest:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 url];
  id v7 = [v5 tabUUID];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_browserControllers;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "tabController", (void)v14);
        [v13 closeTabWithURL:v6 UUID:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)saveCloudTabsUsingCloudTabStore:(id)a3
{
  if ([(CloudTabStore *)self->_cloudTabStore canSaveCloudTabsForCurrentDevice])
  {
    [(BrowserWindowController *)self saveCloudTabs];
  }
}

- (void)openNewWindowWithPrivateBrowsingEnabled:(BOOL)a3 fromWindow:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F22488];
  id v6 = a4;
  objc_msgSend(v5, "_sf_windowCreationActivityWithMode:", v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1B80]);
  id v8 = [v6 scene];

  [v7 setRequestingScene:v8];
  uint64_t v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v9 requestSceneSessionActivation:0 userActivity:v10 options:v7 errorHandler:0];
}

- (void)openNewWindowInFrontmostProfileWithPrivateBrowsingEnabled:(BOOL)a3 fromWindow:(id)a4
{
  BOOL v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F22488];
  id v7 = a4;
  objc_msgSend(v6, "_sf_windowCreationActivityWithMode:", v5);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1B80]);
  uint64_t v9 = [v7 scene];
  [v8 setRequestingScene:v9];

  id v10 = [v7 tabController];

  uint64_t v11 = [v10 activeProfileIdentifier];
  frontmostProfileIdentifier = self->_frontmostProfileIdentifier;
  self->_frontmostProfileIdentifier = v11;

  uint64_t v13 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v13 requestSceneSessionActivation:0 userActivity:v14 options:v8 errorHandler:0];
}

- (id)_newAutomationWindowWithSceneID:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4FB60D8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  uint64_t v9 = (void *)[v6 initWithUUID:v8 sceneID:v5];

  id v10 = [MEMORY[0x1E4FB60C0] ephemeralTabGroupManager];
  [v10 saveWindowState:v9 completionHandler:0];
  uint64_t v11 = [[BrowserController alloc] initWithWindowState:v9 browserWindowController:self tabGroupManager:v10 controlledByAutomation:1];
  uint64_t v12 = [(NSArray *)self->_browserControllers arrayByAddingObject:v11];
  browserControllers = self->_browserControllers;
  self->_browserControllers = v12;

  id v14 = (void *)MEMORY[0x1E4E42950](self->_automationWindowInitializedCompletionHandler);
  id automationWindowInitializedCompletionHandler = self->_automationWindowInitializedCompletionHandler;
  self->_id automationWindowInitializedCompletionHandler = 0;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BrowserWindowController__newAutomationWindowWithSceneID___block_invoke;
  block[3] = &unk_1E6D77E70;
  id v19 = v14;
  id v16 = v14;
  dispatch_async(MEMORY[0x1E4F14428], block);

  return v11;
}

uint64_t __59__BrowserWindowController__newAutomationWindowWithSceneID___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __52__BrowserWindowController_windowForSceneID_options___block_invoke_45(uint64_t a1, void *a2)
{
  v2 = [a2 windowState];
  id v3 = [v2 sceneID];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)_windowDidClose:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 windowState];
  id v6 = [v4 tabController];
  [v6 setActiveTabGroupUUID:0];

  id v7 = [v4 tabController];
  [v7 closeAllOpenTabsAnimated:0];

  id v8 = [v4 tabGroupManager];
  v25[0] = v5;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v8 deleteWindowStates:v9 completionHandler:0];

  id v10 = [MEMORY[0x1E4F78558] settings];
  id v11 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v12 = [v5 uuid];
  uint64_t v13 = (void *)[v11 initWithUUIDString:v12];
  [v10 removeWindowWithUUID:v13];

  id v14 = (void *)[(NSArray *)self->_browserControllers mutableCopy];
  [v14 removeObject:v4];
  long long v15 = (NSArray *)[v14 copy];

  browserControllers = self->_browserControllers;
  self->_browserControllers = v15;

  [v4 didCloseBrowserWindow];
  [(NSMapTable *)self->_UIDelegatesByBrowserController removeObjectForKey:v4];

  long long v17 = WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v17;
    id v19 = [v5 uuid];
    long long v20 = [v5 sceneID];
    int v21 = 138543618;
    uint64_t v22 = v19;
    __int16 v23 = 2114;
    uint64_t v24 = v20;
    _os_log_impl(&dword_1E102C000, v18, OS_LOG_TYPE_DEFAULT, "Closed window: uuid = %{public}@, sceneID = %{public}@", (uint8_t *)&v21, 0x16u);
  }
}

- (void)mergeAllWindowsIntoWindow:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSArray *)self->_browserControllers mutableCopy];
  [v5 removeObject:v4];
  id v6 = (void *)[v5 copy];

  id v7 = [(NSArray *)self->_browserControllers valueForKey:@"windowState"];
  id v8 = [v4 windowState];
  id v9 = [(BrowserWindowController *)self _mergeAndSaveWindowStates:v7 intoWindowState:v8];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v15, "closeWindow", (void)v16);
        [v15 didCloseBrowserWindow];
        [(BrowserWindowController *)self _windowDidClose:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

+ (id)_printWindowToSceneMapping
{
  v2 = +[Application sharedApplication];
  id v3 = [v2 browserWindowController];
  id v4 = [v3 _printWindowToSceneMapping];

  return v4;
}

- (id)_printWindowToSceneMapping
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_browserControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) windowState];
        id v10 = [v9 uuid];
        uint64_t v11 = [v9 sceneID];
        objc_msgSend(v3, "appendFormat:", @"<BrowserController; uuid = %@; sceneID = %@>\n",
          v10,
          v11,
          (void)v14);
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = (void *)[v3 copy];
  return v12;
}

- (void)setUpAutomationWindowWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_automationWindowInitializedCompletionHandler)
  {
    uint64_t v5 = (void (**)(void, void))MEMORY[0x1E4E42950]();
    id automationWindowInitializedCompletionHandler = self->_automationWindowInitializedCompletionHandler;
    self->_id automationWindowInitializedCompletionHandler = 0;

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"AutomationErrorDomain", 1, @"Pending session was terminated prior to becoming established.");
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
  id v8 = (void *)[v4 copy];
  id v9 = self->_automationWindowInitializedCompletionHandler;
  self->_id automationWindowInitializedCompletionHandler = v8;

  if ([(id)*MEMORY[0x1E4FB2608] supportsMultipleScenes])
  {
    objc_msgSend(MEMORY[0x1E4F22488], "_sf_windowCreationActivityWithMode:", 2);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1B80]);
    [v11 _setRequestFullscreen:1];
    uint64_t v12 = [MEMORY[0x1E4FB1438] sharedApplication];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke_2;
    v18[3] = &unk_1E6D77FE0;
    v18[4] = self;
    [v12 requestSceneSessionActivation:0 userActivity:v10 options:v11 errorHandler:v18];
  }
  else
  {
    uint64_t v13 = [(NSArray *)self->_browserControllers objectAtIndexedSubscript:0];
    long long v14 = [v13 windowState];
    long long v15 = [v14 sceneID];
    id v16 = [(BrowserWindowController *)self _newAutomationWindowWithSceneID:v15];

    long long v17 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E6D77D90;
    id v20 = v13;
    id v21 = v16;
    id v11 = v16;
    id v10 = v13;
    [v17 performWithoutAnimation:v19];
  }
}

void __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) detachFromScene];
  [*(id *)(a1 + 40) attachToScene:v2];
}

void __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke_3;
    v5[3] = &unk_1E6D77D90;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v4 = (void (**)(id, void))MEMORY[0x1E4E42950](*(void *)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  v4[2](v4, *(void *)(a1 + 40));
}

- (void)tearDownAutomationWindow
{
  char v3 = [(id)*MEMORY[0x1E4FB2608] supportsMultipleScenes];
  browserControllers = self->_browserControllers;
  if (v3)
  {
    id v12 = [(NSArray *)browserControllers safari_firstObjectPassingTest:&__block_literal_global_64];
    [v12 closeWindow];
    [(BrowserWindowController *)self _windowDidClose:v12];
  }
  else
  {
    uint64_t v5 = [(NSArray *)browserControllers objectAtIndexedSubscript:0];
    unsigned int v6 = [v5 isControlledByAutomation];

    uint64_t v7 = [(NSArray *)self->_browserControllers objectAtIndexedSubscript:v6];
    id v8 = [(NSArray *)self->_browserControllers objectAtIndexedSubscript:v6 ^ 1];
    [(BrowserWindowController *)self _windowDidClose:v8];
    id v9 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__BrowserWindowController_tearDownAutomationWindow__block_invoke;
    v13[3] = &unk_1E6D77D90;
    id v14 = v8;
    id v15 = v7;
    id v10 = v7;
    id v11 = v8;
    [v9 performWithoutAnimation:v13];
  }
}

void __51__BrowserWindowController_tearDownAutomationWindow__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) detachFromScene];
  [*(id *)(a1 + 40) attachToScene:v2];
}

uint64_t __51__BrowserWindowController_tearDownAutomationWindow__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isControlledByAutomation];
}

- (void)saveBrowserState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = [(BrowserWindowController *)self _browserWindowsToPersist];
  [(_SFBrowserSavedState *)self->_savedState setBrowserWindows:v3];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_browserControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isControlledByAutomation", (void)v14))
        {
          id v10 = [v9 windowStateData];
          long long v18 = v10;
          id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
          id v12 = [v9 savedState];
          [v12 setBrowserWindows:v11];
        }
        uint64_t v13 = [v9 tabController];
        [v13 saveStateInBackground:0];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }
}

- (id)_mergeAndSaveWindowStates:(id)a3 intoWindowState:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v20 = [(BrowserWindowController *)self _mergeWindowStates:v6 intoWindowState:v7];
  id v21 = v6;
  id v8 = (void *)[v6 mutableCopy];
  [v8 removeObject:v7];
  [(WBTabGroupManager *)self->_tabGroupManager deleteWindowStates:v8 completionHandler:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = [MEMORY[0x1E4F78558] settings];
        id v16 = objc_alloc(MEMORY[0x1E4F29128]);
        long long v17 = [v14 uuid];
        long long v18 = (void *)[v16 initWithUUIDString:v17];
        [v15 removeWindowWithUUID:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  return v20;
}

- (id)_mergeWindowStates:(id)a3 intoWindowState:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_INFO, "Merging window states", buf, 2u);
  }
  id v8 = [MEMORY[0x1E4F1CA80] set];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke;
  v79[3] = &unk_1E6D7B388;
  id v10 = v6;
  id v80 = v10;
  id v11 = v8;
  id v81 = v11;
  long long v60 = v5;
  uint64_t v12 = objc_msgSend(v5, "safari_reduceObjectsWithInitialValue:usingBlock:", v9, v79);

  tabGroupManager = self->_tabGroupManager;
  long long v14 = [v10 localTabGroup];
  long long v67 = v10;
  long long v15 = [v10 localTabGroup];
  id v16 = [v15 tabs];
  long long v17 = [v16 lastObject];
  long long v58 = v11;
  long long v59 = (void *)v12;
  [(WBTabGroupManager *)tabGroupManager moveTabs:v12 toTabGroup:v14 afterTab:v17 withoutPersistingTabGroupsWithUUIDStrings:v11];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = [(WBTabGroupManager *)self->_tabGroupManager namedProfiles];
  uint64_t v63 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v76;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v76 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v66 = v18;
        uint64_t v19 = self->_tabGroupManager;
        long long v64 = *(void **)(*((void *)&v75 + 1) + 8 * v18);
        id v20 = [v64 identifier];
        id v21 = [(WBTabGroupManager *)v19 unnamedTabGroupsForProfileWithIdentifier:v20];

        long long v22 = [MEMORY[0x1E4F1CA48] array];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v23 = v21;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v71 objects:v84 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          id v26 = 0;
          uint64_t v27 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v72 != v27) {
                objc_enumerationMutation(v23);
              }
              long long v29 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              if (v26
                || ([v67 unnamedTabGroupUUIDs],
                    long long v30 = objc_claimAutoreleasedReturnValue(),
                    [v29 uuid],
                    long long v31 = objc_claimAutoreleasedReturnValue(),
                    int v32 = [v30 containsObject:v31],
                    v31,
                    v30,
                    !v32))
              {
                [v22 addObject:v29];
              }
              else
              {
                id v26 = v29;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v71 objects:v84 count:16];
          }
          while (v25);
        }
        else
        {
          id v26 = 0;
        }

        if ([v22 count])
        {
          if (v26) {
            goto LABEL_25;
          }
          long long v33 = (void *)MEMORY[0x1E4FB6080];
          id v34 = [(WBTabGroupManager *)self->_tabGroupManager deviceIdentifier];
          uint64_t v35 = [v33 unnamedTabGroupWithDeviceIdentifier:v34];

          uint64_t v36 = [v64 identifier];
          [v35 setProfileIdentifier:v36];

          id v26 = [(WBTabGroupManager *)self->_tabGroupManager insertUnnamedTabGroup:v35];
          uint64_t v37 = [v35 uuid];
          [v67 addUnnamedTabGroupUUID:v37];

          long long v38 = [(WBTabGroupManager *)self->_tabGroupManager tabCollection];
          char v39 = [v38 saveWindowState:v67];

          if (v39)
          {

LABEL_25:
            uint64_t v35 = objc_msgSend(v22, "safari_reduceObjectsUsingBlock:", &__block_literal_global_71);
            uint64_t v40 = self->_tabGroupManager;
            id v41 = [v26 tabs];
            id v42 = [v41 lastObject];
            [(WBTabGroupManager *)v40 moveTabs:v35 toTabGroup:v26 afterTab:v42 withoutPersistingTabGroupsWithUUIDStrings:0];
          }
          else
          {
            BOOL v44 = WBS_LOG_CHANNEL_PREFIXProfiles();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              -[BrowserWindowController _mergeWindowStates:intoWindowState:](buf, &buf[1], v44);
            }
          }
          uint64_t v43 = v66;

          goto LABEL_28;
        }
        uint64_t v43 = v66;
LABEL_28:

        uint64_t v18 = v43 + 1;
      }
      while (v18 != v63);
      uint64_t v45 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
      uint64_t v63 = v45;
    }
    while (v45);
  }

  v46 = [MEMORY[0x1E4F1CA80] set];

  v47 = [MEMORY[0x1E4F1CA48] array];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke_2;
  v68[3] = &unk_1E6D7B388;
  id v69 = v67;
  id v70 = v46;
  id v48 = v46;
  id v49 = v67;
  v50 = objc_msgSend(v60, "safari_reduceObjectsWithInitialValue:usingBlock:", v47, v68);

  id v51 = self->_tabGroupManager;
  id v52 = [v49 privateTabGroup];
  id v53 = [v49 privateTabGroup];
  long long v54 = [v53 tabs];
  long long v55 = [v54 lastObject];
  [(WBTabGroupManager *)v51 moveTabs:v50 toTabGroup:v52 afterTab:v55 withoutPersistingTabGroupsWithUUIDStrings:v48];

  id v83 = v49;
  long long v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];

  return v56;
}

id __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 uuid];
  id v8 = [*(id *)(a1 + 32) uuid];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = *(void **)(a1 + 40);
    id v11 = [v5 localTabGroup];
    uint64_t v12 = [v11 uuid];
    [v10 addObject:v12];

    uint64_t v13 = [v5 localTabGroup];
    long long v14 = [v13 tabs];
    [v6 addObjectsFromArray:v14];
  }
  return v6;
}

id __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 tabs];
  if (v4)
  {
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

    id v5 = (void *)v6;
  }

  return v5;
}

id __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 uuid];
  id v8 = [*(id *)(a1 + 32) uuid];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = *(void **)(a1 + 40);
    id v11 = [v5 privateTabGroup];
    uint64_t v12 = [v11 uuid];
    [v10 addObject:v12];

    uint64_t v13 = [v5 privateTabGroup];
    long long v14 = [v13 tabs];
    [v6 addObjectsFromArray:v14];
  }
  return v6;
}

- (void)_restoreWindowsFromBrowserSavedState:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_savedState, a3);
  id v6 = [v5 browserWindows];
  id v7 = (void *)[(NSArray *)self->_browserControllers mutableCopy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    unint64_t v11 = 0x1E6D75000uLL;
    do
    {
      uint64_t v12 = 0;
      uint64_t v26 = v9;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
        long long v14 = WBS_LOG_CHANNEL_PREFIXTabs();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          long long v15 = v14;
          [v13 UUID];
          uint64_t v16 = v10;
          long long v17 = v7;
          uint64_t v18 = self;
          id v19 = v5;
          id v21 = v20 = v11;
          long long v22 = [v13 sceneID];
          *(_DWORD *)buf = 138543618;
          long long v33 = v21;
          __int16 v34 = 2114;
          uint64_t v35 = v22;
          _os_log_impl(&dword_1E102C000, v15, OS_LOG_TYPE_INFO, "Loading window from saved state: uuid = %{public}@, sceneID = %{public}@", buf, 0x16u);

          unint64_t v11 = v20;
          id v5 = v19;
          self = v18;
          id v7 = v17;
          uint64_t v10 = v16;
          uint64_t v9 = v26;
        }
        id v23 = (void *)[objc_alloc(*(Class *)(v11 + 1776)) initWithStateData:v13 browserWindowController:self savedState:v5 controlledByAutomation:0];
        [v7 addObject:v23];

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v9);
  }

  uint64_t v24 = (NSArray *)[v7 copy];
  browserControllers = self->_browserControllers;
  self->_browserControllers = v24;
}

- (id)_browserWindowsToPersist
{
  browserControllers = self->_browserControllers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__BrowserWindowController__browserWindowsToPersist__block_invoke;
  v5[3] = &unk_1E6D7B3D0;
  v5[4] = self;
  char v3 = [(NSArray *)browserControllers safari_mapAndFilterObjectsUsingBlock:v5];
  return v3;
}

id __51__BrowserWindowController__browserWindowsToPersist__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 savedState];
  id v5 = *(void **)(*(void *)(a1 + 32) + 32);

  if (v4 == v5)
  {
    id v6 = [v3 windowStateData];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)dispatchNavigationIntent:(id)a3
{
  id v3 = a3;
  id v4 = +[Application sharedApplication];
  [v4 handleNavigationIntent:v3 completion:0];
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = [v17 sourceWindowUUID];
  uint64_t v8 = [(BrowserWindowController *)self browserControllerWithUUID:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(NSArray *)self->_browserControllers firstObject];
  }
  unint64_t v11 = v10;

  unint64_t v12 = [v17 policy];
  if (v12 <= 6)
  {
    if (v12 == 4)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F22488], "_sf_windowCreationActivityWithNavigationIntent:", v17);
      id v14 = objc_alloc_init(MEMORY[0x1E4FB1B80]);
      long long v15 = [v11 scene];
      [v14 setRequestingScene:v15];

      uint64_t v16 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v16 requestSceneSessionActivation:0 userActivity:v13 options:v14 errorHandler:0];

      if (v6) {
        v6[2](v6, 1);
      }
    }
    else
    {
      [v11 handleNavigationIntent:v17 completion:v6];
    }
  }
}

- (BOOL)cloudTabsEnabled
{
  return self->_cloudTabsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontmostProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudTabStore, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesVendor, 0);
  objc_storeStrong((id *)&self->_pinnedTabsManager, 0);
  objc_storeStrong((id *)&self->_browserControllers, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_privateBrowsingPageZoomManager, 0);
  objc_storeStrong(&self->_automationWindowInitializedCompletionHandler, 0);
  objc_storeStrong((id *)&self->_savedState, 0);
  objc_storeStrong((id *)&self->_UIDelegatesByBrowserController, 0);
  objc_storeStrong(&self->_browserControllerUIDelegateProvider, 0);
}

void __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Background task expired while waiting for cloud tabs to synchronize", v1, 2u);
}

- (void)_mergeWindowStates:(os_log_t)log intoWindowState:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Failed to save unnamed tab group in window state when merging windows", buf, 2u);
}

@end