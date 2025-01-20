@interface FCAssetKeyManager
- (id)cachedWrappingKeyWithID:(id)a3;
- (id)initWithService:(void *)a3 cache:(void *)a4 delegate:;
- (uint64_t)_canRetryAfterNetworkError:(uint64_t)a1;
- (void)clearUnauthorizedAssetKeys;
- (void)eraseAllKeys;
- (void)fetchWrappingKeyWithID:(id)a3 completionHandler:(id)a4;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
@end

@implementation FCAssetKeyManager

- (id)initWithService:(void *)a3 cache:(void *)a4 delegate:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)FCAssetKeyManager;
    v11 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeWeak(a1 + 3, v10);
      v12 = objc_alloc_init(FCThreadSafeMutableSet);
      id v13 = a1[5];
      a1[5] = v12;

      v14 = [[FCOperationThrottler alloc] initWithDelegate:a1];
      id v15 = a1[4];
      a1[4] = v14;

      v16 = objc_alloc_init(FCThreadSafeMutableDictionary);
      id v17 = a1[6];
      a1[6] = v16;
    }
  }

  return a1;
}

- (id)cachedWrappingKeyWithID:(id)a3
{
  if (self) {
    self = (FCAssetKeyManager *)self->_cache;
  }
  return (id)[(FCAssetKeyManager *)self wrappingKeyForWrappingKeyID:a3];
}

- (void)fetchWrappingKeyWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  id v9 = [(FCAssetKeyCacheType *)cache wrappingKeyForWrappingKeyID:v6];
  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else
  {
    if (self) {
      errorsByKey = self->_errorsByKey;
    }
    else {
      errorsByKey = 0;
    }
    v11 = [(FCThreadSafeMutableDictionary *)errorsByKey objectForKey:v6];
    if (v11 && (-[FCAssetKeyManager _canRetryAfterNetworkError:]((uint64_t)self, v11) & 1) == 0)
    {
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v11);
    }
    else
    {
      if (self)
      {
        [(FCThreadSafeMutableSet *)self->_pendingWrappingKeyIDs addObject:v6];
        throttler = self->_throttler;
      }
      else
      {
        [0 addObject:v6];
        throttler = 0;
      }
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __62__FCAssetKeyManager_fetchWrappingKeyWithID_completionHandler___block_invoke;
      v13[3] = &unk_1E5B4E088;
      v13[4] = self;
      id v14 = v6;
      id v15 = v7;
      [(FCOperationThrottler *)throttler tickleWithCompletion:v13];
    }
  }
}

- (uint64_t)_canRetryAfterNetworkError:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = [v3 domain];
    int v6 = [v5 isEqualToString:@"FCErrorDomain"];

    if (v6)
    {
      if ([v4 code] == 27)
      {
        a1 = 0;
        goto LABEL_10;
      }
LABEL_9:
      a1 = 1;
      goto LABEL_10;
    }
    v7 = [v4 domain];
    int v8 = [v7 isEqualToString:@"FCEndpointConnectionErrorDomain"];

    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v9 = [v4 code];
    a1 = 0;
    if (v9 != 429 && v9 != 500 && v9 != 503) {
      goto LABEL_9;
    }
  }
LABEL_10:

  return a1;
}

void __62__FCAssetKeyManager_fetchWrappingKeyWithID_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    id v3 = *(void **)(v2 + 16);
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = [v3 wrappingKeyForWrappingKeyID:a1[5]];
  uint64_t v5 = a1[6];
  id v10 = (id)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    int v6 = (void *)a1[4];
    if (v6) {
      int v6 = (void *)v6[6];
    }
    uint64_t v7 = a1[5];
    int v8 = v6;
    uint64_t v9 = [v8 objectForKey:v7];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v9);
  }
}

- (void)clearUnauthorizedAssetKeys
{
  if (self) {
    self = (FCAssetKeyManager *)self->_errorsByKey;
  }
  [(FCAssetKeyManager *)self readWriteWithAccessor:&__block_literal_global_112];
}

