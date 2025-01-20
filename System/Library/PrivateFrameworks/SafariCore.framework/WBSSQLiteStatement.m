@interface WBSSQLiteStatement
- (BOOL)_isValid;
- (BOOL)execute:(id *)a3;
- (BOOL)fetchWithEnumerationBlock:(id)a3 error:(id *)a4;
- (NSArray)columnNames;
- (NSDictionary)columnNamesToIndexes;
- (WBSSQLiteDatabase)database;
- (WBSSQLiteStatement)init;
- (WBSSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4;
- (WBSSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4 error:(id *)a5;
- (id)fetch;
- (int)execute;
- (sqlite3_stmt)handle;
- (void)bindData:(id)a3 atParameterIndex:(unint64_t)a4;
- (void)bindDouble:(double)a3 atParameterIndex:(unint64_t)a4;
- (void)bindInt64:(int64_t)a3 atParameterIndex:(unint64_t)a4;
- (void)bindInt:(int)a3 atParameterIndex:(unint64_t)a4;
- (void)bindNullAtParameterIndex:(unint64_t)a3;
- (void)bindString:(id)a3 atParameterIndex:(unint64_t)a4;
- (void)dealloc;
- (void)invalidate;
- (void)reset;
@end

@implementation WBSSQLiteStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_columnNamesToIndexes, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)dealloc
{
  handle = self->_handle;
  if (handle)
  {
    v4 = [(WBSSQLiteDatabase *)self->_database queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__WBSSQLiteStatement_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = handle;
    dispatch_async(v4, block);
  }
  v5.receiver = self;
  v5.super_class = (Class)WBSSQLiteStatement;
  [(WBSSQLiteStatement *)&v5 dealloc];
}

- (void)invalidate
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_1B728F000, "Could not finalize statement: %@ (%d)", v4, v5);
}

- (sqlite3_stmt)handle
{
  return self->_handle;
}

- (WBSSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSSQLiteStatement;
  v11 = [(WBSSQLiteStatement *)&v18 init];
  p_isa = &v11->super.isa;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    v13 = (sqlite3 *)[v9 handle];
    id v14 = v10;
    uint64_t v15 = sqlite3_prepare_v2(v13, (const char *)[v14 UTF8String], -1, p_isa + 2, 0);
    if (!v15)
    {
      v16 = p_isa;
      goto LABEL_6;
    }
    [v9 reportErrorWithCode:v15 query:v14 error:a5];
  }
  v16 = 0;
LABEL_6:

  return v16;
}

uint64_t __29__WBSSQLiteStatement_dealloc__block_invoke(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
}

- (void)reset
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_1B728F000, "Could not reset statement: %@ (%d)", v4, v5);
}

- (int)execute
{
  temporarilyDisableSuddenTermination();
  uint64_t v3 = sqlite3_step(self->_handle);
  int v4 = v3;
  if ((v3 - 100) >= 2 && v3 != 0) {
    [(WBSSQLiteDatabase *)self->_database reportErrorWithCode:v3 statement:self->_handle error:0];
  }
  return v4;
}

- (WBSSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4
{
  return [(WBSSQLiteStatement *)self initWithDatabase:a3 query:a4 error:0];
}

- (id)fetch
{
  uint64_t v2 = [[WBSSQLiteRowEnumerator alloc] initWithResultsOfStatement:self];
  return v2;
}

- (void)bindInt:(int)a3 atParameterIndex:(unint64_t)a4
{
  if (sqlite3_bind_int(self->_handle, a4, a3))
  {
    objc_super v5 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindInt:atParameterIndex:]();
    }
  }
}

- (void)bindString:(id)a3 atParameterIndex:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  handle = self->_handle;
  id v8 = v6;
  if (sqlite3_bind_text(handle, v4, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindString:atParameterIndex:]();
    }
  }
}

- (void)bindInt64:(int64_t)a3 atParameterIndex:(unint64_t)a4
{
  if (sqlite3_bind_int64(self->_handle, a4, a3))
  {
    objc_super v5 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindInt64:atParameterIndex:]();
    }
  }
}

- (void)bindDouble:(double)a3 atParameterIndex:(unint64_t)a4
{
  if (sqlite3_bind_double(self->_handle, a4, a3))
  {
    objc_super v5 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindDouble:atParameterIndex:]();
    }
  }
}

