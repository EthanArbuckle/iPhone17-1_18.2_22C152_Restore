@interface TRIClientTreatmentStorage
+ (id)relPathForMAReferenceWithFactorName:(id)a3;
- (BOOL)_deleteOnDemandAssetsWithFactorNames:(id)a3 treatment:(id)a4 namespace:(id)a5 forRollouts:(BOOL)a6 inUseAssetDeletionBehavior:(unsigned __int8)a7;
- (BOOL)_linkAssetsUpdatingTreatment:(id)a3;
- (BOOL)_linkAssetsWithIds:(id)a3 updatingTreatment:(id)a4;
- (BOOL)_removeFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4;
- (BOOL)_removeFactorsWithURL:(id)a3;
- (BOOL)_removeRolloutWithDescriptor:(id)a3 descriptorDir:(id)a4 treatmentLayer:(unint64_t)a5 namespaceName:(id)a6;
- (BOOL)_resolveAssetPathsInTreatment:(id)a3 usingReferenceURL:(id)a4;
- (BOOL)_saveNamespacePartitionedTreatmentsForTreatment:(id)a3 forNamespaceNames:(id)a4 forRollouts:(BOOL)a5;
- (BOOL)_savePersistedTreatment:(id)a3;
- (BOOL)removeTreatmentFromLayer:(unint64_t)a3 withNamespaceName:(id)a4 upgradeNCVs:(id)a5;
- (BOOL)removeTreatmentWithTreatmentId:(id)a3;
- (BOOL)removeUnreferencedTreatmentsWithRemovedCount:(unsigned int *)a3;
- (TRIClientTreatmentStorage)initWithPaths:(id)a3;
- (TRIClientTreatmentStorage)initWithPaths:(id)a3 extractor:(id)a4;
- (id)_assetURLForFactor:(id)a3 treatmentId:(id)a4;
- (id)_baseUrlForTreatment:(id)a3 namespaceName:(id)a4;
- (id)_collectTreatments;
- (id)_copyFileFromURL:(id)a3 to:(id)a4;
- (id)_defaultsAssetURLForFactor:(id)a3;
- (id)_linkAssetWithId:(id)a3 treatmentId:(id)a4 assetStore:(id)a5 factor:(id)a6 forRollouts:(BOOL)a7;
- (id)loadTreatmentWithTreatmentId:(id)a3 isFilePresent:(BOOL *)a4;
- (id)saveTreatment:(id)a3;
- (id)updateSavedTreatmentWithTreatmentId:(id)a3 deletingAssetsWithFactorNames:(id)a4 forNamespaceName:(id)a5 forRollouts:(BOOL)a6;
- (id)updateSavedTreatmentWithTreatmentId:(id)a3 deletingAssetsWithFactorNames:(id)a4 forNamespaceName:(id)a5 forRollouts:(BOOL)a6 inUseAssetDeletionBehavior:(unsigned __int8)a7;
- (id)updateSavedTreatmentWithTreatmentId:(id)a3 linkingNewAssetIds:(id)a4 forNamespaceNames:(id)a5;
- (id)urlForDefaultFactorsWithNamespaceName:(id)a3;
- (id)urlForFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4;
- (id)urlForTreatmentWithTreatmentId:(id)a3;
@end

@implementation TRIClientTreatmentStorage

- (TRIClientTreatmentStorage)initWithPaths:(id)a3
{
  id v4 = a3;
  v5 = [[TRIRemoteAssetExtractor alloc] initWithMonitoredActivity:0];
  v6 = [(TRIClientTreatmentStorage *)self initWithPaths:v4 extractor:v5];

  return v6;
}

- (TRIClientTreatmentStorage)initWithPaths:(id)a3 extractor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIClientTreatmentStorage;
  v9 = [(TRIClientTreatmentStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

- (id)loadTreatmentWithTreatmentId:(id)a3 isFilePresent:(BOOL *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E016E7F0]();
  if (a4) {
    *a4 = 1;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v9 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v6];
  id v32 = 0;
  v10 = (void *)[v8 initWithContentsOfURL:v9 options:1 error:&v32];
  id v11 = v32;

  if (v10)
  {

    id v31 = 0;
    objc_super v12 = +[TRIPBMessage parseFromData:v10 error:&v31];
    id v11 = v31;
    if (v12)
    {
      if ([v12 hasTreatment])
      {
        v13 = [v12 treatment];
        if ([v13 hasTreatmentId]
          && ([v13 treatmentId],
              v14 = objc_claimAutoreleasedReturnValue(),
              uint64_t v15 = [v14 length],
              v14,
              v15))
        {
          v16 = [v13 treatmentId];
          char v17 = [v6 isEqualToString:v16];

          if (v17)
          {
            v13 = v13;
            v18 = v13;
LABEL_26:

            goto LABEL_27;
          }
          v26 = TRILogCategory_Server();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          v28 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v6];
          v29 = [v13 treatmentId];
          *(_DWORD *)buf = 138412802;
          id v34 = v28;
          __int16 v35 = 2112;
          id v36 = v6;
          __int16 v37 = 2112;
          id v38 = v29;
          _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "TRIClientTreatment at %@ has mismatched treatmentId (exp: %@, act: %@)", buf, 0x20u);
        }
        else
        {
          v26 = TRILogCategory_Server();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
LABEL_24:

            goto LABEL_25;
          }
          v28 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v6];
          *(_DWORD *)buf = 138412290;
          id v34 = v28;
          _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "TRIPersistedTreatment has TRIClientTreatment with nil or empty treatmentId: %@", buf, 0xCu);
        }

        goto LABEL_24;
      }
      v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v21 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v6];
        *(_DWORD *)buf = 138412290;
        id v34 = v21;
        v22 = "TRIPersistedTreatment has missing treatment: %@";
        v23 = v13;
        uint32_t v24 = 12;
        goto LABEL_16;
      }
    }
    else
    {
      v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v21 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v6];
        *(_DWORD *)buf = 138412546;
        id v34 = v21;
        __int16 v35 = 2114;
        id v36 = v11;
        v22 = "Unable to parse TRIPersistedTreatment from %@: %{public}@";
        v23 = v13;
        uint32_t v24 = 22;
LABEL_16:
        _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      }
    }
LABEL_25:
    v18 = 0;
    goto LABEL_26;
  }
  v19 = [v11 domain];
  v20 = v19;
  if (v19 == (void *)*MEMORY[0x1E4F281F8])
  {
    uint64_t v25 = [v11 code];

    if (a4 && v25 == 260) {
      *a4 = 0;
    }
  }
  else
  {
  }
  objc_super v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v30 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v6];
    *(_DWORD *)buf = 138412802;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v30;
    __int16 v37 = 2114;
    id v38 = v11;
    _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Unable to read treatment with ID %@ from %@: %{public}@", buf, 0x20u);
  }
  v18 = 0;
LABEL_27:

  return v18;
}

