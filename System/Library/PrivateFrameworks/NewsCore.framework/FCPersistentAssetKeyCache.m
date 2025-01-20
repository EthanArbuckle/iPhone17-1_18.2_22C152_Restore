@interface FCPersistentAssetKeyCache
+ (id)_persistenceCoder;
- (id)interestTokenForWrappingKeyIDs:(id)a3;
- (id)wrappingKeyForWrappingKeyID:(id)a3;
- (void)_loadFromDisk;
- (void)_saveToDisk;
- (void)activityObservingApplicationDidEnterBackground;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3;
- (void)initWithCacheDirectory:(void *)a3 cacheName:;
- (void)removeAllWrappingKeys;
- (void)setWrappingKey:(id)a3 forWrappingKeyID:(id)a4;
@end

@implementation FCPersistentAssetKeyCache

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  if (self) {
    self->_flushingEnabled = 1;
  }
}

- (void)initWithCacheDirectory:(void *)a3 cacheName:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)FCPersistentAssetKeyCache;
    a1 = objc_msgSendSuper2(&v16, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 stringByAppendingPathComponent:v6];
      v8 = (void *)a1[2];
      a1[2] = v7;

      id v9 = objc_alloc_init(MEMORY[0x1E4F81C18]);
      v10 = (void *)a1[4];
      a1[4] = v9;

      id v11 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
      v12 = (void *)a1[5];
      a1[5] = v11;

      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
      v14 = (void *)a1[6];
      a1[6] = v13;
    }
  }

  return a1;
}

- (void)_saveToDisk
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__63;
  uint64_t v13 = __Block_byref_object_dispose__63;
  id v14 = 0;
  id v2 = *(id *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke;
  v8[3] = &unk_1E5B4F3B0;
  v8[4] = a1;
  v8[5] = &v9;
  [v2 performWithLockSync:v8];

  v3 = +[FCPersistentAssetKeyCache _persistenceCoder]();
  v4 = -[FCPersistenceCoder encodeData:](v3, (void *)v10[5]);

  id v5 = *(id *)(a1 + 16);
  int v6 = [v4 writeToFile:v5 atomically:1];

  if (v6)
  {
    id v7 = *(id *)(a1 + 16);
    setxattr((const char *)[v7 fileSystemRepresentation], "com.apple.newscore.storeVersion", &FCPersistentAssetKeyCacheVersion, 2uLL, 0, 0);
  }
  _Block_object_dispose(&v9, 8);
}

- (id)wrappingKeyForWrappingKeyID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  objc_super v16 = __Block_byref_object_copy__63;
  v17 = __Block_byref_object_dispose__63;
  id v18 = 0;
  if (self) {
    cacheEntriesLock = self->_cacheEntriesLock;
  }
  else {
    cacheEntriesLock = 0;
  }
  int v6 = cacheEntriesLock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__FCPersistentAssetKeyCache_wrappingKeyForWrappingKeyID___block_invoke;
  v10[3] = &unk_1E5B4C4D0;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  v12 = &v13;
  [(NFUnfairLock *)v6 performWithLockSync:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __57__FCPersistentAssetKeyCache_wrappingKeyForWrappingKeyID___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!v2) {
    goto LABEL_8;
  }
  v3 = *(void **)(v2 + 24);
  if (v3) {
    goto LABEL_5;
  }
  -[FCPersistentAssetKeyCache _loadFromDisk](v2);
  uint64_t v4 = a1[4];
  if (v4) {
    v3 = *(void **)(v4 + 24);
  }
  else {
LABEL_8:
  }
    v3 = 0;
LABEL_5:
  id v9 = [v3 objectForKey:a1[5]];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v9, "setLastAccessed:", objc_msgSend(v5, "fc_millisecondTimeIntervalSince1970"));

  uint64_t v6 = [v9 value];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)interestTokenForWrappingKeyIDs:(id)a3
{
  id v4 = a3;
  if (self) {
    interestLock = self->_interestLock;
  }
  else {
    interestLock = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke;
  v12[3] = &unk_1E5B4BE70;
  v12[4] = self;
  id v6 = v4;
  id v13 = v6;
  [(NFUnfairLock *)interestLock performWithLockSync:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke_2;
  v10[3] = &unk_1E5B4BE70;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = +[FCInterestToken interestTokenWithRemoveInterestBlock:v10];

  return v8;
}

uint64_t __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[5];
  }
  return [v1 addObjectsFromArray:*(void *)(a1 + 40)];
}

