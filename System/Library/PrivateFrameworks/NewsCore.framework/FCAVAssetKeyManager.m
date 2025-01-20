@interface FCAVAssetKeyManager
- (FCAVAssetKeyManager)init;
- (id)_keyURIForKeyIdentifier:(void *)a1;
- (id)initWithService:(void *)a3 cache:;
- (uint64_t)_shouldRefreshKey:(uint64_t)result;
- (void)_completeKeyRequest:(void *)a3 withData:(void *)a4 error:(void *)a5 session:;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4;
- (void)fetchKeysWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)refreshKeysIfNearExpiration:(id)a3 completionHandler:(id)a4;
- (void)registerAVURLAssetForAutomaticKeyManagement:(id)a3;
@end

@implementation FCAVAssetKeyManager

- (void)refreshKeysIfNearExpiration:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = [v6 count];
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "AV asset key manager will see if %lu keys need refresh", buf, 0xCu);
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_18;
    v32[3] = &unk_1E5B4DDA8;
    v32[4] = self;
    v10 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v32);
    if ([v10 count])
    {
      v11 = (void *)FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        uint64_t v13 = [v6 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v36 = v13;
        __int16 v37 = 2114;
        id v38 = v6;
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "AV asset key manager found %lu keys needing refresh: %{public}@", buf, 0x16u);
      }
      v14 = [MEMORY[0x1E4F164F0] contentKeySessionWithKeySystem:*MEMORY[0x1E4F159F0]];
      v15 = FCAVWorkQueue();
      [v14 setDelegate:self queue:v15];

      v16 = [FCAVAssetKeyFetchRequest alloc];
      v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
      v18 = -[FCAVAssetKeyFetchRequest initWithContentKeySession:keyURIs:forceRefresh:completionHandler:]((id *)&v16->super.isa, v14, v17, 1, v7);

      if (self) {
        fetchRequests = self->_fetchRequests;
      }
      else {
        fetchRequests = 0;
      }
      [(FCThreadSafeMutableArray *)fetchRequests addObject:v18];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v20 = v10;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v27;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v27 != v23) {
              objc_enumerationMutation(v20);
            }
            objc_msgSend(v14, "processContentKeyRequestWithIdentifier:initializationData:options:", *(void *)(*((void *)&v26 + 1) + 8 * v24++), 0, 0, (void)v26);
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v22);
      }
    }
    else
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_5;
      v30[3] = &unk_1E5B4CA88;
      id v31 = v7;
      __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_5((uint64_t)v30);
      v14 = v31;
    }
  }
  else
  {
    v32[5] = MEMORY[0x1E4F143A8];
    v32[6] = 3221225472;
    v32[7] = __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke;
    v32[8] = &unk_1E5B4CA88;
    id v25 = v7;
    id v33 = v25;
    if (v25)
    {
      (*((void (**)(id, void))v25 + 2))(v25, 0);
    }
  }
}

- (id)initWithService:(void *)a3 cache:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)FCAVAssetKeyManager;
    v8 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      v9 = objc_alloc_init(FCThreadSafeMutableArray);
      id v10 = a1[4];
      a1[4] = v9;

      id v11 = objc_alloc(MEMORY[0x1E4F81BD0]);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __45__FCAVAssetKeyManager_initWithService_cache___block_invoke;
      v16[3] = &unk_1E5B4C840;
      a1 = a1;
      v17 = a1;
      uint64_t v12 = [v11 initWithConstructor:v16];
      id v13 = a1[3];
      a1[3] = (id)v12;

      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:a1[3] selector:sel_reset name:*MEMORY[0x1E4F15048] object:0];
    }
  }

  return a1;
}

- (FCAVAssetKeyManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAVAssetKeyManager init]";
    __int16 v9 = 2080;
    id v10 = "FCAVAssetKeyManager.m";
    __int16 v11 = 1024;
    int v12 = 75;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAVAssetKeyManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

id __45__FCAVAssetKeyManager_initWithService_cache___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F164F0] contentKeySessionWithKeySystem:*MEMORY[0x1E4F159F0]];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = FCAVWorkQueue();
  [v2 setDelegate:v3 queue:v4];

  return v2;
}

- (void)registerAVURLAssetForAutomaticKeyManagement:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 mayRequireContentKeysForMediaDataProcessing])
  {
    v5 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "AV asset key manager registering automatic key management for %{public}@", (uint8_t *)&v9, 0xCu);
    }
    if (self) {
      sharedContentKeySession = self->_sharedContentKeySession;
    }
    else {
      sharedContentKeySession = 0;
    }
    id v7 = sharedContentKeySession;
    v8 = [(NFLazy *)v7 value];
    [v8 addContentKeyRecipient:v4];
  }
}

