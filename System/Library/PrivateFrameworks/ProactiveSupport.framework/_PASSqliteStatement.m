@interface _PASSqliteStatement
- (BOOL)isColumnNull:(int)a3;
- (BOOL)isNullForColumnAlias:(const char *)a3;
- (BOOL)isNullForColumnName:(const char *)a3 table:(const char *)a4;
- (_PASSQLColumnMapping)columnMapping;
- (_PASSqliteStatement)initWithStatementPointer:(sqlite3_stmt *)a3;
- (_PASSqliteStatement)initWithStatementPointer:(sqlite3_stmt *)a3 columnMapping:(id)a4;
- (double)getDoubleForColumn:(int)a3;
- (double)getDoubleForColumnAlias:(const char *)a3;
- (double)getDoubleForColumnName:(const char *)a3 table:(const char *)a4;
- (id)description;
- (id)doubleAsNonnullNSNumberForColumn:(int)a3;
- (id)doubleAsNonnullNSNumberForColumnAlias:(const char *)a3;
- (id)doubleAsNonnullNSNumberForColumnName:(const char *)a3 table:(const char *)a4;
- (id)getDoubleAsNSNumberForColumn:(int)a3;
- (id)getDoubleAsNSNumberForColumnAlias:(const char *)a3;
- (id)getDoubleAsNSNumberForColumnName:(const char *)a3 table:(const char *)a4;
- (id)getInt64AsNSNumberForColumn:(int)a3;
- (id)getInt64AsNSNumberForColumnAlias:(const char *)a3;
- (id)getInt64AsNSNumberForColumnName:(const char *)a3 table:(const char *)a4;
- (id)getNSDataForColumn:(int)a3;
- (id)getNSDataForColumnAlias:(const char *)a3;
- (id)getNSDataForColumnName:(const char *)a3 table:(const char *)a4;
- (id)getNSNumberForColumn:(int)a3;
- (id)getNSNumberForColumnAlias:(const char *)a3;
- (id)getNSNumberForColumnName:(const char *)a3 table:(const char *)a4;
- (id)getNSStringForColumn:(int)a3;
- (id)getNSStringForColumnAlias:(const char *)a3;
- (id)getNSStringForColumnName:(const char *)a3 table:(const char *)a4;
- (id)int64AsNonnullNSNumberForColumn:(int)a3;
- (id)int64AsNonnullNSNumberForColumnAlias:(const char *)a3;
- (id)int64AsNonnullNSNumberForColumnName:(const char *)a3 table:(const char *)a4;
- (id)nonnullNSDataForColumn:(int)a3;
- (id)nonnullNSDataForColumnAlias:(const char *)a3;
- (id)nonnullNSDataForColumnName:(const char *)a3 table:(const char *)a4;
- (id)nonnullNSNumberForColumn:(int)a3;
- (id)nonnullNSNumberForColumnAlias:(const char *)a3;
- (id)nonnullNSNumberForColumnName:(const char *)a3 table:(const char *)a4;
- (id)nonnullNSStringForColumn:(int)a3;
- (id)nonnullNSStringForColumnAlias:(const char *)a3;
- (id)nonnullNSStringForColumnName:(const char *)a3 table:(const char *)a4;
- (int)_bindParam:(int)a3 toObjcObject:(id)a4 sqliteMethodName:(const char *)a5;
- (int)_checkBindStatus:(int)a3 forIndex:(int)a4;
- (int)bindNamedParam:(const char *)a3 toBlock:(id)a4;
- (int)bindNamedParam:(const char *)a3 toDouble:(double)a4;
- (int)bindNamedParam:(const char *)a3 toDoubleAsNSNumber:(id)a4;
- (int)bindNamedParam:(const char *)a3 toDoubleAsNonnullNSNumber:(id)a4;
- (int)bindNamedParam:(const char *)a3 toInt64:(int64_t)a4;
- (int)bindNamedParam:(const char *)a3 toInt64AsNSNumber:(id)a4;
- (int)bindNamedParam:(const char *)a3 toInt64AsNonnullNSNumber:(id)a4;
- (int)bindNamedParam:(const char *)a3 toInteger:(int64_t)a4;
- (int)bindNamedParam:(const char *)a3 toNSArray:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNSData:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNSDictionary:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNSIndexSet:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNSNumber:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNSOrderedSet:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNSSet:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNSString:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNonnullNSData:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNonnullNSNumber:(id)a4;
- (int)bindNamedParam:(const char *)a3 toNonnullNSString:(id)a4;
- (int)bindNamedParamToNull:(const char *)a3;
- (int)bindParam:(int)a3 toBlock:(id)a4;
- (int)bindParam:(int)a3 toDouble:(double)a4;
- (int)bindParam:(int)a3 toDoubleAsNSNumber:(id)a4;
- (int)bindParam:(int)a3 toDoubleAsNonnullNSNumber:(id)a4;
- (int)bindParam:(int)a3 toInt64:(int64_t)a4;
- (int)bindParam:(int)a3 toInt64AsNSNumber:(id)a4;
- (int)bindParam:(int)a3 toInt64AsNonnullNSNumber:(id)a4;
- (int)bindParam:(int)a3 toInteger:(int64_t)a4;
- (int)bindParam:(int)a3 toNSArray:(id)a4;
- (int)bindParam:(int)a3 toNSData:(id)a4;
- (int)bindParam:(int)a3 toNSDictionary:(id)a4;
- (int)bindParam:(int)a3 toNSIndexSet:(id)a4;
- (int)bindParam:(int)a3 toNSNumber:(id)a4;
- (int)bindParam:(int)a3 toNSOrderedSet:(id)a4;
- (int)bindParam:(int)a3 toNSSet:(id)a4;
- (int)bindParam:(int)a3 toNSString:(id)a4;
- (int)bindParam:(int)a3 toNonnullNSData:(id)a4;
- (int)bindParam:(int)a3 toNonnullNSNumber:(id)a4;
- (int)bindParam:(int)a3 toNonnullNSString:(id)a4;
- (int)bindParamToNull:(int)a3;
- (int64_t)getInt64ForColumn:(int)a3;
- (int64_t)getInt64ForColumnAlias:(const char *)a3;
- (int64_t)getInt64ForColumnName:(const char *)a3 table:(const char *)a4;
- (int64_t)getIntegerForColumn:(int)a3;
- (int64_t)getIntegerForColumnAlias:(const char *)a3;
- (int64_t)getIntegerForColumnName:(const char *)a3 table:(const char *)a4;
- (sqlite3_stmt)stmt;
- (void)accessBlobBytesForColumn:(int)a3 usingBlock:(id)a4;
- (void)accessBlobBytesForColumnAlias:(const char *)a3 usingBlock:(id)a4;
- (void)accessBlobBytesForColumnName:(const char *)a3 table:(const char *)a4 usingBlock:(id)a5;
- (void)prepareForRowDeserialization;
- (void)prepareToRunQuery;
@end

