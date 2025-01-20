@interface REElementRelevanceEngine
- (BOOL)_elementIsFullyLoaded:(id)a3;
- (BOOL)modelManager:(id)a3 loadDataStoreFromURL:(id)a4 error:(id *)a5;
- (BOOL)modelManager:(id)a3 saveDataStoreToURL:(id)a4 error:(id *)a5;
- (NSArray)sections;
- (NSDictionary)sectionsMap;
- (REElementRelevanceEngine)initWithRelevanceEngine:(id)a3;
- (REElementRelevanceEngineDelegate)delegate;
- (REPredictorManager)predictorManager;
- (RERelevanceProviderEnvironment)providerEnvironment;
- (id)_allCurrentElements;
- (id)_elementIdentifierForIdentifier:(id)a3;
- (id)_generateFeatureMapForElement:(id)a3;
- (id)_identifierForElementIdentifier:(id)a3;
- (id)_queue_featureMapForElement:(id)a3 trainingContext:(id)a4;
- (id)_queue_featureMapForElementWithId:(id)a3 trainingContext:(id)a4;
- (id)dataStoreKey;
- (id)elementAtPath:(id)a3;
- (id)elementRankerForSection:(id)a3;
- (id)featureMapForElement:(id)a3 trainingContext:(id)a4;
- (id)featureMapForPredictedElement:(id)a3 trainingContext:(id)a4;
- (id)featureProviderForElement:(id)a3;
- (id)pathForElement:(id)a3;
- (id)predictionForElement:(id)a3;
- (id)relevanceProviderEnvironment;
- (id)section:(id)a3 groupForIdentifier:(id)a4;
- (id)sectionForElement:(id)a3;
- (unint64_t)numberOfElementsInSection:(id)a3;
- (void)_checkPreferences;
- (void)_enumerateAndGenerateSectionComparators:(id)a3;
- (void)_onqueue_async:(id)a3;
- (void)_performUpdatesToDelegate:(id)a3;
- (void)_queue_scheduleRelevanceUpdateForElement:(id)a3;
- (void)_queue_unregisterProvidersForElement:(id)a3;
- (void)_queue_updateElementRelevance;
- (void)_updateStateBasedOnPredictor;
- (void)addElement:(id)a3 section:(id)a4;
- (void)dealloc;
- (void)featureTransformerDidInvalidate:(id)a3;
- (void)modelManagerDidUpdateModel:(id)a3;
- (void)pause;
- (void)predictor:(id)a3 didBeginActivity:(id)a4;
- (void)predictor:(id)a3 didFinishActivity:(id)a4;
- (void)predictorDidUpdate:(id)a3;
- (void)refreshContent;
- (void)relevanceEnvironment:(id)a3 didUpdateRelevanceProvider:(id)a4;
- (void)reloadElement:(id)a3 withElement:(id)a4;
- (void)removeElement:(id)a3;
- (void)resume;
- (void)sectionDidUpdateContentOrder:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation REElementRelevanceEngine

void __68__REElementRelevanceEngine__enumerateAndGenerateSectionComparators___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 rules];
  id v6 = [v3 comparatorWithRules:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v9 = [[RESection alloc] initWithSectionDescriptor:v6 comparator:v5];

  [(RESection *)v9 setDelegate:*(void *)(a1 + 32)];
  v7 = *(void **)(*(void *)(a1 + 32) + 48);
  v8 = [v6 name];

  [v7 setObject:v9 forKeyedSubscript:v8];
}

- (void)_enumerateAndGenerateSectionComparators:(id)a3
{
  id v4 = a3;
  id v5 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  id v6 = [v5 modelManager];

  if (v6)
  {
    v7 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __68__REElementRelevanceEngine__enumerateAndGenerateSectionComparators___block_invoke;
    v8[3] = &unk_2644BE130;
    id v9 = v6;
    id v10 = v4;
    [v7 enumerateSectionDescriptorsWithOptions:0 includeHistoric:1 usingBlock:v8];
  }
}

