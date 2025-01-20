@interface WFTriggerManager
- (BOOL)updateNotificationLevel:(int)a3 forConfiguredTrigger:(id)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (WFDatabase)database;
- (WFTriggerManager)initWithDatabase:(id)a3;
- (id)allConfiguredTriggers;
- (id)configuredTriggerWithID:(id)a3;
- (void)associateWorkflowToTriggerID:(id)a3 deletingExistingReference:(BOOL)a4 notifyDaemon:(BOOL)a5 workflowReference:(id)a6 completion:(id)a7;
- (void)deleteTriggerWithIdentifier:(id)a3 notifyDaemon:(BOOL)a4 completion:(id)a5;
- (void)disableAllTriggers;
- (void)disableTriggersWithIdentifiers:(id)a3;
- (void)saveNewConfiguredTrigger:(id)a3 notifyDaemon:(BOOL)a4 completion:(id)a5;
- (void)saveNewConfiguredTrigger:(id)a3 workflow:(id)a4 notifyDaemon:(BOOL)a5 completion:(id)a6;
- (void)saveNewConfiguredTrigger:(id)a3 workflowReference:(id)a4 notifyDaemon:(BOOL)a5 completion:(id)a6;
- (void)setConnection:(id)a3;
- (void)updateConfiguredTrigger:(id)a3 triggerID:(id)a4 notifyDaemon:(BOOL)a5 completion:(id)a6;
@end

@implementation WFTriggerManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setConnection:(id)a3
{
}

- (void)disableTriggersWithIdentifiers:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__WFTriggerManager_disableTriggersWithIdentifiers___block_invoke;
  v3[3] = &unk_1E65591A0;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __51__WFTriggerManager_disableTriggersWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 database];
  v6 = [v5 configuredTriggerForTriggerID:v4];

  v7 = [*(id *)(a1 + 32) database];
  id v15 = 0;
  v8 = [v7 recordWithDescriptor:v6 error:&v15];
  id v9 = v15;

  if (!v8)
  {
    v13 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFTriggerManager disableTriggersWithIdentifiers:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Could not disable trigger due to no existing record error: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  [v8 setEnabled:0];
  v10 = [*(id *)(a1 + 32) database];
  id v14 = v9;
  char v11 = [v10 saveRecord:v8 withDescriptor:v6 error:&v14];
  id v12 = v14;

  if ((v11 & 1) == 0)
  {
    v13 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFTriggerManager disableTriggersWithIdentifiers:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Could not disable trigger due to error: %@", buf, 0x16u);
    }
    id v9 = v12;
LABEL_8:

    id v12 = v9;
  }
}

- (void)disableAllTriggers
{
  v3 = [(WFTriggerManager *)self allConfiguredTriggers];
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_265);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [(WFTriggerManager *)self disableTriggersWithIdentifiers:v4];
}

id __38__WFTriggerManager_disableAllTriggers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled])
  {
    v3 = [v2 identifier];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)updateNotificationLevel:(int)a3 forConfiguredTrigger:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  if (!v9)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 300, @"Invalid parameter not satisfying: %@", @"configuredTrigger" object file lineNumber description];
  }
  v10 = [(WFTriggerManager *)self database];
  char v11 = [v10 recordWithDescriptor:v9 error:a5];

  if (v11)
  {
    [v11 setNotificationLevel:v6];
    id v12 = [(WFTriggerManager *)self database];
    char v13 = [v12 saveRecord:v11 withDescriptor:v9 error:a5];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)configuredTriggerWithID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 294, @"Invalid parameter not satisfying: %@", @"triggerID" object file lineNumber description];
  }
  uint64_t v6 = [(WFTriggerManager *)self database];
  v7 = [v6 configuredTriggerForTriggerID:v5];

  return v7;
}

- (id)allConfiguredTriggers
{
  id v2 = [(WFTriggerManager *)self database];
  v3 = [v2 allConfiguredTriggers];

  id v4 = [v3 descriptors];

  return v4;
}