@implementation _PASSqliteStatement

- (int64_t)getInt64ForColumn:(int)a3
{
  return sqlite3_column_int64(self->_stmt, a3);
}

- (void).cxx_destruct
{
}

- (id)getNSDataForColumn:(int)a3
{
  return _PAS_sqlite3_column_nsdata(self->_stmt, a3);
}

- (BOOL)isColumnNull:(int)a3
{
  return sqlite3_column_type(self->_stmt, a3) == 5;
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (_PASSqliteStatement)initWithStatementPointer:(sqlite3_stmt *)a3 columnMapping:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 222, @"Invalid parameter not satisfying: %@", @"stmt" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)_PASSqliteStatement;
  v8 = [(_PASSqliteStatement *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_stmt = a3;
    if (v7) {
      v10 = (_PASSQLColumnMapping *)v7;
    }
    else {
      v10 = [[_PASSQLColumnMapping alloc] initWithStatementPtr:a3];
    }
    columnMapping = v9->_columnMapping;
    v9->_columnMapping = v10;
  }
  return v9;
}

- (void)prepareToRunQuery
{
}

- (_PASSQLColumnMapping)columnMapping
{
  return self->_columnMapping;
}

- (int)_checkBindStatus:(int)a3 forIndex:(int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    if (a3 == 7)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 376, @"SQLITE_NOMEM when binding to index %i: %@", v5, self object file lineNumber description];
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109890;
      int v11 = a3;
      __int16 v12 = 2080;
      v13 = sqlite3_errstr(a3);
      __int16 v14 = 1024;
      int v15 = v5;
      __int16 v16 = 2112;
      v17 = self;
      _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Error %i (%s) binding to index %i (this is typically caused by a bug, and may become a fatal error in the future!): %@", buf, 0x22u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
  return a3;
}

- (int)bindParam:(int)a3 toNonnullNSString:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = _PAS_sqlite3_bind_nsstring(self->_stmt, a3, a4);

  return [(_PASSqliteStatement *)self _checkBindStatus:v6 forIndex:v4];
}