- (WBSSQLiteStatement)init
{
  return 0;
}

- (BOOL)execute:(id *)a3
{
  temporarilyDisableSuddenTermination();
  uint64_t v5 = sqlite3_step(self->_handle);
  if ((v5 - 100) < 2 || v5 == 0) {
    return 1;
  }
  [(WBSSQLiteDatabase *)self->_database reportErrorWithCode:v5 statement:self->_handle error:a3];
  return 0;
}

- (BOOL)fetchWithEnumerationBlock:(id)a3 error:(id *)a4
{
  id v6 = (void (**)(id, WBSSQLiteRow *, unsigned char *))a3;
  v7 = 0;
  char v10 = 0;
  do
  {
    int v8 = sqlite3_step(self->_handle);
    if (v8 != 100) {
      break;
    }
    if (!v7) {
      v7 = [[WBSSQLiteRow alloc] initWithStatement:self];
    }
    v6[2](v6, v7, &v10);
  }
  while (!v10);
  if (a4 && v8 != 101)
  {
    -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSSQLiteStatement fetchWithEnumerationBlock:error:]");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 == 101;
}

- (void)bindData:(id)a3 atParameterIndex:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  handle = self->_handle;
  id v8 = v6;
  if (sqlite3_bind_blob(handle, v4, (const void *)[v8 bytes], objc_msgSend(v8, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v9 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindData:atParameterIndex:]();
    }
  }
}

- (void)bindNullAtParameterIndex:(unint64_t)a3
{
  if (sqlite3_bind_null(self->_handle, a3))
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindNullAtParameterIndex:]();
    }
  }
}

- (NSDictionary)columnNamesToIndexes
{
  columnNamesToIndexes = self->_columnNamesToIndexes;
  if (columnNamesToIndexes)
  {
    uint64_t v3 = columnNamesToIndexes;
  }
  else
  {
    int v5 = sqlite3_column_count(self->_handle);
    id v6 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v5];
    if (v5 >= 1)
    {
      uint64_t v7 = 0;
      do
      {
        id v8 = sqlite3_column_name(self->_handle, v7);
        id v9 = [NSNumber numberWithInt:v7];
        char v10 = [NSString stringWithUTF8String:v8];
        [(NSDictionary *)v6 setObject:v9 forKeyedSubscript:v10];

        uint64_t v7 = (v7 + 1);
      }
      while (v5 != v7);
    }
    v11 = self->_columnNamesToIndexes;
    self->_columnNamesToIndexes = v6;
    v12 = v6;

    uint64_t v3 = self->_columnNamesToIndexes;
  }
  return v3;
}

- (NSArray)columnNames
{
  columnNames = self->_columnNames;
  if (columnNames)
  {
    uint64_t v3 = columnNames;
  }
  else
  {
    int v5 = sqlite3_column_count(self->_handle);
    id v6 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
    if (v5 >= 1)
    {
      for (int i = 0; i != v5; ++i)
      {
        id v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(self->_handle, i));
        [(NSArray *)v6 addObject:v8];
      }
    }
    id v9 = self->_columnNames;
    self->_columnNames = v6;
    char v10 = v6;

    uint64_t v3 = self->_columnNames;
  }
  return v3;
}

- (BOOL)_isValid
{
  return self->_handle != 0;
}

- (WBSSQLiteDatabase)database
{
  return self->_database;
}

- (void)bindString:atParameterIndex:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_1B728F000, "Could not bind string: %@ (%d)", v4, v5);
}

- (void)bindInt:atParameterIndex:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_1B728F000, "Could not bind int: %@ (%d)", v4, v5);
}

- (void)bindInt64:atParameterIndex:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_1B728F000, "Could not bind integer: %@ (%d)", v4, v5);
}

- (void)bindDouble:atParameterIndex:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_1B728F000, "Could not bind double: %@ (%d)", v4, v5);
}

- (void)bindData:atParameterIndex:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_1B728F000, "Could not bind blob: %@ (%d)", v4, v5);
}

- (void)bindNullAtParameterIndex:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_6(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_3(&dword_1B728F000, "Could not bind null: %@ (%d)", v4, v5);
}

@end