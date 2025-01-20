@interface TRIExperimentHistoryDatabase
- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5;
- (BOOL)_isPreviouslyRecordedStateForEvent:(id)a3;
- (BOOL)addRecord:(id)a3;
- (BOOL)enumerateRecordsNewerThanDate:(id)a3 matchingDeploymentEnvironments:(id)a4 block:(id)a5;
- (BOOL)expireRecordsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4;
- (BOOL)storeExperimentEvent:(id)a3 wasNewEvent:(BOOL *)a4;
- (TRIExperimentHistoryDatabase)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)getAllAllocationStatusesForExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5;
- (unsigned)previousExperimentStateForTriple:(id)a3;
@end

@implementation TRIExperimentHistoryDatabase

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db readTransactionWithFailableBlock:a3];
}

- (BOOL)enumerateRecordsNewerThanDate:(id)a3 matchingDeploymentEnvironments:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 271, @"Invalid parameter not satisfying: %@", @"deploymentEnvironments" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 272, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_4;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 270, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__TRIExperimentHistoryDatabase_enumerateRecordsNewerThanDate_matchingDeploymentEnvironments_block___block_invoke;
  v19[3] = &unk_1E6BB8628;
  id v20 = v10;
  id v21 = v9;
  id v12 = v9;
  id v13 = v10;
  BOOL v14 = [(TRIExperimentHistoryDatabase *)self _enumerateRecordsMatchingWhereClause:@" WHERE         e.deploymentEnvironment IN _pas_nsset(:matching_envs)     AND e.eventSecondsFromEpoch > :threshold" bind:v19 block:v11];

  return v14;
}

- (unsigned)previousExperimentStateForTriple:(id)a3
{
  id v4 = a3;
  v5 = [v4 experimentId];
  uint64_t v6 = [v4 deploymentId];
  v7 = [v4 treatmentId];

  v8 = [(TRIExperimentHistoryDatabase *)self getAllAllocationStatusesForExperimentId:v5 deploymentId:v6 treatmentId:v7];

  id v9 = [v8 firstObject];
  LOBYTE(v5) = [v9 intValue];

  return v5;
}

- (BOOL)storeExperimentEvent:(id)a3 wasNewEvent:(BOOL *)a4
{
  id v6 = a3;
  BOOL v7 = [(TRIExperimentHistoryDatabase *)self _isPreviouslyRecordedStateForEvent:v6];
  if (a4) {
    *a4 = !v7;
  }
  v8 = [v6 experimentRecord];

  BOOL v9 = [(TRIExperimentHistoryDatabase *)self addRecord:v8];
  return v9;
}

- (BOOL)_isPreviouslyRecordedStateForEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 treatmentTriple];
  id v6 = [v5 experimentId];
  BOOL v7 = [v4 treatmentTriple];
  uint64_t v8 = [v7 deploymentId];
  BOOL v9 = [v4 treatmentTriple];
  id v10 = [v9 treatmentId];
  id v11 = [(TRIExperimentHistoryDatabase *)self getAllAllocationStatusesForExperimentId:v6 deploymentId:v8 treatmentId:v10];

  id v12 = NSNumber;
  uint64_t v13 = [v4 eventType];

  BOOL v14 = [v12 numberWithUnsignedChar:v13];
  LOBYTE(v12) = [v11 containsObject:v14];

  return (char)v12;
}

