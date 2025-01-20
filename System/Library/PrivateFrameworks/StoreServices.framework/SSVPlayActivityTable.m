@interface SSVPlayActivityTable
+ (BOOL)_setupDatabase:(id)a3;
+ (id)_eventsDatabaseTableName;
+ (id)_propertiesDatabaseTableName;
+ (id)databasePath;
- (BOOL)_getPlayActivityEvents:(id *)a3 relevantRevisionsIndexSet:(id *)a4 withStartRevision:(unint64_t)a5 endRevision:(unint64_t)a6 storeAccountID:(unint64_t)a7 shouldFilterStoreAccountID:(BOOL)a8 additionalRevisionsIndexSet:(id)a9 ignoredRevisionsIndexSet:(id)a10 error:(id *)a11;
- (BOOL)_setValue:(id)a3 forDatabasePropertyKey:(id)a4;
- (BOOL)getPlayActivityEvents:(id *)a3 relevantRevisionsIndexSet:(id *)a4 withStartRevision:(unint64_t)a5 endRevision:(unint64_t)a6 additionalRevisionsIndexSet:(id)a7 ignoredRevisionsIndexSet:(id)a8 error:(id *)a9;
- (BOOL)getPlayActivityEvents:(id *)a3 relevantRevisionsIndexSet:(id *)a4 withStartRevision:(unint64_t)a5 endRevision:(unint64_t)a6 storeAccountID:(unint64_t)a7 additionalRevisionsIndexSet:(id)a8 ignoredRevisionsIndexSet:(id)a9 error:(id *)a10;
- (BOOL)insertPlayActivityEvent:(id)a3 withRevision:(unint64_t)a4 returningError:(id *)a5;
- (BOOL)removePlayActivityEventsUpToRevision:(unint64_t)a3 returningError:(id *)a4;
- (NSString)eventsRevisionVersionToken;
- (SSVPlayActivityTable)init;
- (id)_revisionsIndexSetUsingPersisentIDGenerationBlock:(id)a3 count:(unint64_t)a4;
- (id)_valueForDatabasePropertyKey:(id)a3;
- (id)revisionsIndexSetForPlayActivityEventPersistentIDs:(id)a3;
- (id)revisionsIndexSetForPlayActivityEvents:(id)a3;
- (unint64_t)currentEventsRevision;
- (void)performTransactionWithBlock:(id)a3;
- (void)setCurrentEventsRevision:(unint64_t)a3;
@end

@implementation SSVPlayActivityTable

- (SSVPlayActivityTable)init
{
  v3 = [(id)objc_opt_class() databasePath];
  v4 = [SSSQLiteDatabase alloc];
  v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
  v6 = [(SSSQLiteDatabase *)v4 initWithDatabaseURL:v5 readOnly:0 protectionType:*MEMORY[0x1E4F28358]];

  uint64_t v7 = objc_opt_class();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__SSVPlayActivityTable_init__block_invoke;
  v12[3] = &__block_descriptor_40_e26_v16__0__SSSQLiteDatabase_8lu32l8;
  v12[4] = v7;
  [(SSSQLiteDatabase *)v6 setSetupBlock:v12];
  v11.receiver = self;
  v11.super_class = (Class)SSVPlayActivityTable;
  v8 = [(SSVPlayActivityTable *)&v11 init];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_database, v6);
  }

  return v9;
}

uint64_t __28__SSVPlayActivityTable_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setupDatabase:a2];
}

- (unint64_t)currentEventsRevision
{
  v2 = [(SSVPlayActivityTable *)self _valueForDatabasePropertyKey:@"events_current_revision"];
  unint64_t v3 = [v2 longLongValue];

  return v3;
}

- (void)setCurrentEventsRevision:(unint64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SSVPlayActivityTable *)self _setValue:v4 forDatabasePropertyKey:@"events_current_revision"];
}

+ (id)databasePath
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"com.apple.itunesstored", @"play_activity.sqlitedb", 0);
  unint64_t v3 = [NSString pathWithComponents:v2];

  return v3;
}

- (NSString)eventsRevisionVersionToken
{
  v2 = [(SSVPlayActivityTable *)self _valueForDatabasePropertyKey:@"events_revision_version_token"];
  unint64_t v3 = v2;
  if (!v2) {
    v2 = @"unknown-revision-version";
  }
  id v4 = v2;

  return v4;
}

