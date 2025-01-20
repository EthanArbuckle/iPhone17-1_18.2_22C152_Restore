@interface RERelevanceProviderEnvironment
- (BOOL)allowsLocationUse;
- (BOOL)containsRelevanceProvider:(id)a3;
- (BOOL)isRelevanceProviderHistoric:(id)a3;
- (BOOL)isRelevanceProviderLoaded:(id)a3;
- (BOOL)isSupportedRelevanceProvider:(id)a3;
- (NSDictionary)allProviderValues;
- (REFeatureSet)supportedFeatures;
- (RERelevanceProviderEnvironment)initWithRelevanceEngine:(id)a3;
- (RERelevanceProviderEnvironmentDelegate)delegate;
- (id)_histogramForFeature:(id)a3;
- (id)_histogramForProvider:(id)a3;
- (id)_providerManagerForProvider:(id)a3;
- (id)_relevaneProviderWithType:(id)a3 withOptions:(id)a4;
- (id)createRelevaneProviderWithType:(id)a3 withOptions:(id)a4;
- (id)currentRelevanceProvidersState;
- (id)encodeRelevaneProvider:(id)a3;
- (id)featuresForRelevanceProvider:(id)a3;
- (id)relevancesForRelevanceProvider:(id)a3;
- (id)relevancesForRelevanceProvider:(id)a3 usingContext:(id)a4;
- (unint64_t)relevanceProviderCount;
- (void)_addRelevanceValue:(id)a3 forProvider:(id)a4;
- (void)_queue_performUpdate:(id)a3;
- (void)_removeRelevanceValueForProvider:(id)a3;
- (void)_scaleRelevanceProviderValues:(id)a3 values:(id)a4;
- (void)_setupRelevanceProviderManagers;
- (void)accessHistogramForFeature:(id)a3 usingBlock:(id)a4;
- (void)addRelevanceProvider:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)immediateUpdateForRelevanceProviderManager:(id)a3 completion:(id)a4;
- (void)pause;
- (void)relateRelevanceProvider:(id)a3 toRelevanceProvider:(id)a4;
- (void)removeRelevanceProvider:(id)a3 completion:(id)a4;
- (void)resume;
- (void)scheduleUpdateForRelevanceProvider:(id)a3 completion:(id)a4;
- (void)scheduleUpdateForRelevanceProviderManager:(id)a3 completion:(id)a4;
- (void)setAllowsLocationUse:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RERelevanceProviderEnvironment

- (void)_setupRelevanceProviderManagers
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __65__RERelevanceProviderEnvironment__setupRelevanceProviderManagers__block_invoke;
  v49[3] = &unk_2644BF160;
  v49[4] = self;
  uint64_t v3 = MEMORY[0x223C31700](v49, a2);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v4 = +[RERelevanceProviderManager providerManagerClasses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v46;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(*((void *)&v45 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v6);
  }

  v9 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  v10 = [v9 configuration];
  v11 = [v10 relevanceProviderManagerLoader];

  v28 = v11;
  v29 = (void *)v3;
  [v11 enumerationDataSourceClassesWithBlock:v3];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v27 = 40;
  obj = self->_relevanceManagers;
  uint64_t v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v42;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * v12);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v14 = objc_msgSend((id)objc_opt_class(), "_dependencyClasses", v27);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v38;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v38 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = -[NSMapTable objectForKey:](self->_relevanceClassManagerMap, "objectForKey:", [*(id *)(*((void *)&v37 + 1) + 8 * v18) _relevanceProviderClass]);
              if (v19) {
                [(REDependencyGraph *)self->_dependencyGraph markItem:v13 dependentOnItem:v19];
              }

              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
          }
          while (v16);
        }

        ++v12;
      }
      while (v12 != v32);
      uint64_t v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v32);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = *(id *)((char *)&self->super.super.isa + v27);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v33 + 1) + 8 * v24);
        v26 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
        [v25 _scheduleUpdate:v26];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v50 count:16];
    }
    while (v22);
  }
}

