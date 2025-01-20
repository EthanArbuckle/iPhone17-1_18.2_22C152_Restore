@interface SSDatabaseCache
- (BOOL)_setupDatabase;
- (SSDatabaseCache)initWithIdentifier:(id)a3 cacheName:(id)a4;
- (SSDatabaseCache)initWithIdentifier:(id)a3 cacheName:(id)a4 database:(id)a5 cacheEntryClass:(Class)a6;
- (id)cacheEntryForLookupKey:(id)a3;
- (id)cacheEntryProperties:(id)a3 forLookupKeys:(id)a4;
- (id)description;
- (id)setData:(id)a3 expiring:(double)a4 retiring:(double)a5 lookupKey:(id)a6 userInfo:(id)a7;
- (id)statistics;
- (int)clearRetiredData;
- (unint64_t)maximumInlineBlobSize;
- (void)clear;
- (void)clearCacheForLookupKey:(id)a3;
- (void)dealloc;
- (void)setMaximumInlineBlobSize:(unint64_t)a3;
@end

@implementation SSDatabaseCache

- (SSDatabaseCache)initWithIdentifier:(id)a3 cacheName:(id)a4 database:(id)a5 cacheEntryClass:(Class)a6
{
  v67[2] = *MEMORY[0x1E4F143B8];
  v10 = [(SSDatabaseCache *)self init];
  if (v10)
  {
    if ([a3 length] && objc_msgSend(a4, "length"))
    {
      v10->_maximumInlineBlobSize = 1024;
      v10->_identifier = (NSString *)[a3 copy];
      v10->_cacheName = (NSString *)[a4 copy];
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Caches", a3, a4, 0);
      v12 = (void *)[NSString pathWithComponents:v11];

      id v13 = objc_alloc(MEMORY[0x1E4F1C978]);
      v14 = (objc_class *)objc_opt_class();
      v15 = objc_msgSend(v13, "initWithObjects:", NSStringFromClass(v14), a3, a4, 0);
      v16 = (void *)[v15 componentsJoinedByString:@"."];

      v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
      v10->_serialQueue = (OS_dispatch_queue *)v17;
      global_queue = dispatch_get_global_queue(0, 0);
      dispatch_set_target_queue(v17, global_queue);
      id v19 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      uint64_t v59 = 0;
      uint64_t v20 = *MEMORY[0x1E4F282E0];
      v66[0] = *MEMORY[0x1E4F28320];
      v66[1] = v20;
      v67[0] = @"mobile";
      v67[1] = @"mobile";
      if (objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v67, v66, 2), &v59))
      {
        v21 = [[SSPersistentCache alloc] initWithIdentifier:a3 cacheName:a4];
        v10->_persistentCache = v21;
        if (v21)
        {
          if (a5)
          {
            v10->_database = (SSSQLiteDatabase *)a5;
          }
          else
          {
            uint64_t v38 = objc_msgSend((id)objc_msgSend(v12, "stringByAppendingPathComponent:", a4), "stringByAppendingPathExtension:", @"db");
            v39 = [SSSQLiteDatabase alloc];
            uint64_t v40 = -[SSSQLiteDatabase initWithDatabaseURL:](v39, "initWithDatabaseURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:v38 isDirectory:0]);
            v10->_database = (SSSQLiteDatabase *)v40;
            if (!v40)
            {
              id v44 = +[SSLogConfig sharedStoreServicesConfig];
              if (!v44) {
                id v44 = +[SSLogConfig sharedConfig];
              }
              int v45 = [v44 shouldLog];
              if ([v44 shouldLogToDisk]) {
                int v46 = v45 | 2;
              }
              else {
                int v46 = v45;
              }
              if (!os_log_type_enabled((os_log_t)[v44 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                v46 &= 2u;
              }
              if (v46)
              {
                uint64_t v47 = objc_opt_class();
                int v60 = 138412546;
                uint64_t v61 = v47;
                __int16 v62 = 2112;
                uint64_t v63 = v38;
                LODWORD(v58) = 22;
                v57 = &v60;
                uint64_t v48 = _os_log_send_and_compose_impl();
                if (v48)
                {
                  v49 = (void *)v48;
                  uint64_t v50 = objc_msgSend(NSString, "stringWithCString:encoding:", v48, 4, &v60, v58);
                  free(v49);
                  SSFileLog(v44, @"%@", v51, v52, v53, v54, v55, v56, v50);
                }
              }
            }
          }
          if (!a6) {
            a6 = (Class)objc_opt_class();
          }
          v10->_cacheEntryClass = a6;
          if ([(SSDatabaseCache *)v10 _setupDatabase]) {
            goto LABEL_30;
          }
          id v22 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v22) {
            id v22 = +[SSLogConfig sharedConfig];
          }
          int v41 = [v22 shouldLog];
          if ([v22 shouldLogToDisk]) {
            int v42 = v41 | 2;
          }
          else {
            int v42 = v41;
          }
          if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            v42 &= 2u;
          }
          if (!v42)
          {
LABEL_29:

            v10 = 0;
LABEL_30:

            return v10;
          }
          uint64_t v43 = objc_opt_class();
          int v60 = 138412290;
          uint64_t v61 = v43;
          LODWORD(v58) = 12;
        }
        else
        {
          id v22 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v22) {
            id v22 = +[SSLogConfig sharedConfig];
          }
          int v26 = [v22 shouldLog];
          if ([v22 shouldLogToDisk]) {
            int v27 = v26 | 2;
          }
          else {
            int v27 = v26;
          }
          if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            v27 &= 2u;
          }
          if (!v27) {
            goto LABEL_29;
          }
          uint64_t v28 = objc_opt_class();
          int v60 = 138412546;
          uint64_t v61 = v28;
          __int16 v62 = 2112;
          uint64_t v63 = (uint64_t)v12;
          LODWORD(v58) = 22;
        }
      }
      else
      {
        id v22 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v22) {
          id v22 = +[SSLogConfig sharedConfig];
        }
        int v23 = [v22 shouldLog];
        if ([v22 shouldLogToDisk]) {
          int v24 = v23 | 2;
        }
        else {
          int v24 = v23;
        }
        if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v24 &= 2u;
        }
        if (!v24) {
          goto LABEL_29;
        }
        uint64_t v25 = objc_opt_class();
        int v60 = 138412802;
        uint64_t v61 = v25;
        __int16 v62 = 2112;
        uint64_t v63 = (uint64_t)v12;
        __int16 v64 = 2112;
        uint64_t v65 = v59;
        LODWORD(v58) = 32;
      }
      v29 = (void *)_os_log_send_and_compose_impl();
      if (v29)
      {
        uint64_t v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v60, v58);
        free(v29);
        SSFileLog(v22, @"%@", v31, v32, v33, v34, v35, v36, v30);
      }
      goto LABEL_29;
    }

    return 0;
  }
  return v10;
}