void __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 48);
  }
  else {
    uint64_t v2 = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke_3;
  v3[3] = &unk_1E5B4BE70;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 performWithLockSync:v3];
}

uint64_t __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[5];
  }
  return objc_msgSend(v1, "fc_removeObjectsFromArray:", *(void *)(a1 + 40));
}

- (void)setWrappingKey:(id)a3 forWrappingKeyID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    cacheEntriesLock = self->_cacheEntriesLock;
  }
  else {
    cacheEntriesLock = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__FCPersistentAssetKeyCache_setWrappingKey_forWrappingKeyID___block_invoke;
  v14[3] = &unk_1E5B4C738;
  v14[4] = self;
  id v9 = v7;
  id v15 = v9;
  id v10 = v6;
  id v16 = v10;
  [(NFUnfairLock *)cacheEntriesLock performWithLockSync:v14];
  if (self) {
    self->_needsSave = 1;
  }
  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  v12 = FCPersistenceQueue();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__FCPersistentAssetKeyCache_setWrappingKey_forWrappingKeyID___block_invoke_2;
  v13[3] = &unk_1E5B4C018;
  v13[4] = self;
  dispatch_after(v11, v12, v13);
}

void __61__FCPersistentAssetKeyCache_setWrappingKey_forWrappingKeyID___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!v2) {
    goto LABEL_12;
  }
  v3 = *(void **)(v2 + 24);
  if (v3) {
    goto LABEL_5;
  }
  -[FCPersistentAssetKeyCache _loadFromDisk](v2);
  uint64_t v4 = a1[4];
  if (v4) {
    v3 = *(void **)(v4 + 24);
  }
  else {
LABEL_12:
  }
    v3 = 0;
LABEL_5:
  id v8 = [v3 objectForKey:a1[5]];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F82AA0]);
    [v8 setKey:a1[5]];
  }
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v8, "setLastAccessed:", objc_msgSend(v5, "fc_millisecondTimeIntervalSince1970"));

  [v8 setValue:a1[6]];
  uint64_t v6 = a1[4];
  if (v6) {
    id v7 = *(void **)(v6 + 24);
  }
  else {
    id v7 = 0;
  }
  [v7 setObject:v8 forKey:a1[5]];
}

void __61__FCPersistentAssetKeyCache_setWrappingKey_forWrappingKeyID___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(unsigned char *)(v1 + 9))
    {
      -[FCPersistentAssetKeyCache _saveToDisk](*(void *)(a1 + 32));
      *(unsigned char *)(v1 + 9) = 0;
    }
  }
}

- (void)removeAllWrappingKeys
{
  uint64_t v2 = self;
  if (self) {
    self = (FCPersistentAssetKeyCache *)self->_cacheEntriesLock;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__FCPersistentAssetKeyCache_removeAllWrappingKeys__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = v2;
  [(FCPersistentAssetKeyCache *)self performWithLockSync:v3];
  if (v2) {
    v2->_needsSave = 1;
  }
}

uint64_t __50__FCPersistentAssetKeyCache_removeAllWrappingKeys__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    goto LABEL_8;
  }
  v3 = *(void **)(v1 + 24);
  if (v3) {
    goto LABEL_5;
  }
  -[FCPersistentAssetKeyCache _loadFromDisk](v1);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v3 = *(void **)(v4 + 24);
  }
  else {
LABEL_8:
  }
    v3 = 0;
LABEL_5:
  return [v3 removeAllObjects];
}

- (void)activityObservingApplicationDidEnterBackground
{
  v3 = FCPersistenceQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__FCPersistentAssetKeyCache_activityObservingApplicationDidEnterBackground__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __75__FCPersistentAssetKeyCache_activityObservingApplicationDidEnterBackground__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(unsigned char *)(v1 + 9))
    {
      -[FCPersistentAssetKeyCache _saveToDisk](*(void *)(a1 + 32));
      *(unsigned char *)(v1 + 9) = 0;
    }
  }
}

