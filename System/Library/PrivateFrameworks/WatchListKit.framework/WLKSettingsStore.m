@interface WLKSettingsStore
+ (BOOL)isHostedInRemoteViewService;
+ (BOOL)isSettingsStoreInitializing;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)sharedSettings;
+ (void)synchronizeSettingsDefaultsForKeys:(id)a3;
- (BOOL)hasOutstandingChanges;
- (BOOL)hasPostPlayAutoPlayNextVideoPreferences;
- (BOOL)migratediOS;
- (BOOL)migratedtvOS;
- (BOOL)optedIn;
- (BOOL)postPlayAutoPlayNextVideo;
- (BOOL)privateModeEnabled;
- (BOOL)sportsScoreSpoilersAllowed;
- (BOOL)synchronize:(unint64_t)a3;
- (BOOL)upNextLockupsUseCoverArt;
- (NSDate)lastSyncDate;
- (NSDate)lastSyncToCloudDate;
- (NSNumber)optedInVal;
- (NSSet)suppressedSportsEventIDs;
- (NSString)pushToken;
- (WLKSettingsStore)init;
- (id)_appsForChannelID:(id)a3;
- (id)_connection;
- (id)_copyAppsForChannelID:(id)a3 apps:(id)a4;
- (id)_dictionaryRepresentation;
- (id)_dictionaryRepresentationCopyingItems:(BOOL)a3;
- (id)_dictionaryRepresentationDataOnly;
- (id)_supportPath;
- (id)_watchListAppsFiltered;
- (id)consentedBrands;
- (id)deniedBrands;
- (id)description;
- (id)settingsForChannelID:(id)a3 externalID:(id)a4;
- (id)watchListApps;
- (int)ignoreChangesCount;
- (void)_activeAccountChangedNotification:(id)a3;
- (void)_attemptCullingOfObsoleteApp:(id)a3;
- (void)_dictionaryOnDisk:(id)a3;
- (void)_loadFromDiskWithCompletion:(id)a3;
- (void)_removeWatchListApp:(id)a3;
- (void)_tickleKVO;
- (void)_updateDisplayNamesForUI:(id)a3;
- (void)_writeToDisk;
- (void)_writeToDisk:(id)a3 completion:(id)a4;
- (void)beginIgnoringChanges;
- (void)clearAllSportsNotificationSuppression;
- (void)dealloc;
- (void)endIgnoringChanges;
- (void)forceUpdateWithCompletion:(id)a3;
- (void)publishCrossProcessSettingsChangedNotification;
- (void)refreshWithCompletion:(id)a3;
- (void)removePostPlayAutoPlayNextVideoPreferences;
- (void)setHasOutstandingChanges:(BOOL)a3;
- (void)setIgnoreChangesCount:(int)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setLastSyncToCloudDate:(id)a3;
- (void)setMigratediOS:(BOOL)a3;
- (void)setMigratedtvOS:(BOOL)a3;
- (void)setName:(id)a3 forChannelID:(id)a4 externalID:(id)a5;
- (void)setOptedIn:(BOOL)a3;
- (void)setOptedInVal:(id)a3;
- (void)setPostPlayAutoPlayNextVideo:(BOOL)a3;
- (void)setPrivateModeEnabled:(BOOL)a3;
- (void)setPushToken:(id)a3;
- (void)setSportsNotificationSuppression:(BOOL)a3 forEventID:(id)a4;
- (void)setSportsScoreSpoilersAllowed:(BOOL)a3;
- (void)setStatus:(unint64_t)a3 forChannelID:(id)a4 externalID:(id)a5;
- (void)setUpNextLockupsUseCoverArt:(BOOL)a3;
- (void)synchronize:(unint64_t)a3 completion:(id)a4;
@end

@implementation WLKSettingsStore

uint64_t __33__WLKSettingsStore_watchListApps__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addObject:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) sortUsingComparator:&__block_literal_global_70];
}

