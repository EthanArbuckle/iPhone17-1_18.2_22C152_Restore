@interface WBSCloudExtensionStateManager
+ (BOOL)_determineEnabledStateFromCloudExtensionState:(id)a3 forProfileServerID:(id)a4;
+ (BOOL)test_determineEnabledStateFromCloudExtensionState:(id)a3 forProfileServerID:(id)a4;
+ (WBSCloudExtensionStateManager)sharedManager;
+ (id)_cloudExtensionStatesDictionaryForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4;
+ (id)_determineNewTabPageFromCloudDeviceState:(id)a3;
+ (id)_removeDeviceWithUUIDString:(id)a3 fromCloudDevices:(id)a4;
+ (id)_removeStatesForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4;
+ (id)_singleExtensionStates:(id)a3 withStateRemovedForDeviceWithUUIDString:(id)a4;
+ (id)_uuidStringsOfInactiveCloudDevices:(id)a3 currentDeviceUUIDString:(id)a4;
+ (id)test_cloudExtensionStatesDictionaryForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4;
+ (id)test_determineNewTabPageFromCloudDeviceState:(id)a3;
+ (id)test_removeDeviceWithUUIDString:(id)a3 fromCloudDevices:(id)a4;
+ (id)test_removeStatesForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4;
+ (id)test_uuidStringsOfInactiveCloudDevices:(id)a3 currentDeviceUUIDString:(id)a4;
- (BOOL)_cloudDeviceMatchesLocalDeviceForCurrentDevice;
- (BOOL)_cloudExtensionStatesMatchLocalExtensionStatesForCurrentDevice;
- (BOOL)_cloudStateMatchesLocalStateForCurrentDevice;
- (BOOL)_hasInstalledApplicationWithIdentifier:(id)a3;
- (BOOL)isExtensionEnabledInCloudWithComposedIdentifier:(id)a3 forProfileServerID:(id)a4;
- (BOOL)isExtensionSyncEnabled;
- (WBSCloudExtensionStateManager)init;
- (id)_allComposedIdentifiersAssociatedWithComposedIdentifier:(id)a3;
- (id)_cloudExtensionStateAssociatedWithComposedIdentifier:(id)a3;
- (id)_cloudExtensionStateForComposedIdentifiers:(id)a3;
- (id)_composedIdentifierForBundleIdentifier:(id)a3 relatedToComposedIdentifier:(id)a4;
- (id)_defaultWebExtensionsController;
- (id)_extensionDeviceDictionaryForCurrentDevice;
- (id)_extensionStatesDictionaryForCurrentDevice;
- (id)extensionAppsFromOtherDevices;
- (int64_t)manateeState;
- (void)_cloudExtensionStatesWereUpdated;
- (void)_deleteCurrentDeviceFromCloudKit;
- (void)_determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)_determineExtensionSyncAvailabilityWithCompletionHandler:(id)a3;
- (void)_ensureCurrentDeviceIsSavedPeriodically;
- (void)_extensionDeviceDictionaryForCurrentDevice;
- (void)_extensionSyncEnabledStateDidChangeDistributedNotificationHandler:(id)a3;
- (void)_getCloudExtensionStatesWithCompletionHandler:(id)a3;
- (void)_getCloudSettingsContainerManateeStateWithCompletionHandler:(id)a3;
- (void)_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:(id)a3;
- (void)_managedExtensionStateDidChange:(id)a3;
- (void)_pruneInactiveDevicesFromCloudKitWithCompletionHandler:(id)a3;
- (void)_saveCurrentDeviceToCloudKitWithCompletionHandler:(id)a3;
- (void)_saveExtensionStatesWithDictionaryRepresentation:(id)a3 forDevice:(id)a4 completionHandler:(id)a5;
- (void)_schedulePruningOfInactiveDevices;
- (void)_updateCloudExtensionStatesFromSafariBookmarksSyncAgent:(id)a3;
- (void)_updateLocalStateFromCloudExtensionState;
- (void)_updateStateProvidersFromCloudExtensionState;
- (void)addProvider:(id)a3;
- (void)getLockupViewsForAppsOnOtherDevicesWithCompletionHandler:(id)a3;
- (void)localExtensionStateDidChange;
- (void)removeProvider:(id)a3;
- (void)setExtensionSyncEnabled:(BOOL)a3;
- (void)setManateeState:(int64_t)a3;
- (void)updateNewTabPageFromCloudDeviceState;
@end

@implementation WBSCloudExtensionStateManager

- (void)_updateStateProvidersFromCloudExtensionState
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(NSDictionary *)self->_cloudExtensionStates allValues];
  v5 = [v4 firstObject];
  v6 = [v5 firstObject];

  v43 = v6;
  v7 = [v6 objectForKey:*MEMORY[0x1E4F98820]];

  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB70000, v8, OS_LOG_TYPE_INFO, "Found cloud data in unexpected format, ignoring", buf, 2u);
    }
  }
  else
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    obuint64_t j = self->_cloudExtensionStates;
    uint64_t v9 = [(NSDictionary *)obj countByEnumeratingWithState:&v66 objects:v83 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v67;
      v53 = self;
      v47 = v3;
      uint64_t v44 = *(void *)v67;
      do
      {
        uint64_t v12 = 0;
        uint64_t v45 = v10;
        do
        {
          if (*(void *)v67 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v66 + 1) + 8 * v12);
          if (([v3 containsObject:v13] & 1) == 0)
          {
            uint64_t v48 = v12;
            v14 = [(WBSCloudExtensionStateManager *)self _allComposedIdentifiersAssociatedWithComposedIdentifier:v13];
            v15 = [MEMORY[0x1E4F1CA48] array];
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            v52 = v14;
            id v50 = [(NSDictionary *)v52 countByEnumeratingWithState:&v62 objects:v82 count:16];
            if (v50)
            {
              uint64_t v49 = *(void *)v63;
              do
              {
                for (i = 0; i != v50; i = (char *)i + 1)
                {
                  if (*(void *)v63 != v49) {
                    objc_enumerationMutation(v52);
                  }
                  v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v60 = 0u;
                  long long v61 = 0u;
                  v18 = self->_stateProviders;
                  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v58 objects:v81 count:16];
                  if (v19)
                  {
                    uint64_t v20 = v19;
                    v21 = 0;
                    uint64_t v22 = *(void *)v59;
                    do
                    {
                      for (uint64_t j = 0; j != v20; ++j)
                      {
                        if (*(void *)v59 != v22) {
                          objc_enumerationMutation(v18);
                        }
                        v24 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                        if ([v24 hasExtensionWithComposedIdentifier:v17])
                        {
                          id v25 = v17;

                          [v15 addObject:v24];
                          v21 = v25;
                        }
                      }
                      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v58 objects:v81 count:16];
                    }
                    while (v20);

                    self = v53;
                    if (v21) {
                      goto LABEL_30;
                    }
                  }
                  else
                  {
                  }
                }
                id v50 = [(NSDictionary *)v52 countByEnumeratingWithState:&v62 objects:v82 count:16];
              }
              while (v50);
            }
            v21 = 0;
LABEL_30:
            v26 = v52;

            v27 = [(NSDictionary *)v52 allObjects];
            v3 = v47;
            [v47 addObjectsFromArray:v27];

            if (v21)
            {
              v28 = [(WBSCloudExtensionStateManager *)self _cloudExtensionStateForComposedIdentifiers:v52];
              if ([v28 count])
              {
                long long v56 = 0u;
                long long v57 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                id v51 = v15;
                uint64_t v29 = [v51 countByEnumeratingWithState:&v54 objects:v80 count:16];
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = *(void *)v55;
                  do
                  {
                    for (uint64_t k = 0; k != v30; ++k)
                    {
                      if (*(void *)v55 != v31) {
                        objc_enumerationMutation(v51);
                      }
                      v33 = *(void **)(*((void *)&v54 + 1) + 8 * k);
                      v34 = [v33 profileServerIDForStateManager:v53];
                      uint64_t v35 = [(id)objc_opt_class() _determineEnabledStateFromCloudExtensionState:v28 forProfileServerID:v34];
                      v36 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 141559043;
                        v37 = @"OFF";
                        if (v35) {
                          v37 = @"ON";
                        }
                        uint64_t v71 = 1752392040;
                        __int16 v72 = 2117;
                        v73 = v52;
                        __int16 v74 = 2113;
                        v75 = v37;
                        __int16 v76 = 2113;
                        v77 = v34;
                        __int16 v78 = 2113;
                        v79 = v28;
                        _os_log_impl(&dword_1ABB70000, v36, OS_LOG_TYPE_INFO, "Extensions: %{sensitive, mask.hash}@, cloud state: %{private}@, for profile: %{private}@, computed from: %{private}@", buf, 0x34u);
                      }
                      [v33 setExtensionWithComposedIdentifier:v21 isEnabledInCloud:v35];
                    }
                    uint64_t v30 = [v51 countByEnumeratingWithState:&v54 objects:v80 count:16];
                  }
                  while (v30);
                }

                v3 = v47;
                v26 = v52;
              }
              else
              {
                v38 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  cloudExtensionStates = v53->_cloudExtensionStates;
                  v40 = v38;
                  uint64_t v41 = [(NSDictionary *)cloudExtensionStates count];
                  v42 = v53->_cloudExtensionStates;
                  *(_DWORD *)buf = 134218243;
                  uint64_t v71 = v41;
                  __int16 v72 = 2113;
                  v73 = v42;
                  _os_log_impl(&dword_1ABB70000, v40, OS_LOG_TYPE_INFO, "No cloud state found for extension: in %lu item cloud state %{private}@", buf, 0x16u);
                }
              }

              self = v53;
            }

            uint64_t v11 = v44;
            uint64_t v10 = v45;
            uint64_t v12 = v48;
          }
          ++v12;
        }
        while (v12 != v10);
        uint64_t v10 = [(NSDictionary *)obj countByEnumeratingWithState:&v66 objects:v83 count:16];
      }
      while (v10);
    }
  }
}

+ (WBSCloudExtensionStateManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedManager_manager;
  return (WBSCloudExtensionStateManager *)v2;
}

- (void)addProvider:(id)a3
{
  id v4 = a3;
  stateProviders = self->_stateProviders;
  id v8 = v4;
  if (!stateProviders)
  {
    v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    v7 = self->_stateProviders;
    self->_stateProviders = v6;

    id v4 = v8;
    stateProviders = self->_stateProviders;
  }
  [(NSMutableArray *)stateProviders addObject:v4];
}

void __46__WBSCloudExtensionStateManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSCloudExtensionStateManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
}

void __79__WBSCloudExtensionStateManager__getCloudExtensionStatesWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v4 = [MEMORY[0x1E4F983D0] sharedProxy];
    [v4 getCloudExtensionStatesWithCompletionHandler:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"WBSCloudExtensionStateManagerErrorDomain", 0, @"Extension syncing is not available");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
  }
}

void __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke_2;
  v14[3] = &unk_1E5E412F0;
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v9;
  uint64_t v16 = v10;
  id v17 = v8;
  id v18 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

- (WBSCloudExtensionStateManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)WBSCloudExtensionStateManager;
  v2 = [(WBSCloudExtensionStateManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    v2->_extensionSyncEnabled = objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E4F98448], 1);

    id v4 = [MEMORY[0x1E4F98348] sharedController];
    int v5 = [v4 hasAnyExtensionManagement];

    if (v5) {
      [(WBSCloudExtensionStateManager *)v2 setExtensionSyncEnabled:0];
    }
    v2->_manateeState = 0;
    v6 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v6 addObserver:v2 selector:sel__updateCloudExtensionStatesFromSafariBookmarksSyncAgent_ name:*MEMORY[0x1E4F987A0] object:0];

    id v7 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v7 addObserver:v2 selector:sel__extensionSyncEnabledStateDidChangeDistributedNotificationHandler_ name:@"CloudExtensionSyncStateDidChange" object:0];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__managedExtensionStateDidChange_ name:*MEMORY[0x1E4F98678] object:0];

    [(WBSCloudExtensionStateManager *)v2 _updateCloudExtensionStatesFromSafariBookmarksSyncAgent:0];
    id v9 = v2;
  }

  return v2;
}

- (void)_updateCloudExtensionStatesFromSafariBookmarksSyncAgent:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_INFO, "Updating cloud extension states from notification: %@", buf, 0xCu);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke;
  v6[3] = &unk_1E5E41318;
  v6[4] = self;
  [(WBSCloudExtensionStateManager *)self _getCloudExtensionStatesWithCompletionHandler:v6];
}

- (void)_getCloudExtensionStatesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_INFO, "Fetching cloud extension state", buf, 2u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__WBSCloudExtensionStateManager__getCloudExtensionStatesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E412A0;
  id v8 = v4;
  id v6 = v4;
  [(WBSCloudExtensionStateManager *)self _determineExtensionSyncAvailabilityWithCompletionHandler:v7];
}

uint64_t __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke_2_cold_1(v2, v3);
    }
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;

    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = 0;

    *(unsigned char *)(*(void *)(a1 + 40) + 40) = 0;
    return [*(id *)(a1 + 40) _updateLocalStateFromCloudExtensionState];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 40) = 1;
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v22 = 138477827;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_INFO, "Received cloud devices: %{private}@", (uint8_t *)&v22, 0xCu);
    }
    objc_super v11 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 56);
      int v22 = 138477827;
      uint64_t v23 = v12;
      _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_INFO, "Received cloud extension state: %{private}@", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v13 = [*(id *)(a1 + 56) copy];
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(v14 + 24);
    *(void *)(v14 + 24) = v13;

    uint64_t v16 = [*(id *)(a1 + 48) copy];
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = *(void **)(v17 + 32);
    *(void *)(v17 + 32) = v16;

    uint64_t v19 = *(void **)(a1 + 40);
    if (!v19[6])
    {
      [v19 _schedulePruningOfInactiveDevices];
      uint64_t v19 = *(void **)(a1 + 40);
    }
    [v19 _cloudExtensionStatesWereUpdated];
    uint64_t v20 = *(void *)(a1 + 40);
    if (!*(unsigned char *)(v20 + 8))
    {
      *(unsigned char *)(v20 + 8) = 1;
      if (([*(id *)(a1 + 40) _cloudStateMatchesLocalStateForCurrentDevice] & 1) == 0)
      {
        v21 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_1ABB70000, v21, OS_LOG_TYPE_INFO, "Cloud state for the current device doesn't match local state, saving extension state to cloud", (uint8_t *)&v22, 2u);
        }
        [*(id *)(a1 + 40) localExtensionStateDidChange];
      }
    }
    uint64_t result = *(void *)(a1 + 40);
    if (*(unsigned char *)(result + 65) && !*(void *)(result + 56)) {
      return [(id)result _ensureCurrentDeviceIsSavedPeriodically];
    }
  }
  return result;
}

void __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Fetching cloud extension states failed with error %{public}@", v7, v8, v9, v10, v11);
}

- (void)_updateLocalStateFromCloudExtensionState
{
  [(WBSCloudExtensionStateManager *)self _updateStateProvidersFromCloudExtensionState];
  [(WBSCloudExtensionStateManager *)self updateNewTabPageFromCloudDeviceState];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"WBSCloudExtensionStateDidChange" object:0];
}

