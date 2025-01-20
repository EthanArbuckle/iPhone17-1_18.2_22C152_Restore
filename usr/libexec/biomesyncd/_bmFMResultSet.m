@interface _bmFMResultSet
+ (id)resultSetWithStatement:(id)a3 usingParentDatabase:(id)a4 shouldAutoClose:(BOOL)a5;
- (BOOL)BOOLForColumn:(id)a3;
- (BOOL)BOOLForColumnIndex:(int)a3;
- (BOOL)bindWithArray:(id)a3;
- (BOOL)bindWithArray:(id)a3 orDictionary:(id)a4 orVAList:(char *)a5;
- (BOOL)bindWithDictionary:(id)a3;
- (BOOL)columnIndexIsNull:(int)a3;
- (BOOL)columnIsNull:(id)a3;
- (BOOL)hasAnotherRow;
- (BOOL)next;
- (BOOL)nextWithError:(id *)a3;
- (BOOL)shouldAutoClose;
- (BOOL)step;
- (BOOL)stepWithError:(id *)a3;
- (NSDictionary)resultDictionary;
- (NSMutableDictionary)columnNameToIndexMap;
- (NSString)query;
- (_bmFMDatabase)parentDB;
- (_bmFMStatement)statement;
- (const)UTF8StringForColumn:(id)a3;
- (const)UTF8StringForColumnIndex:(int)a3;
- (const)UTF8StringForColumnName:(id)a3;
- (double)doubleForColumn:(id)a3;
- (double)doubleForColumnIndex:(int)a3;
- (id)columnNameForIndex:(int)a3;
- (id)dataForColumn:(id)a3;
- (id)dataForColumnIndex:(int)a3;
- (id)dataNoCopyForColumn:(id)a3;
- (id)dataNoCopyForColumnIndex:(int)a3;
- (id)dateForColumn:(id)a3;
- (id)dateForColumnIndex:(int)a3;
- (id)objectForColumn:(id)a3;
- (id)objectForColumnIndex:(int)a3;
- (id)objectForColumnName:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)resultDict;
- (id)stringForColumn:(id)a3;
- (id)stringForColumnIndex:(int)a3;
- (int)columnCount;
- (int)columnIndexForName:(id)a3;
- (int)intForColumn:(id)a3;
- (int)intForColumnIndex:(int)a3;
- (int)internalStepWithError:(id *)a3;
- (int64_t)longForColumn:(id)a3;
- (int64_t)longForColumnIndex:(int)a3;
- (int64_t)longLongIntForColumn:(id)a3;
- (int64_t)longLongIntForColumnIndex:(int)a3;
- (unint64_t)unsignedLongLongIntForColumn:(id)a3;
- (void)_tryLogSqliteColumnError:(int)a3;
- (void)close;
- (void)dealloc;
- (void)enumerateWithBlock:(id)a3;
- (void)kvcMagic:(id)a3;
- (void)setParentDB:(id)a3;
- (void)setQuery:(id)a3;
- (void)setShouldAutoClose:(BOOL)a3;
- (void)setStatement:(id)a3;
@end

@implementation _bmFMResultSet

- (void)enumerateWithBlock:(id)a3
{
  v4 = (void (**)(id, _bmFMResultSet *, unsigned char *))a3;
LABEL_2:
  uint64_t v6 = 10;
  while ([(_bmFMResultSet *)self next])
  {
    char v7 = 0;
    v4[2](v4, self, &v7);
    if (v7) {
      break;
    }
    if (!--v6)
    {
      goto LABEL_2;
    }
  }
}

+ (id)resultSetWithStatement:(id)a3 usingParentDatabase:(id)a4 shouldAutoClose:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = objc_alloc_init(_bmFMResultSet);
  [(_bmFMResultSet *)v11 setStatement:v9];
  [(_bmFMResultSet *)v11 setParentDB:v10];

  [(_bmFMResultSet *)v11 setShouldAutoClose:v5];
  if ([v9 inUse])
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"FMResultSet.m", 38, @"Invalid parameter not satisfying: %@", @"![statement inUse]" object file lineNumber description];
  }
  [v9 setInUse:1];

  return v11;
}

