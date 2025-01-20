@interface TRIFactorPackSetStorage
- (BOOL)_forceRemoveItemAtPath:(id)a3;
- (BOOL)_nonAtomicOverwriteWithSrc:(id)a3 dest:(id)a4;
- (BOOL)hasFactorPackSetWithId:(id)a3 path:(id *)a4;
- (BOOL)migrateEligibleFactorPacksToGlobalWithServerContext:(id)a3;
- (BOOL)removeUnreferencedFactorPackSetsWithServerContext:(id)a3 removedCount:(unsigned int *)a4;
- (BOOL)saveFactorPackSet:(id)a3;
- (TRIFactorPackSetStorage)initWithPaths:(id)a3;
- (id)_collectFactorPackSets;
- (id)parentDirForFactorPackSets;
- (id)pathForFactorPackSetWithId:(id)a3;
- (void)enumerateCompatibleFactorPacksForFactorPackSet:(id)a3 usingLegacyPaths:(BOOL)a4 withBlock:(id)a5;
- (void)enumerateFBFactorPacksForFactorPackSet:(id)a3 usingLegacyPaths:(BOOL)a4 withBlock:(id)a5;
- (void)enumerateFactorPacksForFactorPackSet:(id)a3 usingLegacyPaths:(BOOL)a4 withBlock:(id)a5;
- (void)enumerateOnlyProtobufFactorPacksForFactorPackSet:(id)a3 withBlock:(id)a4;
@end

@implementation TRIFactorPackSetStorage

- (TRIFactorPackSetStorage)initWithPaths:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFactorPackSetStorage;
  v6 = [(TRIFactorPackSetStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_paths, a3);
  }

  return v7;
}

- (BOOL)saveFactorPackSet:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  v3 = [v57 ident];
  v60 = [(TRIFactorPackSetStorage *)self pathForFactorPackSetWithId:v3];

  char v55 = _os_feature_enabled_impl();
  v4 = [TRITempDirScopeGuard alloc];
  id v5 = [(TRIPaths *)self->_paths localTempDir];
  v6 = [(TRITempDirScopeGuard *)v4 initWithPath:v5];

  v56 = v6;
  if (!v6) {
    goto LABEL_58;
  }
  v7 = [v6 path];
  id v8 = [NSString alloc];
  objc_super v9 = objc_opt_new();
  v10 = [v9 UUIDString];
  v11 = (void *)[v8 initWithFormat:@"fp-set-%@", v10];
  v58 = [v7 stringByAppendingPathComponent:v11];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v12 = [v60 stringByDeletingLastPathComponent];
  v84[0] = v12;
  v13 = [v58 stringByAppendingPathComponent:@"factorPacks"];
  v84[1] = v13;
  v14 = [v58 stringByAppendingPathComponent:@"legacyNamespaceFactorPacks"];
  v84[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];

  uint64_t v16 = [(TRIFactorPackStorage *)v15 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v75 != v17) {
          objc_enumerationMutation(v15);
        }
        if (![MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:*(void *)(*((void *)&v74 + 1) + 8 * i)])
        {
          LOBYTE(v6) = 0;
          goto LABEL_57;
        }
      }
      uint64_t v16 = [(TRIFactorPackStorage *)v15 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v16);
  }

  v15 = [[TRIFactorPackStorage alloc] initWithPaths:self->_paths];
  v53 = [[TRIFBFactorPackStorage alloc] initWithPaths:self->_paths];
  id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v20 = [v57 packs];
  v21 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __45__TRIFactorPackSetStorage_saveFactorPackSet___block_invoke;
  v70[3] = &unk_1E6BBBF38;
  id v51 = v21;
  id v71 = v51;
  id v52 = v58;
  id v72 = v52;
  id v50 = v60;
  id v73 = v50;
  v54 = (uint64_t (**)(void, void, void, void))MEMORY[0x1E016EA80](v70);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v22 = [v57 packs];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v66 objects:v83 count:16];
  if (!v23) {
    goto LABEL_41;
  }
  uint64_t v24 = *(void *)v67;
  obuint64_t j = v22;
  do
  {
    uint64_t v25 = 0;
    do
    {
      if (*(void *)v67 != v24) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v66 + 1) + 8 * v25);
      v27 = (void *)MEMORY[0x1E016E7F0]();
      if (([v26 hasFactorPackId] & 1) == 0)
      {
        v29 = TRILogCategory_Server();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v38 = [v57 ident];
          *(_DWORD *)buf = 138543362;
          v80 = v38;
          _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Factor pack set %{public}@ contains factor pack with missing id.", buf, 0xCu);
        }
