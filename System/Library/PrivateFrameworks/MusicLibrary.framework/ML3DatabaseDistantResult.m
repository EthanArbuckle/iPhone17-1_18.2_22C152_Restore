@interface ML3DatabaseDistantResult
- (BOOL)_fetchRowsIfEmpty;
- (ML3DatabaseDistantConnection)distantConnection;
- (ML3DatabaseDistantResult)init;
- (ML3DatabaseDistantResult)initWithDistantConnection:(id)a3 sql:(id)a4 parameters:(id)a5;
- (ML3DatabaseDistantResult)initWithStatement:(id)a3;
- (NSArray)parameters;
- (NSString)sql;
- (id)columnNameIndexMap;
- (id)description;
- (unint64_t)indexForColumnName:(id)a3;
- (void)_localEnumerateRowsWithBlock:(id)a3;
- (void)_remoteEnumerateRowsWithBlock:(id)a3;
- (void)enumerateRowsWithBlock:(id)a3;
@end

@implementation ML3DatabaseDistantResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_sql, 0);
  objc_storeStrong((id *)&self->_distantConnection, 0);
  objc_storeStrong((id *)&self->_cachedColumnNameIndexMap, 0);

  objc_storeStrong((id *)&self->_cachedRows, 0);
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)sql
{
  return self->_sql;
}

- (ML3DatabaseDistantConnection)distantConnection
{
  return self->_distantConnection;
}

- (BOOL)_fetchRowsIfEmpty
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  sql = self->_sql;
  if (!sql) {
    return 1;
  }
  BOOL v4 = 1;
  if ([(NSString *)sql length])
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 1;
    if (!self->_cachedRows)
    {
      distantConnection = self->_distantConnection;
      if (distantConnection)
      {
        v6 = [(ML3DatabaseDistantConnection *)distantConnection currentTransactionID];
        if (v6)
        {
          [(ML3DatabaseConnection *)self->_distantConnection pushTransaction];
          v7 = +[MLMediaLibraryService sharedMediaLibraryService];
          dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v10 = [(ML3DatabaseResult *)self limitProperty];
          BOOL v11 = v10 == 0;

          if (v11)
          {
            v14 = 0;
          }
          else
          {
            v33[0] = @"MLDatabaseQueryOptionLimitPropertyKey";
            v12 = [(ML3DatabaseResult *)self limitProperty];
            v33[1] = @"MLDatabaseQueryOptionLimitValueKey";
            v34[0] = v12;
            v13 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ML3DatabaseResult limitValue](self, "limitValue"));
            v34[1] = v13;
            v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
          }
          v17 = self->_sql;
          parameters = self->_parameters;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __45__ML3DatabaseDistantResult__fetchRowsIfEmpty__block_invoke;
          v24[3] = &unk_1E5FB81B8;
          v19 = (NSArray *)v9;
          v28 = &v29;
          v25 = v19;
          v26 = self;
          v20 = v8;
          v27 = v20;
          [v7 executeQuery:v17 withParameters:parameters options:v14 onTransaction:v6 withCompletionHandler:v24];
          dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
          cachedRows = self->_cachedRows;
          self->_cachedRows = v19;
          v22 = v19;

          BOOL v4 = *((unsigned char *)v30 + 24) != 0;
          goto LABEL_17;
        }
        v15 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_distantConnection;
          *(_DWORD *)buf = 138543362;
          v36 = v16;
          _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: Tried to fetch distant result set without a transaction ID. (Connection used: %{public}@)", buf, 0xCu);
        }
      }
      else
      {
        v15 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: Tried to fetch distant result set without a connection.", buf, 2u);
        }
      }

      BOOL v4 = 0;
    }
LABEL_17:
    _Block_object_dispose(&v29, 8);
  }
  return v4;
}

