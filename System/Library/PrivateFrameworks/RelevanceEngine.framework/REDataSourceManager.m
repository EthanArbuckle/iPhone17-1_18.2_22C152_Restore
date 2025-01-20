@interface REDataSourceManager
+ (BOOL)_isPrioritizedDataSourceClass:(Class)a3;
+ (id)_prioritizedDataSourceClasses;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersionForDataSourceWithIdentifier:(SEL)a3;
- (BOOL)_isApplicationRemovedOrRestrictedForIdentifier:(id)a3;
- (BOOL)hasCompletedFirstElementLoad;
- (Class)classForDataSourceIdentifier:(id)a3;
- (NSArray)currentDataSources;
- (NSArray)dataSourceControllers;
- (NSSet)availableDataSourceIdentifiers;
- (NSSet)currentDataSourceIdentifiers;
- (NSSet)disabledDataSources;
- (NSSet)unrestirctedDataSourceIdentifiers;
- (REDataSourceLoader)loader;
- (REDataSourceManager)initWithRelevanceEngine:(id)a3 dataSourceLoader:(id)a4 withDelegate:(id)a5;
- (REDataSourceManagerObserver)delegate;
- (id)elementGroupForIdentifier:(id)a3;
- (void)_handleApplicationStateChange;
- (void)_queue_availableDataSourcesDidChange;
- (void)_queue_loadDataSourceWithIdentifier:(id)a3;
- (void)_queue_unloadDataSourceWithIdentifier:(id)a3;
- (void)_queue_updateAvailableDataSourceIdentifiers;
- (void)_updatePreferences;
- (void)dealloc;
- (void)enumerateElementDataSourceControllers:(id)a3;
- (void)enumerateElementDataSourceControllers:(id)a3 completion:(id)a4;
- (void)pause;
- (void)resume;
- (void)setAvailableDataSourceIdentifiers:(id)a3;
- (void)setCurrentDataSourceIdentifiers:(id)a3;
- (void)setCurrentDataSources:(id)a3;
@end

@implementation REDataSourceManager

- (void)_queue_loadDataSourceWithIdentifier:(id)a3
{
  id v18 = a3;
  if (v18)
  {
    v4 = [(RERelevanceEngineSubsystem *)self relevanceEngine];

    if (v4)
    {
      id v5 = [(NSDictionary *)self->_identifierDataSourceMap objectForKeyedSubscript:v18];
      v6 = [(NSDictionary *)self->_unmanagedDataSourcesMap objectForKeyedSubscript:v18];
      v7 = [REElementDataSourceController alloc];
      v8 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
      if (v6) {
        uint64_t v9 = [(REElementDataSourceController *)v7 initWithRelevanceEngine:v8 dataSource:v6];
      }
      else {
        uint64_t v9 = [(REElementDataSourceController *)v7 initWithRelevanceEngine:v8 dataSourceClass:v5];
      }
      v10 = (void *)v9;

      BOOL v11 = [(RERelevanceEngineSubsystem *)self isRunning];
      int v12 = [(id)objc_opt_class() _isPrioritizedDataSourceClass:v5];
      dataSourceControllers = self->_dataSourceControllers;
      if (v12) {
        [(NSMutableArray *)dataSourceControllers insertObject:v10 atIndex:0];
      }
      else {
        [(NSMutableArray *)dataSourceControllers addObject:v10];
      }
      [v10 setState:self->_dataSourceState];
      [v10 setAllowsLocationUse:self->_locationAllowed];
      v14 = [(REDataSourceManager *)self currentDataSourceIdentifiers];
      v15 = [v14 setByAddingObject:v18];

      v16 = (void *)[v15 copy];
      [(REDataSourceManager *)self setCurrentDataSourceIdentifiers:v16];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained dataSourceManager:self didLoadDataSourceController:v10];

      if (v11)
      {
        [v10 resume];
        [v10 invalidateAndReloadWithCompletion:0];
      }
    }
  }
}

