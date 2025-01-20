@interface TRINamespaceFactorProvider
+ (id)_assetFilenameForFactor:(id)a3;
+ (id)_maAutoAssetReferencedInDir:(id)a3 byFactorName:(id)a4;
+ (id)factorLevelsWithTreatmentData:(id)a3 referencePath:(id)a4 filteredByNamespaceName:(id)a5 outTreatmentId:(id *)a6 error:(id *)a7;
+ (id)factorProviderWithNamespaceDescriptor:(id)a3 paths:(id)a4 faultOnMissingFactors:(BOOL)a5 shouldLockFactorDirectory:(BOOL)a6;
+ (id)factorProviderWithNamespaceName:(id)a3 paths:(id)a4 treatmentLayer:(unint64_t)a5 faultOnMissingFactors:(BOOL)a6 shouldLockFactorDirectory:(BOOL)a7;
+ (id)pathForFactor:(id)a3 directory:(id)a4;
+ (id)populateMAPathsForFactorLevels:(id)a3 loadedFromParentDir:(id)a4;
- (BOOL)overwriteItemAtPath:(id)a3 withItemAtPath:(id)a4 error:(id *)a5;
- (BOOL)saveToPath:(id)a3 copyAssets:(BOOL)a4;
- (NSString)namespaceName;
- (TRINamespaceFactorProvider)initWithNamespaceName:(id)a3 namespaceCompatibilityVersion:(unsigned int)a4 paths:(id)a5 referencePath:(id)a6 factorLevels:(id)a7 fastFactorLevels:(id)a8 treatmentId:(id)a9 factorDirectoryLock:(id)a10;
- (TRINamespaceFactorProvider)initWithNamespaceName:(id)a3 treatmentData:(id)a4 namespaceCompatibilityVersion:(unsigned int)a5 paths:(id)a6 referencePath:(id)a7 isFlatbufferStorage:(BOOL)a8 factorDirectoryLock:(id)a9 error:(id *)a10;
- (id)_copyAssetsToDirectory:(id)a3;
- (id)_readAllFactorLevelsFromStorage;
- (id)experimentId;
- (id)factorLevels;
- (id)levelForFactor:(id)a3;
- (id)overlayLevelsFromFactorProvider:(id)a3;
- (id)rolloutId;
- (id)treatmentId;
- (int)deploymentId;
- (unsigned)namespaceCompatibilityVersion;
- (unsigned)namespaceId;
- (void)cacheFactorLevels;
- (void)dispose;
@end

@implementation TRINamespaceFactorProvider

- (id)levelForFactor:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_warmupPersistentFactorLevelCache count])
  {
    v5 = [(NSMutableDictionary *)self->_warmupPersistentFactorLevelCache objectForKey:v4];
    v6 = v5;
    if (!v5 || ![v5 hasLevel])
    {
      id v8 = 0;
      goto LABEL_36;
    }
    v7 = [v6 level];
    id v8 = +[TRILevelChecked wrapLevel:v7];
  }
  else
  {
    v9 = [(TRIFactorLevelCaching *)self->_factorLevels objectForKeyedSubscript:v4];
    v6 = v9;
    if (v9)
    {
      v10 = [v9 level];
      if (v10)
      {
        v7 = +[TRILevelChecked wrapLevel:v10];
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    if (self->_isFBWriteEnabled)
    {
      v11 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels levelsAsDict];
      v12 = [v11 objectForKeyedSubscript:v4];

      if (v12)
      {
        referencePath = self->_referencePath;
        v14 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels namespaceName];
        v15 = +[TRIFlatbufferUtils convertFBFactorLevelToProtoFactorLevel:v12 parentDir:referencePath namespaceName:v14 isRelativePath:1];
      }
      else
      {
        v15 = 0;
      }
      if (!self->_isFBReadEnabled && ([v6 isEqual:v15] & 1) == 0)
      {
        v17 = [v15 factor];
        v18 = [v17 metadataKeysArray];
        v19 = [v6 factor];
        v20 = [v19 metadataKeysArray];

        if (v18 != v20)
        {
          v31 = [v15 level];
          v21 = [v31 metadata];
          v22 = [v6 level];
          uint64_t v23 = [v22 metadata];
          v24 = (void *)v23;
          uint64_t v25 = v23 ? v23 : MEMORY[0x1E4F1CC08];
          char v26 = [v21 isEqualToDictionary:v25];

          if ((v26 & 1) == 0)
          {
            v27 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v33 = v15;
              __int16 v34 = 2112;
              v35 = v6;
              _os_log_error_impl(&dword_19D909000, v27, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage:%@ does not match factor level from pb: %@", buf, 0x16u);
            }
          }
        }
      }
      if (v15)
      {
        v28 = [v15 level];
        v16 = +[TRILevelChecked wrapLevel:v28];
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    if (self->_isFBReadEnabled) {
      v29 = v16;
    }
    else {
      v29 = v7;
    }
    id v8 = v29;
  }
LABEL_36:

  return v8;
}

id __119__TRINamespaceFactorProvider_factorLevelsWithTreatmentData_referencePath_filteredByNamespaceName_outTreatmentId_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3AD060]();
  if (![v3 hasFactor]) {
    goto LABEL_16;
  }
  v5 = [v3 factor];
  if ([v5 isInNamespaceName:a1[4]])
  {
    v6 = [v3 factor];
    if ([v6 hasName])
    {
      int v7 = [v3 hasLevel];

      if (v7)
      {
        id v8 = [v3 level];
        v5 = [v8 fileOrDirectoryLevelWithIsDir:0];

        if (a1[5])
        {
          if (v5)
          {
            if ([v5 hasPath])
            {
              v9 = [v5 path];
              char v10 = [v9 isAbsolutePath];

              if ((v10 & 1) == 0)
              {
                v11 = (void *)a1[5];
                v12 = [v5 path];
                v13 = [v11 stringByAppendingPathComponent:v12];
                [v5 setPath:v13];
              }
            }
          }
        }
        v14 = [v3 factor];
        int v15 = [v14 hasNamespaceName];

        if (v15)
        {
          v16 = (void *)a1[6];
          v17 = [v3 factor];
          v18 = [v17 namespaceName];
          v19 = [v16 intern:v18];
          v20 = [v3 factor];
          [v20 setNamespaceName:v19];
        }
        if ([v5 hasAsset])
        {
          v21 = [v5 asset];
          int v22 = [v21 hasTreatmentId];

          if (v22)
          {
            uint64_t v23 = (void *)a1[6];
            v24 = [v5 asset];
            uint64_t v25 = [v24 treatmentId];
            char v26 = [v23 intern:v25];
            v27 = [v5 asset];
            [v27 setTreatmentId:v26];
          }
        }
        id v28 = v3;
        goto LABEL_19;
      }
LABEL_16:
      id v28 = 0;
      goto LABEL_20;
    }
  }
  id v28 = 0;
