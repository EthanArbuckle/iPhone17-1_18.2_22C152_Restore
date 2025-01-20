@interface SSAppPurchaseHistoryDatabase
+ (BOOL)_setupDatabase:(id)a3;
+ (id)accountUniqueIdentifierKey;
+ (id)newDefaultInstance;
+ (void)_createDatabaseDirectory;
- (BOOL)removeValueForDatabaseProperty:(id)a3;
- (BOOL)resetCacheForNewAccountID:(id)a3;
- (BOOL)setCurrentAccountUniqueIdentifier:(id)a3;
- (BOOL)setLocalRevision:(int64_t)a3 forAccountUniqueIdentifier:(id)a4;
- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4;
- (SSAppPurchaseHistoryDatabase)init;
- (SSAppPurchaseHistoryDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4;
- (id)allProperties:(id)a3 accountID:(id)a4 includingHidden:(BOOL)a5;
- (id)currentAccountUniqueIdentifier;
- (id)database;
- (id)valueForDatabaseProperty:(id)a3;
- (int64_t)localRevisionForAccountUniqueIdentifier:(id)a3;
- (void)dealloc;
- (void)modifyUsingAppPurchaseHistoryTransactionBlock:(id)a3;
- (void)readAsyncUsingTransactionBlock:(id)a3;
- (void)readUsingTransactionBlock:(id)a3;
@end

@implementation SSAppPurchaseHistoryDatabase

- (SSAppPurchaseHistoryDatabase)init
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", +[SSAppPurchaseHistoryDatabaseSchema databasePath](SSAppPurchaseHistoryDatabaseSchema, "databasePath"), 0);
  return [(SSAppPurchaseHistoryDatabase *)self initWithDatabaseURL:v3 readOnly:1];
}

- (SSAppPurchaseHistoryDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SSAppPurchaseHistoryDatabase;
  v6 = [(SSAppPurchaseHistoryDatabase *)&v10 init];
  if (v6)
  {
    +[SSAppPurchaseHistoryDatabase _createDatabaseDirectory];
    v7 = [SSSQLiteDatabase alloc];
    v8 = [(SSSQLiteDatabase *)v7 initWithDatabaseURL:a3 readOnly:v4 protectionType:*MEMORY[0x1E4F28358]];
    v6->_database = v8;
    if (!v4) {
      [(SSSQLiteDatabase *)v8 setSetupBlock:&__block_literal_global_34];
    }
  }
  return v6;
}

BOOL __61__SSAppPurchaseHistoryDatabase_initWithDatabaseURL_readOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SSAppPurchaseHistoryDatabase _setupDatabase:a2];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSAppPurchaseHistoryDatabase;
  [(SSAppPurchaseHistoryDatabase *)&v3 dealloc];
}

+ (id)newDefaultInstance
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", +[SSAppPurchaseHistoryDatabaseSchema databasePath](SSAppPurchaseHistoryDatabaseSchema, "databasePath"), 0);
  objc_super v3 = [SSAppPurchaseHistoryDatabase alloc];
  return [(SSAppPurchaseHistoryDatabase *)v3 initWithDatabaseURL:v2 readOnly:0];
}

- (void)modifyUsingAppPurchaseHistoryTransactionBlock:(id)a3
{
  database = self->_database;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__SSAppPurchaseHistoryDatabase_modifyUsingAppPurchaseHistoryTransactionBlock___block_invoke;
  v4[3] = &unk_1E5BACD50;
  v4[4] = self;
  v4[5] = a3;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v4];
}

uint64_t __78__SSAppPurchaseHistoryDatabase_modifyUsingAppPurchaseHistoryTransactionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A6267F60]();
  objc_super v3 = [[SSAppPurchaseHistoryTransaction alloc] initWithDatabase:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v4;
}

- (void)readAsyncUsingTransactionBlock:(id)a3
{
  database = self->_database;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SSAppPurchaseHistoryDatabase_readAsyncUsingTransactionBlock___block_invoke;
  v4[3] = &unk_1E5BAA2E0;
  v4[4] = self;
  v4[5] = a3;
  [(SSSQLiteDatabase *)database dispatchBlockAsync:v4];
}

uint64_t __63__SSAppPurchaseHistoryDatabase_readAsyncUsingTransactionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) readUsingTransactionBlock:*(void *)(a1 + 40)];
}

