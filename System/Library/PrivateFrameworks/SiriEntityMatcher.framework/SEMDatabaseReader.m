@interface SEMDatabaseReader
+ (id)readerForDatabaseAtURL:(id)a3;
- (BOOL)activateWithError:(id *)a3 operationBlock:(id)a4;
- (BOOL)deactivateWithError:(id *)a3;
- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6 enumerateAll:(BOOL)a7 error:(id *)a8 usingBlock:(id)a9;
- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 batchSize:(unint64_t)a4 offset:(unint64_t)a5 enumerateAll:(BOOL)a6 error:(id *)a7 usingBlock:(id)a8;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (SEMDatabaseReader)init;
- (SEMDatabaseReader)initWithConnection:(id)a3 lifespan:(double)a4;
- (id)_activationBlock;
- (id)_deactivationBlock;
- (void)dealloc;
@end

@implementation SEMDatabaseReader

+ (id)readerForDatabaseAtURL:(id)a3
{
  v4 = objc_msgSend_readOnlyConnectionToDatabaseAtURL_(SEMDatabaseConnection, a2, (uint64_t)a3, v3);
  id v5 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend_initWithConnection_lifespan_(v5, v6, (uint64_t)v4, v7, 5.0);

  return v8;
}

- (SEMDatabaseReader)initWithConnection:(id)a3 lifespan:(double)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SEMDatabaseReader;
  v8 = [(SEMDatabaseReader *)&v41 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v8->_connection, a3);
  if (!v9->_connection)
  {
    v32 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SEMDatabaseReader initWithConnection:lifespan:]";
      _os_log_error_impl(&dword_25C7CA000, v32, OS_LOG_TYPE_ERROR, "%s nil database connection.", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v9->_double lifespan = a4;
  if (a4 <= 0.0)
  {
    v33 = (void *)qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      v31 = 0;
      goto LABEL_15;
    }
    v34 = NSNumber;
    v17 = v33;
    v38 = objc_msgSend_numberWithDouble_(v34, v35, v36, v37, a4);
    *(_DWORD *)buf = 136315394;
    v43 = "-[SEMDatabaseReader initWithConnection:lifespan:]";
    __int16 v44 = 2112;
    v45 = v38;
    _os_log_error_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_ERROR, "%s Invalid lifespan: %@", buf, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  v12 = NSString;
  uint64_t v13 = dword_26A5D708C++;
  v14 = objc_msgSend_numberWithInt_(NSNumber, v10, v13, v11);
  v17 = objc_msgSend_stringWithFormat_(v12, v15, @"DB-Reader-%@", v16, v14);

  v18 = [SEMProvisionalResourceManager alloc];
  double lifespan = v9->_lifespan;
  v23 = objc_msgSend__activationBlock(v9, v20, v21, v22);
  v27 = objc_msgSend__deactivationBlock(v9, v24, v25, v26);
  uint64_t v29 = objc_msgSend_initWithResourceName_lifespan_activationBlock_deactivationBlock_serializeOperations_(v18, v28, (uint64_t)v17, (uint64_t)v23, v27, 0, lifespan);
  resourceManager = v9->_resourceManager;
  v9->_resourceManager = (SEMProvisionalResourceManager *)v29;

  if (!v9->_resourceManager)
  {
    v39 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[SEMDatabaseReader initWithConnection:lifespan:]";
      __int16 v44 = 2112;
      v45 = v17;
      _os_log_error_impl(&dword_25C7CA000, v39, OS_LOG_TYPE_ERROR, "%s Failed to initialize resource manager for resource: %@", buf, 0x16u);
    }
    goto LABEL_13;
  }

LABEL_6:
  v31 = v9;
LABEL_15:

  return v31;
}

- (SEMDatabaseReader)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use supported initializer", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  objc_msgSend_deactivateWithError_(self->_resourceManager, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)SEMDatabaseReader;
  [(SEMDatabaseReader *)&v4 dealloc];
}

- (id)_activationBlock
{
  uint64_t v2 = self->_connection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_25C7E9850;
  v6[3] = &unk_2654DE118;
  id v7 = v2;
  uint64_t v3 = v2;
  objc_super v4 = (void *)MEMORY[0x2611949C0](v6);

  return v4;
}

- (id)_deactivationBlock
{
  uint64_t v2 = self->_connection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_25C7E9904;
  v6[3] = &unk_2654DE118;
  id v7 = v2;
  uint64_t v3 = v2;
  objc_super v4 = (void *)MEMORY[0x2611949C0](v6);

  return v4;
}

