@interface TRILimitedCarryProfileManager
- ($A5A652246548B43F8BC05201A1C72A70)_enqueueTask:(id)a3;
- (BOOL)_setStoredLimitedCarryExperimentsWithError:(id *)a3;
- (TRILimitedCarryProfileManager)initWithTaskQueue:(id)a3 context:(id)a4;
- (id)_getStoredLimitedCarryExperimentsWithError:(id *)a3;
- (id)_limitedCarryExperiments;
- (void)_gatherProfileUpdatesAndScheduleRelatedTasks;
- (void)processLaunchEvent;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeProfileForExperiment:(id)a3;
- (void)setLcExperiments:(id)a3;
@end

@implementation TRILimitedCarryProfileManager

- (TRILimitedCarryProfileManager)initWithTaskQueue:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TRILimitedCarryProfileManager;
  v9 = [(TRILimitedCarryProfileManager *)&v22 init];
  if (v9)
  {
    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Initializing profile connection observer", buf, 2u);
    }

    if (!v7)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v9, @"TRILimitedCarryProfileManager.m", 50, @"Invalid parameter not satisfying: %@", @"taskQueue" object file lineNumber description];
    }
    objc_storeWeak((id *)&v9->_taskQueue, v7);
    objc_storeWeak((id *)&v9->_context, v8);
    uint64_t v11 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.profile-updates-timeout-coalesce" qosClass:17];
    profileProcessingQueue = v9->_profileProcessingQueue;
    v9->_profileProcessingQueue = (OS_dispatch_queue *)v11;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__TRILimitedCarryProfileManager_initWithTaskQueue_context___block_invoke;
    block[3] = &unk_1E6BB82F8;
    v13 = v9;
    v20 = v13;
    if (qword_1EA8D8260 != -1) {
      dispatch_once(&qword_1EA8D8260, block);
    }
    v14 = (_PASSimpleCoalescingTimer *)(id)_MergedGlobals_46;

    checkForUpdates = v13->_checkForUpdates;
    v13->_checkForUpdates = v14;

    v16 = [MEMORY[0x1E4F74230] sharedConnection];
    [v16 registerObserver:v13];
  }
  return v9;
}

void __59__TRILimitedCarryProfileManager_initWithTaskQueue_context___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E016E7F0]();
  id v3 = objc_alloc(MEMORY[0x1E4F93B98]);
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__TRILimitedCarryProfileManager_initWithTaskQueue_context___block_invoke_2;
  v8[3] = &unk_1E6BB82F8;
  v9 = v4;
  uint64_t v6 = [v3 initWithQueue:v5 operation:v8];

  id v7 = (void *)_MergedGlobals_46;
  _MergedGlobals_46 = v6;
}

uint64_t __59__TRILimitedCarryProfileManager_initWithTaskQueue_context___block_invoke_2(uint64_t a1)
{
  v2 = TRILogCategory_Server();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DA291000, v2, OS_LOG_TYPE_DEFAULT, "Missed profile connection observer notification, checking profiles now", v4, 2u);
  }

  return [*(id *)(a1 + 32) _gatherProfileUpdatesAndScheduleRelatedTasks];
}

- (void)processLaunchEvent
{
  id v3 = (OS_os_transaction *)os_transaction_create();
  txn = self->_txn;
  self->_txn = v3;

  uint64_t v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Created transaction for Limited Carry manager", v6, 2u);
  }

  [(_PASSimpleCoalescingTimer *)self->_checkForUpdates runAfterDelaySeconds:1 coalescingBehavior:2.0];
}

