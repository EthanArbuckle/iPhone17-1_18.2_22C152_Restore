@interface WFContextualActionSpotlightSyncService
+ (BOOL)didCompleteAppShortcutDomainMigration;
+ (int64_t)contextualActionsIndexVersion;
+ (void)setContextualActionsIndexVersion:(int64_t)a3;
+ (void)setDidCompleteAppShortcutDomainMigration;
- (BPSSink)focusModeSink;
- (CSSearchableIndex)index;
- (MTAlarmDataSource)alarmDataSource;
- (OS_dispatch_queue)queue;
- (OS_os_activity)activity;
- (SwiftVCDaemonXPCEventHandler)eventHandler;
- (VCDaemonDatabaseProvider)databaseProvider;
- (WFContextualActionSpotlightSyncService)initWithEventHandler:(id)a3 databaseProvider:(id)a4;
- (WFDatabaseResult)folderDatabaseResult;
- (unint64_t)appShortcutBatchSize;
- (void)applicationWasRegistered:(id)a3;
- (void)availableActivitiesDidChangeForManager:(id)a3;
- (void)cellularSettingsUpdated;
- (void)dataSourceDidReload:(id)a3;
- (void)databaseResultDidChange:(id)a3;
- (void)dealloc;
- (void)indexAppShortcutsForBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)migrateAppShortcutsAndReindexAllItemsIfNeeded;
- (void)queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:(id)a3 identifiers:(id)a4 batchSize:(unint64_t)a5 fetcher:(id)a6 completionBlock:(id)a7;
- (void)queue_getAlarmContextualActionsWithCompletionHandler:(id)a3;
- (void)queue_getAppShortcutContextualActionsForBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)queue_getFocusModeContextualActionsWithCompletionHandler:(id)a3;
- (void)queue_getFolderAppEntityContextualActionsWithCompletionHandler:(id)a3;
- (void)queue_getStaticContextualActionsWithCompletionHandler:(id)a3;
- (void)queue_getToggleSettingContextualActionsWithCompletionHandler:(id)a3;
- (void)queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler:(id)a3;
- (void)receiveAutoShortcutsUpdatedNotification:(id)a3;
- (void)reindexAllSearchableItemsIfNeeded:(BOOL)a3;
- (void)reindexAllSearchableItemsWithCompletion:(id)a3;
- (void)reindexSearchableItems:(unint64_t)a3;
- (void)reindexSearchableItems:(unint64_t)a3 appShortcutBundleIdentifiers:(id)a4 completion:(id)a5;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)setAlarmDataSource:(id)a3;
- (void)setDatabaseProvider:(id)a3;
- (void)spotlightPreferencesChanged;
- (void)start;
- (void)systemLanguageUpdated;
@end

@implementation WFContextualActionSpotlightSyncService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderDatabaseResult, 0);
  objc_storeStrong((id *)&self->_alarmDataSource, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_focusModeSink, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

- (WFDatabaseResult)folderDatabaseResult
{
  return self->_folderDatabaseResult;
}

- (void)setAlarmDataSource:(id)a3
{
}

- (MTAlarmDataSource)alarmDataSource
{
  return self->_alarmDataSource;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (BPSSink)focusModeSink
{
  return self->_focusModeSink;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDatabaseProvider:(id)a3
{
}

- (VCDaemonDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void)spotlightPreferencesChanged
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[WFContextualActionSpotlightSyncService spotlightPreferencesChanged]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Spotlight preferences updated, triggering App Shortcut sync", (uint8_t *)&v4, 0xCu);
  }

  [(WFContextualActionSpotlightSyncService *)self reindexSearchableItems:4];
}

- (void)cellularSettingsUpdated
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[WFContextualActionSpotlightSyncService cellularSettingsUpdated]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Cellular settings updated, triggering toggle sync", (uint8_t *)&v4, 0xCu);
  }

  [(WFContextualActionSpotlightSyncService *)self reindexSearchableItems:8];
}

- (void)systemLanguageUpdated
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[WFContextualActionSpotlightSyncService systemLanguageUpdated]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s System language updated, triggering full reindex", (uint8_t *)&v4, 0xCu);
  }

  [(WFContextualActionSpotlightSyncService *)self reindexAllSearchableItemsWithCompletion:&__block_literal_global_330];
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[WFContextualActionSpotlightSyncService searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s CSSearchableIndex requested index of items: %@", buf, 0x16u);
  }

  v10 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[WFContextualActionSpotlightSyncService searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:]";
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_INFO, "%s Sync service doesn't support reindexing individual items, triggering full reindex", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __119__WFContextualActionSpotlightSyncService_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke;
  v12[3] = &unk_1E6541968;
  id v13 = v8;
  id v11 = v8;
  [(WFContextualActionSpotlightSyncService *)self reindexAllSearchableItemsWithCompletion:v12];
}

uint64_t __119__WFContextualActionSpotlightSyncService_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[WFContextualActionSpotlightSyncService searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:]";
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s CSSearchableIndex requested full reindex", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__WFContextualActionSpotlightSyncService_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke;
  v8[3] = &unk_1E6541968;
  id v9 = v5;
  id v7 = v5;
  [(WFContextualActionSpotlightSyncService *)self reindexAllSearchableItemsWithCompletion:v8];
}

uint64_t __110__WFContextualActionSpotlightSyncService_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dataSourceDidReload:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[WFContextualActionSpotlightSyncService dataSourceDidReload:]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Alarm data source reloaded, triggering re-index", (uint8_t *)&v5, 0xCu);
  }

  [(WFContextualActionSpotlightSyncService *)self reindexSearchableItems:16];
}

- (void)receiveAutoShortcutsUpdatedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[WFContextualActionSpotlightSyncService receiveAutoShortcutsUpdatedNotification:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s App Shortcuts updated, triggering re-index", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F72830]];

  [(WFContextualActionSpotlightSyncService *)self reindexSearchableItems:4 appShortcutBundleIdentifiers:v7 completion:0];
}

- (void)applicationWasRegistered:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"isPlaceholder"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  char v9 = [v8 BOOLValue];
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [v4 userInfo];
    id v11 = [v10 objectForKeyedSubscript:@"bundleIDs"];

    if (v11)
    {
      objc_opt_class();
      uint64_t v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    int v14 = [v13 containsObject:*MEMORY[0x1E4FB4BE8]];
    if (v14)
    {
      v15 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315138;
        id v17 = "-[WFContextualActionSpotlightSyncService applicationWasRegistered:]";
        _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s Shortcuts app installed, triggering force sync", (uint8_t *)&v16, 0xCu);
      }

      [(WFContextualActionSpotlightSyncService *)self reindexAllSearchableItemsIfNeeded:1];
    }
  }
}

- (void)databaseResultDidChange:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[WFContextualActionSpotlightSyncService databaseResultDidChange:]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Collections changed, triggering resync of folder entities", (uint8_t *)&v5, 0xCu);
  }

  [(WFContextualActionSpotlightSyncService *)self reindexSearchableItems:32];
}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[WFContextualActionSpotlightSyncService availableActivitiesDidChangeForManager:]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Available focus modes changes, triggering re-index", (uint8_t *)&v5, 0xCu);
  }

  [(WFContextualActionSpotlightSyncService *)self reindexSearchableItems:2];
}

