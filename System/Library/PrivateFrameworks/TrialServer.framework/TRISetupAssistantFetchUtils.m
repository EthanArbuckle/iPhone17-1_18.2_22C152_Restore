@interface TRISetupAssistantFetchUtils
+ (BOOL)removeNamespaceNamesWithRolloutForServerContext:(id)a3 namespaceNames:(id)a4;
+ (BOOL)setValueInKeyValueStore:(id)a3 key:(id)a4 value:(id)a5 error:(id *)a6;
+ (BOOL)stopSetupAssistantFetchWithServerContext:(id)a3 namespaceNames:(id)a4 error:(id *)a5;
+ (id)getIncompatibleNamespaceNamesForTriClientRollout:(id)a3 namespaceDescriptorProvider:(id)a4;
+ (id)getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths:(id)a3;
+ (id)getValueInKeyValueStore:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext:(id)a3;
@end

@implementation TRISetupAssistantFetchUtils

+ (BOOL)stopSetupAssistantFetchWithServerContext:(id)a3 namespaceNames:(id)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v9];
  }
  else
  {
    v20 = [v8 paths];
    v11 = [a1 getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths:v20];

    if (!v11 || ![v11 count])
    {
      v10 = TRILogCategory_Server();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch is not needed, no descriptors found with enableFetchDuringSetupAssistant flag enabled", (uint8_t *)&v24, 2u);
      }
      goto LABEL_22;
    }
    v10 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v11];
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v10];
  if (([a1 removeNamespaceNamesWithRolloutForServerContext:v8 namespaceNames:v11] & 1) == 0)
  {
    v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "The rollout database query failed.", (uint8_t *)&v24, 2u);
    }

    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"Unable to retrieve records for active rollouts";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v18 = (void *)[v16 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v17];

    if (a5) {
      *a5 = v18;
    }

    goto LABEL_13;
  }
  if (![v11 count])
  {
    v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v10 allObjects];
      int v24 = 138543362;
      v25 = v22;
      _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch is not needed, ncv-compatible rollout v2 are present for namespaces names: %{public}@", (uint8_t *)&v24, 0xCu);
    }
LABEL_22:
    BOOL v19 = 1;
    goto LABEL_23;
  }
  [v10 minusSet:v11];
  v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v11 allObjects];
    v14 = [v10 allObjects];
    int v24 = 138412546;
    v25 = v13;
    __int16 v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch is needed, ncv-compatible rollout v2 are not present for namespace names: %@ and are present for namespace names: {public}%@", (uint8_t *)&v24, 0x16u);
  }
LABEL_13:
  BOOL v19 = 0;
LABEL_23:

  return v19;
}

+ (id)getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB01A0];
  v4 = [a3 namespaceDescriptorsDefaultDir];
  v5 = [v3 descriptorsForDirectory:v4 filterBlock:&__block_literal_global_19];

  if ([v5 count])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v7 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_35);
    id v8 = (void *)[v6 initWithArray:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __97__TRISetupAssistantFetchUtils_getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enableFetchDuringSetupAssistant];
}

uint64_t __97__TRISetupAssistantFetchUtils_getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 namespaceName];
}

+ (BOOL)removeNamespaceNamesWithRolloutForServerContext:(id)a3 namespaceNames:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 namespaceDatabase];
  id v9 = [v7 paths];
  v10 = [v9 namespaceDescriptorsDefaultDir];
  v11 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v8 defaultDescriptorDirectoryPath:v10];

  v12 = [v7 rolloutDatabase];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__TRISetupAssistantFetchUtils_removeNamespaceNamesWithRolloutForServerContext_namespaceNames___block_invoke;
  v16[3] = &unk_1E6BBC0A8;
  id v18 = v6;
  id v19 = a1;
  id v17 = v11;
  id v13 = v6;
  id v14 = v11;
  LOBYTE(v11) = [v12 enumerateActiveRecordsWithVisibility:1 usingTransaction:0 block:v16];

  return (char)v11;
}

