@interface ML3DatabaseStatement
- (BOOL)clearBindingsAfterRunning;
- (BOOL)isBusy;
- (BOOL)isExecuting;
- (BOOL)isReadOnly;
- (ML3DatabaseStatement)initWithSQLiteStatement:(sqlite3_stmt *)a3 SQL:(id)a4;
- (NSString)sql;
- (id)description;
- (int)clearBindings;
- (int)finalizeStatement;
- (int)reset;
- (int)step;
- (sqlite3_stmt)sqliteStatement;
- (void)bindBytes:(const void *)a3 length:(int)a4 forParameterAtPosition:(int)a5;
- (void)bindBytesNoCopy:(const void *)a3 length:(int)a4 forParameterAtPosition:(int)a5;
- (void)bindDouble:(double)a3 forParameterAtPosition:(int)a4;
- (void)bindInt64:(int64_t)a3 forParameterAtPosition:(int)a4;
- (void)bindInt:(int)a3 forParameterAtPosition:(int)a4;
- (void)bindNullForParameterAtPosition:(int)a3;
- (void)bindUTF8String:(const char *)a3 forParameterAtPosition:(int)a4;
- (void)bindUTF8StringNoCopy:(const char *)a3 forParameterAtPosition:(int)a4;
- (void)bindUTF8StringNoCopy:(const char *)a3 length:(int)a4 forParameterAtPosition:(int)a5;
- (void)bindValue:(id)a3 forParameterAtPosition:(int)a4;
- (void)bindValuesForParameterNames:(id)a3;
- (void)bindValuesInArray:(id)a3;
- (void)dealloc;
- (void)setClearBindingsAfterRunning:(BOOL)a3;
- (void)setIsExecuting:(BOOL)a3;
@end

@implementation ML3DatabaseStatement

uint64_t __42__ML3DatabaseStatement_bindValuesInArray___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  return [*(id *)(a1 + 32) bindValue:a2 forParameterAtPosition:(a3 + 1)];
}

- (void)bindValue:(id)a3 forParameterAtPosition:(int)a4
{
  if (a3) {
    objc_msgSend(a3, "ml_bindToSQLiteStatement:atPosition:", self->_sqliteStatement, *(void *)&a4);
  }
  else {
    sqlite3_bind_null(self->_sqliteStatement, a4);
  }
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (sqlite3_stmt)sqliteStatement
{
  return self->_sqliteStatement;
}

- (void)bindValuesInArray:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__ML3DatabaseStatement_bindValuesInArray___block_invoke;
  v3[3] = &unk_1E5FB7858;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (int)reset
{
  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement) {
    LODWORD(sqliteStatement) = sqlite3_reset(sqliteStatement);
  }
  self->_isExecuting = 0;
  return (int)sqliteStatement;
}

- (BOOL)clearBindingsAfterRunning
{
  return self->_clearBindingsAfterRunning;
}

- (ML3DatabaseStatement)initWithSQLiteStatement:(sqlite3_stmt *)a3 SQL:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)ML3DatabaseStatement;
    v7 = [(ML3DatabaseStatement *)&v14 init];
    v8 = v7;
    if (v7)
    {
      v7->_sqliteStatement = a3;
      uint64_t v9 = [v6 copy];
      sql = v8->_sql;
      v8->_sql = (NSString *)v9;

      v8->_isExecuting = 0;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v12 = +[MLException exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"attempt to create a database statement without an underlying sqlite3_stmt" userInfo:0];
    [v12 raise];

    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (NSString)sql
{
  sql = self->_sql;
  if (!sql)
  {
    sqliteStatement = self->_sqliteStatement;
    if (sqliteStatement)
    {
      v5 = [NSString stringWithUTF8String:sqlite3_sql(sqliteStatement)];
    }
    else
    {
      v5 = 0;
    }
    id v6 = (NSString *)[v5 copy];
    v7 = self->_sql;
    self->_sql = v6;

    sql = self->_sql;
  }

  return sql;
}

- (int)finalizeStatement
{
  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement)
  {
    LODWORD(sqliteStatement) = sqlite3_finalize(sqliteStatement);
    self->_sqliteStatement = 0;
  }
  self->_isExecuting = 0;
  return (int)sqliteStatement;
}

- (BOOL)isReadOnly
{
  sqliteStatement = self->_sqliteStatement;
  return !sqliteStatement || sqlite3_stmt_readonly(sqliteStatement) != 0;
}