- (BOOL)insertPlayActivityEvent:(id)a3 withRevision:(unint64_t)a4 returningError:(id *)a5
{
  id v8 = a3;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  BOOL v37 = v8 == 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__88;
  v32 = __Block_byref_object_dispose__88;
  id v33 = 0;
  v9 = [(id)objc_opt_class() _eventsDatabaseTableName];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"INSERT OR REPLACE INTO "];
  [v10 appendString:v9];
  objc_msgSend(v10, "appendString:", @" (");
  [v10 appendString:@"pid"];
  uint64_t v11 = 0;
  do
  {
    [v10 appendString:@", "];
    if ((v11 + 1) > 3) {
      v12 = 0;
    }
    else {
      v12 = off_1E5BAF0B8[v11];
    }
    [v10 appendString:v12];
    ++v11;
  }
  while (v11 != 3);
  [v10 appendString:@") VALUES (?"];
  int v13 = 3;
  do
  {
    [v10 appendString:@", ?"];
    --v13;
  }
  while (v13);
  [v10 appendString:@";"]);
  database = self->_database;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__SSVPlayActivityTable_insertPlayActivityEvent_withRevision_returningError___block_invoke;
  v21[3] = &unk_1E5BAEEE0;
  unint64_t v27 = a4;
  id v15 = v8;
  v25 = &v28;
  v26 = &v34;
  id v22 = v15;
  v23 = self;
  id v16 = v10;
  id v24 = v16;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v16 cache:1 usingBlock:v21];
  if (!*((unsigned char *)v35 + 24) && !v29[5])
  {
    uint64_t v17 = SSError(@"SSErrorDomain", 100, 0, 0);
    v18 = (void *)v29[5];
    v29[5] = v17;
  }
  if (a5) {
    *a5 = (id) v29[5];
  }
  char v19 = *((unsigned char *)v35 + 24);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __76__SSVPlayActivityTable_insertPlayActivityEvent_withRevision_returningError___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = 0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  while (2)
  {
    switch(v4)
    {
      case 1:
        sqlite3_int64 v6 = *(void *)(a1 + 72);
        goto LABEL_7;
      case 2:
        uint64_t v5 = [*(id *)(a1 + 32) storeAccountID];
        goto LABEL_6;
      case 3:
        id v7 = [*(id *)(a1 + 32) dataRepresentation];
        sqlite3_bind_blob(a2, v4 + 1, (const void *)[v7 bytes], objc_msgSend(v7, "length"), 0);

        goto LABEL_9;
      default:
        uint64_t v5 = [*(id *)(a1 + 32) persistentID];
LABEL_6:
        sqlite3_int64 v6 = v5;
LABEL_7:
        sqlite3_bind_int64(a2, v4 + 1, v6);
LABEL_9:
        if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          if (++v4 == 4)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[SSSQLiteDatabase statementDidFinishAfterStepping:a2];
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
              return;
            }
            id v8 = +[SSLogConfig sharedStoreServicesConfig];
            if (!v8)
            {
              id v8 = +[SSLogConfig sharedConfig];
            }
            int v9 = [v8 shouldLog];
            if ([v8 shouldLogToDisk]) {
              int v10 = v9 | 2;
            }
            else {
              int v10 = v9;
            }
            uint64_t v11 = [v8 OSLogObject];
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              v10 &= 2u;
            }
            if (v10)
            {
              v12 = objc_opt_class();
              uint64_t v13 = *(void *)(a1 + 48);
              *(_DWORD *)v23 = 138412546;
              *(void *)&v23[4] = v12;
              *(_WORD *)&v23[12] = 2112;
              *(void *)&v23[14] = v13;
              id v14 = v12;
              LODWORD(v22) = 22;
              id v15 = (void *)_os_log_send_and_compose_impl();

              if (!v15)
              {
LABEL_23:

                return;
              }
              uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16], v24);
              free(v15);
              SSFileLog(v8, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v11);
            }

            goto LABEL_23;
          }
          continue;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        return;
    }
  }
}

- (void)performTransactionWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    database = self->_database;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__SSVPlayActivityTable_performTransactionWithBlock___block_invoke;
    v7[3] = &unk_1E5BAEF08;
    id v8 = v4;
    [(SSSQLiteDatabase *)database performTransactionWithBlock:v7];
  }
}

