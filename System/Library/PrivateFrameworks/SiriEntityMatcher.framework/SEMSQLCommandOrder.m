@interface SEMSQLCommandOrder
- (NSArray)columnNames;
- (SEMSQLCommandOrder)init;
- (SEMSQLCommandOrder)initWithOrderMode:(int64_t)a3 columnNames:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)orderMode;
@end

@implementation SEMSQLCommandOrder

- (SEMSQLCommandOrder)initWithOrderMode:(int64_t)a3 columnNames:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SEMSQLCommandOrder;
  v7 = [(SEMSQLCommandOrder *)&v15 init];
  v11 = v7;
  if (v7)
  {
    v7->_orderMode = a3;
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    columnNames = v11->_columnNames;
    v11->_columnNames = (NSArray *)v12;
  }
  return v11;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)SEMSQLCommandOrder;
  v3 = [(SEMSQLCommandOrder *)&v11 description];
  id v6 = objc_msgSend_numberWithInteger_(NSNumber, v4, self->_orderMode, v5);
  uint64_t v9 = objc_msgSend_stringByAppendingFormat_(v3, v7, @" orderMode: %@, columnNames: %@", v8, v6, self->_columnNames);

  return v9;
}

- (SEMSQLCommandOrder)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use -initWithOrderMode:columnNames", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v8[1] = self->_orderMode;
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_columnNames, v9, (uint64_t)a3, v10);
  uint64_t v12 = (void *)v8[2];
  v8[2] = v11;

  return v8;
}

- (int64_t)orderMode
{
  return self->_orderMode;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void).cxx_destruct
{
}

@end