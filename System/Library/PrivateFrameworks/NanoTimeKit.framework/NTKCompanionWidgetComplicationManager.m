@interface NTKCompanionWidgetComplicationManager
+ (id)instanceForDevice:(id)a3;
- (BOOL)isComplicationAvailable:(id)a3 forFamilies:(id)a4;
- (BOOL)loaded;
- (BOOL)vendorExistsForContainerBundleIdentifier:(id)a3;
- (BOOL)vendorExistsWithDescriptor:(id)a3;
- (NTKCompanionWidgetComplicationManager)initWithDevice:(id)a3;
- (id)_lock_sampleTemplateForWidget:(id)a3 family:(int64_t)a4;
- (id)cachedWidgetMigrationForAppIdentifier:(id)a3 descriptor:(id)a4;
- (id)cachedWidgetMigrationForClientIdentifier:(id)a3 descriptor:(id)a4;
- (id)infoForDescriptor:(id)a3;
- (id)sampleTemplateForWidget:(id)a3 family:(int64_t)a4;
- (void)_fetchInstalledApps;
- (void)_lock_updateAppNames;
- (void)_lock_updateAppNamesForClientIdentifer:(id)a3;
- (void)_lock_updateRecordsForAllClients;
- (void)_lock_updateRecordsForClientIdentifier:(id)a3;
- (void)_setAppLookup:(id)a3;
- (void)_setup;
- (void)_updateInstalledApps;
- (void)_updateLoaded;
- (void)complicationCollection:(id)a3 didUpdateComplicationDescriptorsForClient:(id)a4;
- (void)complicationCollection:(id)a3 didUpdateSampleTemplateForClient:(id)a4 descriptor:(id)a5;
- (void)complicationCollectionDidLoad:(id)a3;
- (void)complicationCollectionDidReload:(id)a3;
- (void)enumerateDescriptorsCompatibleWithFamilies:(id)a3 withBlock:(id)a4;
- (void)loadWidgetMigrationsForAppIdentifier:(id)a3 descriptor:(id)a4 completion:(id)a5;
- (void)performAfterLoad:(id)a3;
@end

@implementation NTKCompanionWidgetComplicationManager

+ (id)instanceForDevice:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 nrDeviceUUID];
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&instanceForDevice__lock);
      v6 = (void *)instanceForDevice__uuidToProvider;
      if (!instanceForDevice__uuidToProvider)
      {
        uint64_t v7 = objc_opt_new();
        v8 = (void *)instanceForDevice__uuidToProvider;
        instanceForDevice__uuidToProvider = v7;

        v6 = (void *)instanceForDevice__uuidToProvider;
      }
      v9 = [v6 objectForKeyedSubscript:v5];
      if (!v9)
      {
        v9 = [[NTKCompanionWidgetComplicationManager alloc] initWithDevice:v4];
        [(id)instanceForDevice__uuidToProvider setObject:v9 forKeyedSubscript:v5];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&instanceForDevice__lock);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NTKCompanionWidgetComplicationManager)initWithDevice:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKCompanionWidgetComplicationManager;
  v6 = [(NTKCompanionWidgetComplicationManager *)&v19 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = objc_opt_new();
    lock_clientToRecords = v7->_lock_clientToRecords;
    v7->_lock_clientToRecords = (NSMutableDictionary *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0x10000 valueOptions:517 capacity:0];
    lock_descriptorToRecord = v7->_lock_descriptorToRecord;
    v7->_lock_descriptorToRecord = (NSMapTable *)v10;

    uint64_t v12 = objc_opt_new();
    lock_appLookup = v7->_lock_appLookup;
    v7->_lock_appLookup = (NSDictionary *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    lock_loadCompletionBlocks = v7->_lock_loadCompletionBlocks;
    v7->_lock_loadCompletionBlocks = (NSMutableArray *)v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v7 selector:sel__fetchInstalledApps name:@"NTKCompanion3rdPartyAppInstallStartedNotification" object:0];
    [v16 addObserver:v7 selector:sel__fetchInstalledApps name:@"NTKSystemAppStateChangedNotification" object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_handleAppConduitApplicationsChangedNotification_1, (CFStringRef)*MEMORY[0x1E4F4AC38], v7, (CFNotificationSuspensionBehavior)0);
    [(NTKCompanionWidgetComplicationManager *)v7 _setup];
  }
  return v7;
}