uint64_t __52__SSVPlayActivityTable_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)getPlayActivityEvents:(id *)a3 relevantRevisionsIndexSet:(id *)a4 withStartRevision:(unint64_t)a5 endRevision:(unint64_t)a6 additionalRevisionsIndexSet:(id)a7 ignoredRevisionsIndexSet:(id)a8 error:(id *)a9
{
  return [(SSVPlayActivityTable *)self _getPlayActivityEvents:a3 relevantRevisionsIndexSet:a4 withStartRevision:a5 endRevision:a6 storeAccountID:0 shouldFilterStoreAccountID:0 additionalRevisionsIndexSet:a7 ignoredRevisionsIndexSet:a8 error:a9];
}

- (BOOL)getPlayActivityEvents:(id *)a3 relevantRevisionsIndexSet:(id *)a4 withStartRevision:(unint64_t)a5 endRevision:(unint64_t)a6 storeAccountID:(unint64_t)a7 additionalRevisionsIndexSet:(id)a8 ignoredRevisionsIndexSet:(id)a9 error:(id *)a10
{
  return [(SSVPlayActivityTable *)self _getPlayActivityEvents:a3 relevantRevisionsIndexSet:a4 withStartRevision:a5 endRevision:a6 storeAccountID:a7 shouldFilterStoreAccountID:1 additionalRevisionsIndexSet:a8 ignoredRevisionsIndexSet:a9 error:a10];
}

- (BOOL)removePlayActivityEventsUpToRevision:(unint64_t)a3 returningError:(id *)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  id v7 = [(id)objc_opt_class() _eventsDatabaseTableName];
  id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"DELETE FROM %@ WHERE %@ <= ?;",
                 v7,
                 @"revision_id");
  database = self->_database;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__SSVPlayActivityTable_removePlayActivityEventsUpToRevision_returningError___block_invoke;
  v14[3] = &unk_1E5BAEF30;
  uint64_t v16 = &v18;
  unint64_t v17 = a3;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v10 cache:0 usingBlock:v14];
  if (!*((unsigned char *)v19 + 24))
  {
    uint64_t v11 = SSError(@"SSErrorDomain", 100, 0, 0);
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v11 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v11;
LABEL_4:
  char v12 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __76__SSVPlayActivityTable_removePlayActivityEventsUpToRevision_returningError___block_invoke(void *a1, sqlite3_stmt *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  sqlite3_bind_int64(a2, 1, a1[7]);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = +[SSSQLiteDatabase statementDidFinishAfterStepping:a2];
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4)
    {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (v6)
    {
      id v8 = objc_opt_class();
      uint64_t v9 = a1[5];
      *(_DWORD *)v35 = 138412546;
      *(void *)&v35[4] = v8;
      *(_WORD *)&v35[12] = 2112;
      *(void *)&v35[14] = v9;
      id v10 = v8;
      LODWORD(v34) = 22;
      id v33 = v35;
      uint64_t v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v35, v34, *(_OWORD *)v35, *(void *)&v35[16], v36);
      free(v11);
      SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
    }

    goto LABEL_13;
  }
LABEL_14:
  int v18 = objc_msgSend(*(id *)(a1[4] + 8), "countChanges", v33);
  uint64_t v19 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v19)
  {
    uint64_t v19 = +[SSLogConfig sharedConfig];
  }
  int v20 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  uint64_t v22 = [v19 OSLogObject];
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
    v21 &= 2u;
  }
  if (!v21) {
    goto LABEL_24;
  }
  v23 = objc_opt_class();
  int v24 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  *(_DWORD *)v35 = 138412802;
  *(void *)&v35[4] = v23;
  *(_WORD *)&v35[12] = 1024;
  *(_DWORD *)&v35[14] = v24;
  *(_WORD *)&v35[18] = 1024;
  *(_DWORD *)&v35[20] = v18;
  id v25 = v23;
  LODWORD(v34) = 24;
  v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, v35, v34);
    free(v26);
    SSFileLog(v19, @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v22);
LABEL_24:
  }
}

