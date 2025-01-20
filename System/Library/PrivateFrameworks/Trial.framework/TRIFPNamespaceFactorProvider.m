@interface TRIFPNamespaceFactorProvider
- (BOOL)promotable;
- (TRIFPNamespaceFactorProvider)initWithParentId:(id)a3 deploymentId:(int)a4 promotable:(BOOL)a5;
- (TRIFPNamespaceFactorProvider)initWithPath:(id)a3 parentId:(id)a4 deploymentId:(int)a5 treatmentId:(id)a6 promotable:(BOOL)a7;
- (TRIFactorPackId)factorPackId;
- (id)_factorLevelsWithFactorPackData:(id)a3 referencePath:(id)a4 outFactorPackId:(id *)a5 outNamespaceName:(id *)a6 outNCVs:(id *)a7;
- (id)_readAllFactorLevelsFromStorage;
- (id)experimentId;
- (id)factorLevels;
- (id)levelForFactor:(id)a3;
- (id)namespaceName;
- (id)rolloutId;
- (id)treatmentId;
- (int)deploymentId;
- (unsigned)namespaceCompatibilityVersion;
- (unsigned)namespaceId;
- (void)cacheFactorLevels;
- (void)dealloc;
- (void)dispose;
@end

@implementation TRIFPNamespaceFactorProvider

- (id)experimentId
{
  return self->_parentId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (id)treatmentId
{
  *(void *)&v19[13] = *MEMORY[0x1E4F143B8];
  if (self->_isFlatbufferWriteEnabled && !self->_isFlatbufferReadEnabled)
  {
    v3 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels sourceAsFactorPackId];

    if (v3)
    {
      v4 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels sourceAsFactorPackId];
      v5 = TRIValidateFactorPackId(v4);

      if (([v5 isEqualToString:self->_factorPackId] & 1) == 0)
      {
        v6 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          factorPackId = self->_factorPackId;
          int v16 = 138412546;
          v17 = v5;
          __int16 v18 = 2112;
          *(void *)v19 = factorPackId;
          _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, "Flatbuffer factor pack id: %@ does not match with protobuf factor pack id: %@", (uint8_t *)&v16, 0x16u);
        }
      }
    }
    else
    {
      v5 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        parentId = self->_parentId;
        int deploymentId = self->_deploymentId;
        v14 = self->_factorPackId;
        int v16 = 138543874;
        v17 = parentId;
        __int16 v18 = 1024;
        *(_DWORD *)v19 = deploymentId;
        v19[2] = 2114;
        *(void *)&v19[3] = v14;
        _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier within TRIFBFastFactorLevels object for rollout:%{public}@ deployment:%d, factor-pack: %{public}@", (uint8_t *)&v16, 0x1Cu);
      }
    }
  }
  p_treatmentId = (NSObject **)&self->_treatmentId;
  if (self->_treatmentId)
  {
    v8 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *p_treatmentId;
      int v16 = 138543362;
      v17 = v9;
      _os_log_impl(&dword_19D909000, v8, OS_LOG_TYPE_DEFAULT, "Factor pack had explicit treatment ID, returning that instead of factor pack ID as the treatment ID: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    p_treatmentId = (NSObject **)&self->_factorPackId;
  }
  v10 = *p_treatmentId;
  return v10;
}

- (void)dealloc
{
  [(TRIFPNamespaceFactorProvider *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)TRIFPNamespaceFactorProvider;
  [(TRIFPNamespaceFactorProvider *)&v3 dealloc];
}

- (TRIFPNamespaceFactorProvider)initWithParentId:(id)a3 deploymentId:(int)a4 promotable:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TRIFPNamespaceFactorProvider;
  v10 = [(TRIFPNamespaceFactorProvider *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parentId, a3);
    v11->_int deploymentId = a4;
    v11->_promotable = a5;
  }

  return v11;
}

