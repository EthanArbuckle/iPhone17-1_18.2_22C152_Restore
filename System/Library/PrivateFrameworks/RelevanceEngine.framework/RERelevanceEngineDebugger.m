@interface RERelevanceEngineDebugger
- (BOOL)_isValidEngine:(id)a3;
- (NSArray)availableEngines;
- (id)_init;
- (id)allRelevanceProviderValuesForEngine:(id)a3;
- (id)dataSourceElementsForEngine:(id)a3;
- (id)diagnosticLogsForEngine:(id)a3;
- (id)engineWithName:(id)a3;
- (id)firstEngine;
- (id)orderedElementsForEngine:(id)a3;
- (void)_registerEngine:(id)a3;
- (void)_unregisterEngine:(id)a3;
- (void)reloadDataSourceForEngine:(id)a3;
@end

@implementation RERelevanceEngineDebugger

- (NSArray)availableEngines
{
  return [(REObserverStore *)self->_observerStore allObservers];
}

- (void)_registerEngine:(id)a3
{
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)RERelevanceEngineDebugger;
  v2 = [(RESingleton *)&v8 _init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)v2[1];
    v2[1] = v3;

    uint64_t v5 = RECreateSharedQueue(@"Debugger");
    v6 = (void *)v2[2];
    v2[2] = v5;
  }
  return v2;
}

- (id)engineWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(RERelevanceEngineDebugger *)self availableEngines];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 name];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)firstEngine
{
  v2 = [(RERelevanceEngineDebugger *)self availableEngines];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (BOOL)_isValidEngine:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = RELogForDomain(13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_DEFAULT, "Object %@ isn't valid engine", (uint8_t *)&v7, 0xCu);
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (id)diagnosticLogsForEngine:(id)a3
{
  id v4 = a3;
  if ([(RERelevanceEngineDebugger *)self _isValidEngine:v4])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x3032000000;
    long long v15 = __Block_byref_object_copy__3;
    long long v16 = __Block_byref_object_dispose__3;
    id v17 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__RERelevanceEngineDebugger_diagnosticLogsForEngine___block_invoke;
    v9[3] = &unk_2644BD308;
    char v11 = &v12;
    id v6 = v5;
    v10 = v6;
    [v4 storeDiagnosticLogs:v9];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __53__RERelevanceEngineDebugger_diagnosticLogsForEngine___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reloadDataSourceForEngine:(id)a3
{
  id v5 = a3;
  if (-[RERelevanceEngineDebugger _isValidEngine:](self, "_isValidEngine:"))
  {
    id v4 = [v5 dataSourceManager];
    [v4 enumerateElementDataSourceControllers:&__block_literal_global_12];
  }
}

uint64_t __55__RERelevanceEngineDebugger_reloadDataSourceForEngine___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidateElements];
}

- (id)dataSourceElementsForEngine:(id)a3
{
  id v4 = a3;
  if ([(RERelevanceEngineDebugger *)self _isValidEngine:v4])
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    dispatch_group_t v6 = dispatch_group_create();
    id v7 = [v4 dataSourceManager];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke;
    v13[3] = &unk_2644BD350;
    dispatch_group_t v14 = v6;
    long long v15 = self;
    id v8 = v5;
    id v16 = v8;
    uint64_t v9 = v6;
    [v7 enumerateElementDataSourceControllers:v13];
    dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v10 = v16;
    id v11 = v8;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = [v3 elementOperationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke_2;
  v8[3] = &unk_2644BD040;
  uint64_t v5 = *(void *)(a1 + 40);
  dispatch_group_t v6 = *(void **)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allElements];
  id v3 = [*(id *)(a1 + 32) bundleIdentifier];
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke_3;
  v7[3] = &unk_2644BD040;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = v2;
  id v11 = *(id *)(a1 + 56);
  id v5 = v2;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  v2 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v2);
}

- (id)allRelevanceProviderValuesForEngine:(id)a3
{
  id v4 = a3;
  if ([(RERelevanceEngineDebugger *)self _isValidEngine:v4])
  {
    id v5 = [v4 coordinator];
    id v6 = [v5 elementRelevanceEngine];
    id v7 = [v6 relevanceProviderEnvironment];
    id v8 = [v7 currentRelevanceProvidersState];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)orderedElementsForEngine:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(RERelevanceEngineDebugger *)self _isValidEngine:v4])
  {
    id v5 = [MEMORY[0x263EFF980] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = [v4 configuration];
    id v7 = [v6 sectionDescriptors];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v13 = [v12 historicSectionDescriptor];
          dispatch_group_t v14 = v13;
          if (v13)
          {
            long long v15 = [v13 name];
            [v5 addObject:v15];
          }
          id v16 = [v12 name];
          [v5 addObject:v16];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v9);
    }

    id v17 = [MEMORY[0x263F089D8] string];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v5;
    uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v29 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * j);
          [v17 appendString:v19];
          [v17 appendString:@"\n"];
          if ([v4 numberOfElementsInSection:v19])
          {
            unint64_t v20 = 0;
            do
            {
              v21 = [[RESectionPath alloc] initWithSectionName:v19 element:v20];
              v22 = [v4 elementAtPath:v21];
              v23 = REDescriptionForExportedObject(v22);
              [v17 appendString:v23];

              [v17 appendString:@"\n\n"];
              ++v20;
            }
            while (v20 < [v4 numberOfElementsInSection:v19]);
          }
          [v17 appendString:@"\n\n\n\n"];
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v27);
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)_unregisterEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);
}

@end