- (void)performAfterLoad:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__NTKCompanionWidgetComplicationManager_performAfterLoad___block_invoke;
    aBlock[3] = &unk_1E62C0718;
    id v6 = v4;
    id v12 = v6;
    uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_loaded)
    {
      os_unfair_lock_unlock(&self->_lock);
      v7[2](v7);
    }
    else
    {
      lock_loadCompletionBlocks = self->_lock_loadCompletionBlocks;
      uint64_t v10 = _Block_copy(v6);
      [(NSMutableArray *)lock_loadCompletionBlocks addObject:v10];

      os_unfair_lock_unlock(p_lock);
    }
  }
}

void __58__NTKCompanionWidgetComplicationManager_performAfterLoad___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__NTKCompanionWidgetComplicationManager_performAfterLoad___block_invoke_2;
    block[3] = &unk_1E62C0718;
    id v4 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __58__NTKCompanionWidgetComplicationManager_performAfterLoad___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = +[NTKCompanionComplicationCollectionManager sharedWidgetComplicationCollectionForDevice:self->_device];
  lock_complicationCollection = self->_lock_complicationCollection;
  self->_lock_complicationCollection = v4;
  id v6 = v4;

  [(NTKComplicationCollection *)self->_lock_complicationCollection addObserver:self];
  os_unfair_lock_unlock(p_lock);
  [(NTKCompanionWidgetComplicationManager *)self _fetchInstalledApps];
}

- (void)enumerateDescriptorsCompatibleWithFamilies:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  p_lock = &self->_lock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)[(NSMutableDictionary *)self->_lock_clientToRecords copy];
  os_unfair_lock_unlock(p_lock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke;
  v12[3] = &unk_1E62C5E78;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  [v8 enumerateObjectsUsingBlock:v12];
}

void __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke_2;
  v5[3] = &unk_1E62C94C0;
  uint64_t v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke_3;
  v5[3] = &unk_1E62C9498;
  id v4 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v6 = v4;
  [a3 enumerateObjectsUsingBlock:v5];
}

void __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  id v6 = [v11 supportedClockKitFamilies];
  uint64_t v7 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [v11 widgetDescriptor];
    (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))(v9, v10, a4);
  }
}

- (id)infoForDescriptor:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMapTable *)self->_lock_descriptorToRecord objectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = [v6 appName];
  int v8 = [v6 displayName];
  if (!v7)
  {
    uint64_t v9 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(NTKCompanionWidgetComplicationManager *)(uint64_t)v4 infoForDescriptor:v9];
    }

    uint64_t v7 = [v4 containerBundleIdentifier];
  }
  id v10 = [[NTKWidgetComplicationInfo alloc] initWithAppName:v7 displayName:v8];

  if (!v10)
  {
LABEL_7:
    id v11 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NTKCompanionWidgetComplicationManager infoForDescriptor:]();
    }

    id v12 = +[NTKCompanionWidgetFallbackPreviewProvider sharedInstance];
    id v10 = [v12 fallbackInfoForDescriptor:v4];

    if (!v10)
    {
      id v13 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[NTKCompanionWidgetComplicationManager infoForDescriptor:]();
      }

      os_unfair_lock_lock(&self->_lock);
      lock_appLookup = self->_lock_appLookup;
      v15 = [v4 containerBundleIdentifier];
      v16 = [(NSDictionary *)lock_appLookup objectForKeyedSubscript:v15];
      v17 = [v16 applicationName];

      os_unfair_lock_unlock(p_lock);
      id v18 = v17;
      id v10 = [[NTKWidgetComplicationInfo alloc] initWithAppName:v18 displayName:v18];
    }
  }

  return v10;
}

- (BOOL)vendorExistsWithDescriptor:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_clientToRecords = self->_lock_clientToRecords;
  uint64_t v7 = [v4 containerBundleIdentifier];
  int v8 = [(NSMutableDictionary *)lock_clientToRecords objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = [v13 widgetDescriptor];
        v15 = [v14 extensionBundleIdentifier];
        v16 = [v4 extensionBundleIdentifier];
        if ([v15 isEqualToString:v16])
        {
          v17 = [v13 widgetDescriptor];
          [v17 kind];
          objc_super v19 = v18 = v11;
          [v4 kind];
          v21 = id v20 = v4;
          char v25 = [v19 isEqualToString:v21];

          id v4 = v20;
          uint64_t v11 = v18;

          if (v25)
          {
            BOOL v22 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }
  BOOL v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)vendorExistsForContainerBundleIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_lock_clientToRecords objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = [v6 count] != 0;

  return (char)p_lock;
}