- (void)deleteTriggerWithIdentifier:(id)a3 notifyDaemon:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  char v11 = (void (**)(void, void, void))v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 267, @"Invalid parameter not satisfying: %@", @"triggerID" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 268, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v12 = [(WFTriggerManager *)self database];
  char v13 = [v12 configuredTriggerForTriggerID:v9];

  if (v13)
  {
    id v14 = [(WFTriggerManager *)self database];
    id v23 = 0;
    char v15 = [v14 deleteReference:v13 error:&v23];
    id v16 = v23;

    if ((v15 & 1) == 0)
    {
      ((void (**)(void, void, id))v11)[2](v11, 0, v16);
      goto LABEL_12;
    }
  }
  else
  {
    v17 = getWFTriggersLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFTriggerManager deleteTriggerWithIdentifier:notifyDaemon:completion:]";
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_ERROR, "%s No configuredTrigger for triggerID %@", buf, 0x16u);
    }

    id v16 = 0;
  }
  if (v6)
  {
    __int16 v18 = [v13 trigger];
    uint64_t v19 = [(id)objc_opt_class() triggerBacking];

    uint64_t v20 = [MEMORY[0x1E4FB4540] standardClient];
    [v20 unregisterTriggerWithIdentifier:v9 triggerBacking:v19 completion:v11];
  }
  else
  {
    v11[2](v11, 1, 0);
  }
LABEL_12:
}

- (void)associateWorkflowToTriggerID:(id)a3 deletingExistingReference:(BOOL)a4 notifyDaemon:(BOOL)a5 workflowReference:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void (**)(void, void, void))v15;
  if (v13)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 232, @"Invalid parameter not satisfying: %@", @"triggerID" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 233, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__40366;
  v35 = __Block_byref_object_dispose__40367;
  id v36 = 0;
  v17 = [(WFTriggerManager *)self database];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __117__WFTriggerManager_associateWorkflowToTriggerID_deletingExistingReference_notifyDaemon_workflowReference_completion___block_invoke;
  v26[3] = &unk_1E65530C0;
  v26[4] = self;
  id v18 = v13;
  BOOL v30 = a4;
  id v27 = v18;
  v29 = &v31;
  id v19 = v14;
  id v28 = v19;
  uint64_t v20 = (id *)(v32 + 5);
  id obj = (id)v32[5];
  [v17 performTransactionWithReason:@"associate workflow to trigger, possibly deleting existing reference", v26, &obj block error];
  objc_storeStrong(v20, obj);

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      v21 = [(WFTriggerManager *)self connection];
      v22 = [v21 remoteObjectProxy];
    }
    else
    {
      v22 = [MEMORY[0x1E4FB4540] standardClient];
    }
    [v22 refreshTriggerWithIdentifier:v18 completion:v16];
  }
  else
  {
    ((void (**)(void, BOOL, void))v16)[2](v16, v32[5] == 0, 0);
  }

  _Block_object_dispose(&v31, 8);
}

void __117__WFTriggerManager_associateWorkflowToTriggerID_deletingExistingReference_notifyDaemon_workflowReference_completion___block_invoke(uint64_t a1, id *a2)
{
  id v4 = [*(id *)(a1 + 32) database];
  id v14 = [v4 configuredTriggerForTriggerID:*(void *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 64)) {
    BOOL v5 = v14 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    BOOL v6 = [v14 workflowID];

    if (v6)
    {
      v7 = [*(id *)(a1 + 32) database];
      v8 = [v14 workflowID];
      BOOL v9 = [v7 referenceForWorkflowID:v8];

      if (v9)
      {
        id v10 = [*(id *)(a1 + 32) database];
        char v11 = [v10 deleteReference:v9 error:a2];

        if ((v11 & 1) == 0)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *a2);

          goto LABEL_12;
        }
      }
    }
  }
  id v12 = [*(id *)(a1 + 32) database];
  id v13 = [v12 associateWorkflowToTrigger:v14 workflow:*(void *)(a1 + 48) error:a2];

  if (!v13) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *a2);
  }
LABEL_12:
}

