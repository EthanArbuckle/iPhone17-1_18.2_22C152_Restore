@interface TRIFactorPackStorage
+ (id)relPathForMAReferenceWithFactorName:(id)a3;
- (BOOL)_linkAssetsUpdatingFactorLevel:(id)a3 fromFactorPackWithId:(id)a4 usingAssetStore:(id)a5 currentFactorPackPath:(id)a6 futureFactorPackPath:(id)a7;
- (BOOL)_referenceMAAssetWithId:(id)a3 assetStore:(id)a4 forFactorName:(id)a5 isFileFactor:(BOOL)a6 currentFactorPackPath:(id)a7 futureFactorPackPath:(id)a8;
- (BOOL)_removeUnreferencedFactorPackSetsWithNamespaceName:(id)a3 removedCount:(unsigned int *)a4;
- (BOOL)_removeUnreferencedFactorPackSetsWithParentDir:(id)a3 removedCount:(unsigned int *)a4;
- (BOOL)removeUnreferencedFactorPacksWithRemovedCount:(unsigned int *)a3;
- (BOOL)saveFactorPack:(id)a3 populatingAssetsForFactorNames:(id)a4 aliasToUnaliasMap:(id)a5 factorPackByNamePath:(id *)a6 factorPackByIdPath:(id *)a7;
- (BOOL)saveFactorPackToGlobal:(id)a3 forFactorNames:(id)a4 aliasToUnaliasMap:(id)a5;
- (BOOL)updateSavedFactorPackWithId:(id)a3 namespaceName:(id)a4 deletingAssetsWithFactorNames:(id)a5 inUseAssetBehavior:(unsigned __int8)a6;
- (BOOL)updateSavedFactorPackWithId:(id)a3 namespaceName:(id)a4 populatingAssetsForFactorNames:(id)a5 aliasToUnaliasMap:(id)a6;
- (BOOL)updateSavedGlobalFactorPackAt:(id)a3 deletingAssetsWithFactorNames:(id)a4;
- (BOOL)updateSavedGlobalFactorPackAt:(id)a3 populatingAssetsForFactorNames:(id)a4;
- (TRIFactorPackStorage)initWithPaths:(id)a3;
- (TRIFactorPackStorage)initWithPaths:(id)a3 extractor:(id)a4;
- (id)_legacyParentDirForFactorPackWithNamespaceName:(id)a3;
- (id)_legacyPathForFactorPackWithId:(id)a3 namespaceName:(id)a4;
- (id)_linkAssetWithId:(id)a3 assetStore:(id)a4 forFactorName:(id)a5 currentFactorPackPath:(id)a6 futureFactorPackPath:(id)a7;
- (id)_linkAssetsForFactorNames:(id)a3 aliasToUnaliasMap:(id)a4 copyingModifiedFactorPackWithPath:(id)a5 tempDirRef:(id)a6;
- (id)_parentDirForFactorPackWithNamespaceName:(id)a3;
- (id)_pathForFactorPackWithId:(id)a3 namespaceName:(id)a4;
- (id)_removeAssetsWithFactorNames:(id)a3 copyingModifiedFactorPackWithPath:(id)a4 appendingToPathsToRemove:(id)a5 appendingToMARefsToRemove:(id)a6 tempDirRef:(id)a7;
- (id)_writeFactorPack:(id)a3 futurePath:(id)a4 forFactorNames:(id)a5 aliasToUnaliasMap:(id)a6 assetStore:(id)a7 tempDirRef:(id)a8;
- (id)legacyPathForFactorPackWithId:(id)a3 namespaceName:(id)a4;
- (id)loadFactorPackWithDir:(id)a3;
- (id)loadFactorPackWithId:(id)a3 namespaceName:(id)a4;
- (id)loadParsedFactorPackWithDir:(id)a3;
- (id)loadParsedFactorPackWithId:(id)a3 namespaceName:(id)a4;
- (id)pathForFactorPackWithId:(id)a3 namespaceName:(id)a4;
@end

@implementation TRIFactorPackStorage

- (TRIFactorPackStorage)initWithPaths:(id)a3 extractor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIFactorPackStorage;
  v9 = [(TRIFactorPackStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

- (TRIFactorPackStorage)initWithPaths:(id)a3
{
  id v4 = a3;
  v5 = [[TRIRemoteAssetExtractor alloc] initWithMonitoredActivity:0];
  v6 = [(TRIFactorPackStorage *)self initWithPaths:v4 extractor:v5];

  return v6;
}

- (BOOL)saveFactorPack:(id)a3 populatingAssetsForFactorNames:(id)a4 aliasToUnaliasMap:(id)a5 factorPackByNamePath:(id *)a6 factorPackByIdPath:(id *)a7
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void *)MEMORY[0x1E016E7F0]();
  if ([v12 hasFactorPackId])
  {
    v16 = [v12 factorPackId];
    v17 = TRIValidateFactorPackId();

    if (v17)
    {
      v56 = a6;
      v18 = [v12 selectedNamespace];
      v19 = [v18 name];
      uint64_t v20 = [(TRIFactorPackStorage *)self _pathForFactorPackWithId:v17 namespaceName:v19];

      obj = v20;
      if (v20)
      {
        location = a7;
        v21 = [v12 selectedNamespace];
        v22 = [v21 name];
        uint64_t v23 = [(TRIFactorPackStorage *)self _legacyPathForFactorPackWithId:v17 namespaceName:v22];

        if (!v23)
        {
          v36 = TRILogCategory_Server();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v49 = [v12 factorPackId];
            v50 = [v12 selectedNamespace];
            v51 = [v50 name];
            *(_DWORD *)buf = 138543618;
            v59 = v49;
            __int16 v60 = 2114;
            v61 = v51;
            _os_log_error_impl(&dword_1DA291000, v36, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", buf, 0x16u);
          }
          BOOL v35 = 0;
          goto LABEL_38;
        }
        v55 = v23;
        v24 = [TRIAssetStore alloc];
        paths = self->_paths;
        extractor = self->_extractor;
        v27 = [[TRIRemoteAssetPatcher alloc] initWithMonitoredActivity:0];
        v28 = [(TRIAssetStore *)v24 initWithPaths:paths extractor:extractor patcher:v27];

        v29 = [TRITempDirScopeGuard alloc];
        v30 = [(TRIPaths *)self->_paths localTempDir];
        uint64_t v31 = [(TRITempDirScopeGuard *)v29 initWithPath:v30];

        v32 = (void *)v31;
        if (!v31)
        {
          BOOL v35 = 0;
          v36 = v55;
LABEL_37:

LABEL_38:
          goto LABEL_24;
        }
        uint64_t v33 = [(TRIFactorPackStorage *)self _writeFactorPack:v12 futurePath:obj forFactorNames:v13 aliasToUnaliasMap:v14 assetStore:v28 tempDirRef:v31];
        v34 = -[TRIFactorPackStorage _writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:](self, "_writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:", v12);
        BOOL v35 = 0;
        v53 = (void *)v33;
        if (!v33)
        {
          v36 = v55;
          goto LABEL_36;
        }
        v36 = v55;
        if (!v34)
        {
LABEL_36:

          goto LABEL_37;
        }
        v37 = v34;
        v52 = v32;
        v38 = [obj stringByDeletingLastPathComponent];
        int v39 = [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v38];

        if (v39
          && ([v55 stringByDeletingLastPathComponent],
              v40 = objc_claimAutoreleasedReturnValue(),
              int v41 = [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v40],
              v40,
              v41)
          && [MEMORY[0x1E4F28CB8] triForceRenameWithSourcePath:v53 destPath:obj])
        {
          v36 = v55;
          v32 = v52;
          if (![MEMORY[0x1E4F28CB8] triForceRenameWithSourcePath:v37 destPath:v55])
          {
            BOOL v35 = 0;
            goto LABEL_34;
          }
          v42 = TRILogCategory_Server();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v59 = v17;
            __int16 v60 = 2114;
            v61 = obj;
            _os_log_impl(&dword_1DA291000, v42, OS_LOG_TYPE_DEFAULT, "Wrote factor pack %{public}@ --> %{public}@", buf, 0x16u);
          }

          v43 = TRILogCategory_Server();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v59 = v17;
            __int16 v60 = 2114;
            v61 = v55;
            _os_log_impl(&dword_1DA291000, v43, OS_LOG_TYPE_DEFAULT, "Wrote factor pack %{public}@ --> %{public}@", buf, 0x16u);
          }

          if (v56) {
            objc_storeStrong(v56, obj);
          }
          if (location) {
            objc_storeStrong(location, v55);
          }
          BOOL v35 = 1;
        }
        else
        {
          BOOL v35 = 0;
          v36 = v55;
        }
        v32 = v52;
LABEL_34:
        v34 = v37;
        goto LABEL_36;
      }
      v45 = TRILogCategory_Server();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = [v12 factorPackId];
        v47 = [v12 selectedNamespace];
        v48 = [v47 name];
        *(_DWORD *)buf = 138543618;
        v59 = v46;
        __int16 v60 = 2114;
        v61 = v48;
        _os_log_error_impl(&dword_1DA291000, v45, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", buf, 0x16u);
      }
    }
  }
  else
  {
    v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "TRIClientFactorPack has nil factorPackId", buf, 2u);
    }
  }
  BOOL v35 = 0;
