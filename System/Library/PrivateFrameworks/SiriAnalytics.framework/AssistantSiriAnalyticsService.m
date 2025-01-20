@interface AssistantSiriAnalyticsService
- (AssistantSiriAnalyticsService)initWithQueue:(id)a3 delegate:(id)a4;
- (BOOL)_analyticsEnabled;
- (id)_getPreprocessor;
- (void)_bootstrapStorageOnQueueWithCompletion:(id)a3;
- (void)_bootstrapStorageWithCompletion:(id)a3;
- (void)_buildDependenciesOnQueue;
- (void)_buildDependenciesWithCompletion:(id)a3;
- (void)_setupIncomingConnections;
- (void)_setupMaintenanceWorkOnQueueWithCompletion:(id)a3;
- (void)_setupMaintenanceWorkWithCompletion:(id)a3;
- (void)handler:(id)a3 createTag:(id)a4 completion:(id)a5;
- (void)handler:(id)a3 fetchKillSwitchWithCompletion:(id)a4;
- (void)handler:(id)a3 fetchLogicalClocks:(id)a4;
- (void)handler:(id)a3 fetchStateForPluginName:(id)a4 completion:(id)a5;
- (void)handler:(id)a3 fetchTags:(id)a4;
- (void)handler:(id)a3 largeMessageReceivedWithPath:(id)a4 requestIdentifier:(id)a5 messageWrapper:(id)a6 completion:(id)a7;
- (void)handler:(id)a3 messagesReceived:(id)a4;
- (void)handler:(id)a3 purgeStagedMessagesWithCompletion:(id)a4;
- (void)handler:(id)a3 resetLogicalClockWithCompletion:(id)a4;
- (void)handler:(id)a3 runPipelineWithCompletion:(id)a4;
- (void)handler:(id)a3 saveState:(id)a4 forPluginName:(id)a5 completion:(id)a6;
- (void)handler:(id)a3 sensitiveCondition:(int)a4 endedAt:(unint64_t)a5 completion:(id)a6;
- (void)handler:(id)a3 sensitiveCondition:(int)a4 startedAt:(unint64_t)a5 completion:(id)a6;
- (void)handler:(id)a3 setKillSwitchEnabled:(BOOL)a4 completion:(id)a5;
- (void)handler:(id)a3 unorderedMessagesReceived:(id)a4 topic:(id)a5;
- (void)handler:(id)a3 unresolvedMessagesReceived:(id)a4;
- (void)handler:(id)a3 vendResource:(int64_t)a4 readonly:(BOOL)a5 completion:(id)a6;
- (void)handler:(id)a3 vendSandboxExtensionWithResource:(int64_t)a4 readonly:(BOOL)a5 completion:(id)a6;
- (void)registerMessageResolver:(id)a3;
- (void)registerSensitiveConditionsObserver:(id)a3;
- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4;
- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4;
- (void)sensitiveConditionRangesForBootSessionUUIDs:(id)a3 completion:(id)a4;
@end

@implementation AssistantSiriAnalyticsService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userHistoryPolicy, 0);
  objc_storeStrong((id *)&self->_rawUnifiedStream, 0);
  objc_storeStrong((id *)&self->_firstUnlockObserver, 0);
  objc_storeStrong((id *)&self->_inactivityScheduler, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_messageStaging, 0);
  objc_storeStrong((id *)&self->_fbf, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_metastore, 0);
  objc_storeStrong((id *)&self->_sensitiveConditionsObservers, 0);
  objc_storeStrong((id *)&self->_internalTelemetry, 0);
  objc_storeStrong((id *)&self->_messageTailing, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_clockWatcher, 0);
  objc_storeStrong((id *)&self->_messageResolutionPipeline, 0);
  objc_storeStrong((id *)&self->_whiteRose, 0);
  objc_storeStrong((id *)&self->_largeMessageStorage, 0);
  objc_storeStrong((id *)&self->_messageProcessingStrategy, 0);
  objc_storeStrong((id *)&self->_siriAnalyticsListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_getPreprocessor
{
  return self->_preprocessor;
}

- (void)sensitiveConditionRangesForBootSessionUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__AssistantSiriAnalyticsService_sensitiveConditionRangesForBootSessionUUIDs_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __88__AssistantSiriAnalyticsService_sensitiveConditionRangesForBootSessionUUIDs_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 160);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__AssistantSiriAnalyticsService_sensitiveConditionRangesForBootSessionUUIDs_completion___block_invoke_2;
  v6[3] = &unk_1E5AC0768;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  v6[4] = v4;
  id v7 = v5;
  [v2 afterFirstUnlock:v6];
}

