@interface TRIFBClientTreatmentStorage
+ (id)relPathForMAReferenceWithFactorName:(id)a3;
- (BOOL)_deleteOnDemandAssetsWithFactorNames:(id)a3 treatment:(id)a4 namespace:(id)a5 forRollouts:(BOOL)a6;
- (BOOL)_linkAssetsUpdatingTreatment:(id)a3;
- (BOOL)_linkAssetsWithIds:(id)a3 updatingTreatment:(id)a4;
- (BOOL)_removeFactorsWithDescriptor:(id)a3 descriptorDir:(id)a4 treatmentLayer:(unint64_t)a5 namespaceName:(id)a6;
- (BOOL)_removeFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4;
- (BOOL)_removeFactorsWithURL:(id)a3;
- (BOOL)_resolveAssetPathsInTreatment:(id)a3 usingReferenceURL:(id)a4;
- (BOOL)_saveNamespacePartitionedTreatmentsForTreatment:(id)a3 forNamespaceNames:(id)a4 forRollouts:(BOOL)a5;
- (BOOL)_savePersistedTreatment:(id)a3;
- (BOOL)_writeFactorLevelsToDisk:(id)a3 namespaceName:(id)a4 writeToPath:(id)a5;
- (BOOL)removeTreatmentFromLayer:(unint64_t)a3 withNamespaceName:(id)a4 upgradeNCVs:(id)a5;
- (BOOL)removeTreatmentWithTreatmentId:(id)a3;
- (BOOL)removeUnreferencedTreatmentsWithRemovedCount:(unsigned int *)a3;
- (TRIFBClientTreatmentStorage)initWithPaths:(id)a3;
- (TRIFBClientTreatmentStorage)initWithPaths:(id)a3 extractor:(id)a4;
- (id)_assetURLForFactor:(id)a3 treatmentId:(id)a4;
- (id)_baseUrlForTreatment:(id)a3 namespaceName:(id)a4;
- (id)_collectTreatments;
- (id)_convertFastFactorLevelToClientTreatment:(id)a3;
- (id)_copyFileFromURL:(id)a3 to:(id)a4;
- (id)_defaultsAssetURLForFactor:(id)a3;
- (id)_linkAssetWithId:(id)a3 treatmentId:(id)a4 assetStore:(id)a5 factor:(id)a6 forRollouts:(BOOL)a7;
- (id)loadTreatmentWithTreatmentId:(id)a3 isFilePresent:(BOOL *)a4;
- (id)saveTreatment:(id)a3;
- (id)updateSavedTreatmentWithTreatmentId:(id)a3 deletingAssetsWithFactorNames:(id)a4 forNamespaceName:(id)a5 forRollouts:(BOOL)a6;
- (id)updateSavedTreatmentWithTreatmentId:(id)a3 linkingNewAssetIds:(id)a4 forNamespaceNames:(id)a5;
- (id)urlForDefaultFactorsWithNamespaceName:(id)a3;
- (id)urlForFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4;
- (id)urlForTreatmentWithTreatmentId:(id)a3;
- (void)useNamespaceIdInSchema:(BOOL)a3;
@end

@implementation TRIFBClientTreatmentStorage

- (TRIFBClientTreatmentStorage)initWithPaths:(id)a3
{
  id v4 = a3;
  v5 = [[TRIRemoteAssetExtractor alloc] initWithMonitoredActivity:0];
  v6 = [(TRIFBClientTreatmentStorage *)self initWithPaths:v4 extractor:v5];

  return v6;
}

- (TRIFBClientTreatmentStorage)initWithPaths:(id)a3 extractor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIFBClientTreatmentStorage;
  v9 = [(TRIFBClientTreatmentStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

- (void)useNamespaceIdInSchema:(BOOL)a3
{
  populateNamespaceIdInTreatmentSchema = a3;
}

- (id)loadTreatmentWithTreatmentId:(id)a3 isFilePresent:(BOOL *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E016E7F0]();
  if (a4) {
    *a4 = 1;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v9 = [(TRIFBClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v6];
  id v21 = 0;
  v10 = (void *)[v8 initWithContentsOfURL:v9 options:1 error:&v21];
  id v11 = v21;

  if (v10)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB0130]) initVerifiedRootObjectFromData:v10];
    if (v12)
    {
      v13 = v12;
      v14 = [(TRIFBClientTreatmentStorage *)self _convertFastFactorLevelToClientTreatment:v12];
      goto LABEL_17;
    }
    v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Failed to verify content of factor levels: %{public}@", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v15 = [v11 domain];
    v16 = v15;
    if (v15 == (void *)*MEMORY[0x1E4F281F8])
    {
      uint64_t v18 = [v11 code];

      if (a4 && v18 == 260) {
        *a4 = 0;
      }
    }
    else
    {
    }
    v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v20 = [(TRIFBClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v6];
      *(_DWORD *)buf = 138412802;
      id v23 = v6;
      __int16 v24 = 2112;
      v25 = v20;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unable to read treatment with ID %@ from %@: %{public}@", buf, 0x20u);
    }
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (id)saveTreatment:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E016E7F0]();
  if ([v5 hasTreatmentId]
    && ([v5 treatmentId],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v8))
  {
    v9 = [v5 copy];
    if ([v9 factorLevelArray_Count])
    {
      v41 = self;
      v43 = v6;
      context = (void *)MEMORY[0x1E016E7F0]();
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v42 = v9;
      id obj = [v9 factorLevelArray];
      uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      id v11 = 0;
      if (!v47) {
        goto LABEL_33;
      }
      uint64_t v46 = *(void *)v49;
      *(void *)&long long v10 = 138543362;
      long long v39 = v10;
      while (1)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v49 != v46) {
            objc_enumerationMutation(obj);
          }
          v13 = v5;
          v14 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
          if (!v11)
          {
            v15 = [*(id *)(*((void *)&v48 + 1) + 8 * v12) factor];
            v16 = [v15 namespaceName];
            id v11 = +[TRIClientFactorPackUtils aliasesInNamespace:v16];
          }
          v17 = objc_msgSend(v14, "factor", v39);
          uint64_t v18 = [v17 name];
          v19 = [v11 objectForKeyedSubscript:v18];
          v20 = v19;
          if (!v19)
          {
            v45 = [v14 factor];
            v3 = [v45 name];
            v20 = v3;
          }
          id v21 = [v14 factor];
          [v21 setName:v20];

          if (!v19)
          {
          }
          id v5 = v13;
          if ([v14 hasLevel])
          {
            v22 = [v14 level];
            id v23 = [v22 fileOrDirectoryLevelWithIsDir:0];

            if ([v13 hasTreatmentId])
            {
              if ([v23 hasAsset])
              {
                __int16 v24 = [v23 asset];
                char v25 = [v24 hasTreatmentId];

                if ((v25 & 1) == 0)
                {
                  __int16 v26 = TRILogCategory_Server();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    v32 = [v13 treatmentId];
                    v33 = [v14 factor];
                    v34 = [v33 name];
                    *(_DWORD *)buf = 138412546;
                    v53 = v32;
                    __int16 v54 = 2114;
                    v55 = v34;
                    _os_log_debug_impl(&dword_1DA291000, v26, OS_LOG_TYPE_DEBUG, "Populating treatmentId %@ on asset for \"%{public}@\"", buf, 0x16u);

                    id v5 = v13;
                  }

                  id v27 = [v5 treatmentId];
                  uint64_t v28 = [v23 asset];
                  [v28 setTreatmentId:v27];
                }
              }
            }
            if ([v5 hasTreatmentId] && objc_msgSend(v23, "hasAsset"))
            {
              v29 = [v23 asset];
              if ([v29 hasCloudKitContainer]) {
                goto LABEL_29;
              }
              int v30 = [v23 isOnDemand];

              if (v30)
              {
                v31 = TRILogCategory_Server();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  v35 = [v14 factor];
                  v36 = [v35 name];
                  *(_DWORD *)buf = v39;
                  v53 = v36;
                  _os_log_debug_impl(&dword_1DA291000, v31, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\"", buf, 0xCu);
                }
                v29 = [v23 asset];
                [v29 setCloudKitContainer:1];
LABEL_29:
              }
            }
          }
          ++v12;
        }
        while (v47 != v12);
        uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (!v47)
        {
LABEL_33:

          v9 = v42;
          id v6 = v43;
          self = v41;
          break;
        }
      }
    }
    if ([(TRIFBClientTreatmentStorage *)self _linkAssetsUpdatingTreatment:v9]
      && [(TRIFBClientTreatmentStorage *)self _saveNamespacePartitionedTreatmentsForTreatment:v9 forNamespaceNames:0 forRollouts:0]&& [(TRIFBClientTreatmentStorage *)self _savePersistedTreatment:v9])
    {
      v9 = v9;
      v37 = v9;
      goto LABEL_41;
    }
  }
  else
  {
    v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "TRIClientTreatmentArtifact has nil or empty treatmentId", buf, 2u);
    }
  }
  v37 = 0;