void __48__WLKSettingsStore__loadFromDiskWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    +[WLKSystemPreferencesStore sharedPreferences];
    v4 = id v3 = WeakRetained;
    [v4 migratePrivateModeFromDiskIfNeeded:*(void *)(v1 + 32)];

    uint64_t v5 = +[WLKSystemPreferencesStore sharedPreferences];
    [v5 migrateSportsSpoilersFromDiskIfNeeded:*(void *)(v1 + 32)];

    uint64_t v6 = [*(id *)(v1 + 32) objectForKeyedSubscript:@"LastSyncDate"];
    v7 = (void *)*((void *)v3 + 12);
    *((void *)v3 + 12) = v6;

    uint64_t v8 = [*(id *)(v1 + 32) objectForKeyedSubscript:@"LastSyncToCloudDate"];
    long long v9 = (void *)*((void *)v3 + 13);
    *((void *)v3 + 13) = v8;

    objc_storeStrong((id *)v3 + 4, *(id *)(v1 + 40));
    objc_storeStrong((id *)v3 + 3, *(id *)(v1 + 48));
    long long v10 = [*(id *)(v1 + 56) objectForKeyedSubscript:@"OptedIn"];
    *((unsigned char *)v3 + 48) = [v10 BOOLValue];

    uint64_t v11 = [*(id *)(v1 + 56) objectForKeyedSubscript:@"OptedIn"];
    v12 = (void *)*((void *)v3 + 5);
    *((void *)v3 + 5) = v11;

    uint64_t v13 = [*(id *)(v1 + 56) objectForKeyedSubscript:@"MigratediOS"];
    *((unsigned char *)v3 + 49) = [v13 BOOLValue];

    v14 = [*(id *)(v1 + 56) objectForKeyedSubscript:@"MigratedtvOS"];
    v43 = v3;
    *((unsigned char *)v3 + 50) = [v14 BOOLValue];

    v48 = [MEMORY[0x1E4F1CA48] array];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = *(id *)(v1 + 64);
    uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (!v47) {
      goto LABEL_28;
    }
    uint64_t v45 = v1;
    uint64_t v46 = *(void *)v57;
    while (1)
    {
      for (uint64_t i = 0; i != v47; uint64_t i = v34 + 1)
      {
        if (*(void *)v57 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = i;
        v16 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v17 = NSString;
        v18 = [v16 channelID];
        v19 = [v16 externalID];
        v20 = [v17 stringWithFormat:@"%@:%@", v18, v19];
        [v48 addObject:v20];

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v21 = *(id *)(*(void *)(v1 + 72) + 56);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (!v22)
        {

LABEL_25:
          [*(id *)(*(void *)(v1 + 72) + 56) addObject:v16];
          uint64_t v34 = v49;
          continue;
        }
        uint64_t v23 = v22;
        id v50 = 0;
        uint64_t v24 = *(void *)v53;
        do
        {
          uint64_t v25 = 0;
          uint64_t v51 = v23;
          do
          {
            if (*(void *)v53 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v52 + 1) + 8 * v25);
            v27 = [v26 channelID];
            v28 = [v16 channelID];
            if (([v27 isEqualToString:v28] & 1) == 0)
            {

              goto LABEL_16;
            }
            v29 = [v26 externalID];
            v30 = v16;
            v31 = [v16 externalID];
            BOOL v32 = +[WLKAppSettings isExternalID:v29 equalToExternalID:v31];

            if (v32)
            {
              v27 = v50;
              uint64_t v23 = v51;
              id v50 = v26;
              v16 = v30;
LABEL_16:

              goto LABEL_18;
            }
            v16 = v30;
            uint64_t v23 = v51;
LABEL_18:
            ++v25;
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v23);

        uint64_t v1 = v45;
        if (!v50) {
          goto LABEL_25;
        }
        objc_msgSend(v50, "setAccessStatus:", objc_msgSend(v16, "accessStatus"));
        v33 = [v16 displayName];
        uint64_t v34 = v49;
        if ([v33 length]) {
          [v50 setDisplayName:v33];
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (!v47)
      {
LABEL_28:

        id v35 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        if ([*(id *)(*(void *)(v1 + 72) + 56) count])
        {
          unint64_t v36 = 0;
          do
          {
            v37 = [*(id *)(*(void *)(v1 + 72) + 56) objectAtIndex:v36];
            v38 = NSString;
            v39 = [v37 channelID];
            v40 = [v37 externalID];
            v41 = [v38 stringWithFormat:@"%@:%@", v39, v40];

            if (([v48 containsObject:v41] & 1) == 0) {
              [v35 addIndex:v36];
            }

            ++v36;
          }
          while (v36 < [*(id *)(*(void *)(v1 + 72) + 56) count]);
        }
        [*(id *)(*(void *)(v1 + 72) + 56) removeObjectsAtIndexes:v35];

        id WeakRetained = v43;
        goto LABEL_36;
      }
    }
  }
  NSLog(&cfstr_Wlksettingssto_13.isa);
  uint64_t v42 = *(void *)(v1 + 80);
  if (v42) {
    (*(void (**)(void))(v42 + 16))();
  }
LABEL_36:
}

- (BOOL)hasPostPlayAutoPlayNextVideoPreferences
{
  id v2 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"PostPlayAutoPlayNextVideo"];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)sharedSettings
{
  if (sharedSettings___once != -1) {
    dispatch_once(&sharedSettings___once, &__block_literal_global_42);
  }
  id v2 = (void *)sharedSettings___singleInstance;

  return v2;
}

- (BOOL)optedIn
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__WLKSettingsStore_optedIn__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)consentedBrands
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(WLKSettingsStore *)self watchListApps];
  char v3 = (void *)[v2 mutableCopy];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "accessStatus", (void)v14) == 1)
        {
          uint64_t v11 = [v10 channelID];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = [v4 sortedArrayUsingSelector:sel_compare_];

  return v12;
}

- (id)watchListApps
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__8;
  uint64_t v11 = __Block_byref_object_dispose__8;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__WLKSettingsStore_watchListApps__block_invoke;
  v6[3] = &unk_1E620B250;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  id v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)deniedBrands
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(WLKSettingsStore *)self watchListApps];
  char v3 = (void *)[v2 mutableCopy];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "accessStatus", (void)v14) == 2)
        {
          uint64_t v11 = [v10 channelID];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 sortedArrayUsingSelector:sel_compare_];

  return v12;
}

void __58__WLKSettingsStore__dictionaryRepresentationCopyingItems___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v2 forKeyedSubscript:@"DSID"];

  char v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[3];
  if (v4)
  {
    id v5 = (void *)[v4 copy];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v5 forKeyedSubscript:@"PushToken"];

    char v3 = *(void **)(a1 + 32);
  }
  uint64_t v6 = (void *)v3[12];
  if (v6)
  {
    uint64_t v7 = (void *)[v6 copy];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v7 forKeyedSubscript:@"LastSyncDate"];

    char v3 = *(void **)(a1 + 32);
  }
  uint64_t v8 = (void *)v3[13];
  if (v8)
  {
    uint64_t v9 = (void *)[v8 copy];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKeyedSubscript:@"LastSyncToCloudDate"];
  }
  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(*(void *)(a1 + 32) + 56) count])
  {
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(*(void *)(a1 + 32) + 56) copyItems:*(unsigned __int8 *)(a1 + 48)];
    [v14 setObject:v10 forKeyedSubscript:@"AppsArray"];
  }
  uint64_t v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 48)];
  [v14 setObject:v11 forKeyedSubscript:@"OptedIn"];

  id v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 49)];
  [v14 setObject:v12 forKeyedSubscript:@"MigratediOS"];

  uint64_t v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 50)];
  [v14 setObject:v13 forKeyedSubscript:@"MigratedtvOS"];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v14 forKeyedSubscript:@"SynchronizedSettings"];
}

uint64_t __27__WLKSettingsStore_optedIn__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

uint64_t __30__WLKSettingsStore__tickleKVO__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __34__WLKSettingsStore_sharedSettings__block_invoke()
{
  __isInitializing_0 = 1;
  v0 = objc_alloc_init(WLKSettingsStore);
  uint64_t v1 = (void *)sharedSettings___singleInstance;
  sharedSettings___singleInstance = (uint64_t)v0;

  __isInitializing_0 = 0;
}

