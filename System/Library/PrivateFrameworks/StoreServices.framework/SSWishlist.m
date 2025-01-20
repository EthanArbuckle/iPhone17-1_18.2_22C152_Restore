@interface SSWishlist
+ (BOOL)existsForAccountIdentifier:(int64_t)a3;
- (BOOL)deleteBackingStore;
- (NSNumber)lastSyncTime;
- (SSWishlist)initWithAccountIdentifier:(int64_t)a3;
- (int64_t)accountIdentifier;
- (void)dealloc;
- (void)performTransactionWithBlock:(id)a3;
- (void)setLastSyncTime:(id)a3;
@end

@implementation SSWishlist

- (SSWishlist)initWithAccountIdentifier:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SSWishlist;
  v4 = [(SSWishlist *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_accountIdentifier = a3;
    id v6 = +[SSWishlistDatabaseSchema databasePathWithAccountIdentifier:a3];
    v7 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
    id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v6, "stringByDeletingLastPathComponent"), 1, 0, 0);

    v9 = [[SSSQLiteDatabase alloc] initWithDatabaseURL:v7];
    v5->_database = v9;
    [(SSSQLiteDatabase *)v9 setSetupBlock:&__block_literal_global_39];
    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v7 setResourceValue:v10 forKey:*MEMORY[0x1E4F1C630] error:0];
  }
  return v5;
}

uint64_t __40__SSWishlist_initWithAccountIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SSWishlistDatabaseSchema createSchemaInDatabase:a2];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSWishlist;
  [(SSWishlist *)&v3 dealloc];
}

+ (BOOL)existsForAccountIdentifier:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  LOBYTE(a3) = objc_msgSend(v4, "fileExistsAtPath:", +[SSWishlistDatabaseSchema databasePathWithAccountIdentifier:](SSWishlistDatabaseSchema, "databasePathWithAccountIdentifier:", a3));

  return a3;
}

- (BOOL)deleteBackingStore
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  database = self->_database;
  if (database
    && (v6[0] = MEMORY[0x1E4F143A8],
        v6[1] = 3221225472,
        v6[2] = __32__SSWishlist_deleteBackingStore__block_invoke,
        v6[3] = &unk_1E5BAE5D0,
        v6[4] = &v7,
        [(SSSQLiteDatabase *)database accessDatabaseUsingBlock:v6],
        *((unsigned char *)v8 + 24)))
  {

    self->_database = 0;
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __32__SSWishlist_deleteBackingStore__block_invoke(uint64_t a1)
{
  uint64_t result = CPSqliteDatabaseDelete();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (NSNumber)lastSyncTime
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__78;
  char v10 = __Block_byref_object_dispose__78;
  uint64_t v11 = 0;
  database = self->_database;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__SSWishlist_lastSyncTime__block_invoke;
  v5[3] = &unk_1E5BAD100;
  v5[4] = self;
  v5[5] = &v6;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v5];
  objc_super v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__SSWishlist_lastSyncTime__block_invoke(uint64_t a1)
{
  v2 = (void *)[[NSString alloc] initWithString:@"SELECT value FROM properties WHERE key=\"lastSyncTime\";"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[2] = __26__SSWishlist_lastSyncTime__block_invoke_2;
  v6[3] = &unk_1E5BACE58;
  long long v7 = v3;
  [v4 prepareStatementForSQL:v2 cache:0 usingBlock:v6];

  return 1;
}

void __26__SSWishlist_lastSyncTime__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) statementHasRowAfterStepping:a2])
  {
    id v4 = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    if (objc_opt_respondsToSelector()) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithInteger:", objc_msgSend(v4, "integerValue"));
    }
  }
}

- (void)performTransactionWithBlock:(id)a3
{
  database = self->_database;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SSWishlist_performTransactionWithBlock___block_invoke;
  v4[3] = &unk_1E5BAE5F8;
  v4[4] = self;
  v4[5] = a3;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v4];
}

uint64_t __42__SSWishlist_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (void)setLastSyncTime:(id)a3
{
  database = self->_database;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__SSWishlist_setLastSyncTime___block_invoke;
  v4[3] = &unk_1E5BAE620;
  v4[4] = a3;
  v4[5] = self;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v4];
}

uint64_t __30__SSWishlist_setLastSyncTime___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"INSERT OR REPLACE INTO properties (key, value) VALUES (\"lastSyncTime\", ?)"];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 16);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __30__SSWishlist_setLastSyncTime___block_invoke_3;
    v10[3] = &unk_1E5BAD0B0;
    uint64_t v5 = *(void *)(a1 + 32);
    v10[5] = v3;
    v10[6] = &v12;
    v10[4] = v5;
    [v4 prepareStatementForSQL:v2 cache:0 usingBlock:v10];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    long long v7 = *(void **)(v6 + 16);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __30__SSWishlist_setLastSyncTime___block_invoke_2;
    v11[3] = &unk_1E5BADFE0;
    v11[4] = v6;
    v11[5] = &v12;
    [v7 prepareStatementForSQL:@"DELETE FROM properties WHERE key=\"lastSyncTime\"" cache:0 usingBlock:v11];
  }
  uint64_t v8 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __30__SSWishlist_setLastSyncTime___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __30__SSWishlist_setLastSyncTime___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  SSSQLiteBindFoundationValueToStatement(a2, 1, objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(*(id *)(a1 + 32), "longLongValue")));
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 16) statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)accountIdentifier
{
  return self->_accountIdentifier;
}

@end