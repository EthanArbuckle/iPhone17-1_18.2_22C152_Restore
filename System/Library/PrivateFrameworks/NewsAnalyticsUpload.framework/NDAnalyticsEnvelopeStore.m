@interface NDAnalyticsEnvelopeStore
- (FCAssetStore)assetStore;
- (FCCacheCoordinator)cacheCoordinator;
- (NDAnalyticsEnvelopeStore)init;
- (NDAnalyticsEnvelopeStore)initWithStoreDirectoryFileURL:(id)a3;
- (NDAnalyticsEnvelopeStoreObserver)observer;
- (id)allEntriesWithHoldToken:(id *)a3;
- (id)envelopesForEntries:(id)a3;
- (id)sizesOfEnvelopesWithEntries:(id)a3;
- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3;
- (void)_deleteEnvelopesForKeysFromStore:(id)a3;
- (void)_reportEnvelopesToNewsAutomationIfNeeded:(id)a3;
- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4;
- (void)copyEnvelopes:(id)a3;
- (void)deleteEnvelopesForEntries:(id)a3;
- (void)enableFlushing;
- (void)setAssetStore:(id)a3;
- (void)setCacheCoordinator:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation NDAnalyticsEnvelopeStore

- (NDAnalyticsEnvelopeStore)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAnalyticsEnvelopeStore init]";
    __int16 v9 = 2080;
    v10 = "NDAnalyticsEnvelopeStore.m";
    __int16 v11 = 1024;
    int v12 = 39;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_21FDD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NDAnalyticsEnvelopeStore init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NDAnalyticsEnvelopeStore)initWithStoreDirectoryFileURL:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeStore initWithStoreDirectoryFileURL:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)NDAnalyticsEnvelopeStore;
  v5 = [(NDAnalyticsEnvelopeStore *)&v16 init];
  if (v5)
  {
    id v6 = [v4 URLByAppendingPathComponent:@"envelope-store" isDirectory:1];
    id v7 = objc_alloc(MEMORY[0x263F59378]);
    v8 = [v6 path];
    __int16 v9 = (FCAssetStore *)[v7 initWithDirectoryAtPath:v8 preferredAssetPathExtension:@"env"];

    assetStore = v5->_assetStore;
    v5->_assetStore = v9;
    __int16 v11 = v9;

    int v12 = objc_opt_new();
    [v12 setDelegate:v5];
    __int16 v13 = [(FCAssetStore *)v11 allKeys];
    [v12 setupWithInitialKeys:v13];

    cacheCoordinator = v5->_cacheCoordinator;
    v5->_cacheCoordinator = (FCCacheCoordinator *)v12;
  }
  return v5;
}

- (void)copyEnvelopes:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeStore copyEnvelopes:]();
  }
  v5 = [MEMORY[0x263EFF910] date];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke;
  v20[3] = &unk_2645389A8;
  id v21 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(v4, "fc_dictionaryWithKeyBlock:", v20);
  v8 = [(NDAnalyticsEnvelopeStore *)self assetStore];
  __int16 v9 = [(NDAnalyticsEnvelopeStore *)self cacheCoordinator];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke_2;
  objc_super v16 = &unk_264538930;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  [v10 performCacheWrite:&v13];
  -[NDAnalyticsEnvelopeStore _reportEnvelopesToNewsAutomationIfNeeded:](self, "_reportEnvelopesToNewsAutomationIfNeeded:", v4, v13, v14, v15, v16);
}

id __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  v5 = [MEMORY[0x263F08C38] UUID];
  id v6 = [v5 UUIDString];
  [v4 setEnvelopeIdentifier:v6];

  uint64_t v7 = [v3 contentType];
  [v4 setEnvelopeContentType:v7];
  [v4 setEnvelopeSubmissionDate:*(void *)(a1 + 32)];

  return v4;
}

void __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke_3;
  v3[3] = &unk_2645389D0;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v8 = [a2 stringRepresentation];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v5 data];

  [*(id *)(a1 + 40) didInsertKeyIntoCache:v8 withLifetimeHint:1];
}

