@interface TRIRolloutDatabase
- ($61A80719B04F7407D3E47539F1B23CAA)removeRecordWithDeployment:(id)a3;
- ($61A80719B04F7407D3E47539F1B23CAA)removeRecordWithDeployment:(id)a3 usingRefCounting:(BOOL)a4;
- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 prependingWithClause:(id)a5 usingTransaction:(id)a6 block:(id)a7;
- (BOOL)activateDeployment:(id)a3 withFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 deactivatedDeployments:(id)a6 deactivatedFactorPackSetIds:(id)a7 deactivationStateTransitions:(id)a8 usingTransaction:(id)a9;
- (BOOL)addNewRolloutWithRecord:(id)a3;
- (BOOL)deactivateDeployment:(id)a3 usingTransaction:(id)a4;
- (BOOL)deactivateDeploymentsWithRolloutId:(id)a3 deactivatedDeployment:(id *)a4 deactivatedFactorPackSetId:(id *)a5 deactivatedRampId:(id *)a6 deactivationStateTransitions:(id)a7 usingTransaction:(id)a8;
- (BOOL)enumerateActiveRecordsWithVisibility:(unsigned int)a3 usingTransaction:(id)a4 block:(id)a5;
- (BOOL)enumerateRecordsOverlappingNamespaces:(id)a3 usingTransaction:(id)a4 block:(id)a5;
- (BOOL)enumerateRecordsUsingTransaction:(id)a3 block:(id)a4;
- (BOOL)enumerateRecordsWithRolloutId:(id)a3 usingTransaction:(id)a4 block:(id)a5;
- (BOOL)hasRecordReferencingFactorPackSetId:(id)a3 withReferenceType:(unsigned int)a4;
- (BOOL)setActiveFactorPackSetId:(id)a3 activeTargetingRuleIndex:(id)a4 forDeployment:(id)a5 usingTransaction:(id)a6;
- (BOOL)setStatus:(int64_t)a3 forDeployment:(id)a4 usingTransaction:(id)a5;
- (BOOL)setTargetedFactorPackSetId:(id)a3 targetedTargetingRuleIndex:(id)a4 forDeployment:(id)a5 usingTransaction:(id)a6;
- (BOOL)targetDeployment:(id)a3 toFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 deallocatedDeployments:(id)a6 usingTransaction:(id)a7;
- (TRIRolloutDatabase)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)_dataNoCopyFromStmt:(id)a3 columnName:(const char *)a4;
- (id)recordWithDeployment:(id)a3 usingTransaction:(id)a4;
@end

@implementation TRIRolloutDatabase

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db readTransactionWithFailableBlock:a3];
}

- (BOOL)_enumerateRecordsMatchingWhereClause:(id)a3 bind:(id)a4 prependingWithClause:(id)a5 usingTransaction:(id)a6 block:(id)a7
{
  unint64_t v13 = (unint64_t)a3;
  id v14 = a4;
  unint64_t v15 = (unint64_t)a5;
  id v16 = a6;
  id v17 = a7;
  v18 = v17;
  if ((v14 != 0) == ((v13 | v15) != 0))
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 324, @"Invalid parameter not satisfying: %@", @"((whereClause != nil) || (withClause != nil)) == (bind != nil)" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 325, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  v19 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke;
  v30[3] = &unk_1E6BBBC50;
  id v20 = (id)v15;
  id v31 = v20;
  id v21 = (id)v13;
  id v32 = v21;
  id v22 = v14;
  SEL v37 = a2;
  v33 = self;
  id v34 = v22;
  id v23 = v18;
  id v35 = v23;
  v36 = &v38;
  uint64_t v24 = MEMORY[0x1E016EA80](v30);
  v25 = (void *)v24;
  if (v16) {
    (*(void (**)(uint64_t, id))(v24 + 16))(v24, v16);
  }
  else {
    [(TRIRolloutDatabase *)self readTransactionWithFailableBlock:v24];
  }
  char v26 = *((unsigned char *)v39 + 24);

  _Block_object_dispose(&v38, 8);

  return v26;
}

- (BOOL)enumerateRecordsUsingTransaction:(id)a3 block:(id)a4
{
  return [(TRIRolloutDatabase *)self _enumerateRecordsMatchingWhereClause:0 bind:0 prependingWithClause:0 usingTransaction:a3 block:a4];
}

- (TRIRolloutDatabase)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 38, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIRolloutDatabase;
  v7 = [(TRIRolloutDatabase *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_db, a3);
  }

  return v8;
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db writeTransactionWithFailableBlock:a3];
}

- (BOOL)addNewRolloutWithRecord:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 54, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  id v6 = [v5 namespaces];
  v7 = objc_opt_new();
  v8 = objc_msgSend(v6, "_pas_leftFoldWithInitialObject:accumulate:", v7, &__block_literal_global_18);

  uint64_t v9 = [v8 count];
  v10 = [v5 namespaces];
  uint64_t v11 = [v10 count];

  if (v9 == v11)
  {

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_33;
    v18[3] = &unk_1E6BB8050;
    v18[4] = self;
    id v19 = v5;
    p_long long buf = &buf;
    [(TRIRolloutDatabase *)self writeTransactionWithFailableBlock:v18];
    BOOL v12 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    unint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unint64_t v15 = [v5 deployment];
      id v16 = [v15 shortDesc];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Namespace names in rollout %{public}@ are not unique.", (uint8_t *)&buf, 0xCu);
    }
    BOOL v12 = 0;
  }

  return v12;
}

id __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  [v4 addObject:a3];
  return v4;
}

