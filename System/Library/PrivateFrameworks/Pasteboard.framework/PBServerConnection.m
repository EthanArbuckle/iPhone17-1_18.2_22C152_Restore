@interface PBServerConnection
+ (id)defaultConnection;
+ (unint64_t)beginListeningToPasteboardChangeNotifications;
+ (void)simulateCrashReportForAuthorizationWithAuthenticationMessage:(id)a3;
- (NSXPCConnection)memberQ_serverConnection;
- (NSXPCConnection)serverConnection;
- (OS_dispatch_queue)memberQueue;
- (PBServerConnection)init;
- (id)localGeneralPasteboardWithAuthenticationBlock:(id)a3 dataOwnerBlock:(id)a4 error:(id *)a5;
- (id)pasteboardWithName:(id)a3 createIfNeeded:(BOOL)a4 authenticationBlock:(id)a5 dataOwnerBlock:(id)a6 error:(id *)a7;
- (id)pasteboardWithName:(id)a3 error:(id *)a4;
- (id)remoteContentForLayerContextWithId:(unint64_t)a3 slotStyle:(id)a4 pasteButtonTag:(id)a5 error:(id *)a6;
- (id)remoteContentForSlotStyle:(id)a3 pasteButtonTag:(id)a4 error:(id *)a5;
- (id)requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 error:(id *)a5;
- (id)savePasteboard:(id)a3 dataProviderEndpoint:(id)a4 error:(id *)a5;
- (unint64_t)deletePersistentPasteboardWithName:(id)a3 error:(id *)a4;
- (void)deletePersistentPasteboardWithName:(id)a3 completionBlock:(id)a4;
- (void)didPastePasteboard:(id)a3;
- (void)getAllPasteboardsCompletionBlock:(id)a3;
- (void)helloCompletionBlock:(id)a3;
- (void)localGeneralPasteboardCompletionBlock:(id)a3;
- (void)localGeneralPasteboardWithAuthenticationBlock:(id)a3 completionBlock:(id)a4;
- (void)localGeneralPasteboardWithAuthenticationBlock:(id)a3 dataOwnerBlock:(id)a4 completionBlock:(id)a5;
- (void)pasteboardWithName:(id)a3 completionBlock:(id)a4;
- (void)pasteboardWithName:(id)a3 createIfNeeded:(BOOL)a4 authenticationBlock:(id)a5 dataOwnerBlock:(id)a6 completionBlock:(id)a7;
- (void)performJanitorialTasksCompletionBlock:(id)a3;
- (void)requestItemFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 typeIdentifier:(id)a7 dataOwner:(int64_t)a8 loadContext:(id)a9 completionBlock:(id)a10;
- (void)requestPatternDetectionsFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 patterns:(id)a7 needValues:(BOOL)a8 dataOwner:(int64_t)a9 completionBlock:(id)a10;
- (void)savePasteboard:(id)a3 dataProviderEndpoint:(id)a4 completionBlock:(id)a5;
- (void)setMemberQ_serverConnection:(id)a3;
- (void)setMemberQueue:(id)a3;
@end

@implementation PBServerConnection

- (void)localGeneralPasteboardCompletionBlock:(id)a3
{
}

uint64_t __39__PBServerConnection_defaultConnection__block_invoke()
{
  _MergedGlobals_0 = objc_alloc_init(PBServerConnection);
  return MEMORY[0x1F41817F8]();
}

