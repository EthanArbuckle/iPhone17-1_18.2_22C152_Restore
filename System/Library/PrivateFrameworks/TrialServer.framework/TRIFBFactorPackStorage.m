@interface TRIFBFactorPackStorage
+ (id)relPathForMAReferenceWithFactorName:(id)a3;
- (BOOL)_linkAssetsUpdatingFactorLevel:(id)a3 fromFactorPackWithId:(id)a4 usingAssetStore:(id)a5 currentFactorPackPath:(id)a6 futureFactorPackPath:(id)a7;
- (BOOL)_referenceMAAssetWithId:(id)a3 assetStore:(id)a4 forFactorName:(id)a5 isFileFactor:(BOOL)a6 currentFactorPackPath:(id)a7 futureFactorPackPath:(id)a8;
- (BOOL)_removeUnreferencedFactorPackSetsWithNamespaceName:(id)a3 removedCount:(unsigned int *)a4;
- (BOOL)_removeUnreferencedFactorPackSetsWithParentDir:(id)a3 removedCount:(unsigned int *)a4;
- (BOOL)removeUnreferencedFactorLevelsWithRemovedCount:(unsigned int *)a3;
- (BOOL)removeUnreferencedGlobalFactorPacksWithRemovedCount:(unsigned int *)a3;
- (BOOL)saveFactorLevelsForFactorPack:(id)a3 populatingAssetsForFactorNames:(id)a4 aliasToUnaliasMap:(id)a5 factorLevelsByNamePath:(id *)a6 factorLevelsByIdPath:(id *)a7;
- (BOOL)saveFactorPackToGlobal:(id)a3 forFactorNames:(id)a4 aliasToUnaliasMap:(id)a5;
- (BOOL)updateSavedFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4 deletingAssetsWithFactorNames:(id)a5 inUseAssetBehavior:(unsigned __int8)a6;
- (BOOL)updateSavedFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4 populatingAssetsForFactorNames:(id)a5 aliasToUnaliasMap:(id)a6;
- (BOOL)updateSavedGlobalFactorPackAt:(id)a3 deletingAssetsWithFactorNames:(id)a4;
- (BOOL)updateSavedGlobalFactorPackAt:(id)a3 populatingAssetsForFactorNames:(id)a4;
- (TRIFBFactorPackStorage)initWithPaths:(id)a3;
- (TRIFBFactorPackStorage)initWithPaths:(id)a3 extractor:(id)a4;
- (id)_globalFactorPackProviderPlist;
- (id)_legacyParentDirForFactorLevelsWithNamespaceName:(id)a3;
- (id)_legacyPathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4;
- (id)_linkAssetWithId:(id)a3 assetStore:(id)a4 forFactorName:(id)a5 currentFactorPackPath:(id)a6 futureFactorPackPath:(id)a7;
- (id)_linkAssetsForFactorNames:(id)a3 aliasToUnaliasMap:(id)a4 copyingModifiedFactorLevelsWithPath:(id)a5 tempDirRef:(id)a6;
- (id)_parentDirForFactorLevelsWithNamespaceName:(id)a3;
- (id)_pathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4;
- (id)_removeAssetsWithFactorNames:(id)a3 copyingModifiedFactorLevelsWithPath:(id)a4 appendingToPathsToRemove:(id)a5 appendingToMARefsToRemove:(id)a6 tempDirRef:(id)a7;
- (id)_writeFactorPack:(id)a3 futurePath:(id)a4 forFactorNames:(id)a5 aliasToUnaliasMap:(id)a6 assetStore:(id)a7 tempDirRef:(id)a8;
- (id)legacyPathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4;
- (id)loadFactorLevelsWithDir:(id)a3 bufferSize:(unint64_t *)a4;
- (id)loadFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4;
- (id)pathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4;
- (void)_reportFactorPackDiskUsagesWithNamespaceName:(id)a3 namespaceDirName:(id)a4 context:(id)a5;
- (void)reportFactorPackDiskUsagesUsingContext:(id)a3;
- (void)useNamespaceIdInSchema:(BOOL)a3;
@end

@implementation TRIFBFactorPackStorage

- (TRIFBFactorPackStorage)initWithPaths:(id)a3 extractor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIFBFactorPackStorage;
  v9 = [(TRIFBFactorPackStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

- (TRIFBFactorPackStorage)initWithPaths:(id)a3
{
  id v4 = a3;
  v5 = [[TRIRemoteAssetExtractor alloc] initWithMonitoredActivity:0];
  v6 = [(TRIFBFactorPackStorage *)self initWithPaths:v4 extractor:v5];

  return v6;
}

- (void)useNamespaceIdInSchema:(BOOL)a3
{
  populateNamespaceIdInSchema = a3;
}

- (BOOL)saveFactorLevelsForFactorPack:(id)a3 populatingAssetsForFactorNames:(id)a4 aliasToUnaliasMap:(id)a5 factorLevelsByNamePath:(id *)a6 factorLevelsByIdPath:(id *)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void *)MEMORY[0x1E016E7F0]();
  if (([v12 hasFactorPackId] & 1) == 0)
  {
    v19 = TRILogCategory_Server();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v47 = "TRIClientFactorPack has missing factorPackId";
LABEL_38:
    _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, v47, buf, 2u);
    goto LABEL_32;
  }
  if (![v12 hasSelectedNamespace]
    || ([v12 selectedNamespace],
        v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v16 hasName],
        v16,
        (v17 & 1) == 0))
  {
    v19 = TRILogCategory_Server();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v47 = "TRIClientFactorPack has missing namespaceName";
    goto LABEL_38;
  }
  v18 = [v12 factorPackId];
  v19 = TRIValidateFactorPackId();

  if (!v19)
  {
LABEL_32:
    BOOL v35 = 0;
    goto LABEL_33;
  }
  v62 = a7;
  v20 = [v12 selectedNamespace];
  v21 = [v20 name];
  uint64_t v22 = [(TRIFBFactorPackStorage *)self _pathForFactorLevelsWithFactorPackId:v19 namespaceName:v21];

  obj = v22;
  if (!v22)
  {
    v49 = TRILogCategory_Server();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = [v12 factorPackId];
      v51 = [v12 selectedNamespace];
      v52 = [v51 name];
      *(_DWORD *)buf = 138543618;
      v66 = v50;
      __int16 v67 = 2114;
      v68 = v52;
      _os_log_error_impl(&dword_1DA291000, v49, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", buf, 0x16u);
    }
    goto LABEL_32;
  }
  v23 = [v12 selectedNamespace];
  v24 = [v23 name];
  uint64_t v25 = [(TRIFBFactorPackStorage *)self _legacyPathForFactorLevelsWithFactorPackId:v19 namespaceName:v24];

  v63 = v25;
  if (v25)
  {
    v26 = [TRIAssetStore alloc];
    paths = self->_paths;
    extractor = self->_extractor;
    v28 = [[TRIRemoteAssetPatcher alloc] initWithMonitoredActivity:0];
    v29 = [(TRIAssetStore *)v26 initWithPaths:paths extractor:extractor patcher:v28];

    v30 = [TRITempDirScopeGuard alloc];
    v31 = [(TRIPaths *)self->_paths localTempDir];
    v32 = [(TRITempDirScopeGuard *)v30 initWithPath:v31];

    if (v32)
    {
      v33 = [(TRIFBFactorPackStorage *)self _writeFactorPack:v12 futurePath:obj forFactorNames:v13 aliasToUnaliasMap:v14 assetStore:v29 tempDirRef:v32];
      v34 = [(TRIFBFactorPackStorage *)self _writeFactorPack:v12 futurePath:v63 forFactorNames:v13 aliasToUnaliasMap:v14 assetStore:v29 tempDirRef:v32];
      BOOL v35 = 0;
      if (v33 && v34)
      {
        id v60 = v34;
        v36 = [obj stringByDeletingLastPathComponent];
        if ([MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v36]
          && [MEMORY[0x1E4F28CB8] triRemoveFileProtectionIfPresentForPath:v36]
          && (v36,
              [v63 stringByDeletingLastPathComponent],
              v36 = objc_claimAutoreleasedReturnValue(),
              ([MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v36] & 1) != 0)
          && [MEMORY[0x1E4F28CB8] triRemoveFileProtectionIfPresentForPath:v36])
        {
          v56 = v29;
          v57 = v32;

          uint64_t v37 = [v63 stringByAppendingPathComponent:@"factorPack.pb"];
          v59 = [v60 stringByAppendingPathComponent:@"factorPack.pb"];
          v38 = [MEMORY[0x1E4F28CB8] defaultManager];
          v39 = (void *)v37;
          LOBYTE(v37) = [v38 isReadableFileAtPath:v37];

          if (v37)
          {
            v40 = [MEMORY[0x1E4F28CB8] defaultManager];
            [v40 triSafeCopyItemAtPath:v39 toPath:v59 error:0];
          }
          uint64_t v41 = [obj stringByAppendingPathComponent:@"factorPack.pb"];

          v58 = [v33 stringByAppendingPathComponent:@"factorPack.pb"];

          v42 = [MEMORY[0x1E4F28CB8] defaultManager];
          v43 = (void *)v41;
          LODWORD(v41) = [v42 isReadableFileAtPath:v41];

          if (v41)
          {
            v44 = [MEMORY[0x1E4F28CB8] defaultManager];
            [v44 triSafeCopyItemAtPath:v43 toPath:v58 error:0];
          }
          if ([MEMORY[0x1E4F28CB8] triForceRenameWithSourcePath:v33 destPath:obj]
            && [MEMORY[0x1E4F28CB8] triForceRenameWithSourcePath:v60 destPath:v63])
          {

            v45 = TRILogCategory_Server();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v66 = v19;
              __int16 v67 = 2114;
              v68 = obj;
              _os_log_impl(&dword_1DA291000, v45, OS_LOG_TYPE_DEFAULT, "Wrote factor pack %{public}@ --> %{public}@", buf, 0x16u);
            }

            v46 = TRILogCategory_Server();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v66 = v19;
              __int16 v67 = 2114;
              v68 = v63;
              _os_log_impl(&dword_1DA291000, v46, OS_LOG_TYPE_DEFAULT, "Wrote factor pack %{public}@ --> %{public}@", buf, 0x16u);
            }

            if (a6) {
              objc_storeStrong(a6, obj);
            }
            if (v62) {
              objc_storeStrong(v62, v63);
            }
            BOOL v35 = 1;
            v29 = v56;
            v32 = v57;
          }
          else
          {

            BOOL v35 = 0;
            v29 = v56;
            v32 = v57;
          }
        }
        else
        {

          BOOL v35 = 0;
        }
        v34 = v60;
      }
    }
    else
    {
      BOOL v35 = 0;
    }
  }
  else
  {
    v63 = TRILogCategory_Server();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v53 = [v12 factorPackId];
      v54 = [v12 selectedNamespace];
      v55 = [v54 name];
      *(_DWORD *)buf = 138543618;
      v66 = v53;
      __int16 v67 = 2114;
      v68 = v55;
      _os_log_error_impl(&dword_1DA291000, v63, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", buf, 0x16u);
    }
    BOOL v35 = 0;
  }