- (REElementRelevanceEngine)initWithRelevanceEngine:(id)a3
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  v99.receiver = self;
  v99.super_class = (Class)REElementRelevanceEngine;
  id v71 = a3;
  v3 = -[RERelevanceEngineSubsystem initWithRelevanceEngine:](&v99, sel_initWithRelevanceEngine_);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(RERelevanceEngineSubsystem *)v3 queue];
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v7 = [v71 configuration];
    int v8 = [v7 wantsImmutableContent];

    objc_initWeak(&location, v4);
    id v9 = v4->_queue;
    if (v8) {
      double v10 = 0.0;
    }
    else {
      double v10 = 0.05;
    }
    v96[0] = MEMORY[0x263EF8330];
    v96[1] = 3221225472;
    v96[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke;
    v96[3] = &unk_2644BC638;
    objc_copyWeak(&v97, &location);
    uint64_t v11 = +[REUpNextScheduler schedulerWithQueue:v9 delay:v96 updateBlock:v10];
    scheduler = v4->_scheduler;
    v4->_scheduler = (REUpNextScheduler *)v11;

    v13 = v4->_queue;
    if (v8) {
      double v14 = 0.0;
    }
    else {
      double v14 = 0.5;
    }
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_2;
    v94[3] = &unk_2644BC638;
    objc_copyWeak(&v95, &location);
    uint64_t v15 = +[REUpNextScheduler schedulerWithQueue:v13 delay:v94 updateBlock:v14];
    predictorUpdatedScheduler = v4->_predictorUpdatedScheduler;
    v4->_predictorUpdatedScheduler = (REUpNextScheduler *)v15;

    v17 = [v71 configuration];
    v4->_ignoreDeviceLockState = [v17 ignoreDeviceLockState];

    uint64_t v18 = [MEMORY[0x263EFF9C0] set];
    elementsNeedingRelevanceUpdate = v4->_elementsNeedingRelevanceUpdate;
    v4->_elementsNeedingRelevanceUpdate = (NSMutableSet *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    sections = v4->_sections;
    v4->_sections = (NSMutableDictionary *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    predictedElements = v4->_predictedElements;
    v4->_predictedElements = (NSMutableDictionary *)v22;

    uint64_t v24 = [MEMORY[0x263F08968] mapTableWithKeyOptions:512 valueOptions:0];
    relevanceProviderElementMap = v4->_relevanceProviderElementMap;
    v4->_relevanceProviderElementMap = (NSMapTable *)v24;

    v26 = objc_alloc_init(REKeyMultiValueMap);
    identifierElementIdentifierMap = v4->_identifierElementIdentifierMap;
    v4->_identifierElementIdentifierMap = v26;

    uint64_t v28 = objc_opt_new();
    reloadingElementIdentifiers = v4->_reloadingElementIdentifiers;
    v4->_reloadingElementIdentifiers = (NSMutableSet *)v28;

    uint64_t v30 = objc_opt_new();
    reloadingCachedFeatureMap = v4->_reloadingCachedFeatureMap;
    v4->_reloadingCachedFeatureMap = (NSMutableDictionary *)v30;

    v32 = [[RERelevanceProviderEnvironment alloc] initWithRelevanceEngine:v71];
    providerEnvironment = v4->_providerEnvironment;
    v4->_providerEnvironment = v32;

    [(RERelevanceProviderEnvironment *)v4->_providerEnvironment setDelegate:v4];
    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_3;
    v92[3] = &unk_2644BF308;
    v93 = v4;
    v70 = v93;
    [(REElementRelevanceEngine *)v93 _enumerateAndGenerateSectionComparators:v92];
    v34 = [v71 rootFeatures];
    uint64_t v35 = +[REPredictor systemPredictorsSupportingFeatureSet:v34 relevanceEngine:v71];
    uint64_t v68 = 104;
    predictorManager = v70->_predictorManager;
    v70->_predictorManager = (REPredictorManager *)v35;

    v37 = v70->_predictorManager;
    v90[0] = MEMORY[0x263EF8330];
    v90[1] = 3221225472;
    v90[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_4;
    v90[3] = &unk_2644BF330;
    v38 = v70;
    v91 = v38;
    [(REPredictorManager *)v37 enumeratePredictors:v90];
    uint64_t v39 = [v71 featureTransmuter];
    featureTransmuter = v38->_featureTransmuter;
    v38->_featureTransmuter = (REFeatureTransmuter *)v39;

    if (!v38->_featureTransmuter) {
      RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Feature transmuter should not be nil!", v41, v42, v43, v44, v45, v46, 104);
    }
    v47 = +[REFeatureSet featureSet];
    v48 = +[REFeatureSet featureSet];
    uint64_t v84 = 0;
    v85 = (id *)&v84;
    uint64_t v86 = 0x3042000000;
    v87 = __Block_byref_object_copy__18;
    v88 = __Block_byref_object_dispose__18;
    id v89 = 0;
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_12;
    v80[3] = &unk_2644BF358;
    id v49 = v47;
    id v81 = v49;
    id v50 = v48;
    id v82 = v50;
    v83 = &v84;
    v51 = (void (**)(void, void))MEMORY[0x223C31700](v80);
    objc_storeWeak(v85 + 5, v51);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v52 = [(REFeatureTransmuter *)v38->_featureTransmuter outputFeatures];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v76 objects:v101 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v77 != v54) {
            objc_enumerationMutation(v52);
          }
          v51[2](v51, *(void *)(*((void *)&v76 + 1) + 8 * i));
        }
        uint64_t v53 = [v52 countByEnumeratingWithState:&v76 objects:v101 count:16];
      }
      while (v53);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v56 = v49;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v72 objects:v100 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v73 != v58) {
            objc_enumerationMutation(v56);
          }
          v60 = [*(id *)(*((void *)&v72 + 1) + 8 * j) transformer];
          [v60 setInvalidationDelegate:v38];
        }
        uint64_t v57 = [v56 countByEnumeratingWithState:&v72 objects:v100 count:16];
      }
      while (v57);
    }

    uint64_t v61 = [v50 copy];
    persistenceFeatures = v38->_persistenceFeatures;
    v38->_persistenceFeatures = (REFeatureSet *)v61;

    v38->_deviceIsLocked = 0;
    [(REElementRelevanceEngine *)v38 _checkPreferences];
    v63 = [MEMORY[0x263F08A00] defaultCenter];
    [v63 addObserver:v38 selector:sel__checkPreferences name:@"RERelevanceEnginePreferencesDidUpdate" object:0];

    v64 = [(RERelevanceEngineSubsystem *)v38 relevanceEngine];
    v65 = [v64 modelManager];
    [v65 addObserver:v38];

    [*(id *)((char *)&v70->super.super.isa + v69) addObserver:v38];
    v66 = [v71 modelManager];
    [v66 addDataStore:v38];

    _Block_object_dispose(&v84, 8);
    objc_destroyWeak(&v89);

    objc_destroyWeak(&v95);
    objc_destroyWeak(&v97);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 transformer];
    int v5 = [(id)objc_opt_class() supportsInvalidation];

    if (v5) {
      [*(id *)(a1 + 32) addFeature:v3];
    }
    id v6 = [v3 transformer];
    int v7 = [(id)objc_opt_class() supportsPersistence];

    if (v7) {
      [*(id *)(a1 + 40) addFeature:v3];
    }
  }
  WeakRetained = (void (**)(id, void))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 40));
  if (WeakRetained)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = objc_msgSend(v3, "_dependentFeatures", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          WeakRetained[2](WeakRetained, *(void *)(*((void *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_checkPreferences
{
  id v3 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  id v4 = [v3 effectivePreferences];

  -[RERelevanceProviderEnvironment setAllowsLocationUse:](self->_providerEnvironment, "setAllowsLocationUse:", [v4 mode] & 1);
}

- (BOOL)modelManager:(id)a3 loadDataStoreFromURL:(id)a4 error:(id *)a5
{
  uint64_t v19 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_persistenceFeatures;
  uint64_t v7 = [(REFeatureSet *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "name", v19);
        uint64_t v13 = [v6 URLByAppendingPathComponent:v12];

        long long v14 = [MEMORY[0x263F08850] defaultManager];
        long long v15 = [v13 path];
        int v16 = [v14 fileExistsAtPath:v15];

        if (v16)
        {
          long long v17 = [v11 transformer];
          [v17 readFromURL:v13 error:v19];
        }
      }
      uint64_t v8 = [(REFeatureSet *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return 1;
}

- (id)relevanceProviderEnvironment
{
  return self->_providerEnvironment;
}

- (void)setDelegate:(id)a3
{
}

- (id)dataStoreKey
{
  return @"Persistence Features";
}

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updateElementRelevance");
}

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateStateBasedOnPredictor];
}

void __52__REElementRelevanceEngine_initWithRelevanceEngine___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 outstandingActivities];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        uint64_t v10 = [v4 countForObject:v9];
        if (v10)
        {
          uint64_t v11 = v10;
          do
          {
            [*(id *)(a1 + 32) beginActivity:v9 forObject:v3];
            --v11;
          }
          while (v11);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)dealloc
{
  [(REElementRelevanceEngine *)self pause];
  [(REPredictorManager *)self->_predictorManager removeObserver:self];
  id v3 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  id v4 = [v3 modelManager];
  [v4 removeObserver:self];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"RERelevanceEnginePreferencesDidUpdate" object:0];

  uint64_t v6 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  uint64_t v7 = [v6 modelManager];
  [v7 addDataStore:self];

  v8.receiver = self;
  v8.super_class = (Class)REElementRelevanceEngine;
  [(RERelevanceEngineSubsystem *)&v8 dealloc];
}

- (NSArray)sections
{
  return (NSArray *)[(NSMutableDictionary *)self->_sections allKeys];
}

- (unint64_t)numberOfElementsInSection:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_sections objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 visibleCount];

  return v4;
}