- (TRIExperimentHistoryDatabase)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 31, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIExperimentHistoryDatabase;
  BOOL v7 = [(TRIExperimentHistoryDatabase *)&v11 init];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_db, a3);
  }

  return v8;
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
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 47, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__TRIExperimentHistoryDatabase_addRecord___block_invoke;
  v15[3] = &unk_1E6BB7CA0;
  v16 = @" INSERT INTO experimentHistory(    eventSecondsFromEpoch,     eventType,     deploymentEnvironment,     experimentId,     deploymentId,     treatmentId,     errorOrDeactivationReason) VALUES(    :timestamp,     :event_type,     :environment,     :exp_id,     :dep_id,     :trt_id,     :reason);";
  id v6 = v5;
  id v17 = v6;
  v18 = self;
  v19 = &v20;
  [(TRIExperimentHistoryDatabase *)self writeTransactionWithFailableBlock:v15];
  if (*((unsigned char *)v21 + 24))
  {
    BOOL v7 = [MEMORY[0x1E4FB0058] internalToExternalStatusMapping];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v6, "eventType"));
    BOOL v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      id v10 = objc_msgSend(MEMORY[0x1E4FB0058], "notificationNameForDeploymentEnvironment:", objc_msgSend(v6, "deploymentEnvironment"));
      objc_super v11 = v10;
      if (v10) {
        notify_post((const char *)[v10 UTF8String]);
      }
    }
  }
  char v12 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __42__TRIExperimentHistoryDatabase_addRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 db];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __42__TRIExperimentHistoryDatabase_addRecord___block_invoke_2;
  v29[3] = &unk_1E6BB7C50;
  uint64_t v5 = *(void *)(a1 + 32);
  id v30 = *(id *)(a1 + 40);
  id v6 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
  LOBYTE(v5) = [v4 prepAndRunQuery:v5 onPrep:v29 onRow:0 onError:v6];

  if (v5)
  {
    BOOL v7 = [v3 db];
    uint64_t v23 = [v7 lastInsertRowId];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [*(id *)(a1 + 40) namespaces];
    uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * v11);
          uint64_t v13 = (void *)MEMORY[0x1E016E7F0]();
          id v14 = v3;
          v15 = [v3 db];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __42__TRIExperimentHistoryDatabase_addRecord___block_invoke_3;
          v24[3] = &unk_1E6BB7C78;
          v24[4] = v12;
          v24[5] = v23;
          uint64_t v16 = a1;
          id v17 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
          int v18 = objc_msgSend(v15, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO experimentHistoryNamespaces(    experimentHistory_rowid,     name,     compatibilityVersion) VALUES(    :exp_rowid,     :name,     :cv);",
                  v24,
                  0,
                  v17);

          if (!v18)
          {
            uint64_t v20 = *MEMORY[0x1E4F93BF0];

            id v3 = v14;
            goto LABEL_14;
          }
          ++v11;
          id v3 = v14;
          a1 = v16;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    v19 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    v19 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  uint64_t v20 = *v19;
LABEL_14:

  return v20;
}

void __42__TRIExperimentHistoryDatabase_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 eventDate];
  [v5 timeIntervalSince1970];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp");

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":event_type", objc_msgSend(*(id *)(a1 + 32), "eventType"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":environment", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentEnvironment"));
  id v6 = [*(id *)(a1 + 32) experimentId];
  [v4 bindNamedParam:":exp_id" toNSString:v6];

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":dep_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  BOOL v7 = [*(id *)(a1 + 32) treatmentId];
  [v4 bindNamedParam:":trt_id" toNSString:v7];

  id v8 = [*(id *)(a1 + 32) errorOrDeactivationReason];
  [v4 bindNamedParam:":reason" toNSString:v8];
}

void __42__TRIExperimentHistoryDatabase_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  [v5 bindNamedParam:":exp_rowid" toInt64:v3];
  id v4 = [*(id *)(a1 + 32) name];
  [v5 bindNamedParam:":name" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":cv", objc_msgSend(*(id *)(a1 + 32), "compatibilityVersion"));
}

- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if ((v9 == 0) != (v10 == 0))
  {
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 133, @"Invalid parameter not satisfying: %@", @"(whereClause == nil) == (bind == nil)" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 134, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  context = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v13 = objc_opt_new();
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__59;
  v63 = __Block_byref_object_dispose__59;
  id v64 = 0;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke;
  v58[3] = &unk_1E6BBE688;
  v58[4] = &v59;
  id v14 = (void *)MEMORY[0x1E016EA80](v58);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v54[3] = &unk_1E6BB7CF0;
  v57 = &v59;
  id v15 = v13;
  id v55 = v15;
  id v16 = v12;
  id v56 = v16;
  id v17 = (void *)MEMORY[0x1E016EA80](v54);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_3;
  v52[3] = &unk_1E6BBE6B0;
  id v53 = v15;
  id v18 = v15;
  v19 = (void *)MEMORY[0x1E016EA80](v52);

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
  v41[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_4;
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
  v33[2] = __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_5;
  v33[3] = &unk_1E6BB7D68;
  id v24 = v9;
  id v34 = v24;
  id v25 = v10;
  id v36 = v25;
  id v26 = v23;
  id v37 = v26;
  v35 = self;
  id v27 = v20;
  id v38 = v27;
  v39 = &v59;
  v40 = &v48;
  [(TRIExperimentHistoryDatabase *)self readTransactionWithFailableBlock:v33];
  char v28 = *((unsigned char *)v49 + 24);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v59, 8);

  return v28;
}

