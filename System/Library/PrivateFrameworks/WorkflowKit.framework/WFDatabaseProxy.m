@interface WFDatabaseProxy
+ (WFDatabaseProxy)defaultDatabase;
- (BOOL)isReference:(id)a3 allowedToRunOnDomain:(id)a4;
- (BOOL)saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 reference:(id)a5 error:(id *)a6;
- (WFDatabaseProxy)init;
- (id)approvalResultForContentAttributionSet:(id)a3 contentDestination:(id)a4 actionUUID:(id)a5 actionIdentifier:(id)a6 actionIndex:(unint64_t)a7 reference:(id)a8 allowedOnceStates:(id)a9 error:(id *)a10;
- (id)collectionWithIdentifier:(id)a3 error:(id *)a4;
- (id)configuredTriggersForWorkflowID:(id)a3 error:(id *)a4;
- (id)createWorkflowWithWorkflowRecord:(id)a3 nameCollisionBehavior:(unint64_t)a4 error:(id *)a5;
- (id)currentDeletionAuthorizationStatusWithContentItemClassName:(id)a3 actionUUID:(id)a4 actionIdentifier:(id)a5 actionIndex:(unint64_t)a6 count:(unint64_t)a7 reference:(id)a8 error:(id *)a9;
- (id)database;
- (id)databaseProxyHostConnection;
- (id)folderForWorkflowReference:(id)a3 error:(id *)a4;
- (id)hostProxyWithErrorHandler:(id)a1;
- (id)logRunOfWorkflow:(id)a3 withSource:(id)a4 triggerID:(id)a5;
- (id)referenceForWorkflowID:(id)a3;
- (id)serializedParametersForAppEntityIdentifier:(id)a3 error:(id *)a4;
- (id)sortedVisibleFoldersWithError:(id *)a3;
- (id)sortedVisibleWorkflowsByNameWithError:(id *)a3;
- (id)sortedVisibleWorkflowsInCollection:(id)a3 error:(id *)a4;
- (id)sortedWorkflowsWithQuery:(id)a3 error:(id *)a4;
- (id)uniqueVisibleReferenceForWorkflowName:(id)a3;
- (id)workflowRecordForDescriptor:(id)a3 error:(id *)a4;
- (void)quarantineWorkflowWithReference:(id)a3;
- (void)saveOutputActionSmartPromtDataForWorkflowReference:(id)a3 error:(id *)a4;
- (void)setOutcome:(int64_t)a3 forRunEvent:(id)a4;
- (void)setTrustedToRunScripts:(BOOL)a3 forReference:(id)a4 onDomain:(id)a5;
- (void)storeQuarantineHashForWorkflowWithReference:(id)a3 quarantineHash:(id)a4;
- (void)updateAppDescriptor:(id)a3 atKey:(id)a4 actionUUID:(id)a5 actionIndex:(id)a6 actionIdentifier:(id)a7 workflowID:(id)a8 error:(id *)a9;
@end

@implementation WFDatabaseProxy

- (void).cxx_destruct
{
}

- (void)saveOutputActionSmartPromtDataForWorkflowReference:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__54585;
    v17 = __Block_byref_object_dispose__54586;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__WFDatabaseProxy_saveOutputActionSmartPromtDataForWorkflowReference_error___block_invoke;
    v12[3] = &unk_1E6555488;
    v12[4] = &v13;
    v8 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v12);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__WFDatabaseProxy_saveOutputActionSmartPromtDataForWorkflowReference_error___block_invoke_2;
    v11[3] = &unk_1E6555488;
    v11[4] = &v13;
    [v8 saveOutputActionSmartPromtDataForWorkflowReference:v6 completion:v11];

    v9 = (void *)v14[5];
    if (v9) {
      *a4 = v9;
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v10 = [(WFDatabaseProxy *)self database];
    [v10 saveOutputActionSmartPromtDataForWorkflowReference:v6 error:a4];
  }
}

void __76__WFDatabaseProxy_saveOutputActionSmartPromtDataForWorkflowReference_error___block_invoke(uint64_t a1, void *a2)
{
}

- (id)hostProxyWithErrorHandler:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v2 databaseProxyHostConnection];
    id v2 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v3];
  }
  return v2;
}

