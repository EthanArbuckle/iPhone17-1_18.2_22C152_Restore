@interface TRIBackgroundMLTaskDatabase
- ($61A80719B04F7407D3E47539F1B23CAA)addBackgroundMLTaskWithTaskDeployment:(id)a3 pluginId:(id)a4 status:(int64_t)a5 endDate:(id)a6 artifact:(id)a7;
- ($61A80719B04F7407D3E47539F1B23CAA)removeRecordWithDeployment:(id)a3;
- (BOOL)_enumerateTaskRecordsMatchingWhereClause:(id)a3 bind:(id)a4 transaction:(id)a5 block:(id)a6;
- (BOOL)activateDeployment:(id)a3 withFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 usingTransaction:(id)a6;
- (BOOL)deactivateDeployment:(id)a3 usingTransaction:(id)a4;
- (BOOL)deactivateTaskDeployment:(id)a3 deactivatedFactorPackSetId:(id *)a4 usingTransaction:(id)a5;
- (BOOL)enumerateActiveTasksNotInList:(id)a3 usingTransaction:(id)a4 withBlock:(id)a5;
- (BOOL)enumerateActiveTasksWithBlock:(id)a3;
- (BOOL)enumerateActiveTasksWithTransaction:(id)a3 block:(id)a4;
- (BOOL)enumerateTaskRecordsMatchingTaskId:(id)a3 transaction:(id)a4 block:(id)a5;
- (BOOL)enumerateTaskRecordsWithBlock:(id)a3;
- (BOOL)enumerateTaskRecordsWithTransaction:(id)a3 block:(id)a4;
- (BOOL)setActiveFactorPackSetId:(id)a3 activeTargetingRuleIndex:(id)a4 forTaskDeployment:(id)a5 usingTransaction:(id)a6;
- (BOOL)setStatus:(int64_t)a3 forTaskDeployment:(id)a4 usingTransaction:(id)a5;
- (BOOL)setTargetedFactorPackSetId:(id)a3 targetedTargetingRuleIndex:(id)a4 forTaskDeployment:(id)a5 usingTransaction:(id)a6;
- (BOOL)targetTaskDeployment:(id)a3 toFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 usingTransaction:(id)a6;
- (TRIBackgroundMLTaskDatabase)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)taskRecordWithTaskDeployment:(id)a3;
@end

@implementation TRIBackgroundMLTaskDatabase

- (TRIBackgroundMLTaskDatabase)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 32, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIBackgroundMLTaskDatabase;
  v7 = [(TRIBackgroundMLTaskDatabase *)&v11 init];
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

- ($61A80719B04F7407D3E47539F1B23CAA)addBackgroundMLTaskWithTaskDeployment:(id)a3 pluginId:(id)a4 status:(int64_t)a5 endDate:(id)a6 artifact:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 52, @"Invalid parameter not satisfying: %@", @"bmltDeployment" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
LABEL_5:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 53, @"Invalid parameter not satisfying: %@", @"pluginId" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v14) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2810000000;
  v36 = "";
  uint64_t v37 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __102__TRIBackgroundMLTaskDatabase_addBackgroundMLTaskWithTaskDeployment_pluginId_status_endDate_artifact___block_invoke;
  v25[3] = &unk_1E6BB7E58;
  id v17 = v13;
  id v26 = v17;
  id v18 = v14;
  id v27 = v18;
  int64_t v32 = a5;
  id v19 = v15;
  id v28 = v19;
  id v20 = v16;
  id v29 = v20;
  v30 = self;
  v31 = &v33;
  [(TRIBackgroundMLTaskDatabase *)self writeTransactionWithFailableBlock:v25];
  v21.var0 = v34[4];

  _Block_object_dispose(&v33, 8);
  return v21;
}