LABEL_41:

  return v37;
}

- (id)_convertFastFactorLevelToClientTreatment:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1E016E7F0]();
  id v5 = objc_alloc_init(MEMORY[0x1E4FB0548]);
  id v6 = [v4 sourceAsTreatmentId];
  char v25 = v5;
  [v5 setTreatmentId:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [v4 levels];
  v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  long long v10 = [v4 namespaceName];
  id v11 = [v4 sourceAsTreatmentId];
  uint64_t v12 = [(TRIFBClientTreatmentStorage *)self _baseUrlForTreatment:v11 namespaceName:v10];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  __int16 v26 = v4;
  id obj = [v4 levels];
  uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * v16);
        uint64_t v18 = (void *)MEMORY[0x1E016E7F0](v13);
        v19 = (void *)MEMORY[0x1E4FB0170];
        v20 = objc_msgSend(v12, "path", context);
        id v21 = [v19 convertFBFactorLevelToProtoFactorLevel:v17 parentDir:v20 namespaceName:v10 isRelativePath:0];

        [v9 addObject:v21];
        ++v16;
      }
      while (v14 != v16);
      uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v14 = v13;
    }
    while (v13);
  }

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v9 copyItems:1];
  [v25 setFactorLevelArray:v22];

  return v25;
}

- (id)updateSavedTreatmentWithTreatmentId:(id)a3 linkingNewAssetIds:(id)a4 forNamespaceNames:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E016E7F0]();
  char v19 = 0;
  uint64_t v12 = [(TRIFBClientTreatmentStorage *)self loadTreatmentWithTreatmentId:v8 isFilePresent:&v19];
  if (v12)
  {
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v9 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_debug_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEBUG, "Merging %tu assets for treatment %@.", buf, 0x16u);
    }

    if ([(TRIFBClientTreatmentStorage *)self _linkAssetsWithIds:v9 updatingTreatment:v12]&& [(TRIFBClientTreatmentStorage *)self _saveNamespacePartitionedTreatmentsForTreatment:v12 forNamespaceNames:v10 forRollouts:0]&& [(TRIFBClientTreatmentStorage *)self _savePersistedTreatment:v12])
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
      uint64_t v18 = [(TRIFBClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v8];
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
  id v7 = [TRIAssetStore alloc];
  paths = self->_paths;
  extractor = self->_extractor;
  long long v30 = self;
  id v10 = [[TRIRemoteAssetPatcher alloc] initWithMonitoredActivity:0];
  long long v31 = [(TRIAssetStore *)v7 initWithPaths:paths extractor:extractor patcher:v10];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v32 = v6;
  id v11 = [v6 factorLevelArray];
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
        uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v17 = (void *)MEMORY[0x1E016E7F0]();
        uint64_t v18 = [v16 level];
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
                  char v25 = [v32 treatmentId];
                  __int16 v26 = [v16 factor];
                  id v27 = [(TRIFBClientTreatmentStorage *)v30 _linkAssetWithId:v24 treatmentId:v25 assetStore:v31 factor:v26 forRollouts:0];

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
    [(TRIFBClientTreatmentStorage *)self _defaultsAssetURLForFactor:v16];
  }
  else {
  uint64_t v18 = [(TRIFBClientTreatmentStorage *)self _assetURLForFactor:v16 treatmentId:v14];
  }
  char v19 = [v18 URLByDeletingLastPathComponent];
  v20 = [v19 path];

  if (!v20)
  {
    char v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 276, @"Expression was unexpectedly nil/false: %@", @"[assetURL URLByDeletingLastPathComponent].path" object file lineNumber description];
  }
  [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v20];
  int v21 = [v18 path];
  if (!v21)
  {
    __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 279, @"Expression was unexpectedly nil/false: %@", @"assetURL.path" object file lineNumber description];
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
  BOOL v6 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1E016E7F0]();
  char v21 = 0;
  id v14 = [(TRIFBClientTreatmentStorage *)self loadTreatmentWithTreatmentId:v10 isFilePresent:&v21];
  if (v14)
  {
    [(TRIFBClientTreatmentStorage *)self _deleteOnDemandAssetsWithFactorNames:v11 treatment:v14 namespace:v12 forRollouts:v6];
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v12, 0);
    BOOL v16 = [(TRIFBClientTreatmentStorage *)self _saveNamespacePartitionedTreatmentsForTreatment:v14 forNamespaceNames:v15 forRollouts:v6];

    id v17 = 0;
    if (!v16) {
      goto LABEL_10;
    }
    if ([(TRIFBClientTreatmentStorage *)self _savePersistedTreatment:v14])
    {
      id v17 = v14;
      goto LABEL_10;
    }
  }
  else if (!v21)
  {
    uint64_t v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = [(TRIFBClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v10];
      *(_DWORD *)buf = 138412290;
      id v23 = v20;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "updateSavedTreatmentWithTreatmentId failed because preexisting treatment is not present: %@", buf, 0xCu);
    }
  }
  id v17 = 0;
LABEL_10:

  return v17;
}