LABEL_19:

LABEL_20:

  return v28;
}

- (unsigned)namespaceCompatibilityVersion
{
  return self->_namespaceCompatibilityVersion;
}

+ (id)factorProviderWithNamespaceName:(id)a3 paths:(id)a4 treatmentLayer:(unint64_t)a5 faultOnMissingFactors:(BOOL)a6 shouldLockFactorDirectory:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  int v15 = v14;
  switch(a5)
  {
    case 1uLL:
      uint64_t v16 = [v14 namespaceDescriptorsDefaultDir];
      goto LABEL_9;
    case 2uLL:
      uint64_t v16 = [v14 namespaceDescriptorsRolloutDir];
      goto LABEL_9;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_17;
    case 4uLL:
      goto LABEL_5;
    case 8uLL:
      uint64_t v16 = [v14 namespaceDescriptorsDevOverrideDir];
      goto LABEL_9;
    default:
      if (a5 == 16)
      {
        uint64_t v16 = [v14 namespaceDescriptorsBMLTDir];
      }
      else
      {
        if (a5 != 32) {
          goto LABEL_17;
        }
LABEL_5:
        uint64_t v16 = [v14 namespaceDescriptorsExperimentDir];
      }
LABEL_9:
      v17 = (void *)v16;
      if (v16) {
        goto LABEL_10;
      }
LABEL_17:
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, a1, @"TRINamespaceFactorProvider.m", 82, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];

      v17 = 0;
LABEL_10:
      v18 = +[TRINamespaceDescriptor loadWithNamespaceName:v13 fromDirectory:v17];
      v19 = v18;
      if (v18
        && ([v18 namespaceName],
            v20 = objc_claimAutoreleasedReturnValue(),
            int v21 = [v20 isEqualToString:v13],
            v20,
            v21))
      {
        int v22 = +[TRINamespaceFactorProvider factorProviderWithNamespaceDescriptor:v19 paths:v15 faultOnMissingFactors:v8 shouldLockFactorDirectory:v7];
      }
      else
      {
        int v22 = 0;
      }

      return v22;
  }
}

+ (id)factorProviderWithNamespaceDescriptor:(id)a3 paths:(id)a4 faultOnMissingFactors:(BOOL)a5 shouldLockFactorDirectory:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = objc_msgSend(v10, "factorsAbsolutePathAsOwner:", +[TRIProcessInfo hostingProcessIsTriald](TRIProcessInfo, "hostingProcessIsTriald") ^ 1);
  if (!v12)
  {
    v18 = [TRINaiveFactorLevelCache alloc];
    uint64_t v16 = [(TRINaiveFactorLevelCache *)v18 initWithFactorLevels:MEMORY[0x1E4F1CBF0]];
    id v19 = objc_alloc((Class)a1);
    v20 = [v10 namespaceName];
    int v15 = objc_msgSend(v19, "initWithNamespaceName:namespaceCompatibilityVersion:paths:referencePath:factorLevels:fastFactorLevels:treatmentId:factorDirectoryLock:", v20, objc_msgSend(v10, "downloadNCV"), v11, 0, v16, 0, 0, 0);

LABEL_33:
    goto LABEL_34;
  }
  *__error() = 0;
  if (v7
    || (id v13 = v12, !access((const char *)[v13 fileSystemRepresentation], 4))
    || *__error() != 1)
  {
    uint64_t v16 = [v12 stringByDeletingLastPathComponent];
    if (v6)
    {
      v17 = [[TRIReferenceManagedDirReaderLock alloc] initWithDir:v16];
      if (!v17)
      {
        TRILogCategory_ClientFramework();
        v17 = (TRIReferenceManagedDirReaderLock *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v12;
          _os_log_impl(&dword_19D909000, &v17->super, OS_LOG_TYPE_DEFAULT, "Unable to acquire lock on factory directory: %@. Returning nil factor provider", buf, 0xCu);
        }
        int v15 = 0;
        goto LABEL_32;
      }
    }
    else
    {
      v17 = 0;
    }
    id v33 = 0;
    int v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v12 options:8 error:&v33];
    id v22 = v33;
    if (v21)
    {
      if ([v21 length])
      {
        uint64_t v23 = [v12 hasSuffix:@".fb"];
        id v32 = 0;
        id v24 = objc_alloc((Class)a1);
        uint64_t v25 = [v10 namespaceName];
        int v15 = objc_msgSend(v24, "initWithNamespaceName:treatmentData:namespaceCompatibilityVersion:paths:referencePath:isFlatbufferStorage:factorDirectoryLock:error:", v25, v21, objc_msgSend(v10, "downloadNCV"), v11, v16, v23, v17, &v32);

        if (!v15)
        {
          char v26 = TRILogCategory_ClientFramework();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v35 = v12;
            __int16 v36 = 2112;
            id v37 = v32;
            _os_log_error_impl(&dword_19D909000, v26, OS_LOG_TYPE_ERROR, "Failed to parse ClientTreatment from file \"%@\": %@", buf, 0x16u);
          }
        }
        goto LABEL_31;
      }
      id v28 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [v10 namespaceName];
        *(_DWORD *)buf = 138412546;
        id v35 = v29;
        __int16 v36 = 2112;
        id v37 = v12;
        _os_log_impl(&dword_19D909000, v28, OS_LOG_TYPE_DEFAULT, "Factors file for namespace %@ at path %@ was empty, acting as if the file didn't exist", buf, 0x16u);
      }
    }
    else
    {
      if (v7)
      {
        v27 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v31 = [v10 namespaceName];
          *(_DWORD *)buf = 138412802;
          id v35 = v31;
          __int16 v36 = 2112;
          id v37 = v12;
          __int16 v38 = 2112;
          id v39 = v22;
          _os_log_error_impl(&dword_19D909000, v27, OS_LOG_TYPE_ERROR, "No factor for namespace %@ found at path: %@ (%@)", buf, 0x20u);
        }
      }
      id v28 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v35 = v12;
        __int16 v36 = 2112;
        id v37 = v22;
        _os_log_error_impl(&dword_19D909000, v28, OS_LOG_TYPE_ERROR, "Failed to read data from file %@: %@", buf, 0x16u);
      }
    }

    int v15 = 0;
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  id v14 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v13;
    _os_log_impl(&dword_19D909000, v14, OS_LOG_TYPE_DEFAULT, "factors defined at %@ are not accessible with triald sandbox", buf, 0xCu);
  }

  int v15 = 0;
