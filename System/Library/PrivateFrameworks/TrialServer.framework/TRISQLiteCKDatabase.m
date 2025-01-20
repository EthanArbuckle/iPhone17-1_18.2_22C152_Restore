@interface TRISQLiteCKDatabase
+ (id)mockContainerWithIdentifier:(id)a3 database:(id)a4;
- (BOOL)_evalQueryOperationWithRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 offset:(unint64_t)a6 resultsLimit:(unint64_t)a7 desiredKeys:(id)a8 txn:(id)a9 error:(id *)a10 recordMatchedBlock:(id)a11;
- (BOOL)_parseArrayExpression:(id)a3 forRecordType:(id)a4 usingCTEName:(id)a5 toSQLCommonTableExpression:(id *)a6 paramBindings:(id *)a7 error:(id *)a8;
- (BOOL)_parseDecimalString:(id)a3 value:(unint64_t *)a4;
- (BOOL)_parseDesiredKeys:(id)a3 recordType:(id)a4 unindexedFields:(id *)a5 indexedFields:(id *)a6 error:(id *)a7;
- (BOOL)_parseScalarExpression:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_replaceArrayFieldWithKey:(id)a3 recordType:(id)a4 recordId:(id)a5 values:(id)a6 txn:(id)a7 error:(id *)a8;
- (BOOL)_translateAnyModifiedArrayRHSComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_translateAnyModifiedScalarComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_translateArrayRHSComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_translateComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_translateCompoundPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_translateDirectModifiedArrayRHSComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_translateDirectModifiedScalarComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_translatePredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_translateScalarComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7;
- (BOOL)_upsertRecord:(id)a3 txn:(id)a4 error:(id *)a5;
- (BOOL)migrateToVersion:(unsigned int)a3;
- (CKContainer)container;
- (OS_dispatch_queue)operationQueue;
- (TRISQLiteCKDatabase)initWithParentDir:(id)a3 assetCacheDir:(id)a4;
- (TRISQLiteCKDatabaseDelegate)delegate;
- (id)_allRecordTypes;
- (id)_assetForLocallyStoredAssetWithFilename:(id)a3 forRecordId:(id)a4 error:(id *)a5;
- (id)_createRecordFromSelectRow:(id)a3 recordType:(id)a4 unindexedDesiredKeys:(id)a5 indexedDesiredKeys:(id)a6 txn:(id)a7 error:(id *)a8;
- (id)_createTableForArrayFieldWithKey:(id)a3 attachedToRecordType:(id)a4 sqliteContainedType:(id)a5;
- (id)_createTableForRecordType:(id)a3 scalarFields:(id)a4;
- (id)_errorWithCode:(int64_t)a3 message:(id)a4;
- (id)_evalFetchRecordsOperationWithRecordIds:(id)a3 recordType:(id)a4 desiredKeys:(id)a5 txn:(id)a6 error:(id *)a7;
- (id)_filenameForLocallyCopiedAsset:(id)a3 forRecordId:(id)a4 error:(id *)a5;
- (id)_keysForFieldsOfRecordType:(id)a3;
- (id)_loadArrayForRecordType:(id)a3 recordId:(id)a4 fieldKey:(id)a5 indexRange:(_NSRange)a6 txn:(id)a7 error:(id *)a8;
- (id)_parseIndexedFieldKey:(id)a3 indexRange:(_NSRange *)a4;
- (id)_valueTypesForFieldsOfRecordType:(id)a3;
- (id)databaseHandle;
- (id)migrations;
- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3;
- (void)_bindParam:(int)a3 toScalarValue:(id)a4 forStatement:(id)a5 recordId:(id)a6;
- (void)_deleteRecordsWithRecordIds:(id)a3 recordType:(id)a4 txn:(id)a5;
- (void)_processFetchRecordsOperation:(id)a3;
- (void)_processModifyRecordsOperation:(id)a3;
- (void)_processQueryOperation:(id)a3;
- (void)addOperation:(id)a3;
- (void)closePermanently;
- (void)deleteRecordZoneWithID:(id)a3 completionHandler:(id)a4;
- (void)saveRecordZone:(id)a3 completionHandler:(id)a4;
- (void)setContainer:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TRISQLiteCKDatabase

- (TRISQLiteCKDatabase)initWithParentDir:(id)a3 assetCacheDir:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 102, @"Invalid parameter not satisfying: %@", @"parentDir" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 103, @"Invalid parameter not satisfying: %@", @"assetCacheDir" object file lineNumber description];

LABEL_3:
  v41.receiver = self;
  v41.super_class = (Class)TRISQLiteCKDatabase;
  v11 = [(TRISQLiteCKDatabase *)&v41 init];
  v12 = v11;
  if (v11)
  {
    p_parentDir = (id *)&v11->_parentDir;
    objc_storeStrong((id *)&v11->_parentDir, a3);
    objc_storeStrong((id *)&v12->_assetCacheDir, a4);
    uint64_t v14 = [*p_parentDir stringByAppendingPathComponent:@"assets"];
    assetDir = v12->_assetDir;
    v12->_assetDir = (NSString *)v14;

    if ([MEMORY[0x1E4F93B10] isClassCLocked])
    {
      v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Device has never been unlocked prior to db initialization.", (uint8_t *)&buf, 2u);
      }

      goto LABEL_31;
    }
    v17 = [*p_parentDir stringByAppendingPathComponent:@"TRISQLiteCKDatabase.db"];
    v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v19 = [v18 fileExistsAtPath:v17];

    if ((v19 & 1) == 0)
    {
      v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v20 createDirectoryAtPath:*p_parentDir withIntermediateDirectories:1 attributes:0 error:0];
    }
    v21 = (void *)MEMORY[0x1E4F93BA0];
    v22 = objc_opt_new();
    id v40 = 0;
    uint64_t v23 = [v21 sqliteDatabaseWithFilename:v17 contentProtection:3 errorHandler:v22 error:&v40];
    id v24 = v40;
    db = v12->_db;
    v12->_db = (_PASSqliteDatabase *)v23;

    v26 = v12->_db;
    if (v26)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__1;
      v47 = __Block_byref_object_dispose__1;
      id v48 = 0;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __55__TRISQLiteCKDatabase_initWithParentDir_assetCacheDir___block_invoke;
      v39[3] = &unk_1E6BB8280;
      v39[4] = &buf;
      if ([(_PASSqliteDatabase *)v26 prepAndRunNonDataQueries:&unk_1F347B240 onError:v39])
      {
        _Block_object_dispose(&buf, 8);

        if ((v19 & 1) == 0)
        {
          v27 = TRILogCategory_Server();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v17;
            _os_log_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEFAULT, "Created new database: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        if ([(TRISQLiteCKDatabase *)v12 migrateToVersion:*MEMORY[0x1E4F93C18]])
        {
          uint64_t v28 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.Trial.TRISQLiteCKDatabase.operation" qosClass:17];
          opQueue = v12->_opQueue;
          v12->_opQueue = (OS_dispatch_queue *)v28;

          goto LABEL_18;
        }
        v34 = TRILogCategory_Server();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "TRISQLiteCKDatabase: migrations failed", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        v32 = TRILogCategory_Server();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = *(void *)(*((void *)&buf + 1) + 40);
          *(_DWORD *)v42 = 138543362;
          uint64_t v43 = v36;
          _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Failed to run initial database pragmas: %{public}@", v42, 0xCu);
        }

        [(_PASSqliteDatabase *)v12->_db closePermanently];
        v33 = v12->_db;
        v12->_db = 0;

        if ((v19 & 1) == 0) {
          [MEMORY[0x1E4F93BA0] truncateDatabaseAtPath:v17];
        }
        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      v31 = TRILogCategory_Server();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
LABEL_31:
    v30 = 0;
    goto LABEL_32;
  }
LABEL_18:
  v30 = v12;
LABEL_32:

  return v30;
}

uint64_t __55__TRISQLiteCKDatabase_initWithParentDir_assetCacheDir___block_invoke(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C10];
}

- (OS_dispatch_queue)operationQueue
{
  return self->_opQueue;
}

- (void)addOperation:(id)a3
{
  id v5 = a3;
  v6 = [(TRISQLiteCKDatabase *)self container];
  v7 = [v5 configuration];
  [v7 setContainer:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    opQueue = self->_opQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__TRISQLiteCKDatabase_addOperation___block_invoke;
    block[3] = &unk_1E6BB82A8;
    block[4] = self;
    id v23 = v8;
    dispatch_async(opQueue, block);
    v10 = v23;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v5;
      v12 = self->_opQueue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __36__TRISQLiteCKDatabase_addOperation___block_invoke_2;
      v20[3] = &unk_1E6BB82A8;
      v20[4] = self;
      id v21 = v11;
      dispatch_async(v12, v20);
      v10 = v21;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        [v15 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 202, @"Operation of class %@ is not supported.", v17 object file lineNumber description];

        goto LABEL_8;
      }
      id v13 = v5;
      uint64_t v14 = self->_opQueue;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __36__TRISQLiteCKDatabase_addOperation___block_invoke_3;
      v18[3] = &unk_1E6BB82A8;
      v18[4] = self;
      id v19 = v13;
      dispatch_async(v14, v18);
      v10 = v19;
    }
  }

LABEL_8:
}

uint64_t __36__TRISQLiteCKDatabase_addOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processQueryOperation:*(void *)(a1 + 40)];
}

uint64_t __36__TRISQLiteCKDatabase_addOperation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processFetchRecordsOperation:*(void *)(a1 + 40)];
}

uint64_t __36__TRISQLiteCKDatabase_addOperation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processModifyRecordsOperation:*(void *)(a1 + 40)];
}

- (void)saveRecordZone:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  opQueue = self->_opQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__TRISQLiteCKDatabase_saveRecordZone_completionHandler___block_invoke;
  v11[3] = &unk_1E6BB82D0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(opQueue, v11);
}

uint64_t __56__TRISQLiteCKDatabase_saveRecordZone_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)deleteRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  opQueue = self->_opQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__TRISQLiteCKDatabase_deleteRecordZoneWithID_completionHandler___block_invoke;
  v11[3] = &unk_1E6BB82D0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(opQueue, v11);
}

uint64_t __64__TRISQLiteCKDatabase_deleteRecordZoneWithID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)closePermanently
{
  opQueue = self->_opQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__TRISQLiteCKDatabase_closePermanently__block_invoke;
  block[3] = &unk_1E6BB82F8;
  block[4] = self;
  dispatch_sync(opQueue, block);
}

void __39__TRISQLiteCKDatabase_closePermanently__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) closePermanently];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

+ (id)mockContainerWithIdentifier:(id)a3 database:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TRISQLiteCKContainer alloc] initWithContainerIdentifier:v6 database:v5];

  return v7;
}

- (void)_processQueryOperation:(id)a3
{
  id v5 = a3;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  id v51 = 0;
  id v6 = [v5 query];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [v5 cursor];
    id v8 = [v9 query];
  }
  id v10 = [v5 cursor];
  uint64_t v11 = [v10 offset];

  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = v11;
  if (!v8)
  {
    uint64_t v21 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:@"Query operation must specify a query."];
    v20 = (void *)v47[5];
    v47[5] = v21;
    goto LABEL_9;
  }
  id v12 = [(TRISQLiteCKDatabase *)self delegate];
  if (!v12
    || ([(TRISQLiteCKDatabase *)self delegate],
        id v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 shouldProcessQueryOperation:v5 error:v47 + 5],
        v13,
        v12,
        (v14 & 1) != 0))
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __46__TRISQLiteCKDatabase__processQueryOperation___block_invoke;
    v39[3] = &unk_1E6BB8320;
    objc_super v41 = &v42;
    id v15 = v5;
    id v40 = v15;
    v16 = (void *)MEMORY[0x1E016EA80](v39);
    v17 = (void *)MEMORY[0x1E4F93BB0];
    db = self->_db;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __46__TRISQLiteCKDatabase__processQueryOperation___block_invoke_2;
    v31[3] = &unk_1E6BB8348;
    id v32 = v8;
    v33 = self;
    SEL v37 = a2;
    uint64_t v38 = v11;
    id v34 = v15;
    uint64_t v36 = &v46;
    id v19 = v16;
    id v35 = v19;
    [v17 readTransactionWithHandle:db failableBlock:v31];

    v20 = v40;
LABEL_9:

    goto LABEL_10;
  }
  if (!v47[5])
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 249, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
    goto LABEL_9;
  }
LABEL_10:
  v22 = [v5 queryCompletionBlock];

  if (v22)
  {
    id v23 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v24 = [v5 resultsLimit];
    if (v24 == *MEMORY[0x1E4F19CE8] || (uint64_t v25 = [v5 resultsLimit] + v11, v25 != v43[3]))
    {
      v26 = 0;
    }
    else
    {
      v26 = objc_opt_new();
      [v26 setQuery:v8];
      [v26 setOffset:v43[3]];
    }
    v27 = [v5 queryCompletionBlock];
    ((void (**)(void, void *, uint64_t))v27)[2](v27, v26, v47[5]);
  }
  uint64_t v28 = [v5 completionBlock];

  if (v28)
  {
    v29 = (void *)MEMORY[0x1E016E7F0]();
    v30 = [v5 completionBlock];
    v30[2]();
  }
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v46, 8);
}

void __46__TRISQLiteCKDatabase__processQueryOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = [v6 recordMatchedBlock];
  v10[2](v10, v9, v8, v7);
}

uint64_t __46__TRISQLiteCKDatabase__processQueryOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 40), @"TRISQLiteCKDatabase.m", 262, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    v4 = *(void **)(a1 + 32);
  }
  id v5 = *(void **)(a1 + 40);
  id v6 = [v4 recordType];
  id v7 = [*(id *)(a1 + 32) predicate];
  id v8 = [*(id *)(a1 + 32) sortDescriptors];
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v10 = [*(id *)(a1 + 48) resultsLimit];
  uint64_t v11 = [*(id *)(a1 + 48) desiredKeys];
  int v12 = [v5 _evalQueryOperationWithRecordType:v6 predicate:v7 sortDescriptors:v8 offset:v9 resultsLimit:v10 desiredKeys:v11 txn:v3 error:*(void *)(*(void *)(a1 + 64) + 8) + 40 recordMatchedBlock:*(void *)(a1 + 56)];

  id v13 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  char v14 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];

  if (v12) {
    id v15 = v13;
  }
  else {
    id v15 = v14;
  }
  return *v15;
}