void __65__RERelevanceProviderEnvironment__setupRelevanceProviderManagers__block_invoke(uint64_t a1, void *a2)
{
  v4 = [a2 _features];
  id v14 = +[REFeatureSet featureSetWithFeatures:v4];

  if ([*(id *)(*(void *)(a1 + 32) + 104) intersectsFeatureSet:v14])
  {
    id v5 = objc_alloc((Class)a2);
    uint64_t v6 = [*(id *)(a1 + 32) queue];
    uint64_t v7 = (void *)[v5 initWithQueue:v6];

    [v7 setEnvironment:*(void *)(a1 + 32)];
    [v14 intersetFeatureSet:*(void *)(*(void *)(a1 + 32) + 104)];
    [v7 setSupportedFeatures:v14];
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:v7];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setObject:forKey:", v7, objc_msgSend((id)objc_opt_class(), "_relevanceProviderClass"));
    [*(id *)(*(void *)(a1 + 32) + 72) addItem:v7];
    uint64_t v8 = [*(id *)(a1 + 32) relevanceEngine];
    v9 = [v8 logger];
    [v9 addLoggable:v7];

    v10 = *(void **)(a1 + 32);
    v11 = [a2 _features];
    uint64_t v12 = [v11 firstObject];
    id v13 = (id)[v10 _histogramForFeature:v12];
  }
}

- (id)_histogramForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_relevanceHistogramMap objectForKey:v4];
  if (!v5)
  {
    id v5 = [[REHistogram alloc] initWithFeature:v4];
    [(NSMapTable *)self->_relevanceHistogramMap setObject:v5 forKey:v4];
  }

  return v5;
}

void __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_4(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 120) copy];
  [*(id *)(*(void *)(a1 + 32) + 120) removeAllObjects];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v30 = (id *)a1;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v64 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v8 = [v7 allProviders];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v71 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v60 != v10) {
                objc_enumerationMutation(v8);
              }
              [v2 addObject:*(void *)(*((void *)&v59 + 1) + 8 * j)];
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v71 count:16];
          }
          while (v9);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v4);
  }

  uint64_t v54 = 0;
  v55 = (os_unfair_lock_s *)&v54;
  uint64_t v56 = 0x2810000000;
  v57 = &unk_21E7FF34A;
  int v58 = 0;
  v29 = [MEMORY[0x263F08968] mapTableWithKeyOptions:512 valueOptions:0];
  uint64_t v12 = objc_alloc_init(REExpectation);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v13 = v2;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v70 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v51;
    uint64_t v27 = v44;
    v28 = v38;
    do
    {
      for (uint64_t k = 0; k != v14; ++k)
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void **)(*((void *)&v50 + 1) + 8 * k);
        uint64_t v18 = objc_msgSend(v30[4], "_providerManagerForProvider:", v17, v27, v28);
        v19 = v18;
        if (v18)
        {
          if ([v18 containsProvider:v17])
          {
            [(REExpectation *)v12 beginOperation];
            if ([(id)objc_opt_class() supportsHistoricProviders])
            {
              v43[0] = MEMORY[0x263EF8330];
              v43[1] = 3221225472;
              v44[0] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_54;
              v44[1] = &unk_2644BF1D8;
              id v20 = v19;
              long long v45 = v20;
              long long v46 = v17;
              v49 = &v54;
              id v47 = v29;
              long long v48 = v12;
              [v20 isProviderHistoric:v17 completion:v43];

              uint64_t v21 = v45;
            }
            else
            {
              v37[0] = MEMORY[0x263EF8330];
              v37[1] = 3221225472;
              v38[0] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_4_61;
              v38[1] = &unk_2644BF200;
              long long v42 = &v54;
              long long v39 = v29;
              long long v40 = v17;
              long long v41 = v12;
              [v19 relevanceForProvider:v17 completion:v37];

              uint64_t v21 = v39;
            }
          }
          else
          {
            uint64_t v21 = RELogForDomain(3);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v17;
              __int16 v68 = 2112;
              v69 = v19;
              _os_log_impl(&dword_21E6E6000, v21, OS_LOG_TYPE_INFO, "Can find provider %@ in manager %@", buf, 0x16u);
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_30;
          }
          uint64_t v21 = v17;
          *(void *)buf = 0;
          *(void *)buf = [v21 value];
          os_unfair_lock_lock(v55 + 8);
          uint64_t v22 = [RERelevanceValue alloc];
          uint64_t v23 = [[RETaggedFeatureValueArray alloc] initWithValues:buf count:1];
          uint64_t v24 = [(RERelevanceValue *)v22 initWithValues:v23 isHistoric:0];
          [v29 setObject:v24 forKey:v21];

          os_unfair_lock_unlock(v55 + 8);
        }

LABEL_30:
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v70 count:16];
    }
    while (v14);
  }

  v25 = [v30[4] queue];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_5;
  v31[3] = &unk_2644BF228;
  v31[4] = v30[4];
  long long v36 = &v54;
  id v26 = v29;
  id v32 = v26;
  id v33 = v30[5];
  id v34 = v30[6];
  id v35 = v30[7];
  [(REExpectation *)v12 notifyOperationsCompleteOrPerformUsingQueue:v25 block:v31];

  _Block_object_dispose(&v54, 8);
}

