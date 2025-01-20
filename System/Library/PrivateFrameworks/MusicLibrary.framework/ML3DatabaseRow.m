@interface ML3DatabaseRow
- (ML3DatabaseResult)parentResult;
- (ML3DatabaseRow)init;
- (ML3DatabaseRow)initWithParentResult:(id)a3;
- (const)cStringForColumnIndex:(unint64_t)a3;
- (const)cStringForColumnName:(id)a3;
- (double)doubleForColumnIndex:(unint64_t)a3;
- (double)doubleForColumnName:(id)a3;
- (id)arrayRepresentation;
- (id)dataForColumnIndex:(unint64_t)a3;
- (id)dataForColumnName:(id)a3;
- (id)dictionaryRepresentation;
- (id)numberForColumnIndex:(unint64_t)a3;
- (id)numberForColumnName:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)stringForColumnIndex:(unint64_t)a3;
- (id)stringForColumnName:(id)a3;
- (id)valueForColumnIndex:(unint64_t)a3;
- (id)valueForColumnName:(id)a3;
- (int)intForColumnIndex:(unint64_t)a3;
- (int)intForColumnName:(id)a3;
- (int64_t)int64ForColumnIndex:(unint64_t)a3;
- (int64_t)int64ForColumnName:(id)a3;
- (unint64_t)columnCount;
- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnIndex:(unint64_t)a5;
- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnName:(id)a5;
@end

@implementation ML3DatabaseRow

- (void).cxx_destruct
{
}

- (ML3DatabaseRow)initWithParentResult:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ML3DatabaseRow;
  v6 = [(ML3DatabaseRow *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentResult, a3);
    v8 = [(ML3DatabaseResult *)v7->_parentResult _statement];
    v7->_stmt = (sqlite3_stmt *)[v8 sqliteStatement];
  }
  return v7;
}

- (id)valueForColumnIndex:(unint64_t)a3
{
  int v5 = sqlite3_column_type(self->_stmt, a3);
  if ((v5 - 1) < 2)
  {
    v6 = [(ML3DatabaseRow *)self numberForColumnIndex:a3];
  }
  else if (v5 == 5)
  {
    v6 = 0;
  }
  else
  {
    if (v5 == 4) {
      [(ML3DatabaseRow *)self dataForColumnIndex:a3];
    }
    else {
    v6 = [(ML3DatabaseRow *)self stringForColumnIndex:a3];
    }
  }

  return v6;
}

- (id)stringForColumnIndex:(unint64_t)a3
{
  int v3 = a3;
  if (sqlite3_column_type(self->_stmt, a3) == 5) {
    int v5 = 0;
  }
  else {
    int v5 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(self->_stmt, v3));
  }

  return v5;
}

- (unint64_t)columnCount
{
  return sqlite3_column_count(self->_stmt);
}

- (id)numberForColumnIndex:(unint64_t)a3
{
  int v3 = a3;
  int v5 = sqlite3_column_type(self->_stmt, a3);
  if (v5 == 2)
  {
    v6 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(self->_stmt, v3));
  }
  else if (v5 == 1)
  {
    v6 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(self->_stmt, v3));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)int64ForColumnIndex:(unint64_t)a3
{
  return sqlite3_column_int64(self->_stmt, a3);
}

- (int)intForColumnIndex:(unint64_t)a3
{
  return sqlite3_column_int(self->_stmt, a3);
}

- (ML3DatabaseResult)parentResult
{
  return self->_parentResult;
}

- (id)objectForKeyedSubscript:(id)a3
{
  int v3 = [(ML3DatabaseRow *)self valueForColumnName:a3];

  return v3;
}

- (id)arrayRepresentation
{
  unint64_t v4 = [(ML3DatabaseRow *)self columnCount];
  int v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  if (v4)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      v8 = [(ML3DatabaseRow *)self valueForColumnIndex:v6];
      v9 = v8;
      if (!v8)
      {
        v2 = [MEMORY[0x1E4F1CA98] null];
        v9 = v2;
      }
      [v5 addObject:v9];
      if (!v8) {

      }
      uint64_t v6 = v7;
    }
    while (v4 > v7++);
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [(ML3DatabaseRow *)self columnCount];
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v3];
  int v5 = [(ML3DatabaseResult *)self->_parentResult columnNameIndexMap];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ML3DatabaseRow_dictionaryRepresentation__block_invoke;
  v9[3] = &unk_1E5FB7808;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = v6;

  return v7;
}