- (id)saveTreatment:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E016E7F0]();
  if (![v4 hasTreatmentId]
    || ([v4 treatmentId],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        !v7))
  {
    __int16 v37 = TRILogCategory_Server();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v37, OS_LOG_TYPE_ERROR, "TRIClientTreatmentArtifact has nil or empty treatmentId", buf, 2u);
    }

    id v36 = 0;
    goto LABEL_42;
  }
  id v8 = (void *)[v4 copy];

  if (!objc_msgSend(v8, "factorLevelArray_Count")) {
    goto LABEL_34;
  }
  v41 = self;
  v42 = v5;
  context = (void *)MEMORY[0x1E016E7F0]();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = [v8 factorLevelArray];
  uint64_t v46 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  v10 = 0;
  if (!v46) {
    goto LABEL_33;
  }
  uint64_t v45 = *(void *)v48;
  *(void *)&long long v9 = 138543362;
  long long v39 = v9;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v48 != v45) {
        objc_enumerationMutation(obj);
      }
      objc_super v12 = v8;
      v13 = *(void **)(*((void *)&v47 + 1) + 8 * v11);
      if (!v10)
      {
        v14 = [*(id *)(*((void *)&v47 + 1) + 8 * v11) factor];
        uint64_t v15 = [v14 namespaceName];
        v10 = +[TRIClientFactorPackUtils aliasesInNamespace:v15];
      }
      v16 = objc_msgSend(v13, "factor", v39);
      char v17 = [v16 name];
      v18 = [v10 objectForKeyedSubscript:v17];
      v19 = v18;
      if (!v18)
      {
        v44 = [v13 factor];
        self = [v44 name];
        v19 = self;
      }
      v20 = [v13 factor];
      [v20 setName:v19];

      if (!v18)
      {
      }
      id v8 = v12;
      if ([v13 hasLevel])
      {
        v21 = [v13 level];
        v22 = [v21 fileOrDirectoryLevelWithIsDir:0];

        if ([v12 hasTreatmentId])
        {
          if ([v22 hasAsset])
          {
            v23 = [v22 asset];
            char v24 = [v23 hasTreatmentId];

            if ((v24 & 1) == 0)
            {
              uint64_t v25 = TRILogCategory_Server();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                id v31 = [v12 treatmentId];
                id v32 = [v13 factor];
                v33 = [v32 name];
                *(_DWORD *)buf = 138412546;
                v52 = v31;
                __int16 v53 = 2114;
                v54 = v33;
                _os_log_debug_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEBUG, "Populating treatmentId %@ on asset for \"%{public}@\"", buf, 0x16u);

                id v8 = v12;
              }

              v26 = [v8 treatmentId];
              v27 = [v22 asset];
              [v27 setTreatmentId:v26];
            }
          }
        }
        if ([v8 hasTreatmentId] && objc_msgSend(v22, "hasAsset"))
        {
          v28 = [v22 asset];
          if ([v28 hasCloudKitContainer]) {
            goto LABEL_29;
          }
          int v29 = [v22 isOnDemand];

          if (v29)
          {
            v30 = TRILogCategory_Server();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              id v34 = [v13 factor];
              __int16 v35 = [v34 name];
              *(_DWORD *)buf = v39;
              v52 = v35;
              _os_log_debug_impl(&dword_1DA291000, v30, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\"", buf, 0xCu);
            }
            v28 = [v22 asset];
            [v28 setCloudKitContainer:1];
LABEL_29:
          }
        }
      }
      ++v11;
    }
    while (v46 != v11);
    uint64_t v46 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  }
  while (v46);
LABEL_33:

  self = v41;
  v5 = v42;
LABEL_34:
  if ([(TRIClientTreatmentStorage *)self _linkAssetsUpdatingTreatment:v8]
    && [(TRIClientTreatmentStorage *)self _saveNamespacePartitionedTreatmentsForTreatment:v8 forNamespaceNames:0 forRollouts:0]&& [(TRIClientTreatmentStorage *)self _savePersistedTreatment:v8])
  {
    id v4 = v8;
    id v36 = v4;
  }
  else
  {
    id v36 = 0;
    id v4 = v8;
  }
LABEL_42:

  return v36;
}

- (id)updateSavedTreatmentWithTreatmentId:(id)a3 linkingNewAssetIds:(id)a4 forNamespaceNames:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E016E7F0]();
  char v19 = 0;
  objc_super v12 = [(TRIClientTreatmentStorage *)self loadTreatmentWithTreatmentId:v8 isFilePresent:&v19];
  if (v12)
  {
    v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v9 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_debug_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEBUG, "Merging %tu assets for treatment %@.", buf, 0x16u);
    }

    if ([(TRIClientTreatmentStorage *)self _linkAssetsWithIds:v9 updatingTreatment:v12]&& [(TRIClientTreatmentStorage *)self _saveNamespacePartitionedTreatmentsForTreatment:v12 forNamespaceNames:v10 forRollouts:0]&& [(TRIClientTreatmentStorage *)self _savePersistedTreatment:v12])
    {
      id v14 = v12;
      goto LABEL_13;
    }
  }
  else if (!v19)
  {
    uint64_t v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v8];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = (uint64_t)v18;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "updateSavedTreatmentWithTreatmentId failed because preexisting treatment is not present: %@", buf, 0xCu);
    }
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)_linkAssetsWithIds:(id)a3 updatingTreatment:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v6 = a4;
  uint64_t v7 = [TRIAssetStore alloc];
  paths = self->_paths;
  extractor = self->_extractor;
  v30 = self;
  id v10 = [[TRIRemoteAssetPatcher alloc] initWithMonitoredActivity:0];
  id v31 = [(TRIAssetStore *)v7 initWithPaths:paths extractor:extractor patcher:v10];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v32 = v6;
  uint64_t v11 = [v6 factorLevelArray];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v17 = (void *)MEMORY[0x1E016E7F0]();
        v18 = [v16 level];
        char v19 = [v18 fileOrDirectoryLevelWithIsDir:0];

        if (v19)
        {
          if (([v19 hasPath] & 1) == 0)
          {
            if ([v19 hasAsset])
            {
              v20 = [v19 asset];
              int v21 = [v20 hasAssetId];

              if (v21)
              {
                __int16 v22 = [v19 asset];
                id v23 = [v22 assetId];
                uint64_t v24 = TRIValidateAssetId();

                if (v24 && [v33 containsObject:v24])
                {
                  uint64_t v25 = [v32 treatmentId];
                  v26 = [v16 factor];
                  v27 = [(TRIClientTreatmentStorage *)v30 _linkAssetWithId:v24 treatmentId:v25 assetStore:v31 factor:v26 forRollouts:0];

                  if (!v27)
                  {

                    BOOL v28 = 0;
                    goto LABEL_19;
                  }
                  [v19 setPath:v27];
                }
              }
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v28 = 1;
LABEL_19:

  return v28;
}

- (id)_linkAssetWithId:(id)a3 treatmentId:(id)a4 assetStore:(id)a5 factor:(id)a6 forRollouts:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = (void *)MEMORY[0x1E016E7F0]();
  if (a7) {
    [(TRIClientTreatmentStorage *)self _defaultsAssetURLForFactor:v16];
  }
  else {
  v18 = [(TRIClientTreatmentStorage *)self _assetURLForFactor:v16 treatmentId:v14];
  }
  char v19 = [v18 URLByDeletingLastPathComponent];
  v20 = [v19 path];

  if (!v20)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 267, @"Expression was unexpectedly nil/false: %@", @"[assetURL URLByDeletingLastPathComponent].path" object file lineNumber description];
  }
  [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v20];
  int v21 = [v18 path];
  if (!v21)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 270, @"Expression was unexpectedly nil/false: %@", @"assetURL.path" object file lineNumber description];
  }
  if ([v15 linkAssetWithIdentifier:v13 toCurrentPath:v21 futurePath:v21]) {
    __int16 v22 = v21;
  }
  else {
    __int16 v22 = 0;
  }
  id v23 = v22;

  return v23;
}