void __88__AssistantSiriAnalyticsService_sensitiveConditionRangesForBootSessionUUIDs_completion___block_invoke_2(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1[6])
  {
    v2 = [*(id *)(a1[4] + 104) sensitiveConditionsWithBootSessionUUIDs:a1[5]];
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v3 = SiriAnalyticsLogContextAssistant;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = a1[5];
      int v5 = 136315394;
      id v6 = "-[AssistantSiriAnalyticsService sensitiveConditionRangesForBootSessionUUIDs:completion:]_block_invoke_2";
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_debug_impl(&dword_1A2B39000, v3, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v5, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (BOOL)_analyticsEnabled
{
  if (self->_killSwitchEnabled) {
    return 0;
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    char v2 = [v5 analyticsEnabled];
  }
  else
  {
    char v2 = 1;
  }

  return v2;
}

- (void)handler:(id)a3 createTag:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AssistantSiriAnalyticsService_handler_createTag_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

uint64_t __62__AssistantSiriAnalyticsService_handler_createTag_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 48) createTag:a1[5] completion:a1[6]];
}

- (void)handler:(id)a3 saveState:(id)a4 forPluginName:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v12 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[AssistantSiriAnalyticsService handler:saveState:forPluginName:completion:]";
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_INFO, "%s plugin: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__AssistantSiriAnalyticsService_handler_saveState_forPluginName_completion___block_invoke;
  v17[3] = &unk_1E5AC06C8;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(queue, v17);
}

uint64_t __76__AssistantSiriAnalyticsService_handler_saveState_forPluginName_completion___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 72) setPluginState:a1[5] forBundleIdentifier:a1[6]];
  uint64_t result = a1[7];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)handler:(id)a3 fetchStateForPluginName:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v9 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AssistantSiriAnalyticsService handler:fetchStateForPluginName:completion:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_INFO, "%s plugin: %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AssistantSiriAnalyticsService_handler_fetchStateForPluginName_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(queue, block);
}

uint64_t __76__AssistantSiriAnalyticsService_handler_fetchStateForPluginName_completion___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 72) pluginStateForBundleIdentifier:a1[5]];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)handler:(id)a3 fetchTags:(id)a4
{
  id v7 = (void (**)(id, uint64_t, void *, void))a4;
  id v5 = [[SiriAnalyticsTaggingXPCHandler alloc] initWithMetastore:self->_metastore];
  id v6 = [(SiriAnalyticsTaggingXPCHandler *)v5 all];
  if (v7) {
    v7[2](v7, 1, v6, 0);
  }
}

- (void)handler:(id)a3 fetchLogicalClocks:(id)a4
{
  id v5 = a4;
  id v6 = [[SiriAnalyticsLogicalClocksXPCHandler alloc] initWithMetastore:self->_metastore queue:self->_queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__AssistantSiriAnalyticsService_handler_fetchLogicalClocks___block_invoke;
  v8[3] = &unk_1E5ABFF20;
  id v9 = v5;
  id v7 = v5;
  [(SiriAnalyticsLogicalClocksXPCHandler *)v6 allWithCompletion:v8];
}

uint64_t __60__AssistantSiriAnalyticsService_handler_fetchLogicalClocks___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 16))(result, 1, a2, 0);
  }
  return result;
}

- (void)handler:(id)a3 purgeStagedMessagesWithCompletion:(id)a4
{
  id v5 = a4;
  messageStaging = self->_messageStaging;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__AssistantSiriAnalyticsService_handler_purgeStagedMessagesWithCompletion___block_invoke;
  v8[3] = &unk_1E5AC06A0;
  id v9 = v5;
  id v7 = v5;
  [(SiriAnalyticsMessageStaging *)messageStaging purgeWithCompletionHandler:v8];
}

uint64_t __75__AssistantSiriAnalyticsService_handler_purgeStagedMessagesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)handler:(id)a3 runPipelineWithCompletion:(id)a4
{
  id v5 = a4;
  preprocessor = self->_preprocessor;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__AssistantSiriAnalyticsService_handler_runPipelineWithCompletion___block_invoke;
  v8[3] = &unk_1E5AC06A0;
  id v9 = v5;
  id v7 = v5;
  [(SiriAnalyticsPreprocessor *)preprocessor triggerWithReason:2 completion:v8];
}