- (void)scheduleUpdateForRelevanceProviderManager:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = RELogForDomain(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling imminent update for relevance provider manager %@", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
  {
    updateCompletionBlocks = self->_updateCompletionBlocks;
    uint64_t v10 = (void *)MEMORY[0x223C31700](v7);
    [(NSMutableArray *)updateCompletionBlocks addObject:v10];
  }
  [(NSMutableSet *)self->_providerManagersToUpdate addObject:v6];
  [(REUpNextScheduler *)self->_scheduler schedule];
}

- (void)_queue_performUpdate:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void))a3;
  [(RERelevanceEngineSubsystem *)self beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke;
  v41[3] = &unk_2644BC660;
  v41[4] = self;
  uint64_t v5 = (void (**)(void))MEMORY[0x223C31700](v41);
  if ([(NSHashTable *)self->_providersToUpdate count]
    || [(NSMutableSet *)self->_providerManagersToUpdate count])
  {
    uint64_t v23 = v5;
    uint64_t v24 = v4;
    id v6 = (void *)[(NSMutableSet *)self->_providerManagersToUpdate mutableCopy];
    [(NSMutableSet *)self->_providerManagersToUpdate removeAllObjects];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = (void *)[v6 copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          if ([(REDependencyGraph *)self->_dependencyGraph containsItem:v12])
          {
            dependencyGraph = self->_dependencyGraph;
            v35[0] = MEMORY[0x263EF8330];
            v35[1] = 3221225472;
            v35[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_2;
            v35[3] = &unk_2644BF188;
            id v36 = v6;
            [(REDependencyGraph *)dependencyGraph enumerateDependenciesOfItem:v12 usingBlock:v35];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v9);
    }

    uint64_t v14 = objc_alloc_init(REExpectation);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          [(REExpectation *)v14 beginOperation];
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_3;
          v29[3] = &unk_2644BC660;
          v30 = v14;
          [v20 _prepareForUpdateWithCompletion:v29];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v17);
    }

    uint64_t v21 = [(RERelevanceEngineSubsystem *)self queue];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_4;
    v25[3] = &unk_2644BF250;
    v25[4] = self;
    id v26 = v15;
    uint64_t v5 = v23;
    uint64_t v27 = v23;
    uint64_t v4 = v24;
    v28 = v24;
    id v22 = v15;
    [(REExpectation *)v14 notifyOperationsCompleteOrPerformUsingQueue:v21 block:v25];
  }
  else
  {
    v5[2](v5);
    v4[2](v4);
  }
}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) endOperation];
}

