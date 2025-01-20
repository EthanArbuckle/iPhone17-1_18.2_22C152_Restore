@interface TRIFetchOnDemandFactorsTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithAssetIndexesByTreatment:(id)a3 experimentId:(id)a4 assetIdsByFactorPack:(id)a5 rolloutFactorNames:(id)a6 rolloutDeployment:(id)a7 namespaceName:(id)a8 taskAttributing:(id)a9 notificationKey:(id)a10 capabilityModifier:(id)a11;
- ($A5A652246548B43F8BC05201A1C72A70)_saveIndexedAssetURLs:(id)a3 withTreatmentId:(id)a4 usingAssetMetadata:(id)a5 downloadOptions:(id)a6 paths:(id)a7 downloadSize:(unint64_t *)a8 error:(id *)a9;
- ($A5A652246548B43F8BC05201A1C72A70)_saveNamedAssetURLs:(id)a3 usingAssetMetadata:(id)a4 downloadOptions:(id)a5 downloadSize:(unint64_t *)a6 paths:(id)a7 error:(id *)a8;
- (BOOL)_updateFactorPacksByMergingAssets:(id)a3 context:(id)a4;
- (BOOL)isCurrentlyExecuting;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDeferred;
- (NSArray)tags;
- (NSString)description;
- (NSString)experimentId;
- (TRIFetchOnDemandFactorsTask)initWithAssetIndexesByTreatment:(id)a3 experimentId:(id)a4 assetIdsByFactorPack:(id)a5 rolloutFactorNames:(id)a6 rolloutDeployment:(id)a7 namespaceName:(id)a8 taskAttributing:(id)a9 notificationKey:(id)a10 capabilityModifier:(id)a11;
- (TRIFetchOnDemandFactorsTask)initWithCoder:(id)a3;
- (TRIRolloutDeployment)deployment;
- (TRITaskAttributing)taskAttribution;
- (id)_asPersistedTask;
- (id)_assetIdsFromKeysInDictionary:(id)a3;
- (id)_currentTaskStatus;
- (id)_fetchDiffsFromAssetDiffRecordsWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 options:(id)a7;
- (id)_fetchOptionsWithDownloadOptions:(id)a3 paths:(id)a4;
- (id)_planForFetchingAssetDiffsWithContext:(id)a3 downloadOptions:(id)a4 updatingAggregateProgress:(id)a5 nonDiffableAssetIds:(id *)a6 unlinkedMAAssetsOnDisk:(id *)a7;
- (id)_planForFetchingAssetsFromFactorPacksWithContext:(id)a3 assetDiffFetchPlan:(id)a4 requiredAssetIds:(id)a5 downloadOptions:(id)a6 updatingAggregateProgress:(id)a7;
- (id)_planForFetchingAssetsFromTreatmentRecordsWithContext:(id)a3 downloadOptions:(id)a4 updatingAggregateProgress:(id)a5;
- (id)_telemetryForFactorPackIds:(id)a3 rolloutDeployment:(id)a4 treatmentIds:(id)a5 experimentId:(id)a6 namespaceName:(id)a7 taskAttributing:(id)a8;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (unint64_t)_requiredDiskSpaceForPlan:(id)a3;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)_addDimension:(id)a3;
- (void)_addMetric:(id)a3;
- (void)_addMetricForFetchOnDemandFactorsTaskError:(int)a3;
- (void)_asyncFetchAssetsFromTreatmentRecordsWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 downloadOptions:(id)a7 group:(id)a8;
- (void)_asyncFetchCKAssetsFromAssetRecordsWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 options:(id)a7 group:(id)a8;
- (void)_asyncFetchMAAssetsFromFactorPacksWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 options:(id)a7 group:(id)a8;
- (void)_completeTaskWithStatus:(int)a3 earliestRetryDate:(id)a4 error:(id)a5 aggregateProgress:(id)a6 context:(id)a7;
- (void)_logOnDemandFactor:(id)a3 metricName:(id)a4 namespaceName:(id)a5 client:(id)a6 error:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)removeDownloadableFactorNames:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
- (void)willBeCancelledByTaskQueue:(id)a3 withContext:(id)a4;
@end

@implementation TRIFetchOnDemandFactorsTask

- (int)taskType
{
  return 17;
}

- (BOOL)isCurrentlyExecuting
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isCurrentlyExecuting);
  return v2 & 1;
}

- (TRIFetchOnDemandFactorsTask)initWithAssetIndexesByTreatment:(id)a3 experimentId:(id)a4 assetIdsByFactorPack:(id)a5 rolloutFactorNames:(id)a6 rolloutDeployment:(id)a7 namespaceName:(id)a8 taskAttributing:(id)a9 notificationKey:(id)a10 capabilityModifier:(id)a11
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id obj = a4;
  id v46 = a4;
  id v39 = a5;
  id v47 = a5;
  id v45 = a6;
  id v40 = a7;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v44 = a10;
  id v43 = a11;
  v48.receiver = self;
  v48.super_class = (Class)TRIFetchOnDemandFactorsTask;
  v21 = [(TRIFetchOnDemandFactorsTask *)&v48 init];
  v22 = v21;
  if (v21)
  {
    v42 = v17;
    objc_storeStrong((id *)&v21->_assetIndexesByTreatment, a3);
    objc_storeStrong((id *)&v22->_experimentId, obj);
    objc_storeStrong((id *)&v22->_assetIdsByFactorPack, v39);
    objc_storeStrong((id *)&v22->_rolloutFactorNames, a6);
    objc_storeStrong((id *)&v22->_deployment, v40);
    objc_storeStrong((id *)&v22->_namespaceName, a8);
    objc_storeStrong((id *)&v22->_taskAttributing, a9);
    v22->_retryCount = 0;
    objc_storeStrong((id *)&v22->_notificationKey, a10);
    objc_storeStrong((id *)&v22->_capabilityModifier, a11);
    atomic_store(0, (unsigned __int8 *)&v22->_isCurrentlyExecuting);
    v23 = [v47 allKeys];
    if ((unint64_t)[v23 count] >= 2)
    {
      v24 = TRILogCategory_Server();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v23;
        _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "On-demand factor fetch was initiated for >1 factor pack and will be excluded from telemetry. Got %{public}@", buf, 0xCu);
      }
    }
    v25 = objc_msgSend(v42, "allKeys", obj);
    uint64_t v26 = [(TRIFetchOnDemandFactorsTask *)v22 _telemetryForFactorPackIds:v23 rolloutDeployment:v18 treatmentIds:v25 experimentId:v46 namespaceName:v19 taskAttributing:v20];
    trialSystemTelemetry = v22->_trialSystemTelemetry;
    v22->_trialSystemTelemetry = (TRITrialSystemTelemetry *)v26;

    uint64_t v28 = objc_opt_new();
    uint64_t v29 = objc_opt_new();
    v30 = *(void **)(v28 + 8);
    *(void *)(v28 + 8) = v29;

    *(_DWORD *)(v28 + 16) = 0;
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v22->_rolloutFactorNames];
    v32 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v31;

    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v28];
    lock = v22->_lock;
    v22->_lock = (_PASLock *)v33;

    uint64_t v35 = objc_opt_new();
    factorNameByAssetId = v22->_factorNameByAssetId;
    v22->_factorNameByAssetId = (NSMutableDictionary *)v35;

    id v17 = v42;
  }

  return v22;
}

+ (id)taskWithAssetIndexesByTreatment:(id)a3 experimentId:(id)a4 assetIdsByFactorPack:(id)a5 rolloutFactorNames:(id)a6 rolloutDeployment:(id)a7 namespaceName:(id)a8 taskAttributing:(id)a9 notificationKey:(id)a10 capabilityModifier:(id)a11
{
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = (void *)[objc_alloc((Class)a1) initWithAssetIndexesByTreatment:v26 experimentId:v25 assetIdsByFactorPack:v24 rolloutFactorNames:v23 rolloutDeployment:v22 namespaceName:v21 taskAttributing:v20 notificationKey:v19 capabilityModifier:v18];

  return v27;
}

- (id)_telemetryForFactorPackIds:(id)a3 rolloutDeployment:(id)a4 treatmentIds:(id)a5 experimentId:(id)a6 namespaceName:(id)a7 taskAttributing:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  id v19 = objc_opt_new();
  id v20 = [v17 networkOptions];
  [v19 setFieldsForDownloadOptions:v20];

  id v21 = [v19 ensureFactorFields];
  [v21 setNamespaceName:v18];

  if ([v13 count] == 1)
  {
    id v22 = [v13 firstObject];
    id v23 = [v19 ensureFactorFields];
    [v23 setClientFactorPackId:v22];
  }
  if (v14) {
    [v19 setFieldsForRolloutDeployment:v14];
  }
  if (v16)
  {
    id v24 = [v19 ensureExperimentFields];
    [v24 setClientExperimentId:v16];
  }
  if ([v15 count] == 1)
  {
    id v25 = [v15 firstObject];
    id v26 = [v19 ensureExperimentFields];
    [v26 setClientTreatmentId:v25];
  }
  v27 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v17];
  [v19 mergeFrom:v27];

  return v19;
}

- (TRITaskAttributing)taskAttribution
{
  return self->_taskAttributing;
}

- (NSArray)tags
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_notificationKey)
  {
    v4[0] = self->_notificationKey;
    unsigned __int8 v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    unsigned __int8 v2 = 0;
  }
  return (NSArray *)v2;
}

- ($A5A652246548B43F8BC05201A1C72A70)_saveIndexedAssetURLs:(id)a3 withTreatmentId:(id)a4 usingAssetMetadata:(id)a5 downloadOptions:(id)a6 paths:(id)a7 downloadSize:(unint64_t *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = [TRIAssetStore alloc];
  id v21 = [v18 activity];
  id v22 = [(TRIAssetStore *)v20 initWithPaths:v19 monitoredActivity:v21];

  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2810000000;
  id v46 = "";
  char v47 = 1;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__18;
  v41 = __Block_byref_object_dispose__18;
  id v42 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __129__TRIFetchOnDemandFactorsTask__saveIndexedAssetURLs_withTreatmentId_usingAssetMetadata_downloadOptions_paths_downloadSize_error___block_invoke;
  v29[3] = &unk_1E6BBA8B0;
  SEL v35 = a2;
  v29[4] = self;
  id v23 = v16;
  id v30 = v23;
  id v24 = v15;
  id v31 = v24;
  id v25 = v22;
  v32 = v25;
  uint64_t v33 = &v37;
  v34 = &v43;
  v36 = a8;
  [v17 enumerateKeysAndObjectsUsingBlock:v29];
  if (a9) {
    *a9 = (id) v38[5];
  }
  v26.var0 = *((unsigned char *)v44 + 32);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v26;
}

void __129__TRIFetchOnDemandFactorsTask__saveIndexedAssetURLs_withTreatmentId_usingAssetMetadata_downloadOptions_paths_downloadSize_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = [v8 treatmentIndex];
  if (!v9)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 303, @"Expression was unexpectedly nil/false: %@", @"metadata.treatmentIndex" object file lineNumber description];
  }
  v10 = *(void **)(a1 + 40);
  v11 = [v9 treatmentId];
  LODWORD(v10) = [v10 isEqualToString:v11];

  if (v10)
  {
    v12 = *(void **)(a1 + 48);
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "index"));
    id v14 = [v12 objectForKeyedSubscript:v13];

    if (v14)
    {
      id v15 = *(void **)(a1 + 56);
      uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v16 + 40);
      char v17 = [v15 saveAssetWithIdentifier:v7 assetURL:v14 metadata:v8 error:&obj];
      objc_storeStrong((id *)(v16 + 40), obj);
      if (v17 == 1)
      {
        **(void **)(a1 + 88) += [v8 downloadSize];
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = v17;
        *a4 = 1;
      }
    }
  }
}

- ($A5A652246548B43F8BC05201A1C72A70)_saveNamedAssetURLs:(id)a3 usingAssetMetadata:(id)a4 downloadOptions:(id)a5 downloadSize:(unint64_t *)a6 paths:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = [TRIAssetStore alloc];
  id v19 = [v16 activity];
  id v20 = [(TRIAssetStore *)v18 initWithPaths:v17 monitoredActivity:v19];

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2810000000;
  uint64_t v43 = "";
  char v44 = 1;
  uint64_t v34 = 0;
  SEL v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__18;
  v38 = __Block_byref_object_dispose__18;
  id v39 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __111__TRIFetchOnDemandFactorsTask__saveNamedAssetURLs_usingAssetMetadata_downloadOptions_downloadSize_paths_error___block_invoke;
  v26[3] = &unk_1E6BBA8D8;
  id v21 = v15;
  SEL v32 = a2;
  id v27 = v21;
  uint64_t v28 = self;
  id v22 = v20;
  uint64_t v29 = v22;
  id v30 = &v34;
  id v31 = &v40;
  uint64_t v33 = a6;
  [v14 enumerateKeysAndObjectsUsingBlock:v26];
  if (a8) {
    *a8 = (id) v35[5];
  }
  v23.var0 = *((unsigned char *)v41 + 32);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v23;
}

void __111__TRIFetchOnDemandFactorsTask__saveNamedAssetURLs_usingAssetMetadata_downloadOptions_downloadSize_paths_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  v10 = [v7 objectForKeyedSubscript:v9];
  if (!v10)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 40), @"TRIFetchOnDemandFactorsTask.m", 344, @"Expression was unexpectedly nil/false: %@", @"assetMetadata[assetId]" object file lineNumber description];
  }
  v11 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v12 + 40);
  char v13 = [v11 saveAssetWithIdentifier:v9 assetURL:v8 metadata:v10 error:&obj];

  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13 == 1)
  {
    **(void **)(a1 + 80) += [v10 downloadSize];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = v13;
    *a4 = 1;
  }
}

- (BOOL)_updateFactorPacksByMergingAssets:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [TRIFactorPackStorage alloc];
  id v9 = [v7 paths];
  v10 = [(TRIFactorPackStorage *)v8 initWithPaths:v9];

  char v11 = _os_feature_enabled_impl();
  LOBYTE(v9) = _os_feature_enabled_impl();
  uint64_t v25 = 0;
  $A5A652246548B43F8BC05201A1C72A70 v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  assetIdsByFactorPack = self->_assetIdsByFactorPack;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke;
  v17[3] = &unk_1E6BBA928;
  id v13 = v6;
  id v18 = v13;
  id v14 = v10;
  id v19 = v14;
  id v20 = self;
  id v22 = &v25;
  char v23 = (char)v9;
  id v15 = v7;
  id v21 = v15;
  char v24 = v11;
  [(NSDictionary *)assetIdsByFactorPack enumerateKeysAndObjectsUsingBlock:v17];
  LOBYTE(v7) = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return (char)v7;
}

