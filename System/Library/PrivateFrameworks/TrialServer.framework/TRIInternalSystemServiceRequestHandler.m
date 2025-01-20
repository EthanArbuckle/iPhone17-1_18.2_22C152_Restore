@interface TRIInternalSystemServiceRequestHandler
- (BOOL)_getOnDemandReferenceCountsAtGlobalPath:(id)a3 onDemandFactorsPerUser:(id *)a4 error:(id *)a5;
- (BOOL)_updateOnDemandReferenceCountsForUser:(id)a3 atGlobalPath:(id)a4 addingFactors:(id)a5 removingFactors:(id)a6 newlyUnreferencedFactors:(id *)a7;
- (TRIInternalSystemServiceRequestHandler)initWithEntitlementWitness:(id)a3;
- (void)addSymlinkFromAssetWithIdentifier:(id)a3 toPath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 completion:(id)a6;
- (void)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4 ignoreRecentlyCreatedAssets:(BOOL)a5 dryRun:(BOOL)a6 includedCacheDeletableAssetIds:(id)a7 completion:(id)a8;
- (void)fixFileProtectionForAssetStoreWithCompletion:(id)a3;
- (void)getOnDemandReferenceCountsPerUserAtGlobalPath:(id)a3 completion:(id)a4;
- (void)logSystemCovariates;
- (void)migrateToGlobalAssetStoreIfNeededFromLocalStore:(id)a3 sourceExtension:(id)a4 completion:(id)a5;
- (void)overwriteGlobalActiveFactorProvidersWithNamespaceMap:(id)a3 factorPackMap:(id)a4 rolloutDeploymentMap:(id)a5 completion:(id)a6;
- (void)referenceMAAutoAssetWithId:(id)a3 futurePath:(id)a4 currentPath:(id)a5 isFileFactor:(BOOL)a6 sourceExtension:(id)a7 completion:(id)a8;
- (void)removeAssetWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeUnreferencedGlobalFactorPacksWithCompletion:(id)a3;
- (void)saveAssetWithIdentifier:(id)a3 sourcePath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 removeSourceOnFailure:(BOOL)a6 sourceExtension:(id)a7 completion:(id)a8;
- (void)saveFactorPackForUserId:(id)a3 toGlobalPath:(id)a4 fromTemporaryPath:(id)a5 factors:(id)a6 sourceExtension:(id)a7 completion:(id)a8;
- (void)updateFactorPackForUserId:(id)a3 atGlobalPath:(id)a4 deletingFactors:(id)a5 completion:(id)a6;
- (void)updateFactorPackForUserId:(id)a3 atGlobalPath:(id)a4 populatingFactors:(id)a5 completion:(id)a6;
@end

@implementation TRIInternalSystemServiceRequestHandler

- (TRIInternalSystemServiceRequestHandler)initWithEntitlementWitness:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TRIInternalSystemServiceRequestHandler;
  v6 = [(TRIInternalSystemServiceRequestHandler *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entitlementWitness, a3);
    v8 = [TRIAssetStore alloc];
    v9 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    uint64_t v10 = [(TRIAssetStore *)v8 initWithPaths:v9];
    store = v7->_store;
    v7->_store = (TRIAssetStore *)v10;

    uint64_t v12 = objc_opt_new();
    storageManagement = v7->_storageManagement;
    v7->_storageManagement = (TRIStorageManagementProtocol *)v12;

    v14 = [TRIAssetStoreOperator alloc];
    v15 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    uint64_t v16 = [(TRIAssetStoreOperator *)v14 initWithPaths:v15 storageManagement:v7->_storageManagement assetStore:v7->_store];
    operator = v7->_operator;
    v7->_operator = (TRIAssetStoreOperator *)v16;
  }
  return v7;
}

- (void)saveAssetWithIdentifier:(id)a3 sourcePath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 removeSourceOnFailure:(BOOL)a6 sourceExtension:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  v17 = (void (**)(id, BOOL))a8;
  id v18 = v16;
  [v18 UTF8String];
  uint64_t v19 = sandbox_extension_consume();
  if (v19 == -1)
  {
    v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Failed to consume a sandbox extension", buf, 2u);
    }
  }
  else
  {
    v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v21 = 0;
      _os_log_debug_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEBUG, "Successfully consumed save asset extension.", v21, 2u);
    }
  }

  v17[2](v17, [(TRIAssetStoreOperator *)self->_operator saveAssetWithIdentifier:v14 sourcePath:v15 flockWitness:a5 removeSourceOnFailure:v10]);
  if (v19 != -1) {
    sandbox_extension_release();
  }
}

