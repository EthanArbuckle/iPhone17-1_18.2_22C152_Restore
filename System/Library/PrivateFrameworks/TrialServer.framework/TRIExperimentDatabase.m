@interface TRIExperimentDatabase
- ($61A80719B04F7407D3E47539F1B23CAA)addExperimentWithExperimentDeployment:(id)a3 environment:(int)a4 type:(int)a5 status:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 namespaces:(id)a9 artifact:(id)a10;
- ($61A80719B04F7407D3E47539F1B23CAA)removeExperimentRecordWithExperimentDeployment:(id)a3;
- (BOOL)_enumerateExperimentRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5;
- (BOOL)enumerateActiveExperimentRecordsWithVisibility:(unsigned int)a3 block:(id)a4;
- (BOOL)enumerateExperimentRecordsMatchingExperimentId:(id)a3 block:(id)a4;
- (BOOL)enumerateExperimentRecordsMatchingNamespaceName:(id)a3 block:(id)a4;
- (BOOL)enumerateExperimentRecordsMatchingStatuses:(id)a3 block:(id)a4;
- (BOOL)enumerateExperimentRecordsWithBlock:(id)a3;
- (BOOL)enumerateNamespaceRecordsForExperimentDeployment:(id)a3 usingTransaction:(id)a4 block:(id)a5;
- (BOOL)hasRecordReferencingFactorPackSetId:(id)a3 withReferenceType:(unsigned int)a4;
- (BOOL)hasRecordReferencingTreatmentId:(id)a3 withReferenceType:(unsigned int)a4;
- (BOOL)namespacesAreAvailableForExperiment:(id)a3 startDate:(id)a4 endDate:(id)a5 namespaces:(id)a6;
- (BOOL)setManuallyTargeted:(BOOL)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5;
- (BOOL)setStatus:(int64_t)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5;
- (BOOL)setTreatmentId:(id)a3 factorPackSetId:(id)a4 forExperimentDeployment:(id)a5 usingTransaction:(id)a6;
- (BOOL)setTreatmentId:(id)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5;
- (BOOL)setTreatmentURL:(id)a3 forExperimentDeployment:(id)a4 namespaceName:(id)a5;
- (BOOL)updateEndDate:(id)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5;
- (TRIExperimentDatabase)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)_statusTypesForFactorPackSetReferenceType:(unsigned int)a3;
- (id)experimentRecordWithExperimentDeployment:(id)a3;
- (id)treatmentURLsForExperimentDeployment:(id)a3 usingTransaction:(id)a4;
- (void)activeCountWithCompletion:(id)a3;
@end

@implementation TRIExperimentDatabase

- (BOOL)_enumerateExperimentRecordsMatchingWhereClause:(id)a3 bind:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if ((v9 == 0) != (v10 == 0))
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 474, @"Invalid parameter not satisfying: %@", @"(whereClause == nil) == (bind == nil)" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 475, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  context = (void *)MEMORY[0x1E016E7F0]();
  v13 = objc_opt_new();
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__38;
  v63 = __Block_byref_object_dispose__38;
  id v64 = 0;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke;
  v58[3] = &unk_1E6BBCF90;
  v58[4] = &v59;
  v14 = (void *)MEMORY[0x1E016EA80](v58);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_2;
  v54[3] = &unk_1E6BB7CF0;
  v57 = &v59;
  id v15 = v13;
  id v55 = v15;
  id v16 = v12;
  id v56 = v16;
  v17 = (void *)MEMORY[0x1E016EA80](v54);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_3;
  v52[3] = &unk_1E6BBCFB8;
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
  v41[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_4;
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
  v23 = (void *)MEMORY[0x1E016EA80](v41);

  _Block_object_dispose(&v48, 8);
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  LOBYTE(v51) = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_131;
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
  [(TRIExperimentDatabase *)self readTransactionWithFailableBlock:v33];
  char v28 = *((unsigned char *)v49 + 24);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v59, 8);

  return v28;
}

- (BOOL)enumerateExperimentRecordsWithBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 663, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  BOOL v6 = [(TRIExperimentDatabase *)self _enumerateExperimentRecordsMatchingWhereClause:0 bind:0 block:v5];

  return v6;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db readTransactionWithFailableBlock:a3];
}

- (void)activeCountWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F347B2B8];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__TRIExperimentDatabase_CountProviding__activeCountWithCompletion___block_invoke;
  v9[3] = &unk_1E6BB9508;
  v9[4] = &v14;
  v9[5] = &v10;
  BOOL v6 = (void *)MEMORY[0x1E016EA80](v9);
  if ([(TRIExperimentDatabase *)self enumerateExperimentRecordsMatchingStatuses:v5 block:v6])
  {
    uint64_t v7 = v15[3];
    uint64_t v8 = v11[3];
  }
  else
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v4[2](v4, v7, v8);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

uint64_t __67__TRIExperimentDatabase_CountProviding__activeCountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isShadow] & 1) == 0)
  {
    if ([v5 deploymentEnvironment]) {
      uint64_t v3 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v3 = *(void *)(a1 + 32);
    }
    ++*(void *)(*(void *)(v3 + 8) + 24);
  }
  return MEMORY[0x1F41817F8]();
}

- (TRIExperimentDatabase)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 32, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIExperimentDatabase;
  uint64_t v7 = [(TRIExperimentDatabase *)&v11 init];
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

