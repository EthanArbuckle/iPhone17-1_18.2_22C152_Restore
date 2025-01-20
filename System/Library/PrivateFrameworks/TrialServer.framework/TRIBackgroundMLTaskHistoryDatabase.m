@interface TRIBackgroundMLTaskHistoryDatabase
- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5;
- (BOOL)addRecord:(id)a3;
- (BOOL)enumerateRecordsNewerThanDate:(id)a3 block:(id)a4;
- (BOOL)expireRecordsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4;
- (TRIBackgroundMLTaskHistoryDatabase)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)getAllAllocationStatusesForBMLTId:(id)a3 deploymentId:(int)a4 factorPackSetId:(id)a5;
@end

@implementation TRIBackgroundMLTaskHistoryDatabase

- (TRIBackgroundMLTaskHistoryDatabase)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskHistoryDatabase.m", 31, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIBackgroundMLTaskHistoryDatabase;
  v7 = [(TRIBackgroundMLTaskHistoryDatabase *)&v11 init];
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
    [v9 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskHistoryDatabase.m", 47, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__TRIBackgroundMLTaskHistoryDatabase_addRecord___block_invoke;
  v10[3] = &unk_1E6BBDD18;
  v14 = &v15;
  objc_super v11 = @" INSERT INTO backgroundMlTaskHistory(    eventSecondsFromEpoch,     eventType,     backgroundMlTaskId,     deploymentId,     factorPackSetId) VALUES(    :timestamp,     :event_type,     :background_ml_task_id,     :deployment_id,     :factor_pack_set_id);";
  id v6 = v5;
  id v12 = v6;
  v13 = self;
  [(TRIBackgroundMLTaskHistoryDatabase *)self writeTransactionWithFailableBlock:v10];
  char v7 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __48__TRIBackgroundMLTaskHistoryDatabase_addRecord___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__TRIBackgroundMLTaskHistoryDatabase_addRecord___block_invoke_2;
  v10[3] = &unk_1E6BB7C50;
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v5 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 prepAndRunQuery:v4 onPrep:v10 onRow:0 onError:v5];

  LODWORD(a1) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v6 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  char v7 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (a1) {
    v8 = v7;
  }
  else {
    v8 = v6;
  }
  return *v8;
}

void __48__TRIBackgroundMLTaskHistoryDatabase_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 eventDate];
  [v5 timeIntervalSince1970];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp");

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":event_type", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  id v6 = [*(id *)(a1 + 32) backgroundMLTaskId];
  [v4 bindNamedParam:":background_ml_task_id" toNSString:v6];

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  id v7 = [*(id *)(a1 + 32) factorPackSetId];
  [v4 bindNamedParam:":factor_pack_set_id" toNSString:v7];
}

- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if ((v9 == 0) != (v10 == 0))
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskHistoryDatabase.m", 86, @"Invalid parameter not satisfying: %@", @"(whereClause == nil) == (bind == nil)" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskHistoryDatabase.m", 87, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  v13 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__TRIBackgroundMLTaskHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke;
  v22[3] = &unk_1E6BBDD40;
  id v14 = v9;
  id v23 = v14;
  id v15 = v10;
  SEL v28 = a2;
  v24 = self;
  id v25 = v15;
  id v16 = v12;
  id v26 = v16;
  v27 = &v29;
  uint64_t v17 = (void *)MEMORY[0x1E016EA80](v22);
  [(TRIBackgroundMLTaskHistoryDatabase *)self readTransactionWithFailableBlock:v17];
  char v18 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v29, 8);

  return v18;
}

uint64_t __86__TRIBackgroundMLTaskHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = [NSString alloc];
  id v6 = (__CFString *)a1[4];
  if (!v6) {
    id v6 = &stru_1F3455898;
  }
  id v7 = objc_msgSend(v5, "initWithFormat:", @" SELECT * FROM     backgroundMlTaskHistory %@ ORDER BY     eventSecondsFromEpoch ASC,     rowid ASC;",
                 v6);
  v8 = [v3 db];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __86__TRIBackgroundMLTaskHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v28[3] = &unk_1E6BB7E80;
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  uint64_t v30 = a1[9];
  v28[4] = v9;
  id v11 = v4;
  id v29 = v11;
  id v12 = [*(id *)(a1[5] + 8) generalErrorHandlerWithOutError:0];
  int v13 = [v8 prepAndRunQuery:v7 onPrep:v10 onRow:v28 onError:v12];

  char v27 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
LABEL_5:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v24 != v17) {
        objc_enumerationMutation(v14);
      }
      if (v27) {
        break;
      }
      (*(void (**)(void))(a1[7] + 16))();
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v16) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v13;
  v19 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  v20 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];

  if (v13) {
    v21 = v19;
  }
  else {
    v21 = v20;
  }
  return *v21;
}

