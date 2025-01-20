@interface WFSystemSurfaceWorkflowStatusUpdater
- (OS_dispatch_queue)queue;
- (WFDatabaseProvider)databaseProvider;
- (WFSystemSurfaceWorkflowStatusRegistry)registry;
- (WFSystemSurfaceWorkflowStatusUpdater)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4;
- (id)shareSheetStateForWorkflows:(id)a3 database:(id)a4;
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)queue_startIfPossible;
- (void)queue_updateFromDatabase:(id)a3;
- (void)startIfPossible;
@end

@implementation WFSystemSurfaceWorkflowStatusUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (WFSystemSurfaceWorkflowStatusRegistry)registry
{
  return self->_registry;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  id v9 = a3;
  if (WFDatabaseChangesContainObjectType(0, a4, v10, v11, v12, v13, v14, v15, (uint64_t)a5))
  {
    v16 = [(WFSystemSurfaceWorkflowStatusUpdater *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__WFSystemSurfaceWorkflowStatusUpdater_databaseDidChange_modified_inserted_removed___block_invoke;
    block[3] = &unk_1E6541F68;
    block[4] = self;
    id v18 = v9;
    dispatch_async(v16, block);
  }
}

uint64_t __84__WFSystemSurfaceWorkflowStatusUpdater_databaseDidChange_modified_inserted_removed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_updateFromDatabase:", *(void *)(a1 + 40));
}

- (id)shareSheetStateForWorkflows:(id)a3 database:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x1C87C4C10]();
        uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithObject:@"inputClasses"];
        uint64_t v15 = [v6 recordWithDescriptor:v12 properties:v14 error:0];

        uint64_t v16 = [v15 inputClasses];
        v17 = (void *)v16;
        if (v16) {
          uint64_t v18 = v16;
        }
        else {
          uint64_t v18 = MEMORY[0x1E4F1CBF0];
        }
        v19 = [v12 identifier];
        [v7 setObject:v18 forKey:v19];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void)queue_updateFromDatabase:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFSystemSurfaceWorkflowStatusUpdater *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 sortedVisibleWorkflowsWithType:*MEMORY[0x1E4FB4FB8]];
  uint64_t v7 = [v6 count];
  uint64_t v8 = getWFGeneralLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = @"YES";
    if (!v7) {
      uint64_t v9 = @"NO";
    }
    int v17 = 136315394;
    uint64_t v18 = "-[WFSystemSurfaceWorkflowStatusUpdater queue_updateFromDatabase:]";
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_INFO, "%s Setting share sheet shortcuts present to %{public}@", (uint8_t *)&v17, 0x16u);
  }

  uint64_t v10 = [(WFSystemSurfaceWorkflowStatusUpdater *)self registry];
  uint64_t v11 = v10;
  if (v7) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  [v10 setStatus:v12 forSystemSurface:0];

  uint64_t v13 = +[WFShareSheetState shareSheetShortcuts];
  if (v7)
  {
    uint64_t v14 = [v6 descriptors];
    uint64_t v15 = [(WFSystemSurfaceWorkflowStatusUpdater *)self shareSheetStateForWorkflows:v14 database:v4];

    if (v13 && ([v15 isEqualToDictionary:v13] & 1) != 0)
    {
      +[WFShareSheetState setShareSheetShortcuts:v15];
LABEL_17:

      goto LABEL_18;
    }
    +[WFShareSheetState setShareSheetShortcuts:v15];

LABEL_14:
    uint64_t v16 = getWFGeneralLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      uint64_t v18 = "-[WFSystemSurfaceWorkflowStatusUpdater queue_updateFromDatabase:]";
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_INFO, "%s Posting share sheet workflows change notification", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v15 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v15 postNotificationName:*MEMORY[0x1E4FB4DB0] object:0];
    goto LABEL_17;
  }
  +[WFShareSheetState setShareSheetShortcuts:0];
  if (v13) {
    goto LABEL_14;
  }
LABEL_18:
}

- (void)queue_startIfPossible
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(WFSystemSurfaceWorkflowStatusUpdater *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(WFSystemSurfaceWorkflowStatusUpdater *)self databaseProvider];
  id v9 = 0;
  id v5 = [v4 databaseWithError:&v9];
  id v6 = v9;

  if (v5)
  {
    [v5 addObjectObserver:self];
    [(WFSystemSurfaceWorkflowStatusUpdater *)self queue_updateFromDatabase:v5];
  }
  else
  {
    uint64_t v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[WFSystemSurfaceWorkflowStatusUpdater queue_startIfPossible]";
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to load database, assuming no shortcuts are present to show in system surfaces: %{public}@", buf, 0x16u);
    }

    uint64_t v8 = [(WFSystemSurfaceWorkflowStatusUpdater *)self registry];
    [v8 setStatus:1 forSystemSurface:0];
  }
}

- (void)startIfPossible
{
  v3 = [(WFSystemSurfaceWorkflowStatusUpdater *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WFSystemSurfaceWorkflowStatusUpdater_startIfPossible__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__WFSystemSurfaceWorkflowStatusUpdater_startIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_startIfPossible");
}

- (WFSystemSurfaceWorkflowStatusUpdater)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFSystemSurfaceWorkflowStatusUpdater.m", 32, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)WFSystemSurfaceWorkflowStatusUpdater;
  uint64_t v10 = [(WFSystemSurfaceWorkflowStatusUpdater *)&v25 init];
  if (v10)
  {
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.shortcuts.WFSystemSurfaceWorkflowStatusUpdater", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = (WFSystemSurfaceWorkflowStatusRegistry *)objc_alloc_init(MEMORY[0x1E4FB49D0]);
    registry = v10->_registry;
    v10->_registry = v15;

    objc_storeStrong((id *)&v10->_databaseProvider, a3);
    int v17 = [(WFSystemSurfaceWorkflowStatusUpdater *)v10 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__WFSystemSurfaceWorkflowStatusUpdater_initWithDatabaseProvider_eventHandler___block_invoke;
    block[3] = &unk_1E6541F68;
    uint64_t v18 = v10;
    long long v23 = v18;
    id v24 = v9;
    dispatch_async(v17, block);

    __int16 v19 = v18;
  }

  return v10;
}

uint64_t __78__WFSystemSurfaceWorkflowStatusUpdater_initWithDatabaseProvider_eventHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_startIfPossible");
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  return [v2 addObserver:v3 selector:sel_startIfPossible name:@"com.apple.mobile.keybagd.first_unlock"];
}

@end