- (REDataSourceManager)initWithRelevanceEngine:(id)a3 dataSourceLoader:(id)a4 withDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v64.receiver = self;
  v64.super_class = (Class)REDataSourceManager;
  BOOL v11 = [(RERelevanceEngineSubsystem *)&v64 initWithRelevanceEngine:v8];
  if (v11)
  {
    int v12 = [v8 configuration];
    v11->_ignoreAppInstallation = [v12 ignoresInstalledApplications];

    v13 = [v8 configuration];
    v11->_disableAutomaticContentManagement = [v13 disableAutomaticContentManagement];

    uint64_t v14 = [MEMORY[0x263EFF980] array];
    dataSourceControllers = v11->_dataSourceControllers;
    v11->_dataSourceControllers = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    elementGroupMap = v11->_elementGroupMap;
    v11->_elementGroupMap = (REConcurrentDictionary *)v16;

    v11->_dataSourceState = 1;
    v11->_locationAllowed = 0;
    id v52 = v9;
    uint64_t v18 = [MEMORY[0x263EFFA08] set];
    disabledDataSources = v11->_disabledDataSources;
    v11->_disabledDataSources = (NSSet *)v18;

    v20 = [MEMORY[0x263EFFA08] set];
    [(REDataSourceManager *)v11 setAvailableDataSourceIdentifiers:v20];

    v21 = [MEMORY[0x263EFFA08] set];
    [(REDataSourceManager *)v11 setCurrentDataSourceIdentifiers:v21];

    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_loader, a4);
    [(REDataSourceManager *)v11 _updatePreferences];
    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v11 selector:sel__updatePreferences name:@"RERelevanceEnginePreferencesDidUpdate" object:0];

    v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v11 selector:sel__handleApplicationStateChange name:@"REApplicationStateDidChange" object:0];

    v24 = [MEMORY[0x263EFF9A0] dictionary];
    v25 = [MEMORY[0x263EFF9A0] dictionary];
    v26 = [MEMORY[0x263EFF9A0] dictionary];
    v27 = [MEMORY[0x263EFF9A0] dictionary];
    loader = v11->_loader;
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke;
    v60[3] = &unk_2644BF6B8;
    id v29 = v24;
    id v61 = v29;
    id v62 = v25;
    id v63 = v26;
    id v30 = v26;
    id v31 = v25;
    [(REDataSourceLoader *)loader enumerateDataSourceClassesWithBlock:v60];
    v32 = v11->_loader;
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_2;
    v57[3] = &unk_2644BF6E0;
    id v58 = v27;
    id v59 = v29;
    id v33 = v29;
    id v34 = v27;
    [(REDataSourceLoader *)v32 enumerateDataSourceObjectsWithBlock:v57];
    uint64_t v35 = [v33 copy];
    identifierDataSourceMap = v11->_identifierDataSourceMap;
    v11->_identifierDataSourceMap = (NSDictionary *)v35;

    uint64_t v37 = [v31 copy];
    identifierApplicationIdentifierMap = v11->_identifierApplicationIdentifierMap;
    v11->_identifierApplicationIdentifierMap = (NSDictionary *)v37;

    uint64_t v39 = [v30 copy];
    identifierOperatingSystemVersionMap = v11->_identifierOperatingSystemVersionMap;
    v11->_identifierOperatingSystemVersionMap = (NSDictionary *)v39;

    uint64_t v41 = [v34 copy];
    unmanagedDataSourcesMap = v11->_unmanagedDataSourcesMap;
    v11->_unmanagedDataSourcesMap = (NSDictionary *)v41;

    v43 = [MEMORY[0x263EFF9C0] set];
    v44 = v11->_loader;
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_3;
    v55[3] = &unk_2644BD430;
    id v56 = v43;
    id v45 = v43;
    [(REDataSourceLoader *)v44 enumerateBundleConfigurations:v55];
    uint64_t v46 = [v45 copy];
    elementGroupSupportingConfigurations = v11->_elementGroupSupportingConfigurations;
    v11->_elementGroupSupportingConfigurations = (NSSet *)v46;

    [(RERelevanceEngineSubsystem *)v11 beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:v11];
    v48 = [(RERelevanceEngineSubsystem *)v11 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_4;
    block[3] = &unk_2644BC660;
    v49 = v11;
    v54 = v49;
    dispatch_async(v48, block);

    v50 = [v8 logger];
    [v50 addLoggable:v49];

    id v9 = v52;
  }

  return v11;
}