- (id)updateSavedTreatmentWithTreatmentId:(id)a3 deletingAssetsWithFactorNames:(id)a4 forNamespaceName:(id)a5 forRollouts:(BOOL)a6
{
  return [(TRIClientTreatmentStorage *)self updateSavedTreatmentWithTreatmentId:a3 deletingAssetsWithFactorNames:a4 forNamespaceName:a5 forRollouts:a6 inUseAssetDeletionBehavior:1];
}

- (id)updateSavedTreatmentWithTreatmentId:(id)a3 deletingAssetsWithFactorNames:(id)a4 forNamespaceName:(id)a5 forRollouts:(BOOL)a6 inUseAssetDeletionBehavior:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  BOOL v8 = a6;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void *)MEMORY[0x1E016E7F0]();
  char v23 = 0;
  id v16 = [(TRIClientTreatmentStorage *)self loadTreatmentWithTreatmentId:v12 isFilePresent:&v23];
  if (v16)
  {
    [(TRIClientTreatmentStorage *)self _deleteOnDemandAssetsWithFactorNames:v13 treatment:v16 namespace:v14 forRollouts:v8 inUseAssetDeletionBehavior:v7];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v14, 0);
    BOOL v18 = [(TRIClientTreatmentStorage *)self _saveNamespacePartitionedTreatmentsForTreatment:v16 forNamespaceNames:v17 forRollouts:v8];

    id v19 = 0;
    if (!v18) {
      goto LABEL_10;
    }
    if ([(TRIClientTreatmentStorage *)self _savePersistedTreatment:v16])
    {
      id v19 = v16;
      goto LABEL_10;
    }
  }
  else if (!v23)
  {
    v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v12];
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v22;
      _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "updateSavedTreatmentWithTreatmentId failed because preexisting treatment is not present: %@", buf, 0xCu);
    }
  }
  id v19 = 0;
LABEL_10:

  return v19;
}

- (BOOL)removeUnreferencedTreatmentsWithRemovedCount:(unsigned int *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = [(TRIClientTreatmentStorage *)self _collectTreatments];
  if (v4)
  {
    v5 = [TRITempDirScopeGuard alloc];
    id v6 = [(TRIPaths *)self->_paths localTempDir];
    uint64_t v7 = [(TRITempDirScopeGuard *)v5 initWithPath:v6];

    long long v34 = (void *)v7;
    if (v7)
    {
      id v32 = [[TRINamespaceDescriptorSetStorage alloc] initWithPaths:self->_paths];
      long long v35 = [(TRINamespaceDescriptorSetStorage *)v32 parentDirForNamespaceDescriptorSets];
      BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v9 = [v8 fileExistsAtPath:v35];

      if (v9)
      {
        id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        context = (void *)MEMORY[0x1E016E7F0]();
        id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v35 isDirectory:1];
        id v12 = [v10 enumeratorAtURL:v11 includingPropertiesForKeys:0 options:0 errorHandler:0];

        id v13 = (void *)MEMORY[0x1E016E7F0]();
        id v14 = [v12 nextObject];
        if (v14)
        {
          *(void *)&long long v15 = 138412290;
          long long v30 = v15;
          do
          {
            id v16 = objc_msgSend(v14, "path", v30);
            int v17 = [v16 hasSuffix:@".plist"];

            if (v17)
            {
              BOOL v18 = (void *)MEMORY[0x1E4F1C9E8];
              id v19 = [v14 path];
              v20 = [v18 dictionaryWithContentsOfFile:v19];

              if (v20)
              {
                int v21 = [objc_alloc(MEMORY[0x1E4FB01A0]) initWithDictionary:v20];
                __int16 v22 = [v21 factorsURL];
                char v23 = [v22 path];
                uint64_t v24 = [v23 stringByDeletingLastPathComponent];
                [v36 addObject:v24];
              }
              else
              {
                int v21 = TRILogCategory_Server();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v25 = [v14 path];
                  LODWORD(buf) = v30;
                  *(void *)((char *)&buf + 4) = v25;
                  _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "failed to parse dictionary from file: %@", (uint8_t *)&buf, 0xCu);
                }
              }
            }
            id v13 = (void *)MEMORY[0x1E016E7F0]();
            id v14 = [v12 nextObject];
          }
          while (v14);
        }

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v47 = 0x2020000000;
        int v48 = 0;
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2020000000;
        char v45 = 1;
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __74__TRIClientTreatmentStorage_removeUnreferencedTreatmentsWithRemovedCount___block_invoke;
        v37[3] = &unk_1E6BBDBD8;
        v27 = v36;
        id v38 = v27;
        v40 = &v42;
        id v39 = v34;
        p_long long buf = &buf;
        int v28 = [v4 enumerateStringsWithBlock:v37];
        if (a3) {
          *a3 = *(_DWORD *)(*((void *)&buf + 1) + 24);
        }
        if (v28) {
          BOOL v26 = *((unsigned char *)v43 + 24) != 0;
        }
        else {
          BOOL v26 = 0;
        }

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        v27 = TRILogCategory_Server();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v35;
          _os_log_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEFAULT, "Experiment namespace descriptor directory does not exist at %{public}@", (uint8_t *)&buf, 0xCu);
        }
        BOOL v26 = 1;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

void __74__TRIClientTreatmentStorage_removeUnreferencedTreatmentsWithRemovedCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Treatment managed-dir %@ is referenced. Looking to see if there are any deferred-deletion items to remove", (uint8_t *)&v12, 0xCu);
    }

    BOOL v5 = +[TRIReferenceManagedDir collectDeferredDeletionItemsWithManagedDir:v3];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v6 + 24)) {
      BOOL v7 = v5;
    }
    else {
      BOOL v7 = 0;
    }
    *(unsigned char *)(v6 + 24) = v7;
  }
  else
  {
    LOBYTE(v12) = 0;
    BOOL v8 = [*(id *)(a1 + 40) path];
    BOOL v9 = +[TRIReferenceManagedDir collectGarbageForManagedDir:v3 withExternalReferenceStore:0 usingTempDir:v8 managedDirWasDeleted:&v12];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v10 + 24)) {
      BOOL v11 = v9;
    }
    else {
      BOOL v11 = 0;
    }
    *(unsigned char *)(v10 + 24) = v11;

    if ((_BYTE)v12) {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
  }
}

- (id)_collectTreatments
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  if (!v3)
  {
    id v28 = 0;
    goto LABEL_33;
  }
  uint64_t v4 = [(TRIPaths *)self->_paths treatmentsDir];
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v50 = 0;
  v40 = (void *)v4;
  uint64_t v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v50];
  id v7 = v50;

  if (v6)
  {
    id v35 = v7;
    long long v37 = v3;
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v36 = v6;
    id obj = v6;
    uint64_t v41 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v41)
    {
      uint64_t v39 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v47 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v10 = (void *)MEMORY[0x1E016E7F0]();
          BOOL v11 = [v40 stringByAppendingPathComponent:v9];
          buf[0] = 0;
          int v12 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v12 fileExistsAtPath:v11 isDirectory:buf];

          if (buf[0])
          {
            uint64_t v42 = v10;
            id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:1];
            long long v15 = [v13 enumeratorAtURL:v14 includingPropertiesForKeys:0 options:1 errorHandler:0];

            id v16 = (void *)MEMORY[0x1E016E7F0]();
            uint64_t v17 = [v15 nextObject];
            if (v17)
            {
              BOOL v18 = (void *)v17;
              while (1)
              {
                id v19 = objc_msgSend(v18, "URLByAppendingPathComponent:", @"treatment.pb", v35);
                uint64_t v20 = [v19 path];
                if (v20)
                {
                  int v21 = (void *)v20;
                  __int16 v22 = [MEMORY[0x1E4F28CB8] defaultManager];
                  char v23 = [v19 path];
                  int v24 = [v22 fileExistsAtPath:v23];

                  if (!v24) {
                    break;
                  }
                }
                uint64_t v25 = [v18 path];

                if (v25)
                {
                  BOOL v26 = [v18 path];
                  [v43 addObject:v26];
                }
                id v16 = (void *)MEMORY[0x1E016E7F0]();
                BOOL v18 = [v15 nextObject];
                if (!v18) {
                  goto LABEL_18;
                }
              }
            }