- (int)bindParam:(int)a3 toNSString:(id)a4
{
  if (a4) {
    return -[_PASSqliteStatement bindParam:toNonnullNSString:](self, "bindParam:toNonnullNSString:", *(void *)&a3);
  }
  else {
    return [(_PASSqliteStatement *)self bindParamToNull:*(void *)&a3];
  }
}

- (void)prepareForRowDeserialization
{
}

- (int)bindNamedParam:(const char *)a3 toNSString:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNSString:v7];

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toInt64:(int64_t)a4
{
  stmt = self->_stmt;
  int v6 = _indexForBindParam(stmt, (char *)a3);

  return sqlite3_bind_int64(stmt, v6, a4);
}

- (int)bindNamedParam:(const char *)a3 toNonnullNSString:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNonnullNSString:v7];

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSData:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNSData:v7];

  return (int)a3;
}

- (int)bindParam:(int)a3 toNonnullNSData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = _PAS_sqlite3_bind_nsdata(self->_stmt, a3, a4);

  return [(_PASSqliteStatement *)self _checkBindStatus:v6 forIndex:v4];
}

- (int)bindParam:(int)a3 toNSData:(id)a4
{
  if (a4) {
    return -[_PASSqliteStatement bindParam:toNonnullNSData:](self, "bindParam:toNonnullNSData:", *(void *)&a3);
  }
  else {
    return [(_PASSqliteStatement *)self bindParamToNull:*(void *)&a3];
  }
}

- (int)bindNamedParam:(const char *)a3 toBlock:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toBlock:v7];

  return (int)a3;
}

- (int)bindParam:(int)a3 toBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (void *)[a4 copy];
  LODWORD(v4) = [(_PASSqliteStatement *)self _bindParam:v4 toObjcObject:v6 sqliteMethodName:"_pas_block"];

  return v4;
}

- (int)bindNamedParam:(const char *)a3 toNSIndexSet:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNSIndexSet:v7];

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSSet:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNSSet:v7];

  return (int)a3;
}

- (int)_bindParam:(int)a3 toObjcObject:(id)a4 sqliteMethodName:(const char *)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v14 = a5;
    __int16 v15 = 2112;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2048;
    id v18 = v9;
    __int16 v19 = 1024;
    int v20 = v6;
    id v11 = v16;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "#passqlitestatement Retaining %s(%@ %p) for param %d", buf, 0x26u);

    if (v9) {
      return [(_PASSqliteStatement *)self _checkBindStatus:sqlite3_bind_pointer(self->_stmt, v6, v9, a5, (void (__cdecl *)(void *))releaseObjcObject) forIndex:v6];
    }
LABEL_5:
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 496, @"Invalid parameter not satisfying: %@", @"objcObject" object file lineNumber description];

    return [(_PASSqliteStatement *)self _checkBindStatus:sqlite3_bind_pointer(self->_stmt, v6, v9, a5, (void (__cdecl *)(void *))releaseObjcObject) forIndex:v6];
  }
  if (!v9) {
    goto LABEL_5;
  }
  return [(_PASSqliteStatement *)self _checkBindStatus:sqlite3_bind_pointer(self->_stmt, v6, v9, a5, (void (__cdecl *)(void *))releaseObjcObject) forIndex:v6];
}

- (int)bindParam:(int)a3 toNSSet:(id)a4
{
  return [(_PASSqliteStatement *)self _bindParam:*(void *)&a3 toObjcObject:a4 sqliteMethodName:"_pas_nsset"];
}

- (int)bindParam:(int)a3 toNSIndexSet:(id)a4
{
  return [(_PASSqliteStatement *)self _bindParam:*(void *)&a3 toObjcObject:a4 sqliteMethodName:"_pas_nsindexset"];
}

- (int)bindNamedParam:(const char *)a3 toDouble:(double)a4
{
  stmt = self->_stmt;
  int v6 = _indexForBindParam(stmt, (char *)a3);

  return sqlite3_bind_double(stmt, v6, a4);
}

- (BOOL)isNullForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self isColumnNull:v4];
}

- (id)nonnullNSNumberForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self nonnullNSNumberForColumn:v4];
}

- (id)getNSNumberForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self getNSNumberForColumn:v4];
}

- (id)doubleAsNonnullNSNumberForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self doubleAsNonnullNSNumberForColumn:v4];
}

- (id)getDoubleAsNSNumberForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self getDoubleAsNSNumberForColumn:v4];
}

- (double)getDoubleForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  [(_PASSqliteStatement *)self getDoubleForColumn:v4];
  return result;
}

- (id)int64AsNonnullNSNumberForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self int64AsNonnullNSNumberForColumn:v4];
}

- (id)getInt64AsNSNumberForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self getInt64AsNSNumberForColumn:v4];
}

- (int64_t)getInt64ForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self getInt64ForColumn:v4];
}

- (int64_t)getIntegerForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self getIntegerForColumn:v4];
}

- (void)accessBlobBytesForColumnAlias:(const char *)a3 usingBlock:(id)a4
{
  columnMapping = self->_columnMapping;
  id v7 = a4;
  [(_PASSqliteStatement *)self accessBlobBytesForColumn:[(_PASSQLColumnMapping *)columnMapping indexForColumnAlias:a3] usingBlock:v7];
}

- (id)nonnullNSDataForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self nonnullNSDataForColumn:v4];
}

- (id)getNSDataForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self getNSDataForColumn:v4];
}

- (id)nonnullNSStringForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self nonnullNSStringForColumn:v4];
}

- (id)getNSStringForColumnAlias:(const char *)a3
{
  uint64_t v4 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnAlias:a3];

  return [(_PASSqliteStatement *)self getNSStringForColumn:v4];
}

- (BOOL)isNullForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self isColumnNull:v5];
}

- (id)nonnullNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self nonnullNSNumberForColumn:v5];
}

- (id)getNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self getNSNumberForColumn:v5];
}

- (id)doubleAsNonnullNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self doubleAsNonnullNSNumberForColumn:v5];
}

- (id)getDoubleAsNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self getDoubleAsNSNumberForColumn:v5];
}

- (double)getDoubleForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  [(_PASSqliteStatement *)self getDoubleForColumn:v5];
  return result;
}

- (id)int64AsNonnullNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self int64AsNonnullNSNumberForColumn:v5];
}

- (id)getInt64AsNSNumberForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self getInt64AsNSNumberForColumn:v5];
}

- (int64_t)getInt64ForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self getInt64ForColumn:v5];
}

- (int64_t)getIntegerForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self getIntegerForColumn:v5];
}

- (void)accessBlobBytesForColumnName:(const char *)a3 table:(const char *)a4 usingBlock:(id)a5
{
  columnMapping = self->_columnMapping;
  id v9 = a5;
  [(_PASSqliteStatement *)self accessBlobBytesForColumn:[(_PASSQLColumnMapping *)columnMapping indexForColumnName:a3 table:a4] usingBlock:v9];
}

- (id)nonnullNSDataForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self nonnullNSDataForColumn:v5];
}

- (id)getNSDataForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self getNSDataForColumn:v5];
}

- (id)nonnullNSStringForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self nonnullNSStringForColumn:v5];
}

- (id)getNSStringForColumnName:(const char *)a3 table:(const char *)a4
{
  uint64_t v5 = [(_PASSQLColumnMapping *)self->_columnMapping indexForColumnName:a3 table:a4];

  return [(_PASSqliteStatement *)self getNSStringForColumn:v5];
}

- (id)nonnullNSNumberForColumn:(int)a3
{
  uint64_t v5 = [(_PASSqliteStatement *)self getNSNumberForColumn:*(void *)&a3];
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 626, @"Invalid parameter not satisfying: %@", @"val != nil" object file lineNumber description];
  }

  return v5;
}

- (id)getNSNumberForColumn:(int)a3
{
  int v5 = sqlite3_column_type(self->_stmt, a3);
  if (v5 == 5)
  {
    int v6 = 0;
  }
  else
  {
    if (v5 == 1) {
      objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(self->_stmt, a3));
    }
    else {
    int v6 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(self->_stmt, a3));
    }
  }

  return v6;
}

- (id)doubleAsNonnullNSNumberForColumn:(int)a3
{
  int v5 = [(_PASSqliteStatement *)self getDoubleAsNSNumberForColumn:*(void *)&a3];
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 607, @"Invalid parameter not satisfying: %@", @"val != nil" object file lineNumber description];
  }

  return v5;
}

- (id)getDoubleAsNSNumberForColumn:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[_PASSqliteStatement isColumnNull:](self, "isColumnNull:"))
  {
    int v5 = 0;
  }
  else
  {
    int v6 = NSNumber;
    [(_PASSqliteStatement *)self getDoubleForColumn:v3];
    int v5 = objc_msgSend(v6, "numberWithDouble:");
  }

  return v5;
}