- (void)queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  int v5 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  uint64_t v6 = [v5 valueForKey:*MEMORY[0x1E4FB7470]];

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    uint64_t v7 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[WFContextualActionSpotlightSyncService queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler:]";
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Device is using old domain identifiers for contextual actions. Wiping the index.", buf, 0xCu);
    }

    id v8 = [(WFContextualActionSpotlightSyncService *)self index];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __114__WFContextualActionSpotlightSyncService_queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E6541940;
    v9[4] = self;
    uint64_t v10 = v4;
    [v8 deleteAllSearchableItemsWithCompletionHandler:v9];
  }
}

void __114__WFContextualActionSpotlightSyncService_queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __114__WFContextualActionSpotlightSyncService_queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E6541728;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __114__WFContextualActionSpotlightSyncService_queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
  else
  {
    id v4 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[WFContextualActionSpotlightSyncService queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHand"
           "ler:]_block_invoke_2";
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Wiped index!", (uint8_t *)&v6, 0xCu);
    }

    id v5 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
    [v5 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4FB7470]];

    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFContextualActionSpotlightSyncService *)self queue];
  dispatch_assert_queue_V2(v8);

  char v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v10 = [v9 localeIdentifier];

  id v11 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_INFO, "%s Fetching app shortcuts for apps...", buf, 0xCu);
  }

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB70F0]) initWithAppShortcutsDenyListEnvironment:2 environment:2];
  id v32 = 0;
  uint64_t v13 = [v12 fetchAppShortcutsForBundleIdentifiers:v6 localeIdentifier:v10 error:&v32];
  id v14 = v32;
  if (!v14)
  {
    if (v6)
    {
      id v17 = v6;
      uint64_t v18 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
        __int16 v35 = 2112;
        id v36 = v17;
        v19 = "%s Indexing app shortcuts for bundle identifiers: %@";
        v20 = v18;
        uint32_t v21 = 22;
LABEL_12:
        _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
      }
    }
    else
    {
      id v17 = [v13 allKeys];
      uint64_t v18 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
        v19 = "%s Indexing app shortcuts for all apps";
        v20 = v18;
        uint32_t v21 = 12;
        goto LABEL_12;
      }
    }

    v22 = objc_opt_new();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_315;
    v27[3] = &unk_1E6541918;
    v27[4] = self;
    id v28 = v13;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_319;
    v24[3] = &unk_1E65418A0;
    v24[4] = self;
    id v25 = v22;
    id v26 = v7;
    id v23 = v22;
    objc_msgSend(v17, "if_flatMapAsynchronously:completionHandler:", v27, v24);

    goto LABEL_14;
  }
  v15 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
    __int16 v35 = 2112;
    id v36 = v14;
    _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to get App Shortcuts: %@", buf, 0x16u);
  }

  int v16 = [(WFContextualActionSpotlightSyncService *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E6541728;
  id v31 = v7;
  id v30 = v14;
  dispatch_async(v16, block);

  id v17 = v31;
LABEL_14:
}

uint64_t __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_315(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = +[WFSpotlightSettingsClient shared];
  char v9 = [v8 isSpotlightEnabledForBundleIdentifier:v6];

  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
    id v11 = objc_opt_new();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2;
    v16[3] = &unk_1E65418F0;
    id v17 = v11;
    id v12 = v11;
    uint64_t v13 = objc_msgSend(v10, "if_compactMap:", v16);
    v7[2](v7, v13, 0);
  }
  else
  {
    id v14 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v21 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:complet"
            "ionHandler:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_INFO, "%s App shortcuts are disabled for Spotlight for %@", buf, 0x16u);
    }

    v15 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_317;
    block[3] = &unk_1E65417D8;
    v19 = v7;
    dispatch_async(v15, block);

    uint64_t v10 = v19;
  }
}

void __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_319(id *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    if ([a1[5] count])
    {
      id v7 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        id v8 = a1[5];
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:compl"
              "etionHandler:]_block_invoke_2";
        __int16 v30 = 2112;
        uint64_t v31 = (uint64_t)v8;
        _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_FAULT, "%s Looks like we've skipped indexing app shortcuts from app %@ into the index, check the logs for more information", buf, 0x16u);
      }
    }
    char v9 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v5 count];
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:complet"
            "ionHandler:]_block_invoke";
      __int16 v30 = 2048;
      uint64_t v31 = v10;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s %lu app shortcuts found.", buf, 0x16u);
    }

    id v11 = [MEMORY[0x1E4FB45A8] autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:v5];
    id v12 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v11 count];
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:complet"
            "ionHandler:]_block_invoke";
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_INFO, "%s Eligibility marked %lu app shortcut actions.", buf, 0x16u);
    }

    id v14 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_321;
    block[3] = &unk_1E6541F40;
    id v15 = a1[6];
    id v23 = v6;
    id v24 = v15;
    id v22 = v11;
    id v16 = v6;
    id v17 = v11;
    dispatch_async(v14, block);
  }
  else
  {
    uint64_t v18 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:complet"
            "ionHandler:]_block_invoke";
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v6;
      _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_ERROR, "%s Error generating contextual actions from app shortcuts: %@", buf, 0x16u);
    }

    v19 = [a1[4] queue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_320;
    v25[3] = &unk_1E6541728;
    id v20 = a1[6];
    id v26 = v6;
    id v27 = v20;
    id v17 = v6;
    dispatch_async(v19, v25);

    id v16 = v27;
  }
}

uint64_t __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_320(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_321(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_317(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __120__WFContextualActionSpotlightSyncService_queue_v2GetAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4FB45A8];
  id v6 = a2;
  id v7 = (void *)[[v5 alloc] initWithExecutableAppShortcut:v6 index:a3];

  id v8 = *(void **)(a1 + 32);
  char v9 = [v7 uniqueIdentifier];
  LODWORD(v8) = [v8 containsObject:v9];

  if (v8)
  {
    uint64_t v10 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[WFContextualActionSpotlightSyncService queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:complet"
            "ionHandler:]_block_invoke_2";
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Found actions with duplicate identifiers that would override themselves. Filtering out duplicate entry.", (uint8_t *)&v15, 0xCu);
    }

    id v11 = 0;
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v7 uniqueIdentifier];
    [v12 addObject:v13];

    id v11 = v7;
  }

  return v11;
}

- (void)queue_getAppShortcutContextualActionsForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFContextualActionSpotlightSyncService *)self queue];
  dispatch_assert_queue_V2(v8);

  char v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v10 = [v9 localeIdentifier];

  id v11 = WFInstalledAppsEnumerator();
  id v12 = [v11 allObjects];

  if ([v12 count])
  {
    uint64_t v13 = [(WFContextualActionSpotlightSyncService *)self databaseProvider];
    id v28 = 0;
    id v14 = [v13 databaseWithError:&v28];
    id v15 = v28;

    id v16 = getWFSpotlightSyncLogObject();
    uint64_t v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v32 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_INFO, "%s Fetching app shortcuts for apps...", buf, 0xCu);
      }

      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F72B48]) initWithOptions:2];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_296;
      v21[3] = &unk_1E65418C8;
      v21[4] = self;
      id v24 = v7;
      id v22 = v6;
      id v23 = v14;
      [v18 autoShortcutsForLocaleIdentifier:v10 completion:v21];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completionHandler:]";
        __int16 v33 = 2112;
        id v34 = v15;
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_ERROR, "%s Failed to access the Shortcuts database, can't check whether app shortcuts should or should not be in Spotlight: %@", buf, 0x16u);
      }

      id v20 = [(WFContextualActionSpotlightSyncService *)self queue];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_294;
      v25[3] = &unk_1E6541728;
      id v27 = v7;
      id v26 = v15;
      dispatch_async(v20, v25);

      uint64_t v18 = v27;
    }
  }
  else
  {
    v19 = [(WFContextualActionSpotlightSyncService *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke;
    block[3] = &unk_1E65417D8;
    id v30 = v7;
    dispatch_async(v19, block);

    id v15 = v30;
  }
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_294(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_296(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      id v8 = v7;
      char v9 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        __int16 v33 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke_2";
        __int16 v34 = 2112;
        id v35 = v10;
        id v11 = "%s Indexing app shortcuts for bundle identifiers: %@";
        id v12 = v9;
        uint32_t v13 = 22;
LABEL_10:
        _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
      }
    }
    else
    {
      id v8 = [v5 allKeys];
      char v9 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v33 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke";
        id v11 = "%s Indexing app shortcuts for all apps";
        id v12 = v9;
        uint32_t v13 = 12;
        goto LABEL_10;
      }
    }

    id v16 = objc_opt_new();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_299;
    v24[3] = &unk_1E6541878;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 32);
    id v25 = v17;
    uint64_t v26 = v18;
    id v27 = v16;
    id v28 = v5;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_310;
    v21[3] = &unk_1E65418A0;
    v21[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 56);
    id v22 = v27;
    id v23 = v19;
    id v20 = v27;
    objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", v24, v21);

    goto LABEL_12;
  }
  id v14 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completionH"
          "andler:]_block_invoke";
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get app shortcuts: %@", buf, 0x16u);
  }

  id v15 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_297;
  block[3] = &unk_1E6541728;
  id v31 = *(id *)(a1 + 56);
  id v30 = v6;
  dispatch_async(v15, block);

  id v8 = v31;
LABEL_12:
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_297(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_299(id *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = a1[4];
  id v37 = 0;
  char v9 = [v8 isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:v6 error:&v37];
  id v10 = v37;
  if (v10)
  {
    id v11 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdenti"
                           "fiers:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      id v39 = v10;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Error retrieving the app shortcuts preference for Spotlight for %@: %@", buf, 0x20u);
    }

    id v12 = [a1[5] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_300;
    block[3] = &unk_1E6541538;
    id v33 = a1[6];
    id v34 = v6;
    id v36 = v7;
    id v35 = v10;
    dispatch_async(v12, block);

    uint32_t v13 = &v33;
LABEL_10:
    id v14 = *v13;
    goto LABEL_11;
  }
  if ((v9 & 1) == 0)
  {
    uint64_t v18 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdenti"
                           "fiers:completionHandler:]_block_invoke_2";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_INFO, "%s App shortcuts are disabled for Spotlight for %@", buf, 0x16u);
    }

    id v19 = [a1[5] queue];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_301;
    v29[3] = &unk_1E6541728;
    id v30 = 0;
    id v31 = v7;
    dispatch_async(v19, v29);

    uint32_t v13 = &v31;
    goto LABEL_10;
  }
  id v14 = [a1[7] objectForKeyedSubscript:v6];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v39 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2;
  v24[3] = &unk_1E6541800;
  id v25 = a1[4];
  id v26 = 0;
  id v15 = a1[6];
  id v27 = a1[5];
  id v28 = v15;
  id v16 = objc_msgSend(v14, "if_objectsPassingTest:", v24);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_305;
  v20[3] = &unk_1E6541850;
  id v21 = v6;
  id v23 = buf;
  id v22 = a1[4];
  id v17 = objc_msgSend(v16, "if_flatMap:", v20);

  (*((void (**)(id, void *, void))v7 + 2))(v7, v17, 0);
  _Block_object_dispose(buf, 8);
LABEL_11:
}

void __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_310(id *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    if ([a1[5] count])
    {
      id v7 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        id v8 = a1[5];
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke_2";
        __int16 v30 = 2112;
        uint64_t v31 = (uint64_t)v8;
        _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_FAULT, "%s Looks like we've skipped indexing app shortcuts from app %@ into the index, check the logs for more information", buf, 0x16u);
      }
    }
    char v9 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v5 count];
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completio"
            "nHandler:]_block_invoke";
      __int16 v30 = 2048;
      uint64_t v31 = v10;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s %lu app shortcuts found.", buf, 0x16u);
    }

    id v11 = [MEMORY[0x1E4FB45A8] autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:v5];
    id v12 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v11 count];
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completio"
            "nHandler:]_block_invoke";
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_INFO, "%s Eligibility marked %lu app shortcut actions.", buf, 0x16u);
    }

    id v14 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_312;
    block[3] = &unk_1E6541F40;
    id v15 = a1[6];
    id v23 = v6;
    id v24 = v15;
    id v22 = v11;
    id v16 = v6;
    id v17 = v11;
    dispatch_async(v14, block);
  }
  else
  {
    uint64_t v18 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completio"
            "nHandler:]_block_invoke";
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v6;
      _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_ERROR, "%s Error generating contextual actions from app shortcuts: %@", buf, 0x16u);
    }

    id v19 = [a1[4] queue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_311;
    v25[3] = &unk_1E6541728;
    id v20 = a1[6];
    id v26 = v6;
    id v27 = v20;
    id v17 = v6;
    dispatch_async(v19, v25);

    id v16 = v27;
  }
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_311(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_312(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_300(uint64_t a1)
{
  [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_301(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 attributionBundleIdentifier];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [v3 attributionBundleIdentifier];
    id v7 = *(void **)(a1 + 32);
    id v20 = 0;
    char v8 = [v7 isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:v6 error:&v20];
    id v9 = v20;
    if (v9)
    {
      uint64_t v10 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        id v22 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke_2";
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Error retrieving the app shortcuts preference for Spotlight for %@: %@", buf, 0x20u);
      }

      id v12 = [*(id *)(a1 + 48) queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_302;
      block[3] = &unk_1E6541F68;
      uint64_t v18 = *(id *)(a1 + 56);
      id v19 = v6;
      dispatch_async(v12, block);

      uint64_t v13 = v18;
LABEL_6:

      uint64_t v14 = 0;
      goto LABEL_7;
    }
    if ((v8 & 1) == 0)
    {
      uint64_t v13 = getWFSpotlightSyncLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v22 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:complet"
              "ionHandler:]_block_invoke_2";
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_INFO, "%s App shortcuts are disabled for Spotlight for %@", buf, 0x16u);
      }
      goto LABEL_6;
    }
  }
  if ([MEMORY[0x1E4FB4590] isAppShortcutDenyListed:v3 inEnvironment:2])
  {
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  id v6 = getWFSpotlightSyncLogObject();
  uint64_t v14 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v16 = [v3 actionIdentifier];
    *(_DWORD *)buf = 136315394;
    id v22 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completionH"
          "andler:]_block_invoke";
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s App Shortcut action %@ is deny listed, skipping", buf, 0x16u);
  }
LABEL_7:

LABEL_12:
  return v14;
}