- (BOOL)_evalQueryOperationWithRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 offset:(unint64_t)a6 resultsLimit:(unint64_t)a7 desiredKeys:(id)a8 txn:(id)a9 error:(id *)a10 recordMatchedBlock:(id)a11
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v63 = a4;
  id v62 = a5;
  id v64 = a8;
  id v60 = a9;
  id v61 = a11;
  v17 = [(TRISQLiteCKDatabase *)self _allRecordTypes];
  LOBYTE(a5) = [v17 containsObject:v16];

  if (a5)
  {
    v59 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v16];
    if (!v59)
    {
      uint64_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
      [v49 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 314, @"Invalid parameter not satisfying: %@", @"valueTypes" object file lineNumber description];
    }
    id v88 = 0;
    id v89 = 0;
    if ([(TRISQLiteCKDatabase *)self _parseDesiredKeys:v64 recordType:v16 unindexedFields:&v89 indexedFields:&v88 error:a10])
    {
      if (!v89)
      {
        v50 = [MEMORY[0x1E4F28B00] currentHandler];
        [v50 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 325, @"Invalid parameter not satisfying: %@", @"unindexedDesiredKeys" object file lineNumber description];
      }
      if (!v88)
      {
        id v51 = [MEMORY[0x1E4F28B00] currentHandler];
        [v51 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 326, @"Invalid parameter not satisfying: %@", @"indexedDesiredKeys" object file lineNumber description];
      }
      v55 = objc_opt_new();
      id v86 = 0;
      id v87 = 0;
      if ([(TRISQLiteCKDatabase *)self _translatePredicate:v63 forRecordType:v16 toSQLExpr:&v87 paramBindings:&v86 error:a10])
      {
        if (!v87)
        {
          v52 = [MEMORY[0x1E4F28B00] currentHandler];
          [v52 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 339, @"Invalid parameter not satisfying: %@", @"whereClauseExpr" object file lineNumber description];
        }
        if (!v86)
        {
          v53 = [MEMORY[0x1E4F28B00] currentHandler];
          [v53 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 340, @"Invalid parameter not satisfying: %@", @"whereClauseBindings" object file lineNumber description];
        }
        objc_msgSend(v55, "addObjectsFromArray:");
        if ([v62 count])
        {
          v58 = objc_opt_new();
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id obj = v62;
          uint64_t v18 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v83;
            v20 = &selRef__updateFactorPacksByMergingAssets_context_;
            while (2)
            {
              uint64_t v21 = 0;
              v22 = v20[248];
              do
              {
                if (*(void *)v83 != v19) {
                  objc_enumerationMutation(obj);
                }
                id v23 = *(void **)(*((void *)&v82 + 1) + 8 * v21);
                uint64_t v24 = [v23 key];
                if (!v24 || (BOOL v25 = [v23 selector] == (void)v22, v24, !v25))
                {
                  uint64_t v38 = (void *)[[NSString alloc] initWithFormat:@"Unsupported sort descriptor: %@", v23];
                  v39 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v38];
                  id v40 = *a10;
                  *a10 = v39;

                  BOOL v37 = 0;
                  v33 = @" ORDER BY rowid ASC";
                  goto LABEL_42;
                }
                id v26 = [NSString alloc];
                v27 = [v23 key];
                int v28 = [v23 ascending];
                v29 = "DESC";
                if (v28) {
                  v29 = "ASC";
                }
                v30 = (void *)[v26 initWithFormat:@"%@ %s", v27, v29];
                [v58 addObject:v30];

                ++v21;
              }
              while (v18 != v21);
              uint64_t v18 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
              v20 = &selRef__updateFactorPacksByMergingAssets_context_;
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v31 = [NSString alloc];
          id v32 = [v58 componentsJoinedByString:@", "];
          v33 = (__CFString *)[v31 initWithFormat:@" ORDER BY %@", v32];
        }
        else
        {
          v33 = @" ORDER BY rowid ASC";
        }
        if (*MEMORY[0x1E4F19CE8] == a7)
        {
          objc_super v41 = &stru_1F3455898;
        }
        else
        {
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke;
          v81[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
          v81[4] = a7;
          uint64_t v42 = (void *)MEMORY[0x1E016EA80](v81);
          [v55 addObject:v42];

          objc_super v41 = @" LIMIT ?";
        }
        if (a6)
        {
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_2;
          v80[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
          v80[4] = a6;
          uint64_t v43 = (void *)MEMORY[0x1E016EA80](v80);
          [v55 addObject:v43];

          uint64_t v44 = @" OFFSET ?";
        }
        else
        {
          uint64_t v44 = &stru_1F3455898;
        }
        id v45 = [NSString alloc];
        v58 = (void *)[v45 initWithFormat:@"SELECT *, trisql_recordId AS trisql_outer_recordId FROM %@ WHERE %@%@%@%@", v16, v87, v33, v41, v44];
        uint64_t v76 = 0;
        v77 = &v76;
        uint64_t v78 = 0x2020000000;
        char v79 = 1;
        uint64_t v46 = [v60 db];
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_3;
        v74[3] = &unk_1E6BB7C50;
        id v75 = v55;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_4;
        v66[3] = &unk_1E6BB8390;
        v66[4] = self;
        id v67 = v16;
        id v68 = v89;
        id v69 = v88;
        v72 = &v76;
        v73 = a10;
        id v70 = v60;
        id v71 = v61;
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_5;
        v65[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
        v65[4] = a10;
        int v47 = [v46 prepAndRunQuery:v58 onPrep:v74 onRow:v66 onError:v65];

        if (v47) {
          BOOL v37 = *((unsigned char *)v77 + 24) != 0;
        }
        else {
          BOOL v37 = 0;
        }

        _Block_object_dispose(&v76, 8);
LABEL_42:
      }
      else
      {
        BOOL v37 = 0;
      }
    }
    else
    {
      BOOL v37 = 0;
    }
  }
  else
  {
    id v34 = (void *)[[NSString alloc] initWithFormat:@"Unrecognized record type: %@", v16];
    id v35 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v34];
    id v36 = *a10;
    *a10 = v35;

    BOOL v37 = 0;
  }

  return v37;
}

uint64_t __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 32) >= 0x7FFFFFFFFFFFFFFFuLL) {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  return [a2 bindParam:a3 toInt64:v3];
}

uint64_t __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 32) >= 0x7FFFFFFFFFFFFFFFuLL) {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  return [a2 bindParam:a3 toInt64:v3];
}

void __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    int v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * i));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      v8 += i;
    }
    while (v6);
  }
}

uint64_t __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _createRecordFromSelectRow:a2 recordType:*(void *)(a1 + 40) unindexedDesiredKeys:*(void *)(a1 + 48) indexedDesiredKeys:*(void *)(a1 + 56) txn:*(void *)(a1 + 64) error:*(void *)(a1 + 88)];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 72);
    if (v5)
    {
      uint64_t v6 = [v3 recordID];
      (*(void (**)(uint64_t, void *, void *, void))(v5 + 16))(v5, v6, v4, 0);
    }
    uint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    uint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  }

  return *v7;
}

uint64_t __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_5(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C10];
}

- (BOOL)_parseDesiredKeys:(id)a3 recordType:(id)a4 unindexedFields:(id *)a5 indexedFields:(id *)a6 error:(id *)a7
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  v58 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v14];
  if (!v58)
  {
    id v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 428, @"Invalid parameter not satisfying: %@", @"valueTypes" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
LABEL_32:
    uint64_t v46 = [(TRISQLiteCKDatabase *)self _keysForFieldsOfRecordType:v14];
    id v47 = *a5;
    *a5 = v46;

    if (!*a5)
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      [v50 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 432, @"Invalid parameter not satisfying: %@", @"*unindexedFields" object file lineNumber description];
    }
    id v48 = *a6;
    *a6 = (id)MEMORY[0x1E4F1CC08];

    BOOL v38 = 1;
    goto LABEL_35;
  }
  if (!v13) {
    goto LABEL_32;
  }
LABEL_3:
  location = a5;
  v52 = a6;
  v53 = a7;
  id v54 = v14;
  id v57 = (id)objc_opt_new();
  id v55 = v13;
  id obj = (id)objc_opt_new();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v65;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        uint64_t v21 = (void *)MEMORY[0x1E016E7F0]();
        long long v63 = xmmword_1DA403050;
        uint64_t v22 = [(TRISQLiteCKDatabase *)self _parseIndexedFieldKey:v20 indexRange:&v63];
        if (!v22)
        {
          v39 = (void *)[[NSString alloc] initWithFormat:@"Can't parse indexed field key: %@", v20];
          id v40 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v39];
          id v41 = *a7;
          *a7 = v40;

          BOOL v38 = 0;
          id v14 = v54;
          id v13 = v55;
          goto LABEL_30;
        }
        id v23 = (void *)v22;
        uint64_t v24 = v63;
        BOOL v25 = [v58 objectForKeyedSubscript:v22];

        if (v24 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v25) {
            [obj addObject:v23];
          }
        }
        else if (v25)
        {
          id v26 = [v57 objectForKeyedSubscript:v23];
          v27 = v26;
          if (v26) {
            id v28 = v26;
          }
          else {
            id v28 = (id)objc_opt_new();
          }
          v29 = v28;

          v30 = [MEMORY[0x1E4F29238] valueWithRange:v63];
          [v29 addObject:v30];

          [v57 setObject:v29 forKeyedSubscript:v23];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v31 = obj;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v59 objects:v68 count:16];
  id v14 = v54;
  id v13 = v55;
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v60;
    while (2)
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v60 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v59 + 1) + 8 * j);
        BOOL v37 = [v57 objectForKeyedSubscript:v36];

        if (v37)
        {
          uint64_t v42 = (void *)[[NSString alloc] initWithFormat:@"desiredKeys specifies field key %@ simultaneously in both indexed and unindexed form.", v36];
          uint64_t v43 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v42];
          id v44 = *v53;
          id *v53 = (id)v43;

          BOOL v38 = 0;
          goto LABEL_30;
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v59 objects:v68 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

  objc_storeStrong(location, obj);
  objc_storeStrong(v52, v57);
  BOOL v38 = 1;
LABEL_30:

LABEL_35:
  return v38;
}

- (id)_createRecordFromSelectRow:(id)a3 recordType:(id)a4 unindexedDesiredKeys:(id)a5 indexedDesiredKeys:(id)a6 txn:(id)a7 error:(id *)a8
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v95 = a7;
  v97 = self;
  v98 = v14;
  v100 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v14];
  if (!v100)
  {
    long long v85 = [MEMORY[0x1E4F28B00] currentHandler];
    [v85 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 492, @"Invalid parameter not satisfying: %@", @"valueTypes" object file lineNumber description];
  }
  v90 = v16;
  uint64_t v17 = [v13 getNSStringForColumnName:"trisql_recordId" table:0];
  if (!v17)
  {
    id v86 = [MEMORY[0x1E4F28B00] currentHandler];
    [v86 handleFailureInMethod:a2 object:self file:@"TRISQLiteCKDatabase.m" lineNumber:496 description:@"NULL read from NOT NULL column \"trisql_recordId\""];
  }
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v17];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:v14 recordID:v18];
  [v13 getDoubleForColumnName:"modificationDate" table:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v20];
  [v19 setModificationDate:v21];

  [v13 getDoubleForColumnName:"creationDate" table:0];
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v22];
  [v19 setCreationDate:v23];

  uint64_t v24 = v90;
  BOOL v25 = [v90 allKeys];
  id v26 = [v15 arrayByAddingObjectsFromArray:v25];

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v27 = v26;
  uint64_t v103 = [v27 countByEnumeratingWithState:&v108 objects:v113 count:16];
  if (!v103) {
    goto LABEL_60;
  }
  uint64_t v102 = *(void *)v109;
  id v89 = v15;
  id v99 = v27;
  do
  {
    uint64_t v28 = 0;
    do
    {
      if (*(void *)v109 != v102) {
        objc_enumerationMutation(v27);
      }
      v29 = *(void **)(*((void *)&v108 + 1) + 8 * v28);
      v30 = (void *)MEMORY[0x1E016E7F0]();
      id v31 = v29;
      uint64_t v32 = (const char *)[v31 UTF8String];
      if (!v32)
      {
        long long v66 = [MEMORY[0x1E4F28B00] currentHandler];
        [v66 handleFailureInMethod:a2, v97, @"TRISQLiteCKDatabase.m", 513, @"Invalid parameter not satisfying: %@", @"columnName" object file lineNumber description];
      }
      if (([v13 isNullForColumnName:v32 table:0] & 1) == 0)
      {
        uint64_t v33 = [v100 objectForKeyedSubscript:v31];
        uint64_t v34 = (objc_class *)[v33 firstObject];

        if (!v34)
        {
          long long v67 = [MEMORY[0x1E4F28B00] currentHandler];
          [v67 handleFailureInMethod:a2, v97, @"TRISQLiteCKDatabase.m", 519, @"Invalid parameter not satisfying: %@", @"valueType" object file lineNumber description];
        }
        context = v30;
        if (v34 == (objc_class *)objc_opt_class())
        {
          uint64_t v51 = [v13 getNSStringForColumnName:v32 table:0];
        }
        else if (v34 == (objc_class *)objc_opt_class())
        {
          id v52 = v13;
          if (sqlite3_column_count((sqlite3_stmt *)[v52 stmt]) < 1)
          {
            uint64_t v53 = 0;
          }
          else
          {
            uint64_t v53 = 0;
            do
            {
              id v54 = v52;
              id v55 = sqlite3_column_name((sqlite3_stmt *)[v54 stmt], v53);
              if (v55 && !strcmp(v55, v32)) {
                break;
              }
              uint64_t v53 = (v53 + 1);
            }
            while ((int)v53 < sqlite3_column_count((sqlite3_stmt *)[v54 stmt]));
          }
          id v57 = v52;
          if ((int)v53 >= sqlite3_column_count((sqlite3_stmt *)[v57 stmt]))
          {
            id v68 = [MEMORY[0x1E4F28B00] currentHandler];
            [v68 handleFailureInMethod:a2, v97, @"TRISQLiteCKDatabase.m", 532, @"Invalid parameter not satisfying: %@", @"paramIndex >= 0 && paramIndex < sqlite3_column_count(row.stmt)" object file lineNumber description];
          }
          id v58 = v57;
          int v59 = sqlite3_column_type((sqlite3_stmt *)[v58 stmt], v53);
          id v60 = objc_alloc(NSNumber);
          if (v59 == 2)
          {
            [v58 getDoubleForColumn:v53];
            uint64_t v51 = objc_msgSend(v60, "initWithDouble:");
          }
          else
          {
            uint64_t v51 = objc_msgSend(v60, "initWithLongLong:", objc_msgSend(v58, "getInt64ForColumn:", v53));
          }
        }
        else if (v34 == (objc_class *)objc_opt_class())
        {
          id v56 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          [v13 getDoubleForColumnName:v32 table:0];
          uint64_t v51 = objc_msgSend(v56, "initWithTimeIntervalSinceReferenceDate:");
        }
        else
        {
          if (v34 != (objc_class *)objc_opt_class())
          {
            if (v34 == (objc_class *)objc_opt_class())
            {
              uint64_t v61 = [v13 getNSStringForColumnName:v32 table:0];
              if (!v61)
              {
                id v81 = [NSString alloc];
                BOOL v38 = [v19 recordID];
                id obj = [v38 recordName];
                long long v82 = (void *)[v81 initWithFormat:@"CKAsset column on record %@ has empty file path.", obj];
                long long v83 = [(TRISQLiteCKDatabase *)v97 _errorWithCode:1 message:v82];
                id v84 = *a8;
                *a8 = v83;

                goto LABEL_63;
              }
              BOOL v38 = (void *)v61;
              long long v62 = [v19 recordID];
              long long v63 = [(TRISQLiteCKDatabase *)v97 _assetForLocallyStoredAssetWithFilename:v38 forRecordId:v62 error:a8];

              id v27 = v99;
              if (!v63) {
                goto LABEL_64;
              }
              [v19 setObject:v63 forKeyedSubscript:v31];
            }
            else
            {
              if (v34 != (objc_class *)objc_opt_class())
              {
                id v78 = [NSString alloc];
                BOOL v38 = NSStringFromClass(v34);
                id obj = (id)[v78 initWithFormat:@"loading of scalar fields with type %@ is not implemented.", v38];
                char v79 = -[TRISQLiteCKDatabase _errorWithCode:message:](v97, "_errorWithCode:message:", 1);
                id v80 = *a8;
                *a8 = v79;

LABEL_63:
                id v27 = v99;

LABEL_64:

                id v70 = 0;
                goto LABEL_65;
              }
              uint64_t v35 = [v13 getInt64ForColumnName:v32 table:0];
              uint64_t v36 = v35 & ~(v35 >> 63);
              BOOL v37 = [v24 objectForKeyedSubscript:v31];
              BOOL v38 = v37;
              if (v37)
              {
                long long v106 = 0u;
                long long v107 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                id obj = v37;
                uint64_t v93 = [obj countByEnumeratingWithState:&v104 objects:v112 count:16];
                if (v93)
                {
                  unint64_t v94 = v36;
                  uint64_t v92 = *(void *)v105;
                  id v88 = v13;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v93; ++i)
                    {
                      if (*(void *)v105 != v92) {
                        objc_enumerationMutation(obj);
                      }
                      id v40 = *(void **)(*((void *)&v104 + 1) + 8 * i);
                      id v41 = (void *)MEMORY[0x1E016E7F0]();
                      uint64_t v42 = [v40 rangeValue];
                      uint64_t v44 = v42 + v43;
                      if (v42 + v43 > v94)
                      {
                        id v71 = [NSString alloc];
                        v72 = [v19 recordID];
                        [v72 recordName];
                        v73 = id v47 = v19;
                        v74 = (void *)[v71 initWithFormat:@"desiredKeys specifies range max %tu in array field %@[%@] for record %@, which exceeds maximum array count %tu.", v44, v98, v31, v73, v94];
                        id v75 = [(TRISQLiteCKDatabase *)v97 _errorWithCode:12 message:v74];
                        id v76 = *a8;
                        *a8 = v75;

LABEL_62:
                        id v13 = v88;
                        uint64_t v24 = v90;
                        uint64_t v19 = v47;
                        id v15 = v89;
                        goto LABEL_63;
                      }
                      uint64_t v45 = v42;
                      uint64_t v46 = v43;
                      [v19 recordID];
                      id v48 = v47 = v19;
                      uint64_t v49 = -[TRISQLiteCKDatabase _loadArrayForRecordType:recordId:fieldKey:indexRange:txn:error:](v97, "_loadArrayForRecordType:recordId:fieldKey:indexRange:txn:error:", v98, v48, v31, v45, v46, v95, a8);

                      if (!v49) {
                        goto LABEL_62;
                      }
                      v50 = objc_msgSend(MEMORY[0x1E4F1A2D8], "keyForListField:withIndexRange:", v31, v45, v46);
                      [v47 setObject:v49 forKeyedSubscript:v50];

                      uint64_t v19 = v47;
                    }
                    id v13 = v88;
                    uint64_t v93 = [obj countByEnumeratingWithState:&v104 objects:v112 count:16];
                    if (v93) {
                      continue;
                    }
                    break;
                  }
                  id v15 = v89;
                  uint64_t v24 = v90;
                }
                else
                {
                  id v15 = v89;
                }
                id v27 = v99;
                long long v65 = obj;
              }
              else
              {
                long long v64 = [v19 recordID];
                long long v65 = -[TRISQLiteCKDatabase _loadArrayForRecordType:recordId:fieldKey:indexRange:txn:error:](v97, "_loadArrayForRecordType:recordId:fieldKey:indexRange:txn:error:", v98, v64, v31, 0, v36, v95, a8);

                if (!v65)
                {
                  id v27 = v99;
                  goto LABEL_64;
                }
                [v19 setObject:v65 forKeyedSubscript:v31];
                id v27 = v99;
              }
            }
            goto LABEL_48;
          }
          uint64_t v51 = [v13 getNSDataForColumnName:v32 table:0];
        }
        BOOL v38 = (void *)v51;
        [v19 setObject:v51 forKeyedSubscript:v31];
        id v27 = v99;
LABEL_48:

        v30 = context;
      }
      ++v28;
    }
    while (v28 != v103);
    uint64_t v69 = [v27 countByEnumeratingWithState:&v108 objects:v113 count:16];
    uint64_t v103 = v69;
  }
  while (v69);