- (void)updateConfiguredTrigger:(id)a3 triggerID:(id)a4 notifyDaemon:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, uint64_t, void))a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_21:
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 193, @"Invalid parameter not satisfying: %@", @"triggerID" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_22;
  }
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 192, @"Invalid parameter not satisfying: %@", @"newRecord" object file lineNumber description];

  if (!v12) {
    goto LABEL_21;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_22:
  BOOL v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 194, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  id v14 = [(WFTriggerManager *)self database];
  id v15 = [v14 configuredTriggerForTriggerID:v12];

  if (v15)
  {
    id v16 = [(WFTriggerManager *)self database];
    id v33 = 0;
    v17 = [v16 recordWithDescriptor:v15 error:&v33];
    id v18 = v33;

    if (v17)
    {
      BOOL v31 = v7;
      id v19 = [v11 triggerData];
      [v17 setTriggerData:v19];

      objc_msgSend(v17, "setShouldNotify:", objc_msgSend(v11, "shouldNotify"));
      objc_msgSend(v17, "setShouldPrompt:", objc_msgSend(v11, "shouldPrompt"));
      objc_msgSend(v17, "setShouldRecur:", objc_msgSend(v11, "shouldRecur"));
      objc_msgSend(v17, "setEnabled:", objc_msgSend(v11, "isEnabled"));
      objc_msgSend(v17, "setEditableShortcut:", objc_msgSend(v11, "editableShortcut"));
      uint64_t v20 = [v11 selectedEntryMetadata];
      [v17 setSelectedEntryMetadata:v20];

      v21 = [(WFTriggerManager *)self database];
      id v32 = v18;
      char v22 = [v21 saveRecord:v17 withDescriptor:v15 error:&v32];
      id v23 = v32;

      if (v22)
      {
        if (v31)
        {
          if (_os_feature_enabled_impl())
          {
            v24 = [(WFTriggerManager *)self connection];
            v25 = [v24 remoteObjectProxy];

            [v25 refreshTriggerWithIdentifier:v12 completion:v13];
          }
          else
          {
            id v27 = [MEMORY[0x1E4FB4540] standardClient];
            [v27 refreshTriggerWithIdentifier:v12 completion:v13];
          }
        }
        else
        {
          v13[2](v13, 1, 0);
        }
      }
      else
      {
        ((void (**)(id, uint64_t, id))v13)[2](v13, 0, v23);
      }
      id v18 = v23;
    }
    else
    {
      ((void (**)(id, uint64_t, id))v13)[2](v13, 0, v18);
    }
  }
  else
  {
    __int16 v26 = getWFTriggersLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[WFTriggerManager updateConfiguredTrigger:triggerID:notifyDaemon:completion:]";
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_ERROR, "%s Couldn't find trigger to update for triggerID (%@)", buf, 0x16u);
    }

    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFTriggerErrorDomain" code:1001 userInfo:0];
    ((void (**)(id, uint64_t, id))v13)[2](v13, 0, v18);
  }
}

- (void)saveNewConfiguredTrigger:(id)a3 workflowReference:(id)a4 notifyDaemon:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, uint64_t, void))a6;
  uint64_t v33 = 0;
  v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  __int16 v36 = __Block_byref_object_copy__40366;
  id v37 = __Block_byref_object_dispose__40367;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  BOOL v30 = __Block_byref_object_copy__40366;
  BOOL v31 = __Block_byref_object_dispose__40367;
  id v32 = 0;
  id v13 = [(WFTriggerManager *)self database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__WFTriggerManager_saveNewConfiguredTrigger_workflowReference_notifyDaemon_completion___block_invoke;
  v22[3] = &unk_1E6553098;
  v25 = &v27;
  v22[4] = self;
  id v14 = v10;
  id v23 = v14;
  id v15 = v11;
  id v24 = v15;
  __int16 v26 = &v33;
  id v16 = v34;
  id obj = v34[5];
  [v13 performTransactionWithReason:@"save trigger with workflow" block:v22 error:&obj];
  objc_storeStrong(v16 + 5, obj);

  uint64_t v17 = v28[5];
  if (v17 && v7)
  {
    id v18 = [MEMORY[0x1E4FB4540] standardClient];
    id v19 = [(id)v28[5] identifier];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__WFTriggerManager_saveNewConfiguredTrigger_workflowReference_notifyDaemon_completion___block_invoke_2;
    v20[3] = &unk_1E6553048;
    v20[4] = &v27;
    [v18 refreshTriggerWithIdentifier:v19 completion:v20];

    uint64_t v17 = v28[5];
  }
  ((void (**)(id, uint64_t, id))v12)[2](v12, v17, v34[5]);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

void __87__WFTriggerManager_saveNewConfiguredTrigger_workflowReference_notifyDaemon_completion___block_invoke(uint64_t a1, void **a2)
{
  id v4 = [*(id *)(a1 + 32) database];
  uint64_t v5 = [v4 createTriggerWithRecord:*(void *)(a1 + 40) workflow:*(void *)(a1 + 48) error:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v8 = *a2;
    BOOL v9 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    objc_storeStrong(v9, v8);
  }
}

void __87__WFTriggerManager_saveNewConfiguredTrigger_workflowReference_notifyDaemon_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315650;
      BOOL v9 = "-[WFTriggerManager saveNewConfiguredTrigger:workflowReference:notifyDaemon:completion:]_block_invoke_2";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)saveNewConfiguredTrigger:(id)a3 workflow:(id)a4 notifyDaemon:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, uint64_t, void, id))a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_12:
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 122, @"Invalid parameter not satisfying: %@", @"workflow" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
LABEL_13:
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 123, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_4;
  }
  uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 121, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];

  if (!v12) {
    goto LABEL_12;
  }