uint64_t __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) deployment];
  id v6 = [v4 recordWithDeployment:v5 usingTransaction:v3];

  if (v6)
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [*(id *)(a1 + 40) deployment];
      uint64_t v9 = [v8 shortDesc];
      *(_DWORD *)long long buf = 138543362;
      SEL v37 = v9;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Unable to add new rollout deployment %{public}@: already present in database.", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v10 = *MEMORY[0x1E4F93BF0];
  }
  else
  {
    id v11 = [v3 db];
    sqlite3_set_last_insert_rowid((sqlite3 *)[v11 handle], 0x8000000000000000);

    BOOL v12 = [v3 db];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_37;
    v33[3] = &unk_1E6BB7C50;
    id v34 = *(id *)(a1 + 40);
    unint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
    char v14 = objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO rolloutsV2(    rolloutId,     deploymentId,     rampId,     status,     isShadow,     activeFactorPackSetId,     activeTargetingRuleIndex,     targetedFactorPackSetId,     targetedTargetingRuleIndex,     artifact) VALUES(    :rollout_id,     :deployment_id,     :ramp_id,     :status,     :is_shadow,     :active_fp_set_id,     :active_targeting_rule_index,     :targeted_fp_set_id,     :targeted_targeting_rule_index,     :artifact);",
            v33,
            0,
            v13);

    if ((v14 & 1) != 0
      && ([v3 db],
          id v15 = objc_claimAutoreleasedReturnValue(),
          sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)[v15 handle]),
          v15,
          sqlite3_int64 v27 = insert_rowid,
          insert_rowid != 0x8000000000000000))
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = [*(id *)(a1 + 40) namespaces];
      uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v22 = (void *)MEMORY[0x1E016E7F0]();
            char v23 = [v3 db];
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_2;
            v28[3] = &unk_1E6BB7C78;
            v28[4] = v21;
            v28[5] = v27;
            uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
            LODWORD(v21) = objc_msgSend(v23, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO rolloutV2Namespaces(    rolloutsV2_rowid,     name) VALUES(    :rolloutsV2_rowid,     :name);",
                             v28,
                             0,
                             v24);

            if (!v21)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
              uint64_t v10 = *MEMORY[0x1E4F93BF0];

              goto LABEL_18;
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v10 = *MEMORY[0x1E4F93BE8];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      uint64_t v10 = *MEMORY[0x1E4F93BF0];
    }
LABEL_18:
  }
  return v10;
}

void __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 deployment];
  id v6 = [v5 rolloutId];
  [v4 bindNamedParam:":rollout_id" toNSString:v6];

  v7 = [*(id *)(a1 + 32) deployment];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(v7, "deploymentId"));

  v8 = [*(id *)(a1 + 32) rampId];
  [v4 bindNamedParam:":ramp_id" toNSString:v8];

  objc_msgSend(v4, "bindNamedParam:toInt64:", ":status", objc_msgSend(*(id *)(a1 + 32), "status"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":is_shadow", objc_msgSend(*(id *)(a1 + 32), "isShadow"));
  uint64_t v9 = [*(id *)(a1 + 32) activeFactorPackSetId];
  [v4 bindNamedParam:":active_fp_set_id" toNSString:v9];

  uint64_t v10 = [*(id *)(a1 + 32) activeTargetingRuleIndex];
  [v4 bindNamedParam:":active_targeting_rule_index" toInt64AsNSNumber:v10];

  id v11 = [*(id *)(a1 + 32) targetedFactorPackSetId];
  [v4 bindNamedParam:":targeted_fp_set_id" toNSString:v11];

  BOOL v12 = [*(id *)(a1 + 32) targetedTargetingRuleIndex];
  [v4 bindNamedParam:":targeted_targeting_rule_index" toInt64AsNSNumber:v12];

  id v14 = [*(id *)(a1 + 32) artifact];
  unint64_t v13 = [v14 data];
  [v4 bindNamedParam:":artifact" toNSData:v13];
}

void __46__TRIRolloutDatabase_addNewRolloutWithRecord___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":rolloutsV2_rowid" toInt64:v3];
  [v4 bindNamedParam:":name" toNSString:*(void *)(a1 + 32)];
}

- (BOOL)setStatus:(int64_t)a3 forDeployment:(id)a4 usingTransaction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke;
  uint64_t v18 = &unk_1E6BB7E08;
  int64_t v22 = a3;
  id v10 = v8;
  id v19 = v10;
  id v20 = self;
  uint64_t v21 = &v23;
  uint64_t v11 = MEMORY[0x1E016EA80](&v15);
  BOOL v12 = (void *)v11;
  if (v9) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
  }
  else {
    -[TRIRolloutDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v11, v15, v16, v17, v18);
  }
  char v13 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v13;
}

uint64_t __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB7C78;
  uint64_t v14 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke_2, &unk_1E6BB7C78);
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE rolloutsV2 SET         status = :status WHERE         rolloutId = :rollout_id     AND deploymentId = :deployment_id;",
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

void __63__TRIRolloutDatabase_setStatus_forDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  [v5 bindNamedParam:":status" toInt64:v3];
  id v4 = [*(id *)(a1 + 32) rolloutId];
  [v5 bindNamedParam:":rollout_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- (BOOL)setActiveFactorPackSetId:(id)a3 activeTargetingRuleIndex:(id)a4 forDeployment:(id)a5 usingTransaction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __103__TRIRolloutDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forDeployment_usingTransaction___block_invoke;
  v21[3] = &unk_1E6BB7F20;
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  uint64_t v25 = self;
  char v26 = &v27;
  uint64_t v17 = MEMORY[0x1E016EA80](v21);
  uint64_t v18 = (void *)v17;
  if (v13) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v13);
  }
  else {
    [(TRIRolloutDatabase *)self writeTransactionWithFailableBlock:v17];
  }
  char v19 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v19;
}

uint64_t __103__TRIRolloutDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__TRIRolloutDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB7EF8;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v5 = [*(id *)(*(void *)(a1 + 56) + 8) generalErrorHandlerWithOutError:0];
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE rolloutsV2 SET         activeFactorPackSetId = :set_id,         activeTargetingRuleIndex = :rule_index WHERE         rolloutId = :rollout_id     AND deploymentId = :deployment_id;",
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

void __103__TRIRolloutDatabase_setActiveFactorPackSetId_activeTargetingRuleIndex_forDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":set_id" toNSString:v3];
  [v5 bindNamedParam:":rule_index" toInt64AsNSNumber:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 48) rolloutId];
  [v5 bindNamedParam:":rollout_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (BOOL)setTargetedFactorPackSetId:(id)a3 targetedTargetingRuleIndex:(id)a4 forDeployment:(id)a5 usingTransaction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __107__TRIRolloutDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forDeployment_usingTransaction___block_invoke;
  v21[3] = &unk_1E6BB7F20;
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  uint64_t v25 = self;
  char v26 = &v27;
  uint64_t v17 = MEMORY[0x1E016EA80](v21);
  uint64_t v18 = (void *)v17;
  if (v13) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v13);
  }
  else {
    [(TRIRolloutDatabase *)self writeTransactionWithFailableBlock:v17];
  }
  char v19 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v19;
}

