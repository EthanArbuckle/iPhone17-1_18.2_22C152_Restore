@interface MSVSQLRowEnumerator
- (BOOL)BOOLValueAtColumnIndex:(int64_t)a3;
- (BOOL)isNullValueAtColumnIndex:(int64_t)a3;
- (NSString)description;
- (double)doubleValueAtColumnIndex:(int64_t)a3;
- (float)floatValueAtColumnIndex:(int64_t)a3;
- (id)_markdownTable;
- (id)columnNameAtIndex:(int64_t)a3;
- (id)dataValueAtColumnIndex:(int64_t)a3;
- (id)dateValueAtColumnIndex:(int64_t)a3;
- (id)initWithStatement:(id *)a1;
- (id)jsonDataAtColumnIndex:(int64_t)a3;
- (id)jsonValueAtColumnIndex:(int64_t)a3 error:(id *)a4;
- (id)markdownTable;
- (id)markdownTableHeader;
- (id)markdownTableRow;
- (id)nextObject;
- (id)nextObjectWithError:(id *)a3;
- (id)objectValueAtColumnIndex:(int64_t)a3;
- (id)stringValueAtColumnIndex:(int64_t)a3;
- (int64_t)columnCount;
- (int64_t)int64ValueAtColumnIndex:(int64_t)a3;
- (unint64_t)uint64ValueAtColumnIndex:(int64_t)a3;
- (void)_addRow:(id)a3 toTable:(id)a4;
@end

@implementation MSVSQLRowEnumerator

- (id)nextObject
{
  return [(MSVSQLRowEnumerator *)self nextObjectWithError:0];
}

- (id)jsonValueAtColumnIndex:(int64_t)a3 error:(id *)a4
{
  v5 = [(MSVSQLRowEnumerator *)self jsonDataAtColumnIndex:a3];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:a4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dataValueAtColumnIndex:(int64_t)a3
{
  int v3 = a3;
  if (-[MSVSQLRowEnumerator isNullValueAtColumnIndex:](self, "isNullValueAtColumnIndex:"))
  {
    v5 = 0;
  }
  else
  {
    statement = self->_statement;
    if (statement) {
      statementHandle = statement->_statementHandle;
    }
    else {
      statementHandle = 0;
    }
    v8 = sqlite3_column_blob(statementHandle, v3);
    v9 = self->_statement;
    if (v9) {
      v10 = v9->_statementHandle;
    }
    else {
      v10 = 0;
    }
    v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v8, sqlite3_column_bytes(v10, v3));
  }
  return v5;
}

- (id)jsonDataAtColumnIndex:(int64_t)a3
{
  if (-[MSVSQLRowEnumerator isNullValueAtColumnIndex:](self, "isNullValueAtColumnIndex:"))
  {
    v5 = 0;
  }
  else
  {
    v6 = [(MSVSQLRowEnumerator *)self stringValueAtColumnIndex:a3];
    v5 = [v6 dataUsingEncoding:4];
  }
  return v5;
}

- (id)stringValueAtColumnIndex:(int64_t)a3
{
  int v3 = a3;
  if (-[MSVSQLRowEnumerator isNullValueAtColumnIndex:](self, "isNullValueAtColumnIndex:"))
  {
    v5 = 0;
  }
  else
  {
    statement = self->_statement;
    if (statement) {
      statementHandle = statement->_statementHandle;
    }
    else {
      statementHandle = 0;
    }
    v8 = sqlite3_column_text(statementHandle, v3);
    v9 = self->_statement;
    if (v9) {
      v10 = v9->_statementHandle;
    }
    else {
      v10 = 0;
    }
    v5 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", v8, sqlite3_column_bytes(v10, v3), 4);
  }
  return v5;
}

- (BOOL)isNullValueAtColumnIndex:(int64_t)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  return sqlite3_column_type(statementHandle, a3) == 5;
}

- (unint64_t)uint64ValueAtColumnIndex:(int64_t)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  return sqlite3_column_int64(statementHandle, a3);
}

- (void).cxx_destruct
{
}

- (id)initWithStatement:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)MSVSQLRowEnumerator;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)nextObjectWithError:(id *)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  int v7 = sqlite3_step(statementHandle);
  if (v7 == 101) {
    goto LABEL_10;
  }
  if (v7 == 100)
  {
    v8 = self;
    goto LABEL_11;
  }
  if (!a3)
  {
LABEL_10:
    v8 = 0;
  }
  else
  {
    v9 = self->_statement;
    if (v9) {
      v9 = (MSVSQLStatement *)v9->_connection;
    }
    v10 = v9;
    -[_MSVSQLConnection lastError](v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    *a3 = v11;
  }
LABEL_11:
  return v8;
}