LABEL_22:
        int v34 = 1;
        goto LABEL_32;
      }
      v28 = [v26 factorPackId];
      v29 = TRIValidateFactorPackId();

      if (!v29) {
        goto LABEL_22;
      }
      v30 = [v26 selectedNamespace];
      char v31 = [v30 hasName];

      if (v31)
      {
        v32 = [v26 selectedNamespace];
        v33 = [v32 name];

        if (v55) {
          [(TRIFBFactorPackStorage *)v53 pathForFactorLevelsWithFactorPackId:v29 namespaceName:v33];
        }
        else {
        v35 = [(TRIFactorPackStorage *)v15 pathForFactorPackWithId:v29 namespaceName:v33];
        }
        if (v35)
        {
          v36 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", @"factorPacks", v33];
          int v37 = ((uint64_t (**)(void, NSObject *, void *, void *))v54)[2](v54, v33, v36, v35);

          if (v37)
          {
            if (v55) {
              [(TRIFBFactorPackStorage *)v53 legacyPathForFactorLevelsWithFactorPackId:v29 namespaceName:v33];
            }
            else {
            v39 = [(TRIFactorPackStorage *)v15 legacyPathForFactorPackWithId:v29 namespaceName:v33];
            }
            if (v39)
            {
              v40 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", @"legacyNamespaceFactorPacks", v33];
              int v41 = ((uint64_t (**)(void, NSObject *, void *, void *))v54)[2](v54, v33, v40, v39);

              int v34 = v41 ^ 1;
            }
            else
            {
              int v34 = 1;
            }

            goto LABEL_31;
          }
        }
      }
      else
      {
        v33 = TRILogCategory_Server();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v80 = v29;
          _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ contains no namespace name.", buf, 0xCu);
        }
      }
      int v34 = 1;
LABEL_31:

LABEL_32:
      if (v34)
      {

        goto LABEL_48;
      }
      ++v25;
    }
    while (v23 != v25);
    v22 = obj;
    uint64_t v42 = [obj countByEnumeratingWithState:&v66 objects:v83 count:16];
    uint64_t v23 = v42;
  }
  while (v42);
LABEL_41:

  if (+[TRIReferenceManagedDir createFromDir:v52]
    && [(TRIFactorPackSetStorage *)self _nonAtomicOverwriteWithSrc:v52 dest:v50])
  {
    v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [v57 ident];
      *(_DWORD *)buf = 138543618;
      v80 = v43;
      __int16 v81 = 2114;
      id v82 = v50;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Wrote factor pack set %{public}@ --> %{public}@", buf, 0x16u);
    }
    LOBYTE(v6) = 1;
  }
  else
  {
LABEL_48:
    LOBYTE(v6) = 0;
  }
  v44 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v44 triForceRemoveItemAtPath:v52 error:0];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v45 = v51;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v62 objects:v78 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v63 != v47) {
          objc_enumerationMutation(v45);
        }
        [*(id *)(*((void *)&v62 + 1) + 8 * j) unlock];
      }
      uint64_t v46 = [v45 countByEnumeratingWithState:&v62 objects:v78 count:16];
    }
    while (v46);
  }

LABEL_57:
LABEL_58:

  return (char)v6;
}