- (TRIFPNamespaceFactorProvider)initWithPath:(id)a3 parentId:(id)a4 deploymentId:(int)a5 treatmentId:(id)a6 promotable:(BOOL)a7
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  if (!v14)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2, self, @"TRIFPNamespaceFactorProvider.m", 76, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v68.receiver = self;
  v68.super_class = (Class)TRIFPNamespaceFactorProvider;
  v17 = [(TRIFPNamespaceFactorProvider *)&v68 init];
  __int16 v18 = v17;
  if (!v17) {
    goto LABEL_36;
  }
  objc_storeStrong((id *)&v17->_parentId, a4);
  v18->_int deploymentId = a5;
  objc_storeStrong((id *)&v18->_treatmentId, a6);
  v18->_promotable = a7;
  v19 = [[TRIReferenceManagedDirReaderLock alloc] initWithDir:v14];
  dirLock = v18->_dirLock;
  v18->_dirLock = v19;

  if (!v18->_dirLock)
  {
LABEL_40:
    v55 = 0;
    goto LABEL_41;
  }
  v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  v22 = [v14 stringByAppendingPathComponent:@"factorPack.fb"];
  if ([v21 fileExistsAtPath:v22])
  {
    v18->_isFlatbufferReadEnabled = _os_feature_enabled_impl();
    v18->_isFlatbufferWriteEnabled = _os_feature_enabled_impl();
    objc_storeStrong((id *)&v18->_fbFactorPath, v22);
  }
  if (v18->_isFlatbufferReadEnabled && !v18->_isFlatbufferWriteEnabled)
  {
    v23 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_19D909000, v23, OS_LOG_TYPE_ERROR, "Invalid configuration for flatbuffer storage", (uint8_t *)location, 2u);
    }
  }
  if (v18->_fbFactorPath && v18->_isFlatbufferWriteEnabled)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    fbFactorPath = v18->_fbFactorPath;
    id v67 = 0;
    v26 = (void *)[v24 initWithContentsOfFile:fbFactorPath options:8 error:&v67];
    v27 = v67;
    if (!v26)
    {
      v43 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v27;
        _os_log_error_impl(&dword_19D909000, v43, OS_LOG_TYPE_ERROR, "Failed to open factor pack: %@", (uint8_t *)location, 0xCu);
      }

      goto LABEL_39;
    }
    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    warmupPersistentFactorLevelCache = v18->_warmupPersistentFactorLevelCache;
    v18->_warmupPersistentFactorLevelCache = v28;

    v30 = [[TRIFBFastFactorLevels alloc] initVerifiedRootObjectFromData:v26];
    fastFactorLevels = v18->_fastFactorLevels;
    v18->_fastFactorLevels = v30;

    objc_storeStrong((id *)&v18->_referencePath, a3);
    v32 = [(TRIFBFastFactorLevels *)v18->_fastFactorLevels ncvs];

    if (v32)
    {
      v33 = (void *)MEMORY[0x1E4F1CAD0];
      v34 = [(TRIFBFastFactorLevels *)v18->_fastFactorLevels ncvs];
      uint64_t v35 = [v33 setWithArray:v34];
      namespaceCompatibilityVersions = v18->_namespaceCompatibilityVersions;
      v18->_namespaceCompatibilityVersions = (NSSet *)v35;
    }
    if (v18->_isFlatbufferReadEnabled)
    {
      uint64_t v37 = [(TRIFBFastFactorLevels *)v18->_fastFactorLevels namespaceName];
      namespaceName = v18->_namespaceName;
      v18->_namespaceName = (NSString *)v37;

      v39 = [(TRIFBFastFactorLevels *)v18->_fastFactorLevels sourceAsFactorPackId];
      BOOL v40 = v39 == 0;

      if (v40)
      {
        v42 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v59 = v18->_fbFactorPath;
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v59;
          _os_log_error_impl(&dword_19D909000, v42, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier in TRIFBFastFactorLevels object for path: %@", (uint8_t *)location, 0xCu);
        }
      }
      else
      {
        v41 = [(TRIFBFastFactorLevels *)v18->_fastFactorLevels sourceAsFactorPackId];
        v42 = TRIValidateFactorPackId(v41);

        if (v42) {
          objc_storeStrong((id *)&v18->_factorPackId, v42);
        }
      }
    }
  }
  if (!v18->_isFlatbufferReadEnabled)
  {
    uint64_t v44 = [v14 stringByAppendingPathComponent:@"factorPack.pb"];
    pbFactorPath = v18->_pbFactorPath;
    v18->_pbFactorPath = (NSString *)v44;

    v46 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v47 = [v46 fileExistsAtPath:v18->_pbFactorPath];

    if (v47)
    {
      id v48 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v49 = v18->_pbFactorPath;
      id v66 = 0;
      v50 = [v48 initWithContentsOfFile:v49 options:8 error:&v66];
      v27 = v66;
      if (v50)
      {
        v51 = [(TRIFPNamespaceFactorProvider *)v18 _factorLevelsWithFactorPackData:v50 referencePath:v14 outFactorPackId:&v18->_factorPackId outNamespaceName:&v18->_namespaceName outNCVs:&v18->_namespaceCompatibilityVersions];
        v52 = v51;
        if (v51)
        {
          if ((unint64_t)[v51 count] < 0x11)
          {
            v57 = [[TRINaiveFactorLevelCache alloc] initWithFactorLevels:v52];
            factorLevels = v18->_factorLevels;
            v18->_factorLevels = (TRIFactorLevelCaching *)v57;
          }
          else
          {
            objc_initWeak(location, v18);
            v60 = [TRIPruningFactorLevelCache alloc];
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __90__TRIFPNamespaceFactorProvider_initWithPath_parentId_deploymentId_treatmentId_promotable___block_invoke;
            v62[3] = &unk_1E596A868;
            objc_copyWeak(&v65, location);
            v63 = v50;
            id v64 = v14;
            uint64_t v53 = [(TRIPruningFactorLevelCache *)v60 initWithPruningDelaySeconds:v62 loadFactorLevels:5.0];
            v54 = v18->_factorLevels;
            v18->_factorLevels = (TRIFactorLevelCaching *)v53;

            objc_destroyWeak(&v65);
            objc_destroyWeak(location);
          }

          goto LABEL_35;
        }
      }
      else
      {
        v50 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v27;
          _os_log_error_impl(&dword_19D909000, v50, OS_LOG_TYPE_ERROR, "Failed to open factor pack: %@", (uint8_t *)location, 0xCu);
        }
      }

      goto LABEL_39;
    }
  }
  if (!v18->_fbFactorPath)
  {
    v27 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_19D909000, v27, OS_LOG_TYPE_ERROR, "Failed to open factor pack storage based on any storage type", (uint8_t *)location, 2u);
    }