LABEL_34:

  return v15;
}

- (TRINamespaceFactorProvider)initWithNamespaceName:(id)a3 treatmentData:(id)a4 namespaceCompatibilityVersion:(unsigned int)a5 paths:(id)a6 referencePath:(id)a7 isFlatbufferStorage:(BOOL)a8 factorDirectoryLock:(id)a9 error:(id *)a10
{
  BOOL v10 = a8;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  uint64_t v43 = MEMORY[0x19F3AD060]();
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"TRINamespaceFactorProvider.m", 319, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  id v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, self, @"TRINamespaceFactorProvider.m", 320, @"Invalid parameter not satisfying: %@", @"treatmentData" object file lineNumber description];

LABEL_3:
  if (v10)
  {
    char v21 = _os_feature_enabled_impl();
    int v22 = _os_feature_enabled_impl() ^ 1;
  }
  else
  {
    char v21 = 0;
    int v22 = 1;
  }
  int v41 = v22;
  id v49 = 0;
  uint64_t v23 = [(id)objc_opt_class() factorLevelsWithTreatmentData:v17 referencePath:v19 filteredByNamespaceName:v16 outTreatmentId:&v49 error:a10];
  id v24 = v23;
  if ((v21 & 1) != 0 || v23)
  {
    id v40 = v18;
    unint64_t v27 = [v23 count];
    id v28 = TRILogCategory_ClientFramework();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
    if (v27 > 0x10)
    {
      if (v29)
      {
        uint64_t v34 = [v24 count];
        *(_DWORD *)buf = 134218498;
        uint64_t v51 = v34;
        __int16 v52 = 2112;
        id v53 = v49;
        __int16 v54 = 2112;
        id v55 = v16;
        _os_log_impl(&dword_19D909000, v28, OS_LOG_TYPE_INFO, "Found %tu factors in treatment \"%@\" for namespace \"%@\"; using pruning cache",
          buf,
          0x20u);
      }

      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __162__TRINamespaceFactorProvider_initWithNamespaceName_treatmentData_namespaceCompatibilityVersion_paths_referencePath_isFlatbufferStorage_factorDirectoryLock_error___block_invoke;
      v44[3] = &unk_1E596A428;
      id v45 = v17;
      id v46 = v19;
      id v47 = v16;
      v48 = a10;
      id v35 = (void *)MEMORY[0x19F3AD290](v44);
      id v33 = [[TRIPruningFactorLevelCache alloc] initWithPruningDelaySeconds:v35 loadFactorLevels:5.0];
    }
    else
    {
      if (v29)
      {
        uint64_t v30 = [v24 count];
        *(_DWORD *)buf = 134218498;
        uint64_t v51 = v30;
        __int16 v52 = 2112;
        id v53 = v49;
        __int16 v54 = 2112;
        id v55 = v16;
        _os_log_impl(&dword_19D909000, v28, OS_LOG_TYPE_INFO, "Found %tu factors in treatment \"%@\" for namespace \"%@\"; using naive cache",
          buf,
          0x20u);
      }

      v31 = [TRINaiveFactorLevelCache alloc];
      if (v24) {
        id v32 = v24;
      }
      else {
        id v32 = (void *)MEMORY[0x1E4F1CBF0];
      }
      id v33 = [(TRINaiveFactorLevelCache *)v31 initWithFactorLevels:v32];
    }
    id v18 = v40;
    if ((!v10 | v41)) {
      id v36 = 0;
    }
    else {
      id v36 = [[TRIFBFastFactorLevels alloc] initVerifiedRootObjectFromData:v17];
    }
    char v26 = (void *)v43;
    self = [(TRINamespaceFactorProvider *)self initWithNamespaceName:v16 namespaceCompatibilityVersion:a5 paths:v40 referencePath:v19 factorLevels:v33 fastFactorLevels:v36 treatmentId:v49 factorDirectoryLock:v20];

    uint64_t v25 = self;
  }
  else
  {
    uint64_t v25 = 0;
    char v26 = (void *)v43;
  }

  return v25;
}

