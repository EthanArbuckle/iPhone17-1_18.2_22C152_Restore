@interface IMDatabaseCursor
- (BOOL)close;
- (BOOL)closed;
- (BOOL)reset;
- (IMDatabaseCursor)initWithQuery:(id)a3 databaseHandle:(id)a4;
- (IMDatabaseCursor)initWithStatement:(sqlite3_stmt *)a3;
- (NSMutableArray)columnNames;
- (NSMutableArray)columnTypes;
- (NSMutableArray)results;
- (id)_undeclaredTypeForColumnIndex:(int)a3;
- (id)columnNameAtIndex:(int64_t)a3;
- (id)columnTypeAtIndex:(int64_t)a3;
- (id)nextRowAsArray;
- (id)nextRowAsDictionary;
- (int)numColumns;
- (int64_t)columnCount;
- (int64_t)rowCount;
- (sqlite3_stmt)statement;
- (void)dealloc;
- (void)setClosed:(BOOL)a3;
- (void)setColumnNames:(id)a3;
- (void)setColumnTypes:(id)a3;
- (void)setNumColumns:(int)a3;
- (void)setResults:(id)a3;
- (void)setStatement:(sqlite3_stmt *)a3;
@end

@implementation IMDatabaseCursor

- (IMDatabaseCursor)initWithQuery:(id)a3 databaseHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMDatabaseCursor;
  v8 = [(IMDatabaseCursor *)&v14 init];
  if (v8)
  {
    v9 = v8;
    v12 = 0;
    pzTail = (char *)[v6 UTF8String];
    if (sqlite3_prepare_v2((sqlite3 *)[v7 _databaseHandle], pzTail, -1, &v12, (const char **)&pzTail))
    {
      v10 = 0;
    }
    else
    {
      v9 = [(IMDatabaseCursor *)v9 initWithStatement:v12];
      v10 = v9;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (IMDatabaseCursor)initWithStatement:(sqlite3_stmt *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)IMDatabaseCursor;
  v4 = [(IMDatabaseCursor *)&v20 init];
  v5 = v4;
  if (v4)
  {
    v4->_statement = a3;
    int v6 = sqlite3_column_count(a3);
    v5->_numColumns = v6;
    uint64_t v7 = +[NSMutableArray arrayWithCapacity:v6];
    columnNames = v5->_columnNames;
    v5->_columnNames = (NSMutableArray *)v7;

    uint64_t v9 = +[NSMutableArray arrayWithCapacity:v5->_numColumns];
    columnTypes = v5->_columnTypes;
    v5->_columnTypes = (NSMutableArray *)v9;

    if (v5->_numColumns >= 1)
    {
      uint64_t v11 = 0;
      while (1)
      {
        id v12 = [objc_alloc((Class)NSString) initWithUTF8String:sqlite3_column_name(v5->_statement, v11)];
        [(NSMutableArray *)v5->_columnNames setObject:v12 atIndexedSubscript:v11];

        v13 = sqlite3_column_decltype(v5->_statement, v11);
        if (!v13) {
          break;
        }
        objc_super v14 = v13;
        if (!strncasecmp(v13, "integer", 7uLL))
        {
          v16 = v5->_columnTypes;
          CFStringRef v17 = @"integer";
          goto LABEL_20;
        }
        if (!strncasecmp(v14, "float", 5uLL) || !strncasecmp(v14, "decimal", 8uLL) || !strncasecmp(v14, "real", 4uLL))
        {
          v16 = v5->_columnTypes;
          CFStringRef v17 = @"float";
          goto LABEL_20;
        }
        if (!strncasecmp(v14, "text", 4uLL) || !strncasecmp(v14, "varchar", 7uLL))
        {
          v16 = v5->_columnTypes;
          CFStringRef v17 = @"text";
          goto LABEL_20;
        }
        if (!strncasecmp(v14, "timestamp", 9uLL) || !strncasecmp(v14, "date", 4uLL))
        {
          v16 = v5->_columnTypes;
          CFStringRef v17 = @"date";
          goto LABEL_20;
        }
        if (!strncasecmp(v14, "blob", 4uLL))
        {
          v16 = v5->_columnTypes;
          CFStringRef v17 = @"blob";
          goto LABEL_20;
        }
        int v15 = strncasecmp(v14, "null", 4uLL);
        v16 = v5->_columnTypes;
        if (v15) {
          goto LABEL_17;
        }
        CFStringRef v17 = @"null";
LABEL_20:
        [(NSMutableArray *)v16 setObject:v17 atIndexedSubscript:v11++];
        if (v11 >= v5->_numColumns) {
          goto LABEL_25;
        }
      }
      v16 = v5->_columnTypes;
LABEL_17:
      CFStringRef v17 = @"undeclared";
      goto LABEL_20;
    }
LABEL_25:
    v18 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(IMDatabaseCursor *)self close];
  v3.receiver = self;
  v3.super_class = (Class)IMDatabaseCursor;
  [(IMDatabaseCursor *)&v3 dealloc];
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (id)nextRowAsDictionary
{
  uint64_t v3 = [(IMDatabaseCursor *)self nextRowAsArray];
  v4 = (void *)v3;
  if (self->_numColumns) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v7 = 0;
  }
  else
  {
    int v6 = [(IMDatabaseCursor *)self columnNames];
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v6];
  }

  return v7;
}