LABEL_39:

    goto LABEL_40;
  }
LABEL_35:

LABEL_36:
  v55 = v18;
LABEL_41:

  return v55;
}

id __90__TRIFPNamespaceFactorProvider_initWithPath_parentId_deploymentId_treatmentId_promotable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained _factorLevelsWithFactorPackData:*(void *)(a1 + 32) referencePath:*(void *)(a1 + 40) outFactorPackId:0 outNamespaceName:0 outNCVs:0];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)_factorLevelsWithFactorPackData:(id)a3 referencePath:(id)a4 outFactorPackId:(id *)a5 outNamespaceName:(id *)a6 outNCVs:(id *)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  objc_super v13 = (void *)MEMORY[0x19F3AD060]();
  id v56 = 0;
  id v14 = [[TRIClientFactorPackStreamingParser alloc] initWithData:v11 error:&v56];
  id v15 = v14;
  if (!v14)
  {
    id v24 = TRILogCategory_ClientFramework();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412546;
    id v58 = v12;
    __int16 v59 = 2112;
    id v60 = v56;
    v45 = "Unable to parse factor pack %@: %@";
    v46 = v24;
    uint32_t v47 = 22;
LABEL_26:
    _os_log_error_impl(&dword_19D909000, v46, OS_LOG_TYPE_ERROR, v45, buf, v47);
    goto LABEL_18;
  }
  if (![(TRIClientFactorPackStreamingParser *)v14 hasSelectedNamespace]) {
    goto LABEL_17;
  }
  id v16 = [(TRIClientFactorPackStreamingParser *)v15 selectedNamespace];
  if (([v16 hasName] & 1) == 0)
  {

    goto LABEL_17;
  }
  [(TRIClientFactorPackStreamingParser *)v15 selectedNamespace];
  v17 = id v49 = v11;
  [v17 name];
  id v18 = v12;
  v20 = v19 = v13;
  uint64_t v21 = [v20 length];

  objc_super v13 = v19;
  id v12 = v18;
  v22 = a7;

  id v11 = v49;
  if (!v21)
  {
LABEL_17:
    id v24 = TRILogCategory_ClientFramework();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    id v58 = v12;
    v45 = "Factor pack has unset or empty namespace name: %@";
    goto LABEL_25;
  }
  if (![(TRIClientFactorPackStreamingParser *)v15 hasFactorPackId])
  {
    id v24 = TRILogCategory_ClientFramework();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    id v58 = v12;
    v45 = "Factor pack has unset factor pack id: %@";
LABEL_25:
    v46 = v24;
    uint32_t v47 = 12;
    goto LABEL_26;
  }
  v23 = [(TRIClientFactorPackStreamingParser *)v15 factorPackId];
  id v24 = TRIValidateFactorPackId(v23);

  if (!v24)
  {
LABEL_18:
    uint64_t v44 = 0;
    goto LABEL_19;
  }
  if (a5) {
    objc_storeStrong(a5, v24);
  }
  if (a6)
  {
    v25 = [(TRIClientFactorPackStreamingParser *)v15 selectedNamespace];
    v26 = [v25 name];
    id v27 = *a6;
    *a6 = v26;
  }
  if (v22)
  {
    id v28 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v29 = [(TRIClientFactorPackStreamingParser *)v15 selectedNamespace];
    v30 = objc_msgSend(v28, "initWithCapacity:", objc_msgSend(v29, "compatibilityVersionArray_Count"));

    v31 = [(TRIClientFactorPackStreamingParser *)v15 selectedNamespace];
    v32 = [v31 compatibilityVersionArray];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __119__TRIFPNamespaceFactorProvider__factorLevelsWithFactorPackData_referencePath_outFactorPackId_outNamespaceName_outNCVs___block_invoke;
    v54[3] = &unk_1E596A890;
    id v33 = v30;
    id v55 = v33;
    [v32 enumerateValuesWithBlock:v54];

    id v34 = *v22;
    id *v22 = v33;
    id v35 = v33;
  }
  v36 = (void *)[objc_alloc(MEMORY[0x1E4F93B38]) initWithBehavior:1 copyWithZone:0];
  uint64_t v37 = [(TRIClientFactorPackStreamingParser *)v15 selectedNamespace];
  v38 = [v37 name];
  id v39 = (id)[v36 intern:v38];

  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __119__TRIFPNamespaceFactorProvider__factorLevelsWithFactorPackData_referencePath_outFactorPackId_outNamespaceName_outNCVs___block_invoke_2;
  v50[3] = &unk_1E596A8B8;
  id v41 = v12;
  id v51 = v41;
  id v52 = v36;
  id v53 = v40;
  id v42 = v40;
  id v43 = v36;
  [(TRIClientFactorPackStreamingParser *)v15 enumerateFactorLevelsWithBlock:v50];
  uint64_t v44 = +[TRINamespaceFactorProvider populateMAPathsForFactorLevels:v42 loadedFromParentDir:v41];

  id v11 = v49;
