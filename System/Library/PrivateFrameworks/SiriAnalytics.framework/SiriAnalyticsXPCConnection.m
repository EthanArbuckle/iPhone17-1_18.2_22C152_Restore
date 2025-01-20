@interface SiriAnalyticsXPCConnection
- (SiriAnalyticsXPCConnection)initWithMachServiceName:(id)a3;
- (id)_currentConnection;
- (void)_cleanupConnection;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)_createTag:(id)a3 completion:(id)a4;
- (void)_fetchKillSwitchEnabledWithCompletion:(id)a3;
- (void)_fetchLogicalClocksWithCompletion:(id)a3;
- (void)_fetchStateForPluginWithCompletion:(id)a3;
- (void)_fetchTags:(id)a3;
- (void)_idleTimerFired;
- (void)_publishLargeMessage:(id)a3 completion:(id)a4;
- (void)_publishLargeMessageToRemote:(id)a3 attempts:(unint64_t)a4 completion:(id)a5;
- (void)_publishMessages:(id)a3 completion:(id)a4;
- (void)_publishMessagesToRemote:(id)a3 attempts:(unint64_t)a4 completion:(id)a5;
- (void)_publishUnorderedMessages:(id)a3 topic:(id)a4 attempts:(unint64_t)a5 completion:(id)a6;
- (void)_purgeStagedMessagesWithCompletion:(id)a3;
- (void)_resetLogicalClockWithCompletion:(id)a3;
- (void)_resolveMessages:(id)a3 completion:(id)a4;
- (void)_resolveMessagesAtRemote:(id)a3 attempts:(unint64_t)a4 completion:(id)a5;
- (void)_runPipelineWithCompletion:(id)a3;
- (void)_saveState:(id)a3 forPluginWithCompletion:(id)a4;
- (void)_sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5;
- (void)_sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5;
- (void)_setKillSwitchEnabled:(BOOL)a3 completion:(id)a4;
- (void)_startIdleTimer;
- (void)_stopIdleTimer;
- (void)_vendResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5;
- (void)_vendSandboxExtensionWithResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5;
- (void)barrierWithCompletion:(id)a3;
- (void)createTag:(id)a3 completion:(id)a4;
- (void)dealloc;
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

@implementation SiriAnalyticsXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcPublishingGroup, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

- (void)dealloc
{
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  [(SiriAnalyticsXPCConnection *)self _cleanupConnection];
  v3.receiver = self;
  v3.super_class = (Class)SiriAnalyticsXPCConnection;
  [(SiriAnalyticsXPCConnection *)&v3 dealloc];
}

- (void)_idleTimerFired
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  objc_super v3 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[SiriAnalyticsXPCConnection _idleTimerFired]";
    _os_log_debug_impl(&dword_1A2B39000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  [(SiriAnalyticsXPCConnection *)self _cleanupConnection];
}

- (void)_stopIdleTimer
{
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    dispatch_source_cancel(idleTimer);
    int v4 = self->_idleTimer;
    self->_idleTimer = 0;
  }
}

- (void)_startIdleTimer
{
  if (!self->_idleTimer)
  {
    objc_super v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    idleTimer = self->_idleTimer;
    self->_idleTimer = v3;

    v5 = self->_idleTimer;
    dispatch_time_t v6 = dispatch_time(0, 4000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    v7 = self->_idleTimer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__SiriAnalyticsXPCConnection__startIdleTimer__block_invoke;
    v8[3] = &unk_1E5AC05D8;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_idleTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __45__SiriAnalyticsXPCConnection__startIdleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _idleTimerFired];
}

- (void)_cleanupConnection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  objc_super v3 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "-[SiriAnalyticsXPCConnection _cleanupConnection]";
    _os_log_debug_impl(&dword_1A2B39000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setExportedObject:0];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_connection invalidate];
    v5 = self->_connection;
    self->_connection = 0;
  }
}

- (void)_connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  objc_super v3 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriAnalyticsXPCConnection _connectionInvalidated]";
    _os_log_debug_impl(&dword_1A2B39000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SiriAnalyticsXPCConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E5AC05B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__SiriAnalyticsXPCConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupConnection];
}

- (void)_connectionInterrupted
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  objc_super v3 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriAnalyticsXPCConnection _connectionInterrupted]";
    _os_log_debug_impl(&dword_1A2B39000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SiriAnalyticsXPCConnection__connectionInterrupted__block_invoke;
  block[3] = &unk_1E5AC05B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__SiriAnalyticsXPCConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupConnection];
}

- (id)_currentConnection
{
  connection = self->_connection;
  if (!connection)
  {
    int v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_machServiceName options:0];
    v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection _setQueue:self->_queue];
    int v6 = self->_connection;
    v7 = SiriAnalyticsXPCServiceInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    uint64_t v8 = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__SiriAnalyticsXPCConnection__currentConnection__block_invoke;
    v13[3] = &unk_1E5AC05D8;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v8 setInterruptionHandler:v13];
    id v9 = self->_connection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__SiriAnalyticsXPCConnection__currentConnection__block_invoke_2;
    v11[3] = &unk_1E5AC05D8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:v11];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __48__SiriAnalyticsXPCConnection__currentConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __48__SiriAnalyticsXPCConnection__currentConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)_purgeStagedMessagesWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5AC0308;
  aBlock[4] = self;
  objc_copyWeak(&v20, &location);
  id v5 = v4;
  id v19 = v5;
  int v6 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  v7 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v8 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SiriAnalyticsXPCConnection _purgeStagedMessagesWithCompletion:]";
    __int16 v24 = 2112;
    v25 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_DEBUG, "%s Purging staged messages connection: %@", buf, 0x16u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_47;
  v16[3] = &unk_1E5AC0558;
  id v9 = v6;
  id v17 = v9;
  v10 = [v7 remoteObjectProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_48;
  v13[3] = &unk_1E5ABFFE8;
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 purgeStagedMessagesWithCompletion:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5AC02E0;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  char v13 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);

  objc_destroyWeak(&v12);
}