- (void)fetchKeysWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke;
  v33[3] = &unk_1E5B4DC20;
  v33[4] = self;
  id v7 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v33);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke_2;
  v32[3] = &unk_1E5B5B0D8;
  v32[4] = self;
  v8 = objc_msgSend(v7, "fc_arrayOfObjectsPassingTest:", v32);
  if ([v8 count])
  {
    int v9 = [MEMORY[0x1E4F164F0] contentKeySessionWithKeySystem:*MEMORY[0x1E4F159F0]];
    id v10 = FCAVWorkQueue();
    [v9 setDelegate:self queue:v10];

    uint64_t v11 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v11;
      uint64_t v13 = [v8 count];
      *(_DWORD *)buf = 134218498;
      uint64_t v36 = v13;
      __int16 v37 = 2114;
      id v38 = v9;
      __int16 v39 = 2114;
      v40 = v8;
      _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "AV asset key manager fetching %lu keys on session %{public}@: %{public}@", buf, 0x20u);
    }
    v14 = [FCAVAssetKeyFetchRequest alloc];
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    v16 = -[FCAVAssetKeyFetchRequest initWithContentKeySession:keyURIs:forceRefresh:completionHandler:]((id *)&v14->super.isa, v9, v15, 0, v6);

    if (self) {
      fetchRequests = self->_fetchRequests;
    }
    else {
      fetchRequests = 0;
    }
    [(FCThreadSafeMutableArray *)fetchRequests addObject:v16];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v9, "processContentKeyRequestWithIdentifier:initializationData:options:", *(void *)(*((void *)&v23 + 1) + 8 * v22++), 0, 0, (void)v23);
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v34 count:16];
      }
      while (v20);
    }
  }
  else
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    long long v29 = __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke_3;
    v30 = &unk_1E5B4CA88;
    id v31 = (void (**)(id, void))v6;
    v31[2](v31, 0);
    int v9 = v31;
  }
}

id __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return -[FCAVAssetKeyManager _keyURIForKeyIdentifier:](*(void **)(a1 + 32), a2);
}

- (id)_keyURIForKeyIdentifier:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v4 = v3;
      a1 = v4;
    }
    else
    {
      objc_opt_class();
      if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v5 = v3;
        a1 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
      }
      else
      {
        id v5 = 0;
        a1 = 0;
      }

      id v4 = 0;
    }
  }
  return a1;
}

uint64_t __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(void **)(v3 + 16);
  }
  else {
    id v4 = 0;
  }
  id v5 = [v4 assetKeyForURI:a2];
  if (v5) {
    uint64_t v6 = -[FCAVAssetKeyManager _shouldRefreshKey:](*(void *)(a1 + 32), v5);
  }
  else {
    uint64_t v6 = 1;
  }

  return v6;
}

- (uint64_t)_shouldRefreshKey:(uint64_t)result
{
  if (result)
  {
    id v2 = a2;
    uint64_t v3 = [v2 creationDate];
    id v4 = [v2 expirationDate];
    id v5 = [v2 creationDate];

    [v4 timeIntervalSinceDate:v5];
    id v7 = [v3 dateByAddingTimeInterval:v6 * 0.75];

    v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = objc_msgSend(v8, "fc_isLaterThanOrEqualTo:", v7);

    return v9;
  }
  return result;
}

uint64_t __66__FCAVAssetKeyManager_fetchKeysWithIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