- ($61A80719B04F7407D3E47539F1B23CAA)addExperimentWithExperimentDeployment:(id)a3 environment:(int)a4 type:(int)a5 status:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 namespaces:(id)a9 artifact:(id)a10
{
  uint64_t v13 = *(void *)&a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a7;
  id v38 = a8;
  id v19 = a9;
  id v20 = a10;
  if (v17)
  {
    if (v19) {
      goto LABEL_3;
    }
LABEL_27:
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 56, @"Invalid parameter not satisfying: %@", @"namespaces" object file lineNumber description];

    if (v20) {
      goto LABEL_4;
    }
    goto LABEL_28;
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 55, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];

  if (!v19) {
    goto LABEL_27;
  }
LABEL_3:
  if (v20) {
    goto LABEL_4;
  }
LABEL_28:
  id v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 57, @"Invalid parameter not satisfying: %@", @"artifact" object file lineNumber description];

LABEL_4:
  if ((v13 & 0xFFFFFFFD) == 1)
  {
    id v21 = objc_opt_new();
    id v22 = objc_msgSend(v19, "_pas_leftFoldWithInitialObject:accumulate:", v21, &__block_literal_global_23);

    uint64_t v23 = [v22 count];
    if (v23 != [v19 count])
    {
      id v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v30 = [v17 shortDesc];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v30;
        _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Namespace names in experiment %{public}@ are not unique.", buf, 0xCu);
      }
      goto LABEL_18;
    }

    if (v18 && v38 && [v18 compare:v38] != -1)
    {
      id v24 = TRILogCategory_Server();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v31 = [v17 shortDesc];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2114;
        unint64_t v51 = v31;
        _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "Start date (%@) does not precede end date (%@) in experiment %{public}@.", buf, 0x20u);
      }
      goto LABEL_18;
    }
    if v13 == 2 || ([v17 hasDeploymentId])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2810000000;
      unint64_t v51 = "";
      uint64_t v52 = 0;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_33;
      v39[3] = &unk_1E6BBCF40;
      int v48 = a4;
      int v49 = v13;
      id v40 = v17;
      int64_t v47 = a6;
      id v41 = v18;
      id v42 = v38;
      id v43 = v20;
      id v44 = self;
      v46 = buf;
      id v45 = v19;
      [(TRIExperimentDatabase *)self writeTransactionWithFailableBlock:v39];
      v27.var0 = *(void *)(*(void *)&buf[8] + 32);

      _Block_object_dispose(buf, 8);
      goto LABEL_19;
    }
    id v25 = TRILogCategory_Server();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v32 = TRICloudKitSupport_NotificationType_EnumDescriptor();
      v33 = [v32 textFormatNameForValue:v13];
      id v34 = [v17 experimentId];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v34;
      _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Refusing to add experiment record of type %@ with id %{public}@ and missing deploymentId", buf, 0x16u);
    }
  }
  else
  {
    id v25 = TRILogCategory_Server();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v29 = [v17 shortDesc];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v13;
      *(_WORD *)&buf[8] = 2114;
      *(void *)&buf[10] = v29;
      _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Refusing to add experiment record of type %d with experiment deployment  %{public}@", buf, 0x12u);
    }
  }

LABEL_18:
  v27.var0 = 0;
LABEL_19:

  return v27;
}

id __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 name];
  [v4 addObject:v5];

  return v4;
}

uint64_t __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 db];
  sqlite3_set_last_insert_rowid((sqlite3 *)[v4 handle], 0x8000000000000000);

  id v5 = [v3 db];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_2;
  v34[3] = &unk_1E6BBCF18;
  int v40 = *(_DWORD *)(a1 + 96);
  id v6 = *(id *)(a1 + 32);
  int v41 = *(_DWORD *)(a1 + 100);
  uint64_t v7 = *(void *)(a1 + 88);
  id v35 = v6;
  uint64_t v39 = v7;
  id v36 = *(id *)(a1 + 40);
  id v37 = *(id *)(a1 + 48);
  id v38 = *(id *)(a1 + 56);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 64) + 8) generalErrorHandlerWithOutError:0];
  char v9 = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT OR IGNORE INTO experiments(    deploymentEnvironment,     experimentId,     deploymentId,     type,     status,     startSecondsFromEpoch,     endSecondsFromEpoch,     isShadow,     artifact) VALUES(    :deployment_env,     :experiment_id,     :deployment_id,     :type,     :status,     :start_seconds,     :end_seconds,     :is_shadow,     :artifact);",
         v34,
         0,
         v8);

  if (v9)
  {
    id v10 = [v3 db];
    sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)[v10 handle]);

    sqlite3_int64 v28 = insert_rowid;
    if (insert_rowid == 0x8000000000000000)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v13 = 2;
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = *(id *)(a1 + 72);
      uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            id v20 = (void *)MEMORY[0x1E016E7F0]();
            id v21 = v3;
            id v22 = [v3 db];
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_3;
            v29[3] = &unk_1E6BB7C78;
            v29[4] = v19;
            v29[5] = v28;
            uint64_t v23 = [*(id *)(*(void *)(a1 + 64) + 8) generalErrorHandlerWithOutError:0];
            int v24 = objc_msgSend(v22, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO namespaces(    experiments_rowid,     name,     compatibilityVersion) VALUES(    :experiments_rowid,     :name,     :compatibility_version);",
                    v29,
                    0,
                    v23);

            if (!v24)
            {
              *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = 0;
              uint64_t v25 = *MEMORY[0x1E4F93BF0];

              id v3 = v21;
              goto LABEL_16;
            }
            id v3 = v21;
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v13 = 1;
    }
    *(void *)(v12 + 32) = v13;
    uint64_t v14 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = 0;
    uint64_t v14 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  uint64_t v25 = *v14;
LABEL_16:

  return v25;
}