- (BOOL)removeUnreferencedTreatmentsWithRemovedCount:(unsigned int *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = [(TRIFBClientTreatmentStorage *)self _collectTreatments];
  if (v4)
  {
    id v5 = [TRITempDirScopeGuard alloc];
    BOOL v6 = [(TRIPaths *)self->_paths localTempDir];
    uint64_t v7 = [(TRITempDirScopeGuard *)v5 initWithPath:v6];

    long long v34 = (void *)v7;
    if (v7)
    {
      v32 = [[TRINamespaceDescriptorSetStorage alloc] initWithPaths:self->_paths];
      long long v35 = [(TRINamespaceDescriptorSetStorage *)v32 parentDirForNamespaceDescriptorSets];
      id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v9 = [v8 fileExistsAtPath:v35];

      if (v9)
      {
        id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        context = (void *)MEMORY[0x1E016E7F0]();
        id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v35 isDirectory:1];
        id v12 = [v10 enumeratorAtURL:v11 includingPropertiesForKeys:0 options:0 errorHandler:0];

        id v13 = (void *)MEMORY[0x1E016E7F0]();
        id v14 = [v12 nextObject];
        if (v14)
        {
          *(void *)&long long v15 = 138412290;
          long long v30 = v15;
          do
          {
            BOOL v16 = objc_msgSend(v14, "path", v30);
            int v17 = [v16 hasSuffix:@".plist"];

            if (v17)
            {
              uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
              char v19 = [v14 path];
              v20 = [v18 dictionaryWithContentsOfFile:v19];

              if (v20)
              {
                char v21 = [objc_alloc(MEMORY[0x1E4FB01A0]) initWithDictionary:v20];
                __int16 v22 = [v21 factorsURL];
                id v23 = [v22 path];
                uint64_t v24 = [v23 stringByDeletingLastPathComponent];
                [v36 addObject:v24];
              }
              else
              {
                char v21 = TRILogCategory_Server();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  char v25 = [v14 path];
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
        v37[2] = __76__TRIFBClientTreatmentStorage_removeUnreferencedTreatmentsWithRemovedCount___block_invoke;
        v37[3] = &unk_1E6BBDBD8;
        id v27 = v36;
        v38 = v27;
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
        id v27 = TRILogCategory_Server();
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

void __76__TRIFBClientTreatmentStorage_removeUnreferencedTreatmentsWithRemovedCount___block_invoke(uint64_t a1, void *a2)
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
    id v8 = [*(id *)(a1 + 40) path];
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

            BOOL v16 = (void *)MEMORY[0x1E016E7F0]();
            uint64_t v17 = [v15 nextObject];
            if (v17)
            {
              uint64_t v18 = (void *)v17;
              while (1)
              {
                char v19 = objc_msgSend(v18, "URLByAppendingPathComponent:", @"treatment.fb", v35);
                uint64_t v20 = [v19 path];
                if (v20)
                {
                  char v21 = (void *)v20;
                  __int16 v22 = [MEMORY[0x1E4F28CB8] defaultManager];
                  id v23 = [v19 path];
                  int v24 = [v22 fileExistsAtPath:v23];

                  if (!v24) {
                    break;
                  }
                }
                char v25 = [v18 path];

                if (v25)
                {
                  BOOL v26 = [v18 path];
                  [v43 addObject:v26];
                }
                BOOL v16 = (void *)MEMORY[0x1E016E7F0]();
                uint64_t v18 = [v15 nextObject];
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
    v44[2] = __49__TRIFBClientTreatmentStorage__collectTreatments__block_invoke;
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
  long long v29 = [v7 domain];
  long long v30 = v29;
  if (v29 == (void *)*MEMORY[0x1E4F281F8])
  {
    uint64_t v31 = [v7 code];

    if (v31 == 260)
    {
      v32 = TRILogCategory_Server();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        v53 = v40;
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
    v53 = v40;
    __int16 v54 = 2112;
    id v55 = v7;
    _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Unable to gather contents of treatment directory %{public}@: %@", buf, 0x16u);
  }

  id v28 = 0;
LABEL_32:

LABEL_33:
  return v28;
}

void __49__TRIFBClientTreatmentStorage__collectTreatments__block_invoke(uint64_t a1, void *a2)
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
      uint64_t v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v32 = TRILoggedNamespaceName(v8);
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
        BOOL v16 = [v14 treatmentId];
        BOOL v17 = [(TRIFBClientTreatmentStorage *)self removeTreatmentWithTreatmentId:v16];
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
         || [(TRIFBClientTreatmentStorage *)self _removeFactorsWithDescriptor:v12 descriptorDir:v11 treatmentLayer:a3 namespaceName:v8];
      long long v29 = TRILogCategory_Server();
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
      BOOL v17 = [(TRIFBClientTreatmentStorage *)self _removeFactorsWithDescriptor:v12 descriptorDir:v11 treatmentLayer:a3 namespaceName:v8];
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E016E7F0]();
  char v27 = 0;
  uint64_t v7 = [(TRIFBClientTreatmentStorage *)self loadTreatmentWithTreatmentId:v5 isFilePresent:&v27];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 factorLevelArray];
    uint64_t v10 = [v9 firstObject];
    BOOL v11 = [v10 factor];
    int v12 = [v11 namespaceName];
    BOOL v13 = [(TRIFBClientTreatmentStorage *)self _removeFactorsWithTreatmentId:v5 namespaceName:v12];

    if (v13)
    {
      uint64_t v14 = [(TRIFBClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v5];
      long long v15 = [v14 path];
      if (!v15)
      {
        char v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 552, @"Invalid parameter not satisfying: %@", @"artifactPath" object file lineNumber description];
      }
      BOOL v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v26 = 0;
      char v17 = [v16 triForceRemoveItemAtPath:v15 error:&v26];
      id v18 = v26;

      if (v17) {
        goto LABEL_6;
      }
      uint64_t v20 = [v18 domain];
      id v21 = v20;
      if (v20 == (void *)*MEMORY[0x1E4F281F8])
      {
        uint64_t v22 = [v18 code];

        if (v22 == 4)
        {
LABEL_6:
          BOOL v19 = 1;
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {
      }
      uint64_t v23 = TRILogCategory_Server();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v29 = v18;
        _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Failed to remove artifact: %{public}@", buf, 0xCu);
      }

      BOOL v19 = 0;
      goto LABEL_15;
    }
    BOOL v19 = 0;
  }
  else
  {
    BOOL v19 = v27 == 0;
  }
LABEL_16:

  return v19;
}

- (BOOL)_removeFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4
{
  uint64_t v4 = self;
  id v5 = [(TRIFBClientTreatmentStorage *)self urlForFactorsWithTreatmentId:a3 namespaceName:a4];
  LOBYTE(v4) = [(TRIFBClientTreatmentStorage *)v4 _removeFactorsWithURL:v5];

  return (char)v4;
}

- (BOOL)_removeFactorsWithDescriptor:(id)a3 descriptorDir:(id)a4 treatmentLayer:(unint64_t)a5 namespaceName:(id)a6
{
  int v7 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  int v12 = [v10 removeFromDirectory:a4];
  BOOL v13 = [v10 factorsURL];

  if (v13)
  {
    uint64_t v14 = [v10 factorsURL];
    v12 &= [(TRIFBClientTreatmentStorage *)self _removeFactorsWithURL:v14];
  }
  else
  {
    long long v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      char v17 = TRILoggedNamespaceName(v11);
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
    [v21 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 596, @"Invalid parameter not satisfying: %@", @"factorsURL" object file lineNumber description];
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
        [v22 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 618, @"Invalid parameter not satisfying: %@", @"parentURL" object file lineNumber description];
      }
      id v9 = [v8 triPathAsOwner:0];
      if (!v9)
      {
        uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 620, @"Invalid parameter not satisfying: %@", @"parentPath" object file lineNumber description];
      }
      char v24 = 0;
      uint64_t v10 = [v5 path];
      if (v10)
      {
        id v11 = (void *)v10;
        int v12 = [v5 path];
        if (+[TRIReferenceManagedDir isPathInManagedDir:v12])
        {
          BOOL v13 = [v5 path];
          BOOL v14 = 1;
          BOOL v15 = +[TRIReferenceManagedDir removeFileInManagedDirWithPath:v13 inUseDeletionBehavior:1 wasDeleted:&v24];

          if (!v15)
          {
            BOOL v16 = TRILogCategory_Server();
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
  id v18 = TRILogCategory_Server();
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
  id v6 = [(TRIFBClientTreatmentStorage *)self _baseUrlForTreatment:a3 namespaceName:a4];
  int v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [v6 path];
  v13[0] = v8;
  v13[1] = @"treatment.fb";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v10 = [v7 fileURLWithPathComponents:v9];

  if (!v10)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"TRIFBClientTreatmentStorage.m" lineNumber:637 description:@"urlForFactorsWithTreatmentId is nil"];
  }
  return v10;
}

- (id)urlForDefaultFactorsWithNamespaceName:(id)a3
{
  return [(TRIFBClientTreatmentStorage *)self urlForFactorsWithTreatmentId:@"defaults" namespaceName:a3];
}

- (BOOL)_savePersistedTreatment:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E016E7F0]();
  int v7 = [v5 treatmentId];
  id v8 = [(TRIFBClientTreatmentStorage *)self urlForTreatmentWithTreatmentId:v7];

  id v9 = [v8 URLByDeletingLastPathComponent];
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 650, @"Invalid parameter not satisfying: %@", @"parentDirURL" object file lineNumber description];
  }
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = 0;
  char v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v12 = v22;

  if ((v11 & 1) == 0)
  {
    BOOL v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v24 = v12;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@", buf, 0xCu);
    }
  }
  BOOL v14 = [v8 path];

  if (v14
    && ([v8 path],
        BOOL v15 = objc_claimAutoreleasedReturnValue(),
        BOOL v16 = [(TRIFBClientTreatmentStorage *)self _writeFactorLevelsToDisk:v5 namespaceName:@"0" writeToPath:v15], v15, v16))
  {
    BOOL v17 = 1;
  }
  else
  {
    id v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v5 treatmentId];
      *(_DWORD *)long long buf = 138412290;
      id v24 = v20;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Unable to write persisted treatment for treatment id:%@", buf, 0xCu);
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_deleteOnDemandAssetsWithFactorNames:(id)a3 treatment:(id)a4 namespace:(id)a5 forRollouts:(BOOL)a6
{
  BOOL v63 = a6;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 treatmentId];
  v67 = self;
  v61 = v11;
  BOOL v13 = [(TRIFBClientTreatmentStorage *)self _baseUrlForTreatment:v12 namespaceName:v11];
  v66 = [v13 path];

  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v62 = v10;
  BOOL v14 = [v10 factorLevelArray];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v77 objects:v86 count:16];
  if (!v15)
  {
    LOBYTE(v18) = 1;
    goto LABEL_40;
  }
  uint64_t v16 = v15;
  SEL v60 = a2;
  uint64_t v17 = *(void *)v78;
  uint64_t v18 = 1;
  v68 = v14;
  do
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v78 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v20 = *(void **)(*((void *)&v77 + 1) + 8 * v19);
      uint64_t v21 = (void *)MEMORY[0x1E016E7F0]();
      id v22 = [v20 level];
      uint64_t v23 = [v22 fileOrDirectoryLevelWithIsDir:0];

      if (!v23)
      {
        v32 = [v20 level];
        int v33 = [v32 levelOneOfCase];

        if (v33 != 104) {
          goto LABEL_27;
        }
        long long v34 = [v20 level];
        id v24 = [v34 mobileAssetReferenceValue];

        if (![v24 isOnDemand]) {
          goto LABEL_26;
        }
        unsigned int v70 = v18;
        id v35 = [v20 factor];
        long long v36 = [v35 name];
        int v37 = [v69 containsObject:v36];

        if (v37)
        {
          long long v38 = objc_opt_class();
          long long v39 = [v20 factor];
          v40 = [v39 name];
          uint64_t v41 = [v38 relPathForMAReferenceWithFactorName:v40];

          __int16 v42 = [v66 stringByAppendingPathComponent:v41];
          id v43 = [MEMORY[0x1E4F28CB8] defaultManager];
          LODWORD(v40) = [v43 fileExistsAtPath:v42];

          if (v40)
          {
            [v64 addObject:v42];
            __int16 v44 = objc_opt_new();
            id v76 = 0;
            char v45 = [v44 writeToFile:v42 options:0x10000000 error:&v76];
            id v65 = v76;

            if ((v45 & 1) == 0)
            {
              long long v46 = TRILogCategory_Server();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                int buf = 138543362;
                v83 = v42;
                _os_log_error_impl(&dword_1DA291000, v46, OS_LOG_TYPE_ERROR, "Unable to nil out MARef by creating a blank file at %{public}@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
        }
        uint64_t v18 = v70;
        goto LABEL_25;
      }
      if (![v23 hasAsset]) {
        goto LABEL_27;
      }
      id v24 = [v23 asset];
      if (![v24 hasCloudKitIndex]) {
        goto LABEL_26;
      }
      int v25 = [v23 hasPath];

      if (!v25) {
        goto LABEL_27;
      }
      uint64_t v26 = v18;
      uint64_t v27 = [v20 factor];
      id v28 = [v27 name];
      int v29 = [v69 containsObject:v28];

      if (v29)
      {
        if ([v23 isOnDemand])
        {
          uint64_t v30 = [v20 factor];
          if (v63)
          {
            uint64_t v31 = [(TRIFBClientTreatmentStorage *)v67 _defaultsAssetURLForFactor:v30];
          }
          else
          {
            uint64_t v47 = [v62 treatmentId];
            uint64_t v31 = [(TRIFBClientTreatmentStorage *)v67 _assetURLForFactor:v30 treatmentId:v47];
          }
          uint64_t v18 = v26;

          id v24 = [v31 path];
          BOOL v14 = v68;
          if (!v24)
          {
            long long v51 = [MEMORY[0x1E4F28B00] currentHandler];
            [v51 handleFailureInMethod:v60, v67, @"TRIFBClientTreatmentStorage.m", 711, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
          }
          [v64 addObject:v24];
          [v23 setPath:0];
          goto LABEL_26;
        }
        id v24 = TRILogCategory_Server();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          long long v48 = [v20 factor];
          long long v49 = [v48 name];
          id v50 = [v62 treatmentId];
          int buf = 138543618;
          v83 = v49;
          __int16 v84 = 2112;
          v85 = v50;
          _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "Factor %{public}@ for treatment %@ is not on-demand.", (uint8_t *)&buf, 0x16u);
        }
        uint64_t v18 = 0;
LABEL_25:
        BOOL v14 = v68;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v18 = v26;
      BOOL v14 = v68;
LABEL_27:

      ++v19;
    }
    while (v16 != v19);
    uint64_t v52 = [v14 countByEnumeratingWithState:&v77 objects:v86 count:16];
    uint64_t v16 = v52;
  }
  while (v52);
LABEL_40:

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v53 = v64;
  uint64_t v54 = [v53 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v73 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        char v71 = 0;
        if (!+[TRIReferenceManagedDir removeFileInManagedDirWithPath:v58 inUseDeletionBehavior:1 wasDeleted:&v71])
        {
          uint64_t v18 = TRILogCategory_Server();
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            int buf = 138543362;
            v83 = v58;
            _os_log_error_impl(&dword_1DA291000, (os_log_t)v18, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@ in managed dir", (uint8_t *)&buf, 0xCu);
          }

          LOBYTE(v18) = 0;
        }
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v72 objects:v81 count:16];
    }
    while (v55);
  }

  return v18 & 1;
}