void __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    int v6 = "-[SiriAnalyticsXPCConnection _purgeStagedMessagesWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to purge staged messages due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_48(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  int v6 = SiriAnalyticsLogContextXPC;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      __int16 v7 = *(void **)(a1 + 32);
      int v8 = 136315394;
      uint64_t v9 = "-[SiriAnalyticsXPCConnection _purgeStagedMessagesWithCompletion:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_debug_impl(&dword_1A2B39000, v6, OS_LOG_TYPE_DEBUG, "%s Staged messages purged for connection:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[SiriAnalyticsXPCConnection _purgeStagedMessagesWithCompletion:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl(&dword_1A2B39000, v6, OS_LOG_TYPE_ERROR, "%s Failed to purge staged messages due to %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__SiriAnalyticsXPCConnection__purgeStagedMessagesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [(dispatch_group_t *)WeakRetained _startIdleTimer];
    dispatch_group_leave(v5[5]);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return MEMORY[0x1F41817F8]();
}

- (void)purgeStagedMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SiriAnalyticsXPCConnection_purgeStagedMessagesWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __64__SiriAnalyticsXPCConnection_purgeStagedMessagesWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeStagedMessagesWithCompletion:*(void *)(a1 + 40)];
}

- (void)_runPipelineWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5AC0308;
  aBlock[4] = self;
  objc_copyWeak(&v20, &location);
  id v5 = v4;
  id v19 = v5;
  id v6 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  __int16 v7 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v8 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SiriAnalyticsXPCConnection _runPipelineWithCompletion:]";
    __int16 v24 = 2112;
    v25 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_DEBUG, "%s Running pipeline for connection: %@", buf, 0x16u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_45;
  v16[3] = &unk_1E5AC0558;
  id v9 = v6;
  id v17 = v9;
  __int16 v10 = [v7 remoteObjectProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_46;
  v13[3] = &unk_1E5ABFFE8;
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 runPipelineWithCompletion:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5AC02E0;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  char v13 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);

  objc_destroyWeak(&v12);
}

void __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SiriAnalyticsXPCConnection _runPipelineWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to run pipeline due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_46(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v6 = SiriAnalyticsLogContextXPC;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      __int16 v7 = *(void **)(a1 + 32);
      int v8 = 136315394;
      uint64_t v9 = "-[SiriAnalyticsXPCConnection _runPipelineWithCompletion:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_debug_impl(&dword_1A2B39000, v6, OS_LOG_TYPE_DEBUG, "%s Pipeline ran for connection:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[SiriAnalyticsXPCConnection _runPipelineWithCompletion:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl(&dword_1A2B39000, v6, OS_LOG_TYPE_ERROR, "%s Failed to run pipeline due to %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __57__SiriAnalyticsXPCConnection__runPipelineWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [(dispatch_group_t *)WeakRetained _startIdleTimer];
    dispatch_group_leave(v5[5]);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return MEMORY[0x1F41817F8]();
}

- (void)runPipelineWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SiriAnalyticsXPCConnection_runPipelineWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __56__SiriAnalyticsXPCConnection_runPipelineWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runPipelineWithCompletion:*(void *)(a1 + 40)];
}

- (void)_setKillSwitchEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke;
  aBlock[3] = &unk_1E5ABFFE8;
  aBlock[4] = self;
  id v7 = v6;
  id v16 = v7;
  id v8 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  uint64_t v9 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  __int16 v10 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SiriAnalyticsXPCConnection _setKillSwitchEnabled:completion:]";
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_debug_impl(&dword_1A2B39000, v10, OS_LOG_TYPE_DEBUG, "%s Starting for connection:%@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke_44;
  v13[3] = &unk_1E5AC0558;
  id v14 = v8;
  id v11 = v8;
  uint64_t v12 = [v9 remoteObjectProxyWithErrorHandler:v13];
  [v12 setKillSwitchEnabled:v4 completion:v11];
}

void __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke_2;
  v10[3] = &unk_1E5AC0038;
  v10[4] = v6;
  id v8 = *(id *)(a1 + 40);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  BOOL v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[SiriAnalyticsXPCConnection _setKillSwitchEnabled:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__SiriAnalyticsXPCConnection__setKillSwitchEnabled_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _startIdleTimer];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setKillSwitchEnabled:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SiriAnalyticsXPCConnection_setKillSwitchEnabled_completion___block_invoke;
  block[3] = &unk_1E5AC0790;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __62__SiriAnalyticsXPCConnection_setKillSwitchEnabled_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setKillSwitchEnabled:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_fetchKillSwitchEnabledWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5ABFFE8;
  aBlock[4] = self;
  id v5 = v4;
  id v14 = v5;
  id v6 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  __int16 v7 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v8 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[SiriAnalyticsXPCConnection _fetchKillSwitchEnabledWithCompletion:]";
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_DEBUG, "%s Starting for connection:%@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke_43;
  v11[3] = &unk_1E5AC0558;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v7 remoteObjectProxyWithErrorHandler:v11];
  [v10 fetchKillSwitchEnabledWithCompletion:v9];
}

