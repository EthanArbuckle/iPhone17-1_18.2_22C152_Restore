@interface PLClientServerTransaction
+ (BOOL)_archiveRecoveryHistoryForPathManager:(id)a3 error:(id *)a4;
+ (BOOL)_hasExcessiveRecoveryAttemptsForPathManager:(id)a3;
+ (BOOL)_isOutstandingTransactionAtPath:(id)a3 getScopeValues:(unint64_t *)a4;
+ (id)_allTransactionPathsForPathManager:(id)a3;
+ (id)_changeScopesFromXPCDictionary:(id)a3;
+ (id)_filePathForTransactionWithToken:(id)a3 pathManager:(id)a4;
+ (id)_libraryURLFromXPCDictionary:(id)a3;
+ (id)_outstandingTransactionScopesByPathForPathManager:(id)a3;
+ (id)_recoveryHistoryFilePathForPathManager:(id)a3;
+ (id)_scopeValuesByScope;
+ (id)_serverTransactionForPathManager:(id)a3 isNew:(BOOL *)a4 identifier:(const char *)a5;
+ (id)_transactionTokenFromXPCDictionary:(id)a3;
+ (id)beginClientTransactionWithChangeScopes:(id)a3 pathManager:(id)a4 identifier:(const char *)a5;
+ (id)beginServerTransactionWithClientTransactionFromXPCDictionary:(id)a3 pathManager:(id)a4 identifier:(const char *)a5;
+ (id)beginServerTransactionWithToken:(id)a3 changeScopes:(id)a4 pathManager:(id)a5 identifier:(const char *)a6;
+ (id)descriptionOfAllTransactionFilesForPathManager:(id)a3;
+ (id)descriptionOfTransactionScopes:(id)a3;
+ (id)handleOutstandingTransactionsForPathManager:(id)a3 sqliteErrorHandler:(id)a4 handler:(id)a5;
+ (id)scopesFromScopeValues:(unint64_t)a3;
+ (id)serverTransactionQueue;
+ (id)transactionFromUserInfo:(id)a3;
+ (unint64_t)_readScopeValuesFromFileDescriptor:(int)a3;
+ (unint64_t)scopeValuesFromScopes:(id)a3;
+ (void)_checkForAndHandleExcessiveRecoveryAttemptsForPathManager:(id)a3 sqliteErrorHandler:(id)a4;
+ (void)_cleanupAllTransactionsScopesByPath:(id)a3;
+ (void)_recordRecoveryAttemptForPathManager:(id)a3;
+ (void)addTransaction:(id)a3 toUserInfo:(id)a4;
+ (void)addTransaction:(id)a3 toXPCDictionary:(id)a4;
+ (void)cancelOutstandingTransactionHandlerTimer:(id)a3;
+ (void)removeTransactionFromUserInfo:(id)a3;
- (BOOL)isClientTransaction;
- (NSSet)changeScopes;
- (NSString)transactionToken;
- (PLClientServerTransaction)initWithPathManager:(id)a3;
- (PLPhotoLibraryPathManager)pathManager;
- (void)setTransactionToken:(id)a3;
- (void)stillAlive;
@end

@implementation PLClientServerTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_changeScopes, 0);
  objc_storeStrong((id *)&self->_transactionToken, 0);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (NSSet)changeScopes
{
  return self->_changeScopes;
}

- (void)setTransactionToken:(id)a3
{
}

- (NSString)transactionToken
{
  return self->_transactionToken;
}

- (BOOL)isClientTransaction
{
  return 0;
}

- (void)stillAlive
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = NSStringFromSelector(a2);
    int v6 = 138412546;
    v7 = v5;
    __int16 v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "%@ : %@", (uint8_t *)&v6, 0x16u);
  }
}

- (PLClientServerTransaction)initWithPathManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLClientServerTransaction;
  int v6 = [(PLClientServerTransaction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pathManager, a3);
  }

  return v7;
}