- (id)elementAtPath:(id)a3
{
  sections = self->_sections;
  id v4 = a3;
  uint64_t v5 = [v4 sectionName];
  uint64_t v6 = [(NSMutableDictionary *)sections objectForKeyedSubscript:v5];

  uint64_t v7 = [v4 element];
  objc_super v8 = [v6 elementIdAtIndex:v7];

  return v8;
}

- (BOOL)modelManager:(id)a3 saveDataStoreToURL:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->_persistenceFeatures;
  uint64_t v8 = [(REFeatureSet *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v13 = [v12 name];
        long long v14 = [v7 URLByAppendingPathComponent:v13];

        long long v15 = [MEMORY[0x263F08850] defaultManager];
        int v16 = [v14 path];
        [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:a5];

        uint64_t v17 = [v12 transformer];
        [v17 writeToURL:v14 error:a5];
      }
      uint64_t v9 = [(REFeatureSet *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return 1;
}

- (void)modelManagerDidUpdateModel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__REElementRelevanceEngine_modelManagerDidUpdateModel___block_invoke;
  v3[3] = &unk_2644BC660;
  v3[4] = self;
  [(REElementRelevanceEngine *)self _onqueue_async:v3];
}

uint64_t __55__REElementRelevanceEngine_modelManagerDidUpdateModel___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__REElementRelevanceEngine_modelManagerDidUpdateModel___block_invoke_2;
  v3[3] = &unk_2644BF308;
  v3[4] = v1;
  return [v1 _enumerateAndGenerateSectionComparators:v3];
}

void __55__REElementRelevanceEngine_modelManagerDidUpdateModel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v5 = a3;
  uint64_t v6 = [a2 name];
  id v7 = [v4 objectForKeyedSubscript:v6];

  [v7 setComparator:v5];
}

- (void)addElement:(id)a3 section:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v21 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v22 = v6;
  uint64_t v25 = +[REPredictionElement predictionElementFromElement:v6];
  [v25 setSection:v21];
  predictedElements = self->_predictedElements;
  uint64_t v8 = [v22 identifier];
  [(NSMutableDictionary *)predictedElements setObject:v25 forKeyedSubscript:v8];

  id v9 = [v22 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v11 = v9;
  if (isKindOfClass)
  {
    uint64_t v12 = [v9 identifier];

    id v11 = (id)v12;
  }
  long long v20 = v11;
  [(REKeyMultiValueMap *)self->_identifierElementIdentifierMap insertValue:v9 forKey:v9];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [v25 relevanceProviders];
  uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    id v14 = 0;
    uint64_t v24 = *(void *)v30;
    do
    {
      uint64_t v15 = 0;
      int v16 = v14;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
        [(NSMapTable *)self->_relevanceProviderElementMap setObject:v25 forKey:v17];
        objc_initWeak(&location, self);
        [(RERelevanceEngineSubsystem *)self beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:v17];
        providerEnvironment = self->_providerEnvironment;
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __47__REElementRelevanceEngine_addElement_section___block_invoke;
        v26[3] = &unk_2644BCE38;
        objc_copyWeak(&v27, &location);
        v26[4] = v17;
        [(RERelevanceProviderEnvironment *)providerEnvironment addRelevanceProvider:v17 completion:v26];
        if (v16) {
          [(RERelevanceProviderEnvironment *)self->_providerEnvironment relateRelevanceProvider:v16 toRelevanceProvider:v17];
        }
        id v14 = v17;

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
        ++v15;
        int v16 = v14;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }
  else
  {

    id v14 = [v22 identifier];
    [(REElementRelevanceEngine *)self _queue_scheduleRelevanceUpdateForElement:v14];
  }
}

