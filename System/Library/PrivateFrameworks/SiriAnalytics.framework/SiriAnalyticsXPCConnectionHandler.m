@interface SiriAnalyticsXPCConnectionHandler
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (NSXPCConnection)connection;
- (SiriAnalyticsXPCConnectionEntitlements)entitlements;
- (SiriAnalyticsXPCConnectionHandler)initWithConnection:(id)a3 entitlementsKey:(id)a4 queue:(id)a5 delegate:(id)a6;
- (id)mapToAnnotatedMessage:(id)a3;
- (void)createTag:(id)a3 completion:(id)a4;
- (void)fetchKillSwitchEnabledWithCompletion:(id)a3;
- (void)fetchLogicalClocksWithCompletion:(id)a3;
- (void)fetchStateForPluginWithCompletion:(id)a3;
- (void)fetchTags:(id)a3;
- (void)publishLargeMessage:(id)a3 completion:(id)a4;
- (void)publishMessages:(id)a3 completion:(id)a4;
- (void)publishUnorderedMessages:(id)a3 topic:(id)a4 completion:(id)a5;
- (void)purgeStagedMessagesWithCompletion:(id)a3;
- (void)resetLogicalClockWithCompletion:(id)a3;
- (void)resolveMessages:(id)a3 completion:(id)a4;
- (void)runPipelineWithCompletion:(id)a3;
- (void)saveState:(id)a3 forPluginWithCompletion:(id)a4;
- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5;
- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5;
- (void)setKillSwitchEnabled:(BOOL)a3 completion:(id)a4;
- (void)vendResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5;
- (void)vendSandboxExtensionWithResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5;
@end

@implementation SiriAnalyticsXPCConnectionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)mapToAnnotatedMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA1248]);
  objc_msgSend(v4, "setAnyEventType:", objc_msgSend(v3, "messageType"));
  v5 = [v3 messageBody];
  [v4 setPayload:v5];

  v6 = [v4 unwrap];
  if (v6)
  {
    v7 = objc_alloc_init(SiriAnalyticsTimeAnnotatedMessage);
    -[SiriAnalyticsTimeAnnotatedMessage setTimestamp:](v7, "setTimestamp:", [v3 timestamp]);
    v8 = [v3 streamUUID];
    [(SiriAnalyticsTimeAnnotatedMessage *)v7 setStreamUUID:v8];

    v9 = [v3 messageUUID];
    [(SiriAnalyticsTimeAnnotatedMessage *)v7 setMessageUUID:v9];

    [(SiriAnalyticsTimeAnnotatedMessage *)v7 setMessage:v6];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v10 = (void *)SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      v12 = v10;
      int v13 = 136315394;
      v14 = "-[SiriAnalyticsXPCConnectionHandler mapToAnnotatedMessage:]";
      __int16 v15 = 2048;
      uint64_t v16 = [v3 messageType];
      _os_log_error_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_ERROR, "%s Unable to unwrap anyEventType: %lu", (uint8_t *)&v13, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)setKillSwitchEnabled:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SiriAnalyticsXPCConnectionHandler_setKillSwitchEnabled_completion___block_invoke;
  block[3] = &unk_1E5AC0790;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __69__SiriAnalyticsXPCConnectionHandler_setKillSwitchEnabled_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained handler:*(void *)(a1 + 32) setKillSwitchEnabled:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)fetchKillSwitchEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__SiriAnalyticsXPCConnectionHandler_fetchKillSwitchEnabledWithCompletion___block_invoke;
    v7[3] = &unk_1E5AC0718;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __74__SiriAnalyticsXPCConnectionHandler_fetchKillSwitchEnabledWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained handler:*(void *)(a1 + 32) fetchKillSwitchWithCompletion:*(void *)(a1 + 40)];
}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SiriAnalyticsXPCConnectionHandler_createTag_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __58__SiriAnalyticsXPCConnectionHandler_createTag_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  [WeakRetained handler:a1[4] createTag:a1[5] completion:a1[6]];
}