- (BOOL)_linkAssetsUpdatingTreatment:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v89 = [[TRIAssetStore alloc] initWithPaths:self->_paths];
  id v6 = [v5 factorLevelArray];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v66 = [v5 treatmentId];
      *(_DWORD *)int buf = 138412290;
      v101 = v66;
      _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Treatment %@ has no factor levels. Proceeding without linking assets.", buf, 0xCu);
    }
    BOOL v65 = 1;
    goto LABEL_73;
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v8 = [v5 factorLevelArray];
  uint64_t v92 = [v8 countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (!v92)
  {

LABEL_56:
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v67 = [v5 treatmentId];
      *(_DWORD *)int buf = 138543362;
      v101 = v67;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Unable to find a namespace name from factor levels in treatment %{public}@", buf, 0xCu);
    }
LABEL_72:
    BOOL v65 = 0;
    goto LABEL_73;
  }
  SEL v82 = a2;
  uint64_t v87 = self;
  id v9 = 0;
  uint64_t v91 = *(void *)v97;
  v86 = v5;
  v88 = v8;
  do
  {
    uint64_t v10 = 0;
    id v11 = v9;
    do
    {
      if (*(void *)v97 != v91) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(void **)(*((void *)&v96 + 1) + 8 * v10);
      context = (void *)MEMORY[0x1E016E7F0]();
      BOOL v13 = [v12 factor];
      id v9 = [v13 namespaceName];

      BOOL v14 = [v12 level];
      uint64_t v15 = [v14 fileOrDirectoryLevelWithIsDir:0];

      if (!v15)
      {
        v32 = [v12 level];
        int v33 = [v32 levelOneOfCase];

        if (v33 == 104)
        {
          v90 = v9;
          long long v34 = [v12 factor];
          id v35 = [v34 namespaceString];

          if (!v35)
          {
            uint64_t v20 = TRILogCategory_Server();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_65;
            }
            v68 = [v5 treatmentId];
            id v69 = [v12 factor];
            unsigned int v70 = [v69 name];
            *(_DWORD *)int buf = 138543618;
            v101 = v68;
            __int16 v102 = 2114;
            v103 = v70;
            _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has factor %{public}@ with missing namespaceString.", buf, 0x16u);
            goto LABEL_75;
          }
          long long v36 = [v12 level];
          uint64_t v20 = [v36 mobileAssetReferenceValue];

          if (![v20 hasAssetType]
            || ![v20 hasAssetSpecifier]
            || ([v20 hasAssetVersion] & 1) == 0)
          {
            v68 = TRILogCategory_Server();
            if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
LABEL_59:

              goto LABEL_65;
            }
            id v69 = [v5 treatmentId];
            unsigned int v70 = [v12 factor];
            long long v80 = [v70 name];
            *(_DWORD *)int buf = 138543618;
            v101 = v69;
            __int16 v102 = 2114;
            v103 = v80;
            _os_log_error_impl(&dword_1DA291000, v68, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has factor %{public}@ with incomplete MobileAssetReference.", buf, 0x16u);

LABEL_75:
            id v8 = v88;

            goto LABEL_59;
          }
          int v37 = [v12 factor];
          long long v38 = [v5 treatmentId];
          long long v39 = [v37 namespaceName];
          v40 = [(TRIFBClientTreatmentStorage *)v87 _baseUrlForTreatment:v38 namespaceName:v39];

          v83 = v40;
          uint64_t v41 = [v40 path];
          if (!v41)
          {
            id v53 = [MEMORY[0x1E4F28B00] currentHandler];
            [v53 handleFailureInMethod:v82, v87, @"TRIFBClientTreatmentStorage.m", 845, @"Expression was unexpectedly nil/false: %@", @"targetURL.path" object file lineNumber description];
          }
          __int16 v42 = objc_opt_class();
          v85 = v37;
          id v43 = [v37 name];
          uint64_t v44 = [v42 relPathForMAReferenceWithFactorName:v43];

          __int16 v84 = (void *)v44;
          char v45 = [v41 stringByAppendingPathComponent:v44];
          long long v46 = [v45 stringByDeletingLastPathComponent];
          id v47 = objc_alloc(MEMORY[0x1E4FB0178]);
          long long v48 = [v20 assetType];
          long long v49 = [v20 assetSpecifier];
          id v50 = [v20 assetVersion];
          long long v51 = (void *)[v47 initWithType:v48 specifier:v49 version:v50];

          [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v46];
          if ([v20 hasIsFileFactor]) {
            uint64_t v52 = [v20 isFileFactor];
          }
          else {
            uint64_t v52 = 0;
          }
          id v5 = v86;
          if (![(TRIAssetStore *)v89 referenceMAAutoAssetWithId:v51 isFileFactor:v52 usingCurrentPath:v45 futurePath:v45])
          {
            char v71 = TRILogCategory_Server();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 138543362;
              v101 = v45;
              _os_log_error_impl(&dword_1DA291000, v71, OS_LOG_TYPE_ERROR, "Unable to reference maAutoAsset at %{public}@", buf, 0xCu);
            }

            id v8 = v88;
LABEL_65:
            long long v72 = context;
LABEL_70:

            id v9 = v90;
LABEL_71:

            goto LABEL_72;
          }

          id v9 = v90;
          id v8 = v88;
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
      v90 = v9;
      uint64_t v18 = [v15 asset];
      uint64_t v19 = [v18 assetId];
      uint64_t v20 = TRIValidateAssetId();

      if (!v20)
      {
        long long v73 = TRILogCategory_Server();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          long long v74 = [v5 treatmentId];
          long long v75 = [v15 asset];
          id v76 = [v75 assetId];
          long long v77 = [v12 factor];
          long long v78 = [v77 name];
          *(_DWORD *)int buf = 138412802;
          v101 = v74;
          __int16 v102 = 2114;
          v103 = v76;
          __int16 v104 = 2114;
          v105 = v78;
          _os_log_error_impl(&dword_1DA291000, v73, OS_LOG_TYPE_ERROR, "Treatment %@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);

          id v8 = v88;
          goto LABEL_77;
        }
LABEL_69:
        long long v72 = context;

        goto LABEL_70;
      }
      if (([v12 hasFactor] & 1) == 0)
      {
        long long v73 = TRILogCategory_Server();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          long long v74 = [v5 treatmentId];
          *(_DWORD *)int buf = 138412290;
          v101 = v74;
          _os_log_error_impl(&dword_1DA291000, v73, OS_LOG_TYPE_ERROR, "Treatment %@ has missing factor.", buf, 0xCu);
LABEL_77:
        }
        goto LABEL_69;
      }
      uint64_t v21 = [v12 factor];
      id v22 = [v5 treatmentId];
      uint64_t v23 = [(TRIFBClientTreatmentStorage *)v87 _assetURLForFactor:v21 treatmentId:v22];

      id v24 = [v23 path];
      if (!v24)
      {
        uint64_t v54 = [MEMORY[0x1E4F28B00] currentHandler];
        [v54 handleFailureInMethod:v82, v87, @"TRIFBClientTreatmentStorage.m", 797, @"Expression was unexpectedly nil/false: %@", @"targetURL.path" object file lineNumber description];
      }
      int v25 = [v24 stringByDeletingLastPathComponent];
      uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v95 = 0;
      char v27 = [v26 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v95];
      id v28 = v95;

      if ((v27 & 1) == 0)
      {
        int v29 = TRILogCategory_Server();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 138543362;
          v101 = v28;
          _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Failed to create directory for factor: %{public}@", buf, 0xCu);
        }
      }
      if ([v15 hasIsOnDemand]
        && [v15 isOnDemand]
        && ![(TRIAssetStore *)v89 hasAssetWithIdentifier:v20 type:0])
      {
        char v31 = 0;
        int v30 = 1;
      }
      else if ([(TRIAssetStore *)v89 linkAssetWithIdentifier:v20 toPath:v24])
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

      id v5 = v86;
      id v9 = v90;
      id v8 = v88;
      if (v31) {
        goto LABEL_38;
      }

      if (!v30) {
        goto LABEL_71;
      }