- (SSDatabaseCache)initWithIdentifier:(id)a3 cacheName:(id)a4
{
  uint64_t v7 = objc_opt_class();
  return [(SSDatabaseCache *)self initWithIdentifier:a3 cacheName:a4 database:0 cacheEntryClass:v7];
}

- (void)dealloc
{
  serialQueue = self->_serialQueue;
  if (serialQueue) {
    dispatch_release(serialQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)SSDatabaseCache;
  [(SSDatabaseCache *)&v4 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ : %p> - [ID: %@] [Name: %@] [Max Inline: %u] [DB: %@]", objc_opt_class(), self, self->_identifier, self->_cacheName, self->_maximumInlineBlobSize, self->_database];
}

- (BOOL)_setupDatabase
{
  uint64_t v3 = [(objc_class *)self->_cacheEntryClass databaseTable];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS %@ (pid INTEGER, lookup_key TEXT,data_blob BLOB, data_size INTEGER, date_inserted INTEGER, date_expired INTEGER, date_retired INTEGER, user_info TEXT, PRIMARY KEY (pid));",
         v3);
  if (![(SSSQLiteDatabase *)self->_database executeSQL:@"PRAGMA legacy_file_format = 0;"]
    || ![(SSSQLiteDatabase *)self->_database executeSQL:v4]
    || ![(SSSQLiteDatabase *)self->_database executeSQL:@"PRAGMA journal_mode=WAL;"]
    || !-[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS %@_lookup_key ON %@ (lookup_key);",
            v3,
            v3))
    || !-[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS %@_date_inserted ON %@ (date_inserted);",
            v3,
            v3))
    || !-[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS %@_date_expired ON %@ (date_expired);",
            v3,
            v3))
    || !-[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS %@_date_retired ON %@ (date_retired);",
            v3,
            v3)))
  {
    return 0;
  }
  database = self->_database;
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS %@_date_user_info ON %@ (user_info);",
         v3,
         v3);
  return [(SSSQLiteDatabase *)database executeSQL:v6];
}