LABEL_60:

  id v70 = v19;
LABEL_65:

  return v70;
}

- (id)_loadArrayForRecordType:(id)a3 recordId:(id)a4 fieldKey:(id)a5 indexRange:(_NSRange)a6 txn:(id)a7 error:(id *)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (!length)
  {
    id v34 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_20;
  }
  NSUInteger v48 = location;
  v50 = v18;
  uint64_t v19 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v15];
  if (!v19)
  {
    uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 628, @"Invalid parameter not satisfying: %@", @"valueTypes" object file lineNumber description];
  }
  double v20 = [v19 objectForKeyedSubscript:v17];
  if ((unint64_t)[v20 count] < 2
    || (uint64_t v21 = [v20 objectAtIndexedSubscript:0], v21 != objc_opt_class()))
  {
    uint64_t v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 630, @"Invalid parameter not satisfying: %@", @"resolvedType.count >= 2 && resolvedType[0] == [NSArray class]" object file lineNumber description];
  }
  uint64_t v22 = [v20 objectAtIndexedSubscript:1];

  id v23 = objc_opt_new();
  uint64_t v51 = v16;
  uint64_t v49 = self;
  NSUInteger v47 = length;
  if (v22 == objc_opt_class() || v22 == objc_opt_class())
  {
    SEL v28 = a2;
    id v24 = v17;
    id v25 = v15;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke;
    v64[3] = &unk_1E6BB83D8;
    SEL v66 = v28;
    v64[4] = self;
    id v65 = v23;
    id v27 = (void *)MEMORY[0x1E016EA80](v64);
    v29 = v65;
  }
  else
  {
    SEL v46 = a2;
    id v24 = v17;
    id v25 = v15;
    if (v22 == objc_opt_class())
    {
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_2;
      v61[3] = &unk_1E6BB83D8;
      SEL v63 = v46;
      v61[4] = self;
      id v62 = v23;
      id v27 = (void *)MEMORY[0x1E016EA80](v61);
      v29 = v62;
    }
    else
    {
      if (v22 != objc_opt_class())
      {
        id v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:v46, self, @"TRISQLiteCKDatabase.m", 662, @"Loading arrays of type %@ is unsupported.", v22 object file lineNumber description];

        id v27 = 0;
        goto LABEL_13;
      }
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_3;
      v58[3] = &unk_1E6BB83D8;
      SEL v60 = v46;
      v58[4] = self;
      id v59 = v23;
      id v27 = (void *)MEMORY[0x1E016EA80](v58);
      v29 = v59;
    }
  }

LABEL_13:
  id v15 = v25;
  v30 = objc_msgSend([NSString alloc], "initWithFormat:", @" SELECT value FROM     %@_%@ WHERE         recordId = :record_id     AND idx >= :lower     AND idx < :upper ORDER BY idx ASC;",
                  v25,
                  v24);
  id v31 = [v50 db];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_4;
  v54[3] = &unk_1E6BB8400;
  id v32 = v51;
  id v55 = v32;
  NSUInteger v56 = v48;
  NSUInteger v57 = v47;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_5;
  v52[3] = &unk_1E6BB8428;
  id v33 = v27;
  id v53 = v33;
  [v31 prepAndRunQuery:v30 onPrep:v54 onRow:v52 onError:0];

  if ([v23 count] == v47)
  {
    if (v22 == objc_opt_class())
    {
      id v17 = v24;
      if ([v23 count])
      {
        uint64_t v41 = 0;
        while (1)
        {
          uint64_t v42 = [v23 objectAtIndexedSubscript:v41];
          uint64_t v43 = [(TRISQLiteCKDatabase *)v49 _assetForLocallyStoredAssetWithFilename:v42 forRecordId:v32 error:a8];

          if (!v43) {
            break;
          }
          [v23 setObject:v43 atIndexedSubscript:v41];

          if (++v41 >= (unint64_t)[v23 count]) {
            goto LABEL_27;
          }
        }
        id v34 = 0;
      }
      else
      {
LABEL_27:
        id v34 = v23;
      }
      goto LABEL_19;
    }
    id v34 = v23;
  }
  else
  {
    id v35 = [NSString alloc];
    uint64_t v36 = [v32 recordName];
    BOOL v37 = (void *)[v35 initWithFormat:@"Retrieval from array field %@[%@] on record %@ geerated wrong item count (exp %tu, act %tu).", v15, v24, v36, v47, objc_msgSend(v23, "count")];
    BOOL v38 = [(TRISQLiteCKDatabase *)v49 _errorWithCode:1 message:v37];
    id v39 = *a8;
    *a8 = v38;

    id v34 = 0;
  }
  id v17 = v24;
LABEL_19:

  id v18 = v50;
  id v16 = v51;
LABEL_20:

  return v34;
}

void __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumnName:"value" table:0];
  id v5 = (id)v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"TRISQLiteCKDatabase.m" lineNumber:639 description:@"NULL loaded from NOT NULL column for array value"];

    uint64_t v3 = 0;
  }
  [*(id *)(a1 + 40) addObject:v3];
}

void __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_2(void *a1, void *a2)
{
  id v10 = a2;
  int v3 = sqlite3_column_type((sqlite3_stmt *)[v10 stmt], 0);
  if (v3 == 2)
  {
    id v4 = (void *)a1[5];
    id v6 = objc_alloc(NSNumber);
    [v10 getDoubleForColumn:0];
    uint64_t v5 = objc_msgSend(v6, "initWithDouble:");
  }
  else
  {
    if (v3 != 1)
    {
      if (v3 == 5)
      {
        int v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a1[6] object:a1[4] file:@"TRISQLiteCKDatabase.m" lineNumber:647 description:@"NULL loaded from NOT NULL array value column"];
      }
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a1[6], a1[4], @"TRISQLiteCKDatabase.m", 651, @"Invalid parameter not satisfying: %@", @"actType == SQLITE_INTEGER" object file lineNumber description];
    }
    id v4 = (void *)a1[5];
    uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v10, "getInt64ForColumn:", 0));
  }
  uint64_t v7 = (void *)v5;
  [v4 addObject:v5];
}

void __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumnName:"value" table:0];
  id v5 = (id)v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"TRISQLiteCKDatabase.m" lineNumber:658 description:@"NULL loaded from NOT NULL column for array value"];

    uint64_t v3 = 0;
  }
  [*(id *)(a1 + 40) addObject:v3];
}

void __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_4(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v8 = a2;
  id v4 = [v3 recordName];
  [v8 bindNamedParam:":record_id" toNSString:v4];

  if (a1[5] >= 0x7FFFFFFFFFFFFFFFuLL) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v5 = a1[5];
  }
  [v8 bindNamedParam:":lower" toInt64:v5];
  uint64_t v6 = a1[6];
  if ((unint64_t)(v6 + a1[5]) >= 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v7 = v6 + a1[5];
  }
  [v8 bindNamedParam:":upper" toInt64:v7];
}

uint64_t __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_5(uint64_t a1)
{
  return *MEMORY[0x1E4F93C08];
}

- (id)_parseIndexedFieldKey:(id)a3 indexRange:(_NSRange *)a4
{
  id v7 = a3;
  *a4 = (_NSRange)xmmword_1DA403050;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__TRISQLiteCKDatabase__parseIndexedFieldKey_indexRange___block_invoke;
  block[3] = &unk_1E6BB8450;
  block[4] = self;
  void block[5] = a2;
  if (qword_1EA8D7EF0 != -1) {
    dispatch_once(&qword_1EA8D7EF0, block);
  }
  id v8 = (id)_MergedGlobals_31;
  uint64_t v9 = objc_msgSend(v8, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  id v10 = v9;
  if (!v9)
  {
    id v21 = v7;
    goto LABEL_11;
  }
  if ((unint64_t)[v9 numberOfRanges] <= 3)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 732, @"Invalid parameter not satisfying: %@", @"match.numberOfRanges >= 4" object file lineNumber description];
  }
  unint64_t v25 = 0;
  NSUInteger v26 = 0;
  uint64_t v11 = [v10 rangeAtIndex:2];
  id v13 = objc_msgSend(v7, "substringWithRange:", v11, v12);
  if ([(TRISQLiteCKDatabase *)self _parseDecimalString:v13 value:&v26])
  {
    uint64_t v14 = [v10 rangeAtIndex:3];
    id v16 = objc_msgSend(v7, "substringWithRange:", v14, v15);
    BOOL v17 = [(TRISQLiteCKDatabase *)self _parseDecimalString:v16 value:&v25];

    if (v17)
    {
      NSUInteger v18 = v25 - v26;
      if (v25 > v26)
      {
        a4->NSUInteger location = v26;
        a4->NSUInteger length = v18;
        uint64_t v19 = [v10 rangeAtIndex:1];
        objc_msgSend(v7, "substringWithRange:", v19, v20);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
        uint64_t v22 = v21;
        goto LABEL_14;
      }
    }
  }
  else
  {
  }
  uint64_t v22 = 0;
LABEL_14:

  return v22;
}

void __56__TRISQLiteCKDatabase__parseIndexedFieldKey_indexRange___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E016E7F0]();
  id v7 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([^\\[]+)\\[([0-9]+)\\.\\.<([0-9]+)\\]$" options:0 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"TRISQLiteCKDatabase.m", 721, @"Failed to create regex: %@", v4 object file lineNumber description];
  }
  uint64_t v5 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = v3;
}

- (BOOL)_parseDecimalString:(id)a3 value:(unint64_t *)a4
{
  unint64_t v7 = 0;
  int v5 = [MEMORY[0x1E4FB0198] convertFromString:a3 usingBase:10 toU64:&v7];
  if (v5) {
    *a4 = v7;
  }
  return v5;
}

- (BOOL)_translatePredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v14 = [(TRISQLiteCKDatabase *)self _translateCompoundPredicate:v12 forRecordType:v13 toSQLExpr:a5 paramBindings:a6 error:a7];
LABEL_5:
    BOOL v15 = v14;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v14 = [(TRISQLiteCKDatabase *)self _translateComparisonPredicate:v12 forRecordType:v13 toSQLExpr:a5 paramBindings:a6 error:a7];
    goto LABEL_5;
  }
  id v16 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  int v17 = [v12 isEqual:v16];

  if (v17)
  {
    id v18 = *a5;
    uint64_t v19 = @"1";
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
    int v21 = [v12 isEqual:v20];

    if (!v21)
    {
      id v23 = [NSString alloc];
      id v24 = (objc_class *)objc_opt_class();
      unint64_t v25 = NSStringFromClass(v24);
      NSUInteger v26 = (void *)[v23 initWithFormat:@"Unable to translate predicate of unsupported type: %@", v25];
      id v27 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v26];
      id v28 = *a7;
      *a7 = v27;

      BOOL v15 = 0;
      goto LABEL_12;
    }
    id v18 = *a5;
    uint64_t v19 = @"0";
  }
  *a5 = v19;

  id v22 = *a6;
  *a6 = (id)MEMORY[0x1E4F1CBF0];

  BOOL v15 = 1;
LABEL_12:

  return v15;
}

- (BOOL)_translateCompoundPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v57 = a4;
  uint64_t v14 = [v13 compoundPredicateType];
  if ((unint64_t)(v14 - 1) >= 2)
  {
    if (v14)
    {
      uint64_t v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unrecognized compound predicate type: %tu", objc_msgSend(v13, "compoundPredicateType"));
      uint64_t v42 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v41];
      id v43 = *a7;
      *a7 = v42;
    }
    else
    {
      id v34 = [v13 subpredicates];
      uint64_t v35 = [v34 count];

      if (v35 == 1)
      {
        id v63 = 0;
        uint64_t v36 = [v13 subpredicates];
        BOOL v37 = [v36 objectAtIndexedSubscript:0];
        BOOL v33 = [(TRISQLiteCKDatabase *)self _translatePredicate:v37 forRecordType:v57 toSQLExpr:&v63 paramBindings:a6 error:a7];

        if (v33)
        {
          if (!v63)
          {
            id v52 = [MEMORY[0x1E4F28B00] currentHandler];
            [v52 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 818, @"Invalid parameter not satisfying: %@", @"subSQLExpr" object file lineNumber description];
          }
          id v38 = [NSString alloc];
          id v39 = (void *)[v38 initWithFormat:@"NOT (%@)", v63];
          id v40 = *a5;
          *a5 = v39;
        }
        goto LABEL_35;
      }
      id v46 = [NSString alloc];
      NSUInteger v47 = [v13 subpredicates];
      NSUInteger v48 = objc_msgSend(v46, "initWithFormat:", @"NOT predicate contains %tu subpredicates where exactly one was expected.", objc_msgSend(v47, "count"));
      uint64_t v49 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v48];
      id v50 = *a7;
      *a7 = v49;
    }
    LOBYTE(v33) = 0;
    goto LABEL_35;
  }
  BOOL v15 = [v13 subpredicates];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    SEL v53 = a2;
    id v54 = a6;
    id v55 = a5;
    int v17 = objc_opt_new();
    id v18 = objc_opt_new();
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    NSUInteger v56 = v13;
    uint64_t v19 = [v13 subpredicates];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v60;
      while (2)
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v60 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v59 + 1) + 8 * v23);
          id v63 = 0;
          id v58 = 0;
          if (![(TRISQLiteCKDatabase *)self _translatePredicate:v24 forRecordType:v57 toSQLExpr:&v63 paramBindings:&v58 error:a7])
          {

            LOBYTE(v33) = 0;
            goto LABEL_28;
          }
          if (!v63)
          {
            id v27 = [MEMORY[0x1E4F28B00] currentHandler];
            [v27 handleFailureInMethod:v53, self, @"TRISQLiteCKDatabase.m", 848, @"Invalid parameter not satisfying: %@", @"subSQLExpr" object file lineNumber description];
          }
          if (!v58)
          {
            id v28 = [MEMORY[0x1E4F28B00] currentHandler];
            [v28 handleFailureInMethod:v53, self, @"TRISQLiteCKDatabase.m", 849, @"Invalid parameter not satisfying: %@", @"subBindings" object file lineNumber description];
          }
          id v25 = [NSString alloc];
          NSUInteger v26 = (void *)[v25 initWithFormat:@"(%@)", v63];
          [v17 addObject:v26];

          [v18 addObjectsFromArray:v58];
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v59 objects:v64 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    if ([v56 compoundPredicateType] == 1) {
      v29 = @" AND ";
    }
    else {
      v29 = @" OR ";
    }
    uint64_t v30 = [v17 componentsJoinedByString:v29];
    id v31 = *v55;
    id *v55 = (id)v30;

    id v32 = v18;
    uint64_t v19 = *v54;
    *id v54 = v32;
    LOBYTE(v33) = 1;