- (void)_updatePreferences
{
  v3 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  v4 = [v3 effectivePreferences];

  if (v4)
  {
    id v5 = [v4 disabledDataSourceIdentifiers];
    char v6 = [v4 mode] & 1;
    uint64_t v7 = ~([v4 mode] >> 1) & 1;
    id v8 = [(RERelevanceEngineSubsystem *)self queue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__REDataSourceManager__updatePreferences__block_invoke;
    v10[3] = &unk_2644BF728;
    id v11 = v5;
    uint64_t v12 = v7;
    char v13 = v6;
    v10[4] = self;
    id v9 = v5;
    dispatch_async(v8, v10);
  }
}

void __52__REDataSourceManager__prioritizedDataSourceClasses__block_invoke()
{
  v0 = [MEMORY[0x263EFF9C0] set];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__REDataSourceManager__prioritizedDataSourceClasses__block_invoke_2;
  v5[3] = &unk_2644BF588;
  id v6 = v0;
  id v1 = v0;
  v2 = (void (**)(void, void))MEMORY[0x223C31700](v5);
  ((void (**)(void, __CFString *))v2)[2](v2, @"RESiriSnippetDataSource");
  ((void (**)(void, __CFString *))v2)[2](v2, @"REBreatheDataSource");
  ((void (**)(void, __CFString *))v2)[2](v2, @"NTKUpNextNewsDataSource");
  ((void (**)(void, __CFString *))v2)[2](v2, @"NSREDataSource");
  uint64_t v3 = [v1 copy];
  v4 = (void *)_prioritizedDataSourceClasses_Classes;
  _prioritizedDataSourceClasses_Classes = v3;
}

Class __52__REDataSourceManager__prioritizedDataSourceClasses__block_invoke_2(uint64_t a1, NSString *aClassName)
{
  Class result = NSClassFromString(aClassName);
  if (result)
  {
    Class v4 = result;
    id v5 = *(void **)(a1 + 32);
    return (Class)[v5 addObject:v4];
  }
  return result;
}

- (void)_queue_availableDataSourcesDidChange
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:");
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  Class v4 = self->_dataSourceControllers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v46 + 1) + 8 * i) bundleIdentifier];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v6);
  }

  [(REDataSourceManager *)self _queue_updateAvailableDataSourceIdentifiers];
  id v10 = [(REDataSourceManager *)self availableDataSourceIdentifiers];
  id v11 = (void *)[v10 mutableCopy];

  [v11 minusSet:self->_disabledDataSources];
  uint64_t v12 = (void *)[v3 mutableCopy];
  [v12 minusSet:v11];
  id v33 = v11;
  char v13 = (void *)[v11 mutableCopy];
  [v13 minusSet:v3];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        [(REDataSourceManager *)self _queue_unloadDataSourceWithIdentifier:*(void *)(*((void *)&v42 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v16);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v19 = v13;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v19);
        }
        [(REDataSourceManager *)self _queue_loadDataSourceWithIdentifier:*(void *)(*((void *)&v38 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v21);
  }

  v24 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v25 = self->_dataSourceControllers;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = [*(id *)(*((void *)&v34 + 1) + 8 * m) dataSource];
        [v24 addObject:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v34 objects:v50 count:16];
    }
    while (v27);
  }

  id v31 = (void *)[v24 copy];
  [(REDataSourceManager *)self setCurrentDataSources:v31];

  if ([v14 count] || objc_msgSend(v19, "count"))
  {
    v32 = [MEMORY[0x263F08A00] defaultCenter];
    [v32 postNotificationName:@"REUpNextDataSourcesDidChangeNotification" object:0];
  }
  [(RERelevanceEngineSubsystem *)self endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
}

