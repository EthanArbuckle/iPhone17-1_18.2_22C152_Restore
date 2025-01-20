@interface REElementDataSourceController
- (BOOL)_containsElementIdentifier:(id)a3;
- (BOOL)_isWhitelisted;
- (BOOL)_supportsContentRelevanceProviderForElement:(id)a3;
- (BOOL)_validElement:(id)a3;
- (BOOL)allowsLocationUse;
- (BOOL)hasDataAvailable;
- (BOOL)hasElementWithId:(id)a3 inSection:(unint64_t)a4;
- (BOOL)hasElementWithId:(id)a3 inSectionWithIdentifier:(id)a4;
- (BOOL)hasLoadedData;
- (Class)dataSourceClass;
- (NSArray)allElements;
- (NSArray)allProvidedElements;
- (NSArray)supportedSections;
- (NSString)applicationBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)name;
- (REElementDataSource)dataSource;
- (REElementDataSourceController)initWithRelevanceEngine:(id)a3 dataSource:(id)a4;
- (REElementDataSourceController)initWithRelevanceEngine:(id)a3 dataSourceClass:(Class)a4;
- (REElementDataSourceControllerDelegate)delegate;
- (id)_allDataSourceElements;
- (id)_dataSourceIdentifierFromIdentifier:(id)a3;
- (id)_elementForIdentifier:(id)a3;
- (id)_elementsByRemovingInvalidElements:(id)a3;
- (id)_groupElements:(id)a3 bySections:(id)a4;
- (id)_initWithRelevanceEngine:(id)a3 dataSourceClass:(Class)a4 dataSource:(id)a5;
- (id)_queue_elementsForIds:(id)a3;
- (id)_sectionForElementWithIdentifier:(id)a3;
- (id)_shallowCopiedElements:(id)a3;
- (id)_updateRelevanceProvidersForElement:(id)a3;
- (id)elementOperationQueue;
- (unint64_t)state;
- (unint64_t)updateCount;
- (unsigned)_defaultDataSourceQOS;
- (void)_addElementIdentifier:(id)a3;
- (void)_handleDeviceLockStateChange:(id)a3;
- (void)_loadLoggingHeader;
- (void)_namespaceElementIdentifier:(id)a3 section:(id)a4;
- (void)_performOrEnqueueUpdateBlock:(id)a3;
- (void)_queue_invalidateSections:(id)a3 completion:(id)a4;
- (void)_queue_pause;
- (void)_queue_performContentInvalidateWithElement:(id)a3 expectation:(id)a4 sections:(id)a5;
- (void)_queue_performUpdates;
- (void)_queue_processPendingUpdatesWhilePause:(id)a3;
- (void)_queue_processUpdates:(id)a3 forSection:(id)a4;
- (void)_queue_purgeContentWithCompletion:(id)a3;
- (void)_queue_reloadWithQOS:(unsigned int)a3 qosOffset:(int)a4 forceReload:(BOOL)a5 completion:(id)a6;
- (void)_queue_reloadWithQOS:(unsigned int)a3 qosOffset:(int)a4 forceReload:(BOOL)a5 operations:(id)a6 completion:(id)a7;
- (void)_queue_reloadWithQOS:(unsigned int)a3 qosOffset:(int)a4 forceReload:(BOOL)a5 sections:(id)a6 completion:(id)a7;
- (void)_queue_resume;
- (void)_queue_scheduleUpdate:(id)a3;
- (void)_queue_updateDataSourceLocationUse;
- (void)_removeElementForIdentifier:(id)a3;
- (void)_removeElementIdentifier:(id)a3;
- (void)_setSection:(id)a3 forElementWithIdentifier:(id)a4;
- (void)_storeElement:(id)a3;
- (void)addElements:(id)a3 toSectionWithIdentifier:(id)a4;
- (void)dealloc;
- (void)elementDidBecomeHidden:(id)a3;
- (void)elementWillBecomeVisible:(id)a3;
- (void)fetchElementWithIdentifierVisible:(id)a3 withHandler:(id)a4;
- (void)invalidateAndReloadWithCompletion:(id)a3;
- (void)invalidateElements;
- (void)invalidateElementsInSection:(id)a3;
- (void)invalidateElementsInSections:(id)a3 completion:(id)a4;
- (void)pause;
- (void)pauseIfNeeded;
- (void)prepareToUnload;
- (void)processPendingUpdatesWhilePause:(id)a3;
- (void)refreshElement:(id)a3;
- (void)reloadElement:(id)a3;
- (void)removeElementsWithIds:(id)a3;
- (void)resume;
- (void)setAllowsLocationUse:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation REElementDataSourceController

- (void)_loadLoggingHeader
{
  v3 = NSStringFromClass(self->_dataSourceClass);
  id v8 = (id)[v3 mutableCopy];

  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"RE", &stru_26CFA57D0, 0, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"NTK", &stru_26CFA57D0, 1, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"UpNext", &stru_26CFA57D0, 1, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"DataSource", &stru_26CFA57D0, 1, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"Watch", &stru_26CFA57D0, 1, 0, objc_msgSend(v8, "length"));
  v4 = NSString;
  v5 = [v8 lowercaseString];
  v6 = [v4 stringWithFormat:@"[DSC: %@]", v5];
  loggingHeader = self->_loggingHeader;
  self->_loggingHeader = v6;
}

- (id)_initWithRelevanceEngine:(id)a3 dataSourceClass:(Class)a4 dataSource:(id)a5
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v73 = a5;
  v83.receiver = self;
  v83.super_class = (Class)REElementDataSourceController;
  v9 = [(REElementDataSourceController *)&v83 init];
  v10 = v9;
  if (v9)
  {
    v9->_state = 1;
    v9->_isPerformingReload = 0;
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    enqueuedBlocks = v10->_enqueuedBlocks;
    v10->_enqueuedBlocks = (NSMutableArray *)v11;

    *(_WORD *)&v10->_willUnload = 0;
    v10->_wantsReloadWhilePaused = 0;
    objc_storeWeak((id *)&v10->_relevanceEngine, v8);
    v13 = [v8 configuration];
    v10->_disableAutomaticContentManagement = [v13 disableAutomaticContentManagement];

    objc_storeStrong((id *)&v10->_dataSourceClass, a4);
    [(REElementDataSourceController *)v10 _loadLoggingHeader];
    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    dataSourceElements = v10->_dataSourceElements;
    v10->_dataSourceElements = (NSMutableSet *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    dataSourceElementIdentifierMap = v10->_dataSourceElementIdentifierMap;
    v10->_dataSourceElementIdentifierMap = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    dataSourceElementSectionMap = v10->_dataSourceElementSectionMap;
    v10->_dataSourceElementSectionMap = (NSMutableDictionary *)v18;

    uint64_t v20 = [MEMORY[0x263EFF980] array];
    updates = v10->_updates;
    v10->_updates = (NSMutableArray *)v20;

    v10->_contentMode = [(objc_class *)a4 elementContentMode];
    dispatch_qos_class_t v22 = [(REElementDataSourceController *)v10 _defaultDataSourceQOS];
    v23 = NSString;
    v70 = NSStringFromClass(a4);
    v24 = [v23 stringWithFormat:@"com.apple.relevanceengine.%@Controller"];

    attr = dispatch_queue_attr_make_with_qos_class(0, v22, 0);
    id v72 = v24;
    dispatch_queue_t v25 = dispatch_queue_create((const char *)[v72 UTF8String], attr);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v25;

    if (([(objc_class *)a4 wantsPrivateQueue] & 1) == 0)
    {
      if (_initWithRelevanceEngine_dataSourceClass_dataSource__onceToken != -1) {
        dispatch_once(&_initWithRelevanceEngine_dataSourceClass_dataSource__onceToken, &__block_literal_global_10);
      }
      v27 = v10->_queue;
      v28 = [(id)_initWithRelevanceEngine_dataSourceClass_dataSource__QueuePool nextAvailableQueue];
      dispatch_set_target_queue(v27, v28);
    }
    int v29 = [v8 wantsImmutableContent];
    objc_initWeak(&location, v10);
    v30 = v10->_queue;
    if (v29) {
      double v31 = 0.0;
    }
    else {
      double v31 = 0.1;
    }
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_2;
    v80[3] = &unk_2644BC638;
    objc_copyWeak(&v81, &location);
    uint64_t v32 = +[REUpNextScheduler schedulerWithQueue:v30 delay:v80 updateBlock:v31];
    updateScheduler = v10->_updateScheduler;
    v10->_updateScheduler = (REUpNextScheduler *)v32;

    v34 = v10->_queue;
    if (v29) {
      double v35 = 0.0;
    }
    else {
      double v35 = 0.05;
    }
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_3;
    v77[3] = &unk_2644BCF28;
    objc_copyWeak(&v78, &location);
    dispatch_qos_class_t v79 = v22;
    uint64_t v36 = +[REUpNextScheduler schedulerWithQueue:v34 delay:v77 updateBlock:v35];
    reloadScheduler = v10->_reloadScheduler;
    v10->_reloadScheduler = (REUpNextScheduler *)v36;

    if ([(objc_class *)a4 wantsReloadForSignificantTimeChange])
    {
      v38 = RELogForDomain(2);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        loggingHeader = v10->_loggingHeader;
        *(_DWORD *)buf = 138412290;
        v85 = loggingHeader;
        _os_log_impl(&dword_21E6E6000, v38, OS_LOG_TYPE_DEFAULT, "%@ wantsReloadForSignificantTimeChange", buf, 0xCu);
      }

      v40 = [MEMORY[0x263F08A00] defaultCenter];
      v41 = RESignificantTimeChangeNotification();
      [v40 addObserver:v10 selector:sel__handleSignifiantTimeChange_ name:v41 object:0];
    }
    v10->_hasDataAvailable = 1;
    v42 = [MEMORY[0x263F08A00] defaultCenter];
    [v42 addObserver:v10 selector:sel__handleDeviceLockStateChange_ name:@"REDeviceLockStateChangedNotification" object:0];

    if (v73) {
      v43 = (REElementDataSource *)v73;
    }
    else {
      v43 = (REElementDataSource *)objc_opt_new();
    }
    dataSource = v10->_dataSource;
    v10->_dataSource = v43;

    [(REElementDataSource *)v10->_dataSource setDelegate:v10];
    [(REElementDataSource *)v10->_dataSource setUnlockedSinceBoot:REDeviceUnlockedSinceBoot()];
    v45 = [MEMORY[0x263EFF9C0] set];
    v46 = (void *)MEMORY[0x263EFFA08];
    v47 = [(REElementDataSource *)v10->_dataSource supportedSections];
    v48 = [v46 setWithArray:v47];

    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_50;
    v74[3] = &unk_2644BCF50;
    id v49 = v48;
    id v75 = v49;
    id v50 = v45;
    id v76 = v50;
    [v8 enumerateSectionDescriptorsWithOptions:0 includeHistoric:0 usingBlock:v74];
    uint64_t v51 = [v50 copy];
    supportedSections = v10->_supportedSections;
    v10->_supportedSections = (NSSet *)v51;

    v53 = [v8 coordinator];
    v54 = [v53 elementRelevanceEngine];
    uint64_t v55 = [v54 relevanceProviderEnvironment];
    providerEnvironment = v10->_providerEnvironment;
    v10->_providerEnvironment = (RERelevanceProviderEnvironment *)v55;

    v63 = v10->_providerEnvironment;
    if (!v63)
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Provider environment should't be nil", v57, v58, v59, v60, v61, v62, (uint64_t)v70);
      v63 = v10->_providerEnvironment;
    }
    v64 = [[REContentRelevanceProvider alloc] initWithContent:&stru_26CFA57D0];
    v10->_supportsContentRelevance = [(RERelevanceProviderEnvironment *)v63 isSupportedRelevanceProvider:v64];

    uint64_t v65 = [(objc_class *)a4 contentAttributes];
    contentAttributes = v10->_contentAttributes;
    v10->_contentAttributes = (NSArray *)v65;

    if (![(NSArray *)v10->_contentAttributes count]) {
      v10->_supportsContentRelevance = 0;
    }
    v67 = [v8 logger];
    [v67 addLoggable:v10];

    v68 = [v8 logger];
    [v68 addLoggable:v10->_dataSource];

    objc_destroyWeak(&v78);
    objc_destroyWeak(&v81);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (REElementDataSource)dataSource
{
  return self->_dataSource;
}