LABEL_3:
  if (!v13) {
    goto LABEL_13;
  }
LABEL_4:
  [v12 setHiddenFromLibraryAndSync:1];
  uint64_t v14 = NSString;
  id v15 = [MEMORY[0x1E4F29128] UUID];
  id v16 = [v15 UUIDString];
  uint64_t v17 = [v14 stringWithFormat:@"Automation %@", v16];
  [v12 setName:v17];

  id v18 = [[WFWorkflowCreationOptions alloc] initWithRecord:v12];
  uint64_t v51 = 0;
  v52 = (id *)&v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__40366;
  v55 = __Block_byref_object_dispose__40367;
  id v56 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__40366;
  v49 = __Block_byref_object_dispose__40367;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__40366;
  v43 = __Block_byref_object_dispose__40367;
  id v44 = 0;
  id v19 = [(WFTriggerManager *)self database];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke;
  v33[3] = &unk_1E6553070;
  __int16 v36 = &v39;
  v33[4] = self;
  uint64_t v20 = v18;
  v34 = v20;
  id v37 = &v51;
  id v38 = &v45;
  id v21 = v11;
  id v35 = v21;
  char v22 = v52;
  id obj = v52[5];
  [v19 performTransactionWithReason:@"save trigger with workflow" block:v33 error:&obj];
  objc_storeStrong(v22 + 5, obj);

  uint64_t v23 = v46[5];
  if (v23 && v7)
  {
    if (_os_feature_enabled_impl())
    {
      id v24 = [(WFTriggerManager *)self connection];
      v25 = [v24 remoteObjectProxy];

      __int16 v26 = [(id)v46[5] identifier];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke_2;
      v31[3] = &unk_1E6553048;
      v31[4] = &v45;
      [v25 refreshTriggerWithIdentifier:v26 completion:v31];
    }
    else
    {
      v25 = [MEMORY[0x1E4FB4540] standardClient];
      __int16 v26 = [(id)v46[5] identifier];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke_252;
      v30[3] = &unk_1E6553048;
      v30[4] = &v45;
      [v25 refreshTriggerWithIdentifier:v26 completion:v30];
    }

    uint64_t v23 = v46[5];
  }
  v13[2](v13, v23, v40[5], v52[5]);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
}

void __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke(uint64_t a1, id *a2)
{
  id v4 = [*(id *)(a1 + 32) database];
  uint64_t v5 = [v4 createWorkflowWithOptions:*(void *)(a1 + 40) error:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    int v8 = [*(id *)(a1 + 32) database];
    uint64_t v9 = [v8 createTriggerWithRecord:*(void *)(a1 + 48) workflow:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error:a2];
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
      return;
    }
    id v12 = [*(id *)(a1 + 32) database];
    [v12 deleteReference:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error:0];
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  id v14 = *a2;
  id v15 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v14;
}