- (void)removeAssetWithIdentifier:(id)a3 completion:(id)a4
{
  operator = self->_operator;
  v6 = (void (**)(id, uint64_t))a4;
  v6[2](v6, [(TRIAssetStoreOperator *)operator removeAssetWithIdentifier:a3]);
}

- (void)addSymlinkFromAssetWithIdentifier:(id)a3 toPath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 completion:(id)a6
{
  operator = self->_operator;
  BOOL v10 = (void (**)(id, uint64_t))a6;
  v10[2](v10, [(TRIAssetStoreOperator *)operator addSymlinkFromAssetWithIdentifier:a3 toPath:a4 flockWitness:a5]);
}

- (void)referenceMAAutoAssetWithId:(id)a3 futurePath:(id)a4 currentPath:(id)a5 isFileFactor:(BOOL)a6 sourceExtension:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = (void (**)(id, void *))a8;
  id v19 = v17;
  [v19 UTF8String];
  uint64_t v20 = sandbox_extension_consume();
  if (v20 == -1)
  {
    v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "failed to consume a sandbox extension", v23, 2u);
    }
  }
  v22 = [(TRIAssetStoreOperator *)self->_operator referenceMAAutoAssetWithId:v14 futurePath:v15 currentPath:v16 isFileFactor:v10];
  v18[2](v18, v22);

  if (v20 != -1) {
    sandbox_extension_release();
  }
}

- (void)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4 ignoreRecentlyCreatedAssets:(BOOL)a5 dryRun:(BOOL)a6 includedCacheDeletableAssetIds:(id)a7 completion:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = (void (**)(id, BOOL, id))a8;
  id v15 = a7;
  id v17 = (id)objc_opt_new();
  BOOL v16 = [(TRIAssetStoreOperator *)self->_operator collectGarbageOlderThanNumScans:v12 deletedAssetSize:a4 ignoreRecentlyCreatedAssets:v10 dryRun:v9 includedCacheDeletableAssetIds:v15 deletedAssetIds:&v17];

  v14[2](v14, v16, v17);
}

- (void)fixFileProtectionForAssetStoreWithCompletion:(id)a3
{
  operator = self->_operator;
  v4 = (void (**)(id, uint64_t))a3;
  v4[2](v4, [(TRIAssetStoreOperator *)operator fixFileProtectionForAssetStoreFiles]);
}

- (void)saveFactorPackForUserId:(id)a3 toGlobalPath:(id)a4 fromTemporaryPath:(id)a5 factors:(id)a6 sourceExtension:(id)a7 completion:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v13 = a4;
  id v38 = a5;
  id v37 = a6;
  id v35 = a7;
  id v14 = (void (**)(id, void))a8;
  id v15 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  BOOL v16 = [v15 treatmentsDirUsingGlobal:1];
  LOBYTE(a7) = [v13 hasPrefix:v16];

  if (a7)
  {
    id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v18 = [v13 stringByAppendingPathComponent:@"factorPack.pb"];
    int v19 = [v17 fileExistsAtPath:v18];

    uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    v21 = [v38 stringByAppendingPathComponent:@"factorPack.pb"];
    int v22 = [v20 fileExistsAtPath:v21];

    v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    v24 = [v13 stringByAppendingPathComponent:@"factorPack.fb"];
    int v25 = [v23 fileExistsAtPath:v24];

    v26 = [MEMORY[0x1E4F28CB8] defaultManager];
    v27 = [v38 stringByAppendingPathComponent:@"factorPack.fb"];
    int v28 = [v26 fileExistsAtPath:v27];

    if ((v19 | v22 ^ 1) == 1 && v25 | v28 ^ 1)
    {
      v29 = TRILogCategory_Server();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_DEFAULT, "Factor pack already exists in the global directory. Updating the factorpack instead.", buf, 2u);
      }

      [(TRIInternalSystemServiceRequestHandler *)self updateFactorPackForUserId:v36 atGlobalPath:v13 populatingFactors:v37 completion:v14];
    }
    else
    {
      [v35 UTF8String];
      uint64_t v31 = sandbox_extension_consume();
      if (v31 == -1)
      {
        v32 = TRILogCategory_Server();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "failed to consume a sandbox extension", buf, 2u);
        }
      }
      v33 = [v13 stringByDeletingLastPathComponent];
      if ([MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v33]) {
        v14[2](v14, [MEMORY[0x1E4F28CB8] triForceRenameWithSourcePath:v38 destPath:v13] & -[TRIInternalSystemServiceRequestHandler _updateOnDemandReferenceCountsForUser:atGlobalPath:addingFactors:removingFactors:newlyUnreferencedFactors:](self, "_updateOnDemandReferenceCountsForUser:atGlobalPath:addingFactors:removingFactors:newlyUnreferencedFactors:", v36, v13, v37, 0, 0));
      }
      else {
        v14[2](v14, 0);
      }

      if (v31 != -1) {
        sandbox_extension_release();
      }
    }
  }
  else
  {
    v30 = TRILogCategory_Server();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v38;
      __int16 v41 = 2112;
      id v42 = v13;
      _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "Asked to save factor pack at %@ to non-treatment directory location: %@", buf, 0x16u);
    }

    v14[2](v14, 0);
  }
}