uint64_t __67__AssistantSiriAnalyticsService_handler_runPipelineWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)handler:(id)a3 setKillSwitchEnabled:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  [(SiriAnalyticsPreferences *)self->_preferences setKillSwitchEnabled:v5];
  [(SiriAnalyticsPreferences *)self->_preferences synchronize];
  id v7 = v8;
  if (v8)
  {
    (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
    id v7 = v8;
  }
}

- (void)handler:(id)a3 fetchKillSwitchWithCompletion:(id)a4
{
  if (a4)
  {
    preferences = self->_preferences;
    id v6 = a4;
    (*((void (**)(id, BOOL, void))a4 + 2))(v6, [(SiriAnalyticsPreferences *)preferences killSwitchEnabled], 0);
  }
}

- (void)handler:(id)a3 vendResource:(int64_t)a4 readonly:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, void *, void *, id))a6;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v11 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[AssistantSiriAnalyticsService handler:vendResource:readonly:completion:]";
    __int16 v28 = 2048;
    int64_t v29 = a4;
    __int16 v30 = 2048;
    BOOL v31 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v11, OS_LOG_TYPE_DEBUG, "%s Vending sandbox extension for resource: %ld, readonly: %ld", buf, 0x20u);
  }
  id v12 = +[SiriAnalyticsPersistentStorage dataVault];
  id v13 = [v9 entitlements];
  id v14 = [v13 extendedEntitlements];
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  id v24 = 0;
  BOOL v22 = v7;
  id v15 = [v12 vendAccessFor:a4 withEntitlements:v14 auditToken:v25 readonly:v7 error:&v24];
  id v16 = v24;

  if (SiriAnalyticsLoggingInit_once == -1)
  {
    if (v16) {
      goto LABEL_10;
    }
LABEL_16:
    __int16 v18 = SiriAnalyticsLogContextAssistant;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[AssistantSiriAnalyticsService handler:vendResource:readonly:completion:]";
      __int16 v28 = 2048;
      int64_t v29 = a4;
      __int16 v30 = 2048;
      BOOL v31 = v22;
      _os_log_debug_impl(&dword_1A2B39000, v18, OS_LOG_TYPE_DEBUG, "%s Vended sandbox extension for resource: %ld, readonly: %ld", buf, 0x20u);
    }
    id v19 = +[SiriAnalyticsPersistentStorage dataVault];
    id v23 = 0;
    uint64_t v20 = [v19 vendedResourceUrlFor:a4 error:&v23];
    id v16 = v23;

    if (!v16) {
      goto LABEL_22;
    }
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v21 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[AssistantSiriAnalyticsService handler:vendResource:readonly:completion:]";
      __int16 v28 = 2048;
      int64_t v29 = a4;
      __int16 v30 = 2048;
      BOOL v31 = v22;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_error_impl(&dword_1A2B39000, v21, OS_LOG_TYPE_ERROR, "%s Error vending sandbox extension for resource: %ld, readonly: %ld, error: %@", buf, 0x2Au);
      if (!v10) {
        goto LABEL_24;
      }
    }
    else
    {
LABEL_22:
      if (!v10)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    v10[2](v10, v15, v20, v16);
    goto LABEL_24;
  }
  dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  if (!v16) {
    goto LABEL_16;
  }
LABEL_10:
  v17 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v27 = "-[AssistantSiriAnalyticsService handler:vendResource:readonly:completion:]";
    __int16 v28 = 2048;
    int64_t v29 = a4;
    __int16 v30 = 2048;
    BOOL v31 = v22;
    __int16 v32 = 2112;
    id v33 = v16;
    _os_log_error_impl(&dword_1A2B39000, v17, OS_LOG_TYPE_ERROR, "%s Error vending sandbox extension for resource: %ld, readonly: %ld, error: %@", buf, 0x2Au);
    if (!v10) {
      goto LABEL_25;
    }
    goto LABEL_12;
  }
  if (v10) {
LABEL_12:
  }
    v10[2](v10, 0, 0, v16);
LABEL_25:
}

