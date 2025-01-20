@interface TRIRolloutHistoryDatabase
- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5;
- (BOOL)addRecord:(id)a3;
- (BOOL)enumerateRecordsNewerThanDate:(id)a3 block:(id)a4;
- (BOOL)expireRecordsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4;
- (TRIRolloutHistoryDatabase)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)getAllAllocationStatusesForRolloutId:(id)a3 rampId:(id)a4 deploymentId:(int)a5 factorPackSetId:(id)a6;
@end

@implementation TRIRolloutHistoryDatabase

- (TRIRolloutHistoryDatabase)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIRolloutHistoryDatabase.m", 32, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIRolloutHistoryDatabase;
  v7 = [(TRIRolloutHistoryDatabase *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_db, a3);
  }

  return v8;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db readTransactionWithFailableBlock:a3];
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db writeTransactionWithFailableBlock:a3];
}

- (BOOL)addRecord:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRIRolloutHistoryDatabase.m", 48, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__TRIRolloutHistoryDatabase_addRecord___block_invoke;
  v10[3] = &unk_1E6BB7CA0;
  objc_super v11 = @" INSERT INTO rolloutHistory(    eventLogTime,     eventType,     rolloutId,     rampId,     deploymentId,     factorPackSetId) VALUES(    :event_log_time,     :event_type,     :rollout_id,     :ramp_id,     :dep_id,     :fps_id);";
  id v6 = v5;
  id v12 = v6;
  v13 = self;
  v14 = &v15;
  [(TRIRolloutHistoryDatabase *)self writeTransactionWithFailableBlock:v10];
  char v7 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __39__TRIRolloutHistoryDatabase_addRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 db];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __39__TRIRolloutHistoryDatabase_addRecord___block_invoke_2;
  v30[3] = &unk_1E6BB7C50;
  uint64_t v5 = *(void *)(a1 + 32);
  id v31 = *(id *)(a1 + 40);
  id v6 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
  LOBYTE(v5) = [v4 prepAndRunQuery:v5 onPrep:v30 onRow:0 onError:v6];

  if (v5)
  {
    char v7 = [v3 db];
    uint64_t v24 = [v7 lastInsertRowId];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [*(id *)(a1 + 40) namespaces];
    uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v23 = *(void *)v27;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * v10);
          id v12 = (void *)MEMORY[0x1E016E7F0]();
          id v13 = v3;
          v14 = [v3 db];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __39__TRIRolloutHistoryDatabase_addRecord___block_invoke_3;
          v25[3] = &unk_1E6BB7C78;
          v25[4] = v11;
          v25[5] = v24;
          uint64_t v15 = a1;
          v16 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
          char v17 = objc_msgSend(v14, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO rolloutHistoryNamespaces(    rolloutHistory_rowid,     name) VALUES(    :rollout_rowid,     :name);",
                  v25,
                  0,
                  v16);

          if ((v17 & 1) == 0)
          {
            v20 = TRILogCategory_Server();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218243;
              uint64_t v33 = v24;
              __int16 v34 = 2113;
              uint64_t v35 = v11;
              _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_INFO, "TRIRolloutHistoryDatabase failed to insert rowId: %lld, namespace name:%{private}@", buf, 0x16u);
            }

            uint64_t v19 = *MEMORY[0x1E4F93BF0];

            id v3 = v13;
            goto LABEL_16;
          }
          ++v10;
          id v3 = v13;
          a1 = v15;
        }
        while (v9 != v10);
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    char v18 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    char v18 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  uint64_t v19 = *v18;
LABEL_16:

  return v19;
}

void __39__TRIRolloutHistoryDatabase_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 eventLogTime];
  [v5 timeIntervalSince1970];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":event_log_time");

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":event_type", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  id v6 = [*(id *)(a1 + 32) rolloutId];
  [v4 bindNamedParam:":rollout_id" toNSString:v6];

  char v7 = [*(id *)(a1 + 32) rampId];
  [v4 bindNamedParam:":ramp_id" toNSString:v7];

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":dep_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  id v8 = [*(id *)(a1 + 32) factorPackSetId];
  [v4 bindNamedParam:":fps_id" toNSString:v8];
}