BOOL __45__TRIFactorPackSetStorage_saveFactorPackSet___block_invoke(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB0218]) initWithDir:v7];
  if (v8)
  {
    [a1[4] addObject:v8];
    objc_super v9 = [a1[5] stringByAppendingPathComponent:v6];
    v10 = [a1[6] stringByAppendingPathComponent:v6];
    v11 = [v9 stringByDeletingLastPathComponent];
    [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v11];

    BOOL v12 = +[TRIReferenceManagedDir symlinkFromCurrentPath:v9 withFuturePath:v10 toManagedPath:v7];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_nonAtomicOverwriteWithSrc:(id)a3 dest:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_super v9 = (const std::__fs::filesystem::path *)[v8 fileSystemRepresentation];
  id v10 = v7;
  v11 = (const std::__fs::filesystem::path *)[v10 fileSystemRepresentation];
  rename(v9, v11, v12);
  if (v13)
  {
    v14 = [TRITempDirScopeGuard alloc];
    v15 = [(TRIPaths *)self->_paths localTempDir];
    uint64_t v16 = [(TRITempDirScopeGuard *)v14 initWithPath:v15];

    if (!v16)
    {
      BOOL v32 = 0;
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v17 = [(TRITempDirScopeGuard *)v16 path];
    v18 = objc_opt_new();
    id v19 = [v18 UUIDString];
    v20 = [v17 stringByAppendingPathComponent:v19];

    id v21 = v10;
    v22 = (const std::__fs::filesystem::path *)[v21 fileSystemRepresentation];
    id v23 = v20;
    uint64_t v24 = (const std::__fs::filesystem::path *)[v23 fileSystemRepresentation];
    rename(v22, v24, v25);
    if (v26)
    {
      v27 = TRILogCategory_Server();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = __error();
        v29 = strerror(*v28);
        int v30 = *__error();
        int v47 = 138544130;
        id v48 = v21;
        __int16 v49 = 2114;
        id v50 = v23;
        __int16 v51 = 2080;
        id v52 = v29;
        __int16 v53 = 1024;
        int v54 = v30;
        char v31 = "Failed rename() to relocate before overwrite %{public}@ -> %{public}@: %s (%d)";
LABEL_16:
        _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&v47, 0x26u);
      }
    }
    else
    {
      id v33 = v8;
      int v34 = (const std::__fs::filesystem::path *)[v33 fileSystemRepresentation];
      id v35 = v21;
      v36 = (const std::__fs::filesystem::path *)[v35 fileSystemRepresentation];
      rename(v34, v36, v37);
      if (!v38)
      {
        [(TRIFactorPackSetStorage *)self _forceRemoveItemAtPath:v23];
        BOOL v32 = 1;
        goto LABEL_11;
      }
      v39 = (const std::__fs::filesystem::path *)[v23 fileSystemRepresentation];
      id v40 = v35;
      int v41 = (const std::__fs::filesystem::path *)[v40 fileSystemRepresentation];
      rename(v39, v41, v42);
      v27 = TRILogCategory_Server();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v44 = __error();
        id v45 = strerror(*v44);
        int v46 = *__error();
        int v47 = 138544130;
        id v48 = v33;
        __int16 v49 = 2114;
        id v50 = v40;
        __int16 v51 = 2080;
        id v52 = v45;
        __int16 v53 = 1024;
        int v54 = v46;
        char v31 = "Failed to rename() even after relocating destination: %{public}@ --> %{public}@: %s (%d)";
        goto LABEL_16;
      }
    }

    BOOL v32 = 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v32 = 1;
LABEL_13:

  return v32;
}

- (BOOL)_forceRemoveItemAtPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v10 = 0;
  char v6 = [v5 triForceRemoveItemAtPath:v4 error:&v10];

  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to force-remove: %{public}@", buf, 0xCu);
    }
  }
  return v6;
}

- (id)parentDirForFactorPackSets
{
  v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  id v4 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  id v5 = [v4 stringByAppendingPathComponent:@"v2/factorPackSets"];

  return v5;
}

- (id)pathForFactorPackSetWithId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E016E7F0]();
  char v6 = [(TRIFactorPackSetStorage *)self parentDirForFactorPackSets];
  id v7 = [v6 stringByAppendingPathComponent:v4];

  return v7;
}

- (BOOL)hasFactorPackSetWithId:(id)a3 path:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIFactorPackSetStorage.m", 291, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];
  }
  id v8 = [(TRIFactorPackSetStorage *)self pathForFactorPackSetWithId:v7];
  if (a4) {
    objc_storeStrong(a4, v8);
  }
  objc_super v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8];

  return v10;
}