- (void)handler:(id)a3 vendSandboxExtensionWithResource:(int64_t)a4 readonly:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, void *, id))a6;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v11 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v22 = "-[AssistantSiriAnalyticsService handler:vendSandboxExtensionWithResource:readonly:completion:]";
    __int16 v23 = 2048;
    int64_t v24 = a4;
    __int16 v25 = 2048;
    BOOL v26 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v11, OS_LOG_TYPE_DEBUG, "%s Vending sandbox extension for resource: %ld, readonly: %ld", buf, 0x20u);
  }
  id v12 = +[SiriAnalyticsPersistentStorage dataVault];
  id v13 = [v9 entitlements];
  id v14 = [v13 extendedEntitlements];
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v20, 0, sizeof(v20));
  }
  id v19 = 0;
  id v15 = [v12 vendAccessFor:a4 withEntitlements:v14 auditToken:v20 readonly:v7 error:&v19];
  id v16 = v19;

  if (SiriAnalyticsLoggingInit_once == -1)
  {
    if (v16) {
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    if (v16)
    {
LABEL_10:
      v17 = SiriAnalyticsLogContextXPC;
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        BOOL v22 = "-[AssistantSiriAnalyticsService handler:vendSandboxExtensionWithResource:readonly:completion:]";
        __int16 v23 = 2048;
        int64_t v24 = a4;
        __int16 v25 = 2048;
        BOOL v26 = v7;
        __int16 v27 = 2112;
        id v28 = v16;
        _os_log_error_impl(&dword_1A2B39000, v17, OS_LOG_TYPE_ERROR, "%s Error vending sandbox extension for resource: %ld, readonly: %ld, error: %@", buf, 0x2Au);
        if (!v10) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  __int16 v18 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v22 = "-[AssistantSiriAnalyticsService handler:vendSandboxExtensionWithResource:readonly:completion:]";
    __int16 v23 = 2048;
    int64_t v24 = a4;
    __int16 v25 = 2048;
    BOOL v26 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v18, OS_LOG_TYPE_DEBUG, "%s Vended sandbox extension for resource: %ld, readonly: %ld", buf, 0x20u);
    if (!v10) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_15:
  if (v10) {
LABEL_16:
  }
    v10[2](v10, v15, v16);
LABEL_17:
}

- (void)handler:(id)a3 resetLogicalClockWithCompletion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v6 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[AssistantSiriAnalyticsService handler:resetLogicalClockWithCompletion:]";
    _os_log_debug_impl(&dword_1A2B39000, v6, OS_LOG_TYPE_DEBUG, "%s Resetting logical clock", buf, 0xCu);
  }
  whiteRose = self->_whiteRose;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__AssistantSiriAnalyticsService_handler_resetLogicalClockWithCompletion___block_invoke;
  v9[3] = &unk_1E5AC0678;
  id v10 = v5;
  id v8 = v5;
  [(SiriAnalyticsWhiteRose *)whiteRose destroyActiveClockWithReason:3 completion:v9];
}

uint64_t __73__AssistantSiriAnalyticsService_handler_resetLogicalClockWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 16))(result, 1, a2, 0);
  }
  return result;
}

- (void)handler:(id)a3 sensitiveCondition:(int)a4 endedAt:(unint64_t)a5 completion:(id)a6
{
}

- (void)handler:(id)a3 sensitiveCondition:(int)a4 startedAt:(unint64_t)a5 completion:(id)a6
{
}

- (void)handler:(id)a3 largeMessageReceivedWithPath:(id)a4 requestIdentifier:(id)a5 messageWrapper:(id)a6 completion:(id)a7
{
  id v15 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void (**)(id, void, void *))a7;
  if ([(AssistantSiriAnalyticsService *)self _analyticsEnabled])
  {
    [(SiriAnalyticsLargeMessageStorage *)self->_largeMessageStorage enqueueLargeMessageObjectFromPath:v15 messageWrapper:v12 requestIdentifier:v11 completion:v13];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.analytics" code:0 userInfo:0];
    v13[2](v13, 0, v14);
  }
}

- (void)handler:(id)a3 unresolvedMessagesReceived:(id)a4
{
  id v5 = a4;
  if ([(AssistantSiriAnalyticsService *)self _analyticsEnabled])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__AssistantSiriAnalyticsService_handler_unresolvedMessagesReceived___block_invoke;
    v6[3] = &unk_1E5ABFEF8;
    v6[4] = self;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __68__AssistantSiriAnalyticsService_handler_unresolvedMessagesReceived___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 message];
  if (v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v6 = [v3 timestamp];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__AssistantSiriAnalyticsService_handler_unresolvedMessagesReceived___block_invoke_2;
    v7[3] = &unk_1E5ABFED0;
    id v8 = v3;
    [v5 resolveMessage:v4 timestamp:v6 completion:v7];
  }
}

void __68__AssistantSiriAnalyticsService_handler_unresolvedMessagesReceived___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v7 = +[AssistantSiriAnalytics sharedAnalytics];
    uint64_t v4 = [v7 defaultMessageStream];
    uint64_t v5 = [*(id *)(a1 + 32) timestamp];
    uint64_t v6 = [*(id *)(a1 + 32) streamUUID];
    [v4 emitMessage:v3 timestamp:v5 isolatedStreamUUID:v6];
  }
}