uint64_t __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_availableDataSourcesDidChange");
  v2 = *(void **)(a1 + 32);
  return [v2 endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:v2];
}

void __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (REBundleConfiguraitonSupportsElementGroups(v3)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v18 = a2;
  id v3 = [(id)objc_opt_class() bundleIdentifier];
  if ([v3 length])
  {
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

    if (v10)
    {
      id v11 = (void *)*MEMORY[0x263EFF498];
      [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
      RERaiseInternalException(v11, @"Data source %@ and %@ have matching bundle identifiers %@. Skipping one...", v12, v13, v14, v15, v16, v17, (uint64_t)v18);
    }
    else
    {
      [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:v3];
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Data source (%@) does not have a bundle identifier", v4, v5, v6, v7, v8, v9, (uint64_t)v18);
  }
}

void __77__REDataSourceManager_initWithRelevanceEngine_dataSourceLoader_withDelegate___block_invoke(id *a1, void *a2)
{
  uint64_t v4 = [a2 bundleIdentifier];
  if ([v4 length])
  {
    if ([a1[4] objectForKeyedSubscript:v4])
    {
      id v11 = (void *)*MEMORY[0x263EFF498];
      [a1[4] objectForKeyedSubscript:v4];
      RERaiseInternalException(v11, @"Data sources %@ and %@ have matching bundle identifiers %@. Skipping one...", v12, v13, v14, v15, v16, v17, (uint64_t)a2);
    }
    else
    {
      [a1[4] setObject:a2 forKeyedSubscript:v4];
      id v18 = [a2 applicationBundleIdentifier];
      [a1[5] setObject:v18 forKeyedSubscript:v4];

      memset(v20, 0, sizeof(v20));
      if (a2) {
        [a2 minimumSupportedSystemVersion];
      }
      id v19 = [MEMORY[0x263F08D40] value:v20 withObjCType:"{?=qqq}"];
      [a1[6] setObject:v19 forKeyedSubscript:v4];
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Data source (%@) does not have a bundle identifier", v5, v6, v7, v8, v9, v10, (uint64_t)a2);
  }
}

void __66__REDataSourceManager__queue_updateAvailableDataSourceIdentifiers__block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:REAvailableDataSourceIdentifiersDidChange object:0];
}

void __41__REDataSourceManager__updatePreferences__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void *)(a1 + 48);
  BOOL v5 = v3 != v4;
  if (v3 != v4)
  {
    *(void *)(v2 + 48) = v4;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  int v6 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned __int8 *)(v2 + 56) != v6)
  {
    *(unsigned char *)(v2 + 56) = v6;
    uint64_t v2 = *(void *)(a1 + 32);
    BOOL v5 = 1;
  }
  char v7 = [*(id *)(v2 + 64) isEqualToSet:*(void *)(a1 + 40)];
  if (v7)
  {
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) copy];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = v8;

    if (!v5)
    {
LABEL_7:
      if (v7) {
        return;
      }
      goto LABEL_8;
    }
  }
  id v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__REDataSourceManager__updatePreferences__block_invoke_2;
  v12[3] = &__block_descriptor_41_e39_v16__0__REElementDataSourceController_8l;
  v12[4] = *(void *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 56);
  [v11 enumerateElementDataSourceControllers:v12];
  if (v7) {
    return;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "_queue_availableDataSourcesDidChange");
}

- (void)setCurrentDataSources:(id)a3
{
}

- (void)setCurrentDataSourceIdentifiers:(id)a3
{
}

- (void)setAvailableDataSourceIdentifiers:(id)a3
{
}

- (NSSet)currentDataSourceIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 144, 1);
}

