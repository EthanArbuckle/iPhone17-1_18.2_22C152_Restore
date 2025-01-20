@interface SiriCoreSyncDatabase
+ (id)currentSyncDatabase;
+ (void)removeCurrentSyncDatabase;
- (BOOL)_enumerateKey:(id)a3 updatedAfter:(id)a4 fromTable:(id)a5 usingBlock:(id)a6 error:(id *)a7;
- (BOOL)_executeStatement:(id)a3 error:(id *)a4;
- (BOOL)_insertSyncRec:(id)a3 intoTable:(id)a4 error:(id *)a5;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)debugMode;
- (BOOL)donate:(id)a3 error:(id *)a4;
- (BOOL)enumerateItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateRemovalsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateSentItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)inTransaction;
- (BOOL)markAsSent:(id)a3 error:(id *)a4;
- (BOOL)openWithError:(id *)a3;
- (BOOL)prepare;
- (BOOL)remove:(id)a3 error:(id *)a4;
- (BOOL)removeAllItemsOfKey:(id)a3 error:(id *)a4;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (BOOL)succeedOrRollbackOnFail:(id)a3 error:(id *)a4 whileExecuting:(id)a5;
- (SiriCoreSyncDatabase)initWithPath:(id)a3;
- (int)_countKey:(id)a3 fromTable:(id)a4 updatedAfter:(id)a5 error:(id *)a6;
- (int)countItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5;
- (int)countRemovalsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5;
- (int)countSentItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5;
- (void)setDebugMode:(BOOL)a3;
- (void)setInTransaction:(BOOL)a3;
@end

@implementation SiriCoreSyncDatabase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void)setInTransaction:(BOOL)a3
{
  self->_inTransaction = a3;
}

- (BOOL)inTransaction
{
  return self->_inTransaction;
}

- (BOOL)_enumerateKey:(id)a3 updatedAfter:(id)a4 fromTable:(id)a5 usingBlock:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = NSString;
  [v13 timeIntervalSince1970];
  objc_msgSend(v16, "stringWithFormat:", @"SELECT * FROM %@ WHERE update_time > %.0f AND sourcekey = \"%@\";",
    v14,
    v17,
  v18 = v12);
  v19 = [[SiriCoreSQLiteQuery alloc] initWithString:v18 statement:0 parameters:0 recordBuilder:0 options:16];
  if (a7) {
    *a7 = 0;
  }
  v20 = [(SiriCoreSQLiteDatabase *)self->_db executeQuery:v19];
  v21 = [v20 error];
  v22 = v21;
  if (a7 && v21) {
    *a7 = v21;
  }
  BOOL v23 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__3941;
  v32[4] = __Block_byref_object_dispose__3942;
  id v33 = 0;
  if (!v22)
  {
    v24 = [v20 rowValueTuples];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __78__SiriCoreSyncDatabase__enumerateKey_updatedAfter_fromTable_usingBlock_error___block_invoke;
    v26[3] = &unk_26443B138;
    id v27 = v14;
    id v28 = v12;
    v30 = &v34;
    id v29 = v15;
    v31 = v32;
    [v24 enumerateObjectsUsingBlock:v26];

    BOOL v23 = *((unsigned char *)v35 + 24) != 0;
  }
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