void __94__TRISetupAssistantFetchUtils_removeNamespaceNamesWithRolloutForServerContext_namespaceNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 artifact];
  v5 = [v4 rollout];

  id v6 = [*(id *)(a1 + 48) getIncompatibleNamespaceNamesForTriClientRollout:v5 namespaceDescriptorProvider:*(void *)(a1 + 32)];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v3, "namespaces", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([*(id *)(a1 + 40) containsObject:v12]
          && ([v6 containsObject:v12] & 1) == 0)
        {
          [*(id *)(a1 + 40) removeObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

+ (id)getIncompatibleNamespaceNamesForTriClientRollout:(id)a3 namespaceDescriptorProvider:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v24 = (id)objc_opt_new();
  v25 = v5;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [v5 selectedNamespaceArray];
  uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    char v26 = 0;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E016E7F0]();
        uint64_t v12 = [v10 name];
        long long v13 = [v6 descriptorWithNamespaceName:v12];

        if (v13)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          buf[24] = 0;
          long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "compatibilityVersionArray_Count"));
          long long v15 = [v10 compatibilityVersionArray];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __108__TRISetupAssistantFetchUtils_getIncompatibleNamespaceNamesForTriClientRollout_namespaceDescriptorProvider___block_invoke;
          v30[3] = &unk_1E6BBC0D0;
          id v31 = v13;
          v33 = buf;
          id v16 = v14;
          id v32 = v16;
          [v15 enumerateValuesWithBlock:v30];

          if (*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            char v26 = 1;
          }
          else
          {
            v21 = [v10 name];
            [v24 addObject:v21];
          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          id v17 = TRILogCategory_Server();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = [v25 rolloutId];
            int v19 = [v25 deploymentId];
            v20 = [v10 name];
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            *(_WORD *)&buf[18] = 2114;
            *(void *)&buf[20] = v20;
            _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Note: Rollout %{public}@.%u involves namespace %{public}@ but it is not registered with Trial. Factor packs for this namespace shall not be downloaded.", buf, 0x1Cu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v7);
  }
  else
  {
    char v26 = 0;
  }

  if (!(([v24 count] != 0) | v26 & 1))
  {
    v22 = [v25 selectedNamespaceArray];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __108__TRISetupAssistantFetchUtils_getIncompatibleNamespaceNamesForTriClientRollout_namespaceDescriptorProvider___block_invoke_2;
    v28[3] = &unk_1E6BBC0F8;
    id v29 = v24;
    [v22 enumerateObjectsUsingBlock:v28];
  }
  return v24;
}

void __108__TRISetupAssistantFetchUtils_getIncompatibleNamespaceNamesForTriClientRollout_namespaceDescriptorProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) downloadNCV] == a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  v4 = *(void **)(a1 + 40);
  id v5 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%u", a2);
  [v4 addObject:v5];
}

void __108__TRISetupAssistantFetchUtils_getIncompatibleNamespaceNamesForTriClientRollout_namespaceDescriptorProvider___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObject:v3];
}

+ (BOOL)setValueInKeyValueStore:(id)a3 key:(id)a4 value:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v13)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"TRISetupAssistantFetchUtils.m", 177, @"Invalid parameter not satisfying: %@", @"value != nil" object file lineNumber description];
  }
  id v19 = 0;
  long long v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v19];
  id v15 = v19;
  id v16 = v15;
  if (v14)
  {
    [v11 setBlob:v14 forKey:v12 usingTransaction:0];
  }
  else if (a6)
  {
    *a6 = v15;
  }

  return v14 != 0;
}

+ (id)getValueInKeyValueStore:(id)a3 key:(id)a4 error:(id *)a5
{
  id v6 = [a3 blobForKey:a4 usingTransaction:0];
  if (v6)
  {
    id v12 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v12];
    id v8 = v12;
    uint64_t v9 = v8;
    if (v7)
    {
      id v10 = v7;
    }
    else if (a5)
    {
      *a5 = v8;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (a5) {
      *a5 = 0;
    }
  }

  return v7;
}

+ (id)registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext:(id)a3
{
  id v3 = a3;
  v4 = [TRILatencyMetricTelemetryValidator alloc];
  id v5 = [v3 rolloutDatabase];
  id v6 = [v3 paths];
  uint64_t v7 = [(TRILatencyMetricTelemetryValidator *)v4 initWithRolloutDatabase:v5 paths:v6];

  id v8 = [[TRIDownloadLatencyTaskResultTelemetryBuilder alloc] initWithTelemetryValidator:v7];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__TRISetupAssistantFetchUtils_registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext___block_invoke;
  v14[3] = &unk_1E6BBC120;
  uint64_t v9 = v8;
  id v15 = v9;
  id v10 = (void *)MEMORY[0x1E016EA80](v14);
  id v11 = [v3 taskQueue];

  [v11 registerFinalizeBlock:v10];
  id v12 = v9;

  return v12;
}

void __97__TRISetupAssistantFetchUtils_registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v11 = a2;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E016E7F0]();
  [*(id *)(a1 + 32) updateWithTask:v11 runResult:v8];
}

@end