- (WLKSettingsStore)init
{
  v20.receiver = self;
  v20.super_class = (Class)WLKSettingsStore;
  id v2 = [(WLKSettingsStore *)&v20 init];
  if (v2)
  {
    NSLog(&cfstr_Wlksettingssto_0.isa);
    dispatch_queue_t v3 = dispatch_queue_create("WLKSettingsQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("WLKSettingsQueueRW", 0);
    readWriteQueue = v2->_readWriteQueue;
    v2->_readWriteQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    apps = v2->_apps;
    v2->_apps = (NSMutableArray *)v7;

    if (WLKIsTVApp())
    {
      uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      defaultsAccessor = v2->_defaultsAccessor;
      v2->_defaultsAccessor = (NSUserDefaults *)v9;
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CB18]);
      defaultsAccessor = WLKTVAppBundleID();
      uint64_t v12 = [v11 initWithSuiteName:defaultsAccessor];
      uint64_t v13 = v2->_defaultsAccessor;
      v2->_defaultsAccessor = (NSUserDefaults *)v12;
    }
    [(WLKSettingsStore *)v2 refreshWithCompletion:0];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __24__WLKSettingsStore_init__block_invoke;
    handler[3] = &unk_1E620AE50;
    id v14 = v2;
    uint64_t v19 = v14;
    notify_register_dispatch("com.apple.WatchListKit.WLKSettingsDidChangeNotification", &v2->_didChangeNotificationToken, MEMORY[0x1E4F14428], handler);
    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v16 = +[WLKAccountMonitor sharedInstance];
    [v15 addObserver:v14 selector:sel__activeAccountChangedNotification_ name:@"WLKAccountMonitorAccountDidChange" object:v16];
  }
  return v2;
}

void __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  NSLog(&cfstr_Wlksettingssto_21.isa);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __48__WLKSettingsStore__loadFromDiskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    dispatch_queue_t v5 = [v3 objectForKeyedSubscript:@"DSID"];
    uint64_t v34 = [WeakRetained _dictionaryRepresentation];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v7 = objc_msgSend(v6, "ams_activeiTunesAccount");
    uint64_t v8 = objc_msgSend(v7, "ams_DSID");
    uint64_t v9 = [v8 stringValue];

    id v10 = v9;
    id v11 = v5;
    uint64_t v12 = v11;
    v33 = v11;
    if (v10 == v11)
    {
      long long v17 = v11;
      v18 = v11;
    }
    else
    {
      if (v11) {
        BOOL v13 = v10 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      int v14 = !v13;
      if (v13)
      {
      }
      else
      {
        char v15 = [v10 isEqual:v11];

        if (v15) {
          goto LABEL_21;
        }
      }
      uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];

      if (!v14 || (NSLog(&cfstr_Wlksettingssto_12.isa), !WLKShouldRunInProcess()))
      {
        id v3 = (id)v19;
        goto LABEL_21;
      }
      v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v17 = [WeakRetained _supportPath];
      [v18 removeItemAtPath:v17 error:0];
      id v3 = (id)v19;
    }

LABEL_21:
    objc_super v20 = [v3 objectForKeyedSubscript:@"PushToken"];
    id v21 = [v3 objectForKeyedSubscript:@"SynchronizedSettings"];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"AppsArray"];
    uint64_t v23 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__WLKSettingsStore__loadFromDiskWithCompletion___block_invoke_2;
    block[3] = &unk_1E620BBD8;
    objc_copyWeak(&v43, (id *)(a1 + 48));
    id v42 = *(id *)(a1 + 40);
    id v3 = v3;
    id v36 = v3;
    id v24 = v10;
    id v37 = v24;
    id v25 = v20;
    id v38 = v25;
    id v26 = v21;
    id v39 = v26;
    id v27 = v22;
    uint64_t v28 = *(void *)(a1 + 32);
    id v40 = v27;
    uint64_t v41 = v28;
    dispatch_sync(v23, block);
    v29 = [v34 objectForKeyedSubscript:@"SynchronizedSettings"];
    v30 = [v29 objectForKeyedSubscript:@"AppsArray"];
    char v31 = [v27 isEqualToArray:v30];

    if ((v31 & 1) == 0) {
      [WeakRetained _tickleKVO];
    }
    uint64_t v32 = *(void *)(a1 + 40);
    if (v32) {
      (*(void (**)(void))(v32 + 16))();
    }

    objc_destroyWeak(&v43);
    goto LABEL_26;
  }
  NSLog(&cfstr_Wlksettingssto_11.isa);
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
LABEL_26:
}

- (void)_tickleKVO
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__WLKSettingsStore__tickleKVO__block_invoke;
  v5[3] = &unk_1E620A708;
  v5[4] = self;
  id v2 = (void (**)(void))MEMORY[0x1BA9E94D0](v5, a2);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2[2](v2);
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __30__WLKSettingsStore__tickleKVO__block_invoke_2;
    v3[3] = &unk_1E620A390;
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
}

- (id)_dictionaryRepresentation
{
  return [(WLKSettingsStore *)self _dictionaryRepresentationCopyingItems:0];
}

- (id)_dictionaryRepresentationCopyingItems:(BOOL)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy__8;
  int v14 = __Block_byref_object_dispose__8;
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__WLKSettingsStore__dictionaryRepresentationCopyingItems___block_invoke;
  block[3] = &unk_1E620BBB0;
  void block[4] = self;
  block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(accessQueue, block);
  uint64_t v6 = (void *)[(id)v11[5] copy];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)refreshWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(WLKSettingsStore *)self ignoreChangesCount] < 1)
  {
    [(WLKSettingsStore *)self _loadFromDiskWithCompletion:v4];
  }
  else
  {
    NSLog(&cfstr_Wlksettingssto_10.isa);
    if (v4) {
      v4[2]();
    }
  }
}

- (int)ignoreChangesCount
{
  return self->_ignoreChangesCount;
}

- (void)_loadFromDiskWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__WLKSettingsStore__loadFromDiskWithCompletion___block_invoke;
  v6[3] = &unk_1E620BC00;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  v6[4] = self;
  id v7 = v5;
  [(WLKSettingsStore *)self _dictionaryOnDisk:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_dictionaryOnDisk:(id)a3
{
  id v4 = a3;
  if (+[WLKSettingsStore isHostedInRemoteViewService]) {
    int64_t v5 = 10000000;
  }
  else {
    int64_t v5 = 0;
  }
  dispatch_time_t v6 = dispatch_time(0, v5);
  readWriteQueue = self->_readWriteQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__WLKSettingsStore__dictionaryOnDisk___block_invoke;
  v9[3] = &unk_1E620A870;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_after(v6, readWriteQueue, v9);
}

+ (BOOL)isHostedInRemoteViewService
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  LOBYTE(v2) = [v3 isEqualToString:@"com.apple.TVAccessViewService"];
  return (char)v2;
}

uint64_t __30__WLKSettingsStore__tickleKVO__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"watchListApps"];
  id v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"watchListApps"];
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