void __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke()
{
  _initWithRelevanceEngine_dataSourceClass_dataSource__QueuePool = [[REDispatchQueuePool alloc] initWithQueueCount:2 prefix:@"com.apple.RelevanceEngine.DataSourceController"];
  return MEMORY[0x270F9A758]();
}

uint64_t __54__REElementDataSourceController_setAllowsLocationUse___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 145) != v2)
  {
    *(unsigned char *)(v1 + 145) = v2;
    return objc_msgSend(*(id *)(result + 32), "_queue_updateDataSourceLocationUse");
  }
  return result;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__REElementDataSourceController_setState___block_invoke;
    v6[3] = &unk_2644BC828;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(queue, v6);
    self->_state = a3;
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setAllowsLocationUse:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__REElementDataSourceController_setAllowsLocationUse___block_invoke;
  v4[3] = &unk_2644BCFC8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (REElementDataSourceController)initWithRelevanceEngine:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REElementDataSourceController *)self _initWithRelevanceEngine:v7 dataSourceClass:objc_opt_class() dataSource:v6];

  return v8;
}

- (unsigned)_defaultDataSourceQOS
{
  if ([(objc_class *)self->_dataSourceClass drivenByUserInteraction]) {
    return 25;
  }
  else {
    return 17;
  }
}

- (REElementDataSourceController)initWithRelevanceEngine:(id)a3 dataSourceClass:(Class)a4
{
  return (REElementDataSourceController *)[(REElementDataSourceController *)self _initWithRelevanceEngine:a3 dataSourceClass:a4 dataSource:0];
}

void __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_performUpdates");
}

void __85__REElementDataSourceController__initWithRelevanceEngine_dataSourceClass_dataSource___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadWithQOS:qosOffset:forceReload:completion:", *(unsigned int *)(a1 + 40), 0, 0, 0);
}

- (void)dealloc
{
  p_relevanceEngine = &self->_relevanceEngine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  BOOL v5 = [WeakRetained logger];
  [v5 removeLoggable:self->_dataSource];

  dataSource = self->_dataSource;
  self->_dataSource = 0;

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self];

  id v8 = objc_loadWeakRetained((id *)p_relevanceEngine);
  v9 = [v8 logger];
  [v9 removeLoggable:self];

  v10.receiver = self;
  v10.super_class = (Class)REElementDataSourceController;
  [(REElementDataSourceController *)&v10 dealloc];
}

- (void)_handleDeviceLockStateChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__REElementDataSourceController__handleDeviceLockStateChange___block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__REElementDataSourceController__handleDeviceLockStateChange___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v2 = REDeviceUnlockedSinceBoot();
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 176) hasUnlockedSinceBoot];
  if (v2 != result)
  {
    [*(id *)(*(void *)(a1 + 32) + 176) setUnlockedSinceBoot:v2];
    uint64_t result = [(id)objc_opt_class() wantsReloadForFirstDeviceUnlock];
    if (result)
    {
      v4 = RELogForDomain(2);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
        int v8 = 138412290;
        uint64_t v9 = v5;
        _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_DEFAULT, "%@ reloading for device unlock after reboot", (uint8_t *)&v8, 0xCu);
      }

      if ([*(id *)(*(void *)(a1 + 32) + 176) isRunning])
      {
        id v6 = RELogForDomain(2);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
          int v8 = 138412290;
          uint64_t v9 = v7;
          _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_DEFAULT, "%@ reinitializing data source", (uint8_t *)&v8, 0xCu);
        }

        [*(id *)(a1 + 32) pause];
        [*(id *)(a1 + 32) resume];
      }
      return [*(id *)(a1 + 32) invalidateElements];
    }
  }
  return result;
}

- (id)_elementsByRemovingInvalidElements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [MEMORY[0x263F089C8] indexSet];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __68__REElementDataSourceController__elementsByRemovingInvalidElements___block_invoke;
    uint64_t v14 = &unk_2644BCF78;
    v15 = self;
    id v7 = v6;
    id v16 = v7;
    [v5 enumerateObjectsUsingBlock:&v11];
    if (objc_msgSend(v7, "count", v11, v12, v13, v14, v15))
    {
      int v8 = (void *)[v5 mutableCopy];
      [v8 removeObjectsAtIndexes:v7];
      id v9 = (id)[v8 copy];
    }
    else
    {
      id v9 = (id)[v5 copy];
    }
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

uint64_t __68__REElementDataSourceController__elementsByRemovingInvalidElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) _validElement:a2];
  if ((result & 1) == 0)
  {
    id v6 = *(void **)(a1 + 40);
    return [v6 addIndex:a3];
  }
  return result;
}

- (id)_shallowCopiedElements:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
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
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "shallowCopy", (void)v14);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    uint64_t v12 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (void)_namespaceElementIdentifier:(id)a3 section:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [REIdentifier alloc];
  uint64_t v8 = [(REElementDataSourceController *)self bundleIdentifier];
  uint64_t v9 = [v16 identifier];
  uint64_t v10 = [(REIdentifier *)v7 initWithDataSource:v8 section:v6 identifier:v9];

  uint64_t v11 = [v16 bundleIdentifier];

  if (!v11)
  {
    uint64_t v12 = [(REElementDataSourceController *)self bundleIdentifier];
    [v16 setBundleIdentifier:v12];
  }
  v13 = [v16 applicationBundleIdentifier];

  if (!v13)
  {
    long long v14 = [(REElementDataSourceController *)self applicationBundleIdentifier];
    if (v14)
    {
      [v16 setApplicationBundleIdentifier:v14];
    }
    else
    {
      long long v15 = [v16 bundleIdentifier];
      [v16 setApplicationBundleIdentifier:v15];
    }
  }
  [v16 _updateIdentifier:v10];
  [v16 _updateNamespacedIdentifier:v10];
}