uint64_t __102__TRIBackgroundMLTaskDatabase_addBackgroundMLTaskWithTaskDeployment_pluginId_status_endDate_artifact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  sqlite3_set_last_insert_rowid((sqlite3 *)[v4 handle], 0x8000000000000000);

  v5 = [v3 db];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__TRIBackgroundMLTaskDatabase_addBackgroundMLTaskWithTaskDeployment_pluginId_status_endDate_artifact___block_invoke_2;
  v15[3] = &unk_1E6BB7E30;
  id v16 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 80);
  id v17 = v6;
  uint64_t v20 = v7;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  v8 = [*(id *)(*(void *)(a1 + 64) + 8) generalErrorHandlerWithOutError:0];
  char v9 = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT OR IGNORE INTO backgroundMlTasks(    backgroundMlTaskId,     deploymentId,     pluginId,     status,     endSecondsFromEpoch,     activeFactorPackSetId,     activeTargetingRuleIndex,     targetedFactorPackSetId,     targetedTargetingRuleIndex,     artifact) VALUES(    :background_ml_task_id,     :deployment_id,     :plugin_id,     :status,     :end_seconds,     :active_fp_set_id,     :active_targeting_rule_index,     :targeted_fp_set_id,     :targeted_targeting_rule_index,     :artifact);",
         v15,
         0,
         v8);

  if (v9)
  {
    id v10 = [v3 db];
    sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)[v10 handle]);

    if (insert_rowid == 0x8000000000000000) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = v12;
    id v13 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = 0;
    id v13 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v13;
}

void __102__TRIBackgroundMLTaskDatabase_addBackgroundMLTaskWithTaskDeployment_pluginId_status_endDate_artifact___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) backgroundMLTaskId];
  [v8 bindNamedParam:":background_ml_task_id" toNSString:v3];

  objc_msgSend(v8, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  [v8 bindNamedParam:":plugin_id" toNSString:*(void *)(a1 + 40)];
  [v8 bindNamedParam:":status" toInt64:*(void *)(a1 + 64)];
  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = NSNumber;
    [v4 timeIntervalSince1970];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    [v8 bindNamedParam:":end_seconds" toDoubleAsNSNumber:v6];
  }
  else
  {
    [v8 bindNamedParam:":end_seconds" toDoubleAsNSNumber:0];
  }
  [v8 bindNamedParam:":active_fp_set_id" toNSString:0];
  [v8 bindNamedParam:":active_targeting_rule_index" toInt64AsNSNumber:0];
  [v8 bindNamedParam:":targeted_fp_set_id" toNSString:0];
  [v8 bindNamedParam:":targeted_targeting_rule_index" toInt64AsNSNumber:0];
  uint64_t v7 = [*(id *)(a1 + 56) data];
  [v8 bindNamedParam:":artifact" toNSData:v7];
}

- (BOOL)setStatus:(int64_t)a3 forTaskDeployment:(id)a4 usingTransaction:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 119, @"Invalid parameter not satisfying: %@", @"bmltDeployment" object file lineNumber description];
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke;
  v17[3] = &unk_1E6BB7E08;
  int64_t v21 = a3;
  id v11 = v9;
  id v18 = v11;
  id v19 = self;
  uint64_t v20 = &v22;
  uint64_t v12 = MEMORY[0x1E016EA80](v17);
  id v13 = (void *)v12;
  if (v10) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v10);
  }
  else {
    [(TRIBackgroundMLTaskDatabase *)self writeTransactionWithFailableBlock:v12];
  }
  char v14 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB7C78;
  uint64_t v14 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 32);
  v5 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke_2, &unk_1E6BB7C78);
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE backgroundMlTasks SET         status = :status WHERE     backgroundMlTaskId = :background_ml_task_id       AND deploymentId = :deployment_id;",
         v12,
         0,
         v5);

  if (v6)
  {
    id v7 = [v3 db];
    int v8 = sqlite3_changes((sqlite3 *)[v7 handle]);

    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v8) {
      *(unsigned char *)(v9 + 24) = 1;
    }
    else {
      *(unsigned char *)(v9 + 24) = 0;
    }
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v10;
}

void __76__TRIBackgroundMLTaskDatabase_setStatus_forTaskDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  [v5 bindNamedParam:":status" toInt64:v3];
  id v4 = [*(id *)(a1 + 32) backgroundMLTaskId];
  [v5 bindNamedParam:":background_ml_task_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)_enumerateTaskRecordsMatchingWhereClause:(id)a3 bind:(id)a4 transaction:(id)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  if ((v11 == 0) == (v12 == 0))
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 165, @"Invalid parameter not satisfying: %@", @"(whereClause == nil) == (bind == nil)" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  char v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 166, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  id v16 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__0;
  v34[4] = __Block_byref_object_dispose__0;
  id v35 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __95__TRIBackgroundMLTaskDatabase__enumerateTaskRecordsMatchingWhereClause_bind_transaction_block___block_invoke;
  v26[3] = &unk_1E6BB7EA8;
  id v17 = v11;
  id v27 = v17;
  id v18 = v12;
  SEL v33 = a2;
  id v28 = self;
  id v29 = v18;
  id v19 = v15;
  id v30 = v19;
  v31 = v34;
  int64_t v32 = &v36;
  uint64_t v20 = MEMORY[0x1E016EA80](v26);
  int64_t v21 = (void *)v20;
  if (v13) {
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v13);
  }
  else {
    [(TRIBackgroundMLTaskDatabase *)self readTransactionWithFailableBlock:v20];
  }
  char v22 = *((unsigned char *)v37 + 24);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