- (void)dealloc
{
  [(_bmFMResultSet *)self close];
  query = self->_query;
  self->_query = 0;

  columnNameToIndexMap = self->_columnNameToIndexMap;
  self->_columnNameToIndexMap = 0;

  v5.receiver = self;
  v5.super_class = (Class)_bmFMResultSet;
  [(_bmFMResultSet *)&v5 dealloc];
}

- (void)close
{
  [(_bmFMStatement *)self->_statement reset];
  statement = self->_statement;
  self->_statement = 0;

  [(_bmFMDatabase *)self->_parentDB resultSetDidClose:self];

  [(_bmFMResultSet *)self setParentDB:0];
}

- (int)columnCount
{
  v2 = [(_bmFMStatement *)self->_statement statement];

  return sqlite3_column_count(v2);
}

- (NSMutableDictionary)columnNameToIndexMap
{
  if (!self->_columnNameToIndexMap)
  {
    int v3 = sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
    v4 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:v3];
    columnNameToIndexMap = self->_columnNameToIndexMap;
    self->_columnNameToIndexMap = v4;

    if (v3 >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        char v7 = self->_columnNameToIndexMap;
        v8 = +[NSNumber numberWithInt:v6];
        id v9 = +[NSString stringWithUTF8String:sqlite3_column_name((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v6)];
        id v10 = [v9 lowercaseString];
        [(NSMutableDictionary *)v7 setObject:v8 forKey:v10];

        uint64_t v6 = (v6 + 1);
      }
      while (v3 != v6);
    }
  }
  v11 = self->_columnNameToIndexMap;

  return v11;
}

- (void)kvcMagic:(id)a3
{
  id v10 = a3;
  int v4 = sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
  if (v4 >= 1)
  {
    int v5 = v4;
    uint64_t v6 = 0;
    do
    {
      char v7 = sqlite3_column_text((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v6);
      if (v7)
      {
        v8 = +[NSString stringWithUTF8String:v7];
        id v9 = +[NSString stringWithUTF8String:sqlite3_column_name((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v6)];
        [v10 setValue:v8 forKey:v9];
      }
      else
      {
        [(_bmFMResultSet *)self _tryLogSqliteColumnError:v6];
      }
      uint64_t v6 = (v6 + 1);
    }
    while (v5 != v6);
  }
}

- (id)resultDict
{
  int v3 = sqlite3_data_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
  if (v3)
  {
    int v4 = +[NSMutableDictionary dictionaryWithCapacity:v3];
    int v5 = [(_bmFMResultSet *)self columnNameToIndexMap];
    uint64_t v6 = [v5 keyEnumerator];

    uint64_t v7 = [v6 nextObject];
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        id v9 = [(_bmFMResultSet *)self objectForColumnName:v8];
        [v4 setObject:v9 forKey:v8];

        uint64_t v10 = [v6 nextObject];

        v8 = (void *)v10;
      }
      while (v10);
    }
    id v11 = [v4 copy];
  }
  else
  {
    NSLog(@"Warning: There seem to be no columns in this set.");
    id v11 = 0;
  }

  return v11;
}

