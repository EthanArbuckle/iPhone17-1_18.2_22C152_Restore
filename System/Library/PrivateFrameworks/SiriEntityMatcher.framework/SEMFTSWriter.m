@interface SEMFTSWriter
+ (BOOL)_isIndexedFieldType:(unsigned __int16)a3;
+ (unsigned)capabilityRequirementForItemType:(unsigned __int16)a3;
- (BOOL)_beginTransactionWithError:(id *)a3;
- (BOOL)_databaseExists;
- (BOOL)_deleteAllRecords:(id *)a3;
- (BOOL)cleanup:(id *)a3;
- (BOOL)clearWithError:(id *)a3;
- (BOOL)commitChanges:(id *)a3;
- (BOOL)databaseExists;
- (BOOL)deleteExternalId:(id)a3 error:(id *)a4;
- (BOOL)deleteExternalIds:(id)a3 error:(id *)a4;
- (BOOL)insertRecordsFromCascadeItem:(id)a3 originAppId:(id)a4 externalId:(id)a5 error:(id *)a6;
- (BOOL)rollbackChanges:(id *)a3;
- (SEMFTSWriter)initWithDatabase:(id)a3;
- (SEMFTSWriter)initWithDatabaseURL:(id)a3 dataProtectionClass:(int)a4;
@end

@implementation SEMFTSWriter

+ (unsigned)capabilityRequirementForItemType:(unsigned __int16)a3
{
  if (a3 == 63369 || a3 == 61352) {
    return 2;
  }
  else {
    return 0;
  }
}

+ (BOOL)_isIndexedFieldType:(unsigned __int16)a3
{
  return (a3 - 61355) < 2 || (a3 - 63372) < 2;
}

- (SEMFTSWriter)initWithDatabaseURL:(id)a3 dataProtectionClass:(int)a4
{
  v5 = objc_msgSend_connectionToDatabaseAtURL_dataProtectionClass_openMode_(SEMDatabaseConnection, a2, (uint64_t)a3, *(uint64_t *)&a4, 3);
  v8 = (SEMFTSWriter *)objc_msgSend_initWithDatabase_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (SEMFTSWriter)initWithDatabase:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SEMFTSWriter;
  v6 = [(SEMFTSWriter *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v11 = objc_msgSend_initWithCapacity_(v8, v9, 3, v10);
    commandCache = v7->_commandCache;
    v7->_commandCache = (NSMutableDictionary *)v11;

    v7->_inTransaction = 0;
  }

  return v7;
}

- (BOOL)databaseExists
{
  if (self->_inTransaction) {
    return 1;
  }
  else {
    return objc_msgSend__databaseExists(self, a2, v2, v3);
  }
}

- (BOOL)_databaseExists
{
  return ((uint64_t (*)(SEMDatabaseConnection *, char *))MEMORY[0x270F9A6D0])(self->_database, sel_exists);
}

- (BOOL)_beginTransactionWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_inTransaction) {
    return 1;
  }
  if (objc_msgSend__databaseExists(self, a2, (uint64_t)a3, v3))
  {
    p_database = (void **)&self->_database;
    if ((objc_msgSend_openWithError_(self->_database, v7, (uint64_t)a3, v8) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    v12 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      database = self->_database;
      int v20 = 136315394;
      v21 = "-[SEMFTSWriter _beginTransactionWithError:]";
      __int16 v22 = 2112;
      v23 = database;
      _os_log_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_INFO, "%s Creating database: %@", (uint8_t *)&v20, 0x16u);
    }
    p_database = (void **)&self->_database;
    if (!objc_msgSend_openWithError_(self->_database, v13, (uint64_t)a3, v14)
      || !objc_msgSend_prepareFTSWithError_(*p_database, v16, (uint64_t)a3, v17))
    {
      return 0;
    }
  }
  if (!objc_msgSend_beginTransactionWithError_(*p_database, v10, (uint64_t)a3, v11)) {
    return 0;
  }
  BOOL v4 = 1;
  self->_inTransaction = 1;
  v18 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 136315138;
    v21 = "-[SEMFTSWriter _beginTransactionWithError:]";
    _os_log_debug_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_DEBUG, "%s Database transaction active", (uint8_t *)&v20, 0xCu);
  }
  return v4;
}

