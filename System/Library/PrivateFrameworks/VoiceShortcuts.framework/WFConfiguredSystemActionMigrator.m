@interface WFConfiguredSystemActionMigrator
- (BOOL)completedSystemAppMigration;
- (BOOL)isConfiguredSystemActionValid:(id)a3;
- (ICAppRegistry)appRegistry;
- (OS_dispatch_queue)queue;
- (WFConfiguredSystemActionMigrator)initWithDatabaseProvider:(id)a3 actionProvider:(id)a4;
- (WFConfiguredSystemActionProvider)actionProvider;
- (WFDatabase)database;
- (WFDatabaseProvider)databaseProvider;
- (WFDebouncer)migrationDeboucer;
- (id)updatedConfiguredSystemActionFrom:(id)a3;
- (void)appRegistry:(id)a3 installStatusChangedForApp:(id)a4;
- (void)configuredSystemActionChangedForType:(id)a3 oldAction:(id)a4 newAction:(id)a5;
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)scheduleActionMigrationWithReason:(id)a3;
- (void)scheduledActionMigrationFired;
- (void)setAppRegistry:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setMigrationDeboucer:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)updateActionsIfNeeded;
- (void)updateConfiguredSystemActionOfType:(id)a3;
@end

@implementation WFConfiguredSystemActionMigrator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_migrationDeboucer, 0);
  objc_storeStrong((id *)&self->_appRegistry, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFConfiguredSystemActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void)setMigrationDeboucer:(id)a3
{
}

- (WFDebouncer)migrationDeboucer
{
  return self->_migrationDeboucer;
}

- (void)setAppRegistry:(id)a3
{
}

- (ICAppRegistry)appRegistry
{
  return self->_appRegistry;
}

- (void)setDatabase:(id)a3
{
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)appRegistry:(id)a3 installStatusChangedForApp:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "-[WFConfiguredSystemActionMigrator appRegistry:installStatusChangedForApp:]";
    __int16 v9 = 1024;
    int v10 = [v5 isInstalled];
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Received app install state change notification, scheduling migration if needed (installed: %i).", (uint8_t *)&v7, 0x12u);
  }

  if (([v5 isInstalled] & 1) == 0) {
    [(WFConfiguredSystemActionMigrator *)self scheduleActionMigrationWithReason:@"ApplicationUninstalled"];
  }
}

- (void)configuredSystemActionChangedForType:(id)a3 oldAction:(id)a4 newAction:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = [v7 associatedBundleIdentifier];

  if (v9)
  {
    int v10 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v7 associatedBundleIdentifier];
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFConfiguredSystemActionMigrator configuredSystemActionChangedForType:oldAction:newAction:]";
      __int16 v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_INFO, "%s Deregistering from app installation state changes for %@.", buf, 0x16u);
    }
    v12 = [(WFConfiguredSystemActionMigrator *)self appRegistry];
    v13 = [v7 associatedBundleIdentifier];
    v22 = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v12 removeInstallStatusObserver:self forAppIdentifiers:v14];
  }
  v15 = [v8 associatedBundleIdentifier];

  if (v15)
  {
    v16 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = [v8 associatedBundleIdentifier];
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFConfiguredSystemActionMigrator configuredSystemActionChangedForType:oldAction:newAction:]";
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_INFO, "%s Registering for app installation state changes for %@.", buf, 0x16u);
    }
    v18 = [(WFConfiguredSystemActionMigrator *)self appRegistry];
    v19 = [v8 associatedBundleIdentifier];
    v21 = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v18 addInstallStatusObserver:self forAppIdentifiers:v20];
  }
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  if ([a4 count] || objc_msgSend(v8, "count"))
  {
    __int16 v9 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[WFConfiguredSystemActionMigrator databaseDidChange:modified:inserted:removed:]";
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s Received valid database change notification, scheduling migration.", (uint8_t *)&v10, 0xCu);
    }

    [(WFConfiguredSystemActionMigrator *)self scheduleActionMigrationWithReason:@"DatabaseChanged"];
  }
}

