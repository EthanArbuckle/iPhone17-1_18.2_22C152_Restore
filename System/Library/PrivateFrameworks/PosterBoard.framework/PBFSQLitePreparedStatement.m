@interface PBFSQLitePreparedStatement
+ (id)_newPreparedStatementForDatabaseConnection:(void *)a3 withSQLQuery:;
- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5;
- (OS_os_log)loggingCategory;
- (PBFSQLitePreparedStatement)init;
- (id)_initWithDatabaseConnection:(id *)a1;
- (void)dealloc;
- (void)setLoggingCategory:(id)a3;
@end

@implementation PBFSQLitePreparedStatement

- (id)_initWithDatabaseConnection:(id *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__initWithDatabaseConnection_, a1, @"PBFSQLitePreparedStatement.m", 70, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
    }
    v9.receiver = a1;
    v9.super_class = (Class)PBFSQLitePreparedStatement;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeWeak(v5 + 1, v4);
      v6 = BSLogCommon();
      [a1 setLoggingCategory:v6];
    }
  }

  return a1;
}

- (PBFSQLitePreparedStatement)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PBFSQLitePreparedStatement.m" lineNumber:79 description:@"init is not allowed"];

  return (PBFSQLitePreparedStatement *)-[PBFSQLitePreparedStatement _initWithDatabaseConnection:]((id *)&self->super.isa, 0);
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_dbConnection, 0);
  v3.receiver = self;
  v3.super_class = (Class)PBFSQLitePreparedStatement;
  [(PBFSQLitePreparedStatement *)&v3 dealloc];
}

+ (id)_newPreparedStatementForDatabaseConnection:(void *)a3 withSQLQuery:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if (!v4)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__newPreparedStatementForDatabaseConnection_withSQLQuery_, v6, @"PBFSQLitePreparedStatement.m", 90, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel__newPreparedStatementForDatabaseConnection_withSQLQuery_, v6, @"PBFSQLitePreparedStatement.m", 91, @"Invalid parameter not satisfying: %@", @"sqlQuery" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__PBFSQLitePreparedStatement__newPreparedStatementForDatabaseConnection_withSQLQuery___block_invoke;
  v13[3] = &unk_1E6983EF8;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  id v15 = v8;
  v16 = &v17;
  -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)v8, v13);
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __86__PBFSQLitePreparedStatement__newPreparedStatementForDatabaseConnection_withSQLQuery___block_invoke(uint64_t a1, sqlite3 *a2)
{
  id v4 = (const char *)[*(id *)(a1 + 32) UTF8String];
  id v14 = 0;
  ppStmt = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v4) {
    goto LABEL_15;
  }
  if (!*v4)
  {
    id v4 = 0;
LABEL_11:
    if (v4) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  while (1)
  {
    int v6 = strlen(v4);
    if (!sqlite3_prepare_v2(a2, v4, v6, &ppStmt, &v14))
    {
      v10 = [_PBFSQLitePreparedSimpleStatement alloc];
      id v8 = -[_PBFSQLitePreparedSimpleStatement _initWithDatabaseConnection:statement:]((id *)&v10->super.super.isa, *(void **)(a1 + 40), ppStmt);
      [v5 addObject:v8];
      goto LABEL_7;
    }
    if (v14 <= v4) {
      break;
    }
    id v7 = [NSString alloc];
    id v8 = (id *)[v7 initWithBytes:v4 length:v14 - v4 encoding:4];
    id v9 = -[_PBFSQLiteDeferredPreparedSimpleStatement initWithDatabaseConnection:deferredSql:]((id *)[_PBFSQLiteDeferredPreparedSimpleStatement alloc], *(void **)(a1 + 40), v8);
    [v5 addObject:v9];

LABEL_7:
    id v4 = v14;
    if (!v14) {
      goto LABEL_15;
    }
    if (!*v14) {
      goto LABEL_11;
    }
  }
  id v4 = v14;
  if (!v14) {
    goto LABEL_15;
  }
LABEL_12:
  if (!*v4)
  {
LABEL_15:
    if (objc_msgSend(v5, "count", v14) == 1)
    {
      uint64_t v11 = [v5 objectAtIndex:0];
    }
    else
    {
      uint64_t v11 = (uint64_t)-[_PBFSQLitePreparedCompoundStatement initWithDatabaseConnection:statements:]((id *)[_PBFSQLitePreparedCompoundStatement alloc], *(void **)(a1 + 40), v5);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"PBFSQLitePreparedStatement.m" lineNumber:139 description:@"Abstract class implementation should never be called"];

  return 0;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (void)setLoggingCategory:(id)a3
{
  self->_loggingCategory = (OS_os_log *)a3;
}

- (void).cxx_destruct
{
}

@end