- (PBServerConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBServerConnection;
  v2 = [(PBServerConnection *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Pasteboard.PBServerConnection-member-queue", 0);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)defaultConnection
{
  if (qword_1EB3B8570 != -1) {
    dispatch_once(&qword_1EB3B8570, &__block_literal_global_0);
  }
  v2 = (void *)_MergedGlobals_0;
  return v2;
}

void __97__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_error___block_invoke_21(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _PBLog();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      int v16 = 138412546;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_18D208000, v8, OS_LOG_TYPE_ERROR, "...retrieving pasteboard named %@ failed with error: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = a1[4];
    int v16 = 138412290;
    uint64_t v17 = v10;
    _os_log_impl(&dword_18D208000, v8, OS_LOG_TYPE_INFO, "...retrieving pasteboard named %@ completed successfully.", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v11 = *(void *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
  id v13 = v5;

  uint64_t v14 = *(void *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v6;
}

uint64_t __38__PBServerConnection_serverConnection__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "memberQ_serverConnection");

  if (!v2)
  {
    dispatch_queue_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.pasteboard.pasted" options:4096];
    v4 = PBNewClientToServerXPCInterface();
    [v3 setRemoteObjectInterface:v4];

    objc_msgSend(*(id *)(a1 + 32), "setMemberQ_serverConnection:", v3);
    [v3 resume];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "memberQ_serverConnection");
  return MEMORY[0x1F41817F8]();
}

- (NSXPCConnection)memberQ_serverConnection
{
  return self->_memberQ_serverConnection;
}

- (void)setMemberQ_serverConnection:(id)a3
{
}

+ (unint64_t)beginListeningToPasteboardChangeNotifications
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = _notificationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PBServerConnection_beginListeningToPasteboardChangeNotifications__block_invoke;
  block[3] = &unk_1E5555E48;
  block[4] = &v6;
  dispatch_sync(v2, block);

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)pasteboardWithName:(id)a3 createIfNeeded:(BOOL)a4 authenticationBlock:(id)a5 dataOwnerBlock:(id)a6 error:(id *)a7
{
  BOOL v10 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  id v36 = 0;
  v15 = [(PBServerConnection *)self serverConnection];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __97__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_error___block_invoke;
  v30[3] = &unk_1E5555D28;
  v30[4] = &v37;
  int v16 = _loggingErrorHandler((uint64_t)"-[PBServerConnection pasteboardWithName:createIfNeeded:authenticationBlock:dataOwnerBlock:error:]", v30);
  uint64_t v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v16];

  __int16 v18 = _PBLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v44 = v12;
    __int16 v45 = 1024;
    BOOL v46 = v10;
    _os_log_impl(&dword_18D208000, v18, OS_LOG_TYPE_INFO, "Retrieving pasteboard named %@, create if needed: %{BOOL}d", buf, 0x12u);
  }

  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __97__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_error___block_invoke_21;
  v26 = &unk_1E5555D50;
  id v19 = v12;
  id v27 = v19;
  v28 = &v31;
  v29 = &v37;
  [v17 pasteboardWithName:v19 createIfNeeded:v10 completionBlock:&v23];
  uint64_t v20 = (void *)v38[5];
  if (v20)
  {
    if (a7) {
      *a7 = v20;
    }
  }
  else
  {
    objc_msgSend((id)v32[5], "setUsesServerConnectionToLoadDataWithAuthenticationBlock:dataOwnerBlock:", v13, v14, v23, v24, v25, v26);
    [(id)v32[5] registerLocalAvailableDerivedRepresentations];
  }
  id v21 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v21;
}

- (void)localGeneralPasteboardWithAuthenticationBlock:(id)a3 dataOwnerBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PBServerConnection *)self serverConnection];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_completionBlock___block_invoke;
  v24[3] = &unk_1E5555BE8;
  id v12 = v10;
  id v25 = v12;
  id v13 = _loggingErrorHandler((uint64_t)"-[PBServerConnection localGeneralPasteboardWithAuthenticationBlock:dataOwnerBlock:completionBlock:]", v24);
  id v14 = [v11 remoteObjectProxyWithErrorHandler:v13];

  v15 = _PBLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D208000, v15, OS_LOG_TYPE_INFO, "Retrieving local-only general pasteboard.", buf, 2u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_completionBlock___block_invoke_7;
  v19[3] = &unk_1E5555C38;
  id v20 = v8;
  id v21 = v9;
  id v22 = v12;
  id v16 = v12;
  id v17 = v9;
  id v18 = v8;
  [v14 localGeneralPasteboardCompletionBlock:v19];
}

