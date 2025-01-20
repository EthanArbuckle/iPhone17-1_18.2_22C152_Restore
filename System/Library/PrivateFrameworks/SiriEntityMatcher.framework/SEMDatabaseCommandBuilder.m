@interface SEMDatabaseCommandBuilder
- (NSString)tableName;
- (SEMDatabaseCommandBuilder)init;
- (SEMDatabaseCommandBuilder)initWithTableName:(id)a3;
- (SEMSQLCommandCriterion)criterion;
- (void)setCommandCriterion:(id)a3;
@end

@implementation SEMDatabaseCommandBuilder

- (SEMDatabaseCommandBuilder)initWithTableName:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SEMDatabaseCommandBuilder;
  v8 = [(SEMDatabaseCommandBuilder *)&v18 init];
  if (!v8
    || (uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7),
        tableName = v8->_tableName,
        v8->_tableName = (NSString *)v9,
        tableName,
        (v14 = v8->_tableName) != 0)
    && objc_msgSend_length(v14, v11, v12, v13))
  {
    v15 = v8;
  }
  else
  {
    v16 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[SEMDatabaseCommandBuilder initWithTableName:]";
      _os_log_error_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_ERROR, "%s Cannot construct database command builder with nil tableName", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (SEMDatabaseCommandBuilder)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use +builderWithTableName to initialize a builder", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)setCommandCriterion:(id)a3
{
  self->_criterion = (SEMSQLCommandCriterion *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x270F9A758]();
}

- (NSString)tableName
{
  return self->_tableName;
}

- (SEMSQLCommandCriterion)criterion
{
  return self->_criterion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

@end