void __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = objc_opt_new();
  id v8 = [*(id *)(a1 + 32) cloudKit];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke_2;
  v33[3] = &unk_1E6BBA900;
  id v9 = v7;
  id v34 = v9;
  [v8 enumerateObjectsUsingBlock:v33];

  v10 = [*(id *)(a1 + 32) mobileAsset];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke_3;
  v31[3] = &unk_1E6BB9EF8;
  id v11 = v9;
  id v32 = v11;
  [v10 enumerateObjectsUsingBlock:v31];

  uint64_t v12 = [*(id *)(a1 + 40) loadFactorPackWithId:v6 namespaceName:*(void *)(*(void *)(a1 + 48) + 48)];
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 selectedNamespace];
    int v15 = [v14 hasName];

    if (v15)
    {
      id v16 = [v13 selectedNamespace];
      id v17 = [v16 name];
      id v18 = +[TRIClientFactorPackUtils aliasesInNamespace:v17];
    }
    else
    {
      id v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = [v13 factorPackId];
        *(_DWORD *)buf = 138543362;
        id v36 = v27;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", buf, 0xCu);
      }
      id v18 = 0;
    }

    if ([*(id *)(a1 + 40) updateSavedFactorPackWithId:v6 namespaceName:*(void *)(*(void *)(a1 + 48) + 48) populatingAssetsForFactorNames:v11 aliasToUnaliasMap:v18])
    {
      if (*(unsigned char *)(a1 + 72))
      {
        id v20 = [*(id *)(a1 + 40) pathForFactorPackWithId:v6 namespaceName:*(void *)(*(void *)(a1 + 48) + 48)];
        id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v22 = [v20 stringByAppendingPathComponent:@"factorPack.fb"];
        id v30 = v21;
        if ([v21 fileExistsAtPath:v22])
        {
          uint64_t v29 = v20;
          char v23 = [TRIFBFactorPackStorage alloc];
          char v24 = [*(id *)(a1 + 56) paths];
          uint64_t v25 = [(TRIFBFactorPackStorage *)v23 initWithPaths:v24];

          if ([v25 updateSavedFactorLevelsWithFactorPackId:v6 namespaceName:*(void *)(*(void *)(a1 + 48) + 48) populatingAssetsForFactorNames:v11 aliasToUnaliasMap:v18])
          {
            id v20 = v29;
          }
          else
          {
            $A5A652246548B43F8BC05201A1C72A70 v26 = TRILogCategory_Server();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v6;
              _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Could not update factor levels storage for factor pack id: %@", buf, 0xCu);
            }

            id v20 = v29;
            if (*(unsigned char *)(a1 + 73))
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
              *a4 = 1;

              goto LABEL_19;
            }
          }
        }
        else
        {
          uint64_t v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 48);
            *(_DWORD *)buf = 138412546;
            id v36 = v6;
            __int16 v37 = 2112;
            uint64_t v38 = v28;
            _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Could not update factor levels for factor pack id: %@ because the flatbuffer file was absent for namespace name: %@", buf, 0x16u);
          }
        }

LABEL_19:
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }

    goto LABEL_21;
  }
  id v19 = TRILogCategory_Server();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v6;
    _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Unexpected failure to load factor pack: %{public}@", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  *a4 = 1;
LABEL_21:
}

void __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  id v3 = [a2 factorName];
  [v2 addObject:v3];
}

void __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  id v3 = [a2 factorName];
  [v2 addObject:v3];
}

- (id)_assetIdsFromKeysInDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_fetchOptionsWithDownloadOptions:(id)a3 paths:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FB00C0];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithPaths:v7];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB0210]) initWithPaths:v7 namespaceMetadataStorage:v9];

  uint64_t v11 = [v10 availableSpaceClassForFactorNames:self->_rolloutFactorNames namespaceName:self->_namespaceName];
  long long v12 = [TRIFetchOptions alloc];
  long long v13 = [NSNumber numberWithUnsignedInt:v11];
  long long v14 = [(TRIFetchOptions *)v12 initWithDownloadOptions:v8 cacheDeleteAvailableSpaceClass:v13];

  return v14;
}

- (void)removeDownloadableFactorNames:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__TRIFetchOnDemandFactorsTask_removeDownloadableFactorNames___block_invoke;
  v7[3] = &unk_1E6BBA950;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __61__TRIFetchOnDemandFactorsTask_removeDownloadableFactorNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3[5] containsObject:*(void *)(a1 + 32)])
  {
    [v3[5] removeObject:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Missing TRIFactorName %@ in downloadableFactorNames", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v87 = a4;
  v88 = (void *)os_transaction_create();
  atomic_store(1u, (unsigned __int8 *)&self->_isCurrentlyExecuting);
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke;
  v105[3] = &unk_1E6BB82A8;
  v105[4] = self;
  id v7 = v6;
  id v106 = v7;
  id v89 = (id)MEMORY[0x1E016EA80](v105);
  uint64_t v8 = [v7 keyValueStore];
  v91 = +[TRIFetchDateManager managerWithKeyValueStore:v8];

  id v9 = [v7 namespaceDatabase];
  v10 = [v7 paths];
  uint64_t v11 = [v10 namespaceDescriptorsDefaultDir];
  v90 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v9 defaultDescriptorDirectoryPath:v11];

  long long v12 = [(TRITaskAttributing *)self->_taskAttributing applicationBundleIdentifier];
  long long v13 = (void *)MEMORY[0x1E016E7F0]();
  long long v14 = (void *)MEMORY[0x1E4FB01A0];
  namespaceName = self->_namespaceName;
  uint64_t v16 = [v7 paths];
  id v17 = [v16 namespaceDescriptorsDefaultDir];
  id v18 = [v14 loadWithNamespaceName:namespaceName fromDirectory:v17];

  uint64_t v19 = [v18 resourceAttributionIdentifier];
  id v20 = (void *)v19;
  if (v19) {
    id v21 = (void *)v19;
  }
  else {
    id v21 = v12;
  }
  id v22 = v21;

  int v85 = [v18 expensiveNetworkingAllowed];
  char v23 = TRILogCategory_Server();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    char v24 = self->_namespaceName;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v24;
    __int16 v108 = 2114;
    uint64_t v109 = (uint64_t)v22;
    _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_INFO, "attributing on-demand factors fetch for %{public}@ to %{public}@", buf, 0x16u);
  }

  uint64_t v25 = [(TRIFetchOnDemandFactorsTask *)self deployment];

  if (v25)
  {
    $A5A652246548B43F8BC05201A1C72A70 v26 = [v7 rolloutDatabase];
    uint64_t v27 = [(TRIFetchOnDemandFactorsTask *)self deployment];
    uint64_t v28 = [v26 recordWithDeployment:v27 usingTransaction:0];

    if (v28)
    {
      uint64_t v29 = [v28 rampId];

      if (!v29)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v30 = objc_opt_new();
      id v31 = [v28 rampId];
      id v32 = [v30 ensureRolloutFields];
      [v32 setClientRampId:v31];

      [(TRITrialSystemTelemetry *)self->_trialSystemTelemetry mergeFrom:v30];
    }
    else
    {
      id v30 = TRILogCategory_Server();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = [(TRIFetchOnDemandFactorsTask *)self deployment];
        id v34 = [v33 shortDesc];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v34;
        _os_log_impl(&dword_1DA291000, v30, OS_LOG_TYPE_DEFAULT, "Warning: unable to find TRIRolloutRecord for deployment %{public}@; issuing incomplete telemetry.",
          buf,
          0xCu);
      }
    }

    goto LABEL_13;
  }
LABEL_14:
  uint64_t v35 = [(TRITaskAttributing *)self->_taskAttributing triCloudKitContainer];
  id v36 = [(TRITaskAttributing *)self->_taskAttributing teamIdentifier];
  __int16 v37 = +[TRICKNativeArtifactProvider providerForContainer:v35 teamId:v36 bundleId:v22 dateProvider:v91 namespaceDescriptorProvider:v90 serverContext:v7];
  artifactProvider = self->_artifactProvider;
  self->_artifactProvider = v37;

  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_11];
  uint64_t v39 = [(TRITaskAttributing *)self->_taskAttributing networkOptions];
  if (![v39 discretionaryBehavior]) {
    goto LABEL_28;
  }
  uint64_t v40 = [(TRIBaseTask *)self stateProvider];
  v41 = [v40 activeActivityDescriptorGrantingCapability:16];
  uint64_t v42 = [v41 activity];
  if (!v42)
  {
    v68 = TRILogCategory_Server();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v68, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
    }

    [(TRIFetchOnDemandFactorsTask *)self _completeTaskWithStatus:1 earliestRetryDate:0 error:0 aggregateProgress:0 context:v7];
    [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:3];
    uint64_t v69 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
    goto LABEL_51;
  }
  [v39 setActivity:v42];
  uint64_t v43 = [v40 activeActivityDescriptorGrantingCapability:1];

  int v44 = [v39 allowsCellularAccess];
  if (v43) {
    int v45 = 0;
  }
  else {
    int v45 = v44;
  }
  if (v45 == 1)
  {
    if (!v22 || ([v22 length] ? (char v46 = v85) : (char v46 = 0), (v46 & 1) == 0))
    {
      v70 = TRILogCategory_Server();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        v75 = self->_namespaceName;
        uint64_t v76 = [(NSSet *)self->_rolloutFactorNames anyObject];
        v77 = (void *)v76;
        v78 = @"NO";
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v75;
        __int16 v108 = 2114;
        if (v85) {
          v78 = @"YES";
        }
        uint64_t v109 = v76;
        __int16 v110 = 2114;
        id v111 = v22;
        __int16 v112 = 2114;
        v113 = v78;
        _os_log_error_impl(&dword_1DA291000, v70, OS_LOG_TYPE_ERROR, "preventing fetch for (%{public}@, %{public}@) on cellular, resourceAttributionBundleIdentifier: %{public}@ expensiveNetworkingAllowed: %{public}@", buf, 0x2Au);
      }
      [(TRIFetchOnDemandFactorsTask *)self _completeTaskWithStatus:1 earliestRetryDate:0 error:0 aggregateProgress:0 context:v7];
      [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:23];
      uint64_t v69 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
LABEL_51:
      v67 = (void *)v69;

      goto LABEL_66;
    }
  }
  if ([v39 allowsCellularAccess])
  {
    char v47 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v39, "allowsCellularAccess"));
    [(TRIFetchOnDemandFactorsTask *)self _addMetric:v47];
  }
LABEL_28:
  objc_super v48 = [TRIAggregateFetchRecordsProgress alloc];
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_422;
  v104[3] = &unk_1E6BB9FE8;
  v104[4] = self;
  v49 = [(TRIAggregateFetchRecordsProgress *)v48 initWithProgressBlock:v104];
  v50 = [(TRIFetchOnDemandFactorsTask *)self _planForFetchingAssetsFromTreatmentRecordsWithContext:v7 downloadOptions:v39 updatingAggregateProgress:v49];
  if (v50)
  {
    *(void *)buf = 0;
    id v103 = 0;
    uint64_t v51 = [(TRIFetchOnDemandFactorsTask *)self _planForFetchingAssetDiffsWithContext:v7 downloadOptions:v39 updatingAggregateProgress:v49 nonDiffableAssetIds:buf unlinkedMAAssetsOnDisk:&v103];
    if (!v51) {
      goto LABEL_44;
    }
    if (!*(void *)buf)
    {
      v79 = [MEMORY[0x1E4F28B00] currentHandler];
      [v79 handleFailureInMethod:a2, self, @"TRIFetchOnDemandFactorsTask.m", 614, @"Invalid parameter not satisfying: %@", @"requiredNonDiffableAssetIds" object file lineNumber description];
    }
    -[TRIFetchOnDemandFactorsTask _planForFetchingAssetsFromFactorPacksWithContext:assetDiffFetchPlan:requiredAssetIds:downloadOptions:updatingAggregateProgress:](self, "_planForFetchingAssetsFromFactorPacksWithContext:assetDiffFetchPlan:requiredAssetIds:downloadOptions:updatingAggregateProgress:", v7, v51);
    id v52 = (id)objc_claimAutoreleasedReturnValue();

    if (!v52)
    {
LABEL_44:
      [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:4];
      v67 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
LABEL_64:

      goto LABEL_65;
    }
    if (!+[TRICacheDeleteUtils hasSufficientDiskSpaceForDownload:[(TRIFetchOnDemandFactorsTask *)self _requiredDiskSpaceForPlan:v52]])
    {
      v71 = TRILogCategory_Server();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v102 = 0;
        _os_log_error_impl(&dword_1DA291000, v71, OS_LOG_TYPE_ERROR, "Insufficient disk space for on-demand factor fetch. Stopping the task before starting the download", v102, 2u);
      }

      [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:self->_notificationKey withError:4];
      [(TRIFetchOnDemandFactorsTask *)self _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:v49 context:v7];
      [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:24];
      uint64_t v66 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
      goto LABEL_55;
    }
    v53 = [v7 paths];
    v84 = [(TRIFetchOnDemandFactorsTask *)self _fetchOptionsWithDownloadOptions:v39 paths:v53];

    dispatch_group_t v54 = dispatch_group_create();
    *(void *)v102 = 0;
    v55 = [(TRIFetchOnDemandFactorsTask *)self _fetchDiffsFromAssetDiffRecordsWithContext:v7 plan:v52 aggregateProgress:v49 downloadSize:v102 options:v84];
    v86 = v55;
    group = v54;
    if (v55)
    {
      if (![v55 count])
      {
LABEL_39:
        *(void *)v101 = 0;
        [(TRIFetchOnDemandFactorsTask *)self _asyncFetchCKAssetsFromAssetRecordsWithContext:v7 plan:v52 aggregateProgress:v49 downloadSize:v101 options:v84 group:v54];
        uint64_t v100 = 0;
        [(TRIFetchOnDemandFactorsTask *)self _asyncFetchMAAssetsFromFactorPacksWithContext:v7 plan:v52 aggregateProgress:v49 downloadSize:&v100 options:v84 group:v54];
        v60 = dispatch_group_create();
        uint64_t v99 = 0;
        [(TRIFetchOnDemandFactorsTask *)self _asyncFetchAssetsFromTreatmentRecordsWithContext:v7 plan:v50 aggregateProgress:v49 downloadSize:&v99 downloadOptions:v39 group:v60];
        dispatch_group_enter(v60);
        v61 = dispatch_get_global_queue(17, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_432;
        block[3] = &unk_1E6BBA9C0;
        block[4] = self;
        id v52 = v52;
        id v94 = v52;
        id v95 = v103;
        id v62 = v7;
        id v96 = v62;
        v81 = v49;
        v97 = v81;
        v63 = v60;
        v98 = v63;
        dispatch_group_notify(group, v61, block);

        v64 = TRILogCategory_Server();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v92 = 0;
          _os_log_impl(&dword_1DA291000, v64, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask waiting for group completion.", v92, 2u);
        }

        [MEMORY[0x1E4F93B18] waitForGroup:v63];
        v65 = TRILogCategory_Server();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v92 = 0;
          _os_log_impl(&dword_1DA291000, v65, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask group complete.", v92, 2u);
        }

        [(TRIFetchOnDemandFactorsTask *)self _completeTaskWithStatus:2 earliestRetryDate:0 error:0 aggregateProgress:v81 context:v62];
        uint64_t v66 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
LABEL_55:
        v67 = (void *)v66;
LABEL_63:

        goto LABEL_64;
      }
      v56 = [*(id *)buf setByAddingObjectsFromSet:v86];
      v80 = [(TRIFetchOnDemandFactorsTask *)self _planForFetchingAssetsFromFactorPacksWithContext:v7 assetDiffFetchPlan:v52 requiredAssetIds:v56 downloadOptions:v39 updatingAggregateProgress:v49];

      if (!v80)
      {
        [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:4];
        v67 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
LABEL_62:

        id v52 = v84;
        goto LABEL_63;
      }
      v57 = [MEMORY[0x1E4F1C9E8] dictionary];
      v58 = (void *)[v80 copyWithReplacementRecordIdsForDiffableAssetIds:v57];
      unint64_t v59 = [(TRIFetchOnDemandFactorsTask *)self _requiredDiskSpaceForPlan:v58];

      dispatch_group_t v54 = group;
      if (+[TRICacheDeleteUtils hasSufficientDiskSpaceForDownload:v59])
      {
        id v52 = v80;
        goto LABEL_39;
      }
      v72 = TRILogCategory_Server();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v101 = 0;
        _os_log_error_impl(&dword_1DA291000, v72, OS_LOG_TYPE_ERROR, "Fetch plan was changed due to incomplete diff download. We now have insufficient disk space for on-demand factor fetch. Stopping the task early.", v101, 2u);
      }

      [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:self->_notificationKey withError:4];
      [(TRIFetchOnDemandFactorsTask *)self _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:v49 context:v7];
      [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:24];
      v67 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
      id v52 = v80;
    }
    else
    {
      [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:10];
      v67 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
    }

    goto LABEL_62;
  }
  [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:6];
  v67 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