- (BOOL)_validElement:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [v4 relevanceProviders];
  v40 = [v5 setWithArray:v6];

  uint64_t v7 = [v40 count];
  uint64_t v8 = [v4 relevanceProviders];
  uint64_t v9 = [v8 count];

  if (v7 != v9)
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Duplicate relevance providers in %@", v10, v11, v12, v13, v14, v15, (uint64_t)v4);
    BOOL v31 = 0;
    goto LABEL_20;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v16 = [v4 relevanceProviders];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v17)
  {
    BOOL v31 = 1;
    goto LABEL_19;
  }
  int v18 = 0;
  uint64_t v19 = *(void *)v42;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v42 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_18;
      }
      dispatch_qos_class_t v22 = [v4 identifier];
      BOOL v23 = v22 == 0;

      if (v23) {
        goto LABEL_18;
      }
      if (![(RERelevanceProviderEnvironment *)self->_providerEnvironment isSupportedRelevanceProvider:v21])
      {
        uint64_t v32 = NSStringFromClass(self->_dataSourceClass);
        RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Relevance Engine (from data source %@) isn't configured to handle the relevance provider: %@", v33, v34, v35, v36, v37, v38, (uint64_t)v32);

LABEL_18:
        BOOL v31 = 0;
        goto LABEL_19;
      }
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass & v18)
      {
        RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Element cannot be added to multiple groups: %@", v25, v26, v27, v28, v29, v30, (uint64_t)v4);
        goto LABEL_18;
      }
      v18 |= isKindOfClass;
    }
    uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
    BOOL v31 = 1;
    if (v17) {
      continue;
    }
    break;
  }
LABEL_19:

LABEL_20:
  return v31;
}

- (BOOL)_supportsContentRelevanceProviderForElement:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_supportsContentRelevance)
  {
    unint64_t contentMode = self->_contentMode;
    if (contentMode == 2)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
      uint64_t v8 = objc_msgSend(v4, "relevanceProviders", 0, 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              BOOL v7 = 0;
              goto LABEL_15;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      BOOL v7 = 1;
LABEL_15:
    }
    else
    {
      BOOL v7 = contentMode == 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_updateRelevanceProvidersForElement:(id)a3
{
  id v4 = a3;
  if (![(REElementDataSourceController *)self _supportsContentRelevanceProviderForElement:v4])goto LABEL_5; {
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  }
  contentAttributes = self->_contentAttributes;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__REElementDataSourceController__updateRelevanceProvidersForElement___block_invoke;
  v14[3] = &unk_2644BCFA0;
  id v7 = v5;
  id v15 = v7;
  REEnumerateContentAttributesOfElement(contentAttributes, v4, v14);
  uint64_t v8 = [[REContentRelevanceProvider alloc] initWithContent:v7];
  id v9 = [(REContentRelevanceProvider *)v8 keywords];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [v4 relevanceProviders];
    uint64_t v12 = [v11 arrayByAddingObject:v8];

    id v9 = (id)[v4 copyElementWithUpdatedRelevanceProviders:v12];
  }

  if (!v10) {
LABEL_5:
  }
    id v9 = v4;

  return v9;
}

uint64_t __69__REElementDataSourceController__updateRelevanceProvidersForElement___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:a2];
  id v3 = *(void **)(a1 + 32);
  return [v3 appendString:@"\n"];
}

- (void)_addElementIdentifier:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Wrong type of identifier being used", v4, v5, v6, v7, v8, v9, v10);
  }
  [(NSMutableSet *)self->_dataSourceElements addObject:v11];
}

- (void)_removeElementIdentifier:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Wrong type of identifier being used", v4, v5, v6, v7, v8, v9, v10);
  }
  [(NSMutableSet *)self->_dataSourceElements removeObject:v11];
}

- (BOOL)_containsElementIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Wrong type of identifier being used", v5, v6, v7, v8, v9, v10, v13);
  }
  char v11 = [(NSMutableSet *)self->_dataSourceElements containsObject:v4];

  return v11;
}

- (id)_allDataSourceElements
{
  return self->_dataSourceElements;
}

- (void)_setSection:(id)a3 forElementWithIdentifier:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Wrong type of identifier being used", v7, v8, v9, v10, v11, v12, v13);
  }
  [(NSMutableDictionary *)self->_dataSourceElementSectionMap setObject:v14 forKeyedSubscript:v6];
}

- (id)_sectionForElementWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Wrong type of identifier being used", v5, v6, v7, v8, v9, v10, v13);
  }
  uint64_t v11 = [(NSMutableDictionary *)self->_dataSourceElementSectionMap objectForKeyedSubscript:v4];

  return v11;
}

- (void)_storeElement:(id)a3
{
  id v12 = a3;
  id v4 = [v12 identifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Wrong type of identifier being used", v5, v6, v7, v8, v9, v10, v11);
  }
  [(NSMutableDictionary *)self->_dataSourceElementIdentifierMap setObject:v12 forKeyedSubscript:v4];
}

- (void)_removeElementForIdentifier:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Wrong type of identifier being used", v4, v5, v6, v7, v8, v9, v10);
  }
  [(NSMutableDictionary *)self->_dataSourceElementIdentifierMap setObject:0 forKeyedSubscript:v11];
}

- (id)_elementForIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Wrong type of identifier being used", v5, v6, v7, v8, v9, v10, v13);
  }
  id v11 = [(NSMutableDictionary *)self->_dataSourceElementIdentifierMap objectForKeyedSubscript:v4];

  return v11;
}

- (id)_dataSourceIdentifierFromIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v3 identifier];
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Wrong type of identifier being used", v4, v5, v6, v7, v8, v9, v13);
    id v10 = v3;
  }
  id v11 = v10;

  return v11;
}

- (BOOL)_isWhitelisted
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  id v3 = [WeakRetained configuration];
  uint64_t v4 = [v3 whitelistedDataSourceClassNames];

  if ([v4 count])
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    char v7 = [v4 containsObject:v6];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)resume
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __39__REElementDataSourceController_resume__block_invoke;
  v2[3] = &unk_2644BC660;
  v2[4] = self;
  [(REElementDataSourceController *)self _performOrEnqueueUpdateBlock:v2];
}

void __39__REElementDataSourceController_resume__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  if ([*(id *)(a1 + 32) _isWhitelisted])
  {
    BOOL v2 = *v1;
    objc_msgSend(v2, "_queue_resume");
  }
  else
  {
    id v3 = RELogForDomain(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __39__REElementDataSourceController_resume__block_invoke_cold_1();
    }
  }
}

- (void)_queue_resume
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E6E6000, v0, v1, "%@ did open data source", v2, v3, v4, v5, v6);
}

- (void)processPendingUpdatesWhilePause:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__REElementDataSourceController_processPendingUpdatesWhilePause___block_invoke;
  v6[3] = &unk_2644BC5E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(REElementDataSourceController *)self _performOrEnqueueUpdateBlock:v6];
}

uint64_t __65__REElementDataSourceController_processPendingUpdatesWhilePause___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processPendingUpdatesWhilePause:", *(void *)(a1 + 40));
}

- (void)_queue_processPendingUpdatesWhilePause:(id)a3
{
  id v4 = (uint64_t (**)(id))a3;
  id v5 = v4;
  sectionsToReloadWhilePaused = self->_sectionsToReloadWhilePaused;
  if (sectionsToReloadWhilePaused)
  {
    uint64_t v8 = v4;
    [(REElementDataSourceController *)self _queue_invalidateSections:sectionsToReloadWhilePaused completion:v4];
    id v7 = self->_sectionsToReloadWhilePaused;
    self->_sectionsToReloadWhilePaused = 0;
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    uint64_t v8 = v4;
    id v4 = (uint64_t (**)(id))v4[2](v4);
  }
  id v5 = v8;
LABEL_6:
  MEMORY[0x270F9A758](v4, v5);
}

- (void)pause
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__REElementDataSourceController_pause__block_invoke;
  v2[3] = &unk_2644BC660;
  v2[4] = self;
  [(REElementDataSourceController *)self _performOrEnqueueUpdateBlock:v2];
}

void __38__REElementDataSourceController_pause__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  if ([*(id *)(a1 + 32) _isWhitelisted])
  {
    uint64_t v2 = *v1;
    objc_msgSend(v2, "_queue_pause");
  }
  else
  {
    uint64_t v3 = RELogForDomain(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __38__REElementDataSourceController_pause__block_invoke_cold_1();
    }
  }
}

- (void)pauseIfNeeded
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__REElementDataSourceController_pauseIfNeeded__block_invoke;
  v2[3] = &unk_2644BC660;
  v2[4] = self;
  [(REElementDataSourceController *)self _performOrEnqueueUpdateBlock:v2];
}

uint64_t __46__REElementDataSourceController_pauseIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isWhitelisted];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_pause");
  }
  return result;
}

- (void)_queue_pause
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E6E6000, v0, v1, "%@ did close data source", v2, v3, v4, v5, v6);
}

void __45__REElementDataSourceController__queue_pause__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = RELogForDomain(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_INFO, "%@ finished purging content because content management is disabled", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_queue_updateDataSourceLocationUse
{
  BOOL allowsLocationUse = self->_allowsLocationUse;
  dataSource = self->_dataSource;
  if (allowsLocationUse)
  {
    uint64_t v5 = [(REElementDataSource *)dataSource isRunning];
    if (v5 == [(REElementDataSource *)self->_dataSource allowsLocationUse]) {
      return;
    }
  }
  else
  {
    if (![(REElementDataSource *)dataSource allowsLocationUse]) {
      return;
    }
    uint64_t v5 = 0;
  }
  uint64_t v6 = self->_dataSource;
  [(REElementDataSource *)v6 setAllowsLocationUse:v5];
}

- (void)prepareToUnload
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__REElementDataSourceController_prepareToUnload__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __48__REElementDataSourceController_prepareToUnload__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = 1;
  [*(id *)(*(void *)(a1 + 32) + 64) performImmediately];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  return [v2 performImmediately];
}