id __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_305(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4FB45A8] allActionsForAutoShortcut:a2 bundleIdentifier:*(void *)(a1 + 32) startIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  char v8 = __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2_306;
  id v9 = &unk_1E6541828;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "if_objectsPassingTest:", &v6);

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += objc_msgSend(v4, "count", v6, v7, v8, v9);
  return v4;
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_2_306(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 phrase];
  uint64_t v5 = [v4 signature];

  int v6 = [*(id *)(a1 + 32) isAutoShortcutDisabledForBundleIdentifier:*(void *)(a1 + 40) autoShortcutIdentifier:v5];
  if (v6)
  {
    uint64_t v7 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      char v8 = [v3 uniqueIdentifier];
      int v10 = 136315394;
      id v11 = "-[WFContextualActionSpotlightSyncService queue_getAppShortcutContextualActionsForBundleIdentifiers:completio"
            "nHandler:]_block_invoke_2";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_INFO, "%s App shortcut %@ is disabled", (uint8_t *)&v10, 0x16u);
    }
  }

  return v6 ^ 1u;
}

uint64_t __118__WFContextualActionSpotlightSyncService_queue_getAppShortcutContextualActionsForBundleIdentifiers_completionHandler___block_invoke_302(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

- (void)indexAppShortcutsForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    char v8 = objc_msgSend(v6, "if_map:", &__block_literal_global_286);
  }
  else
  {
    id v9 = WFInstalledAppsEnumerator();
    int v10 = [v9 allObjects];

    char v8 = objc_msgSend(v10, "if_map:", &__block_literal_global_289);
  }
  unint64_t v11 = [(WFContextualActionSpotlightSyncService *)self appShortcutBatchSize];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__WFContextualActionSpotlightSyncService_indexAppShortcutsForBundleIdentifiers_completionHandler___block_invoke_3;
  v13[3] = &unk_1E65417B0;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [(WFContextualActionSpotlightSyncService *)self queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:@"app shortcuts" identifiers:v8 batchSize:v11 fetcher:v13 completionBlock:v7];
}

uint64_t __98__WFContextualActionSpotlightSyncService_indexAppShortcutsForBundleIdentifiers_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_v2GetAppShortcutContextualActionsForBundleIdentifiers:completionHandler:", *(void *)(a1 + 40), a2);
}

id __98__WFContextualActionSpotlightSyncService_indexAppShortcutsForBundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB45A8];
  id v3 = [a2 bundleIdentifier];
  id v4 = [v2 spotlightDomainIdentifierForBundleIdentifier:v3];

  return v4;
}

uint64_t __98__WFContextualActionSpotlightSyncService_indexAppShortcutsForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB45A8] spotlightDomainIdentifierForBundleIdentifier:a2];
}

- (unint64_t)appShortcutBatchSize
{
  return -1;
}

- (void)queue_getFolderAppEntityContextualActionsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(WFContextualActionSpotlightSyncService *)self folderDatabaseResult];
  id v7 = [v5 descriptors];

  id v6 = objc_msgSend(v7, "if_map:", &__block_literal_global_283);
  v4[2](v4, v6, 0);
}

_TtC14VoiceShortcuts27WFAppEntityContextualAction *__105__WFContextualActionSpotlightSyncService_queue_getFolderAppEntityContextualActionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [_TtC14VoiceShortcuts27WFAppEntityContextualAction alloc];
  id v4 = [v2 identifier];
  uint64_t v5 = [v2 name];

  id v6 = [(WFAppEntityContextualAction *)v3 initWithIdentifier:v4 displayTitle:v5 entityType:0];
  return v6;
}

- (void)queue_getAlarmContextualActionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFContextualActionSpotlightSyncService *)self queue];
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__WFContextualActionSpotlightSyncService_queue_getAlarmContextualActionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6541728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __95__WFContextualActionSpotlightSyncService_queue_getAlarmContextualActionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  id v2 = [*(id *)(a1 + 32) alarmDataSource];
  uint64_t v3 = [v2 numberOfAlarms];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = [*(id *)(v1 + 32) alarmDataSource];
      id v7 = [v6 alarmAtRow:v5];

      id v20 = v7;
      id v8 = [v7 intentAlarm];
      id v21 = objc_alloc_init(MEMORY[0x1E4F30520]);
      id v9 = [v21 encodeObject:v8];
      id v10 = objc_alloc(MEMORY[0x1E4FB49E8]);
      unint64_t v11 = [v7 alarmID];
      [v11 UUIDString];
      uint64_t v12 = v3;
      v14 = uint64_t v13 = v1;
      id v15 = [v8 displayString];
      id v16 = (void *)[v10 initWithAlarmIdentifier:v14 alarmName:v15 alarmData:v9 operation:2];

      uint64_t v1 = v13;
      uint64_t v3 = v12;

      [v4 addObject:v16];
      ++v5;
    }
    while (v12 != v5);
  }
  id v17 = [*(id *)(v1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WFContextualActionSpotlightSyncService_queue_getAlarmContextualActionsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6541728;
  id v18 = *(id *)(v1 + 40);
  id v23 = v4;
  id v24 = v18;
  id v19 = v4;
  dispatch_async(v17, block);
}

uint64_t __95__WFContextualActionSpotlightSyncService_queue_getAlarmContextualActionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)queue_getFocusModeContextualActionsWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WFContextualActionSpotlightSyncService *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [getFCActivityManagerClass() sharedActivityManager];
  id v7 = [v6 availableActivities];
  id v8 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v15 = [v14 activityIdentifier];
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  id v16 = (void *)[v8 copy];
  id v17 = [v16 allValues];

  id v18 = objc_msgSend(v17, "if_compactMap:", &__block_literal_global_278);
  id v19 = [(WFContextualActionSpotlightSyncService *)self queue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__WFContextualActionSpotlightSyncService_queue_getFocusModeContextualActionsWithCompletionHandler___block_invoke_2;
  v22[3] = &unk_1E6541728;
  id v23 = v18;
  id v24 = v4;
  id v20 = v18;
  id v21 = v4;
  dispatch_async(v19, v22);
}

uint64_t __99__WFContextualActionSpotlightSyncService_queue_getFocusModeContextualActionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

id __99__WFContextualActionSpotlightSyncService_queue_getFocusModeContextualActionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPlaceholder])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = v2;
    if (!v4)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"WFToggleFocusModeContextualActionFocusMode *WFToggleFocusModeContextualActionFocusModeFromFocusMode(__strong id<FCActivityDescribing>)"];
      [v12 handleFailureInFunction:v13, @"WFContextualActionSpotlightSyncService.m", 74, @"Invalid parameter not satisfying: %@", @"focusMode" file lineNumber description];
    }
    id v5 = objc_alloc(MEMORY[0x1E4FB49F8]);
    id v6 = [v4 activityIdentifier];
    id v7 = [v4 activityDisplayName];
    id v8 = [v4 activitySymbolImageName];
    id v9 = [v4 activityColorName];
    uint64_t v10 = (void *)[v5 initWithIdentifier:v6 name:v7 symbolName:v8 colorName:v9];

    uint64_t v3 = [MEMORY[0x1E4FB49F0] toggle:v10];
  }
  return v3;
}

