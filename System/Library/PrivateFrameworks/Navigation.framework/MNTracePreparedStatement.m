@interface MNTracePreparedStatement
+ (id)preparedStatementForTrace:(id)a3 statement:(id)a4 outError:(id *)a5;
- (BOOL)_prepareStatementForTrace:(id)a3 statement:(id)a4 outError:(id *)a5;
- (BOOL)clearBindings;
- (BOOL)execute;
- (BOOL)reset;
- (BOOL)step;
- (BOOL)stepRow;
- (MNTracePreparedStatement)init;
- (double)columnDouble:(unint64_t)a3;
- (id)columnData:(unint64_t)a3;
- (id)columnObjects:(unint64_t)a3 ofClasses:(id)a4;
- (id)columnObjectsOld:(unint64_t)a3 ofClasses:(id)a4;
- (id)columnString:(unint64_t)a3;
- (id)debugDescription;
- (id)initForTrace:(id)a3 statement:(id)a4 outError:(id *)a5;
- (int)columnInt:(unint64_t)a3;
- (sqlite3)db;
- (sqlite3_stmt)rawStatement;
- (unint64_t)_bindParameterIndexWithName:(id)a3;
- (void)bind:(unint64_t)a3 data:(id)a4;
- (void)bind:(unint64_t)a3 double:(double)a4;
- (void)bind:(unint64_t)a3 int:(int)a4;
- (void)bind:(unint64_t)a3 string:(id)a4;
- (void)bindNull:(unint64_t)a3;
- (void)bindNullParameter:(id)a3;
- (void)bindParameter:(id)a3 data:(id)a4;
- (void)bindParameter:(id)a3 double:(double)a4;
- (void)bindParameter:(id)a3 int:(int)a4;
- (void)bindParameter:(id)a3 string:(id)a4;
- (void)dealloc;
- (void)finalize;
@end

@implementation MNTracePreparedStatement

- (MNTracePreparedStatement)init
{
  result = (MNTracePreparedStatement *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)initForTrace:(id)a3 statement:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MNTracePreparedStatement;
  v10 = [(MNTracePreparedStatement *)&v14 init];
  v11 = v10;
  if (v10)
  {
    if (![(MNTracePreparedStatement *)v10 _prepareStatementForTrace:v8 statement:v9 outError:a5])
    {
      v12 = 0;
      goto LABEL_6;
    }
    v11->_db = (sqlite3 *)[v8 db];
  }
  v12 = v11;
LABEL_6:

  return v12;
}

+ (id)preparedStatementForTrace:(id)a3 statement:(id)a4 outError:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[MNTracePreparedStatement alloc] initForTrace:v8 statement:v7 outError:a5];

  return v9;
}

- (void)dealloc
{
  [(MNTracePreparedStatement *)self finalize];
  v3.receiver = self;
  v3.super_class = (Class)MNTracePreparedStatement;
  [(MNTracePreparedStatement *)&v3 dealloc];
}

- (void)finalize
{
  self->_db = 0;
  self->_preparedStatement = 0;
}

- (BOOL)execute
{
  if ([(MNTracePreparedStatement *)self step]) {
    BOOL v3 = [(MNTracePreparedStatement *)self reset];
  }
  else {
    BOOL v3 = 0;
  }
  return v3 & [(MNTracePreparedStatement *)self clearBindings];
}

- (BOOL)step
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sqlite3_step(self->_preparedStatement);
  int v4 = v3 & 0xFFFFFFFE;
  if ((v3 & 0xFFFFFFFE) != 0x64)
  {
    uint64_t v6 = v3;
    id v7 = NSString;
    id v8 = sqlite3_errstr(v3);
    id v9 = objc_msgSend(v7, "stringWithFormat:", @"Error (%d:%s) calling sqlite3_step(): \"%s\"", v6, v8, sqlite3_errmsg(self->_db));
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "result == SQLITE_DONE || result == SQLITE_ROW";
      __int16 v13 = 2112;
      objc_super v14 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  return v4 == 100;
}

- (BOOL)reset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sqlite3_reset(self->_preparedStatement);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = NSString;
    id v7 = sqlite3_errstr(v3);
    id v8 = objc_msgSend(v6, "stringWithFormat:", @"Error (%d:%s) calling sqlite3_reset(): \"%s\"", v4, v7, sqlite3_errmsg(self->_db));
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "result == SQLITE_OK";
      __int16 v12 = 2112;
      __int16 v13 = v8;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  return v4 == 0;
}