LABEL_19:

  return v44;
}

void __119__TRIFPNamespaceFactorProvider__factorLevelsWithFactorPackData_referencePath_outFactorPackId_outNamespaceName_outNCVs___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

void __119__TRIFPNamespaceFactorProvider__factorLevelsWithFactorPackData_referencePath_outFactorPackId_outNamespaceName_outNCVs___block_invoke_2(uint64_t a1, void *a2)
{
  id v18 = a2;
  if ([v18 hasFactor])
  {
    id v3 = [v18 factor];
    if ([v3 hasName])
    {
      int v4 = [v18 hasLevel];

      if (!v4) {
        goto LABEL_12;
      }
      v5 = [v18 level];
      id v3 = [v5 fileOrDirectoryLevelWithIsDir:0];

      if (v3)
      {
        if ([v3 hasPath])
        {
          v6 = [v3 path];
          char v7 = [v6 isAbsolutePath];

          if ((v7 & 1) == 0)
          {
            v8 = *(void **)(a1 + 32);
            id v9 = [v3 path];
            v10 = [v8 stringByAppendingPathComponent:v9];
            [v3 setPath:v10];
          }
        }
      }
      id v11 = [v18 factor];
      int v12 = [v11 hasNamespaceName];

      if (v12)
      {
        objc_super v13 = *(void **)(a1 + 40);
        id v14 = [v18 factor];
        id v15 = [v14 namespaceName];
        id v16 = [v13 intern:v15];
        v17 = [v18 factor];
        [v17 setNamespaceName:v16];
      }
      [*(id *)(a1 + 48) addObject:v18];
    }
  }
LABEL_12:
}