- (NSDictionary)resultDictionary
{
  int v3 = sqlite3_data_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
  if (v3)
  {
    int v4 = +[NSMutableDictionary dictionaryWithCapacity:v3];
    int v5 = sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
    if (v5 >= 1)
    {
      int v6 = v5;
      uint64_t v7 = 0;
      do
      {
        v8 = +[NSString stringWithUTF8String:sqlite3_column_name((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v7)];
        id v9 = [(_bmFMResultSet *)self objectForColumnIndex:v7];
        [v4 setObject:v9 forKey:v8];

        uint64_t v7 = (v7 + 1);
      }
      while (v6 != v7);
    }
  }
  else
  {
    NSLog(@"Warning: There seem to be no columns in this set.");
    int v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (BOOL)next
{
  return [(_bmFMResultSet *)self nextWithError:0];
}

- (BOOL)nextWithError:(id *)a3
{
  return [(_bmFMResultSet *)self internalStepWithError:a3] == 100;
}

- (BOOL)step
{
  return [(_bmFMResultSet *)self stepWithError:0];
}

- (BOOL)stepWithError:(id *)a3
{
  return [(_bmFMResultSet *)self internalStepWithError:a3] == 101;
}

- (int)internalStepWithError:(id *)a3
{
  uint64_t v5 = sqlite3_step((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]);
  uint64_t v6 = v5;
  if ((v5 - 5) <= 1)
  {
    uint64_t v7 = [(_bmFMDatabase *)self->_parentDB databasePath];
    NSLog(@"%s:%d Database busy (%@)", "-[_bmFMResultSet internalStepWithError:]", 189, v7);

    NSLog(@"Database busy", v13, v14);
LABEL_3:
    if (!a3) {
      goto LABEL_8;
    }
    parentDB = self->_parentDB;
    goto LABEL_5;
  }
  if ((v5 & 0xFFFFFFFE) == 0x64)
  {
LABEL_7:
    if (v6 == 100) {
      return v6;
    }
    goto LABEL_8;
  }
  if (v5 != 21)
  {
    if (v5 == 1)
    {
      v15 = sqlite3_errmsg((sqlite3 *)[(_bmFMDatabase *)self->_parentDB sqliteHandle]);
      NSLog(@"Error calling sqlite3_step (%d: %s) rs", 1, v15);
      goto LABEL_3;
    }
    v12 = sqlite3_errmsg((sqlite3 *)[(_bmFMDatabase *)self->_parentDB sqliteHandle]);
    NSLog(@"Unknown error calling sqlite3_step (%d: %s) rs", v6, v12);
    if (a3)
    {
      *a3 = [(_bmFMDatabase *)self->_parentDB lastError];
    }
    goto LABEL_7;
  }
  uint64_t v10 = sqlite3_errmsg((sqlite3 *)[(_bmFMDatabase *)self->_parentDB sqliteHandle]);
  NSLog(@"Error calling sqlite3_step (%d: %s) rs", 21, v10);
  if (a3)
  {
    parentDB = self->_parentDB;
    if (parentDB)
    {
LABEL_5:
      *a3 = [(_bmFMDatabase *)parentDB lastError];
      goto LABEL_8;
    }
    id v11 = +[NSDictionary dictionaryWithObject:@"parentDB does not exist" forKey:NSLocalizedDescriptionKey];
    *a3 = +[NSError errorWithDomain:@"_bmFMDatabase" code:21 userInfo:v11];
  }
LABEL_8:
  if (self->_shouldAutoClose) {
    [(_bmFMResultSet *)self close];
  }
  return v6;
}

- (BOOL)hasAnotherRow
{
  return sqlite3_errcode((sqlite3 *)[(_bmFMDatabase *)self->_parentDB sqliteHandle]) == 100;
}

- (int)columnIndexForName:(id)a3
{
  int v4 = [a3 lowercaseString];
  uint64_t v5 = [(_bmFMResultSet *)self columnNameToIndexMap];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6)
  {
    int v7 = [v6 intValue];
  }
  else
  {
    NSLog(@"Warning: I could not find the column named '%@'.", v4);
    int v7 = -1;
  }

  return v7;
}

- (int)intForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self intForColumnIndex:v4];
}

- (int)intForColumnIndex:(int)a3
{
  uint64_t v4 = [(_bmFMStatement *)self->_statement statement];

  return sqlite3_column_int(v4, a3);
}