uint64_t __107__TRIRolloutDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__TRIRolloutDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forDeployment_usingTransaction___block_invoke_2;
  v12[3] = &unk_1E6BB7EF8;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v5 = [*(id *)(*(void *)(a1 + 56) + 8) generalErrorHandlerWithOutError:0];
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE rolloutsV2 SET         targetedFactorPackSetId = :set_id,         targetedTargetingRuleIndex = :rule_index WHERE         rolloutId = :rollout_id     AND deploymentId = :deployment_id;",
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

void __107__TRIRolloutDatabase_setTargetedFactorPackSetId_targetedTargetingRuleIndex_forDeployment_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":set_id" toNSString:v3];
  [v5 bindNamedParam:":rule_index" toInt64AsNSNumber:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 48) rolloutId];
  [v5 bindNamedParam:":rollout_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 48), "deploymentId"));
}

- (id)_dataNoCopyFromStmt:(id)a3 columnName:(const char *)a4
{
  id v5 = a3;
  int v6 = sqlite3_column_count((sqlite3_stmt *)[v5 stmt]);
  if (v6 < 1) {
    goto LABEL_6;
  }
  int v7 = v6;
  int v8 = 0;
  while (1)
  {
    id v9 = v5;
    id v10 = sqlite3_column_name((sqlite3_stmt *)[v9 stmt], v8);
    if (v10)
    {
      if (!strcmp(a4, v10)) {
        break;
      }
    }
    if (v7 == ++v8) {
      goto LABEL_6;
    }
  }
  id v13 = v9;
  id v14 = sqlite3_column_blob((sqlite3_stmt *)[v13 stmt], v8);
  if (v14) {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", v14, sqlite3_column_bytes((sqlite3_stmt *)objc_msgSend(v13, "stmt"), v8), 0);
  }
  else {
LABEL_6:
  }
    id v11 = 0;

  return v11;
}

uint64_t __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [NSString alloc];
  int v6 = &stru_1F3455898;
  int v7 = *(__CFString **)(a1 + 32);
  if (!v7) {
    int v7 = &stru_1F3455898;
  }
  if (*(void *)(a1 + 40)) {
    int v6 = *(__CFString **)(a1 + 40);
  }
  int v8 = (void *)[v5 initWithFormat:@" %@ SELECT * FROM     rolloutsV2 as r %@", v7, v6];
  id v9 = [v3 db];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_2;
  v36[3] = &unk_1E6BB7E80;
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v38 = *(void *)(a1 + 80);
  v36[4] = v10;
  id v12 = v4;
  id v37 = v12;
  id v13 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
  int v14 = [v9 prepAndRunQuery:v8 onPrep:v11 onRow:v36 onError:v13];

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v16 = [v3 db];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_3;
  v33[3] = &unk_1E6BBBC00;
  id v17 = v12;
  id v34 = v17;
  id v18 = v15;
  id v35 = v18;
  char v19 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
  LODWORD(v15) = [v16 prepAndRunQuery:@" SELECT * FROM     rolloutV2Namespaces as n" onPrep:0 onRow:v33 onError:v19];

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  id v20 = [v17 allKeys];
  uint64_t v21 = [v20 sortedArrayUsingSelector:sel_compare_];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_4;
  v26[3] = &unk_1E6BBBC28;
  id v22 = v17;
  id v27 = v22;
  char v30 = v31;
  id v23 = v18;
  id v28 = v23;
  id v29 = *(id *)(a1 + 64);
  [v21 enumerateObjectsUsingBlock:v26];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v14 & v15;
  if ((v14 & v15) != 0) {
    id v24 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else {
    id v24 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  _Block_object_dispose(v31, 8);
  return *v24;
}

uint64_t __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v5 = [v3 getInt64ForColumnName:"rowid" table:0];
  int v6 = [v3 getNSStringForColumnName:"rolloutId" table:0];
  uint64_t v39 = [v3 getInt64ForColumnName:"deploymentId" table:0];
  int v7 = [v3 getNSStringForColumnName:"rampId" table:0];
  uint64_t v41 = [v3 getInt64ForColumnName:"status" table:0];
  uint64_t v37 = [v3 getInt64ForColumnName:"isShadow" table:0];
  int v8 = [v3 getNSStringForColumnName:"activeFactorPackSetId" table:0];
  v44 = [v3 getInt64AsNSNumberForColumnName:"activeTargetingRuleIndex" table:0];
  uint64_t v9 = [v3 getNSStringForColumnName:"targetedFactorPackSetId" table:0];
  v43 = [v3 getInt64AsNSNumberForColumnName:"targetedTargetingRuleIndex" table:0];
  uint64_t v10 = [v3 getNSDataForColumnName:"artifact" table:0];
  uint64_t v11 = (void *)v10;
  if (v6)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v14 = uint64_t v13 = v5;
    [v14 handleFailureInMethod:a1[6] object:a1[4] file:@"TRIRolloutDatabase.m" lineNumber:359 description:@"unexpected NULL rolloutId"];

    uint64_t v5 = v13;
    if (v11)
    {
LABEL_3:
      if (v8) {
        goto LABEL_4;
      }
LABEL_8:
      v46 = 0;
      if (v9) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  v16 = uint64_t v15 = v5;
  [v16 handleFailureInMethod:a1[6] object:a1[4] file:@"TRIRolloutDatabase.m" lineNumber:360 description:@"unexpected NULL artifact"];

  uint64_t v5 = v15;
  if (!v8) {
    goto LABEL_8;
  }
LABEL_4:
  v46 = TRIValidateFactorPackSetId();
  if (v9)
  {
LABEL_5:
    id v12 = TRIValidateFactorPackSetId();
    goto LABEL_10;
  }
LABEL_9:
  id v12 = 0;
LABEL_10:
  v45 = (void *)v9;
  if (v7)
  {
    id v17 = TRIValidateRampId();
  }
  else
  {
    id v17 = 0;
  }
  v42 = v11;
  uint64_t v18 = +[TRIClientRolloutArtifact artifactWithTransientData:v11];
  char v19 = (void *)v18;
  if (v45) {
    BOOL v20 = v12 == 0;
  }
  else {
    BOOL v20 = 0;
  }
  char v21 = v20;
  if (v7) {
    BOOL v22 = v17 == 0;
  }
  else {
    BOOL v22 = 0;
  }
  char v23 = v22;
  if (v46) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v8 == 0;
  }
  if (v24 && (v21 & 1) == 0 && (v23 & 1) == 0 && v18)
  {
    BOOL v20 = v37 == 0;
    uint64_t v38 = v7;
    char v25 = !v20;
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4FB0228]) initWithRolloutId:v6 deploymentId:v39];
    uint64_t v40 = v4;
    id v27 = (void *)v26;
    id v28 = [TRIRolloutRecord alloc];
    LOBYTE(v36) = v25;
    id v29 = [(TRIRolloutRecord *)v28 initWithDeployment:v27 rampId:v17 activeFactorPackSetId:v46 activeTargetingRuleIndex:v44 targetedFactorPackSetId:v12 targetedTargetingRuleIndex:v43 status:v41 namespaces:MEMORY[0x1E4F1CBF0] isShadow:v36 artifact:v19];
    char v30 = (void *)a1[5];
    [NSNumber numberWithUnsignedLongLong:v5];
    long long v31 = v8;
    v33 = char v32 = v6;
    [v30 setObject:v29 forKey:v33];

    int v6 = v32;
    int v8 = v31;

    int v7 = v38;
    id v4 = v40;
  }

  id v34 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v34;
}

