@interface ML3ClientImportSession
- (BOOL)addItems:(id)a3;
- (BOOL)cancel;
- (BOOL)finish;
- (BOOL)removeItems:(id)a3;
- (BOOL)start;
- (BOOL)updateItems:(id)a3;
- (ML3ClientImportSession)initWithConfiguration:(id)a3 delegate:(id)a4;
- (NSProgress)progress;
- (id)_xpcClientConnection;
- (id)addItemsReturningResult:(id)a3;
- (id)removeItemsReturningResult:(id)a3;
- (id)updateItemsReturningResult:(id)a3;
- (void)sessionDidUpdateProgress:(float)a3;
- (void)sessionFailedToAddItem:(id)a3 completion:(id)a4;
- (void)sessionFailedToRemoveItem:(id)a3 completion:(id)a4;
- (void)sessionFailedToUpdateItem:(id)a3 completion:(id)a4;
@end

@implementation ML3ClientImportSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_xpcClientConnection, 0);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (id)_xpcClientConnection
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  xpcClientConnection = self->_xpcClientConnection;
  if (!xpcClientConnection)
  {
    v4 = +[MLMediaLibraryService sharedMediaLibraryService];
    id v29 = 0;
    v5 = [v4 clientImportServiceListenerEndpointWithError:&v29];
    id v6 = v29;

    if (v5)
    {
      v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v5];
      v8 = self->_xpcClientConnection;
      self->_xpcClientConnection = v7;

      [(NSXPCConnection *)self->_xpcClientConnection setExportedObject:self];
      v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0926CA0];
      v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      [v9 setClasses:v10 forSelector:sel_sessionFailedToAddItem_completion_ argumentIndex:0 ofReply:0];

      v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      [v9 setClasses:v11 forSelector:sel_sessionFailedToUpdateItem_completion_ argumentIndex:0 ofReply:0];

      v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      [v9 setClasses:v12 forSelector:sel_sessionFailedToRemoveItem_completion_ argumentIndex:0 ofReply:0];

      [(NSXPCConnection *)self->_xpcClientConnection setExportedInterface:v9];
      v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0935610];
      v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      [v13 setClasses:v14 forSelector:sel_addItems_completion_ argumentIndex:0 ofReply:1];

      v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      [v13 setClasses:v15 forSelector:sel_updateItems_completion_ argumentIndex:0 ofReply:1];

      v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      [v13 setClasses:v16 forSelector:sel_removeItems_completion_ argumentIndex:0 ofReply:1];

      [(NSXPCConnection *)self->_xpcClientConnection setRemoteObjectInterface:v13];
      v17 = self;
      v18 = self->_xpcClientConnection;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __46__ML3ClientImportSession__xpcClientConnection__block_invoke;
      v26[3] = &unk_1E5FB83D0;
      v19 = v17;
      v27 = v19;
      v28 = v19;
      [(NSXPCConnection *)v18 setInterruptionHandler:v26];
      v20 = self->_xpcClientConnection;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __46__ML3ClientImportSession__xpcClientConnection__block_invoke_97;
      v23[3] = &unk_1E5FB83D0;
      v24 = v19;
      v25 = v19;
      v21 = v19;
      [(NSXPCConnection *)v20 setInvalidationHandler:v23];
      [(NSXPCConnection *)self->_xpcClientConnection resume];
    }
    else
    {
      v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v31 = self;
        __int16 v32 = 2114;
        id v33 = v6;
        _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to obtain service listener endpoint. err=%{public}@", buf, 0x16u);
      }
    }

    xpcClientConnection = self->_xpcClientConnection;
  }

  return xpcClientConnection;
}

void __46__ML3ClientImportSession__xpcClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v2;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Connection to client import service interrupted", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

void __46__ML3ClientImportSession__xpcClientConnection__block_invoke_97(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v2;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Connection to client import service invalidated", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

- (void)sessionDidUpdateProgress:(float)a3
{
  uint64_t v4 = (uint64_t)(float)((float)[(NSProgress *)self->_progress totalUnitCount] * a3);
  id v5 = [(ML3ClientImportSession *)self progress];
  [v5 setCompletedUnitCount:v4];
}

- (void)sessionFailedToRemoveItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  char v8 = 1;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(ML3ClientImportSessionDelegate *)self->_delegate session:self failedToAddItem:v6 shouldStop:&v8];
  }
  v7[2](v7);
}