void __38__WLKSettingsStore__dictionaryOnDisk___block_invoke(uint64_t a1)
{
  if (WLKShouldRunInProcess())
  {
    id v2 = (void *)MEMORY[0x1BA9E92A0]();
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__8;
    char v31 = __Block_byref_object_dispose__8;
    id v32 = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(NSObject **)(v3 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_2;
    block[3] = &unk_1E620AB18;
    void block[4] = v3;
    block[5] = &v27;
    dispatch_sync(v4, block);
    if (v28[5])
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28DC0]);
      uint64_t v6 = v28[5];
      id v25 = 0;
      id v7 = (void *)[v5 initForReadingFromData:v6 error:&v25];
      id v8 = v25;
      BOOL v9 = v8;
      if (v8)
      {
        NSLog(&cfstr_Wlksettingssto_19.isa, v8);
        id v10 = 0;
      }
      else
      {
        BOOL v13 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, objc_opt_class(), 0);
        id v10 = [v7 decodeObjectOfClasses:v19 forKey:*MEMORY[0x1E4F284E8]];
      }
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20) {
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v10);
    }
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) _connection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_3;
    v23[3] = &unk_1E620A438;
    id v24 = *(id *)(a1 + 40);
    uint64_t v12 = [v11 remoteObjectProxyWithErrorHandler:v23];

    NSLog(&cfstr_Wlksettingssto_20.isa);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_4;
    v21[3] = &unk_1E620BD40;
    id v22 = *(id *)(a1 + 40);
    [v12 readSettingsStore:v21];
  }
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    uint64_t v6 = self->_connection;
    id v7 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    id v8 = self->_connection;
    BOOL v9 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_195];
    objc_initWeak(&location, self);
    id v10 = self->_connection;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __31__WLKSettingsStore__connection__block_invoke_2;
    uint64_t v15 = &unk_1E620A550;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v12];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1C9B8];
  id v6 = [*(id *)(a1 + 32) _supportPath];
  uint64_t v3 = [v2 dataWithContentsOfFile:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_supportPath
{
  id v2 = WLKDefaultSupportPath();
  if ([v2 length])
  {
    uint64_t v3 = [v2 stringByAppendingPathComponent:@"settings.plist"];

    id v4 = [v3 stringByExpandingTildeInPath];
  }
  else
  {
    NSLog(&cfstr_Wlksettingssto.isa);
    id v4 = v2;
    uint64_t v3 = v4;
  }

  return v4;
}

void __24__WLKSettingsStore_init__block_invoke(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 72), &state64);
  if (state64 != getpid())
  {
    NSLog(&cfstr_Wlksettingssto_1.isa);
    id v2 = [*(id *)(a1 + 32) _dictionaryRepresentationDataOnly];
    uint64_t v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __24__WLKSettingsStore_init__block_invoke_2;
    v5[3] = &unk_1E6209F68;
    id v6 = v3;
    id v7 = v2;
    id v4 = v2;
    [v6 refreshWithCompletion:v5];
  }
}

void __24__WLKSettingsStore_init__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _dictionaryRepresentationDataOnly];
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToDictionary:") & 1) == 0)
  {
    NSLog(&cfstr_Wlksettingssto_2.isa);
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"WLKSettingsDidChangeNotification" object:0];
  }
}

- (void)dealloc
{
  int didChangeNotificationToken = self->_didChangeNotificationToken;
  if (didChangeNotificationToken) {
    notify_cancel(didChangeNotificationToken);
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)WLKSettingsStore;
  [(WLKSettingsStore *)&v5 dealloc];
}

+ (BOOL)isSettingsStoreInitializing
{
  return __isInitializing_0;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WLKSettingsStore;
  id v3 = a3;
  id v4 = objc_msgSendSuper2(&v8, sel_keyPathsForValuesAffectingValueForKey_, v3);
  int v5 = objc_msgSend(v3, "isEqualToString:", @"_watchListAppsFiltered", v8.receiver, v8.super_class);

  if (v5)
  {
    uint64_t v6 = [v4 setByAddingObjectsFromArray:&unk_1F13D9B40];

    id v4 = (void *)v6;
  }

  return v4;
}

- (void)removePostPlayAutoPlayNextVideoPreferences
{
  id v3 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"PostPlayAutoPlayNextVideo"];

  if (v3)
  {
    defaultsAccessor = self->_defaultsAccessor;
    [(NSUserDefaults *)defaultsAccessor removeObjectForKey:@"PostPlayAutoPlayNextVideo"];
  }
}

uint64_t __33__WLKSettingsStore_watchListApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 displayName];
  uint64_t v6 = [v4 displayName];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (id)settingsForChannelID:(id)a3 externalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__8;
  id v21 = __Block_byref_object_dispose__8;
  id v22 = 0;
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__WLKSettingsStore_settingsForChannelID_externalID___block_invoke;
  v13[3] = &unk_1E620BB38;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __52__WLKSettingsStore_settingsForChannelID_externalID___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  NSLog(&cfstr_Wlksettingssto_3.isa, [*(id *)(a1[4] + 56) count], a1[5], a1[6]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1[4] + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_super v8 = [v7 channelID];
        if ([v8 isEqualToString:a1[5]])
        {
          id v9 = [v7 externalID];
          BOOL v10 = +[WLKAppSettings isExternalID:v9 equalToExternalID:a1[6]];

          if (v10)
          {
            NSLog(&cfstr_Wlksettingssto_4.isa);
            objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v7);
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
LABEL_12:
}

- (id)_copyAppsForChannelID:(id)a3 apps:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "channelID", (void)v18);
        int v15 = [v14 isEqualToString:v5];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    uint64_t v16 = (void *)[v7 copy];
  }
  else {
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)setStatus:(unint64_t)a3 forChannelID:(id)a4 externalID:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1BA9E92A0]();
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = __Block_byref_object_copy__8;
    id v37 = __Block_byref_object_dispose__8;
    id v38 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__8;
    char v31 = __Block_byref_object_dispose__8;
    id v32 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__WLKSettingsStore_setStatus_forChannelID_externalID___block_invoke;
    block[3] = &unk_1E620BB60;
    id v24 = &v27;
    void block[4] = self;
    id v22 = v8;
    id v23 = v9;
    id v25 = &v33;
    unint64_t v26 = a3;
    dispatch_sync(accessQueue, block);
    if (!v34[5] && [(id)v28[5] count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v12 = (id)v28[5];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v39 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            objc_msgSend(v16, "setAccessStatus:", 2, (void)v17);
            [v16 setObsolete:1];
            [(WLKSettingsStore *)self _attemptCullingOfObsoleteApp:v16];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v39 count:16];
        }
        while (v13);
      }
    }
    [(WLKSettingsStore *)self _tickleKVO];

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    [(WLKSettingsStore *)self _writeToDisk];
  }
  else
  {
    NSLog(&cfstr_Wlksettingssto_5.isa);
  }
}

