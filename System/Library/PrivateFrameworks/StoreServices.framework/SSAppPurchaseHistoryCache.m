@interface SSAppPurchaseHistoryCache
- (BOOL)setImageData:(id)a3 forAdamID:(id)a4 imageToken:(id)a5;
- (SSAppPurchaseHistoryCache)init;
- (SSAppPurchaseHistoryCache)initWithAccount:(id)a3;
- (id)allUncachedImages;
- (id)allUncachedImages:(id)a3;
- (id)imageDataForAdamID:(id)a3;
- (unint64_t)purge:(unint64_t)a3;
- (unint64_t)purgeableSpace;
- (void)clearCacheForAdamID:(id)a3;
@end

@implementation SSAppPurchaseHistoryCache

- (SSAppPurchaseHistoryCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)SSAppPurchaseHistoryCache;
  v2 = [(SSAppPurchaseHistoryCache *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1A6267F60]();
    v4 = +[SSAppPurchaseHistoryDatabase newDefaultInstance];
    purchaseHistoryDatabase = v2->_purchaseHistoryDatabase;
    v2->_purchaseHistoryDatabase = v4;

    v6 = +[SSAppIconDatabaseCache newDefaultDatabaseCache];
    databaseCache = v2->_databaseCache;
    v2->_databaseCache = v6;

    if (!v2->_purchaseHistoryDatabase || !v2->_databaseCache)
    {

      return 0;
    }
  }
  return v2;
}

- (SSAppPurchaseHistoryCache)initWithAccount:(id)a3
{
  id v5 = a3;
  v6 = [(SSAppPurchaseHistoryCache *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)allUncachedImages:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (self->_account)
  {
    purchaseHistoryDatabase = self->_purchaseHistoryDatabase;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__SSAppPurchaseHistoryCache_allUncachedImages___block_invoke;
    v8[3] = &unk_1E5BAE378;
    v8[4] = self;
    id v9 = v4;
    id v10 = v5;
    [(SSAppPurchaseHistoryDatabase *)purchaseHistoryDatabase readUsingTransactionBlock:v8];
  }
  return v5;
}

uint64_t __47__SSAppPurchaseHistoryCache_allUncachedImages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  v33 = (void *)MEMORY[0x1A6267F60]();
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v30 = (uint64_t)v3;
  id v4 = +[SSAppPurchaseHistoryEntry databaseTable];
  id v5 = +[SSAppImageDatabaseCacheEntry databaseTable];
  v32 = NSString;
  v6 = SSDatabaseCacheEntryLookupKey[0];
  v7 = SSDatabaseCacheEntryDataBlobSize;
  v8 = SSDatabaseCacheEntryDateExpired;
  id v9 = [*(id *)(*(void *)(a1 + 32) + 8) uniqueIdentifier];
  objc_msgSend(v32, "stringWithFormat:", @"SELECT %@.%@,%@.%@,%@.%@,%@.%@,%@.%@,%@.%@,%@.%@ FROM %@ LEFT OUTER JOIN %@ ON %@.%@ = %@.%@ WHERE (%@.%@ IS NULL OR %@.%@ <= %lld) AND (%@ = %@)", v4, @"store_id", v4, @"bundle_id", v4, @"icon_url", v4, @"icon_token", v4, @"oval_icon_url", v4, @"oval_icon_token", v4, @"pid", v4, v5,
    v4,
    @"store_id",
    v5,
    v6,
    v5,
    v7,
    v5,
    v8,
    v30,
    @"account_unique_identifier",
  id v10 = v9);

  if ([*(id *)(a1 + 40) count])
  {
    v11 = (void *)MEMORY[0x1A6267F60]();
    unint64_t v12 = [*(id *)(a1 + 40) count];
    id v13 = [NSString alloc];
    v14 = v13;
    if (v12 < 2)
    {
      v24 = [*(id *)(a1 + 40) lastObject];
      v25 = (void *)[v14 initWithFormat:@" AND %@.%@ = \"%@\" ", v4, @"store_id", v24];

      uint64_t v23 = [v10 stringByAppendingString:v25];
    }
    else
    {
      context = v11;
      v15 = objc_msgSend(v13, "initWithFormat:", CFSTR(" AND (%@.%@ IN (\"XX\"), v4, CFSTR("store_id""));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v31 = a1;
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v39;
        do
        {
          uint64_t v20 = 0;
          v21 = v15;
          do
          {
            if (*(void *)v39 != v19) {
              objc_enumerationMutation(v16);
            }
            v15 = (void *)[[NSString alloc] initWithFormat:@"%@,\"%@\"", v21, *(void *)(*((void *)&v38 + 1) + 8 * v20)];

            ++v20;
            v21 = v15;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v18);
      }

      v22 = [v15 stringByAppendingString:@"]"));
      uint64_t v23 = [v10 stringByAppendingString:v22];

      a1 = v31;
      v11 = context;
    }
    id v10 = (void *)v23;
  }
  v26 = [v34 database];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __47__SSAppPurchaseHistoryCache_allUncachedImages___block_invoke_2;
  v35[3] = &unk_1E5BAE350;
  id v36 = v26;
  id v37 = *(id *)(a1 + 48);
  id v27 = v26;
  [v27 prepareStatementForSQL:v10 cache:0 usingBlock:v35];

  return 1;
}