- (BOOL)hasLoadedData
{
  return self->_hasDataAvailable;
}

- (void)invalidateAndReloadWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = [(id)objc_opt_class() wantsAutomaticFetching];
  char v6 = v5;
  if (v5) {
    [(REElementDataSource *)self->_dataSource beginFetchingData];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__REElementDataSourceController_invalidateAndReloadWithCompletion___block_invoke;
  block[3] = &unk_2644BD018;
  block[4] = self;
  id v11 = v4;
  char v12 = v6;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, block);
  dispatch_async(queue, v9);
}

void __67__REElementDataSourceController_invalidateAndReloadWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__REElementDataSourceController_invalidateAndReloadWithCompletion___block_invoke_2;
  v4[3] = &unk_2644BCFF0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 48);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(v2, "_queue_reloadWithQOS:qosOffset:forceReload:completion:", 25, 0xFFFFFFFFLL, 1, v4);
}

uint64_t __67__REElementDataSourceController_invalidateAndReloadWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 176);
    return [v3 finishFetchingData];
  }
  return result;
}

- (void)invalidateElementsInSections:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__REElementDataSourceController_invalidateElementsInSections_completion___block_invoke;
  block[3] = &unk_2644BC570;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __73__REElementDataSourceController_invalidateElementsInSections_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 176) isRunning];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateSections:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
    id v4 = RELogForDomain(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      int v15 = 138543618;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_INFO, "%{public}@ Asked to invalidate elements in section %@.", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    id v7 = *(void **)(v3 + 80);
    id v8 = *(void **)(a1 + 40);
    if (v7)
    {
      uint64_t v9 = [v7 arrayByAddingObjectsFromArray:v8];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 80);
      *(void *)(v10 + 80) = v9;
    }
    else
    {
      id v12 = v8;
      id v11 = *(void **)(v3 + 80);
      *(void *)(v3 + 80) = v12;
    }

    uint64_t v13 = *(void *)(a1 + 48);
    if (v13)
    {
      id v14 = *(void (**)(void))(v13 + 16);
      v14();
    }
  }
}

- (id)elementOperationQueue
{
  return self->_queue;
}

- (void)invalidateElements
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__REElementDataSourceController_invalidateElements__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

void __51__REElementDataSourceController_invalidateElements__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 176) isRunning];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(v3 + 64) schedule];
    id v4 = RELogForDomain(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_INFO, "%{public}@ Asked to invalidate elements.", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(v3 + 72) = 1;
  }
}

- (void)invalidateElementsInSection:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  int v6 = [v4 arrayWithObjects:&v7 count:1];

  -[REElementDataSourceController invalidateElementsInSections:completion:](self, "invalidateElementsInSections:completion:", v6, 0, v7, v8);
}

- (void)addElements:(id)a3 toSectionWithIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(NSSet *)self->_supportedSections containsObject:v7])
  {
    uint64_t v9 = RELogForDomain(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[REElementDataSourceController addElements:toSectionWithIdentifier:]((uint64_t)v7, v9);
    }
    goto LABEL_14;
  }
  uint64_t v8 = [(REElementDataSourceController *)self _elementsByRemovingInvalidElements:v6];

  if (v8 && [v8 count])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = [(REElementDataSourceController *)self _updateRelevanceProvidersForElement:*(void *)(*((void *)&v24 + 1) + 8 * v14)];
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    id v16 = [v9 copy];
    __int16 v17 = [(REElementDataSourceController *)self _shallowCopiedElements:v16];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __69__REElementDataSourceController_addElements_toSectionWithIdentifier___block_invoke;
    v19[3] = &unk_2644BD040;
    id v20 = v17;
    uint64_t v21 = self;
    id v22 = v7;
    id v6 = v10;
    id v23 = v6;
    id v18 = v17;
    [(REElementDataSourceController *)self _performOrEnqueueUpdateBlock:v19];

LABEL_14:
    uint64_t v8 = v6;
  }
}

void __69__REElementDataSourceController_addElements_toSectionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v10 = [v9 identifier];
        if ([*(id *)(a1 + 40) _containsElementIdentifier:v10])
        {
          [v2 addObject:v10];
        }
        else
        {
          [v3 addObject:v9];
          [*(id *)(a1 + 40) _addElementIdentifier:v10];
          [*(id *)(a1 + 40) _setSection:*(void *)(a1 + 48) forElementWithIdentifier:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v6);
  }

  if ([v2 count])
  {
    uint64_t v11 = RELogForDomain(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __69__REElementDataSourceController_addElements_toSectionWithIdentifier___block_invoke_cold_1(v2);
    }
  }
  if ([v3 count])
  {
    uint64_t v28 = v3;
    uint64_t v29 = v2;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 40), "_storeElement:", v17, v28, v29);
          [*(id *)(a1 + 40) _namespaceElementIdentifier:v17 section:*(void *)(a1 + 48)];
          id v18 = RELogForDomain(2);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
            id v22 = [v17 identifier];
            uint64_t v23 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138413058;
            uint64_t v39 = v21;
            __int16 v40 = 2112;
            long long v41 = v22;
            __int16 v42 = 2112;
            uint64_t v43 = v23;
            __int16 v44 = 2112;
            v45 = v17;
            _os_log_debug_impl(&dword_21E6E6000, v18, OS_LOG_TYPE_DEBUG, "%@ added element %@ in section %@\n%@", buf, 0x2Au);
          }
          uint64_t v19 = *(void **)(a1 + 40);
          id v20 = +[REElementDataSourceUpdate insertElement:v17 inSection:*(void *)(a1 + 48)];
          objc_msgSend(v19, "_queue_scheduleUpdate:", v20);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v46 count:16];
      }
      while (v14);
    }

    uint64_t v3 = v28;
    int v2 = v29;
  }
  long long v24 = RELogForDomain(2);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v26 = REElementsLoggableString(*(void **)(a1 + 56));
    uint64_t v27 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v39 = v25;
    __int16 v40 = 2112;
    long long v41 = v26;
    __int16 v42 = 2112;
    uint64_t v43 = v27;
    _os_log_impl(&dword_21E6E6000, v24, OS_LOG_TYPE_DEFAULT, "%@ adding elements %@ to section %@", buf, 0x20u);
  }
}

- (void)reloadElement:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = RELogForDomain(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[REElementDataSourceController reloadElement:](v7);
    }
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = v4;
  if ([(REElementDataSourceController *)self _validElement:v4])
  {
    uint64_t v6 = [(REElementDataSourceController *)self _updateRelevanceProvidersForElement:v5];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__REElementDataSourceController_reloadElement___block_invoke;
    v8[3] = &unk_2644BC688;
    uint64_t v5 = v6;
    uint64_t v9 = v5;
    id v10 = self;
    [(REElementDataSourceController *)self _performOrEnqueueUpdateBlock:v8];
    uint64_t v7 = v9;
LABEL_7:
  }
}

void __47__REElementDataSourceController_reloadElement___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [*(id *)(a1 + 40) _sectionForElementWithIdentifier:v2];
  if ([*(id *)(a1 + 40) _containsElementIdentifier:v2])
  {
    id v4 = [*(id *)(a1 + 40) _elementForIdentifier:v2];
    uint64_t v5 = [v4 relevanceProviders];
    uint64_t v6 = [*(id *)(a1 + 32) relevanceProviders];
    int v7 = [v5 isEqualToArray:v6];

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7)
    {
      uint64_t v9 = [v4 relevanceProviders];
      id v10 = (void *)[v8 copyElementWithUpdatedRelevanceProviders:v9];

      [*(id *)(a1 + 40) _storeElement:v10];
      [*(id *)(a1 + 40) _namespaceElementIdentifier:v10 section:v3];
      uint64_t v11 = *(void **)(a1 + 40);
      +[REElementDataSourceUpdate reloadElement:v10 inSection:v3];
    }
    else
    {
      id v10 = (void *)[*(id *)(a1 + 32) shallowCopy];
      [*(id *)(a1 + 40) _storeElement:v10];
      [*(id *)(a1 + 40) _namespaceElementIdentifier:v10 section:v3];
      id v12 = *(void **)(a1 + 40);
      uint64_t v13 = +[REElementDataSourceUpdate removeElement:v4 inSection:v3];
      objc_msgSend(v12, "_queue_scheduleUpdate:", v13);

      uint64_t v11 = *(void **)(a1 + 40);
      +[REElementDataSourceUpdate insertElement:v10 inSection:v3];
    uint64_t v14 = };
    objc_msgSend(v11, "_queue_scheduleUpdate:", v14);

    uint64_t v15 = RELogForDomain(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      int v20 = 138413058;
      uint64_t v21 = v19;
      __int16 v22 = 2112;
      uint64_t v23 = v2;
      __int16 v24 = 2112;
      uint64_t v25 = v3;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      _os_log_debug_impl(&dword_21E6E6000, v15, OS_LOG_TYPE_DEBUG, "%@ updated element %@ in section %@\n%@", (uint8_t *)&v20, 0x2Au);
    }
  }
  else
  {
    id v4 = RELogForDomain(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__REElementDataSourceController_reloadElement___block_invoke_cold_1();
    }
  }

  id v16 = RELogForDomain(2);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    int v20 = 138412546;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    uint64_t v23 = v2;
    _os_log_impl(&dword_21E6E6000, v16, OS_LOG_TYPE_DEFAULT, "%@ updating element %@\n", (uint8_t *)&v20, 0x16u);
  }
}

