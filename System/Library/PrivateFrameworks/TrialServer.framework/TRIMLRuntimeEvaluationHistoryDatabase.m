@interface TRIMLRuntimeEvaluationHistoryDatabase
- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5;
- (BOOL)addRecord:(id)a3 usingTransaction:(id)a4;
- (BOOL)enumerateRecordsNewerThanDate:(id)a3 block:(id)a4;
- (BOOL)expireRecordsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4;
- (TRIMLRuntimeEvaluationHistoryDatabase)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
@end

@implementation TRIMLRuntimeEvaluationHistoryDatabase

- (TRIMLRuntimeEvaluationHistoryDatabase)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIMLRuntimeEvaluationHistoryDatabase.m", 32, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIMLRuntimeEvaluationHistoryDatabase;
  v7 = [(TRIMLRuntimeEvaluationHistoryDatabase *)&v11 init];
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

- (BOOL)addRecord:(id)a3 usingTransaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIMLRuntimeEvaluationHistoryDatabase.m", 49, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  v9 = [v7 evaluation];
  v10 = [v9 data];

  if (!v10)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRIMLRuntimeEvaluationHistoryDatabase.m", 51, @"Expression was unexpectedly nil/false: %@", @"[record.evaluation data]" object file lineNumber description];
  }
  objc_super v11 = (void *)MEMORY[0x1E4F28DB0];
  v12 = [v7 status];
  v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];

  if (!v13)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRIMLRuntimeEvaluationHistoryDatabase.m", 54, @"Expression was unexpectedly nil/false: %@", @"[NSKeyedArchiver archivedDataWithRootObject:record.status requiringSecureCoding:YES error:nil]" object file lineNumber description];
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__TRIMLRuntimeEvaluationHistoryDatabase_addRecord_usingTransaction___block_invoke;
  v24[3] = &unk_1E6BB8DE0;
  v30 = &v31;
  v25 = @" INSERT OR REPLACE INTO mlRuntimeEvaluationStatusHistory(    evaluationId,     eventSecondsFromEpoch,     serializedMLRuntimeEvaluation,     serializedEvaluationStatus) VALUES(    :evaluation_id,     :timestamp,     :eval_data,     :status_data);";
  id v14 = v7;
  id v26 = v14;
  id v15 = v10;
  id v27 = v15;
  id v16 = v13;
  id v28 = v16;
  v29 = self;
  uint64_t v17 = MEMORY[0x1E016EA80](v24);
  v18 = (void *)v17;
  if (v8) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v8);
  }
  else {
    [(TRIMLRuntimeEvaluationHistoryDatabase *)self writeTransactionWithFailableBlock:v17];
  }
  if (*((unsigned char *)v32 + 24))
  {
    notify_post("com.apple.trial.shadow-evaluation.mlruntime.status-change");
    BOOL v19 = *((unsigned char *)v32 + 24) != 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v19;
}

uint64_t __68__TRIMLRuntimeEvaluationHistoryDatabase_addRecord_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__TRIMLRuntimeEvaluationHistoryDatabase_addRecord_usingTransaction___block_invoke_2;
  v10[3] = &unk_1E6BB7EF8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  v5 = [*(id *)(*(void *)(a1 + 64) + 8) generalErrorHandlerWithOutError:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v3 prepAndRunQuery:v4 onPrep:v10 onRow:0 onError:v5];

  LODWORD(a1) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  id v6 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (a1) {
    id v8 = v7;
  }
  else {
    id v8 = v6;
  }
  return *v8;
}

void __68__TRIMLRuntimeEvaluationHistoryDatabase_addRecord_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v4 = [v3 evaluation];
  v5 = [v4 evaluationId];
  [v8 bindNamedParam:":evaluation_id" toNSString:v5];

  id v6 = [*(id *)(a1 + 32) status];
  id v7 = [v6 date];
  [v7 timeIntervalSince1970];
  objc_msgSend(v8, "bindNamedParam:toDouble:", ":timestamp");

  [v8 bindNamedParam:":eval_data" toNSData:*(void *)(a1 + 40)];
  [v8 bindNamedParam:":status_data" toNSData:*(void *)(a1 + 48)];
}

- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if ((v9 == 0) != (v10 == 0))
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRIMLRuntimeEvaluationHistoryDatabase.m", 100, @"Invalid parameter not satisfying: %@", @"(whereClause == nil) == (bind == nil)" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIMLRuntimeEvaluationHistoryDatabase.m", 101, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__TRIMLRuntimeEvaluationHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke;
  v20[3] = &unk_1E6BB8E30;
  id v13 = v9;
  SEL v26 = a2;
  id v21 = v13;
  v22 = self;
  id v14 = v12;
  id v23 = v14;
  v25 = &v27;
  id v15 = v10;
  id v24 = v15;
  [(TRIMLRuntimeEvaluationHistoryDatabase *)self readTransactionWithFailableBlock:v20];
  char v16 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v16;
}