- (void)dealloc
{
  if (self->_sqliteStatement)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"ML3DatabaseStatement.m", 38, @"%@ %p has a dangling SQLite resource. (%p) A connection should have free'd this resource.", objc_opt_class(), self, self->_sqliteStatement object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)ML3DatabaseStatement;
  [(ML3DatabaseStatement *)&v5 dealloc];
}

- (int)step
{
  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement
    || ([MEMORY[0x1E4F28B00] currentHandler],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        [v5 handleFailureInMethod:a2 object:self file:@"ML3DatabaseStatement.m" lineNumber:68 description:@"attempt to step database statement that has already been finalized"], v5, (sqliteStatement = self->_sqliteStatement) != 0))
  {
    LODWORD(sqliteStatement) = sqlite3_step(sqliteStatement);
  }
  self->_isExecuting = 1;
  return (int)sqliteStatement;
}

- (void)setClearBindingsAfterRunning:(BOOL)a3
{
  self->_clearBindingsAfterRunning = a3;
}

- (void)bindValuesForParameterNames:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__ML3DatabaseStatement_bindValuesForParameterNames___block_invoke;
  v3[3] = &unk_1E5FB7830;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __52__ML3DatabaseStatement_bindValuesForParameterNames___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v5 = NSString;
  id v8 = a3;
  id v6 = [v5 stringWithFormat:@":%@", a2];
  v7 = (const char *)[v6 UTF8String];

  objc_msgSend(*(id *)(a1 + 32), "bindValue:forParameterAtPosition:", v8, sqlite3_bind_parameter_index(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 24), v7));
}

- (void)bindUTF8StringNoCopy:(const char *)a3 length:(int)a4 forParameterAtPosition:(int)a5
{
  sqliteStatement = self->_sqliteStatement;
  if (!a3) {
    a3 = "";
  }
  sqlite3_bind_text(sqliteStatement, a5, a3, a4, 0);
}

- (void)bindUTF8StringNoCopy:(const char *)a3 forParameterAtPosition:(int)a4
{
  sqliteStatement = self->_sqliteStatement;
  if (!a3) {
    a3 = "";
  }
  sqlite3_bind_text(sqliteStatement, a4, a3, -1, 0);
}

- (void)bindUTF8String:(const char *)a3 forParameterAtPosition:(int)a4
{
  sqliteStatement = self->_sqliteStatement;
  if (!a3) {
    a3 = "";
  }
  sqlite3_bind_text(sqliteStatement, a4, a3, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)bindBytesNoCopy:(const void *)a3 length:(int)a4 forParameterAtPosition:(int)a5
{
  sqliteStatement = self->_sqliteStatement;
  if (!a3) {
    a3 = "";
  }
  sqlite3_bind_blob(sqliteStatement, a5, a3, a4, 0);
}

- (void)bindBytes:(const void *)a3 length:(int)a4 forParameterAtPosition:(int)a5
{
  sqliteStatement = self->_sqliteStatement;
  if (!a3) {
    a3 = "";
  }
  sqlite3_bind_blob(sqliteStatement, a5, a3, a4, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)bindNullForParameterAtPosition:(int)a3
{
}

- (void)bindDouble:(double)a3 forParameterAtPosition:(int)a4
{
}

- (void)bindInt64:(int64_t)a3 forParameterAtPosition:(int)a4
{
}

- (void)bindInt:(int)a3 forParameterAtPosition:(int)a4
{
}

- (int)clearBindings
{
  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement) {
    LODWORD(sqliteStatement) = sqlite3_clear_bindings(sqliteStatement);
  }
  return (int)sqliteStatement;
}

- (BOOL)isBusy
{
  sqliteStatement = self->_sqliteStatement;
  if (sqliteStatement) {
    LOBYTE(sqliteStatement) = sqlite3_stmt_busy(sqliteStatement) != 0;
  }
  return (char)sqliteStatement;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ML3DatabaseStatement;
  v4 = [(ML3DatabaseStatement *)&v9 description];
  BOOL v5 = [(ML3DatabaseStatement *)self isExecuting];
  id v6 = [(ML3DatabaseStatement *)self sql];
  v7 = [v3 stringWithFormat:@"%@ executing=%d, sql='%@'", v4, v5, v6];

  return v7;
}

@end