- (id)revisionsIndexSetForPlayActivityEvents:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SSVPlayActivityTable_revisionsIndexSetForPlayActivityEvents___block_invoke;
  v8[3] = &unk_1E5BAEF58;
  id v9 = v4;
  id v5 = v4;
  int v6 = -[SSVPlayActivityTable _revisionsIndexSetUsingPersisentIDGenerationBlock:count:](self, "_revisionsIndexSetUsingPersisentIDGenerationBlock:count:", v8, [v5 count]);

  return v6;
}

uint64_t __63__SSVPlayActivityTable_revisionsIndexSetForPlayActivityEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectAtIndex:a2];
  uint64_t v3 = [v2 persistentID];

  return v3;
}

- (id)revisionsIndexSetForPlayActivityEventPersistentIDs:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__SSVPlayActivityTable_revisionsIndexSetForPlayActivityEventPersistentIDs___block_invoke;
  v8[3] = &unk_1E5BAEF58;
  id v9 = v4;
  id v5 = v4;
  int v6 = -[SSVPlayActivityTable _revisionsIndexSetUsingPersisentIDGenerationBlock:count:](self, "_revisionsIndexSetUsingPersisentIDGenerationBlock:count:", v8, [v5 count]);

  return v6;
}

uint64_t __75__SSVPlayActivityTable_revisionsIndexSetForPlayActivityEventPersistentIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectAtIndex:a2];
  uint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

+ (id)_eventsDatabaseTableName
{
  return @"events";
}

+ (id)_propertiesDatabaseTableName
{
  return @"properties";
}

+ (BOOL)_setupDatabase:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v24 = 0;
    goto LABEL_39;
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  id v5 = [a1 _eventsDatabaseTableName];
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY, %@ INTEGER, %@ INTEGER, %@ BLOB);",
    v5,
    @"pid",
    @"revision_id",
    @"store_account_id",
  int v6 = @"event_data");
  id v7 = [a1 _propertiesDatabaseTableName];
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS %@ (%@ TEXT PRIMARY KEY, %@ TEXT);",
    v7,
    @"key",
  id v8 = @"value");
  char v9 = [v4 executeSQL:@"PRAGMA legacy_file_format = 0;"];
  *((unsigned char *)v39 + 24) = v9;
  if ((v9 & 1) == 0) {
    goto LABEL_37;
  }
  int v10 = [v4 executeSQL:@"PRAGMA journal_mode=WAL;"];
  *((unsigned char *)v39 + 24) = v10;
  if (!v10) {
    goto LABEL_37;
  }
  int v11 = [v4 executeSQL:v6];
  *((unsigned char *)v39 + 24) = v11;
  if (!v11) {
    goto LABEL_37;
  }
  int v12 = [v4 executeSQL:v8];
  *((unsigned char *)v39 + 24) = v12;
  if (!v12) {
    goto LABEL_37;
  }
  uint64_t v13 = [v4 userVersion];
  if (!v13)
  {
    if (*((unsigned char *)v39 + 24))
    {
      uint64_t v33 = 2005;
      goto LABEL_33;
    }
    goto LABEL_37;
  }
  uint64_t v14 = v39;
  if (v13 < 1)
  {
    uint64_t v33 = v13;
    if (*((unsigned char *)v39 + 24)) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  char v15 = 0;
  if (!*((unsigned char *)v39 + 24))
  {
    uint64_t v16 = v13;
    goto LABEL_31;
  }
  uint64_t v16 = v13;
  if ((unint64_t)v13 > 0x7D4) {
    goto LABEL_31;
  }
  char v15 = 0;
  LOBYTE(v17) = 1;
  while (1)
  {
    uint64_t v18 = v16;
    if ((unint64_t)(v16 - 2000) > 4) {
      goto LABEL_18;
    }
    uint64_t v19 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@;", v7];
    char v20 = [v4 executeSQL:v19];
    *((unsigned char *)v39 + 24) = v20;

    uint64_t v14 = v39;
    if (!*((unsigned char *)v39 + 24)) {
      break;
    }
    int v21 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@;", v5];
    char v22 = [v4 executeSQL:v21];
    *((unsigned char *)v39 + 24) = v22;

    uint64_t v14 = v39;
    if (!*((unsigned char *)v39 + 24)) {
      goto LABEL_28;
    }
    int v23 = [v4 executeSQL:v6];
    uint64_t v14 = v39;
    *((unsigned char *)v39 + 24) = v23;
    if (!v23) {
      goto LABEL_29;
    }
    int v17 = [v4 executeSQL:v8];
    uint64_t v14 = v39;
    *((unsigned char *)v39 + 24) = v17;
    if (v17) {
      uint64_t v18 = 2005;
    }
    char v15 = 1;
LABEL_18:
    if (!(_BYTE)v17) {
      goto LABEL_30;
    }
    uint64_t v16 = v18;
    if (v18 >= 2005) {
      goto LABEL_31;
    }
  }
  *((unsigned char *)v39 + 24) = 0;
LABEL_28:
  *((unsigned char *)v14 + 24) = 0;
LABEL_29:
  *((unsigned char *)v14 + 24) = 0;
  char v15 = 1;
LABEL_30:
  uint64_t v16 = v18;
LABEL_31:
  uint64_t v33 = v16;
  if (*((unsigned char *)v14 + 24))
  {
    if ((v15 & 1) == 0) {
      goto LABEL_36;
    }
LABEL_33:
    id v25 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v26 = [v25 UUIDString];
    uint64_t v27 = (void *)v26;
    uint64_t v28 = &stru_1EF96DA90;
    if (v26) {
      uint64_t v28 = (__CFString *)v26;
    }
    uint64_t v32 = v28;

    objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR IGNORE INTO %@ (%@, %@) VALUES (?, ?);",
      v7,
      @"key",
    uint64_t v29 = @"value");
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __39__SSVPlayActivityTable__setupDatabase___block_invoke;
    v34[3] = &unk_1E5BAEF80;
    uint64_t v30 = v32;
    v35 = v30;
    uint64_t v36 = @"events_revision_version_token";
    BOOL v37 = &v38;
    [v4 prepareStatementForSQL:v29 cache:0 usingBlock:v34];

    if (*((unsigned char *)v39 + 24))
    {
LABEL_36:
      [v4 setUserVersion:v33];
      BOOL v24 = 1;
      goto LABEL_38;
    }
  }