- (id)_limitedCarryExperiments
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [v2 enumeratorAtPath:@"/private/var/Managed Preferences/mobile/"];

  id v39 = (id)objc_opt_new();
  v4 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v5 = [v3 nextObject];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0x1E4F1C000uLL;
    while (![v6 containsString:@"com.apple.internal.trial.limitedcarry", log])
    {
LABEL_35:

      v4 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v6 = [v3 nextObject];
      if (!v6) {
        goto LABEL_38;
      }
    }
    id v8 = *(void **)(v7 + 2832);
    v9 = [@"/private/var/Managed Preferences/mobile/" stringByAppendingPathComponent:v6];
    v10 = [v8 fileURLWithPath:v9];

    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v40 = 0;
    v12 = (void *)[v11 initWithContentsOfURL:v10 error:&v40];
    id v13 = v40;
    v14 = TRILogCategory_Server();
    v15 = v14;
    if (v12) {
      BOOL v16 = v13 == 0;
    }
    else {
      BOOL v16 = 0;
    }
    if (!v16)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v42 = v6;
        __int16 v43 = 2112;
        v44 = v10;
        __int16 v45 = 2112;
        id v46 = v13;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Issue reading managed preferences for profile %@ at %@: %@", buf, 0x20u);
      }
      goto LABEL_33;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v6;
      _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Found relevant managed preferences file: %@", buf, 0xCu);
    }

    v17 = [v12 objectForKeyedSubscript:@"Experiment"];

    if (!v17) {
      goto LABEL_34;
    }
    v18 = [v12 objectForKeyedSubscript:@"Experiment"];
    v15 = [v18 objectForKeyedSubscript:@"ExperimentID"];

    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v30 = TRILogCategory_Server();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v6;
        __int16 v43 = 2112;
        v44 = v15;
        _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "Limited carry profile %@ doesn't provide a valid experiment identifier, found: %@", buf, 0x16u);
      }

      goto LABEL_33;
    }
    v19 = [v12 objectForKeyedSubscript:@"Experiment"];
    v20 = [v19 objectForKeyedSubscript:@"DeploymentID"];

    if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v23 = TRILogCategory_Server();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v6;
        __int16 v43 = 2112;
        v44 = v20;
        _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Limited carry profile %@ doesn't provide a valid deployment identifier, found: %@", buf, 0x16u);
      }
      goto LABEL_32;
    }
    v36 = v20;
    v21 = [v12 objectForKeyedSubscript:@"Experiment"];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"NamespaceName"];

    v23 = v22;
    if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v31 = TRILogCategory_Server();
      v38 = v31;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v6;
        __int16 v43 = 2112;
        v44 = v23;
        _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Limited carry profile %@ doesn't provide a valid namespace name, found: %@", buf, 0x16u);
      }
      goto LABEL_31;
    }
    v24 = (void *)MEMORY[0x1E4FB01A0];
    v37 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    uint64_t v25 = [v37 namespaceDescriptorsDefaultDir];
    v26 = v23;
    v27 = (void *)v25;
    v35 = v26;
    uint64_t v28 = objc_msgSend(v24, "loadWithNamespaceName:fromDirectory:");

    v38 = (void *)v28;
    if (v28)
    {
      v29 = [v12 objectForKeyedSubscript:@"Experiment"];
      [v39 setObject:v29 forKeyedSubscript:v6];
    }
    else
    {
      v29 = TRILogCategory_Server();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        os_log_t log = v29;
        v32 = TRILoggedNamespaceName(v35);
        *(_DWORD *)buf = 138412802;
        v42 = v15;
        __int16 v43 = 2112;
        v44 = v6;
        __int16 v45 = 2114;
        id v46 = v32;
        _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Found experiment %@ for installed profile %@ specifies namespace %{public}@, which is not registered with Trial", buf, 0x20u);

        v23 = v35;
        goto LABEL_30;
      }
    }
    v23 = v35;
LABEL_30:

LABEL_31:
    v20 = v36;

LABEL_32:
    unint64_t v7 = 0x1E4F1C000;
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
LABEL_38:

  return v39;
}

- (void)removeProfileForExperiment:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TRILimitedCarryProfileManager *)self _limitedCarryExperiments];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v21);
        v12 = [v11 objectForKeyedSubscript:@"ExperimentID"];

        id v13 = [v4 experimentId];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          v15 = [v5 objectForKeyedSubscript:v10];
          BOOL v16 = [v15 objectForKeyedSubscript:@"DeploymentID"];

          if (v16)
          {
            int v17 = [v16 longLongValue];
            if ([v4 deploymentId] != v17)
            {
              v19 = TRILogCategory_Server();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                int v20 = [v4 deploymentId];
                *(_DWORD *)buf = 138412802;
                v26 = v16;
                __int16 v27 = 2112;
                uint64_t v28 = v12;
                __int16 v29 = 1024;
                int v30 = v20;
                _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Found deployment %@ for experiment %@ from profile does not match deployment identifier for experiment record: %d", buf, 0x1Cu);
              }

              goto LABEL_16;
            }
          }
          v18 = [MEMORY[0x1E4F74230] sharedConnection];
          [v18 removeProfileWithIdentifier:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Profile connection observer received notification", v6, 2u);
  }

  [(_PASSimpleCoalescingTimer *)self->_checkForUpdates runImmediately];
}