- (id)statistics
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v6 = (uint64_t)v5;
  uint64_t v7 = (void *)MEMORY[0x1A6267F60](v4);
  id v8 = [NSString alloc];
  v9 = SSDatabaseCacheEntryDataBlobSize;
  uint64_t v10 = [(objc_class *)self->_cacheEntryClass databaseTable];
  v11 = objc_msgSend(v8, "initWithFormat:", @"SELECT SUM(%@), COUNT(*) FROM %@ WHERE %@ <= ?;",
                  v9,
                  v10,
                  SSDatabaseCacheEntryDateRetired);
  database = self->_database;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __29__SSDatabaseCache_statistics__block_invoke;
  v26[3] = &unk_1E5BAE1B8;
  v26[5] = v3;
  v26[6] = v6;
  v26[4] = self;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v11 cache:1 usingBlock:v26];

  id v13 = (void *)MEMORY[0x1A6267F60]();
  id v14 = [NSString alloc];
  v15 = SSDatabaseCacheEntryDataBlobSize;
  uint64_t v16 = [(objc_class *)self->_cacheEntryClass databaseTable];
  v17 = objc_msgSend(v14, "initWithFormat:", @"SELECT SUM(%@), COUNT(*) FROM %@ WHERE %@ <= ?;",
                  v15,
                  v16,
                  SSDatabaseCacheEntryDateExpired);
  v18 = self->_database;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __29__SSDatabaseCache_statistics__block_invoke_2;
  v25[3] = &unk_1E5BAE1B8;
  v25[5] = v3;
  v25[6] = v6;
  v25[4] = self;
  [(SSSQLiteDatabase *)v18 prepareStatementForSQL:v17 cache:1 usingBlock:v25];

  id v19 = (void *)MEMORY[0x1A6267F60]();
  id v20 = [NSString alloc];
  v21 = objc_msgSend(v20, "initWithFormat:", @"SELECT SUM(%@), COUNT(*) FROM %@;",
                  SSDatabaseCacheEntryDataBlobSize,
                  [(objc_class *)self->_cacheEntryClass databaseTable]);
  id v22 = self->_database;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __29__SSDatabaseCache_statistics__block_invoke_3;
  v24[3] = &unk_1E5BAE1E0;
  v24[4] = self;
  v24[5] = v3;
  [(SSSQLiteDatabase *)v22 prepareStatementForSQL:v21 cache:1 usingBlock:v24];

  return v3;
}