void __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  __int16 v7 = *(NSObject **)(v6 + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke_2;
  v10[3] = &unk_1E5AC0038;
  v10[4] = v6;
  id v8 = *(id *)(a1 + 40);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[SiriAnalyticsXPCConnection _fetchKillSwitchEnabledWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__SiriAnalyticsXPCConnection__fetchKillSwitchEnabledWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _startIdleTimer];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)fetchKillSwitchEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SiriAnalyticsXPCConnection_fetchKillSwitchEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __67__SiriAnalyticsXPCConnection_fetchKillSwitchEnabledWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchKillSwitchEnabledWithCompletion:*(void *)(a1 + 40)];
}

- (void)_createTag:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke;
  aBlock[3] = &unk_1E5ABFFE8;
  aBlock[4] = self;
  id v8 = v7;
  id v22 = v8;
  uint64_t v9 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  id v10 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v11 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v24 = "-[SiriAnalyticsXPCConnection _createTag:completion:]";
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_debug_impl(&dword_1A2B39000, v11, OS_LOG_TYPE_DEBUG, "%s Starting tagSensitiveCondition %@ for connection:%@", buf, 0x20u);
  }
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  __int16 v17 = __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke_42;
  v18 = &unk_1E5AC02B8;
  id v19 = v6;
  id v20 = v9;
  id v12 = v9;
  id v13 = v6;
  id v14 = [v10 remoteObjectProxyWithErrorHandler:&v15];
  objc_msgSend(v14, "createTag:completion:", v13, v12, v15, v16, v17, v18);
}

void __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke_2;
  v9[3] = &unk_1E5AC0038;
  id v6 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v9);
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16), v8);
}

void __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[SiriAnalyticsXPCConnection _createTag:completion:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to tag sensitive condition %@ due to %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __52__SiriAnalyticsXPCConnection__createTag_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _startIdleTimer];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SiriAnalyticsXPCConnection_createTag_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v10);
}

uint64_t __51__SiriAnalyticsXPCConnection_createTag_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createTag:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_saveState:(id)a3 forPluginWithCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5AC0508;
  aBlock[4] = self;
  objc_copyWeak(&v21, &location);
  id v8 = v7;
  id v20 = v8;
  id v9 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  dispatch_block_t v10 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v11 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v24 = "-[SiriAnalyticsXPCConnection _saveState:forPluginWithCompletion:]";
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_debug_impl(&dword_1A2B39000, v11, OS_LOG_TYPE_DEBUG, "%s Saving state for plugin for connection: %@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_40;
  v17[3] = &unk_1E5AC0558;
  id v12 = v9;
  id v18 = v12;
  id v13 = [v10 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_41;
  v15[3] = &unk_1E5AC06A0;
  id v14 = v12;
  id v16 = v14;
  [v13 saveState:v6 forPluginWithCompletion:v15];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5AC0290;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SiriAnalyticsXPCConnection _saveState:forPluginWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to save state due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__SiriAnalyticsXPCConnection__saveState_forPluginWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [(dispatch_group_t *)WeakRetained _startIdleTimer];
    dispatch_group_leave(v6[5]);
    id v3 = v6;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, dispatch_group_t *))(v4 + 16))(v4, v3);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)saveState:(id)a3 forPluginWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SiriAnalyticsXPCConnection_saveState_forPluginWithCompletion___block_invoke;
  block[3] = &unk_1E5AC0768;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __64__SiriAnalyticsXPCConnection_saveState_forPluginWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveState:*(void *)(a1 + 40) forPluginWithCompletion:*(void *)(a1 + 48)];
}

- (void)_fetchStateForPluginWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5AC0240;
  aBlock[4] = self;
  objc_copyWeak(&v18, &location);
  id v5 = v4;
  id v17 = v5;
  id v6 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  id v7 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v8 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[SiriAnalyticsXPCConnection _fetchStateForPluginWithCompletion:]";
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_DEBUG, "%s Fetching state for plugin for connection: %@", buf, 0x16u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_38;
  v14[3] = &unk_1E5AC0558;
  id v9 = v6;
  id v15 = v9;
  id v10 = [v7 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_39;
  v12[3] = &unk_1E5AC0268;
  id v11 = v9;
  id v13 = v11;
  [v10 fetchStateForPluginWithCompletion:v12];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_2;
  block[3] = &unk_1E5AC0508;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v10);
}

void __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SiriAnalyticsXPCConnection _fetchStateForPluginWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to fetch state due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__SiriAnalyticsXPCConnection__fetchStateForPluginWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    [(dispatch_group_t *)WeakRetained _startIdleTimer];
    dispatch_group_leave(v5[5]);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  return MEMORY[0x1F41817F8]();
}

- (void)fetchStateForPluginWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SiriAnalyticsXPCConnection_fetchStateForPluginWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __64__SiriAnalyticsXPCConnection_fetchStateForPluginWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStateForPluginWithCompletion:*(void *)(a1 + 40)];
}

- (void)_fetchTags:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke;
  aBlock[3] = &unk_1E5AC0218;
  aBlock[4] = self;
  objc_copyWeak(&v15, &location);
  id v5 = v4;
  id v14 = v5;
  id v6 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  __int16 v7 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v8 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[SiriAnalyticsXPCConnection _fetchTags:]";
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_DEBUG, "%s Fetching tags for connection: %@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke_36;
  v11[3] = &unk_1E5AC0558;
  id v9 = v6;
  id v12 = v9;
  id v10 = [v7 remoteObjectProxyWithErrorHandler:v11];
  [v10 fetchTags:v9];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke_2;
  block[3] = &unk_1E5AC0088;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v18 = a2;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v17);
}