void __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_5(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 96) lock];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
  id v26 = [MEMORY[0x263EFF980] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v36 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v8 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v7];
        [*(id *)(a1 + 32) _removeRelevanceValueForProvider:v7];
        uint64_t v9 = [*(id *)(a1 + 40) objectForKey:v7];
        [*(id *)(a1 + 32) _addRelevanceValue:v9 forProvider:v7];
        id v10 = v9;
        if (v8 == v10)
        {
        }
        else
        {
          char v11 = [v8 isEqual:v10];

          if ((v11 & 1) == 0) {
            [v26 addObject:v7];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
  [*(id *)(*(void *)(a1 + 32) + 96) unlock];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v26;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        uint64_t v18 = [*(id *)(a1 + 32) delegate];
        [v18 relevanceEnvironment:*(void *)(a1 + 32) didUpdateRelevanceProvider:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v14);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = *(id *)(a1 + 48);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v27 + 1) + 8 * k);
        if ([(id)objc_opt_class() _wantsDelayedUpdate]
          && (unint64_t)[*(id *)(a1 + 48) count] >= 2)
        {
          v25 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
          [v24 _scheduleUpdate:v25];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v21);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (RERelevanceProviderEnvironment)initWithRelevanceEngine:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)RERelevanceProviderEnvironment;
  uint64_t v5 = [(RERelevanceEngineSubsystem *)&v40 initWithRelevanceEngine:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    relevanceManagers = v5->_relevanceManagers;
    v5->_relevanceManagers = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    relevanceClassManagerMap = v5->_relevanceClassManagerMap;
    v5->_relevanceClassManagerMap = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    relevanceHistogramMap = v5->_relevanceHistogramMap;
    v5->_relevanceHistogramMap = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x263F08968] mapTableWithKeyOptions:512 valueOptions:0];
    relevanceValues = v5->_relevanceValues;
    v5->_relevanceValues = (NSMapTable *)v12;

    uint64_t v14 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    customProviders = v5->_customProviders;
    v5->_customProviders = (NSHashTable *)v14;

    uint64_t v16 = objc_opt_new();
    relevanceValuesLocuint64_t k = v5->_relevanceValuesLock;
    v5->_relevanceValuesLocuint64_t k = (NSLock *)v16;

    uint64_t v18 = [v4 rootFeatures];
    uint64_t v19 = [v18 copy];
    supportedFeatures = v5->_supportedFeatures;
    v5->_supportedFeatures = (REFeatureSet *)v19;

    uint64_t v21 = objc_alloc_init(REUpNextDisjointSet);
    relevanceProviderSet = v5->_relevanceProviderSet;
    v5->_relevanceProviderSet = v21;

    uint64_t v23 = objc_alloc_init(REDependencyGraph);
    dependencyGraph = v5->_dependencyGraph;
    v5->_dependencyGraph = v23;

    uint64_t v25 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    providersToUpdate = v5->_providersToUpdate;
    v5->_providersToUpdate = (NSHashTable *)v25;

    uint64_t v27 = [MEMORY[0x263EFF9C0] set];
    providerManagersToUpdate = v5->_providerManagersToUpdate;
    v5->_providerManagersToUpdate = (NSMutableSet *)v27;

    uint64_t v29 = [MEMORY[0x263EFF980] array];
    updateCompletionBlocks = v5->_updateCompletionBlocks;
    v5->_updateCompletionBlocks = (NSMutableArray *)v29;

    long long v31 = [v4 logger];
    [v31 addLoggable:v5];

    long long v32 = [v4 configuration];
    LOBYTE(v31) = [v32 wantsImmutableContent];

    objc_initWeak(&location, v5);
    long long v33 = [(RERelevanceEngineSubsystem *)v5 queue];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __58__RERelevanceProviderEnvironment_initWithRelevanceEngine___block_invoke;
    v35[3] = &unk_2644BF138;
    long long v36 = v5;
    char v38 = (char)v31;
    objc_copyWeak(&v37, &location);
    dispatch_sync(v33, v35);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __58__RERelevanceProviderEnvironment_initWithRelevanceEngine___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_queue_performUpdate:", v3);
}

void __58__RERelevanceProviderEnvironment_initWithRelevanceEngine___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupRelevanceProviderManagers];
  id v2 = [*(id *)(a1 + 32) queue];
  if (*(unsigned char *)(a1 + 48)) {
    double v3 = 0.0;
  }
  else {
    double v3 = 0.05;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__RERelevanceProviderEnvironment_initWithRelevanceEngine___block_invoke_2;
  v7[3] = &unk_2644BF110;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  uint64_t v4 = +[REUpNextScheduler schedulerWithQueue:v2 delay:v7 updateCompletionBlock:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v4;

  objc_destroyWeak(&v8);
}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "removeAllObjects", (void)v8);
  return [*(id *)(a1 + 32) endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:*(void *)(a1 + 32)];
}

- (BOOL)isSupportedRelevanceProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RERelevanceProviderEnvironment *)self _providerManagerForProvider:v4];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v4 feature];
      BOOL v6 = [(REFeatureSet *)self->_supportedFeatures containsFeature:v7];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void)setAllowsLocationUse:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_allowsLocationUse != a3)
  {
    BOOL v3 = a3;
    self->_allowsLocationUse = a3;
    if ([(RERelevanceEngineSubsystem *)self isRunning])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v5 = self->_relevanceManagers;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
            long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if ([(id)objc_opt_class() _requiresLocationServices])
            {
              if (v3)
              {
                [(RERelevanceEngineSubsystem *)self beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:v10];
                v11[0] = MEMORY[0x263EF8330];
                v11[1] = 3221225472;
                v11[2] = __55__RERelevanceProviderEnvironment_setAllowsLocationUse___block_invoke;
                v11[3] = &unk_2644BC688;
                v11[4] = self;
                v11[5] = v10;
                [v10 resumeWithCompletion:v11];
              }
              else
              {
                [v10 pauseWithCompletion:&__block_literal_global_46_0];
              }
            }
          }
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }
    }
  }
}