- (NSSet)availableDataSourceIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)_queue_updateAvailableDataSourceIdentifiers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(NSDictionary *)self->_identifierDataSourceMap allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (!-[REDataSourceManager _isApplicationRemovedOrRestrictedForIdentifier:](self, "_isApplicationRemovedOrRestrictedForIdentifier:", v9))[v3 addObject:v9]; {
      }
        }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(REDataSourceManager *)self availableDataSourceIdentifiers];
  if (([v10 isEqual:v3] & 1) == 0)
  {
    id v11 = (void *)[v3 copy];
    [(REDataSourceManager *)self setAvailableDataSourceIdentifiers:v11];

    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_50_1);
  }
}

- (BOOL)_isApplicationRemovedOrRestrictedForIdentifier:(id)a3
{
  if (self->_ignoreAppInstallation)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    uint64_t v4 = [(NSDictionary *)self->_identifierApplicationIdentifierMap objectForKeyedSubscript:a3];
    uint64_t v5 = v4;
    if (v4)
    {
      if (!REApplicationIsRemote(v4)
        || (RELocalApplicationIdentifierForRemoteApplication(v5),
            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
            v5,
            (uint64_t v5 = (void *)v3) != 0))
      {
        if (REApplicationIsRestricted(v5)) {
          LOBYTE(v3) = 1;
        }
        else {
          LOBYTE(v3) = REApplicationIsRemoved(v5);
        }
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (id)_prioritizedDataSourceClasses
{
  if (_prioritizedDataSourceClasses_onceToken != -1) {
    dispatch_once(&_prioritizedDataSourceClasses_onceToken, &__block_literal_global_52);
  }
  uint64_t v2 = (void *)_prioritizedDataSourceClasses_Classes;
  return v2;
}

+ (BOOL)_isPrioritizedDataSourceClass:(Class)a3
{
  uint64_t v4 = [a1 _prioritizedDataSourceClasses];
  LOBYTE(a3) = [v4 containsObject:a3];

  return (char)a3;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  uint64_t v5 = [v4 logger];
  [v5 removeLoggable:self];

  v6.receiver = self;
  v6.super_class = (Class)REDataSourceManager;
  [(RERelevanceEngineSubsystem *)&v6 dealloc];
}

void __41__REDataSourceManager__updatePreferences__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setState:v3];
  [v4 setAllowsLocationUse:*(unsigned __int8 *)(a1 + 40)];
}

- (void)pause
{
}

uint64_t __28__REDataSourceManager_pause__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pause];
}

- (void)resume
{
  uint64_t v3 = objc_alloc_init(REExpectation);
  [(RERelevanceEngineSubsystem *)self beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
  dispatch_group_t v4 = dispatch_group_create();
  dataSourceControllers = self->_dataSourceControllers;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __29__REDataSourceManager_resume__block_invoke;
  v16[3] = &unk_2644BF770;
  v16[4] = self;
  objc_super v6 = v4;
  uint64_t v17 = v6;
  id v18 = v3;
  uint64_t v7 = v3;
  [(NSMutableArray *)dataSourceControllers enumerateObjectsUsingBlock:v16];
  uint64_t v8 = [(RERelevanceEngineSubsystem *)self queue];
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, &__block_literal_global_46_1);
  [(REExpectation *)v7 notifyOperationsCompleteOrPerformUsingQueue:v8 block:v9];

  uint64_t v10 = self->_dataSourceControllers;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __29__REDataSourceManager_resume__block_invoke_4;
  v14[3] = &unk_2644BF798;
  v14[4] = self;
  long long v15 = v6;
  id v11 = v6;
  [(NSMutableArray *)v10 enumerateObjectsUsingBlock:v14];
  long long v12 = [(RERelevanceEngineSubsystem *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __29__REDataSourceManager_resume__block_invoke_6;
  v13[3] = &unk_2644BC660;
  v13[4] = self;
  dispatch_group_notify(v11, v12, v13);
}

void __29__REDataSourceManager_resume__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend((id)objc_opt_class(), "_isPrioritizedDataSourceClass:", objc_msgSend(v3, "dataSourceClass")))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    [*(id *)(a1 + 48) beginOperation];
    [v3 resume];
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __29__REDataSourceManager_resume__block_invoke_2;
    uint64_t v8 = &unk_2644BC688;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    dispatch_group_t v4 = (void *)MEMORY[0x223C31700](&v5);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 121)) {
      objc_msgSend(v3, "processPendingUpdatesWhilePause:", v4, v5, v6, v7, v8, v9);
    }
    else {
      objc_msgSend(v3, "invalidateAndReloadWithCompletion:", v4, v5, v6, v7, v8, v9);
    }
  }
}