LABEL_37:
  BOOL v24 = 0;
LABEL_38:

  _Block_object_dispose(&v38, 8);
LABEL_39:

  return v24;
}

BOOL __39__SSVPlayActivityTable__setupDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 40) UTF8String], objc_msgSend(*(id *)(a1 + 40), "length"), 0);
  sqlite3_bind_text(a2, 2, (const char *)[*(id *)(a1 + 32) UTF8String], objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  BOOL result = +[SSSQLiteDatabase statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_getPlayActivityEvents:(id *)a3 relevantRevisionsIndexSet:(id *)a4 withStartRevision:(unint64_t)a5 endRevision:(unint64_t)a6 storeAccountID:(unint64_t)a7 shouldFilterStoreAccountID:(BOOL)a8 additionalRevisionsIndexSet:(id)a9 ignoredRevisionsIndexSet:(id)a10 error:(id *)a11
{
  BOOL v11 = a8;
  id v33 = a9;
  id v18 = a10;
  uint64_t v19 = v18;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    uint64_t v32 = v18;
    unint64_t v29 = a5;
    unint64_t v30 = a7;
    unint64_t v31 = a6;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__88;
    v57 = __Block_byref_object_dispose__88;
    id v58 = 0;
    char v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT "];
    int v21 = v20;
    if (a3)
    {
      uint64_t v22 = 0;
      do
      {
        if (v22 > 3) {
          int v23 = 0;
        }
        else {
          int v23 = off_1E5BAF0D0[v22];
        }
        if (v22 == 3) {
          BOOL v24 = &stru_1EF96DA90;
        }
        else {
          BOOL v24 = @",";
        }
        [v21 appendFormat:@"%@%@", v23, v24];
        ++v22;
      }
      while (v22 != 4);
    }
    else
    {
      [v20 appendFormat:@"%@", @"revision_id"];
    }
    id v25 = [(id)objc_opt_class() _eventsDatabaseTableName];
    objc_msgSend(v21, "appendFormat:", @" FROM %@ WHERE ("), v25;
    if (v11) {
      objc_msgSend(v21, "appendFormat:", @"(%@ == ?) AND ("), CFSTR("store_account_id");
    }
    [v21 appendFormat:@"%@ BETWEEN ? AND ?", @"revision_id"];
    uint64_t v26 = [v33 count];
    if (v26)
    {
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke;
      v51[3] = &unk_1E5BAEFA8;
      id v52 = v21;
      [v33 enumerateRangesUsingBlock:v51];
    }
    if (v11) {
      [v21 appendString:@""]);
    }
    [v21 appendString:@" ORDER BY "]);
    if (v11) {
      [v21 appendFormat:@"%@,%@ ASC;", @"store_account_id", @"revision_id"];
    }
    else {
      [v21 appendFormat:@"%@ ASC;", @"revision_id"];
    }
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__88;
    v49 = __Block_byref_object_dispose__88;
    id v50 = 0;
    database = self->_database;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke_2;
    v34[3] = &unk_1E5BAEFF8;
    BOOL v44 = v11;
    unint64_t v39 = v30;
    unint64_t v40 = v29;
    unint64_t v41 = v31;
    id v35 = v33;
    v42 = a3;
    uint64_t v19 = v32;
    id v36 = v32;
    BOOL v37 = &v53;
    v43 = a4;
    uint64_t v38 = &v45;
    [(SSSQLiteDatabase *)database prepareStatementForSQL:v21 cache:v26 == 0 usingBlock:v34];
    if (a11) {
      *a11 = 0;
    }
    if (a3) {
      *a3 = (id) v46[5];
    }
    if (a4) {
      *a4 = (id) v54[5];
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v53, 8);
  }
  return 1;
}