- (void)sessionFailedToUpdateItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  char v8 = 1;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(ML3ClientImportSessionDelegate *)self->_delegate session:self failedToAddItem:v6 shouldStop:&v8];
  }
  v7[2](v7);
}

- (void)sessionFailedToAddItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  char v8 = 1;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(ML3ClientImportSessionDelegate *)self->_delegate session:self failedToAddItem:v6 shouldStop:&v8];
  }
  v7[2](v7);
}

- (id)removeItemsReturningResult:(id)a3
{
  id v5 = a3;
  if (!self->_hasActiveSession)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ML3ClientImportSession.m" lineNumber:147 description:@"removeItems cannot be called without an active session"];
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12681;
  v20 = __Block_byref_object_dispose__12682;
  id v21 = 0;
  id v6 = [(ML3ClientImportSession *)self _xpcClientConnection];
  id v7 = v6;
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__ML3ClientImportSession_removeItemsReturningResult___block_invoke;
    v15[3] = &unk_1E5FB6528;
    v15[4] = self;
    char v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__ML3ClientImportSession_removeItemsReturningResult___block_invoke_19;
    v14[3] = &unk_1E5FB5818;
    v14[4] = self;
    v14[5] = &v16;
    [v8 removeItems:v5 completion:v14];
  }
  v9 = (void *)v17[5];
  if (v9) {
    v10 = v9;
  }
  else {
    v10 = objc_alloc_init(ML3ClientImportResult);
  }
  v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

void __53__ML3ClientImportSession_removeItemsReturningResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __53__ML3ClientImportSession_removeItemsReturningResult___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Finished removing items. err=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = v5;
  if (!v5) {
    id v9 = objc_alloc_init(ML3ClientImportResult);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9);
  if (!v5) {
}
  }

- (BOOL)removeItems:(id)a3
{
  id v3 = [(ML3ClientImportSession *)self removeItemsReturningResult:a3];
  char v4 = [v3 success];

  return v4;
}

- (id)updateItemsReturningResult:(id)a3
{
  id v5 = a3;
  if (!self->_hasActiveSession)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ML3ClientImportSession.m" lineNumber:126 description:@"updateItems cannot be called without an active session"];
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12681;
  v20 = __Block_byref_object_dispose__12682;
  id v21 = 0;
  id v6 = [(ML3ClientImportSession *)self _xpcClientConnection];
  uint64_t v7 = v6;
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__ML3ClientImportSession_updateItemsReturningResult___block_invoke;
    v15[3] = &unk_1E5FB6528;
    v15[4] = self;
    uint64_t v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__ML3ClientImportSession_updateItemsReturningResult___block_invoke_15;
    v14[3] = &unk_1E5FB5818;
    v14[4] = self;
    v14[5] = &v16;
    [v8 updateItems:v5 completion:v14];
  }
  id v9 = (void *)v17[5];
  if (v9) {
    int v10 = v9;
  }
  else {
    int v10 = objc_alloc_init(ML3ClientImportResult);
  }
  uint64_t v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

void __53__ML3ClientImportSession_updateItemsReturningResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __53__ML3ClientImportSession_updateItemsReturningResult___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Finished updating items. err=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = v5;
  if (!v5) {
    id v9 = objc_alloc_init(ML3ClientImportResult);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9);
  if (!v5) {
}
  }

- (BOOL)updateItems:(id)a3
{
  id v3 = [(ML3ClientImportSession *)self updateItemsReturningResult:a3];
  char v4 = [v3 success];

  return v4;
}