LABEL_18:

            uint64_t v10 = v42;
          }
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v41);
    }

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __47__TRIClientTreatmentStorage__collectTreatments__block_invoke;
    v44[3] = &unk_1E6BBDC00;
    id v3 = v37;
    id v27 = v37;
    id v45 = v27;
    [v43 enumerateObjectsUsingBlock:v44];
    id v28 = v27;

    id v7 = v35;
    uint64_t v6 = v36;
    goto LABEL_32;
  }
  int v29 = [v7 domain];
  long long v30 = v29;
  if (v29 == (void *)*MEMORY[0x1E4F281F8])
  {
    uint64_t v31 = [v7 code];

    if (v31 == 260)
    {
      id v32 = TRILogCategory_Server();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        __int16 v53 = v40;
        _os_log_impl(&dword_1DA291000, v32, OS_LOG_TYPE_DEFAULT, "Treatments folder does not exist at %{public}@. Treating as empty", buf, 0xCu);
      }

      id v28 = v3;
      goto LABEL_32;
    }
  }
  else
  {
  }
  id v33 = TRILogCategory_Server();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    __int16 v53 = v40;
    __int16 v54 = 2112;
    id v55 = v7;
    _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Unable to gather contents of treatment directory %{public}@: %@", buf, 0x16u);
  }

  id v28 = 0;
LABEL_32:

LABEL_33:
  return v28;
}

void __47__TRIClientTreatmentStorage__collectTreatments__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) addString:v3] & 1) == 0)
  {
    uint64_t v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Failed to add string %@ to file-backed mutable array", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)removeTreatmentFromLayer:(unint64_t)a3 withNamespaceName:(id)a4 upgradeNCVs:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ((uint64_t)a3 <= 3)
  {
    if (a3 == 1)
    {
      BOOL v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v32 = TRILoggedNamespaceName(v8);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v41 = v32;
        _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "cannot remove treatment from 'installed' layer for namespace %{public}@", buf, 0xCu);
      }
      goto LABEL_18;
    }
    if (a3 != 2) {
      goto LABEL_18;
    }
    uint64_t v10 = [(TRIPaths *)self->_paths namespaceDescriptorsRolloutDir];
  }
  else
  {
    if (a3 == 4)
    {
LABEL_5:
      uint64_t v10 = [(TRIPaths *)self->_paths namespaceDescriptorsExperimentDir];
      goto LABEL_10;
    }
    if (a3 != 16)
    {
      if (a3 == 32) {
        goto LABEL_5;
      }
LABEL_18:
      BOOL v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v41) = a3;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "cannot remove treatment from unknown treatment layer %u", buf, 8u);
      }
      BOOL v19 = 0;
      goto LABEL_44;
    }
    uint64_t v10 = [(TRIPaths *)self->_paths namespaceDescriptorsBMLTDir];
  }
LABEL_10:
  BOOL v11 = v10;
  if (!v10) {
    goto LABEL_18;
  }
  int v12 = [MEMORY[0x1E4FB01A0] loadWithNamespaceName:v8 fromDirectory:v10];
  if (v12)
  {
    id v13 = [MEMORY[0x1E4FB01A8] factorProviderWithNamespaceDescriptor:v12 paths:self->_paths faultOnMissingFactors:0 shouldLockFactorDirectory:0];
    uint64_t v14 = v13;
    if (a3 == 4)
    {
      long long v15 = [v13 treatmentId];

      if (v15)
      {
        id v16 = [v14 treatmentId];
        BOOL v17 = [(TRIClientTreatmentStorage *)self removeTreatmentWithTreatmentId:v16];
      }
      else
      {
        BOOL v17 = 1;
      }
    }
    else if (v9)
    {
      long long v34 = v13;
      uint64_t v20 = [v13 namespaceCompatibilityVersion];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v35 = v9;
      id v21 = v9;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v21);
            }
            if ([*(id *)(*((void *)&v36 + 1) + 8 * i) intValue] > v20)
            {
              id v28 = TRILogCategory_Server();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                id v33 = TRILoggedNamespaceName(v8);
                *(_DWORD *)long long buf = 138543874;
                uint64_t v41 = v33;
                __int16 v42 = 2112;
                id v43 = v21;
                __int16 v44 = 1024;
                int v45 = v20;
                _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "Error for namespace %{public}@. Every element of Namespace Upgrade Compatibility Versions %@ must be less than or equal to the current rollout Namespace Compatibility Version %u", buf, 0x1Cu);
              }
              BOOL v19 = 0;
              id v9 = v35;
              goto LABEL_43;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v46 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      BOOL v26 = [NSNumber numberWithUnsignedInt:v20];
      char v27 = [v21 containsObject:v26];

      BOOL v17 = (v27 & 1) != 0
         || [(TRIClientTreatmentStorage *)self _removeRolloutWithDescriptor:v12 descriptorDir:v11 treatmentLayer:a3 namespaceName:v8];
      int v29 = TRILogCategory_Server();
      uint64_t v14 = v34;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        long long v30 = TRILoggedNamespaceName(v8);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v41 = v30;
        __int16 v42 = 2114;
        id v43 = v21;
        _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_DEFAULT, "Not deleting rollout for namespace %{public}@ due to upgrade NCVS %{public}@", buf, 0x16u);
      }
      id v9 = v35;
    }
    else
    {
      BOOL v17 = [(TRIClientTreatmentStorage *)self _removeRolloutWithDescriptor:v12 descriptorDir:v11 treatmentLayer:a3 namespaceName:v8];
    }

    BOOL v19 = v17;
  }
  else
  {
    BOOL v19 = 1;
  }
LABEL_43:

LABEL_44:
  return v19;
}

- (BOOL)removeTreatmentWithTreatmentId:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E016E7F0]();
  char v43 = 0;
  uint64_t v7 = [(TRIClientTreatmentStorage *)self loadTreatmentWithTreatmentId:v5 isFilePresent:&v43];
  if (v7)
  {
    SEL v32 = a2;
    id v33 = v6;
    id v8 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = [v7 factorLevelArray];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v39 + 1) + 8 * i) factor];
          long long v15 = [v14 namespaceString];

          if (v15) {
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v11);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v16 = v8;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v36;
      LODWORD(v20) = 1;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          LODWORD(v20) = v20 & [(TRIClientTreatmentStorage *)self _removeFactorsWithTreatmentId:v5 namespaceName:*(void *)(*((void *)&v35 + 1) + 8 * j)];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v46 count:16];
      }
      while (v18);

      id v6 = v33;
      if (!v20) {
        goto LABEL_33;
      }
    }
    else
    {

      id v6 = v33;
    }
    uint64_t v22 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v5];
    uint64_t v23 = [v22 path];
    if (!v23)
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:v32, self, @"TRIClientTreatmentStorage.m", 558, @"Invalid parameter not satisfying: %@", @"artifactPath" object file lineNumber description];
    }
    uint64_t v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v34 = 0;
    char v25 = [v24 triForceRemoveItemAtPath:v23 error:&v34];
    id v26 = v34;

    if (v25) {
      goto LABEL_25;
    }
    char v27 = [v26 domain];
    id v28 = v27;
    if (v27 == (void *)*MEMORY[0x1E4F281F8])
    {
      uint64_t v29 = [v26 code];

      if (v29 == 4)
      {
LABEL_25:
        LOBYTE(v20) = 1;
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
    }
    else
    {
    }
    uint64_t v20 = TRILogCategory_Server();
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v45 = v26;
      _os_log_error_impl(&dword_1DA291000, (os_log_t)v20, OS_LOG_TYPE_ERROR, "Failed to remove artifact: %{public}@", buf, 0xCu);
    }

    LOBYTE(v20) = 0;
    goto LABEL_32;
  }
  LOBYTE(v20) = v43 == 0;
