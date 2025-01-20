@interface PBFSQLiteResultRow
+ (void)resultRowWithStatement:(uint64_t)a1;
- (BOOL)isValid;
- (PBFSQLiteResultRow)init;
- (double)doubleAtIndex:(unint64_t)a3;
- (double)doubleForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataAtIndex:(unint64_t)a3;
- (id)dataForKey:(id)a3;
- (id)keyAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectForKey:(id)a3;
- (id)stringAtIndex:(unint64_t)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerAtIndex:(unint64_t)a3;
- (int64_t)integerForKey:(id)a3;
- (unint64_t)count;
- (void)_columnNames;
- (void)_indexForKey:(void *)result;
- (void)_initWithStatement:(void *)result;
- (void)invalidate;
@end

@implementation PBFSQLiteResultRow

- (PBFSQLiteResultRow)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PBFSQLiteResultRow.m" lineNumber:32 description:@"init is not allowed"];

  if (!self) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)PBFSQLiteResultRow;
  result = [(PBFSQLiteResultRow *)&v6 init];
  if (result) {
    result->_statement = 0;
  }
  return result;
}

- (void)_initWithStatement:(void *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)PBFSQLiteResultRow;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      result[1] = a2;
    }
  }
  return result;
}

+ (void)resultRowWithStatement:(uint64_t)a1
{
  objc_super v3 = (objc_class *)self;
  if (!a2)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:sel_resultRowWithStatement_, v3, @"PBFSQLiteResultRow.m", 46, @"Invalid parameter not satisfying: %@", @"statement" object file lineNumber description];
  }
  v4 = [v3 alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)PBFSQLiteResultRow;
    v4 = objc_msgSendSuper2(&v7, sel_init);
    if (v4) {
      v4[1] = a2;
    }
  }
  return v4;
}

- (void)invalidate
{
  self->_statement = 0;
}

- (BOOL)isValid
{
  return self->_statement != 0;
}

- (unint64_t)count
{
  statement = self->_statement;
  if (!statement)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PBFSQLiteResultRow.m", 61, @"cannot call %s after the row has become invalid", "-[PBFSQLiteResultRow count]");

    statement = self->_statement;
  }
  return sqlite3_column_count(statement);
}

- (id)keyAtIndex:(unint64_t)a3
{
  int v3 = a3;
  statement = self->_statement;
  if (!statement)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PBFSQLiteResultRow.m", 66, @"cannot call %s after the row has become invalid", "-[PBFSQLiteResultRow keyAtIndex:]");

    statement = self->_statement;
  }
  objc_super v6 = NSString;
  objc_super v7 = sqlite3_column_name(statement, v3);
  return (id)[v6 stringWithUTF8String:v7];
}

- (id)objectForKey:(id)a3
{
  v4 = -[PBFSQLiteResultRow _indexForKey:](self, a3);
  return [(PBFSQLiteResultRow *)self objectAtIndex:v4];
}

- (void)_indexForKey:(void *)result
{
  if (result)
  {
    v2 = result;
    id v3 = a2;
    v4 = -[PBFSQLiteResultRow _columnNames](v2);
    uint64_t v5 = [v4 indexOfObject:v3];

    return (void *)v5;
  }
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PBFSQLiteResultRow.m", 75, @"cannot call %s after the row has become invalid", "-[PBFSQLiteResultRow objectAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    uint64_t v5 = 0;
  }
  else
  {
    switch(sqlite3_column_type(self->_statement, a3))
    {
      case 1:
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PBFSQLiteResultRow integerAtIndex:](self, "integerAtIndex:", a3));
        break;
      case 2:
        objc_super v7 = NSNumber;
        [(PBFSQLiteResultRow *)self doubleAtIndex:a3];
        uint64_t v5 = objc_msgSend(v7, "numberWithDouble:");
        break;
      case 3:
        uint64_t v5 = [(PBFSQLiteResultRow *)self stringAtIndex:a3];
        break;
      case 4:
        uint64_t v5 = [(PBFSQLiteResultRow *)self dataAtIndex:a3];
        break;
      case 5:
        uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
        break;
      default:
        goto LABEL_4;
    }
  }
  return v5;
}

- (int64_t)integerForKey:(id)a3
{
  v4 = -[PBFSQLiteResultRow _indexForKey:](self, a3);
  return [(PBFSQLiteResultRow *)self integerAtIndex:v4];
}

- (int64_t)integerAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PBFSQLiteResultRow.m", 102, @"cannot call %s after the row has become invalid", "-[PBFSQLiteResultRow integerAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  statement = self->_statement;
  return sqlite3_column_int64(statement, a3);
}

- (double)doubleForKey:(id)a3
{
  v4 = -[PBFSQLiteResultRow _indexForKey:](self, a3);
  [(PBFSQLiteResultRow *)self doubleAtIndex:v4];
  return result;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PBFSQLiteResultRow.m", 114, @"cannot call %s after the row has become invalid", "-[PBFSQLiteResultRow doubleAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0.0;
  }
  statement = self->_statement;
  return sqlite3_column_double(statement, a3);
}

- (id)stringForKey:(id)a3
{
  v4 = -[PBFSQLiteResultRow _indexForKey:](self, a3);
  return [(PBFSQLiteResultRow *)self stringAtIndex:v4];
}

- (id)stringAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PBFSQLiteResultRow.m", 126, @"cannot call %s after the row has become invalid", "-[PBFSQLiteResultRow stringAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    int v6 = sqlite3_column_bytes(self->_statement, a3);
    uint64_t v5 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", sqlite3_column_text(self->_statement, a3), v6, 4);
  }
  return v5;
}

- (id)dataForKey:(id)a3
{
  v4 = -[PBFSQLiteResultRow _indexForKey:](self, a3);
  return [(PBFSQLiteResultRow *)self dataAtIndex:v4];
}

- (id)dataAtIndex:(unint64_t)a3
{
  if (!self->_statement)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PBFSQLiteResultRow.m", 140, @"cannot call %s after the row has become invalid", "-[PBFSQLiteResultRow dataAtIndex:]");
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    int v6 = sqlite3_column_bytes(self->_statement, a3);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", sqlite3_column_blob(self->_statement, a3), v6);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_PBFSQLiteFrozenResultRow allocWithZone:a3];
  return -[_PBFSQLiteFrozenResultRow _initWithResultRow:](v4, self);
}

- (void)_columnNames
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[2];
    if (!v3)
    {
      uint64_t v4 = [a1 count];
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
      if (v4)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          objc_super v7 = [v2 keyAtIndex:i];
          [v5 addObject:v7];
        }
      }
      uint64_t v8 = [v5 copy];
      v9 = (void *)v2[2];
      v2[2] = v8;

      id v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
}

@end