- (void)updateNewTabPageFromCloudDeviceState
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_cloudDevices count])
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v4 = [(id)objc_opt_class() _determineNewTabPageFromCloudDeviceState:self->_cloudDevices];
    uint64_t v5 = [(WBSCloudExtensionStateManager *)self _defaultWebExtensionsController];
    uint64_t v6 = [v5 tabOverridePreferencesManager];
    uint64_t v7 = [v6 extensionComposedIdentifierForNewTabPreferenceInDefaults:v3];

    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558275;
      uint64_t v33 = 1752392040;
      __int16 v34 = 2117;
      uint64_t v35 = v4;
      _os_log_impl(&dword_1ABB70000, v8, OS_LOG_TYPE_INFO, "Attempting to set local new tab page from sync to %{sensitive, mask.hash}@", buf, 0x16u);
    }
    if (v4 == v7 || [v4 isEqualToString:v7])
    {
      uint64_t v9 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_INFO, "Skipping setting local new tab page because there would be no change", buf, 2u);
      }
    }
    else
    {
      if ([v4 length])
      {
        [(WBSCloudExtensionStateManager *)self _allComposedIdentifiersAssociatedWithComposedIdentifier:v4];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v28;
          while (2)
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = objc_msgSend(v5, "extensionWithComposedIdentifier:", *(void *)(*((void *)&v27 + 1) + 8 * v15), (void)v27);
              uint64_t v17 = [v5 webExtensionForExtension:v16];

              if (v17)
              {

                uint64_t v19 = (void *)[v17 newTabOverridePageURL];
                uint64_t v20 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
                BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
                if (v19)
                {
                  if (v21)
                  {
                    *(_DWORD *)buf = 141558275;
                    uint64_t v33 = 1752392040;
                    __int16 v34 = 2117;
                    uint64_t v35 = v4;
                    _os_log_impl(&dword_1ABB70000, v20, OS_LOG_TYPE_INFO, "Setting the new tab page to be existing extension %{sensitive, mask.hash}@ from sync", buf, 0x16u);
                  }
                  int v22 = [v5 tabOverridePreferencesManager];
                  uint64_t v23 = [v17 composedIdentifier];
                  [v22 setNewTabBehaviorWithExtensionComposedIdentifier:v23 inDefaults:v3 fromUserGesture:0];

                  uint64_t v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
                  [v24 postNotificationName:@"WBSNewTabPageDidChange" object:0];
                }
                else if (v21)
                {
                  *(_DWORD *)buf = 141558275;
                  uint64_t v33 = 1752392040;
                  __int16 v34 = 2117;
                  uint64_t v35 = v4;
                  _os_log_impl(&dword_1ABB70000, v20, OS_LOG_TYPE_INFO, "New tab page extension %{sensitive, mask.hash}@ not set from sync because it doesn't have a new tab page", buf, 0x16u);
                }

                goto LABEL_31;
              }
              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        id v18 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 141558275;
          uint64_t v33 = 1752392040;
          __int16 v34 = 2117;
          uint64_t v35 = v4;
          _os_log_impl(&dword_1ABB70000, v18, OS_LOG_TYPE_INFO, "New tab page extension %{sensitive, mask.hash}@ not set from sync because it's not installed on the system", buf, 0x16u);
        }
      }
      else
      {
        id v25 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB70000, v25, OS_LOG_TYPE_INFO, "Clearing local new tab page from sync", buf, 2u);
        }
        v26 = [v5 tabOverridePreferencesManager];
        [v26 clearNewTabBehaviorInDefaults:v3 fromUserGesture:0];

        id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v11 postNotificationName:@"WBSNewTabPageDidChange" object:0];
      }
LABEL_31:
    }
  }
  else
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Skipping updating new tab page from cloud state since there aren't any cloud devices", buf, 2u);
    }
  }
}

- (void)_determineExtensionSyncAvailabilityWithCompletionHandler:(id)a3
{
}

- (void)_determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if ((a3 || self->_extensionSyncEnabled) && self->_manateeState != 2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __115__WBSCloudExtensionStateManager__determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled_completionHandler___block_invoke;
    v8[3] = &unk_1E5E411B0;
    v8[4] = self;
    id v9 = v6;
    [(WBSCloudExtensionStateManager *)self _getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:v8];
  }
  else
  {
    self->_hasSuccessfullyUpdatedCloudExtensionStatesAtLeastOnce = 0;
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F98390] sharedObserver];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__WBSCloudExtensionStateManager__getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E41200;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:v7];
}

uint64_t __98__WBSCloudExtensionStateManager__getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __115__WBSCloudExtensionStateManager__determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3[9] == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
  else {
    return [v3 _getCloudSettingsContainerManateeStateWithCompletionHandler:v4];
  }
}

void __98__WBSCloudExtensionStateManager__getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__WBSCloudExtensionStateManager__getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5E411D8;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)setExtensionSyncEnabled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_extensionSyncEnabled != a3)
  {
    BOOL v3 = a3;
    char v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      uint64_t v7 = v6;
      int v11 = 138543362;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_INFO, "Changing extension sync enabled to %{public}@", (uint8_t *)&v11, 0xCu);
    }
    self->_extensionSyncEnabled = v3;
    id v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v8 setBool:v3 forKey:*MEMORY[0x1E4F98448]];

    if (v3)
    {
      [(WBSCloudExtensionStateManager *)self localExtensionStateDidChange];
    }
    else
    {
      [(WBSPeriodicActivityScheduler *)self->_periodicDeviceSavingScheduler invalidate];
      periodicDeviceSavingScheduler = self->_periodicDeviceSavingScheduler;
      self->_periodicDeviceSavingScheduler = 0;

      [(WBSCloudExtensionStateManager *)self _deleteCurrentDeviceFromCloudKit];
    }
    [(WBSCloudExtensionStateManager *)self _updateCloudExtensionStatesFromSafariBookmarksSyncAgent:0];
    uint64_t v10 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v10 postNotificationName:@"CloudExtensionSyncStateDidChange" object:0 userInfo:0 deliverImmediately:1];
  }
}

- (void)removeProvider:(id)a3
{
}

- (void)localExtensionStateDidChange
{
  if (self->_extensionSyncEnabled && [(NSMutableArray *)self->_stateProviders count])
  {
    BOOL v3 = [(WBSCloudExtensionStateManager *)self _extensionDeviceDictionaryForCurrentDevice];
    if (v3)
    {
      id v4 = [(WBSCloudExtensionStateManager *)self _extensionStatesDictionaryForCurrentDevice];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke;
      v5[3] = &unk_1E5E41138;
      v5[4] = self;
      [(WBSCloudExtensionStateManager *)self _saveExtensionStatesWithDictionaryRepresentation:v4 forDevice:v3 completionHandler:v5];
    }
  }
}

void __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke_cold_1(v4);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke_25;
    block[3] = &unk_1E5E40968;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke_25(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  objc_msgSend(v2, "safari_setDate:forKey:", v3, *MEMORY[0x1E4F98460]);

  uint64_t result = [*(id *)(a1 + 32) _ensureCurrentDeviceIsSavedPeriodically];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 64))
  {
    char v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_INFO, "Performing requested fetch after saving cloud extension states", v6, 2u);
    }
    uint64_t result = [*(id *)(a1 + 32) _updateCloudExtensionStatesFromSafariBookmarksSyncAgent:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  }
  return result;
}

- (void)getLockupViewsForAppsOnOtherDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = +[WBSASCLockupViewGenerator sharedGenerator];
  char v5 = [(WBSCloudExtensionStateManager *)self extensionAppsFromOtherDevices];
  [v6 generateLockupViewsForAvailableApps:v5 forExtensionImport:0 completionHandler:v4];
}