void __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SiriAnalyticsXPCConnection _fetchTags:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to fetch tags due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__SiriAnalyticsXPCConnection__fetchTags___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    [(dispatch_group_t *)WeakRetained _startIdleTimer];
    dispatch_group_leave(v5[5]);
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return MEMORY[0x1F41817F8]();
}

- (void)fetchTags:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SiriAnalyticsXPCConnection_fetchTags___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __40__SiriAnalyticsXPCConnection_fetchTags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTags:*(void *)(a1 + 40)];
}

- (void)_fetchLogicalClocksWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5AC01F0;
  aBlock[4] = self;
  objc_copyWeak(&v15, &location);
  id v5 = v4;
  id v14 = v5;
  id v6 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  __int16 v7 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v8 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    char v18 = "-[SiriAnalyticsXPCConnection _fetchLogicalClocksWithCompletion:]";
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_DEBUG, "%s Fetching logical clocks for connection: %@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke_34;
  v11[3] = &unk_1E5AC0558;
  id v9 = v6;
  id v12 = v9;
  id v10 = [v7 remoteObjectProxyWithErrorHandler:v11];
  [v10 fetchLogicalClocksWithCompletion:v9];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke_2;
  block[3] = &unk_1E5AC0088;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v18 = a2;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v17);
}

void __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SiriAnalyticsXPCConnection _fetchLogicalClocksWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to fetch logical clocks due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__SiriAnalyticsXPCConnection__fetchLogicalClocksWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    [(dispatch_group_t *)WeakRetained _startIdleTimer];
    dispatch_group_leave(v5[5]);
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return MEMORY[0x1F41817F8]();
}

- (void)fetchLogicalClocksWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SiriAnalyticsXPCConnection_fetchLogicalClocksWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __63__SiriAnalyticsXPCConnection_fetchLogicalClocksWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLogicalClocksWithCompletion:*(void *)(a1 + 40)];
}

- (void)_vendResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke;
  aBlock[3] = &unk_1E5AC01A0;
  aBlock[4] = self;
  objc_copyWeak(&v24, &location);
  id v9 = v8;
  id v23 = v9;
  id v10 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  id v11 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v12 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[SiriAnalyticsXPCConnection _vendResource:readonly:completion:]";
    __int16 v28 = 2112;
    uint64_t v29 = v11;
    _os_log_debug_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_DEBUG, "%s Vending sandbox extension for connection: %@", buf, 0x16u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_31;
  v20[3] = &unk_1E5AC0558;
  id v13 = v10;
  id v21 = v13;
  id v14 = [v11 remoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_32;
  v17[3] = &unk_1E5AC01C8;
  id v15 = v11;
  id v18 = v15;
  id v16 = v13;
  id v19 = v16;
  [v14 vendResource:a3 readonly:v5 completion:v17];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_2;
  block[3] = &unk_1E5AC0178;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  id v11 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v10, block);

  objc_destroyWeak(&v20);
}

void __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SiriAnalyticsXPCConnection _vendResource:readonly:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to vend sandbox extension due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_32(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v10 = SiriAnalyticsLogContextXPC;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136315650;
      id v13 = "-[SiriAnalyticsXPCConnection _vendResource:readonly:completion:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_debug_impl(&dword_1A2B39000, v10, OS_LOG_TYPE_DEBUG, "%s Sandbox extension vended successfully (token: %@) for %@", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    id v13 = "-[SiriAnalyticsXPCConnection _vendResource:readonly:completion:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_error_impl(&dword_1A2B39000, v10, OS_LOG_TYPE_ERROR, "%s Failed to vend sandbox extension due to %@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __64__SiriAnalyticsXPCConnection__vendResource_readonly_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 64));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    [(dispatch_group_t *)WeakRetained _startIdleTimer];
    dispatch_group_leave(v5[5]);
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  return MEMORY[0x1F41817F8]();
}

- (void)vendResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__SiriAnalyticsXPCConnection_vendResource_readonly_completion___block_invoke;
  v11[3] = &unk_1E5AC0740;
  id v12 = v8;
  int64_t v13 = a3;
  BOOL v14 = a4;
  void v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __63__SiriAnalyticsXPCConnection_vendResource_readonly_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _vendResource:*(void *)(a1 + 48) readonly:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)_vendSandboxExtensionWithResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke;
  aBlock[3] = &unk_1E5AC0128;
  aBlock[4] = self;
  objc_copyWeak(&v24, &location);
  id v9 = v8;
  id v23 = v9;
  id v10 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  uint64_t v11 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v12 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[SiriAnalyticsXPCConnection _vendSandboxExtensionWithResource:readonly:completion:]";
    __int16 v28 = 2112;
    uint64_t v29 = v11;
    _os_log_debug_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_DEBUG, "%s Vending sandbox extension for connection: %@", buf, 0x16u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_28;
  v20[3] = &unk_1E5AC0558;
  id v13 = v10;
  id v21 = v13;
  BOOL v14 = [v11 remoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_29;
  v17[3] = &unk_1E5AC0150;
  id v15 = v11;
  id v18 = v15;
  id v16 = v13;
  id v19 = v16;
  [v14 vendSandboxExtensionWithResource:a3 readonly:v5 completion:v17];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_2;
  v11[3] = &unk_1E5AC0100;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);

  objc_destroyWeak(&v15);
}