LABEL_34:

  return v20;
}

- (BOOL)_removeFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4
{
  uint64_t v4 = self;
  id v5 = [(TRIClientTreatmentStorage *)self urlForFactorsWithTreatmentId:a3 namespaceName:a4];
  LOBYTE(v4) = [(TRIClientTreatmentStorage *)v4 _removeFactorsWithURL:v5];

  return (char)v4;
}

- (BOOL)_removeRolloutWithDescriptor:(id)a3 descriptorDir:(id)a4 treatmentLayer:(unint64_t)a5 namespaceName:(id)a6
{
  int v7 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  int v12 = [v10 removeFromDirectory:a4];
  id v13 = [v10 factorsURL];

  if (v13)
  {
    uint64_t v14 = [v10 factorsURL];
    v12 &= [(TRIClientTreatmentStorage *)self _removeFactorsWithURL:v14];
  }
  else
  {
    long long v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = TRILoggedNamespaceName(v11);
      v18[0] = 67109378;
      v18[1] = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v17;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "descriptor in layer %u is missing factors URL for namespace %{public}@", (uint8_t *)v18, 0x12u);
    }
  }

  return v12;
}

- (BOOL)_removeFactorsWithURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 601, @"Invalid parameter not satisfying: %@", @"factorsURL" object file lineNumber description];
  }
  id v6 = [v5 triPathAsOwner:0];
  if (v6)
  {
    int v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];

    if (v7)
    {
      id v5 = v7;
      id v8 = [v7 URLByDeletingLastPathComponent];
      if (!v8)
      {
        uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 623, @"Invalid parameter not satisfying: %@", @"parentURL" object file lineNumber description];
      }
      id v9 = [v8 triPathAsOwner:0];
      if (!v9)
      {
        uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 625, @"Invalid parameter not satisfying: %@", @"parentPath" object file lineNumber description];
      }
      char v24 = 0;
      uint64_t v10 = [v5 path];
      if (v10)
      {
        id v11 = (void *)v10;
        int v12 = [v5 path];
        if (+[TRIReferenceManagedDir isPathInManagedDir:v12])
        {
          id v13 = [v5 path];
          BOOL v14 = 1;
          BOOL v15 = +[TRIReferenceManagedDir removeFileInManagedDirWithPath:v13 inUseDeletionBehavior:1 wasDeleted:&v24];

          if (!v15)
          {
            id v16 = TRILogCategory_Server();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543362;
              id v26 = v6;
              _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Failed to remove factors path %{public}@ in managed dir", buf, 0xCu);
            }

            BOOL v14 = 0;
          }
          goto LABEL_27;
        }
      }
      BOOL v14 = 1;
LABEL_27:

      goto LABEL_28;
    }
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = 0;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Failed to resolve url: %{public}@", buf, 0xCu);
    }
    goto LABEL_24;
  }
  int v17 = [v5 triIsContainerURL];
  uint64_t v18 = TRILogCategory_Server();
  __int16 v19 = v18;
  if (!v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v5;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Failed to resolve url: %{public}@", buf, 0xCu);
    }

LABEL_24:
    BOOL v14 = 0;
    goto LABEL_28;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v26 = v5;
    _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "Failed to resolve container url: %{public}@", buf, 0xCu);
  }

  BOOL v14 = 1;
LABEL_28:

  return v14;
}

- (id)urlForFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = [(TRIClientTreatmentStorage *)self _baseUrlForTreatment:a3 namespaceName:a4];
  int v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [v6 path];
  v13[0] = v8;
  v13[1] = @"treatment.pb";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v10 = [v7 fileURLWithPathComponents:v9];

  if (!v10)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"TRIClientTreatmentStorage.m" lineNumber:642 description:@"urlForFactorsWithTreatmentId is nil"];
  }
  return v10;
}

- (id)urlForDefaultFactorsWithNamespaceName:(id)a3
{
  return [(TRIClientTreatmentStorage *)self urlForFactorsWithTreatmentId:@"defaults" namespaceName:a3];
}

- (BOOL)_savePersistedTreatment:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E016E7F0]();
  int v7 = [v5 treatmentId];
  id v8 = [(TRIClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v7];

  id v9 = [v8 URLByDeletingLastPathComponent];
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 655, @"Invalid parameter not satisfying: %@", @"parentDirURL" object file lineNumber description];
  }
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v24 = 0;
  char v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v24];
  id v12 = v24;

  if ((v11 & 1) == 0)
  {
    id v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v12;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@", buf, 0xCu);
    }
  }
  BOOL v14 = objc_opt_new();
  [v14 setTreatment:v5];
  BOOL v15 = [v14 data];
  if (!v15)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 669, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v23 = 0;
  char v16 = [v15 writeToURL:v8 options:268435457 error:&v23];
  id v17 = v23;
  if ((v16 & 1) == 0)
  {
    uint64_t v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v5 treatmentId];
      *(_DWORD *)long long buf = 138412546;
      id v26 = v20;
      __int16 v27 = 2114;
      id v28 = v17;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to write TRIPersistedTreatment for treatment %@: %{public}@", buf, 0x16u);
    }
  }

  return v16;
}