LABEL_33:

  return v35;
}

- (BOOL)saveFactorPackToGlobal:(id)a3 forFactorNames:(id)a4 aliasToUnaliasMap:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v43 = a4;
  id v42 = a5;
  v9 = [v8 factorPackId];
  v10 = TRIValidateFactorPackId();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E016E7F0]();
    id v12 = [(TRIPaths *)self->_paths treatmentsDirUsingGlobal:1];
    id v13 = [NSString alloc];
    id v14 = [v8 selectedNamespace];
    v15 = [v14 name];
    v16 = (void *)[v13 initWithFormat:@"%@/factorPacks", v15];
    char v17 = [v12 stringByAppendingPathComponent:v16];
    v18 = [v17 stringByAppendingPathComponent:v10];

    if (v18)
    {
      v19 = [TRIAssetStore alloc];
      paths = self->_paths;
      extractor = self->_extractor;
      uint64_t v22 = [[TRIRemoteAssetPatcher alloc] initWithMonitoredActivity:0];
      uint64_t v41 = [(TRIAssetStore *)v19 initWithPaths:paths extractor:extractor patcher:v22];

      v23 = [TRITempDirScopeGuard alloc];
      v24 = [(TRIPaths *)self->_paths localTempDir];
      uint64_t v25 = [(TRITempDirScopeGuard *)v23 initWithPath:v24];

      if (v25)
      {
        v26 = [(TRIFBFactorPackStorage *)self _writeFactorPack:v8 futurePath:v18 forFactorNames:v43 aliasToUnaliasMap:v42 assetStore:v41 tempDirRef:v25];
        if (v26)
        {
          v27 = [v18 stringByAppendingPathComponent:@"factorPack.pb"];
          v28 = [v26 stringByAppendingPathComponent:@"factorPack.pb"];
          v29 = [MEMORY[0x1E4F28CB8] defaultManager];
          v40 = v26;
          int v30 = [v29 isReadableFileAtPath:v27];

          if (v30)
          {
            v31 = [MEMORY[0x1E4F28CB8] defaultManager];
            [v31 triSafeCopyItemAtPath:v27 toPath:v28 error:0];
          }
          *(void *)v51 = 0;
          *(void *)&v51[8] = v51;
          *(void *)&v51[16] = 0x3032000000;
          v52 = __Block_byref_object_copy__10;
          v53 = __Block_byref_object_dispose__10;
          v26 = v40;
          id v54 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __82__TRIFBFactorPackStorage_saveFactorPackToGlobal_forFactorNames_aliasToUnaliasMap___block_invoke;
          v44[3] = &unk_1E6BB9720;
          id v45 = v43;
          v46 = v51;
          [v8 enumerateFactorLevelsWithBlock:v44];
          v32 = [[TRIRemoteAssetStoreOperator alloc] initWithPaths:self->_paths];
          BOOL v33 = [(TRIRemoteAssetStoreOperator *)v32 saveFactorPackToGlobalPath:v18 fromTemporaryPath:v40 factors:*(void *)(*(void *)&v51[8] + 40)];
          if (v33)
          {
            v34 = TRILogCategory_Server();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v48 = v10;
              __int16 v49 = 2114;
              v50 = v18;
              _os_log_impl(&dword_1DA291000, v34, OS_LOG_TYPE_DEFAULT, "Wrote global factor pack %{public}@ --> %{public}@", buf, 0x16u);
            }
          }
          else
          {
            v34 = TRILogCategory_Server();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v18;
              _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "Failed to write global factor pack to %@", buf, 0xCu);
            }
          }

          _Block_object_dispose(v51, 8);
        }
        else
        {
          BOOL v35 = TRILogCategory_Server();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v51 = 0;
            _os_log_error_impl(&dword_1DA291000, v35, OS_LOG_TYPE_ERROR, "Failed to create or copy global fb factor pack to a temporary directory.", v51, 2u);
          }

          LOBYTE(v33) = 0;
        }
      }
      else
      {
        LOBYTE(v33) = 0;
      }
    }
    else
    {
      v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = [v8 factorPackId];
        v38 = [v8 selectedNamespace];
        v39 = [v38 name];
        *(_DWORD *)v51 = 138543618;
        *(void *)&v51[4] = v37;
        *(_WORD *)&v51[12] = 2114;
        *(void *)&v51[14] = v39;
        _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", v51, 0x16u);
      }
      LOBYTE(v33) = 0;
    }
  }
  else
  {
    LOBYTE(v33) = 0;
  }

  return v33;
}

uint64_t __82__TRIFBFactorPackStorage_saveFactorPackToGlobal_forFactorNames_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v58 = a4;
  id v57 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (([v15 hasFactorPackId] & 1) == 0)
  {
    v20 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v58;
      _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier when writing factor pack to path: %{public}@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v19 = [v15 factorPackId];
  v20 = TRIValidateFactorPackId();

  if (!v20)
  {
LABEL_11:
    id v29 = 0;
    goto LABEL_12;
  }
  id v21 = [NSString alloc];
  uint64_t v22 = objc_opt_new();
  v23 = [v22 UUIDString];
  v24 = (void *)[v21 initWithFormat:@"fl-%@-%@", v20, v23];

  uint64_t v25 = [v18 path];
  v56 = [v25 stringByAppendingPathComponent:v24];

  if (![MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v56]
    || ![MEMORY[0x1E4F28CB8] triRemoveFileProtectionIfPresentForPath:v56])
  {

    goto LABEL_11;
  }

  v26 = [v15 data];
  uint64_t v27 = [v26 length];

  id v54 = [v56 stringByAppendingPathComponent:@"factorPack.fb"];
  id v86 = 0;
  uint64_t v55 = (void *)[objc_alloc(MEMORY[0x1E4F4D8A8]) initWithFileAtPath:v54 capacity:2 * v27 error:&v86];
  id v52 = v86;
  if (!v55)
  {
    oslog = TRILogCategory_Server();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v56;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v52;
      _os_log_error_impl(&dword_1DA291000, oslog, OS_LOG_TYPE_ERROR, "Failed to create factor levels fb at %{public}@: %{public}@", buf, 0x16u);
    }
    id v29 = 0;
    goto LABEL_29;
  }
  v28 = objc_opt_new();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v92 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  int v85 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  uint64_t v83 = 0;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke;
  v67[3] = &unk_1E6BB9860;
  v77 = &v80;
  __int16 v49 = v20;
  v68 = v49;
  v78 = buf;
  id v69 = v16;
  id v50 = v55;
  id v70 = v50;
  v79 = v84;
  oslog = v28;
  v71 = oslog;
  id v72 = v57;
  v73 = self;
  id v74 = v17;
  id v48 = v56;
  id v75 = v48;
  id v76 = v58;
  [v15 enumerateFactorLevelsWithBlock:v67];
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    uint64_t v31 = [oslog count];
    if (v31 != v81[3])
    {
      id v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:a2 object:self file:@"TRIFBFactorPackStorage.m" lineNumber:630 description:@"Failed to serialize one or more factor levels"];
    }
    v46 = [v50 trifbCreateSortedVectorOfFactorLevelWithOffsets:oslog];
    v32 = [v50 createString:v49];
    BOOL v33 = [v15 selectedNamespace];
    uint64_t v34 = [v33 name];
    id v45 = [v50 createString:v34];

    BOOL v35 = [v15 selectedNamespace];
    uint64_t v36 = objc_msgSend(v35, "compatibilityVersionArray_Count");
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_388;
    v65[3] = &unk_1E6BB9888;
    id v66 = v15;
    uint64_t v37 = [v50 createVectorOfUInt32WithCount:v36 block:v65];

    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_390;
    v60[3] = &unk_1E6BB98B0;
    id v38 = v46;
    id v61 = v38;
    id v44 = v32;
    id v62 = v44;
    id v39 = v45;
    id v63 = v39;
    id v47 = v37;
    id v64 = v47;
    v40 = [v50 trifbCreateFastFactorLevelsUsingBlock:v60];
    id v59 = 0;
    LOBYTE(v34) = [v50 trifbFinishBufferWithRootFastFactorLevelsOfs:v40 error:&v59];
    id v51 = v59;
    if (v34)
    {
      uint64_t v41 = v39;
      if (+[TRIReferenceManagedDir createFromDir:v48])
      {
        id v29 = v48;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      id v42 = TRILogCategory_Server();
      uint64_t v41 = v39;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v87 = 138543618;
        v88 = v49;
        __int16 v89 = 2114;
        id v90 = v51;
        _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "Failed to write factor levels for factor pack %{public}@: %{public}@", v87, 0x16u);
      }
    }
    id v29 = 0;
    goto LABEL_27;
  }
  id v29 = 0;