+ (id)factorLevelsWithTreatmentData:(id)a3 referencePath:(id)a4 filteredByNamespaceName:(id)a5 outTreatmentId:(id *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void *)MEMORY[0x19F3AD060]();
  id v37 = 0;
  int v15 = [MEMORY[0x1E4FB0548] parseFromData:v11 error:&v37];
  id v16 = v37;
  if (v15)
  {

    if (a6)
    {
      if ([v15 hasTreatmentId])
      {
        id v17 = [v15 treatmentId];
      }
      else
      {
        id v17 = 0;
      }
      id v20 = *a6;
      *a6 = v17;
    }
    if (objc_msgSend(v15, "factorLevelArray_Count"))
    {
      char v21 = (void *)[objc_alloc(MEMORY[0x1E4F93B38]) initWithBehavior:1 copyWithZone:0];
      id v22 = (id)[v21 intern:v13];
      if ([v15 hasTreatmentId])
      {
        uint64_t v23 = [v15 treatmentId];
        id v24 = (id)[v21 intern:v23];
      }
      uint64_t v25 = [v15 factorLevelArray];
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      id v32 = __119__TRINamespaceFactorProvider_factorLevelsWithTreatmentData_referencePath_filteredByNamespaceName_outTreatmentId_error___block_invoke;
      id v33 = &unk_1E596A450;
      id v34 = v13;
      id v26 = v12;
      id v35 = v26;
      id v27 = v21;
      id v36 = v27;
      id v28 = objc_msgSend(v25, "_pas_mappedArrayWithTransform:", &v30);

      if (v28)
      {
        id v19 = +[TRINamespaceFactorProvider populateMAPathsForFactorLevels:loadedFromParentDir:](TRINamespaceFactorProvider, "populateMAPathsForFactorLevels:loadedFromParentDir:", v28, v26, v30, v31, v32, v33, v34, v35);
      }
      else
      {
        id v19 = 0;
      }
    }
    else
    {
      id v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v18 = *a7;
    *a7 = v16;

    id v19 = 0;
  }

  return v19;
}

+ (id)populateMAPathsForFactorLevels:(id)a3 loadedFromParentDir:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)MEMORY[0x19F3AD060]();
  if (v7)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__TRINamespaceFactorProvider_populateMAPathsForFactorLevels_loadedFromParentDir___block_invoke;
    v13[3] = &unk_1E596A3D8;
    id v14 = v9;
    id v16 = a1;
    id v15 = v7;
    id v10 = v9;
    [v6 enumerateObjectsUsingBlock:v13];
    id v11 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v10 copyItems:1];
  }
  else
  {
    id v11 = v6;
  }

  return v11;
}

- (TRINamespaceFactorProvider)initWithNamespaceName:(id)a3 namespaceCompatibilityVersion:(unsigned int)a4 paths:(id)a5 referencePath:(id)a6 factorLevels:(id)a7 fastFactorLevels:(id)a8 treatmentId:(id)a9 factorDirectoryLock:(id)a10
{
  id v16 = a3;
  id v32 = a5;
  id v31 = a6;
  unint64_t v17 = (unint64_t)a7;
  id obj = a8;
  unint64_t v18 = (unint64_t)a8;
  id v30 = a9;
  id v29 = a10;
  if (!v16)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRINamespaceFactorProvider.m", 384, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  if (!(v17 | v18))
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRINamespaceFactorProvider.m", 387, @"Invalid parameter not satisfying: %@", @"factorLevels" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)TRINamespaceFactorProvider;
  id v19 = [(TRINamespaceFactorProvider *)&v33 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_namespaceName, a3);
    v20->_namespaceCompatibilityVersion = a4;
    objc_storeStrong((id *)&v20->_factorLevels, a7);
    objc_storeStrong((id *)&v20->_treatmentId, a9);
    objc_storeStrong((id *)&v20->_factorDirectoryLock, a10);
    objc_storeStrong((id *)&v20->_paths, a5);
    if (v18)
    {
      v20->_isFBReadEnabled = _os_feature_enabled_impl();
      v20->_isFBWriteEnabled = _os_feature_enabled_impl();
      objc_storeStrong((id *)&v20->_referencePath, a6);
      objc_storeStrong((id *)&v20->_fastFactorLevels, obj);
    }
    char v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    warmupPersistentFactorLevelCache = v20->_warmupPersistentFactorLevelCache;
    v20->_warmupPersistentFactorLevelCache = v21;
  }
  return v20;
}

id __162__TRINamespaceFactorProvider_initWithNamespaceName_treatmentData_namespaceCompatibilityVersion_paths_referencePath_isFlatbufferStorage_factorDirectoryLock_error___block_invoke(void *a1)
{
  return +[TRINamespaceFactorProvider factorLevelsWithTreatmentData:a1[4] referencePath:a1[5] filteredByNamespaceName:a1[6] outTreatmentId:0 error:a1[7]];
}