- (NSXPCConnection)serverConnection
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  unint64_t v3 = [(PBServerConnection *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PBServerConnection_serverConnection__block_invoke;
  v6[3] = &unk_1E5555BC0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

void __99__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_completionBlock___block_invoke_7(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _PBLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_18D208000, v8, OS_LOG_TYPE_ERROR, "...retrieving local-only general pasteboard failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18D208000, v8, OS_LOG_TYPE_INFO, "...retrieving local-only general pasteboard completed successfully.", (uint8_t *)&v10, 2u);
    }

    [v5 setUsesServerConnectionToLoadDataWithAuthenticationBlock:a1[4] dataOwnerBlock:a1[5]];
  }
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

uint64_t __67__PBServerConnection_beginListeningToPasteboardChangeNotifications__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_notificationQueue_token < 0)
  {
    v2 = (const char *)[@"com.apple.pasteboard.notify.changed" UTF8String];
    unint64_t v3 = _notificationQueue();
    uint32_t v4 = notify_register_dispatch(v2, &_notificationQueue_token, v3, &__block_literal_global_34);

    id v5 = _PBLog();
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8[0] = 67109120;
        v8[1] = v4;
        _os_log_error_impl(&dword_18D208000, v6, OS_LOG_TYPE_ERROR, "Could not register for global pasteboard change notifications. Error: %d", (uint8_t *)v8, 8u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_18D208000, v6, OS_LOG_TYPE_INFO, "Began listening to global pasteboard change notifications.", (uint8_t *)v8, 2u);
    }
  }
  uint64_t result = _notificationQueue_getState();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (void)simulateCrashReportForAuthorizationWithAuthenticationMessage:(id)a3
{
  uint32_t v4 = _PBLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
  if (a3)
  {
    if (v5)
    {
      __int16 v8 = 0;
      id v6 = "This application is not expected to prompt for paste authorization. A paste authentication message was sent, "
           "but rejected by pasted. Consult the logs from pasted to see why paste authentication was rejected.";
      uint64_t v7 = (uint8_t *)&v8;
LABEL_7:
      _os_log_fault_impl(&dword_18D208000, v4, OS_LOG_TYPE_FAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    id v6 = "This application is not expected to prompt for paste authorization. Please adopt secure paste controls instead.";
    uint64_t v7 = buf;
    goto LABEL_7;
  }
}

- (void)helloCompletionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PBServerConnection *)self serverConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__PBServerConnection_helloCompletionBlock___block_invoke;
  v9[3] = &unk_1E5555BE8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = _loggingErrorHandler((uint64_t)"-[PBServerConnection helloCompletionBlock:]", v9);
  __int16 v8 = [v5 remoteObjectProxyWithErrorHandler:v7];

  [v8 helloCompletionBlock:v6];
}

uint64_t __43__PBServerConnection_helloCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pasteboardWithName:(id)a3 completionBlock:(id)a4
{
}

- (void)pasteboardWithName:(id)a3 createIfNeeded:(BOOL)a4 authenticationBlock:(id)a5 dataOwnerBlock:(id)a6 completionBlock:(id)a7
{
  BOOL v10 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(PBServerConnection *)self serverConnection];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __107__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_completionBlock___block_invoke;
  v30[3] = &unk_1E5555BE8;
  id v17 = v15;
  id v31 = v17;
  id v18 = _loggingErrorHandler((uint64_t)"-[PBServerConnection pasteboardWithName:createIfNeeded:authenticationBlock:dataOwnerBlock:completionBlock:]", v30);
  id v19 = [v16 remoteObjectProxyWithErrorHandler:v18];

  id v20 = _PBLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v12;
    __int16 v34 = 1024;
    BOOL v35 = v10;
    _os_log_impl(&dword_18D208000, v20, OS_LOG_TYPE_INFO, "Retrieving pasteboard named %@, create if needed: %d", buf, 0x12u);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __107__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_completionBlock___block_invoke_5;
  v25[3] = &unk_1E5555C10;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = v17;
  id v21 = v17;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  [v19 pasteboardWithName:v24 createIfNeeded:v10 completionBlock:v25];
}