void __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  [v12 bindNamedParam:":deployment_env" toInt64:*(int *)(a1 + 72)];
  id v3 = [*(id *)(a1 + 32) experimentId];
  [v12 bindNamedParam:":experiment_id" toNSString:v3];

  objc_msgSend(v12, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  [v12 bindNamedParam:":type" toInt64:*(int *)(a1 + 76)];
  [v12 bindNamedParam:":status" toInt64:*(void *)(a1 + 64)];
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = NSNumber;
    [v4 timeIntervalSince1970];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    [v12 bindNamedParam:":start_seconds" toDoubleAsNSNumber:v6];
  }
  else
  {
    [v12 bindNamedParam:":start_seconds" toDoubleAsNSNumber:0];
  }
  uint64_t v7 = *(void **)(a1 + 48);
  if (v7)
  {
    uint64_t v8 = NSNumber;
    [v7 timeIntervalSince1970];
    char v9 = objc_msgSend(v8, "numberWithDouble:");
    [v12 bindNamedParam:":end_seconds" toDoubleAsNSNumber:v9];
  }
  else
  {
    [v12 bindNamedParam:":end_seconds" toDoubleAsNSNumber:0];
  }
  id v10 = [*(id *)(a1 + 56) experiment];
  objc_msgSend(v12, "bindNamedParam:toInt64:", ":is_shadow", objc_msgSend(v10, "hasShadowEvaluation"));

  objc_super v11 = [*(id *)(a1 + 56) data];
  [v12 bindNamedParam:":artifact" toNSData:v11];
}

void __125__TRIExperimentDatabase_addExperimentWithExperimentDeployment_environment_type_status_startDate_endDate_namespaces_artifact___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  [v5 bindNamedParam:":experiments_rowid" toInt64:v3];
  id v4 = [*(id *)(a1 + 32) name];
  [v5 bindNamedParam:":name" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":compatibility_version", objc_msgSend(*(id *)(a1 + 32), "compatibilityVersion"));
}

- (BOOL)setStatus:(int64_t)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 185, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke;
  v17[3] = &unk_1E6BB7E08;
  int64_t v21 = a3;
  id v11 = v9;
  id v18 = v11;
  uint64_t v19 = self;
  id v20 = &v22;
  uint64_t v12 = MEMORY[0x1E016EA80](v17);
  uint64_t v13 = (void *)v12;
  if (v10) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v10);
  }
  else {
    [(TRIExperimentDatabase *)self writeTransactionWithFailableBlock:v12];
  }
  char v14 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB7C78;
  uint64_t v14 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke_2, &unk_1E6BB7C78);
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE experiments SET         status = :status WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;",
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

void __76__TRIExperimentDatabase_setStatus_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  [v5 bindNamedParam:":status" toInt64:v3];
  id v4 = [*(id *)(a1 + 32) experimentId];
  [v5 bindNamedParam:":experiment_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)setTreatmentId:(id)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke;
  id v20 = &unk_1E6BB7CA0;
  id v11 = v8;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  uint64_t v23 = self;
  uint64_t v24 = &v25;
  uint64_t v13 = MEMORY[0x1E016EA80](&v17);
  uint64_t v14 = (void *)v13;
  if (v10) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v10);
  }
  else {
    -[TRIExperimentDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v13, v17, v18, v19, v20, v21);
  }
  char v15 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return v15;
}

uint64_t __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB8628;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke_2, &unk_1E6BB8628);
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE experiments SET         treatmentId = :treatment_id WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;",
         v12,
         0,
         v5);

  if (v6)
  {
    id v7 = [v3 db];
    int v8 = sqlite3_changes((sqlite3 *)[v7 handle]);

    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
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
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v10;
}

void __81__TRIExperimentDatabase_setTreatmentId_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":treatment_id" toNSString:v3];
  id v4 = [*(id *)(a1 + 40) experimentId];
  [v5 bindNamedParam:":experiment_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 40), "deploymentId"));
}

- (BOOL)setTreatmentId:(id)a3 factorPackSetId:(id)a4 forExperimentDeployment:(id)a5 usingTransaction:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 274, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];
  }
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__TRIExperimentDatabase_setTreatmentId_factorPackSetId_forExperimentDeployment_usingTransaction___block_invoke;
  v23[3] = &unk_1E6BB7F20;
  id v15 = v11;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  id v17 = v13;
  id v26 = v17;
  uint64_t v27 = self;
  char v28 = &v29;
  uint64_t v18 = MEMORY[0x1E016EA80](v23);
  uint64_t v19 = (void *)v18;
  if (v14) {
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v14);
  }
  else {
    [(TRIExperimentDatabase *)self writeTransactionWithFailableBlock:v18];
  }
  char v20 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return v20;
}

uint64_t __97__TRIExperimentDatabase_setTreatmentId_factorPackSetId_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__TRIExperimentDatabase_setTreatmentId_factorPackSetId_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB7EF8;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v5 = [*(id *)(*(void *)(a1 + 56) + 8) generalErrorHandlerWithOutError:0];
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE experiments SET         treatmentId = :treatment_id,     factorPackSetId = :factor_pack_set_id WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;",
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