- (id)_providerManagerForProvider:(id)a3
{
  relevanceClassManagerMap = self->_relevanceClassManagerMap;
  uint64_t v4 = objc_opt_class();
  return [(NSMapTable *)relevanceClassManagerMap objectForKey:v4];
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = self->_relevanceManagers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        long long v9 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
        long long v10 = [v9 logger];
        [v10 removeLoggable:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  long long v11 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  long long v12 = [v11 logger];
  [v12 removeLoggable:self];

  v13.receiver = self;
  v13.super_class = (Class)RERelevanceProviderEnvironment;
  [(RERelevanceEngineSubsystem *)&v13 dealloc];
}

- (void)pause
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_relevanceManagers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "pauseWithCompletion:", &__block_literal_global_43, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)resume
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_relevanceManagers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (![(id)objc_opt_class() _requiresLocationServices] || self->_allowsLocationUse)
        {
          [(RERelevanceEngineSubsystem *)self beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:v8];
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 3221225472;
          v9[2] = __40__RERelevanceProviderEnvironment_resume__block_invoke;
          v9[3] = &unk_2644BC688;
          v9[4] = self;
          v9[5] = v8;
          [v8 resumeWithCompletion:v9];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

uint64_t __40__RERelevanceProviderEnvironment_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:*(void *)(a1 + 40)];
}

uint64_t __55__RERelevanceProviderEnvironment_setAllowsLocationUse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:*(void *)(a1 + 40)];
}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_54(uint64_t a1, int a2)
{
  char v2 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (a2)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_2_55;
    v16[3] = &unk_2644BF1B0;
    v18[1] = *(void *)(a1 + 64);
    uint64_t v6 = (id *)v17;
    id v7 = *(id *)(a1 + 48);
    char v19 = v2;
    uint64_t v8 = *(void *)(a1 + 40);
    v17[0] = v7;
    v17[1] = v8;
    long long v9 = (id *)v18;
    v18[0] = *(id *)(a1 + 56);
    [v4 relevanceForHistoricProvider:v5 completion:v16];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_3_59;
    v12[3] = &unk_2644BF1B0;
    v14[1] = *(void *)(a1 + 64);
    uint64_t v6 = (id *)v13;
    id v10 = *(id *)(a1 + 48);
    char v15 = v2;
    uint64_t v11 = *(void *)(a1 + 40);
    v13[0] = v10;
    v13[1] = v11;
    long long v9 = (id *)v14;
    v14[0] = *(id *)(a1 + 56);
    [v4 relevanceForProvider:v5 completion:v12];
  }
}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_2_55(uint64_t a1, void *a2)
{
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [RERelevanceValue alloc];
  id v7 = [[RETaggedFeatureValueArray alloc] initWithFeatureValues:v4];

  uint64_t v8 = [(RERelevanceValue *)v6 initWithValues:v7 isHistoric:*(unsigned __int8 *)(a1 + 64)];
  [v5 setObject:v8 forKey:*(void *)(a1 + 40)];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  long long v9 = *(void **)(a1 + 48);
  return [v9 endOperation];
}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_3_59(uint64_t a1, void *a2)
{
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [RERelevanceValue alloc];
  id v7 = [[RETaggedFeatureValueArray alloc] initWithFeatureValues:v4];

  uint64_t v8 = [(RERelevanceValue *)v6 initWithValues:v7 isHistoric:*(unsigned __int8 *)(a1 + 64)];
  [v5 setObject:v8 forKey:*(void *)(a1 + 40)];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  long long v9 = *(void **)(a1 + 48);
  return [v9 endOperation];
}

uint64_t __55__RERelevanceProviderEnvironment__queue_performUpdate___block_invoke_4_61(void *a1, void *a2)
{
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(a1[7] + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = [RERelevanceValue alloc];
  id v7 = [[RETaggedFeatureValueArray alloc] initWithFeatureValues:v4];

  uint64_t v8 = [(RERelevanceValue *)v6 initWithValues:v7 isHistoric:0];
  [v5 setObject:v8 forKey:a1[5]];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[7] + 8) + 32));
  long long v9 = (void *)a1[6];
  return [v9 endOperation];
}

- (void)_removeRelevanceValueForProvider:(id)a3
{
  id v9 = a3;
  id v4 = -[NSMapTable objectForKey:](self->_relevanceValues, "objectForKey:");
  uint64_t v5 = v4;
  if (v4 && ([v4 isHistoric] & 1) == 0)
  {
    uint64_t v6 = [v5 values];
    uint64_t v7 = [v6 firstFeatureValue];
    uint64_t v8 = [(RERelevanceProviderEnvironment *)self _histogramForProvider:v9];
    [v8 removeValue:v7];
  }
  [(NSMapTable *)self->_relevanceValues removeObjectForKey:v9];
}

- (void)_addRelevanceValue:(id)a3 forProvider:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (([v10 isHistoric] & 1) == 0)
  {
    uint64_t v7 = [v10 values];
    uint64_t v8 = [v7 firstFeatureValue];
    id v9 = [(RERelevanceProviderEnvironment *)self _histogramForProvider:v6];
    [v9 addValue:v8];
  }
  [(NSMapTable *)self->_relevanceValues setObject:v10 forKey:v6];
}