LABEL_65:

LABEL_66:
  v73 = v89;
  if (v89)
  {
    (*((void (**)(void))v89 + 2))();
    v73 = v89;
  }

  return v67;
}

void __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 88));
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v25 = *MEMORY[0x1E4F28568];
  v26[0] = @"on_demand_requested_factor_failed_to_download_without_asset_fetch";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  id v4 = (void *)[v2 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 128);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_2;
  v21[3] = &unk_1E6BBA978;
  v21[4] = v5;
  id v22 = *(id *)(a1 + 40);
  id v15 = v4;
  id v23 = v15;
  [v6 runWithLockAcquired:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        long long v12 = *(void **)(a1 + 32);
        uint64_t v13 = v12[6];
        long long v14 = [*(id *)(a1 + 40) client];
        [v12 _logOnDemandFactor:v11 metricName:@"on_demand_factor_subscribed" namespaceName:v13 client:v14 error:0];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v8);
  }
}

void __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a2 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v8)
        {
          uint64_t v9 = *(void **)(a1 + 32);
          uint64_t v10 = v9[6];
          uint64_t v11 = [*(id *)(a1 + 40) client];
          [v9 _logOnDemandFactor:v8 metricName:@"on_demand_factor_failed_to_download_by_request" namespaceName:v10 client:v11 error:*(void *)(a1 + 48)];
        }
        else
        {
          uint64_t v11 = TRILogCategory_Server();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            long long v12 = (objc_class *)objc_opt_class();
            uint64_t v13 = NSStringFromClass(v12);
            *(_DWORD *)buf = 138412290;
            long long v19 = v13;
            _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Missing factorname in %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

void __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_413(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 16) = 0;
  id v2 = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  id v3 = (id)a2;

  id v4 = (id)v3[4];
  v3[4] = 0;
}

uint64_t __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_422(uint64_t result, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 72);
  if (v2) {
    return [MEMORY[0x1E4FB00D0] notifyDownloadProgressForKey:v2 withProgress:(unint64_t)(a2 * 99.0)];
  }
  return result;
}

void __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_432(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _currentTaskStatus];
  int v3 = [v2 runStatus];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 40) metadataForRequestedUnlinkedAssets];
    uint64_t v5 = [v4 mobileAsset];
    uint64_t v6 = (void *)[v5 mutableCopy];

    uint64_t v7 = [*(id *)(a1 + 48) allObjects];
    [v6 addObjectsFromArray:v7];

    uint64_t v8 = [*(id *)(a1 + 40) metadataForRequestedUnlinkedAssets];
    uint64_t v9 = (void *)[v8 copyWithReplacementMobileAsset:v6];

    if (([*(id *)(a1 + 32) _updateFactorPacksByMergingAssets:v9 context:*(void *)(a1 + 56)] & 1) == 0)
    {
      [*(id *)(a1 + 32) _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:*(void *)(a1 + 64) context:*(void *)(a1 + 56)];
      [*(id *)(a1 + 32) _addMetricForFetchOnDemandFactorsTaskError:14];
    }
  }
  uint64_t v10 = *(NSObject **)(a1 + 72);
  dispatch_group_leave(v10);
}

- (unint64_t)_requiredDiskSpaceForPlan:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v4 = [v3 recordIdsForDiffableAssetIds];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke;
  v12[3] = &unk_1E6BBA9E8;
  v12[4] = &v13;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v5 = [v3 recordIdsForNonDiffableAssetIds];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke_2;
  v11[3] = &unk_1E6BBA9E8;
  v11[4] = &v13;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  uint64_t v6 = [v3 metadataForRequestedUnlinkedAssets];
  uint64_t v7 = [v6 mobileAsset];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke_3;
  v10[3] = &unk_1E6BBAA10;
  v10[4] = &v13;
  [v7 enumerateObjectsUsingBlock:v10];

  unint64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 downloadSize];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 downloadSize];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 metadata];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 downloadSize];
}

- (void)_completeTaskWithStatus:(int)a3 earliestRetryDate:(id)a4 error:(id)a5 aggregateProgress:(id)a6 context:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  lock = self->_lock;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105__TRIFetchOnDemandFactorsTask__completeTaskWithStatus_earliestRetryDate_error_aggregateProgress_context___block_invoke;
  v18[3] = &unk_1E6BBAA38;
  int v22 = a3;
  v18[4] = self;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  [(_PASLock *)lock runWithLockAcquired:v18];
}

void __105__TRIFetchOnDemandFactorsTask__completeTaskWithStatus_earliestRetryDate_error_aggregateProgress_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(_DWORD *)(a1 + 64);
  if (v4 == 2) {
    goto LABEL_16;
  }
  uint64_t v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Early termination of TRIFetchOnDemandFactorsTask. Cancelling remaining fetch operations", buf, 2u);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v3[1];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "cancel", (void)v26);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v8);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v11 + 144))
  {
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = +[TRICKNativeArtifactProvider isActivityDeferralError:*(void *)(a1 + 40)];
    uint64_t v11 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v11 + 144) = v12;
  int v4 = *(_DWORD *)(a1 + 64);
  if (v4 != 3 || *((_DWORD *)v3 + 4) == 3)
  {
LABEL_16:
    if (!*((_DWORD *)v3 + 4))
    {
      id v13 = v3[3];
      *((_DWORD *)v3 + 4) = v4;
      if (!v13) {
        objc_storeStrong(v3 + 3, *(id *)(a1 + 48));
      }
      if (!v3[4]) {
        objc_storeStrong(v3 + 4, *(id *)(a1 + 40));
      }
      long long v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v15;
        __int16 v32 = 2114;
        uint64_t v33 = v3;
        _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ complete with %{public}@", buf, 0x16u);
      }

      int v16 = *(_DWORD *)(a1 + 64);
      if (v16 == 2)
      {
        [MEMORY[0x1E4FB01E8] notifyUpdateForNamespaceName:*(void *)(*(void *)(a1 + 32) + 48)];
        uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 72);
        if (v17)
        {
          [MEMORY[0x1E4FB00D0] notifyDownloadProgressForKey:v17 withProgress:100];
          [MEMORY[0x1E4FB00D0] notifyDownloadCompletedForKey:*(void *)(*(void *)(a1 + 32) + 72)];
        }
        int v16 = *(_DWORD *)(a1 + 64);
      }
      if (v16 == 4)
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 72);
        if (!v18) {
          goto LABEL_17;
        }
        [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:v18 withError:3];
        int v16 = *(_DWORD *)(a1 + 64);
      }
      if (v16 == 1)
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 72);
        if (v19)
        {
          id v20 = *(void **)(a1 + 56);
          if (v20)
          {
            [v20 fractionCompleted];
            unint64_t v22 = (unint64_t)(v21 * 100.0);
            uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 72);
          }
          else
          {
            unint64_t v22 = 0;
          }
          objc_msgSend(MEMORY[0x1E4FB00D0], "notifyDownloadStalledForKey:withProgress:", v19, v22, (void)v26);
        }
      }
    }
  }
  else
  {
    *((_DWORD *)v3 + 4) = 3;
    objc_storeStrong(v3 + 3, *(id *)(a1 + 48));
    objc_storeStrong(v3 + 4, *(id *)(a1 + 40));
    id v23 = TRILogCategory_Server();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v24;
      __int16 v32 = 2114;
      uint64_t v33 = v3;
      _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ failed with %{public}@", buf, 0x16u);
    }

    uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 72);
    if (v25) {
      [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:v25 withError:0];
    }
  }
LABEL_17:
}

- (id)_currentTaskStatus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__18;
  uint64_t v10 = __Block_byref_object_dispose__18;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__TRIFetchOnDemandFactorsTask__currentTaskStatus__block_invoke;
  v5[3] = &unk_1E6BBAA60;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __49__TRIFetchOnDemandFactorsTask__currentTaskStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [TRITaskRunResult alloc];
  uint64_t v5 = *((unsigned int *)v3 + 4);
  uint64_t v6 = v3[3];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(TRITaskRunResult *)v4 initWithRunStatus:v5 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:v6];
  return MEMORY[0x1F41817F8]();
}

- (id)_planForFetchingAssetsFromTreatmentRecordsWithContext:(id)a3 downloadOptions:(id)a4 updatingAggregateProgress:(id)a5
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v83 = a3;
  id v69 = a4;
  id v80 = a5;
  context = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Beginning plan for fetching assets from treatment records.", buf, 2u);
  }

  v79 = dispatch_group_create();
  id v8 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v9 = objc_opt_new();
  v81 = (void *)[v8 initWithGuardedData:v9];

  v78 = [[TRIFetchOptions alloc] initWithDownloadOptions:v69 cacheDeleteAvailableSpaceClass:&unk_1F347B8E8];
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obj = self->_assetIndexesByTreatment;
  uint64_t v10 = [(NSDictionary *)obj countByEnumeratingWithState:&v122 objects:v136 count:16];
  if (v10)
  {
    uint64_t v76 = *(void *)v123;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v123 != v76) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v122 + 1) + 8 * i);
        long long v14 = (void *)MEMORY[0x1E016E7F0]();
        dispatch_group_enter(v79);
        artifactProvider = self->_artifactProvider;
        v115[0] = v11;
        v115[1] = 3221225472;
        v115[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke;
        v115[3] = &unk_1E6BBAAB0;
        v115[4] = self;
        id v116 = v80;
        id v117 = v83;
        SEL v121 = a2;
        id v118 = v81;
        uint64_t v119 = v13;
        v120 = v79;
        int v16 = [(TRIArtifactProvider *)artifactProvider fetchTreatmentWithId:v13 options:v78 completion:v115];
        lock = self->_lock;
        v113[0] = v11;
        v113[1] = 3221225472;
        v113[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_443;
        v113[3] = &unk_1E6BBA950;
        id v114 = v16;
        id v18 = v16;
        [(_PASLock *)lock runWithLockAcquired:v113];
      }
      uint64_t v10 = [(NSDictionary *)obj countByEnumeratingWithState:&v122 objects:v136 count:16];
    }
    while (v10);
  }

  [MEMORY[0x1E4F93B18] waitForGroup:v79];
  uint64_t v19 = [(TRIFetchOnDemandFactorsTask *)self _currentTaskStatus];
  BOOL v20 = [v19 runStatus] == 0;

  if (v20)
  {
    v77 = objc_opt_new();
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v70 = self->_assetIndexesByTreatment;
    uint64_t v72 = [(NSDictionary *)v70 countByEnumeratingWithState:&v109 objects:v135 count:16];
    if (v72)
    {
      uint64_t v22 = *(void *)v110;
      while (2)
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v110 != v22) {
            objc_enumerationMutation(v70);
          }
          uint64_t v24 = *(void *)(*((void *)&v109 + 1) + 8 * v23);
          id obja = (id)MEMORY[0x1E016E7F0]();
          uint64_t v25 = [TRIClientTreatmentStorage alloc];
          long long v26 = [v83 paths];
          long long v27 = [(TRIClientTreatmentStorage *)v25 initWithPaths:v26];

          long long v28 = [(TRIClientTreatmentStorage *)v27 loadTreatmentWithTreatmentId:v24 isFilePresent:0];
          if (_os_feature_enabled_impl())
          {
            long long v29 = [TRIFBClientTreatmentStorage alloc];
            id v30 = [v83 paths];
            uint64_t v31 = [(TRIFBClientTreatmentStorage *)v29 initWithPaths:v30];

            __int16 v32 = [(TRIFBClientTreatmentStorage *)v31 loadTreatmentWithTreatmentId:v24 isFilePresent:0];
            if (([v28 isEqual:v32] & 1) == 0)
            {
              uint64_t v33 = TRILogCategory_Server();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v127 = (uint64_t)v32;
                __int16 v128 = 2114;
                NSUInteger v129 = (NSUInteger)v28;
                _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Treatment loaded from flatbuffers:%{public}@  does not match treatment loaded from pb: %{public}@ ", buf, 0x16u);
              }
            }
            if (_os_feature_enabled_impl())
            {
              id v34 = v32;

              long long v28 = v34;
            }
          }
          if (v28)
          {
            uint64_t v35 = [v28 unlinkedOnDemandAssets];
            if (v35)
            {
              id v36 = [(NSDictionary *)self->_assetIndexesByTreatment objectForKeyedSubscript:v24];
              if (!v36)
              {
                uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
                [v39 handleFailureInMethod:a2, self, @"TRIFetchOnDemandFactorsTask.m", 958, @"Expression was unexpectedly nil/false: %@", @"self->_assetIndexesByTreatment[treatmentId]" object file lineNumber description];
              }
              v105[0] = MEMORY[0x1E4F143A8];
              v105[1] = 3221225472;
              v105[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_451;
              v105[3] = &unk_1E6BBAAD8;
              SEL v108 = a2;
              v105[4] = self;
              id v106 = v36;
              id v107 = v77;
              id v37 = v36;
              [v35 enumerateKeysAndObjectsUsingBlock:v105];

              int v38 = 0;
            }
            else
            {
              [(TRIFetchOnDemandFactorsTask *)self _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:v80 context:v83];
              [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:12];
              int v38 = 1;
            }
          }
          else
          {
            [(TRIFetchOnDemandFactorsTask *)self _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:v80 context:v83];
            [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:13];
            int v38 = 1;
          }

          if (v38)
          {
            double v21 = 0;
            goto LABEL_51;
          }
          ++v23;
        }
        while (v72 != v23);
        uint64_t v72 = [(NSDictionary *)v70 countByEnumeratingWithState:&v109 objects:v135 count:16];
        if (v72) {
          continue;
        }
        break;
      }
    }

    id v71 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_assetIndexesByTreatment, "count"));
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    uint64_t v40 = self->_assetIndexesByTreatment;
    uint64_t v41 = 0;
    uint64_t v42 = [(NSDictionary *)v40 countByEnumeratingWithState:&v101 objects:v134 count:16];
    if (v42)
    {
      id objb = *(id *)v102;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(id *)v102 != objb) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = *(void *)(*((void *)&v101 + 1) + 8 * v43);
          int v45 = (void *)MEMORY[0x1E016E7F0]();
          char v46 = objc_opt_new();
          char v47 = [TRIAssetStore alloc];
          objc_super v48 = [v83 paths];
          v49 = [(TRIAssetStore *)v47 initWithPaths:v48];

          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_2_453;
          v96[3] = &unk_1E6BBAAD8;
          v97 = v49;
          id v50 = v46;
          id v98 = v50;
          uint64_t v99 = self;
          SEL v100 = a2;
          uint64_t v51 = v49;
          [v77 enumerateKeysAndObjectsUsingBlock:v96];
          id v52 = v50;

          if ([v52 count])
          {
            v53 = [v81 unsafeGuardedData];
            dispatch_group_t v54 = [v53 objectForKeyedSubscript:v44];

            if (!v54)
            {
              v57 = [MEMORY[0x1E4F28B00] currentHandler];
              [v57 handleFailureInMethod:a2, self, @"TRIFetchOnDemandFactorsTask.m", 985, @"Expression was unexpectedly nil/false: %@", @"[guardedRecordIdForTreatment unsafeGuardedData][treatmentId]" object file lineNumber description];
            }
            v55 = [[TRITreatmentRecordFetchPlan alloc] initWithRecordId:v54 assetIndexes:v52];
            [v71 setObject:v55 forKeyedSubscript:v44];
          }
          uint64_t v56 = [v52 count];

          v41 += v56;
          ++v43;
        }
        while (v42 != v43);
        uint64_t v42 = [(NSDictionary *)v40 countByEnumeratingWithState:&v101 objects:v134 count:16];
      }
      while (v42);
    }

    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v71, "count"));
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    uint64_t v95 = 0;
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_3;
    v87[3] = &unk_1E6BBAB00;
    SEL v91 = a2;
    v87[4] = self;
    v70 = (NSDictionary *)v71;
    v88 = v70;
    id v59 = v58;
    id v89 = v59;
    v90 = &v92;
    [v77 enumerateKeysAndObjectsUsingBlock:v87];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_461;
    v85[3] = &unk_1E6BBAB28;
    id v86 = v80;
    [v59 enumerateKeysAndObjectsUsingBlock:v85];
    v60 = TRILogCategory_Server();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v61 = [v77 count];
      NSUInteger v62 = [(NSDictionary *)self->_assetIndexesByTreatment count];
      double v63 = (double)(unint64_t)v93[3];
      *(_DWORD *)buf = 134218752;
      uint64_t v127 = v61;
      __int16 v128 = 2048;
      NSUInteger v129 = v62;
      __int16 v130 = 2048;
      uint64_t v131 = v41;
      __int16 v132 = 2048;
      double v133 = v63 / 1000000.0;
      _os_log_impl(&dword_1DA291000, v60, OS_LOG_TYPE_DEFAULT, "Treatment fetch planning phase complete.  On-demand fetch task will result in linking %tu assets into %tu treatment(s); %tu assets require download.  Total download size for Treatment record assets: %.2f MB",
        buf,
        0x2Au);
    }

    v64 = [TRIGenericUniqueRequiredAssets alloc];
    v65 = objc_opt_new();
    uint64_t v66 = [(TRIGenericUniqueRequiredAssets *)v64 initWithCloudKit:v77 mobileAsset:v65];

    double v21 = [[TRITreatmentAssetFetchPlan alloc] initWithMetadataForRequestedUnlinkedAssets:v66 fetchPlansForTreatmentIds:v70];
    _Block_object_dispose(&v92, 8);