void __45__ML3DatabaseDistantResult__fetchRowsIfEmpty__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "Could not fetch results for distant result set. %{public}@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    dispatch_semaphore_t v8 = MSVPropertyListDataClasses();
    id v9 = MSVUnarchivedObjectOfClasses();

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v16 = [ML3DatabaseCachedRow alloc];
          v17 = -[ML3DatabaseCachedRow initWithArray:](v16, "initWithArray:", v15, (void)v18);
          [*(id *)(a1 + 32) addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v12);
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "popTransactionAndCommit:", 1, (void)v18);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_localEnumerateRowsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  distantConnection = self->_distantConnection;
  if (distantConnection)
  {
    id v6 = [(ML3DatabaseConnection *)distantConnection _owningPool];

    if (v6)
    {
      v7 = [(ML3DatabaseConnection *)self->_distantConnection _owningPool];
      dispatch_semaphore_t v8 = [v7 _connectionForWriting:0 useThreadConnection:0 storeThreadLocalConnection:0];
      id v9 = [(ML3DatabaseResult *)self limitProperty];

      sql = self->_sql;
      parameters = self->_parameters;
      if (v9)
      {
        uint64_t v12 = [(ML3DatabaseResult *)self limitProperty];
        uint64_t v13 = objc_msgSend(v8, "executeQuery:withParameters:limitProperty:limitValue:", sql, parameters, v12, -[ML3DatabaseResult limitValue](self, "limitValue"));

        if (v13)
        {
LABEL_5:
          [v13 enumerateRowsWithBlock:v4];
LABEL_12:
          [v7 checkInConnection:v8];

          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v13 = [v8 executeQuery:self->_sql withParameters:self->_parameters];
        if (v13) {
          goto LABEL_5;
        }
      }
      uint64_t v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v8 sqliteError];
        int v17 = 138543362;
        long long v18 = v16;
        _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "Could not fallback to local connection. Local result could not be obtained from query. %{public}@", (uint8_t *)&v17, 0xCu);
      }
      goto LABEL_12;
    }
  }
  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_distantConnection;
    int v17 = 138543362;
    long long v18 = v14;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "Could not fallback to local connection. Result does not have a connection or a pool reference. %{public}@", (uint8_t *)&v17, 0xCu);
  }
LABEL_13:
}

- (void)_remoteEnumerateRowsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ML3DatabaseDistantResult *)self _fetchRowsIfEmpty])
  {
    v11[0] = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self->_cachedRows;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        (*((void (**)(id, void, void, uint8_t *))v4 + 2))(v4, *(void *)(*((void *)&v12 + 1) + 8 * v9), 0, v11);
        if (v11[0]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Distant result fetch failed. Trying to fallback to a local connection...", v11, 2u);
    }

    [(ML3DatabaseDistantResult *)self _localEnumerateRowsWithBlock:v4];
  }
}

- (void)enumerateRowsWithBlock:(id)a3
{
  distantConnection = self->_distantConnection;
  id v5 = a3;
  if ([(ML3DatabaseConnection *)distantConnection isInTransaction]) {
    [(ML3DatabaseDistantResult *)self _remoteEnumerateRowsWithBlock:v5];
  }
  else {
    [(ML3DatabaseDistantResult *)self _localEnumerateRowsWithBlock:v5];
  }
}

- (id)columnNameIndexMap
{
  cachedColumnNameIndexMap = self->_cachedColumnNameIndexMap;
  if (!cachedColumnNameIndexMap)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__ML3DatabaseDistantResult_columnNameIndexMap__block_invoke;
    v5[3] = &unk_1E5FB83F8;
    v5[4] = self;
    [(ML3DatabaseDistantResult *)self _localEnumerateRowsWithBlock:v5];
    cachedColumnNameIndexMap = self->_cachedColumnNameIndexMap;
  }

  return cachedColumnNameIndexMap;
}

void __46__ML3DatabaseDistantResult_columnNameIndexMap__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  if (v12)
  {
    uint64_t v8 = [v12 parentResult];
    uint64_t v9 = [v8 columnNameIndexMap];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 64);
    *(void *)(v10 + 64) = v9;
  }
  if (a4) {
    *a4 = 1;
  }
}

- (unint64_t)indexForColumnName:(id)a3
{
  id v4 = a3;
  id v5 = [(ML3DatabaseDistantResult *)self columnNameIndexMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  unint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ML3DatabaseDistantResult;
  id v4 = [(ML3DatabaseDistantResult *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@, sql = \"%@\", parameters = %@", v4, self->_sql, self->_parameters];

  return v5;
}

- (ML3DatabaseDistantResult)init
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"-[%@ init] is unsupported. Use -[%@ initWithTransactionID:] instead.", v4, v4 format];

  return 0;
}

- (ML3DatabaseDistantResult)initWithStatement:(id)a3
{
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"-[%@ initWithStatement:] is invalid for distant results. Use -[%@ initWithTransactionID:] instead.", v5, v5 format];

  return 0;
}

- (ML3DatabaseDistantResult)initWithDistantConnection:(id)a3 sql:(id)a4 parameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ML3DatabaseDistantResult;
  id v12 = [(ML3DatabaseResult *)&v18 initWithStatement:0 connection:0];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_distantConnection, a3);
    uint64_t v14 = [v10 copy];
    sql = v13->_sql;
    v13->_sql = (NSString *)v14;

    objc_storeStrong((id *)&v13->_parameters, a5);
    cachedRows = v13->_cachedRows;
    v13->_cachedRows = 0;
  }
  return v13;
}

@end