- (BOOL)_deleteOnDemandAssetsWithFactorNames:(id)a3 treatment:(id)a4 namespace:(id)a5 forRollouts:(BOOL)a6 inUseAssetDeletionBehavior:(unsigned __int8)a7
{
  unsigned int v62 = a7;
  BOOL v65 = a6;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 treatmentId];
  v69 = self;
  v63 = v12;
  BOOL v14 = [(TRIClientTreatmentStorage *)self _baseUrlForTreatment:v13 namespaceName:v12];
  v68 = [v14 path];

  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v64 = v11;
  BOOL v15 = [v11 factorLevelArray];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (!v16)
  {
    LOBYTE(v19) = 1;
    goto LABEL_40;
  }
  uint64_t v17 = v16;
  SEL v61 = a2;
  uint64_t v18 = *(void *)v80;
  uint64_t v19 = 1;
  v70 = v15;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v80 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void **)(*((void *)&v79 + 1) + 8 * v20);
      uint64_t v22 = (void *)MEMORY[0x1E016E7F0]();
      id v23 = [v21 level];
      id v24 = [v23 fileOrDirectoryLevelWithIsDir:0];

      if (!v24)
      {
        id v33 = [v21 level];
        int v34 = [v33 levelOneOfCase];

        if (v34 != 104) {
          goto LABEL_27;
        }
        long long v35 = [v21 level];
        char v25 = [v35 mobileAssetReferenceValue];

        if (![v25 isOnDemand]) {
          goto LABEL_26;
        }
        unsigned int v72 = v19;
        long long v36 = [v21 factor];
        long long v37 = [v36 name];
        int v38 = [v71 containsObject:v37];

        if (v38)
        {
          long long v39 = objc_opt_class();
          long long v40 = [v21 factor];
          long long v41 = [v40 name];
          long long v42 = [v39 relPathForMAReferenceWithFactorName:v41];

          char v43 = [v68 stringByAppendingPathComponent:v42];
          __int16 v44 = [MEMORY[0x1E4F28CB8] defaultManager];
          LODWORD(v40) = [v44 fileExistsAtPath:v43];

          if (v40)
          {
            [v66 addObject:v43];
            id v45 = objc_opt_new();
            id v78 = 0;
            char v46 = [v45 writeToFile:v43 options:0x10000000 error:&v78];
            id v67 = v78;

            if ((v46 & 1) == 0)
            {
              uint64_t v47 = TRILogCategory_Server();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                int buf = 138543362;
                v85 = v43;
                _os_log_error_impl(&dword_1DA291000, v47, OS_LOG_TYPE_ERROR, "Unable to nil out MARef by creating a blank file at %{public}@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
        }
        uint64_t v19 = v72;
        goto LABEL_25;
      }
      if (![v24 hasAsset]) {
        goto LABEL_27;
      }
      char v25 = [v24 asset];
      if (![v25 hasCloudKitIndex]) {
        goto LABEL_26;
      }
      int v26 = [v24 hasPath];

      if (!v26) {
        goto LABEL_27;
      }
      uint64_t v27 = v19;
      id v28 = [v21 factor];
      uint64_t v29 = [v28 name];
      int v30 = [v71 containsObject:v29];

      if (v30)
      {
        if ([v24 isOnDemand])
        {
          uint64_t v31 = [v21 factor];
          if (v65)
          {
            SEL v32 = [(TRIClientTreatmentStorage *)v69 _defaultsAssetURLForFactor:v31];
          }
          else
          {
            uint64_t v48 = [v64 treatmentId];
            SEL v32 = [(TRIClientTreatmentStorage *)v69 _assetURLForFactor:v31 treatmentId:v48];
          }
          uint64_t v19 = v27;

          char v25 = [v32 path];
          BOOL v15 = v70;
          if (!v25)
          {
            v52 = [MEMORY[0x1E4F28B00] currentHandler];
            [v52 handleFailureInMethod:v61, v69, @"TRIClientTreatmentStorage.m", 721, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
          }
          [v66 addObject:v25];
          [v24 setPath:0];
          goto LABEL_26;
        }
        char v25 = TRILogCategory_Server();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          long long v49 = [v21 factor];
          id v50 = [v49 name];
          v51 = [v64 treatmentId];
          int buf = 138543618;
          v85 = v50;
          __int16 v86 = 2112;
          v87 = v51;
          _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Factor %{public}@ for treatment %@ is not on-demand.", (uint8_t *)&buf, 0x16u);
        }
        uint64_t v19 = 0;
LABEL_25:
        BOOL v15 = v70;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v19 = v27;
      BOOL v15 = v70;
LABEL_27:

      ++v20;
    }
    while (v17 != v20);
    uint64_t v53 = [v15 countByEnumeratingWithState:&v79 objects:v88 count:16];
    uint64_t v17 = v53;
  }
  while (v53);
LABEL_40:

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v54 = v66;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v75 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        char v73 = 0;
        if (!+[TRIReferenceManagedDir removeFileInManagedDirWithPath:v59 inUseDeletionBehavior:v62 wasDeleted:&v73])
        {
          uint64_t v19 = TRILogCategory_Server();
          if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
          {
            int buf = 138543362;
            v85 = v59;
            _os_log_error_impl(&dword_1DA291000, (os_log_t)v19, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@ in managed dir", (uint8_t *)&buf, 0xCu);
          }

          LOBYTE(v19) = 0;
        }
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v56);
  }

  return v19 & 1;
}

- (BOOL)_linkAssetsUpdatingTreatment:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v96 = [[TRIAssetStore alloc] initWithPaths:self->_paths];
  id v6 = [v5 factorLevelArray];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v68 = [v5 treatmentId];
      *(_DWORD *)int buf = 138412290;
      v109 = v68;
      _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Treatment %@ has no factor levels. Proceeding without linking assets.", buf, 0xCu);
    }
    BOOL v66 = 1;
    goto LABEL_79;
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v8 = [v5 factorLevelArray];
  uint64_t v100 = [v8 countByEnumeratingWithState:&v104 objects:v114 count:16];
  if (v100)
  {
    SEL v89 = a2;
    v94 = self;
    id v9 = 0;
    uint64_t v99 = *(void *)v105;
    id v93 = v5;
    v95 = v8;
    while (1)
    {
      uint64_t v10 = 0;
      id v11 = v9;
      do
      {
        if (*(void *)v105 != v99) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v104 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1E016E7F0]();
        id v13 = [v12 factor];
        id v9 = [v13 namespaceName];

        BOOL v14 = [v12 level];
        BOOL v15 = [v14 fileOrDirectoryLevelWithIsDir:0];

        if (!v15)
        {
          SEL v32 = [v12 level];
          int v33 = [v32 levelOneOfCase];

          if (v33 == 104)
          {
            int v34 = [v12 factor];
            long long v35 = [v34 namespaceString];

            if (!v35)
            {
              uint64_t v20 = TRILogCategory_Server();
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                goto LABEL_71;
              }
              v70 = [v5 treatmentId];
              id v71 = [v12 factor];
              [v71 name];
              v73 = unsigned int v72 = v9;
              *(_DWORD *)int buf = 138543618;
              v109 = v70;
              __int16 v110 = 2114;
              id v111 = v73;
              _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has factor %{public}@ with missing namespaceString.", buf, 0x16u);

              id v9 = v72;
              goto LABEL_81;
            }
            long long v36 = [v12 level];
            uint64_t v20 = [v36 mobileAssetReferenceValue];

            if (![v20 hasAssetType]
              || ![v20 hasAssetSpecifier]
              || ([v20 hasAssetVersion] & 1) == 0)
            {
              v70 = TRILogCategory_Server();
              if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
LABEL_65:

                goto LABEL_71;
              }
              id v71 = [v5 treatmentId];
              [v12 factor];
              v85 = v84 = v9;
              __int16 v86 = [v85 name];
              *(_DWORD *)int buf = 138543618;
              v109 = v71;
              __int16 v110 = 2114;
              id v111 = v86;
              _os_log_error_impl(&dword_1DA291000, v70, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has factor %{public}@ with incomplete MobileAssetReference.", buf, 0x16u);

              id v9 = v84;
LABEL_81:

              goto LABEL_65;
            }
            v98 = v9;
            long long v37 = [v12 factor];
            int v38 = [v5 treatmentId];
            long long v39 = [v37 namespaceName];
            long long v40 = [(TRIClientTreatmentStorage *)v94 _baseUrlForTreatment:v38 namespaceName:v39];

            v90 = v40;
            long long v41 = [v40 path];
            if (!v41)
            {
              uint64_t v53 = [MEMORY[0x1E4F28B00] currentHandler];
              [v53 handleFailureInMethod:v89, v94, @"TRIClientTreatmentStorage.m", 855, @"Expression was unexpectedly nil/false: %@", @"targetURL.path" object file lineNumber description];
            }
            long long v42 = objc_opt_class();
            v92 = v37;
            char v43 = [v37 name];
            uint64_t v44 = [v42 relPathForMAReferenceWithFactorName:v43];

            v91 = (void *)v44;
            id v45 = [v41 stringByAppendingPathComponent:v44];
            char v46 = [v45 stringByDeletingLastPathComponent];
            id v47 = objc_alloc(MEMORY[0x1E4FB0178]);
            uint64_t v48 = [v20 assetType];
            long long v49 = [v20 assetSpecifier];
            id v50 = [v20 assetVersion];
            v51 = (void *)[v47 initWithType:v48 specifier:v49 version:v50];

            [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v46];
            if ([v20 hasIsFileFactor]) {
              uint64_t v52 = [v20 isFileFactor];
            }
            else {
              uint64_t v52 = 0;
            }
            id v5 = v93;
            if (![(TRIAssetStore *)v96 referenceMAAutoAssetWithId:v51 isFileFactor:v52 usingCurrentPath:v45 futurePath:v45])
            {
              long long v74 = TRILogCategory_Server();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)int buf = 138543362;
                v109 = v45;
                _os_log_error_impl(&dword_1DA291000, v74, OS_LOG_TYPE_ERROR, "Unable to reference maAutoAsset at %{public}@", buf, 0xCu);
              }

              id v9 = v98;
LABEL_71:
              long long v75 = context;
LABEL_76:

              id v8 = v95;
LABEL_77:

              goto LABEL_78;
            }

            id v9 = v98;
            id v8 = v95;
          }