void __54__WLKSettingsStore_setStatus_forChannelID_externalID___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)[v2[7] copy];
  uint64_t v5 = [v2 _copyAppsForChannelID:v3 apps:v4];
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = *(id *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "externalID", (void)v18);
        BOOL v15 = +[WLKAppSettings isExternalID:v14 equalToExternalID:a1[6]];

        if (v15)
        {
          NSLog(&cfstr_Wlksettingssto_6.isa);
          objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v13);
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v16 = *(void **)(*(void *)(a1[8] + 8) + 40);
  if (v16)
  {
    [v16 setAccessStatus:a1[9]];
  }
  else
  {
    long long v17 = [[WLKAppSettings alloc] initWithChannelID:a1[5] accessStatus:a1[9] displayName:0 externalID:a1[6]];
    [*(id *)(a1[4] + 56) addObject:v17];
    NSLog(&cfstr_Wlksettingssto_7.isa);
  }
}

- (void)setName:(id)a3 forChannelID:(id)a4 externalID:(id)a5
{
  id v8 = a3;
  uint64_t v9 = [(WLKSettingsStore *)self settingsForChannelID:a4 externalID:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 displayName];
    char v12 = [v8 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      accessQueue = self->_accessQueue;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __52__WLKSettingsStore_setName_forChannelID_externalID___block_invoke;
      long long v17 = &unk_1E6209F68;
      id v18 = v10;
      id v19 = v8;
      dispatch_sync(accessQueue, &v14);
      [(WLKSettingsStore *)self _tickleKVO];
    }
  }
  [(WLKSettingsStore *)self _writeToDisk];
}

uint64_t __52__WLKSettingsStore_setName_forChannelID_externalID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisplayName:*(void *)(a1 + 40)];
}

- (void)publishCrossProcessSettingsChangedNotification
{
  objc_initWeak(&location, self);
  id v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__WLKSettingsStore_publishCrossProcessSettingsChangedNotification__block_invoke;
  v3[3] = &unk_1E620A550;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __66__WLKSettingsStore_publishCrossProcessSettingsChangedNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = WeakRetained[18];
    id v4 = WeakRetained;
    pid_t v3 = getpid();
    notify_set_state(v2, v3);
    notify_post("com.apple.WatchListKit.WLKSettingsDidChangeNotification");
    id WeakRetained = v4;
  }
}

- (NSSet)suppressedSportsEventIDs
{
  pid_t v3 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"SuppressedSportsEventIDs"];

  if (v3)
  {
    id v4 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"SuppressedSportsEventIDs"];
    id v10 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v4 error:&v10];
    id v6 = v10;
    id v7 = v6;
    if (v6)
    {
      NSLog(&cfstr_Wlksettingssto_8.isa, v6);
      [MEMORY[0x1E4F1CAD0] set];
    }
    else
    {
      [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    id v8 = };
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v8;
}

- (void)setSportsNotificationSuppression:(BOOL)a3 forEventID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(WLKSettingsStore *)self suppressedSportsEventIDs];
  id v8 = (void *)[v7 mutableCopy];

  int v9 = [v8 containsObject:v6];
  if (v4)
  {
    if ((v9 & 1) == 0)
    {
      [v8 addObject:v6];
LABEL_6:
      accessQueue = self->_accessQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __64__WLKSettingsStore_setSportsNotificationSuppression_forEventID___block_invoke;
      v11[3] = &unk_1E6209F68;
      id v12 = v8;
      uint64_t v13 = self;
      dispatch_sync(accessQueue, v11);
    }
  }
  else if (v9)
  {
    [v8 removeObject:v6];
    goto LABEL_6;
  }
}

void __64__WLKSettingsStore_setSportsNotificationSuppression_forEventID___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) allObjects];
  id v10 = 0;
  pid_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v10];
  id v4 = v10;
  uint64_t v5 = v4;
  if (v4)
  {
    NSLog(&cfstr_Wlksettingssto_9.isa, v4);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 64) setObject:v3 forKey:@"SuppressedSportsEventIDs"];
    id v6 = objc_opt_class();
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    v11[0] = @"SuppressedSportsEventIDs";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    int v9 = [v7 setWithArray:v8];
    [v6 synchronizeSettingsDefaultsForKeys:v9];
  }
}

- (void)clearAllSportsNotificationSuppression
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__WLKSettingsStore_clearAllSportsNotificationSuppression__block_invoke;
  block[3] = &unk_1E620A708;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __57__WLKSettingsStore_clearAllSportsNotificationSuppression__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:@"SuppressedSportsEventIDs"];
  uint64_t v1 = objc_opt_class();
  int v2 = (void *)MEMORY[0x1E4F1CAD0];
  v5[0] = @"SuppressedSportsEventIDs";
  pid_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v4 = [v2 setWithArray:v3];
  [v1 synchronizeSettingsDefaultsForKeys:v4];
}

- (void)setOptedIn:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __31__WLKSettingsStore_setOptedIn___block_invoke;
  v5[3] = &unk_1E620BB88;
  void v5[4] = self;
  BOOL v6 = a3;
  dispatch_sync(accessQueue, v5);
  [(WLKSettingsStore *)self _writeToDisk];
}

uint64_t __31__WLKSettingsStore_setOptedIn___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = *(unsigned char *)(result + 40);
  return result;
}

- (NSNumber)optedInVal
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __30__WLKSettingsStore_optedInVal__block_invoke;
  v5[3] = &unk_1E620AB18;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

uint64_t __30__WLKSettingsStore_optedInVal__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setMigratediOS:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __35__WLKSettingsStore_setMigratediOS___block_invoke;
  v5[3] = &unk_1E620BB88;
  void v5[4] = self;
  BOOL v6 = a3;
  dispatch_sync(accessQueue, v5);
  [(WLKSettingsStore *)self _writeToDisk];
}

uint64_t __35__WLKSettingsStore_setMigratediOS___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 49) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)migratediOS
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __31__WLKSettingsStore_migratediOS__block_invoke;
  v5[3] = &unk_1E620AB18;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__WLKSettingsStore_migratediOS__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 49);
  return result;
}