void __97__TRIExperimentDatabase_setTreatmentId_factorPackSetId_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":treatment_id" toNSString:v3];
  [v5 bindNamedParam:":factor_pack_set_id" toNSString:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 48) experimentId];
  [v5 bindNamedParam:":experiment_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (BOOL)setTreatmentURL:(id)a3 forExperimentDeployment:(id)a4 namespaceName:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 328, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 327, @"Invalid parameter not satisfying: %@", @"treatmentURL" object file lineNumber description];

  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_12:
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 329, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_4:
  id v12 = [v9 triSaveURLToString];
  if (v12)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __79__TRIExperimentDatabase_setTreatmentURL_forExperimentDeployment_namespaceName___block_invoke;
    v19[3] = &unk_1E6BB7F20;
    id v20 = v10;
    id v21 = v12;
    id v22 = v11;
    uint64_t v23 = self;
    p_long long buf = &buf;
    [(TRIExperimentDatabase *)self writeTransactionWithFailableBlock:v19];
    BOOL v13 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "failed to convert URL to string: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __79__TRIExperimentDatabase_setTreatmentURL_forExperimentDeployment_namespaceName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__TRIExperimentDatabase_setTreatmentURL_forExperimentDeployment_namespaceName___block_invoke_2;
  v12[3] = &unk_1E6BB7EF8;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v5 = [*(id *)(*(void *)(a1 + 56) + 8) generalErrorHandlerWithOutError:0];
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" WITH experiments_rowids AS(    SELECT rowid FROM             experiments     WHERE             experimentId = :experiment_id         AND deploymentId = :deployment_id     LIMIT 1) UPDATE namespaces SET         treatmentPath = :treatment_path WHERE         name = :namespace_name     AND experiments_rowid IN experiments_rowids;",
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

void __79__TRIExperimentDatabase_setTreatmentURL_forExperimentDeployment_namespaceName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 experimentId];
  [v5 bindNamedParam:":experiment_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  [v5 bindNamedParam:":treatment_path" toNSString:*(void *)(a1 + 40)];
  [v5 bindNamedParam:":namespace_name" toNSString:*(void *)(a1 + 48)];
}

- (BOOL)setManuallyTargeted:(BOOL)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 384, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke;
  v17[3] = &unk_1E6BBBCA0;
  BOOL v21 = a3;
  id v11 = v9;
  id v18 = v11;
  uint64_t v19 = self;
  id v20 = &v22;
  uint64_t v12 = MEMORY[0x1E016EA80](v17);
  id v13 = (void *)v12;
  if (v10) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v10);
  }
  else {
    [(TRIExperimentDatabase *)self writeTransactionWithFailableBlock:v12];
  }
  char v14 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BBCF68;
  char v14 = *(unsigned char *)(a1 + 56);
  id v13 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke_2, &unk_1E6BBCF68);
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE experiments SET         isManuallyTargeted = :is_manually_targeted WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;",
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

void __86__TRIExperimentDatabase_setManuallyTargeted_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v5 = a2;
  [v5 bindNamedParam:":is_manually_targeted" toInt64:v3];
  id v4 = [*(id *)(a1 + 32) experimentId];
  [v5 bindNamedParam:":experiment_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)updateEndDate:(id)a3 forExperimentDeployment:(id)a4 usingTransaction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 429, @"Invalid parameter not satisfying: %@", @"updatedEndDate" object file lineNumber description];
  }
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke;
  v19[3] = &unk_1E6BB7CA0;
  id v12 = v9;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  uint64_t v22 = self;
  uint64_t v23 = &v24;
  uint64_t v14 = MEMORY[0x1E016EA80](v19);
  id v15 = (void *)v14;
  if (v11) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v11);
  }
  else {
    [(TRIExperimentDatabase *)self writeTransactionWithFailableBlock:v14];
  }
  char v16 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v16;
}

uint64_t __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB8628;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke_2, &unk_1E6BB8628);
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE experiments SET         endSecondsFromEpoch = :end_seconds WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id;",
         v12,
         0,
         v5);

  if (v6)
  {
    id v7 = [v3 db];
    int v8 = sqlite3_changes((sqlite3 *)[v7 handle]);

    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
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
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v10;
}

void __80__TRIExperimentDatabase_updateEndDate_forExperimentDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = NSNumber;
    [v3 timeIntervalSince1970];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
    [v7 bindNamedParam:":end_seconds" toDoubleAsNSNumber:v5];
  }
  else
  {
    [v7 bindNamedParam:":end_seconds" toDoubleAsNSNumber:0];
  }
  char v6 = [*(id *)(a1 + 40) experimentId];
  [v7 bindNamedParam:":experiment_id" toNSString:v6];

  objc_msgSend(v7, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 40), "deploymentId"));
}

void __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3)
  {
    id v5 = (void *)[*(id *)(a1 + 32) copy];
    char v6 = (void *)[v3 copyWithReplacementNamespaces:v5];

    if (!*a2) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 removeAllObjects];
}