- (BOOL)clearBindings
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sqlite3_clear_bindings(self->_preparedStatement);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = NSString;
    id v7 = sqlite3_errstr(v3);
    id v8 = objc_msgSend(v6, "stringWithFormat:", @"Error (%d:%s) calling sqlite3_clear_bindings(): \"%s\"", v4, v7, sqlite3_errmsg(self->_db));
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "result == SQLITE_OK";
      __int16 v12 = 2112;
      __int16 v13 = v8;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  return v4 == 0;
}

- (void)bind:(unint64_t)a3 int:(int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sqlite3_bind_int(self->_preparedStatement, a3, a4);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = NSString;
    id v8 = sqlite3_errstr(v5);
    id v9 = objc_msgSend(v7, "stringWithFormat:", @"Error (%d:%s) calling sqlite3_bind_int(): \"%s\"", v6, v8, sqlite3_errmsg(self->_db));
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v12 = "result == SQLITE_OK";
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
}

- (void)bind:(unint64_t)a3 double:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = sqlite3_bind_double(self->_preparedStatement, a3, a4);
  if (v5)
  {
    uint64_t v6 = NSString;
    id v7 = sqlite3_errstr(v5);
    id v8 = objc_msgSend(v6, "stringWithFormat:", @"Error (%s) calling sqlite3_bind_double(): %s", v7, sqlite3_errmsg(self->_db));
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "result == SQLITE_OK";
      __int16 v12 = 2112;
      __int16 v13 = v8;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
}

- (void)bind:(unint64_t)a3 string:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = sqlite3_bind_text(self->_preparedStatement, a3, (const char *)[a4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v5)
  {
    uint64_t v6 = NSString;
    id v7 = sqlite3_errstr(v5);
    id v8 = objc_msgSend(v6, "stringWithFormat:", @"Error (%s) calling sqlite3_bind_text(): %s", v7, sqlite3_errmsg(self->_db));
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "result == SQLITE_OK";
      __int16 v12 = 2112;
      __int16 v13 = v8;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
}

- (void)bind:(unint64_t)a3 data:(id)a4
{
  int v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  preparedStatement = self->_preparedStatement;
  id v7 = a4;
  id v8 = (const void *)[v7 bytes];
  int v9 = [v7 length];

  int v10 = sqlite3_bind_blob(preparedStatement, v4, v8, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v10)
  {
    v11 = NSString;
    __int16 v12 = sqlite3_errstr(v10);
    __int16 v13 = objc_msgSend(v11, "stringWithFormat:", @"Error (%s) calling sqlite3_bind_blob(): %s", v12, sqlite3_errmsg(self->_db));
    uint64_t v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "result == SQLITE_OK";
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
}

- (void)bindNull:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = sqlite3_bind_null(self->_preparedStatement, a3);
  if (v4)
  {
    int v5 = NSString;
    uint64_t v6 = sqlite3_errstr(v4);
    id v7 = objc_msgSend(v5, "stringWithFormat:", @"Error (%s) calling sqlite3_bind_null(): %s", v6, sqlite3_errmsg(self->_db));
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v10 = "result == SQLITE_OK";
      __int16 v11 = 2112;
      __int16 v12 = v7;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
}

- (void)bindParameter:(id)a3 int:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  unint64_t v6 = [(MNTracePreparedStatement *)self _bindParameterIndexWithName:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(MNTracePreparedStatement *)self bind:v6 int:v4];
  }
}

- (void)bindParameter:(id)a3 double:(double)a4
{
  unint64_t v6 = [(MNTracePreparedStatement *)self _bindParameterIndexWithName:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(MNTracePreparedStatement *)self bind:v6 double:a4];
  }
}

- (void)bindParameter:(id)a3 string:(id)a4
{
  id v7 = a4;
  unint64_t v6 = [(MNTracePreparedStatement *)self _bindParameterIndexWithName:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [(MNTracePreparedStatement *)self bind:v6 string:v7];
  }
}

- (void)bindParameter:(id)a3 data:(id)a4
{
  id v7 = a4;
  unint64_t v6 = [(MNTracePreparedStatement *)self _bindParameterIndexWithName:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [(MNTracePreparedStatement *)self bind:v6 data:v7];
  }
}