void __76__WFDatabaseProxy_saveOutputActionSmartPromtDataForWorkflowReference_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 reference:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v13)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__54585;
    v25 = __Block_byref_object_dispose__54586;
    id v26 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__WFDatabaseProxy_saveSmartPromptStateData_actionUUID_reference_error___block_invoke;
    v20[3] = &unk_1E6555488;
    v20[4] = &v21;
    v14 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v20);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__WFDatabaseProxy_saveSmartPromptStateData_actionUUID_reference_error___block_invoke_2;
    v19[3] = &unk_1E6555618;
    v19[4] = &v27;
    v19[5] = &v21;
    [v14 saveSmartPromptStateData:v10 actionUUID:v11 reference:v12 completion:v19];

    uint64_t v15 = (void *)v22[5];
    if (v15) {
      *a6 = v15;
    }
    char v16 = *((unsigned char *)v28 + 24) != 0;
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v17 = [(WFDatabaseProxy *)self database];
    char v16 = [v17 saveSmartPromptStateData:v10 actionUUID:v11 reference:v12 error:a6];
  }
  return v16;
}

void __71__WFDatabaseProxy_saveSmartPromptStateData_actionUUID_reference_error___block_invoke(uint64_t a1, void *a2)
{
}

void __71__WFDatabaseProxy_saveSmartPromptStateData_actionUUID_reference_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)currentDeletionAuthorizationStatusWithContentItemClassName:(id)a3 actionUUID:(id)a4 actionIdentifier:(id)a5 actionIndex:(unint64_t)a6 count:(unint64_t)a7 reference:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  v19 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v19)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__54585;
    v37 = __Block_byref_object_dispose__54586;
    id v38 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    char v30 = __Block_byref_object_copy__54585;
    v31 = __Block_byref_object_dispose__54586;
    id v32 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __140__WFDatabaseProxy_currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference_error___block_invoke;
    v26[3] = &unk_1E6555488;
    v26[4] = &v27;
    v20 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v26);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __140__WFDatabaseProxy_currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference_error___block_invoke_2;
    v25[3] = &unk_1E65555F0;
    v25[4] = &v33;
    v25[5] = &v27;
    [v20 currentDeletionAuthorizationStatusWithContentItemClassName:v15 actionUUID:v16 actionIdentifier:v17 actionIndex:a6 count:a7 reference:v18 completion:v25];

    uint64_t v21 = (void *)v28[5];
    if (v21) {
      *a9 = v21;
    }
    id v22 = (id)v34[5];
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    uint64_t v23 = [(WFDatabaseProxy *)self database];
    id v22 = [v23 currentDeletionAuthorizationStatusWithContentItemClassName:v15 actionUUID:v16 actionIdentifier:v17 actionIndex:a6 count:a7 reference:v18];
  }
  return v22;
}

void __140__WFDatabaseProxy_currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference_error___block_invoke(uint64_t a1, void *a2)
{
}

void __140__WFDatabaseProxy_currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)approvalResultForContentAttributionSet:(id)a3 contentDestination:(id)a4 actionUUID:(id)a5 actionIdentifier:(id)a6 actionIndex:(unint64_t)a7 reference:(id)a8 allowedOnceStates:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v22)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__54585;
    v40 = __Block_byref_object_dispose__54586;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__54585;
    v34 = __Block_byref_object_dispose__54586;
    id v35 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __151__WFDatabaseProxy_approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates_error___block_invoke;
    v29[3] = &unk_1E6555488;
    v29[4] = &v30;
    uint64_t v23 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v29);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __151__WFDatabaseProxy_approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates_error___block_invoke_2;
    v28[3] = &unk_1E65555C8;
    v28[4] = &v36;
    v28[5] = &v30;
    [v23 approvalResultForContentAttributionSet:v16 contentDestination:v17 actionUUID:v18 actionIdentifier:v19 actionIndex:a7 reference:v20 allowedOnceStates:v21 completion:v28];

    v24 = (void *)v31[5];
    if (v24) {
      *a10 = v24;
    }
    id v25 = (id)v37[5];
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    id v26 = [(WFDatabaseProxy *)self database];
    id v25 = [v26 approvalResultForContentAttributionSet:v16 contentDestination:v17 actionUUID:v18 actionIdentifier:v19 actionIndex:a7 reference:v20 allowedOnceStates:v21];
  }
  return v25;
}

void __151__WFDatabaseProxy_approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates_error___block_invoke(uint64_t a1, void *a2)
{
}

