@interface TRICacheDeleteCallbacks
+ (id)_assetPurger:(id)a3 experimentDatabase:(id)a4 rolloutDatabase:(id)a5 taskQueue:(id)a6 loggingClient:(id)a7;
+ (void)registerCallbacksWithPaths:(id)a3 experimentDatabase:(id)a4 rolloutDatabase:(id)a5 taskQueue:(id)a6 loggingClient:(id)a7;
- (BOOL)_trialVolumeIsEqualToVolume:(id)a3;
- (TRICacheDeleteCallbacks)initWithPaths:(id)a3 assetPurger:(id)a4 loggingClient:(id)a5;
- (id)purge:(id)a3 urgency:(int)a4;
- (id)purgeable:(id)a3 urgency:(int)a4;
- (void)_logPurgedAmountTelemetry:(int)a3 purgedAmountInBytes:(id)a4;
- (void)cancel:(id)a3;
@end

@implementation TRICacheDeleteCallbacks

- (BOOL)_trialVolumeIsEqualToVolume:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  paths = self->_paths;
  id v5 = a3;
  v6 = [(TRIPaths *)paths trialVolume];
  v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v6) {
      v8 = v6;
    }
    else {
      v8 = @"nil";
    }
    int v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_INFO, "Found the following trial directory volume: %@", (uint8_t *)&v15, 0xCu);
  }

  v9 = [(TRIPaths *)self->_paths volumeForDirectory:v5];

  v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9) {
      v11 = v9;
    }
    else {
      v11 = @"nil";
    }
    int v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_INFO, "Found the following cache delete requested volume: %@", (uint8_t *)&v15, 0xCu);
  }

  if (!v6 || !v9)
  {
    v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Invalid trial or cache delete requested volume", (uint8_t *)&v15, 2u);
    }
    goto LABEL_19;
  }
  if (([(__CFString *)v9 isEqualToString:v6] & 1) == 0)
  {
    v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Cache delete request for %@ does not match expected volume %@", (uint8_t *)&v15, 0x16u);
    }
LABEL_19:

    BOOL v12 = 0;
    goto LABEL_20;
  }
  BOOL v12 = 1;
LABEL_20:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingClient, 0);
  objc_storeStrong((id *)&self->_assetPurger, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (id)purgeable:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E016E7F0]();
  v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Purgeable CacheDelete callback invoked", buf, 2u);
  }

  v9 = [(TRIPaths *)self->_paths localTempDir];
  +[TRITempDirScopeGuard ifUnreferencedCleanupPath:v9];

  v10 = [v6 triObjectForExpectedKey:@"CACHE_DELETE_VOLUME"];
  if ([(TRICacheDeleteCallbacks *)self _trialVolumeIsEqualToVolume:v10])
  {
    v11 = [MEMORY[0x1E4FB0210] purgeabilityLevelFromCacheDeleteUrgency:v4];
    BOOL v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[TRIAssetPurging purgeableAssetSizeForPurgeabilityLevel:](self->_assetPurger, "purgeableAssetSizeForPurgeabilityLevel:", objc_msgSend(v11, "unsignedIntValue")));
    }
    else
    {
      v13 = &unk_1F347B600;
    }
  }
  else
  {
    v13 = &unk_1F347B600;
  }
  v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v13;
    __int16 v21 = 1024;
    int v22 = v4;
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Trial CacheDelete service found %@ bytes to be purgeable at CacheDeleteUrgency %d", buf, 0x12u);
  }

  if (v10)
  {
    v17[0] = @"CACHE_DELETE_VOLUME";
    v17[1] = @"CACHE_DELETE_AMOUNT";
    v18[0] = v10;
    v18[1] = v13;
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

- (TRICacheDeleteCallbacks)initWithPaths:(id)a3 assetPurger:(id)a4 loggingClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRICacheDeleteCallbacks;
  BOOL v12 = [(TRICacheDeleteCallbacks *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paths, a3);
    objc_storeStrong((id *)&v13->_assetPurger, a4);
    objc_storeStrong((id *)&v13->_loggingClient, a5);
  }

  return v13;
}

