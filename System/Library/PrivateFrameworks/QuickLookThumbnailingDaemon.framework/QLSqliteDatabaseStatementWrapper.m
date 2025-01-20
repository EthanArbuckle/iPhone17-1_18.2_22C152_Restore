@interface QLSqliteDatabaseStatementWrapper
- (BOOL)isInUse;
- (NSString)key;
- (QLSqliteDatabaseStatementWrapper)initWithStatement:(sqlite3_stmt *)a3 key:(id)a4 inUseTable:(id)a5;
- (sqlite3_stmt)stmt;
- (void)dealloc;
- (void)setInUse:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setStmt:(sqlite3_stmt *)a3;
@end

@implementation QLSqliteDatabaseStatementWrapper

- (NSString)key
{
  return self->_key;
}

- (void)setInUse:(BOOL)a3
{
  WeakRetained = (NSMapTable *)objc_loadWeakRetained((id *)&self->_inUseTable);
  stmt = self->_stmt;
  v7 = WeakRetained;
  if (a3) {
    NSMapInsert(WeakRetained, stmt, self);
  }
  else {
    NSMapRemove(WeakRetained, stmt);
  }
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (QLSqliteDatabaseStatementWrapper)initWithStatement:(sqlite3_stmt *)a3 key:(id)a4 inUseTable:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)QLSqliteDatabaseStatementWrapper;
  v11 = [(QLSqliteDatabaseStatementWrapper *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_stmt = a3;
    objc_storeStrong((id *)&v11->_key, a4);
    objc_storeWeak((id *)&v12->_inUseTable, v10);
  }

  return v12;
}

- (BOOL)isInUse
{
  v2 = self;
  WeakRetained = (NSMapTable *)objc_loadWeakRetained((id *)&self->_inUseTable);
  LOBYTE(v2) = NSMapGet(WeakRetained, v2->_stmt) == v2;

  return (char)v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)QLSqliteDatabaseStatementWrapper;
  [(QLSqliteDatabaseStatementWrapper *)&v2 dealloc];
}

- (void)setKey:(id)a3
{
}

- (void)setStmt:(sqlite3_stmt *)a3
{
  self->_stmt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_inUseTable);
}

@end