void __151__WFDatabaseProxy_approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)serializedParametersForAppEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__54585;
    v24 = __Block_byref_object_dispose__54586;
    id v25 = 0;
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__54585;
    id v18 = __Block_byref_object_dispose__54586;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__WFDatabaseProxy_serializedParametersForAppEntityIdentifier_error___block_invoke;
    v13[3] = &unk_1E6555488;
    v13[4] = &v20;
    v8 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v13);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__WFDatabaseProxy_serializedParametersForAppEntityIdentifier_error___block_invoke_2;
    v12[3] = &unk_1E65555A0;
    v12[4] = &v20;
    void v12[5] = &v14;
    [v8 serializedParametersForAppEntityIdentifier:v6 completion:v12];

    if (a4) {
      *a4 = (id) v21[5];
    }
    id v9 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v10 = [(WFDatabaseProxy *)self database];
    id v9 = [v10 serializedParametersForIdentifier:v6 error:a4];
  }
  return v9;
}

void __68__WFDatabaseProxy_serializedParametersForAppEntityIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __68__WFDatabaseProxy_serializedParametersForAppEntityIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)setOutcome:(int64_t)a3 forRunEvent:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7) {
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_320);
  }
  else {
  id v8 = [(WFDatabaseProxy *)self database];
  }
  [v8 setOutcome:a3 forRunEvent:v6];
}

- (id)logRunOfWorkflow:(id)a3 withSource:(id)a4 triggerID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v11)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__54585;
    id v21 = __Block_byref_object_dispose__54586;
    id v22 = 0;
    id v12 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_317);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__WFDatabaseProxy_logRunOfWorkflow_withSource_triggerID___block_invoke_2;
    v16[3] = &unk_1E6555578;
    v16[4] = &v17;
    [v12 logRunOfWorkflow:v8 withSource:v9 triggerID:v10 completion:v16];

    id v13 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    uint64_t v14 = [(WFDatabaseProxy *)self database];
    id v13 = [v14 logRunOfWorkflow:v8 withSource:v9 triggerID:v10];
  }
  return v13;
}

void __57__WFDatabaseProxy_logRunOfWorkflow_withSource_triggerID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)storeQuarantineHashForWorkflowWithReference:(id)a3 quarantineHash:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7)
  {
    id v8 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_315_54593);
    [v8 storeQuarantineHashForWorkflowWithReference:v12 quarantineHash:v6];
  }
  else
  {
    id v9 = [(WFDatabaseProxy *)self database];
    id v10 = objc_opt_new();
    id v8 = [v9 recordWithDescriptor:v12 properties:v10 error:0];

    if (v8)
    {
      [v8 setRemoteQuarantineHash:v6];
      id v11 = [(WFDatabaseProxy *)self database];
      [v11 saveRecord:v8 withDescriptor:v12 error:0];
    }
  }
}

- (void)quarantineWorkflowWithReference:(id)a3
{
  id v9 = a3;
  v4 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v4)
  {
    id v5 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_313);
    [v5 quarantineWorkflowWithReference:v9];
  }
  else
  {
    id v6 = [(WFDatabaseProxy *)self database];
    uint64_t v7 = objc_opt_new();
    id v5 = [v6 recordWithDescriptor:v9 properties:v7 error:0];

    if (v5)
    {
      [v5 setRemoteQuarantineStatus:1];
      id v8 = [(WFDatabaseProxy *)self database];
      [v8 saveRecord:v5 withDescriptor:v9 error:0];
    }
  }
}

- (void)updateAppDescriptor:(id)a3 atKey:(id)a4 actionUUID:(id)a5 actionIndex:(id)a6 actionIdentifier:(id)a7 workflowID:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v21)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__54585;
    v25[4] = __Block_byref_object_dispose__54586;
    id v26 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __102__WFDatabaseProxy_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID_error___block_invoke;
    v24[3] = &unk_1E6555488;
    v24[4] = v25;
    id v22 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v24);
    [v22 updateAppDescriptor:v15 atKey:v16 actionUUID:v17 actionIndex:v18 actionIdentifier:v19 workflowID:v20];

    _Block_object_dispose(v25, 8);
  }
  else
  {
    uint64_t v23 = [(WFDatabaseProxy *)self database];
    [v23 updateAppDescriptor:v15 atKey:v16 actionUUID:v17 actionIndex:v18 actionIdentifier:v19 workflowID:v20];
  }
}