uint64_t __86__TRIBackgroundMLTaskHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E016E7F0]();
  id v5 = [v3 getDoubleAsNSNumberForColumnName:"eventSecondsFromEpoch" table:0];
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"TRIBackgroundMLTaskHistoryDatabase.m" lineNumber:109 description:@"nil eventSecondsFromEpoch read from NOT NULL column"];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v5 doubleValue];
  id v7 = objc_msgSend(v6, "initWithTimeIntervalSince1970:");

  unsigned __int8 v8 = [v3 getInt64ForColumnName:"eventType" table:0];
  uint64_t v9 = [v3 getNSStringForColumnName:"backgroundMlTaskId" table:0];
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"TRIBackgroundMLTaskHistoryDatabase.m" lineNumber:115 description:@"Unexpected NULL backgroundMLTaskId"];
  }
  uint64_t v10 = [v3 getInt64ForColumnName:"deploymentId" table:0];
  id v11 = [v3 getNSStringForColumnName:"factorPackSetId" table:0];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB0088]) initWithEventDate:v7 eventType:v8 backgroundMLTaskId:v9 deploymentId:v10 factorPackSetId:v11];
  [*(id *)(a1 + 40) addObject:v12];
  int v13 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v13;
}

- (id)getAllAllocationStatusesForBMLTId:(id)a3 deploymentId:(int)a4 factorPackSetId:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskHistoryDatabase.m", 156, @"Invalid parameter not satisfying: %@", @"bmltId" object file lineNumber description];
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  id v11 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke;
  v18[3] = &unk_1E6BBDD68;
  long long v23 = v25;
  id v12 = v9;
  id v19 = v12;
  int v24 = a4;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  v22 = self;
  [(TRIBackgroundMLTaskHistoryDatabase *)self readTransactionWithFailableBlock:v18];
  id v15 = v14;

  _Block_object_dispose(v25, 8);
  return v15;
}

uint64_t __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_2;
  v11[3] = &unk_1E6BB9AF8;
  id v12 = *(id *)(a1 + 32);
  int v14 = *(_DWORD *)(a1 + 72);
  id v13 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_3;
  v9[3] = &unk_1E6BBB580;
  id v10 = *(id *)(a1 + 48);
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 56) + 8), "generalErrorHandlerWithOutError:", 0, v9[0], 3221225472, __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_3, &unk_1E6BBB580);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 prepAndRunQuery:@"SELECT * FROM backgroundMlTaskHistory WHERE         backgroundMlTaskId = :background_ml_task_id    AND deploymentId = :deployment_id    AND factorPackSetId = :factor_pack_set_id ORDER BY rowid DESC" onPrep:v11 onRow:v9 onError:v4];

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

void __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":background_ml_task_id" toNSString:v3];
  [v4 bindNamedParam:":deployment_id" toInt64:*(int *)(a1 + 48)];
  [v4 bindNamedParam:":factor_pack_set_id" toNSString:*(void *)(a1 + 40)];
}

uint64_t __101__TRIBackgroundMLTaskHistoryDatabase_getAllAllocationStatusesForBMLTId_deploymentId_factorPackSetId___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 v3 = [a2 getInt64ForColumnName:"eventType" table:"backgroundMlTaskHistory"];
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedChar:v3];
  [v4 addObject:v5];

  return *MEMORY[0x1E4F93C08];
}

- (BOOL)enumerateRecordsNewerThanDate:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskHistoryDatabase.m", 190, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskHistoryDatabase.m", 191, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__TRIBackgroundMLTaskHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke;
  v15[3] = &unk_1E6BB7C50;
  id v16 = v7;
  id v10 = v7;
  BOOL v11 = [(TRIBackgroundMLTaskHistoryDatabase *)self _enumerateRecordsMatchingWhereClause:@" WHERE eventSecondsFromEpoch > :threshold" bind:v15 block:v9];

  return v11;
}

void __74__TRIBackgroundMLTaskHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":threshold");
}

- (BOOL)expireRecordsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4
{
  id v7 = a3;
  if (!v7)
  {
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskHistoryDatabase.m", 205, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__TRIBackgroundMLTaskHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke;
  v12[3] = &unk_1E6BB7E08;
  id v8 = v7;
  id v13 = v8;
  int v14 = self;
  id v15 = &v17;
  id v16 = a4;
  [(TRIBackgroundMLTaskHistoryDatabase *)self writeTransactionWithFailableBlock:v12];
  char v9 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __78__TRIBackgroundMLTaskHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__TRIBackgroundMLTaskHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2;
  v13[3] = &unk_1E6BB7C50;
  id v14 = *(id *)(a1 + 32);
  id v4 = (void *)MEMORY[0x1E016EA80](v13);
  id v5 = [v3 db];
  id v6 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
  int v7 = [v5 prepAndRunQuery:@" DELETE FROM     backgroundMLTaskHistory WHERE         eventSecondsFromEpoch < :threshold" onPrep:v4 onRow:0 onError:v6];

  if (v7)
  {
    id v8 = [v3 db];
    int v9 = sqlite3_changes((sqlite3 *)[v8 handle]);

    id v10 = *(void **)(a1 + 56);
    if (v10) {
      void *v10 = v9;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    BOOL v11 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    BOOL v11 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v11;
}

void __78__TRIBackgroundMLTaskHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2(uint64_t a1, void *a2)
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