- (int64_t)longForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self longForColumnIndex:v4];
}

- (int64_t)longForColumnIndex:(int)a3
{
  uint64_t v4 = [(_bmFMStatement *)self->_statement statement];

  return sqlite3_column_int64(v4, a3);
}

- (int64_t)longLongIntForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self longLongIntForColumnIndex:v4];
}

- (int64_t)longLongIntForColumnIndex:(int)a3
{
  uint64_t v4 = [(_bmFMStatement *)self->_statement statement];

  return sqlite3_column_int64(v4, a3);
}

- (unint64_t)unsignedLongLongIntForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self unsignedLongLongIntForColumnIndex:v4];
}

- (BOOL)BOOLForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self BOOLForColumnIndex:v4];
}

- (BOOL)BOOLForColumnIndex:(int)a3
{
  return [(_bmFMResultSet *)self intForColumnIndex:*(void *)&a3] != 0;
}

- (double)doubleForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  [(_bmFMResultSet *)self doubleForColumnIndex:v4];
  return result;
}

- (double)doubleForColumnIndex:(int)a3
{
  uint64_t v4 = [(_bmFMStatement *)self->_statement statement];

  return sqlite3_column_double(v4, a3);
}

- (id)stringForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  uint64_t v6 = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) > (int)v3)
    {
      int v7 = sqlite3_column_text((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      if (v7)
      {
        uint64_t v6 = +[NSString stringWithUTF8String:v7];
        goto LABEL_8;
      }
      [(_bmFMResultSet *)self _tryLogSqliteColumnError:v3];
    }
    uint64_t v6 = 0;
  }
LABEL_8:

  return v6;
}

- (id)stringForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self stringForColumnIndex:v4];
}

- (id)dateForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self dateForColumnIndex:v4];
}

- (id)dateForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  uint64_t v6 = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) <= (int)v3)
    {
      uint64_t v6 = 0;
    }
    else if ([(_bmFMDatabase *)self->_parentDB hasDateFormatter])
    {
      parentDB = self->_parentDB;
      v8 = [(_bmFMResultSet *)self stringForColumnIndex:v3];
      uint64_t v6 = [(_bmFMDatabase *)parentDB dateFromString:v8];
    }
    else
    {
      [(_bmFMResultSet *)self doubleForColumnIndex:v3];
      uint64_t v6 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
    }
  }

  return v6;
}

- (id)dataForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self dataForColumnIndex:v4];
}

- (id)dataForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  uint64_t v6 = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) > (int)v3)
    {
      int v7 = sqlite3_column_blob((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      int v8 = sqlite3_column_bytes((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      if (v7)
      {
        uint64_t v6 = +[NSData dataWithBytes:v7 length:v8];
        goto LABEL_8;
      }
      [(_bmFMResultSet *)self _tryLogSqliteColumnError:v3];
    }
    uint64_t v6 = 0;
  }
LABEL_8:

  return v6;
}

- (id)dataNoCopyForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self dataNoCopyForColumnIndex:v4];
}

- (id)dataNoCopyForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  uint64_t v6 = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) > (int)v3)
    {
      int v7 = sqlite3_column_blob((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      int v8 = sqlite3_column_bytes((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      if (v7)
      {
        uint64_t v6 = +[NSData dataWithBytesNoCopy:v7 length:v8 freeWhenDone:0];
        goto LABEL_8;
      }
      [(_bmFMResultSet *)self _tryLogSqliteColumnError:v3];
    }
    uint64_t v6 = 0;
  }
LABEL_8:

  return v6;
}

- (BOOL)columnIndexIsNull:(int)a3
{
  return sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3) == 5;
}

- (BOOL)columnIsNull:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self columnIndexIsNull:v4];
}

