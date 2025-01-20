@interface WBSPasswordBreachHelperProxy
- (WBSPasswordBreachHelperProxy)init;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (void)addResultRecordDictionaries:(id)a3 completionHandler:(id)a4;
- (void)clearAllRecordsWithCompletionHandler:(id)a3;
- (void)clearRecentlyBreachedResultRecordsWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)getPasswordEvaluationsForPersistentIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getResultRecordDictionariesForResultQueryDictionaries:(id)a3 withCompletionHandler:(id)a4;
- (void)invalidate;
- (void)recentlyBreachedResultRecordDictionariesWithCompletionHandler:(id)a3;
- (void)runLookupSessionIgnoringMinimumDelay:(BOOL)a3 completionHandler:(id)a4;
- (void)writePasswordEvaluationsToCache:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSPasswordBreachHelperProxy

- (WBSPasswordBreachHelperProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSPasswordBreachHelperProxy;
  v2 = [(WBSPasswordBreachHelperProxy *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_connectionLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(WBSPasswordBreachHelperProxy *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordBreachHelperProxy;
  [(WBSPasswordBreachHelperProxy *)&v3 dealloc];
}

- (void)invalidate
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_connectionLock);
  [(NSXPCConnection *)v4 invalidate];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  connection = self->_connection;
  v7 = &off_1B738F000;
  if (!connection)
  {
    id v36 = v4;
    v8 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.Safari.PasswordBreachHelper" options:0];
    v9 = self->_connection;
    self->_connection = v8;

    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1092C50];
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    [v10 setClasses:v18 forSelector:sel_getPasswordEvaluationsForPersistentIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v35 = v21;
    v7 = &off_1B738F000;
    v26 = objc_msgSend(v19, "setWithObjects:", v20, v35, v22, v23, v24, v25, objc_opt_class(), 0);
    [v10 setClasses:v26 forSelector:sel_writePasswordEvaluationsToCache_completionHandler_ argumentIndex:0 ofReply:0];

    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v10];
    objc_initWeak(location, self);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke;
    v39[3] = &unk_1E615A5D8;
    objc_copyWeak(&v40, location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v39];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v40);
    objc_destroyWeak(location);

    connection = self->_connection;
    id v4 = v36;
  }
  v27 = connection;
  os_unfair_lock_unlock(p_connectionLock);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = *((void *)v7 + 454);
  v37[2] = __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke_2;
  v37[3] = &unk_1E615BAF0;
  id v28 = v4;
  id v38 = v28;
  v29 = [(NSXPCConnection *)v27 remoteObjectProxyWithErrorHandler:v37];
  v30 = v29;
  if (v29)
  {
    id v31 = v29;
  }
  else
  {
    v32 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachHelperProxy _remoteObjectProxyWithErrorHandler:](v32);
    }
    v33 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F28798], 14, @"Failed to acquire remote object proxy.");
    (*((void (**)(id, void *))v28 + 2))(v28, v33);
  }
  return v30;
}

void __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 4;
    id v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    objc_super v3 = *(void **)&v4[2]._os_unfair_lock_opaque;
    *(void *)&v4[2]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
  }
}

void __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke_2_cold_1(v4, v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runLookupSessionIgnoringMinimumDelay:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__WBSPasswordBreachHelperProxy_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke;
  v9[3] = &unk_1E615BAF0;
  id v10 = v6;
  id v7 = v6;
  v8 = [(WBSPasswordBreachHelperProxy *)self _remoteObjectProxyWithErrorHandler:v9];
  [v8 runLookupSessionIgnoringMinimumDelay:v4 completionHandler:v7];
}

uint64_t __87__WBSPasswordBreachHelperProxy_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getResultRecordDictionariesForResultQueryDictionaries:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__WBSPasswordBreachHelperProxy_getResultRecordDictionariesForResultQueryDictionaries_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E615BAF0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(WBSPasswordBreachHelperProxy *)self _remoteObjectProxyWithErrorHandler:v10];
  [v9 getResultRecordDictionariesForResultQueryDictionaries:v8 withCompletionHandler:v7];
}

uint64_t __108__WBSPasswordBreachHelperProxy_getResultRecordDictionariesForResultQueryDictionaries_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recentlyBreachedResultRecordDictionariesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__WBSPasswordBreachHelperProxy_recentlyBreachedResultRecordDictionariesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615BAF0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(WBSPasswordBreachHelperProxy *)self _remoteObjectProxyWithErrorHandler:v7];
  [v6 recentlyBreachedResultRecordDictionariesWithCompletionHandler:v5];
}

uint64_t __94__WBSPasswordBreachHelperProxy_recentlyBreachedResultRecordDictionariesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearRecentlyBreachedResultRecordsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__WBSPasswordBreachHelperProxy_clearRecentlyBreachedResultRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615BAF0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(WBSPasswordBreachHelperProxy *)self _remoteObjectProxyWithErrorHandler:v7];
  [v6 clearRecentlyBreachedResultRecordsWithCompletionHandler:v5];
}

uint64_t __88__WBSPasswordBreachHelperProxy_clearRecentlyBreachedResultRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearAllRecordsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__WBSPasswordBreachHelperProxy_clearAllRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615BAF0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(WBSPasswordBreachHelperProxy *)self _remoteObjectProxyWithErrorHandler:v7];
  [v6 clearAllRecordsWithCompletionHandler:v5];
}

uint64_t __69__WBSPasswordBreachHelperProxy_clearAllRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addResultRecordDictionaries:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__WBSPasswordBreachHelperProxy_addResultRecordDictionaries_completionHandler___block_invoke;
  v10[3] = &unk_1E615BAF0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(WBSPasswordBreachHelperProxy *)self _remoteObjectProxyWithErrorHandler:v10];
  [v9 addResultRecordDictionaries:v8 completionHandler:v7];
}

uint64_t __78__WBSPasswordBreachHelperProxy_addResultRecordDictionaries_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPasswordEvaluationsForPersistentIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__WBSPasswordBreachHelperProxy_getPasswordEvaluationsForPersistentIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_1E615BAF0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(WBSPasswordBreachHelperProxy *)self _remoteObjectProxyWithErrorHandler:v10];
  [v9 getPasswordEvaluationsForPersistentIdentifiers:v8 completionHandler:v7];
}

uint64_t __97__WBSPasswordBreachHelperProxy_getPasswordEvaluationsForPersistentIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writePasswordEvaluationsToCache:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__WBSPasswordBreachHelperProxy_writePasswordEvaluationsToCache_completionHandler___block_invoke;
  v10[3] = &unk_1E615BAF0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(WBSPasswordBreachHelperProxy *)self _remoteObjectProxyWithErrorHandler:v10];
  [v9 writePasswordEvaluationsToCache:v8 completionHandler:v7];
}

uint64_t __82__WBSPasswordBreachHelperProxy_writePasswordEvaluationsToCache_completionHandler___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __82__WBSPasswordBreachHelperProxy_writePasswordEvaluationsToCache_completionHandler___block_invoke_cold_1(v2);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

- (void)_remoteObjectProxyWithErrorHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to acquire remote object proxy.", v1, 2u);
}

void __67__WBSPasswordBreachHelperProxy__remoteObjectProxyWithErrorHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Remote proxy object error handler invoked with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

void __82__WBSPasswordBreachHelperProxy_writePasswordEvaluationsToCache_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to get remote proxy", v1, 2u);
}

@end