LABEL_39:
      ++v10;
      id v11 = v9;
    }
    while (v92 != v10);
    uint64_t v55 = [v8 countByEnumeratingWithState:&v96 objects:v106 count:16];
    uint64_t v92 = v55;
  }
  while (v55);

  if (!v9) {
    goto LABEL_56;
  }
  uint64_t v56 = [v5 treatmentId];
  uint64_t v57 = [(TRIFBClientTreatmentStorage *)v87 _baseUrlForTreatment:v56 namespaceName:v9];
  v58 = [v57 path];

  if (v58)
  {
    v59 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v94 = 0;
    char v60 = [v59 createDirectoryAtPath:v58 withIntermediateDirectories:1 attributes:0 error:&v94];
    v61 = v94;

    if ((v60 & 1) == 0)
    {
      v62 = TRILogCategory_Server();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 138543618;
        v101 = v58;
        __int16 v102 = 2114;
        v103 = v61;
        _os_log_error_impl(&dword_1DA291000, v62, OS_LOG_TYPE_ERROR, "Failed to create directory for treatment at %{public}@: %{public}@", buf, 0x16u);
      }
    }
    BOOL v63 = v58;
    BOOL v64 = +[TRIReferenceManagedDir createFromDir:v63];

    if (v64)
    {
      BOOL v65 = 1;
      goto LABEL_84;
    }
    v81 = TRILogCategory_Server();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138543362;
      v101 = v63;
      _os_log_error_impl(&dword_1DA291000, v81, OS_LOG_TYPE_ERROR, "Failed to create reference-managed directory at %{public}@ for factor", buf, 0xCu);
    }
  }
  else
  {
    v61 = TRILogCategory_Server();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138543362;
      v101 = v5;
      _os_log_error_impl(&dword_1DA291000, v61, OS_LOG_TYPE_ERROR, "Could not get base URL path for treatment %{public}@", buf, 0xCu);
    }
  }
  BOOL v65 = 0;