- (BOOL)completedSystemAppMigration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int SystemAppMigrationStatus = MobileInstallationGetSystemAppMigrationStatus();
  id v3 = 0;
  v4 = getWFStaccatoLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (SystemAppMigrationStatus)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[WFConfiguredSystemActionMigrator completedSystemAppMigration]";
      __int16 v12 = 1024;
      LODWORD(v13) = 0;
      v6 = "%s System App Migration Finished: %d";
      id v7 = v4;
      uint32_t v8 = 18;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else if (v5)
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[WFConfiguredSystemActionMigrator completedSystemAppMigration]";
    __int16 v12 = 2112;
    id v13 = v3;
    v6 = "%s Fetching System App Migration Status failed with error %@";
    id v7 = v4;
    uint32_t v8 = 22;
    goto LABEL_6;
  }

  return 0;
}

- (id)updatedConfiguredSystemActionFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(WFConfiguredSystemActionMigrator *)self databaseProvider];
    id v18 = 0;
    v6 = [v5 databaseWithError:&v18];
    id v7 = v18;

    if (v6)
    {
      id v8 = v4;
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v9 = v8;
        }
        else {
          __int16 v9 = 0;
        }
      }
      else
      {
        __int16 v9 = 0;
      }
      id v12 = v9;

      id v13 = [v12 workflowIdentifier];
      uint64_t v14 = [v6 referenceForWorkflowID:v13];

      if (v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4FB4620]);
        v16 = [v8 shortcutsMetadata];
        id v10 = (id)[v15 initWithWorkflow:v14 shortcutsMetadata:v16];
      }
      else
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4FB4618]);
      }
    }
    else
    {
      uint64_t v11 = getWFStaccatoLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[WFConfiguredSystemActionMigrator updatedConfiguredSystemActionFrom:]";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed to fetch current workflow state due to: %@", buf, 0x16u);
      }

      id v10 = v4;
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB4618]);
  }

  return v10;
}

- (BOOL)isConfiguredSystemActionValid:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![(WFConfiguredSystemActionMigrator *)self completedSystemAppMigration])
    {
      uint64_t v11 = getWFStaccatoLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        v17 = "-[WFConfiguredSystemActionMigrator isConfiguredSystemActionValid:]";
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Can't determine validity of action right now, will try again later: %@", (uint8_t *)&v16, 0x16u);
      }
      char v10 = 1;
      goto LABEL_23;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
    v6 = [v4 associatedBundleIdentifier];
    id v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];

    if (!v7)
    {
      uint64_t v11 = getWFStaccatoLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        v17 = "-[WFConfiguredSystemActionMigrator isConfiguredSystemActionValid:]";
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Current action for system action %@ needs updating due to source app being uninstalled.", (uint8_t *)&v16, 0x16u);
      }
      char v10 = 0;
      goto LABEL_23;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v9 = v8;
      }
      else {
        __int16 v9 = 0;
      }
    }
    else
    {
      __int16 v9 = 0;
    }
    uint64_t v11 = v9;

    id v12 = [(WFConfiguredSystemActionMigrator *)self updatedConfiguredSystemActionFrom:v11];
    char v13 = [v11 isEqual:v12];
    char v10 = v13 ^ 1;
    if ((v13 & 1) == 0)
    {
      uint64_t v14 = getWFStaccatoLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        v17 = "-[WFConfiguredSystemActionMigrator isConfiguredSystemActionValid:]";
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s Current action for system action %@ needs updating due to backing workflow changing.", (uint8_t *)&v16, 0x16u);
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  char v10 = 1;
LABEL_24:

  return v10;
}