void __102__WFDatabaseProxy_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)setTrustedToRunScripts:(BOOL)a3 forReference:(id)a4 onDomain:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v10)
  {
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_309);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v11 setTrustedToRunScripts:v6 forReference:v9 onDomain:v8 completion:&__block_literal_global_311_54596];
  }
  else
  {
    id v11 = [(WFDatabaseProxy *)self database];
    [v11 setTrustedToRunScripts:v6 forReference:v9 onDomain:v8];
  }
}

void __64__WFDatabaseProxy_setTrustedToRunScripts_forReference_onDomain___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    id v2 = "-[WFDatabaseProxy setTrustedToRunScripts:forReference:onDomain:]_block_invoke_2";
    _os_log_impl(&dword_1C7F0A000, v0, OS_LOG_TYPE_ERROR, "%s Cannot set trust value for workflow reference due to insufficient database access", (uint8_t *)&v1, 0xCu);
  }
}

- (BOOL)isReference:(id)a3 allowedToRunOnDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v8)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__54585;
    id v18 = __Block_byref_object_dispose__54586;
    id v19 = 0;
    id v9 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_306_54599);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__WFDatabaseProxy_isReference_allowedToRunOnDomain___block_invoke_2;
    v13[3] = &unk_1E6555550;
    v13[4] = &v14;
    [v9 getIsReference:v6 allowedToRunOnDomain:v7 completion:v13];

    char v10 = [(id)v15[5] BOOLValue];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v11 = [(WFDatabaseProxy *)self database];
    char v10 = [v11 isReference:v6 allowedToRunOnDomain:v7];
  }
  return v10;
}

void __52__WFDatabaseProxy_isReference_allowedToRunOnDomain___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)createWorkflowWithWorkflowRecord:(id)a3 nameCollisionBehavior:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v9)
  {
    uint64_t v28 = 0;
    uint64_t v29 = (id *)&v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__54585;
    uint64_t v32 = __Block_byref_object_dispose__54586;
    id v33 = 0;
    char v10 = [v8 fileRepresentation];
    id v11 = v29;
    id obj = v29[5];
    id v12 = [v10 fileDataWithError:&obj];
    objc_storeStrong(v11 + 5, obj);

    if (v12)
    {
      uint64_t v21 = 0;
      id v22 = &v21;
      uint64_t v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__54585;
      id v25 = __Block_byref_object_dispose__54586;
      id v26 = 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __80__WFDatabaseProxy_createWorkflowWithWorkflowRecord_nameCollisionBehavior_error___block_invoke;
      v20[3] = &unk_1E6555488;
      v20[4] = &v28;
      id v13 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v20);
      uint64_t v14 = [v8 name];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __80__WFDatabaseProxy_createWorkflowWithWorkflowRecord_nameCollisionBehavior_error___block_invoke_2;
      v19[3] = &unk_1E6555528;
      v19[4] = &v21;
      v19[5] = &v28;
      [v13 createWorkflowWithWorkflowData:v12 name:v14 nameCollisionBehavior:a4 completion:v19];

      if (a5) {
        *a5 = v29[5];
      }
      id v15 = (id)v22[5];
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      id v15 = 0;
    }

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    uint64_t v16 = [[WFWorkflowCreationOptions alloc] initWithRecord:v8];
    id v17 = [(WFDatabaseProxy *)self database];
    id v15 = [v17 createWorkflowWithOptions:v16 nameCollisionBehavior:a4 error:a5];
  }
  return v15;
}

void __80__WFDatabaseProxy_createWorkflowWithWorkflowRecord_nameCollisionBehavior_error___block_invoke(uint64_t a1, void *a2)
{
}

void __80__WFDatabaseProxy_createWorkflowWithWorkflowRecord_nameCollisionBehavior_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)configuredTriggersForWorkflowID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__54585;
    id v25 = __Block_byref_object_dispose__54586;
    id v26 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__54585;
    id v19 = __Block_byref_object_dispose__54586;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__WFDatabaseProxy_configuredTriggersForWorkflowID_error___block_invoke;
    v14[3] = &unk_1E6555488;
    v14[4] = &v15;
    id v8 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v14);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__WFDatabaseProxy_configuredTriggersForWorkflowID_error___block_invoke_2;
    v13[3] = &unk_1E65554D8;
    v13[4] = &v21;
    void v13[5] = &v15;
    [v8 getConfiguredTriggersForWorkflowID:v6 completion:v13];

    if (a4) {
      *a4 = (id) v16[5];
    }
    id v9 = (id)v22[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    char v10 = [(WFDatabaseProxy *)self database];
    id v11 = [v10 configuredTriggersForWorkflowID:v6];
    id v9 = [v11 descriptors];
  }
  return v9;
}