- (void)queue_getToggleSettingContextualActionsWithCompletionHandler:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFContextualActionSpotlightSyncService *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = WFToggleAccessibilityContextualActions();
  v19[0] = v7;
  id v8 = WFToggleSettingContextualActions();
  v19[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __WFToggleContextualActions_block_invoke;
  v17[3] = &unk_1E65419C0;
  id v10 = v6;
  id v18 = v10;
  [v9 enumerateObjectsUsingBlock:v17];

  uint64_t v11 = [(WFContextualActionSpotlightSyncService *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__WFContextualActionSpotlightSyncService_queue_getToggleSettingContextualActionsWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E6541728;
  id v15 = v10;
  id v16 = v4;
  id v12 = v10;
  id v13 = v4;
  dispatch_async(v11, v14);
}

uint64_t __103__WFContextualActionSpotlightSyncService_queue_getToggleSettingContextualActionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)queue_getStaticContextualActionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContextualActionSpotlightSyncService *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = WFStaticContextualActionDefinitionsForSurface();
  id v7 = [(WFContextualActionSpotlightSyncService *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__WFContextualActionSpotlightSyncService_queue_getStaticContextualActionsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6541728;
  id v11 = v6;
  id v12 = v4;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(v7, v10);
}

uint64_t __96__WFContextualActionSpotlightSyncService_queue_getStaticContextualActionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:(id)a3 identifiers:(id)a4 batchSize:(unint64_t)a5 fetcher:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(WFContextualActionSpotlightSyncService *)self queue];
  dispatch_assert_queue_V2(v16);

  os_activity_t v17 = _os_activity_create(&dword_1C7D7E000, "contextual actions indexing stage", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke;
  block[3] = &unk_1E65416E0;
  id v24 = v12;
  long long v25 = self;
  id v28 = v14;
  id v29 = v15;
  os_activity_t v26 = v17;
  id v27 = v13;
  unint64_t v30 = a5;
  id v18 = v13;
  id v19 = v15;
  id v20 = v17;
  id v21 = v14;
  id v22 = v12;
  os_activity_apply(v20, block);
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v15 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers"
          ":batchSize:fetcher:completionBlock:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s New indexing stage: Indexing %@ contextual actions", buf, 0x16u);
  }

  uint64_t v4 = *(void *)(a1 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_252;
  v8[3] = &unk_1E65416B8;
  id v5 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 72);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 80);
  id v11 = v6;
  uint64_t v13 = v7;
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v7);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 40), &state);
  if (v6)
  {
    id v8 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      uint64_t v32 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke";
      __int16 v33 = 2112;
      uint64_t v34 = v9;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Couldn't get %@ contextual actions, let's not touch existing indexed ones: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v10 = [v5 count];
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = objc_msgSend(v5, "if_map:", &__block_literal_global_257);
    uint64_t v13 = [v11 setWithArray:v12];

    id v14 = (void *)MEMORY[0x1E4F23828];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_269;
    v21[3] = &unk_1E6541690;
    uint64_t v15 = *(void *)(a1 + 56);
    id v27 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(a1 + 40);
    id v22 = v16;
    uint64_t v23 = v17;
    id v24 = v18;
    uint64_t v28 = v10;
    id v25 = *(id *)(a1 + 48);
    id v19 = v5;
    uint64_t v20 = *(void *)(a1 + 72);
    id v26 = v19;
    uint64_t v29 = v20;
    [v14 performDiffOfIdentifiers:v13 inDomains:v15 withItemFetcher:&__block_literal_global_261 completionBlock:v21];
  }
  os_activity_scope_leave(&state);
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_269(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = getWFSpotlightSyncLogObject();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v31 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke_2";
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v9;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Search query returned error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v8 count];
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      uint64_t v31 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke";
      __int16 v32 = 2048;
      uint64_t v33 = v12;
      __int16 v34 = 2112;
      uint64_t v35 = v13;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Deleting %lu contextual actions from domains %@", buf, 0x20u);
    }

    id v14 = [*(id *)(a1 + 40) index];
    uint64_t v15 = [v8 allObjects];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_270;
    v21[3] = &unk_1E6541668;
    id v16 = *(void **)(a1 + 48);
    void v21[4] = *(void *)(a1 + 40);
    id v22 = v16;
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 80);
    id v23 = v17;
    uint64_t v28 = v18;
    id v24 = *(id *)(a1 + 56);
    id v27 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 64);
    uint64_t v20 = *(void *)(a1 + 88);
    id v25 = v19;
    uint64_t v29 = v20;
    id v26 = v7;
    [v14 deleteSearchableItemsWithIdentifiers:v15 completionHandler:v21];
  }
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (objc_class *)MEMORY[0x1E4F23830];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  v19[0] = *MEMORY[0x1E4FB4BE8];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v7 setBundleIDs:v8];

  [v7 setFetchAttributes:&unk_1F22707D8];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v6 queryContext:v7];

  uint64_t v10 = objc_opt_new();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_3;
  v17[3] = &unk_1E65415C8;
  id v11 = v10;
  id v18 = v11;
  [v9 setFoundItemsHandler:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_268;
  v14[3] = &unk_1E6541940;
  id v15 = v11;
  id v16 = v4;
  id v12 = v11;
  id v13 = v4;
  [v9 setCompletionHandler:v14];
  [v9 start];
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers"
          ":batchSize:fetcher:completionBlock:]_block_invoke_3";
    __int16 v19 = 2048;
    uint64_t v20 = [v3 count];
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEBUG, "%s Found %lu matching items in the index", buf, 0x16u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(a1 + 32);
        id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "uniqueIdentifier", (void)v12);
        [v10 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

uint64_t __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_268(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_270(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_271;
  v12[3] = &unk_1E6541640;
  id v13 = *(id *)(a1 + 40);
  id v14 = v3;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 88);
  id v15 = v5;
  uint64_t v21 = v6;
  id v16 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 32);
  id v20 = v7;
  uint64_t v17 = v8;
  id v9 = *(id *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 96);
  id v18 = v9;
  uint64_t v22 = v10;
  id v19 = *(id *)(a1 + 72);
  id v11 = v3;
  dispatch_async(v4, v12);
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_271(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  if (*(void *)(a1 + 40))
  {
    id v2 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 96);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v4 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      id v26 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke_2";
      __int16 v27 = 2112;
      uint64_t v28 = v5;
      __int16 v29 = 2048;
      uint64_t v30 = v3;
      __int16 v31 = 2112;
      uint64_t v32 = v4;
      __int16 v33 = 2112;
      uint64_t v34 = v6;
      _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_ERROR, "%s Couldn't wipe domains %@ -- not indexing the fetched %lu %@ contextual actions, let's try again later: %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    id v7 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      id v26 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = v8;
      __int16 v29 = 2112;
      uint64_t v30 = v9;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleted necessary %@ contextual actions from domains %@, indexing the new ones...", buf, 0x20u);
    }

    uint64_t v10 = [*(id *)(a1 + 64) index];
    uint64_t v11 = *(void *)(a1 + 104);
    uint64_t v12 = *(void *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 80);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_272;
    v18[3] = &unk_1E6541618;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 96);
    id v19 = v14;
    uint64_t v23 = v15;
    int8x16_t v17 = *(int8x16_t *)(a1 + 56);
    id v16 = (id)v17.i64[0];
    int8x16_t v20 = vextq_s8(v17, v17, 8uLL);
    id v21 = *(id *)(a1 + 48);
    id v22 = *(id *)(a1 + 88);
    [v10 indexSearchableItems:v12 withBatchSize:v11 updatedIdentifiers:v13 completionBlock:v18];
  }
  os_activity_scope_leave(&state);
}