+ (id)descriptionOfAllTransactionFilesForPathManager:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _allTransactionPathsForPathManager:v4];
  int v6 = [MEMORY[0x1E4F28E78] string];
  if ([v5 count])
  {
    id v25 = v4;
    uint64_t v7 = [v4 privateCacheDirectoryWithSubType:2];
    uint64_t v8 = [v5 count];
    uint64_t v9 = [v5 count];
    uint64_t v10 = @"s";
    if (v9 == 1) {
      uint64_t v10 = &stru_1EEB2EB80;
    }
    v24 = (void *)v7;
    [v6 appendFormat:@"Found %d transaction file%@ in %@\n", v8, v10, v7];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v5;
    uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v27 = 0;
          int v16 = [a1 _isOutstandingTransactionAtPath:v15 getScopeValues:&v27];
          v17 = +[PLClientServerTransaction scopesFromScopeValues:v27];
          uint64_t v18 = [v15 lastPathComponent];
          v19 = (void *)v18;
          if (v16) {
            v20 = @"%@ [outstanding]:\n";
          }
          else {
            v20 = @"%@ [active]:\n";
          }
          objc_msgSend(v6, "appendFormat:", v20, v18);

          v21 = [v17 allObjects];
          v22 = [a1 descriptionOfTransactionScopes:v21];
          [v6 appendFormat:@"\t{%@}\n", v22];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }

    id v4 = v25;
  }
  else
  {
    [v6 appendString:@"No transaction files found\n"];
  }

  return v6;
}

+ (id)descriptionOfTransactionScopes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v3, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) substringFromIndex:18];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [v4 componentsJoinedByString:@", "];

  return v11;
}

+ (id)transactionFromUserInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"PLClientServerTransactionUserInfoKey"];
  uint64_t v6 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    id v12 = v4;
    __int16 v13 = 2112;
    long long v14 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v9, 0x20u);
  }
  return v5;
}

+ (void)removeTransactionFromUserInfo:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2048;
    id v10 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%@ : %p", (uint8_t *)&v7, 0x16u);
  }
  [v4 removeObjectForKey:@"PLClientServerTransactionUserInfoKey"];
}

+ (void)addTransaction:(id)a3 toUserInfo:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "%@ : %@ -> %p", (uint8_t *)&v10, 0x20u);
  }
  if (v6) {
    [v7 setObject:v6 forKey:@"PLClientServerTransactionUserInfoKey"];
  }
}

+ (void)addTransaction:(id)a3 toXPCDictionary:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = NSStringFromSelector(a2);
    int v17 = 138412802;
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v10 = [v6 transactionToken];
  uint64_t v11 = (void *)v10;
  if (v7)
  {
    if (v10)
    {
      uint64_t v12 = MEMORY[0x19F38E330](v7);
      uint64_t v13 = MEMORY[0x1E4F14590];
      if (v12 == MEMORY[0x1E4F14590])
      {
        xpc_dictionary_set_string(v7, "PLClientServerTransactionXPCKey", (const char *)[v11 UTF8String]);
        __int16 v14 = [v6 changeScopes];
        if (v14 && MEMORY[0x19F38E330](v7) == v13) {
          xpc_dictionary_set_uint64(v7, "PLClientServerTransactionScopesXPCKey", +[PLClientServerTransaction scopeValuesFromScopes:v14]);
        }
        id v15 = [v6 pathManager];
        uint64_t v16 = [v15 libraryURL];

        if (v16 && MEMORY[0x19F38E330](v7) == v13) {
          PLXPCDictionarySetURL();
        }
      }
    }
  }
}

+ (id)_libraryURLFromXPCDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x19F38E330](v4) == MEMORY[0x1E4F14590])
  {
    id v6 = PLURLFromXPCDictionary();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v10, 0x20u);
  }
  return v6;
}

+ (id)_changeScopesFromXPCDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x19F38E330](v4) == MEMORY[0x1E4F14590])
  {
    id v6 = +[PLClientServerTransaction scopesFromScopeValues:xpc_dictionary_get_uint64(v5, "PLClientServerTransactionScopesXPCKey")];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v10, 0x20u);
  }
  return v6;
}

+ (id)_transactionTokenFromXPCDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4
    && MEMORY[0x19F38E330](v4) == MEMORY[0x1E4F14590]
    && (string = xpc_dictionary_get_string(v5, "PLClientServerTransactionXPCKey")) != 0)
  {
    id v6 = [NSString stringWithUTF8String:string];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    int v11 = 138412802;
    __int16 v12 = v8;
    __int16 v13 = 2048;
    __int16 v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v11, 0x20u);
  }
  return v6;
}