void __47__REElementRelevanceEngine_addElement_section___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)reloadElement:(id)a3 withElement:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  reloadingElementIdentifiers = self->_reloadingElementIdentifiers;
  uint64_t v10 = [v8 identifier];
  [(NSMutableSet *)reloadingElementIdentifiers addObject:v10];

  id v11 = [v8 identifier];
  id v13 = [(REElementRelevanceEngine *)self sectionForElement:v11];

  uint64_t v12 = [v8 identifier];

  [(REElementRelevanceEngine *)self _queue_unregisterProvidersForElement:v12];
  [(REElementRelevanceEngine *)self addElement:v7 section:v13];
}

- (void)_queue_unregisterProvidersForElement:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [(NSMutableDictionary *)self->_predictedElements objectForKeyedSubscript:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(v4, "relevanceProviders", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [(RERelevanceProviderEnvironment *)self->_providerEnvironment removeRelevanceProvider:v10 completion:0];
        [(NSMapTable *)self->_relevanceProviderElementMap removeObjectForKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)removeElement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSMutableDictionary *)self->_predictedElements objectForKeyedSubscript:v4];
  [(REElementRelevanceEngine *)self _queue_unregisterProvidersForElement:v4];
  uint64_t v6 = [v5 section];
  uint64_t v7 = [(NSMutableDictionary *)self->_sections objectForKeyedSubscript:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__REElementRelevanceEngine_removeElement___block_invoke;
  v11[3] = &unk_2644BD040;
  id v12 = v7;
  id v13 = v4;
  id v14 = v6;
  uint64_t v15 = self;
  id v8 = v6;
  id v9 = v4;
  id v10 = v7;
  [(REElementRelevanceEngine *)self _performUpdatesToDelegate:v11];
}

void __42__REElementRelevanceEngine_removeElement___block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 40);
  if ([*(id *)(a1 + 32) containsElementWithId:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) removeElementWithId:*(void *)(a1 + 40)];
  }
  else
  {
    id v3 = RELogForDomain(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __42__REElementRelevanceEngine_removeElement___block_invoke_cold_1(v2, a1, v3);
    }
  }
  id v4 = (id)*v2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 identifier];

    id v4 = (id)v5;
  }
  [*(id *)(*(void *)(a1 + 56) + 88) removeValue:*(void *)(a1 + 40) forKey:v4];
  [*(id *)(*(void *)(a1 + 56) + 56) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 56) + 40) removeObject:*(void *)(a1 + 40)];
}

- (id)pathForElement:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [(NSMutableDictionary *)self->_predictedElements objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 section];
  id v8 = [(NSMutableDictionary *)self->_sections objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 indexOfElementWithId:v5];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = +[RESectionPath sectionPathWithSectionName:v7 element:v9];
  }

  return v10;
}

- (id)sectionForElement:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [(NSMutableDictionary *)self->_predictedElements objectForKeyedSubscript:v5];

  uint64_t v7 = [v6 section];

  return v7;
}

- (void)resume
{
}

- (void)pause
{
}

- (void)_updateStateBasedOnPredictor
{
  id v3 = RELogForDomain(8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEFAULT, "Update engine state based on scheduled predictor update.", buf, 2u);
  }

  [(REElementRelevanceEngine *)self modelManagerDidUpdateModel:0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__REElementRelevanceEngine__updateStateBasedOnPredictor__block_invoke;
  v4[3] = &unk_2644BC660;
  v4[4] = self;
  [(REElementRelevanceEngine *)self _onqueue_async:v4];
}

void __56__REElementRelevanceEngine__updateStateBasedOnPredictor__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
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
        objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleRelevanceUpdateForElement:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)predictor:(id)a3 didBeginActivity:(id)a4
{
}

- (void)predictor:(id)a3 didFinishActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(RERelevanceEngineSubsystem *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__REElementRelevanceEngine_predictor_didFinishActivity___block_invoke;
  block[3] = &unk_2644BDBF0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __56__REElementRelevanceEngine_predictor_didFinishActivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endActivity:*(void *)(a1 + 40) forObject:*(void *)(a1 + 48)];
}

- (void)predictorDidUpdate:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RELogForDomain(8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "Predictor did update: %@", (uint8_t *)&v6, 0xCu);
  }

  [(REUpNextScheduler *)self->_predictorUpdatedScheduler schedule];
}

- (void)featureTransformerDidInvalidate:(id)a3
{
}

- (void)relevanceEnvironment:(id)a3 didUpdateRelevanceProvider:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v8 = [(NSMapTable *)self->_relevanceProviderElementMap objectForKey:v6];

  id v7 = [v8 identifier];
  if (v7 && [(REElementRelevanceEngine *)self _elementIsFullyLoaded:v8]) {
    [(REElementRelevanceEngine *)self _queue_scheduleRelevanceUpdateForElement:v7];
  }
}

- (BOOL)_elementIsFullyLoaded:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(a3, "relevanceProviders", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![(RERelevanceProviderEnvironment *)self->_providerEnvironment isRelevanceProviderLoaded:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (void)_queue_scheduleRelevanceUpdateForElement:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_elementsNeedingRelevanceUpdate, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->_elementsNeedingRelevanceUpdate addObject:v4];
    [(RERelevanceEngineSubsystem *)self beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
    [(REUpNextScheduler *)self->_scheduler schedule];
  }
  if (RETrainingSimulationIsCurrentlyActive()) {
    [(REUpNextScheduler *)self->_scheduler performImmediately];
  }
}