uint64_t __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_4(void *a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"rowid" table:"experiments"];
  if (v4 == *(void *)(*(void *)(a1[8] + 8) + 24)) {
    goto LABEL_2;
  }
  (*(void (**)(void))(a1[5] + 16))();
  if (*(unsigned char *)(*(void *)(a1[9] + 8) + 24))
  {
    uint64_t v11 = *MEMORY[0x1E4F93C10];
    goto LABEL_11;
  }
  uint64_t v13 = [v3 getInt64ForColumnName:"deploymentEnvironment" table:"experiments"];
  int v41 = [v3 getNSStringForColumnName:"experimentId" table:"experiments"];
  uint64_t v14 = [v3 getInt64ForColumnName:"deploymentId" table:"experiments"];
  uint64_t v37 = [v3 getInt64ForColumnName:"type" table:"experiments"];
  uint64_t v36 = [v3 getInt64ForColumnName:"status" table:"experiments"];
  id v15 = [v3 getDoubleAsNSNumberForColumnName:"startSecondsFromEpoch" table:"experiments"];
  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v15 doubleValue];
    int v40 = objc_msgSend(v16, "initWithTimeIntervalSince1970:");
  }
  else
  {
    int v40 = 0;
  }

  id v17 = [v3 getDoubleAsNSNumberForColumnName:"endSecondsFromEpoch" table:"experiments"];
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v17 doubleValue];
    uint64_t v19 = objc_msgSend(v18, "initWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v19 = 0;
  }

  uint64_t v39 = [v3 getNSStringForColumnName:"treatmentId" table:"experiments"];
  id v38 = [v3 getNSStringForColumnName:"factorPackSetId" table:"experiments"];
  uint64_t v20 = [v3 getInt64ForColumnName:"isShadow" table:"experiments"];
  uint64_t v21 = [v3 getInt64ForColumnName:"isManuallyTargeted" table:"experiments"];
  uint64_t v22 = [v3 getNSDataForColumnName:"artifact" table:"experiments"];
  if (!v22)
  {
    char v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a1[10] object:a1[4] file:@"TRIExperimentDatabase.m" lineNumber:550 description:@"Unexpected NULL artifact"];
  }
  id v42 = 0;
  uint64_t v23 = +[TRIClientExperimentArtifact parseFromData:v22 error:&v42];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    uint64_t v35 = v13;
    char v25 = v19;

    uint64_t v26 = v41;
    if (!v41)
    {
      long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a1[10] object:a1[4] file:@"TRIExperimentDatabase.m" lineNumber:561 description:@"Unexpected NULL experimentId"];

      uint64_t v26 = 0;
    }
    BOOL v27 = v21 != 0;
    uint64_t v28 = [MEMORY[0x1E4FB00F8] deploymentWithExperimentId:v26 deploymentId:v14];
    uint64_t v29 = [TRIExperimentRecord alloc];
    BYTE1(v34) = v27;
    LOBYTE(v34) = v20 != 0;
    long long v30 = -[TRIExperimentRecord initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:](v29, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", v35, v28, v39, v38, v37, v36, v40, v25, MEMORY[0x1E4F1CBF0], v34, v24);
    (*(void (**)(void))(a1[6] + 16))();

LABEL_2:
    id v5 = [v3 getNSStringForColumnName:"name" table:"namespaces"];
    if (!v5)
    {
LABEL_8:
      *(void *)(*(void *)(a1[8] + 8) + 24) = v4;
      uint64_t v11 = *MEMORY[0x1E4F93C08];

      goto LABEL_11;
    }
    uint64_t v6 = [v3 getInt64ForColumnName:"compatibilityVersion" table:"namespaces"];
    uint64_t v7 = [v3 getNSStringForColumnName:"treatmentPath" table:"namespaces"];
    if (v7)
    {
      int v8 = [MEMORY[0x1E4F1CB10] triParseURLFromString:v7];
      if (v8)
      {
LABEL_7:
        id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB01C8]) initWithName:v5 compatibilityVersion:v6 treatmentURL:v8];
        (*(void (**)(void))(a1[7] + 16))();

        goto LABEL_8;
      }
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a1[10], a1[4], @"TRIExperimentDatabase.m", 588, @"failed to parse url from %@", v7 object file lineNumber description];
    }
    int v8 = 0;
    goto LABEL_7;
  }
  uint64_t v31 = TRILogCategory_Server();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543874;
    id v44 = v41;
    __int16 v45 = 1024;
    int v46 = v14;
    __int16 v47 = 2114;
    id v48 = v42;
    _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Failed to parse persisted TRIClientExperiment Artifact for %{public}@.%d: %{public}@", buf, 0x1Cu);
  }

  uint64_t v11 = *MEMORY[0x1E4F93C08];
LABEL_11:

  return v11;
}

uint64_t __83__TRIExperimentDatabase__enumerateExperimentRecordsMatchingWhereClause_bind_block___block_invoke_131(void *a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = (__CFString *)a1[4];
  if (!v6) {
    uint64_t v6 = &stru_1F3455898;
  }
  uint64_t v7 = objc_msgSend(v5, "initWithFormat:", @" SELECT * FROM     experiments AS e LEFT JOIN     namespaces AS n ON     e.rowid = n.experiments_rowid %@ ORDER BY     e.rowid ASC,     n.rowid ASC;",
                 v6);
  int v8 = [v4 db];

  uint64_t v10 = a1[6];
  uint64_t v9 = a1[7];
  uint64_t v11 = [*(id *)(a1[5] + 8) generalErrorHandlerWithOutError:0];
  LODWORD(v9) = [v8 prepAndRunQuery:v7 onPrep:v10 onRow:v9 onError:v11];

  if (v9)
  {
    (*(void (**)(void))(a1[8] + 16))();
    id v12 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
    id v12 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = v13;

  return *v12;
}

- (id)experimentRecordWithExperimentDeployment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 640, @"Invalid parameter not satisfying: %@", @"experiment" object file lineNumber description];
  }
  uint64_t v6 = [v5 experimentId];

  if (!v6)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 641, @"Invalid parameter not satisfying: %@", @"experiment.experimentId" object file lineNumber description];
  }
  if (([v5 hasDeploymentId] & 1) == 0)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 642, @"Invalid parameter not satisfying: %@", @"experiment.hasDeploymentId" object file lineNumber description];
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__38;
  uint64_t v21 = __Block_byref_object_dispose__38;
  id v22 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__TRIExperimentDatabase_experimentRecordWithExperimentDeployment___block_invoke;
  v15[3] = &unk_1E6BB7C50;
  id v7 = v5;
  id v16 = v7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__TRIExperimentDatabase_experimentRecordWithExperimentDeployment___block_invoke_2;
  v14[3] = &unk_1E6BBB310;
  v14[4] = &v17;
  if ([(TRIExperimentDatabase *)self _enumerateExperimentRecordsMatchingWhereClause:@" WHERE         e.experimentId = :experiment_id     AND e.deploymentId = :deployment_id" bind:v15 block:v14])
  {
    int v8 = (void *)v18[5];
  }
  else
  {
    int v8 = 0;
  }
  id v9 = v8;

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __66__TRIExperimentDatabase_experimentRecordWithExperimentDeployment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 experimentId];
  [v5 bindNamedParam:":experiment_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

void __66__TRIExperimentDatabase_experimentRecordWithExperimentDeployment___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (BOOL)enumerateExperimentRecordsMatchingExperimentId:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 671, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__TRIExperimentDatabase_enumerateExperimentRecordsMatchingExperimentId_block___block_invoke;
  v13[3] = &unk_1E6BB7C50;
  id v14 = v7;
  id v9 = v7;
  BOOL v10 = [(TRIExperimentDatabase *)self _enumerateExperimentRecordsMatchingWhereClause:@" WHERE e.experimentId = :experiment_id" bind:v13 block:v8];

  return v10;
}