- (unsigned)namespaceId
{
  unsigned int v5 = 0;
  id v3 = TRINamespace_NamespaceId_EnumDescriptor();
  LODWORD(self) = [v3 getValue:&v5 forEnumTextFormatName:self->_namespaceName];

  if (self) {
    return v5;
  }
  else {
    return 0;
  }
}

- (id)namespaceName
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_isFlatbufferWriteEnabled && !self->_isFlatbufferReadEnabled)
  {
    namespaceName = self->_namespaceName;
    int v4 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels namespaceName];
    LOBYTE(namespaceName) = [(NSString *)namespaceName isEqualToString:v4];

    if ((namespaceName & 1) == 0)
    {
      unsigned int v5 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels namespaceName];
        id v9 = self->_namespaceName;
        int v10 = 138412546;
        id v11 = v8;
        __int16 v12 = 2112;
        objc_super v13 = v9;
        _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "Flatbuffer namespace name: %@ does not match with protobuf name: %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  v6 = self->_namespaceName;
  return v6;
}

- (unsigned)namespaceCompatibilityVersion
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_isFlatbufferWriteEnabled && !self->_isFlatbufferReadEnabled)
  {
    uint64_t v11 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels ncvs];
    if (v11)
    {
      __int16 v12 = (void *)v11;
      namespaceCompatibilityVersions = self->_namespaceCompatibilityVersions;
      uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
      id v15 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels ncvs];
      id v16 = [v14 setWithArray:v15];
      LOBYTE(namespaceCompatibilityVersions) = [(NSSet *)namespaceCompatibilityVersions isEqual:v16];

      if ((namespaceCompatibilityVersions & 1) == 0)
      {
        v17 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = (void *)MEMORY[0x1E4F1CAD0];
          v19 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels ncvs];
          v20 = [v18 setWithArray:v19];
          uint64_t v21 = self->_namespaceCompatibilityVersions;
          *(_DWORD *)buf = 138412546;
          id v28 = v20;
          __int16 v29 = 2112;
          v30 = v21;
          _os_log_error_impl(&dword_19D909000, v17, OS_LOG_TYPE_ERROR, "Flatbuffer ncvs:%@ do not match with protobuf ncvs: %@", buf, 0x16u);
        }
      }
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = self->_namespaceCompatibilityVersions;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {

    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v23;
  signed int v7 = 0x80000000;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v23 != v6) {
        objc_enumerationMutation(v3);
      }
      signed int v9 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "intValue", (void)v22);
      if (v7 <= v9) {
        signed int v7 = v9;
      }
    }
    uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v5);

  if (v7 == 0x80000000) {
    return 0;
  }
  return v7;
}