void __29__REDataSourceManager_resume__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) endOperation];
  uint64_t v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __29__REDataSourceManager_resume__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend((id)objc_opt_class(), "_isPrioritizedDataSourceClass:", objc_msgSend(v3, "dataSourceClass")) & 1) == 0)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    [v3 resume];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __29__REDataSourceManager_resume__block_invoke_5;
    v5[3] = &unk_2644BC660;
    id v6 = *(id *)(a1 + 40);
    dispatch_group_t v4 = (void *)MEMORY[0x223C31700](v5);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 121)) {
      [v3 processPendingUpdatesWhilePause:v4];
    }
    else {
      [v3 invalidateAndReloadWithCompletion:v4];
    }
  }
}

void __29__REDataSourceManager_resume__block_invoke_5(uint64_t a1)
{
}

uint64_t __29__REDataSourceManager_resume__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:*(void *)(a1 + 32)];
}

- (void)enumerateElementDataSourceControllers:(id)a3
{
}

- (void)enumerateElementDataSourceControllers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(RERelevanceEngineSubsystem *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__REDataSourceManager_enumerateElementDataSourceControllers_completion___block_invoke;
    block[3] = &unk_2644BE298;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __72__REDataSourceManager_enumerateElementDataSourceControllers_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__REDataSourceManager_enumerateElementDataSourceControllers_completion___block_invoke_2;
  v4[3] = &unk_2644BF7C0;
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v4];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