void __57__WFDatabaseProxy_configuredTriggersForWorkflowID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __57__WFDatabaseProxy_configuredTriggersForWorkflowID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)folderForWorkflowReference:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__54585;
    v24 = __Block_byref_object_dispose__54586;
    id v25 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__54585;
    id v18 = __Block_byref_object_dispose__54586;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__WFDatabaseProxy_folderForWorkflowReference_error___block_invoke;
    v13[3] = &unk_1E6555488;
    v13[4] = &v14;
    id v8 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v13);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__WFDatabaseProxy_folderForWorkflowReference_error___block_invoke_2;
    v12[3] = &unk_1E6555500;
    v12[4] = &v20;
    void v12[5] = &v14;
    [v8 getFolderForWorkflowReference:v6 completion:v12];

    if (a4) {
      *a4 = (id) v15[5];
    }
    id v9 = (id)v21[5];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    char v10 = [(WFDatabaseProxy *)self database];
    id v9 = [v10 folderForWorkflowReference:v6];
  }
  return v9;
}

void __52__WFDatabaseProxy_folderForWorkflowReference_error___block_invoke(uint64_t a1, void *a2)
{
}

void __52__WFDatabaseProxy_folderForWorkflowReference_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)collectionWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__54585;
    v24 = __Block_byref_object_dispose__54586;
    id v25 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__54585;
    id v18 = __Block_byref_object_dispose__54586;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__WFDatabaseProxy_collectionWithIdentifier_error___block_invoke;
    v13[3] = &unk_1E6555488;
    v13[4] = &v14;
    id v8 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v13);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__WFDatabaseProxy_collectionWithIdentifier_error___block_invoke_2;
    v12[3] = &unk_1E6555500;
    v12[4] = &v20;
    void v12[5] = &v14;
    [v8 getCollectionWithIdentifier:v6 completion:v12];

    if (a4) {
      *a4 = (id) v15[5];
    }
    id v9 = (id)v21[5];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    char v10 = [(WFDatabaseProxy *)self database];
    id v9 = [v10 collectionWithIdentifier:v6];
  }
  return v9;
}

void __50__WFDatabaseProxy_collectionWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __50__WFDatabaseProxy_collectionWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)sortedVisibleFoldersWithError:(id *)a3
{
  id v5 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v5)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__54585;
    uint64_t v23 = __Block_byref_object_dispose__54586;
    id v24 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__54585;
    uint64_t v17 = __Block_byref_object_dispose__54586;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__WFDatabaseProxy_sortedVisibleFoldersWithError___block_invoke;
    v12[3] = &unk_1E6555488;
    v12[4] = &v13;
    id v6 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v12);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__WFDatabaseProxy_sortedVisibleFoldersWithError___block_invoke_2;
    v11[3] = &unk_1E65554D8;
    v11[4] = &v19;
    void v11[5] = &v13;
    [v6 getSortedVisibleFoldersWithCompletion:v11];

    if (a3) {
      *a3 = (id) v14[5];
    }
    id v7 = (id)v20[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v8 = [(WFDatabaseProxy *)self database];
    uint64_t v9 = [v8 sortedVisibleFolders];

    if (a3)
    {
      *a3 = [v9 fetchError];
    }
    id v7 = [v9 descriptors];
  }
  return v7;
}