- (void)setMigratedtvOS:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __36__WLKSettingsStore_setMigratedtvOS___block_invoke;
  v5[3] = &unk_1E620BB88;
  void v5[4] = self;
  BOOL v6 = a3;
  dispatch_sync(accessQueue, v5);
  [(WLKSettingsStore *)self _writeToDisk];
}

uint64_t __36__WLKSettingsStore_setMigratedtvOS___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 50) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)migratedtvOS
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __32__WLKSettingsStore_migratedtvOS__block_invoke;
  v5[3] = &unk_1E620AB18;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__WLKSettingsStore_migratedtvOS__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 50);
  return result;
}

- (void)setLastSyncDate:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __36__WLKSettingsStore_setLastSyncDate___block_invoke;
  id v10 = &unk_1E6209F68;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, &v7);
  [(WLKSettingsStore *)self _writeToDisk];
}

void __36__WLKSettingsStore_setLastSyncDate___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:*(void *)(*(void *)(a1 + 32) + 96) forKey:@"WLKSettingsLastSyncDate"];
  int v2 = objc_opt_class();
  char v3 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"WLKSettingsLastSyncDate";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v5 = [v3 setWithArray:v4];
  [v2 synchronizeSettingsDefaultsForKeys:v5];
}

- (void)setLastSyncToCloudDate:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __43__WLKSettingsStore_setLastSyncToCloudDate___block_invoke;
  id v10 = &unk_1E6209F68;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, &v7);
  [(WLKSettingsStore *)self _writeToDisk];
}

void __43__WLKSettingsStore_setLastSyncToCloudDate___block_invoke(uint64_t a1)
{
}

- (void)setPushToken:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__WLKSettingsStore_setPushToken___block_invoke;
  block[3] = &unk_1E620B688;
  id v6 = v4;
  id v8 = v6;
  char v9 = self;
  id v10 = &v11;
  dispatch_sync(accessQueue, block);
  if (*((unsigned char *)v12 + 24)) {
    [(WLKSettingsStore *)self _writeToDisk];
  }

  _Block_object_dispose(&v11, 8);
}

void __33__WLKSettingsStore_setPushToken___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(a1 + 40) + 24)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), *(id *)(a1 + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (NSString)pushToken
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __29__WLKSettingsStore_pushToken__block_invoke;
  v5[3] = &unk_1E620AB18;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __29__WLKSettingsStore_pushToken__block_invoke(uint64_t a1)
{
}

- (id)description
{
  int v2 = [(WLKSettingsStore *)self _dictionaryRepresentation];
  id v3 = [v2 description];

  return v3;
}

- (id)_watchListAppsFiltered
{
  int v2 = self;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = [(WLKSettingsStore *)self watchListApps];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v34 = v4;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v6 = +[WLKChannelUtilities sharedInstance];
  uint64_t v7 = [v6 orderedChannels];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v47;
    id v37 = v5;
    id v38 = v2;
    uint64_t v35 = *(void *)v47;
    id v36 = v8;
    do
    {
      uint64_t v12 = 0;
      uint64_t v39 = v10;
      do
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v46 + 1) + 8 * v12);
        if ([v13 isWatchListEnabled] && (objc_msgSend(v13, "isFirstParty") & 1) == 0)
        {
          char v14 = [v13 channelID];
          uint64_t v15 = [(WLKSettingsStore *)v2 _appsForChannelID:v14];

          if ([v15 count])
          {
            uint64_t v41 = v12;
            uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
            long long v17 = [v13 appBundleIDs];
            id v18 = [v17 firstObject];
            id v19 = WLKSubscriptionIdentifierForBundleID(v18);

            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            uint64_t v40 = v15;
            id v20 = v15;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = 0;
              uint64_t v24 = *(void *)v43;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v43 != v24) {
                    objc_enumerationMutation(v20);
                  }
                  unint64_t v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                  uint64_t v27 = [v26 displayName];
                  if ([v27 length])
                  {
                    uint64_t v28 = [v26 accessStatus];

                    if (v28)
                    {
                      uint64_t v29 = [v26 externalID];
                      BOOL v30 = +[WLKAppSettings isExternalID:v29 equalToExternalID:v19];

                      if (v30)
                      {
                        id v31 = v26;

                        uint64_t v23 = v31;
                      }
                      else
                      {
                        [v16 addObject:v26];
                      }
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
              }
              while (v22);

              uint64_t v5 = v37;
              int v2 = v38;
              uint64_t v11 = v35;
              id v8 = v36;
              if (v23)
              {
                [v37 addObject:v23];
                uint64_t v10 = v39;
                goto LABEL_28;
              }
            }
            else
            {
            }
            uint64_t v10 = v39;
            if ([v16 count])
            {
              id v32 = [v16 firstObject];
              [v5 addObject:v32];
            }
            uint64_t v23 = 0;
LABEL_28:

            uint64_t v15 = v40;
            uint64_t v12 = v41;
          }
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v10);
  }

  [v5 sortUsingComparator:&__block_literal_global_102];

  return v5;
}

uint64_t __42__WLKSettingsStore__watchListAppsFiltered__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 displayName];
  uint64_t v6 = [v4 displayName];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (void)_updateDisplayNamesForUI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__WLKSettingsStore__updateDisplayNamesForUI___block_invoke;
  v7[3] = &unk_1E620A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__WLKSettingsStore__updateDisplayNamesForUI___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v2 = +[WLKChannelUtilities sharedInstance];
  id v3 = [v2 channelsByID];

  if (v3)
  {
    [*(id *)(a1 + 32) beginIgnoringChanges];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v22 = a1;
    id obj = [*(id *)(a1 + 32) watchListApps];
    uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v4) {
      goto LABEL_21;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v9 = [v8 channelID];
        uint64_t v10 = [v3 objectForKeyedSubscript:v9];

        uint64_t v11 = [v10 title];
        if ([v11 length])
        {
          uint64_t v12 = [v8 displayName];
          id v13 = v11;
          id v14 = v12;
          if (v13 == v14)
          {

            long long v17 = v13;
            goto LABEL_18;
          }
          uint64_t v15 = v14;
          if (v13) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {

LABEL_17:
            id v19 = *(void **)(v22 + 32);
            long long v17 = [v8 channelID];
            uint64_t v20 = [v8 externalID];
            [v19 setName:v13 forChannelID:v17 externalID:v20];
            id v13 = (id)v20;
LABEL_18:

            goto LABEL_19;
          }
          char v18 = [v13 isEqual:v14];

          if ((v18 & 1) == 0) {
            goto LABEL_17;
          }
        }
LABEL_19:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v5)
      {
LABEL_21:

        a1 = v22;
        [*(id *)(v22 + 32) endIgnoringChanges];
        break;
      }
    }
  }
  uint64_t v21 = *(void *)(a1 + 40);
  if (v21) {
    (*(void (**)(uint64_t, BOOL))(v21 + 16))(v21, v3 != 0);
  }
}