LABEL_28:

    id v13 = v56;
  }
  else
  {
    if ([v13 compoundPredicateType] == 1) {
      uint64_t v44 = @"1";
    }
    else {
      uint64_t v44 = @"0";
    }
    objc_storeStrong(a5, v44);
    id v45 = *a6;
    *a6 = (id)MEMORY[0x1E4F1CBF0];

    LOBYTE(v33) = 1;
  }
LABEL_35:

  return v33;
}

- (BOOL)_translateComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  unint64_t v14 = [v12 predicateOperatorType];
  if (v14 >= 6)
  {
    if (v14 != 10)
    {
      id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unsupported comparison predicate: %tu", objc_msgSend(v12, "predicateOperatorType"));
      uint64_t v19 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v18];
      id v20 = *a7;
      *a7 = v19;

      BOOL v16 = 0;
      goto LABEL_4;
    }
    BOOL v15 = [(TRISQLiteCKDatabase *)self _translateArrayRHSComparisonPredicate:v12 forRecordType:v13 toSQLExpr:a5 paramBindings:a6 error:a7];
  }
  else
  {
    BOOL v15 = [(TRISQLiteCKDatabase *)self _translateScalarComparisonPredicate:v12 forRecordType:v13 toSQLExpr:a5 paramBindings:a6 error:a7];
  }
  BOOL v16 = v15;
LABEL_4:

  return v16;
}

- (BOOL)_translateScalarComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [v12 comparisonPredicateModifier];
  if (v14 == 2)
  {
    BOOL v15 = [(TRISQLiteCKDatabase *)self _translateAnyModifiedScalarComparisonPredicate:v12 forRecordType:v13 toSQLExpr:a5 paramBindings:a6 error:a7];
  }
  else
  {
    if (v14)
    {
      int v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unsupported comparison predicate modifier: %tu", objc_msgSend(v12, "comparisonPredicateModifier"));
      id v18 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v17];
      id v19 = *a7;
      *a7 = v18;

      BOOL v16 = 0;
      goto LABEL_7;
    }
    BOOL v15 = [(TRISQLiteCKDatabase *)self _translateDirectModifiedScalarComparisonPredicate:v12 forRecordType:v13 toSQLExpr:a5 paramBindings:a6 error:a7];
  }
  BOOL v16 = v15;
LABEL_7:

  return v16;
}

- (BOOL)_parseScalarExpression:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  BOOL v15 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v14];
  if (!v15)
  {
    id v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 939, @"Invalid parameter not satisfying: %@", @"valueTypes" object file lineNumber description];
  }
  if ([v13 expressionType] == 3)
  {
    BOOL v16 = [v13 keyPath];
    if ([v16 isEqualToString:*MEMORY[0x1E4FB04C8]])
    {
      int v17 = @"modificationDate";
    }
    else
    {
      int v17 = [v13 keyPath];
    }

    uint64_t v22 = [v15 objectForKeyedSubscript:v17];
    uint64_t v23 = v22;
    if (v22)
    {
      uint64_t v24 = [v22 firstObject];
      if (v24 != objc_opt_class())
      {
        objc_storeStrong(a5, v17);
        id v25 = *a6;
        *a6 = (id)MEMORY[0x1E4F1CBF0];
        BOOL v21 = 1;
LABEL_19:

        goto LABEL_20;
      }
      id v33 = [NSString alloc];
      id v25 = [v13 keyPath];
      uint64_t v32 = [v33 initWithFormat:@"Field with key %@ is array-typed but is used in an expression where a scalar was expected.", v25, v57];
    }
    else
    {
      id v31 = [NSString alloc];
      id v25 = [v13 keyPath];
      uint64_t v32 = [v31 initWithFormat:@"Unrecognized field key %@ on record type %@.", v25, v14];
    }
    id v34 = (void *)v32;
    uint64_t v35 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v32];
    id v36 = *a7;
    *a7 = v35;

    BOOL v21 = 0;
    goto LABEL_19;
  }
  if (![v13 expressionType])
  {
    int v17 = [v13 constantValue];
    if (!v17)
    {
      NSUInteger v56 = [MEMORY[0x1E4F28B00] currentHandler];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = *a5;
      *a5 = @"?";

      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke;
      v64[3] = &unk_1E6BB8478;
      uint64_t v65 = v17;
      id v27 = (void *)MEMORY[0x1E016EA80](v64);
      v69[0] = v27;
      BOOL v21 = 1;
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
      id v29 = *a6;
      *a6 = v28;

      uint64_t v30 = v65;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v38 = v17;
        id v39 = *a5;
        *a5 = @"?";

        if (CFNumberIsFloatType((CFNumberRef)v38))
        {
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_2;
          v62[3] = &unk_1E6BB8478;
          id v40 = (id *)&v63;
          id v63 = v38;
          uint64_t v41 = (void *)MEMORY[0x1E016EA80](v62);
          id v68 = v41;
          uint64_t v42 = &v68;
        }
        else
        {
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_3;
          v60[3] = &unk_1E6BB8478;
          id v40 = (id *)&v61;
          long long v61 = v38;
          uint64_t v41 = (void *)MEMORY[0x1E016EA80](v60);
          long long v67 = v41;
          uint64_t v42 = &v67;
        }
        BOOL v21 = 1;
        SEL v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
        id v54 = *a6;
        *a6 = v53;

        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v47 = [NSString alloc];
        NSUInteger v48 = (objc_class *)objc_opt_class();
        uint64_t v49 = NSStringFromClass(v48);
        id v50 = (void *)[v47 initWithFormat:@"Constant-valued expression of class %@ is not supported in context where a scalar expression is expected.", v49];
        uint64_t v51 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v50];
        id v52 = *a7;
        *a7 = v51;

        BOOL v21 = 0;
        goto LABEL_20;
      }
      id v43 = *a5;
      *a5 = @"?";

      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_4;
      v58[3] = &unk_1E6BB8478;
      long long v59 = v17;
      uint64_t v44 = (void *)MEMORY[0x1E016EA80](v58);
      SEL v66 = v44;
      BOOL v21 = 1;
      id v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
      id v46 = *a6;
      *a6 = v45;

      uint64_t v30 = v59;
    }

LABEL_20:
    goto LABEL_21;
  }
  id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Expression of type %tu is not supported in context where a scalar expression is expected.", objc_msgSend(v13, "expressionType"));
  id v19 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v18];
  id v20 = *a7;
  *a7 = v19;

  BOOL v21 = 0;
LABEL_21:

  return v21;
}

uint64_t __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 bindParam:a3 toNSString:*(void *)(a1 + 32)];
}

void __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 doubleValue];
  objc_msgSend(v5, "bindParam:toDouble:", a3);
}

void __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "bindParam:toInt64:", a3, objc_msgSend(v4, "longLongValue"));
}

void __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "bindParam:toDouble:", a3);
}

- (BOOL)_translateDirectModifiedScalarComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  BOOL v15 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v14];
  if (!v15)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1019, @"Invalid parameter not satisfying: %@", @"valueTypes" object file lineNumber description];
  }
  id v39 = 0;
  id v40 = 0;
  BOOL v16 = [v13 leftExpression];
  BOOL v17 = [(TRISQLiteCKDatabase *)self _parseScalarExpression:v16 forRecordType:v14 toSQLExpr:&v40 paramBindings:&v39 error:a7];

  if (v17)
  {
    if (!v40)
    {
      id v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1030, @"Invalid parameter not satisfying: %@", @"leftSQL" object file lineNumber description];
    }
    if (!v39)
    {
      id v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1031, @"Invalid parameter not satisfying: %@", @"leftParamBindings" object file lineNumber description];
    }
    id v37 = 0;
    id v38 = 0;
    id v18 = [v13 rightExpression];
    BOOL v19 = [(TRISQLiteCKDatabase *)self _parseScalarExpression:v18 forRecordType:v14 toSQLExpr:&v38 paramBindings:&v37 error:a7];

    if (v19)
    {
      if (!v38)
      {
        uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
        [v35 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1042, @"Invalid parameter not satisfying: %@", @"rightSQL" object file lineNumber description];
      }
      if (!v37)
      {
        id v36 = [MEMORY[0x1E4F28B00] currentHandler];
        [v36 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1043, @"Invalid parameter not satisfying: %@", @"rightParamBindings" object file lineNumber description];
      }
      id v20 = objc_msgSend(v39, "arrayByAddingObjectsFromArray:");
      id v21 = *a6;
      *a6 = v20;

      switch([v13 predicateOperatorType])
      {
        case 0:
          id v22 = [NSString alloc];
          uint64_t v23 = (void *)[v22 initWithFormat:@"%@ < %@", v40, v38];
          goto LABEL_23;
        case 1:
          id v26 = [NSString alloc];
          uint64_t v23 = (void *)[v26 initWithFormat:@"%@ <= %@", v40, v38];
          goto LABEL_23;
        case 2:
          id v27 = [NSString alloc];
          uint64_t v23 = (void *)[v27 initWithFormat:@"%@ > %@", v40, v38];
          goto LABEL_23;
        case 3:
          id v28 = [NSString alloc];
          uint64_t v23 = (void *)[v28 initWithFormat:@"%@ >= %@", v40, v38];
          goto LABEL_23;
        case 4:
          id v29 = [NSString alloc];
          uint64_t v23 = (void *)[v29 initWithFormat:@"%@ = %@", v40, v38];
          goto LABEL_23;
        case 5:
          id v30 = [NSString alloc];
          uint64_t v23 = (void *)[v30 initWithFormat:@"%@ != %@", v40, v38];
LABEL_23:
          id v25 = *a5;
          *a5 = v23;
          BOOL v24 = 1;
          break;
        default:
          id v25 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRISQLiteCKDatabase.m", 1072, @"Unexpected scalar comparison predicate operator: %tu", objc_msgSend(v13, "predicateOperatorType"));
          BOOL v24 = 0;
          break;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)_translateAnyModifiedScalarComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v8 = [(TRISQLiteCKDatabase *)self _errorWithCode:12, @"Use of ANY is only supported in conjunction with predicate operator IN.", a5, a6 message];
  id v9 = *a7;
  *a7 = v8;

  return 0;
}

- (BOOL)_translateArrayRHSComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [v12 comparisonPredicateModifier];
  if (v14 == 2)
  {
    BOOL v15 = [(TRISQLiteCKDatabase *)self _translateAnyModifiedArrayRHSComparisonPredicate:v12 forRecordType:v13 toSQLExpr:a5 paramBindings:a6 error:a7];
  }
  else
  {
    if (v14)
    {
      BOOL v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unsupported comparison predicate modifier: %tu", objc_msgSend(v12, "comparisonPredicateModifier"));
      id v18 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v17];
      id v19 = *a7;
      *a7 = v18;

      BOOL v16 = 0;
      goto LABEL_7;
    }
    BOOL v15 = [(TRISQLiteCKDatabase *)self _translateDirectModifiedArrayRHSComparisonPredicate:v12 forRecordType:v13 toSQLExpr:a5 paramBindings:a6 error:a7];
  }
  BOOL v16 = v15;
LABEL_7:

  return v16;
}

- (BOOL)_translateDirectModifiedArrayRHSComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  if ([v13 predicateOperatorType] != 10)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1134, @"Expected IN operator, found %tu", objc_msgSend(v13, "predicateOperatorType") object file lineNumber description];
  }
  id v32 = 0;
  id v33 = 0;
  BOOL v15 = [v13 leftExpression];
  BOOL v16 = [(TRISQLiteCKDatabase *)self _parseScalarExpression:v15 forRecordType:v14 toSQLExpr:&v33 paramBindings:&v32 error:a7];

  if (v16)
  {
    if (!v33)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1145, @"Invalid parameter not satisfying: %@", @"leftSQL" object file lineNumber description];
    }
    if (!v32)
    {
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1146, @"Invalid parameter not satisfying: %@", @"leftParamBindings" object file lineNumber description];
    }
    id v30 = 0;
    id v31 = 0;
    BOOL v17 = [v13 rightExpression];
    BOOL v18 = [(TRISQLiteCKDatabase *)self _parseArrayExpression:v17 forRecordType:v14 usingCTEName:@"trisql_cte_rhs" toSQLCommonTableExpression:&v31 paramBindings:&v30 error:a7];

    if (v18)
    {
      if (!v31)
      {
        id v28 = [MEMORY[0x1E4F28B00] currentHandler];
        [v28 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1159, @"Invalid parameter not satisfying: %@", @"rhsWithClause" object file lineNumber description];
      }
      if (!v30)
      {
        id v29 = [MEMORY[0x1E4F28B00] currentHandler];
        [v29 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1160, @"Invalid parameter not satisfying: %@", @"rhsWithClauseBindings" object file lineNumber description];
      }
      id v19 = [NSString alloc];
      id v20 = (void *)[v19 initWithFormat:@"%@ IN (WITH %@ SELECT value FROM %@)", v33, v31, @"trisql_cte_rhs"];
      id v21 = *a5;
      *a5 = v20;

      id v22 = [v32 arrayByAddingObjectsFromArray:v30];
      id v23 = *a6;
      *a6 = v22;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)_translateAnyModifiedArrayRHSComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  if ([v13 predicateOperatorType] != 10)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1178, @"Expected IN operator, found %tu", objc_msgSend(v13, "predicateOperatorType") object file lineNumber description];
  }
  id v32 = 0;
  id v33 = 0;
  BOOL v15 = [v13 leftExpression];
  BOOL v16 = [(TRISQLiteCKDatabase *)self _parseArrayExpression:v15 forRecordType:v14 usingCTEName:@"trisql_cte_lhs" toSQLCommonTableExpression:&v33 paramBindings:&v32 error:a7];

  if (v16)
  {
    if (!v33)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1193, @"Invalid parameter not satisfying: %@", @"lhsWithClause" object file lineNumber description];
    }
    if (!v32)
    {
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1194, @"Invalid parameter not satisfying: %@", @"lhsWithClauseBindings" object file lineNumber description];
    }
    id v30 = 0;
    id v31 = 0;
    BOOL v17 = [v13 rightExpression];
    BOOL v18 = [(TRISQLiteCKDatabase *)self _parseArrayExpression:v17 forRecordType:v14 usingCTEName:@"trisql_cte_rhs" toSQLCommonTableExpression:&v31 paramBindings:&v30 error:a7];

    if (v18)
    {
      if (!v31)
      {
        id v28 = [MEMORY[0x1E4F28B00] currentHandler];
        [v28 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1206, @"Invalid parameter not satisfying: %@", @"rhsWithClause" object file lineNumber description];
      }
      if (!v30)
      {
        id v29 = [MEMORY[0x1E4F28B00] currentHandler];
        [v29 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1207, @"Invalid parameter not satisfying: %@", @"rhsWithClauseBindings" object file lineNumber description];
      }
      id v19 = [NSString alloc];
      id v20 = (void *)[v19 initWithFormat:@"EXISTS (WITH %@, %@ SELECT 1 FROM %@ WHERE value IN %@ LIMIT 1)", v33, v31, @"trisql_cte_lhs", @"trisql_cte_rhs"];
      id v21 = *a5;
      *a5 = v20;

      id v22 = [v32 arrayByAddingObjectsFromArray:v30];
      id v23 = *a6;
      *a6 = v22;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)_parseArrayExpression:(id)a3 forRecordType:(id)a4 usingCTEName:(id)a5 toSQLCommonTableExpression:(id *)a6 paramBindings:(id *)a7 error:(id *)a8
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  BOOL v18 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v16];
  if (!v18)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v81 = id v80 = v17;
    [v81 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1228, @"Invalid parameter not satisfying: %@", @"valueTypes" object file lineNumber description];

    id v17 = v80;
  }
  if ([v15 expressionType] == 3)
  {
    id v91 = v17;
    id v19 = [v15 keyPath];
    id v20 = [v18 objectForKeyedSubscript:v19];

    if (v20)
    {
      id v21 = self;
      id v87 = a7;
      id v89 = v18;
      uint64_t v22 = [v20 firstObject];
      uint64_t v23 = objc_opt_class();
      id v24 = [NSString alloc];
      uint64_t v25 = [v15 keyPath];
      id v26 = (void *)v25;
      if (v22 == v23)
      {
        long long v60 = (void *)[v24 initWithFormat:@"%@ (value) AS (SELECT value FROM %@_%@ WHERE recordId = trisql_outer_recordId)", v91, v16, v25];
        id v61 = *a6;
        *a6 = v60;

        id v26 = *v87;
        *id v87 = (id)MEMORY[0x1E4F1CBF0];
        BOOL v30 = 1;
      }
      else
      {
        id v27 = (void *)[v24 initWithFormat:@"Field with key %@ is scalar-valued, but was used in a predicate where an array was expected.", v25];
        id v28 = [(TRISQLiteCKDatabase *)v21 _errorWithCode:12 message:v27];
        id v29 = *a8;
        *a8 = v28;

        BOOL v30 = 0;
      }
      BOOL v18 = v89;
    }
    else
    {
      id v34 = [NSString alloc];
      id v26 = [v15 keyPath];
      uint64_t v35 = (void *)[v34 initWithFormat:@"Unrecognized field key %@ on record type %@.", v26, v16];
      id v36 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v35];
      id v37 = *a8;
      *a8 = v36;

      BOOL v30 = 0;
    }

    id v17 = v91;
  }
  else if ([v15 expressionType])
  {
    id v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Comparison predicate with expression of type %tu is not supported.", objc_msgSend(v15, "expressionType"));
    id v32 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v31];
    id v33 = *a8;
    *a8 = v32;

    BOOL v30 = 0;
  }
  else
  {
    id v38 = [v15 constantValue];
    if (!v38)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      long long v82 = v93 = v17;

      id v17 = v93;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v83 = self;
      id v86 = v38;
      id v88 = a7;
      id v84 = v16;
      v90 = v18;
      id v92 = v17;
      id v85 = v15;
      id v39 = v38;
      id v40 = objc_opt_new();
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id v41 = v39;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v98 objects:v102 count:16];
      id v94 = v41;
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v99;
        while (2)
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v99 != v44) {
              objc_enumerationMutation(v41);
            }
            id v46 = *(void **)(*((void *)&v98 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v97[0] = MEMORY[0x1E4F143A8];
              v97[1] = 3221225472;
              v97[2] = __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke;
              v97[3] = &unk_1E6BB8478;
              v97[4] = v46;
              id v47 = (void *)MEMORY[0x1E016EA80](v97);
              [v40 addObject:v47];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v69 = v41;
                id v70 = [NSString alloc];
                id v71 = (objc_class *)objc_opt_class();
                v72 = NSStringFromClass(v71);
                v73 = (void *)[v70 initWithFormat:@"An NSArray containing a value of class %@ was used in a predicate which only supports arrays of NSString and NSNumber.", v72];
                v74 = [(TRISQLiteCKDatabase *)v83 _errorWithCode:12 message:v73];
                id v75 = *a8;
                *a8 = v74;

                BOOL v30 = 0;
                id v76 = v69;
                id v16 = v84;
                id v17 = v92;
                id v38 = v86;
                goto LABEL_39;
              }
              CFNumberRef v48 = v46;
              if (CFNumberIsFloatType(v48))
              {
                uint64_t v49 = v96;
                v96[0] = MEMORY[0x1E4F143A8];
                v96[1] = 3221225472;
                id v50 = __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke_2;
              }
              else
              {
                uint64_t v49 = v95;
                v95[0] = MEMORY[0x1E4F143A8];
                v95[1] = 3221225472;
                id v50 = __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke_3;
              }
              v49[2] = v50;
              v49[3] = &unk_1E6BB8478;
              v49[4] = v48;
              CFNumberRef v51 = v48;
              id v52 = (void *)MEMORY[0x1E016EA80](v49);
              [v40 addObject:v52];

              id v41 = v94;
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v98 objects:v102 count:16];
          if (v43) {
            continue;
          }
          break;
        }
      }

      if ([v41 count])
      {
        id v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v41, "count"));
        id v54 = v88;
        if ([v41 count])
        {
          unint64_t v55 = 0;
          do
          {
            [v53 addObject:@"(?)"];
            ++v55;
          }
          while (v55 < [v41 count]);
        }
        id v56 = [NSString alloc];
        uint64_t v57 = [v53 componentsJoinedByString:@", "];
        id v58 = (void *)[v56 initWithFormat:@"%@ (value) AS (VALUES %@)", v92, v57];
        id v59 = *a6;
        *a6 = v58;

        id v17 = v92;
        id v16 = v84;
        id v15 = v85;
      }
      else
      {
        id v17 = v92;
        v77 = (void *)[[NSString alloc] initWithFormat:@"%@ (value) AS (SELECT 1 WHERE 0)", v92];
        id v53 = *a6;
        *a6 = v77;
        id v16 = v84;
        id v54 = v88;
      }

      id v78 = v40;
      id v76 = *v54;
      *id v54 = v78;
      BOOL v30 = 1;
      id v38 = v86;
      uint64_t v69 = v94;