uint64_t __95__TRIBackgroundMLTaskDatabase__enumerateTaskRecordsMatchingWhereClause_bind_transaction_block___block_invoke(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = [NSString alloc];
  char v6 = (__CFString *)a1[4];
  if (!v6) {
    char v6 = &stru_1F3455898;
  }
  id v7 = objc_msgSend(v5, "initWithFormat:", @" SELECT * FROM     backgroundMlTasks as t %@ ORDER BY     endSecondsFromEpoch ASC,     rowid ASC;",
                 v6);
  int v8 = [v3 db];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __95__TRIBackgroundMLTaskDatabase__enumerateTaskRecordsMatchingWhereClause_bind_transaction_block___block_invoke_2;
  v31[3] = &unk_1E6BB7E80;
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  uint64_t v33 = a1[10];
  v31[4] = v9;
  id v11 = v4;
  id v32 = v11;
  id v12 = [*(id *)(a1[5] + 8) generalErrorHandlerWithOutError:0];
  int v13 = [v8 prepAndRunQuery:v7 onPrep:v10 onRow:v31 onError:v12];

  char v30 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
LABEL_5:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v27 != v17) {
        objc_enumerationMutation(v14);
      }
      if (v30) {
        break;
      }
      (*(void (**)(void))(a1[7] + 16))();
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v16) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  uint64_t v19 = *(void *)(a1[8] + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v14;
  id v21 = v14;

  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = v13;
  char v22 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  v23 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];

  if (v13) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = v23;
  }
  return *v24;
}

uint64_t __95__TRIBackgroundMLTaskDatabase__enumerateTaskRecordsMatchingWhereClause_bind_transaction_block___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = MEMORY[0x1E016E7F0]();
  id v4 = [v2 getNSStringForColumnName:"backgroundMlTaskId" table:0];
  uint64_t v5 = [v2 getInt64ForColumnName:"deploymentId" table:0];
  uint64_t v46 = [v2 getNSStringForColumnName:"pluginId" table:0];
  char v6 = [v2 getNSStringForColumnName:"activeFactorPackSetId" table:0];
  if (v6)
  {
    uint64_t v7 = TRIValidateFactorPackSetId();
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v2 getInt64AsNSNumberForColumnName:"activeTargetingRuleIndex" table:0];
  uint64_t v9 = [v2 getNSStringForColumnName:"targetedFactorPackSetId" table:0];
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    uint64_t v9 = TRIValidateFactorPackSetId();
  }
  v44 = (void *)v9;
  v45 = (void *)v3;
  uint64_t v43 = [v2 getInt64AsNSNumberForColumnName:"targetedTargetingRuleIndex" table:0];
  uint64_t v11 = [v2 getInt64ForColumnName:"status" table:0];
  id v12 = [v2 getNSDataForColumnName:"artifact" table:0];
  v47 = v10;
  if (!v12)
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"TRIBackgroundMLTaskDatabase.m" lineNumber:208 description:@"Unexpected NULL artifact"];

    uint64_t v13 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = +[TRIClientBMLTArtifact artifactWithTransientData:v12];
  if (v13)
  {
LABEL_8:
    uint64_t v38 = v11;
    id v14 = (void *)v13;

    uint64_t v15 = [v2 getDoubleAsNSNumberForColumnName:"endSecondsFromEpoch" table:0];
    char v39 = (void *)v8;
    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v15 doubleValue];
      uint64_t v17 = objc_msgSend(v16, "initWithTimeIntervalSince1970:");
    }
    else
    {
      uint64_t v17 = 0;
    }
    uint64_t v19 = (void *)v7;
    v40 = v6;

    if (!v4)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"TRIBackgroundMLTaskDatabase.m" lineNumber:225 description:@"Unexpected NULL backgroundMLTaskId"];
    }
    long long v26 = [MEMORY[0x1E4FB0078] deploymentWithBackgroundMLTaskId:v4 deploymentId:v5];
    if (!v46)
    {
      uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"TRIBackgroundMLTaskDatabase.m" lineNumber:228 description:@"Unexpected NULL pluginId"];
    }
    long long v27 = [TRIBackgroundMLTaskRecord alloc];
    long long v28 = v14;
    uint64_t v36 = v17;
    uint64_t v37 = v14;
    uint64_t v29 = v7;
    char v30 = (void *)v17;
    v23 = v39;
    uint64_t v24 = (void *)v43;
    char v25 = v44;
    v31 = [(TRIBackgroundMLTaskRecord *)v27 initWithBmltDeployment:v26 pluginId:v46 activeFactorPackSetId:v29 activeTargetingRuleIndex:v39 targetedFactorPackSetId:v44 targetedTargetingRuleIndex:v43 status:v38 endDate:v36 artifact:v37];
    [*(id *)(a1 + 40) addObject:v31];
    unsigned int v42 = *MEMORY[0x1E4F93C08];

    char v22 = v45;
    id v21 = (void *)v46;
    char v6 = v40;
    goto LABEL_19;
  }
  uint64_t v18 = (void *)v8;
  uint64_t v19 = (void *)v7;
  uint64_t v20 = TRILogCategory_Server();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v49 = v4;
    __int16 v50 = 1024;
    int v51 = v5;
    __int16 v52 = 2114;
    uint64_t v53 = 0;
    _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Failed to parse persisted TRIClientBMLTArtifact for artifact for %{public}@.%d: %{public}@", buf, 0x1Cu);
  }

  unsigned int v42 = *MEMORY[0x1E4F93C08];
  char v22 = v45;
  id v21 = (void *)v46;
  v23 = v18;
  uint64_t v24 = (void *)v43;
  char v25 = v44;