uint64_t __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "getInt64ForColumnName:table:", "rolloutsV2_rowid", 0));
  int v6 = [*(id *)(a1 + 32) objectForKey:v5];
  if (v6)
  {
    int v7 = [v3 getNSStringForColumnName:"name" table:0];
    id v8 = [*(id *)(a1 + 40) objectForKey:v5];
    if (v8)
    {
      if (!v7)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 40) setObject:v8 forKey:v5];
      if (!v7) {
        goto LABEL_5;
      }
    }
    [v8 addObject:v7];
    goto LABEL_5;
  }
LABEL_6:

  uint64_t v9 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v9;
}

void __108__TRIRolloutDatabase__enumerateRecordsMatchingWhereClause_bind_prependingWithClause_usingTransaction_block___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  int v6 = (void *)MEMORY[0x1E016E7F0]();
  int v7 = [*(id *)(a1 + 32) objectForKey:v14];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
  uint64_t v8 = [*(id *)(a1 + 40) objectForKey:v14];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  id v11 = v10;

  id v12 = (void *)[v11 copy];
  uint64_t v13 = (void *)[v7 copyWithReplacementNamespaces:v12];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)recordWithDeployment:(id)a3 usingTransaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 455, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__TRIRolloutDatabase_recordWithDeployment_usingTransaction___block_invoke;
  v21[3] = &unk_1E6BB7C50;
  id v9 = v7;
  id v22 = v9;
  uint64_t v10 = (void *)MEMORY[0x1E016EA80](v21);
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__28;
  char v19 = __Block_byref_object_dispose__28;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__TRIRolloutDatabase_recordWithDeployment_usingTransaction___block_invoke_119;
  v14[3] = &unk_1E6BBBC78;
  v14[4] = &v15;
  if ([(TRIRolloutDatabase *)self _enumerateRecordsMatchingWhereClause:@" WHERE   rolloutId = :rollout_id     AND deploymentId = :deployment_id" bind:v10 prependingWithClause:0 usingTransaction:v8 block:v14])
  {
    id v11 = (id)v16[5];
  }
  else
  {
    id v11 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __60__TRIRolloutDatabase_recordWithDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 rolloutId];
  [v5 bindNamedParam:":rollout_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

void __60__TRIRolloutDatabase_recordWithDeployment_usingTransaction___block_invoke_119(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (BOOL)enumerateRecordsWithRolloutId:(id)a3 usingTransaction:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 495, @"Invalid parameter not satisfying: %@", @"rolloutId" object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__TRIRolloutDatabase_enumerateRecordsWithRolloutId_usingTransaction_block___block_invoke;
  v17[3] = &unk_1E6BB7C50;
  id v18 = v9;
  id v12 = v9;
  uint64_t v13 = (void *)MEMORY[0x1E016EA80](v17);
  BOOL v14 = [(TRIRolloutDatabase *)self _enumerateRecordsMatchingWhereClause:@"WHERE rolloutId = :rollout_id" bind:v13 prependingWithClause:0 usingTransaction:v10 block:v11];

  return v14;
}

uint64_t __75__TRIRolloutDatabase_enumerateRecordsWithRolloutId_usingTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rollout_id" toNSString:*(void *)(a1 + 32)];
}

- (BOOL)enumerateRecordsOverlappingNamespaces:(id)a3 usingTransaction:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 512, @"Invalid parameter not satisfying: %@", @"namespaces" object file lineNumber description];
  }
  if ([v9 count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__TRIRolloutDatabase_enumerateRecordsOverlappingNamespaces_usingTransaction_block___block_invoke;
    v16[3] = &unk_1E6BB7C50;
    id v17 = v9;
    id v12 = (void *)MEMORY[0x1E016EA80](v16);
    BOOL v13 = [(TRIRolloutDatabase *)self _enumerateRecordsMatchingWhereClause:@" WHERE r.rowid IN selectedRowIds" bind:v12 prependingWithClause:@" WITH selectedRowIds AS(    SELECT rolloutsV2_rowid FROM rolloutV2Namespaces     WHERE name IN _pas_nsset(:name_set))" usingTransaction:v10 block:v11];
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

uint64_t __83__TRIRolloutDatabase_enumerateRecordsOverlappingNamespaces_usingTransaction_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":name_set" toNSSet:*(void *)(a1 + 32)];
}

- (BOOL)enumerateActiveRecordsWithVisibility:(unsigned int)a3 usingTransaction:(id)a4 block:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 - 1 >= 3)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 553, @"Invalid parameter not satisfying: %@", @"andClause" object file lineNumber description];

    id v11 = 0;
  }
  else
  {
    id v11 = off_1E6BBBD60[a3 - 1];
  }
  BOOL v13 = (void *)[[NSString alloc] initWithFormat:@"WHERE activeFactorPackSetId IS NOT NULL %@", v11];
  BOOL v14 = [(TRIRolloutDatabase *)self _enumerateRecordsMatchingWhereClause:v13 bind:&__block_literal_global_150 prependingWithClause:0 usingTransaction:v9 block:v10];

  return v14;
}