- (void)deleteEnvelopesForEntries:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeStore deleteEnvelopesForEntries:]();
  }
  id v5 = [(NDAnalyticsEnvelopeStore *)self cacheCoordinator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__NDAnalyticsEnvelopeStore_deleteEnvelopesForEntries___block_invoke;
  v8[3] = &unk_264538930;
  id v9 = v4;
  id v10 = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = v4;
  [v6 performCacheWrite:v8];
}

void __54__NDAnalyticsEnvelopeStore_deleteEnvelopesForEntries___block_invoke(void **a1)
{
  NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries(a1[4]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1[5] _deleteEnvelopesForKeysFromStore:v2];
  [a1[6] didRemoveKeysFromCache:v2];
}

- (void)enableFlushing
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F593C8]) initWithLowWaterMark:5000000 highWaterMark:10000000 alwaysFlushKeysWithZeroInterest:0];
  id v3 = [(NDAnalyticsEnvelopeStore *)self cacheCoordinator];
  [v3 enableFlushingWithPolicy:v4];
}

- (void)setObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NDAnalyticsEnvelopeStore *)self cacheCoordinator];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__NDAnalyticsEnvelopeStore_setObserver___block_invoke;
  v7[3] = &unk_2645388A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performCacheWrite:v7];
}

id __40__NDAnalyticsEnvelopeStore_setObserver___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (NDAnalyticsEnvelopeStoreObserver)observer
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  id v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v3 = [(NDAnalyticsEnvelopeStore *)self cacheCoordinator];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__NDAnalyticsEnvelopeStore_observer__block_invoke;
  v6[3] = &unk_2645389F8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performCacheWrite:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NDAnalyticsEnvelopeStoreObserver *)v4;
}

uint64_t __36__NDAnalyticsEnvelopeStore_observer__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

  return MEMORY[0x270F9A758]();
}

- (id)allEntriesWithHoldToken:(id *)a3
{
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v5 = [(NDAnalyticsEnvelopeStore *)self cacheCoordinator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__NDAnalyticsEnvelopeStore_allEntriesWithHoldToken___block_invoke;
  v8[3] = &unk_264538A20;
  void v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  v8[7] = a3;
  [v5 performCacheRead:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations((void *)v16[5]);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __52__NDAnalyticsEnvelopeStore_allEntriesWithHoldToken___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetStore];
  id v3 = [v2 allKeys];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(a1 + 56))
  {
    id v10 = [*(id *)(a1 + 32) cacheCoordinator];
    uint64_t v7 = [v10 holdTokenForKeys:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)sizesOfEnvelopesWithEntries:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeStore sizesOfEnvelopesWithEntries:]();
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  objc_super v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v5 = [(NDAnalyticsEnvelopeStore *)self cacheCoordinator];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__NDAnalyticsEnvelopeStore_sizesOfEnvelopesWithEntries___block_invoke;
  v9[3] = &unk_264538A70;
  v9[4] = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performCacheRead:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__NDAnalyticsEnvelopeStore_sizesOfEnvelopesWithEntries___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetStore];
  id v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__NDAnalyticsEnvelopeStore_sizesOfEnvelopesWithEntries___block_invoke_2;
  v8[3] = &unk_264538A48;
  id v9 = v2;
  id v4 = v2;
  uint64_t v5 = objc_msgSend(v3, "fc_dictionaryWithValueBlock:", v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id __56__NDAnalyticsEnvelopeStore_sizesOfEnvelopesWithEntries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = FCDynamicCast();

  uint64_t v5 = [v4 stringRepresentation];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "sizeOfFileForKey:", v5));

  return v6;
}