uint64_t __72__REDataSourceManager_enumerateElementDataSourceControllers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersionForDataSourceWithIdentifier:(SEL)a3
{
  if (a4)
  {
    id v5 = objc_msgSend(self[3].var2, "objectForKey:");
    retstr->var1 = 0;
    retstr->var2 = 0;
    retstr->var0 = 0;
    if (v5)
    {
      id v6 = v5;
      [v5 getValue:retstr];
      id v5 = v6;
    }
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return self;
}

- (void)_queue_unloadDataSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    dataSourceControllers = self->_dataSourceControllers;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __61__REDataSourceManager__queue_unloadDataSourceWithIdentifier___block_invoke;
    v19[3] = &unk_2644BF7E8;
    id v7 = v4;
    id v20 = v7;
    uint64_t v21 = &v22;
    [(NSMutableArray *)dataSourceControllers enumerateObjectsUsingBlock:v19];
    if (v23[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = 0;
      long long v14 = &v13;
      uint64_t v15 = 0x3032000000;
      uint64_t v16 = __Block_byref_object_copy__20;
      uint64_t v17 = __Block_byref_object_dispose__20;
      -[NSMutableArray objectAtIndexedSubscript:](self->_dataSourceControllers, "objectAtIndexedSubscript:");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      [(id)v14[5] pause];
      [(id)v14[5] prepareToUnload];
      uint64_t v8 = [(id)v14[5] elementOperationQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__REDataSourceManager__queue_unloadDataSourceWithIdentifier___block_invoke_48;
      v12[3] = &unk_2644BD960;
      v12[4] = self;
      void v12[5] = &v13;
      dispatch_async(v8, v12);

      id v9 = [(REDataSourceManager *)self currentDataSourceIdentifiers];
      id v10 = (void *)[v9 mutableCopy];

      [v10 removeObject:v7];
      id v11 = (void *)[v10 copy];
      [(REDataSourceManager *)self setCurrentDataSourceIdentifiers:v11];

      [(NSMutableArray *)self->_dataSourceControllers removeObjectAtIndex:v23[3]];
      _Block_object_dispose(&v13, 8);
    }
    _Block_object_dispose(&v22, 8);
  }
}

void __61__REDataSourceManager__queue_unloadDataSourceWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 bundleIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __61__REDataSourceManager__queue_unloadDataSourceWithIdentifier___block_invoke_48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
  [WeakRetained dataSourceManager:*(void *)(a1 + 32) willUnloadDataSourceController:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)_handleApplicationStateChange
{
  uint64_t v3 = [(RERelevanceEngineSubsystem *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__REDataSourceManager__handleApplicationStateChange__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __52__REDataSourceManager__handleApplicationStateChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_availableDataSourcesDidChange");
}

- (NSSet)unrestirctedDataSourceIdentifiers
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(NSDictionary *)self->_identifierDataSourceMap allKeys];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (NSArray)dataSourceControllers
{
  return (NSArray *)self->_dataSourceControllers;
}

- (NSSet)disabledDataSources
{
  return self->_disabledDataSources;
}

- (REDataSourceLoader)loader
{
  return self->_loader;
}

- (NSArray)currentDataSources
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (REDataSourceManagerObserver)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (REDataSourceManagerObserver *)WeakRetained;
}

- (BOOL)hasCompletedFirstElementLoad
{
  return self->_completedFirstElementLoad;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentDataSources, 0);
  objc_storeStrong((id *)&self->_currentDataSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableDataSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_elementGroupMap, 0);
  objc_storeStrong((id *)&self->_elementGroupSupportingConfigurations, 0);
  objc_storeStrong((id *)&self->_unmanagedDataSourcesMap, 0);
  objc_storeStrong((id *)&self->_identifierOperatingSystemVersionMap, 0);
  objc_storeStrong((id *)&self->_identifierApplicationIdentifierMap, 0);
  objc_storeStrong((id *)&self->_identifierDataSourceMap, 0);
  objc_storeStrong((id *)&self->_disabledDataSources, 0);
  objc_storeStrong((id *)&self->_dataSourceControllers, 0);
}

- (Class)classForDataSourceIdentifier:(id)a3
{
  return (Class)[(NSDictionary *)self->_identifierDataSourceMap objectForKeyedSubscript:a3];
}

- (id)elementGroupForIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(REConcurrentDictionary *)self->_elementGroupMap objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [MEMORY[0x263EFF9D0] null];
    int v8 = [v7 isEqual:v6];

    if (v8)
    {

      id v6 = 0;
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = self->_elementGroupSupportingConfigurations;
    uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v25 = 112;
      uint64_t v26 = self;
      id v6 = 0;
      uint64_t v12 = *(void *)v28;
      uint64_t v13 = (void *)*MEMORY[0x263EFF4A0];
      do
      {
        uint64_t v14 = 0;
        uint64_t v15 = v6;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          id v6 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v14), "elementGroupWithIdentifier:", v4, v25);

          uint64_t v16 = [v6 groupIdentifier];
          char v17 = [v16 isEqualToString:v4];

          if (v17)
          {
            if (v6)
            {
              [*(id *)((char *)&v26->super.super.isa + v25) setObject:v6 forKeyedSubscript:v4];
              goto LABEL_17;
            }
          }
          else
          {
            RERaiseInternalException(v13, @"The group identifiers should match", v18, v19, v20, v21, v22, v23, v25);
          }
          ++v14;
          uint64_t v15 = v6;
        }
        while (v11 != v14);
        uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }
    else
    {
      id v6 = 0;
    }
LABEL_17:
  }
  return v6;
}

@end