- (BOOL)_hasInstalledApplicationWithIdentifier:(id)a3
{
  id v3 = a3;
  int v4 = [v3 intValue];
  char v5 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  uint64_t v6 = [v5 nextObject];
  if (!v6)
  {
    LOBYTE(v13) = 0;
    goto LABEL_12;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = v4;
  while (v8)
  {
    id v9 = [v7 iTunesMetadata];
    uint64_t v10 = [v9 storeItemIdentifier];

    if (v10 == v8) {
      goto LABEL_10;
    }
LABEL_7:
    uint64_t v13 = [v5 nextObject];

    uint64_t v7 = (void *)v13;
    if (!v13) {
      goto LABEL_11;
    }
  }
  int v11 = [v7 applicationIdentifier];
  char v12 = [v3 isEqualToString:v11];

  if ((v12 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_10:
  LOBYTE(v13) = 1;
LABEL_11:

LABEL_12:
  return v13;
}

- (id)extensionAppsFromOtherDevices
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v49 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  int v4 = self->_cloudExtensionStates;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v69 objects:v80 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v70;
    v53 = (void *)*MEMORY[0x1E4F98810];
    v52 = (void *)*MEMORY[0x1E4F98828];
    uint64_t v50 = *MEMORY[0x1E4F987B8];
    uint64_t v48 = *MEMORY[0x1E4F98468];
    id v51 = self;
    long long v60 = v3;
    long long v54 = v4;
    uint64_t v59 = *(void *)v70;
    do
    {
      uint64_t v8 = 0;
      uint64_t v55 = v6;
      do
      {
        if (*(void *)v70 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v69 + 1) + 8 * v8);
        if (([v3 containsObject:v9] & 1) == 0)
        {
          long long v61 = [(WBSCloudExtensionStateManager *)self _allComposedIdentifiersAssociatedWithComposedIdentifier:v9];
          uint64_t v10 = -[WBSCloudExtensionStateManager _cloudExtensionStateForComposedIdentifiers:](self, "_cloudExtensionStateForComposedIdentifiers:");
          int v11 = (void *)MEMORY[0x1E4F1CAD0];
          stateProviders = self->_stateProviders;
          v68[0] = MEMORY[0x1E4F143A8];
          v68[1] = 3221225472;
          v68[2] = __62__WBSCloudExtensionStateManager_extensionAppsFromOtherDevices__block_invoke;
          v68[3] = &unk_1E5E41160;
          v68[4] = self;
          uint64_t v13 = [(NSMutableArray *)stateProviders safari_mapObjectsUsingBlock:v68];
          uint64_t v14 = [v11 setWithArray:v13];

          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __62__WBSCloudExtensionStateManager_extensionAppsFromOtherDevices__block_invoke_2;
          v66[3] = &unk_1E5E41188;
          v66[4] = self;
          id v15 = v10;
          id v67 = v15;
          if (objc_msgSend(v14, "safari_containsObjectPassingTest:", v66))
          {
            long long v58 = v14;
            id v16 = v53;
            id v17 = v52;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            id v57 = v15;
            id v18 = v15;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v79 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v63;
LABEL_10:
              uint64_t v22 = 0;
              while (1)
              {
                if (*(void *)v63 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void **)(*((void *)&v62 + 1) + 8 * v22);
                uint64_t v24 = objc_msgSend(v23, "safari_stringForKey:returningNilIfEmpty:", v16, 1);
                if (v24)
                {
                  long long v27 = (void *)v24;

                  long long v28 = 0;
                  self = v51;
                  goto LABEL_24;
                }
                uint64_t v25 = objc_msgSend(v23, "safari_stringForKey:returningNilIfEmpty:", v17, 1);
                if (v25) {
                  break;
                }
                if (v20 == ++v22)
                {
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v62 objects:v79 count:16];
                  self = v51;
                  if (v20) {
                    goto LABEL_10;
                  }
                  goto LABEL_17;
                }
              }
              long long v29 = (void *)v25;
              long long v28 = objc_msgSend(v23, "safari_stringForKey:", v50);

              self = v51;
              if (v28) {
                goto LABEL_25;
              }
            }
            else
            {
LABEL_17:
            }
            long long v30 = [v18 firstObject];
            long long v28 = objc_msgSend(v30, "safari_stringForKey:", v50);

            if ([MEMORY[0x1E4F98318] isInternalInstall])
            {
              uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
              v32 = [v31 dictionaryForKey:v48];
              long long v27 = objc_msgSend(v32, "safari_stringForKey:", v28);

              if (v27)
              {
LABEL_24:
                uint64_t v33 = NSString;
                __int16 v34 = developerIdentifierFromComposedIdentifier(v9);
                uint64_t v35 = [v33 stringWithFormat:@"%@.%@", v34, v27];

                int v56 = 0;
                goto LABEL_27;
              }
            }
            else
            {
LABEL_25:
              long long v27 = 0;
            }
            uint64_t v35 = 0;
            int v56 = 1;
LABEL_27:
            if (v35) {
              uint64_t v36 = v35;
            }
            else {
              uint64_t v36 = v28;
            }
            BOOL v37 = [(WBSCloudExtensionStateManager *)self _hasInstalledApplicationWithIdentifier:v36];
            v38 = [v61 allObjects];
            [v60 addObjectsFromArray:v38];

            if (v37)
            {
              v39 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                __int16 v74 = v9;
                _os_log_impl(&dword_1ABB70000, v39, OS_LOG_TYPE_INFO, "Skipping %{private}@ in extensionAppsFromOtherDevices because its containing app is installed", buf, 0xCu);
              }
            }
            else
            {
              if (v56) {
                v40 = v28;
              }
              else {
                v40 = v27;
              }
              id v41 = v40;
              if (v41)
              {
                v42 = [v49 objectForKeyedSubscript:v41];

                if (!v42)
                {
                  v43 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138478339;
                    __int16 v74 = v9;
                    __int16 v75 = 2113;
                    __int16 v76 = v28;
                    __int16 v77 = 2113;
                    __int16 v78 = v27;
                    _os_log_impl(&dword_1ABB70000, v43, OS_LOG_TYPE_INFO, "Creating available app for composed identifier: %{private}@ with adamID: %{private}@, platform specific bundle identifier: %{private}@", buf, 0x20u);
                  }
                  uint64_t v44 = [[WBSAvailableAppWithExtension alloc] initWithAdamID:v28 platformSpecificBundleID:v27];
                  if ((v56 & 1) == 0)
                  {
                    uint64_t v45 = developerIdentifierFromComposedIdentifier(v9);
                    [(WBSAvailableAppWithExtension *)v44 setRequiredTeamID:v45];
                  }
                  [v49 setObject:v44 forKeyedSubscript:v41];
                }
              }
            }
            id v3 = v60;
            int v4 = v54;
            uint64_t v6 = v55;
            id v15 = v57;
            uint64_t v14 = v58;
          }
          else
          {
            v26 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              __int16 v74 = v9;
              _os_log_impl(&dword_1ABB70000, v26, OS_LOG_TYPE_INFO, "Skipping %{private}@ in extensionAppsFromOtherDevices because it wouldn't be enabled", buf, 0xCu);
            }
          }

          uint64_t v7 = v59;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v69 objects:v80 count:16];
    }
    while (v6);
  }

  v46 = [v49 allValues];

  return v46;
}

uint64_t __62__WBSCloudExtensionStateManager_extensionAppsFromOtherDevices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 profileServerIDForStateManager:*(void *)(a1 + 32)];
}

uint64_t __62__WBSCloudExtensionStateManager_extensionAppsFromOtherDevices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _determineEnabledStateFromCloudExtensionState:*(void *)(a1 + 40) forProfileServerID:v3];

  return v4;
}

- (BOOL)isExtensionEnabledInCloudWithComposedIdentifier:(id)a3 forProfileServerID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(WBSCloudExtensionStateManager *)self _cloudExtensionStateAssociatedWithComposedIdentifier:a3];
  if ([v7 count]) {
    char v8 = [(id)objc_opt_class() _determineEnabledStateFromCloudExtensionState:v7 forProfileServerID:v6];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (void)setManateeState:(int64_t)a3
{
  if (self->_manateeState != a3)
  {
    self->_manateeState = a3;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"WBSCloudExtensionManateeStateDidChange" object:0];
  }
}

- (void)_getCloudSettingsContainerManateeStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F983D0] sharedProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__WBSCloudExtensionStateManager__getCloudSettingsContainerManateeStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E41200;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getCloudSettingsContainerManateeStateWithCompletionHandler:v7];
}

void __93__WBSCloudExtensionStateManager__getCloudSettingsContainerManateeStateWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__WBSCloudExtensionStateManager__getCloudSettingsContainerManateeStateWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5E411D8;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __93__WBSCloudExtensionStateManager__getCloudSettingsContainerManateeStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 48)) {
      id v3 = @"is";
    }
    else {
      id v3 = @"is not";
    }
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_INFO, "Encryption %{public}@ supported for cloud extension state", (uint8_t *)&v6, 0xCu);
  }
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [*(id *)(a1 + 32) setManateeState:v4];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_extensionDeviceDictionaryForCurrentDevice
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(WBSCloudExtensionStateManager *)self _defaultWebExtensionsController];
  id v3 = [v2 _deviceUUIDString];
  if ([v3 length])
  {
    uint64_t v4 = [MEMORY[0x1E4F982F8] currentDevice];
    char v5 = [v4 userAssignedName];

    if (![(__CFString *)v5 length])
    {
      int v6 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[WBSCloudExtensionStateManager _extensionDeviceDictionaryForCurrentDevice]();
      }

      char v5 = &stru_1F031A860;
    }
    uint64_t v7 = *MEMORY[0x1E4F987E8];
    v15[0] = *MEMORY[0x1E4F987C8];
    v15[1] = v7;
    v16[0] = v5;
    v16[1] = v3;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    id v9 = [v2 tabOverridePreferencesManager];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v11 = [v9 cloudExtensionStateForDefaults:v10];
    char v12 = objc_msgSend(v8, "safari_dictionaryByMergingWithDictionary:", v11);
  }
  else
  {
    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WBSCloudExtensionStateManager _extensionDeviceDictionaryForCurrentDevice]();
    }
    char v12 = 0;
  }

  return v12;
}

