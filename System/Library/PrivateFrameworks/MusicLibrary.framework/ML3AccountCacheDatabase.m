@interface ML3AccountCacheDatabase
- (BOOL)getPropertiesForDSID:(unint64_t)a3 appleID:(id *)a4 altDSID:(id *)a5;
- (BOOL)setAppleID:(id)a3 altDSID:(id)a4 forDSID:(unint64_t)a5;
- (BOOL)setAppleID:(id)a3 forDSID:(unint64_t)a4;
- (ML3AccountCacheDatabase)initWithLibrary:(id)a3;
- (id)_cacheEntryForDSID:(unint64_t)a3;
- (id)appleIDForDSID:(unint64_t)a3;
- (void)_setCacheEntry:(id)a3 forDSID:(unint64_t)a4;
@end

@implementation ML3AccountCacheDatabase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->accessQueue, 0);

  objc_storeStrong((id *)&self->_propertiesCache, 0);
}

- (void)_setCacheEntry:(id)a3 forDSID:(unint64_t)a4
{
  id v6 = a3;
  accessQueue = self->accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ML3AccountCacheDatabase__setCacheEntry_forDSID___block_invoke;
  block[3] = &unk_1E5FB7BB0;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(accessQueue, block);
}

void __50__ML3AccountCacheDatabase__setCacheEntry_forDSID___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  id v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

- (id)_cacheEntryForDSID:(unint64_t)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__24243;
  v45 = __Block_byref_object_dispose__24244;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__24243;
  v39 = __Block_byref_object_dispose__24244;
  id v40 = 0;
  accessQueue = self->accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke;
  block[3] = &unk_1E5FB7B10;
  block[4] = self;
  void block[5] = &v41;
  block[6] = a3;
  dispatch_sync(accessQueue, block);
  id v6 = (void *)v42[5];
  if (!v6)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__24243;
    v32 = __Block_byref_object_dispose__24244;
    id v33 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__24243;
    v26 = __Block_byref_object_dispose__24244;
    id v27 = 0;
    library = self->_library;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_2;
    v21[3] = &unk_1E5FB7B60;
    v21[7] = &v22;
    v21[8] = a3;
    v21[4] = self;
    v21[5] = &v35;
    v21[6] = &v28;
    [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v21];
    if (!v36[5])
    {
      if ([(id)v29[5] length] && !objc_msgSend((id)v23[5], "length"))
      {
        id v8 = +[ML3AccountStore defaultStore];
        id v20 = 0;
        uint64_t v9 = [v8 altDSIDForAccountWithDSID:a3 options:1 error:&v20];
        id v10 = v20;
        unint64_t v11 = (void *)v23[5];
        v23[5] = v9;

        if (v10)
        {
          v12 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v48 = self;
            __int16 v49 = 2048;
            unint64_t v50 = a3;
            __int16 v51 = 2114;
            id v52 = v10;
            _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to resolve altDSID for DSID %lld. err=%{public}@", buf, 0x20u);
          }
        }
        v13 = self->_library;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_43;
        v19[3] = &unk_1E5FB7B88;
        v19[5] = &v22;
        v19[6] = a3;
        v19[4] = self;
        [(ML3MusicLibrary *)v13 databaseConnectionAllowingWrites:1 withBlock:v19];
      }
      v14 = [ML3AccountCacheEntry alloc];
      uint64_t v15 = [(ML3AccountCacheEntry *)v14 initWithAppleID:v29[5] altDSID:v23[5]];
      v16 = (void *)v42[5];
      v42[5] = v15;

      [(ML3AccountCacheDatabase *)self _setCacheEntry:v42[5] forDSID:a3];
    }
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
    id v6 = (void *)v42[5];
  }
  id v17 = v6;
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);

  return v17;
}

void __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 8);
  id v6 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_2(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 64);
  id v5 = a2;
  id v6 = [v3 numberWithUnsignedLongLong:v4];
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v8 = [v5 executeQuery:@"SELECT apple_id,alt_dsid FROM account where dsid=?" withParameters:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_3;
  v10[3] = &unk_1E5FB7B38;
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v12 = v9;
  [v8 enumerateRowsWithBlock:v10];
}