- (double)getDoubleForColumn:(int)a3
{
  return sqlite3_column_double(self->_stmt, a3);
}

- (id)int64AsNonnullNSNumberForColumn:(int)a3
{
  int v5 = [(_PASSqliteStatement *)self getInt64AsNSNumberForColumn:*(void *)&a3];
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 586, @"Invalid parameter not satisfying: %@", @"val != nil" object file lineNumber description];
  }

  return v5;
}

- (id)getInt64AsNSNumberForColumn:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[_PASSqliteStatement isColumnNull:](self, "isColumnNull:"))
  {
    int v5 = 0;
  }
  else
  {
    int v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_PASSqliteStatement getInt64ForColumn:](self, "getInt64ForColumn:", v3));
  }

  return v5;
}

- (int64_t)getIntegerForColumn:(int)a3
{
  return sqlite3_column_int64(self->_stmt, a3);
}

- (void)accessBlobBytesForColumn:(int)a3 usingBlock:(id)a4
{
}

- (id)nonnullNSDataForColumn:(int)a3
{
  int v5 = [(_PASSqliteStatement *)self getNSDataForColumn:*(void *)&a3];
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 555, @"Invalid parameter not satisfying: %@", @"val != nil" object file lineNumber description];
  }

  return v5;
}

- (id)nonnullNSStringForColumn:(int)a3
{
  int v5 = [(_PASSqliteStatement *)self getNSStringForColumn:*(void *)&a3];
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 543, @"Invalid parameter not satisfying: %@", @"val != nil" object file lineNumber description];
  }

  return v5;
}

- (id)getNSStringForColumn:(int)a3
{
  return _PAS_sqlite3_column_nsstring(self->_stmt, a3);
}

- (int)bindParam:(int)a3 toNSDictionary:(id)a4
{
  return [(_PASSqliteStatement *)self _bindParam:*(void *)&a3 toObjcObject:a4 sqliteMethodName:"_pas_nsdictionary"];
}

- (int)bindParam:(int)a3 toNSOrderedSet:(id)a4
{
  return [(_PASSqliteStatement *)self _bindParam:*(void *)&a3 toObjcObject:a4 sqliteMethodName:"_pas_nsorderedset"];
}

- (int)bindParam:(int)a3 toNSArray:(id)a4
{
  return [(_PASSqliteStatement *)self _bindParam:*(void *)&a3 toObjcObject:a4 sqliteMethodName:"_pas_nsarray"];
}

- (int)bindParam:(int)a3 toNonnullNSNumber:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 480, @"Invalid parameter not satisfying: %@", @"val != nil" object file lineNumber description];
  }
  if (CFNumberIsFloatType((CFNumberRef)v7))
  {
    [v7 doubleValue];
    int v8 = -[_PASSqliteStatement bindParam:toDouble:](self, "bindParam:toDouble:", v4);
  }
  else
  {
    int v8 = -[_PASSqliteStatement bindParam:toInt64:](self, "bindParam:toInt64:", v4, [v7 longLongValue]);
  }
  int v9 = v8;

  return v9;
}

- (int)bindParam:(int)a3 toNSNumber:(id)a4
{
  if (a4) {
    return -[_PASSqliteStatement bindParam:toNonnullNSNumber:](self, "bindParam:toNonnullNSNumber:", *(void *)&a3);
  }
  else {
    return [(_PASSqliteStatement *)self bindParamToNull:*(void *)&a3];
  }
}

- (int)bindParam:(int)a3 toDoubleAsNonnullNSNumber:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 466, @"Invalid parameter not satisfying: %@", @"val != nil" object file lineNumber description];
  }
  [v7 doubleValue];
  int v8 = -[_PASSqliteStatement bindParam:toDouble:](self, "bindParam:toDouble:", v4);

  return v8;
}

- (int)bindParam:(int)a3 toDoubleAsNSNumber:(id)a4
{
  if (a4) {
    return -[_PASSqliteStatement bindParam:toDoubleAsNonnullNSNumber:](self, "bindParam:toDoubleAsNonnullNSNumber:", *(void *)&a3);
  }
  else {
    return [(_PASSqliteStatement *)self bindParamToNull:*(void *)&a3];
  }
}

- (int)bindParam:(int)a3 toDouble:(double)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = sqlite3_bind_double(self->_stmt, a3, a4);

  return [(_PASSqliteStatement *)self _checkBindStatus:v6 forIndex:v4];
}

