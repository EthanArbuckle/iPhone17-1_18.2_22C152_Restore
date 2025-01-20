@interface WBSHistoryService
- (BOOL)_connectionIsEntitledToUseUserDatabase:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSURL)databaseURL;
- (WBSHistoryCompletionListVendorProtocol)completionListProvider;
- (WBSHistoryDatabaseAccessBroker)databaseAccessBroker;
- (WBSHistoryService)init;
- (WBSHistoryService)initWithListener:(id)a3;
- (id)_createListener;
- (id)_openOrReuseExistingDatabaseWithOptions:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
- (void)connectWithOptions:(id)a3 connection:(id)a4 completionHandler:(id)a5;
- (void)listDatabaseURLsWithCompletionHandler:(id)a3;
- (void)openDatabaseWithID:(id)a3 createIfNeeded:(BOOL)a4 completionHandler:(id)a5;
- (void)resume;
- (void)setCompletionListVendorEndpoint:(id)a3 completionHandler:(id)a4;
- (void)shutdown;
@end

@implementation WBSHistoryService

void __69__WBSHistoryService_connectWithOptions_connection_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  v4 = [v2 _openOrReuseExistingDatabaseWithOptions:v3 createIfNeeded:1 error:&v7];
  id v5 = v7;
  if (!v4)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __69__WBSHistoryService_connectWithOptions_connection_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)_openOrReuseExistingDatabaseWithOptions:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  objc_msgSend(v56, "safari_stringForKey:", @"WBSHistoryConnectionOptionDatabaseID");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7) {
    id v7 = (id)*MEMORY[0x1E4F980C8];
  }
  v55 = objc_msgSend(v56, "safari_URLForKey:", @"WBSHistoryConnectionOptionDatabaseURL");
  if (v55)
  {
LABEL_10:
    v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    v13 = v12;
    if (v55)
    {
      objc_msgSend(v12, "addObject:");
      if (!a4)
      {
        v14 = [MEMORY[0x1E4F28CB8] defaultManager];
        v15 = [v55 path];
        char v16 = [v14 fileExistsAtPath:v15];

        if ((v16 & 1) == 0)
        {
          if (a5)
          {
            v17 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v62 = *MEMORY[0x1E4F289D0];
            v63[0] = v55;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
            *a5 = [v17 errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:v18];
          }
          v19 = 0;
LABEL_44:

          goto LABEL_45;
        }
      }
    }
    else
    {
      v20 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __45__WBSHistoryConnectionProxy_ensureConnected___block_invoke_cold_1();
      }
    }
    if ((objc_msgSend(v56, "safari_BOOLForKey:", @"WBSHistoryConnectionOptionNoMemoryFallback") & 1) == 0)
    {
      v21 = WBSHistoryInMemoryDatabaseURL();
      [v13 addObject:v21];
    }
    if (objc_msgSend(v56, "safari_BOOLForKey:", @"WBSHistoryConnectionOptionTruncate"))
    {
      id v22 = v55;
      v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      v24 = [v22 absoluteString];
      [v23 removeItemAtURL:v22 error:0];
      v25 = (void *)MEMORY[0x1E4F1CB10];
      v26 = [v24 stringByAppendingString:@"-lock"];
      v27 = [v25 URLWithString:v26];
      [v23 removeItemAtURL:v27 error:0];

      v28 = (void *)MEMORY[0x1E4F1CB10];
      v29 = [v24 stringByAppendingString:@"-shm"];
      v30 = [v28 URLWithString:v29];
      [v23 removeItemAtURL:v30 error:0];

      v31 = (void *)MEMORY[0x1E4F1CB10];
      v32 = [v24 stringByAppendingString:@"-wal"];
      v33 = [v31 URLWithString:v32];
      [v23 removeItemAtURL:v33 error:0];
    }
    v19 = [(NSMapTable *)self->_databases objectForKey:v7];
    if (v19)
    {
      v35 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[WBSHistoryService _openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:]();
      }
    }
    else
    {
      id v36 = 0;
      *(void *)&long long v34 = 138478083;
      long long v53 = v34;
      while (1)
      {
        if (!objc_msgSend(v13, "count", v53)) {
          goto LABEL_40;
        }
        v37 = [v13 firstObject];
        [v13 removeObjectAtIndex:0];
        v38 = [MEMORY[0x1E4F1C9C8] date];
        v39 = [WBSHistoryServiceDatabase alloc];
        fileOperationGroup = self->_fileOperationGroup;
        id v57 = 0;
        v19 = [(WBSHistoryServiceDatabase *)v39 initWithID:v7 url:v37 options:v56 fileOperationGroup:fileOperationGroup error:&v57];
        id v41 = v57;
        if (v19) {
          break;
        }
        v42 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v44 = objc_msgSend(v41, "safari_privacyPreservingDescription");
          *(_DWORD *)buf = v53;
          v59 = v37;
          __int16 v60 = 2114;
          double v61 = *(double *)&v44;
          _os_log_error_impl(&dword_1A6B5F000, v42, OS_LOG_TYPE_ERROR, "Failed to open database %{private}@: %{public}@", buf, 0x16u);
        }
        if (v41)
        {
          id v43 = v41;

          id v36 = v43;
        }
        if (objc_msgSend(v41, "safari_isSQLiteCorruptionError"))
        {
          v47 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            -[WBSHistoryService _openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:]();
          }

LABEL_40:
          if (a5)
          {
            id v36 = v36;
            v19 = 0;
            *a5 = v36;
          }
          else
          {
            v19 = 0;
          }
          goto LABEL_43;
        }
      }
      v45 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        [v38 timeIntervalSinceNow];
        *(_DWORD *)buf = 136446466;
        v59 = "open_or_reuse_opening_database";
        __int16 v60 = 2048;
        double v61 = -v46;
        _os_log_impl(&dword_1A6B5F000, v45, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", buf, 0x16u);
      }

      [(NSMapTable *)self->_databases setObject:v19 forKey:v7];