- (void)_queue_updateElementRelevance
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  v80 = [MEMORY[0x263EFF9C0] set];
  long long v79 = [MEMORY[0x263EFF9A0] dictionary];
  long long v78 = [MEMORY[0x263EFF9A0] dictionary];
  long long v77 = [MEMORY[0x263EFF9A0] dictionary];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  obuint64_t j = self->_elementsNeedingRelevanceUpdate;
  uint64_t v83 = [(NSMutableSet *)obj countByEnumeratingWithState:&v114 objects:v129 count:16];
  if (v83)
  {
    uint64_t v3 = &OBJC_IVAR___REFeatureTransmuter__featureValuesCacheLock;
    id v4 = &OBJC_IVAR___REFeatureTransmuter__featureValuesCacheLock;
    uint64_t v82 = *(void *)v115;
    uint64_t v5 = &OBJC_IVAR___REFeatureTransmuter__featureValuesCacheLock;
    do
    {
      for (uint64_t i = 0; i != v83; uint64_t i = v48 + 1)
      {
        if (*(void *)v115 != v82) {
          objc_enumerationMutation(obj);
        }
        uint64_t v84 = i;
        uint64_t v7 = *(void *)(*((void *)&v114 + 1) + 8 * i);
        id v8 = [*(id *)((char *)&self->super.super.isa + v3[251]) objectForKeyedSubscript:v7];
        int v9 = *((unsigned __int8 *)&self->super.super.isa + v4[260]);
        uint64_t v10 = [v8 privacyBehavior];
        uint64_t v11 = [v8 privacyBehavior];
        uint64_t v12 = [v8 privacyBehavior];
        BOOL v13 = v11 == 1;
        if (!v9) {
          BOOL v13 = v10 == 2;
        }
        BOOL v15 = !self->_ignoreDeviceLockState && v12 != 0 && v13;
        uint64_t v85 = v7;
        int v16 = [(NSMutableSet *)self->_reloadingElementIdentifiers containsObject:v7];
        v87 = v8;
        if ([(REElementRelevanceEngine *)self _elementIsFullyLoaded:v8])
        {
          if (v16)
          {
            [(NSMutableSet *)self->_reloadingElementIdentifiers removeObject:v7];
            uint64_t v17 = RELogForDomain(3);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v66 = [v8 relevanceProviders];
              *(_DWORD *)buf = 138412546;
              uint64_t v120 = v7;
              __int16 v121 = 2112;
              v122 = v66;
              _os_log_debug_impl(&dword_21E6E6000, v17, OS_LOG_TYPE_DEBUG, "updateElementRelevance: finished reloading %@ %@", buf, 0x16u);
            }
          }
          BOOL v81 = v15;
          uint64_t v18 = [MEMORY[0x263EFF980] array];
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          uint64_t v19 = [v87 relevanceProviders];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v110 objects:v128 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v111;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v111 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void *)(*((void *)&v110 + 1) + 8 * j);
                if ([*(id *)((char *)&self->super.super.isa + v5[256]) isRelevanceProviderHistoric:v24])-[NSObject addObject:](v18, "addObject:", v24); {
              }
                }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v110 objects:v128 count:16];
            }
            while (v21);
          }

          if ([v18 count])
          {
            uint64_t v25 = [MEMORY[0x263F08760] set];
            long long v106 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            uint64_t v26 = [v87 relevanceProviders];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v106 objects:v127 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v107;
              do
              {
                for (uint64_t k = 0; k != v28; ++k)
                {
                  if (*(void *)v107 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  [v25 addObject:objc_opt_class()];
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v106 objects:v127 count:16];
              }
              while (v28);
            }

            long long v31 = [MEMORY[0x263F08760] set];
            long long v102 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            long long v32 = v18;
            uint64_t v33 = [v32 countByEnumeratingWithState:&v102 objects:v126 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v103;
              do
              {
                for (uint64_t m = 0; m != v34; ++m)
                {
                  if (*(void *)v103 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  [v31 addObject:objc_opt_class()];
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v102 objects:v126 count:16];
              }
              while (v34);
            }

            long long v100 = 0u;
            long long v101 = 0u;
            long long v98 = 0u;
            long long v99 = 0u;
            id v37 = v31;
            uint64_t v38 = [v37 countByEnumeratingWithState:&v98 objects:v125 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              char v40 = 0;
              uint64_t v41 = *(void *)v99;
              do
              {
                for (uint64_t n = 0; n != v39; ++n)
                {
                  if (*(void *)v99 != v41) {
                    objc_enumerationMutation(v37);
                  }
                  uint64_t v43 = *(void *)(*((void *)&v98 + 1) + 8 * n);
                  uint64_t v44 = [v37 countForObject:v43];
                  if (v44 == [v25 countForObject:v43]) {
                    char v40 = 1;
                  }
                }
                uint64_t v39 = [v37 countByEnumeratingWithState:&v98 objects:v125 count:16];
              }
              while (v39);
            }
            else
            {
              char v40 = 0;
            }

            char v49 = v40 & 1;
          }
          else
          {
            char v49 = 0;
          }
          id v50 = [(REElementRelevanceEngine *)self _queue_featureMapForElementWithId:v85 trainingContext:0];
          [(NSMutableDictionary *)self->_reloadingCachedFeatureMap setObject:v50 forKeyedSubscript:v85];
          v51 = [v87 section];
          v52 = [(NSMutableDictionary *)self->_sections objectForKeyedSubscript:v51];
          uint64_t v53 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
          uint64_t v54 = v52;
          v55 = [v52 name];
          int v56 = [v53 isSectionWithNameHistoric:v55];

          if (v56 && (v49 & 1) == 0)
          {
            uint64_t v57 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
            id v58 = [v57 sectionForHistoricSection:v51];
            uint64_t v59 = v85;
            goto LABEL_67;
          }
          char v60 = v56 | v49 ^ 1;
          uint64_t v59 = v85;
          if (v60) {
            goto LABEL_68;
          }
          uint64_t v57 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
          id v58 = [v57 historicSectionForSection:v51];
LABEL_67:

          if (!v58) {
LABEL_68:
          }
            id v58 = v51;
          uint64_t v61 = [(NSMutableDictionary *)self->_sections objectForKeyedSubscript:v58];

          if (!v61)
          {
            uint64_t v62 = [v54 name];

            id v58 = (id)v62;
          }
          uint64_t v5 = &OBJC_IVAR___REFeatureTransmuter__featureValuesCacheLock;
          uint64_t v48 = v84;
          [v87 setSection:v58];
          [v80 addObject:v59];
          [v79 setObject:v58 forKeyedSubscript:v59];
          [v78 setObject:v50 forKeyedSubscript:v59];
          v63 = [NSNumber numberWithBool:v81];
          [v77 setObject:v63 forKeyedSubscript:v59];

          v64 = RELogForDomain(3);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            v65 = [v50 description];
            *(_DWORD *)buf = 138412802;
            uint64_t v120 = v59;
            __int16 v121 = 2112;
            v122 = v65;
            __int16 v123 = 2112;
            v124 = v51;
            _os_log_debug_impl(&dword_21E6E6000, v64, OS_LOG_TYPE_DEBUG, "Relevance of element %@ updated to %@ (%@)", buf, 0x20u);

            uint64_t v5 = &OBJC_IVAR___REFeatureTransmuter__featureValuesCacheLock;
          }

          uint64_t v3 = &OBJC_IVAR___REFeatureTransmuter__featureValuesCacheLock;
          id v4 = &OBJC_IVAR___REFeatureTransmuter__featureValuesCacheLock;
          goto LABEL_74;
        }
        if (v16)
        {
          uint64_t v18 = [(NSMutableDictionary *)self->_reloadingCachedFeatureMap objectForKey:v7];
          [v80 addObject:v7];
          uint64_t v45 = [v87 section];
          [v79 setObject:v45 forKeyedSubscript:v7];

          [v78 setObject:v18 forKeyedSubscript:v7];
          uint64_t v46 = [NSNumber numberWithBool:v15];
          [v77 setObject:v46 forKeyedSubscript:v7];

          v47 = RELogForDomain(3);
          uint64_t v48 = v84;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v120 = v7;
            _os_log_debug_impl(&dword_21E6E6000, v47, OS_LOG_TYPE_DEBUG, "updateElementRelevance: used cached feature map for %@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v18 = RELogForDomain(3);
          uint64_t v48 = v84;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v120 = v7;
            _os_log_debug_impl(&dword_21E6E6000, v18, OS_LOG_TYPE_DEBUG, "updateElementRelevance: not loaded %@", buf, 0xCu);
          }
        }
