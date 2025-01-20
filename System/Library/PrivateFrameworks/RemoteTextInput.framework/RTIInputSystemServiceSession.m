@interface RTIInputSystemServiceSession
+ (id)sessionWithConnection:(id)a3;
- (BOOL)isPaused;
- (NSSet)rtiSupplementalLexicons;
- (NSSet)supplementalLexicons;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)internalQueue;
- (RTIDataPayload)currentDataPayload;
- (RTIDocumentRequest)defaultRequest;
- (RTIInputSystemServiceSession)initWithConnection:(id)a3;
- (id)bundleIdentifier;
- (id)documentStateAfterModifyAndFlushTextOperations:(id)a3;
- (id)documentStateAfterModifyAndFlushTextOperations:(id)a3 resultHandler:(id)a4;
- (id)valueForEntitlement:(id)a3;
- (int)pid;
- (unint64_t)payloadVersion;
- (void)_flushOperationsImpl;
- (void)_flushOperationsImplWithResultHandler:(id)a3;
- (void)_killConnectionWithCallback;
- (void)_queue_sessionWithID:(id)a3 didAddRTISupplementalLexicon:(id)a4;
- (void)_queue_sessionWithID:(id)a3 didAddSupplementalLexicon:(id)a4;
- (void)_updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:(id)a3;
- (void)beginOptionsSafeAccess:(id)a3;
- (void)beginRemoteTextInputSessionWithID:(id)a3 documentTraits:(id)a4 initialDocumentState:(id)a5;
- (void)beginRemoteTextInputSessionWithID:(id)a3 options:(id)a4 documentTraits:(id)a5 initialDocumentState:(id)a6;
- (void)bundleIdentifier;
- (void)dealloc;
- (void)documentStateSafeAccess:(id)a3;
- (void)documentTraitsSafeAccess:(id)a3;
- (void)endRemoteTextInputSessionWithID:(id)a3;
- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4;
- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)flushOperations;
- (void)flushOperationsWithResultHandler:(id)a3;
- (void)handleTextActionPayload:(id)a3;
- (void)modifyAndFlushTextOperations:(id)a3;
- (void)modifyAndFlushTextOperations:(id)a3 resultHandler:(id)a4;
- (void)performDocumentRequest:(id)a3 completion:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 didAddRTISupplementalLexicon:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 didAddSupplementalLexicon:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 didChangePause:(BOOL)a4 withReason:(id)a5;
- (void)remoteTextInputSessionWithID:(id)a3 didRemoveRTISupplementalLexiconWithIdentifier:(unint64_t)a4;
- (void)remoteTextInputSessionWithID:(id)a3 didRemoveSupplementalLexiconWithIdentifier:(unint64_t)a4;
- (void)remoteTextInputSessionWithID:(id)a3 documentDidChange:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 documentTraitsDidChange:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4;
- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5;
- (void)remoteTextInputSessionWithID:(id)a3 textSuggestionsChanged:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDefaultRequest:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)textOperationsSafeAccess:(id)a3;
- (void)uuidSafeAccess:(id)a3;
@end

@implementation RTIInputSystemServiceSession

+ (id)sessionWithConnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithConnection:v4];

  return v5;
}

- (RTIInputSystemServiceSession)initWithConnection:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RTIInputSystemServiceSession;
  v5 = [(RTIInputSystemServiceSession *)&v22 init];
  v6 = v5;
  if (v5)
  {
    v5->_payloadVersion = 1;
    objc_storeWeak((id *)&v5->_connection, v4);
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.RemoteTextInput.RTIInputSystemServiceSession.Internal", v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.RemoteTextInput.RTIInputSystemServiceSession.External", v7);
    externalOperationsQueue = v6->_externalOperationsQueue;
    v6->_externalOperationsQueue = (OS_dispatch_queue *)v10;

    v6->_lifecycleDispatchState = 0;
    v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEABB8B0];
    [v4 setExportedInterface:v12];

    v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEABC9E0];
    [v4 setRemoteObjectInterface:v13];

    [v4 setExportedObject:v6];
    objc_initWeak(&location, v6);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__RTIInputSystemServiceSession_initWithConnection___block_invoke;
    v19[3] = &unk_1E583C2B0;
    objc_copyWeak(&v20, &location);
    v14 = (void *)MEMORY[0x19F3872A0](v19);
    [v4 setInterruptionHandler:v14];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__RTIInputSystemServiceSession_initWithConnection___block_invoke_91;
    v17[3] = &unk_1E583C2B0;
    objc_copyWeak(&v18, &location);
    v15 = (void *)MEMORY[0x19F3872A0](v17);
    [v4 setInvalidationHandler:v15];
    [(RTIInputSystemServiceSession *)v6 didInitializeWithConnection:v4];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __51__RTIInputSystemServiceSession_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __51__RTIInputSystemServiceSession_initWithConnection___block_invoke_cold_1();
    }

    [WeakRetained _killConnectionWithCallback];
  }
}