void __78__SiriCoreSyncDatabase__enumerateKey_updatedAfter_fromTable_usingBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:@"sync_items"])
  {
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v34 = [v6 objectAtIndexedSubscript:2];
    uint64_t v7 = objc_msgSend(v34, "siriCoreSQLiteValue_toString");
    v32 = [v6 objectAtIndexedSubscript:1];
    v31 = objc_msgSend(v32, "siriCoreSQLiteValue_toNumber");
    unsigned int v27 = [v31 intValue];
    id v29 = [v6 objectAtIndexedSubscript:3];
    uint64_t v8 = objc_msgSend(v29, "siriCoreSQLiteValue_toString");
    id v28 = [v6 objectAtIndexedSubscript:7];
    v9 = objc_msgSend(v28, "siriCoreSQLiteValue_toData");
    v10 = [v6 objectAtIndexedSubscript:8];
    objc_msgSend(v10, "siriCoreSQLiteValue_toData");
    v11 = id v33 = a4;
    id v12 = [v6 objectAtIndexedSubscript:6];
    id v13 = objc_msgSend(v12, "siriCoreSQLiteValue_toData");
    id v14 = (void *)v7;
    uint64_t v15 = v7;
    v16 = (void *)v8;
    uint64_t v17 = +[SiriCoreSyncRecord syncRecordWithKey:v30 identifier:v15 priority:v27 debugValue:v8 dataValue:v9 addedValue:v11 appMeta:v13];

    a4 = v33;
    v18 = [v6 objectAtIndexedSubscript:4];
    v19 = objc_msgSend(v18, "siriCoreSQLiteValue_toNumber");
    objc_msgSend(v17, "setUpdateTime:", (double)objc_msgSend(v19, "longValue"));

    v20 = [v6 objectAtIndexedSubscript:5];
    v21 = objc_msgSend(v20, "siriCoreSQLiteValue_toData");
    [v17 setCheckHash:v21];
  }
  else
  {
    if (![*(id *)(a1 + 32) isEqualToString:@"removed_items"])
    {
      uint64_t v17 = 0;
      goto LABEL_7;
    }
    uint64_t v22 = *(void *)(a1 + 40);
    BOOL v23 = [v6 objectAtIndexedSubscript:1];
    v24 = objc_msgSend(v23, "siriCoreSQLiteValue_toString");
    uint64_t v17 = +[SiriCoreSyncRecord syncRecordWithKey:v22 identifier:v24];

    v20 = [v6 objectAtIndexedSubscript:2];
    v21 = objc_msgSend(v20, "siriCoreSQLiteValue_toNumber");
    objc_msgSend(v17, "setUpdateTime:", (double)objc_msgSend(v21, "longValue"));
  }

LABEL_7:
  uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v25 + 40);
  char v26 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_storeStrong((id *)(v25 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v26 ^ 1;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

- (BOOL)enumerateSentItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  return [(SiriCoreSyncDatabase *)self _enumerateKey:a3 updatedAfter:a4 fromTable:@"sent_items" usingBlock:a6 error:a5];
}

- (BOOL)enumerateRemovalsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  return [(SiriCoreSyncDatabase *)self _enumerateKey:a3 updatedAfter:a4 fromTable:@"removed_items" usingBlock:a6 error:a5];
}

- (BOOL)enumerateItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  return [(SiriCoreSyncDatabase *)self _enumerateKey:a3 updatedAfter:a4 fromTable:@"sync_items" usingBlock:a6 error:a5];
}

- (int)_countKey:(id)a3 fromTable:(id)a4 updatedAfter:(id)a5 error:(id *)a6
{
  v10 = NSString;
  id v11 = a4;
  id v12 = a3;
  [a5 timeIntervalSince1970];
  objc_msgSend(v10, "stringWithFormat:", @"SELECT COUNT() FROM %@ WHERE update_time > %.0f AND sourcekey = \"%@\";",
    v11,
    v13,
  id v14 = v12);

  uint64_t v15 = [[SiriCoreSQLiteQuery alloc] initWithString:v14 statement:0 parameters:0 recordBuilder:0 options:16];
  if (a6) {
    *a6 = 0;
  }
  v16 = [(SiriCoreSQLiteDatabase *)self->_db executeQuery:v15];
  uint64_t v17 = [v16 error];
  v18 = v17;
  if (a6 && v17)
  {
    *a6 = v17;
  }
  else if (!v17)
  {
    v20 = [v16 rowValueTuples];
    v21 = [v20 objectAtIndexedSubscript:0];
    uint64_t v22 = [v21 objectAtIndexedSubscript:0];
    BOOL v23 = objc_msgSend(v22, "siriCoreSQLiteValue_toNumber");
    int v19 = [v23 intValue];

    goto LABEL_9;
  }
  int v19 = -1;
LABEL_9:

  return v19;
}