void __39__TRIRolloutHistoryDatabase_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":rollout_rowid" toInt64:v3];
  [v4 bindNamedParam:":name" toNSString:*(void *)(a1 + 32)];
}

- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if ((v9 == 0) != (v10 == 0))
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"TRIRolloutHistoryDatabase.m", 122, @"Invalid parameter not satisfying: %@", @"(whereClause == nil) == (bind == nil)" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRIRolloutHistoryDatabase.m", 123, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  context = (void *)MEMORY[0x1E016E7F0]();
  id v13 = objc_opt_new();
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  id v64 = 0;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke;
  v58[3] = &unk_1E6BB7CC8;
  v58[4] = &v59;
  v14 = (void *)MEMORY[0x1E016EA80](v58);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v54[3] = &unk_1E6BB7CF0;
  v57 = &v59;
  id v15 = v13;
  id v55 = v15;
  id v16 = v12;
  id v56 = v16;
  char v17 = (void *)MEMORY[0x1E016EA80](v54);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_3;
  v52[3] = &unk_1E6BB7D18;
  id v53 = v15;
  id v18 = v15;
  uint64_t v19 = (void *)MEMORY[0x1E016EA80](v52);

  _Block_object_dispose(&v59, 8);
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  LOBYTE(v62) = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  unint64_t v51 = 0x8000000000000000;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_4;
  v41[3] = &unk_1E6BB7D40;
  v45 = &v48;
  id v20 = v17;
  v46 = &v59;
  SEL v47 = a2;
  v41[4] = self;
  id v42 = v20;
  id v21 = v14;
  id v43 = v21;
  id v22 = v19;
  id v44 = v22;
  uint64_t v23 = (void *)MEMORY[0x1E016EA80](v41);

  _Block_object_dispose(&v48, 8);
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  LOBYTE(v51) = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_5;
  v33[3] = &unk_1E6BB7D68;
  id v24 = v9;
  id v34 = v24;
  id v25 = v10;
  id v36 = v25;
  id v26 = v23;
  id v37 = v26;
  uint64_t v35 = self;
  id v27 = v20;
  id v38 = v27;
  v39 = &v59;
  v40 = &v48;
  [(TRIRolloutHistoryDatabase *)self readTransactionWithFailableBlock:v33];
  char v28 = *((unsigned char *)v49 + 24);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v59, 8);

  return v28;
}

void __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3)
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) copy];
    id v6 = (void *)[v3 copyWithReplacementNamespaces:v5];

    if (!*a2) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
  id v9 = *(void **)(a1 + 32);
  return [v9 removeAllObjects];
}

uint64_t __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"rowid" table:"rolloutHistory"];
  if (v4 != *(void *)(*(void *)(a1[8] + 8) + 24))
  {
    (*(void (**)(void))(a1[5] + 16))();
    if (*(unsigned char *)(*(void *)(a1[9] + 8) + 24))
    {
      uint64_t v5 = *MEMORY[0x1E4F93C10];
      goto LABEL_12;
    }
    id v6 = [v3 getDoubleAsNSNumberForColumnName:"eventLogTime" table:"rolloutHistory"];
    if (!v6)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a1[10] object:a1[4] file:@"TRIRolloutHistoryDatabase.m" lineNumber:176 description:@"nil eventLogTime read from NOT NULL column"];
    }
    id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v6 doubleValue];
    id v8 = objc_msgSend(v7, "initWithTimeIntervalSince1970:");

    unsigned __int8 v9 = [v3 getInt64ForColumnName:"eventType" table:"rolloutHistory"];
    id v10 = [v3 getNSStringForColumnName:"rolloutId" table:"rolloutHistory"];
    if (!v10)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a1[10] object:a1[4] file:@"TRIRolloutHistoryDatabase.m" lineNumber:181 description:@"nil rolloutId read from NOT NULL column"];
    }
    id v11 = [v3 getNSStringForColumnName:"rampId" table:"rolloutHistory"];
    uint64_t v12 = [v3 getInt64ForColumnName:"deploymentId" table:"rolloutHistory"];
    id v13 = [v3 getNSStringForColumnName:"factorPackSetId" table:"rolloutHistory"];
    id v14 = objc_alloc(MEMORY[0x1E4FB0238]);
    id v15 = (void *)[v14 initWithEventLogTime:v8 eventType:v9 rolloutId:v10 rampId:v11 factorPackSetId:v13 deploymentId:v12 namespaces:MEMORY[0x1E4F1CBF0]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v16 = [v3 getNSStringForColumnName:"name" table:"rolloutHistoryNamespaces"];
  if (v16) {
    (*(void (**)(void))(a1[7] + 16))();
  }
  *(void *)(*(void *)(a1[8] + 8) + 24) = v4;
  uint64_t v5 = *MEMORY[0x1E4F93C08];

LABEL_12:
  return v5;
}