LABEL_39:

      BOOL v18 = v90;
    }
    else
    {
      id v62 = v17;
      id v63 = [NSString alloc];
      long long v64 = (objc_class *)objc_opt_class();
      uint64_t v65 = NSStringFromClass(v64);
      SEL v66 = (void *)[v63 initWithFormat:@"Value of class %@ was used in a predicate where an array type was expected.", v65];
      long long v67 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v66];
      id v68 = *a8;
      *a8 = v67;

      id v17 = v62;
      BOOL v30 = 0;
    }
  }
  return v30;
}

uint64_t __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 bindParam:a3 toNSString:*(void *)(a1 + 32)];
}

void __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 doubleValue];
  objc_msgSend(v5, "bindParam:toDouble:", a3);
}

void __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "bindParam:toInt64:", a3, objc_msgSend(v4, "longLongValue"));
}

- (void)_processFetchRecordsOperation:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  unint64_t v55 = __Block_byref_object_copy__1;
  id v56 = __Block_byref_object_dispose__1;
  id v57 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__1;
  id v50 = __Block_byref_object_dispose__1;
  id v51 = 0;
  id v35 = a3;
  id v4 = [v35 recordIDs];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    uint64_t v12 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:@"CKFetchRecordsOperation with nil recordIDs is not supported."];
    uint64_t v11 = (void *)v47[5];
    v47[5] = v12;
  }
  else
  {
    uint64_t v6 = [(TRISQLiteCKDatabase *)self delegate];
    if (v6
      && ([(TRISQLiteCKDatabase *)self delegate],
          unint64_t v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 shouldProcessFetchOperation:v35 error:v47 + 5],
          v7,
          v6,
          (v8 & 1) == 0))
    {
      if (v47[5]) {
        goto LABEL_7;
      }
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1325, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F93BB0];
      db = self->_db;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __53__TRISQLiteCKDatabase__processFetchRecordsOperation___block_invoke;
      v40[3] = &unk_1E6BB84A0;
      id v41 = v35;
      uint64_t v42 = self;
      uint64_t v43 = &v46;
      uint64_t v44 = &v52;
      SEL v45 = a2;
      [v9 readTransactionWithHandle:db failableBlock:v40];
      uint64_t v11 = v41;
    }
  }

LABEL_7:
  id v13 = [v35 perRecordCompletionBlock];

  if (!v13) {
    goto LABEL_22;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = [v35 recordIDs];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v58 count:16];
  if (!v15) {
    goto LABEL_21;
  }
  uint64_t v16 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v37 != v16) {
        objc_enumerationMutation(v14);
      }
      BOOL v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      id v19 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v20 = [(id)v53[5] objectForKeyedSubscript:v18];
      id v21 = (void *)v20;
      if (!v53[5])
      {
        uint64_t v22 = (void *)v47[5];
        goto LABEL_17;
      }
      if (v20)
      {
        uint64_t v22 = 0;
LABEL_17:
        id v23 = v22;
        goto LABEL_19;
      }
      id v24 = [NSString alloc];
      uint64_t v25 = [v18 recordName];
      id v26 = (void *)[v24 initWithFormat:@"RecordID not found: %@", v25];
      id v23 = [(TRISQLiteCKDatabase *)self _errorWithCode:11 message:v26];

LABEL_19:
      id v27 = [v35 perRecordCompletionBlock];
      ((void (**)(void, void *, void *, id))v27)[2](v27, v21, v18, v23);
    }
    uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v58 count:16];
  }
  while (v15);
LABEL_21:

LABEL_22:
  id v28 = [v35 fetchRecordsCompletionBlock];

  if (v28)
  {
    id v29 = (void *)MEMORY[0x1E016E7F0]();
    BOOL v30 = [v35 fetchRecordsCompletionBlock];
    v30[2](v30, v53[5], v47[5]);
  }
  id v31 = [v35 completionBlock];

  if (v31)
  {
    id v32 = (void *)MEMORY[0x1E016E7F0]();
    id v33 = [v35 completionBlock];
    v33[2]();
  }
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
}

uint64_t __53__TRISQLiteCKDatabase__processFetchRecordsOperation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) recordIDs];

  if (!v3)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"TRISQLiteCKDatabase.m", 1333, @"Invalid parameter not satisfying: %@", @"operation.recordIDs" object file lineNumber description];
  }
  id v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [*(id *)(a1 + 40) _allRecordTypes];
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1E016E7F0]();
        uint64_t v11 = *(void **)(a1 + 40);
        uint64_t v12 = [*(id *)(a1 + 32) recordIDs];
        id v13 = [*(id *)(a1 + 32) desiredKeys];
        id v14 = [v11 _evalFetchRecordsOperationWithRecordIds:v12 recordType:v9 desiredKeys:v13 txn:v19 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];

        if (!v14)
        {
          uint64_t v15 = *MEMORY[0x1E4F93BF0];

          goto LABEL_13;
        }
        [v4 addEntriesFromDictionary:v14];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
  uint64_t v15 = *MEMORY[0x1E4F93BE8];
LABEL_13:

  return v15;
}

- (id)_evalFetchRecordsOperationWithRecordIds:(id)a3 recordType:(id)a4 desiredKeys:(id)a5 txn:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v14];
  if (!v17)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1393, @"Invalid parameter not satisfying: %@", @"valueTypes" object file lineNumber description];
  }
  id v46 = 0;
  v47[0] = 0;
  id v18 = 0;
  if ([(TRISQLiteCKDatabase *)self _parseDesiredKeys:v15 recordType:v14 unindexedFields:v47 indexedFields:&v46 error:a7])
  {
    if (!v47[0])
    {
      id v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1407, @"Invalid parameter not satisfying: %@", @"unindexedDesiredKeys" object file lineNumber description];
    }
    if (!v46)
    {
      BOOL v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1408, @"Invalid parameter not satisfying: %@", @"indexedDesiredKeys" object file lineNumber description];
    }
    if ([v13 count])
    {
      id v19 = [NSString alloc];
      [v13 count];
      long long v20 = _PASQMarksSeparatedByCommas();
      long long v21 = objc_msgSend(v19, "initWithFormat:", @" SELECT * FROM     %@ WHERE trisql_recordId IN (%@);",
                      v14,
                      v20);

      uint64_t v42 = 0;
      uint64_t v43 = &v42;
      uint64_t v44 = 0x2020000000;
      char v45 = 1;
      long long v22 = objc_opt_new();
      long long v23 = [v16 db];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke;
      v40[3] = &unk_1E6BB7C50;
      id v41 = v13;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke_2;
      v32[3] = &unk_1E6BB84C8;
      v32[4] = self;
      id v33 = v14;
      id v34 = v47[0];
      id v35 = v46;
      id v36 = v16;
      long long v38 = &v42;
      long long v39 = a7;
      id v24 = v22;
      id v37 = v24;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke_3;
      v31[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
      void v31[4] = a7;
      int v25 = [v23 prepAndRunQuery:v21 onPrep:v40 onRow:v32 onError:v31];

      if (v25)
      {
        if (*((unsigned char *)v43 + 24)) {
          id v26 = v24;
        }
        else {
          id v26 = 0;
        }
      }
      else
      {
        id v26 = 0;
      }
      id v18 = v26;

      _Block_object_dispose(&v42, 8);
    }
    else
    {
      id v18 = (id)MEMORY[0x1E4F1CC08];
    }
  }

  return v18;
}

void __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = v3 + 1;
      uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      uint64_t v6 = [v5 recordName];
      [v8 bindParam:v4 toNSString:v6];

      unint64_t v7 = [*(id *)(a1 + 32) count];
      unint64_t v3 = v4;
    }
    while (v7 > v4);
  }
}

uint64_t __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [*(id *)(a1 + 32) _createRecordFromSelectRow:a2 recordType:*(void *)(a1 + 40) unindexedDesiredKeys:*(void *)(a1 + 48) indexedDesiredKeys:*(void *)(a1 + 56) txn:*(void *)(a1 + 64) error:*(void *)(a1 + 88)];
  unint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 72);
    uint64_t v6 = [v3 recordID];
    [v5 setObject:v4 forKeyedSubscript:v6];

    unint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    unint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  }

  return *v7;
}

uint64_t __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke_3(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C10];
}

- (void)_processModifyRecordsOperation:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v59 = 0;
  long long v60 = &v59;
  uint64_t v61 = 0x3032000000;
  id v62 = __Block_byref_object_copy__1;
  id v63 = __Block_byref_object_dispose__1;
  id v64 = 0;
  uint64_t v5 = (void *)MEMORY[0x1E4F93BB0];
  db = self->_db;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __54__TRISQLiteCKDatabase__processModifyRecordsOperation___block_invoke;
  v55[3] = &unk_1E6BB8050;
  id v7 = v4;
  id v56 = v7;
  id v57 = self;
  id v58 = &v59;
  [v5 writeTransactionWithHandle:db failableBlock:v55];
  if (!v60[5])
  {
    id v8 = [v7 recordIDsToDelete];
    BOOL v9 = [v8 count] == 0;

    if (!v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v11 = [v7 recordIDsToDelete];
      uint64_t v12 = (void *)[v10 initWithArray:v11];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v13 = [v7 recordsToSave];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v67 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v52;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v52 != v15) {
              objc_enumerationMutation(v13);
            }
            id v17 = [*(id *)(*((void *)&v51 + 1) + 8 * v16) recordID];
            [v12 removeObject:v17];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v67 count:16];
        }
        while (v14);
      }

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v18 = v12;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v66 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v48;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v48 != v20) {
              objc_enumerationMutation(v18);
            }
            assetDir = self->_assetDir;
            long long v23 = [*(id *)(*((void *)&v47 + 1) + 8 * v21) recordName];
            id v24 = [(NSString *)assetDir stringByAppendingPathComponent:v23];

            int v25 = [MEMORY[0x1E4F28CB8] defaultManager];
            [v25 removeItemAtPath:v24 error:0];

            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v66 count:16];
        }
        while (v19);
      }
    }
  }
  id v26 = [v7 perRecordSaveBlock];

  if (v26)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v27 = objc_msgSend(v7, "recordsToSave", 0);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v44;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(v27);
          }
          id v31 = *(void **)(*((void *)&v43 + 1) + 8 * v30);
          id v32 = (void *)MEMORY[0x1E016E7F0]();
          id v33 = [v7 perRecordSaveBlock];
          id v34 = [v31 recordID];
          ((void (**)(void, void *, void *, void))v33)[2](v33, v34, v31, 0);

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v65 count:16];
      }
      while (v28);
    }
  }
  id v35 = [v7 modifyRecordsCompletionBlock];

  if (v35)
  {
    id v36 = (void *)MEMORY[0x1E016E7F0]();
    id v37 = [v7 modifyRecordsCompletionBlock];
    long long v38 = [v7 recordsToSave];
    long long v39 = [v7 recordIDsToDelete];
    ((void (**)(void, void *, void *, uint64_t))v37)[2](v37, v38, v39, v60[5]);
  }
  id v40 = [v7 completionBlock];

  if (v40)
  {
    id v41 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v42 = [v7 completionBlock];
    v42[2]();
  }

  _Block_object_dispose(&v59, 8);
}

uint64_t __54__TRISQLiteCKDatabase__processModifyRecordsOperation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) recordIDsToDelete];

  if (v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [*(id *)(a1 + 40) _allRecordTypes];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * v9);
          uint64_t v11 = (void *)MEMORY[0x1E016E7F0]();
          uint64_t v12 = *(void **)(a1 + 40);
          id v13 = [*(id *)(a1 + 32) recordIDsToDelete];
          [v12 _deleteRecordsWithRecordIds:v13 recordType:v10 txn:v3];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "recordsToSave", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        if (![*(id *)(a1 + 40) _upsertRecord:*(void *)(*((void *)&v21 + 1) + 8 * v18) txn:v3 error:*(void *)(*(void *)(a1 + 48) + 8) + 40])
        {
          uint64_t v19 = *MEMORY[0x1E4F93BF0];

          goto LABEL_20;
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = *MEMORY[0x1E4F93BE8];
LABEL_20:

  return v19;
}