- (int)countSentItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5
{
  return [(SiriCoreSyncDatabase *)self _countKey:a3 fromTable:@"sent_items" updatedAfter:a4 error:a5];
}

- (int)countItemsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5
{
  return [(SiriCoreSyncDatabase *)self _countKey:a3 fromTable:@"sync_items" updatedAfter:a4 error:a5];
}

- (int)countRemovalsOfKey:(id)a3 updatedAfter:(id)a4 error:(id *)a5
{
  return [(SiriCoreSyncDatabase *)self _countKey:a3 fromTable:@"removed_items" updatedAfter:a4 error:a5];
}

- (BOOL)_insertSyncRec:(id)a3 intoTable:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:8];
  id v11 = [v8 key];
  [v10 setValue:v11 forKey:@"sourcekey"];

  id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "itemPriority"));
  [v10 setValue:v12 forKey:@"priority"];

  uint64_t v13 = [v8 identifier];
  [v10 setValue:v13 forKey:@"uniqueid"];

  id v14 = [v8 dataValue];
  [v10 setValue:v14 forKey:@"sync_value"];

  uint64_t v15 = [v8 addedValue];
  [v10 setValue:v15 forKey:@"added_value"];

  v16 = [v8 metaValue];
  [v10 setValue:v16 forKey:@"app_meta"];

  uint64_t v17 = [v8 debugValue];
  [v10 setValue:v17 forKey:@"debug"];

  v18 = NSNumber;
  [v8 updateTime];
  v20 = [v18 numberWithInt:(int)v19];
  [v10 setValue:v20 forKey:@"update_time"];

  unint64_t v26 = 0;
  v21 = [v8 checkHash];
  [v21 getBytes:&v26 length:8];

  uint64_t v22 = [NSNumber numberWithDouble:(double)v26];
  [v10 setValue:v22 forKey:@"v_hash"];

  BOOL v23 = [(SiriCoreSQLiteDatabase *)self->_db insertIntoTableWithName:v9 valueMap:v10 error:a5];
  if (!v23)
  {
    v24 = *MEMORY[0x263F283A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v28 = "-[SiriCoreSyncDatabase _insertSyncRec:intoTable:error:]";
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_21CBF7000, v24, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not insert tble: %@ record: %@", buf, 0x20u);
    }
  }

  return v23;
}

- (BOOL)markAsSent:(id)a3 error:(id *)a4
{
  return [(SiriCoreSyncDatabase *)self _insertSyncRec:a3 intoTable:@"sent_items" error:a4];
}