- (id)_collectFactorPackSets
{
  id v4 = objc_opt_new();
  if (v4)
  {
    id v5 = [(TRIFactorPackSetStorage *)self parentDirForFactorPackSets];
    char v6 = (void *)MEMORY[0x1E016E7F0]();
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
    objc_super v9 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:0 options:1 errorHandler:0];

    char v10 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v11 = [v9 nextObject];
    if (v11)
    {
      id v12 = (void *)v11;
      while (1)
      {
        uint64_t v13 = [v12 path];
        if (!v13)
        {
          v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, self, @"TRIFactorPackSetStorage.m", 318, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
        }
        int v14 = [v4 addString:v13];

        if (!v14) {
          break;
        }
        char v10 = (void *)MEMORY[0x1E016E7F0]();
        id v12 = [v9 nextObject];
        if (!v12) {
          goto LABEL_8;
        }
      }

      id v16 = 0;
    }
    else
    {
LABEL_8:

      id v16 = v4;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)removeUnreferencedFactorPackSetsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIFactorPackSetStorage.m", 330, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];
  }
  id v8 = [(TRIFactorPackSetStorage *)self _collectFactorPackSets];
  if (v8)
  {
    objc_super v9 = [[TRIFactorPackSetExternalReferenceStore alloc] initWithServerContext:v7];
    char v10 = [TRITempDirScopeGuard alloc];
    uint64_t v11 = [(TRIPaths *)self->_paths localTempDir];
    id v12 = [(TRITempDirScopeGuard *)v10 initWithPath:v11];

    if (v12)
    {
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      int v29 = 0;
      uint64_t v22 = 0;
      id v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 1;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __90__TRIFactorPackSetStorage_removeUnreferencedFactorPackSetsWithServerContext_removedCount___block_invoke;
      v17[3] = &unk_1E6BB8698;
      v20 = &v22;
      v18 = v9;
      id v19 = v12;
      id v21 = &v26;
      int v13 = [v8 enumerateStringsWithBlock:v17];
      if (a4) {
        *a4 = *((_DWORD *)v27 + 6);
      }
      if (v13) {
        BOOL v14 = *((unsigned char *)v23 + 24) != 0;
      }
      else {
        BOOL v14 = 0;
      }

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __90__TRIFactorPackSetStorage_removeUnreferencedFactorPackSetsWithServerContext_removedCount___block_invoke(void *a1, void *a2)
{
  char v10 = 0;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  char v6 = [v4 path];
  BOOL v7 = +[TRIReferenceManagedDir collectGarbageForManagedDir:v5 withExternalReferenceStore:v3 usingTempDir:v6 managedDirWasDeleted:&v10];

  uint64_t v8 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v8 + 24)) {
    BOOL v9 = v7;
  }
  else {
    BOOL v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;

  if (v10) {
    ++*(_DWORD *)(*(void *)(a1[7] + 8) + 24);
  }
}

- (void)enumerateOnlyProtobufFactorPacksForFactorPackSet:(id)a3 withBlock:(id)a4
{
  id v21 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  id v8 = [NSString alloc];
  BOOL v9 = [(TRIFactorPackSetStorage *)self pathForFactorPackSetWithId:v21];
  char v10 = (void *)[v8 initWithFormat:@"%@/%@", v9, @"factorPacks"];

  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:1];
  int v13 = [v11 enumeratorAtURL:v12 includingPropertiesForKeys:0 options:1 errorHandler:0];

  BOOL v14 = [[TRIFactorPackStorage alloc] initWithPaths:self->_paths];
  v15 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v16 = [v13 nextObject];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    do
    {
      v18 = [v17 path];
      if (!v18)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"TRIFactorPackSetStorage.m", 385, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
      }
      id v19 = [(TRIFactorPackStorage *)v14 loadFactorPackWithDir:v18];

      if (v19) {
        v7[2](v7, v19);
      }

      v15 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v17 = [v13 nextObject];
    }
    while (v17);
  }
}