LABEL_51:
  }
  else
  {
    double v21 = 0;
  }

  return v21;
}

void __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  switch(a2)
  {
    case 0:
      int v16 = *(void **)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      uint64_t v19 = 3;
      id v20 = 0;
      goto LABEL_5;
    case 1:
      int v16 = *(void **)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      uint64_t v19 = 4;
      id v20 = 0;
      id v21 = 0;
      goto LABEL_6;
    case 2:
      int v16 = *(void **)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      uint64_t v19 = 1;
      id v20 = v14;
LABEL_5:
      id v21 = v15;
LABEL_6:
      [v16 _completeTaskWithStatus:v19 earliestRetryDate:v20 error:v21 aggregateProgress:v17 context:v18];
      break;
    case 3:
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 871, @"Unexpected TRIFetchStatus %tu", 3);

      break;
    case 4:
      if (v12)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_2;
        void v26[3] = &unk_1E6BBAA88;
        uint64_t v23 = *(void **)(a1 + 56);
        void v26[4] = *(void *)(a1 + 64);
        id v27 = v12;
        [v23 runWithLockAcquired:v26];
      }
      else
      {
        uint64_t v24 = TRILogCategory_Server();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v25;
          _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "CloudKit fetch succeeded, but a valid treatment artifact was not obtained for treatment %@.", buf, 0xCu);
        }

        [*(id *)(a1 + 32) _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
        [*(id *)(a1 + 32) _addMetricForFetchOnDemandFactorsTaskError:25];
      }
      break;
    default:
      break;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

uint64_t __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

uint64_t __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_443(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
}

void __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_451(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 treatmentIndex];
  if (!v6)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 960, @"Expression was unexpectedly nil/false: %@", @"metadata.treatmentIndex" object file lineNumber description];
  }
  uint64_t v7 = [v6 index];

  if ([*(id *)(a1 + 40) containsIndex:v7]) {
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v9];
  }
}

uint64_t __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_2_453(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  if (([*(id *)(a1 + 32) hasAssetWithIdentifier:a2 type:0] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v9 treatmentIndex];
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"TRIFetchOnDemandFactorsTask.m", 979, @"Expression was unexpectedly nil/false: %@", @"metadata.treatmentIndex" object file lineNumber description];
    }
    objc_msgSend(v5, "addIndex:", objc_msgSend(v6, "index"));
  }
  return MEMORY[0x1F41817F8]();
}

void __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  int v4 = [v17 treatmentIndex];
  if (!v4)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a1[8], a1[4], @"TRIFetchOnDemandFactorsTask.m", 999, @"Expression was unexpectedly nil/false: %@", @"metadata.treatmentIndex" object file lineNumber description];
  }
  id v5 = (void *)a1[5];
  uint64_t v6 = [v4 treatmentId];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [v7 assetIndexes];
    int v9 = objc_msgSend(v8, "containsIndex:", objc_msgSend(v4, "index"));

    if (v9)
    {
      uint64_t v10 = (void *)a1[6];
      uint64_t v11 = [v7 recordId];
      id v12 = [v10 objectForKeyedSubscript:v11];

      if (!v12) {
        id v12 = &unk_1F347B900;
      }
      id v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v17, "downloadSize") + objc_msgSend(v12, "unsignedLongLongValue"));
      id v14 = (void *)a1[6];
      id v15 = [v7 recordId];
      [v14 setObject:v13 forKeyedSubscript:v15];

      *(void *)(*(void *)(a1[7] + 8) + 24) += [v17 downloadSize];
    }
  }
}

void __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_461(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v4, "registerRecordId:withExpectedSize:", v5, objc_msgSend(a3, "unsignedLongLongValue"));
}

- (id)_planForFetchingAssetDiffsWithContext:(id)a3 downloadOptions:(id)a4 updatingAggregateProgress:(id)a5 nonDiffableAssetIds:(id *)a6 unlinkedMAAssetsOnDisk:(id *)a7
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v58 = a4;
  id v11 = a5;
  context = (void *)MEMORY[0x1E016E7F0]();
  id v12 = [TRIAssetStore alloc];
  id v13 = [v10 paths];
  id v14 = [(TRIAssetStore *)v12 initWithPaths:v13];

  id v15 = objc_opt_new();
  int v16 = [TRIFactorPackStorage alloc];
  id v17 = [v10 paths];
  uint64_t v18 = [(TRIFactorPackStorage *)v16 initWithPaths:v17];

  uint64_t v19 = [TRIFBFactorPackStorage alloc];
  id v20 = [v10 paths];
  id v21 = [(TRIFBFactorPackStorage *)v19 initWithPaths:v20];

  LOBYTE(v20) = _os_feature_enabled_impl();
  uint64_t v106 = 0;
  id v107 = &v106;
  uint64_t v108 = 0x3032000000;
  long long v109 = __Block_byref_object_copy__18;
  long long v110 = __Block_byref_object_dispose__18;
  id v111 = (id)objc_opt_new();
  uint64_t v100 = 0;
  long long v101 = &v100;
  uint64_t v102 = 0x3032000000;
  long long v103 = __Block_byref_object_copy__18;
  long long v104 = __Block_byref_object_dispose__18;
  id v105 = (id)objc_opt_new();
  assetIdsByFactorPack = self->_assetIdsByFactorPack;
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke;
  v89[3] = &unk_1E6BBABC8;
  v89[4] = self;
  char v99 = (char)v20;
  dispatch_group_t v54 = v21;
  v90 = v54;
  id v96 = &v106;
  v53 = v18;
  SEL v91 = v53;
  id v60 = v10;
  id v92 = v60;
  id v59 = v14;
  v93 = v59;
  id v52 = v15;
  id v94 = v52;
  id v98 = a7;
  id v23 = v11;
  id v95 = v23;
  v97 = &v100;
  [(NSDictionary *)assetIdsByFactorPack enumerateKeysAndObjectsUsingBlock:v89];
  if (v107[5])
  {
    uint64_t v24 = objc_opt_new();
    uint64_t v25 = objc_opt_new();
    long long v26 = (void *)v107[5];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_3;
    v85[3] = &unk_1E6BBABF0;
    id v27 = v59;
    id v86 = v27;
    id v51 = v24;
    id v87 = v51;
    id v57 = v25;
    id v88 = v57;
    [v26 enumerateObjectsUsingBlock:v85];
    long long v28 = TRILogCategory_Server();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEFAULT, "Beginning plan for fetching asset diffs from AssetDiff records for use in factor packs.", buf, 2u);
    }

    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_470;
    v83[3] = &unk_1E6BB9558;
    v84 = v27;
    uint64_t v29 = (void *)MEMORY[0x1E016EA80](v83);
    uint64_t v30 = [[TRIFetchOptions alloc] initWithDownloadOptions:v58 cacheDeleteAvailableSpaceClass:&unk_1F347B918];
    *(void *)buf = 0;
    v78 = buf;
    uint64_t v79 = 0x3032000000;
    id v80 = __Block_byref_object_copy__18;
    v81 = __Block_byref_object_dispose__18;
    id v82 = 0;
    dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
    artifactProvider = self->_artifactProvider;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_474;
    v71[3] = &unk_1E6BBAC18;
    v71[4] = self;
    id v33 = v23;
    id v72 = v33;
    v75 = buf;
    SEL v76 = a2;
    id v73 = v60;
    id v34 = v31;
    v74 = v34;
    uint64_t v35 = [(TRIArtifactProvider *)artifactProvider fetchDiffSourceRecordIdsWithTargetAssetIds:v57 isAcceptableSourceAssetId:v29 options:v30 completion:v71];
    lock = self->_lock;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2_476;
    v69[3] = &unk_1E6BBA950;
    id v37 = v35;
    id v70 = v37;
    [(_PASLock *)lock runWithLockAcquired:v69];
    [MEMORY[0x1E4F93B18] waitForSemaphore:v34];
    if (*((void *)v78 + 5))
    {
      int v38 = (void *)[v51 mutableCopy];
      uint64_t v65 = 0;
      uint64_t v66 = &v65;
      uint64_t v67 = 0x2020000000;
      uint64_t v68 = 0;
      uint64_t v39 = (void *)*((void *)v78 + 5);
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_3_477;
      v61[3] = &unk_1E6BBAC40;
      id v40 = v38;
      id v62 = v40;
      id v63 = v33;
      v64 = &v65;
      [v39 enumerateKeysAndObjectsUsingBlock:v61];
      uint64_t v41 = TRILogCategory_Server();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v42 = [*((id *)v78 + 5) count];
        double v43 = (double)(unint64_t)v66[3] / 1000000.0;
        *(_DWORD *)long long v112 = 134218240;
        uint64_t v113 = v42;
        __int16 v114 = 2048;
        double v115 = v43;
        _os_log_impl(&dword_1DA291000, v41, OS_LOG_TYPE_DEFAULT, "Factor pack asset diff fetch planning phase complete.  On-demand fetch task will construct %tu assets from asset diffs.  Total factor pack asset diff download size: %.2f MB", v112, 0x16u);
      }

      objc_storeStrong(a6, v38);
      uint64_t v44 = [TRIGenericRequiredAssets alloc];
      int v45 = [(TRIGenericRequiredAssets *)v44 initWithCloudKit:v107[5] mobileAsset:v101[5]];
      char v46 = [TRIFactorPackAssetFetchPlan alloc];
      char v47 = [(TRIFactorPackAssetFetchPlan *)v46 initWithMetadataForRequestedUnlinkedAssets:v45 recordIdsForDiffableAssetIds:*((void *)v78 + 5) recordIdsForNonDiffableAssetIds:MEMORY[0x1E4F1CC08]];

      _Block_object_dispose(&v65, 8);
    }
    else
    {
      char v47 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(TRIFetchOnDemandFactorsTask *)self _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:v23 context:v60];
    [(TRIFetchOnDemandFactorsTask *)self _addMetricForFetchOnDemandFactorsTaskError:11];
    char v47 = 0;
  }

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v106, 8);

  return v47;
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = objc_opt_new();
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2;
  v55[3] = &unk_1E6BBAB50;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v56 = v9;
  uint64_t v57 = v10;
  [v7 enumerateObjectsUsingBlock:v55];

  objc_super v48 = +[TRIClientFactorPackUtils aliasesInNamespace:*(void *)(*(void *)(a1 + 32) + 48)];
  if (!*(unsigned char *)(a1 + 112))
  {
LABEL_9:
    uint64_t v19 = 0;
    id v16 = 0;
    goto LABEL_19;
  }
  id v11 = [*(id *)(a1 + 40) pathForFactorLevelsWithFactorPackId:v6 namespaceName:*(void *)(*(void *)(a1 + 32) + 48)];
  if (!v11)
  {
    id v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = *(void *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v59 = v44;
      __int16 v60 = 2112;
      id v61 = v6;
      _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Could not find path for flatbuffers for namespace:%@ and factorpackId:%@", buf, 0x16u);
    }

    goto LABEL_9;
  }
  id v12 = v11;
  char v47 = v9;
  id v13 = [v11 stringByAppendingPathComponent:@"factorPack.fb"];
  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v15 = [v14 fileExistsAtPath:v13];

  if (v15)
  {
    id v16 = v12;
    uint64_t v17 = [*(id *)(a1 + 40) loadFactorLevelsWithDir:v16 bufferSize:0];
    if (!v17)
    {
      uint64_t v42 = *(void *)(*(void *)(a1 + 88) + 8);
      double v43 = *(void **)(v42 + 40);
      *(void *)(v42 + 40) = 0;

      *a4 = 1;
      uint64_t v19 = v16;
LABEL_34:
      id v9 = v47;
      goto LABEL_35;
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = v16;
  }
  else
  {
    id v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v45 = *(void *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = v45;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "flatbuffer file missing for namespace name:%@", buf, 0xCu);
    }

    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }

  if (*(unsigned char *)(a1 + 112)) {
    char v22 = v15;
  }
  else {
    char v22 = 0;
  }
  if (v22)
  {
    id v13 = 0;
    id v16 = v18;
LABEL_25:
    long long v28 = [*(id *)(a1 + 56) keyValueStore];
    uint64_t v29 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v28];

    if (v29)
    {
      uint64_t v30 = [v29 subscribedFactorsForNamespaceName:*(void *)(*(void *)(a1 + 32) + 48)];
    }
    else
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F1CBF0];
    }
    dispatch_semaphore_t v31 = +[TRIClientFactorPackUtils unlinkedOnDemandAssetsWithFactorPack:v13 flatbufferFactorLevels:v16 factorPackPath:v19 assetStore:*(void *)(a1 + 64) maProvider:*(void *)(a1 + 72) aliasToUnaliasMap:v48 subscribedFactors:v30 unlinkedMAAssetsOnDisk:*(void *)(a1 + 104)];
    __int16 v32 = v31;
    if (v31)
    {
      id v33 = [v31 cloudKit];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_468;
      v52[3] = &unk_1E6BBAB78;
      id v34 = v47;
      uint64_t v35 = *(void *)(a1 + 88);
      id v53 = v34;
      uint64_t v54 = v35;
      [v33 enumerateObjectsUsingBlock:v52];

      id v36 = [v32 mobileAsset];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2_469;
      v49[3] = &unk_1E6BBABA0;
      id v37 = v34;
      uint64_t v38 = *(void *)(a1 + 96);
      id v50 = v37;
      uint64_t v51 = v38;
      [v36 enumerateObjectsUsingBlock:v49];
    }
    else
    {
      uint64_t v39 = TRILogCategory_Server();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "Failed to enumerate unlinked on-demand assets", buf, 2u);
      }

      [*(id *)(a1 + 32) _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:*(void *)(a1 + 80) context:*(void *)(a1 + 56)];
      [*(id *)(a1 + 32) _addMetricForFetchOnDemandFactorsTaskError:8];
      uint64_t v40 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = 0;

      *a4 = 1;
    }

    goto LABEL_34;
  }
  id v16 = v18;
  id v9 = v47;
