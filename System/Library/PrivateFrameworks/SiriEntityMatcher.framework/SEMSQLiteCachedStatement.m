@interface SEMSQLiteCachedStatement
- (SEMSQLiteCachedStatement)init;
- (SEMSQLiteCachedStatement)initWithStmt:(sqlite3_stmt *)a3;
- (sqlite3_stmt)stmt;
- (void)dealloc;
@end

@implementation SEMSQLiteCachedStatement

- (SEMSQLiteCachedStatement)initWithStmt:(sqlite3_stmt *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SEMSQLiteCachedStatement;
  result = [(SEMSQLiteCachedStatement *)&v5 init];
  if (result) {
    result->_stmt = a3;
  }
  return result;
}

- (SEMSQLiteCachedStatement)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use initWithStmt:", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  stmt = self->_stmt;
  if (stmt)
  {
    sqlite3_finalize(stmt);
    self->_stmt = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SEMSQLiteCachedStatement;
  [(SEMSQLiteCachedStatement *)&v4 dealloc];
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

@end