id __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v3 = -[FCAVAssetKeyManager _keyURIForKeyIdentifier:](*(void **)(a1 + 32), a2);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      id v7 = *(void **)(v6 + 16);
    }
    else {
      id v7 = 0;
    }
    v8 = [v7 assetKeyForURI:v5];
    if (v8 && -[FCAVAssetKeyManager _shouldRefreshKey:](*(void *)(a1 + 32), v8)) {
      id v9 = v5;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __69__FCAVAssetKeyManager_refreshKeysIfNearExpiration_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "AV asset key manager found no keys needing refresh", v4, 2u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  char v8 = [v7 respondByRequestingPersistableContentKeyRequestAndReturnError:&v15];
  id v9 = v15;
  if ((v8 & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__FCAVAssetKeyManager_contentKeySession_didProvideContentKeyRequest___block_invoke;
    v10[3] = &unk_1E5B4DD08;
    id v11 = v7;
    int v12 = self;
    id v13 = v9;
    id v14 = v6;
    __69__FCAVAssetKeyManager_contentKeySession_didProvideContentKeyRequest___block_invoke((uint64_t)v10);
  }
}

void __69__FCAVAssetKeyManager_contentKeySession_didProvideContentKeyRequest___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 identifier];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "AV asset key manager failed to get persistableContentKeyRequest for identifier: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](*(void **)(a1 + 40), *(void **)(a1 + 32), 0, *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (void)_completeKeyRequest:(void *)a3 withData:(void *)a4 error:(void *)a5 session:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    if (v10)
    {
      id v13 = [MEMORY[0x1E4F164E8] contentKeyResponseWithFairPlayStreamingKeyResponseData:v10];
      [v9 processContentKeyResponse:v13];
    }
    else
    {
      [v9 processContentKeyResponseError:v11];
      id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"AudioAssetDownloadFailed" object:v11 userInfo:MEMORY[0x1E4F1CC08]];
    }

    id v14 = [v9 identifier];
    id v15 = -[FCAVAssetKeyManager _keyURIForKeyIdentifier:](a1, v14);

    if (v15)
    {
      v16 = (void *)a1[4];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __66__FCAVAssetKeyManager__completeKeyRequest_withData_error_session___block_invoke;
      v17[3] = &unk_1E5B50288;
      id v18 = v12;
      id v19 = v15;
      id v20 = v11;
      [v16 readWriteWithAccessor:v17];
    }
  }
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id obj = a4;
  id v6 = a4;
  id v7 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    id v9 = objc_msgSend(v6, "identifier", obj);
    LODWORD(buf.receiver) = 138543362;
    *(id *)((char *)&buf.receiver + 4) = v9;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "AV asset key manager successfully got persistableContentKeyRequest for identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  id v10 = objc_msgSend(v6, "identifier", obj);
  id v11 = -[FCAVAssetKeyManager _keyURIForKeyIdentifier:](self, v10);

  if (!v11)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke;
    v44[3] = &unk_1E5B4C738;
    v44[4] = self;
    id v45 = v6;
    id v46 = v32;
    __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke((uint64_t)v44);

    goto LABEL_22;
  }
  id v31 = v11;
  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  id v13 = cache;
  v30 = [(FCAVAssetKeyCacheType *)v13 assetKeyForURI:v31];

  if (!v30 || (-[FCAVAssetKeyManager _shouldRefreshKey:]((uint64_t)self, v30) & 1) != 0) {
    goto LABEL_10;
  }
  id v14 = v31;
  id v15 = v14;
  if (self)
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    v16 = self->_fetchRequests;
    buf.receiver = (id)MEMORY[0x1E4F143A8];
    buf.super_class = (Class)3221225472;
    v52 = __50__FCAVAssetKeyManager__waitingOnRefreshForKeyURI___block_invoke;
    v53 = &unk_1E5B5B128;
    id v17 = v15;
    id v54 = v17;
    v55 = &v47;
    [(FCThreadSafeMutableArray *)v16 enumerateObjectsUsingBlock:&buf];

    LODWORD(v16) = *((unsigned char *)v48 + 24) == 0;
    _Block_object_dispose(&v47, 8);

    if (!v16)
    {
LABEL_10:
      id v18 = FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.receiver) = 138543362;
        *(id *)((char *)&buf.receiver + 4) = v31;
        _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "AV asset key manager fetching response for %{public}@", (uint8_t *)&buf, 0xCu);
      }
      id v19 = [FCAVAssetKeyFetchOperation alloc];
      if (self)
      {
        id v20 = self->_service;
        uint64_t v21 = self->_cache;
      }
      else
      {
        id v20 = 0;
        uint64_t v21 = 0;
      }
      id v22 = v6;
      id v23 = v31;
      long long v24 = v20;
      long long v25 = v21;
      if (v19)
      {
        buf.receiver = v19;
        buf.super_class = (Class)FCAVAssetKeyFetchOperation;
        long long v26 = [(FCAVAssetKeyManager *)&buf init];
        id v19 = (FCAVAssetKeyFetchOperation *)v26;
        if (v26)
        {
          objc_storeStrong((id *)&v26[9]._sharedContentKeySession, obja);
          objc_storeStrong((id *)&v19->_keyURI, v11);
          objc_storeStrong((id *)&v19->_service, v20);
          objc_storeStrong((id *)&v19->_cache, v21);
        }
      }

      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_26;
      newValue[3] = &unk_1E5B5B100;
      id v34 = v23;
      v35 = self;
      id v36 = v22;
      id v37 = v32;
      if (v19) {
        objc_setProperty_nonatomic_copy(v19, v27, newValue, 376);
      }
      [(FCOperation *)v19 start];

      goto LABEL_20;
    }
  }
  else
  {
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2;
  v38[3] = &unk_1E5B4DC70;
  __int16 v39 = v15;
  v40 = self;
  id v41 = v6;
  id v42 = v30;
  id v43 = v32;
  __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2((uint64_t)v38);

  id v19 = v39;
LABEL_20:

LABEL_22:
}