void __51__RTIInputSystemServiceSession_initWithConnection___block_invoke_91(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315394;
      id v4 = "-[RTIInputSystemServiceSession initWithConnection:]_block_invoke";
      __int16 v5 = 2112;
      id v6 = WeakRetained;
      _os_log_impl(&dword_19AFFA000, v2, OS_LOG_TYPE_DEFAULT, "%s  service session connection was invalidated: %@", (uint8_t *)&v3, 0x16u);
    }

    [WeakRetained _killConnectionWithCallback];
  }
}

- (void)dealloc
{
}

- (int)pid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained auditToken];
    pid_t v4 = audit_token_to_pid(&v6);
  }
  else
  {
    pid_t v4 = 0;
  }

  return v4;
}

- (id)bundleIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained auditToken];
    CPCopyBundleIdentifierAndTeamFromAuditToken();
  }
  else
  {
    pid_t v4 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(RTIInputSystemServiceSession *)v4 bundleIdentifier];
    }
  }
  return 0;
}

- (id)valueForEntitlement:(id)a3
{
  pid_t v4 = (__CFString *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  uint64_t v6 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v11 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemServiceSession valueForEntitlement:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    goto LABEL_11;
  }
  [WeakRetained auditToken];
  uint64_t v7 = SecTaskCreateWithAuditToken(0, &token);
  if (!v7)
  {
LABEL_11:
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = v7;
  CFErrorRef error = 0;
  uint64_t v9 = (void *)SecTaskCopyValueForEntitlement(v7, v4, &error);
  if (error)
  {
    uint64_t v10 = RTILogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemServiceSession valueForEntitlement:]();
    }

    CFRelease(error);
  }
  CFRelease(v8);
LABEL_12:

  return v9;
}

- (void)uuidSafeAccess:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__RTIInputSystemServiceSession_uuidSafeAccess___block_invoke;
  v7[3] = &unk_1E583C2D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __47__RTIInputSystemServiceSession_uuidSafeAccess___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) uuid];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)beginOptionsSafeAccess:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTIInputSystemServiceSession_beginOptionsSafeAccess___block_invoke;
  v7[3] = &unk_1E583C2D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __55__RTIInputSystemServiceSession_beginOptionsSafeAccess___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) beginOptions];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)documentTraitsSafeAccess:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__RTIInputSystemServiceSession_documentTraitsSafeAccess___block_invoke;
  v7[3] = &unk_1E583C2D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __57__RTIInputSystemServiceSession_documentTraitsSafeAccess___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) documentTraits];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)documentStateSafeAccess:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__RTIInputSystemServiceSession_documentStateSafeAccess___block_invoke;
  v7[3] = &unk_1E583C2D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __56__RTIInputSystemServiceSession_documentStateSafeAccess___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) documentState];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)textOperationsSafeAccess:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__RTIInputSystemServiceSession_textOperationsSafeAccess___block_invoke;
  v7[3] = &unk_1E583C2D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __57__RTIInputSystemServiceSession_textOperationsSafeAccess___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) textOperations];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_killConnectionWithCallback
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTIInputSystemServiceSession__killConnectionWithCallback__block_invoke;
  block[3] = &unk_1E583C300;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __59__RTIInputSystemServiceSession__killConnectionWithCallback__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__RTIInputSystemServiceSession__killConnectionWithCallback__block_invoke_2;
  v3[3] = &unk_1E583C210;
  v3[4] = v1;
  return [v1 enumerateSessionDelegatesUsingBlock:v3];
}

void __59__RTIInputSystemServiceSession__killConnectionWithCallback__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inputSessionDidDie:*(void *)(a1 + 32)];
  }
}