- (void)enumerateFactorPacksForFactorPackSet:(id)a3 usingLegacyPaths:(BOOL)a4 withBlock:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  char v10 = (void (**)(id, void, void *, char *))a5;
  if (v6) {
    uint64_t v11 = @"legacyNamespaceFactorPacks";
  }
  else {
    uint64_t v11 = @"factorPacks";
  }
  id v12 = [NSString alloc];
  int v13 = [(TRIFactorPackSetStorage *)self pathForFactorPackSetWithId:v9];
  uint64_t v14 = [v12 initWithFormat:@"%@/%@", v13, v11];

  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v34 = (void *)v14;
  uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:1];
  uint64_t v17 = [v15 enumeratorAtURL:v16 includingPropertiesForKeys:0 options:1 errorHandler:0];

  int v37 = [[TRIFactorPackStorage alloc] initWithPaths:self->_paths];
  v36 = [[TRIFBFactorPackStorage alloc] initWithPaths:self->_paths];
  int v18 = _os_feature_enabled_impl();
  int v19 = _os_feature_enabled_impl();
  char v38 = 0;
  v20 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v21 = [v17 nextObject];
  id v35 = v9;
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    id v33 = self;
    int v23 = v18 & v19;
    do
    {
      uint64_t v24 = [v22 path];
      char v25 = [v24 stringByAppendingPathComponent:@"factorPack.fb"];

      uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v27 = [v26 fileExistsAtPath:v25];

      LODWORD(v26) = v27 & v23;
      uint64_t v28 = [v22 path];
      int v29 = (void *)v28;
      if (v26 == 1)
      {
        if (!v28)
        {
          char v31 = [MEMORY[0x1E4F28B00] currentHandler];
          [v31 handleFailureInMethod:a2, v33, @"TRIFactorPackSetStorage.m", 434, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
        }
        int v30 = [(TRIFBFactorPackStorage *)v36 loadFactorLevelsWithDir:v29 bufferSize:0];

        if (!v30) {
          goto LABEL_16;
        }
        v10[2](v10, 0, v30, &v38);
      }
      else
      {
        if (!v28)
        {
          BOOL v32 = [MEMORY[0x1E4F28B00] currentHandler];
          [v32 handleFailureInMethod:a2, v33, @"TRIFactorPackSetStorage.m", 442, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
        }
        int v30 = [(TRIFactorPackStorage *)v37 loadFactorPackWithDir:v29];

        if (!v30) {
          goto LABEL_16;
        }
        ((void (**)(id, void *, void *, char *))v10)[2](v10, v30, 0, &v38);
      }
      if (v38)
      {

        break;
      }
LABEL_16:

      v20 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v22 = [v17 nextObject];
    }
    while (v22);
  }
}

- (void)enumerateCompatibleFactorPacksForFactorPackSet:(id)a3 usingLegacyPaths:(BOOL)a4 withBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke;
  v12[3] = &unk_1E6BBBFB0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(TRIFactorPackSetStorage *)self enumerateFactorPacksForFactorPackSet:v11 usingLegacyPaths:v6 withBlock:v12];
}

void __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E016E7F0]();
  if (v8)
  {
    id v10 = (void *)MEMORY[0x1E4FB01A0];
    id v11 = [v8 namespaceName];
    id v12 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    id v13 = [v12 namespaceDescriptorsDefaultDir];
    id v14 = [v10 loadWithNamespaceName:v11 fromDirectory:v13];

    if (v14)
    {
      v15 = [v8 ncvs];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke_126;
      v38[3] = &unk_1E6BBBF60;
      id v39 = v14;
      id v41 = *(id *)(a1 + 40);
      id v40 = v8;
      uint64_t v42 = a4;
      [v15 enumerateObjectsUsingBlock:v38];

      uint64_t v16 = v39;
LABEL_7:

LABEL_17:
      goto LABEL_18;
    }
    uint64_t v26 = TRILogCategory_Server();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = [v8 namespaceName];
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v27;
      __int16 v45 = 2114;
      int v46 = v28;
      _os_log_impl(&dword_1DA291000, v26, OS_LOG_TYPE_DEFAULT, "Factor pack set (via Flatbuffers) %{public}@ requires namespace %{public}@ which is not registered in Trial.", buf, 0x16u);
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  uint64_t v17 = [v7 selectedNamespace];
  char v18 = [v17 hasName];

  if (v18)
  {
    int v19 = (void *)MEMORY[0x1E4FB01A0];
    v20 = [v7 selectedNamespace];
    uint64_t v21 = [v20 name];
    uint64_t v22 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    int v23 = [v22 namespaceDescriptorsDefaultDir];
    id v14 = [v19 loadWithNamespaceName:v21 fromDirectory:v23];

    if (v14)
    {
      uint64_t v24 = [v7 selectedNamespace];
      char v25 = [v24 compatibilityVersionArray];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke_128;
      v33[3] = &unk_1E6BBBF88;
      id v34 = v14;
      id v36 = *(id *)(a1 + 40);
      id v35 = v7;
      int v37 = a4;
      [v25 enumerateValuesWithBlock:v33];

      uint64_t v16 = v34;
      goto LABEL_7;
    }
    uint64_t v26 = TRILogCategory_Server();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 32);
      uint64_t v28 = [v7 selectedNamespace];
      char v31 = [v28 name];
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v30;
      __int16 v45 = 2114;
      int v46 = v31;
      _os_log_impl(&dword_1DA291000, v26, OS_LOG_TYPE_DEFAULT, "Factor pack set (via protobufs) %{public}@ requires namespace %{public}@ which is not registered in Trial.", buf, 0x16u);

      goto LABEL_15;
    }
