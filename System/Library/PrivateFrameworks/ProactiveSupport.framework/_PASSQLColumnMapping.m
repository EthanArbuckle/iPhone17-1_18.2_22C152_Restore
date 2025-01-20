@interface _PASSQLColumnMapping
- (_PASSQLColumnMapping)initWithStatementPtr:(sqlite3_stmt *)a3;
- (int)indexForColumnAlias:(const char *)a3;
- (int)indexForColumnName:(const char *)a3 table:(const char *)uniqueTableName;
- (void)_deallocState;
- (void)_ensureColumnMappingExists;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateIfNeeded;
- (void)resetSearchHint;
@end

@implementation _PASSQLColumnMapping

- (void)dealloc
{
  [(_PASSQLColumnMapping *)self _deallocState];
  v3.receiver = self;
  v3.super_class = (Class)_PASSQLColumnMapping;
  [(_PASSQLColumnMapping *)&v3 dealloc];
}

- (void)_deallocState
{
  _PASCompactStringArrayDestroy((void **)self->_columnAliases);
  _PASCompactStringArrayDestroy((void **)self->_tableColumnNamesFromSchema);
  uniqueTableName = (char *)self->_uniqueTableName;

  free(uniqueTableName);
}

- (_PASSQLColumnMapping)initWithStatementPtr:(sqlite3_stmt *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PASSQLColumnMapping;
  result = [(_PASSQLColumnMapping *)&v5 init];
  if (result) {
    result->_stmt = a3;
  }
  return result;
}

- (void)invalidateIfNeeded
{
  if (self->_tableColumnNamesFromSchema && sqlite3_stmt_status(self->_stmt, 5, 0) != self->_stmtReprepareCounter)
  {
    [(_PASSQLColumnMapping *)self invalidate];
  }
}

- (void)resetSearchHint
{
  tableColumnNamesFromSchema = self->_tableColumnNamesFromSchema;
  if (tableColumnNamesFromSchema)
  {
    int v3 = *((_DWORD *)tableColumnNamesFromSchema + 8);
    if (v3 != -1)
    {
      int v4 = *((_DWORD *)tableColumnNamesFromSchema + 9);
      *((_DWORD *)tableColumnNamesFromSchema + 6) = v3;
      *((_DWORD *)tableColumnNamesFromSchema + 7) = v4;
      *((void *)tableColumnNamesFromSchema + 4) = -1;
    }
    _PASCompactStringArrayResetSearchHint(self->_columnAliases);
  }
}

- (int)indexForColumnAlias:(const char *)a3
{
  if (!a3 || !*a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 201, @"Invalid parameter not satisfying: %@", @"alias && alias[0]" object file lineNumber description];
  }
  [(_PASSQLColumnMapping *)self _ensureColumnMappingExists];
  size_t v6 = strlen(a3);
  uint64_t StringWithSize = _PASCompactStringArrayFindStringWithSize((uint64_t *)self->_columnAliases, (void *)a3, v6);
  if (StringWithSize == -1)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_PASSqliteStatement.m", 205, @"Query does not reference column alias: \"%s\"", a3);
  }
  return StringWithSize;
}

- (int)indexForColumnName:(const char *)a3 table:(const char *)uniqueTableName
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3 || !*a3)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 185, @"Invalid parameter not satisfying: %@", @"columnName && columnName[0]" object file lineNumber description];
  }
  [(_PASSQLColumnMapping *)self _ensureColumnMappingExists];
  if (!uniqueTableName)
  {
    uniqueTableName = self->_uniqueTableName;
    if (!uniqueTableName)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"_PASSqliteStatement.m" lineNumber:188 description:@"nil table name provided for query which references multiple tables"];

      uniqueTableName = self->_uniqueTableName;
    }
  }
  size_t v8 = strlen(a3);
  size_t v9 = strlen(uniqueTableName);
  size_t v10 = v9;
  size_t v11 = v8 + v9;
  size_t v12 = v8 + v9 + 2;
  memptr = 0;
  uint64_t v24 = 0;
  if (v12 > 0x200)
  {
    int v18 = malloc_type_posix_memalign(&memptr, 8uLL, v12, 0x1221BAC7uLL);
    LOBYTE(v24) = 0;
    if (v18)
    {
      id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v21);
    }
    v13 = (char *)memptr;
  }
  else
  {
    v13 = (char *)&v22 - ((v8 + v9 + 17) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, v12);
    memptr = v13;
    LOBYTE(v24) = 1;
  }
  char v14 = v24;
  memcpy(v13, a3, v8);
  v13[v8] = 46;
  memcpy(&v13[v8 + 1], uniqueTableName, v10);
  v13[v8 + 1 + v10] = 0;
  uint64_t StringWithSize = _PASCompactStringArrayFindStringWithSize((uint64_t *)self->_tableColumnNamesFromSchema, v13, v11 + 1);
  if (StringWithSize == -1)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_PASSqliteStatement.m", 194, @"Query does not reference table-qualified column name: \"%s\"", v13);

    if (v14) {
      return StringWithSize;
    }
LABEL_15:
    free(v13);
    return StringWithSize;
  }
  if ((v14 & 1) == 0) {
    goto LABEL_15;
  }
  return StringWithSize;
}

- (void)_ensureColumnMappingExists
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (!self->_tableColumnNamesFromSchema)
  {
    SEL v2 = a2;
    self->_stmtReprepareCounter = sqlite3_stmt_status(self->_stmt, 5, 0);
    operator new();
  }
}

- (void)invalidate
{
  self->_tableColumnNamesFromSchema = 0;
  self->_columnAliases = 0;
  self->_uniqueTableName = 0;
}

@end