- (void)_deleteRecordsWithRecordIds:(id)a3 recordType:(id)a4 txn:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 count])
  {
    uint64_t v12 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v10];
    if (!v12)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1516, @"Bad record type: %@", v10 object file lineNumber description];
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke;
    v23[3] = &unk_1E6BB84F0;
    id v13 = v10;
    id v24 = v13;
    id v14 = v9;
    id v25 = v14;
    id v15 = v11;
    id v26 = v15;
    [v12 enumerateKeysAndObjectsUsingBlock:v23];
    id v16 = [NSString alloc];
    [v14 count];
    uint64_t v17 = _PASQMarksSeparatedByCommas();
    uint64_t v18 = objc_msgSend(v16, "initWithFormat:", @" DELETE FROM     %@ WHERE     trisql_recordId IN (%@);",
                    v13,
                    v17);

    uint64_t v19 = [v15 db];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke_3;
    v21[3] = &unk_1E6BB7C50;
    id v22 = v14;
    [v19 prepAndRunQuery:v18 onPrep:v21 onRow:0 onError:0];
  }
}

void __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 firstObject];
  if (v6 == objc_opt_class())
  {
    id v7 = [NSString alloc];
    uint64_t v8 = *(void *)(a1 + 32);
    [*(id *)(a1 + 40) count];
    id v9 = _PASQMarksSeparatedByCommas();
    id v10 = objc_msgSend(v7, "initWithFormat:", @" DELETE FROM      %@_%@ WHERE     recordId IN (%@);",
                    v8,
                    v5,
                    v9);

    id v11 = [*(id *)(a1 + 48) db];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke_2;
    v12[3] = &unk_1E6BB7C50;
    id v13 = *(id *)(a1 + 40);
    [v11 prepAndRunQuery:v10 onPrep:v12 onRow:0 onError:0];
  }
}

void __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = v3 + 1;
      id v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      uint64_t v6 = [v5 recordName];
      [v8 bindParam:v4 toNSString:v6];

      unint64_t v7 = [*(id *)(a1 + 32) count];
      unint64_t v3 = v4;
    }
    while (v7 > v4);
  }
}

void __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = v3 + 1;
      id v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      uint64_t v6 = [v5 recordName];
      [v8 bindParam:v4 toNSString:v6];

      unint64_t v7 = [*(id *)(a1 + 32) count];
      unint64_t v3 = v4;
    }
    while (v7 > v4);
  }
}

- (BOOL)_upsertRecord:(id)a3 txn:(id)a4 error:(id *)a5
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v61 = a4;
  SEL v66 = v6;
  unint64_t v7 = [v6 recordType];
  uint64_t v65 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v7];

  if (v65)
  {
    id v64 = objc_opt_new();
    id v63 = objc_opt_new();
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v8 = [v6 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v93 objects:v97 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v94;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v94 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v93 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x1E016E7F0]();
        id v14 = [v66 objectForKeyedSubscript:v12];
        if (!v14)
        {
          uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1575, @"Invalid parameter not satisfying: %@", @"fieldValue" object file lineNumber description];
        }
        id v15 = [v65 objectForKeyedSubscript:v12];
        uint64_t v16 = [v15 firstObject];

        if (!v16) {
          break;
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v54 = [NSString alloc];
          unint64_t v55 = (objc_class *)objc_opt_class();
          long long v50 = NSStringFromClass(v55);
          long long v51 = [v66 recordType];
          id v53 = (id)[v54 initWithFormat:@"Can't modify record with unexpected type %@ for field %@ on record type %@.", v50, v12, v51];
          id v56 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v53];
          id v57 = *a5;
          *a5 = v56;

          goto LABEL_20;
        }
        if (v16 == objc_opt_class()) {
          uint64_t v17 = v63;
        }
        else {
          uint64_t v17 = v64;
        }
        [v17 setObject:v14 forKeyedSubscript:v12];

        if (v9 == ++v11)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v93 objects:v97 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }
      id v49 = [NSString alloc];
      long long v50 = [v66 recordType];
      long long v51 = (void *)[v49 initWithFormat:@"Can't modify record using unknown field %@ for record type %@.", v12, v50];
      long long v52 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v51];
      id v53 = *a5;
      *a5 = v52;
LABEL_20:

      BOOL v43 = 0;
      goto LABEL_21;
    }
LABEL_16:

    uint64_t v19 = objc_opt_new();
    uint64_t v20 = objc_opt_new();
    [v20 timeIntervalSinceReferenceDate];
    uint64_t v22 = v21;

    id v23 = objc_alloc(MEMORY[0x1E4F28E78]);
    id v24 = [NSString alloc];
    id v25 = [v66 recordType];
    id v26 = objc_msgSend(v24, "initWithFormat:", @" INSERT INTO %@(    trisql_recordId,     modificationDate,     creationDate"), v25;
    long long v27 = (void *)[v23 initWithString:v26];

    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke;
    v91[3] = &unk_1E6BB8478;
    id v28 = v66;
    id v92 = v28;
    uint64_t v29 = (void *)MEMORY[0x1E016EA80](v91);
    [v19 addObject:v29];

    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_2;
    v90[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
    v90[4] = v22;
    uint64_t v30 = (void *)MEMORY[0x1E016EA80](v90);
    [v19 addObject:v30];

    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_3;
    v89[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
    v89[4] = v22;
    uint64_t v31 = (void *)MEMORY[0x1E016EA80](v89);
    [v19 addObject:v31];

    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_4;
    v84[3] = &unk_1E6BB8540;
    id v32 = v27;
    id v85 = v32;
    id v33 = v19;
    id v86 = v33;
    id v87 = self;
    id v34 = v28;
    id v88 = v34;
    [v64 enumerateKeysAndObjectsUsingBlock:v84];
    [v64 count];
    id v35 = _PASQMarksSeparatedByCommas();
    [v32 appendFormat:@" VALUES (%@) ON CONFLICT (trisql_recordId) DO "], v35);

    id v36 = objc_opt_new();
    [v36 addObject:@"modificationDate = ?"];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_6;
    v83[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
    v83[4] = v22;
    id v37 = (void *)MEMORY[0x1E016EA80](v83);
    [v33 addObject:v37];

    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_7;
    v78[3] = &unk_1E6BB8540;
    id v79 = v36;
    id v38 = v33;
    id v80 = v38;
    id v81 = self;
    id v39 = v34;
    id v82 = v39;
    id v40 = v36;
    [v64 enumerateKeysAndObjectsUsingBlock:v78];
    [v32 appendString:@"UPDATE SET "];
    id v41 = [v40 componentsJoinedByString:@", "];
    [v32 appendString:v41];

    [v32 appendString:@";"];
    uint64_t v42 = [v61 db];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_9;
    v76[3] = &unk_1E6BB7C50;
    id v8 = v38;
    id v77 = v8;
    [v42 prepAndRunQuery:v32 onPrep:v76 onRow:0 onError:0];

    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x2020000000;
    char v75 = 1;
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_10;
    v67[3] = &unk_1E6BB8568;
    v67[4] = self;
    id v68 = v39;
    id v70 = &v72;
    id v71 = a5;
    id v69 = v61;
    [v63 enumerateKeysAndObjectsUsingBlock:v67];
    BOOL v43 = *((unsigned char *)v73 + 24) != 0;

    _Block_object_dispose(&v72, 8);
LABEL_21:
  }
  else
  {
    id v44 = [NSString alloc];
    long long v45 = [v6 recordType];
    long long v46 = (void *)[v44 initWithFormat:@"Can't modify record with unknown record type: %@", v45];
    long long v47 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v46];
    id v48 = *a5;
    *a5 = v47;

    BOOL v43 = 0;
  }

  return v43;
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [v4 recordID];
  id v6 = [v7 recordName];
  [v5 bindParam:a3 toNSString:v6];
}

uint64_t __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toDouble:", *(double *)(a1 + 32));
}

uint64_t __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toDouble:", *(double *)(a1 + 32));
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) appendFormat:@", %@", a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_5;
  v10[3] = &unk_1E6BB8518;
  id v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(a1 + 56);
  v10[4] = *(void *)(a1 + 48);
  id v11 = v5;
  id v12 = v7;
  id v8 = v5;
  uint64_t v9 = (void *)MEMORY[0x1E016EA80](v10);
  [v6 addObject:v9];
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_5(void *a1, void *a2, uint64_t a3)
{
  unint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = (void *)a1[6];
  id v7 = a2;
  id v8 = [v6 recordID];
  [v4 _bindParam:a3 toScalarValue:v5 forStatement:v7 recordId:v8];
}

uint64_t __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toDouble:", *(double *)(a1 + 32));
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_7(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)a1[4];
  id v7 = (objc_class *)NSString;
  id v8 = a2;
  uint64_t v9 = (void *)[[v7 alloc] initWithFormat:@"%@ = ?", v8];

  [v6 addObject:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_8;
  v14[3] = &unk_1E6BB8518;
  uint64_t v10 = (void *)a1[5];
  id v11 = (void *)a1[7];
  v14[4] = a1[6];
  id v15 = v5;
  id v16 = v11;
  id v12 = v5;
  id v13 = (void *)MEMORY[0x1E016EA80](v14);
  [v10 addObject:v13];
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_8(void *a1, void *a2, uint64_t a3)
{
  unint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = (void *)a1[6];
  id v7 = a2;
  id v8 = [v6 recordID];
  [v4 _bindParam:a3 toScalarValue:v5 forStatement:v7 recordId:v8];
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    int v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * i));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      v8 += i;
    }
    while (v6);
  }
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_10(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  int v8 = *(void **)(a1 + 40);
  id v9 = a3;
  id v10 = a2;
  long long v11 = [v8 recordType];
  long long v12 = [*(id *)(a1 + 40) recordID];
  LOBYTE(v7) = [v7 _replaceArrayFieldWithKey:v10 recordType:v11 recordId:v12 values:v9 txn:*(void *)(a1 + 48) error:*(void *)(a1 + 64)];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)_filenameForLocallyCopiedAsset:(id)a3 forRecordId:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E016E7F0]();
  long long v11 = [v8 assetContent];
  if (v11) {
    goto LABEL_2;
  }
  uint64_t v29 = [v8 fileURL];

  if (!v29)
  {
    id v33 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:@"CKAsset is missing a fileURL."];
    id v34 = *a5;
    *a5 = v33;

LABEL_15:
    id v25 = 0;
    goto LABEL_16;
  }
  id v30 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v31 = [v8 fileURL];
  id v42 = 0;
  long long v11 = (void *)[v30 initWithContentsOfURL:v31 options:1 error:&v42];
  id v32 = v42;

  if (!v11)
  {
    id v35 = (void *)[[NSString alloc] initWithFormat:@"Failed to read CKAsset file content: %@", v32];
    id v36 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v35];
    id v37 = *a5;
    *a5 = v36;

    goto LABEL_15;
  }

LABEL_2:
  id v39 = v10;
  assetDir = self->_assetDir;
  long long v13 = [v9 recordName];
  id v14 = [(NSString *)assetDir stringByAppendingPathComponent:v13];

  uint64_t v15 = objc_opt_new();
  id v16 = [v15 UUIDString];

  uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v41 = 0;
  char v18 = [v17 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v41];
  id v19 = v41;

  if ((v18 & 1) == 0)
  {
    uint64_t v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v44 = v19;
      _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Failed to create directory for asset: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v21 = [v14 stringByAppendingPathComponent:v16];
  id v40 = 0;
  char v22 = [v11 writeToFile:v21 options:0 error:&v40];
  id v23 = v40;
  id v24 = v23;
  if (v22)
  {

    id v25 = v16;
  }
  else
  {
    id v26 = (void *)[[NSString alloc] initWithFormat:@"Failed to save CKAsset to database storage: %@", v23];
    long long v27 = [(TRISQLiteCKDatabase *)self _errorWithCode:1 message:v26];
    id v28 = *a5;
    *a5 = v27;

    id v25 = 0;
  }
  id v10 = v39;

LABEL_16:

  return v25;
}

- (id)_assetForLocallyStoredAssetWithFilename:(id)a3 forRecordId:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  context = (void *)MEMORY[0x1E016E7F0]();
  id v9 = (void *)MEMORY[0x1E4F1CB10];
  assetDir = self->_assetDir;
  long long v11 = [v8 recordName];
  long long v12 = [(NSString *)assetDir stringByAppendingPathComponent:v11];
  long long v13 = [v9 fileURLWithPath:v12 isDirectory:1];

  id v14 = (void *)MEMORY[0x1E4F1CB10];
  assetCacheDir = self->_assetCacheDir;
  id v16 = [v8 recordName];
  uint64_t v17 = [(NSString *)assetCacheDir stringByAppendingPathComponent:v16];
  char v18 = [v14 fileURLWithPath:v17 isDirectory:1];

  id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v19 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 relativeToURL:v13];
  uint64_t v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 relativeToURL:v18];
  char v22 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v22 removeItemAtURL:v21 error:0];

  id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v33 = 0;
  char v24 = [v23 copyItemAtURL:v20 toURL:v21 error:&v33];
  id v25 = v33;

  if (v24)
  {
    id v26 = (void *)[objc_alloc(MEMORY[0x1E4F19E50]) initWithFileURL:v21];
  }
  else
  {
    long long v27 = (void *)[[NSString alloc] initWithFormat:@"Failed to copy asset into cache: %@", v25];
    id v28 = [(TRISQLiteCKDatabase *)self _errorWithCode:1 message:v27];
    id v29 = *a5;
    *a5 = v28;

    id v26 = 0;
  }

  return v26;
}

- (BOOL)_replaceArrayFieldWithKey:(id)a3 recordType:(id)a4 recordId:(id)a5 values:(id)a6 txn:(id)a7 error:(id *)a8
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v65 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:v16];
  uint64_t v20 = v19;
  if (!v19)
  {
    id v36 = (void *)[[NSString alloc] initWithFormat:@"Can't modify record with unknown record type: %@", v16];
    id v37 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v36];
    id v38 = *a8;
    *a8 = v37;

    BOOL v39 = 0;
    goto LABEL_29;
  }
  id v64 = v18;
  id v59 = v16;
  id v62 = v19;
  uint64_t v21 = [v19 objectForKeyedSubscript:v15];
  uint64_t v22 = [v21 firstObject];
  if (v22 != objc_opt_class() || (unint64_t)[v21 count] <= 1)
  {
    id v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 1791, @"Expected array type for %@", v15 object file lineNumber description];
  }
  SEL v57 = a2;
  id v60 = v15;
  id v63 = v21;
  id v23 = (objc_class *)[v21 objectAtIndexedSubscript:1];
  char v24 = objc_opt_new();
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v58 = v17;
  id v25 = v17;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v81 objects:v85 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v82;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v82 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v81 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v40 = [NSString alloc];
          id v41 = (objc_class *)objc_opt_class();
          id v42 = NSStringFromClass(v41);
          id v16 = v59;
          id v15 = v60;
          BOOL v43 = (void *)[v40 initWithFormat:@"Can't modify record of type %@ with unexpected contained type %@ for array field %@.", v59, v42, v60];
          id v44 = [(TRISQLiteCKDatabase *)self _errorWithCode:12 message:v43];
          id v45 = *a8;
          *a8 = v44;

          BOOL v39 = 0;
          id v17 = v58;
          goto LABEL_27;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v31 = [(TRISQLiteCKDatabase *)self _filenameForLocallyCopiedAsset:v30 forRecordId:v65 error:a8];
          if (!v31)
          {
            BOOL v39 = 0;
            id v16 = v59;
            id v15 = v60;
            id v17 = v58;
            goto LABEL_28;
          }
          id v32 = (void *)v31;
          [v24 addObject:v31];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v81 objects:v85 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }

  if (v23 == (objc_class *)objc_opt_class())
  {
    id v35 = &__block_literal_global_1;
    id v16 = v59;
    id v15 = v60;
  }
  else
  {
    id v16 = v59;
    id v15 = v60;
    if (v23 != (objc_class *)objc_opt_class())
    {
      id v17 = v58;
      if (v23 == (objc_class *)objc_opt_class())
      {
        v80[0] = 0;
        v80[1] = v80;
        v80[2] = 0x2020000000;
        v80[3] = 0;
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_3;
        v77[3] = &unk_1E6BB85B0;
        id v78 = v24;
        id v79 = v80;
        id v35 = (void *)MEMORY[0x1E016EA80](v77);

        _Block_object_dispose(v80, 8);
      }
      else if (v23 == (objc_class *)objc_opt_class())
      {
        id v35 = &__block_literal_global_470;
      }
      else
      {
        id v33 = [MEMORY[0x1E4F28B00] currentHandler];
        id v34 = NSStringFromClass(v23);
        [v33 handleFailureInMethod:v57, self, @"TRISQLiteCKDatabase.m", 1840, @"No support for binding array contained type %@", v34 object file lineNumber description];

        id v35 = 0;
      }
      goto LABEL_26;
    }
    id v35 = &__block_literal_global_468;
  }
  id v17 = v58;