- (void)readUsingTransactionBlock:(id)a3
{
  database = self->_database;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SSAppPurchaseHistoryDatabase_readUsingTransactionBlock___block_invoke;
  v4[3] = &unk_1E5BACD50;
  v4[4] = self;
  v4[5] = a3;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v4];
}

uint64_t __58__SSAppPurchaseHistoryDatabase_readUsingTransactionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A6267F60]();
  objc_super v3 = [[SSAppPurchaseHistoryTransaction alloc] initWithDatabase:*(void *)(*(void *)(a1 + 32) + 8)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return 1;
}

- (id)currentAccountUniqueIdentifier
{
  id result = [(SSAppPurchaseHistoryDatabase *)self valueForDatabaseProperty:+[SSAppPurchaseHistoryDatabase accountUniqueIdentifierKey]];
  if (result)
  {
    objc_super v3 = NSNumber;
    uint64_t v4 = [result longLongValue];
    return (id)[v3 numberWithLongLong:v4];
  }
  return result;
}

- (BOOL)setCurrentAccountUniqueIdentifier:(id)a3
{
  if (a3) {
    -[SSAppPurchaseHistoryDatabase setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", [a3 stringValue], +[SSAppPurchaseHistoryDatabase accountUniqueIdentifierKey](SSAppPurchaseHistoryDatabase, "accountUniqueIdentifierKey"));
  }
  else {
    [(SSAppPurchaseHistoryDatabase *)self removeValueForDatabaseProperty:+[SSAppPurchaseHistoryDatabase accountUniqueIdentifierKey]];
  }
  return 1;
}

- (int64_t)localRevisionForAccountUniqueIdentifier:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__SSAppPurchaseHistoryDatabase_localRevisionForAccountUniqueIdentifier___block_invoke;
  v5[3] = &unk_1E5BADE28;
  v5[4] = a3;
  v5[5] = &v6;
  [(SSAppPurchaseHistoryDatabase *)self readUsingTransactionBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__SSAppPurchaseHistoryDatabase_localRevisionForAccountUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"local_revision";
  id v3 = +[SSSQLiteEntity queryWithDatabase:predicate:](SSAppPurchaseHistoryAccount, "queryWithDatabase:predicate:", [a2 database], +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", @"account_unique_identifier", *(void *)(a1 + 32)));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__SSAppPurchaseHistoryDatabase_localRevisionForAccountUniqueIdentifier___block_invoke_2;
  v5[3] = &unk_1E5BACD78;
  v5[4] = *(void *)(a1 + 40);
  [v3 enumeratePersistentIDsAndProperties:v6 count:1 usingBlock:v5];
  return 1;
}

void *__72__SSAppPurchaseHistoryDatabase_localRevisionForAccountUniqueIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void **a3, uint64_t a4, unsigned char *a5)
{
  id result = *a3;
  if (*a3)
  {
    id result = (void *)[result integerValue];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  *a5 = 1;
  return result;
}

- (BOOL)setLocalRevision:(int64_t)a3 forAccountUniqueIdentifier:(id)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __76__SSAppPurchaseHistoryDatabase_setLocalRevision_forAccountUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E5BADE50;
  v6[6] = &v7;
  v6[7] = a3;
  v6[4] = a4;
  v6[5] = self;
  [(SSAppPurchaseHistoryDatabase *)self modifyUsingAppPurchaseHistoryTransactionBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

BOOL __76__SSAppPurchaseHistoryDatabase_setLocalRevision_forAccountUniqueIdentifier___block_invoke(void *a1, void *a2)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  char v4 = [SSAppPurchaseHistoryAccount alloc];
  v24[0] = a1[4];
  v23[0] = @"ROWID";
  v23[1] = @"local_revision";
  v24[1] = [NSNumber numberWithInteger:a1[7]];
  v5 = -[SSSQLiteEntity initWithPropertyValues:inDatabase:](v4, "initWithPropertyValues:inDatabase:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2], objc_msgSend(a2, "database"));
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5 != 0;

  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    return 0;
  }
  id v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v21 = 138412290;
    uint64_t v22 = objc_opt_class();
    LODWORD(v20) = 12;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      char v10 = (void *)v9;
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v21, v20);
      free(v10);
      SSFileLog(v6, @"%@", v12, v13, v14, v15, v16, v17, v11);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SSAppPurchaseHistoryDatabaseLocalRevisionDidChange", 0, 0, 1u);
  return *(unsigned char *)(*(void *)(a1[6] + 8) + 24) != 0;
}

- (BOOL)resetCacheForNewAccountID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__SSAppPurchaseHistoryDatabase_resetCacheForNewAccountID___block_invoke;
  v21[3] = &unk_1E5BADE78;
  v21[5] = self;
  v21[6] = &v22;
  v21[4] = a3;
  [(SSAppPurchaseHistoryDatabase *)self modifyUsingAppPurchaseHistoryTransactionBlock:v21];
  if (*((unsigned char *)v23 + 24))
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    int v5 = [v3 shouldLogToDisk];
    id v6 = [v3 OSLogObject];
    if (v5) {
      v4 |= 2u;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      v4 &= 2u;
    }
    if (v4)
    {
      uint64_t v7 = objc_opt_class();
      int v26 = 138412290;
      uint64_t v27 = v7;
      LODWORD(v20) = 12;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v26, v20);
        free(v9);
        SSFileLog(v3, @"%@", v11, v12, v13, v14, v15, v16, v10);
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SSAppPurchaseHistoryDatabaseLocalRevisionDidChange", 0, 0, 1u);
    BOOL v18 = *((unsigned char *)v23 + 24) != 0;
  }
  else
  {
    BOOL v18 = 0;
  }
  _Block_object_dispose(&v22, 8);
  return v18;
}