uint64_t __29__SSDatabaseCache_statistics__block_invoke(void *a1, sqlite3_stmt *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  sqlite3_bind_int64(a2, 1, a1[6]);
  uint64_t result = [*(id *)(a1[4] + 56) statementHasRowAfterStepping:a2];
  if (result)
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1) {
        sqlite3_int64 v5 = sqlite3_column_int64(a2, 0);
      }
      else {
        sqlite3_int64 v5 = 0;
      }
      if (sqlite3_column_type(a2, 1) == 1) {
        sqlite3_int64 v6 = sqlite3_column_int64(a2, 1);
      }
      else {
        sqlite3_int64 v6 = 0;
      }
      uint64_t v7 = (void *)a1[5];
      v9[0] = @"count";
      uint64_t v8 = [NSNumber numberWithLongLong:v6];
      v9[1] = @"bytes";
      v10[0] = v8;
      v10[1] = [NSNumber numberWithLongLong:v5];
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, v9, 2), @"retired");
      uint64_t result = [*(id *)(a1[4] + 56) statementHasRowAfterStepping:a2];
    }
    while ((result & 1) != 0);
  }
  return result;
}

uint64_t __29__SSDatabaseCache_statistics__block_invoke_2(void *a1, sqlite3_stmt *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  sqlite3_bind_int64(a2, 1, a1[6]);
  uint64_t result = [*(id *)(a1[4] + 56) statementHasRowAfterStepping:a2];
  if (result)
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1) {
        sqlite3_int64 v5 = sqlite3_column_int64(a2, 0);
      }
      else {
        sqlite3_int64 v5 = 0;
      }
      if (sqlite3_column_type(a2, 1) == 1) {
        sqlite3_int64 v6 = sqlite3_column_int64(a2, 1);
      }
      else {
        sqlite3_int64 v6 = 0;
      }
      uint64_t v7 = (void *)a1[5];
      v9[0] = @"count";
      uint64_t v8 = [NSNumber numberWithLongLong:v6];
      v9[1] = @"bytes";
      v10[0] = v8;
      v10[1] = [NSNumber numberWithLongLong:v5];
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, v9, 2), @"expired");
      uint64_t result = [*(id *)(a1[4] + 56) statementHasRowAfterStepping:a2];
    }
    while ((result & 1) != 0);
  }
  return result;
}

uint64_t __29__SSDatabaseCache_statistics__block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) statementHasRowAfterStepping:a2];
  if (result)
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1) {
        sqlite3_int64 v5 = sqlite3_column_int64(a2, 0);
      }
      else {
        sqlite3_int64 v5 = 0;
      }
      if (sqlite3_column_type(a2, 1) == 1) {
        sqlite3_int64 v6 = sqlite3_column_int64(a2, 1);
      }
      else {
        sqlite3_int64 v6 = 0;
      }
      uint64_t v7 = *(void **)(a1 + 40);
      v9[0] = @"count";
      uint64_t v8 = [NSNumber numberWithLongLong:v6];
      v9[1] = @"bytes";
      v10[0] = v8;
      v10[1] = [NSNumber numberWithLongLong:v5];
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, v9, 2), @"total");
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) statementHasRowAfterStepping:a2];
    }
    while ((result & 1) != 0);
  }
  return result;
}

- (void)clear
{
  uint64_t v3 = (void *)MEMORY[0x1A6267F60](self, a2);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"DELETE FROM %@", -[objc_class databaseTable](self->_cacheEntryClass, "databaseTable")];
  database = self->_database;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__SSDatabaseCache_clear__block_invoke;
  v6[3] = &unk_1E5BAE208;
  v6[4] = self;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v4 cache:0 usingBlock:v6];
}

uint64_t __24__SSDatabaseCache_clear__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) statementDidFinishAfterStepping:a2];
  if (result)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
    return [v4 clear];
  }
  return result;
}

- (void)clearCacheForLookupKey:(id)a3
{
  if ([a3 length])
  {
    [(SSPersistentCache *)self->_persistentCache removeDataForKey:a3];
    id v5 = [(SSDatabaseCache *)self cacheEntryForLookupKey:a3];
    [v5 deleteFromDatabase];
  }
}