uint64_t __47__SSAppPurchaseHistoryCache_allUncachedImages___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = [*(id *)(a1 + 32) statementHasRowAfterStepping:a2];
  if (result)
  {
    do
    {
      id v5 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
      v6 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 1);
      v7 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 2);
      v8 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 3);
      id v9 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 4);
      id v10 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 5);
      uint64_t v11 = SSSQLiteCopyFoundationValueForStatementColumn(a2, 6);
      unint64_t v12 = (void *)v11;
      if (v5 && v7 && v8 && v6)
      {
        if (v11)
        {
          id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"store_id", v6, @"bundle_id", v7, @"icon_url", v8, @"icon_token", v9, @"oval_icon_url", v10, @"oval_icon_token", v11, @"pid", 0);
          [*(id *)(a1 + 40) addObject:v13];
        }
      }

      uint64_t result = [*(id *)(a1 + 32) statementHasRowAfterStepping:a2];
    }
    while ((result & 1) != 0);
  }
  return result;
}

- (id)allUncachedImages
{
  return [(SSAppPurchaseHistoryCache *)self allUncachedImages:0];
}

- (void)clearCacheForAdamID:(id)a3
{
  id v6 = a3;
  if ([v6 unsignedLongLongValue])
  {
    databaseCache = self->_databaseCache;
    id v5 = [v6 stringValue];
    [(SSDatabaseCache *)databaseCache clearCacheForLookupKey:v5];
  }
}

- (BOOL)setImageData:(id)a3 forAdamID:(id)a4 imageToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_account)
  {
    uint64_t v11 = (void *)MEMORY[0x1A6267F60]();
    if ([v8 length] && objc_msgSend(v9, "unsignedLongLongValue"))
    {
      unint64_t v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;

      databaseCache = self->_databaseCache;
      id v16 = [v9 stringValue];
      uint64_t v17 = [(SSDatabaseCache *)databaseCache setData:v8 expiring:v16 retiring:v10 lookupKey:v14 userInfo:v14];

      BOOL v18 = v17 != 0;
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)imageDataForAdamID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1A6267F60]();
  if ([v4 unsignedLongLongValue])
  {
    databaseCache = self->_databaseCache;
    v7 = [v4 stringValue];
    id v8 = [(SSDatabaseCache *)databaseCache cacheEntryForLookupKey:v7];

    id v9 = [v8 dataBlob:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)purgeableSpace
{
  double v3 = (void *)MEMORY[0x1A6267F60](self, a2);
  id v4 = [(SSDatabaseCache *)self->_databaseCache statistics];
  id v5 = [v4 objectForKey:@"total"];
  id v6 = [v5 objectForKey:@"bytes"];
  unint64_t v7 = [v6 unsignedLongLongValue];

  return v7;
}

- (unint64_t)purge:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (void *)MEMORY[0x1A6267F60](self, a2);
  id v5 = [(SSDatabaseCache *)self->_databaseCache statistics];
  id v6 = [v5 objectForKey:@"total"];
  unint64_t v7 = [v6 objectForKey:@"bytes"];
  unint64_t v8 = [v7 unsignedLongLongValue];
  [(SSDatabaseCache *)self->_databaseCache clear];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_databaseCache, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end