void __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3)
  {
    id v5 = (void *)[*(id *)(a1 + 32) copy];
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

uint64_t __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"rowid" table:"experimentHistory"];
  if (v4 != *(void *)(*(void *)(a1[8] + 8) + 24))
  {
    (*(void (**)(void))(a1[5] + 16))();
    if (*(unsigned char *)(*(void *)(a1[9] + 8) + 24))
    {
      uint64_t v5 = *MEMORY[0x1E4F93C10];
      goto LABEL_14;
    }
    id v6 = [v3 getDoubleAsNSNumberForColumnName:"eventSecondsFromEpoch" table:"experimentHistory"];
    if (!v6)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a1[10] object:a1[4] file:@"TRIExperimentHistoryDatabase.m" lineNumber:187 description:@"nil eventSecondsFromEpoch read from NOT NULL column"];
    }
    id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v6 doubleValue];
    id v8 = objc_msgSend(v7, "initWithTimeIntervalSince1970:");

    unsigned __int8 v9 = [v3 getInt64ForColumnName:"eventType" table:"experimentHistory"];
    uint64_t v10 = [v3 getInt64ForColumnName:"deploymentEnvironment" table:"experimentHistory"];
    id v11 = [v3 getNSStringForColumnName:"experimentId" table:"experimentHistory"];
    if (!v11)
    {
      id v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a1[10] object:a1[4] file:@"TRIExperimentHistoryDatabase.m" lineNumber:193 description:@"nil experimentId read from NOT NULL column"];
    }
    uint64_t v12 = [v3 getInt64ForColumnName:"deploymentId" table:"experimentHistory"];
    uint64_t v13 = [v3 getNSStringForColumnName:"treatmentId" table:"experimentHistory"];
    if (!v13)
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a1[10] object:a1[4] file:@"TRIExperimentHistoryDatabase.m" lineNumber:196 description:@"nil treatmentId read from NOT NULL column"];
    }
    id v14 = [v3 getNSStringForColumnName:"errorOrDeactivationReason" table:"experimentHistory"];
    id v15 = objc_alloc(MEMORY[0x1E4FB0108]);
    id v16 = (void *)[v15 initWithEventDate:v8 eventType:v9 deploymentEnvironment:v10 experimentId:v11 deploymentId:v12 treatmentId:v13 errorOrDeactivationReason:v14 namespaces:MEMORY[0x1E4F1CBF0]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v17 = [v3 getNSStringForColumnName:"name" table:"experimentHistoryNamespaces"];
  if (v17)
  {
    uint64_t v18 = [v3 getInt64ForColumnName:"compatibilityVersion" table:"experimentHistoryNamespaces"];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4FB0278]) initWithName:v17 compatibilityVersion:v18];
    (*(void (**)(void))(a1[7] + 16))();
  }
  *(void *)(*(void *)(a1[8] + 8) + 24) = v4;
  uint64_t v5 = *MEMORY[0x1E4F93C08];

LABEL_14:
  return v5;
}

uint64_t __80__TRIExperimentHistoryDatabase__enumerateRecordsMatchingWhereClause_bind_block___block_invoke_5(void *a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = (__CFString *)a1[4];
  if (!v6) {
    id v6 = &stru_1F3455898;
  }
  id v7 = objc_msgSend(v5, "initWithFormat:", @" SELECT * FROM     experimentHistory AS e LEFT JOIN     experimentHistoryNamespaces AS n ON     e.rowid = n.experimentHistory_rowid %@ ORDER BY     e.eventSecondsFromEpoch ASC,     n.rowid ASC;",
                 v6);
  id v8 = [v4 db];

  uint64_t v10 = a1[6];
  uint64_t v9 = a1[7];
  id v11 = [*(id *)(a1[5] + 8) generalErrorHandlerWithOutError:0];
  LODWORD(v9) = [v8 prepAndRunQuery:v7 onPrep:v10 onRow:v9 onError:v11];

  if (v9)
  {
    (*(void (**)(void))(a1[8] + 16))();
    uint64_t v12 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
    uint64_t v12 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = v13;

  return *v12;
}

void __99__TRIExperimentHistoryDatabase_enumerateRecordsNewerThanDate_matchingDeploymentEnvironments_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":matching_envs" toNSSet:v3];
  [*(id *)(a1 + 40) timeIntervalSince1970];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":threshold");
}