LABEL_24:

  return v35;
}

- (BOOL)saveFactorPackToGlobal:(id)a3 forFactorNames:(id)a4 aliasToUnaliasMap:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 hasFactorPackId] & 1) == 0)
  {
    id v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v44 = 0;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier when saving factor pack globally", v44, 2u);
    }
    goto LABEL_11;
  }
  v11 = [v8 factorPackId];
  id v12 = TRIValidateFactorPackId();

  if (!v12)
  {
LABEL_11:
    LOBYTE(v28) = 0;
    goto LABEL_12;
  }
  id v13 = (void *)MEMORY[0x1E016E7F0]();
  id v14 = [(TRIPaths *)self->_paths treatmentsDirUsingGlobal:1];
  id v15 = [NSString alloc];
  v16 = [v8 selectedNamespace];
  v17 = [v16 name];
  v18 = (void *)[v15 initWithFormat:@"%@/factorPacks/%@", v17, v12];
  v36 = [v14 stringByAppendingPathComponent:v18];

  if (!v36)
  {
    uint64_t v31 = TRILogCategory_Server();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = [v8 selectedNamespace];
      v34 = [v33 name];
      *(_DWORD *)v44 = 138543618;
      *(void *)&v44[4] = v12;
      *(_WORD *)&v44[12] = 2114;
      *(void *)&v44[14] = v34;
      _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", v44, 0x16u);
    }
    goto LABEL_11;
  }
  v19 = [TRIAssetStore alloc];
  paths = self->_paths;
  extractor = self->_extractor;
  v22 = [[TRIRemoteAssetPatcher alloc] initWithMonitoredActivity:0];
  BOOL v35 = [(TRIAssetStore *)v19 initWithPaths:paths extractor:extractor patcher:v22];

  uint64_t v23 = [TRITempDirScopeGuard alloc];
  v24 = [(TRIPaths *)self->_paths localTempDir];
  v25 = [(TRITempDirScopeGuard *)v23 initWithPath:v24];

  if (v25)
  {
    v26 = [(TRIFactorPackStorage *)self _writeFactorPack:v8 futurePath:v36 forFactorNames:v9 aliasToUnaliasMap:v10 assetStore:v35 tempDirRef:v25];
    if (v26)
    {
      *(void *)v44 = 0;
      *(void *)&v44[8] = v44;
      *(void *)&v44[16] = 0x3032000000;
      v45 = __Block_byref_object_copy__21;
      v46 = __Block_byref_object_dispose__21;
      id v47 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __80__TRIFactorPackStorage_saveFactorPackToGlobal_forFactorNames_aliasToUnaliasMap___block_invoke;
      v37[3] = &unk_1E6BB9720;
      id v38 = v9;
      int v39 = v44;
      [v8 enumerateFactorLevelsWithBlock:v37];
      v27 = [[TRIRemoteAssetStoreOperator alloc] initWithPaths:self->_paths];
      BOOL v28 = [(TRIRemoteAssetStoreOperator *)v27 saveFactorPackToGlobalPath:v36 fromTemporaryPath:v26 factors:*(void *)(*(void *)&v44[8] + 40)];
      if (v28)
      {
        v29 = TRILogCategory_Server();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          int v41 = v12;
          __int16 v42 = 2114;
          v43 = v36;
          _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_DEFAULT, "Wrote global factor pack %{public}@ --> %{public}@", buf, 0x16u);
        }
      }
      else
      {
        v29 = TRILogCategory_Server();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          int v41 = v36;
          _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Failed to write global factor pack to %@", buf, 0xCu);
        }
      }

      _Block_object_dispose(v44, 8);
    }
    else
    {
      v32 = TRILogCategory_Server();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Failed to create or copy global factor pack to a temporary directory.", v44, 2u);
      }

      LOBYTE(v28) = 0;
    }
  }
  else
  {
    LOBYTE(v28) = 0;
  }

LABEL_12:
  return v28;
}

uint64_t __80__TRIFactorPackStorage_saveFactorPackToGlobal_forFactorNames_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 hasLevel])
  {
    v3 = [v10 level];
    if ([v3 isFactorOnDemand])
    {
      id v4 = *(void **)(a1 + 32);
      v5 = [v10 factor];
      v6 = [v5 name];
      LODWORD(v4) = [v4 containsObject:v6];

      if (!v4) {
        goto LABEL_6;
      }
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      v3 = [v10 factor];
      id v8 = [v3 name];
      [v7 addObject:v8];
    }
  }
LABEL_6:
  return MEMORY[0x1F41817F8]();
}

