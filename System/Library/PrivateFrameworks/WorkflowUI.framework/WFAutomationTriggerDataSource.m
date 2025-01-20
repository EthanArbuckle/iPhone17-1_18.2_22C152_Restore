@interface WFAutomationTriggerDataSource
- (NSCache)workflowCache;
- (OS_dispatch_queue)queue;
- (WFAutomationTriggerDataSource)initWithDatabase:(id)a3;
- (WFAutomationTriggerDataSourceDelegate)delegate;
- (WFDatabase)database;
- (WFDatabaseResult)personalAutomationsDatabaseResult;
- (WFHomeManager)homeManager;
- (id)allConfiguredTriggers;
- (id)allHomeTriggers;
- (id)workflowForIdentifier:(id)a3;
- (os_unfair_lock_s)cacheLock;
- (void)databaseResultDidChange:(id)a3;
- (void)dealloc;
- (void)home:(id)a3 didAddTrigger:(id)a4;
- (void)home:(id)a3 didRemoveTrigger:(id)a4;
- (void)home:(id)a3 didUpdateNameForTrigger:(id)a4;
- (void)home:(id)a3 didUpdateTrigger:(id)a4;
- (void)homeDidUpdateName:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)prewarm;
- (void)setDelegate:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setWorkflowCache:(id)a3;
@end

@implementation WFAutomationTriggerDataSource

- (void)setDelegate:(id)a3
{
}

void __40__WFAutomationTriggerDataSource_prewarm__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allConfiguredTriggers];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__WFAutomationTriggerDataSource_prewarm__block_invoke_2;
  v3[3] = &unk_2649CB8D0;
  v3[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v3];
}

- (id)allConfiguredTriggers
{
  v3 = [(WFAutomationTriggerDataSource *)self personalAutomationsDatabaseResult];
  [v3 reset];

  v4 = [(WFAutomationTriggerDataSource *)self personalAutomationsDatabaseResult];
  v5 = [v4 descriptors];

  return v5;
}

- (WFDatabaseResult)personalAutomationsDatabaseResult
{
  personalAutomationsDatabaseResult = self->_personalAutomationsDatabaseResult;
  if (!personalAutomationsDatabaseResult)
  {
    v4 = [(WFAutomationTriggerDataSource *)self database];
    v5 = [v4 allConfiguredTriggers];
    v6 = self->_personalAutomationsDatabaseResult;
    self->_personalAutomationsDatabaseResult = v5;

    [(WFDatabaseResult *)self->_personalAutomationsDatabaseResult registerObserver:self];
    personalAutomationsDatabaseResult = self->_personalAutomationsDatabaseResult;
  }
  return personalAutomationsDatabaseResult;
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)prewarm
{
  v3 = [(WFAutomationTriggerDataSource *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__WFAutomationTriggerDataSource_prewarm__block_invoke;
  block[3] = &unk_2649CBF20;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFAutomationTriggerDataSource)initWithDatabase:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFAutomationTriggerDataSource;
  v6 = [(WFAutomationTriggerDataSource *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    uint64_t v8 = [MEMORY[0x263F86C08] sharedManager];
    homeManager = v7->_homeManager;
    v7->_homeManager = (WFHomeManager *)v8;

    [(WFHomeManager *)v7->_homeManager addEventObserver:v7];
    v7->_cacheLock._os_unfair_lock_opaque = 0;
    uint64_t v10 = objc_opt_new();
    workflowCache = v7->_workflowCache;
    v7->_workflowCache = (NSCache *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.shortcuts.WFAutomationTriggerDataSource", v13);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v14;

    v16 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workflowCache, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personalAutomationsDatabaseResult, 0);
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setWorkflowCache:(id)a3
{
}

- (NSCache)workflowCache
{
  return self->_workflowCache;
}

- (void)setHomeManager:(id)a3
{
}

- (WFHomeManager)homeManager
{
  return self->_homeManager;
}

- (WFAutomationTriggerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFAutomationTriggerDataSourceDelegate *)WeakRetained;
}

- (void)dealloc
{
  v3 = [(WFAutomationTriggerDataSource *)self homeManager];
  [v3 removeEventObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WFAutomationTriggerDataSource;
  [(WFAutomationTriggerDataSource *)&v4 dealloc];
}

- (void)databaseResultDidChange:(id)a3
{
  id v4 = [(WFAutomationTriggerDataSource *)self delegate];
  [v4 dataSourceDidUpdateTriggers:self];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = [(WFAutomationTriggerDataSource *)self delegate];
  [v4 dataSourceDidUpdateTriggers:self];
}

- (void)home:(id)a3 didUpdateTrigger:(id)a4
{
  id v5 = [(WFAutomationTriggerDataSource *)self delegate];
  [v5 dataSourceDidUpdateTriggers:self];
}

- (void)home:(id)a3 didUpdateNameForTrigger:(id)a4
{
  id v5 = [(WFAutomationTriggerDataSource *)self delegate];
  [v5 dataSourceDidUpdateTriggers:self];
}

- (void)home:(id)a3 didRemoveTrigger:(id)a4
{
  id v5 = [(WFAutomationTriggerDataSource *)self delegate];
  [v5 dataSourceDidUpdateTriggers:self];
}

- (void)home:(id)a3 didAddTrigger:(id)a4
{
  id v5 = [(WFAutomationTriggerDataSource *)self delegate];
  [v5 dataSourceDidUpdateTriggers:self];
}

- (void)homeDidUpdateName:(id)a3
{
  id v4 = [(WFAutomationTriggerDataSource *)self delegate];
  [v4 dataSourceDidUpdateTriggers:self];
}

- (id)allHomeTriggers
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = [(WFAutomationTriggerDataSource *)self homeManager];
  v3 = [v2 homes];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_15121];

  id v22 = (id)objc_opt_new();
  HomeLibrary();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v4;
  uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v27 setDelegate:self];
        v28 = objc_opt_new();
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v5 = [v27 triggers];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v6; ++j)
            {
              if (*(void *)v30 != v7) {
                objc_enumerationMutation(v5);
              }
              v9 = *(id *)(*((void *)&v29 + 1) + 8 * j);
              uint64_t v10 = v9;
              if (v9 && ([v9 conformsToProtocol:&unk_26E252D50] & 1) != 0)
              {
                if ([v10 hf_shouldDisplayTrigger])
                {
                  uint64_t v11 = [v10 hf_triggerType];
                  if (v11 != 7 && v11 != 0)
                  {
                    uint64_t v37 = 0;
                    v38 = &v37;
                    uint64_t v39 = 0x2050000000;
                    v17 = (void *)getHFTriggerItemClass_softClass;
                    uint64_t v40 = getHFTriggerItemClass_softClass;
                    if (!getHFTriggerItemClass_softClass)
                    {
                      *(void *)buf = MEMORY[0x263EF8330];
                      *(void *)&buf[8] = 3221225472;
                      *(void *)&buf[16] = __getHFTriggerItemClass_block_invoke;
                      v44 = &unk_2649CC0B8;
                      v45 = &v37;
                      __getHFTriggerItemClass_block_invoke((uint64_t)buf);
                      v17 = (void *)v38[3];
                    }
                    objc_super v18 = v17;
                    _Block_object_dispose(&v37, 8);
                    v19 = (void *)[[v18 alloc] initWithHome:v27 trigger:v10];
                    [v28 addObject:v19];

                    goto LABEL_30;
                  }
                  v13 = getWFTriggersLogObject();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&buf[4] = "-[WFAutomationTriggerDataSource allHomeTriggers]";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v10;
                    _os_log_impl(&dword_22D994000, v13, OS_LOG_TYPE_DEFAULT, "%s Ignoring trigger of unknown or placeholder type: %@", buf, 0x16u);
                  }
                }
                else
                {
                  v13 = getWFTriggersLogObject();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&buf[4] = "-[WFAutomationTriggerDataSource allHomeTriggers]";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v10;
                    _os_log_impl(&dword_22D994000, v13, OS_LOG_TYPE_DEFAULT, "%s Ignoring non-visible trigger: %@", buf, 0x16u);
                  }
                }

LABEL_30:
                dispatch_queue_t v14 = v10;
                goto LABEL_31;
              }

              dispatch_queue_t v14 = getWFTriggersLogObject();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                v15 = objc_opt_class();
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "-[WFAutomationTriggerDataSource allHomeTriggers]";
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v15;
                id v16 = v15;
                _os_log_impl(&dword_22D994000, v14, OS_LOG_TYPE_DEFAULT, "%s Ignoring Home trigger that isn't HFTriggerProtocol: %{public}@", buf, 0x16u);
              }