LABEL_19:
  id v23 = v19;
  uint64_t v19 = [*(id *)(a1 + 48) pathForFactorPackWithId:v6 namespaceName:*(void *)(*(void *)(a1 + 32) + 48)];

  uint64_t v24 = [*(id *)(a1 + 48) loadFactorPackWithId:v6 namespaceName:*(void *)(*(void *)(a1 + 32) + 48)];
  id v13 = (void *)v24;
  if (v19) {
    BOOL v25 = v24 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (!v25)
  {
    char v47 = v9;
    goto LABEL_25;
  }
  uint64_t v26 = *(void *)(*(void *)(a1 + 88) + 8);
  id v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = 0;

  *a4 = 1;
LABEL_35:
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 factorName];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 factorName];
    [v5 addObject:v6];

    id v7 = *(void **)(*(void *)(a1 + 40) + 136);
    id v8 = [v3 assetId];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9
      && ([v3 factorName],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v9 isEqual:v10],
          v10,
          (v11 & 1) == 0))
    {
      int v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v3 assetId];
        uint64_t v17 = [v3 factorName];
        int v18 = 138543874;
        uint64_t v19 = v16;
        __int16 v20 = 2114;
        id v21 = v9;
        __int16 v22 = 2114;
        id v23 = v17;
        _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Warning:same assetId %{public}@ with different factor names %{public}@ and %{public}@; ignoring the latter",
          (uint8_t *)&v18,
          0x20u);
      }
    }
    else
    {
      id v12 = [v3 factorName];
      id v13 = *(void **)(*(void *)(a1 + 40) + 136);
      id v14 = [v3 assetId];
      [v13 setObject:v12 forKeyedSubscript:v14];
    }
  }
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_468(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 factorName];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2_469(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 factorName];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)a1[4];
  id v11 = v3;
  id v5 = [v3 assetId];
  LOBYTE(v4) = [v4 hasAssetWithIdentifier:v5 type:0];

  if ((v4 & 1) == 0)
  {
    id v6 = (void *)a1[5];
    id v7 = [v11 assetId];
    [v6 addObject:v7];

    id v8 = [v11 metadata];
    LODWORD(v7) = [v8 type];

    if (v7 == 1)
    {
      id v9 = (void *)a1[6];
      uint64_t v10 = [v11 assetId];
      [v9 addObject:v10];
    }
  }
}

uint64_t __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_470(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasAssetWithIdentifier:a2 type:0];
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_474(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a5;
  switch(a2)
  {
    case 0:
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = 3;
      id v15 = 0;
      goto LABEL_5;
    case 1:
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = 4;
      id v15 = 0;
      id v16 = 0;
      goto LABEL_6;
    case 2:
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = 1;
      id v15 = v9;
LABEL_5:
      id v16 = v10;
LABEL_6:
      [v11 _completeTaskWithStatus:v14 earliestRetryDate:v15 error:v16 aggregateProgress:v12 context:v13];
      break;
    case 3:
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 72), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 1208, @"Unexpected TRIFetchStatus %tu", 3);

      break;
    case 4:
      if (v19) {
        int v18 = v19;
      }
      else {
        int v18 = (void *)MEMORY[0x1E4F1CC08];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v18);
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2_476(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_3_477(void *a1, uint64_t a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a3;
  [v5 removeObject:a2];
  id v7 = (void *)a1[5];
  id v8 = [v6 recordId];
  objc_msgSend(v7, "registerRecordId:withExpectedSize:", v8, objc_msgSend(v6, "downloadSize"));

  uint64_t v9 = [v6 downloadSize];
  *(void *)(*(void *)(a1[6] + 8) + 24) += v9;
}

- (id)_planForFetchingAssetsFromFactorPacksWithContext:(id)a3 assetDiffFetchPlan:(id)a4 requiredAssetIds:(id)a5 downloadOptions:(id)a6 updatingAggregateProgress:(id)a7
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v57 = a4;
  id v12 = a5;
  id v56 = a6;
  id v13 = a7;
  context = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Beginning plan for fetching assets from Asset records for use in factor packs.", buf, 2u);
  }

  v55 = [[TRIFetchOptions alloc] initWithDownloadOptions:v56 cacheDeleteAvailableSpaceClass:&unk_1F347B918];
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  v93 = buf;
  uint64_t v94 = 0x3032000000;
  id v95 = __Block_byref_object_copy__18;
  id v96 = __Block_byref_object_dispose__18;
  id v97 = 0;
  artifactProvider = self->_artifactProvider;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke;
  v85[3] = &unk_1E6BBAC68;
  void v85[4] = self;
  id v53 = v13;
  id v86 = v53;
  id v52 = v11;
  id v87 = v52;
  SEL v91 = a2;
  id v88 = v12;
  v90 = buf;
  uint64_t v54 = v15;
  id v89 = v54;
  id v58 = v88;
  uint64_t v17 = [(TRIArtifactProvider *)artifactProvider fetchRecordIdsForAssetsWithIds:v88 options:v55 completion:v85];
  lock = self->_lock;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_2;
  v83[3] = &unk_1E6BBA950;
  id v50 = v17;
  id v84 = v50;
  [(_PASLock *)lock runWithLockAcquired:v83];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v54];
  if (*((void *)v93 + 5))
  {
    id v19 = [v57 metadataForRequestedUnlinkedAssets];
    uint64_t v62 = +[TRIClientFactorPackUtils uniqueAssets:v19];

    uint64_t v79 = 0;
    id v80 = &v79;
    uint64_t v81 = 0x2020000000;
    uint64_t v82 = 0;
    __int16 v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v58, "count"));
    id v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v58, "count"));
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obj = v58;
    uint64_t v21 = [obj countByEnumeratingWithState:&v75 objects:v106 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v76 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v75 + 1) + 8 * i);
          BOOL v25 = [*((id *)v93 + 5) objectForKeyedSubscript:v24];
          if (!v25)
          {
            id v33 = [MEMORY[0x1E4F28B00] currentHandler];
            [v33 handleFailureInMethod:a2, self, @"TRIFetchOnDemandFactorsTask.m", 1308, @"Expression was unexpectedly nil/false: %@", @"recordIdsForAssetIds[assetId]" object file lineNumber description];
          }
          uint64_t v26 = [v20 objectForKeyedSubscript:v25];
          if (v26) {
            id v27 = (void *)v26;
          }
          else {
            id v27 = &unk_1F347B900;
          }
          long long v28 = [v62 cloudKit];
          uint64_t v29 = [v28 objectForKeyedSubscript:v24];

          if (!v29)
          {
            id v34 = [MEMORY[0x1E4F28B00] currentHandler];
            [v34 handleFailureInMethod:a2, self, @"TRIFetchOnDemandFactorsTask.m", 1313, @"Expression was unexpectedly nil/false: %@", @"uniquePlannedAssets.cloudKit[assetId]" object file lineNumber description];
          }
          uint64_t v30 = [v29 downloadSize];

          dispatch_semaphore_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v27, "unsignedLongLongValue") + v30);
          [v20 setObject:v31 forKeyedSubscript:v25];
          __int16 v32 = [[TRISizedCKRecordID alloc] initWithRecordId:v25 downloadSize:v30];
          [v61 setObject:v32 forKeyedSubscript:v24];

          v80[3] += v30;
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v75 objects:v106 count:16];
      }
      while (v21);
    }

    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_3;
    v73[3] = &unk_1E6BBAB28;
    id v35 = v53;
    id v74 = v35;
    [v20 enumerateKeysAndObjectsUsingBlock:v73];
    uint64_t v69 = 0;
    id v70 = &v69;
    uint64_t v71 = 0x2020000000;
    char v72 = 1;
    id v36 = [v62 mobileAsset];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_4;
    v63[3] = &unk_1E6BBAC90;
    uint64_t v67 = &v79;
    id v64 = v35;
    uint64_t v65 = self;
    id v66 = v52;
    uint64_t v68 = &v69;
    [v36 enumerateKeysAndObjectsUsingBlock:v63];

    if (*((unsigned char *)v70 + 24))
    {
      id v37 = TRILogCategory_Server();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = [v57 metadataForRequestedUnlinkedAssets];
        uint64_t v39 = [v38 cloudKit];
        uint64_t v40 = [v39 count];
        uint64_t v41 = [v57 metadataForRequestedUnlinkedAssets];
        uint64_t v42 = [v41 mobileAsset];
        uint64_t v43 = [v42 count];
        NSUInteger v44 = [(NSDictionary *)self->_assetIdsByFactorPack count];
        uint64_t v45 = [obj count];
        double v46 = (double)(unint64_t)v80[3];
        *(_DWORD *)id v98 = 134218752;
        uint64_t v99 = v43 + v40;
        __int16 v100 = 2048;
        NSUInteger v101 = v44;
        __int16 v102 = 2048;
        uint64_t v103 = v45;
        __int16 v104 = 2048;
        double v105 = v46 / 1000000.0;
        _os_log_impl(&dword_1DA291000, v37, OS_LOG_TYPE_DEFAULT, "Factor pack asset fetch planning phase complete.  On-demand fetch task will result in linking %lu assets into %tu factor pack(s); %tu assets require full (unpatched) asset download.  Total factor pack unpatched asset dow"
          "nload size: %.2f MB",
          v98,
          0x2Au);
      }
      char v47 = (void *)[v57 copyWithReplacementRecordIdsForNonDiffableAssetIds:v61];
    }
    else
    {
      char v47 = 0;
    }

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v79, 8);
  }
  else
  {
    char v47 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v47;
}

void __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v23 = a3;
  id v10 = a4;
  id v11 = a5;
  switch(a2)
  {
    case 0:
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 3;
      id v16 = 0;
      goto LABEL_5;
    case 1:
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 4;
      id v16 = 0;
      id v17 = 0;
      goto LABEL_6;
    case 2:
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 1;
      id v16 = v10;
LABEL_5:
      id v17 = v11;
LABEL_6:
      [v12 _completeTaskWithStatus:v15 earliestRetryDate:v16 error:v17 aggregateProgress:v13 context:v14];
      break;
    case 3:
      int v18 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 1276, @"Unexpected TRIFetchStatus %tu", 3);

      break;
    case 4:
      id v19 = v23;
      if (!v23)
      {
        uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 1280, @"Invalid parameter not satisfying: %@", @"innerRecordIdsForAssetIds" object file lineNumber description];

        id v19 = 0;
      }
      uint64_t v20 = [v19 count];
      if (v20 != [*(id *)(a1 + 56) count])
      {
        uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 1281, @"Invalid parameter not satisfying: %@", @"innerRecordIdsForAssetIds.count == requiredAssetIds.count" object file lineNumber description];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

uint64_t __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
}

void __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  [v5 unregisterRecordId:v9];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 unsignedLongLongValue];

  [v7 registerRecordId:v9 withExpectedSize:v8];
}

void __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [a3 downloadSize];
  if (!v8)
  {
    id location = 0;
    id v11 = objc_opt_new();
    id v12 = [v11 createAutoAssetWithId:v7 decryptionKey:0 error:&location];
    if (!v12)
    {
      id v19 = TRILogCategory_Server();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = (uint64_t)location;
        _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Failed to instantiate MAAutoAsset: %{public}@", buf, 0xCu);
      }

      [*(id *)(a1 + 40) _completeTaskWithStatus:3 earliestRetryDate:0 error:location aggregateProgress:*(void *)(a1 + 32) context:*(void *)(a1 + 48)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
      goto LABEL_25;
    }
    id v13 = location;
    id location = 0;

    id obj = location;
    id v32 = 0;
    uint64_t v14 = [v12 determineIfAvailableSync:@"determine Trial asset availability" withTimeout:30 discoveredAttributes:&v32 error:&obj];
    id v15 = v32;
    objc_storeStrong(&location, obj);
    if (v14)
    {
      id v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F77F28]];
      objc_msgSend(*(id *)(a1 + 32), "registerMAAsset:withExpectedSize:", v7, objc_msgSend(v16, "unsignedLongLongValue"));
      id v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v16 unsignedLongLongValue];
        *(_DWORD *)buf = 134218242;
        uint64_t v35 = v18;
        __int16 v36 = 2112;
        id v37 = v7;
        _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Registering MA asset with size: %llu for assetId: %@", buf, 0x16u);
      }

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v16 unsignedLongLongValue];
      goto LABEL_24;
    }
    if (location)
    {
      uint64_t v20 = [location domain];
      if ([v20 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
      {
        uint64_t v21 = [location code];

        if (v21 == 6105)
        {
          uint64_t v22 = TRILogCategory_Server();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v35 = (uint64_t)v12;
            _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Timeout while checking availability of MAAutoAsset %{public}@", buf, 0xCu);
          }

          id v23 = location;
          uint64_t v25 = *(void *)(a1 + 32);
          uint64_t v24 = *(void **)(a1 + 40);
          uint64_t v26 = *(void *)(a1 + 48);
          uint64_t v27 = 1;
LABEL_23:
          [v24 _completeTaskWithStatus:v27 earliestRetryDate:0 error:v23 aggregateProgress:v25 context:v26];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
          *a4 = 1;
LABEL_24:

LABEL_25:
          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    long long v28 = TRILogCategory_Server();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [*(id *)(*(void *)(a1 + 40) + 32) allKeys];
      uint64_t v30 = [v29 firstObject];
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = (uint64_t)v30;
      __int16 v36 = 2114;
      id v37 = v12;
      _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ requires unavailable MAAutoAsset: %{public}@", buf, 0x16u);
    }
    id v23 = location;
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v24 = *(void **)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v27 = 3;
    goto LABEL_23;
  }
  uint64_t v9 = v8;
  [*(id *)(a1 + 32) registerMAAsset:v7 withExpectedSize:v8];
  id v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v35 = v9;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Registering MA asset with size: %llu for assetId: %@", buf, 0x16u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v9;
LABEL_26:
}

- (void)_asyncFetchAssetsFromTreatmentRecordsWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 downloadOptions:(id)a7 group:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = a8;
  dispatch_group_t v19 = dispatch_group_create();
  *a6 = 0;
  uint64_t v20 = [v15 fetchPlansForTreatmentIds];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke;
  v37[3] = &unk_1E6BBAD08;
  dispatch_group_t v38 = v19;
  id v39 = v17;
  uint64_t v40 = self;
  id v21 = v16;
  id v41 = v21;
  id v22 = v14;
  id v42 = v22;
  SEL v44 = a2;
  id v23 = v15;
  id v43 = v23;
  uint64_t v45 = a6;
  id v24 = v17;
  uint64_t v25 = v19;
  [v20 enumerateKeysAndObjectsUsingBlock:v37];

  dispatch_group_enter(v18);
  uint64_t v26 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_2_502;
  block[3] = &unk_1E6BBAD30;
  block[4] = self;
  id v33 = v22;
  id v34 = v23;
  id v35 = v21;
  __int16 v36 = v18;
  uint64_t v27 = v18;
  id v28 = v21;
  id v29 = v23;
  id v30 = v22;
  dispatch_group_notify(v25, v26, block);
}

void __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v7 = [[TRIFetchOptions alloc] initWithDownloadOptions:*(void *)(a1 + 40) cacheDeleteAvailableSpaceClass:&unk_1F347B8E8];
  uint64_t v8 = *(void **)(*(void *)(a1 + 48) + 120);
  uint64_t v9 = [v6 assetIndexes];
  id v10 = [v6 recordId];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_2;
  v31[3] = &unk_1E6BBACB8;
  id v32 = *(id *)(a1 + 56);
  id v33 = v6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_3;
  v21[3] = &unk_1E6BBACE0;
  id v11 = *(void **)(a1 + 56);
  v21[4] = *(void *)(a1 + 48);
  id v22 = v11;
  id v23 = *(id *)(a1 + 64);
  id v24 = v33;
  id v12 = *(void **)(a1 + 72);
  uint64_t v29 = *(void *)(a1 + 80);
  id v25 = v5;
  id v26 = v12;
  uint64_t v27 = v7;
  uint64_t v30 = *(void *)(a1 + 88);
  id v28 = *(id *)(a1 + 32);
  id v13 = v7;
  id v14 = v5;
  id v15 = v33;
  id v16 = [v8 fetchAssetsWithIndexes:v9 fromTreatmentWithRecordId:v10 options:v13 progress:v31 completion:v21];

  id v17 = *(void **)(*(void *)(a1 + 48) + 128);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_500;
  v19[3] = &unk_1E6BBA950;
  id v20 = v16;
  id v18 = v16;
  [v17 runWithLockAcquired:v19];
}