- (void)bindNullParameter:(id)a3
{
  unint64_t v4 = [(MNTracePreparedStatement *)self _bindParameterIndexWithName:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(MNTracePreparedStatement *)self bindNull:v4];
  }
}

- (BOOL)stepRow
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sqlite3_step(self->_preparedStatement);
  uint64_t v4 = v3;
  if ((v3 & 0xFFFFFFFE) != 0x64)
  {
    unint64_t v6 = NSString;
    id v7 = sqlite3_errstr(v3);
    id v8 = objc_msgSend(v6, "stringWithFormat:", @"Error (%d:%s) calling sqlite3_step(): \"%s\"", v4, v7, sqlite3_errmsg(self->_db));
    int v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v11 = "result == SQLITE_DONE || result == SQLITE_ROW";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  return v4 == 100;
}

- (int)columnInt:(unint64_t)a3
{
  return sqlite3_column_int(self->_preparedStatement, a3);
}

- (double)columnDouble:(unint64_t)a3
{
  return sqlite3_column_double(self->_preparedStatement, a3);
}

- (id)columnString:(unint64_t)a3
{
  uint64_t v3 = sqlite3_column_text(self->_preparedStatement, a3);
  if (v3)
  {
    uint64_t v4 = [NSString stringWithUTF8String:v3];
  }
  else
  {
    uint64_t v4 = &stru_1F0E08010;
  }
  return v4;
}

- (id)columnData:(unint64_t)a3
{
  int v3 = a3;
  int v5 = sqlite3_column_bytes(self->_preparedStatement, a3);
  if (v5 < 1)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", sqlite3_column_blob(self->_preparedStatement, v3), v5);
  }
  return v6;
}

- (id)columnObjects:(unint64_t)a3 ofClasses:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = a4;
  int v9 = [v7 setWithObject:objc_opt_class()];
  int v10 = [(MNTracePreparedStatement *)self columnData:a3];
  id v15 = 0;
  __int16 v11 = [v6 unarchivedDictionaryWithKeysOfClasses:v9 objectsOfClasses:v8 fromData:v10 error:&v15];

  id v12 = v15;
  if (v12)
  {
    uint64_t v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "columnObjects error decoding: %@", buf, 0xCu);
    }
  }
  return v11;
}

- (id)columnObjectsOld:(unint64_t)a3 ofClasses:(id)a4
{
  unint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a4;
  id v8 = [(MNTracePreparedStatement *)self columnData:a3];
  int v9 = [v6 unarchivedArrayOfObjectsOfClasses:v7 fromData:v8 error:0];

  return v9;
}

- (sqlite3)db
{
  return self->_db;
}

- (sqlite3_stmt)rawStatement
{
  return self->_preparedStatement;
}

- (BOOL)_prepareStatementForTrace:(id)a3 statement:(id)a4 outError:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  int v10 = (sqlite3 *)[v8 db];
  id v11 = v9;
  int v12 = sqlite3_prepare_v2(v10, (const char *)[v11 UTF8String], -1, &self->_preparedStatement, 0);
  if (v12)
  {
    uint64_t v13 = sqlite3_errmsg((sqlite3 *)[v8 db]);
    uint64_t v14 = [NSString stringWithFormat:@"Error (%s) preparing statement \"%@\": %s", sqlite3_errstr(v12), v11, v13];
    id v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (a5)
    {
      uint64_t v19 = *MEMORY[0x1E4F28228];
      v20 = v14;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MNTraceErrorDomain" code:9 userInfo:v16];
      *a5 = v17;
    }
  }

  return v12 == 0;
}

- (unint64_t)_bindParameterIndexWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  preparedStatement = self->_preparedStatement;
  id v6 = v4;
  int v7 = sqlite3_bind_parameter_index(preparedStatement, (const char *)[v6 UTF8String]);
  if (v7 <= 0)
  {
    int v10 = [NSString stringWithFormat:@"Error calling -[MNTracePreparedStatement bindParameter:] because no parameter with the name \"%@\" was found.", v6];
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "NO";
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v8 = v7;
  }

  return v8;
}

- (id)debugDescription
{
  v2 = sqlite3_expanded_sql(self->_preparedStatement);
  int v3 = NSString;
  return (id)[v3 stringWithUTF8String:v2];
}

@end