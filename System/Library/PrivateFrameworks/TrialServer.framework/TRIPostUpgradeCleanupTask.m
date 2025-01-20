@interface TRIPostUpgradeCleanupTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)task;
- (BOOL)_activeBMLTIsCompatible:(id)a3 upgradeNCVs:(id)a4 downloadNCVs:(id)a5;
- (BOOL)_activeRolloutIsCompatible:(id)a3 upgradeNCVs:(id)a4 downloadNCVs:(id)a5;
- (BOOL)_migrateProtobufFactorPacksToFlatbuffersUsingPaths:(id)a3;
- (BOOL)_migrateToGlobalAssetStoreIfNeededUsingPaths:(id)a3;
- (BOOL)_migrateTreatmentsFolderIfNeededUsingContext:(id)a3;
- (BOOL)_removePromotionsUsingPaths:(id)a3;
- (BOOL)_saveProtoToFlatbufferFormatWithPaths:(id)a3 namespaceUrl:(id)a4;
- (BOOL)_validateBMLTNamespaceNCVs:(id)a3 downloadNCVs:(id)a4 context:(id)a5;
- (BOOL)_validateDynamicNamespaceRolloutsWithDatabase:(id)a3 usingPaths:(id)a4;
- (BOOL)_validateExperimentDescriptorsWithNamespaceCompatibilityVersions:(id)a3 database:(id)a4;
- (BOOL)_validateRolloutDescriptorsWithNamespaceCompatibilityVersions:(id)a3 usingPaths:(id)a4;
- (BOOL)_validateRolloutNamespaceNCVs:(id)a3 downloadNCVs:(id)a4 context:(id)a5;
- (TRIPostUpgradeCleanupTask)initWithCoder:(id)a3;
- (id)_asPersistedTask;
- (id)_nextTasksForRunStatus:(int)a3;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (int)taskType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIPostUpgradeCleanupTask

- (int)taskType
{
  return 14;
}

+ (id)task
{
  v2 = objc_opt_new();
  return v2;
}

- (id)_nextTasksForRunStatus:(int)a3
{
  v4 = objc_opt_new();
  v5 = [(NSMutableSet *)self->_invalidExperimentDeployments allObjects];
  v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_6);
  [v4 addObjectsFromArray:v6];

  v7 = [(NSMutableSet *)self->_invalidBMLTDeployments allObjects];
  v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_27);
  [v4 addObjectsFromArray:v8];

  return v4;
}

id __52__TRIPostUpgradeCleanupTask__nextTasksForRunStatus___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 experimentId];
  uint64_t v4 = [v2 deploymentId];

  v5 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v3 deploymentId:v4 failOnUnrecognizedExperiment:1 triggerEvent:5 taskAttribution:0];

  return v5;
}

TRIDeactivateBMLTDeploymentTask *__52__TRIPostUpgradeCleanupTask__nextTasksForRunStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:a2 triggerEvent:6];
}

- (BOOL)_validateRolloutDescriptorsWithNamespaceCompatibilityVersions:(id)a3 usingPaths:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = (void *)MEMORY[0x1E4FB01A0];
  v6 = [v4 namespaceDescriptorsRolloutDir];
  v7 = [v5 descriptorsForDirectory:v6 filterBlock:0];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v34)
  {
    uint64_t v9 = *(void *)v36;
    int v10 = 1;
    v11 = "TrialXP";
    *(void *)&long long v8 = 138543362;
    long long v31 = v8;
    uint64_t v32 = *(void *)v36;
    while (1)
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        v13 = v11;
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E4FB01A0];
        v16 = objc_msgSend(v14, "namespaceName", v31);
        v17 = [v4 namespaceDescriptorsDefaultDir];
        v18 = [v15 loadWithNamespaceName:v16 fromDirectory:v17];

        v11 = v13;
        if ((_os_feature_enabled_impl() & 1) == 0)
        {
          v19 = [[TRIClientTreatmentStorage alloc] initWithPaths:v4];
          v20 = [v14 namespaceName];
          v21 = [v18 upgradeNCVs];
          v10 &= [(TRIClientTreatmentStorage *)v19 removeTreatmentFromLayer:2 withNamespaceName:v20 upgradeNCVs:v21];

          v11 = v13;
        }
        if (_os_feature_enabled_impl())
        {
          v22 = [[TRIFBClientTreatmentStorage alloc] initWithPaths:v4];
          v23 = [v14 namespaceName];
          v24 = [v18 upgradeNCVs];
          int v25 = [(TRIFBClientTreatmentStorage *)v22 removeTreatmentFromLayer:2 withNamespaceName:v23 upgradeNCVs:v24];

          v11 = v13;
          int v26 = _os_feature_enabled_impl();
          if ((v25 & 1) == 0)
          {
            v27 = TRILogCategory_Server();
            v28 = v27;
            if (v26)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v29 = [v14 namespaceName];
                *(_DWORD *)buf = v31;
                v40 = v29;
                _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "flatbuffer storage removal of treatment did not succeed for namespace:%{public}@", buf, 0xCu);
                goto LABEL_15;
              }
            }
            else if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              v29 = [v14 namespaceName];
              *(_DWORD *)buf = v31;
              v40 = v29;
              _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_INFO, "flatbuffer storage removal of treatment did not succeed for namespace:%{public}@", buf, 0xCu);