void __49__WFDatabaseProxy_sortedVisibleFoldersWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __49__WFDatabaseProxy_sortedVisibleFoldersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)sortedWorkflowsWithQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__54585;
    id v25 = __Block_byref_object_dispose__54586;
    id v26 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__54585;
    uint64_t v19 = __Block_byref_object_dispose__54586;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__WFDatabaseProxy_sortedWorkflowsWithQuery_error___block_invoke;
    v14[3] = &unk_1E6555488;
    v14[4] = &v15;
    id v8 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v14);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__WFDatabaseProxy_sortedWorkflowsWithQuery_error___block_invoke_2;
    v13[3] = &unk_1E65554D8;
    v13[4] = &v21;
    void v13[5] = &v15;
    [v8 getSortedWorkflowsWithQuery:v6 completion:v13];

    if (a4) {
      *a4 = (id) v16[5];
    }
    id v9 = (id)v22[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    char v10 = [(WFDatabaseProxy *)self database];
    id v11 = [v10 sortedWorkflowsWithQuery:v6];

    if (a4)
    {
      *a4 = [v11 fetchError];
    }
    id v9 = [v11 descriptors];
  }
  return v9;
}

void __50__WFDatabaseProxy_sortedWorkflowsWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
}

void __50__WFDatabaseProxy_sortedWorkflowsWithQuery_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)sortedVisibleWorkflowsInCollection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__54585;
    id v25 = __Block_byref_object_dispose__54586;
    id v26 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__54585;
    uint64_t v19 = __Block_byref_object_dispose__54586;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__WFDatabaseProxy_sortedVisibleWorkflowsInCollection_error___block_invoke;
    v14[3] = &unk_1E6555488;
    v14[4] = &v15;
    id v8 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v14);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__WFDatabaseProxy_sortedVisibleWorkflowsInCollection_error___block_invoke_2;
    v13[3] = &unk_1E65554D8;
    v13[4] = &v21;
    void v13[5] = &v15;
    [v8 getSortedVisibleWorkflowsInCollection:v6 completion:v13];

    if (a4) {
      *a4 = (id) v16[5];
    }
    id v9 = (id)v22[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    char v10 = [(WFDatabaseProxy *)self database];
    id v11 = [v10 sortedVisibleWorkflowsInCollection:v6];

    if (a4)
    {
      *a4 = [v11 fetchError];
    }
    id v9 = [v11 descriptors];
  }
  return v9;
}

void __60__WFDatabaseProxy_sortedVisibleWorkflowsInCollection_error___block_invoke(uint64_t a1, void *a2)
{
}

void __60__WFDatabaseProxy_sortedVisibleWorkflowsInCollection_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)sortedVisibleWorkflowsByNameWithError:(id *)a3
{
  id v5 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v5)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__54585;
    uint64_t v23 = __Block_byref_object_dispose__54586;
    id v24 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__54585;
    uint64_t v17 = __Block_byref_object_dispose__54586;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__WFDatabaseProxy_sortedVisibleWorkflowsByNameWithError___block_invoke;
    v12[3] = &unk_1E6555488;
    v12[4] = &v13;
    id v6 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v12);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__WFDatabaseProxy_sortedVisibleWorkflowsByNameWithError___block_invoke_2;
    v11[3] = &unk_1E65554D8;
    v11[4] = &v19;
    void v11[5] = &v13;
    [v6 getSortedVisibleWorkflowsByNameWithCompletion:v11];

    if (a3) {
      *a3 = (id) v14[5];
    }
    id v7 = (id)v20[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v8 = [(WFDatabaseProxy *)self database];
    uint64_t v9 = [v8 sortedVisibleWorkflowsByName];

    if (a3)
    {
      *a3 = [v9 fetchError];
    }
    id v7 = [v9 descriptors];
  }
  return v7;
}

void __57__WFDatabaseProxy_sortedVisibleWorkflowsByNameWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __57__WFDatabaseProxy_sortedVisibleWorkflowsByNameWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)workflowRecordForDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v7)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__54585;
    uint64_t v27 = __Block_byref_object_dispose__54586;
    id v28 = 0;
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__54585;
    uint64_t v21 = __Block_byref_object_dispose__54586;
    id v22 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__WFDatabaseProxy_workflowRecordForDescriptor_error___block_invoke;
    v16[3] = &unk_1E6555488;
    v16[4] = &v17;
    id v8 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__WFDatabaseProxy_workflowRecordForDescriptor_error___block_invoke_2;
    v12[3] = &unk_1E65554B0;
    id v13 = v6;
    uint64_t v14 = &v23;
    uint64_t v15 = &v17;
    [v8 getWorkflowRecordDataForDescriptor:v13 completion:v12];

    if (a4) {
      *a4 = (id) v18[5];
    }
    id v9 = (id)v24[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    char v10 = [(WFDatabaseProxy *)self database];
    id v9 = [v10 recordWithDescriptor:v6 error:a4];
  }
  return v9;
}