- (BOOL)isComplicationAvailable:(id)a3 forFamilies:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_clientToRecords = self->_lock_clientToRecords;
  long long v28 = v6;
  uint64_t v9 = [v6 containerBundleIdentifier];
  uint64_t v10 = [(NSMutableDictionary *)lock_clientToRecords objectForKeyedSubscript:v9];

  os_unfair_lock_unlock(p_lock);
  char v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v23];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    uint64_t v27 = *(void *)v38;
    v24 = v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "widgetDescriptor", v23, v24);
        v15 = [v14 extensionBundleIdentifier];
        v16 = [v28 extensionBundleIdentifier];
        if ([v15 isEqualToString:v16])
        {
          v17 = [v13 widgetDescriptor];
          uint64_t v18 = [v17 kind];
          objc_super v19 = [v28 kind];
          int v20 = [v18 isEqualToString:v19];

          if (v20)
          {
            uint64_t v33 = 0;
            v34 = &v33;
            uint64_t v35 = 0x2020000000;
            char v36 = 0;
            uint64_t v21 = [v13 supportedClockKitFamilies];
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v30[0] = __77__NTKCompanionWidgetComplicationManager_isComplicationAvailable_forFamilies___block_invoke;
            v30[1] = &unk_1E62C1B88;
            id v31 = v25;
            v32 = &v33;
            [(id)v21 enumerateObjectsUsingBlock:v29];

            LOBYTE(v21) = *((unsigned char *)v34 + 24) == 0;
            _Block_object_dispose(&v33, 8);
            if ((v21 & 1) == 0)
            {
              LOBYTE(v11) = 1;
              goto LABEL_13;
            }
          }
        }
        else
        {
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v11);
  }
LABEL_13:

  return v11;
}

uint64_t __77__NTKCompanionWidgetComplicationManager_isComplicationAvailable_forFamilies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_updateLoaded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableArray *)self->_lock_loadCompletionBlocks copy];
  if (!self->_lock_appsLoaded)
  {
    self->_int loaded = 0;
LABEL_10:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_11;
  }
  int loaded = self->_loaded;
  int lock_collectionLoaded = self->_lock_collectionLoaded;
  self->_int loaded = lock_collectionLoaded;
  if (loaded == lock_collectionLoaded || lock_collectionLoaded == 0) {
    goto LABEL_10;
  }
  [(NSMutableArray *)self->_lock_loadCompletionBlocks removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  int v8 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKCompanionWidgetComplicationManager loaded", buf, 2u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__NTKCompanionWidgetComplicationManager__updateLoaded__block_invoke;
  v9[3] = &unk_1E62C09C0;
  v9[4] = self;
  id v10 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v9);

LABEL_11:
}

void __54__NTKCompanionWidgetComplicationManager__updateLoaded__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKCompanionWidgetComplicationManagerDidLoadNotification" object:*(void *)(a1 + 32)];

  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NTKWidgetComplicationProviderComplicationsDidChange" object:*(void *)(a1 + 32)];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(a1 + 40);
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_lock_updateAppNames
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = [(NSMutableDictionary *)self->_lock_clientToRecords allKeys];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__NTKCompanionWidgetComplicationManager__lock_updateAppNames__block_invoke;
  v4[3] = &unk_1E62C0188;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __61__NTKCompanionWidgetComplicationManager__lock_updateAppNames__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_updateAppNamesForClientIdentifer:", a2);
}

- (void)_lock_updateAppNamesForClientIdentifer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_clientToRecords, "objectForKeyedSubscript:", v4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        long long v11 = [(NSDictionary *)self->_lock_appLookup objectForKeyedSubscript:v4];
        long long v12 = [v11 applicationName];
        [v10 setAppName:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_fetchInstalledApps
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_fetchingApps)
  {
    id v4 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL lock_wantsAppFetch = self->_lock_wantsAppFetch;
      v6[0] = 67109120;
      v6[1] = lock_wantsAppFetch;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Attempted to fetch installed apps while already fetching installed apps! Deferring until after the first operation completes... (previously defered=%d)", (uint8_t *)v6, 8u);
    }

    self->_BOOL lock_wantsAppFetch = 1;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    [(NTKCompanionWidgetComplicationManager *)self _updateInstalledApps];
  }
}

- (void)_updateInstalledApps
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_lock_fetchingApps = 1;
  os_unfair_lock_unlock(p_lock);
  id v4 = [(CLKDevice *)self->_device nrDevice];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__52;
  v14[4] = __Block_byref_object_dispose__52;
  id v15 = (id)objc_opt_new();
  uint64_t v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke;
  block[3] = &unk_1E62C3040;
  void block[4] = self;
  block[5] = v14;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
  uint64_t v6 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_2;
  v9[3] = &unk_1E62C94E8;
  id v7 = v4;
  id v10 = v7;
  uint64_t v8 = v5;
  long long v11 = v8;
  long long v12 = v14;
  [v6 enumerateInstalledApplicationsOnPairedDevice:v7 withBlock:v9];

  _Block_object_dispose(v14, 8);
}