- (void)refreshElement:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v7 = RELogForDomain(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[REElementDataSourceController refreshElement:](v7);
    }
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = v4;
  if ([(REElementDataSourceController *)self _validElement:v4])
  {
    uint64_t v6 = [(REElementDataSourceController *)self _updateRelevanceProvidersForElement:v5];

    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __48__REElementDataSourceController_refreshElement___block_invoke;
    uint64_t v11 = &unk_2644BC688;
    uint64_t v5 = v6;
    id v12 = v5;
    uint64_t v13 = self;
    [(REElementDataSourceController *)self _performOrEnqueueUpdateBlock:&v8];
    [(REUpNextScheduler *)self->_reloadScheduler performImmediately];
    int v7 = v12;
LABEL_7:
  }
}

void __48__REElementDataSourceController_refreshElement___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [*(id *)(a1 + 40) _sectionForElementWithIdentifier:v2];
  if ([*(id *)(a1 + 40) _containsElementIdentifier:v2])
  {
    id v4 = [*(id *)(a1 + 40) _elementForIdentifier:v2];
    uint64_t v5 = [v4 relevanceProviders];
    uint64_t v6 = [*(id *)(a1 + 32) relevanceProviders];
    int v7 = [v5 isEqualToArray:v6];

    if (!v7)
    {
      id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], @"Don't refresh with new relevance providers, did you mean to use reloadElement?", 0 reason userInfo];
      objc_exception_throw(v18);
    }
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v4 relevanceProviders];
    id v10 = (void *)[v8 copyElementWithUpdatedRelevanceProviders:v9];

    [*(id *)(a1 + 40) _storeElement:v10];
    [*(id *)(a1 + 40) _namespaceElementIdentifier:v10 section:v3];
    uint64_t v11 = *(void **)(a1 + 40);
    id v12 = +[REElementDataSourceUpdate refreshElement:v10 inSection:v3];
    objc_msgSend(v11, "_queue_scheduleUpdate:", v12);

    [*(id *)(*(void *)(a1 + 40) + 56) performImmediately];
    uint64_t v13 = RELogForDomain(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      int v19 = 138413058;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      __int16 v22 = v2;
      __int16 v23 = 2112;
      __int16 v24 = v3;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      _os_log_debug_impl(&dword_21E6E6000, v13, OS_LOG_TYPE_DEBUG, "%@ refreshed element %@ in section %@\n%@", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    id v4 = RELogForDomain(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__REElementDataSourceController_refreshElement___block_invoke_cold_1();
    }
  }

  uint64_t v14 = RELogForDomain(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    int v19 = 138412546;
    uint64_t v20 = v15;
    __int16 v21 = 2112;
    __int16 v22 = v2;
    _os_log_impl(&dword_21E6E6000, v14, OS_LOG_TYPE_DEFAULT, "%@ refreshing element %@", (uint8_t *)&v19, 0x16u);
  }
}

- (void)removeElementsWithIds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__REElementDataSourceController_removeElementsWithIds___block_invoke;
    v6[3] = &unk_2644BC688;
    id v7 = v5;
    uint64_t v8 = self;
    [(REElementDataSourceController *)self _performOrEnqueueUpdateBlock:v6];
  }
}

void __55__REElementDataSourceController_removeElementsWithIds___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) _allDataSourceElements];
  char v4 = [v2 isSubsetOfSet:v3];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = (void *)[v2 mutableCopy];
    uint64_t v6 = [*(id *)(a1 + 40) _allDataSourceElements];
    [v5 minusSet:v6];

    id v7 = (void *)[v2 mutableCopy];
    [v7 minusSet:v5];
    uint64_t v8 = RELogForDomain(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __55__REElementDataSourceController_removeElementsWithIds___block_invoke_cold_1(v5);
    }

    int v2 = v7;
  }
  if ([v2 count])
  {
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    __int16 v44 = v2;
    id v10 = v2;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          uint64_t v16 = [*(id *)(a1 + 40) _elementForIdentifier:v15];
          if (v16)
          {
            [v9 addObject:v16];
            uint64_t v17 = RELogForDomain(2);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
              *(_DWORD *)buf = 138412802;
              uint64_t v66 = v18;
              __int16 v67 = 2112;
              v68 = v15;
              __int16 v69 = 2112;
              v70 = v16;
              _os_log_debug_impl(&dword_21E6E6000, v17, OS_LOG_TYPE_DEBUG, "%@ removed element %@\n%@", buf, 0x20u);
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v71 count:16];
      }
      while (v12);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v55 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(a1 + 40) _removeElementIdentifier:*(void *)(*((void *)&v54 + 1) + 8 * j)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v21);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = v9;
    uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v51 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v50 + 1) + 8 * k);
          uint64_t v29 = *(void **)(a1 + 40);
          long long v30 = [v28 identifier];
          long long v31 = [v29 _dataSourceIdentifierFromIdentifier:v30];

          long long v32 = [*(id *)(a1 + 40) _sectionForElementWithIdentifier:v31];
          long long v33 = *(void **)(a1 + 40);
          long long v34 = +[REElementDataSourceUpdate removeElement:v28 inSection:v32];
          objc_msgSend(v33, "_queue_scheduleUpdate:", v34);
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v25);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v35 = v19;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v46 objects:v62 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v47;
      do
      {
        for (uint64_t m = 0; m != v37; ++m)
        {
          if (*(void *)v47 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v46 + 1) + 8 * m);
          [*(id *)(a1 + 40) _removeElementForIdentifier:v40];
          [*(id *)(a1 + 40) _setSection:0 forElementWithIdentifier:v40];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v46 objects:v62 count:16];
      }
      while (v37);
    }

    int v2 = v44;
  }
  long long v41 = RELogForDomain(2);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v43 = REElementsIdsLoggableString(*(void **)(a1 + 32));
    *(_DWORD *)buf = 138412546;
    uint64_t v66 = v42;
    __int16 v67 = 2112;
    v68 = v43;
    _os_log_impl(&dword_21E6E6000, v41, OS_LOG_TYPE_DEFAULT, "%@ removing elements %@", buf, 0x16u);
  }
}

- (void)_performOrEnqueueUpdateBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__REElementDataSourceController__performOrEnqueueUpdateBlock___block_invoke;
  v7[3] = &unk_2644BC5E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__REElementDataSourceController__performOrEnqueueUpdateBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 144))
  {
    if (*(unsigned char *)(v1 + 104))
    {
      int v2 = *(void **)(v1 + 112);
      id v4 = (id)MEMORY[0x223C31700](*(void *)(a1 + 40));
      [v2 addObject:v4];
    }
    else
    {
      uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v3();
    }
  }
}

- (void)_queue_reloadWithQOS:(unsigned int)a3 qosOffset:(int)a4 forceReload:(BOOL)a5 completion:(id)a6
{
}

- (void)_queue_reloadWithQOS:(unsigned int)a3 qosOffset:(int)a4 forceReload:(BOOL)a5 sections:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __96__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_sections_completion___block_invoke;
  v14[3] = &unk_2644BD068;
  void v14[4] = self;
  id v15 = v12;
  id v13 = v12;
  [(REElementDataSourceController *)self _queue_reloadWithQOS:v10 qosOffset:v9 forceReload:v8 operations:v14 completion:a7];
}

uint64_t __96__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_sections_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performContentInvalidateWithElement:expectation:sections:", a2, a3, *(void *)(a1 + 40));
}

- (void)_queue_invalidateSections:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(REElementDataSourceController *)self _defaultDataSourceQOS];
  uint64_t v9 = [MEMORY[0x263EFF9C0] setWithArray:v7];

  [v9 intersectSet:self->_supportedSections];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__REElementDataSourceController__queue_invalidateSections_completion___block_invoke;
  v11[3] = &unk_2644BC5E8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(REElementDataSourceController *)self _queue_reloadWithQOS:v8 qosOffset:0 forceReload:0 sections:v9 completion:v11];
}

void __70__REElementDataSourceController__queue_invalidateSections_completion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 56) performImmediately];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    if (v2)
    {
      id v4 = (void (*)(uint64_t))v3[2];
      uint64_t v5 = *(void *)(a1 + 40);
      v4(v5);
    }
    else
    {
      id v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      dispatch_async(v6, v3);
    }
  }
}

- (void)_queue_purgeContentWithCompletion:(id)a3
{
  id v4 = a3;
  [(REElementDataSourceController *)self _queue_reloadWithQOS:[(REElementDataSourceController *)self _defaultDataSourceQOS] qosOffset:0 forceReload:0 operations:&__block_literal_global_90 completion:v4];
}