LABEL_28:

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(buf, 8);
LABEL_29:

LABEL_12:
  return v29;
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
  if (![v4 hasFactor]
    || ([v4 factor],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 hasName],
        v5,
        (v6 & 1) == 0))
  {
    id v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v72 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v72;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Factor level has missing factor name in factor pack %{public}@.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (([v4 hasLevel] & 1) == 0)
  {
    id v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v109 = [v4 factor];
      v110 = [v109 name];
      uint64_t v111 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v110;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v111;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Factor %{public}@ has missing level in factor pack %{public}@.", buf, 0x16u);
    }
LABEL_8:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
    *a3 = 1;
    goto LABEL_9;
  }
  id v7 = *(void **)(a1 + 40);
  id v8 = [v4 factor];
  v9 = [v8 name];
  id v10 = [v7 objectForKeyedSubscript:v9];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v14 = [v4 factor];
    id v12 = [v14 name];
  }
  v127 = v12;
  id v15 = [*(id *)(a1 + 48) createString:v12];
  id v16 = [v4 factor];
  [v16 setName:v12];

  id v17 = *(void **)(a1 + 48);
  id v18 = [v4 factor];
  v19 = objc_msgSend(v18, "id_p");
  v20 = [v17 createString:v19];

  id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v22 = [v4 level];
  v23 = objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v22, "metadata_Count"));

  v24 = [v4 level];
  uint64_t v25 = [v24 metadata];
  v169[0] = MEMORY[0x1E4F143A8];
  v169[1] = 3221225472;
  v169[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_366;
  v169[3] = &unk_1E6BB9770;
  id v170 = *(id *)(a1 + 48);
  id v171 = v23;
  id v26 = v23;
  [v25 enumerateKeysAndObjectsUsingBlock:v169];

  uint64_t v27 = [*(id *)(a1 + 48) trifbCreateSortedVectorOfFactorMetadataKeyValueWithOffsets:v26];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v177 = 0;
  v162[0] = MEMORY[0x1E4F143A8];
  v162[1] = 3221225472;
  v162[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_3;
  v162[3] = &unk_1E6BB9798;
  id v124 = v20;
  id v163 = v124;
  id v123 = v15;
  id v164 = v123;
  id v28 = v4;
  id v165 = v28;
  id v29 = v27;
  uint64_t v30 = *(void *)(a1 + 120);
  id v125 = v29;
  id v166 = v29;
  uint64_t v167 = v30;
  v168 = buf;
  v126 = (void *)MEMORY[0x1E016EA80](v162);
  uint64_t v31 = [v28 level];
  int v32 = [v31 levelOneOfCase];

  switch(v32)
  {
    case 10:
      id v33 = objc_alloc(MEMORY[0x1E4FB0110]);
      uint64_t v34 = [v28 level];
      id v35 = (id)objc_msgSend(v33, "initWithVal:", objc_msgSend(v34, "BOOLeanValue"));

      uint64_t v36 = [*(id *)(a1 + 48) trifbCreateBoxedBoolFromBoxedBool:v35];
      uint64_t v37 = *(void **)(a1 + 48);
      v159[0] = MEMORY[0x1E4F143A8];
      v159[1] = 3221225472;
      v159[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_4;
      v159[3] = &unk_1E6BB97C0;
      id v38 = v36;
      id v160 = v38;
      id v161 = v126;
      id v39 = [v37 trifbCreateFactorLevelUsingBlock:v159];
      [*(id *)(a1 + 56) addObject:v39];

      goto LABEL_37;
    case 11:
      v91 = *(void **)(a1 + 48);
      char v92 = [v28 level];
      uint64_t v93 = [v92 stringValue];
      v94 = [v91 createString:v93];

      v95 = *(void **)(a1 + 48);
      v156[0] = MEMORY[0x1E4F143A8];
      v156[1] = 3221225472;
      v156[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_5;
      v156[3] = &unk_1E6BB97C0;
      id v35 = v94;
      id v157 = v35;
      id v158 = v126;
      v96 = [v95 trifbCreateFactorLevelUsingBlock:v156];
      [*(id *)(a1 + 56) addObject:v96];

      id v38 = v157;
      goto LABEL_37;
    case 12:
    case 14:
      goto LABEL_38;
    case 13:
      id v97 = objc_alloc(MEMORY[0x1E4FB0120]);
      v98 = [v28 level];
      id v35 = (id)objc_msgSend(v97, "initWithVal:", objc_msgSend(v98, "longValue"));

      v99 = [*(id *)(a1 + 48) trifbCreateBoxedInt64FromBoxedInt64:v35];
      v100 = *(void **)(a1 + 48);
      v153[0] = MEMORY[0x1E4F143A8];
      v153[1] = 3221225472;
      v153[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_6;
      v153[3] = &unk_1E6BB97C0;
      id v38 = v99;
      id v154 = v38;
      id v155 = v126;
      v101 = [v100 trifbCreateFactorLevelUsingBlock:v153];
      [*(id *)(a1 + 56) addObject:v101];

      goto LABEL_37;
    case 15:
      id v102 = objc_alloc(MEMORY[0x1E4FB0118]);
      v103 = [v28 level];
      [v103 doubleValue];
      id v35 = (id)objc_msgSend(v102, "initWithVal:");

      v104 = [*(id *)(a1 + 48) trifbCreateBoxedDoubleFromBoxedDouble:v35];
      v105 = *(void **)(a1 + 48);
      v150[0] = MEMORY[0x1E4F143A8];
      v150[1] = 3221225472;
      v150[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_7;
      v150[3] = &unk_1E6BB97C0;
      id v38 = v104;
      id v151 = v38;
      id v152 = v126;
      v106 = [v105 trifbCreateFactorLevelUsingBlock:v150];
      [*(id *)(a1 + 56) addObject:v106];

      goto LABEL_37;
    default:
      if ((v32 - 100) < 2)
      {
        v40 = [v28 level];
        uint64_t v41 = [v40 fileOrDirectoryLevelWithIsDir:0];

        int v42 = [v41 hasAsset];
        id v43 = v12;
        if (!v42) {
          goto LABEL_24;
        }
        id v44 = objc_msgSend(v41, "asset", v12);
        if (([v44 hasCloudKitContainer] & 1) == 0)
        {
          int v45 = [v41 isOnDemand];

          id v43 = v12;
          if (!v45) {
            goto LABEL_24;
          }
          v46 = TRILogCategory_Server();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            v119 = [v28 factor];
            v120 = [v119 name];
            *(_DWORD *)v172 = 138543362;
            v173 = v120;
            _os_log_debug_impl(&dword_1DA291000, v46, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\"", v172, 0xCu);
          }
          id v44 = [v41 asset];
          [v44 setCloudKitContainer:1];
        }

        id v43 = v12;
LABEL_24:
        if (![*(id *)(a1 + 64) containsObject:v43]
          || ([*(id *)(a1 + 72) _linkAssetsUpdatingFactorLevel:v28 fromFactorPackWithId:*(void *)(a1 + 32) usingAssetStore:*(void *)(a1 + 80) currentFactorPackPath:*(void *)(a1 + 88) futureFactorPackPath:*(void *)(a1 + 96)] & 1) != 0)
        {
          id v47 = *(void **)(a1 + 48);
          id v48 = [v41 path];
          v122 = [v47 createString:v48];

          __int16 v49 = *(void **)(a1 + 48);
          id v50 = [v41 asset];
          id v51 = [v50 assetId];
          id v52 = [v49 createString:v51];

          v53 = *(void **)(a1 + 48);
          id v54 = [v41 asset];
          uint64_t v55 = [v54 treatmentId];
          v56 = [v53 createString:v55];

          id v57 = *(void **)(a1 + 48);
          id v58 = [v41 asset];
          id v59 = [v58 name];
          id v60 = [v57 createString:v59];

          id v61 = *(void **)(a1 + 48);
          v147[0] = MEMORY[0x1E4F143A8];
          v147[1] = 3221225472;
          v147[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_373;
          v147[3] = &unk_1E6BB97E8;
          id v62 = v41;
          id v148 = v62;
          id v121 = v56;
          id v149 = v121;
          id v63 = [v61 trifbCreateCloudKitTreatmentRecordAssetUsingBlock:v147];
          id v64 = *(void **)(a1 + 48);
          v140[0] = MEMORY[0x1E4F143A8];
          v140[1] = 3221225472;
          v140[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_375;
          v140[3] = &unk_1E6BB9810;
          id v35 = v62;
          id v141 = v35;
          id v38 = v122;
          id v142 = v38;
          id v143 = v28;
          id v65 = v52;
          id v144 = v65;
          id v66 = v63;
          id v145 = v66;
          id v67 = v60;
          id v146 = v67;
          v68 = [v64 trifbCreateTrialManagedAssetUsingBlock:v140];
          id v69 = *(void **)(a1 + 48);
          v137[0] = MEMORY[0x1E4F143A8];
          v137[1] = 3221225472;
          v137[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_3_377;
          v137[3] = &unk_1E6BB97C0;
          id v70 = v68;
          id v138 = v70;
          id v139 = v126;
          v71 = [v69 trifbCreateFactorLevelUsingBlock:v137];
          [*(id *)(a1 + 56) addObject:v71];

LABEL_37:
          goto LABEL_38;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
        *a3 = 1;

        goto LABEL_43;
      }
      if (v32 != 104)
      {
LABEL_38:
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          goto LABEL_43;
        }
        v107 = TRILogCategory_Server();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
        {
          v112 = [v28 factor];
          v113 = [v112 name];
          v114 = [v28 level];
          int v115 = [v114 levelOneOfCase];
          *(_DWORD *)v172 = 138543618;
          v173 = v113;
          __int16 v174 = 1024;
          LODWORD(v175) = v115;
          _os_log_error_impl(&dword_1DA291000, v107, OS_LOG_TYPE_ERROR, "Factor %{public}@ has unsupported factor level with type %d.", v172, 0x12u);
        }
        goto LABEL_42;
      }
      if ([*(id *)(a1 + 64) containsObject:v12]
        && ([*(id *)(a1 + 72) _linkAssetsUpdatingFactorLevel:v28 fromFactorPackWithId:*(void *)(a1 + 32) usingAssetStore:*(void *)(a1 + 80) currentFactorPackPath:*(void *)(a1 + 88) futureFactorPackPath:*(void *)(a1 + 96)] & 1) == 0)
      {
LABEL_42:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
        *a3 = 1;
        goto LABEL_43;
      }
      v73 = [v28 level];
      id v74 = [v73 mobileAssetReferenceValue];

      if ([v74 hasAssetType]
        && [v74 hasAssetSpecifier]
        && ([v74 hasAssetVersion] & 1) != 0)
      {
        id v75 = *(void **)(a1 + 48);
        id v76 = [v74 assetType];
        v77 = [v75 createString:v76];

        v78 = *(void **)(a1 + 48);
        v79 = [v74 assetSpecifier];
        uint64_t v80 = [v78 createString:v79];

        v81 = *(void **)(a1 + 48);
        uint64_t v82 = [v74 assetVersion];
        uint64_t v83 = [v81 createString:v82];

        v84 = *(void **)(a1 + 48);
        v132[0] = MEMORY[0x1E4F143A8];
        v132[1] = 3221225472;
        v132[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_378;
        v132[3] = &unk_1E6BB9838;
        id v38 = v77;
        id v133 = v38;
        id v85 = v80;
        id v134 = v85;
        id v86 = v83;
        id v135 = v86;
        id v35 = v74;
        id v136 = v35;
        v87 = [v84 trifbCreateMobileAssetReferenceUsingBlock:v132];
        v88 = *(void **)(a1 + 48);
        v129[0] = MEMORY[0x1E4F143A8];
        v129[1] = 3221225472;
        v129[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_380;
        v129[3] = &unk_1E6BB97C0;
        id v89 = v87;
        id v130 = v89;
        id v131 = v126;
        id v90 = [v88 trifbCreateFactorLevelUsingBlock:v129];
        [*(id *)(a1 + 56) addObject:v90];

        goto LABEL_37;
      }
      v108 = TRILogCategory_Server();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        v116 = [v28 factor];
        v117 = [v116 name];
        uint64_t v118 = *(void *)(a1 + 32);
        *(_DWORD *)v172 = 138543618;
        v173 = v117;
        __int16 v174 = 2114;
        uint64_t v175 = v118;
        _os_log_error_impl(&dword_1DA291000, v108, OS_LOG_TYPE_ERROR, "Factor %{public}@ has missing MAAutoAsset metadata in factor pack %{public}@.", v172, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
      *a3 = 1;

LABEL_43:
      _Block_object_dispose(buf, 8);

      break;
  }
LABEL_9:
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_366(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 createString:a2];
  id v8 = [*(id *)(a1 + 32) createString:v6];

  v9 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2;
  id v16 = &unk_1E6BB9748;
  id v17 = v7;
  id v18 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = [v9 trifbCreateFactorMetadataKeyValueUsingBlock:&v13];
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12, v13, v14, v15, v16);
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setKey:v3];
  [v4 setVal:*(void *)(a1 + 40)];
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setFactorId:*(void *)(a1 + 32)];
  [v6 setName:*(void *)(a1 + 40)];
  if (populateNamespaceIdInSchema)
  {
    uint64_t v3 = [*(id *)(a1 + 48) factor];
    int v4 = [v3 hasNamespaceId];

    if (v4)
    {
      v5 = [*(id *)(a1 + 48) factor];
      objc_msgSend(v6, "setNamespaceId:", objc_msgSend(v5, "namespaceId"));
    }
  }
  [v6 setMetadata:*(void *)(a1 + 56)];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  objc_msgSend(v6, "setCacheKey:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithBoolVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithStringVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithInt64Val:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithDoubleVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_373(uint64_t a1, void *a2)
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

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_375(uint64_t a1, void *a2)
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

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_3_377(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithTrialAssetVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_378(uint64_t a1, void *a2)
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

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_380(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLevelWithMaRefVal:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_388(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  id v6 = [*(id *)(a1 + 32) selectedNamespace];
  uint64_t v5 = [v6 compatibilityVersionArray];
  *a3 = [v5 valueAtIndex:a2];
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_390(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setLevels:v3];
  [v4 setSourceWithFactorPackId:a1[5]];
  [v4 setNamespaceName:a1[6]];
  [v4 setNcvs:a1[7]];
}

- (id)loadFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
{
  uint64_t v5 = [(TRIFBFactorPackStorage *)self pathForFactorLevelsWithFactorPackId:a3 namespaceName:a4];
  if (v5)
  {
    id v6 = [(TRIFBFactorPackStorage *)self loadFactorLevelsWithDir:v5 bufferSize:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)loadFactorLevelsWithDir:(id)a3 bufferSize:(unint64_t *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E016E7F0]();
  id v15 = 0;
  int v7 = [v5 stringByAppendingPathComponent:@"factorPack.fb"];
  id v8 = [MEMORY[0x1E4F1C9B8] triVerifiedMappedDataWithFile:v7 error:&v15];
  int v9 = v8;
  if (v8)
  {
    if (a4) {
      *a4 = [v8 length];
    }
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB0130]) initVerifiedRootObjectFromData:v9];
    if (v10)
    {
      id v11 = v10;
      id v12 = v11;
      goto LABEL_12;
    }
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v7;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Failed to verify content of factor levels: %{public}@", buf, 0xCu);
    }

    id v11 = 0;
  }
  else
  {
    id v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = v15;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Failed to load factor levels from factor pack directory at %{public}@: %{public}@", buf, 0x16u);
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)updateSavedFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4 populatingAssetsForFactorNames:(id)a5 aliasToUnaliasMap:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x1E016E7F0]();
  if ([v12 count])
  {
    id v15 = [(TRIFBFactorPackStorage *)self pathForFactorLevelsWithFactorPackId:v10 namespaceName:v11];
    uint64_t v16 = [(TRIFBFactorPackStorage *)self legacyPathForFactorLevelsWithFactorPackId:v10 namespaceName:v11];
    id v17 = (void *)v16;
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
        id v21 = [(TRIFBFactorPackStorage *)self _linkAssetsForFactorNames:v12 aliasToUnaliasMap:v13 copyingModifiedFactorLevelsWithPath:v15 tempDirRef:v20];
        uint64_t v22 = [(TRIFBFactorPackStorage *)self _linkAssetsForFactorNames:v12 aliasToUnaliasMap:v13 copyingModifiedFactorLevelsWithPath:v17 tempDirRef:v20];
        BOOL v23 = 0;
        if (v21 && v22)
        {
          id v32 = v22;
          id v33 = v21;
          v24 = (void *)MEMORY[0x1E4F28CB8];
          uint64_t v25 = [v15 stringByAppendingPathComponent:@"factorPack.fb"];
          id v26 = v24;
          id v21 = v33;
          if ([v26 triRenameOrFaultWithSourcePath:v33 destPath:v25])
          {
            uint64_t v31 = (void *)MEMORY[0x1E4F28CB8];
            uint64_t v27 = [v17 stringByAppendingPathComponent:@"factorPack.fb"];
            LODWORD(v31) = [v31 triRenameOrFaultWithSourcePath:v32 destPath:v27];

            if (v31)
            {
              id v28 = TRILogCategory_Server();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v35 = v10;
                __int16 v36 = 2114;
                uint64_t v37 = v15;
                _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEFAULT, "Updated factor pack %{public}@ --> %{public}@", buf, 0x16u);
              }

              id v29 = TRILogCategory_Server();
              id v21 = v33;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v35 = v10;
                __int16 v36 = 2114;
                uint64_t v37 = v17;
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
          uint64_t v22 = v32;
        }

        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v10;
        _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "updateSavedFactorLevelsWithFactorPackId failed because preexisting factor pack %{public}@ is not present on disk.", buf, 0xCu);
      }
    }
    BOOL v23 = 0;
LABEL_24:

    goto LABEL_25;
  }
  BOOL v23 = 1;
LABEL_25:

  return v23;
}

- (BOOL)updateSavedGlobalFactorPackAt:(id)a3 populatingAssetsForFactorNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSTemporaryDirectory();
  int v9 = objc_opt_new();
  id v10 = [v9 UUIDString];
  id v11 = [v8 stringByAppendingPathComponent:v10];

  id v12 = [[TRITempDirScopeGuard alloc] initWithPath:v11];
  if (v12)
  {
    id v13 = [(TRIFBFactorPackStorage *)self _linkAssetsForFactorNames:v7 aliasToUnaliasMap:MEMORY[0x1E4F1CC08] copyingModifiedFactorLevelsWithPath:v6 tempDirRef:v12];
    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28CB8];
      id v15 = [v6 stringByAppendingPathComponent:@"factorPack.fb"];
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
  uint64_t v67 = *MEMORY[0x1E4F143B8];
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
      *(_DWORD *)buf = 138543362;
      id v62 = v13;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor with missing or empty name.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (([v12 hasLevel] & 1) == 0)
  {
    id v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v33 = [v12 factor];
      uint64_t v34 = [v33 name];
      *(_DWORD *)buf = 138543618;
      id v62 = v13;
      __int16 v63 = 2114;
      id v64 = v34;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with missing level.", buf, 0x16u);
LABEL_29:

      goto LABEL_37;
    }
LABEL_13:
    LOBYTE(v30) = 0;
    goto LABEL_14;
  }
  uint64_t v20 = [v12 level];
  id v21 = [v20 fileOrDirectoryLevelWithIsDir:0];

  if (!v21)
  {
    id v35 = [v12 level];
    int v36 = [v35 levelOneOfCase];

    if (v36 != 104)
    {
LABEL_42:
      id v21 = 0;
      goto LABEL_43;
    }
    uint64_t v37 = [v12 factor];
    uint64_t v38 = [v37 namespaceString];

    if (v38)
    {
      id v39 = [v12 level];
      v40 = [v39 mobileAssetReferenceValue];

      if ([v40 hasAssetType]
        && [v40 hasAssetSpecifier]
        && ([v40 hasAssetVersion] & 1) != 0)
      {
        id v53 = objc_alloc(MEMORY[0x1E4FB0178]);
        id v58 = [v40 assetType];
        uint64_t v41 = [v40 assetSpecifier];
        int v42 = [v40 assetVersion];
        uint64_t v54 = [v53 initWithType:v58 specifier:v41 version:v42];

        id v59 = [v12 factor];
        id v43 = [v59 name];
        if ([v40 hasIsFileFactor]) {
          uint64_t v44 = [v40 isFileFactor];
        }
        else {
          uint64_t v44 = 0;
        }
        id v48 = (void *)v54;
        BOOL v49 = -[TRIFBFactorPackStorage _referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:](self, "_referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:", v54, v14, v43, v44, v15, v16, v54);

        if (v49)
        {

          goto LABEL_42;
        }
        goto LABEL_34;
      }
      id v47 = TRILogCategory_Server();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        id v50 = [v17 name];
        *(_DWORD *)buf = 138543618;
        id v62 = v13;
        __int16 v63 = 2114;
        id v64 = v50;
        _os_log_error_impl(&dword_1DA291000, v47, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with incomplete MobileAssetReference.", buf, 0x16u);
      }
    }
    else
    {
      v40 = TRILogCategory_Server();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      id v47 = [v17 name];
      *(_DWORD *)buf = 138543618;
      id v62 = v13;
      __int16 v63 = 2114;
      id v64 = v47;
      _os_log_error_impl(&dword_1DA291000, v40, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with missing namespaceString.", buf, 0x16u);
    }

LABEL_34:
    id v21 = 0;
    goto LABEL_13;
  }
  uint64_t v22 = [v12 factor];
  BOOL v23 = [v22 namespaceString];

  if (!v23)
  {
    id v33 = TRILogCategory_Server();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = [v12 factor];
      int v45 = [v34 name];
      *(_DWORD *)buf = 138543618;
      id v62 = v13;
      __int16 v63 = 2114;
      id v64 = v45;
      v46 = "Factor pack %{public}@ has factor %{public}@ with missing namespaceString.";
      goto LABEL_28;
    }
LABEL_37:

    goto LABEL_13;
  }
  if (![v21 hasAsset]
    || ([v21 asset],
        v24 = objc_claimAutoreleasedReturnValue(),
        char v25 = [v24 hasAssetId],
        v24,
        (v25 & 1) == 0))
  {
    id v33 = TRILogCategory_Server();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = [v12 factor];
      int v45 = [v34 name];
      *(_DWORD *)buf = 138543618;
      id v62 = v13;
      __int16 v63 = 2114;
      id v64 = v45;
      v46 = "Factor pack %{public}@ has factor %{public}@ with missing assetId.";
LABEL_28:
      _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, v46, buf, 0x16u);

      goto LABEL_29;
    }
    goto LABEL_37;
  }
  v56 = [v21 asset];
  id v26 = [v56 assetId];
  uint64_t v27 = TRIValidateAssetId();

  id v57 = (void *)v27;
  if (!v27)
  {
    id v33 = TRILogCategory_Server();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v60 = [v21 asset];
      id v51 = [v60 assetId];
      uint64_t v55 = [v12 factor];
      id v52 = [v55 name];
      *(_DWORD *)buf = 138543874;
      id v62 = v13;
      __int16 v63 = 2114;
      id v64 = v51;
      __int16 v65 = 2114;
      id v66 = v52;
      _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);
    }
    goto LABEL_37;
  }
  id v28 = [v12 factor];
  id v29 = [v28 name];
  uint64_t v30 = [(TRIFBFactorPackStorage *)self _linkAssetWithId:v57 assetStore:v14 forFactorName:v29 currentFactorPackPath:v15 futureFactorPackPath:v16];

  if (v30)
  {
    uint64_t v31 = [v16 stringByAppendingPathComponent:v30];
    [v21 setPath:v31];

LABEL_43:
    LOBYTE(v30) = 1;
    goto LABEL_14;
  }