- (void)flushOperations
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTIInputSystemServiceSession_flushOperations__block_invoke;
  block[3] = &unk_1E583C300;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __47__RTIInputSystemServiceSession_flushOperations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushOperationsImpl];
}

- (void)_flushOperationsImpl
{
}

- (void)flushOperationsWithResultHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke;
  v7[3] = &unk_1E583C328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushOperationsImplWithResultHandler:*(void *)(a1 + 40)];
}

- (void)_flushOperationsImplWithResultHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v6 = [(RTIInputSystemSession *)self textOperations];

    if (v6)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __70__RTIInputSystemServiceSession__flushOperationsImplWithResultHandler___block_invoke;
      v20[3] = &unk_1E583C350;
      id v7 = v4;
      id v21 = v7;
      id v8 = [WeakRetained remoteObjectProxyWithErrorHandler:v20];
      uint64_t v9 = [(RTIInputSystemSession *)self textOperations];
      [v8 performTextOperations:v9 resultHandler:v7];

      uint64_t v10 = [(RTIInputSystemSession *)self textOperations];
      uint64_t v11 = [(RTIInputSystemSession *)self documentState];
      [(RTIInputSystemSession *)self _applyLocalTextOperations:v10 toDocumentState:v11];

      [(RTIInputSystemSession *)self setTextOperations:0];
    }
  }
  else
  {
    uint64_t v12 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemServiceSession _flushOperationsImplWithResultHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __70__RTIInputSystemServiceSession__flushOperationsImplWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__RTIInputSystemServiceSession__flushOperationsImplWithResultHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (id)documentStateAfterModifyAndFlushTextOperations:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  internalQueue = self->_internalQueue;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__RTIInputSystemServiceSession_documentStateAfterModifyAndFlushTextOperations___block_invoke;
  block[3] = &unk_1E583C378;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __79__RTIInputSystemServiceSession_documentStateAfterModifyAndFlushTextOperations___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) textOperations];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  }
  [*(id *)(a1 + 32) _flushOperationsImpl];
  id v7 = [*(id *)(a1 + 32) documentState];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)documentStateAfterModifyAndFlushTextOperations:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__RTIInputSystemServiceSession_documentStateAfterModifyAndFlushTextOperations_resultHandler___block_invoke;
  v13[3] = &unk_1E583C3A0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __93__RTIInputSystemServiceSession_documentStateAfterModifyAndFlushTextOperations_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) textOperations];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  }
  [*(id *)(a1 + 32) _flushOperationsImplWithResultHandler:*(void *)(a1 + 48)];
  id v7 = [*(id *)(a1 + 32) documentState];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)modifyAndFlushTextOperations:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__RTIInputSystemServiceSession_modifyAndFlushTextOperations___block_invoke;
  v7[3] = &unk_1E583C2D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __61__RTIInputSystemServiceSession_modifyAndFlushTextOperations___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) textOperations];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 _flushOperationsImpl];
}

- (void)modifyAndFlushTextOperations:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTIInputSystemServiceSession_modifyAndFlushTextOperations_resultHandler___block_invoke;
  block[3] = &unk_1E583C3C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, block);
}

uint64_t __75__RTIInputSystemServiceSession_modifyAndFlushTextOperations_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) textOperations];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 _flushOperationsImplWithResultHandler:v5];
}

- (RTIDocumentRequest)defaultRequest
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__RTIInputSystemServiceSession_defaultRequest__block_invoke;
  v6[3] = &unk_1E583C3F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(internalQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (RTIDocumentRequest *)v4;
}

void __46__RTIInputSystemServiceSession_defaultRequest__block_invoke(uint64_t a1)
{
}

- (void)setDefaultRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__RTIInputSystemServiceSession_setDefaultRequest___block_invoke;
  v7[3] = &unk_1E583C418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __50__RTIInputSystemServiceSession_setDefaultRequest___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), *(id *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained remoteObjectProxy];
    [v4 updateDefaultDocumentRequest:*(void *)(*(void *)(a1 + 32) + 120)];
  }
  else
  {
    uint64_t v5 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __50__RTIInputSystemServiceSession_setDefaultRequest___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke;
  block[3] = &unk_1E583C440;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(internalQueue, block);
}