uint64_t __78__TRIExperimentDatabase_enumerateExperimentRecordsMatchingExperimentId_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":experiment_id" toNSString:*(void *)(a1 + 32)];
}

- (BOOL)enumerateExperimentRecordsMatchingStatuses:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 683, @"Invalid parameter not satisfying: %@", @"statuses" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__TRIExperimentDatabase_enumerateExperimentRecordsMatchingStatuses_block___block_invoke;
  v13[3] = &unk_1E6BB7C50;
  id v14 = v7;
  id v9 = v7;
  BOOL v10 = [(TRIExperimentDatabase *)self _enumerateExperimentRecordsMatchingWhereClause:@" WHERE e.status IN _pas_nsset(:status_set)" bind:v13 block:v8];

  return v10;
}

uint64_t __74__TRIExperimentDatabase_enumerateExperimentRecordsMatchingStatuses_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":status_set" toNSSet:*(void *)(a1 + 32)];
}

- (BOOL)enumerateExperimentRecordsMatchingNamespaceName:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 695, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__TRIExperimentDatabase_enumerateExperimentRecordsMatchingNamespaceName_block___block_invoke;
  v13[3] = &unk_1E6BB7C50;
  id v14 = v7;
  id v9 = v7;
  BOOL v10 = [(TRIExperimentDatabase *)self _enumerateExperimentRecordsMatchingWhereClause:@" WHERE n.name = :namespace_name" bind:v13 block:v8];

  return v10;
}

uint64_t __79__TRIExperimentDatabase_enumerateExperimentRecordsMatchingNamespaceName_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":namespace_name" toNSString:*(void *)(a1 + 32)];
}

- (BOOL)enumerateNamespaceRecordsForExperimentDeployment:(id)a3 usingTransaction:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 708, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 709, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke;
  v21[3] = &unk_1E6BBCFE0;
  id v13 = v9;
  SEL v26 = a2;
  id v22 = v13;
  uint64_t v23 = self;
  id v14 = v12;
  id v24 = v14;
  char v25 = &v27;
  uint64_t v15 = MEMORY[0x1E016EA80](v21);
  id v16 = (void *)v15;
  if (v10) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v10);
  }
  else {
    [(TRIExperimentDatabase *)self readTransactionWithFailableBlock:v15];
  }
  char v17 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v17;
}

uint64_t __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_2;
  v16[3] = &unk_1E6BB7C50;
  id v17 = *(id *)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_3;
  v12[3] = &unk_1E6BB8E08;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v13 = v4;
  id v14 = v5;
  uint64_t v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_3, &unk_1E6BB8E08, v13);
  int v7 = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" WITH experiments_rowids AS(    SELECT rowid FROM             experiments     WHERE             experimentId = :experiment_id         AND deploymentId = :deployment_id     LIMIT 1) SELECT * FROM     namespaces WHERE     experiments_rowid IN experiments_rowids ORDER BY rowid ASC;",
         v16,
         v12,
         v6);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  id v9 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];

  if (v7) {
    id v10 = v8;
  }
  else {
    id v10 = v9;
  }
  return *v10;
}

void __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v3 experimentId];
  [v5 bindNamedParam:":experiment_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

uint64_t __97__TRIExperimentDatabase_enumerateNamespaceRecordsForExperimentDeployment_usingTransaction_block___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnName:"name" table:0];
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a1[6] object:a1[4] file:@"TRIExperimentDatabase.m" lineNumber:733 description:@"NULL namespaceName decoded from NOT NULL column"];
  }
  uint64_t v5 = [v3 getInt64ForColumnName:"compatibilityVersion" table:0];
  uint64_t v6 = [v3 getNSStringForColumnName:"treatmentPath" table:0];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F1CB10] triParseURLFromString:v6];
    if (v7) {
      goto LABEL_7;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a1[6], a1[4], @"TRIExperimentDatabase.m", 740, @"failed to parse url from %@", v6 object file lineNumber description];
  }
  int v7 = 0;
LABEL_7:
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB01C8]) initWithName:v4 compatibilityVersion:v5 treatmentURL:v7];
  unsigned __int8 v16 = 0;
  (*(void (**)(void))(a1[5] + 16))();
  int v10 = v16;
  id v11 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  id v12 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  if (v10) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = v11;
  }
  return *v13;
}