- (id)_extensionStatesDictionaryForCurrentDevice
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v37 = [MEMORY[0x1E4F1CA60] dictionary];
  stateProviders = self->_stateProviders;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __75__WBSCloudExtensionStateManager__extensionStatesDictionaryForCurrentDevice__block_invoke;
  v46[3] = &unk_1E5E41228;
  v46[4] = self;
  [(NSMutableArray *)stateProviders sortedArrayUsingComparator:v46];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v43;
    uint64_t v36 = *MEMORY[0x1E4F98838];
    long long v27 = self;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(obj);
        }
        char v5 = *(void **)(*((void *)&v42 + 1) + 8 * v4);
        int v6 = [v5 cloudExtensionStateForStateManager:self];
        if (filteredStateDictionaryForExtensionState_once != -1) {
          dispatch_once(&filteredStateDictionaryForExtensionState_once, &__block_literal_global_183);
        }
        v32 = objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_186);
        uint64_t v7 = [v5 profileServerIDForStateManager:self];
        if (v7)
        {
          uint64_t v31 = v4;
          __int16 v34 = v7;
          BOOL v33 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:");
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v30 = v6;
          id v8 = v6;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (!v9) {
            goto LABEL_25;
          }
          uint64_t v10 = v9;
          uint64_t v35 = *(void *)v39;
          while (1)
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v39 != v35) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * v11);
              uint64_t v13 = objc_msgSend(v8, "safari_dictionaryForKey:", v12);
              uint64_t v14 = objc_msgSend(v37, "safari_dictionaryForKey:", v12);
              if (!v14)
              {
                if (!v33) {
                  goto LABEL_23;
                }
                uint64_t v14 = objc_msgSend(v32, "safari_dictionaryForKey:", v12);
              }
              uint64_t v15 = objc_msgSend(v14, "safari_dictionaryForKey:", v36);
              if (v15) {
                id v16 = (void *)v15;
              }
              else {
                id v16 = (void *)MEMORY[0x1E4F1CC08];
              }
              id v17 = (void *)[v16 mutableCopy];
              uint64_t v18 = filteredStateDictionaryForEnabledState_once;
              id v19 = v13;
              if (v18 != -1) {
                dispatch_once(&filteredStateDictionaryForEnabledState_once, &__block_literal_global_191);
              }
              uint64_t v20 = objc_msgSend(v19, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_193);

              [v17 setObject:v20 forKeyedSubscript:v34];
              uint64_t v21 = (void *)[v14 mutableCopy];
              uint64_t v22 = (void *)[v17 copy];
              [v21 setObject:v22 forKeyedSubscript:v36];

              uint64_t v23 = (void *)[v21 copy];
              [v37 setObject:v23 forKeyedSubscript:v12];

LABEL_23:
              ++v11;
            }
            while (v10 != v11);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
            if (!v10)
            {
LABEL_25:

              self = v27;
              int v6 = v30;
              uint64_t v4 = v31;
              uint64_t v7 = v34;
              break;
            }
          }
        }

        ++v4;
      }
      while (v4 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v29);
  }
  uint64_t v24 = (void *)[v37 copy];

  return v24;
}

uint64_t __75__WBSCloudExtensionStateManager__extensionStatesDictionaryForCurrentDevice__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 profileServerIDForStateManager:v5];
  LODWORD(v5) = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v7];
  id v8 = [v6 profileServerIDForStateManager:*(void *)(a1 + 32)];

  BOOL v9 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v8];
  char v10 = v5 & !v9;
  if ((v5 & !v9) != 0) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = 1;
  }
  if ((v10 & 1) == 0 && !v9) {
    uint64_t v11 = [v7 compare:v8];
  }

  return v11;
}

- (void)_saveExtensionStatesWithDictionaryRepresentation:(id)a3 forDevice:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v20 = v8;
    __int16 v21 = 2113;
    id v22 = v9;
    _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_INFO, "Saving extension state to cloud: %{private}@, for device: %{private}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __110__WBSCloudExtensionStateManager__saveExtensionStatesWithDictionaryRepresentation_forDevice_completionHandler___block_invoke;
  v15[3] = &unk_1E5E41250;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(WBSCloudExtensionStateManager *)self _determineExtensionSyncAvailabilityWithCompletionHandler:v15];
}

void __110__WBSCloudExtensionStateManager__saveExtensionStatesWithDictionaryRepresentation_forDevice_completionHandler___block_invoke(void *a1, char a2)
{
  if (a2)
  {
    id v4 = [MEMORY[0x1E4F983D0] sharedProxy];
    [v4 saveExtensionStatesWithDictionaryRepresentation:a1[4] forDevice:a1[5] completionHandler:a1[6]];
  }
  else
  {
    uint64_t v3 = a1[6];
    objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"WBSCloudExtensionStateManagerErrorDomain", 0, @"Extension syncing is not available");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

- (void)_saveCurrentDeviceToCloudKitWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEFAULT, "Doing periodic save of current device to CloudKit", buf, 2u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__WBSCloudExtensionStateManager__saveCurrentDeviceToCloudKitWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E411B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WBSCloudExtensionStateManager *)self _determineExtensionSyncAvailabilityWithCompletionHandler:v7];
}

void __83__WBSCloudExtensionStateManager__saveCurrentDeviceToCloudKitWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) _extensionDeviceDictionaryForCurrentDevice];
    if (v6)
    {
      uint64_t v3 = [MEMORY[0x1E4F983D0] sharedProxy];
      [v3 saveExtensionDeviceWithDictionaryRepresentation:v6 completionHandler:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"WBSCloudExtensionStateManagerErrorDomain", 1, @"Could not compute cloud extension device dictionary");
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"WBSCloudExtensionStateManagerErrorDomain", 0, @"Extension syncing is not available");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (void)_deleteCurrentDeviceFromCloudKit
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEFAULT, "Deleting current device from CloudKit", buf, 2u);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke;
  v4[3] = &unk_1E5E41278;
  v4[4] = self;
  [(WBSCloudExtensionStateManager *)self _determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:1 completionHandler:v4];
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke(uint64_t a1, char a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) _defaultWebExtensionsController];
    uint64_t v3 = [v2 _deviceUUIDString];

    if ([v3 length])
    {
      uint64_t v4 = [MEMORY[0x1E4F983D0] sharedProxy];
      v8[0] = v3;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [v4 deleteCloudExtensionDevicesWithUUIDStrings:v5 completionHandler:&__block_literal_global_60];
    }
    else
    {
      uint64_t v7 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_cold_2();
    }
  }
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_58(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_58_cold_1(v3);
    }
  }
}

- (id)_composedIdentifierForBundleIdentifier:(id)a3 relatedToComposedIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = developerIdentifierFromComposedIdentifier(a4);
  uint64_t v7 = +[WBSWebExtensionsController _composedIdentifierForStateOfExtensionWithBundleIdentifier:v5 developerIdentifier:v6];

  return v7;
}

- (id)_allComposedIdentifiersAssociatedWithComposedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
  cloudExtensionStates = self->_cloudExtensionStates;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__WBSCloudExtensionStateManager__allComposedIdentifiersAssociatedWithComposedIdentifier___block_invoke;
  v14[3] = &unk_1E5E412C8;
  id v7 = v4;
  id v15 = v7;
  id v8 = v5;
  id v16 = v8;
  id v17 = self;
  [(NSDictionary *)cloudExtensionStates enumerateKeysAndObjectsUsingBlock:v14];
  if ([MEMORY[0x1E4F98318] isInternalInstall])
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v10 = [v9 dictionaryForKey:*MEMORY[0x1E4F98470]];
    uint64_t v11 = objc_msgSend(v10, "safari_stringForKey:", v7);

    if ([v11 length]) {
      [v8 addObject:v11];
    }
  }
  id v12 = (void *)[v8 copy];

  return v12;
}