LABEL_14:
  return (char)v30;
}

- (id)_linkAssetsForFactorNames:(id)a3 aliasToUnaliasMap:(id)a4 copyingModifiedFactorLevelsWithPath:(id)a5 tempDirRef:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v58 = 0;
  id v13 = [(TRIFBFactorPackStorage *)self loadFactorLevelsWithDir:v11 bufferSize:&v58];
  if (v13)
  {
    id v14 = [v12 path];
    id v15 = [NSString alloc];
    id v16 = objc_opt_new();
    id v17 = [v16 UUIDString];
    __int16 v18 = (void *)[v15 initWithFormat:@"fl-update-%@.fb", v17];
    int v45 = [v14 stringByAppendingPathComponent:v18];

    uint64_t v19 = [TRIAssetStore alloc];
    paths = self->_paths;
    extractor = self->_extractor;
    uint64_t v22 = [[TRIRemoteAssetPatcher alloc] initWithMonitoredActivity:0];
    uint64_t v44 = [(TRIAssetStore *)v19 initWithPaths:paths extractor:extractor patcher:v22];

    id v23 = objc_alloc(MEMORY[0x1E4F4D8A8]);
    uint64_t v24 = *MEMORY[0x1E4F28378];
    id v57 = 0;
    char v25 = (void *)[v23 initWithFileAtPath:v45 protection:v24 capacity:(unint64_t)(3 * v58) >> 1 error:&v57];
    id v43 = v57;
    if (v25)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v27 = [v13 levels];
      id v28 = objc_msgSend(v26, "initWithCapacity:", objc_msgSend(v27, "count"));

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v62 = 0x2020000000;
      char v63 = 0;
      id v29 = [v13 levels];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __117__TRIFBFactorPackStorage__linkAssetsForFactorNames_aliasToUnaliasMap_copyingModifiedFactorLevelsWithPath_tempDirRef___block_invoke;
      v48[3] = &unk_1E6BB98D8;
      id v49 = v10;
      p_long long buf = &buf;
      id v50 = v46;
      id v51 = self;
      id v52 = v44;
      id v53 = v11;
      id v30 = v25;
      id v54 = v30;
      uint64_t v31 = v28;
      uint64_t v55 = v31;
      [v29 enumerateObjectsUsingBlock:v48];

      if (*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        id v32 = 0;
      }
      else
      {
        uint64_t v33 = [v31 count];
        uint64_t v34 = [v13 levels];
        LOBYTE(v33) = v33 == [v34 count];

        if ((v33 & 1) == 0)
        {
          uint64_t v41 = [MEMORY[0x1E4F28B00] currentHandler];
          [v41 handleFailureInMethod:a2 object:self file:@"TRIFBFactorPackStorage.m" lineNumber:1028 description:@"dropped factor level during update operation"];
        }
        uint64_t v35 = [v30 trifbCreateSortedVectorOfFactorLevelWithOffsets:v31];
        int v36 = objc_opt_new();
        [v36 replaceLevels:v35];
        uint64_t v37 = [v13 deepCopyUsingBufferBuilder:v30 changes:v36];

        id v47 = 0;
        LOBYTE(v35) = [v30 trifbFinishBufferWithRootFastFactorLevelsOfs:v37 error:&v47];
        id v38 = v47;
        if (v35)
        {
          id v32 = v45;
        }
        else
        {
          id v39 = TRILogCategory_Server();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v59 = 138543362;
            id v60 = v38;
            _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "Failed to write updated factor levels: %{public}@", v59, 0xCu);
          }

          id v32 = 0;
        }
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v31 = TRILogCategory_Server();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v43;
        _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Failed to instantiate buffer builder: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      id v32 = 0;
    }
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