- (BOOL)commitChanges:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_inTransaction)
  {
    uint64_t v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315138;
      v13 = "-[SEMFTSWriter commitChanges:]";
      _os_log_debug_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_DEBUG, "%s No changes to commit", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_9;
  }
  int v6 = objc_msgSend_commitTransactionWithError_(self->_database, a2, (uint64_t)a3, v3);
  if (v6)
  {
    int v6 = objc_msgSend_closeWithError_(self->_database, v7, (uint64_t)a3, v8);
    if (v6)
    {
      v9 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        v13 = "-[SEMFTSWriter commitChanges:]";
        _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Database transaction committed", (uint8_t *)&v12, 0xCu);
      }
      self->_inTransaction = 0;
LABEL_9:
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (BOOL)rollbackChanges:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_inTransaction)
  {
    uint64_t v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315138;
      v13 = "-[SEMFTSWriter rollbackChanges:]";
      _os_log_debug_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_DEBUG, "%s No changes to rollback", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_9;
  }
  int v6 = objc_msgSend_rollbackTransactionWithError_(self->_database, a2, (uint64_t)a3, v3);
  if (v6)
  {
    int v6 = objc_msgSend_closeWithError_(self->_database, v7, (uint64_t)a3, v8);
    if (v6)
    {
      v9 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        v13 = "-[SEMFTSWriter rollbackChanges:]";
        _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Database transaction rolled back", (uint8_t *)&v12, 0xCu);
      }
      self->_inTransaction = 0;
LABEL_9:
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (BOOL)clearWithError:(id *)a3
{
  return ((uint64_t (*)(SEMFTSWriter *, char *, id *))MEMORY[0x270F9A6D0])(self, sel__deleteAllRecords_, a3);
}

- (BOOL)cleanup:(id *)a3
{
  if (!objc_msgSend_openWithError_(self->_database, a2, (uint64_t)a3, v3)
    || !objc_msgSend_cleanup_(self->_database, v6, (uint64_t)a3, v7))
  {
    return 0;
  }
  database = self->_database;
  return objc_msgSend_closeWithError_(database, v8, (uint64_t)a3, v9);
}

- (BOOL)_deleteAllRecords:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!objc_msgSend__beginTransactionWithError_(self, a2, (uint64_t)a3, v3)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_builderWithTableName_(SEMDatabaseDelete, v6, 0x2709E0BB0, v7);
  int v12 = objc_msgSend_build(v8, v9, v10, v11);
  database = self->_database;
  id v20 = 0;
  char v15 = objc_msgSend_executeCommand_error_(database, v14, (uint64_t)v12, (uint64_t)&v20);
  id v16 = v20;
  if ((v15 & 1) == 0)
  {
    uint64_t v17 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_database;
      *(_DWORD *)buf = 136315650;
      __int16 v22 = "-[SEMFTSWriter _deleteAllRecords:]";
      __int16 v23 = 2112;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_error_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_ERROR, "%s (%@) Delete failed: %@", buf, 0x20u);
      if (a3)
      {
LABEL_5:
        if (v16) {
          *a3 = v16;
        }
      }
    }
    else if (a3)
    {
      goto LABEL_5;
    }
  }

  return v15;
}