uint64_t __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(result + 32) appendFormat:@" OR %@ BETWEEN ? AND ?", @"revision_id"];
  }
  return result;
}

void __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v28 = 0;
  unint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v4 = 1;
  int v31 = 1;
  if (*(unsigned char *)(a1 + 104))
  {
    int v31 = 2;
    sqlite3_bind_int64(a2, 1, *(void *)(a1 + 64));
    id v5 = (int *)(v29 + 3);
    int v4 = *((_DWORD *)v29 + 6);
  }
  else
  {
    id v5 = &v31;
  }
  int *v5 = v4 + 1;
  sqlite3_bind_int64(a2, v4, *(void *)(a1 + 72));
  int v6 = *((_DWORD *)v29 + 6);
  *((_DWORD *)v29 + 6) = v6 + 1;
  sqlite3_bind_int64(a2, v6, *(void *)(a1 + 80));
  id v7 = *(void **)(a1 + 32);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke_3;
  v27[3] = &unk_1E5BAEFD0;
  v27[4] = &v28;
  v27[5] = a2;
  [v7 enumerateRangesUsingBlock:v27];
  while (+[SSSQLiteDatabase statementHasRowAfterStepping:a2])
  {
    if (*(void *)(a1 + 88))
    {
      if (sqlite3_column_type(a2, 1) == 1)
      {
        sqlite3_int64 v8 = sqlite3_column_int64(a2, 1);
        if ([*(id *)(a1 + 40) containsIndex:v8])
        {
          int v9 = 0;
        }
        else
        {
          int v9 = 1;
          if (*(void *)(a1 + 96) && v8)
          {
            int v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            if (!v23)
            {
              id v24 = objc_alloc_init(MEMORY[0x1E4F28E60]);
              uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
              uint64_t v26 = *(void **)(v25 + 40);
              *(void *)(v25 + 40) = v24;

              int v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            }
            [v23 addIndex:v8];
          }
        }
      }
      else
      {
        int v9 = 1;
      }
      if (sqlite3_column_type(a2, 3) != 4)
      {
        int v17 = 0;
        if (!v9) {
          goto LABEL_30;
        }
LABEL_24:
        if ([v17 length])
        {
          id v18 = [[SSVPlayActivityEvent alloc] initWithDataRepresentation:v17];
          if (v18)
          {
            uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            if (!v19)
            {
              uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
              uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
              uint64_t v22 = *(void **)(v21 + 40);
              *(void *)(v21 + 40) = v20;

              uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            }
            [v19 addObject:v18];
          }
        }
        goto LABEL_30;
      }
      char v15 = sqlite3_column_blob(a2, 3);
      int v16 = sqlite3_column_bytes(a2, 3);
      int v17 = 0;
      if (v16 >= 1 && v15) {
        int v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v15 length:v16];
      }
      if (v9) {
        goto LABEL_24;
      }
LABEL_30:
    }
    else if (sqlite3_column_type(a2, 0) == 1)
    {
      sqlite3_int64 v10 = sqlite3_column_int64(a2, 0);
      if (v10)
      {
        if (([*(id *)(a1 + 40) containsIndex:v10] & 1) == 0)
        {
          BOOL v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          if (!v11)
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v14 = *(void **)(v13 + 40);
            *(void *)(v13 + 40) = v12;

            BOOL v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          }
          [v11 addIndex:v10];
        }
      }
    }
  }
  _Block_object_dispose(&v28, 8);
}