- (id)_dictionaryRepresentationDataOnly
{
  int v2 = [(WLKSettingsStore *)self _dictionaryRepresentationCopyingItems:1];
  id v3 = (void *)[v2 mutableCopy];

  [v3 removeObjectForKey:@"LastSyncDate"];
  [v3 removeObjectForKey:@"LastSyncToCloudDate"];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (void)_writeToDisk
{
  if ([(WLKSettingsStore *)self ignoreChangesCount] < 1)
  {
    id v3 = (void *)MEMORY[0x1BA9E92A0]();
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v5 = [(WLKSettingsStore *)self _dictionaryRepresentation];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__WLKSettingsStore__writeToDisk__block_invoke;
    v8[3] = &unk_1E620BC28;
    dispatch_semaphore_t v9 = v4;
    uint64_t v6 = v4;
    [(WLKSettingsStore *)self _writeToDisk:v5 completion:v8];

    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v7);
  }
  else
  {
    [(WLKSettingsStore *)self setHasOutstandingChanges:1];
  }
}

intptr_t __32__WLKSettingsStore__writeToDisk__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_writeToDisk:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (WLKShouldRunInProcess())
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke;
    v12[3] = &unk_1E620BCC8;
    objc_copyWeak(&v15, &location);
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    [(WLKSettingsStore *)self _dictionaryOnDisk:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    readWriteQueue = self->_readWriteQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_5;
    v9[3] = &unk_1E620BD18;
    v9[4] = self;
    id v11 = v7;
    id v10 = v6;
    dispatch_async(readWriteQueue, v9);
  }
}

void __44__WLKSettingsStore__writeToDisk_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_initWeak(&location, WeakRetained);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_2;
  v7[3] = &unk_1E620BCA0;
  objc_copyWeak(&v12, &location);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __44__WLKSettingsStore__writeToDisk_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([*(id *)(a1 + 32) isEqualToDictionary:*(void *)(a1 + 40)])
  {
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    }
    NSLog(&cfstr_Wlksettingssto_15.isa);
  }
  else
  {
    dispatch_semaphore_t v4 = WLKDefaultSupportPath();
    if ([v4 length])
    {
      uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

      uint64_t v6 = *(void *)(a1 + 32);
      id v17 = 0;
      id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v17];
      id v8 = v17;
      if (v7)
      {
        id v9 = [WeakRetained _supportPath];
        unsigned int v10 = [v7 writeToFile:v9 atomically:1];
      }
      else
      {
        unsigned int v10 = 0;
      }
      NSLog(&cfstr_Wlksettingssto_14.isa, v10);
      id v11 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_3;
      block[3] = &unk_1E620BC78;
      uint64_t v12 = *(void *)(a1 + 48);
      id v13 = *(void **)(a1 + 56);
      void block[4] = WeakRetained;
      void block[5] = v12;
      id v15 = v13;
      char v16 = v10;
      dispatch_async(v11, block);
    }
    else
    {
      NSLog(&cfstr_Wlksettingssto.isa);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __44__WLKSettingsStore__writeToDisk_completion___block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_4;
  v4[3] = &unk_1E620BC50;
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  char v6 = *(unsigned char *)(a1 + 56);
  [v2 _loadFromDiskWithCompletion:v4];
}

uint64_t __44__WLKSettingsStore__writeToDisk_completion___block_invoke_4(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 72);
  pid_t v3 = getpid();
  notify_set_state(v2, v3);
  notify_post("com.apple.WatchListKit.WLKSettingsDidChangeNotification");
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __44__WLKSettingsStore__writeToDisk_completion___block_invoke_5(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_6;
  v7[3] = &unk_1E620A438;
  id v8 = *(id *)(a1 + 48);
  pid_t v3 = [v2 remoteObjectProxyWithErrorHandler:v7];

  NSLog(&cfstr_Wlksettingssto_17.isa);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_7;
  v5[3] = &unk_1E620BCF0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 writeSettingsStore:v4 replyHandler:v5];
}

uint64_t __44__WLKSettingsStore__writeToDisk_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_Wlksettingssto_16.isa, a2);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __44__WLKSettingsStore__writeToDisk_completion___block_invoke_7(uint64_t a1)
{
  NSLog(&cfstr_Wlksettingssto_18.isa);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    pid_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_Wlksettingssto_16.isa, a2);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)forceUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  pid_t v3 = +[WLKChannelUtilities sharedInstanceFiltered];
  [v3 invalidateCache];

  +[WLKSettingsCloudUtilities forceUpdateWithCompletion:v4];
}

- (void)synchronize:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 == 1)
  {
    id v7 = v5;
    id v5 = (id)+[WLKSettingsCloudUtilities updateLocalStoreWithCompletion:v5];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v7 = v5;
    id v5 = (id)+[WLKSettingsCloudUtilities updateCloudStoreWithCompletion:v5];
  }
  id v6 = v7;
LABEL_6:

  MEMORY[0x1F41817F8](v5, v6);
}

- (BOOL)synchronize:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F29060] currentThread];
  int v6 = [v5 isMainThread];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"WLKSettingsStoreException" reason:@"don't call synchronize: on main thread!" userInfo:0];
    [v7 raise];
  }
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__WLKSettingsStore_synchronize___block_invoke;
  v12[3] = &unk_1E620BD68;
  id v14 = &v15;
  id v9 = v8;
  id v13 = v9;
  [(WLKSettingsStore *)self synchronize:a3 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  char v10 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

intptr_t __32__WLKSettingsStore_synchronize___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_attemptCullingOfObsoleteApp:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKReachabilityMonitor sharedInstance];
  int v6 = [v5 isNetworkReachable];

  if (v6)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__WLKSettingsStore__attemptCullingOfObsoleteApp___block_invoke;
    v7[3] = &unk_1E620BD90;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    +[WLKSettingsCloudUtilities updateCloudStoreAppSettings:v8 deleteHistory:0 removeEntry:1 completion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __49__WLKSettingsStore__attemptCullingOfObsoleteApp___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _removeWatchListApp:*(void *)(a1 + 32)];
  }
}