- (id)treatmentURLsForExperimentDeployment:(id)a3 usingTransaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 771, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];
  }
  id v9 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__TRIExperimentDatabase_treatmentURLsForExperimentDeployment_usingTransaction___block_invoke;
  v15[3] = &unk_1E6BBD008;
  id v16 = v9;
  id v10 = v9;
  if ([(TRIExperimentDatabase *)self enumerateNamespaceRecordsForExperimentDeployment:v7 usingTransaction:v8 block:v15])
  {
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

void __79__TRIExperimentDatabase_treatmentURLsForExperimentDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 treatmentURL];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 name];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)namespacesAreAvailableForExperiment:(id)a3 startDate:(id)a4 endDate:(id)a5 namespaces:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (v11)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 786, @"Invalid parameter not satisfying: %@", @"experiment" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
LABEL_8:
      id v12 = (id)objc_opt_new();
      if (v13) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 787, @"Invalid parameter not satisfying: %@", @"namespaces" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_4:
  if (v13) {
    goto LABEL_10;
  }
LABEL_9:
  id v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
LABEL_10:
  if ([v12 compare:v13] == 1)
  {
    id v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [v11 experimentId];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = [v11 deploymentId];
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Trying to enumerate records overlapping inverted time range for experiment: %{public}@, deployment:%d.", buf, 0x12u);
    }
    BOOL v19 = 0;
  }
  else
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v29 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90__TRIExperimentDatabase_namespacesAreAvailableForExperiment_startDate_endDate_namespaces___block_invoke;
    v23[3] = &unk_1E6BBD030;
    id v24 = v11;
    id v25 = v12;
    id v26 = v13;
    id v27 = v15;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__TRIExperimentDatabase_namespacesAreAvailableForExperiment_startDate_endDate_namespaces___block_invoke_2;
    v22[3] = &unk_1E6BBB310;
    v22[4] = buf;
    if ([(TRIExperimentDatabase *)self _enumerateExperimentRecordsMatchingWhereClause:@" WHERE         (e.experimentId != :experiment_id OR e.deploymentId != :deployment_id)     AND e.type IN (:type_update)     AND e.status IN (:status_enroll, :status_active)     AND e.isShadow = 0     AND(            e.startSecondsFromEpoch IS NULL         OR  e.endSecondsFromEpoch IS NULL         OR  max(:start_seconds, e.startSecondsFromEpoch) < min(:end_seconds, e.endSecondsFromEpoch)    )     AND n.name IN _pas_nsarray(:namespaces)" bind:v23 block:v22])
    {
      BOOL v19 = *(unsigned char *)(*(void *)&buf[8] + 24) == 0;
    }
    else
    {
      BOOL v19 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v19;
}

void __90__TRIExperimentDatabase_namespacesAreAvailableForExperiment_startDate_endDate_namespaces___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v3 experimentId];
  [v5 bindNamedParam:":experiment_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
  [v5 bindNamedParam:":type_update" toInt64:1];
  [v5 bindNamedParam:":status_enroll" toInt64:2];
  [v5 bindNamedParam:":status_active" toInt64:1];
  [*(id *)(a1 + 40) timeIntervalSince1970];
  objc_msgSend(v5, "bindNamedParam:toDouble:", ":start_seconds");
  [*(id *)(a1 + 48) timeIntervalSince1970];
  objc_msgSend(v5, "bindNamedParam:toDouble:", ":end_seconds");
  [v5 bindNamedParam:":namespaces" toNSArray:*(void *)(a1 + 56)];
}

uint64_t __90__TRIExperimentDatabase_namespacesAreAvailableForExperiment_startDate_endDate_namespaces___block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- ($61A80719B04F7407D3E47539F1B23CAA)removeExperimentRecordWithExperimentDeployment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 837, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2810000000;
  id v16 = "";
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__TRIExperimentDatabase_removeExperimentRecordWithExperimentDeployment___block_invoke;
  v10[3] = &unk_1E6BB8050;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  id v12 = &v13;
  [(TRIExperimentDatabase *)self writeTransactionWithFailableBlock:v10];
  v7.var0 = v14[4];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __72__TRIExperimentDatabase_removeExperimentRecordWithExperimentDeployment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __72__TRIExperimentDatabase_removeExperimentRecordWithExperimentDeployment___block_invoke_2;
  id v24 = &unk_1E6BB7C50;
  id v25 = *(id *)(a1 + 40);
  id v5 = [v4 createTempTableContainingRowsFromQuery:@" SELECT rowid FROM         experiments WHERE         experimentId = :experiment_id     AND deploymentId = :deployment_id" bind:&v21 namePrefix:@"remove_exp_rowids" transaction:v3];

  if (!v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = 0;
    id v18 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
LABEL_12:
    uint64_t v19 = *v18;
    goto LABEL_13;
  }
  id v6 = [NSString alloc];
  $61A80719B04F7407D3E47539F1B23CAA v7 = objc_msgSend(v6, "initWithFormat:", @" DELETE FROM     namespaces WHERE     experiments_rowid IN %@;",
                 v5,
                 v21,
                 v22,
                 v23,
                 v24);
  id v8 = [v3 db];
  id v9 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
  char v10 = [v8 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:v9];

  if (v10)
  {

    $61A80719B04F7407D3E47539F1B23CAA v7 = objc_msgSend([NSString alloc], "initWithFormat:", @" DELETE FROM     experiments WHERE     rowid IN %@;",
                   v5);
    id v11 = [v3 db];
    id v12 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
    char v13 = [v11 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:v12];

    if (v13)
    {

      id v14 = [v3 db];
      int v15 = sqlite3_changes((sqlite3 *)[v14 handle]);

      int v16 = [*(id *)(*(void *)(a1 + 32) + 8) dropTableWithName:v5 transaction:v3];
      uint64_t v17 = 1;
      if (v15 <= 0) {
        uint64_t v17 = 2;
      }
      if (!v16) {
        uint64_t v17 = 0;
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v17;
      id v18 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
      if (!v16) {
        id v18 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
      }
      goto LABEL_12;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = 0;
  uint64_t v19 = *MEMORY[0x1E4F93BF0];

LABEL_13:
  return v19;
}

void __72__TRIExperimentDatabase_removeExperimentRecordWithExperimentDeployment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v3 experimentId];
  [v5 bindNamedParam:":experiment_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)hasRecordReferencingTreatmentId:(id)a3 withReferenceType:(unsigned int)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 911, @"Invalid parameter not satisfying: %@", @"treatmentId" object file lineNumber description];
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke;
  v12[3] = &unk_1E6BBD058;
  void v12[4] = self;
  unsigned int v15 = a4;
  id v8 = v7;
  id v13 = v8;
  id v14 = &v16;
  [(TRIExperimentDatabase *)self readTransactionWithFailableBlock:v12];
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  id v5 = a2;
  id v6 = [v3 _statusTypesForFactorPackSetReferenceType:v4];
  id v7 = [v5 db];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke_2;
  v16[3] = &unk_1E6BB8628;
  id v17 = *(id *)(a1 + 40);
  id v18 = v6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke_3;
  v15[3] = &unk_1E6BBAFB0;
  void v15[4] = *(void *)(a1 + 48);
  id v8 = *(void **)(*(void *)(a1 + 32) + 8);
  id v9 = v6;
  char v10 = [v8 generalErrorHandlerWithOutError:0];
  LODWORD(v5) = [v7 prepAndRunQuery:@" SELECT * FROM     experiments WHERE         treatmentId = :treatment_id     AND status IN _pas_nsset(:status_set) LIMIT 1" onPrep:v16 onRow:v15 onError:v10];

  id v11 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  id v12 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];

  if (v5) {
    id v13 = v11;
  }
  else {
    id v13 = v12;
  }
  return *v13;
}

