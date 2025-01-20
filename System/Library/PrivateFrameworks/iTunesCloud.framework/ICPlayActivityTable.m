@interface ICPlayActivityTable
+ (BOOL)_setupDatabase:(id)a3;
+ (id)_defaultDatabasePath;
+ (id)_eventsDatabaseTableName;
+ (id)_propertiesDatabaseTableName;
+ (void)_migrateDatabaseFiles;
- (BOOL)_removeDatabaseReturningError:(id *)a3;
- (BOOL)_setValue:(id)a3 forDatabasePropertyKey:(id)a4;
- (BOOL)getPlayActivityEvents:(id *)a3 storeAccountID:(int64_t)a4 limit:(unint64_t)a5 returningError:(id *)a6;
- (BOOL)getStoreAccounts:(id *)a3 returningError:(id *)a4;
- (BOOL)hasPendingPlayActivityEvents:(BOOL *)a3 returningError:(id *)a4;
- (BOOL)insertPlayActivityEvent:(id)a3 returningError:(id *)a4;
- (BOOL)removePlayActivityEvents:(id)a3 returningError:(id *)a4;
- (ICPlayActivityTable)init;
- (ICPlayActivityTable)initWithDatabasePath:(id)a3;
- (id)_valueForDatabasePropertyKey:(id)a3;
- (id)eventsRevisionVersionToken;
- (void)performTransactionWithBlock:(id)a3;
@end

@implementation ICPlayActivityTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialAccessQueue, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);

  objc_storeStrong((id *)&self->_databaseConnection, 0);
}

- (BOOL)hasPendingPlayActivityEvents:(BOOL *)a3 returningError:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  if (!a3) {
    return 1;
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__16378;
  v21 = __Block_byref_object_dispose__16379;
  id v22 = 0;
  v7 = [(id)objc_opt_class() _eventsDatabaseTableName];
  v8 = [NSString stringWithFormat:@"SELECT EXISTS (SELECT 1 FROM %@);", v7];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  databaseConnection = self->_databaseConnection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__ICPlayActivityTable_hasPendingPlayActivityEvents_returningError___block_invoke;
  v12[3] = &unk_1E5AC91D0;
  v12[4] = &v13;
  v12[5] = &v17;
  [(ICSQLiteConnection *)databaseConnection executeQuery:v8 withResults:v12];
  if (a4) {
    *a4 = (id) v18[5];
  }
  *a3 = *((unsigned char *)v14 + 24);
  BOOL v10 = v18[5] == 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __67__ICPlayActivityTable_hasPendingPlayActivityEvents_returningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 firstInt64Value] > 0;
  }
}

- (BOOL)getStoreAccounts:(id *)a3 returningError:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  if (!a3) {
    return 1;
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16378;
  v29 = __Block_byref_object_dispose__16379;
  id v30 = 0;
  v7 = [(id)objc_opt_class() _eventsDatabaseTableName];
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT DISTINCT %@ FROM %@;",
    @"store_account_id",
  v8 = v7);
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16378;
  uint64_t v19 = __Block_byref_object_dispose__16379;
  id v20 = 0;
  databaseConnection = self->_databaseConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__ICPlayActivityTable_getStoreAccounts_returningError___block_invoke;
  v14[3] = &unk_1E5ACC610;
  v14[4] = &v21;
  v14[5] = &v25;
  v14[6] = &v15;
  [(ICSQLiteConnection *)databaseConnection executeQuery:v8 withResults:v14];
  if (!*((unsigned char *)v22 + 24) && !v26[5])
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    v11 = (void *)v26[5];
    v26[5] = v10;
  }
  if (a4) {
    *a4 = (id) v26[5];
  }
  *a3 = (id) v16[5];
  BOOL v12 = v26[5] == 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __55__ICPlayActivityTable_getStoreAccounts_returningError___block_invoke(void *a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__ICPlayActivityTable_getStoreAccounts_returningError___block_invoke_2;
    v7[3] = &unk_1E5AC9180;
    long long v8 = *((_OWORD *)a1 + 2);
    uint64_t v9 = a1[6];
    [a2 enumerateRowsUsingBlock:v7];
  }
}