void __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 40);
    if (!v3) {
      id v3 = *(void **)(*(void *)(a1 + 32) + 120);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_98;
    v15[3] = &unk_1E583C350;
    id v16 = *(id *)(a1 + 48);
    id v4 = v3;
    uint64_t v5 = [WeakRetained remoteObjectProxyWithErrorHandler:v15];
    [v5 performDocumentRequest:v4 completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      (*(void (**)(uint64_t, void))(v14 + 16))(v14, 0);
    }
  }
}

void __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_98_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (NSSet)supplementalLexicons
{
  return (NSSet *)self->_supplementalLexicons;
}

- (NSSet)rtiSupplementalLexicons
{
  return (NSSet *)self->_rtiSupplementalLexicons;
}

- (void)_updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v5 = [(RTIInputSystemServiceSession *)self bundleIdentifier];
  uint64_t v6 = [(RTIInputSystemServiceSession *)self pid];
  uint64_t v7 = [(RTIInputSystemServiceSession *)self valueForEntitlement:@"application-identifier"];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  uint64_t v8 = (void *)getLSApplicationProxyClass_softClass;
  uint64_t v25 = getLSApplicationProxyClass_softClass;
  if (!getLSApplicationProxyClass_softClass)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __getLSApplicationProxyClass_block_invoke;
    v21[3] = &unk_1E583C6C0;
    v21[4] = &v22;
    __getLSApplicationProxyClass_block_invoke((uint64_t)v21);
    uint64_t v8 = (void *)v23[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v22, 8);
  uint64_t v10 = [v9 applicationProxyForIdentifier:v5];
  uint64_t v11 = [v10 localizedName];
  uint64_t v12 = *MEMORY[0x1E4F1CC48];
  uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F1CC48]];
  uint64_t v14 = [v10 objectsForInfoDictionaryKeys:v13];
  id v15 = [v14 stringForKey:v12];

  id v16 = [(RTIInputSystemSession *)self documentTraits];
  [v16 setAppId:v7];

  uint64_t v17 = [(RTIInputSystemSession *)self documentTraits];
  [v17 setBundleId:v5];

  uint64_t v18 = [(RTIInputSystemSession *)self documentTraits];
  [v18 setAppName:v15];

  uint64_t v19 = [(RTIInputSystemSession *)self documentTraits];
  [v19 setLocalizedAppName:v11];

  id v20 = [(RTIInputSystemSession *)self documentTraits];
  [v20 setProcessId:v6];

  v4[2](v4);
}

- (RTIDataPayload)currentDataPayload
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  id v3 = +[RTIInputSystemDataPayload payloadWithData:0 version:[(RTIInputSystemServiceSession *)self payloadVersion]];
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__RTIInputSystemServiceSession_currentDataPayload__block_invoke;
  v8[3] = &unk_1E583C418;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = self;
  dispatch_sync(internalQueue, v8);
  uint64_t v6 = (RTIDataPayload *)v5;

  return v6;
}

uint64_t __50__RTIInputSystemServiceSession_currentDataPayload__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) documentTraits];
  [*(id *)(a1 + 32) setDocumentTraits:v2];

  id v3 = [*(id *)(a1 + 40) documentState];
  [*(id *)(a1 + 32) setDocumentState:v3];

  id v4 = [*(id *)(a1 + 40) _textOperations];
  [*(id *)(a1 + 32) setTextOperations:v4];

  id v5 = [*(id *)(a1 + 40) uuid];
  [*(id *)(a1 + 32) setSessionUUID:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 updateData];
}

- (void)beginRemoteTextInputSessionWithID:(id)a3 documentTraits:(id)a4 initialDocumentState:(id)a5
{
}