- (id)addItemsReturningResult:(id)a3
{
  id v5 = a3;
  if (!self->_hasActiveSession)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ML3ClientImportSession.m" lineNumber:104 description:@"addItems cannot be called without an active session"];
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12681;
  v20 = __Block_byref_object_dispose__12682;
  id v21 = 0;
  id v6 = [(ML3ClientImportSession *)self _xpcClientConnection];
  uint64_t v7 = v6;
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__ML3ClientImportSession_addItemsReturningResult___block_invoke;
    v15[3] = &unk_1E5FB6528;
    v15[4] = self;
    uint64_t v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__ML3ClientImportSession_addItemsReturningResult___block_invoke_9;
    v14[3] = &unk_1E5FB5818;
    v14[4] = self;
    v14[5] = &v16;
    [v8 addItems:v5 completion:v14];
  }
  id v9 = (void *)v17[5];
  if (v9) {
    int v10 = v9;
  }
  else {
    int v10 = objc_alloc_init(ML3ClientImportResult);
  }
  uint64_t v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

void __50__ML3ClientImportSession_addItemsReturningResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __50__ML3ClientImportSession_addItemsReturningResult___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Finished adding items. err=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = v5;
  if (!v5) {
    id v9 = objc_alloc_init(ML3ClientImportResult);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9);
  if (!v5) {
}
  }

- (BOOL)addItems:(id)a3
{
  id v3 = [(ML3ClientImportSession *)self addItemsReturningResult:a3];
  char v4 = [v3 success];

  return v4;
}

- (BOOL)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Canceling import session", (uint8_t *)&buf, 0xCu);
  }

  if (!self->_hasActiveSession) {
    return 1;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  char v4 = [(ML3ClientImportSession *)self _xpcClientConnection];
  uint64_t v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__ML3ClientImportSession_cancel__block_invoke;
    v10[3] = &unk_1E5FB6528;
    v10[4] = self;
    id v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__ML3ClientImportSession_cancel__block_invoke_3;
    v9[3] = &unk_1E5FB6E10;
    v9[4] = self;
    v9[5] = &buf;
    [v6 cancelSessionWithCompletion:v9];
  }
  BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v7;
}

void __32__ML3ClientImportSession_cancel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __32__ML3ClientImportSession_cancel__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Canceled import session. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
}

- (BOOL)finish
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Finishing import session", (uint8_t *)&buf, 0xCu);
  }

  if (!self->_hasActiveSession) {
    return 1;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  char v4 = [(ML3ClientImportSession *)self _xpcClientConnection];
  uint64_t v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__ML3ClientImportSession_finish__block_invoke;
    v10[3] = &unk_1E5FB6528;
    v10[4] = self;
    int v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__ML3ClientImportSession_finish__block_invoke_2;
    v9[3] = &unk_1E5FB6E10;
    v9[4] = self;
    v9[5] = &buf;
    [v6 endSessionWithCompletion:v9];
  }
  BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v7;
}

void __32__ML3ClientImportSession_finish__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __32__ML3ClientImportSession_finish__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Ended import session. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
}

- (BOOL)start
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Starting import session", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  char v4 = [(ML3ClientImportSession *)self _xpcClientConnection];
  uint64_t v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __31__ML3ClientImportSession_start__block_invoke;
    v11[3] = &unk_1E5FB6528;
    v11[4] = self;
    int v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v11];
    sessionConfiguration = self->_sessionConfiguration;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__ML3ClientImportSession_start__block_invoke_1;
    v10[3] = &unk_1E5FB6E10;
    v10[4] = self;
    void v10[5] = &buf;
    [v6 beginSessionWithConfiguration:sessionConfiguration completion:v10];
  }
  BOOL v8 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __31__ML3ClientImportSession_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __31__ML3ClientImportSession_start__block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Finished starting import session. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (ML3ClientImportSession)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ML3ClientImportSession;
  __int16 v8 = [(ML3ClientImportSession *)&v17 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a4);
    uint64_t v10 = [v6 copy];
    sessionConfiguration = v9->_sessionConfiguration;
    v9->_sessionConfiguration = (ML3ClientImportSessionConfiguration *)v10;

    uint64_t v12 = [v6 operationCount];
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 100;
    }
    uint64_t v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v13];
    progress = v9->_progress;
    v9->_progress = (NSProgress *)v14;
  }
  return v9;
}

@end