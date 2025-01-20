@interface PSIStatement
- (PSIStatement)initWithSQLite3Stmt:(sqlite3_stmt *)a3;
- (double)doubleAtColumn:(unint64_t)a3;
- (id)textAtColumn:(unint64_t)a3;
- (int64_t)int64AtColumn:(unint64_t)a3;
- (sqlite3_stmt)stmt;
- (void)bindDouble:(double)a3 atIndex:(unint64_t)a4;
- (void)bindInt64:(int64_t)a3 atIndex:(unint64_t)a4;
- (void)bindText:(id)a3 atIndex:(unint64_t)a4;
- (void)dealloc;
- (void)finalizze;
@end

@implementation PSIStatement

- (PSIStatement)initWithSQLite3Stmt:(sqlite3_stmt *)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PSIStatement;
    result = [(PSIStatement *)&v5 init];
    if (result) {
      result->_stmt = a3;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (int64_t)int64AtColumn:(unint64_t)a3
{
  return sqlite3_column_int64(self->_stmt, a3);
}

- (void)finalizze
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  stmt = self->_stmt;
  if (!stmt)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      v6 = @"finalizze called multiple times on statement";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v5, 0xCu);
      stmt = self->_stmt;
    }
    else
    {
      stmt = 0;
    }
  }
  int v4 = sqlite3_finalize(stmt);
  self->_stmt = 0;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      v6 = @"Failed to finalize statement";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_stmt && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    int v5 = @"finalizze not called before statement deallocation";
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)PSIStatement;
  [(PSIStatement *)&v3 dealloc];
}

- (double)doubleAtColumn:(unint64_t)a3
{
  return sqlite3_column_double(self->_stmt, a3);
}

- (id)textAtColumn:(unint64_t)a3
{
  objc_super v3 = (void *)sqlite3_column_text(self->_stmt, a3);
  if (v3)
  {
    objc_super v3 = [NSString stringWithUTF8String:v3];
  }
  return v3;
}

- (void)bindInt64:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (sqlite3_bind_int64(self->_stmt, a4, a3))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      int v5 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)bindDouble:(double)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (sqlite3_bind_double(self->_stmt, a4, a3))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      int v5 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)bindText:(id)a3 atIndex:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 dataUsingEncoding:4 allowLossyConversion:1];
  uint64_t v7 = [v6 length];
  v8 = (char *)malloc_type_malloc(v7 + 1, 0x8EC3DB34uLL);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v6, "getBytes:range:", v8, 0, v7);
    v9[v7] = 0;
    if (sqlite3_bind_text(self->_stmt, v4, v9, v7 + 1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      v11 = @"Failed to bind parameter";
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v10, 0xCu);
    }
    free(v9);
  }
}

@end