- (void)_queue_reloadWithQOS:(unsigned int)a3 qosOffset:(int)a4 forceReload:(BOOL)a5 operations:(id)a6 completion:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = (void (**)(id, void *, REExpectation *))a6;
  id v13 = (void (**)(void))a7;
  uint64_t v14 = v13;
  if (self->_willUnload)
  {
    if (v13) {
      v13[2](v13);
    }
  }
  else if ([(REElementDataSource *)self->_dataSource isRunning])
  {
    if (self->_isPerformingReload)
    {
      id v15 = RELogForDomain(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        loggingHeader = self->_loggingHeader;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = loggingHeader;
        _os_log_impl(&dword_21E6E6000, v15, OS_LOG_TYPE_DEFAULT, "%@ Already performing a reload. Postponing the reload", (uint8_t *)&buf, 0xCu);
      }

      objc_initWeak((id *)&buf, self->_reloadScheduler);
      enqueuedBlocks = self->_enqueuedBlocks;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke;
      v38[3] = &unk_2644BC638;
      objc_copyWeak(&v39, (id *)&buf);
      uint64_t v18 = (void *)MEMORY[0x223C31700](v38);
      [(NSMutableArray *)enqueuedBlocks addObject:v18];

      if (v14) {
        v14[2](v14);
      }
      objc_destroyWeak(&v39);
      objc_destroyWeak((id *)&buf);
    }
    else
    {
      int v21 = [(id)objc_opt_class() wantsAutomaticFetching];
      char v22 = v21;
      self->_isPerformingReload = 1;
      if (v21) {
        [(REElementDataSource *)self->_dataSource beginFetchingData];
      }
      __int16 v23 = RELogForDomain(2);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = self->_loggingHeader;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_impl(&dword_21E6E6000, v23, OS_LOG_TYPE_DEFAULT, "%@ request elements", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v25 = objc_alloc_init(REExpectation);
      uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
      if (v12) {
        v12[2](v12, v26, v25);
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v41 = 0x2020000000;
      BOOL v42 = a5;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_92;
      v31[3] = &unk_2644BD128;
      v31[4] = self;
      id v27 = v26;
      char v37 = v22;
      id v32 = v27;
      p_long long buf = &buf;
      unsigned int v35 = a3;
      int v36 = a4;
      long long v33 = v14;
      uint64_t v28 = (void (**)(void))MEMORY[0x223C31700](v31);
      if ([(REExpectation *)v25 outstandingOperations])
      {
        queue = self->_queue;
        dispatch_block_t v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, a4, v28);
        [(REExpectation *)v25 notifyOperationsCompleteOnQueue:queue block:v30];
      }
      else
      {
        *(unsigned char *)(*((void *)&buf + 1) + 24) = 1;
        v28[2](v28);
      }

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    id v19 = RELogForDomain(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = self->_loggingHeader;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_21E6E6000, v19, OS_LOG_TYPE_DEFAULT, "%@ Trying to reload while paused. Postponing the reload", (uint8_t *)&buf, 0xCu);
    }

    self->_wantsReloadWhilePaused = 1;
    if (v14) {
      v14[2](v14);
    }
  }
}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained schedule];
}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_92(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v79 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  int v2 = *(id **)(v1 + 32);
  uint64_t v3 = [v2[2] allObjects];
  id v4 = [v2 _groupElements:v3 bySections:*(void *)(*(void *)(v1 + 32) + 24)];

  [*(id *)(*(void *)(v1 + 32) + 16) removeAllObjects];
  [*(id *)(*(void *)(v1 + 32) + 24) removeAllObjects];
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_2;
  v70[3] = &unk_2644BD0B0;
  uint64_t v5 = *(void **)(v1 + 40);
  v70[4] = *(void *)(v1 + 32);
  [v5 enumerateKeysAndObjectsUsingBlock:v70];
  id v6 = *(id **)(v1 + 32);
  id v7 = [v6[2] allObjects];
  uint64_t v8 = [v6 _groupElements:v7 bySections:*(void *)(*(void *)(v1 + 32) + 24)];

  if ([v8 count] || objc_msgSend(v4, "count"))
  {
    long long v48 = v8;
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_94;
    v67[3] = &unk_2644BD0D8;
    id v10 = v9;
    uint64_t v11 = *(void *)(v1 + 32);
    id v47 = v10;
    id v68 = v10;
    uint64_t v69 = v11;
    long long v49 = v4;
    [v4 enumerateKeysAndObjectsUsingBlock:v67];
    id v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(v1 + 32) + 32), "count"));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v13 = [*(id *)(v1 + 32) allElements];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v78 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          id v19 = [v18 identifier];
          [v12 addObject:v19];

          uint64_t v20 = RELogForDomain(2);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v21 = v1;
            uint64_t v22 = *(void *)(*(void *)(v1 + 32) + 8);
            __int16 v23 = [v18 identifier];
            *(_DWORD *)long long buf = 138412802;
            uint64_t v73 = v22;
            uint64_t v1 = v21;
            __int16 v74 = 2112;
            id v75 = v23;
            __int16 v76 = 2112;
            v77 = v18;
            _os_log_debug_impl(&dword_21E6E6000, v20, OS_LOG_TYPE_DEBUG, "%@ removed element %@\n%@", buf, 0x20u);
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v63 objects:v78 count:16];
      }
      while (v15);
    }

    uint64_t v24 = RELogForDomain(2);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(*(void *)(v1 + 32) + 8);
      uint64_t v26 = REElementsIdsLoggableString(v12);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v73 = v25;
      __int16 v74 = 2112;
      id v75 = v26;
      _os_log_impl(&dword_21E6E6000, v24, OS_LOG_TYPE_DEFAULT, "%@ removing elements due to reload %@", buf, 0x16u);
    }
    [*(id *)(*(void *)(v1 + 32) + 32) removeAllObjects];
    id v27 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 40), "count"));
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_96;
    v61[3] = &unk_2644BD100;
    uint64_t v28 = *(void **)(v1 + 40);
    v61[4] = *(void *)(v1 + 32);
    id v29 = v27;
    id v62 = v29;
    [v28 enumerateKeysAndObjectsUsingBlock:v61];
    dispatch_block_t v30 = RELogForDomain(2);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(*(void *)(v1 + 32) + 8);
      id v32 = REElementsIdsLoggableString(v29);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v73 = v31;
      __int16 v74 = 2112;
      id v75 = v32;
      _os_log_impl(&dword_21E6E6000, v30, OS_LOG_TYPE_DEFAULT, "%@ inserting elements due to reload %@", buf, 0x16u);
    }
    long long v33 = [MEMORY[0x263EFF9A0] dictionary];
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_97;
    v58[3] = &unk_2644BD0D8;
    uint64_t v34 = *(void *)(v1 + 32);
    id v59 = v33;
    uint64_t v60 = v34;
    id v35 = v33;
    uint64_t v8 = v48;
    [v48 enumerateKeysAndObjectsUsingBlock:v58];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_2_98;
    v57[3] = &unk_2644BD0B0;
    v57[4] = *(void *)(v1 + 32);
    [v47 enumerateKeysAndObjectsUsingBlock:v57];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_3;
    v56[3] = &unk_2644BD0B0;
    v56[4] = *(void *)(v1 + 32);
    [v35 enumerateKeysAndObjectsUsingBlock:v56];

    id v4 = v49;
  }
  if (*(unsigned char *)(v1 + 72)) {
    [*(id *)(*(void *)(v1 + 32) + 176) finishFetchingData];
  }
  *(unsigned char *)(*(void *)(v1 + 32) + 104) = 0;
  int v36 = (void *)[*(id *)(*(void *)(v1 + 32) + 112) copy];
  [*(id *)(*(void *)(v1 + 32) + 112) removeAllObjects];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v37 = v36;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v52 objects:v71 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(v37);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v52 + 1) + 8 * j) + 16))();
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v52 objects:v71 count:16];
    }
    while (v39);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24)
    && ([*(id *)(*(void *)(v1 + 32) + 56) performImmediately] & 1) == 0)
  {
    uint64_t v43 = *(NSObject **)(*(void *)(v1 + 32) + 40);
    dispatch_qos_class_t v44 = *(_DWORD *)(v1 + 64);
    int v45 = *(_DWORD *)(v1 + 68);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_4;
    block[3] = &unk_2644BCBC0;
    id v51 = *(id *)(v1 + 48);
    dispatch_block_t v46 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v44, v45, block);
    dispatch_async(v43, v46);
  }
  else
  {
    uint64_t v42 = *(void *)(v1 + 48);
    if (v42) {
      (*(void (**)(void))(v42 + 16))();
    }
  }
}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
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
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 identifier];
        [*(id *)(a1 + 32) _addElementIdentifier:v12];
        [*(id *)(a1 + 32) _setSection:v5 forElementWithIdentifier:v12];
        [v11 finalizeContent];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v8);
  }
  id v13 = RELogForDomain(2);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = REElementsLoggableString(v6);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    __int16 v23 = v15;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_21E6E6000, v13, OS_LOG_TYPE_DEFAULT, "%@ received elements %@ for section %@", buf, 0x20u);
  }
}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_94(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  objc_msgSend(v5, "_queue_elementsForIds:", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v7 = 138413058;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_storeElement:", v11, v17);
        id v12 = *(void **)(a1 + 40);
        id v13 = [v11 identifier];
        [v12 addObject:v13];

        [*(id *)(a1 + 32) _namespaceElementIdentifier:v11 section:v5];
        uint64_t v14 = RELogForDomain(2);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
          long long v16 = [v11 identifier];
          *(_DWORD *)long long buf = v17;
          uint64_t v24 = v15;
          __int16 v25 = 2112;
          uint64_t v26 = v16;
          __int16 v27 = 2112;
          uint64_t v28 = v11;
          __int16 v29 = 2112;
          id v30 = v5;
          _os_log_impl(&dword_21E6E6000, v14, OS_LOG_TYPE_DEFAULT, "%@ added element %@ to section %@\n%@", buf, 0x2Au);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v8);
  }
}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_97(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  objc_msgSend(v5, "_queue_elementsForIds:", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_2_98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(a1 + 32);
        id v12 = +[REElementDataSourceUpdate removeElement:*(void *)(*((void *)&v13 + 1) + 8 * v10) inSection:v5];
        objc_msgSend(v11, "_queue_scheduleUpdate:", v12);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(a1 + 32);
        id v12 = +[REElementDataSourceUpdate insertElement:*(void *)(*((void *)&v13 + 1) + 8 * v10) inSection:v5];
        objc_msgSend(v11, "_queue_scheduleUpdate:", v12);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

uint64_t __98__REElementDataSourceController__queue_reloadWithQOS_qosOffset_forceReload_operations_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_queue_performContentInvalidateWithElement:(id)a3 expectation:(id)a4 sections:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v8 = a4;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2810000000;
  v43[3] = &unk_21E7FF34A;
  int v44 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = a5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v25 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * v10);
        [v8 beginOperation];
        id v12 = [REBlockSentinel alloc];
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke;
        v37[3] = &unk_2644BC688;
        v37[4] = self;
        id v13 = v8;
        id v38 = v13;
        long long v14 = [(REBlockSentinel *)v12 initWithFailureBlock:v37];
        long long v15 = NSStringFromClass(self->_dataSourceClass);
        __int16 v27 = v13;
        long long v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:300.0];
        queue = self->_queue;
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_2;
        v35[3] = &unk_2644BD150;
        id v18 = v15;
        id v36 = v18;
        long long v19 = +[REUpNextTimer timerWithFireDate:v16 queue:queue block:v35];

        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_3;
        v28[3] = &unk_2644BD1A0;
        v28[4] = self;
        uint64_t v34 = v43;
        id v29 = v26;
        uint64_t v30 = v11;
        long long v20 = v14;
        uint64_t v31 = v20;
        id v21 = v19;
        id v32 = v21;
        id v33 = v27;
        long long v22 = (void *)MEMORY[0x223C31700](v28);
        __int16 v23 = [(REElementDataSourceController *)self dataSource];
        [v23 getElementsInSection:v11 withHandler:v22];

        ++v10;
      }
      while (v9 != v10);
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(v43, 8);
}