void __55__ICPlayActivityTable_getStoreAccounts_returningError___block_invoke_2(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  if (v7)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    long long v8 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v13, "int64ForColumnName:", @"store_account_id"));
    if (v8)
    {
      uint64_t v9 = *(void **)(*(void *)(a1[6] + 8) + 40);
      if (!v9)
      {
        uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        uint64_t v11 = *(void *)(a1[6] + 8);
        BOOL v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        uint64_t v9 = *(void **)(*(void *)(a1[6] + 8) + 40);
      }
      [v9 addObject:v8];
    }
  }
}

- (id)_valueForDatabasePropertyKey:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  if (!v5)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ICPlayActivityTable.m" lineNumber:508 description:@"key cannot be nil"];
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__16378;
  id v20 = __Block_byref_object_dispose__16379;
  id v21 = 0;
  id v6 = [(id)objc_opt_class() _propertiesDatabaseTableName];
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT %@ FROM %@ WHERE %@ = '%@';",
    @"value",
    v6,
    @"key",
  id v7 = v5);
  databaseConnection = self->_databaseConnection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ICPlayActivityTable__valueForDatabasePropertyKey___block_invoke;
  v13[3] = &unk_1E5AC91A8;
  id v9 = v5;
  id v14 = v9;
  uint64_t v15 = &v16;
  [(ICSQLiteConnection *)databaseConnection executeQuery:v7 withResults:v13];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __52__ICPlayActivityTable__valueForDatabasePropertyKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "Failed to get database property '%{public}@'. err=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = [a2 firstStringValue];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)_setValue:(id)a3 forDatabasePropertyKey:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  if (!v8)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"ICPlayActivityTable.m" lineNumber:485 description:@"key cannot be nil"];
  }
  uint64_t v9 = [(id)objc_opt_class() _propertiesDatabaseTableName];
  if (v7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR REPLACE INTO %@ (%@, %@) VALUES ('%@', '%@');",
      v9,
      @"key",
      @"value",
      v8,
    id v10 = v7);
    databaseConnection = self->_databaseConnection;
    id v24 = 0;
    BOOL v12 = [(ICSQLiteConnection *)databaseConnection executeStatement:v10 error:&v24];
    id v13 = v24;
    if (!v12)
    {
      id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v26 = v8;
        __int16 v27 = 2114;
        id v28 = v7;
        __int16 v29 = 2114;
        id v30 = v13;
        uint64_t v15 = "Failed to set database property ('%{public}@' = '%{public}@'). err=%{public}@";
        uint64_t v16 = v14;
        uint32_t v17 = 32;
LABEL_11:
        _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ = '%@';",
      v9,
      @"key",
    id v10 = v8);
    uint64_t v18 = self->_databaseConnection;
    id v23 = 0;
    BOOL v19 = [(ICSQLiteConnection *)v18 executeStatement:v10 error:&v23];
    id v13 = v23;
    if (!v19)
    {
      id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = v8;
        __int16 v27 = 2114;
        id v28 = v13;
        uint64_t v15 = "Failed to delete database property '%{public}@'. err=%{public}@";
        uint64_t v16 = v14;
        uint32_t v17 = 22;
        goto LABEL_11;
      }
LABEL_12:

      BOOL v20 = 0;
      goto LABEL_13;
    }
  }
  BOOL v20 = 1;
LABEL_13:

  return v20;
}