void __117__TRIFBFactorPackStorage__linkAssetsForFactorNames_aliasToUnaliasMap_copyingModifiedFactorLevelsWithPath_tempDirRef___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 name];
  int v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v6 name];
  }
  id v12 = v11;

  if (![*(id *)(a1 + 40) containsObject:v12]) {
    goto LABEL_19;
  }
  int v13 = [v6 levelType];
  if (v13 == 6)
  {
    id v14 = [v6 levelAsMaRefVal];
    id v29 = objc_alloc(MEMORY[0x1E4FB0178]);
    id v30 = [v14 type];
    uint64_t v31 = [v14 specifier];
    id v32 = [v14 version];
    id v17 = (void *)[v29 initWithType:v30 specifier:v31 version:v32];

    uint64_t v33 = *(void **)(a1 + 48);
    uint64_t v34 = *(void *)(a1 + 56);
    uint64_t v35 = [v6 name];
    LOBYTE(v33) = objc_msgSend(v33, "_referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:", v17, v34, v35, objc_msgSend(v14, "hasFileType"), *(void *)(a1 + 64), *(void *)(a1 + 64));

    if ((v33 & 1) == 0) {
      goto LABEL_22;
    }

LABEL_18:
    goto LABEL_19;
  }
  if (v13 == 5)
  {
    id v14 = [v6 levelAsTrialAssetVal];
    id v15 = [v14 path];

    if (!v15)
    {
      id v16 = [v14 assetId];
      id v17 = TRIValidateAssetId();

      if (!v17)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_23;
      }
      __int16 v18 = *(void **)(a1 + 48);
      uint64_t v19 = *(void *)(a1 + 56);
      uint64_t v20 = [v6 name];
      id v21 = [v18 _linkAssetWithId:v17 assetStore:v19 forFactorName:v20 currentFactorPackPath:*(void *)(a1 + 64) futureFactorPackPath:*(void *)(a1 + 64)];

      if (v21)
      {
        uint64_t v22 = [*(id *)(a1 + 64) stringByAppendingPathComponent:v21];
        if (!+[TRIReferenceManagedDir saveFromGarbageCollectionItemWithPath:v22])
        {
          id v23 = TRILogCategory_Server();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v36 = 138543362;
            uint64_t v37 = v22;
            _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Unable to prevent newly linked asset at path %{public}@ from being garbage collected in the future", (uint8_t *)&v36, 0xCu);
          }
        }
        uint64_t v24 = [*(id *)(a1 + 72) createString:v22];
        char v25 = objc_opt_new();
        [v25 replacePath:v24];
        id v26 = [v14 deepCopyUsingBufferBuilder:*(void *)(a1 + 72) changes:v25];

        uint64_t v27 = objc_opt_new();
        [v27 replaceLevelWithTrialAssetVal:v26];
        id v28 = [v6 deepCopyUsingBufferBuilder:*(void *)(a1 + 72) changes:v27];

        if (v28) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
LABEL_22:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      *a4 = 1;

LABEL_23:
      goto LABEL_21;
    }
    goto LABEL_18;
  }
