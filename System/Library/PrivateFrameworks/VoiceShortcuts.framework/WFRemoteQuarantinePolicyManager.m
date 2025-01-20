@interface WFRemoteQuarantinePolicyManager
@end

@implementation WFRemoteQuarantinePolicyManager

uint64_t __97__WFRemoteQuarantinePolicyManager_XPCActivity__scheduleRegularPolicyUpdatesWithDatabaseProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  id v23 = 0;
  v8 = [v7 databaseWithError:&v23];
  v9 = (__CFString *)v23;
  if (!v8)
  {
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFRemoteQuarantinePolicyManager(XPCActivity) scheduleRegularPolicyUpdatesWithDatabaseProvider:]_block_invoke";
      __int16 v26 = 2114;
      v27 = v9;
      v12 = "%s Failed to initialize database, not updating quarantine bundles: %{public}@";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v13, v14, v12, buf, v15);
    }
LABEL_7:

    v6[2](v6);
    goto LABEL_12;
  }
  v10 = [v8 sortedVisibleWorkflowsByName];
  if (![v10 count])
  {
    v16 = [v8 allConfiguredTriggers];
    uint64_t v17 = [v16 count];

    if (v17) {
      goto LABEL_9;
    }
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFRemoteQuarantinePolicyManager(XPCActivity) scheduleRegularPolicyUpdatesWithDatabaseProvider:]_block_invoke";
      v12 = "%s Not updating the remote quarantine bundle because there are no shortcuts present";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      uint32_t v15 = 12;
      goto LABEL_6;
    }
    goto LABEL_7;
  }

LABEL_9:
  v18 = getWFGeneralLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFRemoteQuarantinePolicyManager(XPCActivity) scheduleRegularPolicyUpdatesWithDatabaseProvider:]_block_invoke";
    __int16 v26 = 2112;
    v27 = @"com.apple.siriactionsd.RemoteQuarantineUpdate";
    _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_INFO, "%s Remote quarantine bundle update activity invoked: (%@)", buf, 0x16u);
  }

  v19 = *(void **)(a1 + 40);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__WFRemoteQuarantinePolicyManager_XPCActivity__scheduleRegularPolicyUpdatesWithDatabaseProvider___block_invoke_160;
  v21[3] = &unk_1E6540DC0;
  v22 = v6;
  [v19 updatePolicyWithXPCActivity:v5 completionHandler:v21];

LABEL_12:
  return 0;
}

uint64_t __97__WFRemoteQuarantinePolicyManager_XPCActivity__scheduleRegularPolicyUpdatesWithDatabaseProvider___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end