LABEL_19:

  return v42;
}

- (id)taskRecordWithTaskDeployment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 270, @"Invalid parameter not satisfying: %@", @"bmltDeployment" object file lineNumber description];
  }
  char v6 = [v5 backgroundMLTaskId];

  if (!v6)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 271, @"Invalid parameter not satisfying: %@", @"bmltDeployment.backgroundMLTaskId" object file lineNumber description];
  }
  if (([v5 hasDeploymentId] & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 272, @"Invalid parameter not satisfying: %@", @"bmltDeployment.hasDeploymentId" object file lineNumber description];
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__0;
  id v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__TRIBackgroundMLTaskDatabase_taskRecordWithTaskDeployment___block_invoke;
  v15[3] = &unk_1E6BB7C50;
  id v7 = v5;
  id v16 = v7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__TRIBackgroundMLTaskDatabase_taskRecordWithTaskDeployment___block_invoke_2;
  v14[3] = &unk_1E6BB7ED0;
  v14[4] = &v17;
  if ([(TRIBackgroundMLTaskDatabase *)self _enumerateTaskRecordsMatchingWhereClause:@" WHERE     t.backgroundMlTaskId = :background_ml_task_id       AND t.deploymentId = :deployment_id" bind:v15 transaction:0 block:v14])
  {
    uint64_t v8 = (void *)v18[5];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __60__TRIBackgroundMLTaskDatabase_taskRecordWithTaskDeployment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 backgroundMLTaskId];
  [v5 bindNamedParam:":background_ml_task_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

void __60__TRIBackgroundMLTaskDatabase_taskRecordWithTaskDeployment___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (BOOL)setTargetedFactorPackSetId:(id)a3 targetedTargetingRuleIndex:(id)a4 forTaskDeployment:(id)a5 usingTransaction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __120__TRIBackgroundMLTaskDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke;
  v21[3] = &unk_1E6BB7F20;
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  char v25 = self;
  long long v26 = &v27;
  uint64_t v17 = MEMORY[0x1E016EA80](v21);
  uint64_t v18 = (void *)v17;
  if (v13) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v13);
  }
  else {
    [(TRIBackgroundMLTaskDatabase *)self writeTransactionWithFailableBlock:v17];
  }
  char v19 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v19;
}

uint64_t __120__TRIBackgroundMLTaskDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __120__TRIBackgroundMLTaskDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB7EF8;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v5 = [*(id *)(*(void *)(a1 + 56) + 8) generalErrorHandlerWithOutError:0];
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE backgroundMlTasks SET         targetedFactorPackSetId = :set_id,         targetedTargetingRuleIndex = :rule_index WHERE         backgroundMlTaskId = :background_ml_task_id     AND deploymentId = :deployment_id;",
         v12,
         0,
         v5);

  if (v6)
  {
    id v7 = [v3 db];
    int v8 = sqlite3_changes((sqlite3 *)[v7 handle]);

    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v8) {
      *(unsigned char *)(v9 + 24) = 1;
    }
    else {
      *(unsigned char *)(v9 + 24) = 0;
    }
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v10;
}

void __120__TRIBackgroundMLTaskDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":set_id" toNSString:v3];
  [v5 bindNamedParam:":rule_index" toInt64AsNSNumber:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 48) backgroundMLTaskId];
  [v5 bindNamedParam:":background_ml_task_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (BOOL)targetTaskDeployment:(id)a3 toFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 usingTransaction:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 343, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __106__TRIBackgroundMLTaskDatabase_targetTaskDeployment_toFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke;
  v24[3] = &unk_1E6BB7CA0;
  v24[4] = self;
  id v15 = v11;
  id v25 = v15;
  id v16 = v12;
  id v26 = v16;
  uint64_t v27 = &v28;
  uint64_t v17 = (void (**)(void, void))MEMORY[0x1E016EA80](v24);
  uint64_t v18 = v17;
  if (v14)
  {
    ((void (**)(void, id))v17)[2](v17, v14);
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __106__TRIBackgroundMLTaskDatabase_targetTaskDeployment_toFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke_104;
    v22[3] = &unk_1E6BB7F48;
    id v23 = v17;
    [(TRIBackgroundMLTaskDatabase *)self writeTransactionWithFailableBlock:v22];
  }
  char v19 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v19;
}

uint64_t __106__TRIBackgroundMLTaskDatabase_targetTaskDeployment_toFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) taskRecordWithTaskDeployment:*(void *)(a1 + 40)];
  id v5 = v4;
  if (!v4)
  {
    uint64_t v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 40) shortDesc];
      int v12 = 138543362;
      id v13 = v11;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "TRIBMLTDatabase unable to target BMLT deployment %{public}@; not found.",
        (uint8_t *)&v12,
        0xCu);
    }
    goto LABEL_9;
  }
  if (*(void *)(a1 + 48))
  {
    if ([v4 status] != 1)
    {
      char v6 = *(void **)(a1 + 32);
      id v7 = [v5 bmltDeployment];
      LODWORD(v6) = [v6 setStatus:2 forTaskDeployment:v7 usingTransaction:v3];

      if (!v6)
      {
LABEL_9:
        int v8 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
        goto LABEL_10;
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  int v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
LABEL_10:

  return *v8;
}

uint64_t __106__TRIBackgroundMLTaskDatabase_targetTaskDeployment_toFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setActiveFactorPackSetId:(id)a3 activeTargetingRuleIndex:(id)a4 forTaskDeployment:(id)a5 usingTransaction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __116__TRIBackgroundMLTaskDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke;
  v21[3] = &unk_1E6BB7F20;
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  id v25 = self;
  id v26 = &v27;
  uint64_t v17 = MEMORY[0x1E016EA80](v21);
  uint64_t v18 = (void *)v17;
  if (v13) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v13);
  }
  else {
    [(TRIBackgroundMLTaskDatabase *)self writeTransactionWithFailableBlock:v17];
  }
  char v19 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v19;
}

uint64_t __116__TRIBackgroundMLTaskDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __116__TRIBackgroundMLTaskDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB7EF8;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v5 = [*(id *)(*(void *)(a1 + 56) + 8) generalErrorHandlerWithOutError:0];
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE backgroundMlTasks SET         activeFactorPackSetId = :set_id,         activeTargetingRuleIndex = :rule_index WHERE     backgroundMlTaskId = :background_ml_task_id       AND deploymentId = :deployment_id;",
         v12,
         0,
         v5);

  if (v6)
  {
    id v7 = [v3 db];
    int v8 = sqlite3_changes((sqlite3 *)[v7 handle]);

    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v8) {
      *(unsigned char *)(v9 + 24) = 1;
    }
    else {
      *(unsigned char *)(v9 + 24) = 0;
    }
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v10;
}

void __116__TRIBackgroundMLTaskDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forTaskDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":set_id" toNSString:v3];
  [v5 bindNamedParam:":rule_index" toInt64AsNSNumber:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 48) backgroundMLTaskId];
  [v5 bindNamedParam:":background_ml_task_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (BOOL)activateDeployment:(id)a3 withFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 usingTransaction:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 426, @"Invalid parameter not satisfying: %@", @"bmltDeployment" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  id v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 427, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

LABEL_3:
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __106__TRIBackgroundMLTaskDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke;
  v26[3] = &unk_1E6BB7F20;
  void v26[4] = self;
  id v15 = v11;
  id v27 = v15;
  id v16 = v12;
  id v28 = v16;
  id v17 = v13;
  id v29 = v17;
  char v30 = &v31;
  uint64_t v18 = (void (**)(void, void))MEMORY[0x1E016EA80](v26);
  char v19 = v18;
  if (v14)
  {
    ((void (**)(void, id))v18)[2](v18, v14);
  }
  else
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __106__TRIBackgroundMLTaskDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke_111;
    v24[3] = &unk_1E6BB7F48;
    id v25 = v18;
    [(TRIBackgroundMLTaskDatabase *)self writeTransactionWithFailableBlock:v24];
  }
  char v20 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v31, 8);
  return v20;
}

uint64_t __106__TRIBackgroundMLTaskDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) taskRecordWithTaskDeployment:*(void *)(a1 + 40)];
  id v5 = v4;
  if (!v4)
  {
    char v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v22 = [*(id *)(a1 + 40) shortDesc];
      int v27 = 138543362;
      id v28 = v22;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "TRIBMLTDatabase unable to activate BMLT deployment %{public}@; not found.",
        (uint8_t *)&v27,
        0xCu);
    }
    goto LABEL_18;
  }
  char v6 = *(void **)(a1 + 32);
  id v7 = [v4 bmltDeployment];
  int v8 = [v6 setStatus:1 forTaskDeployment:v7 usingTransaction:v3];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v23 = [v5 bmltDeployment];
      int v27 = 138543362;
      id v28 = v23;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Failed to set Active status of BMLT deployment %{public}@", (uint8_t *)&v27, 0xCu);
    }
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v13 = [v5 bmltDeployment];
  int v14 = v8 & [v10 setActiveFactorPackSetId:v11 activeTargetingRuleIndex:v12 forTaskDeployment:v13 usingTransaction:v3];

  if ((v14 & 1) == 0)
  {
    id v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v24 = *(void **)(a1 + 48);
      id v25 = [v5 bmltDeployment];
      int v27 = 138543618;
      id v28 = v24;
      __int16 v29 = 2114;
      char v30 = v25;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to set active FPS %{public}@ for BMLT deployment %{public}@", (uint8_t *)&v27, 0x16u);
    }
  }
  id v16 = *(void **)(a1 + 32);
  id v17 = [v5 bmltDeployment];
  LOBYTE(v16) = v14 & [v16 setTargetedFactorPackSetId:0 targetedTargetingRuleIndex:0 forTaskDeployment:v17 usingTransaction:v3];

  if ((v16 & 1) == 0)
  {
    char v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v5 bmltDeployment];
      int v27 = 138543362;
      id v28 = v26;
      _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Failed to unset targeted FPS for BMLT deployment %{public}@", (uint8_t *)&v27, 0xCu);
    }
LABEL_18:
    uint64_t v18 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
    goto LABEL_19;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  uint64_t v18 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
LABEL_19:

  return *v18;
}

uint64_t __106__TRIBackgroundMLTaskDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_usingTransaction___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)deactivateDeployment:(id)a3 usingTransaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 487, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__TRIBackgroundMLTaskDatabase_deactivateDeployment_usingTransaction___block_invoke;
  v17[3] = &unk_1E6BB7F70;
  char v19 = &v20;
  void v17[4] = self;
  id v9 = v7;
  id v18 = v9;
  id v10 = (void (**)(void, void))MEMORY[0x1E016EA80](v17);
  uint64_t v11 = v10;
  if (v8)
  {
    ((void (**)(void, id))v10)[2](v10, v8);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__TRIBackgroundMLTaskDatabase_deactivateDeployment_usingTransaction___block_invoke_2;
    v15[3] = &unk_1E6BB7F48;
    id v16 = v10;
    [(TRIBackgroundMLTaskDatabase *)self writeTransactionWithFailableBlock:v15];
  }
  char v12 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __69__TRIBackgroundMLTaskDatabase_deactivateDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  char v6 = [v3 setStatus:3 forTaskDeployment:v4 usingTransaction:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  char v9 = [*(id *)(a1 + 32) setActiveFactorPackSetId:0 activeTargetingRuleIndex:0 forTaskDeployment:*(void *)(a1 + 40) usingTransaction:v5];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v10 + 24)) {
    char v11 = v9;
  }
  else {
    char v11 = 0;
  }
  *(unsigned char *)(v10 + 24) = v11;
  char v12 = [*(id *)(a1 + 32) setTargetedFactorPackSetId:0 targetedTargetingRuleIndex:0 forTaskDeployment:*(void *)(a1 + 40) usingTransaction:v5];

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v13 + 24)) {
    char v14 = v12;
  }
  else {
    char v14 = 0;
  }
  *(unsigned char *)(v13 + 24) = v14;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    id v15 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else {
    id v15 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  return *v15;
}