LABEL_26:
  long long v46 = objc_msgSend([NSString alloc], "initWithFormat:", @" DELETE FROM     %@_%@ WHERE     recordId = :record_id;",
                  v16,
                  v15);
  long long v47 = [v64 db];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_5;
  v75[3] = &unk_1E6BB7C50;
  id v48 = v65;
  id v76 = v48;
  [v47 prepAndRunQuery:v46 onPrep:v75 onRow:0 onError:0];

  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_6;
  void v69[3] = &unk_1E6BB8600;
  id v49 = v16;
  id v70 = v49;
  id v50 = v15;
  id v71 = v50;
  id v51 = v64;
  id v72 = v51;
  id v52 = v48;
  id v73 = v52;
  id v74 = v35;
  id v61 = v35;
  [v25 enumerateObjectsUsingBlock:v69];
  id v53 = (void *)[[NSString alloc] initWithFormat:@" UPDATE %@ SET     %@ = :count WHERE trisql_recordId = :record_id", v49, v50];
  id v54 = [v51 db];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_8;
  v66[3] = &unk_1E6BB8628;
  id v67 = v25;
  id v68 = v52;
  [v54 prepAndRunQuery:v53 onPrep:v66 onRow:0 onError:0];

  BOOL v39 = 1;
  id v42 = v70;
  id v25 = v61;
LABEL_27:

LABEL_28:
  uint64_t v20 = v62;

  id v18 = v64;
LABEL_29:

  return v39;
}

uint64_t __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 bindNamedParam:":value" toNSString:a3];
}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  CFNumberRef number = a3;
  id v4 = a2;
  if (CFNumberIsFloatType(number))
  {
    [(__CFNumber *)number doubleValue];
    objc_msgSend(v4, "bindNamedParam:toDouble:", ":value");
  }
  else
  {
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":value", -[__CFNumber longLongValue](number, "longLongValue"));
  }
}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = a2;
  uint64_t v6 = [v3 objectAtIndexedSubscript:v4];
  [v5 bindNamedParam:":value" toNSString:v6];

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 bindNamedParam:":value" toNSData:a3];
}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 recordName];
  [v3 bindNamedParam:":record_id" toNSString:v4];
}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @" INSERT INTO %@_%@(    recordId, idx, value) VALUES(    :record_id, :index, :value);",
                 *(void *)(a1 + 32),
                 *(void *)(a1 + 40));
  id v7 = [*(id *)(a1 + 48) db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_7;
  v10[3] = &unk_1E6BB85D8;
  id v11 = *(id *)(a1 + 56);
  uint64_t v14 = a3;
  id v8 = *(id *)(a1 + 64);
  id v12 = v5;
  id v13 = v8;
  id v9 = v5;
  [v7 prepAndRunQuery:v6 onPrep:v10 onRow:0 onError:0];
}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_7(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v6 = a2;
  id v4 = [v3 recordName];
  [v6 bindNamedParam:":record_id" toNSString:v4];

  if (a1[7] >= 0x7FFFFFFFFFFFFFFFuLL) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v5 = a1[7];
  }
  [v6 bindNamedParam:":index" toInt64:v5];
  (*(void (**)(void))(a1[6] + 16))();
}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unint64_t v5 = [v3 count];
  if (v5 >= 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v6 = v5;
  }
  [v4 bindNamedParam:":count" toInt64:v6];
  id v7 = [*(id *)(a1 + 40) recordName];
  [v4 bindNamedParam:":record_id" toNSString:v7];
}

- (id)_allRecordTypes
{
  if (qword_1EA8D7F00 != -1) {
    dispatch_once(&qword_1EA8D7F00, &__block_literal_global_487);
  }
  uint64_t v2 = (void *)qword_1EA8D7EF8;
  return v2;
}

void __38__TRISQLiteCKDatabase__allRecordTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x1E016E7F0]();
  v1 = (void *)MEMORY[0x1E016E7F0]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E4FB0398], *MEMORY[0x1E4FB0490], *MEMORY[0x1E4FB02B0], *MEMORY[0x1E4FB0420], *MEMORY[0x1E4FB0448], *MEMORY[0x1E4FB02B8], *MEMORY[0x1E4FB0340], *MEMORY[0x1E4FB0310], 0);
  id v4 = (void *)qword_1EA8D7EF8;
  qword_1EA8D7EF8 = v3;
}

- (id)_valueTypesForFieldsOfRecordType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4FB0398]])
  {
    if (qword_1EA8D7F10 == -1)
    {
      id v4 = &qword_1EA8D7F08;
LABEL_25:
      id v5 = (id)*v4;
      goto LABEL_26;
    }
    id v4 = &qword_1EA8D7F08;
    id v7 = &qword_1EA8D7F10;
    id v8 = &__block_literal_global_490;
    goto LABEL_38;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4FB0490]])
  {
    if (qword_1EA8D7F20 == -1)
    {
      id v4 = &qword_1EA8D7F18;
      goto LABEL_25;
    }
    id v4 = &qword_1EA8D7F18;
    id v7 = &qword_1EA8D7F20;
    id v8 = &__block_literal_global_497;
LABEL_38:
    dispatch_once(v7, v8);
    goto LABEL_25;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4FB02B0]])
  {
    if (qword_1EA8D7F30 == -1)
    {
      id v4 = &qword_1EA8D7F28;
      goto LABEL_25;
    }
    id v4 = &qword_1EA8D7F28;
    id v7 = &qword_1EA8D7F30;
    id v8 = &__block_literal_global_500;
    goto LABEL_38;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4FB0420]])
  {
    if (qword_1EA8D7F40 == -1)
    {
      id v4 = &qword_1EA8D7F38;
      goto LABEL_25;
    }
    id v4 = &qword_1EA8D7F38;
    id v7 = &qword_1EA8D7F40;
    id v8 = &__block_literal_global_503;
    goto LABEL_38;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4FB0448]])
  {
    if (qword_1EA8D7F50 == -1)
    {
      id v4 = &qword_1EA8D7F48;
      goto LABEL_25;
    }
    id v4 = &qword_1EA8D7F48;
    id v7 = &qword_1EA8D7F50;
    id v8 = &__block_literal_global_506;
    goto LABEL_38;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4FB02B8]])
  {
    if (qword_1EA8D7F60 == -1)
    {
      id v4 = &qword_1EA8D7F58;
      goto LABEL_25;
    }
    id v4 = &qword_1EA8D7F58;
    id v7 = &qword_1EA8D7F60;
    id v8 = &__block_literal_global_509;
    goto LABEL_38;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4FB0340]])
  {
    if (qword_1EA8D7F70 == -1)
    {
      id v4 = &qword_1EA8D7F68;
      goto LABEL_25;
    }
    id v4 = &qword_1EA8D7F68;
    id v7 = &qword_1EA8D7F70;
    id v8 = &__block_literal_global_512;
    goto LABEL_38;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4FB0310]])
  {
    if (qword_1EA8D7F80 == -1)
    {
      id v4 = &qword_1EA8D7F78;
      goto LABEL_25;
    }
    id v4 = &qword_1EA8D7F78;
    id v7 = &qword_1EA8D7F80;
    id v8 = &__block_literal_global_515;
    goto LABEL_38;
  }
  id v5 = 0;
LABEL_26:

  return v5;
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke()
{
  v40[18] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E016E7F0]();
  v39[0] = @"modificationDate";
  uint64_t v38 = objc_opt_class();
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v40[0] = v19;
  v39[1] = @"creationDate";
  uint64_t v37 = objc_opt_class();
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v40[1] = v18;
  v39[2] = *MEMORY[0x1E4FB03A0];
  uint64_t v36 = objc_opt_class();
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v40[2] = v17;
  v39[3] = *MEMORY[0x1E4FB03D8];
  uint64_t v35 = objc_opt_class();
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v40[3] = v16;
  void v39[4] = *MEMORY[0x1E4FB03B0];
  uint64_t v34 = objc_opt_class();
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  void v40[4] = v15;
  void v39[5] = *MEMORY[0x1E4FB03A8];
  uint64_t v33 = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v40[5] = v14;
  v39[6] = *MEMORY[0x1E4FB03C8];
  uint64_t v32 = objc_opt_class();
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v40[6] = v13;
  v39[7] = *MEMORY[0x1E4FB03D0];
  uint64_t v31 = objc_opt_class();
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v40[7] = v12;
  v39[8] = *MEMORY[0x1E4FB0418];
  uint64_t v30 = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v40[8] = v0;
  v39[9] = *MEMORY[0x1E4FB03E8];
  uint64_t v29 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v40[9] = v1;
  v39[10] = *MEMORY[0x1E4FB03F0];
  uint64_t v28 = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v40[10] = v2;
  v39[11] = *MEMORY[0x1E4FB03E0];
  uint64_t v27 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v40[11] = v3;
  v39[12] = *MEMORY[0x1E4FB03F8];
  uint64_t v26 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v40[12] = v4;
  v39[13] = *MEMORY[0x1E4FB03B8];
  uint64_t v25 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v40[13] = v5;
  v39[14] = *MEMORY[0x1E4FB03C0];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v40[14] = v6;
  v39[15] = *MEMORY[0x1E4FB0400];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v40[15] = v7;
  v39[16] = *MEMORY[0x1E4FB0410];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v40[16] = v8;
  v39[17] = *MEMORY[0x1E4FB0408];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v40[17] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:18];
  id v11 = (void *)qword_1EA8D7F08;
  qword_1EA8D7F08 = v10;
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_2()
{
  v20[8] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E016E7F0]();
  v19[0] = @"modificationDate";
  uint64_t v18 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v20[0] = v1;
  v19[1] = @"creationDate";
  uint64_t v17 = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v20[1] = v2;
  v19[2] = *MEMORY[0x1E4FB04C0];
  uint64_t v16 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v20[2] = v3;
  v19[3] = *MEMORY[0x1E4FB04B0];
  uint64_t v15 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v20[3] = v4;
  v19[4] = *MEMORY[0x1E4FB04B8];
  uint64_t v14 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v20[4] = v5;
  v19[5] = *MEMORY[0x1E4FB04A8];
  uint64_t v13 = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  void v20[5] = v6;
  v19[6] = *MEMORY[0x1E4FB04A0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v20[6] = v7;
  v19[7] = *MEMORY[0x1E4FB0498];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v20[7] = v8;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, v19, 8, v11[0]);
  uint64_t v10 = (void *)qword_1EA8D7F18;
  qword_1EA8D7F18 = v9;
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_3()
{
  v16[6] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E016E7F0]();
  v15[0] = @"modificationDate";
  uint64_t v14 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v16[0] = v1;
  v15[1] = @"creationDate";
  uint64_t v13 = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v16[1] = v2;
  v15[2] = *MEMORY[0x1E4FB02F8];
  uint64_t v12 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v16[2] = v3;
  v15[3] = *MEMORY[0x1E4FB02F0];
  uint64_t v11 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v16[3] = v4;
  v15[4] = *MEMORY[0x1E4FB0300];
  uint64_t v10 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v16[4] = v5;
  v15[5] = *MEMORY[0x1E4FB0308];
  uint64_t v9 = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v16[5] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  id v8 = (void *)qword_1EA8D7F28;
  qword_1EA8D7F28 = v7;
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_4()
{
  v16[6] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E016E7F0]();
  v15[0] = @"modificationDate";
  uint64_t v14 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v16[0] = v1;
  v15[1] = @"creationDate";
  uint64_t v13 = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v16[1] = v2;
  v15[2] = *MEMORY[0x1E4FB0438];
  uint64_t v12 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v16[2] = v3;
  v15[3] = *MEMORY[0x1E4FB0430];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v16[3] = v4;
  v15[4] = *MEMORY[0x1E4FB0428];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v16[4] = v5;
  v15[5] = *MEMORY[0x1E4FB0440];
  uint64_t v9 = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v16[5] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  id v8 = (void *)qword_1EA8D7F38;
  qword_1EA8D7F38 = v7;
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_5()
{
  v24[10] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E016E7F0]();
  v23[0] = @"modificationDate";
  uint64_t v22 = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v24[0] = v0;
  v23[1] = @"creationDate";
  uint64_t v21 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v24[1] = v1;
  void v23[2] = *MEMORY[0x1E4FB0450];
  uint64_t v20 = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  void v24[2] = v2;
  v23[3] = *MEMORY[0x1E4FB0488];
  uint64_t v19 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v24[3] = v3;
  void v23[4] = *MEMORY[0x1E4FB0458];
  uint64_t v18 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v24[4] = v4;
  v23[5] = *MEMORY[0x1E4FB0478];
  uint64_t v17 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v24[5] = v5;
  v23[6] = *MEMORY[0x1E4FB0480];
  uint64_t v16 = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v24[6] = v6;
  v23[7] = *MEMORY[0x1E4FB0470];
  uint64_t v15 = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v24[7] = v7;
  v23[8] = *MEMORY[0x1E4FB0460];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v24[8] = v8;
  v23[9] = *MEMORY[0x1E4FB0468];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v24[9] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:10];
  uint64_t v11 = (void *)qword_1EA8D7F48;
  qword_1EA8D7F48 = v10;
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_6()
{
  v20[8] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E016E7F0]();
  v19[0] = @"modificationDate";
  uint64_t v18 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v20[0] = v1;
  v19[1] = @"creationDate";
  uint64_t v17 = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v20[1] = v2;
  v19[2] = *MEMORY[0x1E4FB02E0];
  uint64_t v16 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v20[2] = v3;
  v19[3] = *MEMORY[0x1E4FB02D8];
  uint64_t v15 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v20[3] = v4;
  v19[4] = *MEMORY[0x1E4FB02C8];
  uint64_t v14 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v20[4] = v5;
  v19[5] = *MEMORY[0x1E4FB02C0];
  uint64_t v13 = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  void v20[5] = v6;
  v19[6] = *MEMORY[0x1E4FB02D0];
  uint64_t v12 = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v20[6] = v7;
  v19[7] = *MEMORY[0x1E4FB02E8];
  uint64_t v11 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v20[7] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:8];
  uint64_t v10 = (void *)qword_1EA8D7F58;
  qword_1EA8D7F58 = v9;
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_7()
{
  v28[12] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E016E7F0]();
  v27[0] = @"modificationDate";
  uint64_t v26 = objc_opt_class();
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v28[0] = v13;
  v27[1] = @"creationDate";
  uint64_t v25 = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v28[1] = v12;
  v27[2] = *MEMORY[0x1E4FB0348];
  uint64_t v24 = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v28[2] = v11;
  v27[3] = *MEMORY[0x1E4FB0358];
  uint64_t v23 = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v28[3] = v0;
  v27[4] = *MEMORY[0x1E4FB0350];
  uint64_t v22 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v28[4] = v1;
  v27[5] = *MEMORY[0x1E4FB0388];
  uint64_t v21 = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v28[5] = v2;
  v27[6] = *MEMORY[0x1E4FB0390];
  uint64_t v20 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v28[6] = v3;
  v27[7] = *MEMORY[0x1E4FB0378];
  uint64_t v19 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v28[7] = v4;
  v27[8] = *MEMORY[0x1E4FB0370];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v28[8] = v5;
  v27[9] = *MEMORY[0x1E4FB0368];
  uint64_t v17 = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v28[9] = v6;
  v27[10] = *MEMORY[0x1E4FB0360];
  uint64_t v16 = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v28[10] = v7;
  v27[11] = *MEMORY[0x1E4FB0380];
  uint64_t v15 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v28[11] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:12];
  uint64_t v10 = (void *)qword_1EA8D7F68;
  qword_1EA8D7F68 = v9;
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_8()
{
  v18[7] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E016E7F0]();
  v17[0] = @"modificationDate";
  uint64_t v16 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v18[0] = v1;
  v17[1] = @"creationDate";
  uint64_t v15 = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v18[1] = v2;
  v17[2] = *MEMORY[0x1E4FB0328];
  uint64_t v14 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  void v18[2] = v3;
  v17[3] = *MEMORY[0x1E4FB0318];
  uint64_t v13 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v18[3] = v4;
  v17[4] = *MEMORY[0x1E4FB0320];
  uint64_t v12 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v18[4] = v5;
  v17[5] = *MEMORY[0x1E4FB0330];
  uint64_t v11 = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  void v18[5] = v6;
  v17[6] = *MEMORY[0x1E4FB0338];
  uint64_t v10 = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v18[6] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];
  uint64_t v9 = (void *)qword_1EA8D7F78;
  qword_1EA8D7F78 = v8;
}