- ($61A80719B04F7407D3E47539F1B23CAA)removeRecordWithDeployment:(id)a3 usingRefCounting:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 567, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2810000000;
  char v19 = "";
  uint64_t v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__TRIRolloutDatabase_removeRecordWithDeployment_usingRefCounting___block_invoke;
  v12[3] = &unk_1E6BBBCA0;
  BOOL v15 = a4;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  BOOL v14 = &v16;
  [(TRIRolloutDatabase *)self writeTransactionWithFailableBlock:v12];
  v9.var0 = v17[4];

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __66__TRIRolloutDatabase_removeRecordWithDeployment_usingRefCounting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  [v4 appendString:@" SELECT rowid FROM         rolloutsV2 WHERE         rolloutId = :rollout_id     AND deploymentId = :deployment_id"];
  if (*(unsigned char *)(a1 + 56)) {
    [v4 appendString:@"     AND respectRefCount = 1"];
  }
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  BOOL v24 = __66__TRIRolloutDatabase_removeRecordWithDeployment_usingRefCounting___block_invoke_2;
  char v25 = &unk_1E6BB7C50;
  id v26 = *(id *)(a1 + 40);
  int v6 = [v5 createTempTableContainingRowsFromQuery:v4 bind:&v22 namePrefix:@"remove_rollout_rowids" transaction:v3];

  if (!v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = 0;
    char v19 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
LABEL_14:
    uint64_t v20 = *v19;
    goto LABEL_15;
  }
  id v7 = [NSString alloc];
  id v8 = objc_msgSend(v7, "initWithFormat:", @" DELETE FROM     rolloutV2Namespaces WHERE     rolloutsV2_rowid IN %@;",
                 v6,
                 v22,
                 v23,
                 v24,
                 v25);
  $61A80719B04F7407D3E47539F1B23CAA v9 = [v3 db];
  id v10 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
  char v11 = [v9 prepAndRunQuery:v8 onPrep:0 onRow:0 onError:v10];

  if (v11)
  {

    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @" DELETE FROM     rolloutsV2 WHERE     rowid IN %@;",
                   v6);
    id v12 = [v3 db];
    id v13 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
    char v14 = [v12 prepAndRunQuery:v8 onPrep:0 onRow:0 onError:v13];

    if (v14)
    {

      id v15 = [v3 db];
      int v16 = sqlite3_changes((sqlite3 *)[v15 handle]);

      int v17 = [*(id *)(*(void *)(a1 + 32) + 8) dropTableWithName:v6 transaction:v3];
      uint64_t v18 = 1;
      if (v16 <= 0) {
        uint64_t v18 = 2;
      }
      if (!v17) {
        uint64_t v18 = 0;
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v18;
      char v19 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
      if (!v17) {
        char v19 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
      }
      goto LABEL_14;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = 0;
  uint64_t v20 = *MEMORY[0x1E4F93BF0];

LABEL_15:
  return v20;
}

void __66__TRIRolloutDatabase_removeRecordWithDeployment_usingRefCounting___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 rolloutId];
  [v5 bindNamedParam:":rollout_id" toNSString:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":deployment_id", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
}

- ($61A80719B04F7407D3E47539F1B23CAA)removeRecordWithDeployment:(id)a3
{
  return ($61A80719B04F7407D3E47539F1B23CAA)[(TRIRolloutDatabase *)self removeRecordWithDeployment:a3 usingRefCounting:0];
}

- (BOOL)targetDeployment:(id)a3 toFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 deallocatedDeployments:(id)a6 usingTransaction:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 653, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  id v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 654, @"Invalid parameter not satisfying: %@", @"deallocatedDeployments" object file lineNumber description];

LABEL_3:
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke;
  v30[3] = &unk_1E6BB8B08;
  void v30[4] = self;
  id v18 = v13;
  id v31 = v18;
  id v19 = v14;
  id v32 = v19;
  id v20 = v15;
  id v33 = v20;
  id v21 = v16;
  id v34 = v21;
  id v35 = &v36;
  uint64_t v22 = (void (**)(void, void))MEMORY[0x1E016EA80](v30);
  uint64_t v23 = v22;
  if (v17)
  {
    ((void (**)(void, id))v22)[2](v22, v17);
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke_171;
    v28[3] = &unk_1E6BB7F48;
    id v29 = v22;
    [(TRIRolloutDatabase *)self writeTransactionWithFailableBlock:v28];
  }
  char v24 = *((unsigned char *)v37 + 24);

  _Block_object_dispose(&v36, 8);
  return v24;
}