LABEL_74:
      }
      uint64_t v83 = [(NSMutableSet *)obj countByEnumeratingWithState:&v114 objects:v129 count:16];
    }
    while (v83);
  }

  v93[0] = MEMORY[0x263EF8330];
  v93[1] = 3221225472;
  v93[2] = __57__REElementRelevanceEngine__queue_updateElementRelevance__block_invoke;
  v93[3] = &unk_2644BF3A8;
  v93[4] = self;
  id v88 = v79;
  id v94 = v88;
  id v86 = v78;
  id v95 = v86;
  id v67 = v77;
  id v96 = v67;
  id v68 = v80;
  id v97 = v68;
  [(REElementRelevanceEngine *)self _performUpdatesToDelegate:v93];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v69 = self->_elementsNeedingRelevanceUpdate;
  uint64_t v70 = [(NSMutableSet *)v69 countByEnumeratingWithState:&v89 objects:v118 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v90;
    do
    {
      for (iuint64_t i = 0; ii != v71; ++ii)
      {
        if (*(void *)v90 != v72) {
          objc_enumerationMutation(v69);
        }
        uint64_t v74 = *(void *)(*((void *)&v89 + 1) + 8 * ii);
        long long v75 = [(REElementRelevanceEngine *)self delegate];
        [v75 relevanceEngine:self didUpdateRelevanceOfElement:v74];

        [(RERelevanceEngineSubsystem *)self endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
      }
      uint64_t v71 = [(NSMutableSet *)v69 countByEnumeratingWithState:&v89 objects:v118 count:16];
    }
    while (v71);
  }

  [(NSMutableSet *)self->_elementsNeedingRelevanceUpdate removeAllObjects];
}

void __57__REElementRelevanceEngine__queue_updateElementRelevance__block_invoke(id *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v2 = [*((id *)a1[4] + 6) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __57__REElementRelevanceEngine__queue_updateElementRelevance__block_invoke_2;
        v21[3] = &unk_2644BF380;
        id v8 = a1[5];
        id v9 = a1[4];
        id v22 = v8;
        id v23 = v9;
        id v24 = a1[6];
        id v25 = a1[7];
        uint64_t v26 = v7;
        id v27 = a1[8];
        [v7 performBatchUpdates:v21];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v4);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = a1[8];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
        int v16 = objc_msgSend(a1[4], "delegate", (void)v17);
        [v16 relevanceEngine:a1[4] elementWasAdded:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v32 count:16];
    }
    while (v12);
  }
}

void __57__REElementRelevanceEngine__queue_updateElementRelevance__block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v8 = *(void **)(*(void *)(a1 + 40) + 48);
        id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        id v10 = [v8 objectForKeyedSubscript:v9];

        uint64_t v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
        uint64_t v12 = [*(id *)(a1 + 56) objectForKeyedSubscript:v7];
        uint64_t v13 = [v12 BOOLValue];

        int v14 = [*(id *)(a1 + 64) containsElementWithId:v7];
        uint64_t v15 = *(void **)(a1 + 64);
        if (v14)
        {
          if (v10 == v15) {
            [v10 updateElementWithId:v7 withNewFeatureSet:v11 forceHidden:v13];
          }
          else {
            [v15 removeElementWithId:v7];
          }
          [*(id *)(a1 + 72) removeObject:v7];
        }
        else if (v10 == v15)
        {
          int v16 = [[REMLElement alloc] initWithIdentifier:v7 featureMap:v11];
          [*(id *)(a1 + 64) addElement:v16 forceHidden:v13];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

- (void)_performUpdatesToDelegate:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void (**)(void))a3;
    uint64_t v5 = [(REElementRelevanceEngine *)self _allCurrentElements];
    v4[2](v4);

    uint64_t v6 = [(REElementRelevanceEngine *)self _allCurrentElements];
    uint64_t v7 = [(REElementRelevanceEngine *)self delegate];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke;
    v10[3] = &unk_2644BDBF0;
    v10[4] = self;
    id v11 = v5;
    id v12 = v6;
    id v8 = v6;
    id v9 = v5;
    [v7 relevanceEngine:self performedBatchUpdates:v10];
  }
}