- (void)_gatherProfileUpdatesAndScheduleRelatedTasks
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  __int16 v43 = [(TRILimitedCarryProfileManager *)self _limitedCarryExperiments];
  id v53 = 0;
  id v3 = [(TRILimitedCarryProfileManager *)self _getStoredLimitedCarryExperimentsWithError:&v53];
  if (v53)
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v57 = @"com.apple.internal.trial.limitedcarry.db";
      __int16 v58 = 2114;
      id v59 = v53;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Error reading data for %@ key in TRIKVStore: %{public}@. ", buf, 0x16u);
    }
  }
  v41 = self;
  v42 = +[TRISequenceTask task];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v55 count:16];
  BOOL v40 = v6 != 0;
  if (!v6)
  {
    char v9 = 0;
    long long v24 = v5;
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v7 = v6;
  char v8 = 0;
  char v9 = 0;
  uint64_t v10 = *(void *)v50;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v50 != v10) {
        objc_enumerationMutation(v5);
      }
      v12 = *(__CFString **)(*((void *)&v49 + 1) + 8 * i);
      id v13 = [v43 objectForKeyedSubscript:v12];
      uint64_t v14 = [v5 objectForKeyedSubscript:v12];
      v15 = (__CFString *)v14;
      if (!v13)
      {
        long long v22 = TRILogCategory_Server();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v15;
          _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "Found removed profile: %@", buf, 0xCu);
        }

        int v17 = [(__CFString *)v15 objectForKeyedSubscript:@"ExperimentID"];
        v18 = [(__CFString *)v15 objectForKeyedSubscript:@"DeploymentID"];
        uint64_t v19 = [v18 longLongValue];
        int v20 = v17;
        uint64_t v21 = 4;
        goto LABEL_19;
      }
      if (!v14)
      {
        uint64_t v25 = TRILogCategory_Server();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v12;
          _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Error with profile found in database for identifier: %{public}@, profile value was nil. ", buf, 0xCu);
        }

        txn = (OS_os_transaction *)v5;
        goto LABEL_49;
      }
      if (([v13 isEqual:v14] & 1) == 0)
      {
        BOOL v16 = TRILogCategory_Server();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v57 = v15;
          __int16 v58 = 2112;
          id v59 = v13;
          _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Found replaced profile: %@ -> %@", buf, 0x16u);
        }

        int v17 = [(__CFString *)v15 objectForKeyedSubscript:@"ExperimentID"];
        v18 = [(__CFString *)v15 objectForKeyedSubscript:@"DeploymentID"];
        uint64_t v19 = [v18 longLongValue];
        char v9 = 1;
        int v20 = v17;
        uint64_t v21 = 11;
LABEL_19:
        long long v23 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v20 deploymentId:v19 failOnUnrecognizedExperiment:1 triggerEvent:v21 taskAttribution:0];
        [v42 addTaskToEndOfSequence:v23];

        char v8 = 1;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v7) {
      continue;
    }
    break;
  }

  if (v8)
  {
    long long v24 = +[TRIMaintenanceTask task];
    [v42 addTaskToEndOfSequence:v24];
    goto LABEL_28;
  }
  BOOL v40 = 0;