- (void)updateFactorPackForUserId:(id)a3 atGlobalPath:(id)a4 populatingFactors:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1E4FB0240];
  id v14 = (void (**)(id, void))a6;
  id v15 = [v13 sharedSystemPaths];
  BOOL v16 = [v15 treatmentsDirUsingGlobal:1];
  char v17 = [v11 hasPrefix:v16];

  if (v17)
  {
    id v18 = [TRIFactorPackStorage alloc];
    int v19 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    uint64_t v20 = [(TRIFactorPackStorage *)v18 initWithPaths:v19];

    int v21 = [(TRIFactorPackStorage *)v20 updateSavedGlobalFactorPackAt:v11 populatingAssetsForFactorNames:v12];
    if (_os_feature_enabled_impl())
    {
      int v22 = [TRIFBFactorPackStorage alloc];
      v23 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
      v24 = [(TRIFBFactorPackStorage *)v22 initWithPaths:v23];

      v21 &= [(TRIFBFactorPackStorage *)v24 updateSavedGlobalFactorPackAt:v11 populatingAssetsForFactorNames:v12];
    }
    v14[2](v14, v21 & [(TRIInternalSystemServiceRequestHandler *)self _updateOnDemandReferenceCountsForUser:v10 atGlobalPath:v11 addingFactors:v12 removingFactors:0 newlyUnreferencedFactors:0]);
  }
  else
  {
    int v25 = TRILogCategory_Server();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412290;
      id v27 = v11;
      _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Asked to update factor pack at non-global or non-treatment directory location: %@", (uint8_t *)&v26, 0xCu);
    }

    v14[2](v14, 0);
  }
}

- (void)updateFactorPackForUserId:(id)a3 atGlobalPath:(id)a4 deletingFactors:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  id v14 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  id v15 = [v14 treatmentsDirUsingGlobal:1];
  char v16 = [v11 hasPrefix:v15];

  if (v16)
  {
    *(void *)uint64_t v28 = 0;
    char v17 = [TRIFactorPackStorage alloc];
    id v18 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    int v19 = [(TRIFactorPackStorage *)v17 initWithPaths:v18];

    BOOL v20 = [(TRIInternalSystemServiceRequestHandler *)self _updateOnDemandReferenceCountsForUser:v10 atGlobalPath:v11 addingFactors:0 removingFactors:v12 newlyUnreferencedFactors:v28];
    int v21 = *(void **)v28;
    if (!v20) {
      int v21 = v12;
    }
    id v22 = v21;
    uint64_t v23 = v20 & [(TRIFactorPackStorage *)v19 updateSavedGlobalFactorPackAt:v11 deletingAssetsWithFactorNames:v22];
    if (_os_feature_enabled_impl())
    {
      v24 = [TRIFBFactorPackStorage alloc];
      int v25 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
      int v26 = [(TRIFBFactorPackStorage *)v24 initWithPaths:v25];

      uint64_t v23 = v23 & [(TRIFBFactorPackStorage *)v26 updateSavedGlobalFactorPackAt:v11 deletingAssetsWithFactorNames:v22];
    }
    v13[2](v13, v23);
  }
  else
  {
    id v27 = TRILogCategory_Server();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v28 = 138412290;
      *(void *)&v28[4] = v11;
      _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Asked to delete factor pack at non-global or non-treatment directory location: %@", v28, 0xCu);
    }

    v13[2](v13, 0);
  }
}