LABEL_15:
            }
            v11 = v13;
          }
          if (v26) {
            int v10 = v25;
          }

          uint64_t v9 = v32;
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (!v34) {
        goto LABEL_24;
      }
    }
  }
  LOBYTE(v10) = 1;
LABEL_24:

  return v10 & 1;
}

- (BOOL)_validateExperimentDescriptorsWithNamespaceCompatibilityVersions:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = (NSMutableSet *)objc_opt_new();
  invalidExperimentDeployments = self->_invalidExperimentDeployments;
  self->_invalidExperimentDeployments = v8;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__TRIPostUpgradeCleanupTask__validateExperimentDescriptorsWithNamespaceCompatibilityVersions_database___block_invoke;
  v12[3] = &unk_1E6BB9310;
  id v13 = v6;
  v14 = self;
  id v10 = v6;
  LOBYTE(v6) = [v7 enumerateExperimentRecordsWithBlock:v12];

  return (char)v6;
}

void __103__TRIPostUpgradeCleanupTask__validateExperimentDescriptorsWithNamespaceCompatibilityVersions_database___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [v3 namespaces];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v23;
    *(void *)&long long v6 = 138543362;
    long long v21 = v6;
    unint64_t v9 = 0x1EA8D5000uLL;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = *(void **)(a1 + 32);
        id v13 = objc_msgSend(v11, "name", v21);
        v14 = [v12 objectForKeyedSubscript:v13];

        if (v14)
        {
          if (![v3 deploymentEnvironment])
          {
            int v15 = [v11 compatibilityVersion];
            if (v15 != [v14 unsignedIntValue]) {
              goto LABEL_13;
            }
          }
        }
        else
        {
          v16 = TRILogCategory_Server();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v19 = [v11 name];
            v20 = TRILoggedNamespaceName(v19);
            *(_DWORD *)buf = v21;
            v27 = v20;
            _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "unknown system namespace compatibility version for namespace %{public}@", buf, 0xCu);

            unint64_t v9 = 0x1EA8D5000;
          }

          if (![v3 deploymentEnvironment])
          {
LABEL_13:
            v17 = *(void **)(*(void *)(a1 + 40) + *(int *)(v9 + 1116));
            v18 = [v3 experimentDeployment];
            [v17 addObject:v18];
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }
}