- (void)beginRemoteTextInputSessionWithID:(id)a3 options:(id)a4 documentTraits:(id)a5 initialDocumentState:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[RTIInputSystemServiceSession beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:]";
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_19AFFA000, v14, OS_LOG_TYPE_DEFAULT, "%s  Begin input session: %@", buf, 0x16u);
  }

  externalOperationsQueue = self->_externalOperationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke;
  block[3] = &unk_1E583C418;
  block[4] = self;
  id v16 = v11;
  id v28 = v16;
  dispatch_async(externalOperationsQueue, block);
  self->_lifecycleDispatchState = 1;
  internalQueue = self->_internalQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_3;
  v22[3] = &unk_1E583C4E0;
  v22[4] = self;
  id v23 = v10;
  id v24 = v16;
  id v25 = v12;
  id v26 = v13;
  id v18 = v13;
  id v19 = v12;
  id v20 = v16;
  id v21 = v10;
  dispatch_async(internalQueue, v22);
}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_2;
  v2[3] = &unk_1E583C468;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateSessionDelegatesUsingBlock:v2];
}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 prepareForInputSession:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  }
}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setUuid:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setBeginOptions:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setDocumentTraits:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setDocumentState:*(void *)(a1 + 64)];
  uint64_t v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_4;
  v9[3] = &unk_1E583C418;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 48);
  [v2 _updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:v9];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 88);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_6;
  v8[3] = &unk_1E583C490;
  void v8[4] = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 96);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_7;
  v7[3] = &unk_1E583C4B8;
  v7[4] = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
  [*(id *)(*(void *)(a1 + 32) + 96) removeAllObjects];
}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_5;
  v2[3] = &unk_1E583C468;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateSessionDelegatesUsingBlock:v2];
}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 inputSessionDidBegin:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 inputSessionDidBegin:*(void *)(a1 + 32)];
  }
}

uint64_t __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sessionWithID:didAddSupplementalLexicon:", a2, a3);
}

uint64_t __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sessionWithID:didAddRTISupplementalLexicon:", a2, a3);
}

- (void)remoteTextInputSessionWithID:(id)a3 documentDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentDidChange___block_invoke;
  block[3] = &unk_1E583C508;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __79__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = (void *)[*(id *)(a1 + 48) copy];
    [*(id *)(a1 + 32) setDocumentState:v4];

    uint64_t v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentDidChange___block_invoke_2;
    v6[3] = &unk_1E583C468;
    v6[4] = v5;
    id v7 = *(id *)(a1 + 48);
    [v5 enumerateSessionDelegatesUsingBlock:v6];
  }
}

void __79__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inputSession:*(void *)(a1 + 32) documentStateDidChange:*(void *)(a1 + 40)];
  }
}

- (void)endRemoteTextInputSessionWithID:(id)a3
{
}

- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4
{
}

- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = RTIInputSessionChangeLogFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[RTIInputSystemServiceSession endRemoteTextInputSessionWithID:options:completion:]";
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_19AFFA000, v11, OS_LOG_TYPE_DEFAULT, "%s  End input session: %@", buf, 0x16u);
  }

  id v12 = [(RTIInputSystemSession *)self uuid];
  int v13 = [v12 isEqual:v8];

  if (v13) {
    self->_lifecycleDispatchState = 2;
  }
  internalQueue = self->_internalQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke;
  v18[3] = &unk_1E583C558;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  dispatch_async(internalQueue, v18);
}

void __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  char v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    dispatch_group_t v4 = dispatch_group_create();
    dispatch_time_t v5 = dispatch_time(0, 2100000000);
    id v6 = *(void **)(a1 + 32);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_2;
    __int16 v24 = &unk_1E583C530;
    id v28 = *(id *)(a1 + 56);
    id v7 = v4;
    uint64_t v8 = *(void *)(a1 + 32);
    id v25 = v7;
    uint64_t v26 = v8;
    id v27 = *(id *)(a1 + 48);
    [v6 enumerateSessionDelegatesUsingBlock:&v21];
    if (*(void *)(a1 + 56))
    {
      if (dispatch_group_wait(v7, v5))
      {
        uint64_t v14 = RTIInputSessionChangeLogFacility();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_cold_1();
        }
      }
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v9, v10, v11, v12, v13);
    }
    id v15 = objc_msgSend(*(id *)(a1 + 32), "documentTraits", v21, v22, v23, v24);
    id v16 = [v15 textInputTraits];
    int v17 = [v16 secureTextEntry];

    if (v17)
    {
      id v18 = objc_alloc_init(RTIDocumentState);
      [*(id *)(a1 + 32) setDocumentState:v18];
    }
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 56);
    if (v19)
    {
      id v20 = *(void (**)(void))(v19 + 16);
      v20();
    }
  }
}

