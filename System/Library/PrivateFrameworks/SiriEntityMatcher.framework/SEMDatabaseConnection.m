@interface SEMDatabaseConnection
+ (id)connectionToDatabaseAtURL:(id)a3 dataProtectionClass:(int)a4 openMode:(int64_t)a5;
+ (id)readOnlyConnectionToDatabaseAtURL:(id)a3;
- (BOOL)_createTableWithRecordClass:(Class)a3 error:(id *)a4;
- (BOOL)_getRowResultsOfSelect:(id)a3 outRows:(id *)a4 error:(id *)a5;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)cleanup:(id *)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6 enumerateAll:(BOOL)a7 error:(id *)a8 usingBlock:(id)a9;
- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 batchSize:(unint64_t)a4 offset:(unint64_t)a5 enumerateAll:(BOOL)a6 error:(id *)a7 usingBlock:(id)a8;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)executeCommand:(id)a3 error:(id *)a4;
- (BOOL)executeCommand:(id)a3 error:(id *)a4 returningRow:(id *)a5;
- (BOOL)exists;
- (BOOL)openWithError:(id *)a3;
- (BOOL)prepareFTSWithError:(id *)a3;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (NSString)description;
- (SEMDatabaseConnection)init;
- (SEMDatabaseConnection)initWithDatabase:(id)a3;
- (int)rowsModified:(id *)a3;
- (void)dealloc;
@end

@implementation SEMDatabaseConnection

+ (id)readOnlyConnectionToDatabaseAtURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v6 = objc_msgSend_connectionToDatabaseAtURL_dataProtectionClass_openMode_(v4, v5, (uint64_t)v3, 0, 1);

  return v6;
}

+ (id)connectionToDatabaseAtURL:(id)a3 dataProtectionClass:(int)a4 openMode:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  v8 = [SEMSQLiteDatabase alloc];
  v12 = objc_msgSend_path(v7, v9, v10, v11);

  if ((unint64_t)(a5 - 1) >= 3) {
    uint64_t v14 = objc_msgSend_initWithPath_accessPermission_threadingMode_dataProtectionClass_databaseOptions_(v8, v13, (uint64_t)v12, 0, 3, v6, 3);
  }
  else {
    uint64_t v14 = objc_msgSend_initWithPath_accessPermission_threadingMode_dataProtectionClass_databaseOptions_(v8, v13, (uint64_t)v12, a5, 3, v6, 3);
  }
  v15 = (void *)v14;

  id v16 = objc_alloc((Class)objc_opt_class());
  v19 = objc_msgSend_initWithDatabase_(v16, v17, (uint64_t)v15, v18);

  return v19;
}

- (SEMDatabaseConnection)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use supported initializer", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMDatabaseConnection)initWithDatabase:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SEMDatabaseConnection;
  uint64_t v6 = [(SEMDatabaseConnection *)&v11 init];
  id v7 = v6;
  if (v6 && (v6->_inTransaction = 0, objc_storeStrong((id *)&v6->_db, a3), !v7->_db))
  {
    v9 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[SEMDatabaseConnection initWithDatabase:]";
      _os_log_error_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_ERROR, "%s Cannot create connection with nil database.", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (BOOL)exists
{
  id v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3);
  v9 = objc_msgSend_path(self->_db, v6, v7, v8);
  char v12 = objc_msgSend_fileExistsAtPath_(v5, v10, (uint64_t)v9, v11);

  return v12;
}

- (NSString)description
{
  v12.receiver = self;
  v12.super_class = (Class)SEMDatabaseConnection;
  uint64_t v3 = [(SEMDatabaseConnection *)&v12 description];
  uint64_t v7 = objc_msgSend_path(self->_db, v4, v5, v6);
  uint64_t v10 = objc_msgSend_stringByAppendingFormat_(v3, v8, @" %@", v9, v7);

  return (NSString *)v10;
}

- (void)dealloc
{
  objc_msgSend_closeWithError_(self, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)SEMDatabaseConnection;
  [(SEMDatabaseConnection *)&v4 dealloc];
}

- (BOOL)openWithError:(id *)a3
{
  uint64_t v6 = objc_msgSend_stringWithFormat_(NSString, a2, @"PRAGMA busy_timeout = %d", v3, 500);
  uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v7, @"PRAGMA cache_spill = %d", v8, 800);
  if (objc_msgSend_openWithError_(self->_db, v10, (uint64_t)a3, v11)
    && objc_msgSend_executeCommandString_error_(self->_db, v12, (uint64_t)v6, (uint64_t)a3)
    && objc_msgSend_executeCommandString_error_(self->_db, v13, @"PRAGMA foreign_keys = ON;",
                       (uint64_t)a3))
  {
    char v15 = objc_msgSend_executeCommandString_error_(self->_db, v14, (uint64_t)v9, (uint64_t)a3);
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)closeWithError:(id *)a3
{
  return objc_msgSend_closeWithError_(self->_db, a2, (uint64_t)a3, v3);
}