- (id)nextRowAsArray
{
  int v3 = sqlite3_step(self->_statement);
  v4 = 0;
  if (!v3) {
    goto LABEL_25;
  }
  if (v3 == 100)
  {
    v4 = +[NSMutableArray arrayWithCapacity:self->_numColumns];
    if (self->_numColumns < 1) {
      goto LABEL_25;
    }
    uint64_t v6 = 0;
    uint64_t v7 = &_s13BookAnalytics16ReadingGoalsDataVSQAAMc_ptr;
    CFStringRef v8 = @"undeclared";
    CFStringRef v9 = @"integer";
    v10 = &_s13BookAnalytics16ReadingGoalsDataVSQAAMc_ptr;
    CFStringRef v11 = @"float";
    while (sqlite3_column_type(self->_statement, v6) == 5)
    {
      id v12 = [v7[377] null];
      [v4 addObject:v12];
LABEL_24:

      if (++v6 >= self->_numColumns) {
        goto LABEL_25;
      }
    }
    v13 = [(NSMutableArray *)self->_columnTypes objectAtIndexedSubscript:v6];
    if (v13 == v8)
    {
      v13 = [(IMDatabaseCursor *)self _undeclaredTypeForColumnIndex:v6];
    }
    if (v13 == v9)
    {
      id v14 = [objc_alloc((Class)v10[378]) initWithLongLong:sqlite3_column_int64(self->_statement, v6)];
    }
    else if (v13 == v11)
    {
      id v14 = [objc_alloc((Class)v10[378]) initWithDouble:sqlite3_column_double(self->_statement, v6)];
    }
    else if (v13 == @"text")
    {
      id v14 = [objc_alloc((Class)NSString) initWithUTF8String:sqlite3_column_text(self->_statement, v6)];
    }
    else if (v13 == @"date")
    {
      id v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:sqlite3_column_double(self->_statement, v6)];
    }
    else
    {
      if (v13 != @"blob")
      {
        id v12 = 0;
LABEL_23:
        [v4 addObject:v12];

        goto LABEL_24;
      }
      id v24 = objc_alloc((Class)NSData);
      CFStringRef v15 = v9;
      CFStringRef v16 = v8;
      CFStringRef v17 = v7;
      CFStringRef v18 = v11;
      v19 = v10;
      objc_super v20 = sqlite3_column_blob(self->_statement, v6);
      int v21 = sqlite3_column_bytes(self->_statement, v6);
      v22 = v20;
      v10 = v19;
      CFStringRef v11 = v18;
      uint64_t v7 = v17;
      CFStringRef v8 = v16;
      CFStringRef v9 = v15;
      id v14 = [v24 initWithBytes:v22 length:v21];
    }
    id v12 = v14;
    goto LABEL_23;
  }
  if (v3 != 101)
  {
    BOOL v5 = sqlite3_db_handle(self->_statement);
    sqlite3_errmsg(v5);
    v4 = 0;
  }
LABEL_25:

  return v4;
}

- (NSMutableArray)results
{
  results = self->_results;
  if (!results)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    BOOL v5 = self->_results;
    self->_results = v4;

    uint64_t v6 = [(IMDatabaseCursor *)self nextRowAsDictionary];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      do
      {
        [(NSMutableArray *)self->_results addObject:v7];
        uint64_t v8 = [(IMDatabaseCursor *)self nextRowAsDictionary];

        uint64_t v7 = (void *)v8;
      }
      while (v8);
    }
    results = self->_results;
  }

  return results;
}

- (BOOL)close
{
  if (self->_closed) {
    return 1;
  }
  int v4 = sqlite3_finalize(self->_statement);
  if (v4 && v4 != 101)
  {
    BOOL v5 = BCIMLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1EDFD8();
    }

    return self->_closed;
  }
  else
  {
    BOOL result = 1;
    self->_closed = 1;
  }
  return result;
}

- (BOOL)reset
{
  if (self->_closed) {
    return 0;
  }
  int v3 = sqlite3_reset(self->_statement);
  if (v3 && v3 != 101)
  {
    uint64_t v6 = BCIMLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
LABEL_9:
    }
      sub_1EE04C();
LABEL_10:

    return 0;
  }
  int v4 = sqlite3_clear_bindings(self->_statement);
  BOOL result = 1;
  if (v4 && v4 != 101)
  {
    uint64_t v6 = BCIMLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  return result;
}

- (int64_t)columnCount
{
  return self->_numColumns;
}

- (int64_t)rowCount
{
  v2 = [(IMDatabaseCursor *)self results];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (id)columnNameAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_columnNames objectAtIndexedSubscript:a3];
}

- (id)columnTypeAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_columnTypes objectAtIndexedSubscript:a3];
}

- (void)setResults:(id)a3
{
}

- (int)numColumns
{
  return self->_numColumns;
}

- (void)setNumColumns:(int)a3
{
  self->_numColumns = a3;
}

- (void)setStatement:(sqlite3_stmt *)a3
{
  self->_statement = a3;
}

- (NSMutableArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
}

- (NSMutableArray)columnTypes
{
  return self->_columnTypes;
}

- (void)setColumnTypes:(id)a3
{
}

- (BOOL)closed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnTypes, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

- (id)_undeclaredTypeForColumnIndex:(int)a3
{
  unint64_t v3 = sqlite3_column_type(self->_statement, a3) - 1;
  if (v3 > 4) {
    return @"text";
  }
  else {
    return off_2C9610[v3];
  }
}

@end