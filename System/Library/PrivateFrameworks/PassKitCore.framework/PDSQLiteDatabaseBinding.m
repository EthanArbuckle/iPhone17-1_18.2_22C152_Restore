@interface PDSQLiteDatabaseBinding
- (NSArray)items;
- (PDSQLiteDatabaseBinding)init;
- (id)description;
- (void)addBindingItem:(id)a3;
- (void)addIntBinding:(int64_t)a3;
- (void)addTextBinding:(id)a3;
- (void)appendBindingItems:(id)a3;
- (void)insertBindingItems:(id)a3 atIndex:(int64_t)a4;
- (void)sqliteBindWithStatement:(sqlite3_stmt *)a3;
@end

@implementation PDSQLiteDatabaseBinding

- (PDSQLiteDatabaseBinding)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDSQLiteDatabaseBinding;
  v2 = [(PDSQLiteDatabaseBinding *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    items = v2->_items;
    v2->_items = v3;
  }
  return v2;
}

- (NSArray)items
{
  id v2 = [(NSMutableArray *)self->_items copy];
  return (NSArray *)v2;
}

- (void)addIntBinding:(int64_t)a3
{
  v4 = [[PDSQLiteDatabaseBindingItem alloc] initWithIntValue:a3];
  [(PDSQLiteDatabaseBinding *)self addBindingItem:v4];
}

- (void)addTextBinding:(id)a3
{
  id v4 = a3;
  v5 = [[PDSQLiteDatabaseBindingItem alloc] initWithTextValue:v4];

  [(PDSQLiteDatabaseBinding *)self addBindingItem:v5];
}

- (void)addBindingItem:(id)a3
{
}

- (void)appendBindingItems:(id)a3
{
  items = self->_items;
  id v4 = [a3 items];
  [(NSMutableArray *)items addObjectsFromArray:v4];
}

- (void)insertBindingItems:(id)a3 atIndex:(int64_t)a4
{
  id v13 = a3;
  objc_super v6 = [v13 items];
  id v7 = [v6 count];

  if ((a4 & 0x8000000000000000) == 0 && v7 && (unint64_t)[(NSMutableArray *)self->_items count] >= a4)
  {
    id v8 = objc_alloc((Class)NSIndexSet);
    v9 = [v13 items];
    id v10 = objc_msgSend(v8, "initWithIndexesInRange:", a4, objc_msgSend(v9, "count"));

    items = self->_items;
    v12 = [v13 items];
    [(NSMutableArray *)items insertObjects:v12 atIndexes:v10];
  }
}

- (void)sqliteBindWithStatement:(sqlite3_stmt *)a3
{
  if ([(NSMutableArray *)self->_items count])
  {
    unint64_t v5 = 0;
    do
    {
      objc_super v6 = [(NSMutableArray *)self->_items objectAtIndexedSubscript:v5];
      id v7 = [v6 type];
      if (v7 == (id)1)
      {
        id v8 = [v6 textValue];
        sqlite3_bind_text(a3, v5 + 1, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else if (!v7)
      {
        sqlite3_bind_int64(a3, v5 + 1, (sqlite3_int64)[v6 intValue]);
      }

      ++v5;
    }
    while (v5 < (unint64_t)[(NSMutableArray *)self->_items count]);
  }
}

- (id)description
{
  return [(NSMutableArray *)self->_items description];
}

- (void).cxx_destruct
{
}

@end