void __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":treatment_id" toNSString:v3];
  [v4 bindNamedParam:":status_set" toNSSet:*(void *)(a1 + 40)];
}

uint64_t __75__TRIExperimentDatabase_hasRecordReferencingTreatmentId_withReferenceType___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

- (BOOL)hasRecordReferencingFactorPackSetId:(id)a3 withReferenceType:(unsigned int)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 945, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke;
  v12[3] = &unk_1E6BBD058;
  void v12[4] = self;
  unsigned int v15 = a4;
  id v8 = v7;
  id v13 = v8;
  id v14 = &v16;
  [(TRIExperimentDatabase *)self readTransactionWithFailableBlock:v12];
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  id v5 = a2;
  id v6 = [v3 _statusTypesForFactorPackSetReferenceType:v4];
  id v7 = [v5 db];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_2;
  v16[3] = &unk_1E6BB8628;
  id v17 = *(id *)(a1 + 40);
  id v18 = v6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_3;
  v15[3] = &unk_1E6BBAFB0;
  void v15[4] = *(void *)(a1 + 48);
  id v8 = *(void **)(*(void *)(a1 + 32) + 8);
  id v9 = v6;
  char v10 = [v8 generalErrorHandlerWithOutError:0];
  LODWORD(v5) = [v7 prepAndRunQuery:@" SELECT * FROM     experiments WHERE         factorPackSetId = :factor_pack_set_id     AND status IN _pas_nsset(:status_set) LIMIT 1" onPrep:v16 onRow:v15 onError:v10];

  id v11 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  id v12 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];

  if (v5) {
    id v13 = v11;
  }
  else {
    id v13 = v12;
  }
  return *v13;
}

void __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":factor_pack_set_id" toNSString:v3];
  [v4 bindNamedParam:":status_set" toNSSet:*(void *)(a1 + 40)];
}

uint64_t __79__TRIExperimentDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

- (id)_statusTypesForFactorPackSetReferenceType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  switch(a3)
  {
    case 1u:
      id v6 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F347BA98, 0, v13);
      goto LABEL_8;
    case 3u:
      id v6 = (void *)MEMORY[0x1E016E7F0]();
      id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v12 = &unk_1F347BA98;
      uint64_t v13 = 0;
      goto LABEL_7;
    case 2u:
      id v6 = (void *)MEMORY[0x1E016E7F0]();
      id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v12 = 0;
LABEL_7:
      uint64_t v8 = objc_msgSend(v7, "initWithObjects:", &unk_1F347BA80, v12, v13);
LABEL_8:
      id v9 = (void *)v8;
      if (v9) {
        goto LABEL_10;
      }
      break;
  }
  char v10 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIExperimentDatabase.m", 988, @"Unhandled reference type: 0x%x", v3);

  id v9 = 0;
LABEL_10:
  return v9;
}

- (BOOL)enumerateActiveExperimentRecordsWithVisibility:(unsigned int)a3 block:(id)a4
{
  id v7 = a4;
  if (a3 - 1 >= 3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRIExperimentDatabase.m", 1006, @"Invalid parameter not satisfying: %@", @"andClause" object file lineNumber description];

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = off_1E6BBD078[a3 - 1];
  }
  char v10 = (void *)[[NSString alloc] initWithFormat:@"WHERE status = :status_active %@", v8];
  BOOL v11 = [(TRIExperimentDatabase *)self _enumerateExperimentRecordsMatchingWhereClause:v10 bind:&__block_literal_global_226 block:v7];

  return v11;
}

uint64_t __78__TRIExperimentDatabase_enumerateActiveExperimentRecordsWithVisibility_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":status_active" toInt64:1];
}

- (void).cxx_destruct
{
}

@end