void __81__TRINamespaceFactorProvider_populateMAPathsForFactorLevels_loadedFromParentDir___block_invoke(uint64_t a1, void *a2)
{
  id v49 = a2;
  id v3 = [v49 level];
  int v4 = [v3 levelOneOfCase];

  if (v4 != 104)
  {
    [*(id *)(a1 + 32) addObject:v49];
    goto LABEL_15;
  }
  uint64_t v5 = [v49 copy];
  id v6 = objc_opt_new();
  id v7 = [v49 level];
  BOOL v8 = [v7 mobileAssetReferenceValue];
  int v9 = [v8 hasIsOnDemand];

  if (v9)
  {
    id v10 = [v49 level];
    id v11 = [v10 mobileAssetReferenceValue];
    objc_msgSend(v6, "setIsOnDemand:", objc_msgSend(v11, "isOnDemand"));
  }
  id v45 = (void *)v5;
  uint64_t v48 = a1;
  id v12 = [v49 level];
  id v13 = [v12 mobileAssetReferenceValue];
  int v14 = [v13 hasSize];

  if (v14)
  {
    id v15 = [v49 level];
    id v16 = [v15 mobileAssetReferenceValue];
    uint64_t v17 = [v16 size];
    unint64_t v18 = [v6 asset];
    [v18 setSize:v17];
  }
  id v19 = [NSString alloc];
  id v47 = [v49 level];
  id v46 = [v47 mobileAssetReferenceValue];
  id v20 = [v46 assetType];
  char v21 = [v49 level];
  [v21 mobileAssetReferenceValue];
  uint64_t v23 = v22 = v6;
  id v24 = [v23 assetSpecifier];
  uint64_t v25 = [v49 level];
  id v26 = [v25 mobileAssetReferenceValue];
  id v27 = [v26 assetVersion];
  id v28 = (void *)[v19 initWithFormat:@"%@-%@-%@", v20, v24, v27];
  id v29 = [v22 asset];
  [v29 setAssetId:v28];

  id v30 = v22;
  uint64_t v32 = *(void *)(v48 + 40);
  id v31 = *(void **)(v48 + 48);
  objc_super v33 = [v49 factor];
  id v34 = [v33 name];
  id v35 = [v31 _maAutoAssetReferencedInDir:v32 byFactorName:v34];

  if (v35) {
    [v30 setPath:v35];
  }
  id v36 = [v49 level];
  id v37 = [v36 mobileAssetReferenceValue];
  if (([v37 hasIsFileFactor] & 1) == 0)
  {

    int v41 = v45;
    goto LABEL_13;
  }
  __int16 v38 = [v49 level];
  id v39 = [v38 mobileAssetReferenceValue];
  int v40 = [v39 isFileFactor];

  int v41 = v45;
  if (!v40)
  {
LABEL_13:
    v44 = [v41 factor];
    [v44 setType:101];

    uint64_t v43 = [v41 level];
    [v43 setDirectoryValue:v30];
    goto LABEL_14;
  }
  v42 = [v45 factor];
  [v42 setType:100];

  uint64_t v43 = [v45 level];
  [v43 setFileValue:v30];
LABEL_14:

  [*(id *)(v48 + 32) addObject:v41];
LABEL_15:
}

uint64_t __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)factorLevels
{
  if ([(NSMutableDictionary *)self->_warmupPersistentFactorLevelCache count]) {
    [(NSMutableDictionary *)self->_warmupPersistentFactorLevelCache allValues];
  }
  else {
  id v3 = [(TRINamespaceFactorProvider *)self _readAllFactorLevelsFromStorage];
  }
  return v3;
}

- (id)_readAllFactorLevelsFromStorage
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  int v4 = objc_opt_new();
  factorLevels = self->_factorLevels;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke;
  v57[3] = &unk_1E596A400;
  id v6 = v4;
  id v58 = v6;
  [(TRIFactorLevelCaching *)factorLevels enumerateFactorLevelsUsingBlock:v57];
  if (self->_isFBWriteEnabled)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    BOOL v8 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels levels];
    int v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    id v10 = [(TRIFBFastFactorLevels *)self->_fastFactorLevels levels];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_2;
    v55[3] = &unk_1E596A478;
    v55[4] = self;
    id v11 = v9;
    id v56 = v11;
    [v10 enumerateObjectsUsingBlock:v55];

    if (!self->_isFBReadEnabled)
    {
      __int16 v52 = v3;
      context = (void *)MEMORY[0x19F3AD060]();
      id v51 = v6;
      id v12 = [v6 sortedArrayUsingComparator:&__block_literal_global_3];
      id v50 = v11;
      id v13 = [v11 sortedArrayUsingComparator:&__block_literal_global_3];
      uint64_t v14 = [v12 count];
      id v53 = v13;
      if (v14 == [v13 count])
      {
        if ([v12 count])
        {
          uint64_t v16 = 0;
          int v54 = 0;
          *(void *)&long long v15 = 138412290;
          long long v48 = v15;
          while (1)
          {
            uint64_t v17 = objc_msgSend(v12, "objectAtIndexedSubscript:", v16, v48);
            unint64_t v18 = [v53 objectAtIndexedSubscript:v16];
            id v19 = [v17 factor];
            id v20 = objc_msgSend(v19, "id_p");
            char v21 = [v18 factor];
            id v22 = objc_msgSend(v21, "id_p");
            char v23 = [v20 isEqualToString:v22];

            if (v23) {
              break;
            }
            if (v54 <= 2)
            {
              id v34 = TRILogCategory_ClientFramework();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                id v35 = [v17 factor];
                objc_msgSend(v35, "id_p");
                id v36 = (NSString *)objc_claimAutoreleasedReturnValue();
                id v37 = [v18 factor];
                __int16 v38 = objc_msgSend(v37, "id_p");
                *(_DWORD *)buf = 138412546;
                v60 = v36;
                __int16 v61 = 2112;
                uint64_t v62 = (uint64_t)v38;
                _os_log_error_impl(&dword_19D909000, v34, OS_LOG_TYPE_ERROR, "primary id does not match for factors in arrays, pb:%@, fb:%@", buf, 0x16u);
              }
LABEL_18:

              ++v54;
            }
LABEL_19:

            if ([v12 count] <= (unint64_t)++v16) {
              goto LABEL_25;
            }
          }
          if ([v17 isEqual:v18]) {
            goto LABEL_19;
          }
          id v24 = [v18 factor];
          uint64_t v25 = [v24 metadataKeysArray];
          id v26 = [v17 factor];
          id v27 = [v26 metadataKeysArray];

          if (v25 == v27) {
            goto LABEL_19;
          }
          id v28 = [v18 level];
          id v29 = [v28 metadata];
          id v30 = [v17 level];
          id v31 = [v30 metadata];
          char v32 = [v29 isEqualToDictionary:v31];

          if ((v32 & 1) != 0 || v54 > 2) {
            goto LABEL_19;
          }
          objc_super v33 = TRILogCategory_ClientFramework();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v48;
            v60 = (NSString *)v18;
            _os_log_error_impl(&dword_19D909000, v33, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage:%@ does not match factor level from pb", buf, 0xCu);
          }

          id v34 = TRILogCategory_ClientFramework();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v48;
            v60 = (NSString *)v17;
            _os_log_error_impl(&dword_19D909000, v34, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage does not match factor level from pb: %@", buf, 0xCu);
          }
          goto LABEL_18;
        }
      }
      else
      {
        id v39 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          namespaceName = self->_namespaceName;
          uint64_t v46 = [v12 count];
          uint64_t v47 = [v53 count];
          *(_DWORD *)buf = 138412802;
          v60 = namespaceName;
          __int16 v61 = 2048;
          uint64_t v62 = v46;
          __int16 v63 = 2048;
          uint64_t v64 = v47;
          _os_log_error_impl(&dword_19D909000, v39, OS_LOG_TYPE_ERROR, "Factor levels from flatbuffers do not match factor levels for protobuf for namespace: %@, with counts forPb:%lu forFb:%lu", buf, 0x20u);
        }
      }