- (id)_writeFactorPack:(id)a3 futurePath:(id)a4 forFactorNames:(id)a5 aliasToUnaliasMap:(id)a6 assetStore:(id)a7 tempDirRef:(id)a8
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v33 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (([v14 hasFactorPackId] & 1) == 0)
  {
    uint64_t v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v33;
      _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier when writing factor pack to path: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_12;
  }
  v19 = [v14 factorPackId];
  uint64_t v20 = TRIValidateFactorPackId();

  if (!v20)
  {
LABEL_12:
    v30 = 0;
    goto LABEL_13;
  }
  id v21 = [NSString alloc];
  v22 = objc_opt_new();
  uint64_t v23 = [v22 UUIDString];
  v24 = (void *)[v21 initWithFormat:@"fp-%@-%@", v20, v23];

  v25 = [v18 path];
  v26 = [v25 stringByAppendingPathComponent:v24];

  if (![MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v26])
  {

    goto LABEL_12;
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __107__TRIFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke;
  v35[3] = &unk_1E6BBB368;
  p_long long buf = &buf;
  id v36 = v16;
  id v37 = v15;
  id v38 = self;
  uint64_t v20 = v20;
  int v39 = v20;
  id v40 = v17;
  v27 = v26;
  int v41 = v27;
  id v42 = v33;
  v32 = (void *)MEMORY[0x1E016EA80](v35);
  BOOL v28 = [v27 stringByAppendingPathComponent:@"factorPack.pb"];
  id v34 = 0;
  if (([MEMORY[0x1E4FB00B0] copySourceFactorPack:v14 toDestPath:v28 error:&v34 modifyFactorLevel:v32] & 1) == 0)
  {
    v29 = TRILogCategory_Server();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 138543618;
      v45 = v27;
      __int16 v46 = 2114;
      id v47 = v34;
      _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Failed to copy factor pack to %{public}@: %{public}@", v44, 0x16u);
    }
    goto LABEL_18;
  }
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    v29 = TRILogCategory_Server();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 138412290;
      v45 = v20;
      _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Failed to link assets for factor pack with Id: %@", v44, 0xCu);
    }
LABEL_18:

    goto LABEL_19;
  }
  if ([MEMORY[0x1E4F28CB8] triRemoveFileProtectionIfPresentForPath:v28]
    && +[TRIReferenceManagedDir createFromDir:v27])
  {
    v30 = v27;
    goto LABEL_20;
  }
LABEL_19:
  v30 = 0;
LABEL_20:

  _Block_object_dispose(&buf, 8);
LABEL_13:

  return v30;
}

id __107__TRIFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    goto LABEL_20;
  }
  if ([v3 hasLevel])
  {
    v5 = [v4 level];
    v6 = [v5 fileOrDirectoryLevelWithIsDir:0];

    if ([v6 hasAsset])
    {
      id v7 = [v6 asset];
      if ([v7 hasCloudKitContainer])
      {
LABEL_9:

        goto LABEL_10;
      }
      int v8 = [v6 isOnDemand];

      if (v8)
      {
        id v9 = TRILogCategory_Server();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = [v4 factor];
          id v21 = [v20 name];
          int v22 = 138543362;
          id v23 = v21;
          _os_log_debug_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\"", (uint8_t *)&v22, 0xCu);
        }
        id v7 = [v6 asset];
        [v7 setCloudKitContainer:1];
        goto LABEL_9;
      }
    }
LABEL_10:
  }
  id v10 = *(void **)(a1 + 32);
  v11 = [v4 factor];
  id v12 = [v11 name];
  id v13 = [v10 objectForKeyedSubscript:v12];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v16 = [v4 factor];
    id v15 = [v16 name];
  }
  id v17 = [v4 factor];
  [v17 setName:v15];

  if ([*(id *)(a1 + 40) containsObject:v15]
    && ([*(id *)(a1 + 48) _linkAssetsUpdatingFactorLevel:v4 fromFactorPackWithId:*(void *)(a1 + 56) usingAssetStore:*(void *)(a1 + 64) currentFactorPackPath:*(void *)(a1 + 72) futureFactorPackPath:*(void *)(a1 + 80)] & 1) == 0)
  {
    id v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      id v23 = v15;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to link asset for factor name: %@", (uint8_t *)&v22, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }

LABEL_20:
  return v4;
}

- (id)loadParsedFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  v5 = [(TRIFactorPackStorage *)self pathForFactorPackWithId:a3 namespaceName:a4];
  if (v5)
  {
    v6 = [(TRIFactorPackStorage *)self loadParsedFactorPackWithDir:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)loadFactorPackWithDir:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E016E7F0]();
  v5 = [v3 stringByAppendingPathComponent:@"factorPack.pb"];
  id v14 = 0;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:8 error:&v14];
  id v7 = v14;
  id v8 = v7;
  id v15 = v7;
  if (v6)
  {
    id v15 = 0;

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB00A8]) initWithData:v6 error:&v15];
    if (v9)
    {
      id v10 = v9;
      v11 = v10;
      goto LABEL_10;
    }
    id v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = v15;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to parse TRIClientFactorPack at %{public}@: %{public}@", buf, 0x16u);
    }

    id v10 = 0;
  }
  else
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v17 = v3;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to load TRIClientFactorPack from factor pack directory at %{public}@: %{public}@", buf, 0x16u);
    }
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)loadParsedFactorPackWithDir:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E016E7F0]();
  v5 = [v3 stringByAppendingPathComponent:@"factorPack.pb"];
  id v15 = 0;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:8 error:&v15];
  id v7 = v15;
  id v8 = v7;
  if (v6)
  {

    id v14 = 0;
    id v9 = [MEMORY[0x1E4FB0530] parseFromData:v6 error:&v14];
    id v8 = v14;
    if (v9)
    {
      id v10 = v9;
      v11 = v10;
      goto LABEL_10;
    }
    id v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to parse TRIClientFactorPack at %{public}@: %{public}@", buf, 0x16u);
    }

    id v10 = 0;
  }
  else
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v17 = v3;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to load TRIClientFactorPack from factor pack directory at %{public}@: %{public}@", buf, 0x16u);
    }
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)loadFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E016E7F0]();
  id v9 = [(TRIFactorPackStorage *)self pathForFactorPackWithId:v6 namespaceName:v7];
  if (v9)
  {
    id v10 = [(TRIFactorPackStorage *)self loadFactorPackWithDir:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)updateSavedFactorPackWithId:(id)a3 namespaceName:(id)a4 populatingAssetsForFactorNames:(id)a5 aliasToUnaliasMap:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1E016E7F0]();
  if ([v12 count])
  {
    id v15 = [(TRIFactorPackStorage *)self pathForFactorPackWithId:v10 namespaceName:v11];
    uint64_t v16 = [(TRIFactorPackStorage *)self legacyPathForFactorPackWithId:v10 namespaceName:v11];
    id v17 = v16;
    if (v15 && v16)
    {
      __int16 v18 = [TRITempDirScopeGuard alloc];
      id v19 = [(TRIPaths *)self->_paths localTempDir];
      uint64_t v20 = [(TRITempDirScopeGuard *)v18 initWithPath:v19];

      if (v20)
      {
        if (!v13) {
          id v13 = (id)MEMORY[0x1E4F1CC08];
        }
        id v21 = [(TRIFactorPackStorage *)self _linkAssetsForFactorNames:v12 aliasToUnaliasMap:v13 copyingModifiedFactorPackWithPath:v15 tempDirRef:v20];
        int v22 = [(TRIFactorPackStorage *)self _linkAssetsForFactorNames:v12 aliasToUnaliasMap:v13 copyingModifiedFactorPackWithPath:v17 tempDirRef:v20];
        BOOL v23 = 0;
        if (v21 && v22)
        {
          id v32 = v22;
          id v33 = v21;
          uint64_t v24 = (void *)MEMORY[0x1E4F28CB8];
          v25 = [v15 stringByAppendingPathComponent:@"factorPack.pb"];
          v26 = v24;
          id v21 = v33;
          if ([v26 triRenameOrFaultWithSourcePath:v33 destPath:v25])
          {
            uint64_t v31 = (void *)MEMORY[0x1E4F28CB8];
            v27 = [v17 stringByAppendingPathComponent:@"factorPack.pb"];
            LODWORD(v31) = [v31 triRenameOrFaultWithSourcePath:v32 destPath:v27];

            if (v31)
            {
              BOOL v28 = TRILogCategory_Server();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138543618;
                id v35 = v10;
                __int16 v36 = 2114;
                id v37 = v15;
                _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEFAULT, "Updated factor pack %{public}@ --> %{public}@", buf, 0x16u);
              }

              v29 = TRILogCategory_Server();
              id v21 = v33;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138543618;
                id v35 = v10;
                __int16 v36 = 2114;
                id v37 = v17;
                _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_DEFAULT, "Updated factor pack %{public}@ --> %{public}@", buf, 0x16u);
              }

              BOOL v23 = 1;
            }
            else
            {
              BOOL v23 = 0;
              id v21 = v33;
            }
          }
          else
          {

            BOOL v23 = 0;
          }
          int v22 = v32;
        }

        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v35 = v10;
        _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "updateSavedFactorPackWithId failed because preexisting factor pack %{public}@ is not present on disk.", buf, 0xCu);
      }
    }
    BOOL v23 = 0;
