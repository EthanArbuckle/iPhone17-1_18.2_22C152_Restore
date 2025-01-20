@interface WBSHistoryConnection
- (WBSHistoryConnection)initWithHistoryService:(id)a3;
- (void)beginHistoryAccessSession:(id)a3;
- (void)beginURLCompletionSession:(id)a3;
- (void)connectWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)ensureConnected:(id)a3;
- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3;
- (void)getCompletionListItemsForQuery:(id)a3 completionHandler:(id)a4;
- (void)getServiceInfo:(id)a3;
- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)listDatabaseURLsWithCompletionHandler:(id)a3;
- (void)queryMemoryFootprint:(id)a3;
- (void)releaseCloudHistory:(id)a3;
- (void)setCompletionListVendorEndpoint:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSHistoryConnection

- (void)connectWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F29268] currentConnection];
  if (v9)
  {
    v12 = [[WBSHistoryServiceDatabaseDelegateProxy alloc] initWithProxy:v9];
  }
  else
  {
    v12 = 0;
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WBSHistoryConnection_connectWithOptions_delegate_completionHandler___block_invoke;
  block[3] = &unk_1E5C9C218;
  block[4] = self;
  id v19 = v8;
  v21 = v12;
  id v22 = v10;
  id v20 = v11;
  v14 = v12;
  id v15 = v10;
  id v16 = v11;
  id v17 = v8;
  dispatch_async(internalQueue, block);
}

void __70__WBSHistoryConnection_connectWithOptions_delegate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v10 = *(void *)(a1 + 56);
    v11 = v6;
    if (!v6)
    {
      v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSHistoryErrorDomain" code:3 userInfo:0];
    }
    (*(void (**)(uint64_t, void, uint64_t, uint64_t, void *))(v10 + 16))(v10, 0, -1, -1, v11);
    if (!v7) {
  }
    }
  else
  {
    uint64_t v12 = 0;
    [v5 allocateTemporaryIDRange:&v12];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = objc_msgSend(*(id *)(a1 + 40), "safari_stringForKey:", @"WBSHistoryConnectionOptionEventListenerName");
    [v5 addDelegate:v8 listenerName:v9 forConnection:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (WBSHistoryConnection)initWithHistoryService:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryConnection;
  id v6 = [(WBSHistoryConnection *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_historyService, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryConnection", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = v7;
  }

  return v7;
}

void __44__WBSHistoryConnection_releaseCloudHistory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  JUMPOUT(0x1AD0C5620);
}

void __70__WBSHistoryConnection_connectWithOptions_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__WBSHistoryConnection_connectWithOptions_delegate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5C9C1F0;
  id v9 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v3 connectWithOptions:v2 connection:v4 completionHandler:v5];
}

- (void)releaseCloudHistory:(id)a3
{
  id v4 = a3;
  MEMORY[0x1AD0C5610]();
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__WBSHistoryConnection_releaseCloudHistory___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (void)ensureConnected:(id)a3
{
}

- (void)getServiceInfo:(id)a3
{
  id v8 = (void (**)(id, void *, void))a3;
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 infoDictionary];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"SafariShared"];
  }

  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v6 infoDictionary];

  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"SafariHistory"];
  }

  v8[2](v8, v3, 0);
}

- (void)beginURLCompletionSession:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, WBSHistoryURLCompletionSession *, void))a3;
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  id v6 = [v5 valueForEntitlement:@"com.apple.private.Safari.History"];
  if (v6)
  {
    id v7 = [[WBSHistoryURLCompletionSession alloc] initWithHistoryService:self->_historyService];
    v4[2](v4, v7, 0);
  }
  else
  {
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSHistoryConnection beginURLCompletionSession:](v10, [v5 processIdentifier], v8);
    }

    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:0];
    ((void (**)(id, WBSHistoryURLCompletionSession *, void *))v4)[2](v4, 0, v9);
  }
}

- (void)beginHistoryAccessSession:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, WBSHistoryAccessSession *, void))a3;
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  id v6 = [v5 valueForEntitlement:@"com.apple.private.Safari.History"];
  if (v6)
  {
    id v7 = [[WBSHistoryAccessSession alloc] initWithHistoryService:self->_historyService];
    v4[2](v4, v7, 0);
  }
  else
  {
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSHistoryConnection beginURLCompletionSession:](v10, [v5 processIdentifier], v8);
    }

    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:0];
    ((void (**)(id, WBSHistoryAccessSession *, void *))v4)[2](v4, 0, v9);
  }
}