- (BOOL)removePlayActivityEvents:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  id v7 = [(id)objc_opt_class() _eventsDatabaseTableName];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"DELETE FROM %@ WHERE %@ IN ("), v7, CFSTR("pid");
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      if ([v6 count] - 1 <= v9) {
        id v10 = &stru_1EF5F5C40;
      }
      else {
        id v10 = @",";
      }
      [v8 appendFormat:@"?%@", v10];
      ++v9;
    }
    while ([v6 count] > v9);
  }
  [v8 appendString:@";"]);
  databaseConnection = self->_databaseConnection;
  id v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__ICPlayActivityTable_removePlayActivityEvents_returningError___block_invoke;
  v17[3] = &unk_1E5ACC1A0;
  id v12 = v6;
  id v18 = v12;
  BOOL v13 = [(ICSQLiteConnection *)databaseConnection executeStatement:v8 error:&v19 bindings:v17];
  id v14 = v19;
  if (!v13)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];

    id v14 = (id)v15;
  }
  if (a4) {
    *a4 = v14;
  }

  return v13;
}

void __63__ICPlayActivityTable_removePlayActivityEvents_returningError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v3];
      objc_msgSend(v5, "bindInt64:atPosition:", objc_msgSend(v4, "persistentID"), ++v3);
    }
    while ([*(id *)(a1 + 32) count] > v3);
  }
}

- (BOOL)getPlayActivityEvents:(id *)a3 storeAccountID:(int64_t)a4 limit:(unint64_t)a5 returningError:(id *)a6
{
  if (!a3) {
    return 1;
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__16378;
  v35 = __Block_byref_object_dispose__16379;
  id v36 = 0;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT "];
  for (uint64_t i = 0; i != 4; ++i)
  {
    if (i == 3) {
      id v12 = &stru_1EF5F5C40;
    }
    else {
      id v12 = @",";
    }
    [v10 appendFormat:@"%@%@", off_1E5AC91F0[i], v12];
  }
  BOOL v13 = [(id)objc_opt_class() _eventsDatabaseTableName];
  [v10 appendFormat:@" FROM %@", v13];
  if (a4) {
    [v10 appendFormat:@" WHERE (%@ == %llu)", @"store_account_id", a4];
  }
  [v10 appendString:@" ORDER BY "];
  if (a4) {
    [v10 appendFormat:@"%@,%@ ASC", @"store_account_id", @"timestamp"];
  }
  else {
    [v10 appendFormat:@"%@ ASC", @"timestamp"];
  }
  if (a5) {
    objc_msgSend(v10, "appendFormat:", @" LIMIT %lu;", a5);
  }
  else {
    [v10 appendFormat:@";"];
  }
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__16378;
  uint64_t v25 = __Block_byref_object_dispose__16379;
  id v26 = 0;
  databaseConnection = self->_databaseConnection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__ICPlayActivityTable_getPlayActivityEvents_storeAccountID_limit_returningError___block_invoke;
  v20[3] = &unk_1E5ACC610;
  v20[4] = &v27;
  v20[5] = &v31;
  v20[6] = &v21;
  [(ICSQLiteConnection *)databaseConnection executeQuery:v10 withResults:v20];
  if (!*((unsigned char *)v28 + 24) && !v32[5])
  {
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    uint32_t v17 = (void *)v32[5];
    v32[5] = v16;
  }
  if (a6) {
    *a6 = (id) v32[5];
  }
  *a3 = (id) v22[5];
  BOOL v14 = v32[5] == 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

void __81__ICPlayActivityTable_getPlayActivityEvents_storeAccountID_limit_returningError___block_invoke(void *a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__ICPlayActivityTable_getPlayActivityEvents_storeAccountID_limit_returningError___block_invoke_2;
    v7[3] = &unk_1E5AC9180;
    long long v8 = *((_OWORD *)a1 + 2);
    uint64_t v9 = a1[6];
    [a2 enumerateRowsUsingBlock:v7];
  }
}

void __81__ICPlayActivityTable_getPlayActivityEvents_storeAccountID_limit_returningError___block_invoke_2(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a3;
  if (v14)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    long long v8 = [a2 dataForColumnIndex:3];
    if ([v8 length])
    {
      uint64_t v9 = [[ICPlayActivityEvent alloc] initWithDataRepresentation:v8];
      if (v9)
      {
        id v10 = *(void **)(*(void *)(a1[6] + 8) + 40);
        if (!v10)
        {
          uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          uint64_t v12 = *(void *)(a1[6] + 8);
          BOOL v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          id v10 = *(void **)(*(void *)(a1[6] + 8) + 40);
        }
        [v10 addObject:v9];
      }
    }
  }
}