- (void)_loadFromDisk
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v3 = [v2 fileExistsAtPath:*(void *)(a1 + 16)];

  if (v3)
  {
    LOWORD(value) = 0;
    getxattr((const char *)[*(id *)(a1 + 16) fileSystemRepresentation], "com.apple.newscore.storeVersion", &value, 2uLL, 0, 0);
    if ((unsigned __int16)value != 1)
    {
      uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v4 removeItemAtPath:*(void *)(a1 + 16) error:0];
    }
  }
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:*(void *)(a1 + 16)];
  uint64_t v6 = +[FCPersistentAssetKeyCache _persistenceCoder]();
  v26 = v5;
  uint64_t v7 = -[FCPersistenceCoder encodeData:](v6, v5);

  v25 = (void *)v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F82A98]) initWithData:v7];
  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v10 = [v8 entries];
  uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
  v12 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v11;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v24 = v8;
  id v13 = [v8 entries];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = MEMORY[0x1E4F14500];
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v20 = [v19 key];

        if (!v20 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)[[NSString alloc] initWithFormat:@"WARNING: the persisted asset key cache should never contain an entry without a key"];
          int value = 136315906;
          v32 = "-[FCPersistentAssetKeyCache _loadFromDisk]";
          __int16 v33 = 2080;
          v34 = "FCAssetKeyCache.m";
          __int16 v35 = 1024;
          int v36 = 193;
          __int16 v37 = 2114;
          v38 = v23;
          _os_log_error_impl(&dword_1A460D000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&value, 0x26u);
        }
        id v21 = *(id *)(a1 + 24);
        v22 = [v19 key];
        objc_msgSend(v21, "fc_safelySetObject:forKey:", v19, v22);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v15);
  }
}

+ (id)_persistenceCoder
{
  self;
  if (qword_1EB5D19A0 != -1) {
    dispatch_once(&qword_1EB5D19A0, &__block_literal_global_19_1);
  }
  v0 = (void *)_MergedGlobals_201;
  return v0;
}

void __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(unsigned char *)(v2 + 8) & 1) != 0)
  {
    int v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
    uint64_t v4 = objc_msgSend(v3, "fc_millisecondTimeIntervalSince1970");
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 48);
    }
    else {
      uint64_t v6 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke_2;
    v14[3] = &unk_1E5B51AE8;
    v14[4] = v5;
    void v14[5] = v4;
    [v6 performWithLockSync:v14];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F82A98]);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(void **)(v8 + 24);
  }
  else {
    id v9 = 0;
  }
  id v10 = [v9 allValues];
  [v7 setEntries:v10];

  uint64_t v11 = [v7 data];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

uint64_t __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 24);
  }
  else {
    uint64_t v2 = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke_3;
  v5[3] = &unk_1E5B59758;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = v1;
  v5[5] = v3;
  return objc_msgSend(v2, "fc_removeObjectsForKeysPassingTest:", v5);
}

BOOL __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(void **)(v6 + 40);
  }
  else {
    id v7 = 0;
  }
  BOOL v8 = ([v7 containsObject:a2] & 1) == 0
    && (unint64_t)[v5 lastAccessed] < *(void *)(a1 + 40);

  return v8;
}

void __46__FCPersistentAssetKeyCache__persistenceCoder__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v6 = xmmword_1A49748C0;
  long long v7 = xmmword_1A49748B0;
  v5[0] = 0;
  v5[1] = 0;
  v0 = FCDeviceUUIDForVendor();
  [v0 getUUIDBytes:v5];

  uint64_t v1 = [MEMORY[0x1E4F1CA58] dataWithLength:64];
  ccsha512_di();
  [v1 length];
  id v2 = v1;
  [v2 mutableBytes];
  cchkdf();
  uint64_t v3 = -[FCPersistenceCoder initWithKey:]([FCPersistenceCoder alloc], v2);
  uint64_t v4 = (void *)_MergedGlobals_201;
  _MergedGlobals_201 = (uint64_t)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestLock, 0);
  objc_storeStrong((id *)&self->_interestedKeys, 0);
  objc_storeStrong((id *)&self->_cacheEntriesLock, 0);
  objc_storeStrong((id *)&self->_cacheEntries, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
}

@end