LABEL_26:

    goto LABEL_27;
  }
  id v15 = TRILogCategory_Server();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v35 = v10;
    _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Updating factor pack %{public}@ was a no-op. No factor names specified", buf, 0xCu);
  }
  BOOL v23 = 1;
LABEL_27:

  return v23;
}

- (BOOL)updateSavedGlobalFactorPackAt:(id)a3 populatingAssetsForFactorNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSTemporaryDirectory();
  id v9 = objc_opt_new();
  id v10 = [v9 UUIDString];
  id v11 = [v8 stringByAppendingPathComponent:v10];

  id v12 = [[TRITempDirScopeGuard alloc] initWithPath:v11];
  if (v12)
  {
    id v13 = [(TRIFactorPackStorage *)self _linkAssetsForFactorNames:v7 aliasToUnaliasMap:0 copyingModifiedFactorPackWithPath:v6 tempDirRef:v12];
    if (v13)
    {
      id v14 = (void *)MEMORY[0x1E4F28CB8];
      id v15 = [v6 stringByAppendingPathComponent:@"factorPack.pb"];
      char v16 = [v14 triRenameOrFaultWithSourcePath:v13 destPath:v15];
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)_linkAssetsUpdatingFactorLevel:(id)a3 fromFactorPackWithId:(id)a4 usingAssetStore:(id)a5 currentFactorPackPath:(id)a6 futureFactorPackPath:(id)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v12 factor];
  if (![v17 hasName]
    || ([v17 name],
        __int16 v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 length],
        v18,
        !v19))
  {
    id v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v61 = v13;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor with missing or empty name.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (([v12 hasLevel] & 1) == 0)
  {
    id v21 = TRILogCategory_Server();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      LOBYTE(v30) = 0;
      goto LABEL_14;
    }
    id v33 = [v17 name];
    *(_DWORD *)long long buf = 138543618;
    id v61 = v13;
    __int16 v62 = 2114;
    v63 = v33;
    _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with missing level.", buf, 0x16u);
    goto LABEL_27;
  }
  uint64_t v20 = [v12 level];
  id v21 = [v20 fileOrDirectoryLevelWithIsDir:0];

  if (!v21)
  {
    id v34 = [v12 level];
    int v35 = [v34 levelOneOfCase];

    if (v35 != 104)
    {
LABEL_41:
      id v21 = 0;
      goto LABEL_42;
    }
    __int16 v36 = [v12 factor];
    id v37 = [v36 namespaceString];

    if (v37)
    {
      uint64_t v38 = [v12 level];
      int v39 = [v38 mobileAssetReferenceValue];

      if ([v39 hasAssetType]
        && [v39 hasAssetSpecifier]
        && ([v39 hasAssetVersion] & 1) != 0)
      {
        id v52 = objc_alloc(MEMORY[0x1E4FB0178]);
        v57 = [v39 assetType];
        id v40 = [v39 assetSpecifier];
        int v41 = [v39 assetVersion];
        uint64_t v53 = [v52 initWithType:v57 specifier:v40 version:v41];

        v58 = [v12 factor];
        id v42 = [v58 name];
        if ([v39 hasIsFileFactor]) {
          uint64_t v43 = [v39 isFileFactor];
        }
        else {
          uint64_t v43 = 0;
        }
        uint64_t v49 = (void *)v53;
        BOOL v50 = -[TRIFactorPackStorage _referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:](self, "_referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:", v53, v14, v42, v43, v15, v16, v53);

        if (v50)
        {

          goto LABEL_41;
        }
LABEL_32:

        id v21 = 0;
        goto LABEL_13;
      }
      __int16 v46 = TRILogCategory_Server();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        uint64_t v51 = [v17 name];
        *(_DWORD *)long long buf = 138543618;
        id v61 = v13;
        __int16 v62 = 2114;
        v63 = v51;
        _os_log_error_impl(&dword_1DA291000, v46, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with incomplete MobileAssetReference.", buf, 0x16u);
      }
    }
    else
    {
      int v39 = TRILogCategory_Server();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      __int16 v46 = [v17 name];
      *(_DWORD *)long long buf = 138543618;
      id v61 = v13;
      __int16 v62 = 2114;
      v63 = v46;
      _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with missing namespaceString.", buf, 0x16u);
    }

    goto LABEL_32;
  }
  int v22 = [v12 factor];
  BOOL v23 = [v22 namespaceString];

  if (!v23)
  {
    id v33 = TRILogCategory_Server();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v44 = [v17 name];
      *(_DWORD *)long long buf = 138543618;
      id v61 = v13;
      __int16 v62 = 2114;
      v63 = v44;
      v45 = "Factor pack %{public}@ has factor %{public}@ with missing namespaceString.";
      goto LABEL_37;
    }
LABEL_27:

    goto LABEL_13;
  }
  if (![v21 hasAsset]
    || ([v21 asset],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        char v25 = [v24 hasAssetId],
        v24,
        (v25 & 1) == 0))
  {
    id v33 = TRILogCategory_Server();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v44 = [v17 name];
      *(_DWORD *)long long buf = 138543618;
      id v61 = v13;
      __int16 v62 = 2114;
      v63 = v44;
      v45 = "Factor pack %{public}@ has factor %{public}@ with missing assetId.";
LABEL_37:
      _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, v45, buf, 0x16u);

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  v55 = [v21 asset];
  v26 = [v55 assetId];
  uint64_t v27 = TRIValidateAssetId();

  v56 = (void *)v27;
  if (!v27)
  {
    id v33 = TRILogCategory_Server();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v59 = [v21 asset];
      id v47 = [v59 assetId];
      v54 = [v12 factor];
      uint64_t v48 = [v54 name];
      *(_DWORD *)long long buf = 138543874;
      id v61 = v13;
      __int16 v62 = 2114;
      v63 = v47;
      __int16 v64 = 2114;
      v65 = v48;
      _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);
    }
    goto LABEL_27;
  }
  BOOL v28 = [v12 factor];
  v29 = [v28 name];
  v30 = [(TRIFactorPackStorage *)self _linkAssetWithId:v56 assetStore:v14 forFactorName:v29 currentFactorPackPath:v15 futureFactorPackPath:v16];

  if (v30)
  {
    uint64_t v31 = [v16 stringByAppendingPathComponent:v30];
    [v21 setPath:v31];

LABEL_42:
    LOBYTE(v30) = 1;
    goto LABEL_14;
  }