LABEL_19:
  id v28 = [v6 deepCopyUsingBufferBuilder:*(void *)(a1 + 72)];
LABEL_20:
  [*(id *)(a1 + 80) addObject:v28];

LABEL_21:
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
    id v21 = v18;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  return v22;
}

+ (id)relPathForMAReferenceWithFactorName:(id)a3
{
  uint64_t v3 = [a3 triFilenameForFactorName];
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
  id v21 = [v14 stringByAppendingPathComponent:v18];

  id v22 = [v13 stringByAppendingPathComponent:v18];

  LOBYTE(v9) = [v16 referenceMAAutoAssetWithId:v17 isFileFactor:v9 usingCurrentPath:v21 futurePath:v22];
  return v9;
}

- (BOOL)updateSavedFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4 deletingAssetsWithFactorNames:(id)a5 inUseAssetBehavior:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  context = (void *)MEMORY[0x1E016E7F0]();
  id v13 = [(TRIFBFactorPackStorage *)self pathForFactorLevelsWithFactorPackId:v10 namespaceName:v11];
  uint64_t v14 = [(TRIFBFactorPackStorage *)self legacyPathForFactorLevelsWithFactorPackId:v10 namespaceName:v11];
  id v15 = (void *)v14;
  if (v13 && v14)
  {
    id v48 = (void *)v14;
    id v16 = [TRITempDirScopeGuard alloc];
    id v17 = [(TRIPaths *)self->_paths localTempDir];
    __int16 v18 = [(TRITempDirScopeGuard *)v16 initWithPath:v17];

    if (v18)
    {
      uint64_t v19 = objc_opt_new();
      id v47 = objc_opt_new();
      uint64_t v20 = -[TRIFBFactorPackStorage _removeAssetsWithFactorNames:copyingModifiedFactorLevelsWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:](self, "_removeAssetsWithFactorNames:copyingModifiedFactorLevelsWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:", v12, v13, v19);
      id v15 = v48;
      int v45 = (void *)v19;
      id v21 = [(TRIFBFactorPackStorage *)self _removeAssetsWithFactorNames:v12 copyingModifiedFactorLevelsWithPath:v48 appendingToPathsToRemove:v19 appendingToMARefsToRemove:0 tempDirRef:v18];
      LOBYTE(self) = 0;
      id v46 = (void *)v20;
      if (v20 && v21)
      {
        id v43 = v12;
        id v44 = v21;
        id v22 = (void *)MEMORY[0x1E4F28CB8];
        id v23 = [v13 stringByAppendingPathComponent:@"factorPack.fb"];
        if ([v22 triRenameOrFaultWithSourcePath:v20 destPath:v23])
        {
          self = (TRIFBFactorPackStorage *)MEMORY[0x1E4F28CB8];
          uint64_t v24 = [v48 stringByAppendingPathComponent:@"factorPack.fb"];
          LODWORD(self) = [(TRIFBFactorPackStorage *)self triRenameOrFaultWithSourcePath:v44 destPath:v24];

          if (self)
          {
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            id v25 = v45;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v53 objects:v57 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              id v40 = v10;
              uint64_t v28 = *(void *)v54;
              id v41 = v25;
              id v42 = v11;
              while (2)
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v54 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v53 + 1) + 8 * i);
                  char v52 = 0;
                  if (+[TRIReferenceManagedDir removeFileInManagedDirWithPath:v30 inUseDeletionBehavior:v6 wasDeleted:&v52])
                  {
                    if (v6 == 3)
                    {
                      uint64_t v31 = [v47 objectForKeyedSubscript:v30];

                      if (v31)
                      {
                        id v32 = [v47 objectForKeyedSubscript:v30];
                        uint64_t v33 = objc_opt_new();
                        uint64_t v34 = [v33 createAutoAssetWithId:v32 decryptionKey:0 error:0];
                        [v34 assetSelector];
                        v36 = uint64_t v35 = v13;
                        v50[0] = MEMORY[0x1E4F143A8];
                        v50[1] = 3221225472;
                        v50[2] = __129__TRIFBFactorPackStorage_updateSavedFactorLevelsWithFactorPackId_namespaceName_deletingAssetsWithFactorNames_inUseAssetBehavior___block_invoke;
                        v50[3] = &unk_1E6BB9900;
                        id v51 = v34;
                        id v37 = v34;
                        [v33 eliminateAllForSelector:v36 completion:v50];

                        id v13 = v35;
                        id v25 = v41;
                        id v11 = v42;
                      }
                    }
                  }
                  else if ((_os_feature_enabled_impl() & 1) == 0)
                  {
                    uint64_t v38 = TRILogCategory_Server();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138543362;
                      id v59 = v25;
                      _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "Failed to remove files %{public}@ in managed dir", buf, 0xCu);
                    }

                    LOBYTE(self) = 0;
                    goto LABEL_30;
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v53 objects:v57 count:16];
                if (v27) {
                  continue;
                }
                break;
              }
              LOBYTE(self) = 1;
LABEL_30:
              id v10 = v40;
            }
            else
            {
              LOBYTE(self) = 1;
            }
            id v12 = v43;
          }
        }
        else
        {

          LOBYTE(self) = 0;
        }
        id v15 = v48;
        id v21 = v44;
      }
    }
    else
    {
      LOBYTE(self) = 0;
      id v15 = v48;
    }
  }
  else
  {
    __int16 v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v59 = v10;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "updateSavedFactorLevelsWithFactorPackId failed because preexisting factor pack %{public}@ is not present on disk.", buf, 0xCu);
    }
    LOBYTE(self) = 0;
  }

  return (char)self;
}

