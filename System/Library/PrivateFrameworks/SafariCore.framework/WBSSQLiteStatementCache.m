@interface WBSSQLiteStatementCache
- (WBSSQLiteStatementCache)init;
- (WBSSQLiteStatementCache)initWithDatabase:(id)a3;
- (id)_createStatementForQuery:(id)a3 error:(id *)a4;
- (id)cachedStatementForQuery:(id)a3;
- (id)statementForQuery:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setCachedStatement:(id)a3 forQuery:(id)a4;
@end

@implementation WBSSQLiteStatementCache

- (id)statementForQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WBSSQLiteStatementCache *)self cachedStatementForQuery:v6];
  if (!v7)
  {
    v7 = [(WBSSQLiteStatementCache *)self _createStatementForQuery:v6 error:a4];
    if (v7) {
      [(WBSSQLiteStatementCache *)self setCachedStatement:v7 forQuery:v6];
    }
  }

  return v7;
}

- (id)cachedStatementForQuery:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_statements objectForKeyedSubscript:a3];
  return v3;
}

- (void)setCachedStatement:(id)a3 forQuery:(id)a4
{
}

- (id)_createStatementForQuery:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [[WBSSQLiteStatement alloc] initWithDatabase:self->_database query:v6];
  if (!v7)
  {
    if (a4)
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSSQLiteStatementCache _createStatementForQuery:error:]");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        [(WBSSQLiteStatementCache *)(uint64_t)v6 _createStatementForQuery:v11 error:v8];
      }
    }
  }

  return v7;
}

- (WBSSQLiteStatementCache)initWithDatabase:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSSQLiteStatementCache;
  id v6 = [(WBSSQLiteStatementCache *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    statements = v7->_statements;
    v7->_statements = (NSMutableDictionary *)v8;

    v10 = v7;
  }

  return v7;
}

- (WBSSQLiteStatementCache)init
{
  return 0;
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(NSMutableDictionary *)self->_statements allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) invalidate];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  [(NSMutableDictionary *)self->_statements removeAllObjects];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WBSSQLiteStatementCache;
  [(WBSSQLiteStatementCache *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_createStatementForQuery:(uint8_t *)buf error:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to create statement '%@': %{public}@", buf, 0x16u);
}

@end