- (BOOL)_validateDynamicNamespaceRolloutsWithDatabase:(id)a3 usingPaths:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__TRIPostUpgradeCleanupTask__validateDynamicNamespaceRolloutsWithDatabase_usingPaths___block_invoke;
  v10[3] = &unk_1E6BB9A08;
  id v7 = v6;
  id v11 = v7;
  v12 = &v13;
  if ([v5 enumerateDynamicNamespaceRecordsWithBlock:v10]) {
    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  }
  else {
    BOOL v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __86__TRIPostUpgradeCleanupTask__validateDynamicNamespaceRolloutsWithDatabase_usingPaths___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 appContainer];
  id v6 = [v4 pathsForContainer:v5 asClientProcess:0];

  if (v6)
  {
    int v7 = _os_feature_enabled_impl();
    if ((v7 & 1) == 0)
    {
      BOOL v8 = [[TRIClientTreatmentStorage alloc] initWithPaths:v6];
      unint64_t v9 = [v3 name];
      BOOL v10 = [(TRIClientTreatmentStorage *)v8 removeTreatmentFromLayer:2 withNamespaceName:v9 upgradeNCVs:0];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v11 + 24)) {
        BOOL v12 = v10;
      }
      else {
        BOOL v12 = 0;
      }
      *(unsigned char *)(v11 + 24) = v12;
    }
    if (!_os_feature_enabled_impl()) {
      goto LABEL_22;
    }
    uint64_t v13 = [[TRIFBClientTreatmentStorage alloc] initWithPaths:*(void *)(a1 + 32)];
    v14 = [v3 name];
    BOOL v15 = [(TRIFBClientTreatmentStorage *)v13 removeTreatmentFromLayer:2 withNamespaceName:v14 upgradeNCVs:0];

    if (v15)
    {
      if (!v7) {
        goto LABEL_21;
      }
    }
    else
    {
      v19 = TRILogCategory_Server();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (!v7)
      {
        if (v20)
        {
          v28 = [v3 name];
          int v29 = 138543362;
          v30 = v28;
          _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "flatbuffer storage removal of treatment did not succeed for namespace:%{public}@", (uint8_t *)&v29, 0xCu);
        }
        goto LABEL_21;
      }
      if (v20)
      {
        v27 = [v3 name];
        int v29 = 138543362;
        v30 = v27;
        _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "flatbuffer storage removal of treatment did not succeed for namespace:%{public}@", (uint8_t *)&v29, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;
LABEL_21:

LABEL_22:
    char v16 = [objc_alloc(MEMORY[0x1E4FB01E0]) initWithPaths:v6];
    long long v21 = [v3 name];
    long long v22 = [v16 statusForNamespaceWithName:v21];

    if (v16 && v22)
    {
      long long v23 = (void *)[v22 copyWithReplacementLastFetchAttempt:0];

      long long v22 = (void *)[v23 copyWithReplacementLastFetchWasSuccess:0];
      char v24 = [v16 saveStatus:v22];
      uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v25 + 24)) {
        char v26 = v24;
      }
      else {
        char v26 = 0;
      }
      *(unsigned char *)(v25 + 24) = v26;
    }

    goto LABEL_29;
  }
  char v16 = TRILogCategory_Server();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v3 appContainer];
    v18 = [v17 identifier];
    int v29 = 138543362;
    v30 = v18;
    _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Skipping validation of rollout content in missing app container: %{public}@", (uint8_t *)&v29, 0xCu);
  }
LABEL_29:
}

- (BOOL)_validateRolloutNamespaceNCVs:(id)a3 downloadNCVs:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v11 = [v10 rolloutDatabase];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__TRIPostUpgradeCleanupTask__validateRolloutNamespaceNCVs_downloadNCVs_context___block_invoke;
  v16[3] = &unk_1E6BB7F20;
  id v12 = v10;
  id v17 = v12;
  v18 = self;
  id v13 = v8;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  long long v21 = &v22;
  [v11 writeTransactionWithFailableBlock:v16];

  LOBYTE(v8) = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);

  return (char)v8;
}