- (BOOL)removeAllItemsOfKey:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_msgSend(NSString, "stringWithFormat:", @"INSERT INTO removed_items SELECT sourcekey, uniqueid, update_time FROM sync_items WHERE sourcekey = \"%@\";",
  uint64_t v7 = v6);
  if ([(SiriCoreSyncDatabase *)self _executeStatement:v7 error:a4])
  {
    id v8 = [NSString stringWithFormat:@"DELETE FROM sync_items WHERE sourcekey = \"%@\"", v6];
    BOOL v9 = [(SiriCoreSyncDatabase *)self _executeStatement:v8 error:a4];
    if (!v9)
    {
      v10 = *MEMORY[0x263F283A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A0], OS_LOG_TYPE_DEFAULT))
      {
        path = self->_path;
        *(_DWORD *)buf = 136315650;
        v16 = "-[SiriCoreSyncDatabase removeAllItemsOfKey:error:]";
        __int16 v17 = 2112;
        id v18 = v6;
        __int16 v19 = 2112;
        v20 = path;
        _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not remove all items from key %@ in db %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v12 = *MEMORY[0x263F283A0];
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_path;
      *(_DWORD *)buf = 136315650;
      v16 = "-[SiriCoreSyncDatabase removeAllItemsOfKey:error:]";
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not tombstone all items from key %@ in db %@", buf, 0x20u);
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)remove:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
  id v8 = [v6 key];
  [v7 setValue:v8 forKey:@"sourcekey"];

  BOOL v9 = [v6 identifier];
  [v7 setValue:v9 forKey:@"uniqueid"];

  v10 = NSNumber;
  id v11 = objc_opt_new();
  [v11 timeIntervalSince1970];
  uint64_t v13 = [v10 numberWithInt:(int)v12];
  [v7 setValue:v13 forKey:@"update_time"];

  BOOL v14 = [(SiriCoreSQLiteDatabase *)self->_db insertIntoTableWithName:@"removed_items" valueMap:v7 error:a4];
  uint64_t v15 = (os_log_t *)MEMORY[0x263F283A0];
  if (!v14)
  {
    v16 = *MEMORY[0x263F283A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v30 = "-[SiriCoreSyncDatabase remove:error:]";
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_21CBF7000, v16, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not add deletion record %@", buf, 0x16u);
    }
  }
  __int16 v17 = NSString;
  id v18 = [v6 key];
  __int16 v19 = [v6 identifier];
  objc_msgSend(v17, "stringWithFormat:", @"DELETE FROM sync_items WHERE sourcekey = \"%@\" AND uniqueid = \"%@\";",
    v18,
  v20 = v19);

  uint64_t v21 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v30 = "-[SiriCoreSyncDatabase remove:error:]";
    __int16 v31 = 2112;
    id v32 = v20;
    _os_log_impl(&dword_21CBF7000, v21, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync delete cmd %@", buf, 0x16u);
  }
  BOOL v22 = [(SiriCoreSyncDatabase *)self _executeStatement:v20 error:a4];
  if (!v22)
  {
    os_log_t v23 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      uint64_t v25 = [v6 key];
      unint64_t v26 = [v6 identifier];
      path = self->_path;
      *(_DWORD *)buf = 136315906;
      id v30 = "-[SiriCoreSyncDatabase remove:error:]";
      __int16 v31 = 2112;
      id v32 = v25;
      __int16 v33 = 2112;
      uint64_t v34 = v26;
      __int16 v35 = 2112;
      uint64_t v36 = path;
      _os_log_impl(&dword_21CBF7000, v24, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not delete (%@, %@) of  in db %@", buf, 0x2Au);
    }
  }

  return v22;
}

- (BOOL)donate:(id)a3 error:(id *)a4
{
  return [(SiriCoreSyncDatabase *)self _insertSyncRec:a3 intoTable:@"sync_items" error:a4];
}

- (BOOL)succeedOrRollbackOnFail:(id)a3 error:(id *)a4 whileExecuting:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = (uint64_t (**)(id, id *))a5;
  if ([(SiriCoreSyncDatabase *)self beginTransactionWithError:a4])
  {
    if (v9 && (v9[2](v9, a4) & 1) != 0)
    {
      char v10 = 1;
      if ([(SiriCoreSyncDatabase *)self commitTransactionWithError:a4])
      {
        char v11 = 1;
LABEL_20:
        char v13 = v10 & v11;
        goto LABEL_21;
      }
      BOOL v14 = 0;
    }
    else
    {
      BOOL v14 = [(SiriCoreSyncDatabase *)self rollbackTransactionWithError:a4];
      char v10 = 0;
    }
    uint64_t v15 = (os_log_t *)MEMORY[0x263F28350];
    v16 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315394;
      uint64_t v21 = "-[SiriCoreSyncDatabase succeedOrRollbackOnFail:error:whileExecuting:]";
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_error_impl(&dword_21CBF7000, v16, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync Failed to commit succeedOrRollBack %@", (uint8_t *)&v20, 0x16u);
      if (v10) {
        goto LABEL_12;
      }
    }
    else if (v10)
    {
LABEL_12:
      char v11 = 0;
      char v10 = 1;
      goto LABEL_20;
    }
    __int16 v17 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315394;
      uint64_t v21 = "-[SiriCoreSyncDatabase succeedOrRollbackOnFail:error:whileExecuting:]";
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_error_impl(&dword_21CBF7000, v17, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync Failed to complete succeedOrRollBack block %@", (uint8_t *)&v20, 0x16u);
      if (!v14)
      {
LABEL_17:
        id v18 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136315394;
          uint64_t v21 = "-[SiriCoreSyncDatabase succeedOrRollbackOnFail:error:whileExecuting:]";
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_error_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync ...and failed to rollback %@. DB is in trouble.", (uint8_t *)&v20, 0x16u);
        }
      }
    }
    else if (!v14)
    {
      goto LABEL_17;
    }
    char v10 = 0;
    char v11 = 0;
    goto LABEL_20;
  }
  double v12 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
  {
    int v20 = 136315394;
    uint64_t v21 = "-[SiriCoreSyncDatabase succeedOrRollbackOnFail:error:whileExecuting:]";
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_error_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync Failed to begin transaction for succeedOrRollBack %@", (uint8_t *)&v20, 0x16u);
  }
  char v13 = 0;