void __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SiriAnalyticsXPCConnection _vendSandboxExtensionWithResource:readonly:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to vend sandbox extension due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  __int16 v7 = SiriAnalyticsLogContextXPC;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 136315650;
      id v10 = "-[SiriAnalyticsXPCConnection _vendSandboxExtensionWithResource:readonly:completion:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_debug_impl(&dword_1A2B39000, v7, OS_LOG_TYPE_DEBUG, "%s Sandbox extension vended successfully (token: %@) for %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315394;
    id v10 = "-[SiriAnalyticsXPCConnection _vendSandboxExtensionWithResource:readonly:completion:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_error_impl(&dword_1A2B39000, v7, OS_LOG_TYPE_ERROR, "%s Failed to vend sandbox extension due to %@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __84__SiriAnalyticsXPCConnection__vendSandboxExtensionWithResource_readonly_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [(dispatch_group_t *)WeakRetained _startIdleTimer];
    dispatch_group_leave(v5[5]);
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return MEMORY[0x1F41817F8]();
}

- (void)vendSandboxExtensionWithResource:(int64_t)a3 readonly:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__SiriAnalyticsXPCConnection_vendSandboxExtensionWithResource_readonly_completion___block_invoke;
  v11[3] = &unk_1E5AC0740;
  id v12 = v8;
  int64_t v13 = a3;
  BOOL v14 = a4;
  void v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __83__SiriAnalyticsXPCConnection_vendSandboxExtensionWithResource_readonly_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _vendSandboxExtensionWithResource:*(void *)(a1 + 48) readonly:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)_resetLogicalClockWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5AC00B0;
  aBlock[4] = self;
  objc_copyWeak(&v20, &location);
  id v5 = v4;
  id v19 = v5;
  id v6 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  __int16 v7 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v8 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[SiriAnalyticsXPCConnection _resetLogicalClockWithCompletion:]";
    __int16 v24 = 2112;
    __int16 v25 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_DEBUG, "%s Resetting logical clock for connection: %@", buf, 0x16u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_25;
  v16[3] = &unk_1E5AC0558;
  id v9 = v6;
  id v17 = v9;
  id v10 = [v7 remoteObjectProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_26;
  v13[3] = &unk_1E5AC00D8;
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 resetLogicalClockWithCompletion:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_2;
  block[3] = &unk_1E5AC0088;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v18 = a2;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v17);
}

void __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SiriAnalyticsXPCConnection _resetLogicalClockWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to reset logical clock due to %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_26(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v9 = SiriAnalyticsLogContextXPC;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 136315650;
      id v12 = "-[SiriAnalyticsXPCConnection _resetLogicalClockWithCompletion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_debug_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_DEBUG, "%s Logical clock: %@ reset for connection:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315394;
    id v12 = "-[SiriAnalyticsXPCConnection _resetLogicalClockWithCompletion:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_error_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_ERROR, "%s Failed to reset logical clock due to %@", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __63__SiriAnalyticsXPCConnection__resetLogicalClockWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    [(dispatch_group_t *)WeakRetained _startIdleTimer];
    dispatch_group_leave(v5[5]);
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return MEMORY[0x1F41817F8]();
}

- (void)resetLogicalClockWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SiriAnalyticsXPCConnection_resetLogicalClockWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __62__SiriAnalyticsXPCConnection_resetLogicalClockWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetLogicalClockWithCompletion:*(void *)(a1 + 40)];
}

- (void)_sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke;
  aBlock[3] = &unk_1E5ABFFE8;
  aBlock[4] = self;
  id v9 = v8;
  id v27 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  int v11 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v12 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v29 = "-[SiriAnalyticsXPCConnection _sensitiveCondition:endedAt:completion:]";
    __int16 v30 = 2048;
    uint64_t v31 = a3;
    __int16 v32 = 2112;
    v33 = v11;
    _os_log_debug_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_DEBUG, "%s Ending sensitiveCondition %lu for connection:%@", buf, 0x20u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_22;
  v23[3] = &unk_1E5AC0060;
  int v25 = a3;
  id v13 = v10;
  id v24 = v13;
  id v14 = [v11 remoteObjectProxyWithErrorHandler:v23];
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_23;
  v18[3] = &unk_1E5AC06F0;
  int v22 = a3;
  id v20 = v13;
  unint64_t v21 = a4;
  id v19 = v14;
  id v16 = v13;
  id v17 = v14;
  dispatch_async(queue, v18);
}