- (BOOL)activateWithError:(id *)a3 operationBlock:(id)a4
{
  return (unint64_t)(objc_msgSend_activateWithError_operationBlock_(self->_resourceManager, a2, (uint64_t)a3, (uint64_t)a4)- 1) < 4;
}

- (BOOL)deactivateWithError:(id *)a3
{
  return (unint64_t)(objc_msgSend_deactivateWithError_(self->_resourceManager, a2, (uint64_t)a3, v3) - 1) < 4;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_25C7E9B3C;
  v18[3] = &unk_2654DE140;
  uint64_t v21 = &v24;
  v18[4] = self;
  id v12 = v10;
  id v19 = v12;
  Class v22 = a4;
  v23 = a5;
  id v13 = v11;
  id v20 = v13;
  if (objc_msgSend_activateWithError_operationBlock_(self, v14, (uint64_t)a5, (uint64_t)v18))
  {

    BOOL v15 = *((unsigned char *)v25 + 24) != 0;
  }
  else
  {
    uint64_t v16 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = "-[SEMDatabaseReader enumerateRecordResultsOfSelect:recordClass:error:usingBlock:]";
      _os_log_error_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_ERROR, "%s Failed to activate database connection.", buf, 0xCu);
    }

    BOOL v15 = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v15;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6 enumerateAll:(BOOL)a7 error:(id *)a8 usingBlock:(id)a9
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a9;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_25C7E9D74;
  v23[3] = &unk_2654DE168;
  uint64_t v26 = &v32;
  v23[4] = self;
  id v17 = v15;
  id v24 = v17;
  Class v27 = a4;
  unint64_t v28 = a5;
  unint64_t v29 = a6;
  uint64_t v30 = a8;
  BOOL v31 = a7;
  id v18 = v16;
  id v25 = v18;
  if (objc_msgSend_activateWithError_operationBlock_(self, v19, (uint64_t)a8, (uint64_t)v23))
  {

    BOOL v20 = *((unsigned char *)v33 + 24) != 0;
  }
  else
  {
    uint64_t v21 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v37 = "-[SEMDatabaseReader enumerateRecordResultsOfSelect:recordClass:batchSize:offset:enumerateAll:error:usingBlock:]";
      _os_log_error_impl(&dword_25C7CA000, v21, OS_LOG_TYPE_ERROR, "%s Failed to activate database connection.", buf, 0xCu);
    }

    BOOL v20 = 0;
  }
  _Block_object_dispose(&v32, 8);

  return v20;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0;
  Class v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_25C7E9FA0;
  v16[3] = &unk_2654DE190;
  id v19 = &v21;
  v16[4] = self;
  id v10 = v8;
  id v17 = v10;
  BOOL v20 = a4;
  id v11 = v9;
  id v18 = v11;
  if (objc_msgSend_activateWithError_operationBlock_(self, v12, (uint64_t)a4, (uint64_t)v16))
  {

    BOOL v13 = *((unsigned char *)v22 + 24) != 0;
  }
  else
  {
    v14 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v26 = "-[SEMDatabaseReader enumerateRowResultsOfSelect:error:usingBlock:]";
      _os_log_error_impl(&dword_25C7CA000, v14, OS_LOG_TYPE_ERROR, "%s Failed to activate database connection.", buf, 0xCu);
    }

    BOOL v13 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 batchSize:(unint64_t)a4 offset:(unint64_t)a5 enumerateAll:(BOOL)a6 error:(id *)a7 usingBlock:(id)a8
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a8;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_25C7EA1D4;
  v22[3] = &unk_2654DE1B8;
  id v25 = &v30;
  v22[4] = self;
  id v16 = v14;
  id v23 = v16;
  unint64_t v26 = a4;
  unint64_t v27 = a5;
  BOOL v29 = a6;
  unint64_t v28 = a7;
  id v17 = v15;
  id v24 = v17;
  if (objc_msgSend_activateWithError_operationBlock_(self, v18, (uint64_t)a7, (uint64_t)v22))
  {

    BOOL v19 = *((unsigned char *)v31 + 24) != 0;
  }
  else
  {
    BOOL v20 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      char v35 = "-[SEMDatabaseReader enumerateRowResultsOfSelect:batchSize:offset:enumerateAll:error:usingBlock:]";
      _os_log_error_impl(&dword_25C7CA000, v20, OS_LOG_TYPE_ERROR, "%s Failed to activate database connection.", buf, 0xCu);
    }

    BOOL v19 = 0;
  }
  _Block_object_dispose(&v30, 8);

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end