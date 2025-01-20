@interface SEMDatabaseValueRow
- (SEMDatabaseValueRow)init;
- (SEMDatabaseValueRow)initWithDatabaseValueArray:(id)a3;
- (id)dataValueAtColumnIndex:(unint64_t)a3;
- (id)description;
- (id)numberValueAtColumnIndex:(unint64_t)a3;
- (id)stringValueAtColumnIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation SEMDatabaseValueRow

- (SEMDatabaseValueRow)initWithDatabaseValueArray:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SEMDatabaseValueRow;
  v6 = [(SEMDatabaseValueRow *)&v14 init];
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_databaseValueArray, a3), (databaseValueArray = v7->_databaseValueArray) != 0)
    && objc_msgSend_count(databaseValueArray, v8, v9, v10))
  {
    v12 = v7;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (SEMDatabaseValueRow)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use -initWithDatabaseValueArray", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  return (id)objc_msgSend_description(self->_databaseValueArray, a2, v2, v3);
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_databaseValueArray, a2, v2, v3);
}

- (id)stringValueAtColumnIndex:(unint64_t)a3
{
  v4 = objc_msgSend_objectAtIndex_(self->_databaseValueArray, a2, a3, v3);
  v8 = objc_msgSend_databaseValue_toString(v4, v5, v6, v7);

  return v8;
}

- (id)numberValueAtColumnIndex:(unint64_t)a3
{
  v4 = objc_msgSend_objectAtIndex_(self->_databaseValueArray, a2, a3, v3);
  v8 = objc_msgSend_databaseValue_toNumber(v4, v5, v6, v7);

  return v8;
}

- (id)dataValueAtColumnIndex:(unint64_t)a3
{
  v4 = objc_msgSend_objectAtIndex_(self->_databaseValueArray, a2, a3, v3);
  v8 = objc_msgSend_databaseValue_toData(v4, v5, v6, v7);

  return v8;
}

- (void).cxx_destruct
{
}

@end