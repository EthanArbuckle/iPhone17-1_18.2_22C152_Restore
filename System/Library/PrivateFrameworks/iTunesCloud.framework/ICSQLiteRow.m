@interface ICSQLiteRow
- (ICSQLiteRow)initWithStatement:(id)a3;
- (double)doubleForColumnIndex:(int)a3;
- (double)doubleForColumnName:(id)a3;
- (id)dataForColumnIndex:(int)a3;
- (id)dataForColumnName:(id)a3;
- (id)numberForColumnIndex:(int)a3;
- (id)numberForColumnName:(id)a3;
- (id)stringForColumnIndex:(int)a3;
- (id)stringForColumnName:(id)a3;
- (int)columnIndexForColumnName:(id)a3;
- (int)intForColumnIndex:(int)a3;
- (int)intForColumnName:(id)a3;
- (int64_t)int64ForColumnIndex:(int)a3;
- (int64_t)int64ForColumnName:(id)a3;
- (int64_t)numberOfColumns;
@end

@implementation ICSQLiteRow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementWrapper, 0);

  objc_storeStrong((id *)&self->_columnIndexByName, 0);
}

- (int)columnIndexForColumnName:(id)a3
{
  id v4 = a3;
  columnIndexByName = self->_columnIndexByName;
  if (!columnIndexByName)
  {
    v6 = [(ICSQLiteStatement *)self->_statementWrapper columnIndexByName];
    v7 = self->_columnIndexByName;
    self->_columnIndexByName = v6;

    columnIndexByName = self->_columnIndexByName;
  }
  v8 = [(NSDictionary *)columnIndexByName objectForKey:v4];
  v9 = v8;
  if (v8) {
    int v10 = [v8 intValue];
  }
  else {
    int v10 = -1;
  }

  return v10;
}

- (id)stringForColumnName:(id)a3
{
  uint64_t v4 = [(ICSQLiteRow *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(ICSQLiteRow *)self stringForColumnIndex:v4];
  }

  return v5;
}

- (id)stringForColumnIndex:(int)a3
{
  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)sqlite3_column_text(self->_statement, a3);
    if (v5)
    {
      v5 = [NSString stringWithUTF8String:v5];
    }
  }

  return v5;
}

- (int64_t)numberOfColumns
{
  return sqlite3_column_count(self->_statement);
}

- (id)numberForColumnName:(id)a3
{
  uint64_t v4 = [(ICSQLiteRow *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(ICSQLiteRow *)self numberForColumnIndex:v4];
  }

  return v5;
}

- (id)numberForColumnIndex:(int)a3
{
  int v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    v6 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(self->_statement, a3));
  }
  else if (v5 == 2)
  {
    v6 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(self->_statement, a3));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)int64ForColumnName:(id)a3
{
  int v4 = [(ICSQLiteRow *)self columnIndexForColumnName:a3];
  if (v4 < 0) {
    return 0;
  }
  int v5 = v4;
  statement = self->_statement;

  return sqlite3_column_int64(statement, v5);
}

- (int64_t)int64ForColumnIndex:(int)a3
{
  return sqlite3_column_int64(self->_statement, a3);
}

- (int)intForColumnName:(id)a3
{
  int v4 = [(ICSQLiteRow *)self columnIndexForColumnName:a3];
  if (v4 < 0) {
    return 0;
  }
  int v5 = v4;
  statement = self->_statement;

  return sqlite3_column_int(statement, v5);
}

- (int)intForColumnIndex:(int)a3
{
  return sqlite3_column_int(self->_statement, a3);
}

- (double)doubleForColumnName:(id)a3
{
  int v4 = [(ICSQLiteRow *)self columnIndexForColumnName:a3];
  if (v4 < 0) {
    return 0.0;
  }
  int v5 = v4;
  statement = self->_statement;

  return sqlite3_column_double(statement, v5);
}

- (double)doubleForColumnIndex:(int)a3
{
  return sqlite3_column_double(self->_statement, a3);
}

- (id)dataForColumnName:(id)a3
{
  uint64_t v4 = [(ICSQLiteRow *)self columnIndexForColumnName:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(ICSQLiteRow *)self dataForColumnIndex:v4];
  }

  return v5;
}

- (id)dataForColumnIndex:(int)a3
{
  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    int v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_blob(self->_statement, a3);
    int v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v6, sqlite3_column_bytes(self->_statement, a3));
  }

  return v5;
}

- (ICSQLiteRow)initWithStatement:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSQLiteRow;
  v6 = [(ICSQLiteRow *)&v8 init];
  if (v6)
  {
    v6->_statement = (sqlite3_stmt *)objc_msgSend(v5, "sqlite3_stmt");
    objc_storeStrong((id *)&v6->_statementWrapper, a3);
  }

  return v6;
}

@end