void __107__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __107__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_completionBlock___block_invoke_5(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _PBLog();
  __int16 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[4];
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_18D208000, v8, OS_LOG_TYPE_ERROR, "...retrieving pasteboard named %@ failed with error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = a1[4];
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_18D208000, v8, OS_LOG_TYPE_INFO, "...retrieving pasteboard named %@ completed successfully.", (uint8_t *)&v12, 0xCu);
    }

    [v5 setUsesServerConnectionToLoadDataWithAuthenticationBlock:a1[5] dataOwnerBlock:a1[6]];
  }
  uint64_t v10 = a1[7];
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)localGeneralPasteboardWithAuthenticationBlock:(id)a3 completionBlock:(id)a4
{
}

void __99__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (void)savePasteboard:(id)a3 dataProviderEndpoint:(id)a4 completionBlock:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(PBServerConnection *)self serverConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__PBServerConnection_savePasteboard_dataProviderEndpoint_completionBlock___block_invoke;
  v22[3] = &unk_1E5555BE8;
  id v12 = v9;
  id v23 = v12;
  uint64_t v13 = _loggingErrorHandler((uint64_t)"-[PBServerConnection savePasteboard:dataProviderEndpoint:completionBlock:]", v22);
  __int16 v14 = [v11 remoteObjectProxyWithErrorHandler:v13];

  id v15 = _PBLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v8 name];
    *(_DWORD *)buf = 138412290;
    id v25 = v16;
    _os_log_impl(&dword_18D208000, v15, OS_LOG_TYPE_INFO, "Saving pasteboard name %@", buf, 0xCu);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__PBServerConnection_savePasteboard_dataProviderEndpoint_completionBlock___block_invoke_8;
  v19[3] = &unk_1E5555C60;
  id v20 = v8;
  id v21 = v12;
  id v17 = v12;
  id v18 = v8;
  [v14 savePasteboard:v18 dataProviderEndpoint:v10 completionBlock:v19];
}

void __74__PBServerConnection_savePasteboard_dataProviderEndpoint_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __74__PBServerConnection_savePasteboard_dataProviderEndpoint_completionBlock___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _PBLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_18D208000, v8, OS_LOG_TYPE_ERROR, "...saving pasteboard failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18D208000, v8, OS_LOG_TYPE_INFO, "...saving pasteboard completed successfully.", (uint8_t *)&v10, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setChangeCount:", objc_msgSend(v5, "changeCount"));
    id v8 = [v5 sharingToken];
    [*(id *)(a1 + 32) setSharingToken:v8];
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)requestItemFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 typeIdentifier:(id)a7 dataOwner:(int64_t)a8 loadContext:(id)a9 completionBlock:(id)a10
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a10;
  id v20 = a9;
  id v21 = [(PBServerConnection *)self serverConnection];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __146__PBServerConnection_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock___block_invoke;
  v32[3] = &unk_1E5555BE8;
  id v22 = v19;
  id v33 = v22;
  id v23 = _loggingErrorHandler((uint64_t)"-[PBServerConnection requestItemFromPasteboardWithName:UUID:authenticationMessage:itemIndex:typeIdentifier:dataOwner:loadContext:completionBlock:]", v32);
  id v24 = [v21 remoteObjectProxyWithErrorHandler:v23];

  id v25 = _PBLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    int v35 = a6;
    __int16 v36 = 2112;
    id v37 = v18;
    __int16 v38 = 2112;
    id v39 = v15;
    __int16 v40 = 2112;
    id v41 = v16;
    _os_log_impl(&dword_18D208000, v25, OS_LOG_TYPE_INFO, "Requesting item %u of type %@ from pasteboard named %@, UUID %@", buf, 0x26u);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __146__PBServerConnection_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock___block_invoke_10;
  v29[3] = &unk_1E5555C88;
  id v30 = v17;
  id v31 = v22;
  id v26 = v22;
  id v27 = v17;
  [v24 requestItemFromPasteboardWithName:v15 UUID:v16 authenticationMessage:v27 itemIndex:a6 typeIdentifier:v18 dataOwner:a8 loadContext:v20 completionBlock:v29];
}