+ (void)_cleanupAllTransactionsScopesByPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138412546;
    long long v14 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        int v10 = objc_msgSend(MEMORY[0x1E4F8B908], "fileManager", v14);
        id v15 = 0;
        char v11 = [v10 removeItemAtPath:v9 error:&v15];
        id v12 = v15;

        if ((v11 & 1) == 0)
        {
          __int16 v13 = PLClientServerTransactionsGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            uint64_t v21 = v9;
            __int16 v22 = 2112;
            id v23 = v12;
            _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to remove transaction path %@ : %@", buf, 0x16u);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }
}

+ (void)cancelOutstandingTransactionHandlerTimer:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = +[PLConcurrencyLimiter sharedLimiter];
    long long v5 = [v4 sharedUtilityQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PLClientServerTransaction_cancelOutstandingTransactionHandlerTimer___block_invoke;
    block[3] = &unk_1E5875CE0;
    id v7 = v3;
    dispatch_sync(v5, block);
  }
}

void __70__PLClientServerTransaction_cancelOutstandingTransactionHandlerTimer___block_invoke(uint64_t a1)
{
}

+ (id)handleOutstandingTransactionsForPathManager:(id)a3 sqliteErrorHandler:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v19 = NSStringFromSelector(a2);
    [v18 handleFailureInMethod:a2, a1, @"PLClientServerTransaction.m", 805, @"%@ can only be called from assetsd", v19 object file lineNumber description];
  }
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  int v25 = 0;
  id v12 = +[PLConcurrencyLimiter sharedLimiter];
  __int16 v13 = [v12 sharedUtilityQueue];
  dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v13);

  id v20 = v9;
  id v22 = v10;
  id v23 = v11;
  uint64_t v21 = v14;
  pl_dispatch_source_set_event_handler();
  dispatch_time_t v15 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer(v21, v15, 0xB2D05E00uLL, 0x989680uLL);
  dispatch_resume(v21);
  long long v16 = v21;

  _Block_object_dispose(v24, 8);
  return v16;
}

void __100__PLClientServerTransaction_handleOutstandingTransactionsForPathManager_sqliteErrorHandler_handler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (+[PLPhotoLibrary areOpportunisticTasksDisabled])
  {
    HIDWORD(v2) = -858993459 * *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + 429496728;
    LODWORD(v2) = HIDWORD(v2);
    if ((v2 >> 1) <= 0x19999998)
    {
      id v3 = PLClientServerTransactionsGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = 1717986919 * *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = (v4 >> 34) + ((unint64_t)v4 >> 63);
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "delaying check for outstandingTransactions while opportunistic tasks are disabled [%d]", buf, 8u);
      }

      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
  }
  else
  {
    long long v5 = [MEMORY[0x1E4F8BA48] transaction:"+[PLClientServerTransaction handleOutstandingTransactionsForPathManager:sqliteErrorHandler:handler:]_block_invoke"];
    uint64_t v6 = [*(id *)(a1 + 72) _outstandingTransactionScopesByPathForPathManager:*(void *)(a1 + 32)];
    id v7 = PLClientServerTransactionsGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v28 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "scopes by path: %@", buf, 0xCu);
    }

    uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v9 = [v8 BOOLForKey:@"DisableCrashRecovery"];

    if (v9)
    {
      id v10 = PLClientServerTransactionsGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        long long v28 = @"DisableCrashRecovery";
        __int16 v29 = 2112;
        long long v30 = v6;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "%@ set: Ignoring all outsatnding scopes by path: %@", buf, 0x16u);
      }

      [*(id *)(a1 + 72) _cleanupAllTransactionsScopesByPath:v6];
    }
    else if ([(__CFString *)v6 count])
    {
      id v11 = PLClientServerTransactionsGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = [(__CFString *)v6 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v12;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "handling %d outstanding transactions...", buf, 8u);
      }

      [*(id *)(a1 + 72) _recordRecoveryAttemptForPathManager:*(void *)(a1 + 32)];
      [*(id *)(a1 + 72) _checkForAndHandleExcessiveRecoveryAttemptsForPathManager:*(void *)(a1 + 32) sqliteErrorHandler:*(void *)(a1 + 48)];
      __int16 v13 = [MEMORY[0x1E4F1CA80] set];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      dispatch_source_t v14 = v6;
      uint64_t v15 = [(__CFString *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = -[__CFString objectForKey:](v14, "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
            [(__CFString *)v13 unionSet:v19];
          }
          uint64_t v16 = [(__CFString *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v16);
      }

      id v20 = PLClientServerTransactionsGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v28 = v13;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "outstandingTransactions scopes: %@", buf, 0xCu);
      }

      if (*(void *)(a1 + 56))
      {
        uint64_t v21 = (void *)MEMORY[0x19F38D3B0]();
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      objc_msgSend(*(id *)(a1 + 72), "_cleanupAllTransactionsScopesByPath:", v14, (void)v22);
    }
    [v5 stillAlive];
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  }
}