void __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_2;
  v10[3] = &unk_1E5AC0038;
  v10[4] = v6;
  id v8 = *(id *)(a1 + 40);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(int *)(a1 + 40);
    int v6 = 136315650;
    id v7 = "-[SiriAnalyticsXPCConnection _sensitiveCondition:endedAt:completion:]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to end sensitive condition %lu due to %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_23(uint64_t a1)
{
  return [*(id *)(a1 + 32) sensitiveCondition:*(unsigned int *)(a1 + 56) endedAt:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

uint64_t __69__SiriAnalyticsXPCConnection__sensitiveCondition_endedAt_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _startIdleTimer];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__SiriAnalyticsXPCConnection_sensitiveCondition_endedAt_completion___block_invoke;
  v11[3] = &unk_1E5AC06F0;
  int v14 = a3;
  id v12 = v8;
  unint64_t v13 = a4;
  void v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __68__SiriAnalyticsXPCConnection_sensitiveCondition_endedAt_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sensitiveCondition:*(unsigned int *)(a1 + 56) endedAt:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke;
  aBlock[3] = &unk_1E5ABFFE8;
  aBlock[4] = self;
  id v9 = v8;
  id v22 = v9;
  id v10 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  id v11 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v12 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v24 = "-[SiriAnalyticsXPCConnection _sensitiveCondition:startedAt:completion:]";
    __int16 v25 = 2048;
    uint64_t v26 = (int)v6;
    __int16 v27 = 2112;
    __int16 v28 = v11;
    _os_log_debug_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_DEBUG, "%s Starting sensitiveCondition %lu for connection:%@", buf, 0x20u);
  }
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke_21;
  char v18 = &unk_1E5AC0060;
  int v20 = v6;
  id v19 = v10;
  id v13 = v10;
  int v14 = [v11 remoteObjectProxyWithErrorHandler:&v15];
  objc_msgSend(v14, "sensitiveCondition:startedAt:completion:", v6, a4, v13, v15, v16, v17, v18);
}

void __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke_2;
  v9[3] = &unk_1E5AC0038;
  uint64_t v6 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v9);
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16), v8);
}

void __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(int *)(a1 + 40);
    int v6 = 136315650;
    id v7 = "-[SiriAnalyticsXPCConnection _sensitiveCondition:startedAt:completion:]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to start sensitive condition %lu due to %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__SiriAnalyticsXPCConnection__sensitiveCondition_startedAt_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _startIdleTimer];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SiriAnalyticsXPCConnection_sensitiveCondition_startedAt_completion___block_invoke;
  v11[3] = &unk_1E5AC06F0;
  int v14 = a3;
  id v12 = v8;
  unint64_t v13 = a4;
  void v11[4] = self;
  id v9 = v8;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v11);
  dispatch_async((dispatch_queue_t)self->_queue, v10);
}

uint64_t __70__SiriAnalyticsXPCConnection_sensitiveCondition_startedAt_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sensitiveCondition:*(unsigned int *)(a1 + 56) startedAt:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)barrierWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v5 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[SiriAnalyticsXPCConnection barrierWithCompletion:]";
    _os_log_debug_impl(&dword_1A2B39000, v5, OS_LOG_TYPE_DEBUG, "%s entering barrier", buf, 0xCu);
  }
  xpcPublishingGroup = self->_xpcPublishingGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SiriAnalyticsXPCConnection_barrierWithCompletion___block_invoke;
  block[3] = &unk_1E5AC06A0;
  id v10 = v4;
  id v8 = v4;
  dispatch_group_notify(xpcPublishingGroup, queue, block);
}

uint64_t __52__SiriAnalyticsXPCConnection_barrierWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v2 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SiriAnalyticsXPCConnection barrierWithCompletion:]_block_invoke";
    _os_log_debug_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_DEBUG, "%s exiting barrier", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_publishLargeMessageToRemote:(id)a3 attempts:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke;
  aBlock[3] = &unk_1E5ABFFE8;
  aBlock[4] = self;
  id v10 = v9;
  id v26 = v10;
  id v11 = _Block_copy(aBlock);
  id v12 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_3;
  v20[3] = &unk_1E5ABFF70;
  void v20[4] = self;
  id v21 = v8;
  unint64_t v24 = a4;
  id v22 = v10;
  id v13 = v11;
  id v23 = v13;
  id v14 = v10;
  id v15 = v8;
  uint64_t v16 = [v12 remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_20;
  v18[3] = &unk_1E5AC0010;
  id v19 = v13;
  id v17 = v13;
  [v16 publishLargeMessage:v15 completion:v18];
}

void __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_2;
  block[3] = &unk_1E5AC0790;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  int v4 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 136315650;
    char v18 = "-[SiriAnalyticsXPCConnection _publishLargeMessageToRemote:attempts:completion:]_block_invoke_3";
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Failed to send large message due to %@. (attempts = %tu)", buf, 0x20u);
  }
  if (*(void *)(a1 + 64) > 2uLL)
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v10 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      char v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      char v18 = "-[SiriAnalyticsXPCConnection _publishLargeMessageToRemote:attempts:completion:]_block_invoke_2";
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_error_impl(&dword_1A2B39000, v10, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 16);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_18;
    v13[3] = &unk_1E5ABFF48;
    void v13[4] = v6;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 64);
    id v14 = v8;
    uint64_t v16 = v9;
    id v15 = *(id *)(a1 + 48);
    dispatch_after(v5, v7, v13);
  }
}

uint64_t __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishLargeMessageToRemote:*(void *)(a1 + 40) attempts:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
}

uint64_t __79__SiriAnalyticsXPCConnection__publishLargeMessageToRemote_attempts_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)_publishLargeMessage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SiriAnalyticsXPCConnection__publishLargeMessage_completion___block_invoke;
  v9[3] = &unk_1E5ABFFE8;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(SiriAnalyticsXPCConnection *)self _publishLargeMessageToRemote:v7 attempts:0 completion:v9];
}

void __62__SiriAnalyticsXPCConnection__publishLargeMessage_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _startIdleTimer];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)publishLargeMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SiriAnalyticsXPCConnection_publishLargeMessage_completion___block_invoke;
    block[3] = &unk_1E5AC0768;
    void block[4] = self;
    id v12 = v6;
    id v13 = v8;
    dispatch_async(queue, block);
  }
  else if (v7)
  {
    id v10 = [[SiriAnalyticsError alloc] initWithErrorType:0 message:@"XPC envelope is nil"];
    ((void (**)(void, void, SiriAnalyticsError *))v8)[2](v8, 0, v10);
  }
}