- (void)handler:(id)a3 unorderedMessagesReceived:(id)a4 topic:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(AssistantSiriAnalyticsService *)self _analyticsEnabled])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__AssistantSiriAnalyticsService_handler_unorderedMessagesReceived_topic___block_invoke;
    block[3] = &unk_1E5ABFEA8;
    id v11 = v7;
    id v12 = self;
    id v13 = v8;
    dispatch_async(queue, block);
  }
}

uint64_t __73__AssistantSiriAnalyticsService_handler_unorderedMessagesReceived_topic___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "trackAnyEventEmitted:", v7, (void)v9);
        [*(id *)(*(void *)(a1 + 40) + 120) store:v7 topic:*(void *)(a1 + 48) completion:&__block_literal_global];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 40) + 168) sendWithAnyEvents:*(void *)(a1 + 32)];
  return [*(id *)(*(void *)(a1 + 40) + 80) tailAnyEvents:*(void *)(a1 + 32)];
}

void __73__AssistantSiriAnalyticsService_handler_unorderedMessagesReceived_topic___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    uint64_t v3 = SiriAnalyticsLogContextAssistant;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      uint64_t v5 = "-[AssistantSiriAnalyticsService handler:unorderedMessagesReceived:topic:]_block_invoke_2";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl(&dword_1A2B39000, v3, OS_LOG_TYPE_ERROR, "%s Failed to persist message: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)handler:(id)a3 messagesReceived:(id)a4
{
  id v5 = a4;
  if ([(AssistantSiriAnalyticsService *)self _analyticsEnabled])
  {
    whiteRose = self->_whiteRose;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__AssistantSiriAnalyticsService_handler_messagesReceived___block_invoke;
    v7[3] = &unk_1E5ABFE60;
    void v7[4] = self;
    [(SiriAnalyticsWhiteRose *)whiteRose markTimeForAnnotatedMessages:v5 completion:v7];
  }
}

void __58__AssistantSiriAnalyticsService_handler_messagesReceived___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 168);
  id v4 = a2;
  [v3 sendWithRuntimeEvents:v4];
  [*(id *)(*(void *)(a1 + 32) + 32) processWithMessages:v4];
  [*(id *)(*(void *)(a1 + 32) + 88) trackEmittedEvents:v4];
  [*(id *)(*(void *)(a1 + 32) + 80) tailMessages:v4];
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AssistantSiriAnalyticsService_sensitiveCondition_endedAt___block_invoke;
  block[3] = &unk_1E5ABFE38;
  int v6 = a3;
  void block[4] = self;
  void block[5] = a4;
  dispatch_async(queue, block);
}

uint64_t __60__AssistantSiriAnalyticsService_sensitiveCondition_endedAt___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) sensitiveCondition:*(unsigned int *)(a1 + 48) endedAt:*(void *)(a1 + 40) ensureClockExists:0 completion:0];
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AssistantSiriAnalyticsService_sensitiveCondition_startedAt___block_invoke;
  block[3] = &unk_1E5ABFE38;
  int v6 = a3;
  void block[4] = self;
  void block[5] = a4;
  dispatch_async(queue, block);
}

uint64_t __62__AssistantSiriAnalyticsService_sensitiveCondition_startedAt___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) sensitiveCondition:*(unsigned int *)(a1 + 48) startedAt:*(void *)(a1 + 40) ensureClockExists:0 completion:0];
}

- (void)registerSensitiveConditionsObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__AssistantSiriAnalyticsService_registerSensitiveConditionsObserver___block_invoke;
  v7[3] = &unk_1E5AC0530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __69__AssistantSiriAnalyticsService_registerSensitiveConditionsObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) addSensitiveConditionsObserver:*(void *)(a1 + 40)];
}

- (void)registerMessageResolver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__AssistantSiriAnalyticsService_registerMessageResolver___block_invoke;
  v7[3] = &unk_1E5AC0530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __57__AssistantSiriAnalyticsService_registerMessageResolver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) registerMessageResolver:*(void *)(a1 + 40)];
}

- (void)_setupIncomingConnections
{
  self->_siriAnalyticsListener = [[SiriAnalyticsXPCServiceListener alloc] initWithMachServiceName:@"com.apple.siri.analytics.assistant" entitlementsKey:@"com.apple.siri.analytics.assistant" queue:self->_queue delegate:self];
  MEMORY[0x1F41817F8]();
}