- (void)performTransactionWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    serialAccessQueue = self->_serialAccessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__ICPlayActivityTable_performTransactionWithBlock___block_invoke;
    v7[3] = &unk_1E5ACD2F0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_sync(serialAccessQueue, v7);
  }
}

void __51__ICPlayActivityTable_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__ICPlayActivityTable_performTransactionWithBlock___block_invoke_2;
  v2[3] = &unk_1E5AC9158;
  id v3 = *(id *)(a1 + 40);
  [v1 performTransaction:v2];
}

uint64_t __51__ICPlayActivityTable_performTransactionWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)insertPlayActivityEvent:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  databaseConnection = self->_databaseConnection;
  id v18 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __62__ICPlayActivityTable_insertPlayActivityEvent_returningError___block_invoke;
  uint64_t v16 = &unk_1E5ACC1A0;
  id v8 = v6;
  id v17 = v8;
  BOOL v9 = [(ICSQLiteConnection *)databaseConnection executeStatement:@"INSERT OR REPLACE INTO events (pid, timestamp, store_account_id, event_data) VALUES (?, ?, ?, ?)" error:&v18 bindings:&v13];
  id v10 = v18;
  uint64_t v11 = v10;
  if (!v9 && !v10)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"ICError", 0, 0, v13, v14, v15, v16);
  }
  if (a4) {
    *a4 = v11;
  }

  return v9;
}

void __62__ICPlayActivityTable_insertPlayActivityEvent_returningError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "bindInt64:atPosition:", objc_msgSend(v3, "persistentID"), 1);
  id v5 = [*(id *)(a1 + 32) eventDate];
  [v5 timeIntervalSince1970];
  objc_msgSend(v4, "bindDouble:atPosition:", 2);

  objc_msgSend(v4, "bindInt64:atPosition:", objc_msgSend(*(id *)(a1 + 32), "storeAccountID"), 3);
  id v6 = [*(id *)(a1 + 32) dataRepresentation];
  [v4 bindData:v6 atPosition:4];
}

- (id)eventsRevisionVersionToken
{
  v2 = [(ICPlayActivityTable *)self _valueForDatabasePropertyKey:@"events_revision_version_token"];
  id v3 = v2;
  if (!v2) {
    v2 = @"unknown-revision-version";
  }
  id v4 = v2;

  return v4;
}

- (BOOL)_removeDatabaseReturningError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSString *)self->_databasePath copy];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 stringByDeletingLastPathComponent];
  id v19 = v3;
  id v6 = [v3 lastPathComponent];
  BOOL v20 = v4;
  [v4 contentsOfDirectoryAtPath:v5 error:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    LOBYTE(v10) = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v14 hasPrefix:v6])
        {
          uint64_t v15 = [v5 stringByAppendingPathComponent:v14];
          id v21 = v11;
          int v10 = [v20 removeItemAtPath:v15 error:&v21];
          id v16 = v21;

          if (!v10)
          {
            uint64_t v11 = v16;
            goto LABEL_14;
          }
          LOBYTE(v10) = 1;
          uint64_t v11 = v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    uint64_t v11 = 0;
  }
LABEL_14:

  if (a3) {
    *a3 = v11;
  }

  return v10 & 1;
}