uint64_t __80__TRIPostUpgradeCleanupTask__validateRolloutNamespaceNCVs_downloadNCVs_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v5 = objc_opt_new();
  id v6 = [*(id *)(a1 + 32) rolloutDatabase];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __80__TRIPostUpgradeCleanupTask__validateRolloutNamespaceNCVs_downloadNCVs_context___block_invoke_2;
  v40[3] = &unk_1E6BB8C28;
  int v7 = *(void **)(a1 + 48);
  v40[4] = *(void *)(a1 + 40);
  id v41 = v7;
  id v42 = *(id *)(a1 + 56);
  id v8 = (id)v5;
  id v43 = v8;
  uint64_t v34 = v3;
  int v9 = [v6 enumerateActiveRecordsWithVisibility:3 usingTransaction:v3 block:v40];

  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  if (v9)
  {
    int v29 = v9;
    id v30 = v8;
    uint64_t v31 = v4;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v8;
    uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v35)
    {
      uint64_t v33 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v37 != v33) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v13 = TRILogCategory_Server();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [v12 deployment];
            BOOL v15 = [v14 shortDesc];
            *(_DWORD *)buf = 138543362;
            v45 = v15;
            _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Post-upgrade task deactivated rollout %{public}@ since it's incompatible with existing NCVs", buf, 0xCu);
          }
          char v16 = [*(id *)(a1 + 32) rolloutDatabase];
          id v17 = [v12 deployment];
          char v18 = [v16 deactivateDeployment:v17 usingTransaction:v34];
          uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
          if (*(unsigned char *)(v19 + 24)) {
            char v20 = v18;
          }
          else {
            char v20 = 0;
          }
          *(unsigned char *)(v19 + 24) = v20;

          uint64_t v5 = [v12 deployment];
          long long v21 = [(id)v5 rolloutId];
          uint64_t v22 = [v12 rampId];
          long long v23 = [v12 deployment];
          uint64_t v24 = [v23 deploymentId];
          char v25 = [v12 activeFactorPackSetId];
          LOBYTE(v28) = 0;
          +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:4 forRollout:v21 ramp:v22 deployment:v24 fps:v25 namespaces:0 telemetryMetric:0 rolloutRecord:v12 isBecomingObsolete:v28 context:*(void *)(a1 + 32)];
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v35);
    }

    id v8 = v30;
    id v4 = v31;
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
    int v9 = v29;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v5 = *v10;
  }

  if (v9)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      char v26 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    }
    else {
      char v26 = v10;
    }
    uint64_t v5 = *v26;
  }

  return v5;
}

void __80__TRIPostUpgradeCleanupTask__validateRolloutNamespaceNCVs_downloadNCVs_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_activeRolloutIsCompatible:upgradeNCVs:downloadNCVs:") & 1) == 0) {
    [*(id *)(a1 + 56) addObject:v3];
  }
}

- (BOOL)_activeRolloutIsCompatible:(id)a3 upgradeNCVs:(id)a4 downloadNCVs:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v37 = a4;
  id v36 = a5;
  uint64_t v32 = v7;
  id v8 = [v7 artifact];
  uint64_t v31 = [v8 rollout];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [v31 selectedNamespaceArray];
  uint64_t v38 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v38)
  {
    char v34 = 0;
    uint64_t v35 = *(void *)v54;
    char v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v54 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        context = (void *)MEMORY[0x1E016E7F0]();
        id v12 = [v11 name];
        id v13 = [v37 objectForKey:v12];

        id v14 = [v11 name];
        BOOL v15 = [v36 objectForKey:v14];

        uint64_t v49 = 0;
        v50 = &v49;
        uint64_t v51 = 0x2020000000;
        char v52 = 0;
        uint64_t v45 = 0;
        v46 = &v45;
        uint64_t v47 = 0x2020000000;
        char v48 = 0;
        char v16 = [v11 compatibilityVersionArray];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __81__TRIPostUpgradeCleanupTask__activeRolloutIsCompatible_upgradeNCVs_downloadNCVs___block_invoke;
        v40[3] = &unk_1E6BB9A30;
        id v17 = v15;
        id v41 = v17;
        id v43 = &v49;
        id v18 = v13;
        id v42 = v18;
        v44 = &v45;
        [v16 enumerateValuesWithBlock:v40];

        if (!*((unsigned char *)v50 + 24))
        {
          uint64_t v19 = TRILogCategory_Server();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            char v20 = [v11 name];
            long long v21 = [v32 deployment];
            uint64_t v22 = [v21 shortDesc];
            int v23 = [v17 unsignedIntValue];
            uint64_t v24 = [v11 compatibilityVersionArray];
            *(_DWORD *)buf = 138544130;
            v58 = v20;
            __int16 v59 = 2114;
            v60 = v22;
            __int16 v61 = 1024;
            *(_DWORD *)v62 = v23;
            *(_WORD *)&v62[4] = 2114;
            *(void *)&v62[6] = v24;
            _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "Namespace %{public}@ for rollout %{public}@ is no longer download compatible. Expected NCV: %u Actual: %{public}@", buf, 0x26u);
          }
          char v9 = 0;
        }
        if (*((unsigned char *)v46 + 24))
        {
          char v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            char v26 = [v11 name];
            v27 = [v32 deployment];
            uint64_t v28 = [v27 shortDesc];
            int v29 = [v11 compatibilityVersionArray];
            *(_DWORD *)buf = 138544130;
            v58 = v26;
            __int16 v59 = 2114;
            v60 = v28;
            __int16 v61 = 2112;
            *(void *)v62 = v18;
            *(_WORD *)&v62[8] = 2114;
            *(void *)&v62[10] = v29;
            _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Namespace %{public}@ for rollout %{public}@ is upgrade compatible. Upgrade NCVs: %@ Namespace NCVs: %{public}@", buf, 0x2Au);
          }
          char v34 = 1;
        }

        _Block_object_dispose(&v45, 8);
        _Block_object_dispose(&v49, 8);
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v38);
  }
  else
  {
    char v34 = 0;
    char v9 = 1;
  }

  return (v9 | v34) & 1;
}