void __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Updated app records: %lu", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  [v4 _setAppLookup:v5];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
  uint64_t v6 = *(void *)(a1 + 32);
  LODWORD(v4) = *(unsigned __int8 *)(v6 + 59);
  *(unsigned char *)(v6 + 58) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 59) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
  if (v4)
  {
    id v7 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetching apps, but beginning a backlogged refresh", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_56;
    block[3] = &unk_1E62BFF20;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_56(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateInstalledApps];
}

uint64_t __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v5 watchKitAppExtensionBundleID];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v5 bundleIdentifier];
    }
    long long v12 = v10;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v5 forKeyedSubscript:v12];
  }
  else
  {
    if (v6)
    {
      uint64_t v11 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_2_cold_1(a1);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

  return 1;
}

- (void)_setAppLookup:(id)a3
{
  id v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_appLookup = self->_lock_appLookup;
  self->_lock_appLookup = v4;

  [(NTKCompanionWidgetComplicationManager *)self _lock_updateAppNames];
  self->_lock_appsLoaded = 1;
  os_unfair_lock_unlock(&self->_lock);
  [(NTKCompanionWidgetComplicationManager *)self _updateLoaded];
}

- (id)cachedWidgetMigrationForClientIdentifier:(id)a3 descriptor:(id)a4
{
  return 0;
}

- (void)_lock_updateRecordsForClientIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(NTKComplicationCollection *)self->_lock_complicationCollection complicationDescriptorsForClientIdentifier:v4];
  id v6 = (void *)[v5 copy];

  id v7 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        long long v13 = objc_opt_new();
        [v13 setComplicationDescriptor:v12];
        long long v14 = [v12 widgetDescriptor];
        [v13 setWidgetDescriptor:v14];

        id v15 = [v12 supportedFamilies];
        long long v16 = (void *)[v15 copy];
        [v13 setSupportedClockKitFamilies:v16];

        v17 = [v12 displayName];
        [v13 setDisplayName:v17];

        uint64_t v18 = [(NSDictionary *)self->_lock_appLookup objectForKeyedSubscript:v4];
        objc_super v19 = [v18 applicationName];
        [v13 setAppName:v19];

        [v7 addObject:v13];
        lock_descriptorToRecord = self->_lock_descriptorToRecord;
        uint64_t v21 = [v13 widgetDescriptor];
        [(NSMapTable *)lock_descriptorToRecord setObject:v13 forKey:v21];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  if ([v7 count])
  {
    BOOL v22 = (void *)[v7 copy];
    [(NSMutableDictionary *)self->_lock_clientToRecords setObject:v22 forKeyedSubscript:v4];
  }
  else
  {
    [(NSMutableDictionary *)self->_lock_clientToRecords removeObjectForKey:v4];
  }
}

- (void)_lock_updateRecordsForAllClients
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [(NTKComplicationCollection *)self->_lock_complicationCollection clients];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        [(NTKCompanionWidgetComplicationManager *)self _lock_updateRecordsForClientIdentifier:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)complicationCollectionDidLoad:(id)a3
{
  uint64_t v4 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Complication collection did load", v6, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  [(NTKCompanionWidgetComplicationManager *)self _lock_updateRecordsForAllClients];
  self->_int lock_collectionLoaded = 1;
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"NTKCompanionWidgetComplicationManagerComplicationTemplatesDidChange" object:self];

  [(NTKCompanionWidgetComplicationManager *)self _updateLoaded];
}

- (void)complicationCollectionDidReload:(id)a3
{
  uint64_t v4 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Complication collection did reload", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  [(NTKCompanionWidgetComplicationManager *)self _lock_updateRecordsForAllClients];
  self->_int lock_collectionLoaded = 1;
  os_unfair_lock_unlock(&self->_lock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__NTKCompanionWidgetComplicationManager_complicationCollectionDidReload___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__NTKCompanionWidgetComplicationManager_complicationCollectionDidReload___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKWidgetComplicationProviderComplicationsDidChange" object:*(void *)(a1 + 32)];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NTKCompanionWidgetComplicationManagerComplicationTemplatesDidChange" object:*(void *)(a1 + 32)];
}

- (void)complicationCollection:(id)a3 didUpdateSampleTemplateForClient:(id)a4 descriptor:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 postNotificationName:@"NTKCompanionWidgetComplicationManagerComplicationTemplatesDidChange" object:self];
}