void __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_272(uint64_t a1, void *a2)
{
  id v3 = a2;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  uint64_t v4 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_273;
  block[3] = &unk_1E65415F0;
  uint64_t v5 = *(void *)(a1 + 72);
  id v8 = v3;
  uint64_t v12 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v6 = v3;
  dispatch_async(v4, block);

  os_activity_scope_leave(&state);
}

uint64_t __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_2_273(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v3 = getWFSpotlightSyncLogObject();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = a1[8];
      id v7 = (void *)a1[5];
      id v6 = (void *)a1[6];
      uint64_t v8 = a1[4];
      int v13 = 136316162;
      id v14 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifie"
            "rs:batchSize:fetcher:completionBlock:]_block_invoke_2";
      __int16 v15 = 2048;
      uint64_t v16 = v5;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      int8x16_t v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_FAULT, "%s Failed to index %lu %@ contextual actions from domains %@: %@", (uint8_t *)&v13, 0x34u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[8];
    id v10 = (void *)a1[5];
    id v11 = [v10 capitalizedString];
    int v13 = 136315906;
    id v14 = "-[WFContextualActionSpotlightSyncService queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers"
          ":batchSize:fetcher:completionBlock:]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    int8x16_t v20 = v11;
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Successfully indexed %lu %@ contextual actions. %@ contextual actions are in good shape!", (uint8_t *)&v13, 0x2Au);
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t __146__WFContextualActionSpotlightSyncService_queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName_identifiers_batchSize_fetcher_completionBlock___block_invoke_254(uint64_t a1, void *a2)
{
  return [a2 uniquePrivateIdentifier];
}

- (void)reindexSearchableItems:(unint64_t)a3
{
}

- (void)reindexAllSearchableItemsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsWithCompletion:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Triggering full wipe and reindex of all items", buf, 0xCu);
  }

  id v6 = [(WFContextualActionSpotlightSyncService *)self index];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__WFContextualActionSpotlightSyncService_reindexAllSearchableItemsWithCompletion___block_invoke;
  v8[3] = &unk_1E6541940;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 deleteAllSearchableItemsWithCompletionHandler:v8];
}

void __82__WFContextualActionSpotlightSyncService_reindexAllSearchableItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsWithCompletion:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Unable to wipe index: %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) reindexSearchableItems:63 appShortcutBundleIdentifiers:0 completion:*(void *)(a1 + 40)];
  }
}