void __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_2(uint64_t a1, double a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) recordId];
  [v3 setFractionCompleted:v4 forRecordId:a2];
}

void __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  switch(a2)
  {
    case 0:
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 3;
      id v16 = 0;
      goto LABEL_5;
    case 1:
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 4;
      goto LABEL_16;
    case 2:
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 1;
      id v16 = v10;
LABEL_5:
      id v17 = v11;
      goto LABEL_17;
    case 3:
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 96), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 1438, @"Unexpected TRIFetchStatus %tu", 3);
      goto LABEL_7;
    case 4:
      if (v9
        && (uint64_t v19 = [v9 count],
            [*(id *)(a1 + 56) assetIndexes],
            id v20 = objc_claimAutoreleasedReturnValue(),
            uint64_t v21 = [v20 count],
            v20,
            v19 == v21))
      {
        id v22 = *(void **)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 64);
        id v24 = [*(id *)(a1 + 72) metadataForRequestedUnlinkedAssets];
        id v25 = [v24 cloudKit];
        id v26 = [*(id *)(a1 + 80) downloadOptions];
        uint64_t v27 = [*(id *)(a1 + 48) paths];
        uint64_t v28 = *(void *)(a1 + 104);
        id v34 = 0;
        char v29 = [v22 _saveIndexedAssetURLs:v9 withTreatmentId:v23 usingAssetMetadata:v25 downloadOptions:v26 paths:v27 downloadSize:v28 error:&v34];
        id v18 = v34;

        if (v29 != 1)
        {
          if (v29 == 2)
          {
            uint64_t v30 = 1;
            [*(id *)(a1 + 32) setWasDeferred:1];
          }
          else
          {
            uint64_t v30 = 3;
          }
          [*(id *)(a1 + 32) _completeTaskWithStatus:v30 earliestRetryDate:0 error:v18 aggregateProgress:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
        }
LABEL_7:
      }
      else
      {
        dispatch_semaphore_t v31 = TRILogCategory_Server();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 48);
          uint64_t v33 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = v32;
          __int16 v37 = 2112;
          uint64_t v38 = v33;
          _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "No assets received after fetching on-demand factors for namespace %{public}@, treatment %@", buf, 0x16u);
        }

        id v12 = *(void **)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 48);
        uint64_t v15 = 3;
LABEL_16:
        id v16 = 0;
        id v17 = 0;
LABEL_17:
        [v12 _completeTaskWithStatus:v15 earliestRetryDate:v16 error:v17 aggregateProgress:v13 context:v14];
      }
LABEL_18:
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));

      return;
    default:
      goto LABEL_18;
  }
}

uint64_t __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_500(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
}

void __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_2_502(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _currentTaskStatus];
  int v3 = [v2 runStatus];

  if (!v3)
  {
    id v4 = [TRIClientTreatmentStorage alloc];
    id v5 = [*(id *)(v1 + 40) paths];
    id v6 = [(TRIClientTreatmentStorage *)v4 initWithPaths:v5];

    id v7 = [TRIFBClientTreatmentStorage alloc];
    uint64_t v8 = [*(id *)(v1 + 40) paths];
    uint64_t v30 = [(TRIFBClientTreatmentStorage *)v7 initWithPaths:v8];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = *(id *)(*(void *)(v1 + 32) + 24);
    uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v36;
      unint64_t v9 = 0x1E4F1C000uLL;
      uint64_t v32 = v1;
      char v29 = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v36 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id v12 = *(void **)(v1 + 32);
          uint64_t v13 = [*(id *)(v1 + 48) metadataForRequestedUnlinkedAssets];
          uint64_t v14 = [v13 cloudKit];
          uint64_t v15 = [v12 _assetIdsFromKeysInDictionary:v14];
          id v16 = (void *)MEMORY[0x1E016E7F0]();
          id v17 = objc_msgSend(objc_alloc(*(Class *)(v9 + 2768)), "initWithObjects:", *(void *)(*(void *)(v1 + 32) + 48), 0);
          id v18 = [(TRIClientTreatmentStorage *)v6 updateSavedTreatmentWithTreatmentId:v11 linkingNewAssetIds:v15 forNamespaceNames:v17];

          if (_os_feature_enabled_impl())
          {
            uint64_t v19 = *(void **)(v1 + 32);
            id v20 = [*(id *)(v1 + 48) metadataForRequestedUnlinkedAssets];
            uint64_t v21 = [v20 cloudKit];
            id v22 = [v19 _assetIdsFromKeysInDictionary:v21];
            uint64_t v23 = (void *)MEMORY[0x1E016E7F0]();
            id v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", *(void *)(*(void *)(v1 + 32) + 48), 0);
            id v25 = [(TRIFBClientTreatmentStorage *)v30 updateSavedTreatmentWithTreatmentId:v11 linkingNewAssetIds:v22 forNamespaceNames:v24];

            if ((v18 != 0) != (v25 != 0))
            {
              id v26 = TRILogCategory_Server();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v40 = v11;
                _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "updating treatments for treatmentid:%{public}@ from fb storage did not have same result as updating treatments from pb", buf, 0xCu);
              }
            }
            BOOL v27 = v25 != 0;
            if (_os_feature_enabled_impl()) {
              BOOL v28 = v27;
            }
            else {
              BOOL v28 = v18 != 0;
            }
            id v6 = v29;
            if (!v28)
            {
LABEL_21:
              uint64_t v1 = v32;
              [*(id *)(v32 + 32) _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:*(void *)(v32 + 56) context:*(void *)(v32 + 40)];
              [*(id *)(v32 + 32) _addMetricForFetchOnDemandFactorsTaskError:22];
              goto LABEL_22;
            }
          }
          else if (!v18)
          {
            goto LABEL_21;
          }
          unint64_t v9 = 0x1E4F1C000;
          uint64_t v1 = v32;
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 64));
}

- (id)_fetchDiffsFromAssetDiffRecordsWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 options:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x3032000000;
  id v64 = __Block_byref_object_copy__18;
  uint64_t v65 = __Block_byref_object_dispose__18;
  id v15 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v16 = [v12 recordIdsForDiffableAssetIds];
  id v66 = (id)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  artifactProvider = self->_artifactProvider;
  id v18 = [v12 recordIdsForDiffableAssetIds];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke;
  v55[3] = &unk_1E6BBAD58;
  id v56 = v13;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2;
  v51[3] = &unk_1E6BBADA8;
  id v52 = v12;
  id v53 = self;
  id v54 = v11;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_506;
  v47[3] = &unk_1E6BBADF8;
  id v48 = v52;
  v49 = self;
  id v50 = v54;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_509;
  v37[3] = &unk_1E6BBAE70;
  void v37[4] = self;
  id v19 = v56;
  id v38 = v19;
  id v20 = v50;
  SEL v45 = a2;
  id v39 = v20;
  id v43 = &v57;
  id v21 = v48;
  id v40 = v21;
  id v22 = v14;
  double v46 = a6;
  id v41 = v22;
  SEL v44 = &v61;
  uint64_t v23 = v32;
  uint64_t v42 = v23;
  id v24 = [(TRIArtifactProvider *)artifactProvider fetchDiffsWithRecordIds:v18 options:v22 perRecordProgress:v55 perRecordCompletionBlockOnSuccess:v51 perRecordCompletionBlockOnError:v47 completion:v37];

  lock = self->_lock;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_519;
  v35[3] = &unk_1E6BBA950;
  id v26 = v24;
  id v36 = v26;
  [(_PASLock *)lock runWithLockAcquired:v35];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v23];
  if (*((unsigned char *)v58 + 24))
  {
    id v27 = objc_alloc(MEMORY[0x1E4F1CA80]);
    BOOL v28 = [v21 recordIdsForDiffableAssetIds];
    char v29 = [v28 allKeys];
    uint64_t v30 = (void *)[v27 initWithArray:v29];

    [v30 minusSet:v62[5]];
  }
  else
  {
    uint64_t v30 = 0;
  }

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v30;
}

uint64_t __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFractionCompleted:forRecordId:", a2);
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) recordIdsForDiffableAssetIds];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_3;
  v9[3] = &unk_1E6BBAD80;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  unint64_t v9 = [a3 recordId];
  LODWORD(v8) = [v8 isEqual:v9];

  if (v8)
  {
    id v10 = [*(id *)(*(void *)(a1 + 40) + 136) objectForKeyedSubscript:v7];
    if (v10)
    {
      uint64_t v11 = *(void **)(a1 + 40);
      uint64_t v12 = v11[6];
      id v13 = [*(id *)(a1 + 48) client];
      [v11 _logOnDemandFactor:v10 metricName:@"on_demand_factor_downloaded_by_request" namespaceName:v12 client:v13 error:0];

      [*(id *)(a1 + 40) removeDownloadableFactorNames:v10];
    }
    else
    {
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v7;
        _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Missing factorname for diffable assetId %{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
    *a4 = 1;
  }
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_506(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) recordIdsForDiffableAssetIds];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2_507;
  v13[3] = &unk_1E6BBADD0;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  id v14 = v6;
  uint64_t v15 = v9;
  id v16 = v10;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2_507(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [a3 recordId];
  LODWORD(v8) = [v8 isEqual:v9];

  if (v8)
  {
    id v10 = [*(id *)(*(void *)(a1 + 40) + 136) objectForKeyedSubscript:v7];
    if (v10)
    {
      id v11 = *(void **)(a1 + 40);
      uint64_t v12 = v11[6];
      id v13 = [*(id *)(a1 + 48) client];
      [v11 _logOnDemandFactor:v10 metricName:@"on_demand_factor_failed_to_download_by_request" namespaceName:v12 client:v13 error:*(void *)(a1 + 56)];

      [*(id *)(a1 + 40) removeDownloadableFactorNames:v10];
    }
    else
    {
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v7;
        _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Missing factorname for diffable assetId %{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
    *a4 = 1;
  }
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_509(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  switch(a2)
  {
    case 0:
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 3;
      id v16 = 0;
      goto LABEL_5;
    case 1:
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 4;
      id v16 = 0;
      id v17 = 0;
      goto LABEL_6;
    case 2:
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 1;
      id v16 = v10;
LABEL_5:
      id v17 = v11;
LABEL_6:
      [v12 _completeTaskWithStatus:v15 earliestRetryDate:v16 error:v17 aggregateProgress:v13 context:v14];
      goto LABEL_11;
    case 3:
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 96), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 1585, @"Unexpected TRIFetchStatus %tu", 3);

      goto LABEL_11;
    case 4:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      if (v9
        && (uint64_t v19 = [v9 count],
            [*(id *)(a1 + 56) recordIdsForDiffableAssetIds],
            id v20 = objc_claimAutoreleasedReturnValue(),
            uint64_t v21 = [v20 count],
            v20,
            v19 == v21))
      {
        id v22 = [TRIAssetStore alloc];
        uint64_t v23 = [*(id *)(a1 + 48) paths];
        id v24 = [*(id *)(a1 + 64) downloadOptions];
        id v25 = [v24 activity];
        id v26 = [(TRIAssetStore *)v22 initWithPaths:v23 monitoredActivity:v25];

        id v27 = [*(id *)(a1 + 56) metadataForRequestedUnlinkedAssets];
        BOOL v28 = +[TRIClientFactorPackUtils uniqueAssets:v27];

        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2_510;
        v37[3] = &unk_1E6BBAE20;
        id v38 = v28;
        id v39 = v26;
        uint64_t v40 = *(void *)(a1 + 32);
        uint64_t v42 = *(void *)(a1 + 104);
        long long v41 = *(_OWORD *)(a1 + 88);
        char v29 = v26;
        id v30 = v28;
        [v9 enumerateKeysAndObjectsUsingBlock:v37];

LABEL_11:
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v44 = 1;
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_518;
        v36[3] = &unk_1E6BBAE48;
        v36[4] = buf;
        [v9 enumerateKeysAndObjectsUsingBlock:v36];
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
        _Block_object_dispose(buf, 8);
      }
      else
      {
        dispatch_semaphore_t v31 = TRILogCategory_Server();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = *(void *)(a1 + 32);
          uint64_t v33 = *(void *)(v32 + 48);
          uint64_t v34 = [*(id *)(v32 + 32) allKeys];
          long long v35 = [v34 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v33;
          *(_WORD *)&unsigned char buf[12] = 2114;
          *(void *)&buf[14] = v35;
          _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "No diffs received after fetching asset diffs for on-demand factors for namespace %{public}@, factor packs [%{public}@]", buf, 0x16u);
        }
      }

      return;
    default:
      goto LABEL_11;
  }
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2_510(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) cloudKit];
  id v6 = [v4 destAssetId];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v17 = 0;
    id v8 = *(void **)(a1 + 40);
    id v9 = [v4 destAssetId];
    id v10 = [v4 sourceAssetId];
    id v11 = [v4 diff];
    uint64_t v12 = [v11 path];

    if (!v12)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 48), @"TRIFetchOnDemandFactorsTask.m", 1602, @"Expression was unexpectedly nil/false: %@", @"artifact.diff.path" object file lineNumber description];
    }
    int v13 = [v8 saveAssetWithIdentifier:v9 builtFromAssetWithIdentifier:v10 patchFilename:v12 metadata:v7 error:&v17];

    if (v13)
    {
      **(void **)(a1 + 72) += [v4 diffSize];
      uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v15 = [v4 destAssetId];
      [v14 addObject:v15];
    }
  }
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_518(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v4 diff];
  id v16 = 0;
  char v7 = [v5 removeItemAtURL:v6 error:&v16];
  id v8 = v16;

  if ((v7 & 1) == 0)
  {
    id v9 = [v8 domain];
    id v10 = v9;
    if (v9 != (void *)*MEMORY[0x1E4F281F8])
    {

      goto LABEL_5;
    }
    uint64_t v11 = [v8 code];

    if (v11 != 4)
    {
LABEL_5:
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v13 = TRILogCategory_Server();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v14) {
          goto LABEL_11;
        }
      }
      else if (v14)
      {
LABEL_11:
        uint64_t v15 = [v4 diff];
        *(_DWORD *)buf = 138412546;
        id v18 = v15;
        __int16 v19 = 2114;
        id v20 = v8;
        _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Failed to clean up CK cached asset %@: %{public}@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

uint64_t __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_519(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
}

- (void)_asyncFetchCKAssetsFromAssetRecordsWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 options:(id)a7 group:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  __int16 v19 = a8;
  dispatch_group_enter(v19);
  *a6 = 0;
  artifactProvider = self->_artifactProvider;
  uint64_t v21 = [v16 recordIdsForNonDiffableAssetIds];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke;
  v48[3] = &unk_1E6BBAD58;
  id v49 = v17;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2;
  v44[3] = &unk_1E6BBADA8;
  id v45 = v16;
  double v46 = self;
  id v47 = v15;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_520;
  v40[3] = &unk_1E6BBADF8;
  id v41 = v45;
  uint64_t v42 = self;
  id v43 = v47;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_522;
  v32[3] = &unk_1E6BBAEC0;
  v32[4] = self;
  id v33 = v49;
  id v34 = v43;
  id v35 = v41;
  SEL v38 = a2;
  id v39 = a6;
  id v36 = v18;
  long long v37 = v19;
  id v22 = v19;
  id v23 = v18;
  id v24 = v41;
  id v25 = v43;
  id v26 = v49;
  id v27 = [(TRIArtifactProvider *)artifactProvider fetchAssetsWithRecordIds:v21 options:v23 perRecordProgress:v48 perRecordCompletionBlockOnSuccess:v44 perRecordCompletionBlockOnError:v40 completion:v32];

  lock = self->_lock;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_524;
  v30[3] = &unk_1E6BBA950;
  id v31 = v27;
  id v29 = v27;
  [(_PASLock *)lock runWithLockAcquired:v30];
}