void __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = [*(id *)(*(void *)(a1 + 32) + 48) allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
        id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];
        id v9 = +[REArrayDiff diffFromElements:v7 toElements:v8 equalComparator:&__block_literal_global_46 hashGenerator:&__block_literal_global_36_0 changeComparator:&__block_literal_global_38];

        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_5;
        v12[3] = &unk_2644BF410;
        uint64_t v10 = *(void *)(a1 + 32);
        v12[4] = v6;
        v12[5] = v10;
        [v9 enumerateOperationsUsingBlock:v12];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

uint64_t __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:");
}

uint64_t __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hash];
}

uint64_t __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_4()
{
  return 0;
}

void __54__REElementRelevanceEngine__performUpdatesToDelegate___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v12 = a3;
  id v9 = +[RESectionPath sectionPathWithSectionName:*(void *)(a1 + 32) element:a4];
  uint64_t v10 = +[RESectionPath sectionPathWithSectionName:*(void *)(a1 + 32) element:a5];
  switch(a2)
  {
    case 3:
      id v11 = [*(id *)(a1 + 40) delegate];
      [v11 relevanceEngine:*(void *)(a1 + 40) didMoveElement:v12 fromPath:v10 toPath:v9];
      break;
    case 2:
      id v11 = [*(id *)(a1 + 40) delegate];
      [v11 relevanceEngine:*(void *)(a1 + 40) didRemoveElement:v12 atPath:v10];
      break;
    case 1:
      id v11 = [*(id *)(a1 + 40) delegate];
      [v11 relevanceEngine:*(void *)(a1 + 40) didInsertElement:v12 atPath:v9];
      break;
    default:
      goto LABEL_8;
  }

LABEL_8:
}

- (id)_allCurrentElements
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_sections, "count"));
  sections = self->_sections;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__REElementRelevanceEngine__allCurrentElements__block_invoke;
  v8[3] = &unk_2644BF438;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)sections enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

void __47__REElementRelevanceEngine__allCurrentElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "visibleCount"));
  if ([v5 visibleCount] >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = [v5 elementIdAtIndex:v7];
      [v6 addObject:v8];

      ++v7;
    }
    while (v7 < [v5 visibleCount]);
  }
  id v9 = (void *)[v6 copy];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

- (void)_onqueue_async:(id)a3
{
}

- (void)sectionDidUpdateContentOrder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = RELogForDomain(6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[REElementRelevanceEngine sectionDidUpdateContentOrder:](v3, v4);
  }
}

- (id)section:(id)a3 groupForIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_fetchedInternalBuildOnceToken_3 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_3, &__block_literal_global_250_0);
  }
  if (!_isInternalDevice_3) {
    goto LABEL_21;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ____RE_Cached_Get__ShowAllElements_block_invoke;
  block[3] = &unk_2644BC660;
  id v23 = 0;
  if (__RE_Cached_Get__ShowAllElements_onceToken != -1) {
    dispatch_once(&__RE_Cached_Get__ShowAllElements_onceToken, block);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__RE_Cached_lock__ShowAllElements);
  if ((__RE_Cached_hasValue__ShowAllElements & 1) == 0)
  {
    char v21 = 0;
    if (RelevanceEngineLibraryCore_0())
    {
      id v8 = [soft__REEngineDefaults() globalDefaults];
    }
    else
    {
      id v8 = 0;
    }
    unsigned int v9 = [v8 _BOOLValueForKey:@"ShowAllElements" set:&v21];
    if (v21) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = RELogForDomain(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [NSNumber numberWithBool:v10];
      *(_DWORD *)buf = 138412290;
      id v25 = v12;
      _os_log_impl(&dword_21E6E6000, v11, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key ShowAllElements: %@", buf, 0xCu);
    }
    if (v21) {
      char v13 = v10;
    }
    else {
      char v13 = 0;
    }
    __RE_Cached__ShowAllElements = v13;
    __RE_Cached_hasValue__ShowAllElements = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__RE_Cached_lock__ShowAllElements);
  int v14 = __RE_Cached__ShowAllElements;

  if (v14)
  {
    long long v15 = 0;
  }
  else
  {
LABEL_21:
    dataSourceManager = self->_dataSourceManager;
    if (!dataSourceManager)
    {
      long long v17 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
      uint64_t v18 = [v17 dataSourceManager];
      long long v19 = self->_dataSourceManager;
      self->_dataSourceManager = v18;

      dataSourceManager = self->_dataSourceManager;
    }
    long long v15 = [(REDataSourceManager *)dataSourceManager elementGroupForIdentifier:v7];
  }

  return v15;
}

- (id)_queue_featureMapForElementWithId:(id)a3 trainingContext:(id)a4
{
  predictedElements = self->_predictedElements;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)predictedElements objectForKeyedSubscript:a3];
  unsigned int v9 = [(REElementRelevanceEngine *)self _queue_featureMapForElement:v8 trainingContext:v7];

  return v9;
}