- (BOOL)deleteExternalId:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (objc_msgSend__beginTransactionWithError_(self, v7, (uint64_t)a4, v8))
  {
    int v12 = objc_msgSend_sem_base64EncodedStringNoPadding(v6, v9, v10, v11);
    v51[0] = v12;
    uint64_t v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, (uint64_t)v51, 1);

    uint64_t v17 = objc_msgSend_objectForKey_(self->_commandCache, v15, (uint64_t)&unk_2709EA508, v16);
    if ((objc_msgSend_updateParameters_(v17, v18, (uint64_t)v14, v19) & 1) == 0)
    {
      __int16 v22 = objc_msgSend_objectAtIndex_(v14, v20, 0, v21);
      uint64_t v24 = objc_msgSend_criterionWithColumnName_EQUALSColumnValue_(SEMSQLCommandCriterion, v23, 0x2709E0BF0, (uint64_t)v22);

      uint64_t v27 = objc_msgSend_builderWithTableName_(SEMDatabaseDelete, v25, 0x2709E0BB0, v26);
      objc_msgSend_setCommandCriterion_(v27, v28, (uint64_t)v24, v29);
      uint64_t v33 = objc_msgSend_build(v27, v30, v31, v32);

      if (!v33)
      {
        v40 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          database = self->_database;
          *(_DWORD *)buf = 136315650;
          v46 = "-[SEMFTSWriter deleteExternalId:error:]";
          __int16 v47 = 2112;
          v48 = database;
          __int16 v49 = 2112;
          id v50 = v14;
          _os_log_error_impl(&dword_25C7CA000, v40, OS_LOG_TYPE_ERROR, "%s (%@) Failed to build delete with params: {%@}", buf, 0x20u);
        }

        uint64_t v17 = 0;
        id v37 = 0;
        BOOL v38 = 0;
        goto LABEL_16;
      }
      objc_msgSend_setObject_forKey_(self->_commandCache, v34, v33, (uint64_t)&unk_2709EA508);

      uint64_t v17 = (void *)v33;
    }
    v35 = self->_database;
    id v44 = 0;
    char v36 = objc_msgSend_executeCommand_error_(v35, v20, (uint64_t)v17, (uint64_t)&v44);
    id v37 = v44;
    if (v36)
    {
      BOOL v38 = 1;
    }
    else
    {
      v39 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        v42 = self->_database;
        *(_DWORD *)buf = 136315650;
        v46 = "-[SEMFTSWriter deleteExternalId:error:]";
        __int16 v47 = 2112;
        v48 = v42;
        __int16 v49 = 2112;
        id v50 = v37;
        _os_log_error_impl(&dword_25C7CA000, v39, OS_LOG_TYPE_ERROR, "%s (%@) Delete failed: %@", buf, 0x20u);
      }
      BOOL v38 = 0;
      if (a4 && v37)
      {
        id v37 = v37;
        BOOL v38 = 0;
        *a4 = v37;
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  BOOL v38 = 0;
LABEL_17:

  return v38;
}