- (id)_histogramForProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RERelevanceProviderEnvironment *)self _providerManagerForProvider:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 effectiveFeatures];
    uint64_t v8 = [v7 firstObject];
    id v9 = [(RERelevanceProviderEnvironment *)self _histogramForFeature:v8];

LABEL_5:
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v4 feature];
    id v9 = [(RERelevanceProviderEnvironment *)self _histogramForFeature:v7];
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

- (unint64_t)relevanceProviderCount
{
  return [(REUpNextDisjointSet *)self->_relevanceProviderSet count];
}

- (void)addRelevanceProvider:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(void))a4;
  if (v16)
  {
    [v16 setEnvironment:self];
    uint64_t v7 = [(RERelevanceProviderEnvironment *)self _providerManagerForProvider:v16];
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 addProvider:v16 completion:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NSHashTable *)self->_customProviders addObject:v16];
        char v15 = [(RERelevanceProviderEnvironment *)self delegate];
        [v15 relevanceEnvironment:self didUpdateRelevanceProvider:v16];

        if (v6) {
          v6[2](v6);
        }
      }
      else
      {
        RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Unsupported relevance provider: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v16);
      }
    }
    [(REUpNextDisjointSet *)self->_relevanceProviderSet addItem:v16];
  }
}

- (void)removeRelevanceProvider:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v6 = (void (**)(void))a4;
  if (v15)
  {
    [v15 setEnvironment:0];
    uint64_t v7 = [(RERelevanceProviderEnvironment *)self _providerManagerForProvider:v15];
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 removeProvider:v15 completion:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NSHashTable *)self->_customProviders removeObject:v15];
        if (v6) {
          v6[2](v6);
        }
      }
      else
      {
        RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Unsupported relevance provider: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v15);
      }
    }
    [(REUpNextDisjointSet *)self->_relevanceProviderSet removeItem:v15];
    [(NSLock *)self->_relevanceValuesLock lock];
    [(RERelevanceProviderEnvironment *)self _removeRelevanceValueForProvider:v15];
    [(NSLock *)self->_relevanceValuesLock unlock];
  }
}

- (BOOL)containsRelevanceProvider:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 environment];
  BOOL v5 = v4 == self;

  return v5;
}

- (BOOL)isRelevanceProviderLoaded:(id)a3
{
  id v4 = a3;
  if ([(RERelevanceProviderEnvironment *)self containsRelevanceProvider:v4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = 1;
    }
    else
    {
      [(NSLock *)self->_relevanceValuesLock lock];
      id v6 = [(NSMapTable *)self->_relevanceValues objectForKey:v4];
      BOOL v5 = v6 != 0;

      [(NSLock *)self->_relevanceValuesLock unlock];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)relateRelevanceProvider:(id)a3 toRelevanceProvider:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[REUpNextDisjointSet connectItem:withItem:](self->_relevanceProviderSet, "connectItem:withItem:");
    }
  }
}

- (BOOL)isRelevanceProviderHistoric:(id)a3
{
  relevanceValuesLocuint64_t k = self->_relevanceValuesLock;
  id v5 = a3;
  [(NSLock *)relevanceValuesLock lock];
  id v6 = [(NSMapTable *)self->_relevanceValues objectForKey:v5];

  if (v6) {
    char v7 = [v6 isHistoric];
  }
  else {
    char v7 = 0;
  }
  [(NSLock *)self->_relevanceValuesLock unlock];

  return v7;
}

- (id)relevancesForRelevanceProvider:(id)a3 usingContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = [(RERelevanceProviderEnvironment *)self relevancesForRelevanceProvider:v6];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v6 value];
    uint64_t v8 = [[RETaggedFeatureValueArray alloc] initWithValues:&v13 count:1];
LABEL_5:
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v10 = [(RERelevanceProviderEnvironment *)self _providerManagerForProvider:v6];
  uint64_t v11 = [v10 relevanceForProvider:v6 context:v7];
  uint64_t v9 = [[RETaggedFeatureValueArray alloc] initWithFeatureValues:v11];
  if ([v6 relevancePriority] != 2)
  {
    [(NSLock *)self->_relevanceValuesLock lock];
    [(RERelevanceProviderEnvironment *)self _scaleRelevanceProviderValues:v6 values:v9];
    [(NSLock *)self->_relevanceValuesLock unlock];
  }

LABEL_9:
  return v9;
}