- (id)rolloutId
{
  *(void *)&v16[13] = *MEMORY[0x1E4F143B8];
  if (self->_isFlatbufferWriteEnabled && !self->_isFlatbufferReadEnabled)
  {
    id v3 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels sourceAsFactorPackId];

    if (v3)
    {
      uint64_t v4 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels sourceAsFactorPackId];
      uint64_t v5 = TRIValidateFactorPackId(v4);

      if (([v5 isEqualToString:self->_factorPackId] & 1) == 0)
      {
        uint64_t v6 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          factorPackId = self->_factorPackId;
          int v13 = 138412546;
          uint64_t v14 = v5;
          __int16 v15 = 2112;
          *(void *)id v16 = factorPackId;
          _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, "Flatbuffer rollout id: %@ does not match with protobuf rollout id: %@", (uint8_t *)&v13, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v5 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        parentId = self->_parentId;
        int deploymentId = self->_deploymentId;
        uint64_t v11 = self->_factorPackId;
        int v13 = 138543874;
        uint64_t v14 = parentId;
        __int16 v15 = 1024;
        *(_DWORD *)id v16 = deploymentId;
        v16[2] = 2114;
        *(void *)&v16[3] = v11;
        _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier within TRIFBFastFactorLevels object for rollout:%{public}@ deployment:%d, factor-pack: %{public}@", (uint8_t *)&v13, 0x1Cu);
      }
    }
  }
  signed int v7 = self->_factorPackId;
  return v7;
}

- (id)levelForFactor:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_warmupPersistentFactorLevelCache count])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_warmupPersistentFactorLevelCache objectForKey:v4];
    uint64_t v6 = v5;
    if (!v5 || ![v5 hasLevel])
    {
      id v8 = 0;
      goto LABEL_40;
    }
    signed int v7 = [v6 level];
    id v8 = +[TRILevelChecked wrapLevel:v7];
  }
  else
  {
    if (self->_isFlatbufferReadEnabled)
    {
      signed int v7 = 0;
      uint64_t v6 = 0;
    }
    else
    {
      signed int v9 = [(TRIFactorLevelCaching *)self->_factorLevels objectForKeyedSubscript:v4];
      uint64_t v6 = v9;
      if (v9)
      {
        int v10 = [v9 level];
        if (v10)
        {
          signed int v7 = +[TRILevelChecked wrapLevel:v10];
        }
        else
        {
          signed int v7 = 0;
        }
      }
      else
      {
        signed int v7 = 0;
      }
    }
    if (self->_isFlatbufferWriteEnabled)
    {
      uint64_t v11 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels levelsAsDict];
      __int16 v12 = [v11 objectForKeyedSubscript:v4];

      if (v12)
      {
        int v13 = [(NSString *)self->_fbFactorPath stringByDeletingLastPathComponent];
        uint64_t v14 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels namespaceName];
        __int16 v15 = +[TRIFlatbufferUtils convertFBFactorLevelToProtoFactorLevel:v12 parentDir:v13 namespaceName:v14 isRelativePath:0];
      }
      else
      {
        __int16 v15 = 0;
      }
      if (!self->_isFlatbufferReadEnabled && ([v6 isEqual:v15] & 1) == 0)
      {
        v17 = [v15 factor];
        id v18 = [v17 metadataKeysArray];
        v19 = [v6 factor];
        v20 = [v19 metadataKeysArray];

        if (v18 != v20)
        {
          v32 = [v15 level];
          uint64_t v21 = [v32 metadata];
          long long v22 = [v6 level];
          uint64_t v23 = [v22 metadata];
          long long v24 = (void *)v23;
          uint64_t v25 = v23 ? v23 : MEMORY[0x1E4F1CC08];
          char v26 = [v21 isEqualToDictionary:v25];

          if ((v26 & 1) == 0)
          {
            id v27 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v34 = v15;
              _os_log_error_impl(&dword_19D909000, v27, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage:%@ does not match factor level from pb", buf, 0xCu);
            }

            id v28 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v34 = v6;
              _os_log_error_impl(&dword_19D909000, v28, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage does not match factor level from pb: %@", buf, 0xCu);
            }
          }
        }
      }
      if (v15)
      {
        __int16 v29 = [v15 level];
        id v16 = +[TRILevelChecked wrapLevel:v29];
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
    if (self->_isFlatbufferReadEnabled) {
      v30 = v16;
    }
    else {
      v30 = v7;
    }
    id v8 = v30;
  }