BOOL __58__SSAppPurchaseHistoryDatabase_resetCacheForNewAccountID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [NSString stringWithFormat:@"DELETE FROM %@", +[SSAppPurchaseHistoryEntry databaseTable](SSAppPurchaseHistoryEntry, "databaseTable")];
  if ([*(id *)(a1 + 32) longLongValue]) {
    uint64_t v4 = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ != '%@'", +[SSAppPurchaseHistoryEntry databaseTable](SSAppPurchaseHistoryEntry, "databaseTable"), @"account_unique_identifier", *(void *)(a1 + 32)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(a2, "database"), "executeSQL:", v4);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "removeValueForDatabaseProperty:", objc_msgSend((id)objc_opt_class(), "accountUniqueIdentifierKey"));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return 0;
  }
  if ([*(id *)(a1 + 32) longLongValue]) {
    +[SSSQLiteComparisonPredicate predicateWithProperty:@"account_unique_identifier" value:*(void *)(a1 + 32) comparisonType:2];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(+[SSSQLiteEntity queryWithDatabase:predicate:](SSAppPurchaseHistoryAccount, "queryWithDatabase:predicate:", objc_msgSend(a2, "database"), 0), "deleteAllEntities");
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
}

- (id)valueForDatabaseProperty:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__68;
  uint64_t v10 = __Block_byref_object_dispose__68;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SSAppPurchaseHistoryDatabase_valueForDatabaseProperty___block_invoke;
  v5[3] = &unk_1E5BADEC8;
  v5[4] = a3;
  void v5[5] = self;
  void v5[6] = &v6;
  v5[7] = a2;
  [(SSAppPurchaseHistoryDatabase *)self readUsingTransactionBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SSAppPurchaseHistoryDatabase_valueForDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 database];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  void v6[2] = __57__SSAppPurchaseHistoryDatabase_valueForDatabaseProperty___block_invoke_2;
  v6[3] = &unk_1E5BADEA0;
  uint64_t v8 = v3;
  long long v9 = v4;
  [v3 prepareStatementForSQL:@"SELECT value FROM db_properties WHERE key = ?" cache:1 usingBlock:v6];
  return 1;
}

uint64_t __57__SSAppPurchaseHistoryDatabase_valueForDatabaseProperty___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v5 = *(void **)(a1 + 32);
    if (isKindOfClass)
    {
      uint64_t v6 = (const char *)[v5 objCType];
      if (!strcmp(v6, "d") || !strcmp(v6, "f"))
      {
        [*(id *)(a1 + 32) doubleValue];
        sqlite3_bind_double(a2, 1, v7);
      }
      else
      {
        sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
      }
    }
    else
    {
      NSLog(&cfstr_SDUnsupportedP.isa, "/Library/Caches/com.apple.xbs/Sources/StoreServices/StoreServices/SSAppPurchaseHistoryDatabase.m", 194, v5);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(a1 + 40), @"SSAppPurchaseHistoryDatabase.m", 194, @"Unsupported predicate value: %@", *(void *)(a1 + 32));
    }
  }
  uint64_t result = [*(id *)(a1 + 48) statementHasRowAfterStepping:a2];
  if (result)
  {
    uint64_t result = SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __61__SSAppPurchaseHistoryDatabase_setValue_forDatabaseProperty___block_invoke;
  v6[3] = &unk_1E5BADEF0;
  v6[7] = &v7;
  void v6[8] = a2;
  void v6[4] = a3;
  v6[5] = self;
  v6[6] = a4;
  [(SSAppPurchaseHistoryDatabase *)self modifyUsingAppPurchaseHistoryTransactionBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __61__SSAppPurchaseHistoryDatabase_setValue_forDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 database];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __61__SSAppPurchaseHistoryDatabase_setValue_forDatabaseProperty___block_invoke_2;
  v6[3] = &unk_1E5BADEA0;
  uint64_t v9 = *(void *)(a1 + 64);
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v8 = v4;
  objc_msgSend(v3, "prepareStatementForSQL:cache:usingBlock:", @"INSERT OR REPLACE INTO db_properties (value, key) VALUES (?, ?);",
    1,
    v6);
  return 1;
}