LABEL_38:

          goto LABEL_39;
        }
        if (![v15 hasAsset]) {
          goto LABEL_38;
        }
        uint64_t v16 = [v15 asset];
        int v17 = [v16 hasAssetId];

        if (!v17) {
          goto LABEL_38;
        }
        uint64_t v18 = [v15 asset];
        uint64_t v19 = [v18 assetId];
        uint64_t v20 = TRIValidateAssetId();

        if (!v20)
        {
          long long v76 = TRILogCategory_Server();
          if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
LABEL_75:
            long long v75 = context;

            goto LABEL_76;
          }
          long long v77 = [v5 treatmentId];
          [v15 asset];
          v79 = id v78 = v9;
          long long v80 = [v79 assetId];
          long long v81 = [v12 factor];
          long long v82 = [v81 name];
          *(_DWORD *)int buf = 138412802;
          v109 = v77;
          __int16 v110 = 2114;
          id v111 = v80;
          __int16 v112 = 2114;
          v113 = v82;
          _os_log_error_impl(&dword_1DA291000, v76, OS_LOG_TYPE_ERROR, "Treatment %@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);

          id v9 = v78;
LABEL_83:

          goto LABEL_75;
        }
        if (([v12 hasFactor] & 1) == 0)
        {
          long long v76 = TRILogCategory_Server();
          if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
            goto LABEL_75;
          }
          long long v77 = [v5 treatmentId];
          *(_DWORD *)int buf = 138412290;
          v109 = v77;
          _os_log_error_impl(&dword_1DA291000, v76, OS_LOG_TYPE_ERROR, "Treatment %@ has missing factor.", buf, 0xCu);
          goto LABEL_83;
        }
        v97 = v9;
        uint64_t v21 = [v12 factor];
        uint64_t v22 = [v5 treatmentId];
        id v23 = [(TRIClientTreatmentStorage *)v94 _assetURLForFactor:v21 treatmentId:v22];

        id v24 = [v23 path];
        if (!v24)
        {
          id v54 = [MEMORY[0x1E4F28B00] currentHandler];
          [v54 handleFailureInMethod:v89, v94, @"TRIClientTreatmentStorage.m", 807, @"Expression was unexpectedly nil/false: %@", @"targetURL.path" object file lineNumber description];
        }
        char v25 = [v24 stringByDeletingLastPathComponent];
        int v26 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v103 = 0;
        char v27 = [v26 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v103];
        id v28 = v103;

        if ((v27 & 1) == 0)
        {
          uint64_t v29 = TRILogCategory_Server();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 138543362;
            v109 = v28;
            _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Failed to create directory for factor: %{public}@", buf, 0xCu);
          }
        }
        if ([v15 hasIsOnDemand]
          && [v15 isOnDemand]
          && ![(TRIAssetStore *)v96 hasAssetWithIdentifier:v20 type:0])
        {
          char v31 = 0;
          int v30 = 1;
        }
        else if ([(TRIAssetStore *)v96 linkAssetWithIdentifier:v20 toPath:v24])
        {
          [v15 setPath:v24];
          int v30 = 0;
          char v31 = 1;
        }
        else
        {
          char v31 = 0;
          int v30 = 0;
        }

        id v5 = v93;
        id v9 = v97;
        id v8 = v95;
        if (v31) {
          goto LABEL_38;
        }

        if (!v30) {
          goto LABEL_77;
        }
LABEL_39:
        ++v10;
        id v11 = v9;
      }
      while (v100 != v10);
      uint64_t v55 = [v8 countByEnumeratingWithState:&v104 objects:v114 count:16];
      uint64_t v100 = v55;
      if (!v55)
      {

        if (!v9) {
          goto LABEL_62;
        }
        uint64_t v56 = [v5 treatmentId];
        uint64_t v57 = v9;
        v58 = [(TRIClientTreatmentStorage *)v94 _baseUrlForTreatment:v56 namespaceName:v9];
        v59 = [v58 path];

        v60 = [MEMORY[0x1E4F28CB8] defaultManager];
        SEL v61 = v59;
        if (!v61)
        {
          v87 = [MEMORY[0x1E4F28B00] currentHandler];
          [v87 handleFailureInMethod:v89, v94, @"TRIClientTreatmentStorage.m", 885, @"Expression was unexpectedly nil/false: %@", @"directory" object file lineNumber description];
        }
        id v102 = 0;
        char v62 = [v60 createDirectoryAtPath:v61 withIntermediateDirectories:1 attributes:0 error:&v102];
        id v63 = v102;

        if ((v62 & 1) == 0)
        {
          v64 = TRILogCategory_Server();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 138543618;
            v109 = v61;
            __int16 v110 = 2114;
            id v111 = v63;
            _os_log_error_impl(&dword_1DA291000, v64, OS_LOG_TYPE_ERROR, "Failed to create directory for treatment at %{public}@: %{public}@", buf, 0x16u);
          }
        }
        BOOL v65 = v61;
        if (!v61)
        {
          v88 = [MEMORY[0x1E4F28B00] currentHandler];
          [v88 handleFailureInMethod:v89, v94, @"TRIClientTreatmentStorage.m", 892, @"Expression was unexpectedly nil/false: %@", @"directory" object file lineNumber description];
        }
        BOOL v66 = +[TRIReferenceManagedDir createFromDir:v65];

        if (!v66)
        {
          id v67 = TRILogCategory_Server();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 138543362;
            v109 = v65;
            _os_log_error_impl(&dword_1DA291000, v67, OS_LOG_TYPE_ERROR, "Failed to create reference-managed directory at %{public}@ for factor", buf, 0xCu);
          }
        }
        id v9 = v57;
        goto LABEL_79;
      }
    }
  }

LABEL_62:
  id v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v69 = [v5 treatmentId];
    *(_DWORD *)int buf = 138543362;
    v109 = v69;
    _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Unable to find a namespace name from factor levels in treatment %{public}@", buf, 0xCu);
  }
LABEL_78:
  BOOL v66 = 0;
LABEL_79:

  return v66;
}

+ (id)relPathForMAReferenceWithFactorName:(id)a3
{
  id v3 = [a3 triFilenameForFactorName];
  uint64_t v4 = [@"maRefs" stringByAppendingPathComponent:v3];

  return v4;
}