LABEL_40:

  return v8;
}

- (id)_readAllFactorLevelsFromStorage
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  if (self->_isFlatbufferReadEnabled)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    factorLevels = self->_factorLevels;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke;
    v57[3] = &unk_1E596A400;
    id v4 = v5;
    id v58 = v4;
    [(TRIFactorLevelCaching *)factorLevels enumerateFactorLevelsUsingBlock:v57];
  }
  if (self->_isFlatbufferWriteEnabled)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v8 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels levels];
    signed int v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    int v10 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels levels];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_2;
    v55[3] = &unk_1E596A478;
    v55[4] = self;
    id v11 = v9;
    id v56 = v11;
    [v10 enumerateObjectsUsingBlock:v55];

    if (!self->_isFlatbufferReadEnabled)
    {
      id v51 = v3;
      context = (void *)MEMORY[0x19F3AD060]();
      __int16 v12 = [v4 sortedArrayUsingComparator:&__block_literal_global_6];
      id v50 = v11;
      v54 = [v11 sortedArrayUsingComparator:&__block_literal_global_6];
      if ((objc_msgSend(v12, "isEqual:") & 1) == 0)
      {
        uint64_t v13 = [v12 count];
        if (v13 == [v54 count])
        {
          if ([v12 count])
          {
            unint64_t v15 = 0;
            int v52 = 0;
            *(void *)&long long v14 = 138412290;
            long long v48 = v14;
            id v53 = v12;
            while (1)
            {
              id v16 = objc_msgSend(v12, "objectAtIndexedSubscript:", v15, v48);
              v17 = [v54 objectAtIndexedSubscript:v15];
              id v18 = [v16 factor];
              v19 = objc_msgSend(v18, "id_p");
              v20 = [v17 factor];
              uint64_t v21 = objc_msgSend(v20, "id_p");
              char v22 = [v19 isEqualToString:v21];

              if (v22) {
                break;
              }
              int v32 = v52;
              if (v52 <= 2)
              {
                id v34 = TRILogCategory_ClientFramework();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v35 = [v16 factor];
                  objc_msgSend(v35, "id_p");
                  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
                  uint64_t v37 = [v17 factor];
                  v38 = objc_msgSend(v37, "id_p");
                  *(_DWORD *)buf = 138412546;
                  id v60 = v36;
                  __int16 v61 = 2112;
                  uint64_t v62 = (uint64_t)v38;
                  _os_log_error_impl(&dword_19D909000, v34, OS_LOG_TYPE_ERROR, "primary id does not match for factors in arrays, pb:%@, fb:%@", buf, 0x16u);

                  int v32 = v52;
                }
LABEL_22:

                int v52 = v32 + 1;
              }
LABEL_23:

              ++v15;
              __int16 v12 = v53;
              if ([v53 count] <= v15) {
                goto LABEL_29;
              }
            }
            if ([v16 isEqual:v17]) {
              goto LABEL_23;
            }
            uint64_t v23 = [v17 factor];
            long long v24 = [v23 metadataKeysArray];
            uint64_t v25 = [v16 factor];
            char v26 = [v25 metadataKeysArray];

            if (v24 == v26) {
              goto LABEL_23;
            }
            id v27 = [v17 level];
            id v28 = [v27 metadata];
            __int16 v29 = [v16 level];
            v30 = [v29 metadata];
            char v31 = [v28 isEqualToDictionary:v30];

            if (v31) {
              goto LABEL_23;
            }
            int v32 = v52;
            if (v52 > 2) {
              goto LABEL_23;
            }
            id v33 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v48;
              id v60 = (NSString *)v17;
              _os_log_error_impl(&dword_19D909000, v33, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage:%@ does not match factor level from pb", buf, 0xCu);
            }

            id v34 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v48;
              id v60 = (NSString *)v16;
              _os_log_error_impl(&dword_19D909000, v34, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage does not match factor level from pb: %@", buf, 0xCu);
            }
            goto LABEL_22;
          }
        }
        else
        {
          id v39 = TRILogCategory_ClientFramework();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            namespaceName = self->_namespaceName;
            uint64_t v46 = [v12 count];
            uint64_t v47 = [v54 count];
            *(_DWORD *)buf = 138412802;
            id v60 = namespaceName;
            __int16 v61 = 2048;
            uint64_t v62 = v46;
            __int16 v63 = 2048;
            uint64_t v64 = v47;
            _os_log_error_impl(&dword_19D909000, v39, OS_LOG_TYPE_ERROR, "Factor levels from flatbuffers do not match factor levels for protobuf for namespace: %@, with counts forPb:%lu forFb:%lu", buf, 0x20u);
          }
        }
      }