LABEL_21:

  return v13;
}

- (BOOL)_executeStatement:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(SiriCoreSQLiteDatabase *)self->_db executeQueryString:v6 error:a4];
  if (!v7)
  {
    id v8 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      id v11 = *a4;
      int v12 = 136315906;
      char v13 = "-[SiriCoreSyncDatabase _executeStatement:error:]";
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = path;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_error_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_ERROR, "%s SiriCoreDbSync Could not execute %@ in database file at %@, err=%@", (uint8_t *)&v12, 0x2Au);
    }
  }

  return v7;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    BOOL result = [(SiriCoreSQLiteDatabase *)self->_db rollbackTransactionWithError:a3];
    self->_inTransaction = !result;
  }
  else
  {
    if (a3)
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = *MEMORY[0x263F07F80];
      v9[0] = @"attempted to finalize transaction when none are in active";
      BOOL v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
      *a3 = [v6 errorWithDomain:@"com.apple.assistant.syncdb" code:101 userInfo:v7];
    }
    return 0;
  }
  return result;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    BOOL result = [(SiriCoreSQLiteDatabase *)self->_db commitTransactionWithError:a3];
    self->_inTransaction = !result;
  }
  else
  {
    if (a3)
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = *MEMORY[0x263F07F80];
      v9[0] = @"attempted to finalize transaction when none are in active";
      BOOL v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
      *a3 = [v6 errorWithDomain:@"com.apple.assistant.syncdb" code:101 userInfo:v7];
    }
    return 0;
  }
  return result;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (self->_inTransaction)
  {
    if (a3)
    {
      v4 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = *MEMORY[0x263F07F80];
      v9[0] = @"attempted to begin transaction when one is already active";
      v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
      *a3 = [v4 errorWithDomain:@"com.apple.assistant.syncdb" code:100 userInfo:v5];
    }
    return 0;
  }
  else
  {
    BOOL result = [(SiriCoreSQLiteDatabase *)self->_db beginTransactionWithError:a3];
    self->_inTransaction = result;
  }
  return result;
}

- (BOOL)closeWithError:(id *)a3
{
  return [(SiriCoreSQLiteDatabase *)self->_db closeWithError:a3];
}

- (BOOL)openWithError:(id *)a3
{
  return [(SiriCoreSQLiteDatabase *)self->_db openWithError:a3];
}