+ (id)_outstandingTransactionScopesByPathForPathManager:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [MEMORY[0x1E4F1CA60] dictionary];
  context = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v16 = v4;
  [a1 _allTransactionPathsForPathManager:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int v12 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v17 = 0;
        if ([a1 _isOutstandingTransactionAtPath:v11 getScopeValues:&v17])
        {
          __int16 v13 = +[PLClientServerTransaction scopesFromScopeValues:v17];
          [v5 setObject:v13 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)_isOutstandingTransactionAtPath:(id)a3 getScopeValues:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = open((const char *)[v6 fileSystemRepresentation], 164, 438);
  if ((v7 & 0x80000000) == 0)
  {
    if (a4) {
      *a4 = [a1 _readScopeValuesFromFileDescriptor:v7];
    }
    flock(v7, 8);
    int v8 = v7;
    goto LABEL_8;
  }
  if (a4)
  {
    uint64_t v9 = open((const char *)[v6 fileSystemRepresentation], 132, 438);
    if ((v9 & 0x80000000) == 0)
    {
      int v8 = v9;
      *a4 = [a1 _readScopeValuesFromFileDescriptor:v9];
LABEL_8:
      close(v8);
    }
  }

  return (int)v7 >= 0;
}

+ (unint64_t)_readScopeValuesFromFileDescriptor:(int)a3
{
  unint64_t __buf = 0;
  if (pread(a3, &__buf, 8uLL, 0) == 8) {
    return __buf;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

+ (id)_allTransactionPathsForPathManager:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v3 = [v17 privateCacheDirectoryWithSubType:2];
  id v4 = [MEMORY[0x1E4F8B908] fileManager];
  long long v5 = [v4 contentsOfDirectoryAtPath:v3 error:0];

  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        __int16 v13 = (void *)MEMORY[0x19F38D3B0]();
        dispatch_source_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
        if (v14)
        {
          uint64_t v15 = [v3 stringByAppendingPathComponent:v12];
          [v6 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (void)_checkForAndHandleExcessiveRecoveryAttemptsForPathManager:(id)a3 sqliteErrorHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([a1 _hasExcessiveRecoveryAttemptsForPathManager:v6])
  {
    id v12 = 0;
    char v8 = [a1 _archiveRecoveryHistoryForPathManager:v6 error:&v12];
    id v9 = v12;
    uint64_t v10 = PLClientServerTransactionsGetLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "triggering full rebuild due to excessive recovery attempts.", buf, 2u);
      }

      [v6 setSqliteErrorForRebuildReason:11 allowsExit:1];
      v7[2](v7);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "unable to full rebuild after excessive recovery attempts due to inability to archive history file: %@", buf, 0xCu);
      }
    }
  }
}

+ (BOOL)_archiveRecoveryHistoryForPathManager:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(id)objc_opt_class() _recoveryHistoryFilePathForPathManager:v5];
  id v7 = NSString;
  char v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  uint64_t v10 = [v7 stringWithFormat:@"archivedrecoveryhistory-%@", v9];

  BOOL v11 = [v5 photoDirectoryWithType:6];

  id v12 = [v11 stringByAppendingPathComponent:v10];
  __int16 v13 = [v12 stringByAppendingPathExtension:@"plist"];

  id v14 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v22 = v13;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "archiving recovery history file to: %@...", buf, 0xCu);
  }

  uint64_t v15 = [MEMORY[0x1E4F8B908] fileManager];
  id v20 = 0;
  char v16 = [v15 moveItemAtPath:v6 toPath:v13 error:&v20];
  id v17 = v20;
  long long v18 = v17;
  if (a4 && (v16 & 1) == 0) {
    *a4 = v17;
  }

  return v16;
}