uint64_t __61__SSAppPurchaseHistoryDatabase_setValue_forDatabaseProperty___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v5 = *(void **)(a1 + 32);
    if (isKindOfClass)
    {
      uint64_t v6 = (const char *)[v5 objCType];
      if (!strcmp(v6, "d") || !strcmp(v6, "f"))
      {
        [*(id *)(a1 + 32) doubleValue];
        sqlite3_bind_double(a2, 1, v7);
      }
      else
      {
        sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
      }
    }
    else
    {
      NSLog(&cfstr_SDUnsupportedP.isa, "/Library/Caches/com.apple.xbs/Sources/StoreServices/StoreServices/SSAppPurchaseHistoryDatabase.m", 210, v5);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(a1 + 40), @"SSAppPurchaseHistoryDatabase.m", 210, @"Unsupported predicate value: %@", *(void *)(a1 + 32));
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sqlite3_bind_text(a2, 2, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();
    uint64_t v9 = *(void **)(a1 + 48);
    if (v8)
    {
      char v10 = (const char *)[v9 objCType];
      if (!strcmp(v10, "d") || !strcmp(v10, "f"))
      {
        [*(id *)(a1 + 48) doubleValue];
        sqlite3_bind_double(a2, 2, v11);
      }
      else
      {
        sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 48) longLongValue]);
      }
    }
    else
    {
      NSLog(&cfstr_SDUnsupportedP.isa, "/Library/Caches/com.apple.xbs/Sources/StoreServices/StoreServices/SSAppPurchaseHistoryDatabase.m", 211, v9);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(a1 + 40), @"SSAppPurchaseHistoryDatabase.m", 211, @"Unsupported predicate value: %@", *(void *)(a1 + 48));
    }
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 8) statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)removeValueForDatabaseProperty:(id)a3
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SSAppPurchaseHistoryDatabase_removeValueForDatabaseProperty___block_invoke;
  v5[3] = &unk_1E5BADEC8;
  v5[4] = a3;
  void v5[5] = self;
  void v5[6] = &v6;
  v5[7] = a2;
  [(SSAppPurchaseHistoryDatabase *)self modifyUsingAppPurchaseHistoryTransactionBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__SSAppPurchaseHistoryDatabase_removeValueForDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (void *)[a2 database];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __63__SSAppPurchaseHistoryDatabase_removeValueForDatabaseProperty___block_invoke_2;
  v6[3] = &unk_1E5BADF18;
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v8 = v4;
  objc_msgSend(v3, "prepareStatementForSQL:cache:usingBlock:", @"DELETE FROM db_properties WHERE key = ?;",
    1,
    v6);
  return 1;
}

uint64_t __63__SSAppPurchaseHistoryDatabase_removeValueForDatabaseProperty___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v5 = *(void **)(a1 + 32);
    if (isKindOfClass)
    {
      uint64_t v6 = (const char *)[v5 objCType];
      if (!strcmp(v6, "d") || !strcmp(v6, "f"))
      {
        [*(id *)(a1 + 32) doubleValue];
        sqlite3_bind_double(a2, 1, v7);
      }
      else
      {
        sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
      }
    }
    else
    {
      NSLog(&cfstr_SDUnsupportedP.isa, "/Library/Caches/com.apple.xbs/Sources/StoreServices/StoreServices/SSAppPurchaseHistoryDatabase.m", 225, v5);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 40), @"SSAppPurchaseHistoryDatabase.m", 225, @"Unsupported predicate value: %@", *(void *)(a1 + 32));
    }
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 8) statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)allProperties:(id)a3 accountID:(id)a4 includingHidden:(BOOL)a5
{
  if (!a4 || ![a3 count]) {
    return 0;
  }
  char v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__SSAppPurchaseHistoryDatabase_allProperties_accountID_includingHidden___block_invoke;
  v11[3] = &unk_1E5BADF68;
  BOOL v12 = a5;
  v11[4] = a4;
  v11[5] = a3;
  v11[6] = v9;
  [(SSAppPurchaseHistoryDatabase *)self readUsingTransactionBlock:v11];
  return v9;
}