- (BOOL)prepare
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v42 = 0;
  BOOL v3 = [(SiriCoreSyncDatabase *)self openWithError:&v42];
  id v4 = v42;
  id v5 = v4;
  if (!v3) {
    goto LABEL_24;
  }
  id v41 = v4;
  BOOL v3 = [(SiriCoreSyncDatabase *)self beginTransactionWithError:&v41];
  id v6 = v41;

  if (!v3)
  {
    id v5 = v6;
    goto LABEL_24;
  }
  BOOL v7 = *MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[SiriCoreSyncDatabase prepare]";
    _os_log_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Prepping Sync DB", buf, 0xCu);
  }
  id v40 = v6;
  BOOL v8 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", @"CREATE TABLE IF NOT EXISTS \"db_metadata\"(\"metadatakey\" varchar NOT NULL, \"value\" varchar);",
         &v40);
  id v9 = v40;

  char v10 = (os_log_t *)MEMORY[0x263F283A0];
  if (!v8) {
    goto LABEL_16;
  }
  id v39 = v9;
  BOOL v11 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", @"CREATE TABLE IF NOT EXISTS \"sync_items\" (\"sourcekey\" varchar NOT NULL, \"priority\" integer, \"uniqueid\" varchar NOT NULL, \"debug\" varchar, \"update_time\" integer, \"v_hash\" integer, \"app_meta\" blob, \"sync_value\" blob, \"added_value\" blob, PRIMARY KEY(\"sourcekey\", \"uniqueid\"));",
          &v39);
  id v12 = v39;

  if (!v11) {
    goto LABEL_15;
  }
  id v38 = v12;
  BOOL v13 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", @"CREATE TABLE IF NOT EXISTS \"removed_items\"(\"sourcekey\" varchar NOT NULL, \"uniqueid\" varchar NOT NULL, \"update_time\" integer, PRIMARY KEY(\"sourcekey\", \"uniqueid\"));",
          &v38);
  id v9 = v38;

  if (!v13) {
    goto LABEL_16;
  }
  id v37 = v9;
  BOOL v14 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", @"CREATE INDEX IF NOT EXISTS dk ON \"sync_items\" (\"sourcekey\",\"uniqueid\");",
          &v37);
  id v12 = v37;

  if (!v14) {
    goto LABEL_15;
  }
  id v36 = v12;
  BOOL v15 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", @"CREATE INDEX IF NOT EXISTS du ON \"sync_items\" (\"update_time\");",
          &v36);
  id v9 = v36;

  if (!v15) {
    goto LABEL_16;
  }
  id v35 = v9;
  BOOL v16 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", @"CREATE INDEX IF NOT EXISTS rk ON \"removed_items\" (\"sourcekey\",\"uniqueid\");",
          &v35);
  id v12 = v35;

  if (!v16)
  {
LABEL_15:
    id v9 = v12;
    goto LABEL_16;
  }
  id v34 = v12;
  BOOL v17 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", @"CREATE TABLE IF NOT EXISTS \"sync_anchors\"(\"sourcekey\" varchar NOT NULL, \"anchor\" integer, \"update_time\" integer, PRIMARY KEY(\"sourcekey\", \"anchor\"));",
          &v34);
  id v9 = v34;

  if (!v17
    || (id v33 = v9,
        BOOL v18 = -[SiriCoreSyncDatabase _executeStatement:error:](self, "_executeStatement:error:", @"CREATE TABLE IF NOT EXISTS \"sent_items\" (\"sourcekey\" varchar NOT NULL, \"priority\" integer, \"uniqueid\" varchar NOT NULL, \"debug\" varchar, \"update_time\" integer, \"v_hash\" integer, \"app_meta\" blob, \"sync_value\" blob, \"added_value\" blob);",
                &v33),
        id v19 = v33,
        v9,
        id v9 = v19,
        !v18))
  {
LABEL_16:
    uint64_t v20 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[SiriCoreSyncDatabase prepare]";
      _os_log_impl(&dword_21CBF7000, v20, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not initialize db schema", buf, 0xCu);
    }
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:8];
  [v21 setValue:@"version" forKey:@"metadatakey"];
  [v21 setValue:@"0.1" forKey:@"value"];
  db = self->_db;
  id v32 = v9;
  BOOL v23 = [(SiriCoreSQLiteDatabase *)db insertIntoTableWithName:@"db_metadata" valueMap:v21 error:&v32];
  id v24 = v32;

  if (v23)
  {
    id v31 = v24;
    uint64_t v25 = &v31;
    LOBYTE(v3) = [(SiriCoreSyncDatabase *)self commitTransactionWithError:&v31];
  }
  else
  {
    unint64_t v26 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[SiriCoreSyncDatabase prepare]";
      _os_log_impl(&dword_21CBF7000, v26, OS_LOG_TYPE_DEFAULT, "%s SiriCoreDbSync Could not initialize db version info", buf, 0xCu);
    }
    id v30 = v24;
    uint64_t v25 = &v30;
    [(SiriCoreSyncDatabase *)self rollbackTransactionWithError:&v30];
    LOBYTE(v3) = 0;
  }
  id v5 = *v25;