- (BOOL)prepareFTSWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ((objc_msgSend_beginTransactionWithError_(self, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    uint64_t v11 = qword_26B3549D8;
    BOOL v10 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    *(_DWORD *)v17 = 136315138;
    *(void *)&v17[4] = "-[SEMDatabaseConnection prepareFTSWithError:]";
    _os_log_error_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_ERROR, "%s Failed to begin transaction on prepare operation.", v17, 0xCu);
LABEL_11:
    LOBYTE(v10) = 0;
    return v10;
  }
  uint64_t v6 = objc_opt_class();
  if ((objc_msgSend__createTableWithRecordClass_error_(self, v7, v6, (uint64_t)a3) & 1) == 0)
  {
    objc_super v12 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      objc_msgSend_rollbackTransactionWithError_(self, v13, (uint64_t)a3, v14, *(_OWORD *)v17);
      goto LABEL_11;
    }
    *(_DWORD *)v17 = 136315138;
    *(void *)&v17[4] = "-[SEMDatabaseConnection prepareFTSWithError:]";
    char v15 = "%s Failed to create table on prepare operation.";
LABEL_14:
    _os_log_error_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_ERROR, v15, v17, 0xCu);
    goto LABEL_10;
  }
  if ((objc_msgSend_commitTransactionWithError_(self, v8, (uint64_t)a3, v9) & 1) == 0)
  {
    objc_super v12 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)v17 = 136315138;
    *(void *)&v17[4] = "-[SEMDatabaseConnection prepareFTSWithError:]";
    char v15 = "%s Failed to commit transaction on prepare operation.";
    goto LABEL_14;
  }
  LOBYTE(v10) = 1;
  return v10;
}

- (BOOL)_createTableWithRecordClass:(Class)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend_genSQLCreateStatements(a3, a2, (uint64_t)a3, (uint64_t)a4, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend_executeCommandString_error_(self->_db, v9, *(void *)(*((void *)&v15 + 1) + 8 * i), (uint64_t)a4))
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v15, (uint64_t)v19, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    objc_super v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F07F80];
    v18[0] = @"Attempted to begin transaction when one is already active";
    uint64_t v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v18, (uint64_t)&v17, 1);
    uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(v4, v6, 0x2709E0C50, 11, v5);
    uint64_t v8 = v7;
    if (a3 && v7) {
      *a3 = v7;
    }

    LOBYTE(v9) = 0;
  }
  else
  {
    uint64_t v11 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      long long v16 = "-[SEMDatabaseConnection beginTransactionWithError:]";
      _os_log_debug_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_DEBUG, "%s Beginning transaction", (uint8_t *)&v15, 0xCu);
    }
    int v9 = objc_msgSend_beginTransactionWithError_(self->_db, v12, (uint64_t)a3, v13);
    if (v9)
    {
      LOBYTE(v9) = 1;
      self->_inTransaction = 1;
    }
  }
  return v9;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    uint64_t v5 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      long long v16 = "-[SEMDatabaseConnection commitTransactionWithError:]";
      _os_log_debug_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_DEBUG, "%s Committing transaction.", (uint8_t *)&v15, 0xCu);
    }
    int v8 = objc_msgSend_commitTransactionWithError_(self->_db, v6, (uint64_t)a3, v7);
    if (v8)
    {
      self->_inTransaction = 0;
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    int v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F07F80];
    v18[0] = @"Attempted to commit transaction when none are active";
    uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v18, (uint64_t)&v17, 1);
    objc_super v12 = objc_msgSend_errorWithDomain_code_userInfo_(v9, v11, 0x2709E0C50, 12, v10);
    uint64_t v13 = v12;
    if (a3 && v12) {
      *a3 = v12;
    }

    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    uint64_t v5 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315138;
      long long v16 = "-[SEMDatabaseConnection rollbackTransactionWithError:]";
      _os_log_debug_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_DEBUG, "%s Rolling back transaction.", (uint8_t *)&v15, 0xCu);
    }
    int v8 = objc_msgSend_rollbackTransactionWithError_(self->_db, v6, (uint64_t)a3, v7);
    if (v8)
    {
      self->_inTransaction = 0;
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    int v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F07F80];
    v18[0] = @"Attempted to rollback transaction when none are active";
    uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v18, (uint64_t)&v17, 1);
    objc_super v12 = objc_msgSend_errorWithDomain_code_userInfo_(v9, v11, 0x2709E0C50, 13, v10);
    uint64_t v13 = v12;
    if (a3 && v12) {
      *a3 = v12;
    }

    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)cleanup:(id *)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    objc_super v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    v17[0] = @"Attempted to cleanup while transaction is active";
    uint64_t v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v17, (uint64_t)&v16, 1);
    uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(v4, v6, 0x2709E0C50, 16, v5);
    int v8 = v7;
    if (a3)
    {
      if (v7) {
        *a3 = v7;
      }
    }

    return 0;
  }
  else
  {
    uint64_t v11 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315138;
      int v15 = "-[SEMDatabaseConnection cleanup:]";
      _os_log_debug_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_DEBUG, "%s Cleaning database.", (uint8_t *)&v14, 0xCu);
    }
    return objc_msgSend_cleanup_(self->_db, v12, (uint64_t)a3, v13);
  }
}