void __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315650;
      uint64_t v9 = "-[WFTriggerManager saveNewConfiguredTrigger:workflow:notifyDaemon:completion:]_block_invoke_2";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

void __78__WFTriggerManager_saveNewConfiguredTrigger_workflow_notifyDaemon_completion___block_invoke_252(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315650;
      uint64_t v9 = "-[WFTriggerManager saveNewConfiguredTrigger:workflow:notifyDaemon:completion:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)saveNewConfiguredTrigger:(id)a3 notifyDaemon:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (!v9)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 87, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_11:
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 88, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v34 = 0;
  id v35 = (id *)&v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__40366;
  id v38 = __Block_byref_object_dispose__40367;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  BOOL v31 = __Block_byref_object_copy__40366;
  id v32 = __Block_byref_object_dispose__40367;
  id v33 = 0;
  __int16 v12 = [(WFTriggerManager *)self database];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke;
  v24[3] = &unk_1E6553020;
  __int16 v26 = &v28;
  v24[4] = self;
  id v13 = v9;
  id v25 = v13;
  uint64_t v27 = &v34;
  uint64_t v14 = v35;
  id obj = v35[5];
  [v12 performTransactionWithReason:@"save trigger" block:v24 error:&obj];
  objc_storeStrong(v14 + 5, obj);

  uint64_t v15 = v29[5];
  if (v15 && v6)
  {
    if (_os_feature_enabled_impl())
    {
      id v16 = [(WFTriggerManager *)self connection];
      uint64_t v17 = [v16 remoteObjectProxy];

      id v18 = [(id)v29[5] identifier];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke_2;
      v22[3] = &unk_1E6553048;
      v22[4] = &v28;
      [v17 refreshTriggerWithIdentifier:v18 completion:v22];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4FB4540] standardClient];
      id v18 = [(id)v29[5] identifier];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke_239;
      v21[3] = &unk_1E6553048;
      v21[4] = &v28;
      [v17 refreshTriggerWithIdentifier:v18 completion:v21];
    }

    uint64_t v15 = v29[5];
  }
  ((void (**)(void, uint64_t, id))v11)[2](v11, v15, v35[5]);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

void __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke(uint64_t a1, void **a2)
{
  id v4 = [*(id *)(a1 + 32) database];
  uint64_t v5 = [v4 createTriggerWithRecord:*(void *)(a1 + 40) error:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    int v8 = *a2;
    id v9 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    objc_storeStrong(v9, v8);
  }
}

void __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315650;
      id v9 = "-[WFTriggerManager saveNewConfiguredTrigger:notifyDaemon:completion:]_block_invoke_2";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

void __69__WFTriggerManager_saveNewConfiguredTrigger_notifyDaemon_completion___block_invoke_239(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = getWFTriggersLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315650;
      id v9 = "-[WFTriggerManager saveNewConfiguredTrigger:notifyDaemon:completion:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s failed to refresh new trigger (%@): %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.shortcutsautomationd.xpc" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    uint64_t v6 = WFAutomationDaemonXPCInterface();
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_40405];
    [(NSXPCConnection *)self->_connection setInvalidationHandler:&__block_literal_global_224_40406];
    [(NSXPCConnection *)self->_connection resume];
    connection = self->_connection;
  }
  return connection;
}

void __30__WFTriggerManager_connection__block_invoke_222()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = getWFTriggersLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    id v2 = "-[WFTriggerManager connection]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v0, OS_LOG_TYPE_ERROR, "%s Client connection invalidated to automationd", (uint8_t *)&v1, 0xCu);
  }
}

void __30__WFTriggerManager_connection__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = getWFTriggersLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    id v2 = "-[WFTriggerManager connection]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v0, OS_LOG_TYPE_ERROR, "%s Client connection to automationd interrupted", (uint8_t *)&v1, 0xCu);
  }
}

- (WFTriggerManager)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFTriggerManager.m", 55, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFTriggerManager;
  uint64_t v7 = [(WFTriggerManager *)&v12 init];
  int v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_database, a3);
    id v9 = v8;
  }

  return v8;
}

@end