LABEL_14:
  return (char)v30;
}

- (id)_linkAssetsForFactorNames:(id)a3 aliasToUnaliasMap:(id)a4 copyingModifiedFactorPackWithPath:(id)a5 tempDirRef:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(TRIFactorPackStorage *)self loadFactorPackWithDir:v11];
  if (!v13)
  {
    id v27 = 0;
    goto LABEL_12;
  }
  id v14 = [v12 path];
  id v15 = [NSString alloc];
  id v16 = objc_opt_new();
  id v17 = [v16 UUIDString];
  __int16 v18 = (void *)[v15 initWithFormat:@"fp-update-%@.pb", v17];
  uint64_t v19 = [v14 stringByAppendingPathComponent:v18];

  uint64_t v20 = [TRIAssetStore alloc];
  paths = self->_paths;
  extractor = self->_extractor;
  BOOL v23 = [[TRIRemoteAssetPatcher alloc] initWithMonitoredActivity:0];
  uint64_t v24 = [(TRIAssetStore *)v20 initWithPaths:paths extractor:extractor patcher:v23];

  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __113__TRIFactorPackStorage__linkAssetsForFactorNames_aliasToUnaliasMap_copyingModifiedFactorPackWithPath_tempDirRef___block_invoke;
  v32[3] = &unk_1E6BBB390;
  uint64_t v38 = &v39;
  id v33 = v10;
  id v34 = v30;
  int v35 = self;
  char v25 = v24;
  __int16 v36 = v25;
  id v37 = v11;
  v26 = (void *)MEMORY[0x1E016EA80](v32);
  id v31 = 0;
  if (([MEMORY[0x1E4FB00B0] copySourceFactorPack:v13 toDestPath:v19 error:&v31 modifyFactorLevel:v26] & 1) == 0)
  {
    BOOL v28 = TRILogCategory_Server();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v44 = v31;
      _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "Failed to make modified copy of factor pack: %{public}@", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if (*((unsigned char *)v40 + 24)
    || ![MEMORY[0x1E4F28CB8] triRemoveFileProtectionIfPresentForPath:v19])
  {
LABEL_10:
    id v27 = 0;
    goto LABEL_11;
  }
  id v27 = v19;
LABEL_11:

  _Block_object_dispose(&v39, 8);
LABEL_12:

  return v27;
}

id __113__TRIFactorPackStorage__linkAssetsForFactorNames_aliasToUnaliasMap_copyingModifiedFactorPackWithPath_tempDirRef___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = v4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    || ![v4 hasFactor]
    || ([v5 factor],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 hasName],
        v6,
        (v7 & 1) == 0))
  {
    id v15 = v5;
    goto LABEL_8;
  }
  id v8 = *(void **)(a1 + 32);
  if (v8
    && ([v5 factor],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [(id)v7 name],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v8 objectForKeyedSubscript:v2],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (void *)v9;
    id v11 = *(void **)(a1 + 32);
    id v12 = [v5 factor];
    id v13 = [v12 name];
    id v14 = [v11 objectForKeyedSubscript:v13];
  }
  else
  {
    id v17 = [v5 factor];
    id v14 = [v17 name];

    if (!v8) {
      goto LABEL_13;
    }
  }

LABEL_13:
  if ([*(id *)(a1 + 40) containsObject:v14])
  {
    __int16 v18 = [v5 level];
    uint64_t v19 = [v18 fileOrDirectoryLevelWithIsDir:0];

    if (v19)
    {
      if ([v19 hasPath]) {
        goto LABEL_37;
      }
      if (![v19 hasAsset]) {
        goto LABEL_37;
      }
      uint64_t v20 = [v19 asset];
      char v21 = [v20 hasAssetId];

      if ((v21 & 1) == 0) {
        goto LABEL_37;
      }
      int v22 = [v19 asset];
      BOOL v23 = [v22 assetId];
      uint64_t v24 = TRIValidateAssetId();

      if (!v24) {
        goto LABEL_37;
      }
      char v25 = *(void **)(a1 + 48);
      uint64_t v26 = *(void *)(a1 + 56);
      id v27 = [v5 factor];
      BOOL v28 = [v27 name];
      v29 = [v25 _linkAssetWithId:v24 assetStore:v26 forFactorName:v28 currentFactorPackPath:*(void *)(a1 + 64) futureFactorPackPath:*(void *)(a1 + 64)];

      if (v29)
      {
        id v30 = [*(id *)(a1 + 64) stringByAppendingPathComponent:v29];
        if (!+[TRIReferenceManagedDir saveFromGarbageCollectionItemWithPath:v30])
        {
          id v31 = TRILogCategory_Server();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            int v48 = 138543362;
            uint64_t v49 = v30;
            _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Unable to prevent newly linked asset at path %{public}@ from being garbage collected in the future", (uint8_t *)&v48, 0xCu);
          }
        }
        [v19 setPath:v30];

        goto LABEL_36;
      }
    }
    else
    {
      id v33 = [v5 level];
      int v34 = [v33 levelOneOfCase];

      if (v34 != 104)
      {
LABEL_37:
        id v47 = v5;
        goto LABEL_38;
      }
      int v35 = [v5 level];
      uint64_t v24 = [v35 mobileAssetReferenceValue];

      if (![v24 hasAssetType]
        || ![v24 hasAssetSpecifier]
        || ([v24 hasAssetVersion] & 1) == 0)
      {
        id v45 = v5;

LABEL_38:
        goto LABEL_39;
      }
      id v36 = objc_alloc(MEMORY[0x1E4FB0178]);
      id v37 = [v24 assetType];
      uint64_t v38 = [v24 assetSpecifier];
      uint64_t v39 = [v24 assetVersion];
      v29 = (void *)[v36 initWithType:v37 specifier:v38 version:v39];

      id v40 = *(void **)(a1 + 48);
      uint64_t v41 = *(void *)(a1 + 56);
      char v42 = [v5 factor];
      uint64_t v43 = [v42 name];
      if ([v24 hasIsFileFactor]) {
        uint64_t v44 = [v24 isFileFactor];
      }
      else {
        uint64_t v44 = 0;
      }
      char v46 = [v40 _referenceMAAssetWithId:v29 assetStore:v41 forFactorName:v43 isFileFactor:v44 currentFactorPackPath:*(void *)(a1 + 64) futureFactorPackPath:*(void *)(a1 + 64)];

      if (v46)
      {
LABEL_36:

        goto LABEL_37;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    goto LABEL_36;
  }
  id v32 = v5;
LABEL_39:

LABEL_8:
  return v5;
}

- (id)_linkAssetWithId:(id)a3 assetStore:(id)a4 forFactorName:(id)a5 currentFactorPackPath:(id)a6 futureFactorPackPath:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [a5 triFilenameForFactorName];
  id v16 = (void *)MEMORY[0x1E4F28CB8];
  id v17 = [v12 stringByAppendingPathComponent:@"assets"];
  [v16 triIdempotentCreateDirectoryOrFaultWithPath:v17];

  __int16 v18 = [@"assets" stringByAppendingPathComponent:v15];
  uint64_t v19 = [v12 stringByAppendingPathComponent:v18];

  uint64_t v20 = [v11 stringByAppendingPathComponent:v18];

  LODWORD(v11) = [v13 linkAssetWithIdentifier:v14 toCurrentPath:v19 futurePath:v20];
  if (v11) {
    char v21 = v18;
  }
  else {
    char v21 = 0;
  }
  id v22 = v21;

  return v22;
}