void __89__WBSCloudExtensionStateManager__allComposedIdentifiersAssociatedWithComposedIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  long long v30 = v6;
  if ([v6 isEqualToString:*(void *)(a1 + 32)])
  {
    long long v37 = 0uLL;
    long long v38 = 0uLL;
    long long v35 = 0uLL;
    long long v36 = 0uLL;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      uint64_t v12 = *MEMORY[0x1E4F98830];
      uint64_t v13 = *MEMORY[0x1E4F98818];
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          id v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "safari_stringForKey:returningNilIfEmpty:", v12, 1, v29);
          if (!v16)
          {
            uint64_t v16 = objc_msgSend(v15, "safari_stringForKey:returningNilIfEmpty:", v13, 1);
            if (!v16) {
              continue;
            }
          }
          uint64_t v25 = (void *)v16;
          long long v27 = *(void **)(a1 + 40);
          uint64_t v28 = [*(id *)(a1 + 48) _composedIdentifierForBundleIdentifier:v16 relatedToComposedIdentifier:*(void *)(a1 + 32)];
          [v27 addObject:v28];

          *uint64_t v29 = 1;
          goto LABEL_26;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    long long v33 = 0uLL;
    long long v34 = 0uLL;
    long long v31 = 0uLL;
    long long v32 = 0uLL;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      uint64_t v21 = *MEMORY[0x1E4F98830];
      uint64_t v22 = *MEMORY[0x1E4F98818];
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v24 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          uint64_t v25 = objc_msgSend(v24, "safari_stringForKey:returningNilIfEmpty:", v21, 1, v29);
          if (!v25)
          {
            uint64_t v25 = objc_msgSend(v24, "safari_stringForKey:returningNilIfEmpty:", v22, 1);
            if (!v25) {
              continue;
            }
          }
          v26 = [*(id *)(a1 + 48) _composedIdentifierForBundleIdentifier:v25 relatedToComposedIdentifier:*(void *)(a1 + 32)];
          if ([v26 isEqualToString:*(void *)(a1 + 32)])
          {
            [*(id *)(a1 + 40) addObject:v30];
            *uint64_t v29 = 1;

LABEL_26:
            goto LABEL_27;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
  }
LABEL_27:
}

- (id)_cloudExtensionStateForComposedIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        uint64_t v11 = -[NSDictionary safari_arrayContainingObjectsOfClass:forKey:](self->_cloudExtensionStates, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];
  return v12;
}

- (id)_cloudExtensionStateAssociatedWithComposedIdentifier:(id)a3
{
  id v4 = [(WBSCloudExtensionStateManager *)self _allComposedIdentifiersAssociatedWithComposedIdentifier:a3];
  id v5 = [(WBSCloudExtensionStateManager *)self _cloudExtensionStateForComposedIdentifiers:v4];

  return v5;
}

- (void)_cloudExtensionStatesWereUpdated
{
  if ([(WBSCloudExtensionStateManager *)self _cloudStateMatchesLocalStateForCurrentDevice])
  {
    [(WBSCloudExtensionStateManager *)self _updateLocalStateFromCloudExtensionState];
  }
  else
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_INFO, "Cloud state doesn't match local state at fetch time, saving local state to the cloud and fetching again", v4, 2u);
    }
    self->_performFetchAfterNextSave = 1;
    [(WBSCloudExtensionStateManager *)self localExtensionStateDidChange];
  }
}

- (void)_ensureCurrentDeviceIsSavedPeriodically
{
  [(WBSPeriodicActivityScheduler *)self->_periodicDeviceSavingScheduler invalidate];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x1E4F98460]);

  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F98388]);
  if (saveCurrentDeviceTimeInterval_onceToken != -1) {
    dispatch_once(&saveCurrentDeviceTimeInterval_onceToken, &__block_literal_global_208);
  }
  double v6 = *(double *)&saveCurrentDeviceTimeInterval_saveCurrentDeviceTimeInterval;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke;
  v9[3] = &unk_1E5E41340;
  objc_copyWeak(&v10, &location);
  uint64_t v7 = (WBSPeriodicActivityScheduler *)[v5 initWithInterval:v4 minimumDelay:v9 lastFireDate:v6 block:1.0];
  periodicDeviceSavingScheduler = self->_periodicDeviceSavingScheduler;
  self->_periodicDeviceSavingScheduler = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_2;
  block[3] = &unk_1E5E41340;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _saveCurrentDeviceToCloudKitWithCompletionHandler:&__block_literal_global_72];
    id WeakRetained = v2;
  }
}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_3_cold_1(v3);
    }
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_75);
  }
}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_73()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F1C9C8] now];
  objc_msgSend(v1, "safari_setDate:forKey:", v0, *MEMORY[0x1E4F98460]);
}

- (void)_schedulePruningOfInactiveDevices
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x1E4F98458]);

  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F98388]);
  if (pruneInactiveDevicesTimeInterval_onceToken != -1) {
    dispatch_once(&pruneInactiveDevicesTimeInterval_onceToken, &__block_literal_global_210);
  }
  double v6 = *(double *)&pruneInactiveDevicesTimeInterval_pruneInactiveDevicesTimeInterval;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke;
  v9[3] = &unk_1E5E41340;
  objc_copyWeak(&v10, &location);
  uint64_t v7 = (WBSPeriodicActivityScheduler *)[v5 initWithInterval:v4 minimumDelay:v9 lastFireDate:v6 block:1.0];
  inactiveDevicePruningScheduler = self->_inactiveDevicePruningScheduler;
  self->_inactiveDevicePruningScheduler = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke_2;
  block[3] = &unk_1E5E41340;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke_3;
    v3[3] = &unk_1E5E41368;
    v3[4] = WeakRetained;
    [WeakRetained _pruneInactiveDevicesFromCloudKitWithCompletionHandler:v3];
  }
}

void __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke_3(uint64_t a1, int a2, int a3)
{
  if (a2)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    double v6 = [MEMORY[0x1E4F1C9C8] now];
    objc_msgSend(v5, "safari_setDate:forKey:", v6, *MEMORY[0x1E4F98458]);

    if (a3)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      [v7 _cloudExtensionStatesWereUpdated];
    }
  }
}

+ (id)_uuidStringsOfInactiveCloudDevices:(id)a3 currentDeviceUUIDString:(id)a4
{
  id v5 = a4;
  double v6 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v7 = timeIntervalBeforeAssumingDeviceHasBecomeInactive_onceToken;
  id v8 = a3;
  if (v7 != -1) {
    dispatch_once(&timeIntervalBeforeAssumingDeviceHasBecomeInactive_onceToken, &__block_literal_global_212);
  }
  uint64_t v9 = [v6 dateWithTimeIntervalSinceNow:-*(double *)&timeIntervalBeforeAssumingDeviceHasBecomeInactive_timeIntervalBeforeAssumingDeviceHasBecomeInactive];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__WBSCloudExtensionStateManager__uuidStringsOfInactiveCloudDevices_currentDeviceUUIDString___block_invoke;
  v14[3] = &unk_1E5E41390;
  id v15 = v5;
  id v16 = v9;
  id v10 = v9;
  id v11 = v5;
  uint64_t v12 = objc_msgSend(v8, "safari_mapAndFilterObjectsUsingBlock:", v14);

  return v12;
}

id __92__WBSCloudExtensionStateManager__uuidStringsOfInactiveCloudDevices_currentDeviceUUIDString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x1E4F987E8]);
  if ([v4 length] && (objc_msgSend(v4, "isEqualToString:", *(void *)(a1 + 32)) & 1) == 0)
  {
    double v6 = objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x1E4F987C0]);
    uint64_t v7 = v6;
    if (v6 && [v6 compare:*(void *)(a1 + 40)] == -1) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_removeDeviceWithUUIDString:(id)a3 fromCloudDevices:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__WBSCloudExtensionStateManager__removeDeviceWithUUIDString_fromCloudDevices___block_invoke;
  v10[3] = &unk_1E5E413B8;
  uint64_t v12 = v13;
  id v7 = v5;
  id v11 = v7;
  id v8 = objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", v10);

  _Block_object_dispose(v13, 8);
  return v8;
}