uint64_t __61__SiriAnalyticsXPCConnection_publishLargeMessage_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishLargeMessage:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_resolveMessagesAtRemote:(id)a3 attempts:(unint64_t)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke;
  aBlock[3] = &unk_1E5AC0718;
  aBlock[4] = self;
  id v10 = v9;
  id v34 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v13 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    __int16 v21 = v13;
    uint64_t v22 = [v8 count];
    *(_DWORD *)buf = 136315650;
    v36 = "-[SiriAnalyticsXPCConnection _resolveMessagesAtRemote:attempts:completion:]";
    __int16 v37 = 2048;
    uint64_t v38 = v22;
    __int16 v39 = 2112;
    v40 = v12;
    _os_log_debug_impl(&dword_1A2B39000, v21, OS_LOG_TYPE_DEBUG, "%s Sending %lu unresolved messages to connection %@", buf, 0x20u);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_9;
  v27[3] = &unk_1E5ABFF70;
  id v14 = v8;
  id v28 = v14;
  uint64_t v29 = self;
  unint64_t v32 = a4;
  id v30 = v10;
  id v15 = v11;
  id v31 = v15;
  id v16 = v10;
  id v17 = [v12 remoteObjectProxyWithErrorHandler:v27];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_12;
  v23[3] = &unk_1E5AC0768;
  id v24 = v14;
  id v25 = v12;
  id v26 = v15;
  id v18 = v15;
  id v19 = v12;
  id v20 = v14;
  [v17 resolveMessages:v20 completion:v23];
}

void __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_2;
  block[3] = &unk_1E5AC06A0;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  int v4 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = v4;
    uint64_t v13 = [v11 count];
    uint64_t v14 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 136315906;
    __int16 v21 = "-[SiriAnalyticsXPCConnection _resolveMessagesAtRemote:attempts:completion:]_block_invoke";
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    id v25 = v3;
    __int16 v26 = 2048;
    uint64_t v27 = v14;
    _os_log_error_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_ERROR, "%s Failed to send %tu unresolved messages due to %@. (attempts = %tu)", buf, 0x2Au);
  }
  if (*(void *)(a1 + 64) > 2uLL)
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v10 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[SiriAnalyticsXPCConnection _resolveMessagesAtRemote:attempts:completion:]_block_invoke_2";
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_error_impl(&dword_1A2B39000, v10, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(NSObject **)(v6 + 16);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_10;
    v16[3] = &unk_1E5ABFF48;
    void v16[4] = v6;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 64);
    id v17 = v8;
    uint64_t v19 = v9;
    id v18 = *(id *)(a1 + 48);
    dispatch_after(v5, v7, v16);
  }
}

uint64_t __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_12(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v2 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_DEBUG))
  {
    int v4 = (void *)a1[4];
    dispatch_time_t v5 = v2;
    uint64_t v6 = [v4 count];
    uint64_t v7 = a1[5];
    int v8 = 136315650;
    uint64_t v9 = "-[SiriAnalyticsXPCConnection _resolveMessagesAtRemote:attempts:completion:]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_debug_impl(&dword_1A2B39000, v5, OS_LOG_TYPE_DEBUG, "%s Resolved %lu messages to connection %@", (uint8_t *)&v8, 0x20u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolveMessagesAtRemote:*(void *)(a1 + 40) attempts:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
}

uint64_t __75__SiriAnalyticsXPCConnection__resolveMessagesAtRemote_attempts_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_resolveMessages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SiriAnalyticsXPCConnection__resolveMessages_completion___block_invoke;
  v9[3] = &unk_1E5AC0718;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(SiriAnalyticsXPCConnection *)self _resolveMessagesAtRemote:v7 attempts:0 completion:v9];
}

uint64_t __58__SiriAnalyticsXPCConnection__resolveMessages_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startIdleTimer];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)resolveMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SiriAnalyticsXPCConnection_resolveMessages_completion___block_invoke;
    block[3] = &unk_1E5AC0768;
    void block[4] = self;
    id v10 = v6;
    uint64_t v11 = v7;
    dispatch_async(queue, block);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

uint64_t __57__SiriAnalyticsXPCConnection_resolveMessages_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolveMessages:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_publishUnorderedMessages:(id)a3 topic:(id)a4 attempts:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke;
  aBlock[3] = &unk_1E5AC0718;
  aBlock[4] = self;
  id v13 = v12;
  id v32 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  uint64_t v15 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke_3;
  v24[3] = &unk_1E5ABFFC0;
  unint64_t v30 = a5;
  id v25 = v10;
  __int16 v26 = self;
  id v27 = v11;
  id v28 = v13;
  id v16 = v14;
  id v29 = v16;
  id v17 = v13;
  id v18 = v11;
  id v19 = v10;
  id v20 = [v15 remoteObjectProxyWithErrorHandler:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke_8;
  v22[3] = &unk_1E5AC06A0;
  id v23 = v16;
  id v21 = v16;
  [v20 publishUnorderedMessages:v19 topic:v18 completion:v22];
}