+ (id)relPathForMAReferenceWithFactorName:(id)a3
{
  id v3 = [a3 triFilenameForFactorName];
  id v4 = [@"maRefs" stringByAppendingPathComponent:v3];

  return v4;
}

- (BOOL)_referenceMAAssetWithId:(id)a3 assetStore:(id)a4 forFactorName:(id)a5 isFileFactor:(BOOL)a6 currentFactorPackPath:(id)a7 futureFactorPackPath:(id)a8
{
  uint64_t v9 = a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  __int16 v18 = [(id)objc_opt_class() relPathForMAReferenceWithFactorName:v15];

  uint64_t v19 = [v14 stringByAppendingPathComponent:v18];
  uint64_t v20 = [v19 stringByDeletingLastPathComponent];

  [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v20];
  char v21 = [v14 stringByAppendingPathComponent:v18];

  id v22 = [v13 stringByAppendingPathComponent:v18];

  LOBYTE(v9) = [v16 referenceMAAutoAssetWithId:v17 isFileFactor:v9 usingCurrentPath:v21 futurePath:v22];
  return v9;
}

- (BOOL)updateSavedFactorPackWithId:(id)a3 namespaceName:(id)a4 deletingAssetsWithFactorNames:(id)a5 inUseAssetBehavior:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1E016E7F0]();
  id v14 = [(TRIFactorPackStorage *)self pathForFactorPackWithId:v10 namespaceName:v11];
  uint64_t v15 = [(TRIFactorPackStorage *)self legacyPathForFactorPackWithId:v10 namespaceName:v11];
  id v16 = (void *)v15;
  if (!v14 || !v15)
  {
    uint64_t v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v74 = v10;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "updateSavedFactorPackWithId failed because preexisting factor pack %{public}@ is not present on disk.", buf, 0xCu);
    }
    char v23 = 0;
    goto LABEL_35;
  }
  __int16 v60 = (void *)v15;
  id v17 = [TRITempDirScopeGuard alloc];
  __int16 v18 = [(TRIPaths *)self->_paths localTempDir];
  uint64_t v19 = [(TRITempDirScopeGuard *)v17 initWithPath:v18];

  if (!v19)
  {
    char v23 = 0;
    id v16 = v60;
    goto LABEL_35;
  }
  v57 = v13;
  uint64_t v20 = objc_opt_new();
  v63 = objc_opt_new();
  uint64_t v21 = -[TRIFactorPackStorage _removeAssetsWithFactorNames:copyingModifiedFactorPackWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:](self, "_removeAssetsWithFactorNames:copyingModifiedFactorPackWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:", v12, v14, v20);
  id v16 = v60;
  v58 = (void *)v20;
  id v22 = [(TRIFactorPackStorage *)self _removeAssetsWithFactorNames:v12 copyingModifiedFactorPackWithPath:v60 appendingToPathsToRemove:v20 appendingToMARefsToRemove:0 tempDirRef:v19];
  char v23 = 0;
  v59 = (void *)v21;
  if (!v21)
  {
    id v13 = v57;
    goto LABEL_34;
  }
  id v13 = v57;
  if (!v22) {
    goto LABEL_34;
  }
  v55 = v19;
  v56 = v22;
  uint64_t v24 = (void *)MEMORY[0x1E4F28CB8];
  char v25 = [v14 stringByAppendingPathComponent:@"factorPack.pb"];
  if (([v24 triRenameOrFaultWithSourcePath:v59 destPath:v25] & 1) == 0)
  {

    goto LABEL_30;
  }
  uint64_t v26 = (void *)MEMORY[0x1E4F28CB8];
  id v27 = [v60 stringByAppendingPathComponent:@"factorPack.pb"];
  LODWORD(v26) = [v26 triRenameOrFaultWithSourcePath:v56 destPath:v27];

  if (!v26)
  {
LABEL_30:
    char v23 = 0;
    goto LABEL_33;
  }
  uint64_t v51 = v14;
  id v52 = v12;
  id v53 = v11;
  id v54 = v10;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v28 = v58;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (!v29)
  {
    LOBYTE(v32) = 1;
    goto LABEL_32;
  }
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)v69;
  int v32 = 1;
  id v33 = &off_1E6BB7000;
  int v34 = v63;
  id v62 = v28;
  unsigned int v61 = v6;
  do
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v69 != v31) {
        objc_enumerationMutation(v28);
      }
      id v36 = *(void **)(*((void *)&v68 + 1) + 8 * i);
      char v67 = 0;
      if (!objc_msgSend(v33[137], "removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:", v36, v6, &v67, v51, v52, v53, v54))
      {
        uint64_t v38 = TRILogCategory_Server();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v74 = v36;
          _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@ in managed dir", buf, 0xCu);
        }
        int v32 = 0;
        goto LABEL_20;
      }
      if (v6 == 3)
      {
        id v37 = [v34 objectForKeyedSubscript:v36];

        if (v37)
        {
          uint64_t v38 = [v34 objectForKeyedSubscript:v36];
          uint64_t v39 = objc_opt_new();
          id v40 = objc_alloc(MEMORY[0x1E4FB0178]);
          uint64_t v41 = [v38 assetType];
          [v38 assetSpecifier];
          char v42 = v64 = v32;
          [v38 assetVersion];
          uint64_t v43 = v33;
          v45 = uint64_t v44 = v31;
          char v46 = (void *)[v40 initWithType:v41 specifier:v42 version:v45];

          uint64_t v31 = v44;
          id v33 = v43;

          id v47 = [v39 createAutoAssetWithId:v46 decryptionKey:0 error:0];
          int v48 = [v47 assetSelector];
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __115__TRIFactorPackStorage_updateSavedFactorPackWithId_namespaceName_deletingAssetsWithFactorNames_inUseAssetBehavior___block_invoke;
          v65[3] = &unk_1E6BB9900;
          id v66 = v47;
          id v49 = v47;
          [v39 eliminateAllForSelector:v48 completion:v65];

          int v32 = v64;
          uint64_t v6 = v61;

          int v34 = v63;
          id v28 = v62;
LABEL_20:

          continue;
        }
      }
    }
    uint64_t v30 = [v28 countByEnumeratingWithState:&v68 objects:v72 count:16];
  }
  while (v30);
LABEL_32:
  char v23 = v32;

  id v11 = v53;
  id v10 = v54;
  id v14 = v51;
  id v12 = v52;
  id v13 = v57;
LABEL_33:
  id v16 = v60;
  uint64_t v19 = v55;
  id v22 = v56;
LABEL_34:

LABEL_35:

  return v23 & 1;
}