+ (void)synchronizeSettingsDefaultsForKeys:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WLKSettingsStore_synchronizeSettingsDefaultsForKeys___block_invoke;
  block[3] = &unk_1E620A708;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __55__WLKSettingsStore_synchronizeSettingsDefaultsForKeys___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Wlksettingssto_23.isa);
  id v3 = objc_alloc_init(MEMORY[0x1E4F79CE0]);
  int v2 = WLKTVAppBundleID();
  [v3 synchronizeUserDefaultsDomain:v2 keys:*(void *)(a1 + 32)];

  NSLog(&cfstr_Wlksettingssto_24.isa);
}

- (void)_activeAccountChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  int v6 = objc_msgSend(v5, "ams_activeiTunesAccount");

  id v7 = objc_msgSend(v6, "ams_DSID");

  if (v7)
  {
    id v8 = objc_msgSend(v6, "ams_DSID");
    id v7 = [v8 stringValue];
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WLKSettingsStore__activeAccountChangedNotification___block_invoke;
  block[3] = &unk_1E620B688;
  id v10 = v7;
  id v12 = v10;
  id v13 = self;
  id v14 = &v15;
  dispatch_sync(accessQueue, block);
  if (*((unsigned char *)v16 + 24)) {
    [(WLKSettingsStore *)self refreshWithCompletion:0];
  }

  _Block_object_dispose(&v15, 8);
}

void __54__WLKSettingsStore__activeAccountChangedNotification___block_invoke(void *a1)
{
  int v2 = (void *)a1[4];
  if (v2)
  {
    if (([v2 isEqualToString:*(void *)(a1[5] + 32)] & 1) == 0)
    {
      NSLog(&cfstr_Wlksettingssto_25.isa);
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
  }
}

- (void)setSportsScoreSpoilersAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[WLKSystemPreferencesStore sharedPreferences];
  [v4 setSportsScoreSpoilersAllowed:v3];
}

- (BOOL)sportsScoreSpoilersAllowed
{
  int v2 = +[WLKSystemPreferencesStore sharedPreferences];
  char v3 = [v2 sportsScoreSpoilersAllowed];

  return v3;
}

- (void)setUpNextLockupsUseCoverArt:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[WLKSystemPreferencesStore sharedPreferences];
  [v4 setUpNextLockupsUseCoverArt:v3];
}

- (BOOL)upNextLockupsUseCoverArt
{
  int v2 = +[WLKSystemPreferencesStore sharedPreferences];
  char v3 = [v2 upNextLockupsUseCoverArt];

  return v3;
}

- (void)setPrivateModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[WLKSystemPreferencesStore sharedPreferences];
  [v4 setPrivateModeEnabled:v3];
}

- (BOOL)privateModeEnabled
{
  int v2 = +[WLKSystemPreferencesStore sharedPreferences];
  char v3 = [v2 privateModeEnabled];

  return v3;
}

- (void)setPostPlayAutoPlayNextVideo:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[WLKSystemPreferencesStore sharedPreferences];
  [v4 setPostPlayAutoPlayNextVideo:v3];
}

- (BOOL)postPlayAutoPlayNextVideo
{
  int v2 = +[WLKSystemPreferencesStore sharedPreferences];
  char v3 = [v2 postPlayAutoPlayNextVideo];

  return v3;
}

- (id)_appsForChannelID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__8;
  char v16 = __Block_byref_object_dispose__8;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__WLKSettingsStore__appsForChannelID___block_invoke;
  block[3] = &unk_1E620B688;
  void block[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  dispatch_sync(accessQueue, block);
  if ([(id)v13[5] count]) {
    id v7 = (void *)[(id)v13[5] copy];
  }
  else {
    id v7 = 0;
  }

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __38__WLKSettingsStore__appsForChannelID___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1[4] + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "channelID", (void)v10);
        int v9 = [v8 isEqualToString:a1[5]];

        if (v9) {
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)_removeWatchListApp:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __40__WLKSettingsStore__removeWatchListApp___block_invoke;
  long long v10 = &unk_1E6209F68;
  long long v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, &v7);
  [(WLKSettingsStore *)self _tickleKVO];
  [(WLKSettingsStore *)self _writeToDisk];
}

uint64_t __40__WLKSettingsStore__removeWatchListApp___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
}

- (void)beginIgnoringChanges
{
  int v3 = [(WLKSettingsStore *)self ignoreChangesCount];
  if (!v3) {
    NSLog(&cfstr_Wlksettingssto_26.isa);
  }

  [(WLKSettingsStore *)self setIgnoreChangesCount:(v3 + 1)];
}

- (void)endIgnoringChanges
{
  if ([(WLKSettingsStore *)self ignoreChangesCount] >= 1)
  {
    [(WLKSettingsStore *)self setIgnoreChangesCount:[(WLKSettingsStore *)self ignoreChangesCount] - 1];
    if (![(WLKSettingsStore *)self ignoreChangesCount])
    {
      NSLog(&cfstr_Wlksettingssto_27.isa);
      if ([(WLKSettingsStore *)self hasOutstandingChanges])
      {
        NSLog(&cfstr_Wlksettingssto_28.isa);
        [(WLKSettingsStore *)self setHasOutstandingChanges:0];
        [(WLKSettingsStore *)self _writeToDisk];
      }
    }
  }
}

void __31__WLKSettingsStore__connection__block_invoke()
{
}

void __31__WLKSettingsStore__connection__block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_Wlksettingssto_30.isa);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__WLKSettingsStore__connection__block_invoke_3;
    block[3] = &unk_1E620A708;
    id v6 = WeakRetained;
    dispatch_async(v4, block);
  }
}

void __31__WLKSettingsStore__connection__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = 0;
}

- (void)setOptedInVal:(id)a3
{
}

- (NSDate)lastSyncToCloudDate
{
  return self->_lastSyncToCloudDate;
}

- (void)setIgnoreChangesCount:(int)a3
{
  self->_ignoreChangesCount = a3;
}

- (BOOL)hasOutstandingChanges
{
  return self->_hasOutstandingChanges;
}

- (void)setHasOutstandingChanges:(BOOL)a3
{
  self->_hasOutstandingChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSyncToCloudDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_defaultsAccessor, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_optedInVal, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_readWriteQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end