uint64_t __77__TRIRolloutHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_5(void *a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = (__CFString *)a1[4];
  if (!v6) {
    id v6 = &stru_1F3455898;
  }
  id v7 = objc_msgSend(v5, "initWithFormat:", @" SELECT * FROM     rolloutHistory AS rh LEFT JOIN     rolloutHistoryNamespaces AS n ON     rh.rowid = n.rolloutHistory_rowid %@ ORDER BY     rh.eventLogTime ASC,     n.rowid ASC;",
                 v6);
  id v8 = [v4 db];

  uint64_t v10 = a1[6];
  uint64_t v9 = a1[7];
  id v11 = [*(id *)(a1[5] + 8) generalErrorHandlerWithOutError:0];
  LODWORD(v9) = [v8 prepAndRunQuery:v7 onPrep:v10 onRow:v9 onError:v11];

  if (v9)
  {
    (*(void (**)(void))(a1[8] + 16))();
    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 1;
    uint64_t v12 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 0;
    id v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_INFO, "TRIRolloutHistoryDatabase failed to enumerate records", buf, 2u);
    }

    uint64_t v12 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v12;
}

- (BOOL)enumerateRecordsNewerThanDate:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIRolloutHistoryDatabase.m", 242, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIRolloutHistoryDatabase.m", 243, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__TRIRolloutHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke;
  v15[3] = &unk_1E6BB7C50;
  id v16 = v7;
  id v10 = v7;
  BOOL v11 = [(TRIRolloutHistoryDatabase *)self _enumerateRecordsMatchingWhereClause:@" WHERE rh.eventLogTime > :threshold" bind:v15 block:v9];

  return v11;
}

void __65__TRIRolloutHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":threshold");
}

- (id)getAllAllocationStatusesForRolloutId:(id)a3 rampId:(id)a4 deploymentId:(int)a5 factorPackSetId:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIRolloutHistoryDatabase.m", 259, @"Invalid parameter not satisfying: %@", @"rolloutId" object file lineNumber description];
  }
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = "rolloutHistory";
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  uint64_t v33 = __Block_byref_object_dispose_;
  id v34 = (id)objc_opt_new();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke;
  v20[3] = &unk_1E6BB7DE0;
  id v25 = v36;
  id v14 = v11;
  id v21 = v14;
  id v15 = v12;
  id v22 = v15;
  int v28 = a5;
  id v16 = v13;
  id v26 = v35;
  id v27 = &v29;
  id v23 = v16;
  id v24 = self;
  [(TRIRolloutHistoryDatabase *)self readTransactionWithFailableBlock:v20];
  id v17 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v36, 8);

  return v17;
}