LABEL_24:
  id v29 = v5;
  [(SiriCoreSyncDatabase *)self closeWithError:&v29];
  id v27 = v29;

  return v3;
}

- (SiriCoreSyncDatabase)initWithPath:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriCoreSyncDatabase;
  id v6 = [(SiriCoreSyncDatabase *)&v12 init];
  BOOL v7 = v6;
  if (v6)
  {
    v6->_inTransaction = 0;
    objc_storeStrong((id *)&v6->_path, a3);
    BOOL v8 = [[SiriCoreSQLiteDatabase alloc] initWithPath:v7->_path dataProtectionClass:2 options:1];
    db = v7->_db;
    v7->_db = v8;

    char v10 = v7;
  }

  return v7;
}

+ (void)removeCurrentSyncDatabase
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = NSURL;
  BOOL v3 = _SiriCoreSharedResourcesDirectory();
  id v4 = [v2 fileURLWithPath:v3];

  id v5 = [v4 URLByAppendingPathComponent:@"SiriSyncItems.db"];

  id v6 = [MEMORY[0x263F08850] defaultManager];
  BOOL v7 = (os_log_t *)MEMORY[0x263F28350];
  BOOL v8 = (void *)*MEMORY[0x263F28350];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    char v10 = [v5 path];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "+[SiriCoreSyncDatabase removeCurrentSyncDatabase]";
    __int16 v22 = 2112;
    BOOL v23 = v10;
    _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_DEFAULT, "%s removing Sync DB at %@", buf, 0x16u);
  }
  BOOL v11 = [v5 path];
  id v19 = 0;
  int v12 = [v6 removeItemAtPath:v11 error:&v19];
  id v13 = v19;

  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (!v14)
  {
    os_log_t v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = v15;
      BOOL v18 = [v5 path];
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = "+[SiriCoreSyncDatabase removeCurrentSyncDatabase]";
      __int16 v22 = 2112;
      BOOL v23 = v18;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_error_impl(&dword_21CBF7000, v17, OS_LOG_TYPE_ERROR, "%s failedremoving Sync DB at %@ err: %@", buf, 0x20u);
    }
  }
  BOOL v16 = (void *)_currentSyncDB;
  _currentSyncDB = 0;
}

+ (id)currentSyncDatabase
{
  v2 = (void *)_currentSyncDB;
  if (!_currentSyncDB)
  {
    BOOL v3 = NSURL;
    id v4 = _SiriCoreSharedResourcesDirectory();
    id v5 = [v3 fileURLWithPath:v4];

    id v6 = [v5 URLByAppendingPathComponent:@"SiriSyncItems.db"];

    BOOL v7 = [MEMORY[0x263F08850] defaultManager];
    BOOL v8 = [v6 path];
    char v9 = [v7 fileExistsAtPath:v8];

    char v10 = [SiriCoreSyncDatabase alloc];
    BOOL v11 = [v6 path];
    uint64_t v12 = [(SiriCoreSyncDatabase *)v10 initWithPath:v11];
    id v13 = (void *)_currentSyncDB;
    _currentSyncDB = v12;

    if ((v9 & 1) == 0) {
      [(id)_currentSyncDB prepare];
    }

    v2 = (void *)_currentSyncDB;
  }

  return v2;
}

@end