LABEL_84:

LABEL_73:
  return v65;
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
  int v25 = [v6 treatmentId];
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
          BOOL v13 = (void *)MEMORY[0x1E016E7F0]();
          BOOL v14 = [v12 factor];
          uint64_t v15 = [v14 namespaceString];

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
    v27[2] = __109__TRIFBClientTreatmentStorage__saveNamespacePartitionedTreatmentsForTreatment_forNamespaceNames_forRollouts___block_invoke;
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

void __109__TRIFBClientTreatmentStorage__saveNamespacePartitionedTreatmentsForTreatment_forNamespaceNames_forRollouts___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
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
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIFBClientTreatmentStorage.m", 937, @"Invalid parameter not satisfying: %@", @"referenceURL" object file lineNumber description];
  }
  if ([*(id *)(a1 + 32) _resolveAssetPathsInTreatment:v8 usingReferenceURL:v12])
  {
    id v28 = v9;
    BOOL v13 = [v8 data];
    if (!v13)
    {
      char v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIFBClientTreatmentStorage.m", 948, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
    }
    BOOL v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v29 = 0;
    char v15 = [v14 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v29];
    id v16 = v29;

    if ((v15 & 1) == 0)
    {
      int v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v31 = v16;
        _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@", buf, 0xCu);
      }
    }
    BOOL v18 = [v11 path];

    if (v18
      && (uint64_t v19 = *(void **)(a1 + 32),
          [v11 path],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v19) = [v19 _writeFactorLevelsToDisk:v8 namespaceName:v7 writeToPath:v20],
          v20,
          (v19 & 1) != 0))
    {
      uint64_t v21 = TRILogCategory_Server();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = *(void **)(a1 + 40);
        uint64_t v23 = [v11 path];
        *(_DWORD *)long long buf = 138543618;
        id v31 = v22;
        __int16 v32 = 2114;
        long long v33 = v23;
        _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "Wrote treament %{public}@ --> %{public}@", buf, 0x16u);
      }
    }
    else
    {
      int v25 = TRILogCategory_Server();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v31 = v16;
        _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Unable to write serialized namespace treatment: %{public}@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *a4 = 1;
    }
    uint64_t v9 = v28;
  }
  else
  {
    id v24 = TRILogCategory_Server();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v12;
      _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "Unable to resolve asset paths with reference URL %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)_writeFactorLevelsToDisk:(id)a3 namespaceName:(id)a4 writeToPath:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 data];
  uint64_t v11 = 2 * [v10 length];

  id v54 = 0;
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F4D8A8]) initWithFileAtPath:v9 capacity:v11 error:&v54];
  id v34 = v54;
  if (v12)
  {
    BOOL v13 = objc_opt_new();
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v60 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    int v53 = 0;
    uint64_t v48 = 0;
    long long v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v51 = 0;
    BOOL v14 = [v8 factorLevelArray];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke;
    v41[3] = &unk_1E6BBDC78;
    char v45 = &v48;
    id v15 = v8;
    id v42 = v15;
    long long v46 = buf;
    id v16 = v12;
    id v43 = v16;
    id v47 = v52;
    int v17 = v13;
    uint64_t v44 = v17;
    [v14 enumerateObjectsUsingBlock:v41];

    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      char v18 = 0;
    }
    else
    {
      uint64_t v19 = [v17 count];
      if (v19 != v49[3])
      {
        SEL v30 = [MEMORY[0x1E4F28B00] currentHandler];
        [v30 handleFailureInMethod:a2 object:self file:@"TRIFBClientTreatmentStorage.m" lineNumber:1217 description:@"Failed to serialize one or more factor levels"];
      }
      uint64_t v20 = [v16 trifbCreateSortedVectorOfFactorLevelWithOffsets:v17];
      uint64_t v21 = [v15 treatmentId];
      id v22 = [v16 createString:v21];

      uint64_t v23 = [v16 createString:v35];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_125;
      v37[3] = &unk_1E6BBDCA0;
      id v31 = v20;
      id v38 = v31;
      id v33 = v22;
      id v39 = v33;
      id v24 = v23;
      id v40 = v24;
      int v25 = [v16 trifbCreateFastFactorLevelsUsingBlock:v37];
      id v36 = 0;
      char v18 = [v16 trifbFinishBufferWithRootFastFactorLevelsOfs:v25 error:&v36];
      id v26 = v36;
      if ((v18 & 1) == 0)
      {
        char v27 = TRILogCategory_Server();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v29 = [v15 treatmentId];
          *(_DWORD *)uint64_t v55 = 138543618;
          uint64_t v56 = v29;
          __int16 v57 = 2114;
          id v58 = v26;
          _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Failed to write factor levels for treatment %{public}@: %{public}@", v55, 0x16u);
        }
      }
    }
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(v52, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v34;
      _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Failed to create factor levels fb at %{public}@: %{public}@", buf, 0x16u);
    }
    char v18 = 0;
  }

  return v18;
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (![v5 hasFactor]
    || ([v5 factor],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 hasName],
        v6,
        (v7 & 1) == 0))
  {
    id v38 = TRILogCategory_Server();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      unsigned int v70 = [*(id *)(a1 + 32) treatmentId];
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v70;
      _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "Factor level has missing factor name in treatment %{public}@.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (([v5 hasLevel] & 1) == 0)
  {
    id v38 = TRILogCategory_Server();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v107 = [v5 factor];
      v108 = [v107 name];
      v109 = [*(id *)(a1 + 32) treatmentId];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v108;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v109;
      _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "Factor %{public}@ has missing level in treatment %{public}@.", buf, 0x16u);
    }