+ (BOOL)_hasExcessiveRecoveryAttemptsForPathManager:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _recoveryHistoryFilePathForPathManager:v3];

  id v5 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v4];
  if ((unint64_t)[v5 count] >= 0xA)
  {
    id v7 = [v5 sortedArrayUsingSelector:sel_compare_];
    if ([v7 isEqualToArray:v5])
    {
      char v8 = [v5 firstObject];
      id v9 = [v5 lastObject];
      [v9 timeIntervalSinceDate:v8];
      double v11 = v10;
      BOOL v6 = v10 < 600.0;
      if (v10 < 600.0)
      {
        id v12 = PLClientServerTransactionsGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v14 = 134218240;
          uint64_t v15 = [v5 count];
          __int16 v16 = 2048;
          double v17 = v11;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "found excessive recovery attempts (count: %lu within: %g seconds)", (uint8_t *)&v14, 0x16u);
        }
      }
    }
    else
    {
      char v8 = PLClientServerTransactionsGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "detected out of order recovery attempt, ignoring history for now.", (uint8_t *)&v14, 2u);
      }
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (void)_recordRecoveryAttemptForPathManager:(id)a3
{
  id v3 = a3;
  id v8 = [(id)objc_opt_class() _recoveryHistoryFilePathForPathManager:v3];

  id v4 = [MEMORY[0x1E4F1CA48] arrayWithContentsOfFile:v8];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v4 addObject:v5];
  if ((unint64_t)[v4 count] >= 0xB) {
    [v4 removeObjectAtIndex:0];
  }
  [v4 writeToFile:v8 atomically:0];
  BOOL v6 = (void *)MEMORY[0x1E4F8B908];
  id v7 = [MEMORY[0x1E4F8B908] fileManager];
  LOBYTE(v6) = [v6 changeFileOwnerToMobileAtPath:v8 error:0 usingFileManager:v7];

  if ((v6 & 1) == 0) {
    NSLog(&cfstr_Clientservertr.isa, v8, 0);
  }
}

+ (id)_recoveryHistoryFilePathForPathManager:(id)a3
{
  id v3 = [a3 photoDirectoryWithType:6];
  id v4 = [v3 stringByAppendingPathComponent:@"recoveryhistory"];
  id v5 = [v4 stringByAppendingPathExtension:@"plist"];

  return v5;
}

+ (id)beginServerTransactionWithClientTransactionFromXPCDictionary:(id)a3 pathManager:(id)a4 identifier:(const char *)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = +[PLClientServerTransaction _transactionTokenFromXPCDictionary:v9];
  double v11 = +[PLClientServerTransaction _changeScopesFromXPCDictionary:v9];

  if (v10)
  {
    id v12 = [a1 beginServerTransactionWithToken:v10 changeScopes:v11 pathManager:v8 identifier:a5];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)beginServerTransactionWithToken:(id)a3 changeScopes:(id)a4 pathManager:(id)a5 identifier:(const char *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (PLIsAssetsd())
  {
    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v27 = NSStringFromSelector(a2);
  [v26 handleFailureInMethod:a2, a1, @"PLClientServerTransaction.m", 595, @"%@ can only be called from assetsd", v27 object file lineNumber description];

  if (!v12)
  {
LABEL_3:
    __int16 v13 = [NSString stringWithFormat:@"Missing pathManager in clientServerTransaction call with token %@, scopes %@", v10, v11];
    PLSimulateCrash();
  }
LABEL_4:
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__100274;
  v32 = __Block_byref_object_dispose__100275;
  id v33 = 0;
  int v14 = [v12 privateCacheDirectoryWithSubType:2];
  uint64_t v15 = [v14 stringByAppendingPathComponent:v10];
  __int16 v16 = [a1 serverTransactionQueue];
  id v17 = v12;
  id v18 = v15;
  id v19 = v10;
  id v20 = v11;
  pl_dispatch_sync();

  long long v21 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    long long v22 = NSStringFromSelector(a2);
    uint64_t v23 = v29[5];
    *(_DWORD *)buf = 138412802;
    v35 = v22;
    __int16 v36 = 2112;
    id v37 = v19;
    __int16 v38 = 2112;
    uint64_t v39 = v23;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "%@ : %@ -> %@", buf, 0x20u);
  }
  id v24 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v24;
}