- (BOOL)deleteExternalIds:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (objc_msgSend__beginTransactionWithError_(self, v7, (uint64_t)a4, v8))
  {
    id v9 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v13 = objc_msgSend_count(v6, v10, v11, v12);
    uint64_t v16 = objc_msgSend_initWithCapacity_(v9, v14, v13, v15);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v17 = v6;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v56, (uint64_t)v66, 16);
    if (v19)
    {
      uint64_t v23 = v19;
      uint64_t v24 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v57 != v24) {
            objc_enumerationMutation(v17);
          }
          uint64_t v26 = objc_msgSend_sem_base64EncodedStringNoPadding(*(void **)(*((void *)&v56 + 1) + 8 * i), v20, v21, v22);
          objc_msgSend_addObject_(v16, v27, (uint64_t)v26, v28);
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v56, (uint64_t)v66, 16);
      }
      while (v23);
    }

    uint64_t v31 = objc_msgSend_objectForKey_(self->_commandCache, v29, (uint64_t)&unk_2709EA520, v30);
    if ((objc_msgSend_updateParameters_(v31, v32, (uint64_t)v16, v33) & 1) == 0)
    {
      v35 = objc_msgSend_criterionWithColumnName_INColumnValues_(SEMSQLCommandCriterion, v34, 0x2709E0BF0, (uint64_t)v16);
      BOOL v38 = objc_msgSend_builderWithTableName_(SEMDatabaseDelete, v36, 0x2709E0BB0, v37);
      objc_msgSend_setCommandCriterion_(v38, v39, (uint64_t)v35, v40);
      uint64_t v44 = objc_msgSend_build(v38, v41, v42, v43);

      if (!v44)
      {
        v51 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          database = self->_database;
          *(_DWORD *)buf = 136315650;
          v61 = "-[SEMFTSWriter deleteExternalIds:error:]";
          __int16 v62 = 2112;
          v63 = database;
          __int16 v64 = 2112;
          id v65 = v16;
          _os_log_error_impl(&dword_25C7CA000, v51, OS_LOG_TYPE_ERROR, "%s (%@) Failed to build delete with params: {%@}", buf, 0x20u);
        }

        uint64_t v31 = 0;
        id v48 = 0;
        BOOL v49 = 0;
        goto LABEL_23;
      }
      objc_msgSend_setObject_forKey_(self->_commandCache, v45, v44, (uint64_t)&unk_2709EA520);

      uint64_t v31 = (void *)v44;
    }
    v46 = self->_database;
    id v55 = 0;
    char v47 = objc_msgSend_executeCommand_error_(v46, v34, (uint64_t)v31, (uint64_t)&v55);
    id v48 = v55;
    if (v47)
    {
      BOOL v49 = 1;
    }
    else
    {
      id v50 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        v53 = self->_database;
        *(_DWORD *)buf = 136315650;
        v61 = "-[SEMFTSWriter deleteExternalIds:error:]";
        __int16 v62 = 2112;
        v63 = v53;
        __int16 v64 = 2112;
        id v65 = v48;
        _os_log_error_impl(&dword_25C7CA000, v50, OS_LOG_TYPE_ERROR, "%s (%@) Delete failed: %@", buf, 0x20u);
      }
      BOOL v49 = 0;
      if (a4 && v48)
      {
        id v48 = v48;
        BOOL v49 = 0;
        *a4 = v48;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  BOOL v49 = 0;
LABEL_24:

  return v49;
}

- (BOOL)insertRecordsFromCascadeItem:(id)a3 originAppId:(id)a4 externalId:(id)a5 error:(id *)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (objc_msgSend__beginTransactionWithError_(self, v13, (uint64_t)a6, v14))
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    char v47 = sub_25C7F4950;
    id v48 = sub_25C7F4960;
    id v49 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 1;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = sub_25C7F4950;
    v38[4] = sub_25C7F4960;
    objc_msgSend_objectForKey_(self->_commandCache, v15, (uint64_t)&unk_2709EA538, v16);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = objc_msgSend_content(v10, v17, v18, v19);
    uint64_t v21 = (id *)(v45 + 5);
    id obj = (id)v45[5];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_25C7F4968;
    v30[3] = &unk_2654DE310;
    v34 = &v40;
    id v31 = v11;
    v35 = v38;
    char v36 = &v44;
    id v32 = v12;
    uint64_t v33 = self;
    char v23 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v20, v22, (uint64_t)&obj, (uint64_t)v30);
    objc_storeStrong(v21, obj);

    if ((v23 & 1) == 0)
    {
      uint64_t v24 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        database = self->_database;
        uint64_t v29 = v45[5];
        *(_DWORD *)buf = 136315906;
        v51 = "-[SEMFTSWriter insertRecordsFromCascadeItem:originAppId:externalId:error:]";
        __int16 v52 = 2112;
        v53 = database;
        __int16 v54 = 2112;
        id v55 = v10;
        __int16 v56 = 2112;
        uint64_t v57 = v29;
        _os_log_error_impl(&dword_25C7CA000, v24, OS_LOG_TYPE_ERROR, "%s (%@) Failed to enumerate fields of item: %@ error: %@", buf, 0x2Au);
      }
      *((unsigned char *)v41 + 24) = 0;
    }

    if (a6)
    {
      __int16 v25 = (void *)v45[5];
      if (v25) {
        *a6 = v25;
      }
    }
    BOOL v26 = *((unsigned char *)v41 + 24) != 0;
    _Block_object_dispose(v38, 8);

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandCache, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end