- (void)queryMemoryFootprint:(id)a3
{
  v3 = (void (**)(id, void *, id))a3;
  id v6 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F97ED8]) initWithError:&v6];
  id v5 = v6;
  v3[2](v3, v4, v5);
}

- (void)listDatabaseURLsWithCompletionHandler:(id)a3
{
}

- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(internalQueue, block);
}

void __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5C9C240;
  id v4 = *(id *)(a1 + 48);
  [v2 connectWithOptions:0 connection:v1 completionHandler:v3];
}

void __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5 || a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSHistoryErrorDomain" code:3 userInfo:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E5C8D8B8;
    id v9 = *(id *)(a1 + 32);
    [v5 finishClearingHistoryIfNecessaryWithCompletionHandler:v8];
  }
}

uint64_t __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = [MEMORY[0x1E4F28B50] mainBundle];
  int v9 = objc_msgSend(v8, "safari_isSafariFamilyApplicationBundle");

  if (v9)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSHistoryConnection initializeCloudHistoryWithConfiguration:completionHandler:](v10);
    }
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
    v7[2](v7, 0, v11);
  }
  else
  {
    objc_super v12 = [MEMORY[0x1E4F29268] currentConnection];
    v13 = (void *)os_transaction_create();
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke;
    block[3] = &unk_1E5C9C290;
    block[4] = self;
    id v17 = v6;
    id v19 = v13;
    id v20 = v7;
    id v18 = v12;
    id v15 = v13;
    id v11 = v12;
    dispatch_async(internalQueue, block);
  }
}

void __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    [v2 applyRemoteConfiguration:*(void *)(a1 + 40)];
  }
  else
  {
    v3 = [[WBSCloudHistoryConfiguration alloc] initWithDictionary:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 40))
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v7();
  }
  else
  {
    id v8 = *(void **)(v6 + 8);
    uint64_t v9 = *(void *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5C9C268;
    id v10 = *(id *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    id v14 = v10;
    v12[4] = v11;
    id v13 = *(id *)(a1 + 56);
    [v8 connectWithOptions:0 connection:v9 completionHandler:v12];
  }
}

void __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5C8CA48;
    void v8[4] = v4;
    id v11 = *(id *)(a1 + 48);
    id v9 = v3;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(v5, v8);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_3(void *a1)
{
  if (*(void *)(a1[4] + 40))
  {
    uint64_t v2 = a1[7];
LABEL_5:
    id v7 = *(void (**)(void))(v2 + 16);
    v7();
    return;
  }
  id v3 = [[WBSCloudHistory alloc] initWithDatabase:a1[5] configuration:*(void *)(a1[4] + 48) databaseStore:*(void *)(a1[4] + 8) completionBlock:&__block_literal_global_60];
  uint64_t v4 = a1[4];
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(a1[4] + 40);
  if (v6)
  {
    [v6 setCloudHistoryEnabled:1];
    uint64_t v2 = a1[7];
    goto LABEL_5;
  }
  uint64_t v8 = a1[7];
  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
  (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
}

void __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_4()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_INFO, "Cloud History initialized", v1, 2u);
  }
}

- (void)setCompletionListVendorEndpoint:(id)a3 completionHandler:(id)a4
{
}

- (void)getCompletionListItemsForQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(WBSHistoryService *)self->_historyService completionListProvider];

  if (v8)
  {
    id v9 = [(WBSHistoryService *)self->_historyService completionListProvider];
    [v9 getCompletionListItemsForQuery:v6 completionHandler:v7];
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSHistoryConnection getCompletionListItemsForQuery:completionHandler:](v10);
    }
    v7[2](v7, MEMORY[0x1E4F1CBF0]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudHistoryConfiguration, 0);
  objc_storeStrong((id *)&self->_cloudHistory, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_completionListProvider, 0);
  objc_storeStrong((id *)&self->_historyService, 0);
}

- (void)beginURLCompletionSession:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Process %d is missing history entitlement. Denying access.", buf, 8u);
}

- (void)initializeCloudHistoryWithConfiguration:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Cloud History cannot be run in the Safari process", v1, 2u);
}

- (void)getCompletionListItemsForQuery:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Attempted to get completion list items without an active Safari connection.", v1, 2u);
}

@end