- (void)_setupMaintenanceWorkOnQueueWithCompletion:(id)a3
{
  id v4 = a3;
  [(SiriAnalyticsClockInactivityScheduler *)self->_inactivityScheduler startScheduling];
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  whiteRose = self->_whiteRose;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__AssistantSiriAnalyticsService__setupMaintenanceWorkOnQueueWithCompletion___block_invoke;
  v12[3] = &unk_1E5AC05B0;
  id v13 = v5;
  id v7 = v5;
  [(SiriAnalyticsWhiteRose *)whiteRose bootstrapWithCompletion:v12];
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__AssistantSiriAnalyticsService__setupMaintenanceWorkOnQueueWithCompletion___block_invoke_2;
  v10[3] = &unk_1E5AC06A0;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(v7, queue, v10);
}

void __76__AssistantSiriAnalyticsService__setupMaintenanceWorkOnQueueWithCompletion___block_invoke(uint64_t a1)
{
}

uint64_t __76__AssistantSiriAnalyticsService__setupMaintenanceWorkOnQueueWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setupMaintenanceWorkWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__AssistantSiriAnalyticsService__setupMaintenanceWorkWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __69__AssistantSiriAnalyticsService__setupMaintenanceWorkWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 160);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__AssistantSiriAnalyticsService__setupMaintenanceWorkWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5AC0718;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 afterFirstUnlock:v3];
}

uint64_t __69__AssistantSiriAnalyticsService__setupMaintenanceWorkWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupMaintenanceWorkOnQueueWithCompletion:*(void *)(a1 + 40)];
}

- (void)_bootstrapStorageOnQueueWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[SiriAnalyticsPersistentStorage dataVault];
  [v5 migrate];

  [(SiriAnalyticsMetastore *)self->_metastore bootstrap];
  [(SiriAnalyticsMetastore *)self->_metastore prune];
  messageStaging = self->_messageStaging;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AssistantSiriAnalyticsService__bootstrapStorageOnQueueWithCompletion___block_invoke;
  v8[3] = &unk_1E5AC06A0;
  id v9 = v4;
  id v7 = v4;
  [(SiriAnalyticsMessageStaging *)messageStaging bootstrapAndPruneWithCompletionHandler:v8];
}

uint64_t __72__AssistantSiriAnalyticsService__bootstrapStorageOnQueueWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_bootstrapStorageWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__AssistantSiriAnalyticsService__bootstrapStorageWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__AssistantSiriAnalyticsService__bootstrapStorageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 160);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__AssistantSiriAnalyticsService__bootstrapStorageWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5AC0718;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 afterFirstUnlock:v3];
}

uint64_t __65__AssistantSiriAnalyticsService__bootstrapStorageWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bootstrapStorageOnQueueWithCompletion:*(void *)(a1 + 40)];
}

- (void)_buildDependenciesOnQueue
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(SiriAnalyticsPreferences);
  preferences = self->_preferences;
  self->_preferences = v3;

  BOOL v5 = [(SiriAnalyticsPreferences *)self->_preferences killSwitchEnabled];
  self->_BOOL killSwitchEnabled = v5;
  if (!v5)
  {
LABEL_6:
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    goto LABEL_8;
  }
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v6 = (void *)SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    id v7 = self->_preferences;
    id v8 = v6;
    *(_DWORD *)buf = 136315394;
    v67 = "-[AssistantSiriAnalyticsService _buildDependenciesOnQueue]";
    __int16 v68 = 2048;
    v69 = (AssistantSiriAnalyticsService *)[(SiriAnalyticsPreferences *)v7 killSwitchEnabled];
    _os_log_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_INFO, "%s 💀 kill switch enabled with pref: %ld", buf, 0x16u);

    goto LABEL_6;
  }