- (void)purgeStagedMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SiriAnalyticsXPCConnectionHandler_purgeStagedMessagesWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __71__SiriAnalyticsXPCConnectionHandler_purgeStagedMessagesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 64) hasRuntimeManagement])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained handler:*(void *)(a1 + 32) purgeStagedMessagesWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[SiriAnalyticsXPCConnectionHandler purgeStagedMessagesWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
    }
  }
}

- (void)runPipelineWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SiriAnalyticsXPCConnectionHandler_runPipelineWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__SiriAnalyticsXPCConnectionHandler_runPipelineWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 64) hasRuntimeManagement])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained handler:*(void *)(a1 + 32) runPipelineWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[SiriAnalyticsXPCConnectionHandler runPipelineWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
    }
  }
}

- (void)saveState:(id)a3 forPluginWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SiriAnalyticsXPCConnectionHandler_saveState_forPluginWithCompletion___block_invoke;
  block[3] = &unk_1E5AC0768;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __71__SiriAnalyticsXPCConnectionHandler_saveState_forPluginWithCompletion___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1[4] + 64) hasPluginState] & 1) == 0)
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v4 = SiriAnalyticsLogContextXPC;
    if (!os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SiriAnalyticsXPCConnectionHandler saveState:forPluginWithCompletion:]_block_invoke";
    v5 = "%s Caller lacks entitlement.";
    goto LABEL_17;
  }
  v2 = *(void **)(a1[4] + 72);
  if (v2)
  {
    id v7 = (id)[v2 copy];
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
    [WeakRetained handler:a1[4] saveState:a1[5] forPluginName:v7 completion:a1[6]];

    return;
  }
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SiriAnalyticsXPCConnectionHandler saveState:forPluginWithCompletion:]_block_invoke";
    v5 = "%s Caller lacks application-identifier entitlement.";
LABEL_17:
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, v5, buf, 0xCu);
  }
LABEL_13:
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)fetchStateForPluginWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SiriAnalyticsXPCConnectionHandler_fetchStateForPluginWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __71__SiriAnalyticsXPCConnectionHandler_fetchStateForPluginWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 64) hasPluginState] & 1) == 0)
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v4 = SiriAnalyticsLogContextXPC;
    if (!os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SiriAnalyticsXPCConnectionHandler fetchStateForPluginWithCompletion:]_block_invoke";
    v5 = "%s Caller lacks entitlement.";
    goto LABEL_17;
  }
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    id v7 = (id)[v2 copy];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained handler:*(void *)(a1 + 32) fetchStateForPluginName:v7 completion:*(void *)(a1 + 40)];

    return;
  }
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SiriAnalyticsXPCConnectionHandler fetchStateForPluginWithCompletion:]_block_invoke";
    v5 = "%s Caller lacks application-identifier entitlement.";
LABEL_17:
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, v5, buf, 0xCu);
  }
LABEL_13:
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

- (void)fetchTags:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SiriAnalyticsXPCConnectionHandler_fetchTags___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__SiriAnalyticsXPCConnectionHandler_fetchTags___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 64) hasRuntimeIntrospection])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained handler:*(void *)(a1 + 32) fetchTags:*(void *)(a1 + 40)];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[SiriAnalyticsXPCConnectionHandler fetchTags:]_block_invoke";
      _os_log_error_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, 0, 0, 0);
    }
  }
}

- (void)fetchLogicalClocksWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SiriAnalyticsXPCConnectionHandler_fetchLogicalClocksWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __70__SiriAnalyticsXPCConnectionHandler_fetchLogicalClocksWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 64) hasRuntimeIntrospection])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained handler:*(void *)(a1 + 32) fetchLogicalClocks:*(void *)(a1 + 40)];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[SiriAnalyticsXPCConnectionHandler fetchLogicalClocksWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, 0, 0, 0);
    }
  }
}