- (ICPlayActivityTable)initWithDatabasePath:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = self;
    __int16 v34 = 2114;
    id v35 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ -- Opening database at path %{public}@", buf, 0x16u);
  }

  [(id)objc_opt_class() _migrateDatabaseFiles];
  id v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunescloudd.playactivitytable", 0);
  serialAccessQueue = self->_serialAccessQueue;
  self->_serialAccessQueue = v6;

  if (v4)
  {
    uint64_t v8 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v8 = [(id)objc_opt_class() _defaultDatabasePath];
  }
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v8 stringByDeletingLastPathComponent];
  id v31 = 0;
  int v11 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v31];
  id v12 = v31;

  if (v11)
  {
    uint64_t v13 = [[ICSQLiteConnectionOptions alloc] initWithDatabasePath:v8];
    uint64_t v14 = [[ICSQLiteConnection alloc] initWithOptions:v13];
    uint64_t v15 = (ICPlayActivityTable *)objc_opt_class();
    if ([(ICPlayActivityTable *)v15 _setupDatabase:v14])
    {
      id v16 = v12;
      id v17 = v14;
    }
    else
    {
      long long v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v15;
        __int16 v34 = 2112;
        id v35 = v8;
        __int16 v36 = 2112;
        id v37 = v12;
        _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@ -- Error creating database, removing if possible...: %@ -- %@", buf, 0x20u);
      }

      [(ICSQLiteConnection *)v14 close];
      id v30 = v12;
      BOOL v24 = [(ICPlayActivityTable *)self _removeDatabaseReturningError:&v30];
      id v16 = v30;

      long long v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (!v24)
      {
        if (v26)
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v33 = v15;
          __int16 v34 = 2112;
          id v35 = v8;
          __int16 v36 = 2112;
          id v37 = v16;
          _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_ERROR, "%{public}@ -- Error removing database: %@ -- %@", buf, 0x20u);
        }

        BOOL v20 = 0;
        id v17 = v14;
        goto LABEL_28;
      }
      if (v26)
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v15;
        __int16 v34 = 2112;
        id v35 = v8;
        __int16 v36 = 2112;
        id v37 = v16;
        _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_ERROR, "%{public}@ -- Removing database successful, attempting to recreate...: %@ -- %@", buf, 0x20u);
      }

      id v17 = [[ICSQLiteConnection alloc] initWithOptions:v13];
      if (!v17)
      {
        BOOL v20 = 0;
        goto LABEL_29;
      }
      if (([(ICPlayActivityTable *)v15 _setupDatabase:v17] & 1) == 0)
      {
        uint64_t v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v33 = v15;
          __int16 v34 = 2112;
          id v35 = v8;
          _os_log_impl(&dword_1A2D01000, v27, OS_LOG_TYPE_ERROR, "%{public}@ -- Error creating database for a second time, bailing out: %@", buf, 0x16u);
        }

        BOOL v20 = 0;
        goto LABEL_28;
      }
    }
    v29.receiver = self;
    v29.super_class = (Class)ICPlayActivityTable;
    id v18 = [(ICPlayActivityTable *)&v29 init];
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_databaseConnection, v17);
      objc_storeStrong(p_isa + 2, v8);
    }
    self = p_isa;
    BOOL v20 = self;
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v13 = (ICSQLiteConnectionOptions *)os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
  {
    id v21 = (ICPlayActivityTable *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v33 = v21;
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v12;
    long long v22 = v21;
    _os_log_impl(&dword_1A2D01000, &v13->super, OS_LOG_TYPE_ERROR, "%{public}@ -- Error creating directory: %@ -- %@", buf, 0x20u);
  }
  BOOL v20 = 0;
  id v16 = v12;
LABEL_29:

  return v20;
}

- (ICPlayActivityTable)init
{
  return [(ICPlayActivityTable *)self initWithDatabasePath:0];
}