uint64_t __204__SSVPlayActivityTable__getPlayActivityEvents_relevantRevisionsIndexSet_withStartRevision_endRevision_storeAccountID_shouldFilterStoreAccountID_additionalRevisionsIndexSet_ignoredRevisionsIndexSet_error___block_invoke_3(uint64_t result, sqlite3_int64 a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = result;
    int v6 = *(sqlite3_stmt **)(result + 40);
    uint64_t v7 = *(void *)(*(void *)(v5 + 32) + 8);
    int v8 = *(_DWORD *)(v7 + 24);
    *(_DWORD *)(v7 + 24) = v8 + 1;
    sqlite3_bind_int64(v6, v8, a2);
    int v9 = *(sqlite3_stmt **)(v5 + 40);
    uint64_t v10 = *(void *)(*(void *)(v5 + 32) + 8);
    int v11 = *(_DWORD *)(v10 + 24);
    *(_DWORD *)(v10 + 24) = v11 + 1;
    return sqlite3_bind_int64(v9, v11, a3 + a2 - 1);
  }
  return result;
}

- (id)_revisionsIndexSetUsingPersisentIDGenerationBlock:(id)a3 count:(unint64_t)a4
{
  id v6 = a3;
  id v7 = 0;
  if (v6 && a4)
  {
    int v8 = [(id)objc_opt_class() _eventsDatabaseTableName];
    int v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"SELECT DISTINCT %@ FROM %@ WHERE %@ IN ("), CFSTR("revision_id"), v8, CFSTR("pid");
    unint64_t v10 = 0;
    do
    {
      if (v10 >= a4 - 1) {
        int v11 = &stru_1EF96DA90;
      }
      else {
        int v11 = @",";
      }
      [v9 appendFormat:@"?%@", v11];
      ++v10;
    }
    while (a4 != v10);
    [v9 appendString:@";"]);
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__88;
    uint64_t v22 = __Block_byref_object_dispose__88;
    id v23 = 0;
    database = self->_database;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__SSVPlayActivityTable__revisionsIndexSetUsingPersisentIDGenerationBlock_count___block_invoke;
    v14[3] = &unk_1E5BAF020;
    unint64_t v17 = a4;
    id v15 = v6;
    int v16 = &v18;
    [(SSSQLiteDatabase *)database prepareStatementForSQL:v9 cache:0 usingBlock:v14];
    id v7 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }

  return v7;
}

BOOL __80__SSVPlayActivityTable__revisionsIndexSetUsingPersisentIDGenerationBlock_count___block_invoke(void *a1, sqlite3_stmt *a2)
{
  if (a1[6])
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = v4 + 1;
      sqlite3_int64 v6 = (*(uint64_t (**)(void))(a1[4] + 16))();
      sqlite3_bind_int64(a2, v5, v6);
      unint64_t v4 = v5;
    }
    while (v5 < a1[6]);
  }
  for (BOOL result = +[SSSQLiteDatabase statementHasRowAfterStepping:a2];
        result;
        BOOL result = +[SSSQLiteDatabase statementHasRowAfterStepping:a2])
  {
    if (sqlite3_column_type(a2, 0) == 1)
    {
      sqlite3_int64 v8 = sqlite3_column_int64(a2, 0);
      if (v8)
      {
        sqlite3_int64 v9 = v8;
        unint64_t v10 = *(void **)(*(void *)(a1[5] + 8) + 40);
        if (!v10)
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
          uint64_t v12 = *(void *)(a1[5] + 8);
          uint64_t v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          unint64_t v10 = *(void **)(*(void *)(a1[5] + 8) + 40);
        }
        [v10 addIndex:v9];
      }
    }
  }
  return result;
}