void __81__TRIPostUpgradeCleanupTask__activeRolloutIsCompatible_upgradeNCVs_downloadNCVs___block_invoke(void *a1, uint64_t a2)
{
  id v4 = (void *)a1[4];
  if (v4 && [v4 unsignedIntValue] == a2) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  uint64_t v5 = (void *)a1[5];
  if (v5)
  {
    id v6 = [NSNumber numberWithInt:a2];
    int v7 = [v5 containsObject:v6];

    if (v7) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
  }
}

- (BOOL)_validateBMLTNamespaceNCVs:(id)a3 downloadNCVs:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (NSMutableSet *)objc_opt_new();
  invalidBMLTDeployments = self->_invalidBMLTDeployments;
  self->_invalidBMLTDeployments = v11;

  id v13 = [v10 bmltDatabase];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__TRIPostUpgradeCleanupTask__validateBMLTNamespaceNCVs_downloadNCVs_context___block_invoke;
  v17[3] = &unk_1E6BB9A58;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v14 = v9;
  id v15 = v8;
  LOBYTE(v9) = [v13 enumerateActiveTasksWithBlock:v17];

  return (char)v9;
}

void __77__TRIPostUpgradeCleanupTask__validateBMLTNamespaceNCVs_downloadNCVs_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) _activeBMLTIsCompatible:v3 upgradeNCVs:*(void *)(a1 + 40) downloadNCVs:*(void *)(a1 + 48)] & 1) == 0)
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [v3 bmltDeployment];
      id v6 = [v5 shortDesc];
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Post-upgrade task deactivated BMLT %{public}@ since it's incompatible with existing NCVs", (uint8_t *)&v9, 0xCu);
    }
    int v7 = *(void **)(*(void *)(a1 + 32) + 32);
    id v8 = [v3 bmltDeployment];
    [v7 addObject:v8];
  }
}