uint64_t __89__TRIMLRuntimeEvaluationHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke(void *a1, void *a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = (__CFString *)a1[4];
  if (!v6) {
    id v6 = &stru_1F3455898;
  }
  id v7 = objc_msgSend(v5, "initWithFormat:", @" SELECT * FROM     mlRuntimeEvaluationStatusHistory %@ ORDER BY     eventSecondsFromEpoch ASC,     rowid ASC;",
                 v6);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__TRIMLRuntimeEvaluationHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v19[3] = &unk_1E6BB8E08;
  uint64_t v8 = a1[5];
  id v9 = (void *)a1[6];
  uint64_t v21 = a1[9];
  v19[4] = v8;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x1E016EA80](v19);
  id v11 = [v4 db];

  uint64_t v12 = a1[7];
  id v13 = [*(id *)(a1[5] + 8) generalErrorHandlerWithOutError:0];
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [v11 prepAndRunQuery:v7 onPrep:v12 onRow:v10 onError:v13];

  int v14 = *(unsigned __int8 *)(*(void *)(a1[8] + 8) + 24);
  id v15 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  char v16 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (v14) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = v15;
  }
  return *v17;
}

uint64_t __89__TRIMLRuntimeEvaluationHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 getNSDataForColumnName:"serializedMLRuntimeEvaluation" table:0];
  if (!v4)
  {
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a1[6] object:a1[4] file:@"TRIMLRuntimeEvaluationHistoryDatabase.m" lineNumber:115 description:@"read nil value for NOT NULL serializedMLRuntimeEvaluation"];
  }
  id v5 = [v3 getNSDataForColumnName:"serializedEvaluationStatus" table:0];
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a1[6] object:a1[4] file:@"TRIMLRuntimeEvaluationHistoryDatabase.m" lineNumber:117 description:@"read nil value for NOT NULL serializedEvaluationStatus"];
  }
  id v19 = 0;
  id v6 = [MEMORY[0x1E4FB05A0] parseFromData:v4 error:&v19];
  id v7 = v19;
  if (v6)
  {
    id v18 = v7;
    uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v18];
    id v9 = v18;

    if (v8)
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB0190]) initWithEvaluation:v6 status:v8];
      buf[0] = 0;
      (*(void (**)(void))(a1[5] + 16))();
      id v11 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
      if (buf[0]) {
        id v11 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
      }
      uint64_t v12 = *v11;
    }
    else
    {
      int v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v9;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to deserialize TRIEvaluationStatus: %{public}@", buf, 0xCu);
      }

      uint64_t v12 = *MEMORY[0x1E4F93C08];
    }

    id v7 = v9;
  }
  else
  {
    id v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Failed to deserialize MLRuntimeEvaluation: %{public}@", buf, 0xCu);
    }

    uint64_t v12 = *MEMORY[0x1E4F93C08];
  }

  return v12;
}

- (BOOL)enumerateRecordsNewerThanDate:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIMLRuntimeEvaluationHistoryDatabase.m", 158, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIMLRuntimeEvaluationHistoryDatabase.m", 159, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__TRIMLRuntimeEvaluationHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke;
  v15[3] = &unk_1E6BB7C50;
  id v16 = v7;
  id v10 = v7;
  BOOL v11 = [(TRIMLRuntimeEvaluationHistoryDatabase *)self _enumerateRecordsMatchingWhereClause:@"WHERE eventSecondsFromEpoch > :threshold" bind:v15 block:v9];

  return v11;
}

void __77__TRIMLRuntimeEvaluationHistoryDatabase_enumerateRecordsNewerThanDate_block___block_invoke(uint64_t a1, void *a2)
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
    [v11 handleFailureInMethod:a2, self, @"TRIMLRuntimeEvaluationHistoryDatabase.m", 171, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__TRIMLRuntimeEvaluationHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke;
  v12[3] = &unk_1E6BB8E58;
  int v14 = &v16;
  id v8 = v7;
  id v13 = v8;
  id v15 = a4;
  [(TRIMLRuntimeEvaluationHistoryDatabase *)self writeTransactionWithFailableBlock:v12];
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __81__TRIMLRuntimeEvaluationHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__TRIMLRuntimeEvaluationHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2;
  v11[3] = &unk_1E6BB7C50;
  id v12 = *(id *)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" DELETE FROM     mlRuntimeEvaluationStatusHistory WHERE     eventSecondsFromEpoch < :threshold;",
                                                                 v11,
                                                                 0,
                                                                 0);

  if (*(void *)(a1 + 48))
  {
    id v5 = [v3 db];
    **(void **)(a1 + 48) = sqlite3_changes((sqlite3 *)[v5 handle]);
  }
  int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (v6) {
    char v9 = v8;
  }
  else {
    char v9 = v7;
  }
  return *v9;
}

void __81__TRIMLRuntimeEvaluationHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2(uint64_t a1, void *a2)
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