- (void)complicationCollection:(id)a3 didUpdateComplicationDescriptorsForClient:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (NTKComplicationCollection *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_complicationCollection = self->_lock_complicationCollection;

  if (lock_complicationCollection == v7)
  {
    [(NTKCompanionWidgetComplicationManager *)self _lock_updateRecordsForClientIdentifier:v6];
    os_unfair_lock_unlock(&self->_lock);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__NTKCompanionWidgetComplicationManager_complicationCollection_didUpdateComplicationDescriptorsForClient___block_invoke;
    block[3] = &unk_1E62BFF20;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

void __106__NTKCompanionWidgetComplicationManager_complicationCollection_didUpdateComplicationDescriptorsForClient___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKWidgetComplicationProviderComplicationsDidChange" object:*(void *)(a1 + 32)];
}

- (id)sampleTemplateForWidget:(id)a3 family:(int64_t)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v8 = [(NTKCompanionWidgetComplicationManager *)self _lock_sampleTemplateForWidget:v6 family:a4];
  os_unfair_lock_unlock(p_lock);
  if (!v8)
  {
    long long v9 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NTKCompanionWidgetComplicationManager sampleTemplateForWidget:family:]();
    }

    long long v10 = +[NTKCompanionWidgetFallbackPreviewProvider sharedInstance];
    long long v8 = [v10 fallbackSampleTemplateForDescriptor:v6 family:a4];
  }
  return v8;
}

- (id)_lock_sampleTemplateForWidget:(id)a3 family:(int64_t)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_collectionLoaded)
  {
    uint64_t v7 = [(NSMapTable *)self->_lock_descriptorToRecord objectForKey:v6];
    if (v7)
    {
      lock_complicationCollection = self->_lock_complicationCollection;
      long long v9 = [v6 containerBundleIdentifier];
      long long v10 = [v7 complicationDescriptor];
      long long v11 = [v6 containerBundleIdentifier];
      long long v12 = [(NTKComplicationCollection *)lock_complicationCollection sampleTemplateForClientIdentifier:v9 descriptor:v10 applicationID:v11 family:a4];

      if (v12) {
        goto LABEL_13;
      }
      uint64_t v13 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[NTKCompanionWidgetComplicationManager _lock_sampleTemplateForWidget:family:]();
      }
    }
    else
    {
      uint64_t v13 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[NTKCompanionWidgetComplicationManager _lock_sampleTemplateForWidget:family:]();
      }
      long long v12 = 0;
    }
  }
  else
  {
    uint64_t v7 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NTKCompanionWidgetComplicationManager _lock_sampleTemplateForWidget:family:]();
    }
    long long v12 = 0;
  }
LABEL_13:

  return v12;
}

- (id)cachedWidgetMigrationForAppIdentifier:(id)a3 descriptor:(id)a4
{
  return 0;
}

- (void)loadWidgetMigrationsForAppIdentifier:(id)a3 descriptor:(id)a4 completion:(id)a5
{
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_loadCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_lock_appLookup, 0);
  objc_storeStrong((id *)&self->_lock_descriptorToRecord, 0);
  objc_storeStrong((id *)&self->_lock_clientToRecords, 0);
  objc_storeStrong((id *)&self->_lock_complicationCollection, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)infoForDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Missing record and fallback preview provision for %@. Looking up remote app name for display.", v2, v3, v4, v5, v6);
}

- (void)infoForDescriptor:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Missing record for %@. Querying fallback preview provider.", v2, v3, v4, v5, v6);
}

- (void)infoForDescriptor:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a2 appName];
  uint64_t v7 = [a2 displayName];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  long long v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "Incomplete record for %@: %@ %@", (uint8_t *)&v8, 0x20u);
}

void __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) pairingID];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "Couldn't fetch apps on device id %@: %@", v4, v5, v6, v7, v8);
}

- (void)sampleTemplateForWidget:family:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Missing sample template for %@. Querying fallback preview provider.", v2, v3, v4, v5, v6);
}

- (void)_lock_sampleTemplateForWidget:family:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "NTKCompanionWidgetComplicationManager failed to find sample template, collection not loaded %@", v2, v3, v4, v5, v6);
}

- (void)_lock_sampleTemplateForWidget:family:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "NTKCompanionWidgetComplicationManager failed to find sample template, failed to get record %@", v2, v3, v4, v5, v6);
}

- (void)_lock_sampleTemplateForWidget:family:.cold.3()
{
  v0 = CLKComplicationFamilyDescription();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v1, v2, "NTKCompanionWidgetComplicationManager failed to find sample template for family=%@ descriptor=%@", v3, v4, v5, v6, v7);
}

@end