- (BOOL)_activeBMLTIsCompatible:(id)a3 upgradeNCVs:(id)a4 downloadNCVs:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 artifact];
  uint64_t v11 = [v10 backgroundTask];

  if ([v11 hasSelectedNamespace])
  {
    id v12 = [v11 selectedNamespace];
    id v13 = [v12 name];
    id v14 = [v8 objectForKey:v13];

    id v15 = [v11 selectedNamespace];
    char v16 = [v15 name];
    id v17 = [v9 objectForKey:v16];

    uint64_t v51 = 0;
    char v52 = &v51;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    uint64_t v47 = 0;
    char v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    id v18 = [v11 selectedNamespace];
    id v19 = [v18 compatibilityVersionArray];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __78__TRIPostUpgradeCleanupTask__activeBMLTIsCompatible_upgradeNCVs_downloadNCVs___block_invoke;
    v42[3] = &unk_1E6BB9A30;
    id v20 = v17;
    id v43 = v20;
    uint64_t v45 = &v51;
    id v41 = v14;
    id v44 = v41;
    v46 = &v47;
    [v19 enumerateValuesWithBlock:v42];

    int v40 = *((unsigned __int8 *)v52 + 24);
    if (!*((unsigned char *)v52 + 24))
    {
      long long v21 = TRILogCategory_Server();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v11 selectedNamespace];
        id v36 = [v22 name];
        uint64_t v38 = [v7 bmltDeployment];
        char v34 = [v38 shortDesc];
        int v23 = [v20 unsignedIntValue];
        uint64_t v24 = [v11 selectedNamespace];
        char v25 = [v24 compatibilityVersionArray];
        *(_DWORD *)buf = 138544130;
        long long v56 = v36;
        __int16 v57 = 2114;
        v58 = v34;
        __int16 v59 = 1024;
        *(_DWORD *)v60 = v23;
        *(_WORD *)&v60[4] = 2114;
        *(void *)&v60[6] = v25;
        _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "Namespace %{public}@ for BMLT %{public}@ is no longer download compatible. Expected NCV: %u Actual: %{public}@", buf, 0x26u);
      }
    }
    int v26 = *((unsigned __int8 *)v48 + 24);
    if (*((unsigned char *)v48 + 24))
    {
      v27 = TRILogCategory_Server();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = v20;
        long long v39 = [v11 selectedNamespace];
        id v37 = [v39 name];
        uint64_t v28 = [v7 bmltDeployment];
        int v29 = [v28 shortDesc];
        id v30 = [v11 selectedNamespace];
        uint64_t v31 = [v30 compatibilityVersionArray];
        *(_DWORD *)buf = 138544130;
        long long v56 = v37;
        __int16 v57 = 2114;
        v58 = v29;
        __int16 v59 = 2112;
        *(void *)v60 = v41;
        *(_WORD *)&v60[8] = 2114;
        *(void *)&v60[10] = v31;
        _os_log_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEFAULT, "Namespace %{public}@ for BMLT %{public}@ is upgrade compatible. Upgrade NCVs: %@ Namespace NCVs: %{public}@", buf, 0x2Au);

        id v20 = v35;
      }
    }
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);

    BOOL v32 = (v26 | v40) != 0;
  }
  else
  {
    BOOL v32 = 1;
  }

  return v32;
}

void __78__TRIPostUpgradeCleanupTask__activeBMLTIsCompatible_upgradeNCVs_downloadNCVs___block_invoke(void *a1, uint64_t a2)
{
  id v4 = (void *)a1[4];
  if (v4 && [v4 unsignedIntValue] == a2) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  uint64_t v5 = (void *)a1[5];
  if (v5)
  {
    id v6 = [NSNumber numberWithInt:a2];
    int v7 = [v5 containsObject:v6];

    if (v7) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
  }
}

- (BOOL)_removePromotionsUsingPaths:(id)a3
{
  id v3 = a3;
  id v4 = [[TRINamespaceResolverStorage alloc] initWithPaths:v3];

  LOBYTE(v3) = [(TRINamespaceResolverStorage *)v4 removeUnneededPromotionsWithRemovedCount:0 removeAll:1];
  return (char)v3;
}

- (BOOL)_migrateToGlobalAssetStoreIfNeededUsingPaths:(id)a3
{
  id v3 = a3;
  id v4 = [[TRIRemoteAssetStoreOperator alloc] initWithPaths:v3];

  LOBYTE(v3) = [(TRIRemoteAssetStoreOperator *)v4 migrateToGlobalAssetStoreIfNeeded];
  return (char)v3;
}

- (BOOL)_migrateTreatmentsFolderIfNeededUsingContext:(id)a3
{
  id v3 = a3;
  id v4 = [TRIFactorPackSetStorage alloc];
  uint64_t v5 = [v3 paths];
  id v6 = [(TRIFactorPackSetStorage *)v4 initWithPaths:v5];

  LOBYTE(v5) = [(TRIFactorPackSetStorage *)v6 migrateEligibleFactorPacksToGlobalWithServerContext:v3];
  return (char)v5;
}