- (id)_keysForFieldsOfRecordType:(id)a3
{
  id v3 = [(TRISQLiteCKDatabase *)self _valueTypesForFieldsOfRecordType:a3];
  id v4 = [v3 allKeys];
  id v5 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_518);

  return v5;
}

uint64_t __50__TRISQLiteCKDatabase__keysForFieldsOfRecordType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [&unk_1F347B258 containsObject:a2] ^ 1;
}

- (void)_bindParam:(int)a3 toScalarValue:(id)a4 forStatement:(id)a5 recordId:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 bindParam:v8 toNSString:v11];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v11;
      if (CFNumberIsFloatType((CFNumberRef)v14))
      {
        [v14 doubleValue];
        objc_msgSend(v12, "bindParam:toDouble:", v8);
      }
      else
      {
        objc_msgSend(v12, "bindParam:toInt64:", v8, objc_msgSend(v14, "longLongValue"));
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 timeIntervalSinceReferenceDate];
        objc_msgSend(v12, "bindParam:toDouble:", v8);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v12 bindParam:v8 toNSData:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = 0;
            uint64_t v15 = [(TRISQLiteCKDatabase *)self _filenameForLocallyCopiedAsset:v11 forRecordId:v13 error:&v20];
            if (!v15)
            {
              uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
              [v19 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 2064, @"Failed to copy asset to local storage: %@", v20 object file lineNumber description];
            }
            [v12 bindParam:v8 toNSString:v15];
          }
          else
          {
            uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v17 = (objc_class *)objc_opt_class();
            uint64_t v18 = NSStringFromClass(v17);
            [v16 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 2068, @"Binding scalar values of type %@ is not supported", v18 object file lineNumber description];
          }
        }
      }
    }
  }
}

- (id)_errorWithCode:(int64_t)a3 message:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  id v7 = [v5 alloc];
  uint64_t v8 = *MEMORY[0x1E4F19C40];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  v13[0] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  uint64_t v10 = (void *)[v7 initWithDomain:v8 code:a3 userInfo:v9];
  return v10;
}

- (BOOL)migrateToVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "TRISQLiteCKDatabase now performing migration.", buf, 2u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F93AF8]);
  v19[0] = self;
  BOOL v8 = 1;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v10 = (void *)[v7 initWithMigrationObjects:v9];

  uint64_t v11 = [v10 migrateDatabasesToVersion:v3];
  switch((int)v11)
  {
    case 0:
      uint64_t v12 = TRILogCategory_Server();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_WORD *)long long buf = 0;
      id v13 = "TRISQLiteCKDatabase could not perform migrations (device locked?), try again later.";
      goto LABEL_11;
    case 1:
      goto LABEL_14;
    case 2:
    case 4:
    case 5:
    case 6:
      uint64_t v12 = TRILogCategory_Server();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)long long buf = 67109120;
      int v18 = v11;
      id v13 = "TRISQLiteCKDatabase got an unexpected and unrecoverable migration result of %u. Database is considered corru"
            "pt and Trial storage will be reset on next launch.";
      id v14 = v12;
      uint32_t v15 = 8;
      break;
    case 3:
      uint64_t v12 = TRILogCategory_Server();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_WORD *)long long buf = 0;
      id v13 = "TRISQLiteCKDatabase has a future schema version, cannot use database.";
LABEL_11:
      id v14 = v12;
      uint32_t v15 = 2;
      break;
    default:
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabase.m", 2102, @"Unhandled migration result: %u", v11 object file lineNumber description];
      goto LABEL_13;
  }
  _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
LABEL_13:

  BOOL v8 = 0;
LABEL_14:

  return v8;
}

- (id)databaseHandle
{
  return self->_db;
}

- (id)_createTableForRecordType:(id)a3 scalarFields:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F28E78];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @" CREATE TABLE %@(    trisql_recordId TEXT PRIMARY KEY,     modificationDate REAL NOT NULL,     creationDate REAL NOT NULL"), v7;

  uint64_t v10 = (void *)[v8 initWithString:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __62__TRISQLiteCKDatabase__createTableForRecordType_scalarFields___block_invoke;
  v13[3] = &unk_1E6BB8670;
  id v11 = v10;
  id v14 = v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];

  [v11 appendString:@";"]);
  return v11;
}

uint64_t __62__TRISQLiteCKDatabase__createTableForRecordType_scalarFields___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@", %@ %@", a2, a3];
}

- (id)_createTableForArrayFieldWithKey:(id)a3 attachedToRecordType:(id)a4 sqliteContainedType:(id)a5
{
  id v7 = (objc_class *)NSString;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_msgSend([v7 alloc], "initWithFormat:", @" CREATE TABLE %@_%@(     rowid INTEGER PRIMARY KEY AUTOINCREMENT,      recordId TEXT NOT NULL,      idx INTEGER NOT NULL,      value %@ NOT NULL,      FOREIGN KEY (recordId) REFERENCES %@ (trisql_recordId),      UNIQUE (recordId, idx));",
                  v9,
                  v10,
                  v8,
                  v9);

  return v11;
}

- (id)migrations
{
  v109[4] = *MEMORY[0x1E4F143B8];
  v108[0] = &unk_1F347B4F8;
  uint64_t v3 = *MEMORY[0x1E4FB0398];
  uint64_t v4 = *MEMORY[0x1E4FB03D8];
  v101[0] = *MEMORY[0x1E4FB03A0];
  v101[1] = v4;
  v106[0] = @"REAL";
  v106[1] = @"TEXT";
  uint64_t v5 = *MEMORY[0x1E4FB03A8];
  v101[2] = *MEMORY[0x1E4FB03B0];
  v101[3] = v5;
  v106[2] = @"INTEGER";
  v106[3] = @"INTEGER";
  uint64_t v6 = *MEMORY[0x1E4FB03D0];
  v101[4] = *MEMORY[0x1E4FB03C8];
  v101[5] = v6;
  v106[4] = @"BLOB";
  v106[5] = @"TEXT";
  uint64_t v7 = *MEMORY[0x1E4FB03E8];
  v101[6] = *MEMORY[0x1E4FB0418];
  v101[7] = v7;
  v106[6] = @"BLOB";
  v106[7] = @"INTEGER";
  uint64_t v8 = *MEMORY[0x1E4FB03E0];
  v101[8] = *MEMORY[0x1E4FB03F0];
  v101[9] = v8;
  v106[8] = @"INTEGER";
  v106[9] = @"INTEGER";
  uint64_t v9 = *MEMORY[0x1E4FB03B8];
  v101[10] = *MEMORY[0x1E4FB03F8];
  v101[11] = v9;
  v106[10] = @"INTEGER";
  v106[11] = @"INTEGER";
  uint64_t v11 = *MEMORY[0x1E4FB0400];
  uint64_t v102 = *MEMORY[0x1E4FB03C0];
  uint64_t v10 = v102;
  uint64_t v103 = v11;
  v106[12] = @"INTEGER";
  v106[13] = @"INTEGER";
  uint64_t v13 = *MEMORY[0x1E4FB0408];
  uint64_t v104 = *MEMORY[0x1E4FB0410];
  uint64_t v12 = v104;
  uint64_t v105 = v13;
  v106[14] = @"INTEGER";
  v106[15] = @"INTEGER";
  id v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v101 count:16];
  id v76 = [(TRISQLiteCKDatabase *)self _createTableForRecordType:v3 scalarFields:v77];
  v107[0] = v76;
  char v75 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v10 attachedToRecordType:v3 sqliteContainedType:@"INTEGER"];
  v107[1] = v75;
  id v74 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v11 attachedToRecordType:v3 sqliteContainedType:@"INTEGER"];
  v107[2] = v74;
  id v73 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v12 attachedToRecordType:v3 sqliteContainedType:@"INTEGER"];
  v107[3] = v73;
  id v72 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v13 attachedToRecordType:v3 sqliteContainedType:@"TEXT"];
  v107[4] = v72;
  uint64_t v14 = *MEMORY[0x1E4FB0490];
  uint64_t v15 = *MEMORY[0x1E4FB04B0];
  v97[0] = *MEMORY[0x1E4FB04C0];
  v97[1] = v15;
  v100[0] = @"TEXT";
  v100[1] = @"BLOB";
  uint64_t v16 = *MEMORY[0x1E4FB04A8];
  v97[2] = *MEMORY[0x1E4FB04B8];
  v97[3] = v16;
  v100[2] = @"TEXT";
  v100[3] = @"BLOB";
  uint64_t v18 = *MEMORY[0x1E4FB0498];
  uint64_t v98 = *MEMORY[0x1E4FB04A0];
  uint64_t v17 = v98;
  uint64_t v99 = v18;
  v100[4] = @"INTEGER";
  v100[5] = @"INTEGER";
  id v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v97 count:6];
  id v70 = [(TRISQLiteCKDatabase *)self _createTableForRecordType:v14 scalarFields:v71];
  v107[5] = v70;
  id v69 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v17 attachedToRecordType:v14 sqliteContainedType:@"TEXT"];
  v107[6] = v69;
  id v68 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v18 attachedToRecordType:v14 sqliteContainedType:@"TEXT"];
  v107[7] = v68;
  id v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:8];
  v109[0] = v67;
  v108[1] = &unk_1F347B510;
  uint64_t v19 = *MEMORY[0x1E4FB02B0];
  uint64_t v20 = *MEMORY[0x1E4FB02F0];
  v94[0] = *MEMORY[0x1E4FB02F8];
  v94[1] = v20;
  v95[0] = @"TEXT";
  v95[1] = @"TEXT";
  uint64_t v21 = *MEMORY[0x1E4FB0308];
  v94[2] = *MEMORY[0x1E4FB0300];
  v94[3] = v21;
  v95[2] = @"TEXT";
  v95[3] = @"BLOB";
  SEL v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:4];
  id v65 = [(TRISQLiteCKDatabase *)self _createTableForRecordType:v19 scalarFields:v66];
  v96[0] = v65;
  uint64_t v22 = *MEMORY[0x1E4FB0420];
  uint64_t v23 = *MEMORY[0x1E4FB0440];
  v90[0] = *MEMORY[0x1E4FB0438];
  v90[1] = v23;
  v93[0] = @"TEXT";
  v93[1] = @"BLOB";
  uint64_t v25 = *MEMORY[0x1E4FB0428];
  uint64_t v91 = *MEMORY[0x1E4FB0430];
  uint64_t v24 = v91;
  uint64_t v92 = v25;
  v93[2] = @"INTEGER";
  v93[3] = @"INTEGER";
  id v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v90 count:4];
  id v63 = [(TRISQLiteCKDatabase *)self _createTableForRecordType:v22 scalarFields:v64];
  v96[1] = v63;
  id v62 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v24 attachedToRecordType:v22 sqliteContainedType:@"BLOB"];
  v96[2] = v62;
  id v61 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v25 attachedToRecordType:v22 sqliteContainedType:@"TEXT"];
  v96[3] = v61;
  uint64_t v26 = *MEMORY[0x1E4FB0448];
  uint64_t v27 = *MEMORY[0x1E4FB0488];
  v86[0] = *MEMORY[0x1E4FB0450];
  v86[1] = v27;
  v89[0] = @"REAL";
  v89[1] = @"TEXT";
  uint64_t v28 = *MEMORY[0x1E4FB0478];
  v86[2] = *MEMORY[0x1E4FB0458];
  v86[3] = v28;
  v89[2] = @"INTEGER";
  v89[3] = @"BLOB";
  uint64_t v29 = *MEMORY[0x1E4FB0470];
  v86[4] = *MEMORY[0x1E4FB0480];
  v86[5] = v29;
  v89[4] = @"TEXT";
  void v89[5] = @"BLOB";
  uint64_t v31 = *MEMORY[0x1E4FB0468];
  uint64_t v87 = *MEMORY[0x1E4FB0460];
  uint64_t v30 = v87;
  uint64_t v88 = v31;
  v89[6] = @"INTEGER";
  v89[7] = @"INTEGER";
  id v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v86 count:8];
  id v59 = [(TRISQLiteCKDatabase *)self _createTableForRecordType:v26 scalarFields:v60];
  v96[4] = v59;
  id v58 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v30 attachedToRecordType:v26 sqliteContainedType:@"TEXT"];
  void v96[5] = v58;
  SEL v57 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v31 attachedToRecordType:v26 sqliteContainedType:@"INTEGER"];
  v96[6] = v57;
  id v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:7];
  v109[1] = v56;
  v108[2] = &unk_1F347B528;
  uint64_t v32 = *MEMORY[0x1E4FB02B8];
  uint64_t v33 = *MEMORY[0x1E4FB02D8];
  v83[0] = *MEMORY[0x1E4FB02E0];
  v83[1] = v33;
  v84[0] = @"TEXT";
  v84[1] = @"TEXT";
  uint64_t v34 = *MEMORY[0x1E4FB02C0];
  v83[2] = *MEMORY[0x1E4FB02C8];
  v83[3] = v34;
  v84[2] = @"TEXT";
  v84[3] = @"TEXT";
  uint64_t v35 = *MEMORY[0x1E4FB02E8];
  v83[4] = *MEMORY[0x1E4FB02D0];
  void v83[5] = v35;
  void v84[4] = @"INTEGER";
  v84[5] = @"BLOB";
  unint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:6];
  id v54 = [(TRISQLiteCKDatabase *)self _createTableForRecordType:v32 scalarFields:v55];
  id v85 = v54;
  uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  v109[2] = v36;
  v108[3] = &unk_1F347B540;
  uint64_t v37 = *MEMORY[0x1E4FB0340];
  uint64_t v38 = *MEMORY[0x1E4FB0348];
  v80[0] = *MEMORY[0x1E4FB0350];
  v80[1] = v38;
  v81[0] = @"REAL";
  v81[1] = @"TEXT";
  uint64_t v39 = *MEMORY[0x1E4FB0388];
  v80[2] = *MEMORY[0x1E4FB0358];
  v80[3] = v39;
  v81[2] = @"INTEGER";
  v81[3] = @"BLOB";
  uint64_t v40 = *MEMORY[0x1E4FB0378];
  void v80[4] = *MEMORY[0x1E4FB0390];
  void v80[5] = v40;
  v81[4] = @"TEXT";
  void v81[5] = @"BLOB";
  uint64_t v41 = *MEMORY[0x1E4FB0380];
  v80[6] = *MEMORY[0x1E4FB0360];
  v80[7] = v41;
  v81[6] = @"INTEGER";
  v81[7] = @"INTEGER";
  uint64_t v42 = *MEMORY[0x1E4FB0370];
  v80[8] = *MEMORY[0x1E4FB0368];
  v80[9] = v42;
  v81[8] = @"TEXT";
  v81[9] = @"INTEGER";
  BOOL v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:10];
  id v44 = [(TRISQLiteCKDatabase *)self _createTableForRecordType:v37 scalarFields:v43];
  v82[0] = v44;
  id v45 = [(TRISQLiteCKDatabase *)self _createTableForArrayFieldWithKey:v42 attachedToRecordType:v37 sqliteContainedType:@"INTEGER"];
  v82[1] = v45;
  uint64_t v46 = *MEMORY[0x1E4FB0310];
  uint64_t v47 = *MEMORY[0x1E4FB0318];
  v78[0] = *MEMORY[0x1E4FB0328];
  v78[1] = v47;
  v79[0] = @"INTEGER";
  v79[1] = @"BLOB";
  uint64_t v48 = *MEMORY[0x1E4FB0330];
  v78[2] = *MEMORY[0x1E4FB0320];
  v78[3] = v48;
  v79[2] = @"TEXT";
  v79[3] = @"BLOB";
  void v78[4] = *MEMORY[0x1E4FB0338];
  v79[4] = @"INTEGER";
  id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:5];
  id v50 = [(TRISQLiteCKDatabase *)self _createTableForRecordType:v46 scalarFields:v49];
  v82[2] = v50;
  id v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];
  v109[3] = v51;
  id v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:4];

  return v52;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (TRISQLiteCKDatabaseDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (CKContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (CKContainer *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_assetCacheDir, 0);
  objc_storeStrong((id *)&self->_assetDir, 0);
  objc_storeStrong((id *)&self->_parentDir, 0);
}

@end