+ (BOOL)_setupDatabase:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 _eventsDatabaseTableName];
    objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY, %@ REAL, %@ INTEGER, %@ BLOB);",
      v5,
      @"pid",
      @"timestamp",
      @"store_account_id",
      @"event_data");
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v7 = [a1 _propertiesDatabaseTableName];
    objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS %@ (%@ TEXT PRIMARY KEY, %@ TEXT);",
      v7,
      @"key",
      @"value");
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v58 = 0;
    char v9 = [v4 executeStatement:@"PRAGMA legacy_file_format = 0;" error:&v58];
    int v10 = (__CFString *)v58;
    int v11 = v10;
    if (v9)
    {
      v49 = v8;
      v57 = v10;
      char v12 = [v4 executeStatement:@"PRAGMA journal_mode=WAL;" error:&v57];
      uint64_t v13 = v57;

      if ((v12 & 1) == 0)
      {
        id v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v60 = @"PRAGMA journal_mode=WAL;";
          __int16 v61 = 2114;
          v62 = v13;
          _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_ERROR, "Failed to execute database statment: (%@). err=%{public}@", buf, 0x16u);
        }
        BOOL v30 = 0;
        int v11 = v13;
        goto LABEL_30;
      }
      v56 = v13;
      char v14 = [v4 executeStatement:v6 error:&v56];
      int v11 = v56;

      if (v14)
      {
        v55 = v11;
        char v15 = [v4 executeStatement:v49 error:&v55];
        id v16 = v55;

        if (v15)
        {
          id v17 = [v4 userVersion];
          uint64_t v18 = [v17 integerValue];

          v48 = v6;
          if (v18)
          {
            if ((unint64_t)v18 <= 0x7D5)
            {
              int v11 = v16;
              char v19 = 0;
              LOBYTE(v20) = 1;
              id v21 = @"DROP TABLE IF EXISTS %@;";
              do
              {
                if ((unint64_t)(v18 - 2000) <= 5)
                {
                  long long v22 = objc_msgSend(NSString, "stringWithFormat:", v21, v7);
                  long long v23 = v11;
                  v54 = v11;
                  int v24 = [v4 executeStatement:v22 error:&v54];
                  int v11 = v54;

                  if (!v24) {
                    goto LABEL_59;
                  }
                  long long v25 = v21;
                  BOOL v26 = objc_msgSend(NSString, "stringWithFormat:", v21, v5);
                  v53 = v11;
                  int v27 = [v4 executeStatement:v26 error:&v53];
                  id v28 = v53;

                  if (!v27)
                  {
                    int v11 = v28;
LABEL_59:
                    id v6 = v48;
                    goto LABEL_60;
                  }
                  id v6 = v48;
                  int v11 = v28;
                  if (![v4 executeStatement:v48 error:0]) {
                    goto LABEL_60;
                  }
                  int v20 = [v4 executeStatement:v49 error:0];
                  if (v20) {
                    uint64_t v18 = 2006;
                  }
                  char v19 = 1;
                  id v21 = v25;
                }
              }
              while ((v20 & 1) != 0 && v18 < 2006);
              if (v20)
              {
                uint64_t v29 = v18;
                id v16 = v11;
                if (v19) {
                  goto LABEL_39;
                }
                goto LABEL_44;
              }
LABEL_60:
              id v31 = _ICLogCategoryDefault();
              uint64_t v8 = v49;
              if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                goto LABEL_26;
              }
              *(_DWORD *)buf = 138543362;
              v60 = v11;
              v32 = "Failed to execute database statment to drop tables. err=%{public}@";
              uint64_t v33 = v31;
              uint32_t v34 = 12;
              goto LABEL_25;
            }
            uint64_t v29 = v18;
          }
          else
          {
            uint64_t v29 = 2006;
LABEL_39:
            __int16 v36 = [MEMORY[0x1E4F29128] UUID];
            uint64_t v37 = [v36 UUIDString];
            uint64_t v38 = (void *)v37;
            v39 = &stru_1EF5F5C40;
            if (v37) {
              v39 = (__CFString *)v37;
            }
            v40 = v39;

            objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR IGNORE INTO %@ (%@, %@) VALUES ('%@', '%@');",
              v7,
              @"key",
              @"value",
              @"events_revision_version_token",
            v41 = v40);
            v52 = v16;
            char v42 = [v4 executeStatement:v41 error:&v52];
            int v11 = v52;

            if ((v42 & 1) == 0)
            {
              id v31 = _ICLogCategoryDefault();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v60 = v11;
                _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_ERROR, "Failed to execute database statment to set initial properties. err=%{public}@", buf, 0xCu);
              }
              BOOL v30 = 0;
              id v6 = v48;
              goto LABEL_30;
            }
            id v16 = v11;
          }