- (id)relevancesForRelevanceProvider:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v4 value];
    id v5 = [[RETaggedFeatureValueArray alloc] initWithValues:&v9 count:1];
  }
  else
  {
    [(NSLock *)self->_relevanceValuesLock lock];
    id v6 = [(NSMapTable *)self->_relevanceValues objectForKey:v4];
    id v7 = [v6 values];
    id v5 = (RETaggedFeatureValueArray *)[v7 copy];

    [(RERelevanceProviderEnvironment *)self _scaleRelevanceProviderValues:v4 values:v5];
    [(NSLock *)self->_relevanceValuesLock unlock];
  }
  return v5;
}

- (void)_scaleRelevanceProviderValues:(id)a3 values:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [(RERelevanceProviderEnvironment *)self featuresForRelevanceProvider:v24];
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 featureType];

  if (v9 == 2)
  {
    uint64_t v10 = (void *)[v6 firstFeatureValue];
    if (REFeatureValueTypeForTaggedPointer((unint64_t)v10) == 1) {
      float v12 = (float)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v10);
    }
    else {
      float v12 = REDoubleValueForTaggedPointer(v10, v11);
    }
    uint64_t v13 = [v24 relevancePriority];
    if (v13 == 3)
    {
      uint64_t v14 = [(RERelevanceProviderEnvironment *)self _histogramForProvider:v24];
      uint64_t v18 = (void *)[v14 mean];
      if (REFeatureValueTypeForTaggedPointer((unint64_t)v18) == 1) {
        float v20 = (float)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v18);
      }
      else {
        float v20 = REDoubleValueForTaggedPointer(v18, v19);
      }
      REReleaseFeatureValueTaggedPointer(v18);
      float v21 = v20 * 0.5;
    }
    else
    {
      if (v13 != 1)
      {
        if (!v13) {
          float v12 = 0.0;
        }
        goto LABEL_19;
      }
      uint64_t v14 = [(RERelevanceProviderEnvironment *)self _histogramForProvider:v24];
      id v15 = (void *)[v14 mean];
      if (REFeatureValueTypeForTaggedPointer((unint64_t)v15) == 1) {
        float v17 = (float)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v15);
      }
      else {
        float v17 = REDoubleValueForTaggedPointer(v15, v16);
      }
      REReleaseFeatureValueTaggedPointer(v15);
      float v21 = (v17 + 1.0) * 0.5;
    }
    float v12 = __71__RERelevanceProviderEnvironment__scaleRelevanceProviderValues_values___block_invoke(v12, v21);

LABEL_19:
    if (REFeatureValueTypeForTaggedPointer((unint64_t)v10) == 1) {
      uint64_t v22 = RECreateIntegerFeatureValueTaggedPointer((uint64_t)v12);
    }
    else {
      uint64_t v22 = RECreateDoubleFeatureValueTaggedPointer();
    }
    uint64_t v23 = (const void *)v22;
    if ([v6 count] == 1)
    {
      [v6 removeAllFeatureValues];
      [v6 addFeatureValue:v23];
    }
    else
    {
      [v6 removeFeatureValueAtIndex:0];
      [v6 insertFeatureValue:v23 atIndex:0];
    }
    REReleaseFeatureValueTaggedPointer(v23);
  }
}

float __71__RERelevanceProviderEnvironment__scaleRelevanceProviderValues_values___block_invoke(float a1, float a2)
{
  float v2 = fmaxf(a2, 0.00000011921);
  if (v2 > 1.0) {
    float v2 = 1.0;
  }
  float v3 = (v2 * -2.0 + 1.0) / ((v2 + -1.0 + v2 + -1.0) * v2);
  float v4 = (float)((float)(1.0 - v3) * a1) + v3 * (a1 * a1);
  double v5 = fmax(v4, 0.0);
  if (v5 > 1.0) {
    double v5 = 1.0;
  }
  float v6 = v5;
  return (float)(v6 + a1) * 0.5;
}

- (id)featuresForRelevanceProvider:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(RERelevanceProviderEnvironment *)self _providerManagerForProvider:v4];
  float v6 = v5;
  if (v5)
  {
    id v7 = [v5 effectiveFeatures];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v4 feature];
      v19[0] = v14;
      id v15 = (void *)MEMORY[0x263EFF8C0];
      id v16 = (void **)v19;
    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Unsupported relevance provider: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v4);
      uint64_t v14 = +[REFeature featureWithName:&stru_26CFA57D0 featureType:0];
      uint64_t v18 = v14;
      id v15 = (void *)MEMORY[0x263EFF8C0];
      id v16 = &v18;
    }
    id v7 = [v15 arrayWithObjects:v16 count:1];
  }
  return v7;
}