LABEL_43:
    }
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    v55 = +[WBSHistory historyDatabaseURL];
    goto LABEL_10;
  }
  if (([v7 hasPrefix:@"test"] & 1) != 0
    || [v7 hasPrefix:@"_test"])
  {
    v8 = (void *)MEMORY[0x1E4F1CB10];
    v55 = NSTemporaryDirectory();
    v9 = [v7 stringByAppendingString:@".db"];
    v10 = [v55 stringByAppendingPathComponent:v9];
    uint64_t v11 = [v8 fileURLWithPath:v10];

LABEL_9:
    v55 = (void *)v11;
    goto LABEL_10;
  }
  v55 = +[WBSHistory profileDirectoryURLForProfileID:v7];
  if (v55)
  {
    v49 = [MEMORY[0x1E4F28CB8] defaultManager];
    v50 = [v55 path];
    char v51 = [v49 fileExistsAtPath:v50];

    if (v51)
    {
      uint64_t v11 = [v55 URLByAppendingPathComponent:@"History.db"];
      goto LABEL_9;
    }
  }
  v52 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
    -[WBSHistoryService _openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:].cold.4((uint64_t)v7, v52);
  }
  v19 = 0;
LABEL_45:

  return v19;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = WBSHistoryConnectionInterface();
  [v5 setExportedInterface:v6];

  id v7 = [[WBSHistoryConnection alloc] initWithHistoryService:self];
  [v5 setExportedObject:v7];

  [v5 setInvalidationHandler:&__block_literal_global_64];
  [v5 setInterruptionHandler:&__block_literal_global_13];
  [v5 resume];
  if (self->_initDate)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      [(NSDate *)self->_initDate timeIntervalSinceNow];
      -[WBSHistoryService listener:shouldAcceptNewConnection:](v12, v8, v9);
    }

    initDate = self->_initDate;
    self->_initDate = 0;
  }
  return 1;
}

- (void)connectWithOptions:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v12 = v11;
  if (![(WBSHistoryService *)self _connectionIsEntitledToUseUserDatabase:v9])
  {
    if (v11)
    {
      uint64_t v13 = [v11 mutableCopy];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v14 = (void *)v13;
    uint64_t v15 = objc_msgSend(v11, "safari_stringForKey:", @"WBSHistoryConnectionOptionDatabaseID");
    char v16 = (void *)v15;
    v17 = (void *)*MEMORY[0x1E4F980C8];
    if (v15) {
      v17 = (void *)v15;
    }
    id v18 = v17;

    v19 = [NSString stringWithFormat:@"%@?pid=%i", v18, objc_msgSend(v9, "processIdentifier")];
    [v14 setObject:v19 forKeyedSubscript:@"WBSHistoryConnectionOptionDatabaseID"];

    v20 = WBSHistoryInMemoryDatabaseURL();
    [v14 setObject:v20 forKeyedSubscript:@"WBSHistoryConnectionOptionDatabaseURL"];

    id v12 = v14;
  }
  historyServiceQueue = self->_historyServiceQueue;
  fileOperationGroup = self->_fileOperationGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WBSHistoryService_connectWithOptions_connection_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  block[4] = self;
  id v26 = v12;
  id v27 = v10;
  id v23 = v12;
  id v24 = v10;
  dispatch_group_notify(fileOperationGroup, historyServiceQueue, block);
}