LABEL_8:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_9;
  }
  id v8 = *(void **)(a1 + 40);
  id v9 = [v5 factor];
  uint64_t v10 = [v9 name];
  uint64_t v11 = [v8 createString:v10];

  id v12 = *(void **)(a1 + 40);
  BOOL v13 = [v5 factor];
  BOOL v14 = [v13 namespaceName];
  id v15 = [v12 createString:v14];

  id v16 = *(void **)(a1 + 40);
  int v17 = [v5 factor];
  char v18 = objc_msgSend(v17, "id_p");
  uint64_t v19 = [v16 createString:v18];

  id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v21 = [v5 level];
  id v22 = objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v21, "metadata_Count"));

  uint64_t v23 = [v5 level];
  id v24 = [v23 metadata];
  v168[0] = MEMORY[0x1E4F143A8];
  v168[1] = 3221225472;
  v168[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_106;
  v168[3] = &unk_1E6BB9770;
  id v169 = *(id *)(a1 + 40);
  id v170 = v22;
  id v25 = v22;
  [v24 enumerateKeysAndObjectsUsingBlock:v168];

  id v26 = [*(id *)(a1 + 40) trifbCreateSortedVectorOfFactorMetadataKeyValueWithOffsets:v25];

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v176 = 0;
  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_3;
  v160[3] = &unk_1E6BBDC50;
  id v122 = v19;
  id v161 = v122;
  id v120 = v11;
  id v162 = v120;
  id v121 = v15;
  id v163 = v121;
  id v27 = v26;
  uint64_t v28 = *(void *)(a1 + 72);
  id v123 = v27;
  id v164 = v27;
  uint64_t v166 = v28;
  id v125 = v5;
  id v165 = v125;
  v167 = buf;
  v124 = (void *)MEMORY[0x1E016EA80](v160);
  id v29 = [v125 level];
  int v30 = [v29 levelOneOfCase];

  switch(v30)
  {
    case 10:
      id v31 = objc_alloc(MEMORY[0x1E4FB0110]);
      __int16 v32 = [v125 level];
      id v33 = (id)objc_msgSend(v31, "initWithVal:", objc_msgSend(v32, "BOOLeanValue"));

      id v34 = [*(id *)(a1 + 40) trifbCreateBoxedBoolFromBoxedBool:v33];
      id v35 = *(void **)(a1 + 40);
      v157[0] = MEMORY[0x1E4F143A8];
      v157[1] = 3221225472;
      v157[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_4;
      v157[3] = &unk_1E6BB97C0;
      id v36 = v34;
      id v158 = v36;
      id v159 = v124;
      uint64_t v37 = [v35 trifbCreateFactorLevelUsingBlock:v157];
      [*(id *)(a1 + 48) addObject:v37];

      goto LABEL_30;
    case 11:
      v89 = *(void **)(a1 + 40);
      v90 = [v125 level];
      uint64_t v91 = [v90 stringValue];
      uint64_t v92 = [v89 createString:v91];

      v93 = *(void **)(a1 + 40);
      v154[0] = MEMORY[0x1E4F143A8];
      v154[1] = 3221225472;
      v154[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_5;
      v154[3] = &unk_1E6BB97C0;
      id v33 = v92;
      id v155 = v33;
      id v156 = v124;
      id v94 = [v93 trifbCreateFactorLevelUsingBlock:v154];
      [*(id *)(a1 + 48) addObject:v94];

      id v36 = v155;
      goto LABEL_30;
    case 12:
    case 14:
      goto LABEL_31;
    case 13:
      id v95 = objc_alloc(MEMORY[0x1E4FB0120]);
      long long v96 = [v125 level];
      id v33 = (id)objc_msgSend(v95, "initWithVal:", objc_msgSend(v96, "longValue"));

      long long v97 = [*(id *)(a1 + 40) trifbCreateBoxedInt64FromBoxedInt64:v33];
      long long v98 = *(void **)(a1 + 40);
      v151[0] = MEMORY[0x1E4F143A8];
      v151[1] = 3221225472;
      v151[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_6;
      v151[3] = &unk_1E6BB97C0;
      id v36 = v97;
      id v152 = v36;
      id v153 = v124;
      long long v99 = [v98 trifbCreateFactorLevelUsingBlock:v151];
      [*(id *)(a1 + 48) addObject:v99];

      goto LABEL_30;
    case 15:
      id v100 = objc_alloc(MEMORY[0x1E4FB0118]);
      v101 = [v125 level];
      [v101 doubleValue];
      id v33 = (id)objc_msgSend(v100, "initWithVal:");

      __int16 v102 = [*(id *)(a1 + 40) trifbCreateBoxedDoubleFromBoxedDouble:v33];
      v103 = *(void **)(a1 + 40);
      v148[0] = MEMORY[0x1E4F143A8];
      v148[1] = 3221225472;
      v148[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_7;
      v148[3] = &unk_1E6BB97C0;
      id v36 = v102;
      id v149 = v36;
      id v150 = v124;
      __int16 v104 = [v103 trifbCreateFactorLevelUsingBlock:v148];
      [*(id *)(a1 + 48) addObject:v104];

      goto LABEL_30;
    default:
      if ((v30 - 100) < 2)
      {
        id v39 = [v125 level];
        id v40 = [v39 fileOrDirectoryLevelWithIsDir:0];

        if ([v40 hasAsset])
        {
          uint64_t v41 = [v40 asset];
          if ([v41 hasCloudKitContainer])
          {
LABEL_20:

            goto LABEL_21;
          }
          int v42 = [v40 isOnDemand];

          if (v42)
          {
            id v43 = TRILogCategory_Server();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              v117 = [v125 factor];
              v118 = [v117 name];
              *(_DWORD *)v171 = 138543362;
              v172 = v118;
              _os_log_debug_impl(&dword_1DA291000, v43, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\"", v171, 0xCu);
            }
            uint64_t v41 = [v40 asset];
            [v41 setCloudKitContainer:1];
            goto LABEL_20;
          }
        }
LABEL_21:
        uint64_t v44 = *(void **)(a1 + 40);
        char v45 = [v40 path];
        v119 = [v44 createString:v45];

        long long v46 = *(void **)(a1 + 40);
        id v47 = [v40 asset];
        uint64_t v48 = [v47 assetId];
        long long v49 = [v46 createString:v48];

        uint64_t v50 = *(void **)(a1 + 40);
        uint64_t v51 = [v40 asset];
        uint64_t v52 = [v51 treatmentId];
        int v53 = [v50 createString:v52];

        id v54 = *(void **)(a1 + 40);
        uint64_t v55 = [v40 asset];
        uint64_t v56 = [v55 name];
        __int16 v57 = [v54 createString:v56];

        id v58 = *(void **)(a1 + 40);
        v145[0] = MEMORY[0x1E4F143A8];
        v145[1] = 3221225472;
        v145[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_113;
        v145[3] = &unk_1E6BB97E8;
        id v59 = v40;
        id v146 = v59;
        id v60 = v53;
        id v147 = v60;
        uint64_t v61 = [v58 trifbCreateCloudKitTreatmentRecordAssetUsingBlock:v145];
        v62 = *(void **)(a1 + 40);
        v138[0] = MEMORY[0x1E4F143A8];
        v138[1] = 3221225472;
        v138[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2_115;
        v138[3] = &unk_1E6BB9810;
        id v33 = v59;
        id v139 = v33;
        id v36 = v119;
        id v140 = v36;
        id v141 = v125;
        id v63 = v49;
        id v142 = v63;
        id v64 = v61;
        id v143 = v64;
        id v65 = v57;
        id v144 = v65;
        v66 = [v62 trifbCreateTrialManagedAssetUsingBlock:v138];
        v67 = *(void **)(a1 + 40);
        v135[0] = MEMORY[0x1E4F143A8];
        v135[1] = 3221225472;
        v135[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_3_117;
        v135[3] = &unk_1E6BB97C0;
        id v68 = v66;
        id v136 = v68;
        id v137 = v124;
        id v69 = [v67 trifbCreateFactorLevelUsingBlock:v135];
        [*(id *)(a1 + 48) addObject:v69];

LABEL_30:
LABEL_31:
        if (!*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          v105 = TRILogCategory_Server();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
          {
            v110 = [v125 factor];
            v111 = [v110 name];
            v112 = [v125 level];
            int v113 = [v112 levelOneOfCase];
            *(_DWORD *)v171 = 138543618;
            v172 = v111;
            __int16 v173 = 1024;
            LODWORD(v174) = v113;
            _os_log_error_impl(&dword_1DA291000, v105, OS_LOG_TYPE_ERROR, "Factor %{public}@ has unsupported factor level with type %d.", v171, 0x12u);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          *a4 = 1;
        }
        goto LABEL_38;
      }
      if (v30 != 104) {
        goto LABEL_31;
      }
      char v71 = [v125 level];
      long long v72 = [v71 mobileAssetReferenceValue];

      if ([v72 hasAssetType]
        && [v72 hasAssetSpecifier]
        && ([v72 hasAssetVersion] & 1) != 0)
      {
        long long v73 = *(void **)(a1 + 40);
        long long v74 = [v72 assetType];
        long long v75 = [v73 createString:v74];

        id v76 = *(void **)(a1 + 40);
        long long v77 = [v72 assetSpecifier];
        long long v78 = [v76 createString:v77];

        long long v79 = *(void **)(a1 + 40);
        long long v80 = [v72 assetVersion];
        v81 = [v79 createString:v80];

        SEL v82 = *(void **)(a1 + 40);
        v130[0] = MEMORY[0x1E4F143A8];
        v130[1] = 3221225472;
        v130[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_118;
        v130[3] = &unk_1E6BB9838;
        id v36 = v75;
        id v131 = v36;
        id v83 = v78;
        id v132 = v83;
        id v84 = v81;
        id v133 = v84;
        id v33 = v72;
        id v134 = v33;
        v85 = [v82 trifbCreateMobileAssetReferenceUsingBlock:v130];
        v86 = *(void **)(a1 + 40);
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2_120;
        v127[3] = &unk_1E6BB97C0;
        id v87 = v85;
        id v128 = v87;
        id v129 = v124;
        v88 = [v86 trifbCreateFactorLevelUsingBlock:v127];
        [*(id *)(a1 + 48) addObject:v88];

        goto LABEL_30;
      }
      v106 = TRILogCategory_Server();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        v114 = [v125 factor];
        v115 = [v114 name];
        v116 = [*(id *)(a1 + 32) treatmentId];
        *(_DWORD *)v171 = 138543618;
        v172 = v115;
        __int16 v173 = 2114;
        v174 = v116;
        _os_log_error_impl(&dword_1DA291000, v106, OS_LOG_TYPE_ERROR, "Factor %{public}@ has missing MAAutoAsset metadata in treatment %{public}@.", v171, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      *a4 = 1;

LABEL_38:
      _Block_object_dispose(buf, 8);

      break;
  }
LABEL_9:
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_106(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  char v7 = [v5 createString:a2];
  id v8 = [*(id *)(a1 + 32) createString:v6];

  id v9 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2;
  id v16 = &unk_1E6BB9748;
  id v17 = v7;
  id v18 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = [v9 trifbCreateFactorMetadataKeyValueUsingBlock:&v13];
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12, v13, v14, v15, v16);
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setKey:v3];
  [v4 setVal:*(void *)(a1 + 40)];
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setFactorId:*(void *)(a1 + 32)];
  [v6 setName:*(void *)(a1 + 40)];
  [v6 setFactorNamespaceName:*(void *)(a1 + 48)];
  [v6 setMetadata:*(void *)(a1 + 56)];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  objc_msgSend(v6, "setCacheKey:");
  if (populateNamespaceIdInTreatmentSchema)
  {
    uint64_t v3 = [*(id *)(a1 + 64) factor];
    int v4 = [v3 hasNamespaceId];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 64) factor];
      objc_msgSend(v6, "setNamespaceId:", objc_msgSend(v5, "namespaceId"));
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithBoolVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithStringVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithInt64Val:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithDoubleVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_113(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) asset];
  int v4 = [v3 cloudKitContainer];

  if (v4 == 1)
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) asset];
    int v7 = [v6 cloudKitContainer];

    if (v7 != 2) {
      goto LABEL_6;
    }
    uint64_t v5 = 2;
  }
  [v11 setContainer:v5];
LABEL_6:
  [v11 setTreatmentId:*(void *)(a1 + 40)];
  id v8 = [*(id *)(a1 + 32) asset];
  int v9 = [v8 hasCloudKitIndex];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) asset];
    objc_msgSend(v11, "setAssetIndex:", objc_msgSend(v10, "cloudKitIndex"));

    [v11 setHasCkIndex:1];
  }
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2_115(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([*(id *)(a1 + 32) hasPath]) {
    [v10 setPath:*(void *)(a1 + 40)];
  }
  uint64_t v3 = [*(id *)(a1 + 48) level];
  BOOL v4 = [v3 levelOneOfCase] != 101;

  [v10 setFileType:v4];
  [v10 setAssetId:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 32) hasAsset]) {
    [v10 setCloudKitMetadataWithTreatment:*(void *)(a1 + 64)];
  }
  if ([*(id *)(a1 + 32) hasIsOnDemand])
  {
    objc_msgSend(v10, "setIsOnDemand:", objc_msgSend(*(id *)(a1 + 32), "isOnDemand"));
    [v10 setHasOnDemandFlag:1];
  }
  uint64_t v5 = [*(id *)(a1 + 32) asset];
  int v6 = [v5 hasSize];

  if (v6)
  {
    int v7 = [*(id *)(a1 + 32) asset];
    objc_msgSend(v10, "setDownloadSize:", objc_msgSend(v7, "size"));
  }
  id v8 = [*(id *)(a1 + 32) asset];
  int v9 = [v8 hasName];

  if (v9) {
    [v10 setAssetName:*(void *)(a1 + 72)];
  }
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_3_117(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithTrialAssetVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_118(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setType:*(void *)(a1 + 32)];
  [v3 setSpecifier:*(void *)(a1 + 40)];
  [v3 setVersion:*(void *)(a1 + 48)];
  objc_msgSend(v3, "setFileType:", objc_msgSend(*(id *)(a1 + 56), "isFileFactor"));
  objc_msgSend(v3, "setIsOnDemand:", objc_msgSend(*(id *)(a1 + 56), "isOnDemand"));
  if ([*(id *)(a1 + 56) hasSize]) {
    objc_msgSend(v3, "setDownloadSize:", objc_msgSend(*(id *)(a1 + 56), "size"));
  }
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2_120(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithMaRefVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_125(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setLevels:v3];
  [v4 setSourceWithTreatmentId:a1[5]];
  [v4 setNamespaceName:a1[6]];
}

- (id)_defaultsAssetURLForFactor:(id)a3
{
  return [(TRIFBClientTreatmentStorage *)self _assetURLForFactor:a3 treatmentId:@"defaults"];
}

- (id)_assetURLForFactor:(id)a3 treatmentId:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  int v9 = [v8 namespaceString];
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 1247, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  id v10 = [(TRIFBClientTreatmentStorage *)self _baseUrlForTreatment:v7 namespaceName:v9];
  id v11 = (void *)MEMORY[0x1E4FB01A8];
  id v12 = [v10 path];
  if (!v12)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 1249, @"Expression was unexpectedly nil/false: %@", @"dir.path" object file lineNumber description];
  }
  uint64_t v13 = [v11 pathForFactor:v8 directory:v12];

  uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];

  return v14;
}