void __146__PBServerConnection_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
  }
}

void __146__PBServerConnection_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock___block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = _PBLog();
  __int16 v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v12;
      _os_log_error_impl(&dword_18D208000, v14, OS_LOG_TYPE_ERROR, "...requesting item failed with error: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_18D208000, v14, OS_LOG_TYPE_INFO, "...requesting item completed successfully.", (uint8_t *)&v16, 2u);
  }

  if ([v11 isAuthorizationAdmonished]) {
    +[PBServerConnection simulateCrashReportForAuthorizationWithAuthenticationMessage:*(void *)(a1 + 32)];
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, id, id, id, id))(v15 + 16))(v15, v9, v10, v11, v12);
  }
}

- (void)requestPatternDetectionsFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 patterns:(id)a7 needValues:(BOOL)a8 dataOwner:(int64_t)a9 completionBlock:(id)a10
{
  BOOL v26 = a8;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a10;
  id v19 = a5;
  id v20 = [(PBServerConnection *)self serverConnection];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __152__PBServerConnection_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock___block_invoke;
  v29[3] = &unk_1E5555BE8;
  id v21 = v18;
  id v30 = v21;
  id v22 = _loggingErrorHandler((uint64_t)"-[PBServerConnection requestPatternDetectionsFromPasteboardWithName:UUID:authenticationMessage:itemIndex:patterns:needValues:dataOwner:completionBlock:]", v29);
  id v23 = [v20 remoteObjectProxyWithErrorHandler:v22];

  id v24 = _PBLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v32 = v17;
    __int16 v33 = 2048;
    unint64_t v34 = a6;
    __int16 v35 = 2112;
    id v36 = v15;
    __int16 v37 = 2112;
    id v38 = v16;
    _os_log_impl(&dword_18D208000, v24, OS_LOG_TYPE_INFO, "Requesting detection of patterns %@ from item %lu of pasteboard named %@, UUID %@", buf, 0x2Au);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __152__PBServerConnection_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock___block_invoke_12;
  v27[3] = &unk_1E5555CB0;
  id v28 = v21;
  id v25 = v21;
  [v23 requestPatternDetectionsFromPasteboardWithName:v15 UUID:v16 authenticationMessage:v19 itemIndex:a6 patterns:v17 needValues:v26 dataOwner:a9 completionBlock:v27];
}

void __152__PBServerConnection_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __152__PBServerConnection_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _PBLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_18D208000, v8, OS_LOG_TYPE_ERROR, "...requesting pattern detection failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_18D208000, v8, OS_LOG_TYPE_INFO, "...requesting pattern detection completed successfully.", (uint8_t *)&v10, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)deletePersistentPasteboardWithName:(id)a3 completionBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PBServerConnection *)self serverConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__PBServerConnection_deletePersistentPasteboardWithName_completionBlock___block_invoke;
  v16[3] = &unk_1E5555BE8;
  id v9 = v7;
  id v17 = v9;
  int v10 = _loggingErrorHandler((uint64_t)"-[PBServerConnection deletePersistentPasteboardWithName:completionBlock:]", v16);
  id v11 = [v8 remoteObjectProxyWithErrorHandler:v10];

  uint64_t v12 = _PBLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_18D208000, v12, OS_LOG_TYPE_INFO, "Deleting persistent pasteboard named %@", buf, 0xCu);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PBServerConnection_deletePersistentPasteboardWithName_completionBlock___block_invoke_14;
  v14[3] = &unk_1E5555CD8;
  id v15 = v9;
  id v13 = v9;
  [v11 deletePersistentPasteboardWithName:v6 completionBlock:v14];
}