LABEL_31:
            }
            uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v41 count:16];
          }
          while (v6);
        }

        [v28 sortUsingComparator:&__block_literal_global_224];
        if ([v28 count]) {
          [v22 addObject:v28];
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v25);
  }

  return v22;
}

uint64_t __48__WFAutomationTriggerDataSource_allHomeTriggers__block_invoke_221(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = objc_alloc((Class)getHFTriggerUISummaryClass_15127());
  uint64_t v7 = [v5 trigger];
  uint64_t v8 = [v5 home];

  v9 = (void *)[v6 initWithTrigger:v7 inHome:v8 forceDisabled:0];
  id v10 = objc_alloc((Class)getHFTriggerUISummaryClass_15127());
  uint64_t v11 = [v4 trigger];
  v12 = [v4 home];

  v13 = (void *)[v10 initWithTrigger:v11 inHome:v12 forceDisabled:0];
  dispatch_queue_t v14 = [v9 triggerDisplayTitle];
  v15 = [v13 triggerDisplayTitle];
  uint64_t v16 = [v14 localizedStandardCompare:v15];

  return v16;
}

uint64_t __48__WFAutomationTriggerDataSource_allHomeTriggers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)workflowForIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    id v6 = [(WFAutomationTriggerDataSource *)self workflowCache];
    uint64_t v7 = [v6 objectForKey:v4];

    if (v7)
    {
      uint64_t v8 = [(WFAutomationTriggerDataSource *)self workflowCache];
      v9 = [v8 objectForKey:v4];
    }
    else
    {
      id v10 = [(WFAutomationTriggerDataSource *)self database];
      uint64_t v8 = [v10 referenceForWorkflowID:v4];

      uint64_t v11 = (void *)MEMORY[0x263F86FF8];
      v12 = [(WFAutomationTriggerDataSource *)self database];
      id v16 = 0;
      v9 = [v11 workflowWithReference:v8 database:v12 error:&v16];
      id v13 = v16;

      if (v9)
      {
        dispatch_queue_t v14 = [(WFAutomationTriggerDataSource *)self workflowCache];
        [v14 setObject:v9 forKey:v4];
      }
      else
      {
        dispatch_queue_t v14 = getWFTriggersLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          objc_super v18 = "-[WFAutomationTriggerDataSource workflowForIdentifier:]";
          __int16 v19 = 2112;
          id v20 = v4;
          __int16 v21 = 2114;
          id v22 = v13;
          _os_log_impl(&dword_22D994000, v14, OS_LOG_TYPE_ERROR, "%s Failed to fetch workflow (%@): %{public}@", buf, 0x20u);
        }
      }
    }
    os_unfair_lock_unlock(p_cacheLock);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __40__WFAutomationTriggerDataSource_prewarm__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 workflowID];
  id v3 = (id)[v2 workflowForIdentifier:v4];
}

@end