- (BOOL)executeCommand:(id)a3 error:(id *)a4
{
  uint64_t v5 = objc_msgSend_executeCommand_options_(self->_db, a2, (uint64_t)a3, 2);
  int v9 = objc_msgSend_error(v5, v6, v7, v8);
  uint64_t v10 = v9;
  if (a4 && v9) {
    *a4 = v9;
  }

  return v10 == 0;
}

- (BOOL)executeCommand:(id)a3 error:(id *)a4 returningRow:(id *)a5
{
  uint64_t v7 = objc_msgSend_executeCommand_options_(self->_db, a2, (uint64_t)a3, 2);
  uint64_t v11 = objc_msgSend_error(v7, v8, v9, v10);
  objc_super v12 = v11;
  if (v11)
  {
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    uint64_t v13 = [SEMDatabaseValueRow alloc];
    uint64_t v17 = objc_msgSend_rowValueTuples(v7, v14, v15, v16);
    v21 = objc_msgSend_firstObject(v17, v18, v19, v20);
    v24 = objc_msgSend_initWithDatabaseValueArray_(v13, v22, (uint64_t)v21, v23);

    if (a5) {
      *a5 = v24;
    }
  }
  return v12 == 0;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v32 = 0;
  int RowResultsOfSelect_outRows_error = objc_msgSend__getRowResultsOfSelect_outRows_error_(self, v10, (uint64_t)v8, (uint64_t)&v32, a4);
  id v12 = v32;
  if (RowResultsOfSelect_outRows_error)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_25C7E7DC0;
    v30 = sub_25C7E7DD0;
    id v31 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 1;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = sub_25C7E7DD8;
    v18[3] = &unk_2654DE098;
    id v19 = v9;
    uint64_t v20 = &v26;
    v21 = &v22;
    objc_msgSend_enumerateObjectsUsingBlock_(v12, v13, (uint64_t)v18, v14);
    if (a4)
    {
      uint64_t v15 = (void *)v27[5];
      if (v15) {
        *a4 = v15;
      }
    }
    BOOL v16 = *((unsigned char *)v23 + 24) != 0;

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_25C7E7F48;
  v14[3] = &unk_2654DE0C0;
  id v15 = v10;
  Class v16 = a4;
  id v11 = v10;
  LOBYTE(a5) = objc_msgSend_enumerateRowResultsOfSelect_error_usingBlock_(self, v12, (uint64_t)a3, (uint64_t)a5, v14);

  return (char)a5;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 batchSize:(unint64_t)a4 offset:(unint64_t)a5 enumerateAll:(BOOL)a6 error:(id *)a7 usingBlock:(id)a8
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = (uint64_t (**)(id, void *, id *, unsigned char *))a8;
  unint64_t v14 = objc_msgSend_addLimit_offset_(v11, v13, a4, a5);
  id v15 = 0;
  id v16 = 0;
  *(void *)&long long v17 = 136315906;
  long long v48 = v17;
  id v50 = v11;
  unint64_t v51 = a4;
  do
  {
    long long v18 = v15;
    context = (void *)MEMORY[0x261194780](v14);
    id v63 = v15;
    id v64 = v16;
    int RowResultsOfSelect_outRows_error = objc_msgSend__getRowResultsOfSelect_outRows_error_(self, v19, (uint64_t)v11, (uint64_t)&v64, &v63);
    id v21 = v64;

    id v15 = v63;
    if (!RowResultsOfSelect_outRows_error) {
      goto LABEL_24;
    }
    char v62 = 0;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v55 = v21;
    id v16 = v21;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v22, (uint64_t)&v58, (uint64_t)v73, 16);
    if (!v23)
    {
      int RowResultsOfSelect_outRows_error = 1;
      goto LABEL_17;
    }
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v59;
    unint64_t v54 = a5;
    while (2)
    {
      uint64_t v26 = 0;
      v27 = v15;
      do
      {
        if (*(void *)v59 != v25) {
          objc_enumerationMutation(v16);
        }
        uint64_t v28 = *(void *)(*((void *)&v58 + 1) + 8 * v26);
        v29 = [SEMDatabaseValueRow alloc];
        id v32 = objc_msgSend_initWithDatabaseValueArray_(v29, v30, v28, v31);
        v33 = v32;
        if (v62)
        {

          int RowResultsOfSelect_outRows_error = 1;
          id v15 = v27;
LABEL_16:
          id v11 = v50;
          a5 = v54;
          goto LABEL_17;
        }
        id v57 = v27;
        int v34 = v12[2](v12, v32, &v57, &v62);
        id v15 = v57;

        if (!v34)
        {
          int RowResultsOfSelect_outRows_error = 0;
          goto LABEL_16;
        }
        ++v26;
        v27 = v15;
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v35, (uint64_t)&v58, (uint64_t)v73, 16);
      int RowResultsOfSelect_outRows_error = 1;
      id v11 = v50;
      a5 = v54;
      if (v24) {
        continue;
      }
      break;
    }
LABEL_17:

    if (!a6)
    {
      id v21 = v55;
LABEL_24:
      break;
    }
    v36 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      v42 = v36;
      int v46 = objc_msgSend_count(v16, v43, v44, v45);
      *(_DWORD *)buf = v48;
      v66 = "-[SEMDatabaseConnection enumerateRowResultsOfSelect:batchSize:offset:enumerateAll:error:usingBlock:]";
      __int16 v67 = 1024;
      int v68 = a5;
      __int16 v69 = 1024;
      int v70 = v51;
      __int16 v71 = 1024;
      int v72 = v46;
      _os_log_debug_impl(&dword_25C7CA000, v42, OS_LOG_TYPE_DEBUG, "%s Read database batch {offset: %u batchSize: %u} total records read: %u", buf, 0x1Eu);
    }
    a5 += v51;
    objc_msgSend_replaceOffset_(v11, v37, a5, v38, v48);
    id v21 = v55;
    if (!RowResultsOfSelect_outRows_error) {
      break;
    }
    unint64_t v14 = objc_msgSend_count(v16, v39, v40, v41);
  }
  while (v14 >= v51);
  if (v15)
  {
    LOBYTE(RowResultsOfSelect_outRows_error) = 0;
    if (a7) {
      *a7 = v15;
    }
  }

  return RowResultsOfSelect_outRows_error;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6 enumerateAll:(BOOL)a7 error:(id *)a8 usingBlock:(id)a9
{
  BOOL v10 = a7;
  id v16 = a9;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_25C7E84A8;
  v20[3] = &unk_2654DE0C0;
  id v21 = v16;
  Class v22 = a4;
  id v17 = v16;
  LOBYTE(a8) = objc_msgSend_enumerateRowResultsOfSelect_batchSize_offset_enumerateAll_error_usingBlock_(self, v18, (uint64_t)a3, a5, a6, v10, a8, v20);

  return (char)a8;
}