LABEL_8:
  id v9 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    queue = self->_queue;
    BOOL killSwitchEnabled = self->_killSwitchEnabled;
    *(_DWORD *)buf = 136315906;
    v67 = "-[AssistantSiriAnalyticsService _buildDependenciesOnQueue]";
    __int16 v68 = 2112;
    v69 = self;
    __int16 v70 = 2112;
    v71 = queue;
    __int16 v72 = 2048;
    BOOL v73 = killSwitchEnabled;
    _os_log_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_INFO, "%s Analytics service: %@ created on queue: %@ with killSwitchEnabled: %ld", buf, 0x2Au);
  }
  long long v12 = [[AssistantSiriAnalyticsMessageTailing alloc] initWithPreferences:self->_preferences];
  messageTailing = self->_messageTailing;
  self->_messageTailing = v12;

  uint64_t v14 = [[SiriAnalyticsInternalTelemetry alloc] initWithPreferences:self->_preferences];
  internalTelemetry = self->_internalTelemetry;
  self->_internalTelemetry = v14;

  [(SiriAnalyticsInternalTelemetry *)self->_internalTelemetry trackRuntimeBootstrapWithKillSwitchEnabled:self->_killSwitchEnabled];
  id v16 = objc_alloc_init(SiriAnalyticsMetastore);
  metastore = self->_metastore;
  self->_metastore = v16;

  __int16 v18 = [[_TtC13SiriAnalytics27SiriAnalyticsMessageStaging alloc] initWithInternalTelemetry:self->_internalTelemetry];
  messageStaging = self->_messageStaging;
  self->_messageStaging = v18;

  uint64_t v20 = [SiriAnalyticsLargeMessageStorage alloc];
  v21 = [[SiriAnalyticsLargeMessageUploadProcessor alloc] initWithMetastore:self->_metastore];
  BOOL v22 = [(SiriAnalyticsLargeMessageStorage *)v20 initWithApplicationIdentifier:@"com.apple.assistantd" processor:v21 runtimeQueue:self->_queue];
  largeMessageStorage = self->_largeMessageStorage;
  self->_largeMessageStorage = v22;

  int64_t v24 = [[SiriAnalyticsSensitiveConditionsObservers alloc] initWithQueue:self->_queue];
  sensitiveConditionsObservers = self->_sensitiveConditionsObservers;
  self->_sensitiveConditionsObservers = v24;

  BOOL v26 = [[SiriAnalyticsMessageStore alloc] initWithPrefs:self->_preferences];
  messageStore = self->_messageStore;
  self->_messageStore = v26;

  id v28 = objc_alloc_init(SiriAnalyticsRawUnifiedStream);
  rawUnifiedStream = self->_rawUnifiedStream;
  self->_rawUnifiedStream = v28;

  __int16 v30 = [[SiriAnalyticsFBFStorage alloc] initWithApplicationIdentifier:@"com.apple.assistantd" telemetry:self->_internalTelemetry];
  fbf = self->_fbf;
  self->_fbf = v30;

  v61 = objc_alloc_init(SiriAnalyticsPrivateLearningStorageProvider);
  __int16 v32 = [[SiriAnalyticsLocalStorageDispatcher alloc] initWithPlusStream:v61];
  id v33 = [[SiriAnalyticsPreprocessor alloc] initWithMetastore:self->_metastore metastoreQueue:self->_queue fbf:self->_fbf telemetry:self->_internalTelemetry messageTailing:self->_messageTailing messageStaging:self->_messageStaging localStorage:v32 uspUploadQueue:self->_messageStore];
  preprocessor = self->_preprocessor;
  self->_preprocessor = v33;

  v35 = [[SiriAnalyticsMessageProcessingStrategy alloc] initWithMessageStaging:self->_messageStaging];
  messageProcessingStrategy = self->_messageProcessingStrategy;
  self->_messageProcessingStrategy = v35;

  if (!self->_killSwitchEnabled)
  {
    objc_initWeak((id *)buf, self);
    v37 = [SiriAnalyticsClockInactivityScheduler alloc];
    v38 = self->_queue;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __58__AssistantSiriAnalyticsService__buildDependenciesOnQueue__block_invoke;
    v64[3] = &unk_1E5ABFE10;
    objc_copyWeak(&v65, (id *)buf);
    v64[4] = self;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __58__AssistantSiriAnalyticsService__buildDependenciesOnQueue__block_invoke_2;
    v62[3] = &unk_1E5ABFE10;
    objc_copyWeak(&v63, (id *)buf);
    v62[4] = self;
    v39 = [(SiriAnalyticsClockInactivityScheduler *)v37 initWithSeconds:30 queue:v38 expiration:v64 creation:v62];
    inactivityScheduler = self->_inactivityScheduler;
    self->_inactivityScheduler = v39;

    objc_destroyWeak(&v63);
    objc_destroyWeak(&v65);
    objc_destroyWeak((id *)buf);
  }
  v41 = [SiriAnalyticsDataCollectionPolicyClockObserver alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v43 = [WeakRetained siriAssistantConfiguration];
  v44 = [(SiriAnalyticsDataCollectionPolicyClockObserver *)v41 initWithSiriConfiguration:v43 metastore:self->_metastore metastoreQueue:self->_queue];

  v45 = [AssistantSiriAnalyticsClockWatcher alloc];
  v46 = self->_internalTelemetry;
  v47 = self->_sensitiveConditionsObservers;
  v48 = +[AssistantSiriAnalytics sharedAnalytics];
  v49 = [v48 defaultMessageStream];
  v50 = [(AssistantSiriAnalyticsClockWatcher *)v45 initWithInternalTelemetry:v46 sensitiveConditionsObservers:v47 clientMessageStream:v49 preprocessor:self->_preprocessor metastore:self->_metastore scheduler:self->_inactivityScheduler dataPolicyObserver:v44];
  clockWatcher = self->_clockWatcher;
  self->_clockWatcher = v50;

  v52 = [[SiriAnalyticsWhiteRose alloc] initWithQueue:self->_queue delegate:self->_clockWatcher metastore:self->_metastore];
  whiteRose = self->_whiteRose;
  self->_whiteRose = v52;

  v54 = [[SiriAnalyticsMessageResolutionPipeline alloc] initWithQueue:self->_queue];
  messageResolutionPipeline = self->_messageResolutionPipeline;
  self->_messageResolutionPipeline = v54;

  v56 = [[_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver alloc] initWithQueue:self->_queue];
  firstUnlockObserver = self->_firstUnlockObserver;
  self->_firstUnlockObserver = v56;

  v58 = [[SiriAnalyticsUserHistoryPolicy alloc] initWithMessageStaging:self->_messageStaging queue:self->_queue];
  userHistoryPolicy = self->_userHistoryPolicy;
  p_userHistoryPolicy = (id *)&self->_userHistoryPolicy;
  id *p_userHistoryPolicy = v58;

  [*p_userHistoryPolicy startObserving];
}