LABEL_29:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v27 = v43;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        v33 = [v5 objectForKeyedSubscript:v32];

        if (!v33)
        {
          v34 = TRILogCategory_Server();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = [v27 objectForKeyedSubscript:v32];
            *(_DWORD *)buf = 138412290;
            v57 = v35;
            _os_log_impl(&dword_1DA291000, v34, OS_LOG_TYPE_DEFAULT, "Found new profile: %@", buf, 0xCu);
          }
          char v9 = 1;
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v29);
  }

  [(TRILimitedCarryProfileManager *)v41 setLcExperiments:v27];
  if (v9)
  {
    v36 = (void *)[objc_alloc(MEMORY[0x1E4FB00D8]) initWithAllowsCellular:1 discretionaryBehavior:0];
    v37 = [[TRITaskAttributionInternalInsecure alloc] initWithTeamIdentifier:0 triCloudKitContainer:1 applicationBundleIdentifier:@"com.apple.triald" networkOptions:v36];
    v38 = +[TRIFetchMultipleExperimentNotificationsTask taskWithStartingFetchDateOverride:0 namespaceNames:0 taskAttributing:v37 rollbacksOnly:0 limitedCarryOnly:1];
    [v42 addTaskToEndOfSequence:v38];

    goto LABEL_43;
  }
  if (v40)
  {
LABEL_43:
    [(TRILimitedCarryProfileManager *)v41 _enqueueTask:v42];
    id v44 = 0;
    if (![(TRILimitedCarryProfileManager *)v41 _setStoredLimitedCarryExperimentsWithError:&v44])
    {
      id v39 = TRILogCategory_Server();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v57 = @"com.apple.internal.trial.limitedcarry.db";
        __int16 v58 = 2114;
        id v59 = v44;
        _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
      }
    }
  }
  txn = v41->_txn;
  v41->_txn = 0;
LABEL_49:
}

- ($A5A652246548B43F8BC05201A1C72A70)_enqueueTask:(id)a3
{
  p_taskQueue = &self->_taskQueue;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_taskQueue);
  if (!WeakRetained)
  {
    uint64_t v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to add tasks to task queue for Limited Carry profile update, task queue was nil", buf, 2u);
    }
  }
  uint64_t v7 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
  v8.var0 = [WeakRetained addTask:v4 options:v7];

  id v9 = [[TRIRunningXPCActivityDescriptor alloc] initForImmediateWorkWithCapabilities:7];
  [WeakRetained resumeWithXPCActivityDescriptor:v9 executeWhenSuspended:0];

  if (v8.var0 == 2)
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Unable to add task for profile list changed notification", v12, 2u);
    }
  }
  return v8;
}

- (BOOL)_setStoredLimitedCarryExperimentsWithError:(id *)a3
{
  uint64_t v6 = [(TRILimitedCarryProfileManager *)self lcExperiments];

  if (!v6)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRILimitedCarryProfileManager.m", 266, @"Invalid parameter not satisfying: %@", @"self.lcExperiments != nil" object file lineNumber description];
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F28DB0];
  $A5A652246548B43F8BC05201A1C72A70 v8 = [(TRILimitedCarryProfileManager *)self lcExperiments];
  id v19 = 0;
  id v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v19];
  id v10 = v19;

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    v12 = [WeakRetained keyValueStore];

    if (v12)
    {
      [v12 setBlob:v9 forKey:@"com.apple.internal.trial.limitedcarry.db" usingTransaction:0];
      BOOL v13 = 1;
    }
    else
    {
      v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Setting persisted Limited Carry profile information failed, key-value store was nil", buf, 2u);
      }

      v12 = 0;
      BOOL v13 = 0;
    }
  }
  else
  {
    if (!a3)
    {
      BOOL v13 = 0;
      goto LABEL_12;
    }
    id v14 = v10;
    BOOL v13 = 0;
    v12 = *a3;
    *a3 = v14;
  }

LABEL_12:
  return v13;
}

- (id)_getStoredLimitedCarryExperimentsWithError:(id *)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v5 = [WeakRetained keyValueStore];

  if (!v5)
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Getting persisted Limited Carry profile information failed, key-value store was nil", buf, 2u);
    }
    goto LABEL_10;
  }
  uint64_t v6 = [v5 blobForKey:@"com.apple.internal.trial.limitedcarry.db" usingTransaction:0];
  if (!v6)
  {
    if (a3)
    {
      id v15 = *a3;
      *a3 = 0;
    }
    uint64_t v7 = 0;
LABEL_10:
    id v11 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  $A5A652246548B43F8BC05201A1C72A70 v8 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  id v10 = [v8 setWithArray:v9];

  id v17 = 0;
  id v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v10 fromData:v7 error:&v17];
  id v12 = v17;
  id v13 = v17;
  if (v11)
  {
    id v14 = v11;
  }
  else if (a3)
  {
    objc_storeStrong(a3, v12);
  }

LABEL_14:
  return v11;
}

- (void)setLcExperiments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lcExperiments, 0);
  objc_storeStrong((id *)&self->_txn, 0);
  objc_storeStrong((id *)&self->_checkForUpdates, 0);
  objc_storeStrong((id *)&self->_profileProcessingQueue, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_taskQueue);
}

@end