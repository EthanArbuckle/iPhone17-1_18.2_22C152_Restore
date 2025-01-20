@interface SEMDatabaseInsertBuilder
- (BOOL)_setError:(id *)a3 withCode:(int64_t)a4;
- (SEMDatabaseInsertBuilder)initWithTableName:(id)a3 columnNames:(id)a4;
- (id)buildWithError:(id *)a3;
- (void)setColumnValues:(id)a3;
- (void)setReturningColumns:(id)a3;
@end

@implementation SEMDatabaseInsertBuilder

- (SEMDatabaseInsertBuilder)initWithTableName:(id)a3 columnNames:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SEMDatabaseInsertBuilder;
  v10 = [(SEMDatabaseCommandBuilder *)&v20 initWithTableName:a3];
  if (!v10) {
    goto LABEL_4;
  }
  uint64_t v11 = objc_msgSend_count(v6, v7, v8, v9);
  v10->_numberOfColumns = v11;
  if (v11)
  {
    uint64_t v15 = objc_msgSend_copy(v6, v12, v13, v14);
    columnNames = v10->_columnNames;
    v10->_columnNames = (NSArray *)v15;

LABEL_4:
    v17 = v10;
    goto LABEL_8;
  }
  v18 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SEMDatabaseInsertBuilder initWithTableName:columnNames:]";
    _os_log_error_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_ERROR, "%s Cannot construct DatabaseInsertBuilder with empty columnNames array", buf, 0xCu);
  }
  v17 = 0;
LABEL_8:

  return v17;
}

- (id)buildWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t numberOfColumns = self->_numberOfColumns;
  if (numberOfColumns == objc_msgSend_count(self->_columnValues, a2, (uint64_t)a3, v3))
  {
    v10 = objc_msgSend_tableName(self, v7, v8, v9);
    v12 = objc_msgSend_insertCommandStringWithTableName_columnNames_returningColumns_(SEMSQLCommandGenerator, v11, (uint64_t)v10, (uint64_t)self->_columnNames, self->_returningColumns);

    uint64_t v13 = [SEMDatabaseInsert alloc];
    uint64_t v15 = objc_msgSend_initWithCommandString_parameters_(v13, v14, (uint64_t)v12, (uint64_t)self->_columnValues);
  }
  else
  {
    objc_msgSend__setError_withCode_(self, v7, (uint64_t)a3, 1);
    v16 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      v19 = "-[SEMDatabaseInsertBuilder buildWithError:]";
      _os_log_error_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_ERROR, "%s columnValues array size does not match columnNames array size", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v15 = 0;
  }
  return v15;
}

- (void)setColumnValues:(id)a3
{
  self->_columnValues = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x270F9A758]();
}

- (void)setReturningColumns:(id)a3
{
  self->_returningColumns = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x270F9A758]();
}

- (BOOL)_setError:(id *)a3 withCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], a2, @"com.apple.siri.vocabulary.database.insert", a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returningColumns, 0);
  objc_storeStrong((id *)&self->_columnValues, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end