uint64_t __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFractionCompleted:forRecordId:", a2);
}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) recordIdsForNonDiffableAssetIds];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_3;
  v9[3] = &unk_1E6BBAD80;
  uint64_t v6 = *(void *)(a1 + 40);
  char v7 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  id v9 = [a3 recordId];
  LODWORD(v8) = [v8 isEqual:v9];

  if (v8)
  {
    id v10 = [*(id *)(*(void *)(a1 + 40) + 136) objectForKeyedSubscript:v7];
    if (v10)
    {
      uint64_t v11 = *(void **)(a1 + 40);
      uint64_t v12 = v11[6];
      int v13 = [*(id *)(a1 + 48) client];
      [v11 _logOnDemandFactor:v10 metricName:@"on_demand_factor_downloaded_by_request" namespaceName:v12 client:v13 error:0];

      [*(id *)(a1 + 40) removeDownloadableFactorNames:v10];
    }
    else
    {
      BOOL v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v7;
        _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Missing factorname for assetId %{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
    *a4 = 1;
  }
}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_520(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) recordIdsForNonDiffableAssetIds];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2_521;
  v13[3] = &unk_1E6BBADD0;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  id v14 = v6;
  uint64_t v15 = v9;
  id v16 = v10;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];
}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2_521(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [a3 recordId];
  LODWORD(v8) = [v8 isEqual:v9];

  if (v8)
  {
    id v10 = [*(id *)(*(void *)(a1 + 40) + 136) objectForKeyedSubscript:v7];
    if (v10)
    {
      id v11 = *(void **)(a1 + 40);
      uint64_t v12 = v11[6];
      int v13 = [*(id *)(a1 + 48) client];
      [v11 _logOnDemandFactor:v10 metricName:@"on_demand_factor_failed_to_download_by_request" namespaceName:v12 client:v13 error:*(void *)(a1 + 56)];

      [*(id *)(a1 + 40) removeDownloadableFactorNames:v10];
    }
    else
    {
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v7;
        _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Missing factorname for assetId %{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
    *a4 = 1;
  }
}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_522(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  switch(a2)
  {
    case 0:
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 3;
      id v16 = 0;
      goto LABEL_5;
    case 1:
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 4;
      id v16 = 0;
      id v17 = 0;
      goto LABEL_6;
    case 2:
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = 1;
      id v16 = v10;
LABEL_5:
      id v17 = v11;
LABEL_6:
      [v12 _completeTaskWithStatus:v15 earliestRetryDate:v16 error:v17 aggregateProgress:v13 context:v14];
      break;
    case 3:
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIFetchOnDemandFactorsTask.m", 1709, @"Unexpected TRIFetchStatus %tu", 3);

      break;
    case 4:
      if (v9
        && (uint64_t v19 = [v9 count],
            [*(id *)(a1 + 56) recordIdsForNonDiffableAssetIds],
            id v20 = objc_claimAutoreleasedReturnValue(),
            uint64_t v21 = [v20 count],
            v20,
            v19 == v21))
      {
        id v22 = [*(id *)(a1 + 56) metadataForRequestedUnlinkedAssets];
        id v23 = +[TRIClientFactorPackUtils uniqueAssets:v22];

        id v24 = *(void **)(a1 + 32);
        id v25 = [v23 cloudKit];
        id v26 = [*(id *)(a1 + 64) downloadOptions];
        uint64_t v27 = *(void *)(a1 + 88);
        BOOL v28 = [*(id *)(a1 + 48) paths];
        id v38 = 0;
        char v29 = [v24 _saveNamedAssetURLs:v9 usingAssetMetadata:v25 downloadOptions:v26 downloadSize:v27 paths:v28 error:&v38];
        id v30 = v38;

        if (v29 != 1)
        {
          if (v29 == 2)
          {
            [*(id *)(a1 + 32) setWasDeferred:1];
            uint64_t v31 = 1;
          }
          else
          {
            uint64_t v31 = 3;
          }
          [*(id *)(a1 + 32) _completeTaskWithStatus:v31 earliestRetryDate:0 error:v30 aggregateProgress:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
        }
      }
      else
      {
        uint64_t v32 = TRILogCategory_Server();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = *(void *)(a1 + 32);
          uint64_t v34 = *(void *)(v33 + 48);
          id v35 = [*(id *)(v33 + 32) allKeys];
          id v36 = [v35 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&unsigned char buf[12] = 2114;
          *(void *)&buf[14] = v36;
          _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "No assets received after fetching on-demand factors for namespace %{public}@, factor packs [%{public}@]", buf, 0x16u);
        }
        [*(id *)(a1 + 32) _completeTaskWithStatus:3 earliestRetryDate:0 error:0 aggregateProgress:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
      }
      break;
    default:
      break;
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v40 = 1;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_523;
  v37[3] = &unk_1E6BBAE98;
  void v37[4] = buf;
  [v9 enumerateKeysAndObjectsUsingBlock:v37];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
  _Block_object_dispose(buf, 8);
}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_523(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v14];
  id v7 = v14;

  if ((v6 & 1) == 0)
  {
    id v8 = [v7 domain];
    id v9 = v8;
    if (v8 != (void *)*MEMORY[0x1E4F281F8])
    {

      goto LABEL_5;
    }
    uint64_t v10 = [v7 code];

    if (v10 != 4)
    {
LABEL_5:
      int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      uint64_t v12 = TRILogCategory_Server();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v11)
      {
        if (v13) {
          goto LABEL_11;
        }
      }
      else if (v13)
      {
LABEL_11:
        *(_DWORD *)buf = 138412546;
        id v16 = v4;
        __int16 v17 = 2114;
        id v18 = v7;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to clean up CK cached asset %@: %{public}@", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

uint64_t __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_524(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
}

- (void)_asyncFetchMAAssetsFromFactorPacksWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 options:(id)a7 group:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a8;
  *a6 = 0;
  id v16 = [a4 metadataForRequestedUnlinkedAssets];
  __int16 v17 = +[TRIClientFactorPackUtils uniqueAssets:v16];

  id v18 = [v17 mobileAsset];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    id v20 = objc_opt_new();
    uint64_t v21 = [v17 mobileAsset];
    taskAttributing = self->_taskAttributing;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __127__TRIFetchOnDemandFactorsTask__asyncFetchMAAssetsFromFactorPacksWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke;
    v27[3] = &unk_1E6BBAEE8;
    v27[4] = self;
    id v28 = v14;
    id v29 = v13;
    id v23 = [v20 downloadAssets:v21 attribution:taskAttributing aggregateProgress:v28 group:v15 completion:v27];

    if (v23)
    {
      lock = self->_lock;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __127__TRIFetchOnDemandFactorsTask__asyncFetchMAAssetsFromFactorPacksWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2;
      v25[3] = &unk_1E6BBA950;
      id v26 = v23;
      [(_PASLock *)lock runWithLockAcquired:v25];
    }
  }
  else
  {
    id v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "Fetch plan includes no MAAutoAssets.", buf, 2u);
    }
  }
}

void __127__TRIFetchOnDemandFactorsTask__asyncFetchMAAssetsFromFactorPacksWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  id v10 = a4;
  id v9 = a5;
  if (a3) {
    [*(id *)(a1 + 32) setWasDeferred:1];
  }
  if (a2 != 2) {
    [*(id *)(a1 + 32) _completeTaskWithStatus:a2 earliestRetryDate:v10 error:v9 aggregateProgress:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  }
}

uint64_t __127__TRIFetchOnDemandFactorsTask__asyncFetchMAAssetsFromFactorPacksWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
}

- (void)willBeCancelledByTaskQueue:(id)a3 withContext:(id)a4
{
}

void __70__TRIFetchOnDemandFactorsTask_willBeCancelledByTaskQueue_withContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a2 + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cancel", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_addMetricForFetchOnDemandFactorsTaskError:(int)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4FB05A8];
  uint64_t v5 = fetchTaskErrorAsString(a3);
  id v6 = [v4 metricWithName:@"fetchondemandfactorstask_error" categoricalValue:v5];

  [(TRIFetchOnDemandFactorsTask *)self _addMetric:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRIFetchOnDemandFactorsTask;
  if ([(TRIBaseTask *)&v16 isEqual:v4])
  {
    id v5 = v4;
    if (![(NSDictionary *)self->_assetIndexesByTreatment isEqualToDictionary:*((void *)v5 + 3)])goto LABEL_27; {
    id v6 = self->_experimentId;
    }
    long long v7 = (NSString *)*((id *)v5 + 20);
    if (v6 == v7)
    {
    }
    else
    {
      long long v8 = v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {
        char v10 = 0;
        goto LABEL_10;
      }
      BOOL v11 = [(NSString *)v6 isEqualToString:v7];

      if (!v11) {
        goto LABEL_27;
      }
    }
    if (![(NSDictionary *)self->_assetIdsByFactorPack isEqualToDictionary:*((void *)v5 + 4)]
      || ![(NSSet *)self->_rolloutFactorNames isEqual:*((void *)v5 + 5)])
    {
      goto LABEL_27;
    }
    id v6 = self->_deployment;
    uint64_t v12 = (NSString *)*((id *)v5 + 19);
    if (v6 == v12)
    {

      goto LABEL_22;
    }
    long long v8 = v12;
    char v10 = 0;
    if (v6 && v12)
    {
      char v13 = [(NSString *)v6 isEqualToDeployment:v12];

      if ((v13 & 1) == 0) {
        goto LABEL_27;
      }
LABEL_22:
      if ([(NSString *)self->_namespaceName isEqualToString:*((void *)v5 + 6)])
      {
        id v6 = self->_notificationKey;
        id v14 = (NSString *)*((id *)v5 + 9);
        if (v6 == v14)
        {
          char v10 = 1;
          long long v8 = v6;
        }
        else
        {
          long long v8 = v14;
          char v10 = 0;
          if (v6 && v14) {
            char v10 = [(NSString *)v6 isEqualToString:v14];
          }
        }
        goto LABEL_10;
      }
LABEL_27:
      char v10 = 0;
      goto LABEL_28;
    }
LABEL_10:

LABEL_28:
    goto LABEL_29;
  }
  char v10 = 0;
LABEL_29:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)self->_assetIndexesByTreatment hash];
  uint64_t v4 = [(NSDictionary *)self->_assetIdsByFactorPack hash] + 37 * v3;
  uint64_t v5 = [(NSSet *)self->_rolloutFactorNames hash] + 37 * v4;
  NSUInteger v6 = [(NSString *)self->_namespaceName hash] + 37 * v5;
  return [(NSString *)self->_notificationKey hash] + 37 * v6;
}

- (void)_addMetric:(id)a3
{
  id v8 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  metrics = v4->_metrics;
  if (!metrics)
  {
    uint64_t v6 = objc_opt_new();
    long long v7 = v4->_metrics;
    v4->_metrics = (NSMutableArray *)v6;

    metrics = v4->_metrics;
  }
  [(NSMutableArray *)metrics addObject:v8];
  objc_sync_exit(v4);
}

- (void)_addDimension:(id)a3
{
  id v8 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  dimensions = v4->_dimensions;
  if (!dimensions)
  {
    uint64_t v6 = objc_opt_new();
    long long v7 = v4->_dimensions;
    v4->_dimensions = (NSMutableArray *)v6;

    dimensions = v4->_dimensions;
  }
  [(NSMutableArray *)dimensions addObject:v8];
  objc_sync_exit(v4);
}

- (id)metrics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask gather metrics", buf, 2u);
  }

  uint64_t v4 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (v6->_metrics) {
    objc_msgSend(v5, "addObjectsFromArray:");
  }
  objc_sync_exit(v6);

  lock = v6->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__TRIFetchOnDemandFactorsTask_metrics__block_invoke;
  v13[3] = &unk_1E6BBA950;
  id v8 = v5;
  id v14 = v8;
  [(_PASLock *)lock runWithLockAcquired:v13];
  BOOL v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask metrics: %@", buf, 0xCu);
  }

  if ([v8 count]) {
    char v10 = v8;
  }
  else {
    char v10 = 0;
  }
  id v11 = v10;

  return v11;
}

void __38__TRIFetchOnDemandFactorsTask_metrics__block_invoke(uint64_t a1, void *a2)
{
  if (a2[4])
  {
    uint64_t v4 = a2;
    uint64_t v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask gather metrics for fetchError", v8, 2u);
    }

    uint64_t v6 = (void *)a2[4];
    long long v7 = TRIFetchErrorParseToMetrics(v6);
    if (v7) {
      [*(id *)(a1 + 32) addObjectsFromArray:v7];
    }
  }
}

- (id)dimensions
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableArray *)v2->_dimensions copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)trialSystemTelemetry
{
  return self->_trialSystemTelemetry;
}

- (void)_logOnDemandFactor:(id)a3 metricName:(id)a4 namespaceName:(id)a5 client:(id)a6 error:(id)a7
{
  id v30 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v14 && [v14 shouldLogAtLevel:20])
  {
    context = (void *)MEMORY[0x1E016E7F0]();
    id v16 = [MEMORY[0x1E4FB05A8] metricWithName:v12];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v16, 0);
    if (v15)
    {
      id v18 = TRIFetchErrorParseToMetrics(v15);
      if (v18)
      {
        [v17 addObjectsFromArray:v18];
      }
      else
      {
        uint64_t v19 = (void *)MEMORY[0x1E4FB05A8];
        id v20 = [v15 localizedDescription];
        uint64_t v21 = [v19 metricWithName:v20];
        [v17 addObject:v21];
      }
    }
    id v22 = [(TRIFetchOnDemandFactorsTask *)self trialSystemTelemetry];
    id v23 = (void *)[v22 copy];

    id v24 = [v23 ensureOnDemandFactorFields];
    [v24 setFactorName:v30];

    id v25 = [v23 ensureOnDemandFactorFields];
    [v25 setNamespaceName:v13];

    id v26 = [v14 logger];
    uint64_t v27 = [v14 trackingId];
    id v28 = [(TRIFetchOnDemandFactorsTask *)self dimensions];
    [v26 logWithTrackingId:v27 metrics:v17 dimensions:v28 trialSystemTelemetry:v23];
  }
}

- (id)_asPersistedTask
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  assetIndexesByTreatment = self->_assetIndexesByTreatment;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke;
  v21[3] = &unk_1E6BBAF38;
  id v6 = v4;
  id v22 = v6;
  [(NSDictionary *)assetIndexesByTreatment enumerateKeysAndObjectsUsingBlock:v21];
  [v3 setTreatmentAssetIndexesArray:v6];
  long long v7 = objc_opt_new();
  assetIdsByFactorPack = self->_assetIdsByFactorPack;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_3;
  uint64_t v19 = &unk_1E6BBAF88;
  id v9 = v7;
  id v20 = v9;
  [(NSDictionary *)assetIdsByFactorPack enumerateKeysAndObjectsUsingBlock:&v16];
  objc_msgSend(v3, "setFactorPackAssetIdsArray:", v9, v16, v17, v18, v19);
  char v10 = (void *)[(NSSet *)self->_rolloutFactorNames mutableCopy];
  [v3 setRolloutFactorNamesArray:v10];

  id v11 = [(TRITaskAttributing *)self->_taskAttributing asPersistedTaskAttribution];
  [v3 setTaskAttribution:v11];

  [v3 setNamespaceName:self->_namespaceName];
  [v3 setRetryCount:self->_retryCount];
  if (self->_notificationKey) {
    objc_msgSend(v3, "setNotificationKey:");
  }
  if (self->_experimentId) {
    objc_msgSend(v3, "setExperimentId:");
  }
  deployment = self->_deployment;
  if (deployment)
  {
    id v13 = [(TRIRolloutDeployment *)deployment rolloutId];
    [v3 setRolloutId:v13];

    objc_msgSend(v3, "setDeploymentId:", -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"));
  }
  id v14 = [(TRITaskCapabilityModifier *)self->_capabilityModifier asPersistedModifier];
  [v3 setCapabilityModifier:v14];

  return v3;
}