- (BOOL)expireRecordsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 289, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__TRIExperimentHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke;
  v12[3] = &unk_1E6BB7E08;
  v12[4] = self;
  id v8 = v7;
  id v14 = &v16;
  id v15 = a4;
  id v13 = v8;
  [(TRIExperimentHistoryDatabase *)self writeTransactionWithFailableBlock:v12];
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __72__TRIExperimentHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __72__TRIExperimentHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2;
  id v24 = &unk_1E6BB7C50;
  id v25 = *(id *)(a1 + 40);
  id v5 = [v4 createTempTableContainingRowsFromQuery:@" SELECT rowid FROM         experimentHistory WHERE         eventSecondsFromEpoch < :threshold" bind:&v21 namePrefix:@"remove_hist_rowids" transaction:v3];

  if (!v5)
  {
    char v19 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
LABEL_9:
    uint64_t v11 = *v19;
    goto LABEL_10;
  }
  id v6 = [NSString alloc];
  id v7 = objc_msgSend(v6, "initWithFormat:", @" DELETE FROM     experimentHistoryNamespaces WHERE     experimentHistory_rowid IN %@;",
                 v5,
                 v21,
                 v22,
                 v23,
                 v24);
  id v8 = [v3 db];
  char v9 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
  int v10 = [v8 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:v9];

  uint64_t v11 = *MEMORY[0x1E4F93BF0];
  if (v10)
  {
    uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @" DELETE FROM     experimentHistory WHERE     rowid IN %@;",
                    v5);
    id v13 = [v3 db];
    id v14 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
    int v15 = [v13 prepAndRunQuery:v12 onPrep:0 onRow:0 onError:v14];

    if (v15)
    {
      id v16 = [v3 db];
      int v17 = sqlite3_changes((sqlite3 *)[v16 handle]);

      if ([*(id *)(*(void *)(a1 + 32) + 8) dropTableWithName:v5 transaction:v3])
      {
        uint64_t v18 = *(void **)(a1 + 56);
        if (v18) {
          void *v18 = v17;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        char v19 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
        goto LABEL_9;
      }
    }
  }
LABEL_10:

  return v11;
}

void __72__TRIExperimentHistoryDatabase_expireRecordsOlderThanDate_deletedCount___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":threshold");
}

- (id)getAllAllocationStatusesForExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 363, @"Invalid parameter not satisfying: %@", @"deploymentId" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  int v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 362, @"Invalid parameter not satisfying: %@", @"experimentId" object file lineNumber description];

  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_9:
  int v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"TRIExperimentHistoryDatabase.m", 364, @"Invalid parameter not satisfying: %@", @"treatmentId" object file lineNumber description];

LABEL_4:
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = "experimentHistory";
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__59;
  id v30 = __Block_byref_object_dispose__59;
  id v31 = (id)objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke;
  v18[3] = &unk_1E6BBE6D8;
  uint64_t v22 = v33;
  id v11 = v9;
  id v19 = v11;
  int v25 = a4;
  id v12 = v10;
  uint64_t v23 = v32;
  id v24 = &v26;
  id v20 = v12;
  uint64_t v21 = self;
  [(TRIExperimentHistoryDatabase *)self readTransactionWithFailableBlock:v18];
  id v13 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);

  return v13;
}

uint64_t __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke_2;
  v11[3] = &unk_1E6BB9AF8;
  id v12 = *(id *)(a1 + 32);
  int v14 = *(_DWORD *)(a1 + 80);
  id v13 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke_3;
  v9[3] = &unk_1E6BB7DB8;
  long long v10 = *(_OWORD *)(a1 + 64);
  id v4 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 prepAndRunQuery:@"SELECT * FROM experimentHistory WHERE         experimentId = :experiment_id    AND deploymentId = :deployment_id    AND treatmentId = :treatment_id ORDER BY rowid DESC" onPrep:v11 onRow:v9 onError:v4];

  LODWORD(a1) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
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

void __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":experiment_id" toNSString:v3];
  [v4 bindNamedParam:":deployment_id" toInt64:*(int *)(a1 + 48)];
  [v4 bindNamedParam:":treatment_id" toNSString:*(void *)(a1 + 40)];
}

uint64_t __97__TRIExperimentHistoryDatabase_getAllAllocationStatusesForExperimentId_deploymentId_treatmentId___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 v3 = [a2 getInt64ForColumnName:"eventType" table:"experimentHistory"];
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [NSNumber numberWithUnsignedChar:v3];
  [v4 addObject:v5];

  return *MEMORY[0x1E4F93C08];
}

- (void).cxx_destruct
{
}

@end