id __78__WBSCloudExtensionStateManager__removeDeviceWithUUIDString_fromCloudDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = v3;
  }
  else
  {
    id v6 = objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x1E4F987E8]);
    if ([v6 length] && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v6))
    {
      id v5 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      id v5 = v4;
    }
  }
  return v5;
}

+ (id)_removeStatesForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__WBSCloudExtensionStateManager__removeStatesForDeviceWithUUIDString_fromCloudExtensionStates___block_invoke;
  v10[3] = &unk_1E5E413E0;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  id v8 = objc_msgSend(a4, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v10);

  return v8;
}

id __95__WBSCloudExtensionStateManager__removeStatesForDeviceWithUUIDString_fromCloudExtensionStates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [*(id *)(a1 + 40) _singleExtensionStates:a3 withStateRemovedForDeviceWithUUIDString:*(void *)(a1 + 32)];
  if ([v3 count]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_singleExtensionStates:(id)a3 withStateRemovedForDeviceWithUUIDString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__WBSCloudExtensionStateManager__singleExtensionStates_withStateRemovedForDeviceWithUUIDString___block_invoke;
  v10[3] = &unk_1E5E413B8;
  id v12 = v13;
  id v7 = v6;
  id v11 = v7;
  id v8 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v10);

  _Block_object_dispose(v13, 8);
  return v8;
}

id __96__WBSCloudExtensionStateManager__singleExtensionStates_withStateRemovedForDeviceWithUUIDString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = v3;
  }
  else
  {
    id v6 = objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x1E4F987E8]);
    if ([v6 length] && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v6))
    {
      id v5 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      id v5 = v4;
    }
  }
  return v5;
}

- (void)_pruneInactiveDevicesFromCloudKitWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEFAULT, "Pruning inactive extension devices from CloudKit", buf, 2u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E411B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WBSCloudExtensionStateManager *)self _determineExtensionSyncAvailabilityWithCompletionHandler:v7];
}

void __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = objc_opt_class();
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = v4[4];
    id v6 = [v4 _defaultWebExtensionsController];
    id v7 = [v6 _deviceUUIDString];
    id v8 = [v3 _uuidStringsOfInactiveCloudDevices:v5 currentDeviceUUIDString:v7];

    uint64_t v9 = [v8 count];
    id v10 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v33 = v8;
        _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_DEFAULT, "Pruning inactive extension devices with UUIDs: %{public}@", buf, 0xCu);
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            uint64_t v18 = objc_msgSend((id)objc_opt_class(), "_removeDeviceWithUUIDString:fromCloudDevices:", v17, *(void *)(*(void *)(a1 + 32) + 32), (void)v27);
            uint64_t v19 = *(void *)(a1 + 32);
            uint64_t v20 = *(void **)(v19 + 32);
            *(void *)(v19 + 32) = v18;

            uint64_t v21 = [(id)objc_opt_class() _removeStatesForDeviceWithUUIDString:v17 fromCloudExtensionStates:*(void *)(*(void *)(a1 + 32) + 24)];
            uint64_t v22 = *(void *)(a1 + 32);
            uint64_t v23 = *(void **)(v22 + 24);
            *(void *)(v22 + 24) = v21;
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v14);
      }

      uint64_t v24 = [MEMORY[0x1E4F983D0] sharedProxy];
      [v24 deleteCloudExtensionDevicesWithUUIDStrings:v12 completionHandler:&__block_literal_global_82];

      uint64_t v25 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_cold_1();
      }
      uint64_t v25 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v25();
  }
  else
  {
    v26 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB70000, v26, OS_LOG_TYPE_DEFAULT, "Skipping pruning inactive extension devices from CloudKit because extension sync is off", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_80(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_80_cold_1(v3);
    }
  }
}

+ (id)_determineNewTabPageFromCloudDeviceState:(id)a3
{
  id v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_85_0];
  id v4 = [v3 firstObject];
  uint64_t v5 = objc_msgSend(v4, "safari_stringForKey:returningNilIfEmpty:", *MEMORY[0x1E4F987D0], 1);

  return v5;
}

uint64_t __74__WBSCloudExtensionStateManager__determineNewTabPageFromCloudDeviceState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F987E0];
  int v7 = objc_msgSend(v4, "safari_BOOLForKey:", *MEMORY[0x1E4F987E0]);
  if (v7 == objc_msgSend(v5, "safari_BOOLForKey:", v6))
  {
    uint64_t v9 = *MEMORY[0x1E4F987D8];
    id v10 = objc_msgSend(v5, "safari_dateForKey:", *MEMORY[0x1E4F987D8]);
    id v11 = objc_msgSend(v4, "safari_dateForKey:", v9);
    uint64_t v8 = [v10 compare:v11];
  }
  else if (v7)
  {
    uint64_t v8 = -1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

+ (BOOL)_determineEnabledStateFromCloudExtensionState:(id)a3 forProfileServerID:(id)a4
{
  id v5 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__WBSCloudExtensionStateManager__determineEnabledStateFromCloudExtensionState_forProfileServerID___block_invoke;
  void v13[3] = &unk_1E5E41428;
  id v14 = v5;
  id v6 = v5;
  int v7 = [a3 sortedArrayUsingComparator:v13];
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = objc_msgSend(v8, "safari_dictionaryForKey:", *MEMORY[0x1E4F98838]);
  id v10 = objc_msgSend(v9, "safari_dictionaryForKey:", v6);
  char v11 = objc_msgSend(v10, "safari_BOOLForKey:", *MEMORY[0x1E4F98800]);

  return v11;
}

uint64_t __98__WBSCloudExtensionStateManager__determineEnabledStateFromCloudExtensionState_forProfileServerID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F98838];
  id v6 = a3;
  int v7 = objc_msgSend(a2, "safari_dictionaryForKey:", v5);
  uint64_t v8 = objc_msgSend(v7, "safari_dictionaryForKey:", *(void *)(a1 + 32));

  uint64_t v9 = objc_msgSend(v6, "safari_dictionaryForKey:", v5);

  id v10 = objc_msgSend(v9, "safari_dictionaryForKey:", *(void *)(a1 + 32));

  uint64_t v11 = *MEMORY[0x1E4F987F8];
  int v12 = objc_msgSend(v8, "safari_BOOLForKey:", *MEMORY[0x1E4F987F8]);
  if (v12 == objc_msgSend(v10, "safari_BOOLForKey:", v11))
  {
    uint64_t v14 = *MEMORY[0x1E4F98820];
    uint64_t v15 = objc_msgSend(v10, "safari_dateForKey:", *MEMORY[0x1E4F98820]);
    id v16 = objc_msgSend(v8, "safari_dateForKey:", v14);
    uint64_t v13 = [v15 compare:v16];
  }
  else if (v12)
  {
    uint64_t v13 = -1;
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

- (BOOL)_cloudDeviceMatchesLocalDeviceForCurrentDevice
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(WBSCloudExtensionStateManager *)self _extensionDeviceDictionaryForCurrentDevice];
  if (v3)
  {
    id v4 = [(WBSCloudExtensionStateManager *)self _defaultWebExtensionsController];
    uint64_t v5 = [v4 _deviceUUIDString];

    if ([v5 length])
    {
      cloudDevices = self->_cloudDevices;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__WBSCloudExtensionStateManager__cloudDeviceMatchesLocalDeviceForCurrentDevice__block_invoke;
      v17[3] = &unk_1E5E41450;
      id v18 = v5;
      int v7 = [(NSArray *)cloudDevices safari_firstObjectPassingTest:v17];
      if (!v7)
      {
        uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB70000, v8, OS_LOG_TYPE_INFO, "Current extension device doesn't exist in cloud", buf, 2u);
        }
      }
      uint64_t v9 = extensionDeviceDictionaryToUseForComparison_once;
      id v10 = v7;
      if (v9 != -1) {
        dispatch_once(&extensionDeviceDictionaryToUseForComparison_once, &__block_literal_global_214);
      }
      uint64_t v11 = objc_msgSend(v10, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_217);

      char v12 = [v11 isEqualToDictionary:v3];
      if ((v12 & 1) == 0)
      {
        uint64_t v13 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB70000, v13, OS_LOG_TYPE_INFO, "Cloud extension device doesn't match local device", buf, 2u);
        }
        uint64_t v14 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v20 = v3;
          _os_log_impl(&dword_1ABB70000, v14, OS_LOG_TYPE_INFO, "Local extension device: %{private}@", buf, 0xCu);
        }
        uint64_t v15 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v20 = v11;
          _os_log_impl(&dword_1ABB70000, v15, OS_LOG_TYPE_INFO, "Cloud extension device: %{private}@", buf, 0xCu);
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