void __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = (void *)MEMORY[0x1E016E7F0]();
  id v8 = objc_opt_new();
  [v8 setTreatmentId:v5];
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB05F8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_2;
  v11[3] = &unk_1E6BBAF10;
  id v12 = v9;
  id v10 = v9;
  [v6 enumerateIndexesUsingBlock:v11];
  [v8 setIndexArray:v10];
  [*(id *)(a1 + 32) addObject:v8];
}

uint64_t __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addValue:a2];
}

void __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  long long v7 = objc_opt_new();
  [v7 setFactorPackId:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_4;
  v9[3] = &unk_1E6BBAF60;
  id v10 = v7;
  id v8 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  [*(id *)(a1 + 32) addObject:v8];
}

void __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = (id)objc_opt_new();
  uint64_t v4 = [v3 assetId];
  [v7 setAssetId:v4];

  id v5 = [v3 factorName];

  [v7 setFactorName:v5];
  id v6 = [*(id *)(a1 + 32) assetIdFactorNameArray];
  [v6 addObject:v7];
}

- (id)serialize
{
  uint64_t v4 = [(TRIFetchOnDemandFactorsTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIFetchOnDemandFactorsTask.m", 2028, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

- (void)setRetryCount:(int)a3
{
  self->_retryCount = a3;
}

- (int)retryCount
{
  return self->_retryCount;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v119 = 0;
  uint64_t v4 = +[TRIPBMessage parseFromData:v3 error:&v119];
  id v5 = v119;
  if (!v4)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v125 = v5;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchOnDemandFactorsPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_65;
  }
  if (([v4 hasNamespaceName] & 1) == 0)
  {
    id v64 = TRILogCategory_Server();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      id v74 = (objc_class *)objc_opt_class();
      long long v75 = NSStringFromClass(v74);
      *(_DWORD *)buf = 138412290;
      id v125 = v75;
      _os_log_error_impl(&dword_1DA291000, v64, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: namespaceName", buf, 0xCu);
    }
    id v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_65;
    }
    uint64_t v65 = (objc_class *)objc_opt_class();
    id v66 = NSStringFromClass(v65);
    *(_DWORD *)buf = 138412290;
    id v125 = v66;
    uint64_t v67 = "Cannot decode message of type %@ with missing field: namespaceName";
    goto LABEL_64;
  }
  id v6 = [v4 namespaceName];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v68 = (objc_class *)objc_opt_class();
      id v66 = NSStringFromClass(v68);
      *(_DWORD *)buf = 138412290;
      id v125 = v66;
      uint64_t v67 = "Cannot decode message of type %@ with field of length 0: namespaceName";
LABEL_64:
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v67, buf, 0xCu);
    }
LABEL_65:
    id v70 = 0;
    goto LABEL_66;
  }
  if (([v4 hasTaskAttribution] & 1) == 0)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v69 = (objc_class *)objc_opt_class();
      id v66 = NSStringFromClass(v69);
      *(_DWORD *)buf = 138412290;
      id v125 = v66;
      uint64_t v67 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_64;
    }
    goto LABEL_65;
  }
  id v97 = v3;
  id v8 = objc_opt_new();
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = [v4 treatmentAssetIndexesArray];
  uint64_t v9 = [obj countByEnumeratingWithState:&v115 objects:v123 count:16];
  id v99 = v5;
  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v116;
  id v95 = v4;
LABEL_7:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v116 != v11) {
      objc_enumerationMutation(obj);
    }
    id v13 = *(void **)(*((void *)&v115 + 1) + 8 * v12);
    id v14 = (void *)MEMORY[0x1E016E7F0]();
    id v15 = [v13 treatmentId];
    uint64_t v16 = [v15 length];

    if (!v16) {
      break;
    }
    if (!objc_msgSend(v13, "indexArray_Count"))
    {
      char v72 = TRILogCategory_Server();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v73 = "TRIFetchOnDemandFactorsPersistedTask contains empty index array";
LABEL_99:
        _os_log_error_impl(&dword_1DA291000, v72, OS_LOG_TYPE_ERROR, v73, buf, 2u);
      }
      goto LABEL_72;
    }
    uint64_t v17 = [v13 treatmentId];
    id v18 = [v8 objectForKeyedSubscript:v17];
    uint64_t v19 = v18;
    if (v18) {
      id v20 = v18;
    }
    else {
      id v20 = (id)objc_opt_new();
    }
    uint64_t v21 = v20;

    id v22 = [v13 indexArray];
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __45__TRIFetchOnDemandFactorsTask_parseFromData___block_invoke;
    v113[3] = &unk_1E6BB8EF0;
    id v114 = v21;
    id v23 = v21;
    [v22 enumerateValuesWithBlock:v113];

    id v24 = [v13 treatmentId];
    [v8 setObject:v23 forKeyedSubscript:v24];

    if (v10 == ++v12)
    {
      uint64_t v10 = [obj countByEnumeratingWithState:&v115 objects:v123 count:16];
      uint64_t v4 = v95;
      id v5 = v99;
      if (!v10)
      {
LABEL_17:

        id obj = (id)objc_opt_new();
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id v25 = [v4 factorPackAssetIdsArray];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v109 objects:v122 count:16];
        if (!v26)
        {
LABEL_51:

          uint64_t v59 = (void *)MEMORY[0x1E4F1CAD0];
          char v60 = [v4 rolloutFactorNamesArray];
          id v30 = [v59 setWithArray:v60];

          uint64_t v61 = [v4 taskAttribution];
          uint64_t v62 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v61];

          if (v62)
          {
            if ([v4 hasExperimentId])
            {
              uint64_t v63 = [v4 experimentId];
            }
            else
            {
              uint64_t v63 = 0;
            }
            id v3 = v97;
            uint64_t v94 = v63;
            if ([v4 hasRolloutId] && objc_msgSend(v4, "hasDeploymentId"))
            {
              id v77 = objc_alloc(MEMORY[0x1E4FB0228]);
              long long v78 = [v4 rolloutId];
              id v98 = objc_msgSend(v77, "initWithRolloutId:deploymentId:", v78, objc_msgSend(v4, "deploymentId"));
            }
            else
            {
              id v98 = 0;
            }
            if ([v4 hasNotificationKey])
            {
              uint64_t v79 = [v4 notificationKey];
            }
            else
            {
              uint64_t v79 = 0;
            }
            if ([v4 hasCapabilityModifier])
            {
              id v80 = [TRITaskCapabilityModifier alloc];
              uint64_t v81 = [v4 capabilityModifier];
              uint64_t v82 = [v81 add];
              id v83 = [v4 capabilityModifier];
              id v84 = -[TRITaskCapabilityModifier initWithAdd:remove:](v80, "initWithAdd:remove:", v82, [v83 remove]);
            }
            else
            {
              id v84 = (TRITaskCapabilityModifier *)objc_opt_new();
            }
            int v85 = [v4 namespaceName];
            long long v76 = v94;
            id v70 = +[TRIFetchOnDemandFactorsTask taskWithAssetIndexesByTreatment:v8 experimentId:v94 assetIdsByFactorPack:obj rolloutFactorNames:v30 rolloutDeployment:v98 namespaceName:v85 taskAttributing:v62 notificationKey:v79 capabilityModifier:v84];

            int v86 = [v4 hasRetryCount];
            if (v86) {
              int v86 = [v4 retryCount];
            }
            v70[16] = v86;

            id v5 = v99;
          }
          else
          {
            long long v76 = TRILogCategory_Server();
            id v3 = v97;
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1DA291000, v76, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
            }
            id v70 = 0;
          }

LABEL_96:
          goto LABEL_97;
        }
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v110;
        id v89 = v25;
        uint64_t v91 = *(void *)v110;
        id v3 = v97;
        while (2)
        {
          uint64_t v29 = 0;
          uint64_t v88 = v27;
LABEL_20:
          if (*(void *)v110 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = v25;
          uint64_t v90 = v29;
          uint64_t v31 = *(void **)(*((void *)&v109 + 1) + 8 * v29);
          uint64_t v32 = (void *)MEMORY[0x1E016E7F0]();
          uint64_t v33 = [v31 factorPackId];
          uint64_t v34 = TRIValidateFactorPackId();

          if (!v34) {
            goto LABEL_77;
          }
          v93 = (void *)v34;
          id v35 = [obj objectForKeyedSubscript:v34];
          id v36 = v35;
          context = v32;
          if (v35) {
            id v37 = v35;
          }
          else {
            id v37 = (id)objc_opt_new();
          }
          id v38 = v37;
          uint64_t v28 = v91;

          if (objc_msgSend(v31, "assetIdFactorNameArray_Count"))
          {
            uint64_t v39 = objc_msgSend(v31, "assetIdFactorNameArray_Count");
            long long v105 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            char v40 = [v31 assetIdFactorNameArray];
            uint64_t v41 = [v40 countByEnumeratingWithState:&v105 objects:v121 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v87 = v39;
              id v96 = v4;
              uint64_t v43 = *(void *)v106;
              while (2)
              {
                for (uint64_t i = 0; i != v42; ++i)
                {
                  if (*(void *)v106 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  id v45 = *(void **)(*((void *)&v105 + 1) + 8 * i);
                  double v46 = [v45 assetId];
                  id v47 = TRIValidateAssetId();

                  if (!v47)
                  {
                    uint64_t v4 = v96;
                    goto LABEL_75;
                  }
                  id v48 = objc_alloc(MEMORY[0x1E4FB0068]);
                  id v49 = [v45 factorName];
                  id v50 = (void *)[v48 initWithAssetId:v47 factorName:v49];
                  [v38 addObject:v50];
                }
                uint64_t v42 = [v40 countByEnumeratingWithState:&v105 objects:v121 count:16];
                if (v42) {
                  continue;
                }
                break;
              }
              uint64_t v4 = v96;
              goto LABEL_46;
            }
LABEL_47:
            id v25 = v30;
          }
          else
          {
            id v25 = v30;
            if (!objc_msgSend(v31, "assetIdArray_Count")) {
              goto LABEL_100;
            }
            uint64_t v39 = objc_msgSend(v31, "assetIdArray_Count");
            long long v101 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            char v40 = [v31 assetIdArray];
            uint64_t v51 = [v40 countByEnumeratingWithState:&v101 objects:v120 count:16];
            if (!v51) {
              goto LABEL_47;
            }
            uint64_t v52 = v51;
            uint64_t v87 = v39;
            id v53 = v4;
            uint64_t v54 = *(void *)v102;
            while (2)
            {
              for (uint64_t j = 0; j != v52; ++j)
              {
                if (*(void *)v102 != v54) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v56 = TRIValidateAssetId();
                if (!v56)
                {
                  uint64_t v4 = v53;
LABEL_75:
                  id v5 = v99;
                  id v30 = v89;
                  goto LABEL_76;
                }
                uint64_t v57 = (void *)v56;
                id v58 = (void *)[objc_alloc(MEMORY[0x1E4FB0068]) initWithAssetId:v56 factorName:0];
                [v38 addObject:v58];
              }
              uint64_t v52 = [v40 countByEnumeratingWithState:&v101 objects:v120 count:16];
              if (v52) {
                continue;
              }
              break;
            }
            uint64_t v4 = v53;
LABEL_46:
            id v5 = v99;
            id v25 = v89;
            uint64_t v28 = v91;
            uint64_t v39 = v87;
          }

          if (!v39)
          {
LABEL_100:
            id v30 = v25;
            char v40 = TRILogCategory_Server();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1DA291000, v40, OS_LOG_TYPE_ERROR, "TRIFetchOnDemandFactorsPersistedTask contains empty asset index array", buf, 2u);
            }
LABEL_76:
            uint64_t v32 = context;

LABEL_77:
            id v70 = 0;
            goto LABEL_96;
          }
          [obj setObject:v38 forKeyedSubscript:v93];

          uint64_t v29 = v90 + 1;
          if (v90 + 1 == v88)
          {
            uint64_t v27 = [v25 countByEnumeratingWithState:&v109 objects:v122 count:16];
            if (v27) {
              continue;
            }
            goto LABEL_51;
          }
          goto LABEL_20;
        }
      }
      goto LABEL_7;
    }
  }
  char v72 = TRILogCategory_Server();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v73 = "TRIFetchOnDemandFactorsPersistedTask contains empty treatmentId";
    goto LABEL_99;
  }
LABEL_72:
  uint64_t v4 = v95;
  id v3 = v97;
  id v5 = v99;

  id v70 = 0;
LABEL_97:

LABEL_66:
  return v70;
}

uint64_t __45__TRIFetchOnDemandFactorsTask_parseFromData___block_invoke(uint64_t a1, unsigned int a2)
{
  return [*(id *)(a1 + 32) addIndex:a2];
}

- (unint64_t)requiredCapabilities
{
  id v3 = [(TRITaskAttributing *)self->_taskAttributing networkOptions];
  uint64_t v4 = [v3 requiredCapability];
  v7.receiver = self;
  v7.super_class = (Class)TRIFetchOnDemandFactorsTask;
  unint64_t v5 = [(TRIBaseTask *)&v7 requiredCapabilities] | v4 | (4 * (self->_retryCount > 0));

  return [(TRITaskCapabilityModifier *)self->_capabilityModifier updateCapability:v5];
}

- (NSString)description
{
  id v3 = [(TRITaskAttributing *)self->_taskAttributing networkOptions];
  uint64_t v4 = [v3 discretionaryBehavior];
  unint64_t v5 = @"disc";
  if (!v4) {
    unint64_t v5 = @"non-disc";
  }
  id v6 = v5;

  objc_super v7 = NSString;
  uint64_t v8 = objc_opt_class();
  namespaceName = self->_namespaceName;
  notificationKey = self->_notificationKey;
  uint64_t v11 = [(TRITaskAttributing *)self->_taskAttributing applicationBundleIdentifier];
  uint64_t v12 = [(NSSet *)self->_rolloutFactorNames anyObject];
  id v13 = [v7 stringWithFormat:@"<%@:%@,%@,a:%@,d:%@,f:%@,r:%d>", v8, namespaceName, notificationKey, v11, v6, v12, -[TRIFetchOnDemandFactorsTask retryCount](self, "retryCount")];

  return (NSString *)v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchOnDemandFactorsTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchOnDemandFactorsTask;
  unint64_t v5 = [(TRIFetchOnDemandFactorsTask *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      objc_super v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
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
    [v6 handleFailureInMethod:a2, self, @"TRIFetchOnDemandFactorsTask.m", 2158, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  unint64_t v5 = [(TRIFetchOnDemandFactorsTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (TRIRolloutDeployment)deployment
{
  return self->_deployment;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_factorNameByAssetId, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_artifactProvider, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_trialSystemTelemetry, 0);
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_notificationKey, 0);
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_rolloutFactorNames, 0);
  objc_storeStrong((id *)&self->_assetIdsByFactorPack, 0);
  objc_storeStrong((id *)&self->_assetIndexesByTreatment, 0);
}

@end