- (id)_baseUrlForTreatment:(id)a3 namespaceName:(id)a4
{
  int v6 = (objc_class *)MEMORY[0x1E4FB0268];
  id v7 = a4;
  id v8 = a3;
  int v9 = (void *)[[v6 alloc] initWithPaths:self->_paths];
  id v10 = [v9 baseUrlForTreatment:v8 namespaceName:v7];

  return v10;
}

- (id)_copyFileFromURL:(id)a3 to:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v9 = a3;
  id v24 = 0;
  id v10 = (void *)[[v8 alloc] initWithContentsOfURL:v9 options:1 error:&v24];

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
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 1269, @"Invalid parameter not satisfying: %@", @"parentURL" object file lineNumber description];
  }
  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
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
    uint64_t v19 = TRILogCategory_Server();
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
  uint64_t v5 = (objc_class *)MEMORY[0x1E4FB0268];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithPaths:self->_paths];
  id v8 = [v7 baseUrlForTreatment:v6 namespaceName:@"0"];

  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 1294, @"Invalid parameter not satisfying: %@", @"treatmentBasename" object file lineNumber description];
  }
  id v9 = [v8 URLByAppendingPathExtension:@"fb"];
  if (!v9)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIFBClientTreatmentStorage.m", 1296, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
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
    [v26 handleFailureInMethod:a2 object:self file:@"TRIFBClientTreatmentStorage.m" lineNumber:1301 description:@"referenceURL must be a directory"];
  }
  id v9 = [v8 triPathAsOwner:0];
  if (v9)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = [v7 factorLevelArray];
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
            uint64_t v19 = [v17 triParseURLFromString:v18];

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
            uint64_t v21 = (void *)v20;
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