void __73__PBServerConnection_deletePersistentPasteboardWithName_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    PBCannotConnectToServerError(0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __73__PBServerConnection_deletePersistentPasteboardWithName_completionBlock___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _PBLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_18D208000, v7, OS_LOG_TYPE_ERROR, "...deleting persistent pasteboard failed with error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_18D208000, v7, OS_LOG_TYPE_INFO, "...deleting persistent pasteboard completed successfully.", (uint8_t *)&v9, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)didPastePasteboard:(id)a3
{
  id v4 = a3;
  id v5 = [(PBServerConnection *)self serverConnection];
  id v6 = [v5 remoteObjectProxy];

  id v7 = _PBLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_18D208000, v7, OS_LOG_TYPE_INFO, "Notifying pasted of a paste event.", v10, 2u);
  }

  uint64_t v8 = [v4 name];
  int v9 = [v4 UUID];

  [v6 didPasteContentsFromPasteboardWithName:v8 UUID:v9 completionBlock:&__block_literal_global_17];
}

- (void)performJanitorialTasksCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PBServerConnection *)self serverConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__PBServerConnection_performJanitorialTasksCompletionBlock___block_invoke;
  v14[3] = &unk_1E5555BE8;
  id v6 = v4;
  id v15 = v6;
  id v7 = _loggingErrorHandler((uint64_t)"-[PBServerConnection performJanitorialTasksCompletionBlock:]", v14);
  uint64_t v8 = [v5 remoteObjectProxyWithErrorHandler:v7];

  int v9 = _PBLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D208000, v9, OS_LOG_TYPE_INFO, "Performing janitorial tasks.", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PBServerConnection_performJanitorialTasksCompletionBlock___block_invoke_18;
  v11[3] = &unk_1E55558C0;
  id v12 = v6;
  id v10 = v6;
  [v8 performJanitorialTasksCompletionBlock:v11];
}

uint64_t __60__PBServerConnection_performJanitorialTasksCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __60__PBServerConnection_performJanitorialTasksCompletionBlock___block_invoke_18(uint64_t a1)
{
  id v2 = _PBLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18D208000, v2, OS_LOG_TYPE_INFO, "...janitorial tasks complete.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getAllPasteboardsCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PBServerConnection *)self serverConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__PBServerConnection_getAllPasteboardsCompletionBlock___block_invoke;
  v14[3] = &unk_1E5555BE8;
  id v6 = v4;
  id v15 = v6;
  id v7 = _loggingErrorHandler((uint64_t)"-[PBServerConnection getAllPasteboardsCompletionBlock:]", v14);
  uint64_t v8 = [v5 remoteObjectProxyWithErrorHandler:v7];

  int v9 = _PBLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D208000, v9, OS_LOG_TYPE_INFO, "Enumerating pasteboards.", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PBServerConnection_getAllPasteboardsCompletionBlock___block_invoke_19;
  v11[3] = &unk_1E5555D00;
  id v12 = v6;
  id v10 = v6;
  [v8 getAllPasteboardsCompletionBlock:v11];
}

uint64_t __55__PBServerConnection_getAllPasteboardsCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __55__PBServerConnection_getAllPasteboardsCompletionBlock___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) setUsesServerConnectionToLoadDataWithAuthenticationBlock:0 dataOwnerBlock:0];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

- (id)pasteboardWithName:(id)a3 error:(id *)a4
{
  return [(PBServerConnection *)self pasteboardWithName:a3 createIfNeeded:0 authenticationBlock:0 dataOwnerBlock:0 error:a4];
}

uint64_t __97__PBServerConnection_pasteboardWithName_createIfNeeded_authenticationBlock_dataOwnerBlock_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = PBCannotConnectToServerError(0);
  return MEMORY[0x1F41817F8]();
}

- (id)localGeneralPasteboardWithAuthenticationBlock:(id)a3 dataOwnerBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__0;
  id v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  id v10 = [(PBServerConnection *)self serverConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_error___block_invoke;
  v19[3] = &unk_1E5555D28;
  void v19[4] = &v26;
  uint64_t v11 = _loggingErrorHandler((uint64_t)"-[PBServerConnection localGeneralPasteboardWithAuthenticationBlock:dataOwnerBlock:error:]", v19);
  long long v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v11];

  long long v13 = _PBLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D208000, v13, OS_LOG_TYPE_INFO, "Retrieving local-only general pasteboard.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_error___block_invoke_22;
  v17[3] = &unk_1E5555D78;
  v17[4] = &v20;
  v17[5] = &v26;
  [v12 localGeneralPasteboardCompletionBlock:v17];
  long long v14 = (void *)v27[5];
  if (v14)
  {
    if (a5) {
      *a5 = v14;
    }
  }
  else
  {
    [(id)v21[5] setUsesServerConnectionToLoadDataWithAuthenticationBlock:v8 dataOwnerBlock:v9];
  }
  id v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

