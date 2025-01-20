@interface SiriCoreSQLiteQueryOrder
- (NSArray)columnNames;
- (SiriCoreSQLiteQueryOrder)initWithColumnNames:(id)a3 mode:(int64_t)a4;
- (int64_t)mode;
@end

@implementation SiriCoreSQLiteQueryOrder

- (void).cxx_destruct
{
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (int64_t)mode
{
  return self->_mode;
}

- (SiriCoreSQLiteQueryOrder)initWithColumnNames:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriCoreSQLiteQueryOrder;
  v7 = [(SiriCoreSQLiteQueryOrder *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_mode = a4;
    uint64_t v9 = [v6 copy];
    columnNames = v8->_columnNames;
    v8->_columnNames = (NSArray *)v9;
  }
  return v8;
}

@end