- (int)clearRetiredData
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = (void *)MEMORY[0x1A6267F60]();
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v7 = (uint64_t)v6;
  id v8 = [NSString alloc];
  v9 = SSDatabaseCacheEntryLookupKey[0];
  uint64_t v10 = SSDatabaseCacheEntryDataBlob[0];
  uint64_t v11 = [(objc_class *)self->_cacheEntryClass databaseTable];
  v12 = objc_msgSend(v8, "initWithFormat:", @"SELECT %@, LENGTH(HEX(%@)) FROM %@ WHERE %@ <= ?;",
                  v9,
                  v10,
                  v11,
                  SSDatabaseCacheEntryDateRetired);
  database = self->_database;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __35__SSDatabaseCache_clearRetiredData__block_invoke;
  v38[3] = &unk_1E5BAE230;
  v38[4] = self;
  v38[5] = v3;
  v38[6] = v4;
  v38[7] = v7;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v12 cache:1 usingBlock:v38];

  id v14 = (void *)MEMORY[0x1A6267F60]();
  if ([v4 count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v15 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v4);
          }
          [(SSPersistentCache *)self->_persistentCache removeDataForKey:*(void *)(*((void *)&v34 + 1) + 8 * v18++)];
        }
        while (v16 != v18);
        uint64_t v16 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v16);
    }
  }

  int v19 = [v3 count];
  id v20 = (void *)MEMORY[0x1A6267F60]();
  if ([v3 count])
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v22 = [(objc_class *)self->_cacheEntryClass databaseTable];
    int v23 = objc_msgSend(v21, "initWithFormat:", @"DELETE FROM %@ WHERE %@ IN(?"), v22, SSDatabaseCacheEntryLookupKey[0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v24 = [v3 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      while (1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v3);
        }
        [v23 appendString:@", ?"];
        if (!--v25)
        {
          uint64_t v25 = [v3 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (!v25) {
            break;
          }
        }
      }
    }
    [v23 appendString:@";"]);
    int v27 = self->_database;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __35__SSDatabaseCache_clearRetiredData__block_invoke_2;
    v29[3] = &unk_1E5BAE1E0;
    v29[4] = v3;
    v29[5] = self;
    [(SSSQLiteDatabase *)v27 prepareStatementForSQL:v23 cache:1 usingBlock:v29];
  }
  return v19;
}

uint64_t __35__SSDatabaseCache_clearRetiredData__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 56));
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) statementHasRowAfterStepping:a2];
  if (result)
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 3)
      {
        id v5 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(a2, 0));
        [*(id *)(a1 + 40) addObject:v5];
        if (sqlite3_column_type(a2, 1) == 1 && !sqlite3_column_int64(a2, 1)) {
          [*(id *)(a1 + 48) addObject:v5];
        }
      }
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) statementHasRowAfterStepping:a2];
    }
    while ((result & 1) != 0);
  }
  return result;
}

uint64_t __35__SSDatabaseCache_clearRetiredData__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  sqlite3_bind_int64(a2, 1, 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    int v8 = 2;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        sqlite3_bind_text(a2, v8 + i, (const char *)[*(id *)(*((void *)&v11 + 1) + 8 * i) UTF8String], objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "length"), 0);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      v8 += i;
    }
    while (v6);
  }
  return [*(id *)(*(void *)(a1 + 40) + 56) statementDidFinishAfterStepping:a2];
}

- (id)cacheEntryForLookupKey:(id)a3
{
  id v4 = (id)[objc_alloc(self->_cacheEntryClass) initWithLookupKey:a3 inDatabase:self->_database];
  [v4 setPersistentCache:self->_persistentCache];
  return v4;
}