- (id)_relevaneProviderWithType:(id)a3 withOptions:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = self->_relevanceManagers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_relevanceProviderClass"), "relevanceSimulatorID");
        char v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          float v20 = (objc_class *)[(id)objc_opt_class() _relevanceProviderClass];
LABEL_20:
          id v15 = (void *)[[v20 alloc] initWithDictionary:v7];
          goto LABEL_21;
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = self->_supportedFeatures;
  id v15 = (void *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (uint64_t j = 0; j != v15; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "name", (void)v22);
        char v19 = [v18 isEqualToString:v6];

        if (v19)
        {
          float v20 = (objc_class *)RECustomRelevanceProvider;
          goto LABEL_20;
        }
      }
      id v15 = (void *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  return v15;
}

- (id)encodeRelevaneProvider:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(RERelevanceProviderEnvironment *)self _providerManagerForProvider:v4];
  if (v5)
  {
    id v6 = [v4 dictionaryEncoding];
    id v7 = [(id)objc_opt_class() relevanceSimulatorID];
    uint64_t v8 = v7;
    if (v6 && [v7 length])
    {
      float v17 = v8;
      v18[0] = v6;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v4;
      uint64_t v11 = [v10 feature];
      uint64_t v12 = [v11 name];

      uint64_t v13 = [v10 dictionaryEncoding];

      id v15 = v12;
      uint64_t v16 = v13;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

      goto LABEL_9;
    }
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

- (id)createRelevaneProviderWithType:(id)a3 withOptions:(id)a4
{
  double v5 = [(RERelevanceProviderEnvironment *)self _relevaneProviderWithType:a3 withOptions:a4];
  if (v5 && [(RERelevanceProviderEnvironment *)self isSupportedRelevanceProvider:v5]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (REFeatureSet)supportedFeatures
{
  return self->_supportedFeatures;
}

- (NSDictionary)allProviderValues
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  float v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(NSLock *)self->_relevanceValuesLock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMapTable *)self->_relevanceValues keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [(NSMapTable *)self->_relevanceValues objectForKey:v9];
        uint64_t v11 = (void *)[v10 copy];
        [v3 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(NSLock *)self->_relevanceValuesLock unlock];
  uint64_t v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

- (RERelevanceProviderEnvironmentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RERelevanceProviderEnvironmentDelegate *)WeakRetained;
}

- (BOOL)allowsLocationUse
{
  return self->_allowsLocationUse;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_providerManagersToUpdate, 0);
  objc_storeStrong((id *)&self->_providersToUpdate, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_relevanceValuesLock, 0);
  objc_storeStrong((id *)&self->_customProviders, 0);
  objc_storeStrong((id *)&self->_relevanceValues, 0);
  objc_storeStrong((id *)&self->_dependencyGraph, 0);
  objc_storeStrong((id *)&self->_relevanceProviderSet, 0);
  objc_storeStrong((id *)&self->_relevanceHistogramMap, 0);
  objc_storeStrong((id *)&self->_relevanceClassManagerMap, 0);
  objc_storeStrong((id *)&self->_relevanceManagers, 0);
}

- (void)immediateUpdateForRelevanceProviderManager:(id)a3 completion:(id)a4
{
  providerManagersToUpdate = self->_providerManagersToUpdate;
  id v7 = a4;
  [(NSMutableSet *)providerManagersToUpdate addObject:a3];
  [(RERelevanceProviderEnvironment *)self _queue_performUpdate:v7];
}

- (void)scheduleUpdateForRelevanceProvider:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = RELogForDomain(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling imminent update for relevance provider %@", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
  {
    updateCompletionBlocks = self->_updateCompletionBlocks;
    id v10 = (void *)MEMORY[0x223C31700](v7);
    [(NSMutableArray *)updateCompletionBlocks addObject:v10];
  }
  [(NSHashTable *)self->_providersToUpdate addObject:v6];
  [(REUpNextScheduler *)self->_scheduler schedule];
}

- (void)accessHistogramForFeature:(id)a3 usingBlock:(id)a4
{
  uint64_t v9 = (void (**)(id, void *))a4;
  relevanceValuesLocuint64_t k = self->_relevanceValuesLock;
  id v7 = a3;
  [(NSLock *)relevanceValuesLock lock];
  uint64_t v8 = [(RERelevanceProviderEnvironment *)self _histogramForFeature:v7];

  if (v9 && v8) {
    v9[2](v9, v8);
  }
  [(NSLock *)self->_relevanceValuesLock unlock];
}

- (id)currentRelevanceProvidersState
{
  return self->_relevanceValues;
}

@end