uint64_t __69__TRIBackgroundMLTaskDatabase_deactivateDeployment_usingTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)deactivateTaskDeployment:(id)a3 deactivatedFactorPackSetId:(id *)a4 usingTransaction:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 512, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 513, @"Invalid parameter not satisfying: %@", @"deactivatedFactorPackSetId" object file lineNumber description];

LABEL_3:
  id v11 = *a4;
  *a4 = 0;

  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke;
  v21[3] = &unk_1E6BB7FC0;
  char v23 = &v25;
  void v21[4] = self;
  id v12 = v9;
  id v22 = v12;
  id v24 = a4;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x1E016EA80](v21);
  char v14 = v13;
  if (v10)
  {
    ((void (**)(void, id))v13)[2](v13, v10);
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke_115;
    v19[3] = &unk_1E6BB7F48;
    uint64_t v20 = v13;
    [(TRIBackgroundMLTaskDatabase *)self writeTransactionWithFailableBlock:v19];
  }
  char v15 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return v15;
}

uint64_t __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) backgroundMLTaskId];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke_2;
  v16[3] = &unk_1E6BB7F98;
  id v17 = *(id *)(a1 + 40);
  id v18 = &v20;
  uint64_t v19 = *(void *)(a1 + 56);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 enumerateTaskRecordsMatchingTaskId:v5 transaction:v3 block:v16];

  char v6 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v7 = v21[5];
    if (v7)
    {
      char v8 = [*(id *)(a1 + 32) deactivateDeployment:v7 usingTransaction:v3];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(unsigned char *)(v9 + 24)) {
        char v10 = v8;
      }
      else {
        char v10 = 0;
      }
      *(unsigned char *)(v9 + 24) = v10;
    }
    else
    {
      id v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        char v14 = [*(id *)(a1 + 40) backgroundMLTaskId];
        int v15 = [*(id *)(a1 + 40) deploymentId];
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v14;
        __int16 v28 = 1024;
        int v29 = v15;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Unable to find deployment to deactivate in BMLT database (for deployment: (bmlt: %{public}@, d: %d)", buf, 0x12u);
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      char v6 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    }
  }
  uint64_t v12 = *v6;

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke_2(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 bmltDeployment];
  int v5 = [v4 isEqualToDeployment:a1[4]];

  if (v5)
  {
    char v6 = [v3 activeFactorPackSetId];
    if (v6)
    {
    }
    else
    {
      uint64_t v7 = [v3 targetedFactorPackSetId];

      if (!v7) {
        goto LABEL_9;
      }
    }
    char v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v3 bmltDeployment];
      char v10 = [v9 backgroundMLTaskId];
      id v11 = [v3 bmltDeployment];
      int v19 = 138543618;
      uint64_t v20 = v10;
      __int16 v21 = 1024;
      int v22 = [v11 deploymentId];
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Deactivating BMLT deployment matching %{public}@: %d", (uint8_t *)&v19, 0x12u);
    }
    uint64_t v12 = [v3 bmltDeployment];
    uint64_t v13 = *(void *)(a1[5] + 8);
    char v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    int v15 = [v3 activeFactorPackSetId];

    if (v15)
    {
      uint64_t v16 = [v3 activeFactorPackSetId];
      id v17 = (void **)a1[6];
      id v18 = *v17;
      *id v17 = (void *)v16;
    }
  }
LABEL_9:
}

uint64_t __100__TRIBackgroundMLTaskDatabase_deactivateTaskDeployment_deactivatedFactorPackSetId_usingTransaction___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)enumerateActiveTasksWithBlock:(id)a3
{
  return [(TRIBackgroundMLTaskDatabase *)self _enumerateTaskRecordsMatchingWhereClause:@"WHERE status = :status_active" bind:&__block_literal_global transaction:0 block:a3];
}

uint64_t __61__TRIBackgroundMLTaskDatabase_enumerateActiveTasksWithBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":status_active" toInt64:1];
}