- (void)removeUnreferencedGlobalFactorPacksWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, void))a3;
  v4 = [TRIFBFactorPackStorage alloc];
  id v5 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  v6 = [(TRIFBFactorPackStorage *)v4 initWithPaths:v5];

  unsigned int v8 = 0;
  uint64_t v7 = [(TRIFBFactorPackStorage *)v6 removeUnreferencedGlobalFactorPacksWithRemovedCount:&v8];
  v3[2](v3, v7, v8);
}

- (void)overwriteGlobalActiveFactorProvidersWithNamespaceMap:(id)a3 factorPackMap:(id)a4 rolloutDeploymentMap:(id)a5 completion:(id)a6
{
  BOOL v9 = (void (**)(id, uint64_t))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [TRINamespaceResolverStorage alloc];
  id v14 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  char v16 = [(TRINamespaceResolverStorage *)v13 initWithPaths:v14];

  uint64_t v15 = [(TRINamespaceResolverStorage *)v16 overwriteGlobalActiveFactorProvidersWithNamespaceMap:v12 factorPackMap:v11 rolloutDeploymentMap:v10];
  v9[2](v9, v15);
}

- (BOOL)_getOnDemandReferenceCountsAtGlobalPath:(id)a3 onDemandFactorsPerUser:(id *)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unsigned int v8 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  BOOL v9 = [v8 treatmentsDirUsingGlobal:1];
  char v10 = [v7 hasPrefix:v9];

  if (v10)
  {
    id v11 = [v7 stringByAppendingPathComponent:@"onDemandFactorsSubscribedUserMap.plplist"];
    id v12 = objc_opt_new();
    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v14 = [v13 fileExistsAtPath:v11];

    if (v14)
    {
      id v24 = 0;
      uint64_t v15 = [MEMORY[0x1E4F93B50] dictionaryWithPath:v11 error:&v24];
      id v16 = v24;
      char v17 = TRILogCategory_Server();
      id v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v21 = [v16 localizedDescription];
          *(_DWORD *)buf = 138543618;
          id v26 = v21;
          __int16 v27 = 2112;
          uint64_t v28 = v11;
          _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to open users per factors file with error %{public}@ at path %@", buf, 0x16u);
        }
        if (a5) {
          *a5 = v16;
        }

        BOOL v19 = 0;
        goto LABEL_18;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_INFO, "Successfully opened the users per factors file.", buf, 2u);
      }

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __111__TRIInternalSystemServiceRequestHandler__getOnDemandReferenceCountsAtGlobalPath_onDemandFactorsPerUser_error___block_invoke;
      v22[3] = &unk_1E6BB9C60;
      id v23 = v12;
      [v15 enumerateKeysAndObjectsUsingBlock:v22];
    }
    else
    {
      uint64_t v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_INFO, "Couldn't locate a global users per factors file. Will create a new one when saving.", buf, 2u);
      }
    }

    *a4 = v12;
    BOOL v19 = 1;
LABEL_18:

    goto LABEL_19;
  }
  id v11 = TRILogCategory_Server();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v7;
    _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Asked to update ref count at non-global or non-treatment directory location: %@", buf, 0xCu);
  }
  BOOL v19 = 0;
LABEL_19:

  return v19;
}

void __111__TRIInternalSystemServiceRequestHandler__getOnDemandReferenceCountsAtGlobalPath_onDemandFactorsPerUser_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [v4 setValue:v6 forKey:v5];
}