- (int)bindParam:(int)a3 toInt64AsNonnullNSNumber:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_PASSqliteStatement.m", 445, @"Invalid parameter not satisfying: %@", @"val != nil" object file lineNumber description];
  }
  int v8 = -[_PASSqliteStatement bindParam:toInt64:](self, "bindParam:toInt64:", v4, [v7 longLongValue]);

  return v8;
}

- (int)bindParam:(int)a3 toInt64AsNSNumber:(id)a4
{
  if (a4) {
    return -[_PASSqliteStatement bindParam:toInt64AsNonnullNSNumber:](self, "bindParam:toInt64AsNonnullNSNumber:", *(void *)&a3);
  }
  else {
    return [(_PASSqliteStatement *)self bindParamToNull:*(void *)&a3];
  }
}

- (int)bindParam:(int)a3 toInt64:(int64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = sqlite3_bind_int64(self->_stmt, a3, a4);

  return [(_PASSqliteStatement *)self _checkBindStatus:v6 forIndex:v4];
}

- (int)bindParam:(int)a3 toInteger:(int64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = sqlite3_bind_int64(self->_stmt, a3, a4);

  return [(_PASSqliteStatement *)self _checkBindStatus:v6 forIndex:v4];
}

- (int)bindParamToNull:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = sqlite3_bind_null(self->_stmt, a3);

  return [(_PASSqliteStatement *)self _checkBindStatus:v5 forIndex:v3];
}

- (int)bindNamedParam:(const char *)a3 toNSDictionary:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNSDictionary:v7];

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSOrderedSet:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNSOrderedSet:v7];

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSArray:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNSArray:v7];

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNonnullNSNumber:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNonnullNSNumber:v7];

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toNSNumber:(id)a4
{
  if (a4) {
    return -[_PASSqliteStatement bindNamedParam:toNonnullNSNumber:](self, "bindNamedParam:toNonnullNSNumber:", a3);
  }
  else {
    return [(_PASSqliteStatement *)self bindNamedParamToNull:a3];
  }
}

- (int)bindNamedParam:(const char *)a3 toDoubleAsNonnullNSNumber:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toDoubleAsNonnullNSNumber:v7];

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toDoubleAsNSNumber:(id)a4
{
  if (a4) {
    return -[_PASSqliteStatement bindNamedParam:toDoubleAsNonnullNSNumber:](self, "bindNamedParam:toDoubleAsNonnullNSNumber:", a3);
  }
  else {
    return [(_PASSqliteStatement *)self bindNamedParamToNull:a3];
  }
}

- (int)bindNamedParam:(const char *)a3 toInt64AsNonnullNSNumber:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toInt64AsNonnullNSNumber:v7];

  return (int)a3;
}

- (int)bindNamedParam:(const char *)a3 toInt64AsNSNumber:(id)a4
{
  if (a4) {
    return -[_PASSqliteStatement bindNamedParam:toInt64AsNonnullNSNumber:](self, "bindNamedParam:toInt64AsNonnullNSNumber:", a3);
  }
  else {
    return [(_PASSqliteStatement *)self bindNamedParamToNull:a3];
  }
}

- (int)bindNamedParam:(const char *)a3 toInteger:(int64_t)a4
{
  stmt = self->_stmt;
  int v6 = _indexForBindParam(stmt, (char *)a3);

  return sqlite3_bind_int64(stmt, v6, a4);
}

- (int)bindNamedParam:(const char *)a3 toNonnullNSData:(id)a4
{
  stmt = self->_stmt;
  id v7 = a4;
  LODWORD(a3) = [(_PASSqliteStatement *)self bindParam:_indexForBindParam(stmt, (char *)a3) toNonnullNSData:v7];

  return (int)a3;
}

- (int)bindNamedParamToNull:(const char *)a3
{
  stmt = self->_stmt;
  int v4 = _indexForBindParam(stmt, (char *)a3);

  return sqlite3_bind_null(stmt, v4);
}

- (id)description
{
  id v3 = [NSString alloc];
  int v4 = (void *)[[NSString alloc] initWithCString:sqlite3_sql(self->_stmt) encoding:4];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<stmt: '%@'>", v4];

  return v5;
}

- (_PASSqliteStatement)initWithStatementPointer:(sqlite3_stmt *)a3
{
  return [(_PASSqliteStatement *)self initWithStatementPointer:a3 columnMapping:0];
}

@end