- (BOOL)enumerateActiveTasksNotInList:(id)a3 usingTransaction:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_123];
  uint64_t v13 = [v8 filteredArrayUsingPredicate:v12];

  char v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__TRIBackgroundMLTaskDatabase_enumerateActiveTasksNotInList_usingTransaction_withBlock___block_invoke_2;
  v18[3] = &unk_1E6BB8028;
  id v19 = v14;
  id v20 = v10;
  id v15 = v10;
  id v16 = v14;
  LOBYTE(self) = [(TRIBackgroundMLTaskDatabase *)self enumerateActiveTasksWithTransaction:v9 block:v18];

  return (char)self;
}

uint64_t __88__TRIBackgroundMLTaskDatabase_enumerateActiveTasksNotInList_usingTransaction_withBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasDeploymentId];
}

void __88__TRIBackgroundMLTaskDatabase_enumerateActiveTasksNotInList_usingTransaction_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = v3;
  int v5 = [v3 bmltDeployment];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)enumerateTaskRecordsWithBlock:(id)a3
{
  return [(TRIBackgroundMLTaskDatabase *)self _enumerateTaskRecordsMatchingWhereClause:0 bind:0 transaction:0 block:a3];
}

- (BOOL)enumerateActiveTasksWithTransaction:(id)a3 block:(id)a4
{
  return [(TRIBackgroundMLTaskDatabase *)self _enumerateTaskRecordsMatchingWhereClause:@"WHERE status = :status_active" bind:&__block_literal_global_126 transaction:a3 block:a4];
}

uint64_t __73__TRIBackgroundMLTaskDatabase_enumerateActiveTasksWithTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":status_active" toInt64:1];
}

- (BOOL)enumerateTaskRecordsWithTransaction:(id)a3 block:(id)a4
{
  return [(TRIBackgroundMLTaskDatabase *)self _enumerateTaskRecordsMatchingWhereClause:0 bind:0 transaction:a3 block:a4];
}

- (BOOL)enumerateTaskRecordsMatchingTaskId:(id)a3 transaction:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 620, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__TRIBackgroundMLTaskDatabase_enumerateTaskRecordsMatchingTaskId_transaction_block___block_invoke;
  v16[3] = &unk_1E6BB7C50;
  id v17 = v9;
  id v12 = v9;
  BOOL v13 = [(TRIBackgroundMLTaskDatabase *)self _enumerateTaskRecordsMatchingWhereClause:@" WHERE t.backgroundMlTaskId = :background_ml_task_id" bind:v16 transaction:v10 block:v11];

  return v13;
}

uint64_t __84__TRIBackgroundMLTaskDatabase_enumerateTaskRecordsMatchingTaskId_transaction_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":background_ml_task_id" toNSString:*(void *)(a1 + 32)];
}

- ($61A80719B04F7407D3E47539F1B23CAA)removeRecordWithDeployment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRIBackgroundMLTaskDatabase.m", 632, @"Invalid parameter not satisfying: %@", @"bmltDeployment" object file lineNumber description];
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2810000000;
  id v17 = "";
  uint64_t v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__TRIBackgroundMLTaskDatabase_removeRecordWithDeployment___block_invoke;
  v10[3] = &unk_1E6BB8050;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  BOOL v13 = &v14;
  [(TRIBackgroundMLTaskDatabase *)self writeTransactionWithFailableBlock:v10];
  v7.var0 = v15[4];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __58__TRIBackgroundMLTaskDatabase_removeRecordWithDeployment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__TRIBackgroundMLTaskDatabase_removeRecordWithDeployment___block_invoke_2;
  v13[3] = &unk_1E6BB7C50;
  id v14 = *(id *)(a1 + 32);
  uint64_t v4 = (void *)MEMORY[0x1E016EA80](v13);
  id v5 = [v3 db];
  id v6 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
  char v7 = [v5 prepAndRunQuery:@" DELETE FROM     backgroundMlTasks WHERE   backgroundMlTaskId = :background_ml_task_id     AND deploymentId = :deployment_id" onPrep:v4 onRow:0 onError:v6];

  if (v7)
  {
    id v8 = [v3 db];
    int v9 = sqlite3_changes((sqlite3 *)[v8 handle]);

    uint64_t v10 = 1;
    if (v9 <= 0) {
      uint64_t v10 = 2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v10;
    id v11 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = 0;
    id v11 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v11;
}

void __58__TRIBackgroundMLTaskDatabase_removeRecordWithDeployment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v3 backgroundMLTaskId];
  [v5 bindNamedParam:":background_ml_task_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (void).cxx_destruct
{
}

@end