- (const)UTF8StringForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);
  double result = 0;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) > (int)v3)
    {
      double result = (const char *)sqlite3_column_text((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v3);
      if (result) {
        return result;
      }
      [(_bmFMResultSet *)self _tryLogSqliteColumnError:v3];
    }
    return 0;
  }
  return result;
}

- (const)UTF8StringForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self UTF8StringForColumnIndex:v4];
}

- (const)UTF8StringForColumnName:(id)a3
{
  return [(_bmFMResultSet *)self UTF8StringForColumn:a3];
}

- (id)objectForColumnIndex:(int)a3
{
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t v4 = *(void *)&a3;
    if (sqlite3_column_count((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement]) <= a3)
    {
      int v7 = 0;
      goto LABEL_18;
    }
    int v6 = sqlite3_column_type((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], v4);
    switch(v6)
    {
      case 4:
        int v7 = [(_bmFMResultSet *)self dataForColumnIndex:v4];
        if (v7) {
          goto LABEL_18;
        }
        break;
      case 2:
        [(_bmFMResultSet *)self doubleForColumnIndex:v4];
        int v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        if (v7) {
          goto LABEL_18;
        }
        break;
      case 1:
        int v7 = +[NSNumber numberWithLongLong:[(_bmFMResultSet *)self longLongIntForColumnIndex:v4]];
        if (v7) {
          goto LABEL_18;
        }
        break;
      default:
        int v7 = [(_bmFMResultSet *)self stringForColumnIndex:v4];
        if (v7) {
          goto LABEL_18;
        }
        break;
    }
    int v7 = +[NSNull null];
LABEL_18:
    return v7;
  }
  int v7 = 0;
  return v7;
}

- (id)objectForColumnName:(id)a3
{
  return [(_bmFMResultSet *)self objectForColumn:a3];
}

- (id)objectForColumn:(id)a3
{
  uint64_t v4 = [(_bmFMResultSet *)self columnIndexForName:a3];

  return [(_bmFMResultSet *)self objectForColumnIndex:v4];
}

- (id)columnNameForIndex:(int)a3
{
  uint64_t v3 = sqlite3_column_name((sqlite3_stmt *)[(_bmFMStatement *)self->_statement statement], a3);

  return +[NSString stringWithUTF8String:v3];
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(_bmFMResultSet *)self objectForColumn:a3];
}

- (BOOL)bindWithArray:(id)a3 orDictionary:(id)a4 orVAList:(char *)a5
{
  statement = self->_statement;
  id v9 = a4;
  id v10 = a3;
  [(_bmFMStatement *)statement reset];
  LOBYTE(a5) = [(_bmFMDatabase *)self->_parentDB bindStatement:[(_bmFMStatement *)self->_statement statement] WithArgumentsInArray:v10 orDictionary:v9 orVAList:a5];

  return (char)a5;
}

- (BOOL)bindWithArray:(id)a3
{
  return [(_bmFMResultSet *)self bindWithArray:a3 orDictionary:0 orVAList:0];
}

- (BOOL)bindWithDictionary:(id)a3
{
  return [(_bmFMResultSet *)self bindWithArray:0 orDictionary:a3 orVAList:0];
}

- (void)_tryLogSqliteColumnError:(int)a3
{
  p_parentDB = &self->_parentDB;
  if ([(_bmFMDatabase *)self->_parentDB lastErrorCode])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100042134((id *)p_parentDB, (uint64_t)self, a3);
    }
  }
}

- (_bmFMDatabase)parentDB
{
  return self->_parentDB;
}

- (void)setParentDB:(id)a3
{
}

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQuery:(id)a3
{
}

- (_bmFMStatement)statement
{
  return (_bmFMStatement *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStatement:(id)a3
{
}

- (BOOL)shouldAutoClose
{
  return self->_shouldAutoClose;
}

- (void)setShouldAutoClose:(BOOL)a3
{
  self->_shouldAutoClose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_parentDB, 0);

  objc_storeStrong((id *)&self->_columnNameToIndexMap, 0);
}

@end