void __115__TRIFactorPackStorage_updateSavedFactorPackWithId_namespaceName_deletingAssetsWithFactorNames_inUseAssetBehavior___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = TRILogCategory_Server();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Failed to eliminate MAAutoAsset %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Eliminated MAAutoAsset: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)updateSavedGlobalFactorPackAt:(id)a3 deletingAssetsWithFactorNames:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSTemporaryDirectory();
  int v9 = objc_opt_new();
  uint64_t v10 = [v9 UUIDString];
  __int16 v11 = [v8 stringByAppendingPathComponent:v10];

  id v12 = [[TRITempDirScopeGuard alloc] initWithPath:v11];
  if (v12)
  {
    uint64_t v13 = objc_opt_new();
    id v14 = [(TRIFactorPackStorage *)self _removeAssetsWithFactorNames:v7 copyingModifiedFactorPackWithPath:v6 appendingToPathsToRemove:v13 appendingToMARefsToRemove:0 tempDirRef:v12];
    uint64_t v15 = (void *)MEMORY[0x1E4F28CB8];
    id v16 = [v6 stringByAppendingPathComponent:@"factorPack.pb"];
    LOBYTE(v15) = [v15 triRenameOrFaultWithSourcePath:v14 destPath:v16];

    if (v15)
    {
      id v27 = v14;
      id v28 = v12;
      id v29 = v7;
      id v30 = v6;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v17 = v13;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v33;
        char v21 = 1;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v17);
            }
            char v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            char v31 = 0;
            if (!+[TRIReferenceManagedDir removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:](TRIReferenceManagedDir, "removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:", v23, 2, &v31, v27))
            {
              uint64_t v24 = TRILogCategory_Server();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                int buf = 138543362;
                uint64_t v38 = v23;
                _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@ in global managed dir", (uint8_t *)&buf, 0xCu);
              }

              char v21 = 0;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v19);
      }
      else
      {
        char v21 = 1;
      }

      char v25 = TRILogCategory_Server();
      id v6 = v30;
      id v14 = v27;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_INFO, "Successfuly removed factors from global path.", (uint8_t *)&buf, 2u);
      }
      id v7 = v29;
      id v12 = v28;
    }
    else
    {
      char v25 = TRILogCategory_Server();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int buf = 138543618;
        uint64_t v38 = v14;
        __int16 v39 = 2114;
        id v40 = v6;
        _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Failed to move the temp factorPack.pb file in %{public}@ to the global path %{public}@", (uint8_t *)&buf, 0x16u);
      }
      char v21 = 0;
    }
  }
  else
  {
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Failed to create temp directory while attempting to delete assets from global directory.", (uint8_t *)&buf, 2u);
    }
    char v21 = 0;
  }

  return v21 & 1;
}

- (id)_removeAssetsWithFactorNames:(id)a3 copyingModifiedFactorPackWithPath:(id)a4 appendingToPathsToRemove:(id)a5 appendingToMARefsToRemove:(id)a6 tempDirRef:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(TRIFactorPackStorage *)self loadFactorPackWithDir:v13];
  if (!v17)
  {
    id v30 = 0;
    goto LABEL_11;
  }
  id v34 = v16;
  uint64_t v18 = [v16 path];
  long long v33 = self;
  id v19 = [NSString alloc];
  uint64_t v20 = objc_opt_new();
  [v20 UUIDString];
  char v21 = v17;
  id v22 = v13;
  id v23 = v15;
  v25 = id v24 = v12;
  uint64_t v26 = v14;
  id v27 = (void *)[v19 initWithFormat:@"fp-update-%@.pb", v25];
  id v28 = [v18 stringByAppendingPathComponent:v27];

  id v14 = v26;
  id v12 = v24;
  id v15 = v23;
  id v13 = v22;
  id v17 = v21;

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __149__TRIFactorPackStorage__removeAssetsWithFactorNames_copyingModifiedFactorPackWithPath_appendingToPathsToRemove_appendingToMARefsToRemove_tempDirRef___block_invoke;
  v36[3] = &unk_1E6BBB3B8;
  id v37 = v12;
  id v38 = v26;
  __int16 v39 = v33;
  id v40 = v13;
  id v41 = v15;
  id v29 = (void *)MEMORY[0x1E016EA80](v36);
  id v35 = 0;
  if (([MEMORY[0x1E4FB00B0] copySourceFactorPack:v17 toDestPath:v28 error:&v35 modifyFactorLevel:v29] & 1) == 0)
  {
    char v31 = TRILogCategory_Server();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138543362;
      id v43 = v35;
      _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Failed to make modified copy of factor pack: %{public}@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if (![MEMORY[0x1E4F28CB8] triRemoveFileProtectionIfPresentForPath:v28])
  {
LABEL_9:
    id v30 = 0;
    goto LABEL_10;
  }
  id v30 = v28;
LABEL_10:
  id v16 = v34;

LABEL_11:
  return v30;
}

id __149__TRIFactorPackStorage__removeAssetsWithFactorNames_copyingModifiedFactorPackWithPath_appendingToPathsToRemove_appendingToMARefsToRemove_tempDirRef___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 factor];
  char v5 = [v4 hasName];

  if ((v5 & 1) == 0)
  {
    id v13 = v3;
    goto LABEL_21;
  }
  id v6 = [v3 level];
  id v7 = [v6 fileOrDirectoryLevelWithIsDir:0];

  if (v7)
  {
    if ([v7 isOnDemand])
    {
      if ([v7 hasPath])
      {
        uint64_t v8 = *(void **)(a1 + 32);
        int v9 = [v3 factor];
        uint64_t v10 = [v9 name];
        LOBYTE(v8) = [v8 containsObject:v10];

        if (v8)
        {
          __int16 v11 = *(void **)(a1 + 40);
          id v12 = [v7 path];
          [v11 addObject:v12];

          [v7 setPath:0];
        }
      }
    }
  }
  else
  {
    id v14 = [v3 level];
    int v15 = [v14 levelOneOfCase];

    if (v15 == 104)
    {
      id v16 = [v3 level];
      id v17 = [v16 mobileAssetReferenceValue];

      if (![v17 isOnDemand]) {
        goto LABEL_24;
      }
      uint64_t v18 = *(void **)(a1 + 32);
      id v19 = [v3 factor];
      uint64_t v20 = [v19 name];
      LOBYTE(v18) = [v18 containsObject:v20];

      if (v18)
      {
        char v21 = objc_opt_class();
        id v22 = [v3 factor];
        id v23 = [v22 name];
        id v24 = [v21 relPathForMAReferenceWithFactorName:v23];

        char v25 = [*(id *)(a1 + 56) stringByAppendingPathComponent:v24];
        uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v27 = [v26 fileExistsAtPath:v25];

        if (v27)
        {
          [*(id *)(a1 + 40) addObject:v25];
          id v28 = *(void **)(a1 + 64);
          if (v28) {
            [v28 setObject:v17 forKey:v25];
          }
          id v29 = objc_opt_new();
          id v38 = 0;
          char v30 = [v29 writeToFile:v25 options:0x10000000 error:&v38];
          id v31 = v38;

          if ((v30 & 1) == 0)
          {
            long long v32 = TRILogCategory_Server();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 138543362;
              id v40 = v25;
              _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Unable to nil out MARef by creating a blank file at %{public}@", buf, 0xCu);
            }
          }
          id v33 = v3;
        }
        else
        {
          id v37 = v3;
        }
      }
      else
      {
LABEL_24:
        id v36 = v3;
      }

      goto LABEL_20;
    }
  }
  id v34 = v3;
LABEL_20:

LABEL_21:
  return v3;
}