void __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 56) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_3;
    v6[3] = &unk_1E583C300;
    id v7 = *(id *)(a1 + 32);
    [v3 inputSessionDidEnd:v4 options:v5 completion:v6];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 inputSessionDidEnd:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 inputSessionDidEnd:*(void *)(a1 + 40)];
  }
}

void __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_3(uint64_t a1)
{
}

- (void)remoteTextInputSessionWithID:(id)a3 documentTraitsDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke;
  block[3] = &unk_1E583C508;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_2;
    v10[3] = &unk_1E583C300;
    v10[4] = *(void *)(a1 + 32);
    uint64_t v4 = (void (**)(void))MEMORY[0x19F3872A0](v10);
    uint64_t v5 = [*(id *)(a1 + 32) documentTraits];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) documentTraits];
      [v6 copyContextualPropertiesFromDocumentTraits:*(void *)(a1 + 48)];

      v4[2](v4);
    }
    else
    {
      [*(id *)(a1 + 32) setDocumentTraits:*(void *)(a1 + 48)];
      id v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_4;
      v8[3] = &unk_1E583C580;
      id v9 = v4;
      [v7 _updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:v8];
    }
  }
}

uint64_t __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_3;
  v3[3] = &unk_1E583C210;
  v3[4] = v1;
  return [v1 enumerateSessionDelegatesUsingBlock:v3];
}

void __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 documentTraits];
    [v5 inputSession:v3 documentTraitsDidChange:v4];
  }
}

uint64_t __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remoteTextInputSessionWithID:(id)a3 didChangePause:(BOOL)a4 withReason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = RTILogFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didChangePause:withReason:]";
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    _os_log_impl(&dword_19AFFA000, v10, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ did change pause: %d", buf, 0x1Cu);
  }

  internalQueue = self->_internalQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didChangePause_withReason___block_invoke;
  v14[3] = &unk_1E583C5D0;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = v6;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(internalQueue, v14);
}

void __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didChangePause_withReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    [*(id *)(a1 + 32) setIsPaused:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didChangePause_withReason___block_invoke_2;
    v5[3] = &unk_1E583C5A8;
    v5[4] = v4;
    char v7 = *(unsigned char *)(a1 + 56);
    id v6 = *(id *)(a1 + 48);
    [v4 enumerateSessionDelegatesUsingBlock:v5];
  }
}

void __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didChangePause_withReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inputSession:*(void *)(a1 + 32) didChangePause:*(unsigned __int8 *)(a1 + 48) withReason:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 textSuggestionsChanged:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = RTILogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:textSuggestionsChanged:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19AFFA000, v8, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ text suggestions changed", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__RTIInputSystemServiceSession_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke;
  block[3] = &unk_1E583C508;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(internalQueue, block);
}

void __84__RTIInputSystemServiceSession_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __84__RTIInputSystemServiceSession_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke_2;
    v5[3] = &unk_1E583C468;
    v5[4] = v4;
    id v6 = *(id *)(a1 + 48);
    [v4 enumerateSessionDelegatesUsingBlock:v5];
  }
}

void __84__RTIInputSystemServiceSession_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inputSession:*(void *)(a1 + 32) textSuggestionsChanged:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 didAddSupplementalLexicon:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = RTILogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didAddSupplementalLexicon:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19AFFA000, v8, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ didAddSupplementalLexicon", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didAddSupplementalLexicon___block_invoke;
  block[3] = &unk_1E583C508;
  block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(internalQueue, block);
}

uint64_t __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didAddSupplementalLexicon___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return objc_msgSend(v3, "_queue_sessionWithID:didAddSupplementalLexicon:", v4, v5);
  }
  else
  {
    id v7 = (void *)v3[11];
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 88);
      *(void *)(v9 + 88) = v8;

      id v7 = *(void **)(*(void *)(a1 + 32) + 88);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    return [v7 setObject:v11 forKey:v12];
  }
}

- (void)_queue_sessionWithID:(id)a3 didAddSupplementalLexicon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RTIInputSystemSession *)self uuid];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    supplementalLexicons = self->_supplementalLexicons;
    if (!supplementalLexicons)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      uint64_t v12 = self->_supplementalLexicons;
      self->_supplementalLexicons = v11;

      supplementalLexicons = self->_supplementalLexicons;
    }
    [(NSMutableSet *)supplementalLexicons addObject:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__RTIInputSystemServiceSession__queue_sessionWithID_didAddSupplementalLexicon___block_invoke;
    v13[3] = &unk_1E583C468;
    v13[4] = self;
    id v14 = v6;
    [(RTIInputSystemSession *)self enumerateSessionDelegatesUsingBlock:v13];
  }
}