- (BOOL)_connectionIsEntitledToUseUserDatabase:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 valueForEntitlement:@"com.apple.private.Safari.History"];
  if (!v4)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = [v3 processIdentifier];
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_DEFAULT, "Process %d is missing history entitlement. Process will be restricted to private in-memory database", (uint8_t *)v8, 8u);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WBSHistoryService _connectionIsEntitledToUseUserDatabase:]((uint8_t *)v8, [v3 processIdentifier], v6);
    }
LABEL_8:

    char v5 = 0;
    goto LABEL_9;
  }
  char v5 = [v4 BOOLValue];
LABEL_9:

  return v5;
}

- (WBSHistoryService)init
{
  return [(WBSHistoryService *)self initWithListener:0];
}

- (WBSHistoryService)initWithListener:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WBSHistoryService;
  v6 = [(WBSHistoryService *)&v22 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listener, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    initDate = v7->_initDate;
    v7->_initDate = (NSDate *)v8;

    id v10 = [WBSHistoryDatabaseAccessBroker alloc];
    id v11 = [(WBSHistoryService *)v7 databaseURL];
    uint64_t v12 = [(WBSHistoryDatabaseAccessBroker *)v10 initWithHistoryDatabaseURL:v11];
    databaseAccessBroker = v7->_databaseAccessBroker;
    v7->_databaseAccessBroker = (WBSHistoryDatabaseAccessBroker *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.Safari.History.HistoryService", 0);
    historyServiceQueue = v7->_historyServiceQueue;
    v7->_historyServiceQueue = (OS_dispatch_queue *)v14;

    dispatch_group_t v16 = dispatch_group_create();
    fileOperationGroup = v7->_fileOperationGroup;
    v7->_fileOperationGroup = (OS_dispatch_group *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    databases = v7->_databases;
    v7->_databases = (NSMapTable *)v18;

    v20 = v7;
  }

  return v7;
}

- (id)_createListener
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.Safari.History.Service"];
  return v2;
}

- (void)resume
{
  id v3 = (void *)MEMORY[0x1AD0C4CF0](self, a2);
  listener = self->_listener;
  if (!listener)
  {
    id v5 = [(WBSHistoryService *)self _createListener];
    v6 = self->_listener;
    self->_listener = v5;

    listener = self->_listener;
  }
  [(NSXPCListener *)listener setDelegate:self];
  id v7 = self->_listener;
  [(NSXPCListener *)v7 resume];
}

- (void)shutdown
{
  [(NSXPCListener *)self->_listener invalidate];
  historyServiceQueue = self->_historyServiceQueue;
  fileOperationGroup = self->_fileOperationGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WBSHistoryService_shutdown__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_group_async(fileOperationGroup, historyServiceQueue, block);
  listener = self->_listener;
  self->_listener = 0;

  dispatch_group_wait((dispatch_group_t)self->_fileOperationGroup, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __29__WBSHistoryService_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
        dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        _DWORD v8[2] = __29__WBSHistoryService_shutdown__block_invoke_2;
        v8[3] = &unk_1E5C8CA70;
        v8[4] = *(void *)(a1 + 32);
        [v6 forceCloseWithCompletionHandler:v8];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  return [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
}

void __29__WBSHistoryService_shutdown__block_invoke_2(uint64_t a1)
{
}

void __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_11()
{
  v0 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_11_cold_1();
  }
}

- (NSURL)databaseURL
{
  return (NSURL *)+[WBSHistory historyDatabaseURL];
}

- (void)listDatabaseURLsWithCompletionHandler:(id)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  v19 = (void (**)(id, void, id))a3;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = +[WBSHistory historyDatabaseURL];
  [v22 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F980C8]];

  uint64_t v4 = *MEMORY[0x1E4F1C628];
  uint64_t v5 = *MEMORY[0x1E4F1C6E8];
  v30[0] = *MEMORY[0x1E4F1C628];
  v30[1] = v5;
  uint64_t v21 = v5;
  v30[2] = *MEMORY[0x1E4F1C700];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = objc_msgSend(v23, "safari_profilesDirectoryURL");
  id v28 = 0;
  uint64_t v18 = [v23 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v6 options:4 error:&v28];
  id v20 = v28;

  if (v20 && (objc_msgSend(v20, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F281F8], 260, v18) & 1) == 0)
  {
    v19[2](v19, 0, v20);
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v18;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "resourceValuesForKeys:error:", v6, 0, v18);
          if (objc_msgSend(v13, "safari_BOOLForKey:", v4))
          {
            uint64_t v14 = [v12 URLByAppendingPathComponent:@"History.db"];
            uint64_t v15 = [v14 path];
            char v16 = [v23 fileExistsAtPath:v15];

            if (v16)
            {
              v17 = [v13 objectForKeyedSubscript:v21];
              [v22 setObject:v14 forKeyedSubscript:v17];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    ((void (**)(id, id, id))v19)[2](v19, v22, 0);
  }
}