uint64_t __89__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = PBCannotConnectToServerError(0);
  return MEMORY[0x1F41817F8]();
}

void __89__PBServerConnection_localGeneralPasteboardWithAuthenticationBlock_dataOwnerBlock_error___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _PBLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_error_impl(&dword_18D208000, v8, OS_LOG_TYPE_ERROR, "...retrieving local-only general pasteboard failed with error: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_18D208000, v8, OS_LOG_TYPE_INFO, "...retrieving local-only general pasteboard completed successfully.", (uint8_t *)&v14, 2u);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

- (id)savePasteboard:(id)a3 dataProviderEndpoint:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  __int16 v33 = __Block_byref_object_copy__0;
  unint64_t v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__0;
  uint64_t v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v10 = [(PBServerConnection *)self serverConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__PBServerConnection_savePasteboard_dataProviderEndpoint_error___block_invoke;
  v19[3] = &unk_1E5555D28;
  void v19[4] = &v30;
  id v11 = _loggingErrorHandler((uint64_t)"-[PBServerConnection savePasteboard:dataProviderEndpoint:error:]", v19);
  uint64_t v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v11];

  long long v13 = _PBLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = [v8 name];
    *(_DWORD *)buf = 138412290;
    __int16 v37 = v14;
    _os_log_impl(&dword_18D208000, v13, OS_LOG_TYPE_INFO, "Saving pasteboard name %@", buf, 0xCu);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__PBServerConnection_savePasteboard_dataProviderEndpoint_error___block_invoke_23;
  v18[3] = &unk_1E5555DA0;
  v18[4] = &v20;
  v18[5] = &v30;
  v18[6] = &v24;
  [v12 savePasteboard:v8 dataProviderEndpoint:v9 completionBlock:v18];
  id v15 = (void *)v31[5];
  if (v15)
  {
    if (a5) {
      *a5 = v15;
    }
  }
  else
  {
    [v8 setChangeCount:v21[3]];
  }
  id v16 = (id)v25[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

uint64_t __64__PBServerConnection_savePasteboard_dataProviderEndpoint_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = PBCannotConnectToServerError(0);
  return MEMORY[0x1F41817F8]();
}

void __64__PBServerConnection_savePasteboard_dataProviderEndpoint_error___block_invoke_23(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _PBLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_error_impl(&dword_18D208000, v8, OS_LOG_TYPE_ERROR, "...saving pasteboard failed with error: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_18D208000, v8, OS_LOG_TYPE_INFO, "...saving pasteboard completed successfully.", (uint8_t *)&v14, 2u);
  }

  *(void *)(*(void *)(a1[4] + 8) + 24) = [v5 changeCount];
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  uint64_t v12 = *(void *)(a1[6] + 8);
  long long v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v5;
}

- (unint64_t)deletePersistentPasteboardWithName:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v7 = [(PBServerConnection *)self serverConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__PBServerConnection_deletePersistentPasteboardWithName_error___block_invoke;
  v14[3] = &unk_1E5555D28;
  void v14[4] = &v19;
  id v8 = _loggingErrorHandler((uint64_t)"-[PBServerConnection deletePersistentPasteboardWithName:error:]", v14);
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v8];

  id v10 = _PBLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_18D208000, v10, OS_LOG_TYPE_INFO, "Deleting persistent pasteboard named %@", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PBServerConnection_deletePersistentPasteboardWithName_error___block_invoke_24;
  v13[3] = &unk_1E5555DC8;
  v13[4] = &v15;
  v13[5] = &v19;
  [v9 deletePersistentPasteboardWithName:v6 completionBlock:v13];
  if (a4) {
    *a4 = (id) v20[5];
  }
  unint64_t v11 = v16[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

uint64_t __63__PBServerConnection_deletePersistentPasteboardWithName_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = PBCannotConnectToServerError(0);
  return MEMORY[0x1F41817F8]();
}

void __63__PBServerConnection_deletePersistentPasteboardWithName_error___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _PBLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_18D208000, v7, OS_LOG_TYPE_ERROR, "...deleting persistent pasteboard failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_18D208000, v7, OS_LOG_TYPE_INFO, "...deleting persistent pasteboard completed successfully.", (uint8_t *)&v10, 2u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (id)remoteContentForSlotStyle:(id)a3 pasteButtonTag:(id)a4 error:(id *)a5
{
  return [(PBServerConnection *)self remoteContentForLayerContextWithId:0 slotStyle:a3 pasteButtonTag:a4 error:a5];
}

- (id)remoteContentForLayerContextWithId:(unint64_t)a3 slotStyle:(id)a4 pasteButtonTag:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__0;
  id v29 = __Block_byref_object_dispose__0;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v12 = [(PBServerConnection *)self serverConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__PBServerConnection_remoteContentForLayerContextWithId_slotStyle_pasteButtonTag_error___block_invoke;
  v18[3] = &unk_1E5555D28;
  v18[4] = &v25;
  long long v13 = _loggingErrorHandler((uint64_t)"-[PBServerConnection remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:error:]", v18);
  int v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__PBServerConnection_remoteContentForLayerContextWithId_slotStyle_pasteButtonTag_error___block_invoke_2;
  v17[3] = &unk_1E5555DF0;
  v17[4] = &v19;
  v17[5] = &v25;
  [v14 getRemoteContentForLayerContextWithId:a3 slotStyle:v10 pasteButtonTag:v11 completionBlock:v17];
  if (a6) {
    *a6 = (id) v26[5];
  }
  id v15 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

uint64_t __88__PBServerConnection_remoteContentForLayerContextWithId_slotStyle_pasteButtonTag_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = PBCannotConnectToServerError(0);
  return MEMORY[0x1F41817F8]();
}

void __88__PBServerConnection_remoteContentForLayerContextWithId_slotStyle_pasteButtonTag_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __67__PBServerConnection_beginListeningToPasteboardChangeNotifications__block_invoke_2()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = @"state";
  v0 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:_notificationQueue_getState()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];

  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"com.apple.pasteboard.changed" object:0 userInfo:v1];
}

