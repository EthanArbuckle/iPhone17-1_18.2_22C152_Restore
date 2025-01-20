@interface SSMetricsEventTable
+ (id)_eventsTableName;
+ (id)databasePath;
- (BOOL)_migrateToVersion1;
- (BOOL)_migrateToVersion2;
- (BOOL)_migrateToVersion3;
- (BOOL)_setupDatabase;
- (id)_pragmaValueForName:(id)a3;
- (void)performTransactionWithBlock:(id)a3;
@end

@implementation SSMetricsEventTable

- (void)performTransactionWithBlock:(id)a3
{
  id v4 = a3;
  database = self->super._database;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SSMetricsEventTable_performTransactionWithBlock___block_invoke;
  v7[3] = &unk_1E5BA7328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SSSQLiteDatabase *)database dispatchBlockSync:v7];
}

void __51__SSMetricsEventTable_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v23.receiver = *(id *)(a1 + 32);
  v23.super_class = (Class)SSMetricsEventTable;
  objc_msgSendSuper2(&v23, sel_performTransactionWithBlock_, v2);
  v3 = [*(id *)(a1 + 32) _pragmaValueForName:@"freelist_count"];
  uint64_t v4 = [v3 integerValue];

  if (v4 < 501) {
    return;
  }
  v5 = [*(id *)(a1 + 32) _pragmaValueForName:@"auto_vacuum"];
  uint64_t v6 = [v5 integerValue];

  v7 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v7)
  {
    v7 = +[SSLogConfig sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_12;
  }
  v11 = objc_opt_class();
  int v24 = 138543874;
  v25 = v11;
  __int16 v26 = 2048;
  uint64_t v27 = v4;
  __int16 v28 = 2048;
  uint64_t v29 = v6;
  id v12 = v11;
  LODWORD(v22) = 32;
  v21 = &v24;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v24, v22);
    free(v13);
    SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v10);
LABEL_12:
  }
  if (v6)
  {
    if (v6 != 2) {
      return;
    }
    v20 = @"PRAGMA incremental_vacuum(500);";
  }
  else
  {
    v20 = @"VACUUM;";
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "executeSQL:", v20, v21);
}

+ (id)databasePath
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Caches", @"com.apple.storeServices.analytics", @"eventsTable_v1", 0);
  v3 = [NSString pathWithComponents:v2];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"eventsTable_v1"];
  v5 = [v4 stringByAppendingPathExtension:@"db"];

  return v5;
}

+ (id)_eventsTableName
{
  return +[SSMetricsEventTableEntity databaseTable];
}

- (BOOL)_migrateToVersion1
{
  v3 = [(id)objc_opt_class() _eventsTableName];
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER, %@ TEXT,%@ BLOB, %@ REAL, %@ INTEGER, PRIMARY KEY (%@));",
    v3,
    @"pid",
    @"report_url",
    @"eventBody",
    @"timestampInserted",
    @"timestampReported",
  uint64_t v4 = @"pid");
  if (![(SSSQLiteDatabase *)self->super._database executeSQL:@"PRAGMA legacy_file_format = 0;"]) {
    goto LABEL_7;
  }
  if (![(SSSQLiteDatabase *)self->super._database executeSQL:@"PRAGMA journal_mode=WAL;"]) {
    goto LABEL_7;
  }
  if (![(SSSQLiteDatabase *)self->super._database executeSQL:v4]) {
    goto LABEL_7;
  }
  database = self->super._database;
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS %@_%@ ON %@ (%@);",
    v3,
    @"report_url",
    v3,
  uint64_t v6 = @"report_url");
  LODWORD(database) = [(SSSQLiteDatabase *)database executeSQL:v6];

  if (!database) {
    goto LABEL_7;
  }
  v7 = self->super._database;
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS %@_%@ ON %@ (%@);",
    v3,
    @"timestampInserted",
    v3,
  int v8 = @"timestampInserted");
  LODWORD(v7) = [(SSSQLiteDatabase *)v7 executeSQL:v8];

  if (v7)
  {
    int v9 = self->super._database;
    objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS %@_%@ ON %@ (%@);",
      v3,
      @"timestampReported",
      v3,
    v10 = @"timestampReported");
    BOOL v11 = [(SSSQLiteDatabase *)v9 executeSQL:v10];
  }
  else
  {
LABEL_7:
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_migrateToVersion2
{
  v3 = [(id)objc_opt_class() _eventsTableName];
  objc_msgSend(NSString, "stringWithFormat:", @"ALTER TABLE %@ ADD COLUMN %@ INTEGER DEFAULT 0;",
    v3,
  uint64_t v4 = @"supressDsid");
  LOBYTE(self) = [(SSSQLiteDatabase *)self->super._database executeSQL:v4];

  return (char)self;
}

- (BOOL)_migrateToVersion3
{
  v3 = [(id)objc_opt_class() _eventsTableName];
  if ([(SSSQLiteDatabase *)self->super._database columnName:@"supressDsid" existsInTable:v3])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ALTER TABLE %@ ADD COLUMN %@ INTEGER DEFAULT 0;",
      v3,
    v5 = @"supressDsid");
    BOOL v4 = [(SSSQLiteDatabase *)self->super._database executeSQL:v5];
    if (v4
      && [(SSSQLiteDatabase *)self->super._database columnName:@"suppressUserInfo" existsInTable:v3])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UPDATE %@ SET %@ = %@;",
        v3,
        @"supressDsid",
      uint64_t v6 = @"suppressUserInfo");
      [(SSSQLiteDatabase *)self->super._database executeSQL:v6];
    }
  }

  return v4;
}