LABEL_25:

      id v6 = v51;
      id v3 = v52;
      id v11 = v50;
    }
  }
  else
  {
    id v11 = 0;
  }
  if (self->_isFBReadEnabled)
  {
    id v40 = v11;

    id v6 = v40;
  }
  id v41 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v6) {
    id v42 = v6;
  }
  else {
    id v42 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v43 = (void *)[v41 initWithArray:v42 copyItems:1];

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencePath, 0);
  objc_storeStrong((id *)&self->_fastFactorLevels, 0);
  objc_storeStrong((id *)&self->_warmupPersistentFactorLevelCache, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_factorDirectoryLock, 0);
  objc_storeStrong((id *)&self->_factorLevels, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

+ (id)_maAutoAssetReferencedInDir:(id)a3 byFactorName:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F3AD060]();
  BOOL v8 = [v6 triFilenameForFactorName];
  int v9 = (void *)[[NSString alloc] initWithFormat:@"%@/maRefs/%@", v5, v8];
  id v21 = 0;
  id v10 = [NSString stringWithContentsOfFile:v9 encoding:4 error:&v21];
  id v11 = v21;
  id v12 = [v10 triTrim];

  if (!v12)
  {
    if (v11)
    {
      uint64_t v17 = [v11 domain];
      if ([v17 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v18 = [v11 code];

        if (v18 == 260) {
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    id v19 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_error_impl(&dword_19D909000, v19, OS_LOG_TYPE_ERROR, "Unable to read MA path from reference path: %{public}@: %@", buf, 0x16u);
    }
LABEL_17:

LABEL_18:
    id v16 = 0;
    goto LABEL_19;
  }
  if (![v12 length])
  {
    id v19 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_impl(&dword_19D909000, v19, OS_LOG_TYPE_DEFAULT, "Path for factor %{public}@ is empty. This usually means that the level is about to be deleted.", buf, 0xCu);
    }
    goto LABEL_17;
  }
  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = [v13 fileExistsAtPath:v12];

  if ((v14 & 1) == 0)
  {
    long long v15 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v12;
      _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "Trial asset path does not exist on disk: %{public}@.", buf, 0xCu);
    }
  }
  id v16 = v12;
LABEL_19:

  return v16;
}