- (BOOL)_updateOnDemandReferenceCountsForUser:(id)a3 atGlobalPath:(id)a4 addingFactors:(id)a5 removingFactors:(id)a6 newlyUnreferencedFactors:(id *)a7
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v60 = [v13 stringByAppendingPathComponent:@"onDemandFactorsSubscribedUserMap.plplist"];
  id v16 = objc_opt_new();
  id v71 = v16;
  LOBYTE(a5) = [(TRIInternalSystemServiceRequestHandler *)self _getOnDemandReferenceCountsAtGlobalPath:v13 onDemandFactorsPerUser:&v71 error:0];
  id v17 = v71;

  if (a5)
  {
    v56 = a7;
    id v57 = v14;
    id v58 = v13;
    v59 = v15;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v18 = v14;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v67 objects:v79 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v68 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          id v24 = objc_msgSend(v17, "objectForKeyedSubscript:", v23, v56);
          if (v24)
          {
            [v17 setObject:v24 forKeyedSubscript:v23];
          }
          else
          {
            int v25 = objc_opt_new();
            [v17 setObject:v25 forKeyedSubscript:v23];
          }
          id v26 = [v17 objectForKeyedSubscript:v23];
          char v27 = [v26 containsObject:v12];

          if ((v27 & 1) == 0)
          {
            uint64_t v28 = [v17 objectForKeyedSubscript:v23];
            [v28 addObject:v12];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v67 objects:v79 count:16];
      }
      while (v20);
    }

    os_log_t log = (os_log_t)objc_opt_new();
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v29 = v59;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v63 objects:v78 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v64 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          id v35 = objc_msgSend(v17, "objectForKeyedSubscript:", v34, v56);

          if (v35)
          {
            id v36 = [v17 objectForKeyedSubscript:v34];
            [v36 removeObject:v12];

            id v37 = [v17 objectForKeyedSubscript:v34];
            uint64_t v38 = [v37 count];

            if (v38) {
              continue;
            }
            [v17 removeObjectForKey:v34];
            [log addObject:v34];
            v39 = TRILogCategory_Server();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v73 = (uint64_t)v34;
              id v40 = v39;
              __int16 v41 = "Factor %@ is now unreferenced by all users.";
LABEL_25:
              _os_log_impl(&dword_1DA291000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
            }
          }
          else
          {
            v39 = TRILogCategory_Server();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v73 = (uint64_t)v34;
              id v40 = v39;
              __int16 v41 = "Attempting to remove factor %@ that was not referenced.";
              goto LABEL_25;
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v63 objects:v78 count:16];
      }
      while (v31);
    }

    id v62 = 0;
    id v42 = (void *)v60;
    uint64_t v43 = [MEMORY[0x1E4F93B50] fileBackedDataWithPropertyList:v17 writtenToPath:v60 error:&v62];
    id v44 = v62;
    v45 = v44;
    if (v43) {
      BOOL v46 = v44 == 0;
    }
    else {
      BOOL v46 = 0;
    }
    BOOL v47 = v46;
    v48 = TRILogCategory_Server();
    v49 = v48;
    if (v47)
    {
      id v13 = v58;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v50 = [v18 count];
        uint64_t v51 = [v29 count];
        uint64_t v52 = [log count];
        *(_DWORD *)buf = 134218496;
        uint64_t v73 = v50;
        id v42 = (void *)v60;
        __int16 v74 = 2048;
        uint64_t v75 = v51;
        __int16 v76 = 2048;
        uint64_t v77 = v52;
        _os_log_impl(&dword_1DA291000, v49, OS_LOG_TYPE_DEFAULT, "Successfully referenced %lu assets and unreferenced %lu assets for current user. %lu assets are to be deleted as they are not referenced by any users.", buf, 0x20u);
      }

      id v14 = v57;
      id v15 = v59;
      if (!v56) {
        goto LABEL_47;
      }
      uint64_t v53 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:log];
      v49 = *v56;
      id *v56 = (id)v53;
    }
    else
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v55 = [v45 localizedDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v73 = (uint64_t)v55;
        _os_log_error_impl(&dword_1DA291000, v49, OS_LOG_TYPE_ERROR, "Failed to write users per factor file to temp path with error: %{public}@", buf, 0xCu);

        id v42 = (void *)v60;
      }
      id v14 = v57;
      id v13 = v58;
      id v15 = v59;
    }

LABEL_47:
    goto LABEL_48;
  }
  TRILogCategory_Server();
  os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DA291000, log, OS_LOG_TYPE_ERROR, "Could not update on demand reference counts since the existing data could not be read", buf, 2u);
  }
  BOOL v47 = 0;
  id v42 = (void *)v60;