uint64_t __58__AssistantSiriAnalyticsService__buildDependenciesOnQueue__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained _getPreprocessor];
  [v6 triggerWithReason:0 completion:v4];

  [*(id *)(*(void *)(a1 + 32) + 136) prune];
  id v7 = *(void **)(*(void *)(a1 + 32) + 168);
  return [v7 prune];
}

uint64_t __58__AssistantSiriAnalyticsService__buildDependenciesOnQueue__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained _getPreprocessor];
  [v6 triggerWithReason:1 completion:v4];

  [*(id *)(*(void *)(a1 + 32) + 136) prune];
  id v7 = *(void **)(*(void *)(a1 + 32) + 168);
  return [v7 prune];
}

- (void)_buildDependenciesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__AssistantSiriAnalyticsService__buildDependenciesWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __66__AssistantSiriAnalyticsService__buildDependenciesWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _buildDependenciesOnQueue];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (AssistantSiriAnalyticsService)initWithQueue:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  v27.receiver = self;
  v27.super_class = (Class)AssistantSiriAnalyticsService;
  id v6 = [(AssistantSiriAnalyticsService *)&v27 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.siri.analytics.runtime", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v6->_delegate, v5);
    uint64_t v11 = mach_continuous_time();
    long long v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    _OWORD v25[2] = __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke;
    v25[3] = &unk_1E5AC05B0;
    id v13 = v12;
    BOOL v26 = v13;
    [(AssistantSiriAnalyticsService *)v6 _buildDependenciesWithCompletion:v25];
    dispatch_group_enter(v13);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_2;
    v23[3] = &unk_1E5AC05B0;
    uint64_t v14 = v13;
    int64_t v24 = v14;
    [(AssistantSiriAnalyticsService *)v6 _bootstrapStorageWithCompletion:v23];
    dispatch_group_enter(v14);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_3;
    v21[3] = &unk_1E5AC05B0;
    BOOL v22 = v14;
    id v15 = v14;
    [(AssistantSiriAnalyticsService *)v6 _setupMaintenanceWorkWithCompletion:v21];
    id v16 = v6->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_4;
    block[3] = &unk_1E5ABFDE8;
    id v19 = v6;
    uint64_t v20 = v11;
    dispatch_group_notify(v15, v16, block);
  }
  return v6;
}

void __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke(uint64_t a1)
{
}

void __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_2(uint64_t a1)
{
}

void __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_3(uint64_t a1)
{
}

uint64_t __56__AssistantSiriAnalyticsService_initWithQueue_delegate___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupIncomingConnections];
  uint64_t v2 = mach_continuous_time();
  uint64_t v3 = *(void *)(a1 + 40);
  if (_SiriAnalyticsMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SiriAnalyticsMachAbsoluteTimeRate_onceToken, &__block_literal_global_403);
  }
  unint64_t v4 = (unint64_t)(*(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate * (double)(v2 - v3));
  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  return [v5 trackRuntimeBootstrapCompleteWithBootstrapTimeInNs:v4];
}

@end