void __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke_2;
  v3[3] = &unk_1E5AC0718;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = v4;
    uint64_t v13 = [v11 count];
    uint64_t v14 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 136315906;
    __int16 v22 = "-[SiriAnalyticsXPCConnection _publishUnorderedMessages:topic:attempts:completion:]_block_invoke_3";
    __int16 v23 = 2048;
    uint64_t v24 = v13;
    __int16 v25 = 2112;
    id v26 = v3;
    __int16 v27 = 2048;
    uint64_t v28 = v14;
    _os_log_error_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_ERROR, "%s Failed to send %tu messages due to %@. (attempts = %tu)", buf, 0x2Au);
  }
  if (*(void *)(a1 + 72) > 2uLL)
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v10 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[SiriAnalyticsXPCConnection _publishUnorderedMessages:topic:attempts:completion:]_block_invoke_2";
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      _os_log_error_impl(&dword_1A2B39000, v10, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(NSObject **)(v6 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke_6;
    block[3] = &unk_1E5ABFF98;
    void block[4] = v6;
    id v17 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 72);
    id v18 = v8;
    uint64_t v20 = v9;
    id v19 = *(id *)(a1 + 56);
    dispatch_after(v5, v7, block);
  }
}

uint64_t __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishUnorderedMessages:*(void *)(a1 + 40) topic:*(void *)(a1 + 48) attempts:*(void *)(a1 + 64) + 1 completion:*(void *)(a1 + 56)];
}

uint64_t __82__SiriAnalyticsXPCConnection__publishUnorderedMessages_topic_attempts_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _startIdleTimer];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)publishUnorderedMessages:(id)a3 topic:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if ([v8 count])
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__SiriAnalyticsXPCConnection_publishUnorderedMessages_topic_completion___block_invoke;
    v12[3] = &unk_1E5AC06C8;
    void v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    uint64_t v15 = v10;
    dispatch_async(queue, v12);
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

uint64_t __72__SiriAnalyticsXPCConnection_publishUnorderedMessages_topic_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishUnorderedMessages:*(void *)(a1 + 40) topic:*(void *)(a1 + 48) attempts:0 completion:*(void *)(a1 + 56)];
}

- (void)_publishMessagesToRemote:(id)a3 attempts:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke;
  aBlock[3] = &unk_1E5AC0718;
  aBlock[4] = self;
  id v10 = v9;
  id v27 = v10;
  id v11 = _Block_copy(aBlock);
  id v12 = [(SiriAnalyticsXPCConnection *)self _currentConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_3;
  v20[3] = &unk_1E5ABFF70;
  id v21 = v8;
  __int16 v22 = self;
  unint64_t v25 = a4;
  id v23 = v10;
  id v13 = v11;
  id v24 = v13;
  id v14 = v10;
  id v15 = v8;
  id v16 = [v12 remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_5;
  v18[3] = &unk_1E5AC06A0;
  id v19 = v13;
  id v17 = v13;
  [v16 publishMessages:v15 completion:v18];
}

void __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_2;
  block[3] = &unk_1E5AC06A0;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = (void *)SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = v4;
    uint64_t v13 = [v11 count];
    uint64_t v14 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 136315906;
    id v21 = "-[SiriAnalyticsXPCConnection _publishMessagesToRemote:attempts:completion:]_block_invoke_3";
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    id v25 = v3;
    __int16 v26 = 2048;
    uint64_t v27 = v14;
    _os_log_error_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_ERROR, "%s Failed to send %tu messages due to %@. (attempts = %tu)", buf, 0x2Au);
  }
  if (*(void *)(a1 + 64) > 2uLL)
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v10 = SiriAnalyticsLogContextXPC;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v21 = "-[SiriAnalyticsXPCConnection _publishMessagesToRemote:attempts:completion:]_block_invoke_2";
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_error_impl(&dword_1A2B39000, v10, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(NSObject **)(v6 + 16);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_2;
    v16[3] = &unk_1E5ABFF48;
    void v16[4] = v6;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 64);
    id v17 = v8;
    uint64_t v19 = v9;
    id v18 = *(id *)(a1 + 48);
    dispatch_after(v5, v7, v16);
  }
}

uint64_t __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__SiriAnalyticsXPCConnection__publishMessagesToRemote_attempts_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishMessagesToRemote:*(void *)(a1 + 40) attempts:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
}

{
  uint64_t result;

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_publishMessages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SiriAnalyticsXPCConnection *)self _stopIdleTimer];
  dispatch_group_enter((dispatch_group_t)self->_xpcPublishingGroup);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SiriAnalyticsXPCConnection__publishMessages_completion___block_invoke;
  v9[3] = &unk_1E5AC0718;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(SiriAnalyticsXPCConnection *)self _publishMessagesToRemote:v7 attempts:0 completion:v9];
}

uint64_t __58__SiriAnalyticsXPCConnection__publishMessages_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startIdleTimer];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)publishMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SiriAnalyticsXPCConnection_publishMessages_completion___block_invoke;
    block[3] = &unk_1E5AC0768;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

uint64_t __57__SiriAnalyticsXPCConnection_publishMessages_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishMessages:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (SiriAnalyticsXPCConnection)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsXPCConnection;
  dispatch_time_t v5 = [(SiriAnalyticsXPCConnection *)&v15 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    id v7 = [NSString stringWithFormat:@"%@.analytics.xpc.connection", v4];
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    dispatch_group_t v10 = dispatch_group_create();
    xpcPublishingGroup = v5->_xpcPublishingGroup;
    v5->_xpcPublishingGroup = (OS_dispatch_group *)v10;

    uint64_t v12 = [v4 copy];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v12;
  }
  return v5;
}

@end