LABEL_29:

      id v11 = v50;
      id v3 = v51;
    }
  }
  else
  {
    id v11 = 0;
  }
  if (self->_isFlatbufferReadEnabled)
  {
    id v40 = v11;

    id v4 = v40;
  }
  id v41 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v4) {
    id v42 = v4;
  }
  else {
    id v42 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v43 = (void *)[v41 initWithArray:v42 copyItems:1];

  return v43;
}

uint64_t __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)MEMORY[0x19F3AD060]();
  id v4 = [*(id *)(*(void *)(a1 + 32) + 104) stringByDeletingLastPathComponent];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 80) namespaceName];
  uint64_t v6 = +[TRIFlatbufferUtils convertFBFactorLevelToProtoFactorLevel:v7 parentDir:v4 namespaceName:v5 isRelativePath:0];

  [*(id *)(a1 + 40) addObject:v6];
}

uint64_t __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 factor];
  uint64_t v6 = objc_msgSend(v5, "id_p");
  id v7 = [v4 factor];

  id v8 = objc_msgSend(v7, "id_p");
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)factorLevels
{
  if ([(NSMutableDictionary *)self->_warmupPersistentFactorLevelCache count]) {
    [(NSMutableDictionary *)self->_warmupPersistentFactorLevelCache allValues];
  }
  else {
  id v3 = [(TRIFPNamespaceFactorProvider *)self _readAllFactorLevelsFromStorage];
  }
  return v3;
}

- (void)cacheFactorLevels
{
  id v3 = [(TRIFPNamespaceFactorProvider *)self _readAllFactorLevelsFromStorage];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__TRIFPNamespaceFactorProvider_cacheFactorLevels__block_invoke;
  v4[3] = &unk_1E596A4C0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __49__TRIFPNamespaceFactorProvider_cacheFactorLevels__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  id v3 = a2;
  id v5 = [v3 factor];
  id v4 = [v5 name];
  [v2 setObject:v3 forKey:v4];
}

- (void)dispose
{
}

- (TRIFactorPackId)factorPackId
{
  return self->_factorPackId;
}

- (BOOL)promotable
{
  return self->_promotable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_fbFactorPath, 0);
  objc_storeStrong((id *)&self->_pbFactorPath, 0);
  objc_storeStrong((id *)&self->_referencePath, 0);
  objc_storeStrong((id *)&self->_fastFactorLevels, 0);
  objc_storeStrong((id *)&self->_warmupPersistentFactorLevelCache, 0);
  objc_storeStrong((id *)&self->_dirLock, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_factorLevels, 0);
  objc_storeStrong((id *)&self->_namespaceCompatibilityVersions, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
}

@end