- (void)reindexSearchableItems:(unint64_t)a3 appShortcutBundleIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(WFContextualActionSpotlightSyncService *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke;
  v13[3] = &unk_1E6541560;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke(uint64_t a1)
{
  os_activity_t v2 = _os_activity_create(&dword_1C7D7E000, "spotlight indexing", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  id v3 = (void *)os_transaction_create();
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2;
  v8[3] = &unk_1E6541618;
  uint64_t v14 = *(void *)(a1 + 56);
  os_activity_t v9 = v2;
  id v10 = v4;
  id v11 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v12 = v3;
  id v13 = v5;
  id v6 = v3;
  __int16 v7 = v2;
  objc_msgSend(v4, "queue_wipeIndexIfNotMigratedToNewDomainIdentifiersWithCompletionHandler:", v8);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  if (v3)
  {
    id v4 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "-[WFContextualActionSpotlightSyncService reindexSearchableItems:appShortcutBundleIdentifiers:completion:]_block_invoke_2";
      __int16 v63 = 2112;
      id v64 = v3;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Error wiping Spotlight index. Not going to continue indexing new ones in, we'll try again later: %@", buf, 0x16u);
    }
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
    id v6 = dispatch_group_create();
    id v4 = v6;
    uint64_t v7 = *(void *)(a1 + 72);
    if (v7)
    {
      dispatch_group_enter(v6);
      id v8 = *(void **)(a1 + 40);
      os_activity_t v9 = [MEMORY[0x1E4FB4638] spotlightDomainIdentifierForBundleIdentifier:0];
      v60 = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_208;
      v54[3] = &unk_1E65414C0;
      v54[4] = *(void *)(a1 + 40);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2_210;
      v51[3] = &unk_1E65414E8;
      v52 = v4;
      id v53 = v5;
      objc_msgSend(v8, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", @"static", v10, -1, v54, v51);

      uint64_t v7 = *(void *)(a1 + 72);
    }
    if ((v7 & 2) != 0)
    {
      dispatch_group_enter(v4);
      id v11 = *(void **)(a1 + 40);
      id v12 = [MEMORY[0x1E4FB49F0] spotlightDomainIdentifierForBundleIdentifier:0];
      v59 = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_4;
      v50[3] = &unk_1E65414C0;
      v50[4] = *(void *)(a1 + 40);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_5;
      v47[3] = &unk_1E65414E8;
      v48 = v4;
      id v49 = v5;
      objc_msgSend(v11, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", @"focus", v13, -1, v50, v47);

      uint64_t v7 = *(void *)(a1 + 72);
    }
    if ((v7 & 8) != 0)
    {
      dispatch_group_enter(v4);
      uint64_t v14 = *(void **)(a1 + 40);
      id v15 = [MEMORY[0x1E4FB4A00] spotlightDomainIdentifierForBundleIdentifier:0];
      v58 = v15;
      unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_7;
      v46[3] = &unk_1E65414C0;
      v46[4] = *(void *)(a1 + 40);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_8;
      v43[3] = &unk_1E65414E8;
      v44 = v4;
      id v45 = v5;
      objc_msgSend(v14, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", @"settings toggles", v16, -1, v46, v43);

      uint64_t v7 = *(void *)(a1 + 72);
    }
    if ((v7 & 0x10) != 0)
    {
      dispatch_group_enter(v4);
      __int16 v17 = *(void **)(a1 + 40);
      id v18 = [MEMORY[0x1E4FB49E8] spotlightDomainIdentifierForBundleIdentifier:0];
      v57 = v18;
      __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_10;
      v42[3] = &unk_1E65414C0;
      v42[4] = *(void *)(a1 + 40);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_11;
      v39[3] = &unk_1E65414E8;
      uint64_t v40 = v4;
      id v41 = v5;
      objc_msgSend(v17, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", @"alarm toggles", v19, -1, v42, v39);

      uint64_t v7 = *(void *)(a1 + 72);
    }
    if ((v7 & 4) != 0)
    {
      dispatch_group_enter(v4);
      int8x16_t v20 = *(void **)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_13;
      v36[3] = &unk_1E65414E8;
      uint64_t v37 = v4;
      id v38 = v5;
      [v20 indexAppShortcutsForBundleIdentifiers:v21 completionHandler:v36];

      uint64_t v7 = *(void *)(a1 + 72);
    }
    if ((v7 & 0x20) != 0)
    {
      dispatch_group_enter(v4);
      uint64_t v22 = *(void **)(a1 + 40);
      uint64_t v23 = +[WFAppEntityContextualAction spotlightDomainIdentifierForEntityType:0];
      v56 = v23;
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_15;
      v35[3] = &unk_1E65414C0;
      v35[4] = *(void *)(a1 + 40);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_16;
      v32[3] = &unk_1E65414E8;
      __int16 v33 = v4;
      id v34 = v5;
      objc_msgSend(v22, "queue_fetchWipeAndIndexActionsInDomainWithDescriptiveName:identifiers:batchSize:fetcher:completionBlock:", @"folder app entities", v24, -1, v35, v32);
    }
    id v25 = [*(id *)(a1 + 40) queue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_18;
    v27[3] = &unk_1E6541538;
    id v28 = *(id *)(a1 + 32);
    id v29 = v5;
    id v31 = *(id *)(a1 + 64);
    id v30 = *(id *)(a1 + 56);
    id v26 = v5;
    dispatch_group_notify(v4, v25, v27);
  }
  os_activity_scope_leave(&state);
}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_208(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getStaticContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2_210(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_3;
  aBlock[3] = &unk_1E65420F0;
  id v6 = *(id *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:@"Static actions"];
  }
  v4[2](v4);
}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getFocusModeContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_6;
  aBlock[3] = &unk_1E65420F0;
  id v6 = *(id *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:@"Focus actions"];
  }
  v4[2](v4);
}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getToggleSettingContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_9;
  aBlock[3] = &unk_1E65420F0;
  id v6 = *(id *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:@"Toggle settings actions"];
  }
  v4[2](v4);
}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getAlarmContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_12;
  aBlock[3] = &unk_1E65420F0;
  id v6 = *(id *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:@"Toggle alarm actions"];
  }
  v4[2](v4);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_14;
  aBlock[3] = &unk_1E65420F0;
  id v6 = *(id *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:@"App shortcuts actions"];
  }
  v4[2](v4);
}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_getFolderAppEntityContextualActionsWithCompletionHandler:", a2);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_17;
  aBlock[3] = &unk_1E65420F0;
  id v6 = *(id *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:@"App Entities"];
  }
  v4[2](v4);
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  uint64_t v2 = [*(id *)(a1 + 40) count];
  id v3 = [*(id *)(a1 + 40) allKeys];
  if (v2)
  {
    id v4 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v3 componentsJoinedByString:@", "];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2_250;
      v9[3] = &unk_1E6541510;
      id v10 = *(id *)(a1 + 40);
      id v6 = objc_msgSend(v3, "if_map:", v9);
      *(_DWORD *)buf = 136315650;
      id v13 = "-[WFContextualActionSpotlightSyncService reindexSearchableItems:appShortcutBundleIdentifiers:completion:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      __int16 v17 = v6;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Contextual action indexing finished. Index is UNHEALTHY. Unhealthy stages: %@, indexing errors: %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v7 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[WFContextualActionSpotlightSyncService reindexSearchableItems:appShortcutBundleIdentifiers:completion:]_block_invoke_18";
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Contextual action indexing finished. Index is HEALTHY.", buf, 0xCu);
    }

    id v4 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
    [v4 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4FB7470]];
  }

  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v2 == 0);
  }

  os_activity_scope_leave(&state);
}

uint64_t __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_2_250(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_17(uint64_t a1)
{
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_14(uint64_t a1)
{
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_12(uint64_t a1)
{
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_9(uint64_t a1)
{
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_6(uint64_t a1)
{
}

void __105__WFContextualActionSpotlightSyncService_reindexSearchableItems_appShortcutBundleIdentifiers_completion___block_invoke_3(uint64_t a1)
{
}

- (void)reindexAllSearchableItemsIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v5 = +[WFContextualActionSpotlightSyncService contextualActionsIndexVersion];
  id v6 = getWFSpotlightSyncLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:]";
    __int16 v12 = 2050;
    int64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = 31;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Checking if contextual actions index needs to be updated. Index version is: %{public}ld, needed index version is: %ld", (uint8_t *)&v10, 0x20u);
  }

  uint64_t v7 = getWFSpotlightSyncLogObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 != 31 || v3)
  {
    if (v3)
    {
      if (v8)
      {
        int v10 = 136315138;
        id v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:]";
        os_activity_t v9 = "%s Forcing re-index";
LABEL_13:
        _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
      }
    }
    else if (v8)
    {
      int v10 = 136315138;
      id v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:]";
      os_activity_t v9 = "%s Current index version is lower than the needed index version. Beginning re-index";
      goto LABEL_13;
    }

    [(WFContextualActionSpotlightSyncService *)self reindexAllSearchableItemsWithCompletion:&__block_literal_global_5976];
    return;
  }
  if (v8)
  {
    int v10 = 136315138;
    id v11 = "-[WFContextualActionSpotlightSyncService reindexAllSearchableItemsIfNeeded:]";
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Contextual actions index doesn't need to be updated", (uint8_t *)&v10, 0xCu);
  }
}

uint64_t __76__WFContextualActionSpotlightSyncService_reindexAllSearchableItemsIfNeeded___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return +[WFContextualActionSpotlightSyncService setContextualActionsIndexVersion:31];
  }
  return result;
}

- (void)migrateAppShortcutsAndReindexAllItemsIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[WFContextualActionSpotlightSyncService didCompleteAppShortcutDomainMigration];
  id v4 = getWFSpotlightSyncLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      __int16 v12 = "-[WFContextualActionSpotlightSyncService migrateAppShortcutsAndReindexAllItemsIfNeeded]";
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s App Shortcuts domain don't need migration, skipping", buf, 0xCu);
    }

    [(WFContextualActionSpotlightSyncService *)self reindexAllSearchableItemsIfNeeded:0];
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      __int16 v12 = "-[WFContextualActionSpotlightSyncService migrateAppShortcutsAndReindexAllItemsIfNeeded]";
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s App Shortcuts need migration, wiping existing App Shortcuts", buf, 0xCu);
    }

    id v6 = [(WFContextualActionSpotlightSyncService *)self index];
    uint64_t v7 = [MEMORY[0x1E4FB45A8] legacySpotlightDomainIdentifier];
    int v10 = v7;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __87__WFContextualActionSpotlightSyncService_migrateAppShortcutsAndReindexAllItemsIfNeeded__block_invoke;
    v9[3] = &unk_1E6541478;
    void v9[4] = self;
    [v6 deleteSearchableItemsWithDomainIdentifiers:v8 completionHandler:v9];
  }
}