LABEL_16:

    *a4 = 1;
    goto LABEL_17;
  }
  int v29 = TRILogCategory_Server();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    uint64_t v32 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v44 = v32;
    _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Factor pack set (via protobufs) %{public}@, when loaded from disk, had a factor pack with missing namespace. Treating this as an NCV incompatibility.", buf, 0xCu);
  }

  *a4 = 1;
LABEL_18:
}

void __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke_126(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v6 = *(void **)(a1 + 32);
  id v7 = a2;
  LODWORD(v6) = [v6 downloadNCV];
  uint64_t v8 = [v7 integerValue];

  if (v8 == v6)
  {
    *a4 = 1;
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v9();
  }
}

uint64_t __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke_128(uint64_t a1, int a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) downloadNCV];
  if (result == a2)
  {
    *a4 = 1;
    uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v8();
  }
  return result;
}

- (void)enumerateFBFactorPacksForFactorPackSet:(id)a3 usingLegacyPaths:(BOOL)a4 withBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *, unsigned char *))a5;
  if (v6) {
    id v10 = @"legacyNamespaceFactorPacks";
  }
  else {
    id v10 = @"factorPacks";
  }
  id v11 = [NSString alloc];
  char v31 = v8;
  id v12 = [(TRIFactorPackSetStorage *)self pathForFactorPackSetWithId:v8];
  uint64_t v13 = [v11 initWithFormat:@"%@/%@", v12, v10];

  context = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v27 = self;
  uint64_t v32 = [[TRIFBFactorPackStorage alloc] initWithPaths:self->_paths];
  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v30 = (void *)v13;
  v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:1];
  uint64_t v16 = [v14 enumeratorAtURL:v15 includingPropertiesForKeys:0 options:1 errorHandler:0];

  char v33 = 0;
  while (1)
  {
    uint64_t v17 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v18 = [v16 nextObject];
    if (!v18) {
      break;
    }
    int v19 = (void *)v18;
    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v21 = [v19 path];
    uint64_t v22 = [v21 stringByAppendingPathComponent:@"factorPack.fb"];

    if ([v20 fileExistsAtPath:v22])
    {
      int v23 = [v19 path];
      if (!v23)
      {
        uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:a2, v27, @"TRIFactorPackSetStorage.m", 534, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
      }
      uint64_t v24 = [(TRIFBFactorPackStorage *)v32 loadFactorLevelsWithDir:v23 bufferSize:0];

      if (v24 && (v9[2](v9, v24, &v33), v33)) {
        int v25 = 3;
      }
      else {
        int v25 = 0;
      }
    }
    else
    {
      int v25 = 3;
    }

    if (v25) {
      goto LABEL_18;
    }
  }
LABEL_18:
}