- (void)openDatabaseWithID:(id)a3 createIfNeeded:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  historyServiceQueue = self->_historyServiceQueue;
  fileOperationGroup = self->_fileOperationGroup;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__WBSHistoryService_openDatabaseWithID_createIfNeeded_completionHandler___block_invoke;
  v14[3] = &unk_1E5C9C7F8;
  id v15 = v8;
  char v16 = self;
  BOOL v18 = a4;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_group_async(fileOperationGroup, historyServiceQueue, v14);
}

void __73__WBSHistoryService_openDatabaseWithID_createIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    uint64_t v2 = *MEMORY[0x1E4F980C8];
  }
  v9[0] = @"WBSHistoryConnectionOptionDatabaseID";
  v9[1] = @"WBSHistoryConnectionOptionNoMemoryFallback";
  v10[0] = v2;
  v10[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  id v8 = 0;
  v6 = [v4 _openOrReuseExistingDatabaseWithOptions:v3 createIfNeeded:v5 error:&v8];
  id v7 = v8;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setCompletionListVendorEndpoint:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void))a4;
  id v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v10];
  completionListProviderConnection = self->_completionListProviderConnection;
  self->_completionListProviderConnection = v7;

  id v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC6CFC8];
  [(NSXPCConnection *)self->_completionListProviderConnection setRemoteObjectInterface:v9];

  [(NSXPCConnection *)self->_completionListProviderConnection resume];
  v6[2](v6, 0);
}

- (WBSHistoryCompletionListVendorProtocol)completionListProvider
{
  return (WBSHistoryCompletionListVendorProtocol *)[(NSXPCConnection *)self->_completionListProviderConnection remoteObjectProxy];
}

- (WBSHistoryDatabaseAccessBroker)databaseAccessBroker
{
  return self->_databaseAccessBroker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseAccessBroker, 0);
  objc_storeStrong((id *)&self->_completionListProviderConnection, 0);
  objc_storeStrong((id *)&self->_initDate, 0);
  objc_storeStrong((id *)&self->_databases, 0);
  objc_storeStrong((id *)&self->_fileOperationGroup, 0);
  objc_storeStrong((id *)&self->_historyServiceQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_connectionIsEntitledToUseUserDatabase:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "History entitlement for process id %d is not of the correct type (expected a BOOL)", buf, 8u);
}

- (void)listener:(double)a3 shouldAcceptNewConnection:.cold.1(uint8_t *buf, NSObject *a2, double a3)
{
  *(_DWORD *)buf = 134217984;
  *(double *)(buf + 4) = -a3;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "XPC ServiceConnection time from launch -> first connection: %f...", buf, 0xCu);
}

void __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "XPC ServiceConnection was invalidated", v2, v3, v4, v5, v6);
}

void __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "XPC ServiceConnection was interrupted", v2, v3, v4, v5, v6);
}

- (void)_openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_ERROR, "Database is corrupted", v1, 2u);
}

- (void)_openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Database was already opened. Returning existing database", v2, v3, v4, v5, v6);
}

- (void)_openOrReuseExistingDatabaseWithOptions:(uint64_t)a1 createIfNeeded:(NSObject *)a2 error:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain profile directory for identifier: %{private}@", (uint8_t *)&v2, 0xCu);
}

void __69__WBSHistoryService_connectWithOptions_connection_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Could not open database, returning...", v2, v3, v4, v5, v6);
}

@end