- (id)pathForFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [(TRIFactorPackStorage *)self _pathForFactorPackWithId:a3 namespaceName:a4];
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 fileExistsAtPath:v4];

    if (v6)
    {
      id v7 = v4;
      goto LABEL_8;
    }
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      __int16 v11 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Factor pack does not exist at %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)_pathForFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TRIFactorPackStorage *)self _parentDirForFactorPackWithNamespaceName:v7];
  if (v8)
  {
    int v9 = (void *)MEMORY[0x1E016E7F0]();
    int v10 = [v8 stringByAppendingPathComponent:v6];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)_parentDirForFactorPackWithNamespaceName:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    char v5 = (void *)MEMORY[0x1E016E7F0]();
    id v6 = [(TRIPaths *)self->_paths treatmentsDir];
    id v7 = (void *)[[NSString alloc] initWithFormat:@"%@/factorPacks", v4];
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];
  }
  else
  {
    int v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      uint64_t v12 = "-[TRIFactorPackStorage _parentDirForFactorPackWithNamespaceName:]";
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "%s has empty path arg: namespaceName", buf, 0xCu);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)legacyPathForFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  id v4 = [(TRIFactorPackStorage *)self _legacyPathForFactorPackWithId:a3 namespaceName:a4];
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v5 fileExistsAtPath:v4]) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_legacyPathForFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TRIFactorPackStorage *)self _legacyParentDirForFactorPackWithNamespaceName:v7];
  if (v8)
  {
    int v9 = (void *)MEMORY[0x1E016E7F0]();
    int v10 = [v8 stringByAppendingPathComponent:v6];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)_legacyParentDirForFactorPackWithNamespaceName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    *(_DWORD *)int buf = 0;
    char v5 = TRINamespace_NamespaceId_EnumDescriptor();
    int v6 = [v5 getValue:buf forEnumTextFormatName:v4];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v8 = [(TRIPaths *)self->_paths treatmentsDir];
      id v9 = [NSString alloc];
      int v10 = objc_msgSend(v9, "initWithFormat:", @"%d/factorPacks", *(unsigned int *)buf);
      __int16 v11 = [v8 stringByAppendingPathComponent:v10];

      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      int v15 = "-[TRIFactorPackStorage _legacyParentDirForFactorPackWithNamespaceName:]";
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "%s has empty path arg: namespaceName", buf, 0xCu);
    }
  }
  __int16 v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)removeUnreferencedFactorPacksWithRemovedCount:(unsigned int *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v21 = 0;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = (void *)MEMORY[0x1E4F1CB10];
  int v6 = [(TRIPaths *)self->_paths treatmentsDir];
  id v7 = [v5 fileURLWithPath:v6];
  LOBYTE(v8) = 1;
  id v9 = [v4 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:1 errorHandler:0];

  int v10 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v11 = [v9 nextObject];
  if (v11)
  {
    uint64_t v13 = (void *)v11;
    int v8 = 1;
    *(void *)&long long v12 = 134217984;
    long long v18 = v12;
    do
    {
      id v14 = objc_msgSend(v13, "lastPathComponent", v18);
      if (v14)
      {
        uint64_t v20 = -1;
        if ([MEMORY[0x1E4FB0198] convertFromString:v14 usingBase:10 toI64:&v20])
        {
          if ((unint64_t)(v20 - 1) > 0x7FFFFFFE)
          {
            uint64_t v16 = TRILogCategory_Server();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int buf = v18;
              uint64_t v23 = v20;
              _os_log_debug_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEBUG, "Skipping removal of factor packs for unrecognized id-based namespace: %lld", buf, 0xCu);
            }
          }
          else
          {
            int v15 = TRINamespace_NamespaceId_EnumDescriptor();
            uint64_t v16 = [v15 textFormatNameForValue:v20];

            if (v16)
            {
              v8 &= [(TRIFactorPackStorage *)self _removeUnreferencedFactorPackSetsWithNamespaceName:v16 removedCount:&v21];
            }
            else
            {
              uint64_t v16 = TRILogCategory_Server();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)int buf = v18;
                uint64_t v23 = v20;
                _os_log_debug_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEBUG, "Skipping removal of factor packs for unrecognized id-based namespace: %lld", buf, 0xCu);
              }
            }
          }
        }
        else
        {
          v8 &= [(TRIFactorPackStorage *)self _removeUnreferencedFactorPackSetsWithNamespaceName:v14 removedCount:&v21];
        }
      }

      int v10 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v13 = [v9 nextObject];
    }
    while (v13);
  }
  if (a3) {
    *a3 = v21;
  }

  return v8 & 1;
}

- (BOOL)_removeUnreferencedFactorPackSetsWithNamespaceName:(id)a3 removedCount:(unsigned int *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = (char *)a3;
  if (!a4)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIFactorPackStorage.m", 1133, @"Invalid parameter not satisfying: %@", @"removedCount" object file lineNumber description];
  }
  if ([v7 length])
  {
    int v8 = [(TRIFactorPackStorage *)self _parentDirForFactorPackWithNamespaceName:v7];
    uint64_t v9 = [(TRIFactorPackStorage *)self _legacyParentDirForFactorPackWithNamespaceName:v7];
    int v10 = (void *)v9;
    if (v8 && v9)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v27[0] = v8;
      v27[1] = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        unsigned int v21 = v10;
        id v22 = v8;
        uint64_t v14 = *(void *)v24;
        int v15 = 1;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            long long v18 = (void *)MEMORY[0x1E016E7F0]();
            v15 &= [(TRIFactorPackStorage *)self _removeUnreferencedFactorPackSetsWithParentDir:v17 removedCount:a4];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
        int v10 = v21;
        int v8 = v22;
      }
      else
      {
        LOBYTE(v15) = 1;
      }
    }
    else
    {
      uint64_t v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 138543362;
        char v30 = v7;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Unable to determine parent dir(s) for factor pack with namespace name: %{public}@", buf, 0xCu);
      }
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    int v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      char v30 = "-[TRIFactorPackStorage _removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:]";
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "%s has empty path arg: namespaceName", buf, 0xCu);
    }
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)_removeUnreferencedFactorPackSetsWithParentDir:(id)a3 removedCount:(unsigned int *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4FB0160] arrayFromDirectory:v6];
  if (v7)
  {
    int v8 = [TRITempDirScopeGuard alloc];
    uint64_t v9 = [(TRIPaths *)self->_paths localTempDir];
    int v10 = [(TRITempDirScopeGuard *)v8 initWithPath:v9];

    if (v10)
    {
      uint64_t v17 = 0;
      long long v18 = &v17;
      uint64_t v19 = 0x2020000000;
      char v20 = 1;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __84__TRIFactorPackStorage__removeUnreferencedFactorPackSetsWithParentDir_removedCount___block_invoke;
      v13[3] = &unk_1E6BB9950;
      int v15 = &v17;
      uint64_t v14 = v10;
      uint64_t v16 = a4;
      if ([v7 enumerateStringsWithBlock:v13]) {
        BOOL v11 = *((unsigned char *)v18 + 24) != 0;
      }
      else {
        BOOL v11 = 0;
      }

      _Block_object_dispose(&v17, 8);
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __84__TRIFactorPackStorage__removeUnreferencedFactorPackSetsWithParentDir_removedCount___block_invoke(uint64_t a1, void *a2)
{
  char v9 = 0;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 path];
  BOOL v6 = +[TRIReferenceManagedDir collectGarbageForManagedDir:v4 withExternalReferenceStore:0 usingTempDir:v5 managedDirWasDeleted:&v9];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;

  if (v9) {
    ++**(_DWORD **)(a1 + 48);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end