- (id)envelopesForEntries:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeStore envelopesForEntries:]();
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  objc_super v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v5 = [(NDAnalyticsEnvelopeStore *)self cacheCoordinator];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__NDAnalyticsEnvelopeStore_envelopesForEntries___block_invoke;
  v9[3] = &unk_264538A70;
  v9[4] = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performCacheRead:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__NDAnalyticsEnvelopeStore_envelopesForEntries___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetStore];
  id v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__NDAnalyticsEnvelopeStore_envelopesForEntries___block_invoke_2;
  v8[3] = &unk_264538A98;
  id v9 = v2;
  id v4 = v2;
  uint64_t v5 = objc_msgSend(v3, "fc_dictionaryWithValueBlock:", v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id __48__NDAnalyticsEnvelopeStore_envelopesForEntries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = FCDynamicCast();

  uint64_t v5 = [v4 stringRepresentation];
  uint64_t v6 = [*(id *)(a1 + 32) fileURLForKey:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v6];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F5A2A8]) initWithData:v7];

  return v8;
}

- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3
{
  id v3 = [(NDAnalyticsEnvelopeStore *)self assetStore];
  unint64_t v4 = [v3 storeSize];

  return v4;
}

- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4
{
  objc_msgSend(a4, "allObjects", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(NDAnalyticsEnvelopeStore *)self _deleteEnvelopesForKeysFromStore:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  uint64_t v6 = NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations(v7);
  [WeakRetained envelopeStore:self didFlushEnvelopesForEntries:v6];
}

- (void)_deleteEnvelopesForKeysFromStore:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeStore _deleteEnvelopesForKeysFromStore:]();
  }
  uint64_t v5 = [(NDAnalyticsEnvelopeStore *)self assetStore];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "removeFileWithKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_reportEnvelopesToNewsAutomationIfNeeded:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (NFInternalBuild())
  {
    id v4 = NewsCoreUserDefaults();
    int v5 = [v4 BOOLForKey:*MEMORY[0x263F59308]];

    if (v5)
    {
      id v6 = FCURLForFeldsparUserAccountHomeDirectory();
      v26 = [v6 URLByAppendingPathComponent:@"envelopes" isDirectory:1];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v23 = v3;
      id obj = v3;
      uint64_t v27 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v27)
      {
        uint64_t v25 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v32 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"contentType-%d", objc_msgSend(v8, "contentType"));
            id v10 = [v26 URLByAppendingPathComponent:v9 isDirectory:1];
            long long v11 = [MEMORY[0x263F08850] defaultManager];
            id v30 = 0;
            [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v30];
            id v28 = v30;

            long long v12 = [MEMORY[0x263F08850] defaultManager];
            long long v13 = [v10 path];
            id v29 = 0;
            long long v14 = [v12 contentsOfDirectoryAtPath:v13 error:&v29];
            id v15 = v29;
            uint64_t v16 = [v14 count];

            if (v15 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "error2");
              *(_DWORD *)buf = 136315906;
              v36 = "-[NDAnalyticsEnvelopeStore _reportEnvelopesToNewsAutomationIfNeeded:]";
              __int16 v37 = 2080;
              v38 = "NDAnalyticsEnvelopeStore.m";
              __int16 v39 = 1024;
              int v40 = 250;
              __int16 v41 = 2114;
              v42 = v22;
              _os_log_error_impl(&dword_21FDD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
            }
            id v17 = NSString;
            id v18 = [NSNumber numberWithUnsignedInteger:v16];
            id v19 = [v17 stringWithFormat:@"%@", v18];
            id v20 = [v10 URLByAppendingPathComponent:v19];

            id v21 = [v8 data];
            [v21 writeToURL:v20 atomically:1];
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
        }
        while (v27);
      }

      id v3 = v23;
    }
  }
}

- (FCAssetStore)assetStore
{
  return self->_assetStore;
}

- (void)setAssetStore:(id)a3
{
}

- (FCCacheCoordinator)cacheCoordinator
{
  return self->_cacheCoordinator;
}

- (void)setCacheCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);
  objc_storeStrong((id *)&self->_assetStore, 0);

  objc_destroyWeak((id *)&self->_observer);
}

- (void)initWithStoreDirectoryFileURL:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storeDirectoryFileURL", v6, 2u);
}

- (void)copyEnvelopes:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);
}

- (void)deleteEnvelopesForEntries:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);
}

- (void)sizesOfEnvelopesWithEntries:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);
}

- (void)envelopesForEntries:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);
}

- (void)_deleteEnvelopesForKeysFromStore:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"keys", v6, 2u);
}

@end