uint64_t __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = *(void **)(a1 + 32);
  int v6 = [*(id *)(a1 + 40) rolloutId];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke_2;
  v44[3] = &unk_1E6BB8D18;
  id v7 = v4;
  id v45 = v7;
  LOBYTE(v5) = [v5 enumerateRecordsWithRolloutId:v6 usingTransaction:v3 block:v44];

  if (v5)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v36 = v7;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v37 = 0;
      uint64_t v39 = *(void *)v41;
      id obj = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v39) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v13 = (void *)MEMORY[0x1E016E7F0]();
          id v14 = [v12 deployment];
          int v15 = [v14 isEqualToDeployment:*(void *)(a1 + 40)];

          if (v15)
          {
            if (*(void *)(a1 + 48))
            {
              if ([v12 status] != 1)
              {
                id v16 = *(void **)(a1 + 32);
                id v17 = [v12 deployment];
                LODWORD(v16) = [v16 setStatus:2 forDeployment:v17 usingTransaction:v3];

                if (!v16) {
                  goto LABEL_31;
                }
              }
            }
            id v18 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(a1 + 48);
            uint64_t v19 = *(void *)(a1 + 56);
            id v21 = [v12 deployment];
            LOBYTE(v18) = [v18 setTargetedFactorPackSetId:v20 targetedTargetingRuleIndex:v19 forDeployment:v21 usingTransaction:v3];

            if ((v18 & 1) == 0) {
              goto LABEL_25;
            }
            char v37 = 1;
          }
          else
          {
            if ([v12 status] == 2)
            {
              uint64_t v22 = *(void **)(a1 + 32);
              uint64_t v23 = [v12 deployment];
              LODWORD(v22) = [v22 setStatus:0 forDeployment:v23 usingTransaction:v3];

              if (!v22)
              {
LABEL_31:
                uint64_t v32 = *MEMORY[0x1E4F93BF0];
                goto LABEL_32;
              }
            }
            char v24 = [v12 targetedFactorPackSetId];

            if (v24)
            {
              char v25 = TRILogCategory_Server();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = [*(id *)(a1 + 40) shortDesc];
                id v27 = [v12 deployment];
                id v28 = [v27 shortDesc];
                *(_DWORD *)long long buf = 138543618;
                v47 = v26;
                __int16 v48 = 2114;
                v49 = v28;
                _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Completion of targeting for rollout deployment %{public}@ invalidated targeted rollout deployment: %{public}@", buf, 0x16u);
              }
              [*(id *)(a1 + 64) addObject:v12];
            }
            id v29 = *(void **)(a1 + 32);
            char v30 = [v12 deployment];
            LODWORD(v29) = [v29 setTargetedFactorPackSetId:0 targetedTargetingRuleIndex:0 forDeployment:v30 usingTransaction:v3];

            if (!v29)
            {
LABEL_25:
              uint64_t v32 = *MEMORY[0x1E4F93BF0];
LABEL_32:

              goto LABEL_33;
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      if (v37)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        id v31 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
        goto LABEL_30;
      }
    }
    else
    {
    }
    id v33 = TRILogCategory_Server();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v35 = [*(id *)(a1 + 40) shortDesc];
      *(_DWORD *)long long buf = 138543362;
      v47 = v35;
      _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "TRIRolloutDatabase unable to target rollout deployment %{public}@; not found.",
        buf,
        0xCu);
    }
    id v31 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
LABEL_30:
    uint64_t v32 = *v31;
LABEL_33:
    id v7 = v36;
  }
  else
  {
    uint64_t v32 = *MEMORY[0x1E4F93BF0];
  }

  return v32;
}

void __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4FB0200] partialRecordWithFullRecord:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

uint64_t __116__TRIRolloutDatabase_targetDeployment_toFactorPackSetId_targetingRuleIndex_deallocatedDeployments_usingTransaction___block_invoke_171(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)activateDeployment:(id)a3 withFactorPackSetId:(id)a4 targetingRuleIndex:(id)a5 deactivatedDeployments:(id)a6 deactivatedFactorPackSetIds:(id)a7 deactivationStateTransitions:(id)a8 usingTransaction:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
LABEL_9:
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 740, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

    if (v19) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  id v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 739, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];

  if (!v17) {
    goto LABEL_9;
  }
LABEL_3:
  if (v19) {
    goto LABEL_4;
  }
LABEL_10:
  id v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 741, @"Invalid parameter not satisfying: %@", @"deactivatedDeployments" object file lineNumber description];

LABEL_4:
  [v19 removeAllObjects];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke;
  v38[3] = &unk_1E6BBBCC8;
  v38[4] = self;
  id v23 = v16;
  id v39 = v23;
  id v24 = v17;
  id v40 = v24;
  id v25 = v18;
  id v41 = v25;
  id v26 = v21;
  id v42 = v26;
  id v27 = v19;
  id v43 = v27;
  id v28 = v20;
  id v44 = v28;
  id v45 = &v46;
  id v29 = (void (**)(void, void))MEMORY[0x1E016EA80](v38);
  char v30 = v29;
  if (v22)
  {
    ((void (**)(void, id))v29)[2](v29, v22);
  }
  else
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke_179;
    v36[3] = &unk_1E6BB7F48;
    char v37 = v29;
    [(TRIRolloutDatabase *)self writeTransactionWithFailableBlock:v36];
  }
  char v31 = *((unsigned char *)v47 + 24);

  _Block_object_dispose(&v46, 8);
  return v31;
}

uint64_t __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = [*(id *)(a1 + 32) recordWithDeployment:*(void *)(a1 + 40) usingTransaction:0];
  int v6 = *(void **)(a1 + 32);
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [v5 namespaces];
  uint64_t v9 = [v7 setWithArray:v8];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke_2;
  v66[3] = &unk_1E6BB8D18;
  id v10 = (id)v4;
  id v67 = v10;
  LOBYTE(v4) = [v6 enumerateRecordsOverlappingNamespaces:v9 usingTransaction:v3 block:v66];

  if ((v4 & 1) == 0) {
    goto LABEL_45;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v10;
  uint64_t v61 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (!v61)
  {

    goto LABEL_42;
  }
  id v54 = v10;
  v55 = v5;
  char v58 = 0;
  uint64_t v11 = *(void *)v63;
  uint64_t v56 = *(void *)v63;
  while (2)
  {
    for (uint64_t i = 0; i != v61; ++i)
    {
      if (*(void *)v63 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v62 + 1) + 8 * i);
      id v14 = (void *)MEMORY[0x1E016E7F0]();
      int v15 = [v13 deployment];
      int v16 = [v15 isEqualToDeployment:*(void *)(a1 + 40)];

      if (v16)
      {
        id v17 = *(void **)(a1 + 32);
        id v18 = [v13 deployment];
        LODWORD(v17) = [v17 setStatus:1 forDeployment:v18 usingTransaction:v3];

        if (!v17) {
          goto LABEL_40;
        }
        id v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(a1 + 48);
        uint64_t v21 = *(void *)(a1 + 56);
        id v22 = [v13 deployment];
        LODWORD(v19) = [v19 setActiveFactorPackSetId:v20 activeTargetingRuleIndex:v21 forDeployment:v22 usingTransaction:v3];

        if (!v19) {
          goto LABEL_40;
        }
        id v23 = *(void **)(a1 + 32);
        id v24 = [v13 deployment];
        LOBYTE(v23) = [v23 setTargetedFactorPackSetId:0 targetedTargetingRuleIndex:0 forDeployment:v24 usingTransaction:v3];

        if ((v23 & 1) == 0) {
          goto LABEL_47;
        }
        char v58 = 1;
        continue;
      }
      if ([v13 status])
      {
        if (*(void *)(a1 + 64))
        {
          uint64_t v26 = [v13 status];
          id v25 = @"roll_st_DE";
          if (v26 == 1
            || *(void *)(a1 + 64)
            && (uint64_t v27 = objc_msgSend(v13, "status", @"roll_st_DE"),
                id v25 = @"obsoleted-unknown-previous-state",
                v27 == 2))
          {
            objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v25, v13, v54, v55);
          }
        }
        id v28 = *(void **)(a1 + 32);
        id v29 = objc_msgSend(v13, "deployment", v25, v54, v55);
        LODWORD(v28) = [v28 setStatus:3 forDeployment:v29 usingTransaction:v3];

        if (!v28)
        {
LABEL_40:
          uint64_t v50 = *MEMORY[0x1E4F93BF0];
LABEL_48:

          id v10 = v54;
          id v5 = v55;
          goto LABEL_49;
        }
      }
      char v30 = objc_msgSend(v13, "activeFactorPackSetId", v54, v55);
      if (v30)
      {
      }
      else
      {
        char v31 = [v13 targetedFactorPackSetId];

        if (!v31) {
          goto LABEL_34;
        }
      }
      v60 = v14;
      uint64_t v32 = TRILogCategory_Server();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = [*(id *)(a1 + 40) shortDesc];
        id v34 = [v13 deployment];
        id v35 = [v34 shortDesc];
        *(_DWORD *)long long buf = 138543618;
        v69 = v33;
        __int16 v70 = 2114;
        v71 = v35;
        _os_log_impl(&dword_1DA291000, v32, OS_LOG_TYPE_DEFAULT, "Activating rollout deployment %{public}@ obsoleted rollout deployment: %{public}@", buf, 0x16u);
      }
      id v36 = [*(id *)(a1 + 40) rolloutId];
      char v37 = [v13 deployment];
      uint64_t v38 = [v37 rolloutId];
      if ([v36 isEqualToString:v38])
      {
        int v57 = [*(id *)(a1 + 40) deploymentId];
        id v39 = [v13 deployment];
        int v40 = [v39 deploymentId];

        BOOL v41 = v57 < v40;
        uint64_t v11 = v56;
        if (!v41) {
          goto LABEL_31;
        }
        id v36 = TRILogCategory_Server();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_1DA291000, v36, OS_LOG_TYPE_ERROR, "Accidentally obsoleted a newer rollout deployment by activating an old deployment.", buf, 2u);
        }
      }
      else
      {
      }