void __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_invalidAVAssetKeyURIError");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](v2, v3, 0, v4, *(void **)(a1 + 48));
}

void __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "AV asset key manager using cached response for %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = [*(id *)(a1 + 56) keyData];
  -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](v4, v5, v6, 0, *(void **)(a1 + 64));
}

void __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2_27;
    v12[3] = &unk_1E5B4DC70;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    id v13 = v7;
    uint64_t v14 = v8;
    id v15 = v9;
    id v16 = v6;
    id v17 = *(id *)(a1 + 56);
    __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2_27((uint64_t)v12);
  }
  else
  {
    id v10 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)objc_super buf = 138543362;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "AV asset key manager fetched response for %{public}@", buf, 0xCu);
    }
    -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](*(void **)(a1 + 40), *(void **)(a1 + 48), v5, 0, *(void **)(a1 + 56));
  }
}

void __80__FCAVAssetKeyManager_contentKeySession_didProvidePersistableContentKeyRequest___block_invoke_2_27(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "AV asset key manager failed to fetch response for %{public}@", (uint8_t *)&v4, 0xCu);
  }
  -[FCAVAssetKeyManager _completeKeyRequest:withData:error:session:](*(void **)(a1 + 40), *(void **)(a1 + 48), 0, *(void **)(a1 + 56), *(void **)(a1 + 64));
}

uint64_t __50__FCAVAssetKeyManager__waitingOnRefreshForKeyURI___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = a2;
  id v7 = v6;
  if (v6)
  {
    if (*((unsigned char *)v6 + 8))
    {
      uint64_t v9 = v6;
      uint64_t v6 = (id *)[v6[3] containsObject:*(void *)(a1 + 32)];
      id v7 = v9;
      if (v6)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
  return MEMORY[0x1F41817F8](v6, v7);
}

void __66__FCAVAssetKeyManager__completeKeyRequest_withData_error_session___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__FCAVAssetKeyManager__completeKeyRequest_withData_error_session___block_invoke_2;
  v19[3] = &unk_1E5B5B150;
  id v20 = *(id *)(a1 + 32);
  int v4 = objc_msgSend(v3, "fc_firstObjectPassingTest:", v19);
  uint64_t v5 = v4;
  if (v4) {
    int v4 = (void *)v4[3];
  }
  if ([v4 containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v6 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      if (v5) {
        uint64_t v8 = v5[3];
      }
      else {
        uint64_t v8 = 0;
      }
      *(_DWORD *)objc_super buf = 138543618;
      uint64_t v22 = v7;
      __int16 v23 = 2114;
      uint64_t v24 = v8;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "AV asset key manager removing keyURI %{public}@ from %{public}@", buf, 0x16u);
    }
    if (v5)
    {
      [(id)v5[3] removeObject:*(void *)(a1 + 40)];
      id v10 = (void *)v5[4];
    }
    else
    {
      [0 removeObject:*(void *)(a1 + 40)];
      id v10 = 0;
    }
    objc_msgSend(v10, "fc_safelyAddObject:", *(void *)(a1 + 48));
    if (v5) {
      uint64_t v11 = (void *)v5[3];
    }
    else {
      uint64_t v11 = 0;
    }
    if (![v11 count])
    {
      id v12 = (void *)FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v13 = v5[2];
        }
        else {
          uint64_t v13 = 0;
        }
        *(_DWORD *)objc_super buf = 138543362;
        uint64_t v22 = v13;
        uint64_t v14 = v12;
        _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "AV asset key manager finished key requests for session: %{public}@", buf, 0xCu);
      }
      if (v5)
      {
        id v15 = (void *)v5[5];
        if (v15)
        {
          id v16 = v15;
          id v17 = (id)v5[4];
          id v18 = [v17 lastObject];
          v16[2](v16, v18);
        }
      }
      [v3 removeObjectIdenticalTo:v5];
    }
  }
}

BOOL __66__FCAVAssetKeyManager__completeKeyRequest_withData_error_session___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 == *(void *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequests, 0);
  objc_storeStrong((id *)&self->_sharedContentKeySession, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end