uint64_t __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke(uint64_t a1)
{
  int v2 = (void *)*MEMORY[0x263EFF488];
  uint64_t v3 = NSStringFromSelector(sel_getElementsInSection_withHandler_);
  RERaiseInternalException(v2, @"%@ handler of data source %@ was never called", v4, v5, v6, v7, v8, v9, (uint64_t)v3);

  uint64_t v10 = *(void **)(a1 + 40);
  return [v10 endOperation];
}

void __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 isValid])
  {
    int v2 = (void *)*MEMORY[0x263EFF488];
    NSStringFromSelector(sel_getElementsInSection_withHandler_);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    RERaiseInternalException(v2, @"%@ handler of data source %@ timed out", v3, v4, v5, v6, v7, v8, (uint64_t)v9);
  }
}

void __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_4;
  v9[3] = &unk_2644BD178;
  uint64_t v17 = *(void *)(a1 + 80);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void **)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = *(id *)(a1 + 64);
  id v15 = v3;
  id v16 = *(id *)(a1 + 72);
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __97__REElementDataSourceController__queue_performContentInvalidateWithElement_expectation_sections___block_invoke_4(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
  int v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2)
  {
    id v3 = (void *)*MEMORY[0x263F08428];
    NSStringFromSelector(sel_getElementsInSection_withHandler_);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    RERaiseInternalException(v3, @"%@ handler of data source %@ cannot be called multiple times", v4, v5, v6, v7, v8, v9, (uint64_t)v24);
  }
  else
  {
    [*(id *)(a1 + 56) complete];
    [*(id *)(a1 + 64) invalidate];
    uint64_t v10 = [*(id *)(a1 + 48) _elementsByRemovingInvalidElements:*(void *)(a1 + 72)];
    uint64_t v11 = (void *)v10;
    uint64_t v12 = (void *)MEMORY[0x263EFFA68];
    if (v10) {
      uint64_t v12 = (void *)v10;
    }
    id v13 = v12;

    id v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = [*(id *)(a1 + 48) _updateRelevanceProvidersForElement:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    id v21 = *(void **)(a1 + 48);
    long long v22 = (void *)[v14 copy];
    __int16 v23 = [v21 _shallowCopiedElements:v22];

    [*(id *)(a1 + 32) setObject:v23 forKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(a1 + 80) endOperation];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
  }
}

- (id)_groupElements:(id)a3 bySections:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    uint64_t v12 = (void *)*MEMORY[0x263EFF498];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v21 = [v6 objectForKeyedSubscript:v14];
        if (v21)
        {
          long long v22 = [v7 objectForKeyedSubscript:v21];

          if (!v22)
          {
            __int16 v23 = [MEMORY[0x263EFF980] array];
            [v7 setObject:v23 forKeyedSubscript:v21];
          }
          id v24 = [v7 objectForKeyedSubscript:v21];
          [v24 addObject:v14];
        }
        else
        {
          RERaiseInternalException(v12, @"Cannot find section for element %@.\n%@", v15, v16, v17, v18, v19, v20, v14);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  long long v25 = (void *)[v7 copy];
  return v25;
}

- (void)_queue_scheduleUpdate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_updates addObject:v4];
  [(REUpNextScheduler *)self->_updateScheduler schedule];
  id v5 = RELogForDomain(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(REElementDataSourceController *)(uint64_t)self _queue_scheduleUpdate:v5];
  }
}

- (void)_queue_performUpdates
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!self->_willUnload)
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = self->_updates;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
          uint64_t v10 = [v9 section];
          uint64_t v11 = [v3 objectForKeyedSubscript:v10];

          if (!v11)
          {
            uint64_t v12 = [MEMORY[0x263EFF980] array];
            [v3 setObject:v12 forKeyedSubscript:v10];
          }
          id v13 = [v3 objectForKeyedSubscript:v10];
          [v13 addObject:v9];
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }

    [(NSMutableArray *)self->_updates removeAllObjects];
    [(REElementDataSource *)self->_dataSource beginFetchingData];
    uint64_t v14 = [(REElementDataSourceController *)self delegate];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__REElementDataSourceController__queue_performUpdates__block_invoke;
    v16[3] = &unk_2644BC688;
    id v17 = v3;
    uint64_t v18 = self;
    id v15 = v3;
    [v14 elementDataSourceController:self performBatchUpdates:v16];
  }
}

uint64_t __54__REElementDataSourceController__queue_performUpdates__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__REElementDataSourceController__queue_performUpdates__block_invoke_2;
  v4[3] = &unk_2644BD1C8;
  v4[4] = *(void *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  return [*(id *)(*(void *)(a1 + 40) + 176) finishFetchingData];
}

uint64_t __54__REElementDataSourceController__queue_performUpdates__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processUpdates:forSection:", a3, a2);
}

- (void)_queue_processUpdates:(id)a3 forSection:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v31 = a4;
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  id v36 = [MEMORY[0x263EFF9A0] dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v9 = (void *)v7;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    uint64_t v34 = v8;
    id v35 = v6;
    id v33 = v10;
LABEL_3:
    uint64_t v14 = 0;
    while (2)
    {
      if (*(void *)v43 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v42 + 1) + 8 * v14);
      switch([v15 type])
      {
        case 0:
          id v16 = [v15 element];
          id v17 = [v16 identifier];
          uint64_t v18 = [v6 objectForKeyedSubscript:v17];

          long long v19 = v6;
          if (!v18)
          {
            long long v20 = [v36 objectForKeyedSubscript:v17];

            long long v19 = v8;
            if (v20)
            {
              [v36 removeObjectForKey:v17];
              long long v19 = v8;
            }
          }
          goto LABEL_19;
        case 1:
          id v16 = [v15 element];
          id v17 = [v16 identifier];
          [v8 removeObjectForKey:v17];
          [v36 removeObjectForKey:v17];
          long long v29 = [v6 objectForKeyedSubscript:v17];

          if (v29)
          {
            [v6 removeObjectForKey:v17];
            goto LABEL_20;
          }
          long long v19 = v9;
          goto LABEL_19;
        case 2:
          id v16 = [v15 element];
          id v17 = [v16 identifier];
          long long v21 = [v9 objectForKeyedSubscript:v17];

          if (v21)
          {
            id v16 = v16;
            long long v22 = v9;
            __int16 v23 = [v9 objectForKeyedSubscript:v17];
            uint64_t v24 = [v23 relevanceProviders];
            long long v25 = [v16 relevanceProviders];
            int v26 = [v24 isEqualToArray:v25];

            long long v27 = v16;
            if (v26)
            {
              long long v28 = [v23 relevanceProviders];
              long long v27 = (void *)[v16 copyElementWithUpdatedRelevanceProviders:v28];
            }
            uint64_t v9 = v22;
            [v22 removeObjectForKey:v17];
            id v8 = v34;
            [v34 setObject:v27 forKeyedSubscript:v17];

            uint64_t v6 = v35;
            id v10 = v33;
          }
          else
          {
            long long v19 = v6;
LABEL_19:
            [v19 setObject:v16 forKeyedSubscript:v17];
          }
LABEL_20:

LABEL_21:
          if (v12 != ++v14) {
            continue;
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (!v12) {
            goto LABEL_23;
          }
          goto LABEL_3;
        case 4:
          id v16 = [v15 element];
          id v17 = [v16 identifier];
          long long v19 = v36;
          goto LABEL_19;
        default:
          goto LABEL_21;
      }
    }
  }