void __42__ML3DatabaseRow_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(*(id *)(a1 + 40), "valueForColumnIndex:", objc_msgSend(v5, "unsignedIntegerValue"));
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  if (!v6) {
}
  }

- (id)valueForColumnName:(id)a3
{
  id v4 = a3;
  id v5 = [(ML3DatabaseRow *)self valueForColumnIndex:[(ML3DatabaseResult *)self->_parentResult indexForColumnName:v4]];

  return v5;
}

- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnIndex:(unint64_t)a5
{
  int v5 = a5;
  if (a3) {
    *a3 = sqlite3_column_blob(self->_stmt, a5);
  }
  if (a4) {
    *a4 = sqlite3_column_bytes(self->_stmt, v5);
  }
}

- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnName:(id)a5
{
  id v8 = a5;
  -[ML3DatabaseRow getBlobBytes:outLength:forColumnIndex:](self, "getBlobBytes:outLength:forColumnIndex:", a3, a4, -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:"));
}

- (id)numberForColumnName:(id)a3
{
  id v4 = a3;
  int v5 = [(ML3DatabaseRow *)self numberForColumnIndex:[(ML3DatabaseResult *)self->_parentResult indexForColumnName:v4]];

  return v5;
}

- (id)stringForColumnName:(id)a3
{
  id v4 = a3;
  int v5 = [(ML3DatabaseRow *)self stringForColumnIndex:[(ML3DatabaseResult *)self->_parentResult indexForColumnName:v4]];

  return v5;
}

- (const)cStringForColumnIndex:(unint64_t)a3
{
  int v3 = a3;
  if (sqlite3_column_type(self->_stmt, a3) == 5) {
    return 0;
  }
  stmt = self->_stmt;

  return (const char *)sqlite3_column_text(stmt, v3);
}

- (const)cStringForColumnName:(id)a3
{
  id v4 = a3;
  int v5 = [(ML3DatabaseRow *)self cStringForColumnIndex:[(ML3DatabaseResult *)self->_parentResult indexForColumnName:v4]];

  return v5;
}

- (int64_t)int64ForColumnName:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ML3DatabaseRow *)self int64ForColumnIndex:[(ML3DatabaseResult *)self->_parentResult indexForColumnName:v4]];

  return v5;
}

- (int)intForColumnName:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(ML3DatabaseRow *)self intForColumnIndex:[(ML3DatabaseResult *)self->_parentResult indexForColumnName:v4]];

  return (int)self;
}

- (double)doubleForColumnIndex:(unint64_t)a3
{
  return sqlite3_column_double(self->_stmt, a3);
}

- (double)doubleForColumnName:(id)a3
{
  id v4 = a3;
  [(ML3DatabaseRow *)self doubleForColumnIndex:[(ML3DatabaseResult *)self->_parentResult indexForColumnName:v4]];
  double v6 = v5;

  return v6;
}

- (id)dataForColumnIndex:(unint64_t)a3
{
  int v3 = a3;
  if (sqlite3_column_type(self->_stmt, a3) == 5)
  {
    double v5 = 0;
  }
  else
  {
    double v6 = sqlite3_column_blob(self->_stmt, v3);
    size_t v7 = sqlite3_column_bytes(self->_stmt, v3);
    id v8 = malloc_type_malloc(v7, 0x8E4EFA43uLL);
    memcpy(v8, v6, v7);
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v8 length:v7];
  }

  return v5;
}

- (id)dataForColumnName:(id)a3
{
  id v4 = a3;
  double v5 = [(ML3DatabaseRow *)self dataForColumnIndex:[(ML3DatabaseResult *)self->_parentResult indexForColumnName:v4]];

  return v5;
}

- (ML3DatabaseRow)init
{
  int v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"-[%@ init] is unsupported. Use -[%@ initWithStatement:] instead.", v4, v4 format];

  return 0;
}

@end