void __97__PLClientServerTransaction_beginServerTransactionWithToken_changeScopes_pathManager_identifier___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v11 = 0;
  uint64_t v2 = [*(id *)(a1 + 72) _serverTransactionForPathManager:*(void *)(a1 + 32) isNew:&v11 identifier:*(void *)(a1 + 80)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (v11)
  {
    uint64_t v5 = open((const char *)[*(id *)(a1 + 40) fileSystemRepresentation], 145, 438);
    if ((v5 & 0x80000000) != 0)
    {
      id v7 = PLClientServerTransactionsGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = NSStringFromSelector(*(SEL *)(a1 + 88));
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = *__error();
        *(_DWORD *)buf = 138412802;
        __int16 v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        __int16 v16 = 1024;
        int v17 = v10;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "%@ Failed to open %@: %d", buf, 0x1Cu);
      }
    }
    else
    {
      uint64_t v6 = v5;
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setTransactionToken:*(void *)(a1 + 48)];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setFileDescriptor:v6];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPath:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) _enqueueChangeScopes:*(void *)(a1 + 56)];
    }
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) _enqueueChangeScopes:*(void *)(a1 + 56)];
    unlink((const char *)[*(id *)(a1 + 40) fileSystemRepresentation]);
  }
}

+ (id)scopesFromScopeValues:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 _scopeValuesByScope];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v14);
        if (([v12 unsignedLongLongValue] & ~a3) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (unint64_t)scopeValuesFromScopes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 _scopeValuesByScope];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        v9 |= [v12 unsignedLongLongValue];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)_scopeValuesByScope
{
  pl_dispatch_once();
  uint64_t v2 = (void *)_scopeValuesByScope__valueByScope;
  return v2;
}

void __48__PLClientServerTransaction__scopeValuesByScope__block_invoke()
{
  v3[13] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PLTransactionScopeMomentGeneration";
  v2[1] = @"PLTransactionScopeCloudFeed";
  v3[0] = &unk_1EEBF0518;
  v3[1] = &unk_1EEBF0530;
  v2[2] = @"PLTransactionScopeSearchIndex";
  v2[3] = @"PLTransactionScopeAlbumCounts";
  v3[2] = &unk_1EEBF0548;
  v3[3] = &unk_1EEBF0560;
  v2[4] = @"PLTransactionScopeImportSessionCounts";
  v2[5] = @"PLTransactionScopeDuplicateAnalysis";
  v3[4] = &unk_1EEBF0578;
  v3[5] = &unk_1EEBF0590;
  v2[6] = @"PLTransactionScopeFilePersistence";
  v2[7] = @"PLTransactionScopeFileIngestion";
  v3[6] = &unk_1EEBF05A8;
  v3[7] = &unk_1EEBF05C0;
  v2[8] = @"PLTransactionScopePlaceholderDownload";
  v2[9] = @"PLTransactionScopeLockedResources";
  v3[8] = &unk_1EEBF05D8;
  v3[9] = &unk_1EEBF05F0;
  v2[10] = @"PLTransactionScopeSocialGroupAssetPersonEdges";
  v2[11] = @"PLTransactionScopeSocialGroupAssetContainment";
  v3[10] = &unk_1EEBF0608;
  v3[11] = &unk_1EEBF0620;
  v2[12] = @"PLTransactionScopeSocialGroupDeduplication";
  v3[12] = &unk_1EEBF0638;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:13];
  v1 = (void *)_scopeValuesByScope__valueByScope;
  _scopeValuesByScope__valueByScope = v0;
}

+ (id)_filePathForTransactionWithToken:(id)a3 pathManager:(id)a4
{
  id v5 = a3;
  id v6 = [a4 privateCacheDirectoryWithSubType:2];
  uint64_t v7 = [v6 stringByAppendingPathComponent:v5];

  return v7;
}