- (id)_queue_featureMapForElement:(id)a3 trainingContext:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  context = (void *)MEMORY[0x223C31460]();
  long long v28 = v6;
  id v8 = [v6 relevanceProviders];
  unsigned int v9 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  uint64_t v10 = (void *)[v9 newInputFeatureMap];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v8;
  uint64_t v32 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v36;
    id v31 = v7;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        char v13 = [(RERelevanceProviderEnvironment *)self->_providerEnvironment featuresForRelevanceProvider:v12];
        providerEnvironment = self->_providerEnvironment;
        if (v7) {
          [(RERelevanceProviderEnvironment *)providerEnvironment relevancesForRelevanceProvider:v12 usingContext:v7];
        }
        else {
        long long v15 = [(RERelevanceProviderEnvironment *)providerEnvironment relevancesForRelevanceProvider:v12];
        }
        unint64_t v16 = [v13 count];
        unint64_t v17 = [v15 count];
        if (v16 >= v17) {
          unint64_t v18 = v17;
        }
        else {
          unint64_t v18 = v16;
        }
        if (v18)
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            long long v20 = [v13 objectAtIndexedSubscript:j];
            unint64_t v21 = [v15 featureValueAtIndex:j];
            if ([v10 hasValueForFeature:v20])
            {
              uint64_t v22 = (void *)[v10 valueForFeature:v20];
              if (RECompareFeatureValues(v21, v22) != 1) {
                unint64_t v21 = (unint64_t)v22;
              }
            }
            [v10 setValue:v21 forFeature:v20];
          }
        }

        id v7 = v31;
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v32);
  }

  predictorManager = self->_predictorManager;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __72__REElementRelevanceEngine__queue_featureMapForElement_trainingContext___block_invoke;
  v33[3] = &unk_2644BC8A0;
  id v34 = v10;
  id v24 = v10;
  [(REPredictorManager *)predictorManager enumerateValuesForElement:v28 trainingContext:v7 usingBlock:v33];
  id v25 = [(REFeatureTransmuter *)self->_featureTransmuter transformFeatureMaps:v24];

  return v25;
}

void __72__REElementRelevanceEngine__queue_featureMapForElement_trainingContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (const void *)RECreateFeatureValueTaggedPointer(a3);
  [*(id *)(a1 + 32) setValue:v6 forFeature:v5];

  REReleaseFeatureValueTaggedPointer(v6);
}

- (id)featureMapForElement:(id)a3 trainingContext:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  unsigned int v9 = [(REElementRelevanceEngine *)self _queue_featureMapForElementWithId:v8 trainingContext:v7];

  return v9;
}

- (id)_generateFeatureMapForElement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  predictedElements = self->_predictedElements;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)predictedElements objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v7 = +[REPredictionElement predictionElementFromElement:v4];
    [v7 setSection:@"defaultSectionIdentifier"];
  }
  id v8 = [(REElementRelevanceEngine *)self _queue_featureMapForElement:v7 trainingContext:0];

  return v8;
}

- (id)featureProviderForElement:(id)a3
{
  id v3 = [(REElementRelevanceEngine *)self _generateFeatureMapForElement:a3];
  id v4 = [[_REFeatureMapWrapper alloc] initWithFeatureMap:v3];

  return v4;
}

- (id)predictionForElement:(id)a3
{
  id v4 = a3;
  id v5 = [(REElementRelevanceEngine *)self _generateFeatureMapForElement:v4];
  id v6 = [REMLElement alloc];
  id v7 = [v4 identifier];

  id v8 = [(REMLElement *)v6 initWithIdentifier:v7 featureMap:v5];
  unsigned int v9 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  uint64_t v10 = [v9 modelManager];
  id v11 = [v10 predicitionForLogicalElement:v8];

  return v11;
}

- (id)elementRankerForSection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_REElementRankerWrapper);
  id v6 = [(NSMutableDictionary *)self->_sections objectForKeyedSubscript:v4];

  id v7 = [v6 comparator];
  [(_REElementRankerWrapper *)v5 setComparator:v7];

  [(_REElementRankerWrapper *)v5 setQueue:self->_queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__REElementRelevanceEngine_elementRankerForSection___block_invoke;
  v9[3] = &unk_2644BF460;
  v9[4] = self;
  [(_REElementRankerWrapper *)v5 setFeatureMapGenerator:v9];
  return v5;
}

uint64_t __52__REElementRelevanceEngine_elementRankerForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _generateFeatureMapForElement:a2];
}

- (NSDictionary)sectionsMap
{
  return (NSDictionary *)self->_sections;
}

- (REPredictorManager)predictorManager
{
  return self->_predictorManager;
}

- (RERelevanceProviderEnvironment)providerEnvironment
{
  return self->_providerEnvironment;
}

- (REElementRelevanceEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (REElementRelevanceEngineDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_predictorUpdatedScheduler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_featureTransmuter, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_providerEnvironment, 0);
  objc_storeStrong((id *)&self->_predictorManager, 0);
  objc_storeStrong((id *)&self->_persistenceFeatures, 0);
  objc_storeStrong((id *)&self->_identifierElementIdentifierMap, 0);
  objc_storeStrong((id *)&self->_relevanceProviderElementMap, 0);
  objc_storeStrong((id *)&self->_reloadingCachedFeatureMap, 0);
  objc_storeStrong((id *)&self->_reloadingElementIdentifiers, 0);
  objc_storeStrong((id *)&self->_predictedElements, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_elementsNeedingRelevanceUpdate, 0);
}

- (id)featureMapForPredictedElement:(id)a3 trainingContext:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  unsigned int v9 = [(REElementRelevanceEngine *)self _queue_featureMapForElement:v8 trainingContext:v7];

  return v9;
}

- (id)_identifierForElementIdentifier:(id)a3
{
  return [(REKeyMultiValueMap *)self->_identifierElementIdentifierMap keyForValue:a3];
}

- (id)_elementIdentifierForIdentifier:(id)a3
{
  id v3 = [(REKeyMultiValueMap *)self->_identifierElementIdentifierMap valuesForKey:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (void)refreshContent
{
}

void __42__REElementRelevanceEngine_removeElement___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 48);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_21E6E6000, log, OS_LOG_TYPE_DEBUG, "No element %@ with found in section %@", (uint8_t *)&v5, 0x16u);
}

- (void)sectionDidUpdateContentOrder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 name];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_debug_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_DEBUG, "Section (grouped) did update %@", (uint8_t *)&v4, 0xCu);
}

@end