- (BOOL)_setupDatabase
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SSSQLiteDatabase *)self->super._database userVersion];
  BOOL v4 = &off_1E5BA6000;
  v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5)
  {
    v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  int v9 = [NSNumber numberWithInteger:v3];
  int v47 = 138412290;
  v48 = v9;
  LODWORD(v46) = 12;
  v45 = &v47;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v47, v46);
    free(v10);
    SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_11:
  }
  [(SSSQLiteDatabase *)self->super._database executeSQL:@"PRAGMA auto_vacuum = 2;"];
  if (v3 == 3) {
    return 1;
  }
  BOOL v17 = v3 < 3;
  if (v3 > 2)
  {
LABEL_38:
    -[SSSQLiteDatabase setUserVersion:](self->super._database, "setUserVersion:", 3, v45);
    return v17;
  }
  char v18 = 0;
  while (1)
  {
    if (v3 == 2)
    {
      uint64_t v3 = 3;
      if (![(SSMetricsEventTable *)self _migrateToVersion3]) {
        goto LABEL_39;
      }
      goto LABEL_26;
    }
    if (v3 != 1) {
      break;
    }
    uint64_t v3 = 2;
    if (![(SSMetricsEventTable *)self _migrateToVersion2]) {
      goto LABEL_39;
    }
LABEL_26:
    uint64_t v19 = objc_msgSend(v4[244], "sharedStoreServicesConfig", v45, v46);
    if (!v19)
    {
      uint64_t v19 = [v4[244] sharedConfig];
    }
    v20 = v4;
    int v21 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    objc_super v23 = [v19 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      v22 &= 2u;
    }
    if (!v22) {
      goto LABEL_36;
    }
    int v24 = [NSNumber numberWithInteger:v3];
    int v47 = 138412290;
    v48 = v24;
    LODWORD(v46) = 12;
    v45 = &v47;
    v25 = (void *)_os_log_send_and_compose_impl();

    if (v25)
    {
      objc_super v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v47, v46);
      free(v25);
      SSFileLog(v19, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v23);
LABEL_36:
    }
    char v18 = 1;
    BOOL v4 = v20;
    if (v3 >= 3) {
      goto LABEL_38;
    }
  }
  if (!v3)
  {
    uint64_t v3 = 1;
    if (![(SSMetricsEventTable *)self _migrateToVersion1]) {
      goto LABEL_39;
    }
    goto LABEL_26;
  }
  if (v18) {
    goto LABEL_26;
  }
LABEL_39:
  v32 = objc_msgSend(v4[244], "sharedStoreServicesConfig", v45);
  if (!v32)
  {
    v32 = [v4[244] sharedConfig];
  }
  int v33 = [v32 shouldLog];
  if ([v32 shouldLogToDisk]) {
    int v34 = v33 | 2;
  }
  else {
    int v34 = v33;
  }
  v35 = [v32 OSLogObject];
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
    v34 &= 2u;
  }
  if (v34)
  {
    v36 = [NSNumber numberWithInteger:v3];
    int v47 = 138412290;
    v48 = v36;
    LODWORD(v46) = 12;
    v37 = (void *)_os_log_send_and_compose_impl();

    if (v37)
    {
      v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v47, v46);
      free(v37);
      SSFileLog(v32, @"%@", v38, v39, v40, v41, v42, v43, (uint64_t)v35);
      goto LABEL_49;
    }
  }
  else
  {
LABEL_49:
  }
  return 0;
}

- (id)_pragmaValueForName:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__81;
  uint64_t v14 = __Block_byref_object_dispose__81;
  id v15 = 0;
  v5 = (void *)[[NSString alloc] initWithFormat:@"PRAGMA %@;", v4];
  database = self->super._database;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SSMetricsEventTable__pragmaValueForName___block_invoke;
  v9[3] = &unk_1E5BAE7A0;
  v9[4] = &v10;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v5 cache:0 usingBlock:v9];
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __43__SSMetricsEventTable__pragmaValueForName___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  if (+[SSSQLiteDatabase statementHasRowAfterStepping:a2])
  {
    uint64_t v4 = SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    int v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

@end