- (id)setData:(id)a3 expiring:(double)a4 retiring:(double)a5 lookupKey:(id)a6 userInfo:(id)a7
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  long long v13 = (void *)MEMORY[0x1A6267F60](self, a2);
  uint64_t v14 = [a3 length];
  if (v14 && (unint64_t v15 = v14, [a6 length]))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v17 = (uint64_t)v16;
    uint64_t v18 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
    unint64_t v19 = [(SSDatabaseCache *)self maximumInlineBlobSize];
    id v20 = a3;
    unint64_t v61 = v19;
    if (v15 > v19) {
      id v20 = (id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3);
    }
    [v18 setObject:v20 forKey:SSDatabaseCacheEntryDataBlob[0]];
    if (a7)
    {
      id v21 = SSDatabaseCacheEntryUserInfo;
      uint64_t v22 = v18;
      id v23 = a7;
    }
    else
    {
      id v23 = (id)[MEMORY[0x1E4F1CA98] null];
      id v21 = SSDatabaseCacheEntryUserInfo;
      uint64_t v22 = v18;
    }
    [v22 setObject:v23 forKey:v21];
    [v18 setObject:a6 forKey:SSDatabaseCacheEntryLookupKey[0]];
    uint64_t v26 = [NSNumber numberWithInteger:v15];
    [v18 setObject:v26 forKey:SSDatabaseCacheEntryDataBlobSize];
    uint64_t v27 = [NSNumber numberWithLongLong:v17];
    [v18 setObject:v27 forKey:SSDatabaseCacheEntryDateInserted];
    uint64_t v28 = [NSNumber numberWithLongLong:(uint64_t)a4];
    [v18 setObject:v28 forKey:SSDatabaseCacheEntryDateExpired];
    uint64_t v29 = [NSNumber numberWithLongLong:(uint64_t)a5];
    [v18 setObject:v29 forKey:SSDatabaseCacheEntryDateRetired];
    id v30 = [(SSDatabaseCache *)self cacheEntryForLookupKey:a6];
    if (v30)
    {
      uint64_t v24 = v30;
      int v31 = [v30 setValuesWithDictionary:v18];
    }
    else
    {
      uint64_t v24 = (void *)[objc_alloc(self->_cacheEntryClass) initWithPropertyValues:v18 inDatabase:self->_database];
      int v31 = v24 != 0;
    }
    id v32 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v32) {
      id v32 = +[SSLogConfig sharedConfig];
    }
    int v33 = [v32 shouldLog];
    if ([v32 shouldLogToDisk]) {
      int v34 = v33 | 2;
    }
    else {
      int v34 = v33;
    }
    if (os_log_type_enabled((os_log_t)[v32 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v35 = v34;
    }
    else {
      int v35 = v34 & 2;
    }
    if (v35)
    {
      int v62 = 138413058;
      uint64_t v63 = (uint64_t)v24;
      __int16 v64 = 1024;
      *(_DWORD *)uint64_t v65 = v31;
      *(_WORD *)&v65[4] = 1024;
      *(_DWORD *)&v65[6] = v15 > v61;
      __int16 v66 = 2112;
      id v67 = a6;
      LODWORD(v60) = 34;
      uint64_t v59 = &v62;
      uint64_t v36 = _os_log_send_and_compose_impl();
      if (v36)
      {
        long long v37 = (void *)v36;
        uint64_t v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, &v62, v60);
        free(v37);
        SSFileLog(v32, @"%@", v39, v40, v41, v42, v43, v44, v38);
      }
    }
    if (v31)
    {
      persistentCache = self->_persistentCache;
      if (v15 <= v61) {
        [(SSPersistentCache *)persistentCache removeDataForKey:a6];
      }
      else {
        [(SSPersistentCache *)persistentCache setData:a3 forKey:a6];
      }
    }
    else
    {
      id v46 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v46) {
        id v46 = +[SSLogConfig sharedConfig];
      }
      int v47 = objc_msgSend(v46, "shouldLog", v59);
      if ([v46 shouldLogToDisk]) {
        int v48 = v47 | 2;
      }
      else {
        int v48 = v47;
      }
      if (!os_log_type_enabled((os_log_t)[v46 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v48 &= 2u;
      }
      if (v48)
      {
        uint64_t v49 = objc_opt_class();
        int v62 = 138412546;
        uint64_t v63 = v49;
        __int16 v64 = 2112;
        *(void *)uint64_t v65 = a6;
        LODWORD(v60) = 22;
        uint64_t v50 = _os_log_send_and_compose_impl();
        if (v50)
        {
          uint64_t v51 = (void *)v50;
          uint64_t v52 = objc_msgSend(NSString, "stringWithCString:encoding:", v50, 4, &v62, v60);
          free(v51);
          SSFileLog(v46, @"%@", v53, v54, v55, v56, v57, v58, v52);
        }
      }
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  return v24;
}

- (id)cacheEntryProperties:(id)a3 forLookupKeys:(id)a4
{
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  database = self->_database;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__SSDatabaseCache_cacheEntryProperties_forLookupKeys___block_invoke;
  void v10[3] = &unk_1E5BAE258;
  v10[4] = a4;
  v10[5] = self;
  v10[6] = a3;
  v10[7] = v7;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v10];
  return v7;
}

uint64_t __54__SSDatabaseCache_cacheEntryProperties_forLookupKeys___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1A6267F60]();
  id v3 = +[SSSQLiteCompoundPredicate predicateWithProperty:SSDatabaseCacheEntryLookupKey[0] values:*(void *)(a1 + 32) comparisonType:1];
  id v4 = objc_alloc_init(SSSQLiteQueryDescriptor);
  [(SSSQLiteQueryDescriptor *)v4 setEntityClass:*(void *)(*(void *)(a1 + 40) + 64)];
  [(SSSQLiteQueryDescriptor *)v4 setPredicate:v3];
  -[SSSQLiteQueryDescriptor setOrderingProperties:](v4, "setOrderingProperties:", [MEMORY[0x1E4F1C978] arrayWithObject:SSDatabaseCacheEntryDateInserted]);
  -[SSSQLiteQueryDescriptor setOrderingDirections:](v4, "setOrderingDirections:", [MEMORY[0x1E4F1C978] arrayWithObject:@"DESC"]);
  uint64_t v5 = [[SSSQLiteQuery alloc] initWithDatabase:*(void *)(*(void *)(a1 + 40) + 56) descriptor:v4];
  memset(v11, 0, sizeof(v11));
  unint64_t v6 = [*(id *)(a1 + 48) count];
  unint64_t v7 = v6;
  int v8 = v11;
  if (v6 >= 0xB) {
    int v8 = malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  }
  objc_msgSend(*(id *)(a1 + 48), "getObjects:range:", v8, 0, v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__SSDatabaseCache_cacheEntryProperties_forLookupKeys___block_invoke_2;
  void v10[3] = &unk_1E5BADF40;
  v10[5] = v7;
  v10[6] = v8;
  v10[4] = *(void *)(a1 + 56);
  [(SSSQLiteQuery *)v5 enumeratePersistentIDsAndProperties:v8 count:v7 usingBlock:v10];
  if (v8 != v11) {
    free(v8);
  }

  return 1;
}

void __54__SSDatabaseCache_cacheEntryProperties_forLookupKeys___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1A6267F60]();
  unint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(a1 + 40)];
  unint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    for (unint64_t i = 0; i < v7; ++i)
    {
      uint64_t v9 = *(void *)(a3 + 8 * i);
      if (v9)
      {
        [v6 setObject:v9 forKey:*(void *)(*(void *)(a1 + 48) + 8 * i)];
        unint64_t v7 = *(void *)(a1 + 40);
      }
    }
  }
  if ([v6 count]) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (unint64_t)maximumInlineBlobSize
{
  return self->_maximumInlineBlobSize;
}

- (void)setMaximumInlineBlobSize:(unint64_t)a3
{
  self->_maximumInlineBlobSize = a3;
}

@end