void __87__WFContextualActionSpotlightSyncService_migrateAppShortcutsAndReindexAllItemsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getWFSpotlightSyncLogObject();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[WFContextualActionSpotlightSyncService migrateAppShortcutsAndReindexAllItemsIfNeeded]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Error deleting legacy App Shortcuts domain: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[WFContextualActionSpotlightSyncService migrateAppShortcutsAndReindexAllItemsIfNeeded]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Marking App Shortcut migration complete", (uint8_t *)&v6, 0xCu);
    }

    +[WFContextualActionSpotlightSyncService setDidCompleteAppShortcutDomainMigration];
  }
  [*(id *)(a1 + 32) reindexAllSearchableItemsIfNeeded:1];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F72820] object:0];

  id v4 = [getFCActivityManagerClass() sharedActivityManager];
  [v4 removeObserver:self];

  BOOL v5 = [(WFContextualActionSpotlightSyncService *)self alarmDataSource];

  if (v5)
  {
    int v6 = [(WFContextualActionSpotlightSyncService *)self alarmDataSource];
    [v6 unregisterObserver:self];
  }
  v7.receiver = self;
  v7.super_class = (Class)WFContextualActionSpotlightSyncService;
  [(WFContextualActionSpotlightSyncService *)&v7 dealloc];
}

- (void)start
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 addObserver:self selector:sel_receiveAutoShortcutsUpdatedNotification_ name:*MEMORY[0x1E4F72820] object:0];

  id v4 = [(WFContextualActionSpotlightSyncService *)self eventHandler];
  [v4 addObserver:self selector:sel_receiveAutoShortcutsUpdatedNotification_ name:@"LNAppShortcutsChangedNotification"];

  BOOL v5 = [(WFContextualActionSpotlightSyncService *)self eventHandler];
  [v5 addObserver:self selector:sel_applicationWasRegistered_ name:@"ApplicationRegistered"];

  int v6 = [(WFContextualActionSpotlightSyncService *)self eventHandler];
  [v6 addObserver:self selector:sel_migrateAppShortcutsAndReindexAllItemsIfNeeded name:@"com.apple.mobile.keybagd.first_unlock"];

  objc_super v7 = [(WFContextualActionSpotlightSyncService *)self eventHandler];
  [v7 addObserver:self selector:sel_systemLanguageUpdated name:@"com.apple.language.changed"];

  __int16 v8 = [(WFContextualActionSpotlightSyncService *)self eventHandler];
  [v8 addObserver:self selector:sel_spotlightPreferencesChanged name:@"com.apple.spotlightui.prefschanged"];

  id v9 = [(WFContextualActionSpotlightSyncService *)self eventHandler];
  [v9 addObserver:self selector:sel_cellularSettingsUpdated name:@"com.apple.commcenter.DataSettingsChangedNotification"];

  uint64_t v10 = [(WFContextualActionSpotlightSyncService *)self databaseProvider];
  id v11 = [v10 databaseWithError:0];

  if (v11)
  {
    __int16 v12 = [v11 sortedVisibleFolders];
    folderDatabaseResult = self->_folderDatabaseResult;
    self->_folderDatabaseResult = v12;

    __int16 v14 = [(WFContextualActionSpotlightSyncService *)self folderDatabaseResult];
    [v14 registerObserver:self];
  }
  uint64_t v15 = [getFCActivityManagerClass() sharedActivityManager];
  [v15 addObserver:self];

  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2050000000;
  uint64_t v16 = (void *)getMTAlarmManagerClass_softClass;
  uint64_t v32 = getMTAlarmManagerClass_softClass;
  if (!getMTAlarmManagerClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __getMTAlarmManagerClass_block_invoke;
    __int16 v27 = &unk_1E6541E40;
    id v28 = &v29;
    __getMTAlarmManagerClass_block_invoke((uint64_t)&v24);
    uint64_t v16 = (void *)v30[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v29, 8);
  uint64_t v18 = objc_opt_new();
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2050000000;
  __int16 v19 = (void *)getMTAlarmDataSourceClass_softClass;
  uint64_t v32 = getMTAlarmDataSourceClass_softClass;
  if (!getMTAlarmDataSourceClass_softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __getMTAlarmDataSourceClass_block_invoke;
    __int16 v27 = &unk_1E6541E40;
    id v28 = &v29;
    __getMTAlarmDataSourceClass_block_invoke((uint64_t)&v24);
    __int16 v19 = (void *)v30[3];
  }
  int8x16_t v20 = v19;
  _Block_object_dispose(&v29, 8);
  uint64_t v21 = (MTAlarmDataSource *)[[v20 alloc] initWithAlarmManager:v18];
  alarmDataSource = self->_alarmDataSource;
  self->_alarmDataSource = v21;

  [(MTAlarmDataSource *)self->_alarmDataSource registerObserver:self];
  id v23 = (id)[(MTAlarmDataSource *)self->_alarmDataSource reloadAlarms];
  [(WFContextualActionSpotlightSyncService *)self migrateAppShortcutsAndReindexAllItemsIfNeeded];
}

- (WFContextualActionSpotlightSyncService)initWithEventHandler:(id)a3 databaseProvider:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F23838] isIndexingAvailable])
  {
    v20.receiver = self;
    v20.super_class = (Class)WFContextualActionSpotlightSyncService;
    id v9 = [(WFContextualActionSpotlightSyncService *)&v20 init];
    if (!v9)
    {
      uint64_t v18 = 0;
      goto LABEL_8;
    }
    uint64_t v10 = v9;
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.VoiceShortcuts.WFContextualActionSpotlightSyncService", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_eventHandler, a3);
    objc_storeStrong((id *)&v10->_databaseProvider, a4);
    id v15 = objc_alloc(MEMORY[0x1E4F23838]);
    uint64_t v16 = [v15 initWithName:@"voiceshortcuts-contextualaction-spotlight-index-name" bundleIdentifier:*MEMORY[0x1E4FB4BE8]];
    index = v10->_index;
    v10->_index = (CSSearchableIndex *)v16;

    [(CSSearchableIndex *)v10->_index setIndexDelegate:v10];
    self = v10;
    uint64_t v18 = self;
  }
  else
  {
    __int16 v12 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[WFContextualActionSpotlightSyncService initWithEventHandler:databaseProvider:]";
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEBUG, "%s Spotlight indexing is not available.", buf, 0xCu);
    }
    uint64_t v18 = 0;
  }

LABEL_8:
  return v18;
}

+ (void)setContextualActionsIndexVersion:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v4 setInteger:a3 forKey:@"WFContextualActionsIndexVersion"];
}

+ (int64_t)contextualActionsIndexVersion
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  int64_t v3 = [v2 integerForKey:@"WFContextualActionsIndexVersion"];

  return v3;
}

+ (void)setDidCompleteAppShortcutDomainMigration
{
  id v2 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v2 setBool:1 forKey:@"WFAutoShortcutContextualActionDomainMigration"];
}

+ (BOOL)didCompleteAppShortcutDomainMigration
{
  id v2 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  char v3 = [v2 BOOLForKey:@"WFAutoShortcutContextualActionDomainMigration"];

  return v3;
}

@end