uint64_t __72__SSAppPurchaseHistoryDatabase_allProperties_accountID_includingHidden___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 database];
  id v4 = +[SSAppPurchaseHistoryEntry predicateForAccountIdentifier:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 56)) {
    id v5 = 0;
  }
  else {
    id v5 = +[SSAppPurchaseHistoryEntry predicateForNotHidden];
  }
  id v6 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, v5, 0));
  double v7 = objc_alloc_init(SSSQLiteQueryDescriptor);
  [(SSSQLiteQueryDescriptor *)v7 setEntityClass:objc_opt_class()];
  [(SSSQLiteQueryDescriptor *)v7 setPredicate:v6];
  -[SSSQLiteQueryDescriptor setOrderingProperties:](v7, "setOrderingProperties:", [MEMORY[0x1E4F1C978] arrayWithObject:@"date_purchased"]);
  -[SSSQLiteQueryDescriptor setOrderingDirections:](v7, "setOrderingDirections:", [MEMORY[0x1E4F1C978] arrayWithObject:@"DESC"]);
  long long v8 = [[SSSQLiteQuery alloc] initWithDatabase:v3 descriptor:v7];
  memset(v14, 0, sizeof(v14));
  uint64_t v9 = [*(id *)(a1 + 40) count];
  uint64_t v10 = v9;
  double v11 = v14;
  if (v9 >= 11) {
    double v11 = malloc_type_malloc(8 * v9, 0x80040B8603338uLL);
  }
  objc_msgSend(*(id *)(a1 + 40), "getObjects:range:", v11, 0, v10);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__SSAppPurchaseHistoryDatabase_allProperties_accountID_includingHidden___block_invoke_2;
  v13[3] = &unk_1E5BADF40;
  v13[5] = v10;
  v13[6] = v11;
  v13[4] = *(void *)(a1 + 48);
  [(SSSQLiteQuery *)v8 enumeratePersistentIDsAndProperties:v11 count:v10 usingBlock:v13];
  if (v11 != v14) {
    free(v11);
  }

  return 1;
}

void __72__SSAppPurchaseHistoryDatabase_allProperties_accountID_includingHidden___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1A6267F60]();
  id v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i < v7; ++i)
    {
      uint64_t v9 = *(void *)(a3 + 8 * i);
      if (v9)
      {
        [v6 setObject:v9 forKey:*(void *)(*(void *)(a1 + 48) + 8 * i)];
        uint64_t v7 = *(void *)(a1 + 40);
      }
    }
  }
  if ([v6 count]) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (id)database
{
  uint64_t v2 = self->_database;
  return v2;
}

+ (id)accountUniqueIdentifierKey
{
  return (id)objc_msgSend(+[SSAppPurchaseHistoryEntry databaseTable](SSAppPurchaseHistoryEntry, "databaseTable"), "stringByAppendingFormat:", @".%@", @"account_unique_identifier");
}

+ (void)_createDatabaseDirectory
{
  id v2 = +[SSAppPurchaseHistoryDatabaseSchema databasePath];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SSAppPurchaseHistoryDatabase__createDatabaseDirectory__block_invoke;
    block[3] = &unk_1E5BA73F8;
    block[4] = v2;
    if (_createDatabaseDirectory_sOnce != -1) {
      dispatch_once(&_createDatabaseDirectory_sOnce, block);
    }
  }
}

void __56__SSAppPurchaseHistoryDatabase__createDatabaseDirectory__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1A6267F60]();
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(*(id *)(a1 + 32), "stringByDeletingLastPathComponent"), 1, 0, 0);
}

+ (BOOL)_setupDatabase:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SSAppPurchaseHistoryDatabase__setupDatabase___block_invoke;
  v5[3] = &unk_1E5BACF00;
  v5[4] = a3;
  void v5[5] = &v6;
  [a3 performTransactionWithBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSAppPurchaseHistoryDatabase__setupDatabase___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[SSAppPurchaseHistoryDatabaseSchema createSchemaInDatabase:*(void *)(a1 + 32)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

@end