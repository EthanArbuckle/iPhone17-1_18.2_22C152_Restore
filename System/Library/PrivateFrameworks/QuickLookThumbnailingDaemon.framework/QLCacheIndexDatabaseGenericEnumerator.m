@interface QLCacheIndexDatabaseGenericEnumerator
- (QLCacheIndexDatabaseGenericEnumerator)initWithSqliteDatabase:(id)a3;
- (void)dealloc;
@end

@implementation QLCacheIndexDatabaseGenericEnumerator

- (void).cxx_destruct
{
}

- (QLCacheIndexDatabaseGenericEnumerator)initWithSqliteDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLCacheIndexDatabaseGenericEnumerator;
  v6 = [(QLCacheIndexDatabaseGenericEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sqliteDatabase, a3);
  }

  return v7;
}

- (void)dealloc
{
  p_stmt = &self->_stmt;
  if (self->_stmt) {
    [(QLSqliteDatabase *)self->_sqliteDatabase finalizeStatement:p_stmt];
  }
  v4.receiver = self;
  v4.super_class = (Class)QLCacheIndexDatabaseGenericEnumerator;
  [(QLCacheIndexDatabaseGenericEnumerator *)&v4 dealloc];
}

@end