LABEL_48:

  return v47;
}

- (void)getOnDemandReferenceCountsPerUserAtGlobalPath:(id)a3 completion:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__22;
  int v25 = __Block_byref_object_dispose__22;
  id v26 = 0;
  unsigned int v8 = [MEMORY[0x1E4FB0160] arrayFromDirectory:v6];
  if (v8)
  {
    BOOL v9 = objc_opt_new();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __99__TRIInternalSystemServiceRequestHandler_getOnDemandReferenceCountsPerUserAtGlobalPath_completion___block_invoke;
    v17[3] = &unk_1E6BBB3E8;
    uint64_t v20 = &v21;
    id v10 = v7;
    id v19 = v10;
    v17[4] = self;
    id v11 = v9;
    id v18 = v11;
    if (([v8 enumerateStringsWithBlock:v17] & 1) == 0)
    {
      id v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v6;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Could not iterate through namespaces in %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, id, uint64_t))v10 + 2))(v10, v11, v22[5]);
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"Unable to iterate through the list of namespaces";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    uint64_t v15 = [v13 initWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:v14];
    id v16 = (void *)v22[5];
    v22[5] = v15;

    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, v22[5]);
  }

  _Block_object_dispose(&v21, 8);
}

void __99__TRIInternalSystemServiceRequestHandler_getOnDemandReferenceCountsPerUserAtGlobalPath_completion___block_invoke(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 lastPathComponent];
  id v5 = (void *)MEMORY[0x1E016E7F0]();
  id v6 = [v3 stringByAppendingPathComponent:@"factorPacks"];
  id v7 = [MEMORY[0x1E4FB0160] arrayFromDirectory:v6];
  if (v7)
  {
    unsigned int v8 = objc_opt_new();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __99__TRIInternalSystemServiceRequestHandler_getOnDemandReferenceCountsPerUserAtGlobalPath_completion___block_invoke_2;
    v23[3] = &unk_1E6BBB3E8;
    v23[4] = *(void *)(a1 + 32);
    long long v22 = *(_OWORD *)(a1 + 48);
    id v9 = (id)v22;
    long long v25 = v22;
    id v10 = v8;
    id v24 = v10;
    if ([v7 enumerateStringsWithBlock:v23])
    {
      [*(id *)(a1 + 40) setValue:v10 forKey:v4];
    }
    else
    {
      id v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v4;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Could not iterate through factor packs for namespace %@", buf, 0xCu);
      }

      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v26 = *MEMORY[0x1E4F28568];
      char v27 = @"Failed to iterate through the list of factor packs";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v19 = [v17 initWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:v18];
      uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31[0] = @"Unable to iterate through the list of factor packs";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v13 = [v11 initWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __99__TRIInternalSystemServiceRequestHandler_getOnDemandReferenceCountsPerUserAtGlobalPath_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 lastPathComponent];
  id v5 = objc_opt_new();
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v7 + 40);
  id v12 = v5;
  char v8 = [v6 _getOnDemandReferenceCountsAtGlobalPath:v3 onDemandFactorsPerUser:&v12 error:&obj];
  id v9 = v12;

  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    [*(id *)(a1 + 40) setValue:v9 forKey:v4];
  }
  else
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Could not get onDemandReferenceCounts for %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)migrateToGlobalAssetStoreIfNeededFromLocalStore:(id)a3 sourceExtension:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = v9;
  [v11 UTF8String];
  if (sandbox_extension_consume() == -1)
  {
    id v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "failed to consume a sandbox extension", v13, 2u);
    }

    v10[2](v10, 0);
  }
  else
  {
    ((void (**)(id, BOOL))v10)[2](v10, [(TRIAssetStoreOperator *)self->_operator migrateToGlobalAssetStoreFromLocalAssetStore:v8]);
    sandbox_extension_release();
  }
}

- (void)logSystemCovariates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [TRISystemCovariates alloc];
  id v3 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  v4 = [(TRISystemCovariates *)v2 initWithPaths:v3];

  id v5 = TRILogCategory_Backtrace();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(TRISystemCovariates *)v4 dictionary];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "System covariates at the time of sysdiagnose: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_entitlementWitness, 0);
}

@end