- (id)purge:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E016E7F0]();
  v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Purge CacheDelete callback invoked", buf, 2u);
  }

  uint64_t v9 = [v6 triObjectForExpectedKey:@"CACHE_DELETE_VOLUME"];
  id v10 = (void *)v9;
  id v11 = &stru_1F3455898;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  BOOL v12 = v11;

  uint64_t v13 = [v6 triObjectForExpectedKey:@"CACHE_DELETE_AMOUNT"];
  v14 = (void *)v13;
  objc_super v15 = &unk_1F347B600;
  if (v13) {
    v16 = (void *)v13;
  }
  else {
    v16 = &unk_1F347B600;
  }
  id v17 = v16;

  if ([(TRICacheDeleteCallbacks *)self _trialVolumeIsEqualToVolume:v12])
  {
    v18 = [MEMORY[0x1E4FB0210] purgeabilityLevelFromCacheDeleteUrgency:v4];
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v20 = [v18 unsignedIntValue];
      objc_super v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[TRIAssetPurging purgeAssetsForPurgeabilityLevel:requestedPurgeAmount:](self->_assetPurger, "purgeAssetsForPurgeabilityLevel:requestedPurgeAmount:", v20, (int)objc_msgSend(v17, "intValue")));
      if ([v15 unsignedLongLongValue]) {
        [(TRICacheDeleteCallbacks *)self _logPurgedAmountTelemetry:v20 purgedAmountInBytes:v15];
      }
    }
  }
  __int16 v21 = TRILogCategory_Server();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v15;
    __int16 v28 = 1024;
    int v29 = v4;
    _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "Trial CacheDelete service purged %@ bytes at CacheDeleteUrgency %d", buf, 0x12u);
  }

  v24[0] = @"CACHE_DELETE_VOLUME";
  v24[1] = @"CACHE_DELETE_AMOUNT";
  v25[0] = v12;
  v25[1] = v15;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

  return v22;
}

- (void)_logPurgedAmountTelemetry:(int)a3 purgedAmountInBytes:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = [v7 ensureAssetPurgeFields];
  [v7 setAssetPurgeFields:v8];

  uint64_t v9 = [MEMORY[0x1E4FB0628] assetPurgeFieldsPurgeabilityLevelFromPurgeabilityLevel:v4];
  id v10 = [v7 assetPurgeFields];
  [v10 setPurgeabilityLevel:v9];

  id v11 = (void *)MEMORY[0x1E4FB05A8];
  int v12 = [v6 intValue];

  uint64_t v13 = [v11 metricWithName:@"total_purged_asset_size" integerValue:v12];
  v14 = [(TRIClient *)self->_loggingClient logger];
  objc_super v15 = [(TRIClient *)self->_loggingClient trackingId];
  v17[0] = v13;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v14 logWithTrackingId:v15 metrics:v16 dimensions:0 trialSystemTelemetry:v7];
}

- (void)cancel:(id)a3
{
  v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_debug_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEBUG, "Cancel CacheDelete callback invoked", v4, 2u);
  }
}

+ (void)registerCallbacksWithPaths:(id)a3 experimentDatabase:(id)a4 rolloutDatabase:(id)a5 taskQueue:(id)a6 loggingClient:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke;
  v31[3] = &unk_1E6BB96C0;
  id v32 = v12;
  id v33 = v13;
  id v34 = v14;
  id v35 = v15;
  id v36 = v16;
  id v37 = a1;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  int v22 = (void *)MEMORY[0x1E016EA80](v31);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke_2;
  v29[3] = &unk_1E6BB96E8;
  id v23 = v22;
  id v30 = v23;
  v24 = (void *)MEMORY[0x1E016EA80](v29);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke_3;
  v27[3] = &unk_1E6BB96E8;
  id v28 = v23;
  id v25 = v23;
  v26 = (void *)MEMORY[0x1E016EA80](v27);
  CacheDeleteRegisterInfoCallbacks();
}

TRICacheDeleteCallbacks *__113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 72) _assetPurger:*(void *)(a1 + 32) experimentDatabase:*(void *)(a1 + 40) rolloutDatabase:*(void *)(a1 + 48) taskQueue:*(void *)(a1 + 56) loggingClient:*(void *)(a1 + 64)];
  v3 = [[TRICacheDeleteCallbacks alloc] initWithPaths:*(void *)(a1 + 32) assetPurger:v2 loggingClient:*(void *)(a1 + 64)];

  return v3;
}

id __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void (**)(uint64_t))(v4 + 16);
  id v6 = a3;
  v7 = v5(v4);
  v8 = [v7 purgeable:v6 urgency:a2];

  id v9 = v8;
  return v9;
}

id __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void (**)(uint64_t))(v4 + 16);
  id v6 = a3;
  v7 = v5(v4);
  v8 = [v7 purge:v6 urgency:a2];

  id v9 = v8;
  return v9;
}

+ (id)_assetPurger:(id)a3 experimentDatabase:(id)a4 rolloutDatabase:(id)a5 taskQueue:(id)a6 loggingClient:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v23 = [[TRIAssetStore alloc] initWithPaths:v15];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4FB00C0]) initWithPaths:v15];
  id v17 = [[TRIPurgeableNamespacesProvider alloc] initWithPaths:v15 clientNamespaceMetadataStorage:v16];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4FB01D0]) initWithPaths:v15];
  id v19 = [[TRIPurgeableOnDemandFactorsEnumerator alloc] initWithPaths:v15 namespaceResolver:v18];
  id v20 = [[TRIPurgeableExperimentAndRolloutProvider alloc] initWithPaths:v15 experimentDatabase:v14 rolloutDatabase:v13];

  id v21 = [[TRIAssetPurger alloc] initWithPaths:v15 assetStore:v23 purgeableNamespacesProvider:v17 purgeableFactorPacksEnumerator:v19 purgeableExperimentAndRolloutProvider:v20 taskQueue:v12 loggingClient:v11];
  return v21;
}

@end