- (BOOL)migrateEligibleFactorPacksToGlobalWithServerContext:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Considering migrating the local rollout factor packs.", (uint8_t *)&buf, 2u);
  }

  context = (void *)MEMORY[0x1E016E7F0]();
  id v5 = (void *)MEMORY[0x1E4FB01A0];
  BOOL v6 = [(TRIPaths *)self->_paths namespaceDescriptorsDefaultDir];
  id v34 = [v5 descriptorsForDirectory:v6 filterBlock:0];

  id v7 = objc_opt_new();
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke;
  v44[3] = &unk_1E6BBBFD8;
  id v8 = v7;
  id v45 = v8;
  [v34 enumerateObjectsUsingBlock:v44];
  id v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Found the following namespaces that should be available globally: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  id v10 = [TRIGloballyAvailableNamespaces alloc];
  id v11 = [v35 keyValueStore];
  id v12 = [(TRIGloballyAvailableNamespaces *)v10 initWithKVStore:v11];

  uint64_t v13 = [(TRIGloballyAvailableNamespaces *)v12 namespaces];
  id v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Found the following namespaces that are already available globally: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  [v8 minusSet:v13];
  uint64_t v15 = [v8 count];
  if (v15)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v49 = 0x3032000000;
    id v50 = __Block_byref_object_copy__30;
    __int16 v51 = __Block_byref_object_dispose__30;
    id v52 = (id)objc_opt_new();
    uint64_t v16 = [[TRIFactorPackStorage alloc] initWithPaths:self->_paths];
    uint64_t v17 = [[TRIFBFactorPackStorage alloc] initWithPaths:self->_paths];
    objc_initWeak(&location, self);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke_137;
    v38[3] = &unk_1E6BBC000;
    objc_copyWeak(&v42, &location);
    uint64_t v18 = v16;
    id v39 = v18;
    int v19 = v17;
    id v40 = v19;
    p_long long buf = &buf;
    uint64_t v20 = MEMORY[0x1E016EA80](v38);
    uint64_t v21 = [v35 rolloutDatabase];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke_140;
    v36[3] = &unk_1E6BBC028;
    v36[4] = self;
    id v22 = (id)v20;
    id v37 = v22;
    LOBYTE(v20) = [v21 enumerateRecordsOverlappingNamespaces:v8 usingTransaction:0 block:v36];

    if (v20)
    {
      uint64_t v23 = [*(id *)(*((void *)&buf + 1) + 40) count];
      if (v23)
      {
        uint64_t v24 = TRILogCategory_Server();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = *(void *)(*((void *)&buf + 1) + 40);
          *(_DWORD *)int v46 = 138412290;
          uint64_t v47 = v32;
          _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "Failed to update factorpacks for the following namespaces globally: %@", v46, 0xCu);
        }

        [v8 minusSet:*(void *)(*((void *)&buf + 1) + 40)];
      }
      int v25 = ![(TRIGloballyAvailableNamespaces *)v12 setNamespaces:v8];
      if (v23) {
        LOBYTE(v25) = 1;
      }
      if (v25)
      {
        int v27 = 0;
        char v29 = 0;
        goto LABEL_27;
      }
      uint64_t v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v46 = 0;
        _os_log_impl(&dword_1DA291000, v26, OS_LOG_TYPE_DEFAULT, "Completed factor packs migration successfully.", v46, 2u);
      }
      int v27 = 0;
    }
    else
    {
      uint64_t v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v46 = 0;
        _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Failed to enumerate factor packs to be migrated.", v46, 2u);
      }
      int v27 = 1;
    }

    char v29 = 1;
LABEL_27:

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
    goto LABEL_28;
  }
  uint64_t v28 = TRILogCategory_Server();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEFAULT, "No namespaces need to be migrated to be available globally.", (uint8_t *)&buf, 2u);
  }

  int v27 = 1;
  char v29 = 1;
LABEL_28:

  if (v27) {
    BOOL v30 = v15 == 0;
  }
  else {
    BOOL v30 = v29;
  }

  return v30;
}

void __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 availableToRootUser])
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v5 namespaceName];
    [v3 addObject:v4];
  }
}

void __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E016E7F0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v6 = [v3 selectedNamespace];
  id v7 = [v6 name];

  id v8 = [v3 downloadedFactorsWithPaths:WeakRetained[1]];
  id v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v3 factorPackId];
    int v13 = 138412802;
    id v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_INFO, "Migrating factor pack with id: %@ in namespace: %@ populating factors: %@", (uint8_t *)&v13, 0x20u);
  }
  id v11 = +[TRIClientFactorPackUtils aliasesInNamespace:v7];
  int v12 = [*(id *)(a1 + 32) saveFactorPackToGlobal:v3 forFactorNames:v8 aliasToUnaliasMap:v11];
  if ((v12 & [*(id *)(a1 + 40) saveFactorPackToGlobal:v3 forFactorNames:v8 aliasToUnaliasMap:v11] & 1) == 0&& v7)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
  }
}

void __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke_140(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 activeFactorPackSetId];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 activeFactorPackSetId];
    [v4 enumerateOnlyProtobufFactorPacksForFactorPackSet:v5 withBlock:*(void *)(a1 + 40)];
  }
}

- (void).cxx_destruct
{
}

@end