- (BOOL)_setValue:(id)a3 forDatabasePropertyKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v28 = 0;
    unint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    sqlite3_int64 v8 = [(id)objc_opt_class() _propertiesDatabaseTableName];
    if (v6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR REPLACE INTO %@ (%@, %@) VALUES (?, ?);",
        v8,
        @"key",
      sqlite3_int64 v9 = @"value");
      database = self->_database;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __57__SSVPlayActivityTable__setValue_forDatabasePropertyKey___block_invoke;
      v22[3] = &unk_1E5BAF048;
      id v23 = v6;
      uint64_t v27 = &v28;
      id v24 = v7;
      uint64_t v25 = self;
      id v11 = v9;
      id v26 = v11;
      [(SSSQLiteDatabase *)database prepareStatementForSQL:v11 cache:1 usingBlock:v22];
      uint64_t v12 = &v23;

      uint64_t v13 = v24;
    }
    else
    {
      id v15 = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v8, @"key"];;
      int v16 = self->_database;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __57__SSVPlayActivityTable__setValue_forDatabasePropertyKey___block_invoke_148;
      v18[3] = &unk_1E5BAF070;
      uint64_t v21 = &v28;
      v19[0] = v7;
      v19[1] = self;
      id v11 = v15;
      id v20 = v11;
      [(SSSQLiteDatabase *)v16 prepareStatementForSQL:v11 cache:1 usingBlock:v18];
      uint64_t v12 = (id *)v19;
      uint64_t v13 = v20;
    }

    BOOL v14 = *((unsigned char *)v29 + 24) != 0;
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

void __57__SSVPlayActivityTable__setValue_forDatabasePropertyKey___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 40) UTF8String], objc_msgSend(*(id *)(a1 + 40), "length"), 0);
  sqlite3_bind_text(a2, 2, (const char *)[*(id *)(a1 + 32) UTF8String], objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = +[SSSQLiteDatabase statementDidFinishAfterStepping:a2];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    unint64_t v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4)
    {
      unint64_t v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (v6)
    {
      sqlite3_int64 v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 56);
      *(_DWORD *)uint64_t v19 = 138412546;
      *(void *)&v19[4] = v8;
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = v9;
      id v10 = v8;
      LODWORD(v18) = 22;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        return;
      }
      id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v19, v18, *(_OWORD *)v19, *(void *)&v19[16], v20);
      free(v11);
      SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
    }

    goto LABEL_13;
  }
}

void __57__SSVPlayActivityTable__setValue_forDatabasePropertyKey___block_invoke_148(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = +[SSSQLiteDatabase statementDidFinishAfterStepping:a2];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    unint64_t v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4)
    {
      unint64_t v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (v6)
    {
      sqlite3_int64 v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)uint64_t v19 = 138412546;
      *(void *)&v19[4] = v8;
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = v9;
      id v10 = v8;
      LODWORD(v18) = 22;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        return;
      }
      id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v19, v18, *(_OWORD *)v19, *(void *)&v19[16], v20);
      free(v11);
      SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
    }

    goto LABEL_13;
  }
}

- (id)_valueForDatabasePropertyKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__88;
    uint64_t v17 = __Block_byref_object_dispose__88;
    id v18 = 0;
    int v5 = [(id)objc_opt_class() _propertiesDatabaseTableName];
    objc_msgSend(NSString, "stringWithFormat:", @"SELECT %@ FROM %@ WHERE %@ = ?;",
      @"value",
      v5,
    int v6 = @"key");
    database = self->_database;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__SSVPlayActivityTable__valueForDatabasePropertyKey___block_invoke;
    v10[3] = &unk_1E5BAF098;
    id v11 = v4;
    uint64_t v12 = &v13;
    [(SSSQLiteDatabase *)database prepareStatementForSQL:v6 cache:1 usingBlock:v10];
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __53__SSVPlayActivityTable__valueForDatabasePropertyKey___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  if (+[SSSQLiteDatabase statementHasRowAfterStepping:a2]&& sqlite3_column_type(a2, 0) == 3)
  {
    id v4 = sqlite3_column_text(a2, 0);
    int v5 = v4 ? (void *)[[NSString alloc] initWithUTF8String:v4] : 0;
    id v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
    if (v4)
    {
    }
  }
}

- (void).cxx_destruct
{
}

@end