void __53__WFDatabaseProxy_workflowRecordForDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
}

void __53__WFDatabaseProxy_workflowRecordForDescriptor_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [WFWorkflowFile alloc];
    id v8 = [*(id *)(a1 + 32) name];
    id v23 = 0;
    id v9 = [(WFWorkflowFile *)v7 initWithFileData:v5 name:v8 error:&v23];
    id v10 = v23;

    if (v9)
    {
      id v22 = v10;
      uint64_t v11 = [(WFWorkflowFile *)v9 recordRepresentationWithError:&v22];
      id v12 = v22;

      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v11;

      id v10 = v12;
    }
    id v15 = *(id *)(a1 + 32);
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setHiddenFromLibraryAndSync:", objc_msgSend(v15, "hiddenFromLibraryAndSync"));
        uint64_t v16 = [v15 actionsDescription];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setActionsDescription:v16];

        uint64_t v17 = [v15 subtitle];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setWorkflowSubtitle:v17];

        id v18 = [v15 associatedAppBundleIdentifier];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAssociatedAppBundleIdentifier:v18];
      }
      else
      {
        id v18 = v15;
        id v15 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v10;
    id v21 = v10;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
}

- (id)uniqueVisibleReferenceForWorkflowName:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v5)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__54585;
    id v15 = __Block_byref_object_dispose__54586;
    id v16 = 0;
    id v6 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_298);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__WFDatabaseProxy_uniqueVisibleReferenceForWorkflowName___block_invoke_2;
    v10[3] = &unk_1E6555460;
    v10[4] = &v11;
    [v6 getUniqueVisibleReferenceForWorkflowName:v4 completion:v10];

    id v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v8 = [(WFDatabaseProxy *)self database];
    id v7 = [v8 uniqueVisibleReferenceForWorkflowName:v4];
  }
  return v7;
}

void __57__WFDatabaseProxy_uniqueVisibleReferenceForWorkflowName___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)referenceForWorkflowID:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDatabaseProxy *)self databaseProxyHostConnection];

  if (v5)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__54585;
    id v15 = __Block_byref_object_dispose__54586;
    id v16 = 0;
    id v6 = -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_295);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__WFDatabaseProxy_referenceForWorkflowID___block_invoke_2;
    v10[3] = &unk_1E6555460;
    v10[4] = &v11;
    [v6 getReferenceForWorkflowID:v4 completion:v10];

    id v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v8 = [(WFDatabaseProxy *)self database];
    id v7 = [v8 referenceForWorkflowID:v4];
  }
  return v7;
}

void __42__WFDatabaseProxy_referenceForWorkflowID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)databaseProxyHostConnection
{
  uint64_t v3 = [(WFDatabaseProxy *)self database];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_databaseProxyHostConnection = self->_lock_databaseProxyHostConnection;
    p_lock_databaseProxyHostConnection = &self->_lock_databaseProxyHostConnection;
    id v4 = lock_databaseProxyHostConnection;
    if (!v4)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F29268]);
      id v4 = (NSXPCConnection *)[v8 initWithMachServiceName:*MEMORY[0x1E4FB4C30] options:0];
      id v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F23A02D0];
      WFDatabaseProxyConfigureXPCInterface(v9);
      [(NSXPCConnection *)v4 setRemoteObjectInterface:v9];
      [(NSXPCConnection *)v4 resume];
      objc_storeStrong((id *)p_lock_databaseProxyHostConnection, v4);
    }
    os_unfair_lock_unlock(p_lock);
  }
  return v4;
}

- (id)database
{
  return +[WFDatabase defaultDatabase];
}

- (WFDatabaseProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFDatabaseProxy;
  id v2 = [(WFDatabaseProxy *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

+ (WFDatabaseProxy)defaultDatabase
{
  if (defaultDatabase_onceToken != -1) {
    dispatch_once(&defaultDatabase_onceToken, &__block_literal_global_54694);
  }
  id v2 = (void *)defaultDatabase_proxy;
  return (WFDatabaseProxy *)v2;
}

void __34__WFDatabaseProxy_defaultDatabase__block_invoke()
{
  v0 = objc_alloc_init(WFDatabaseProxy);
  int v1 = (void *)defaultDatabase_proxy;
  defaultDatabase_proxy = (uint64_t)v0;
}

@end