- (int)rowsModified:(id *)a3
{
  return ((uint64_t (*)(SEMDatabase *, char *, id *))MEMORY[0x270F9A6D0])(self->_db, sel_rowsModified_, a3);
}

- (BOOL)_getRowResultsOfSelect:(id)a3 outRows:(id *)a4 error:(id *)a5
{
  v49[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v10 = objc_msgSend_executeCommand_options_(self->_db, v9, (uint64_t)v8, 0);
    unint64_t v14 = objc_msgSend_error(v10, v11, v12, v13);
    id v18 = v14;
    if (v14)
    {
      if (a5) {
        *a5 = v14;
      }
      id v19 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = v19;
        v29 = objc_msgSend_commandString(v8, v26, v27, v28);
        v33 = objc_msgSend_parameters(v8, v30, v31, v32);
        v37 = objc_msgSend_path(self->_db, v34, v35, v36);
        int v38 = 136316162;
        v39 = "-[SEMDatabaseConnection _getRowResultsOfSelect:outRows:error:]";
        __int16 v40 = 2112;
        uint64_t v41 = v29;
        __int16 v42 = 2112;
        v43 = v33;
        __int16 v44 = 2112;
        uint64_t v45 = v37;
        __int16 v46 = 2112;
        id v47 = v18;
        _os_log_error_impl(&dword_25C7CA000, v25, OS_LOG_TYPE_ERROR, "%s Could not execute command=%@ with parameters=%@ in database file at %@, err=%@", (uint8_t *)&v38, 0x34u);
      }
      BOOL v20 = 0;
    }
    else
    {
      objc_msgSend_rowValueTuples(v10, v15, v16, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v20 = 1;
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F07F80];
    v49[0] = @"Could not execute non-select command on read-only database connection";
    BOOL v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v49, (uint64_t)&v48, 1);
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v22, 0x2709E0C50, 14, v10);
    id v18 = v23;
    BOOL v20 = 0;
    if (a5 && v23)
    {
      id v18 = v23;
      BOOL v20 = 0;
      *a5 = v18;
    }
  }

  return v20;
}

- (void).cxx_destruct
{
}

@end