uint64_t __79__WBSCloudExtensionStateManager__cloudDeviceMatchesLocalDeviceForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(a2, "safari_stringForKey:", *MEMORY[0x1E4F987E8]);
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

+ (id)_cloudExtensionStatesDictionaryForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __113__WBSCloudExtensionStateManager__cloudExtensionStatesDictionaryForDeviceWithUUIDString_fromCloudExtensionStates___block_invoke;
  v9[3] = &unk_1E5E41478;
  id v10 = v5;
  id v6 = v5;
  int v7 = objc_msgSend(a4, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v9);

  return v7;
}

id __113__WBSCloudExtensionStateManager__cloudExtensionStatesDictionaryForDeviceWithUUIDString_fromCloudExtensionStates___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F987E8];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "safari_stringForKey:", v8, (void)v14);
        if ([*(id *)(a1 + 32) isEqualToString:v11])
        {
          id v12 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)_cloudExtensionStatesMatchLocalExtensionStatesForCurrentDevice
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(WBSCloudExtensionStateManager *)self _extensionStatesDictionaryForCurrentDevice];
  id v4 = extensionsStatesDictionaryToUseForComparison(v3);

  uint64_t v5 = [(WBSCloudExtensionStateManager *)self _defaultWebExtensionsController];
  uint64_t v6 = [v5 _deviceUUIDString];

  uint64_t v7 = [(id)objc_opt_class() _cloudExtensionStatesDictionaryForDeviceWithUUIDString:v6 fromCloudExtensionStates:self->_cloudExtensionStates];
  uint64_t v8 = extensionsStatesDictionaryToUseForComparison(v7);

  int v9 = [v4 isEqualToDictionary:v8];
  id v10 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      LOWORD(v18) = 0;
      id v12 = "Cloud extension states for the current devices matches local states";
      uint64_t v13 = v10;
      uint32_t v14 = 2;
LABEL_10:
      _os_log_impl(&dword_1ABB70000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v18, v14);
    }
  }
  else
  {
    if (v11)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Cloud extension states for the current device doesn't match local states", (uint8_t *)&v18, 2u);
    }
    long long v15 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v18 = 138477827;
      uint64_t v19 = v4;
      _os_log_impl(&dword_1ABB70000, v15, OS_LOG_TYPE_INFO, "Local extension states: %{private}@", (uint8_t *)&v18, 0xCu);
    }
    long long v16 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 138477827;
      uint64_t v19 = v8;
      id v12 = "Cloud extension states: %{private}@";
      uint64_t v13 = v16;
      uint32_t v14 = 12;
      goto LABEL_10;
    }
  }

  return v9;
}

- (BOOL)_cloudStateMatchesLocalStateForCurrentDevice
{
  BOOL v3 = [(WBSCloudExtensionStateManager *)self _cloudDeviceMatchesLocalDeviceForCurrentDevice];
  if (v3)
  {
    LOBYTE(v3) = [(WBSCloudExtensionStateManager *)self _cloudExtensionStatesMatchLocalExtensionStatesForCurrentDevice];
  }
  return v3;
}

- (void)_extensionSyncEnabledStateDidChangeDistributedNotificationHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a3;
  uint64_t v5 = objc_msgSend(v4, "safari_browserDefaults");
  self->_extensionSyncEnabled = objc_msgSend(v5, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E4F98448], 1);

  [(WBSCloudExtensionStateManager *)self _updateCloudExtensionStatesFromSafariBookmarksSyncAgent:v6];
}

- (id)_defaultWebExtensionsController
{
  stateProviders = self->_stateProviders;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__WBSCloudExtensionStateManager__defaultWebExtensionsController__block_invoke;
  v5[3] = &unk_1E5E414A0;
  v5[4] = self;
  BOOL v3 = [(NSMutableArray *)stateProviders safari_firstObjectPassingTest:v5];
  return v3;
}

BOOL __64__WBSCloudExtensionStateManager__defaultWebExtensionsController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 profileServerIDForStateManager:*(void *)(a1 + 32)];
    BOOL v5 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_managedExtensionStateDidChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F98348], "sharedController", a3);
  char v5 = [v4 hasAnyExtensionManagement];

  if (v5)
  {
    [(WBSCloudExtensionStateManager *)self setExtensionSyncEnabled:0];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__WBSCloudExtensionStateManager__managedExtensionStateDidChange___block_invoke;
    v6[3] = &unk_1E5E41278;
    v6[4] = self;
    [(WBSCloudExtensionStateManager *)self _determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:1 completionHandler:v6];
  }
}

uint64_t __65__WBSCloudExtensionStateManager__managedExtensionStateDidChange___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _updateCloudExtensionStatesFromSafariBookmarksSyncAgent:0];
  }
  return result;
}

+ (BOOL)test_determineEnabledStateFromCloudExtensionState:(id)a3 forProfileServerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F98318] isInternalInstall]) {
    char v8 = [a1 _determineEnabledStateFromCloudExtensionState:v6 forProfileServerID:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

+ (id)test_determineNewTabPageFromCloudDeviceState:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F98318] isInternalInstall])
  {
    char v5 = [a1 _determineNewTabPageFromCloudDeviceState:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)test_uuidStringsOfInactiveCloudDevices:(id)a3 currentDeviceUUIDString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F98318] isInternalInstall])
  {
    char v8 = [a1 _uuidStringsOfInactiveCloudDevices:v6 currentDeviceUUIDString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)test_removeDeviceWithUUIDString:(id)a3 fromCloudDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F98318] isInternalInstall])
  {
    char v8 = [a1 _removeDeviceWithUUIDString:v6 fromCloudDevices:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)test_removeStatesForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F98318] isInternalInstall])
  {
    char v8 = [a1 _removeStatesForDeviceWithUUIDString:v6 fromCloudExtensionStates:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)test_cloudExtensionStatesDictionaryForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F98318] isInternalInstall])
  {
    char v8 = [a1 _cloudExtensionStatesDictionaryForDeviceWithUUIDString:v6 fromCloudExtensionStates:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isExtensionSyncEnabled
{
  return self->_extensionSyncEnabled;
}

- (int64_t)manateeState
{
  return self->_manateeState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicDeviceSavingScheduler, 0);
  objc_storeStrong((id *)&self->_inactiveDevicePruningScheduler, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_cloudExtensionStates, 0);
  objc_storeStrong((id *)&self->_stateProviders, 0);
}

void __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Saving cloud extension states failed with error %{public}@", v6, v7, v8, v9, v10);
}

- (void)_extensionDeviceDictionaryForCurrentDevice
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Could not determine device name for local cloud extension device", v2, v3, v4, v5, v6);
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Could not determine UUID for current device", v2, v3, v4, v5, v6);
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Could not delete current device from CloudKit because extension syncing is not available", v2, v3, v4, v5, v6);
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_58_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Deleting current device failed with error %{public}@", v6, v7, v8, v9, v10);
}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_3_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Periodic save of current device to CloudKit failed with error %{public}@", v6, v7, v8, v9, v10);
}

void __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEBUG, "No inactive extension devices found in CloudKit", v1, 2u);
}

void __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_80_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v4, v5, "Deleting inactive extension devices failed with error %{public}@", v6, v7, v8, v9, v10);
}

@end