- (void)vendResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SiriAnalyticsXPCConnectionHandler_vendResource_readonly_completion___block_invoke;
  v11[3] = &unk_1E5AC0740;
  id v12 = v8;
  int64_t v13 = a3;
  BOOL v14 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __70__SiriAnalyticsXPCConnectionHandler_vendResource_readonly_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained handler:*(void *)(a1 + 32) vendResource:*(void *)(a1 + 48) readonly:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)vendSandboxExtensionWithResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__SiriAnalyticsXPCConnectionHandler_vendSandboxExtensionWithResource_readonly_completion___block_invoke;
  v11[3] = &unk_1E5AC0740;
  id v12 = v8;
  int64_t v13 = a3;
  BOOL v14 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __90__SiriAnalyticsXPCConnectionHandler_vendSandboxExtensionWithResource_readonly_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained handler:*(void *)(a1 + 32) vendSandboxExtensionWithResource:*(void *)(a1 + 48) readonly:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)resetLogicalClockWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SiriAnalyticsXPCConnectionHandler_resetLogicalClockWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __69__SiriAnalyticsXPCConnectionHandler_resetLogicalClockWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 64) hasRuntimeManagement])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained handler:*(void *)(a1 + 32) resetLogicalClockWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v2 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[SiriAnalyticsXPCConnectionHandler resetLogicalClockWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, 0, 0, 0);
    }
  }
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__SiriAnalyticsXPCConnectionHandler_sensitiveCondition_endedAt_completion___block_invoke;
  v11[3] = &unk_1E5AC06F0;
  int v14 = a3;
  id v12 = v8;
  unint64_t v13 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __75__SiriAnalyticsXPCConnectionHandler_sensitiveCondition_endedAt_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained handler:*(void *)(a1 + 32) sensitiveCondition:*(unsigned int *)(a1 + 56) endedAt:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__SiriAnalyticsXPCConnectionHandler_sensitiveCondition_startedAt_completion___block_invoke;
  v11[3] = &unk_1E5AC06F0;
  int v14 = a3;
  id v12 = v8;
  unint64_t v13 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __77__SiriAnalyticsXPCConnectionHandler_sensitiveCondition_startedAt_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained handler:*(void *)(a1 + 32) sensitiveCondition:*(unsigned int *)(a1 + 56) startedAt:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)publishUnorderedMessages:(id)a3 topic:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__SiriAnalyticsXPCConnectionHandler_publishUnorderedMessages_topic_completion___block_invoke;
  aBlock[3] = &unk_1E5AC06A0;
  id v11 = v10;
  id v19 = v11;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  if ([v8 count])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__SiriAnalyticsXPCConnectionHandler_publishUnorderedMessages_topic_completion___block_invoke_2;
    block[3] = &unk_1E5AC06C8;
    block[4] = self;
    uint64_t v17 = v12;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(queue, block);
  }
  else
  {
    v12[2](v12);
  }
}

uint64_t __79__SiriAnalyticsXPCConnectionHandler_publishUnorderedMessages_topic_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__SiriAnalyticsXPCConnectionHandler_publishUnorderedMessages_topic_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 64) canPublishUnordered])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v9 = objc_alloc(MEMORY[0x1E4FA1248]);
          uint64_t v10 = objc_msgSend(v8, "eventTypeId", (void)v15);
          id v11 = [v8 payload];
          id v12 = (void *)[v9 initWithAnyEventType:v10 payload:v11];

          [v2 addObject:v12];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained handler:*(void *)(a1 + 32) unorderedMessagesReceived:v2 topic:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    int v14 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SiriAnalyticsXPCConnectionHandler publishUnorderedMessages:topic:completion:]_block_invoke_2";
      _os_log_error_impl(&dword_1A2B39000, v14, OS_LOG_TYPE_ERROR, "%s Connection lacks entitlement", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)publishLargeMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SiriAnalyticsXPCConnectionHandler_publishLargeMessage_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  id v12 = v6;
  unint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __68__SiriAnalyticsXPCConnectionHandler_publishLargeMessage_completion___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) largeMessagePath];
  id v2 = [*(id *)(a1 + 32) requestIdentifier];
  id v3 = objc_alloc(MEMORY[0x1E4FA0410]);
  uint64_t v4 = [*(id *)(a1 + 32) serializedDataUploadMessage];
  uint64_t v5 = (void *)[v3 initWithData:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  [WeakRetained handler:*(void *)(a1 + 40) largeMessageReceivedWithPath:v7 requestIdentifier:v2 messageWrapper:v5 completion:*(void *)(a1 + 48)];
}