- (id)overlayLevelsFromFactorProvider:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x19F3AD060]();
  namespaceName = self->_namespaceName;
  BOOL v8 = [v5 namespaceName];
  LOBYTE(namespaceName) = [(NSString *)namespaceName isEqualToString:v8];

  if (namespaceName)
  {
    SEL v37 = a2;
    __int16 v38 = v6;
    int v9 = objc_opt_new();
    factorLevels = self->_factorLevels;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __62__TRINamespaceFactorProvider_overlayLevelsFromFactorProvider___block_invoke;
    v45[3] = &unk_1E596A400;
    id v11 = v9;
    uint64_t v46 = v11;
    [(TRIFactorLevelCaching *)factorLevels enumerateFactorLevelsUsingBlock:v45];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v39 = v5;
    id v12 = [v5 factorLevels];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v18 = [v17 factor];
          char v19 = [v18 isInNamespaceName:self->_namespaceName];

          if ((v19 & 1) == 0)
          {
            id v22 = [MEMORY[0x1E4F28B00] currentHandler];
            id v36 = self->_namespaceName;
            id v23 = [v17 factor];
            __int16 v24 = [v23 namespaceString];
            [v22 handleFailureInMethod:v37, self, @"TRINamespaceFactorProvider.m", 283, @"namespace mismatch (exp %@, act %@)", v36, v24 object file lineNumber description];
          }
          id v20 = [v17 factor];
          id v21 = [v20 name];
          [v11 setObject:v17 forKeyedSubscript:v21];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v14);
    }

    id v25 = objc_opt_new();
    id v5 = v39;
    uint64_t v26 = [v39 treatmentId];
    [v25 setTreatmentId:v26];

    id v27 = [v11 allValues];
    id v28 = (void *)[v27 mutableCopy];
    [v25 setFactorLevelArray:v28];

    id v29 = [v25 data];
    if (!v29)
    {
      id v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:v37, self, @"TRINamespaceFactorProvider.m", 291, @"Invalid parameter not satisfying: %@", @"treatmentData" object file lineNumber description];
    }
    id v40 = 0;
    id v30 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNamespaceName:self->_namespaceName treatmentData:v29 namespaceCompatibilityVersion:self->_namespaceCompatibilityVersion paths:self->_paths referencePath:0 isFlatbufferStorage:0 factorDirectoryLock:0 error:&v40];
    if (!v30)
    {
      id v31 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v40;
        _os_log_error_impl(&dword_19D909000, v31, OS_LOG_TYPE_ERROR, "Failed to parse ClientTreatment from in-memory representation: %@", buf, 0xCu);
      }
    }
    id v6 = v38;
  }
  else
  {
    id v11 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_super v33 = self->_namespaceName;
      id v34 = [v5 namespaceName];
      *(_DWORD *)buf = 138412546;
      id v49 = v33;
      __int16 v50 = 2112;
      id v51 = v34;
      _os_log_error_impl(&dword_19D909000, v11, OS_LOG_TYPE_ERROR, "cannot set factor levels for namespace %@, provider is for different namespace %@", buf, 0x16u);
    }
    id v30 = 0;
  }

  return v30;
}

void __62__TRINamespaceFactorProvider_overlayLevelsFromFactorProvider___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 factor];
  int v4 = [v5 name];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (id)experimentId
{
  if (self->_treatmentId && self->_namespaceName)
  {
    v2 = +[TRITreatmentInfo loadInfoForTreatment:namespaceName:paths:](TRITreatmentInfo, "loadInfoForTreatment:namespaceName:paths:");
    id v3 = v2;
    if (v2)
    {
      int v4 = [v2 experimentId];
    }
    else
    {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (int)deploymentId
{
  if (!self->_treatmentId || !self->_namespaceName) {
    return -1;
  }
  v2 = +[TRITreatmentInfo loadInfoForTreatment:namespaceName:paths:](TRITreatmentInfo, "loadInfoForTreatment:namespaceName:paths:");
  id v3 = v2;
  if (v2) {
    int v4 = [v2 deploymentId];
  }
  else {
    int v4 = -1;
  }

  return v4;
}

- (id)treatmentId
{
  return self->_treatmentId;
}

- (id)rolloutId
{
  return 0;
}

+ (id)_assetFilenameForFactor:(id)a3
{
  id v5 = a3;
  if (([v5 hasNamespaceName] & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"TRINamespaceFactorProvider.m", 588, @"Invalid parameter not satisfying: %@", @"factor.hasNamespaceName" object file lineNumber description];
  }
  if (([v5 hasName] & 1) == 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"TRINamespaceFactorProvider.m", 589, @"Invalid parameter not satisfying: %@", @"factor.hasName" object file lineNumber description];
  }
  id v6 = [v5 namespaceName];
  uint64_t v7 = [v6 hash];
  BOOL v8 = [v5 name];
  uint64_t v9 = [v8 hash];

  id v22 = 0;
  id v10 = [v5 namespaceName];
  id v11 = [v10 triSanitizedPathComponentWithMaxLength:30 addHash:0 error:&v22];

  if (!v11)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    char v19 = [v5 namespaceName];
    [v18 handleFailureInMethod:a2, a1, @"TRINamespaceFactorProvider.m", 593, @"Could not get sanitized name for namespace %@: %@", v19, v22 object file lineNumber description];
  }
  id v12 = [v5 name];
  uint64_t v13 = [v12 triSanitizedPathComponentWithMaxLength:50 addHash:0 error:&v22];

  if (!v13)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    id v21 = [v5 name];
    [v20 handleFailureInMethod:a2, a1, @"TRINamespaceFactorProvider.m", 595, @"Could not get sanitized name for factor %@: %@", v21, v22 object file lineNumber description];
  }
  uint64_t v14 = [NSString stringWithFormat:@"ns-%@.%lu.%@", v11, v9 + 37 * v7, v13];

  return v14;
}

+ (id)pathForFactor:(id)a3 directory:(id)a4
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a1 _assetFilenameForFactor:a3];
  BOOL v8 = NSString;
  v12[0] = v6;
  v12[1] = @"assets";
  v12[2] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  id v10 = [v8 pathWithComponents:v9];

  return v10;
}