void __47__FCAssetKeyManager_clearUnauthorizedAssetKeys__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(v2, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v2 objectForKey:v8];
        id v10 = [v9 domain];
        if ([v10 isEqualToString:@"FCErrorDomain"])
        {
          uint64_t v11 = [v9 code];

          if (v11 == 27) {
            [v2 removeObjectForKey:v8];
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)eraseAllKeys
{
  if (self)
  {
    [(FCAssetKeyCacheType *)self->_cache removeAllWrappingKeys];
    errorsByKey = self->_errorsByKey;
  }
  else
  {
    [0 removeAllWrappingKeys];
    errorsByKey = 0;
  }
  [(FCThreadSafeMutableDictionary *)errorsByKey removeAllObjects];
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    pendingWrappingKeyIDs = self->_pendingWrappingKeyIDs;
  }
  else {
    pendingWrappingKeyIDs = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v19[3] = &unk_1E5B4CD98;
  v19[4] = self;
  id v8 = v6;
  id v20 = v8;
  [(FCThreadSafeMutableSet *)pendingWrappingKeyIDs readWriteWithAccessor:v19];
  if ([v8 count])
  {
    if (self) {
      service = self->_service;
    }
    else {
      service = 0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_3;
    v11[3] = &unk_1E5B4C9A8;
    v11[4] = self;
    long long v12 = (void (**)(void))v8;
    id v13 = v5;
    [(FCAssetKeyServiceType *)service fetchWrappingKeysWithIDs:v12 completionHandler:v11];

    id v10 = v12;
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2;
    uint64_t v17 = &unk_1E5B4CA88;
    v18 = (void (**)(void))v5;
    v18[2]();
    id v10 = v18;
  }
}

void __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = objc_msgSend(v3, "allObjects", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          uint64_t v11 = *(void **)(v10 + 16);
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v12 = [v11 wrappingKeyForWrappingKeyID:*(void *)(*((void *)&v19 + 1) + 8 * v8)];
        if (v12)
        {
          id v13 = (void *)v12;
          uint64_t v14 = v3;
          uint64_t v15 = v13;
LABEL_10:
          [v14 removeObject:v15];
          goto LABEL_16;
        }
        uint64_t v16 = *(void *)(a1 + 32);
        if (v16) {
          uint64_t v17 = *(void **)(v16 + 48);
        }
        else {
          uint64_t v17 = 0;
        }
        id v13 = [v17 objectForKey:v9];
        if (v13 && (-[FCAssetKeyManager _canRetryAfterNetworkError:](*(void *)(a1 + 32), v13) & 1) == 0)
        {
          uint64_t v14 = v3;
          uint64_t v15 = 0;
          goto LABEL_10;
        }
        [*(id *)(a1 + 40) addObject:v9];
        if ((unint64_t)[*(id *)(a1 + 40) count] >= 0xB)
        {

          goto LABEL_24;
        }
LABEL_16:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v18 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v6 = v18;
    }
    while (v18);
  }
LABEL_24:
}

uint64_t __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 24));
    uint64_t v9 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v9 = 0;
    id WeakRetained = 0;
  }
  int v10 = [WeakRetained shouldAssetKeyManagerSimulateUnauthorizedAssetKeys:v9];

  if (v10)
  {

    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = [*(id *)(a1 + 40) firstObject];
    uint64_t v13 = objc_msgSend(v11, "fc_unauthorizedAssetKeyErrorWithWrappingKeyID:", v12);

    id v5 = 0;
    id v6 = (id)v13;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_4;
  v25[3] = &unk_1E5B56FE0;
  v25[4] = *(void *)(a1 + 32);
  [v5 enumerateKeysAndObjectsUsingBlock:v25];
  if (v6)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      uint64_t v15 = *(void **)(v14 + 48);
    }
    else {
      uint64_t v15 = 0;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_5;
    v22[3] = &unk_1E5B4CDC0;
    id v23 = *(id *)(a1 + 40);
    id v24 = v6;
    [v15 readWriteWithAccessor:v22];
  }
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    uint64_t v17 = *(void **)(v16 + 40);
  }
  else {
    uint64_t v17 = 0;
  }
  [v17 removeObjectsInArray:*(void *)(a1 + 40)];
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    long long v19 = *(void **)(v18 + 40);
  }
  else {
    long long v19 = 0;
  }
  if (([v19 isEmpty] & 1) == 0)
  {
    uint64_t v20 = *(void *)(a1 + 32);
    if (v20) {
      long long v21 = *(void **)(v20 + 32);
    }
    else {
      long long v21 = 0;
    }
    [v21 tickle];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 16);
  }
  else {
    uint64_t v4 = 0;
  }
  return [v4 setWrappingKey:a3 forWrappingKeyID:a2];
}

void __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "setObject:forKey:", *(void *)(a1 + 40), *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByKey, 0);
  objc_storeStrong((id *)&self->_pendingWrappingKeyIDs, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end