void __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_43(void *a1, void *a2)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[6];
  uint64_t v4 = *(__CFString **)(*(void *)(a1[5] + 8) + 40);
  if (!v4) {
    uint64_t v4 = &stru_1F08D4D70;
  }
  v24[0] = v4;
  id v5 = NSNumber;
  id v6 = a2;
  v7 = [v5 numberWithUnsignedLongLong:v3];
  v24[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v15 = 0;
  char v9 = [v6 executeUpdate:@"UPDATE account SET alt_dsid=? where dsid=?" withParameters:v8 error:&v15];

  id v10 = v15;
  if ((v9 & 1) == 0)
  {
    long long v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[6];
      uint64_t v13 = a1[4];
      uint64_t v14 = *(void *)(*(void *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138544130;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update the account database with DSID %lld, resolvedAltDSID %@. err=%{public}@", buf, 0x2Au);
    }
  }
}

void __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_3(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    char v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      int v17 = 138543618;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to query the account table. err=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    uint64_t v11 = [v7 stringForColumnIndex:0];
    uint64_t v12 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = [v7 stringForColumnIndex:1];
    uint64_t v15 = *(void *)(a1[7] + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (BOOL)getPropertiesForDSID:(unint64_t)a3 appleID:(id *)a4 altDSID:(id *)a5
{
  id v7 = [(ML3AccountCacheDatabase *)self _cacheEntryForDSID:a3];
  id v8 = v7;
  if (v7)
  {
    if (a4)
    {
      *a4 = [v7 appleID];
    }
    if (a5)
    {
      *a5 = [v8 altDSID];
    }
  }

  return v8 != 0;
}

- (id)appleIDForDSID:(unint64_t)a3
{
  id v5 = 0;
  [(ML3AccountCacheDatabase *)self getPropertiesForDSID:a3 appleID:&v5 altDSID:0];
  id v3 = v5;

  return v3;
}

- (BOOL)setAppleID:(id)a3 altDSID:(id)a4 forDSID:(unint64_t)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"ML3AccountCacheDatabase.m" lineNumber:65 description:@"appleID cannot be nil"];
  }
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__24243;
  __int16 v49 = __Block_byref_object_dispose__24244;
  id v50 = 0;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__24243;
  uint64_t v43 = __Block_byref_object_dispose__24244;
  id v11 = v10;
  id v44 = v11;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__24243;
  uint64_t v37 = __Block_byref_object_dispose__24244;
  id v38 = [(ML3AccountCacheDatabase *)self _cacheEntryForDSID:a5];
  uint64_t v12 = (void *)v34[5];
  if (!v12
    || ([v12 appleID], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0)
    || ([(id)v34[5] appleID],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 isEqualToString:v9],
        v14,
        v13,
        (v15 & 1) == 0))
  {
    if (!v40[5])
    {
      v16 = +[ML3AccountStore defaultStore];
      id v32 = 0;
      uint64_t v17 = [v16 altDSIDForAccountWithDSID:a5 options:1 error:&v32];
      id v18 = v32;
      __int16 v19 = (void *)v40[5];
      v40[5] = v17;

      if (v18)
      {
        id v20 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v52 = self;
          __int16 v53 = 2048;
          unint64_t v54 = a5;
          __int16 v55 = 2114;
          id v56 = v18;
          _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to resolve altDSID for DSID %lld. err=%{public}@", buf, 0x20u);
        }
      }
    }
    library = self->_library;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__ML3AccountCacheDatabase_setAppleID_altDSID_forDSID___block_invoke;
    v25[3] = &unk_1E5FB7AE8;
    unint64_t v31 = a5;
    id v26 = v9;
    id v27 = self;
    uint64_t v28 = &v39;
    v29 = &v45;
    uint64_t v30 = &v33;
    [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:1 withBlock:v25];
  }
  BOOL v22 = v46[5] == 0;
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v22;
}

void __54__ML3AccountCacheDatabase_setAppleID_altDSID_forDSID___block_invoke(uint64_t a1, void *a2)
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 72);
  id v5 = a2;
  id v6 = [v3 numberWithUnsignedLongLong:v4];
  uint64_t v7 = *(void *)(a1 + 32);
  v26[0] = v6;
  v26[1] = v7;
  id v8 = *(__CFString **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v8) {
    id v8 = &stru_1F08D4D70;
  }
  v26[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  id v19 = 0;
  char v10 = [v5 executeUpdate:@"REPLACE INTO account (dsid, apple_id, alt_dsid) VALUES (?, ?, ?)", v9, &v19 withParameters error];

  id v11 = v19;
  id v12 = v19;

  if (v10)
  {
    uint64_t v13 = [[ML3AccountCacheEntry alloc] initWithAppleID:*(void *)(a1 + 32) altDSID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    char v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    [*(id *)(a1 + 40) _setCacheEntry:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forDSID:*(void *)(a1 + 72)];
  }
  else
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v17;
      __int16 v22 = 2048;
      uint64_t v23 = v18;
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update the account database with DSID %lld. err=%{public}@", buf, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v11);
  }
}

- (BOOL)setAppleID:(id)a3 forDSID:(unint64_t)a4
{
  return [(ML3AccountCacheDatabase *)self setAppleID:a3 altDSID:0 forDSID:a4];
}

- (ML3AccountCacheDatabase)initWithLibrary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3AccountCacheDatabase;
  id v6 = [(ML3AccountCacheDatabase *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    propertiesCache = v6->_propertiesCache;
    v6->_propertiesCache = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_library, a3);
    id v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.medialibrary.ML3AccountCacheDatabase.operationQueue.accessQueue", v9);
    accessQueue = v6->accessQueue;
    v6->accessQueue = (OS_dispatch_queue *)v10;
  }
  return v6;
}

@end