@interface _PBFSQLitePreparedSimpleStatement
- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5;
- (id)_initWithDatabaseConnection:(void *)a3 statement:;
- (id)_sqliteError:(uint64_t)a1;
- (uint64_t)_bindKey:(void *)a3 value:;
- (uint64_t)_bindParameterIndex:(id)a3 dataValue:;
- (uint64_t)_bindParameterIndex:(id)a3 stringValue:;
- (uint64_t)_bindParameterIndex:(uint64_t)result nullValue:(int)a2;
- (uint64_t)_bindParameterIndex:(void *)a3 numberValue:;
- (void)dealloc;
- (void)sqliteDatabaseConnectionWillClose:(id)a3;
@end

@implementation _PBFSQLitePreparedSimpleStatement

- (id)_initWithDatabaseConnection:(void *)a3 statement:
{
  if (!a1) {
    return 0;
  }
  v4 = -[PBFSQLitePreparedStatement _initWithDatabaseConnection:](a1, a2);
  v5 = v4;
  if (v4)
  {
    v4[3] = a3;
    id WeakRetained = objc_loadWeakRetained(v4 + 1);
    [WeakRetained addObserver:v5];
  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._dbConnection);
  statement = self->_statement;
  if (statement)
  {
    if (WeakRetained)
    {
      self->_statement = 0;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __44___PBFSQLitePreparedSimpleStatement_dealloc__block_invoke;
      v6[3] = &__block_descriptor_40_e18_v16__0__sqlite3__8l;
      v6[4] = statement;
      -[PBFSQLiteDatabaseConnection performWithDatabase:]((uint64_t)WeakRetained, v6);
    }
    else
    {
      sqlite3_finalize(statement);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)_PBFSQLitePreparedSimpleStatement;
  [(PBFSQLitePreparedStatement *)&v5 dealloc];
}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._dbConnection);
  if (WeakRetained && self->_statement)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80___PBFSQLitePreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke;
    v14[3] = &unk_1E6983F40;
    v17 = &v18;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)WeakRetained, v14);

    int v11 = *((_DWORD *)v19 + 6);
    if (!a5) {
      goto LABEL_8;
    }
  }
  else
  {
    int v11 = 21;
    *((_DWORD *)v19 + 6) = 21;
    if (!a5) {
      goto LABEL_8;
    }
  }
  if (v11)
  {
    -[_PBFSQLitePreparedSimpleStatement _sqliteError:]((uint64_t)self, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    int v11 = *((_DWORD *)v19 + 6);
  }
LABEL_8:
  BOOL v12 = v11 == 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (uint64_t)_bindKey:(void *)a3 value:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int v7 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)(a1 + 24), (const char *)[v5 UTF8String]);
    if (v7)
    {
      int v8 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 24), v8);
LABEL_12:
        a1 = v9;
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 24), v8, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = -[_PBFSQLitePreparedSimpleStatement _bindParameterIndex:numberValue:]((sqlite3_stmt **)a1, v8, v6);
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = -[_PBFSQLitePreparedSimpleStatement _bindParameterIndex:dataValue:](a1, v8, v6);
        goto LABEL_12;
      }
      int v11 = [(id)a1 loggingCategory];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_PBFSQLitePreparedSimpleStatement _bindKey:value:]((uint64_t)v6, v11);
      }

      a1 = 20;
    }
    else
    {
      a1 = 0;
    }
  }
LABEL_13:

  return a1;
}

- (id)_sqliteError:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [NSString stringWithUTF8String:sqlite3_errstr(a2)];
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    int v7 = [WeakRetained lastErrorMessage];

    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    }
    int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PosterBoard.pbfSQLitePreparedStatementErrorDomain" code:a2 userInfo:v4];
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (void)sqliteDatabaseConnectionWillClose:(id)a3
{
  statement = self->_statement;
  if (statement)
  {
    sqlite3_finalize(statement);
    self->_statement = 0;
  }
  objc_storeWeak((id *)&self->super._dbConnection, 0);
}

- (uint64_t)_bindParameterIndex:(uint64_t)result nullValue:(int)a2
{
  if (result) {
    return sqlite3_bind_null(*(sqlite3_stmt **)(result + 24), a2);
  }
  return result;
}

- (uint64_t)_bindParameterIndex:(id)a3 stringValue:
{
  if (result)
  {
    v4 = *(sqlite3_stmt **)(result + 24);
    id v5 = (const char *)[a3 UTF8String];
    return sqlite3_bind_text(v4, a2, v5, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (uint64_t)_bindParameterIndex:(void *)a3 numberValue:
{
  id v5 = a3;
  id v6 = v5;
  if (!a1)
  {
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  id v7 = v5;
  int v8 = (const char *)[v7 objCType];
  if (strlen(v8) != 1)
  {
    BOOL v12 = [a1 loggingCategory];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      uint64_t v11 = 20;
      goto LABEL_10;
    }
LABEL_8:
    -[_PBFSQLitePreparedSimpleStatement _bindParameterIndex:numberValue:]();
    goto LABEL_9;
  }
  unsigned int v9 = *v8 - 66;
  if (v9 > 0x31)
  {
LABEL_13:
    BOOL v12 = [a1 loggingCategory];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (((1 << v9) & 0x2848200028483) == 0)
  {
    if (((1 << v9) & 0x1400000000) != 0)
    {
      v14 = a1[3];
      [v7 doubleValue];
      uint64_t v10 = sqlite3_bind_double(v14, a2, v15);
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  uint64_t v10 = sqlite3_bind_int64(a1[3], a2, [v7 longLongValue]);
LABEL_6:
  uint64_t v11 = v10;
LABEL_10:

  return v11;
}

- (uint64_t)_bindParameterIndex:(id)a3 dataValue:
{
  if (result)
  {
    uint64_t v4 = result;
    id v5 = a3;
    uint64_t v6 = [v5 bytes];
    uint64_t v7 = [v5 length];

    BOOL v8 = v5 != 0;
    BOOL v9 = v6 == 0;
    if (v8 && v9) {
      uint64_t v10 = 3735936685;
    }
    else {
      uint64_t v10 = v6;
    }
    uint64_t v11 = *(sqlite3_stmt **)(v4 + 24);
    if (v8 && v9) {
      sqlite3_uint64 v12 = 0;
    }
    else {
      sqlite3_uint64 v12 = v7;
    }
    return sqlite3_bind_blob64(v11, a2, (const void *)v10, v12, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (void)_bindKey:(uint64_t)a1 value:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = 136315650;
  id v5 = "-[_PBFSQLitePreparedSimpleStatement _bindKey:value:]";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = (id)objc_opt_class();
  id v3 = v9;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "%s: unexpected object %@ of class %@", (uint8_t *)&v4, 0x20u);
}

- (void)_bindParameterIndex:numberValue:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_13_0(&dword_1D31CE000, v0, v1, "%s: unexpected value type '%{public}s' for object %@", v2);
}

@end