- (void)resolveMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SiriAnalyticsXPCConnectionHandler_resolveMessages_completion___block_invoke;
  aBlock[3] = &unk_1E5AC06A0;
  id v8 = v7;
  id v16 = v8;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  if ([v6 count])
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__SiriAnalyticsXPCConnectionHandler_resolveMessages_completion___block_invoke_2;
    v11[3] = &unk_1E5AC0768;
    id v12 = v6;
    unint64_t v13 = self;
    id v14 = v9;
    dispatch_async(queue, v11);
  }
  else
  {
    v9[2](v9);
  }
}

uint64_t __64__SiriAnalyticsXPCConnectionHandler_resolveMessages_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64__SiriAnalyticsXPCConnectionHandler_resolveMessages_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(a1 + 40), "mapToAnnotatedMessage:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  [WeakRetained handler:*(void *)(a1 + 40) unresolvedMessagesReceived:v2];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)publishMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SiriAnalyticsXPCConnectionHandler_publishMessages_completion___block_invoke;
  aBlock[3] = &unk_1E5AC06A0;
  id v8 = v7;
  id v16 = v8;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  if ([v6 count])
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__SiriAnalyticsXPCConnectionHandler_publishMessages_completion___block_invoke_2;
    v11[3] = &unk_1E5AC0768;
    id v12 = v6;
    long long v13 = self;
    id v14 = v9;
    dispatch_async(queue, v11);
  }
  else
  {
    v9[2](v9);
  }
}

uint64_t __64__SiriAnalyticsXPCConnectionHandler_publishMessages_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64__SiriAnalyticsXPCConnectionHandler_publishMessages_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(a1 + 40), "mapToAnnotatedMessage:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  [WeakRetained handler:*(void *)(a1 + 40) messagesReceived:v2];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (SiriAnalyticsXPCConnectionEntitlements)entitlements
{
  return self->_entitlements;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (SiriAnalyticsXPCConnectionHandler)initWithConnection:(id)a3 entitlementsKey:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SiriAnalyticsXPCConnectionHandler;
  uint64_t v15 = [(SiriAnalyticsXPCConnectionHandler *)&v26 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_connection, a3);
    objc_storeStrong((id *)&v16->_queue, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    if (v11)
    {
      [v11 auditToken];
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
    }
    *(_OWORD *)v16->_auditToken.val = v24;
    *(_OWORD *)&v16->_auditToken.val[4] = v25;
    long long v17 = [SiriAnalyticsXPCConnectionEntitlements alloc];
    long long v18 = [v11 valueForEntitlement:v12];
    uint64_t v19 = [(SiriAnalyticsXPCConnectionEntitlements *)v17 initWithEntitlements:v18];
    entitlements = v16->_entitlements;
    v16->_entitlements = (SiriAnalyticsXPCConnectionEntitlements *)v19;

    uint64_t v21 = [v11 valueForEntitlement:@"application-identifier"];
    connectionApplicationIdentifier = v16->_connectionApplicationIdentifier;
    v16->_connectionApplicationIdentifier = (NSString *)v21;
  }
  return v16;
}

@end