LABEL_31:
      id v42 = *(void **)(a1 + 72);
      id v43 = [v13 deployment];
      [v42 addObject:v43];

      id v44 = [v13 activeFactorPackSetId];
      if (v44) {
        [*(id *)(a1 + 80) setObject:v44 forKeyedSubscript:*(void *)(a1 + 40)];
      }

      id v14 = v60;
LABEL_34:
      id v45 = *(void **)(a1 + 32);
      uint64_t v46 = [v13 deployment];
      LOBYTE(v45) = [v45 setActiveFactorPackSetId:0 activeTargetingRuleIndex:0 forDeployment:v46 usingTransaction:v3];

      if ((v45 & 1) == 0) {
        goto LABEL_40;
      }
      v47 = *(void **)(a1 + 32);
      uint64_t v48 = [v13 deployment];
      LODWORD(v47) = [v47 setTargetedFactorPackSetId:0 targetedTargetingRuleIndex:0 forDeployment:v48 usingTransaction:v3];

      if (!v47)
      {
LABEL_47:
        uint64_t v50 = *MEMORY[0x1E4F93BF0];
        goto LABEL_48;
      }
    }
    uint64_t v61 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v61) {
      continue;
    }
    break;
  }

  id v10 = v54;
  id v5 = v55;
  if (v58)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    char v49 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    goto LABEL_46;
  }
LABEL_42:
  uint64_t v51 = TRILogCategory_Server();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    v53 = [*(id *)(a1 + 40) shortDesc];
    *(_DWORD *)long long buf = 138543362;
    v69 = v53;
    _os_log_error_impl(&dword_1DA291000, v51, OS_LOG_TYPE_ERROR, "TRIRolloutDatabase unable to activate rollout deployment %{public}@; not found.",
      buf,
      0xCu);
  }
LABEL_45:
  char v49 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
LABEL_46:
  uint64_t v50 = *v49;
LABEL_49:

  return v50;
}

void __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4FB0200] partialRecordWithFullRecord:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

uint64_t __177__TRIRolloutDatabase_activateDeployment_withFactorPackSetId_targetingRuleIndex_deactivatedDeployments_deactivatedFactorPackSetIds_deactivationStateTransitions_usingTransaction___block_invoke_179(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)deactivateDeployment:(id)a3 usingTransaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 856, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__TRIRolloutDatabase_deactivateDeployment_usingTransaction___block_invoke;
  v17[3] = &unk_1E6BB7F70;
  id v19 = &v20;
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
    v15[2] = __60__TRIRolloutDatabase_deactivateDeployment_usingTransaction___block_invoke_2;
    v15[3] = &unk_1E6BB7F48;
    int v16 = v10;
    [(TRIRolloutDatabase *)self writeTransactionWithFailableBlock:v15];
  }
  char v12 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __60__TRIRolloutDatabase_deactivateDeployment_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  char v6 = [v3 setStatus:3 forDeployment:v4 usingTransaction:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  char v9 = [*(id *)(a1 + 32) setActiveFactorPackSetId:0 activeTargetingRuleIndex:0 forDeployment:*(void *)(a1 + 40) usingTransaction:v5];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v10 + 24)) {
    char v11 = v9;
  }
  else {
    char v11 = 0;
  }
  *(unsigned char *)(v10 + 24) = v11;
  char v12 = [*(id *)(a1 + 32) setTargetedFactorPackSetId:0 targetedTargetingRuleIndex:0 forDeployment:*(void *)(a1 + 40) usingTransaction:v5];

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v13 + 24)) {
    char v14 = v12;
  }
  else {
    char v14 = 0;
  }
  *(unsigned char *)(v13 + 24) = v14;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    int v15 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else {
    int v15 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  return *v15;
}

uint64_t __60__TRIRolloutDatabase_deactivateDeployment_usingTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)deactivateDeploymentsWithRolloutId:(id)a3 deactivatedDeployment:(id *)a4 deactivatedFactorPackSetId:(id *)a5 deactivatedRampId:(id *)a6 deactivationStateTransitions:(id)a7 usingTransaction:(id)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (v15)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 884, @"Invalid parameter not satisfying: %@", @"rolloutId" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 885, @"Invalid parameter not satisfying: %@", @"deactivatedDeployment" object file lineNumber description];