+ (id)beginClientTransactionWithChangeScopes:(id)a3 pathManager:(id)a4 identifier:(const char *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [v10 UUIDString];

  if (!v9)
  {
    id v12 = [NSString stringWithFormat:@"Missing pathManager in clientServerTransaction call with token %@, scopes %@", v11, v8];
    PLSimulateCrash();
  }
  __int16 v13 = +[_PLClientTransaction _fdResourceSemaphore];
  long long v14 = v13;
  if (v13) {
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v15 = [a1 _filePathForTransactionWithToken:v11 pathManager:v9];
  uint64_t v16 = open((const char *)[v15 fileSystemRepresentation], 2705, 438);
  if ((v16 & 0x80000000) == 0) {
    goto LABEL_14;
  }
  id v31 = v8;
  long long v17 = [v9 privateCacheDirectoryWithSubType:2];
  if (v17)
  {
    id v33 = 0;
    char v18 = [MEMORY[0x1E4F8B908] createDirectoryAtPath:v17 error:&v33];
    uint64_t v19 = (_PLClientTransaction *)v33;
    if (v18) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v20 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v17;
    __int16 v36 = 2112;
    id v37 = v19;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Unable to create directory: %@, reason: %@", buf, 0x16u);
  }

LABEL_13:
  long long v21 = (_PLClientTransaction *)v15;
  uint64_t v16 = open((const char *)[(_PLClientTransaction *)v21 fileSystemRepresentation], 2705, 438);

  id v8 = v31;
  if ((v16 & 0x80000000) == 0)
  {
LABEL_14:
    long long v22 = [[_PLClientTransaction alloc] initWithPathManager:v9 identifier:a5];
    [(PLClientServerTransaction *)v22 setTransactionToken:v11];
    [(_PLClientTransaction *)v22 setFileDescriptor:v16];
    [(_PLClientTransaction *)v22 setPath:v15];
    [(_PLClientTransaction *)v22 addChangeScopes:v8];
    [(_PLClientTransaction *)v22 setFdResourceSemaphore:v14];
    goto LABEL_15;
  }
  uint64_t v28 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    __int16 v29 = NSStringFromSelector(a2);
    int v30 = *__error();
    *(_DWORD *)buf = 138412802;
    v35 = v29;
    __int16 v36 = 2112;
    id v37 = v21;
    __int16 v38 = 1024;
    int v39 = v30;
    _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "%@ Failed to open transaction %@: %d", buf, 0x1Cu);
  }
  if (v14) {
    dispatch_semaphore_signal(v14);
  }
  long long v22 = 0;
LABEL_15:
  if ((PLIsAssetsd() & 1) != 0 || PLIsSuppressingLogsForUnitTesting())
  {
    uint64_t v23 = PLClientServerTransactionsGetLog();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    id v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v35 = v24;
    __int16 v36 = 2112;
    id v37 = v22;
    long long v25 = v23;
    os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    uint64_t v23 = PLClientServerTransactionsGetLog();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    id v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v35 = v24;
    __int16 v36 = 2112;
    id v37 = v22;
    long long v25 = v23;
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_19B3C7000, v25, v26, "%@ : %@", buf, 0x16u);

LABEL_22:
  return v22;
}

+ (id)_serverTransactionForPathManager:(id)a3 isNew:(BOOL *)a4 identifier:(const char *)a5
{
  id v9 = a3;
  uint64_t v10 = +[PLClientServerTransaction serverTransactionQueue];
  dispatch_assert_queue_V2(v10);

  if (!a4)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PLClientServerTransaction.m", 456, @"Invalid parameter not satisfying: %@", @"outIsNew" object file lineNumber description];
  }
  if (_serverTransactionForPathManager_isNew_identifier__onceToken != -1) {
    dispatch_once(&_serverTransactionForPathManager_isNew_identifier__onceToken, &__block_literal_global_171_100314);
  }
  uint64_t v11 = [v9 photosDatabasePath];
  id v12 = [(id)_serverTransactionForPathManager_isNew_identifier__sServerTransactionsByLibraryPath objectForKey:v11];
  if (!v12)
  {
    id v12 = [[_PLServerTransaction alloc] initWithPathManager:v9 identifier:a5];
    [(id)_serverTransactionForPathManager_isNew_identifier__sServerTransactionsByLibraryPath setObject:v12 forKey:v11];
    *a4 = 1;
  }

  return v12;
}

void __79__PLClientServerTransaction__serverTransactionForPathManager_isNew_identifier___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v1 = (void *)_serverTransactionForPathManager_isNew_identifier__sServerTransactionsByLibraryPath;
  _serverTransactionForPathManager_isNew_identifier__sServerTransactionsByLibraryPath = v0;
}

+ (id)serverTransactionQueue
{
  pl_dispatch_once();
  uint64_t v2 = (void *)serverTransactionQueue_sQueue;
  return v2;
}

void __51__PLClientServerTransaction_serverTransactionQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("PLClientServerTransactions", 0);
  v1 = (void *)serverTransactionQueue_sQueue;
  serverTransactionQueue_sQueue = (uint64_t)v0;
}

@end