- (BOOL)_saveProtoToFlatbufferFormatWithPaths:(id)a3 namespaceUrl:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v5 = a4;
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 path];
    *(_DWORD *)buf = 138477827;
    char v52 = v7;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Starting rollout migration for namespace: %{private}@", buf, 0xCu);
  }
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v38 = [[TRIFactorPackStorage alloc] initWithPaths:v37];
  id v36 = [[TRIFBFactorPackStorage alloc] initWithPaths:v37];
  uint64_t v9 = *MEMORY[0x1E4F1C628];
  uint64_t v50 = *MEMORY[0x1E4F1C628];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  id v41 = v8;
  id v35 = v5;
  uint64_t v11 = [v8 enumeratorAtURL:v5 includingPropertiesForKeys:v10 options:0 errorHandler:0];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v13)
  {
    LOBYTE(v40) = 1;
    goto LABEL_25;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v46;
  int v40 = 1;
  do
  {
    uint64_t v16 = 0;
    uint64_t v42 = v14;
    do
    {
      if (*(void *)v46 != v15) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v45 + 1) + 8 * v16);
      id v18 = (void *)MEMORY[0x1E016E7F0]();
      id v43 = 0;
      id v44 = 0;
      char v19 = [v17 getResourceValue:&v44 forKey:v9 error:&v43];
      id v20 = v44;
      id v21 = v43;
      if ((v19 & 1) == 0)
      {
        uint64_t v28 = TRILogCategory_Server();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          BOOL v32 = [v21 localizedDescription];
          *(_DWORD *)buf = 138412290;
          char v52 = v32;
          _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "Error while iterating through rollout directory: %@", buf, 0xCu);
        }
        goto LABEL_18;
      }
      if ([v20 BOOLValue]) {
        goto LABEL_19;
      }
      uint64_t v22 = v15;
      id v23 = v12;
      uint64_t v24 = v9;
      char v25 = [v17 path];
      int v26 = [v25 hasSuffix:@"factorPack.pb"];

      if (v26)
      {
        v27 = [v17 path];
        uint64_t v28 = [v27 stringByDeletingLastPathComponent];

        int v29 = [v28 stringByAppendingPathComponent:@"factorPack.fb"];
        if (([v41 fileExistsAtPath:v29] & 1) == 0)
        {
          id v30 = [(TRIFactorPackStorage *)v38 loadFactorPackWithDir:v28];
          uint64_t v31 = v30;
          if (v30)
          {
            long long v39 = [v30 downloadedFactorsWithPaths:v37];
            v40 &= [(TRIFBFactorPackStorage *)v36 saveFactorLevelsForFactorPack:v31 populatingAssetsForFactorNames:v39 aliasToUnaliasMap:0 factorLevelsByNamePath:0 factorLevelsByIdPath:0];
          }
        }

        uint64_t v9 = v24;
        id v12 = v23;
        uint64_t v15 = v22;
        uint64_t v14 = v42;
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v9 = v24;
      id v12 = v23;
      uint64_t v15 = v22;
      uint64_t v14 = v42;
LABEL_19:

      ++v16;
    }
    while (v14 != v16);
    uint64_t v33 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
    uint64_t v14 = v33;
  }
  while (v33);
LABEL_25:

  return v40 & 1;
}