- (id)requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__0;
  id v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  uint64_t v8 = [(PBServerConnection *)self serverConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__PBServerConnection_requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_error___block_invoke;
  v19[3] = &unk_1E5555D28;
  void v19[4] = &v20;
  uint64_t v9 = _loggingErrorHandler((uint64_t)"-[PBServerConnection requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:error:]", v19);
  id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v9];

  id v11 = _PBLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D208000, v11, OS_LOG_TYPE_INFO, "Requesting authentication message for secure paste", buf, 2u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__PBServerConnection_requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_error___block_invoke_38;
  v18[3] = &unk_1E5555E70;
  v18[4] = &v26;
  void v18[5] = &v20;
  [v10 requestSecurePasteAuthenticationMessageWithContext:a3 forClientVersionedPID:a4 completionBlock:v18];
  uint64_t v12 = v27[5];
  long long v13 = _PBLog();
  int v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D208000, v14, OS_LOG_TYPE_INFO, "Successfully generated authentication message.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = v21[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = v17;
    _os_log_error_impl(&dword_18D208000, v14, OS_LOG_TYPE_ERROR, "Authentication message was not generated: %@", buf, 0xCu);
  }

  if (a5) {
    *a5 = (id) v21[5];
  }
  id v15 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

uint64_t __101__PBServerConnection_requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = PBCannotConnectToServerError(0);
  return MEMORY[0x1F41817F8]();
}

void __101__PBServerConnection_requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_error___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)setMemberQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQ_serverConnection, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end