- (BOOL)overwriteItemAtPath:(id)a3 withItemAtPath:(id)a4 error:(id *)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F28CB8];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 defaultManager];
  id v11 = [v8 stringByStandardizingPath];

  id v12 = [v9 stringByStandardizingPath];

  if ([v11 isEqualToString:v12])
  {
    char v13 = 1;
  }
  else
  {
    uint64_t v14 = [v10 triCreateDirectoryForPath:v12 isDirectory:0 error:a5];

    if (v14 && [v10 triRemoveItemAtPath:v12 error:a5]) {
      char v13 = [v10 triSafeCopyItemAtPath:v11 toPath:v12 error:a5];
    }
    else {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)_copyAssetsToDirectory:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v7 = objc_opt_new();
  id v36 = self;
  factorLevels = self->_factorLevels;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __53__TRINamespaceFactorProvider__copyAssetsToDirectory___block_invoke;
  v42[3] = &unk_1E596A400;
  id v9 = v7;
  id v43 = v9;
  [(TRIFactorLevelCaching *)factorLevels enumerateFactorLevelsUsingBlock:v42];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
  id v12 = v10;
  if (v11)
  {
    uint64_t v13 = v11;
    SEL v33 = a2;
    id v34 = v6;
    uint64_t v14 = *(void *)v39;
    uint64_t v15 = v36;
    uint64_t v35 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v18 = [v17 level];
        char v19 = [v18 fileOrDirectoryLevelWithIsDir:0];

        if (v19 && ([v19 isOnDemand] & 1) == 0)
        {
          id v20 = [v19 path];
          id v21 = objc_opt_class();
          id v22 = [v17 factor];
          id v23 = [v21 pathForFactor:v22 directory:v5];

          if (!v23)
          {
            id v30 = [MEMORY[0x1E4F28B00] currentHandler];
            [v30 handleFailureInMethod:v33 object:v15 file:@"TRINamespaceFactorProvider.m" lineNumber:637 description:@"failed to get asset path"];
          }
          id v37 = 0;
          BOOL v24 = [(TRINamespaceFactorProvider *)v15 overwriteItemAtPath:v23 withItemAtPath:v20 error:&v37];
          id v25 = v37;
          if (!v24)
          {
            id v31 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v45 = v20;
              __int16 v46 = 2112;
              uint64_t v47 = v23;
              __int16 v48 = 2112;
              id v49 = v25;
              _os_log_error_impl(&dword_19D909000, v31, OS_LOG_TYPE_ERROR, "failed to copy asset from %@ to %@ -- %@", buf, 0x20u);
            }

            id v12 = 0;
            goto LABEL_18;
          }
          uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v26 triPath:v23 relativeToParentPath:v5];
          id v27 = v10;
          v29 = id v28 = v5;

          [v19 setPath:v29];
          id v5 = v28;
          id v10 = v27;
          uint64_t v15 = v36;

          uint64_t v14 = v35;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    id v12 = v10;
LABEL_18:
    id v6 = v34;
  }

  return v12;
}

void __53__TRINamespaceFactorProvider__copyAssetsToDirectory___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 copy];
  [v2 addObject:v3];
}

- (BOOL)saveToPath:(id)a3 copyAssets:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void *)MEMORY[0x19F3AD060]();
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v25 = 0;
  id v10 = [v9 triCreateDirectoryForPath:v7 isDirectory:0 error:&v25];
  id v11 = v25;
  if (!v10)
  {
    id v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "failed to create directory for treatement at path %@ -- %@", buf, 0x16u);
    }
    char v13 = 0;
    goto LABEL_16;
  }
  if (!v4)
  {
    uint64_t v14 = objc_opt_new();
    factorLevels = self->_factorLevels;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __52__TRINamespaceFactorProvider_saveToPath_copyAssets___block_invoke;
    v23[3] = &unk_1E596A400;
    id v12 = v14;
    BOOL v24 = v12;
    [(TRIFactorLevelCaching *)factorLevels enumerateFactorLevelsUsingBlock:v23];

    goto LABEL_9;
  }
  id v12 = [(TRINamespaceFactorProvider *)self _copyAssetsToDirectory:v10];
  if (v12)
  {
LABEL_9:
    id v16 = objc_opt_new();
    [v16 setTreatmentId:self->_treatmentId];
    id v17 = [v12 mutableCopy];
    [v16 setFactorLevelArray:v17];

    uint64_t v18 = [v16 data];
    if (!v18)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"TRINamespaceFactorProvider.m", 683, @"Invalid parameter not satisfying: %@", @"treatmentData" object file lineNumber description];
    }
    id v22 = 0;
    char v13 = [v18 writeToFile:v7 options:1 error:&v22];
    id v11 = v22;
    if ((v13 & 1) == 0)
    {
      char v19 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = v7;
        __int16 v28 = 2112;
        id v29 = v11;
        _os_log_error_impl(&dword_19D909000, v19, OS_LOG_TYPE_ERROR, "failed to save factors to file %@: %@", buf, 0x16u);
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  char v13 = 0;
LABEL_17:

  return v13;
}

uint64_t __52__TRINamespaceFactorProvider_saveToPath_copyAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 80);
  id v6 = [*(id *)(v4 + 72) namespaceName];
  id v7 = +[TRIFlatbufferUtils convertFBFactorLevelToProtoFactorLevel:v8 parentDir:v5 namespaceName:v6 isRelativePath:1];

  [*(id *)(a1 + 40) addObject:v7];
}

uint64_t __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 factor];
  id v6 = objc_msgSend(v5, "id_p");
  id v7 = [v4 factor];

  id v8 = objc_msgSend(v7, "id_p");
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)cacheFactorLevels
{
  id v3 = [(TRINamespaceFactorProvider *)self _readAllFactorLevelsFromStorage];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__TRINamespaceFactorProvider_cacheFactorLevels__block_invoke;
  v4[3] = &unk_1E596A4C0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __47__TRINamespaceFactorProvider_cacheFactorLevels__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v3 = a2;
  id v5 = [v3 factor];
  id v4 = [v5 name];
  [v2 setObject:v3 forKey:v4];
}

- (unsigned)namespaceId
{
  v2 = (void *)MEMORY[0x1E4FB05B8];
  id v3 = [(TRINamespaceFactorProvider *)self namespaceName];
  LODWORD(v2) = [v2 namespaceIdFromName:v3];

  return v2;
}

- (void)dispose
{
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

@end