- (void)updateConfiguredSystemActionOfType:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFConfiguredSystemActionMigrator *)self actionProvider];
  v6 = [v5 configuredSystemActionForActionType:v4];

  id v7 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    id v15 = "-[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:]";
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Checking whether current action for system action type: %@ needs updating: %@", (uint8_t *)&v14, 0x20u);
  }

  if (v6
    && ![(WFConfiguredSystemActionMigrator *)self isConfiguredSystemActionValid:v6])
  {
    __int16 v9 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      id v15 = "-[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Current action for system action type: %@ needs updating: %@", (uint8_t *)&v14, 0x20u);
    }

    id v8 = [(WFConfiguredSystemActionMigrator *)self updatedConfiguredSystemActionFrom:v6];
    char v10 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      id v15 = "-[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Updated action for system action type: %@ is: %@", (uint8_t *)&v14, 0x20u);
    }

    uint64_t v11 = [(WFConfiguredSystemActionMigrator *)self actionProvider];
    int v12 = [v11 saveUpdatedAction:v8 forActionType:v4];

    char v13 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      id v15 = "-[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 1024;
      LODWORD(v19) = v12;
      _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_DEFAULT, "%s Completed updating system action type: %@, success: %i", (uint8_t *)&v14, 0x1Cu);
    }
  }
  else
  {
    id v8 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      id v15 = "-[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s Current action for system action type: %@ does not need updating: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)updateActionsIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFConfiguredSystemActionMigrator *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(WFConfiguredSystemActionMigrator *)self actionProvider];
  id v5 = [v4 availableActionTypes];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:](self, "updateConfiguredSystemActionOfType:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)scheduledActionMigrationFired
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFConfiguredSystemActionMigrator *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[WFConfiguredSystemActionMigrator scheduledActionMigrationFired]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Firing system action migration check.", (uint8_t *)&v5, 0xCu);
  }

  [(WFConfiguredSystemActionMigrator *)self updateActionsIfNeeded];
}

- (void)scheduleActionMigrationWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WFConfiguredSystemActionMigrator scheduleActionMigrationWithReason:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Detected system action source change due to: %@, scheduling migration", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(WFConfiguredSystemActionMigrator *)self migrationDeboucer];
  [v6 poke];
}

- (void)stopMonitoring
{
  id v3 = [(WFConfiguredSystemActionMigrator *)self queue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(WFConfiguredSystemActionMigrator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WFConfiguredSystemActionMigrator_stopMonitoring__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __50__WFConfiguredSystemActionMigrator_stopMonitoring__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  [v2 removeObjectObserver:*(void *)(a1 + 32)];
}

- (void)startMonitoring
{
  id v3 = [(WFConfiguredSystemActionMigrator *)self queue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(WFConfiguredSystemActionMigrator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WFConfiguredSystemActionMigrator_startMonitoring__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __51__WFConfiguredSystemActionMigrator_startMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) databaseProvider];
  id v23 = 0;
  id v3 = [v2 databaseWithError:&v23];
  id v4 = v23;

  if (v3)
  {
    id v18 = v4;
    id v5 = objc_alloc(MEMORY[0x1E4FB71B8]);
    id v6 = [*(id *)(a1 + 32) queue];
    int v7 = [v5 initWithDelay:v6 queue:0.5];

    [*(id *)(a1 + 32) setMigrationDeboucer:v7];
    [v7 addTarget:*(void *)(a1 + 32) action:sel_scheduledActionMigrationFired];
    [v3 addObjectObserver:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setDatabase:v3];
    uint64_t v8 = [*(id *)(a1 + 32) actionProvider];
    __int16 v9 = [v8 availableActionTypes];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v14);
          uint64_t v16 = +[WFConfiguredSystemActionProvider sharedProvider];
          [v16 addObserver:*(void *)(a1 + 32) forActionType:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    id v17 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFConfiguredSystemActionMigrator startMonitoring]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_DEFAULT, "%s Started monitoring for changes for system actions.", buf, 0xCu);
    }

    [*(id *)(a1 + 32) scheduleActionMigrationWithReason:@"DaemonStart"];
    id v4 = v18;
  }
  else
  {
    int v7 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFConfiguredSystemActionMigrator startMonitoring]_block_invoke";
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Failed to start monitoring due to: %@", buf, 0x16u);
    }
  }
}

- (WFConfiguredSystemActionMigrator)initWithDatabaseProvider:(id)a3 actionProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFConfiguredSystemActionMigrator;
  __int16 v9 = [(WFConfiguredSystemActionMigrator *)&v18 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB7098]) initWithBackgroundRefresh:1];
    appRegistry = v9->_appRegistry;
    v9->_appRegistry = (ICAppRegistry *)v10;

    objc_storeStrong((id *)&v9->_databaseProvider, a3);
    objc_storeStrong((id *)&v9->_actionProvider, a4);
    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.shortcuts.WFConfiguredSystemActionMigrator", v13);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = v9;
  }

  return v9;
}

@end