void __129__TRIFBFactorPackStorage_updateSavedFactorLevelsWithFactorPackId_namespaceName_deletingAssetsWithFactorNames_inUseAssetBehavior___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TRILogCategory_Server();
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
    uint64_t v14 = [(TRIFBFactorPackStorage *)self _removeAssetsWithFactorNames:v7 copyingModifiedFactorLevelsWithPath:v6 appendingToPathsToRemove:v13 appendingToMARefsToRemove:0 tempDirRef:v12];
    id v15 = (void *)MEMORY[0x1E4F28CB8];
    id v16 = [v6 stringByAppendingPathComponent:@"factorPack.fb"];
    LOBYTE(v15) = [v15 triRenameOrFaultWithSourcePath:v14 destPath:v16];

    if (v15)
    {
      uint64_t v27 = v14;
      uint64_t v28 = v12;
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
            id v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
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

      id v25 = TRILogCategory_Server();
      id v6 = v30;
      uint64_t v14 = v27;
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
      id v25 = TRILogCategory_Server();
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

- (id)_removeAssetsWithFactorNames:(id)a3 copyingModifiedFactorLevelsWithPath:(id)a4 appendingToPathsToRemove:(id)a5 appendingToMARefsToRemove:(id)a6 tempDirRef:(id)a7
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v65 = 0;
  uint64_t v18 = [(TRIFBFactorPackStorage *)self loadFactorLevelsWithDir:v14 bufferSize:&v65];
  if (v18)
  {
    SEL v48 = a2;
    long long v54 = v16;
    id v51 = v17;
    uint64_t v19 = [v17 path];
    id v20 = [NSString alloc];
    char v21 = objc_opt_new();
    id v22 = [v21 UUIDString];
    id v23 = (void *)[v20 initWithFormat:@"fl-update-%@.fb", v22];
    uint64_t v24 = [v19 stringByAppendingPathComponent:v23];

    id v25 = objc_alloc(MEMORY[0x1E4F4D8A8]);
    uint64_t v26 = *MEMORY[0x1E4F28378];
    id v64 = 0;
    long long v53 = (void *)v24;
    uint64_t v27 = (void *)[v25 initWithFileAtPath:v24 protection:v26 capacity:(unint64_t)(3 * v65) >> 1 error:&v64];
    id v28 = v64;
    char v52 = v28;
    if (v27)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v30 = [v18 levels];
      char v31 = objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));

      long long v32 = [v18 levels];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __153__TRIFBFactorPackStorage__removeAssetsWithFactorNames_copyingModifiedFactorLevelsWithPath_appendingToPathsToRemove_appendingToMARefsToRemove_tempDirRef___block_invoke;
      v56[3] = &unk_1E6BB9928;
      id v50 = v13;
      id v57 = v13;
      id v49 = v15;
      id v58 = v15;
      id v33 = v27;
      id v59 = v33;
      uint64_t v60 = self;
      id v61 = v14;
      id v62 = v54;
      long long v34 = v31;
      char v63 = v34;
      [v32 enumerateObjectsUsingBlock:v56];

      uint64_t v35 = [v34 count];
      int v36 = [v18 levels];
      uint64_t v37 = [v36 count];

      if (v35 != v37)
      {
        id v47 = [MEMORY[0x1E4F28B00] currentHandler];
        [v47 handleFailureInMethod:v48 object:self file:@"TRIFBFactorPackStorage.m" lineNumber:1340 description:@"dropped factor level during update operation"];
      }
      uint64_t v38 = [v33 trifbCreateSortedVectorOfFactorLevelWithOffsets:v34];
      __int16 v39 = objc_opt_new();
      [v39 replaceLevels:v38];
      id v40 = [v18 deepCopyUsingBufferBuilder:v33 changes:v39];

      id v55 = 0;
      char v41 = [v33 trifbFinishBufferWithRootFastFactorLevelsOfs:v40 error:&v55];
      id v42 = v55;
      id v17 = v51;
      if (v41)
      {
        id v43 = v53;
        id v15 = v49;
        id v13 = v50;
      }
      else
      {
        int v45 = TRILogCategory_Server();
        id v15 = v49;
        id v13 = v50;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 138543362;
          id v67 = v42;
          _os_log_error_impl(&dword_1DA291000, v45, OS_LOG_TYPE_ERROR, "Failed to write updated factor levels: %{public}@", buf, 0xCu);
        }

        id v43 = 0;
      }

      id v16 = v54;
    }
    else
    {
      id v44 = v28;
      long long v34 = TRILogCategory_Server();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 138543362;
        id v67 = v44;
        _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "Failed to instantiate buffer builder: %{public}@", buf, 0xCu);
      }
      id v43 = 0;
      id v16 = v54;
      id v17 = v51;
    }
  }
  else
  {
    id v43 = 0;
  }

  return v43;
}

void __153__TRIFBFactorPackStorage__removeAssetsWithFactorNames_copyingModifiedFactorLevelsWithPath_appendingToPathsToRemove_appendingToMARefsToRemove_tempDirRef___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 name];
  LODWORD(v4) = [v4 containsObject:v5];

  if (!v4) {
    goto LABEL_20;
  }
  int v6 = [v3 levelType];
  if (v6 == 6)
  {
    id v7 = [v3 levelAsMaRefVal];
    if ([v7 isOnDemand])
    {
      id v15 = *(void **)(a1 + 32);
      id v16 = [v3 name];
      LODWORD(v15) = [v15 containsObject:v16];

      if (v15)
      {
        id v17 = objc_opt_class();
        uint64_t v18 = [v3 name];
        uint64_t v19 = [v17 relPathForMAReferenceWithFactorName:v18];

        id v20 = [*(id *)(a1 + 64) stringByAppendingPathComponent:v19];
        char v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v22 = [v21 fileExistsAtPath:v20];

        if (v22)
        {
          [*(id *)(a1 + 40) addObject:v20];
          id v23 = objc_alloc(MEMORY[0x1E4FB0178]);
          uint64_t v24 = [v7 type];
          id v25 = [v7 specifier];
          uint64_t v26 = [v7 version];
          uint64_t v27 = (void *)[v23 initWithType:v24 specifier:v25 version:v26];

          id v28 = *(void **)(a1 + 72);
          if (v28) {
            [v28 setObject:v27 forKey:v20];
          }
          id v29 = objc_opt_new();
          id v33 = 0;
          char v30 = [v29 writeToFile:v20 options:0x10000000 error:&v33];
          id v31 = v33;

          if ((v30 & 1) == 0)
          {
            long long v32 = TRILogCategory_Server();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 138543362;
              uint64_t v35 = v20;
              _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Unable to nil out MARef by creating a blank file at %{public}@", buf, 0xCu);
            }
          }
        }
      }
    }
    goto LABEL_19;
  }
  if (v6 != 5)
  {
LABEL_20:
    id v14 = [v3 deepCopyUsingBufferBuilder:*(void *)(a1 + 48)];
    goto LABEL_21;
  }
  id v7 = [v3 levelAsTrialAssetVal];
  if (![v7 isOnDemand]
    || ([v7 path], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
LABEL_19:

    goto LABEL_20;
  }
  int v9 = *(void **)(a1 + 40);
  uint64_t v10 = [v7 path];
  [v9 addObject:v10];

  __int16 v11 = objc_opt_new();
  [v11 omitPath];
  id v12 = [v7 deepCopyUsingBufferBuilder:*(void *)(a1 + 48) changes:v11];

  id v13 = objc_opt_new();
  [v13 replaceLevelWithTrialAssetVal:v12];
  id v14 = [v3 deepCopyUsingBufferBuilder:*(void *)(a1 + 48) changes:v13];

  if (!v14) {
    goto LABEL_20;
  }
LABEL_21:
  [*(id *)(a1 + 80) addObject:v14];
}

- (id)pathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [(TRIFBFactorPackStorage *)self _pathForFactorLevelsWithFactorPackId:a3 namespaceName:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
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

- (id)_pathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TRIFBFactorPackStorage *)self _parentDirForFactorLevelsWithNamespaceName:v7];
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

- (id)_parentDirForFactorLevelsWithNamespaceName:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)MEMORY[0x1E016E7F0]();
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
      uint64_t v12 = "-[TRIFBFactorPackStorage _parentDirForFactorLevelsWithNamespaceName:]";
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "%s has empty path arg: namespaceName", buf, 0xCu);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)legacyPathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
{
  id v4 = [(TRIFBFactorPackStorage *)self _legacyPathForFactorLevelsWithFactorPackId:a3 namespaceName:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
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

- (id)_legacyPathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TRIFBFactorPackStorage *)self _legacyParentDirForFactorLevelsWithNamespaceName:v7];
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