- (BOOL)_saveNamespacePartitionedTreatmentsForTreatment:(id)a3 forNamespaceNames:(id)a4 forRollouts:(BOOL)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v24 = v6;
  char v25 = [v6 treatmentId];
  if (v25)
  {
    id v8 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [v6 factorLevelArray];
    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v13 = (void *)MEMORY[0x1E016E7F0]();
          BOOL v14 = [v12 factor];
          BOOL v15 = [v14 namespaceString];

          if (!v15)
          {
            uint64_t v19 = TRILogCategory_Server();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v12;
              _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Can't save namespace-partitioned treatments: namespaceString is nil for %{public}@", (uint8_t *)&buf, 0xCu);
            }

            goto LABEL_21;
          }
          if (!v7 || [v7 containsObject:v15])
          {
            uint64_t v16 = [v8 objectForKeyedSubscript:v15];
            if (!v16)
            {
              uint64_t v16 = objc_opt_new();
              [v16 setTreatmentId:v25];
              [v8 setObject:v16 forKeyedSubscript:v15];
            }
            int v17 = [v16 factorLevelArray];
            [v17 addObject:v12];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v37 = 0x2020000000;
    char v38 = 1;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __107__TRIClientTreatmentStorage__saveNamespacePartitionedTreatmentsForTreatment_forNamespaceNames_forRollouts___block_invoke;
    v27[3] = &unk_1E6BBDC28;
    BOOL v31 = a5;
    v27[4] = self;
    p_long long buf = &buf;
    SEL v30 = a2;
    id v28 = v25;
    [v8 enumerateKeysAndObjectsUsingBlock:v27];
    BOOL v18 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Can't save namespace-partitioned treatments: treatmentId is nil", (uint8_t *)&buf, 2u);
    }
LABEL_21:
    BOOL v18 = 0;
  }

  return v18;
}

void __107__TRIClientTreatmentStorage__saveNamespacePartitionedTreatmentsForTreatment_forNamespaceNames_forRollouts___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v10 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64)) {
    [v10 urlForDefaultFactorsWithNamespaceName:v7];
  }
  else {
  id v11 = [v10 urlForFactorsWithTreatmentId:*(void *)(a1 + 40) namespaceName:v7];
  }
  id v12 = [v11 URLByDeletingLastPathComponent];
  if (!v12)
  {
    int v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIClientTreatmentStorage.m", 942, @"Invalid parameter not satisfying: %@", @"referenceURL" object file lineNumber description];
  }
  if ([*(id *)(a1 + 32) _resolveAssetPathsInTreatment:v8 usingReferenceURL:v12])
  {
    uint64_t v29 = a4;
    id v13 = [v8 data];
    if (!v13)
    {
      char v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIClientTreatmentStorage.m", 952, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
    }
    BOOL v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v31 = 0;
    int v15 = [v14 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v31];
    id v16 = v31;
    int v17 = v16;
    if (v15)
    {
      id v30 = v16;
      char v28 = [v13 writeToURL:v11 options:268435457 error:&v30];
      BOOL v18 = v11;
      id v19 = v8;
      uint64_t v20 = v13;
      id v21 = v7;
      uint64_t v22 = v9;
      id v23 = v30;

      int v17 = v23;
      uint64_t v9 = v22;
      id v7 = v21;
      id v13 = v20;
      id v8 = v19;
      id v11 = v18;
      if (v28)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
    }
    char v25 = TRILogCategory_Server();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      long long v33 = v17;
      _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Unable to write serialized namespace treatment: %{public}@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    unsigned char *v29 = 1;
    goto LABEL_19;
  }
  id v24 = TRILogCategory_Server();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v33 = v12;
    _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "Unable to resolve asset paths with reference URL %@", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  *a4 = 1;
LABEL_20:
}

- (id)_defaultsAssetURLForFactor:(id)a3
{
  return [(TRIClientTreatmentStorage *)self _assetURLForFactor:a3 treatmentId:@"defaults"];
}

- (id)_assetURLForFactor:(id)a3 treatmentId:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 namespaceString];
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 977, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  uint64_t v10 = [(TRIClientTreatmentStorage *)self _baseUrlForTreatment:v7 namespaceName:v9];
  id v11 = (void *)MEMORY[0x1E4FB01A8];
  id v12 = [v10 path];
  if (!v12)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 979, @"Expression was unexpectedly nil/false: %@", @"dir.path" object file lineNumber description];
  }
  id v13 = [v11 pathForFactor:v8 directory:v12];

  BOOL v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];

  return v14;
}

- (id)_baseUrlForTreatment:(id)a3 namespaceName:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FB0268];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithPaths:self->_paths];
  uint64_t v10 = [v9 baseUrlForTreatment:v8 namespaceName:v7];

  return v10;
}

- (id)_copyFileFromURL:(id)a3 to:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v9 = a3;
  id v24 = 0;
  uint64_t v10 = (void *)[[v8 alloc] initWithContentsOfURL:v9 options:1 error:&v24];

  id v11 = v24;
  if (!v10)
  {
    id v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v11;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to read source URL: %{public}@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  id v12 = [v7 URLByDeletingLastPathComponent];
  if (!v12)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 999, @"Invalid parameter not satisfying: %@", @"parentURL" object file lineNumber description];
  }
  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v23 = 0;
  char v14 = [v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v23];
  id v15 = v23;

  if ((v14 & 1) == 0)
  {
    id v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v15;
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Failed to create directory for target file: %{public}@", buf, 0xCu);
    }
  }
  id v22 = 0;
  char v17 = [v10 writeToURL:v7 options:268435457 error:&v22];
  id v11 = v22;
  if ((v17 & 1) == 0)
  {
    id v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v11;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Failed to write to target URL: %{public}@", buf, 0xCu);
    }

LABEL_15:
    id v18 = 0;
    goto LABEL_16;
  }
  id v18 = v7;
LABEL_16:

  return v18;
}

- (id)urlForTreatmentWithTreatmentId:(id)a3
{
  id v5 = (objc_class *)MEMORY[0x1E4FB0268];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithPaths:self->_paths];
  id v8 = [v7 baseUrlForTreatment:v6 namespaceName:@"0"];

  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 1024, @"Invalid parameter not satisfying: %@", @"treatmentBasename" object file lineNumber description];
  }
  id v9 = [v8 URLByAppendingPathExtension:@"pb"];
  if (!v9)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIClientTreatmentStorage.m", 1026, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  return v9;
}

- (BOOL)_resolveAssetPathsInTreatment:(id)a3 usingReferenceURL:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([v8 hasDirectoryPath] & 1) == 0)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"TRIClientTreatmentStorage.m" lineNumber:1031 description:@"referenceURL must be a directory"];
  }
  id v9 = [v8 triPathAsOwner:0];
  if (v9)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v10 = [v7 factorLevelArray];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v27 = v8;
      id v28 = v7;
      uint64_t v13 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "level", v27, v28);
          id v16 = [v15 fileOrDirectoryLevelWithIsDir:0];

          if (v16 && [v16 hasPath])
          {
            char v17 = (void *)MEMORY[0x1E4F1CB10];
            id v18 = [v16 path];
            id v19 = [v17 triParseURLFromString:v18];

            if (!v19) {
              goto LABEL_20;
            }
            uint64_t v20 = [v19 triPathAsOwner:0];
            if (!v20)
            {

LABEL_20:
              BOOL v24 = 0;
              goto LABEL_21;
            }
            id v21 = (void *)v20;
            id v22 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v23 = [v22 triPath:v21 relativeToParentPath:v9];

            [v16 setPath:v23];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      BOOL v24 = 1;
LABEL_21:
      id v8 = v27;
      id v7 = v28;
    }
    else
    {
      BOOL v24 = 1;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end