uint64_t __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_2;
  v10[3] = &unk_1E6BB7D90;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  int v14 = *(_DWORD *)(a1 + 88);
  id v13 = *(id *)(a1 + 48);
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0, MEMORY[0x1E4F143A8], 3221225472, __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_3, &unk_1E6BB7DB8, *(void *)(a1 + 72), *(void *)(a1 + 80), v10[0], 3221225472, __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_2, &unk_1E6BB7D90);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 prepAndRunQuery:@"SELECT * FROM rolloutHistory WHERE         rolloutId = :rollout_id    AND rampId = :ramp_id    AND deploymentId = :deployment_id    AND factorPackSetId = :factor_pack_set_id ORDER BY rowid DESC" onPrep:v10 onRow:&v9 onError:v4];

  LODWORD(a1) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  id v6 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (a1) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  return *v7;
}

void __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":rollout_id" toNSString:v3];
  [v4 bindNamedParam:":ramp_id" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":deployment_id" toInt64:*(int *)(a1 + 56)];
  [v4 bindNamedParam:":factor_pack_set_id" toNSString:*(void *)(a1 + 48)];
}

uint64_t __102__TRIRolloutHistoryDatabase_getAllAllocationStatusesForRolloutId_rampId_deploymentId_factorPackSetId___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 v3 = [a2 getInt64ForColumnName:"eventType" table:"rolloutHistory"];
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [NSNumber numberWithUnsignedChar:v3];
  [v4 addObject:v5];

  return *MEMORY[0x1E4F93C08];
}

- (BOOL)expireRecordsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIRolloutHistoryDatabase.m", 294, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__TRIRolloutHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke;
  v12[3] = &unk_1E6BB7E08;
  v12[4] = self;
  id v8 = v7;
  int v14 = &v16;
  id v15 = a4;
  id v13 = v8;
  [(TRIRolloutHistoryDatabase *)self writeTransactionWithFailableBlock:v12];
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __69__TRIRolloutHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __69__TRIRolloutHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2;
  id v27 = &unk_1E6BB7C50;
  id v28 = *(id *)(a1 + 40);
  id v5 = [v4 createTempTableContainingRowsFromQuery:@" SELECT rowid FROM         rolloutHistory WHERE         eventLogTime < :threshold" bind:&v24 namePrefix:@"remove_hist_rowids" transaction:v3];

  if (!v5)
  {
    uint64_t v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      [*(id *)(a1 + 40) timeIntervalSince1970];
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v19;
      _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_INFO, "TRIRolloutHistoryDatabase: failed to expire records for threshold date: %f", buf, 0xCu);
    }

    goto LABEL_11;
  }
  id v6 = [NSString alloc];
  id v7 = objc_msgSend(v6, "initWithFormat:", @" DELETE FROM     rolloutHistoryNamespaces WHERE     rolloutHistory_rowid IN %@;",
                 v5,
                 v24,
                 v25,
                 v26,
                 v27);
  id v8 = [v3 db];
  char v9 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
  char v10 = [v8 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:v9];

  if ((v10 & 1) == 0)
  {
    id v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v22 = "TRIRolloutHistoryDatabase: failed to delete row from RolloutHistoryNamespaces";
LABEL_17:
      _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
    }
LABEL_18:

    uint64_t v20 = *MEMORY[0x1E4F93BF0];
    goto LABEL_19;
  }

  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @" DELETE FROM     rolloutHistory WHERE     rowid IN %@;",
                 v5);
  id v11 = [v3 db];
  id v12 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
  char v13 = [v11 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:v12];

  if ((v13 & 1) == 0)
  {
    id v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v22 = "RolloutHistoryDatabase: Failed to delete row from rolloutHistory";
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  id v14 = [v3 db];
  int v15 = sqlite3_changes((sqlite3 *)[v14 handle]);

  if ([*(id *)(*(void *)(a1 + 32) + 8) dropTableWithName:v5 transaction:v3])
  {
    uint64_t v16 = *(void **)(a1 + 56);
    if (v16) {
      void *v16 = v15;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v17 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    goto LABEL_12;
  }
LABEL_11:
  id v17 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
LABEL_12:
  uint64_t v20 = *v17;
LABEL_19:

  return v20;
}

void __69__TRIRolloutHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":threshold");
}

- (void).cxx_destruct
{
}

@end