LABEL_23:

  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke;
  v41[3] = &unk_2644BD1F0;
  v41[4] = self;
  [v9 enumerateKeysAndObjectsUsingBlock:v41];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_2;
  v39[3] = &unk_2644BD218;
  v39[4] = self;
  id v40 = v31;
  id v30 = v31;
  [v6 enumerateKeysAndObjectsUsingBlock:v39];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_3;
  v38[3] = &unk_2644BD1F0;
  void v38[4] = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v38];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_4;
  v37[3] = &unk_2644BD1F0;
  v37[4] = self;
  [v36 enumerateKeysAndObjectsUsingBlock:v37];
}

void __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 delegate];
  [v6 elementDataSourceController:*(void *)(a1 + 32) didRemoveElement:v5];
}

void __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 delegate];
  [v6 elementDataSourceController:*(void *)(a1 + 32) didAddElement:v5 toSection:*(void *)(a1 + 40)];
}

void __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 delegate];
  [v6 elementDataSourceController:*(void *)(a1 + 32) didReloadElement:v5];
}

void __66__REElementDataSourceController__queue_processUpdates_forSection___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 delegate];
  [v6 elementDataSourceController:*(void *)(a1 + 32) didRefreshElement:v5];
}

void __42__REElementDataSourceController_setState___block_invoke(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  if (([*(id *)(a1 + 32) _isWhitelisted] & 1) == 0 && !*(void *)(a1 + 40)) {
    objc_msgSend(*v2, "_queue_resume");
  }
  [*(id *)(*(void *)(a1 + 32) + 176) setState:*(void *)(a1 + 40)];
  id v3 = RELogForDomain(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __42__REElementDataSourceController_setState___block_invoke_cold_1();
  }
}

- (void)elementWillBecomeVisible:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__REElementDataSourceController_elementWillBecomeVisible___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__REElementDataSourceController_elementWillBecomeVisible___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 _dataSourceIdentifierFromIdentifier:v3];

  [*(id *)(*(void *)(a1 + 32) + 176) elementWithIdentifierWillBecomeVisible:v4];
  id v5 = RELogForDomain(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "%@ will become visible: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)elementDidBecomeHidden:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__REElementDataSourceController_elementDidBecomeHidden___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__REElementDataSourceController_elementDidBecomeHidden___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  int v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 _dataSourceIdentifierFromIdentifier:v3];

  [*(id *)(*(void *)v1 + 176) elementWithIdentifierDidBecomeHidden:v4];
  id v5 = RELogForDomain(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __56__REElementDataSourceController_elementDidBecomeHidden___block_invoke_cold_1();
  }
}

- (BOOL)hasElementWithId:(id)a3 inSection:(unint64_t)a4
{
  return 0;
}

- (BOOL)hasElementWithId:(id)a3 inSectionWithIdentifier:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v9 = [(REElementDataSourceController *)self _sectionForElementWithIdentifier:v8];

  LOBYTE(v8) = [v9 isEqualToString:v7];
  return (char)v8;
}

- (void)fetchElementWithIdentifierVisible:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__REElementDataSourceController_fetchElementWithIdentifierVisible_withHandler___block_invoke;
    block[3] = &unk_2644BC570;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __79__REElementDataSourceController_fetchElementWithIdentifierVisible_withHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _elementForIdentifier:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  id v4 = [WeakRetained configuration];
  id v5 = [v4 observerQueue];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__REElementDataSourceController_fetchElementWithIdentifierVisible_withHandler___block_invoke_2;
  block[3] = &unk_2644BC570;
  void block[4] = *(void *)(a1 + 32);
  id v11 = v2;
  id v12 = *(id *)(a1 + 48);
  id v9 = v2;
  dispatch_async(v7, block);
}

uint64_t __79__REElementDataSourceController_fetchElementWithIdentifierVisible_withHandler___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  [WeakRetained elementDataSourceController:a1[4] isElementVisible:a1[5]];

  id v3 = *(uint64_t (**)(void))(a1[6] + 16);
  return v3();
}

- (id)_queue_elementsForIds:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
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
        id v11 = -[REElementDataSourceController _elementForIdentifier:](self, "_elementForIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];
  return v12;
}

- (NSArray)allElements
{
  int v2 = [(NSMutableDictionary *)self->_dataSourceElementIdentifierMap allValues];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(objc_class *)self->_dataSourceClass bundleIdentifier];
}

- (NSString)applicationBundleIdentifier
{
  return (NSString *)[(objc_class *)self->_dataSourceClass applicationBundleIdentifier];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, self->_dataSourceClass];
}

- (Class)dataSourceClass
{
  return self->_dataSourceClass;
}

- (unint64_t)state
{
  return self->_state;
}

- (REElementDataSourceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (REElementDataSourceControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceClass, 0);
  objc_storeStrong((id *)&self->_contentAttributes, 0);
  objc_destroyWeak((id *)&self->_relevanceEngine);
  objc_storeStrong((id *)&self->_providerEnvironment, 0);
  objc_storeStrong((id *)&self->_supportedSections, 0);
  objc_storeStrong((id *)&self->_enqueuedBlocks, 0);
  objc_storeStrong((id *)&self->_sectionsToReloadWhilePaused, 0);
  objc_storeStrong((id *)&self->_reloadScheduler, 0);
  objc_storeStrong((id *)&self->_updateScheduler, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataSourceElementIdentifierMap, 0);
  objc_storeStrong((id *)&self->_dataSourceElementSectionMap, 0);
  objc_storeStrong((id *)&self->_dataSourceElements, 0);
  objc_storeStrong((id *)&self->_loggingHeader, 0);
}

- (NSString)name
{
  int v2 = NSStringFromClass(self->_dataSourceClass);
  id v3 = [v2 stringByAppendingString:@"Controller"];

  return (NSString *)v3;
}

- (NSArray)supportedSections
{
  return [(NSSet *)self->_supportedSections allObjects];
}

- (BOOL)allowsLocationUse
{
  return self->_allowsLocationUse;
}

- (BOOL)hasDataAvailable
{
  return self->_hasDataAvailable;
}

- (unint64_t)updateCount
{
  return [(NSMutableArray *)self->_updates count];
}

- (NSArray)allProvidedElements
{
  int v2 = [(NSMutableDictionary *)self->_dataSourceElementIdentifierMap allValues];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

void __39__REElementDataSourceController_resume__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E6E6000, v0, v1, "%@ SKIPPING open data source", v2, v3, v4, v5, v6);
}

void __38__REElementDataSourceController_pause__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E6E6000, v0, v1, "%@ SKIPPING close data source", v2, v3, v4, v5, v6);
}

- (void)addElements:(uint64_t)a1 toSectionWithIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Trying to add element to unsupported section %@", (uint8_t *)&v2, 0xCu);
}

void __69__REElementDataSourceController_addElements_toSectionWithIdentifier___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = REElementsIdsLoggableString(a1);
  OUTLINED_FUNCTION_5(&dword_21E6E6000, v2, v3, "Trying to add already existing elements with ids %@", v4, v5, v6, v7, 2u);
}

- (void)reloadElement:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Trying to reload nil element", v1, 2u);
}

void __47__REElementDataSourceController_reloadElement___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21E6E6000, v0, v1, "Trying to update nonexistant element with id %@ in section %@");
}

- (void)refreshElement:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Trying to refresh nil element", v1, 2u);
}

void __48__REElementDataSourceController_refreshElement___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21E6E6000, v0, v1, "Trying to refresh nonexistant element with id %@ in section %@");
}

void __55__REElementDataSourceController_removeElementsWithIds___block_invoke_cold_1(void *a1)
{
  os_log_t v1 = [a1 allObjects];
  uint64_t v2 = REElementsIdsLoggableString(v1);
  OUTLINED_FUNCTION_5(&dword_21E6E6000, v3, v4, "Trying to remove nonexistant elements with ids %@", v5, v6, v7, v8, 2u);
}

- (void)_queue_scheduleUpdate:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = REStringForUpdateType([a2 type]);
  uint64_t v7 = [a2 element];
  uint64_t v8 = [a2 section];
  int v9 = 138413058;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  __int16 v13 = 2112;
  long long v14 = v7;
  __int16 v15 = 2048;
  long long v16 = v8;
  _os_log_debug_impl(&dword_21E6E6000, a3, OS_LOG_TYPE_DEBUG, "%@ scheduled update %@ of element %@ in section %lu", (uint8_t *)&v9, 0x2Au);
}

void __42__REElementDataSourceController_setState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_21E6E6000, v0, v1, "%@ setting state: %ld");
}

void __56__REElementDataSourceController_elementDidBecomeHidden___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_21E6E6000, v0, v1, "%@ did become hidden: %@");
}

@end