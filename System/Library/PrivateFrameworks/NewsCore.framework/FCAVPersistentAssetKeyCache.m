@interface FCAVPersistentAssetKeyCache
- (NSData)keyServerCertificate;
- (id)assetKeyForURI:(id)a3;
- (id)interestTokenForKeyURIs:(id)a3;
- (uint64_t)_prepareForUse;
- (void)clearKeyServerCertificate;
- (void)importAVAssetKey:(id)a3;
- (void)initWithCacheDirectory:(void *)a1;
- (void)removeAllAssetKeys;
- (void)saveAssetKeyData:(id)a3 creationDate:(id)a4 expirationDate:(id)a5 forURI:(id)a6;
- (void)saveKeyServerCertificate:(id)a3;
@end

@implementation FCAVPersistentAssetKeyCache

- (void)initWithCacheDirectory:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCAVPersistentAssetKeyCache;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F81C18]);
      v5 = (void *)a1[2];
      a1[2] = v4;

      uint64_t v6 = [v3 copy];
      v7 = (void *)a1[1];
      a1[1] = v6;
    }
  }

  return a1;
}

- (id)interestTokenForKeyURIs:(id)a3
{
  return +[FCInterestToken interestTokenWithRemoveInterestBlock:&__block_literal_global_6];
}

- (id)assetKeyForURI:(id)a3
{
  id v4 = a3;
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  if (self) {
    keyStore = self->_keyStore;
  }
  else {
    keyStore = 0;
  }
  uint64_t v6 = keyStore;
  v7 = [v4 absoluteString];

  v8 = [(FCKeyValueStore *)v6 objectForKey:v7];

  return v8;
}

- (uint64_t)_prepareForUse
{
  if (result)
  {
    v1 = *(void **)(result + 16);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __45__FCAVPersistentAssetKeyCache__prepareForUse__block_invoke;
    v2[3] = &unk_1E5B4C018;
    v2[4] = result;
    return [v1 performWithLockSync:v2];
  }
  return result;
}

- (void)saveAssetKeyData:(id)a3 creationDate:(id)a4 expirationDate:(id)a5 forURI:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  id v20 = objc_alloc_init(MEMORY[0x1E4F82990]);
  v14 = [v10 absoluteString];
  [v20 setIdentifier:v14];

  [v20 setKeyData:v13];
  v15 = [v12 pbDate];

  [v20 setCreatedAt:v15];
  v16 = [v11 pbDate];

  [v20 setExpiresAt:v16];
  if (self) {
    keyStore = self->_keyStore;
  }
  else {
    keyStore = 0;
  }
  v18 = keyStore;
  v19 = [v10 absoluteString];

  [(FCKeyValueStore *)v18 setObject:v20 forKey:v19];
}

- (void)removeAllAssetKeys
{
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  if (self) {
    keyStore = self->_keyStore;
  }
  else {
    keyStore = 0;
  }
  [(FCKeyValueStore *)keyStore removeAllObjects];
}

- (NSData)keyServerCertificate
{
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  id v3 = (void *)MEMORY[0x1E4F1C9B8];
  if (self) {
    certificateFileURL = self->_certificateFileURL;
  }
  else {
    certificateFileURL = 0;
  }
  return (NSData *)[v3 dataWithContentsOfURL:certificateFileURL];
}

- (void)saveKeyServerCertificate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  if (self) {
    certificateFileURL = self->_certificateFileURL;
  }
  else {
    certificateFileURL = 0;
  }
  id v10 = 0;
  uint64_t v6 = certificateFileURL;
  char v7 = [v4 writeToURL:v6 options:0 error:&v10];

  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    objc_super v9 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "AV asset key cache failed to save certificate with error: %{public}@", buf, 0xCu);
    }
  }
}

- (void)clearKeyServerCertificate
{
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (self) {
    certificateFileURL = self->_certificateFileURL;
  }
  else {
    certificateFileURL = 0;
  }
  id v5 = v3;
  [v3 removeItemAtURL:certificateFileURL error:0];
}

- (void)importAVAssetKey:(id)a3
{
  id v14 = a3;
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  if (self) {
    keyStore = self->_keyStore;
  }
  else {
    keyStore = 0;
  }
  id v5 = keyStore;
  uint64_t v6 = [v14 identifier];
  char v7 = [(FCKeyValueStore *)v5 objectForKey:v6];

  if (!v7
    || ([v7 expirationDate],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v14 expirationDate],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = objc_msgSend(v8, "fc_isEarlierThan:", v9),
        v9,
        v8,
        v10))
  {
    if (self) {
      id v11 = self->_keyStore;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
    uint64_t v13 = [v14 identifier];
    [(FCKeyValueStore *)v12 setObject:v14 forKey:v13];
  }
}

void __45__FCAVPersistentAssetKeyCache__prepareForUse__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 24))
  {
    v2 = (void *)MEMORY[0x1E4F1CB10];
    id v3 = *(id *)(v1 + 8);
    id v4 = [v2 fileURLWithPath:v3 isDirectory:1];
    uint64_t v5 = [v4 URLByAppendingPathComponent:@"cert"];
    uint64_t v6 = *(void **)(v1 + 32);
    *(void *)(v1 + 32) = v5;

    char v7 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    [(FCKeyValueStoreClassRegistry *)v7 registerClass:objc_opt_class()];
    id v8 = [FCKeyValueStore alloc];
    id v9 = *(id *)(v1 + 8);
    uint64_t v10 = [(FCKeyValueStore *)v8 initWithName:@"lru" directory:v9 version:1 options:8 classRegistry:v7];
    id v11 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = v10;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = objc_msgSend(*(id *)(v1 + 24), "allKeys", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          objc_opt_class();
          v18 = [*(id *)(v1 + 24) objectForKey:v17];
          if (v18)
          {
            if (objc_opt_isKindOfClass()) {
              v19 = v18;
            }
            else {
              v19 = 0;
            }
          }
          else
          {
            v19 = 0;
          }
          id v20 = v19;

          if (v20 && [v20 isExpired]) {
            [*(id *)(v1 + 24) removeObjectForKey:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v14);
    }

    v21 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(void **)(v1 + 24);
      v23 = v21;
      v24 = [v22 allKeys];
      *(_DWORD *)buf = 138543362;
      v30 = v24;
      _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEFAULT, "AV asset key cache loaded with cached keys: %{public}@", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateFileURL, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_initializationLock, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
}

@end