- (void)_addRow:(id)a3 toTable:(id)a4
{
  id v12 = a4;
  uint64_t v5 = [(MSVSQLRowEnumerator *)self columnCount];
  v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v8 = [(MSVSQLRowEnumerator *)self objectValueAtColumnIndex:i];
      uint64_t v9 = [v8 description];
      v10 = (void *)v9;
      if (v9) {
        id v11 = (__CFString *)v9;
      }
      else {
        id v11 = @"<null>";
      }
      [v6 addObject:v11];
    }
  }
  [v12 addRow:v6];
}

- (id)_markdownTable
{
  uint64_t v3 = [(MSVSQLRowEnumerator *)self columnCount];
  id v4 = objc_alloc_init(MSVMarkdownTable);
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v6 = [(MSVSQLRowEnumerator *)self columnNameAtIndex:i];
      int v7 = +[MSVMarkdownTable escapedString:v6];
      [(MSVMarkdownTable *)v4 addColumnWithHeader:v7];
    }
  }
  return v4;
}

- (id)markdownTable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MSVSQLRowEnumerator *)self _markdownTable];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self;
  uint64_t v5 = [(MSVSQLRowEnumerator *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        -[MSVSQLRowEnumerator _addRow:toTable:](v4, "_addRow:toTable:", *(void *)(*((void *)&v11 + 1) + 8 * i), v3, (void)v11);
      }
      uint64_t v6 = [(MSVSQLRowEnumerator *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [v3 renderMarkdownWithOptions:1];

  return v9;
}

- (id)markdownTableHeader
{
  v2 = [(MSVSQLRowEnumerator *)self _markdownTable];
  uint64_t v3 = [v2 renderMarkdownWithOptions:2];

  return v3;
}

- (id)markdownTableRow
{
  uint64_t v3 = [(MSVSQLRowEnumerator *)self _markdownTable];
  [(MSVSQLRowEnumerator *)self _addRow:self toTable:v3];
  id v4 = [v3 renderMarkdownWithOptions:4];

  return v4;
}

- (id)objectValueAtColumnIndex:(int64_t)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  switch(sqlite3_column_type(statementHandle, a3))
  {
    case 1:
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MSVSQLRowEnumerator int64ValueAtColumnIndex:](self, "int64ValueAtColumnIndex:", a3));
      break;
    case 2:
      v8 = NSNumber;
      [(MSVSQLRowEnumerator *)self doubleValueAtColumnIndex:a3];
      uint64_t v7 = objc_msgSend(v8, "numberWithDouble:");
      break;
    case 3:
      uint64_t v7 = [(MSVSQLRowEnumerator *)self stringValueAtColumnIndex:a3];
      break;
    case 4:
      uint64_t v7 = [(MSVSQLRowEnumerator *)self dataValueAtColumnIndex:a3];
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  return v7;
}

- (int64_t)int64ValueAtColumnIndex:(int64_t)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  return sqlite3_column_int64(statementHandle, a3);
}

- (float)floatValueAtColumnIndex:(int64_t)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  return sqlite3_column_double(statementHandle, a3);
}

- (double)doubleValueAtColumnIndex:(int64_t)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  return sqlite3_column_double(statementHandle, a3);
}

- (id)dateValueAtColumnIndex:(int64_t)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  int v7 = sqlite3_column_type(statementHandle, a3);
  if ((v7 - 1) >= 2)
  {
    if (v7 == 3)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      long long v11 = [(MSVSQLRowEnumerator *)self stringValueAtColumnIndex:a3];
      uint64_t v9 = [v10 dateFromString:v11];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1C9C8];
    [(MSVSQLRowEnumerator *)self doubleValueAtColumnIndex:a3];
    uint64_t v9 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
  }
  return v9;
}

- (BOOL)BOOLValueAtColumnIndex:(int64_t)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  return sqlite3_column_int(statementHandle, a3) != 0;
}

- (NSString)description
{
  v12.receiver = self;
  v12.super_class = (Class)MSVSQLRowEnumerator;
  uint64_t v3 = [(MSVSQLRowEnumerator *)&v12 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 2, 1);
  uint64_t v5 = [(MSVSQLRowEnumerator *)self columnCount];
  objc_msgSend(v4, "appendString:", @" currentRow: (\n");
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      statement = self->_statement;
      if (statement) {
        statementHandle = statement->_statementHandle;
      }
      else {
        statementHandle = 0;
      }
      uint64_t v9 = sqlite3_column_name(statementHandle, i);
      id v10 = [(MSVSQLRowEnumerator *)self objectValueAtColumnIndex:i];
      [v4 appendFormat:@"    %s : %@ \n", v9, v10];
    }
  }
  [v4 appendString:@">"]);
  return (NSString *)v4;
}

- (id)columnNameAtIndex:(int64_t)a3
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  uint64_t v5 = sqlite3_column_name(statementHandle, a3);
  uint64_t v6 = NSString;
  return (id)[v6 stringWithUTF8String:v5];
}

- (int64_t)columnCount
{
  statement = self->_statement;
  if (statement) {
    statementHandle = statement->_statementHandle;
  }
  else {
    statementHandle = 0;
  }
  return sqlite3_column_count(statementHandle);
}

@end