LABEL_3:
  id v18 = *a4;
  *a4 = 0;

  if (!a5)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 887, @"Invalid parameter not satisfying: %@", @"deactivatedFactorPackSetId" object file lineNumber description];
  }
  id v19 = *a5;
  *a5 = 0;

  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke;
  void v31[3] = &unk_1E6BBBD18;
  id v34 = &v38;
  v31[4] = self;
  id v20 = v15;
  id v32 = v20;
  id v35 = a4;
  id v36 = a5;
  char v37 = a6;
  id v21 = v16;
  id v33 = v21;
  uint64_t v22 = (void (**)(void, void))MEMORY[0x1E016EA80](v31);
  char v23 = v22;
  if (v17)
  {
    ((void (**)(void, id))v22)[2](v22, v17);
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke_186;
    v29[3] = &unk_1E6BB7F48;
    char v30 = v22;
    [(TRIRolloutDatabase *)self writeTransactionWithFailableBlock:v29];
  }
  char v24 = *((unsigned char *)v39 + 24);

  _Block_object_dispose(&v38, 8);
  return v24;
}

uint64_t __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  char v6 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke_2;
  v22[3] = &unk_1E6BBBCF0;
  id v23 = v5;
  id v7 = v4;
  id v24 = v7;
  long long v26 = *(_OWORD *)(a1 + 64);
  uint64_t v27 = *(void *)(a1 + 80);
  id v25 = *(id *)(a1 + 48);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v6 enumerateRecordsWithRolloutId:v23 usingTransaction:v3 block:v22];
  char v8 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = objc_msgSend(*(id *)(a1 + 32), "deactivateDeployment:usingTransaction:", *(void *)(*((void *)&v18 + 1) + 8 * v13), v3, (void)v18);
          uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
          if (*(unsigned char *)(v15 + 24)) {
            char v16 = v14;
          }
          else {
            char v16 = 0;
          }
          *(unsigned char *)(v15 + 24) = v16;
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v11);
    }

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      char v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    }
  }

  return *v8;
}

void __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke_2(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 activeFactorPackSetId];
  if (v4)
  {
  }
  else
  {
    id v5 = [v3 targetedFactorPackSetId];

    if (!v5) {
      goto LABEL_11;
    }
  }
  char v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    char v8 = [v3 deployment];
    int v32 = 138543618;
    uint64_t v33 = v7;
    __int16 v34 = 1024;
    int v35 = [v8 deploymentId];
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Deactivating rollout deployments matching %{public}@: %d", (uint8_t *)&v32, 0x12u);
  }
  id v9 = (void *)a1[5];
  uint64_t v10 = [v3 deployment];
  [v9 addObject:v10];

  uint64_t v11 = [v3 activeFactorPackSetId];

  if (v11)
  {
    uint64_t v12 = [v3 deployment];
    uint64_t v13 = (void **)a1[7];
    char v14 = *v13;
    *uint64_t v13 = (void *)v12;

    uint64_t v15 = [v3 activeFactorPackSetId];
    char v16 = (void **)a1[8];
    id v17 = *v16;
    *char v16 = (void *)v15;

    uint64_t v18 = [v3 rampId];
    long long v19 = (void **)a1[9];
    long long v20 = *v19;
    uint64_t *v19 = (void *)v18;

    long long v21 = (void *)a1[6];
    if (v21)
    {
      uint64_t v22 = @"roll_st_DE";
LABEL_9:
      [v21 setObject:v22 forKeyedSubscript:v3];
    }
  }
  else if (!*(void *)a1[7])
  {
    uint64_t v23 = [v3 deployment];
    id v24 = (void **)a1[7];
    id v25 = *v24;
    *id v24 = (void *)v23;

    uint64_t v26 = [v3 targetedFactorPackSetId];
    uint64_t v27 = (void **)a1[8];
    id v28 = *v27;
    *uint64_t v27 = (void *)v26;

    uint64_t v29 = [v3 rampId];
    char v30 = (void **)a1[9];
    char v31 = *v30;
    *char v30 = (void *)v29;

    long long v21 = (void *)a1[6];
    if (v21)
    {
      uint64_t v22 = @"obsoleted-unknown-previous-state";
      goto LABEL_9;
    }
  }
LABEL_11:
}

uint64_t __170__TRIRolloutDatabase_deactivateDeploymentsWithRolloutId_deactivatedDeployment_deactivatedFactorPackSetId_deactivatedRampId_deactivationStateTransitions_usingTransaction___block_invoke_186(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasRecordReferencingFactorPackSetId:(id)a3 withReferenceType:(unsigned int)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIRolloutDatabase.m", 940, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke;
  v12[3] = &unk_1E6BBBD40;
  unsigned int v16 = a4;
  SEL v15 = a2;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  char v14 = &v17;
  [(TRIRolloutDatabase *)self readTransactionWithFailableBlock:v12];
  char v9 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = *(_DWORD *)(a1 + 64) - 1;
  if (v4 >= 3)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIRolloutDatabase.m", 956, @"Invalid parameter not satisfying: %@", @"whereClause" object file lineNumber description];

    id v5 = 0;
  }
  else
  {
    id v5 = off_1E6BBBD78[v4];
  }
  id v7 = (void *)[[NSString alloc] initWithFormat:@" SELECT * FROM     rolloutsV2 WHERE %@ LIMIT 1", v5];
  id v8 = [v3 db];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_2;
  v16[3] = &unk_1E6BB7C50;
  id v17 = *(id *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_3;
  v15[3] = &unk_1E6BBAFB0;
  void v15[4] = *(void *)(a1 + 48);
  char v9 = [*(id *)(*(void *)(a1 + 32) + 8) generalErrorHandlerWithOutError:0];
  int v10 = [v8 prepAndRunQuery:v7 onPrep:v16 onRow:v15 onError:v9];

  uint64_t v11 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  uint64_t v12 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];

  if (v10) {
    id v13 = v11;
  }
  else {
    id v13 = v12;
  }
  return *v13;
}

uint64_t __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":setId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __76__TRIRolloutDatabase_hasRecordReferencingFactorPackSetId_withReferenceType___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

- (void).cxx_destruct
{
}

@end