LABEL_44:
          objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS StoreAccountID ON %@ (%@ ASC);",
            v5,
          id v31 = @"store_account_id");
          v51 = v16;
          char v43 = [v4 executeStatement:v31 error:&v51];
          int v11 = v51;

          if (v43)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS Timestamp ON %@ (%@ ASC);",
              v5,
            uint64_t v44 = @"timestamp");

            v50 = v11;
            char v45 = [v4 executeStatement:v44 error:&v50];
            v46 = v50;

            if (v45)
            {
              v47 = [NSNumber numberWithInteger:v29];
              [v4 setUserVersion:v47];
              BOOL v30 = 1;
            }
            else
            {
              v47 = _ICLogCategoryDefault();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v60 = @"CREATE INDEX IF NOT EXISTS Timestamp ON...;";
                __int16 v61 = 2114;
                v62 = v46;
                _os_log_impl(&dword_1A2D01000, v47, OS_LOG_TYPE_ERROR, "Failed to execute database statment: (%@). err=%{public}@", buf, 0x16u);
              }
              BOOL v30 = 0;
            }
            int v11 = v46;
            id v31 = v44;
          }
          else
          {
            v47 = _ICLogCategoryDefault();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v60 = @"CREATE INDEX IF NOT EXISTS StoreAccountID ON...;";
              __int16 v61 = 2114;
              v62 = v11;
              _os_log_impl(&dword_1A2D01000, v47, OS_LOG_TYPE_ERROR, "Failed to execute database statment: (%@). err=%{public}@", buf, 0x16u);
            }
            BOOL v30 = 0;
          }
          id v6 = v48;
        }
        else
        {
          id v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v8 = v49;
            v60 = v49;
            __int16 v61 = 2114;
            v62 = v16;
            _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_ERROR, "Failed to execute database statment: (%@). err=%{public}@", buf, 0x16u);
            int v11 = v16;
            goto LABEL_26;
          }
          int v11 = v16;
          BOOL v30 = 0;
        }
LABEL_30:
        uint64_t v8 = v49;
        goto LABEL_31;
      }
      id v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      uint64_t v8 = v49;
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 138412546;
      v60 = v6;
      __int16 v61 = 2114;
      v62 = v11;
      v32 = "Failed to execute database statment: (%@). err=%{public}@";
    }
    else
    {
      id v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        BOOL v30 = 0;
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412546;
      v60 = @"PRAGMA legacy_file_format = 0;";
      __int16 v61 = 2114;
      v62 = v11;
      v32 = "Failed to execute database statment: (%@). err=%{public}@";
    }
    uint64_t v33 = v31;
    uint32_t v34 = 22;
LABEL_25:
    _os_log_impl(&dword_1A2D01000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
    goto LABEL_26;
  }
  BOOL v30 = 0;
LABEL_32:

  return v30;
}

+ (id)_propertiesDatabaseTableName
{
  return @"properties";
}

+ (id)_eventsDatabaseTableName
{
  return @"events";
}

+ (id)_defaultDatabasePath
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"com.apple.iTunesCloud", @"play_activity.sqlitedb", 0);
  id v3 = [NSString pathWithComponents:v2];

  return v3;
}

+ (void)_migrateDatabaseFiles
{
  id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"com.apple.itunesstored", @"play_activity.sqlitedb", 0);
  id v3 = objc_msgSend(NSString, "pathWithComponents:");
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v5 = [a1 _defaultDatabasePath];
    id v6 = [v5 stringByDeletingLastPathComponent];
    [v4 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

    [v4 moveItemAtPath:v3 toPath:v5 error:0];
    id v7 = [v3 stringByAppendingString:@"-wal"];
    uint64_t v8 = [v5 stringByAppendingString:@"-wal"];
    [v4 moveItemAtPath:v7 toPath:v8 error:0];

    char v9 = [v3 stringByAppendingString:@"-shm"];
    int v10 = [v5 stringByAppendingString:@"-shm"];
    [v4 moveItemAtPath:v9 toPath:v10 error:0];
  }
}

@end