void __79__RTIInputSystemServiceSession__queue_sessionWithID_didAddSupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inputSession:*(void *)(a1 + 32) didAddSupplementalLexicon:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = RTILogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didAddRTISupplementalLexicon:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19AFFA000, v8, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ didAddRTISupplementalLexicon", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didAddRTISupplementalLexicon___block_invoke;
  block[3] = &unk_1E583C508;
  block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(internalQueue, block);
}

uint64_t __90__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didAddRTISupplementalLexicon___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return objc_msgSend(v3, "_queue_sessionWithID:didAddRTISupplementalLexicon:", v4, v5);
  }
  else
  {
    id v7 = (void *)v3[12];
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 96);
      *(void *)(v9 + 96) = v8;

      id v7 = *(void **)(*(void *)(a1 + 32) + 96);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    return [v7 setObject:v11 forKey:v12];
  }
}

- (void)_queue_sessionWithID:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RTIInputSystemSession *)self uuid];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    rtiSupplementalLexicons = self->_rtiSupplementalLexicons;
    if (!rtiSupplementalLexicons)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      uint64_t v12 = self->_rtiSupplementalLexicons;
      self->_rtiSupplementalLexicons = v11;

      rtiSupplementalLexicons = self->_rtiSupplementalLexicons;
    }
    [(NSMutableSet *)rtiSupplementalLexicons addObject:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__RTIInputSystemServiceSession__queue_sessionWithID_didAddRTISupplementalLexicon___block_invoke;
    v13[3] = &unk_1E583C468;
    v13[4] = self;
    id v14 = v6;
    [(RTIInputSystemSession *)self enumerateSessionDelegatesUsingBlock:v13];
  }
}

void __82__RTIInputSystemServiceSession__queue_sessionWithID_didAddRTISupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inputSession:*(void *)(a1 + 32) didAddRTISupplementalLexicon:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 didRemoveSupplementalLexiconWithIdentifier:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = RTILogFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didRemoveSupplementalLexiconWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_19AFFA000, v7, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ didRemoveSupplementalLexiconWithIdentifier", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke;
  block[3] = &unk_1E583C648;
  block[4] = self;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  dispatch_async(internalQueue, block);
}

void __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    unint64_t v12 = __Block_byref_object_copy_;
    id v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 72);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke_2;
    v8[3] = &unk_1E583C5F8;
    uint64_t v5 = *(void *)(a1 + 48);
    void v8[4] = &v9;
    void v8[5] = v5;
    [v4 enumerateObjectsUsingBlock:v8];
    if (v10[5])
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "removeObject:");
      id v6 = *(void **)(a1 + 32);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke_3;
      v7[3] = &unk_1E583C620;
      v7[4] = v6;
      void v7[5] = &v9;
      [v6 enumerateSessionDelegatesUsingBlock:v7];
    }
    _Block_object_dispose(&v9, 8);
  }
}

void __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 identifier] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inputSession:*(void *)(a1 + 32) didRemoveSupplementalLexicon:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 didRemoveRTISupplementalLexiconWithIdentifier:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = RTILogFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_19AFFA000, v7, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ didRemoveRTISupplementalLexiconWithIdentifier", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke;
  block[3] = &unk_1E583C648;
  block[4] = self;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  dispatch_async(internalQueue, block);
}

void __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    unint64_t v12 = __Block_byref_object_copy_;
    id v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 80);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke_2;
    v8[3] = &unk_1E583C670;
    uint64_t v5 = *(void *)(a1 + 48);
    void v8[4] = &v9;
    void v8[5] = v5;
    [v4 enumerateObjectsUsingBlock:v8];
    if (v10[5])
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "removeObject:");
      id v6 = *(void **)(a1 + 32);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke_3;
      v7[3] = &unk_1E583C620;
      v7[4] = v6;
      void v7[5] = &v9;
      [v6 enumerateSessionDelegatesUsingBlock:v7];
    }
    _Block_object_dispose(&v9, 8);
  }
}