- (BOOL)_migrateProtobufFactorPacksToFlatbuffersUsingPaths:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_INFO, "Starting flatbuffer migration for rollouts", buf, 2u);
  }

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  int v7 = [v3 treatmentsDir];
  id v8 = [v6 fileURLWithPath:v7];
  LOBYTE(v9) = 1;
  id v10 = [v5 enumeratorAtURL:v8 includingPropertiesForKeys:0 options:1 errorHandler:0];

  uint64_t v11 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v12 = [v10 nextObject];
  if (v12)
  {
    uint64_t v14 = (void *)v12;
    int v9 = 1;
    *(void *)&long long v13 = 134217984;
    long long v23 = v13;
    uint64_t v15 = v3;
    do
    {
      uint64_t v16 = objc_msgSend(v14, "lastPathComponent", v23);
      if (v16)
      {
        id v17 = (void *)v16;
        uint64_t v25 = -1;
        if ([MEMORY[0x1E4FB0198] convertFromString:v16 usingBase:10 toI64:&v25])
        {
          if ((unint64_t)(v25 - 1) > 0x7FFFFFFE)
          {
            id v18 = TRILogCategory_Server();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              uint64_t v27 = v25;
              _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Skipping conversion of protobuf for unrecognized id:%lld", buf, 0xCu);
            }
          }
          else
          {
            id v18 = TRINamespace_NamespaceId_EnumDescriptor();
            uint64_t v19 = [v18 textFormatNameForValue:v25];

            id v17 = (void *)v19;
            uint64_t v15 = v3;
          }
        }
        if (([v17 isEqualToString:@"TRIAL_SYSTEM"] & 1) == 0) {
          v9 &= [(TRIPostUpgradeCleanupTask *)self _saveProtoToFlatbufferFormatWithPaths:v15 namespaceUrl:v14];
        }
      }
      uint64_t v11 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v14 = [v10 nextObject];
    }
    while (v14);
  }
  else
  {
    uint64_t v15 = v3;
  }
  id v20 = TRILogCategory_Server();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = "failure";
    if (v9) {
      id v21 = "success";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = (uint64_t)v21;
    _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "Flatbuffer migration for rollouts completed with status %s", buf, 0xCu);
  }

  return v9 & 1;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  long long v39 = self;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB01A0];
  id v40 = v4;
  id v6 = [v4 paths];
  int v7 = [v6 namespaceDescriptorsDefaultDir];
  id v8 = [v5 descriptorsForDirectory:v7 filterBlock:0];

  int v9 = objc_opt_new();
  id v10 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v16, "downloadNCV", v39));
        id v18 = [v16 namespaceName];
        [v9 setObject:v17 forKeyedSubscript:v18];

        uint64_t v19 = [v16 upgradeNCVs];
        id v20 = [v16 namespaceName];
        [v10 setObject:v19 forKeyedSubscript:v20];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v13);
  }

  id v21 = [v40 paths];
  BOOL v22 = [(TRIPostUpgradeCleanupTask *)v39 _validateRolloutDescriptorsWithNamespaceCompatibilityVersions:v9 usingPaths:v21];

  long long v23 = [v40 experimentDatabase];
  int v24 = v22 & [(TRIPostUpgradeCleanupTask *)v39 _validateExperimentDescriptorsWithNamespaceCompatibilityVersions:v9 database:v23];

  uint64_t v25 = [v40 namespaceDatabase];
  uint64_t v26 = [v40 paths];
  BOOL v27 = [(TRIPostUpgradeCleanupTask *)v39 _validateDynamicNamespaceRolloutsWithDatabase:v25 usingPaths:v26];

  int v28 = v24 & v27 & [(TRIPostUpgradeCleanupTask *)v39 _validateRolloutNamespaceNCVs:v10 downloadNCVs:v9 context:v40];
  int v29 = [v40 paths];
  LODWORD(v26) = [(TRIPostUpgradeCleanupTask *)v39 _removePromotionsUsingPaths:v29];

  int v30 = v28 & v26 & [(TRIPostUpgradeCleanupTask *)v39 _validateBMLTNamespaceNCVs:v10 downloadNCVs:v9 context:v40];
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    uint64_t v31 = [v40 paths];
    v30 &= [(TRIPostUpgradeCleanupTask *)v39 _migrateProtobufFactorPacksToFlatbuffersUsingPaths:v31];
  }
  BOOL v32 = [TRIAssetStore alloc];
  uint64_t v33 = [v40 paths];
  char v34 = [(TRIAssetStore *)v32 initWithPaths:v33];

  [(TRIAssetStore *)v34 fixFileProtectionForAssetStoreFiles];
  if (v30) {
    uint64_t v35 = 2;
  }
  else {
    uint64_t v35 = 3;
  }
  id v36 = -[TRIPostUpgradeCleanupTask _nextTasksForRunStatus:](v39, "_nextTasksForRunStatus:", v35, v39);
  id v37 = +[TRITaskRunResult resultWithRunStatus:v35 reportResultToServer:1 nextTasks:v36 earliestRetryDate:0];

  return v37;
}

- (id)_asPersistedTask
{
  id v2 = objc_opt_new();
  return v2;
}

- (id)serialize
{
  id v4 = [(TRIPostUpgradeCleanupTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIPostUpgradeCleanupTask.m", 479, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  id v3 = +[TRIPBMessage parseFromData:a3 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = objc_opt_new();
  }
  else
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIPostUpgradeCleanupTask: %{public}@", buf, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPostUpgradeCleanupTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIPostUpgradeCleanupTask;
  id v5 = [(TRIPostUpgradeCleanupTask *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      int v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIPostUpgradeCleanupTask.m", 497, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIPostUpgradeCleanupTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidBMLTDeployments, 0);
  objc_storeStrong((id *)&self->_invalidExperimentDeployments, 0);
}

@end