- (id)_legacyParentDirForFactorLevelsWithNamespaceName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    *(_DWORD *)int buf = 0;
    id v5 = TRINamespace_NamespaceId_EnumDescriptor();
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
      id v15 = "-[TRIFBFactorPackStorage _legacyParentDirForFactorLevelsWithNamespaceName:]";
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "%s has empty path arg: namespaceName", buf, 0xCu);
    }
  }
  __int16 v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)removeUnreferencedFactorLevelsWithRemovedCount:(unsigned int *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v21 = 0;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = (void *)MEMORY[0x1E4F1CB10];
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
            id v15 = TRINamespace_NamespaceId_EnumDescriptor();
            uint64_t v16 = [v15 textFormatNameForValue:v20];

            if (v16)
            {
              v8 &= [(TRIFBFactorPackStorage *)self _removeUnreferencedFactorPackSetsWithNamespaceName:v16 removedCount:&v21];
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
          v8 &= [(TRIFBFactorPackStorage *)self _removeUnreferencedFactorPackSetsWithNamespaceName:v14 removedCount:&v21];
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
    [v20 handleFailureInMethod:a2, self, @"TRIFBFactorPackStorage.m", 1475, @"Invalid parameter not satisfying: %@", @"removedCount" object file lineNumber description];
  }
  if ([v7 length])
  {
    int v8 = [(TRIFBFactorPackStorage *)self _parentDirForFactorLevelsWithNamespaceName:v7];
    uint64_t v9 = [(TRIFBFactorPackStorage *)self _legacyParentDirForFactorLevelsWithNamespaceName:v7];
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
        int v22 = v8;
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
            v15 &= [(TRIFBFactorPackStorage *)self _removeUnreferencedFactorPackSetsWithParentDir:v17 removedCount:a4];
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
      char v30 = "-[TRIFBFactorPackStorage _removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:]";
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
      v13[2] = __86__TRIFBFactorPackStorage__removeUnreferencedFactorPackSetsWithParentDir_removedCount___block_invoke;
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

void __86__TRIFBFactorPackStorage__removeUnreferencedFactorPackSetsWithParentDir_removedCount___block_invoke(uint64_t a1, void *a2)
{
  char v9 = 0;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 path];
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

- (void)reportFactorPackDiskUsagesUsingContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v6 = [(TRIPaths *)self->_paths treatmentsDir];
  uint64_t v7 = [v5 fileURLWithPath:v6];
  BOOL v8 = [v4 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:1 errorHandler:0];

  char v9 = objc_opt_new();
  int v10 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v11 = [v8 nextObject];
  if (v11)
  {
    uint64_t v13 = (void *)v11;
    *(void *)&long long v12 = 138543362;
    long long v20 = v12;
    while (1)
    {
      uint64_t v14 = objc_msgSend(v13, "lastPathComponent", v20);
      if (v14) {
        break;
      }
LABEL_16:

      int v10 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v13 = [v8 nextObject];
      if (!v13) {
        goto LABEL_21;
      }
    }
    int v15 = (void *)v14;
    uint64_t v22 = -1;
    if ([MEMORY[0x1E4FB0198] convertFromString:v14 usingBase:10 toI64:&v22])
    {
      if ((unint64_t)(v22 - 1) > 0x7FFFFFFE)
      {
        long long v18 = TRILogCategory_Server();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 134217984;
          uint64_t v24 = v22;
          _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Skipping reporting disk usage of factor packs for unrecognized id-based namespace: %lld", buf, 0xCu);
        }
        goto LABEL_14;
      }
      uint64_t v16 = TRINamespace_NamespaceId_EnumDescriptor();
      uint64_t v17 = [v16 textFormatNameForValue:v22];

      if (!v17)
      {
        long long v18 = TRILogCategory_Server();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 134217984;
          uint64_t v24 = v22;
          _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Skipping reporting disk usage of factor packs for unrecognized id-based namespace: %lld", buf, 0xCu);
        }
        goto LABEL_14;
      }

      int v15 = (void *)v17;
    }
    if (![v9 containsObject:v15])
    {
      uint64_t v19 = [v13 lastPathComponent];
      [(TRIFBFactorPackStorage *)self _reportFactorPackDiskUsagesWithNamespaceName:v15 namespaceDirName:v19 context:v21];

      [v9 addObject:v15];
LABEL_15:

      goto LABEL_16;
    }
    long long v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = v20;
      uint64_t v24 = (uint64_t)v15;
      _os_log_debug_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEBUG, "Skipping reporting disk usage of factor packs for already visited namespace: %{public}@", buf, 0xCu);
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_21:
}

- (void)_reportFactorPackDiskUsagesWithNamespaceName:(id)a3 namespaceDirName:(id)a4 context:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(TRIFBFactorPackStorage *)self _parentDirForFactorLevelsWithNamespaceName:v9];
  if (v11)
  {
    long long v12 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v13 = [MEMORY[0x1E4FB0160] arrayFromDirectory:v11];
    if (v13)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __96__TRIFBFactorPackStorage__reportFactorPackDiskUsagesWithNamespaceName_namespaceDirName_context___block_invoke;
      v15[3] = &unk_1E6BB9978;
      id v16 = v8;
      id v17 = v10;
      if (([v13 enumerateStringsWithBlock:v15] & 1) == 0)
      {
        uint64_t v14 = TRILogCategory_Server();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 138543362;
          uint64_t v19 = v13;
          _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to enumerate %{public}@ to report factor pack disk usage", buf, 0xCu);
        }
      }
    }
  }
}

void __96__TRIFBFactorPackStorage__reportFactorPackDiskUsagesWithNamespaceName_namespaceDirName_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 lastPathComponent];
  id v5 = TRIValidateFactorPackId();

  if (v5)
  {
    BOOL v6 = [MEMORY[0x1E4F28CB8] triDiskUsageForDirectory:v3];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"triald_disk_usage", -[NSObject compressedSum](v6, "compressedSum"));
      id v9 = objc_opt_new();
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = [v9 ensureFactorFields];
      [v11 setNamespaceName:v10];

      long long v12 = [v9 ensureFactorFields];
      [v12 setClientFactorPackId:v5];

      uint64_t v13 = [*(id *)(a1 + 40) client];
      uint64_t v14 = [v13 logger];
      int v15 = [*(id *)(a1 + 40) client];
      id v16 = [v15 trackingId];
      long long v18 = v8;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      [v14 logWithTrackingId:v16 metrics:v17 dimensions:0 trialSystemTelemetry:v9];
    }
    else
    {
      id v8 = TRILogCategory_Server();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 138543362;
        id v20 = v3;
        _os_log_debug_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEBUG, "Skipping reporting disk usage for dir %{public}@ as it couldn't be determined", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 138543362;
      id v20 = v3;
      _os_log_debug_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEBUG, "Skipping reporting disk usage for dir %{public}@ whose last path component isn't a valid factor pack id", buf, 0xCu);
    }
  }
}

- (BOOL)removeUnreferencedGlobalFactorPacksWithRemovedCount:(unsigned int *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = [(TRIFBFactorPackStorage *)self _globalFactorPackProviderPlist];
  uint64_t v24 = v4;
  if (v4)
  {
    uint64_t v25 = [v4 objectForKeyedSubscript:@"namespaceFactorPackMap"];
    *(void *)char v30 = 0;
    uint64_t v31 = v30;
    uint64_t v32 = 0x2020000000;
    int v33 = 0;
    id v5 = [(TRIPaths *)self->_paths treatmentsDirUsingGlobal:1];
    BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    id v8 = [v6 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:1 errorHandler:0];

    char v9 = 1;
    do
    {
      uint64_t v10 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v11 = [v8 nextObject];
      long long v12 = v11;
      if (v11)
      {
        uint64_t v13 = [v11 lastPathComponent];
        if (v13)
        {
          uint64_t v14 = (void *)MEMORY[0x1E016E7F0]();
          int v15 = (void *)[[NSString alloc] initWithFormat:@"%@/factorPacks", v13];
          id v16 = [v5 stringByAppendingPathComponent:v15];

          id v17 = [MEMORY[0x1E4FB0160] arrayFromDirectory:v16];
          if (v17)
          {
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __78__TRIFBFactorPackStorage_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke;
            v26[3] = &unk_1E6BB99A0;
            uint64_t v27 = v25;
            id v28 = v13;
            id v29 = v30;
            char v18 = [v17 enumerateStringsWithBlock:v26];

            int v19 = 0;
            v9 &= v18;
            id v20 = v27;
          }
          else
          {
            id v20 = TRILogCategory_Server();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 138412290;
              uint64_t v35 = v13;
              _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Couldn't locate global factor packs for namespace name: %@", buf, 0xCu);
            }
            char v9 = 0;
            int v19 = 3;
          }
        }
        else
        {
          id v16 = TRILogCategory_Server();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)int buf = 0;
            _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Invalid namespace name found in global treatment directory.", buf, 2u);
          }
          int v19 = 3;
        }
      }
      else
      {
        int v19 = 2;
      }
    }
    while (v19 != 2);
    if (a3) {
      *a3 = *((_DWORD *)v31 + 6);
    }

    _Block_object_dispose(v30, 8);
  }
  else
  {
    uint64_t v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v30 = 0;
      _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "Couldn't open global factor pack provider plist. Stopping the removal of unreferenced global factor packs.", v30, 2u);
    }

    char v9 = 0;
    if (a3) {
      *a3 = 0;
    }
  }

  return v9 & 1;
}

void __78__TRIFBFactorPackStorage_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 lastPathComponent];
  id v5 = v4;
  if (!v4 || ![v4 length])
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138543362;
      id v15 = v3;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Invalid factor pack Id in global factor pack directory %{public}@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  BOOL v6 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  char v7 = [v6 isEqualToString:v5];

  if ((v7 & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = 0;
    int v9 = [v8 triForceRemoveItemAtPath:v3 error:&v13];
    uint64_t v10 = v13;

    if (v10)
    {
      uint64_t v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        long long v12 = [v10 localizedDescription];
        *(_DWORD *)int buf = 138543618;
        id v15 = v3;
        __int16 v16 = 2112;
        id v17 = v12;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Failed to remove factor pack at %{public}@ with the following error %@", buf, 0x16u);
      }
    }
    if (v9) {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
LABEL_12:
  }
}

- (id)_globalFactorPackProviderPlist
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(TRIPaths *)self->_paths namespaceDescriptorsDirUsingGlobal:1];
  id v3 = [v2 stringByAppendingPathComponent:@"v2/globalActiveFactorProviders.plplist"];

  *__error() = 0;
  id v4 = v3;
  if (access((const char *)[v4 fileSystemRepresentation], 4))
  {
    if (*__error() == 1)
    {
      id v5 = TRILogCategory_Server();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int buf = 0;
        _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Cannot access global factor pack provider plplist.", buf, 2u);
      }
LABEL_8:
      BOOL v6 = 0;
      goto LABEL_16;
    }
    if (*__error() == 2)
    {
      id v5 = TRILogCategory_Server();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Global factor pack provider plplist file not present: %@", buf, 0xCu);
      }
      goto LABEL_8;
    }
  }
  id v11 = 0;
  BOOL v6 = [MEMORY[0x1E4F93B50] propertyListWithPath:v4 error:&v11];
  char v7 = v11;
  id v5 = v7;
  if (v6)
  {
    id v8 = v6;
  }
  else if (v7)
  {
    int v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Error opening global factor pack provider plplist \"%@\": %@", buf, 0x16u);
    }
  }
LABEL_16:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end