void __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 identifier] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inputSession:*(void *)(a1 + 32) didRemoveRTISupplementalLexicon:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation___block_invoke;
  block[3] = &unk_1E583C508;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __83__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __83__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation___block_invoke_2;
    v5[3] = &unk_1E583C468;
    v5[4] = v4;
    id v6 = *(id *)(a1 + 48);
    [v4 enumerateSessionDelegatesUsingBlock:v5];
  }
}

void __83__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 inputSession:*(void *)(a1 + 32) performInputOperation:*(void *)(a1 + 40)];
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke;
  v15[3] = &unk_1E583C558;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] uuid];
  char v3 = [v2 isEqual:a1[5]];

  if (v3)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    char v13 = 0;
    id v4 = a1[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2;
    v7[3] = &unk_1E583C698;
    v7[4] = v4;
    id v8 = a1[6];
    id v10 = a1[7];
    uint64_t v11 = v12;
    id v9 = a1[5];
    [v4 enumerateSessionDelegatesUsingBlock:v7];

    _Block_object_dispose(v12, 8);
  }
  else
  {
    id v5 = a1[7];
    if (v5)
    {
      id v6 = (void (*)(void))*((void *)v5 + 2);
      v6();
    }
  }
}

void __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 inputSession:a1[4] performInputOperation:a1[5] withResponse:a1[7]];
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(a1[8] + 8) + 24) && a1[7])
  {
    id v4 = RTILogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (void)handleTextActionPayload:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [v4 data];
    +[RTIInputSystemDataPayload payloadWithData:version:](RTIInputSystemDataPayload, "payloadWithData:version:", v6, [v4 version]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t payloadVersion = self->_payloadVersion;
  unint64_t v8 = [v4 version];
  if (payloadVersion >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = payloadVersion;
  }
  self->_unint64_t payloadVersion = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    if ([v5 version] == 1)
    {
      uint64_t v11 = [v5 textOperations];

      if (v11)
      {
        id v12 = [WeakRetained remoteObjectProxy];
        char v13 = [v5 textOperations];
        [v12 performTextOperations:v13];

        internalQueue = self->_internalQueue;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __56__RTIInputSystemServiceSession_handleTextActionPayload___block_invoke;
        v23[3] = &unk_1E583C418;
        v23[4] = self;
        id v24 = v5;
        dispatch_async(internalQueue, v23);
      }
    }
  }
  else
  {
    __int16 v15 = RTIInputSessionChangeLogFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RTIInputSystemServiceSession handleTextActionPayload:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

void __56__RTIInputSystemServiceSession_handleTextActionPayload___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) textOperations];
  id v3 = [*(id *)(a1 + 32) documentState];
  [v2 _applyLocalTextOperations:v4 toDocumentState:v3];
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (unint64_t)payloadVersion
{
  return self->_payloadVersion;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_defaultRequest, 0);
  objc_storeStrong((id *)&self->_pendingRTISupplementalLexicons, 0);
  objc_storeStrong((id *)&self->_pendingSupplementalLexicons, 0);
  objc_storeStrong((id *)&self->_rtiSupplementalLexicons, 0);
  objc_storeStrong((id *)&self->_supplementalLexicons, 0);
  objc_storeStrong((id *)&self->_externalOperationsQueue, 0);
}

void __51__RTIInputSystemServiceSession_initWithConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  service session connection was interrupted: %@", v2, v3, v4, v5, 2u);
}

- (void)bundleIdentifier
{
}

- (void)valueForEntitlement:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)valueForEntitlement:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Cannot obtain entitlement: %@", v2, v3, v4, v5, 2u);
}

- (void)_flushOperationsImplWithResultHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__RTIInputSystemServiceSession__flushOperationsImplWithResultHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Error sending -[connection.remoteObjectProxy performTextOperations:resultHandler:] message: %@", v2, v3, v4, v5, 2u);
}

void __50__RTIInputSystemServiceSession_setDefaultRequest___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_98_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Error sending -[client performDocumentRequest:completion:] message: %@", v2, v3, v4, v5, 2u);
}

void __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  Timeout while waiting to end session. sessionID = %@", v2, v3, v4, v5, 2u);
}

void __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19AFFA000, v0, v1, "%s  No delegates for session: %@", v2, v3, v4, v5, 2u);
}

- (void)handleTextActionPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end