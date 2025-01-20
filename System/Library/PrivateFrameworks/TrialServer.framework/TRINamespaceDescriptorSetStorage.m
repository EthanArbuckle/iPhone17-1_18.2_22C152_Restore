@interface TRINamespaceDescriptorSetStorage
- (BOOL)hasNamespaceDescriptorsForTreatmentWithId:(id)a3 path:(id *)a4;
- (BOOL)overwriteNamespaceDescriptors:(id)a3 forTreatmentId:(id)a4;
- (BOOL)removeUnreferencedNamespaceDescriptorSetsWithServerContext:(id)a3 removedCount:(unsigned int *)a4;
- (TRINamespaceDescriptorSetStorage)initWithPaths:(id)a3;
- (id)_collectNamespaceDescriptorSets;
- (id)parentDirForNamespaceDescriptorSets;
- (id)pathForNamespaceDescriptorsWithTreatmentId:(id)a3;
@end

@implementation TRINamespaceDescriptorSetStorage

- (TRINamespaceDescriptorSetStorage)initWithPaths:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRINamespaceDescriptorSetStorage;
  v6 = [(TRINamespaceDescriptorSetStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_paths, a3);
  }

  return v7;
}

- (BOOL)overwriteNamespaceDescriptors:(id)a3 forTreatmentId:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v34 = a4;
  v36 = -[TRINamespaceDescriptorSetStorage pathForNamespaceDescriptorsWithTreatmentId:](self, "pathForNamespaceDescriptorsWithTreatmentId:");
  if (v36)
  {
    v6 = [TRITempDirScopeGuard alloc];
    v7 = [(TRIPaths *)self->_paths localTempDir];
    v8 = [(TRITempDirScopeGuard *)v6 initWithPath:v7];

    if (v8)
    {
      objc_super v9 = [(TRITempDirScopeGuard *)v8 path];
      id v10 = [NSString alloc];
      v11 = objc_opt_new();
      v12 = [v11 UUIDString];
      v13 = (void *)[v10 initWithFormat:@"ns-desc-set-%@", v12];
      v37 = [v9 stringByAppendingPathComponent:v13];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v14 = [v36 stringByDeletingLastPathComponent];
      v51[0] = v14;
      v15 = [v37 stringByAppendingPathComponent:@"legacyNamespaceDescriptors"];
      v51[1] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];

      uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v43 != v18) {
              objc_enumerationMutation(v16);
            }
            if (![MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:*(void *)(*((void *)&v42 + 1) + 8 * i)])
            {

              BOOL v31 = 0;
              goto LABEL_34;
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v52 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v20 = v35;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v39;
        while (2)
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(void **)(*((void *)&v38 + 1) + 8 * j);
            v25 = (void *)MEMORY[0x1E016E7F0]();
            v26 = [v37 stringByAppendingPathComponent:@"legacyNamespaceDescriptors"];
            int v27 = [v24 saveToDirectory:v26];

            if ((v27 & 1) == 0)
            {
              v28 = TRILogCategory_Server();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v47 = v34;
                _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "Failed to save namespace descriptor set for treatment %@.", buf, 0xCu);
              }
            }
            if (!v27)
            {

              goto LABEL_32;
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      if (+[TRIReferenceManagedDir createFromDir:v37]
        && ([MEMORY[0x1E4F28CB8] defaultManager],
            v29 = objc_claimAutoreleasedReturnValue(),
            [v29 triForceRemoveItemAtPath:v36 error:0],
            v29,
            [MEMORY[0x1E4F28CB8] triRenameOrFaultWithSourcePath:v37 destPath:v36]))
      {
        v30 = TRILogCategory_Server();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v47 = v34;
          __int16 v48 = 2112;
          v49 = v36;
          _os_log_impl(&dword_1DA291000, v30, OS_LOG_TYPE_DEFAULT, "Wrote namespace descriptor set %@ --> %@", buf, 0x16u);
        }

        BOOL v31 = 1;
      }
      else
      {
LABEL_32:
        BOOL v31 = 0;
      }
      v32 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v32 triForceRemoveItemAtPath:v37 error:0];

LABEL_34:
    }
    else
    {
      BOOL v31 = 0;
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (id)pathForNamespaceDescriptorsWithTreatmentId:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 triIsPathSafePlausibleUniqueId])
  {
    id v5 = (void *)MEMORY[0x1E016E7F0]();
    v6 = [(TRINamespaceDescriptorSetStorage *)self parentDirForNamespaceDescriptorSets];
    v7 = [v6 stringByAppendingPathComponent:v4];
  }
  else
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Rejecting use of bad treatmentId: \"%@\"", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)parentDirForNamespaceDescriptorSets
{
  v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  id v4 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  id v5 = [v4 stringByAppendingPathComponent:@"v2/namespaceDescriptorSets"];

  return v5;
}

- (BOOL)hasNamespaceDescriptorsForTreatmentWithId:(id)a3 path:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRINamespaceDescriptorSetStorage.m", 176, @"Invalid parameter not satisfying: %@", @"treatmentId" object file lineNumber description];
  }
  v8 = [(TRINamespaceDescriptorSetStorage *)self pathForNamespaceDescriptorsWithTreatmentId:v7];
  if (v8)
  {
    if (a4) {
      objc_storeStrong(a4, v8);
    }
    objc_super v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 fileExistsAtPath:v8];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_collectNamespaceDescriptorSets
{
  id v4 = objc_opt_new();
  if (v4)
  {
    id v5 = [(TRINamespaceDescriptorSetStorage *)self parentDirForNamespaceDescriptorSets];
    v6 = (void *)MEMORY[0x1E016E7F0]();
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
    objc_super v9 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:0 options:1 errorHandler:0];

    char v10 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v11 = [v9 nextObject];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      while (1)
      {
        v13 = [v12 path];
        if (!v13)
        {
          v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, self, @"TRINamespaceDescriptorSetStorage.m", 204, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
        }
        int v14 = [v4 addString:v13];

        if (!v14) {
          break;
        }
        char v10 = (void *)MEMORY[0x1E016E7F0]();
        uint64_t v12 = [v9 nextObject];
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

- (BOOL)removeUnreferencedNamespaceDescriptorSetsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRINamespaceDescriptorSetStorage.m", 216, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];
  }
  v8 = [(TRINamespaceDescriptorSetStorage *)self _collectNamespaceDescriptorSets];
  if (v8)
  {
    objc_super v9 = [TRITempDirScopeGuard alloc];
    char v10 = [(TRIPaths *)self->_paths localTempDir];
    uint64_t v11 = [(TRITempDirScopeGuard *)v9 initWithPath:v10];

    if (v11)
    {
      uint64_t v12 = [[TRINamespaceDescriptorSetExternalRefStore alloc] initWithServerContext:v7];
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      int v30 = 0;
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 1;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __108__TRINamespaceDescriptorSetStorage_removeUnreferencedNamespaceDescriptorSetsWithServerContext_removedCount___block_invoke;
      v18[3] = &unk_1E6BB8698;
      uint64_t v21 = &v23;
      v13 = v12;
      v19 = v13;
      id v20 = v11;
      uint64_t v22 = &v27;
      int v14 = [v8 enumerateStringsWithBlock:v18];
      if (a4) {
        *a4 = *((_DWORD *)v28 + 6);
      }
      if (v14) {
        BOOL v15 = *((unsigned char *)v24 + 24) != 0;
      }
      else {
        BOOL v15 = 0;
      }

      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(&v27, 8);
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __108__TRINamespaceDescriptorSetStorage_removeUnreferencedNamespaceDescriptorSetsWithServerContext_removedCount___block_invoke(void *a1, void *a2)
{
  char v10 = 0;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  v6 = [v4 path];
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

- (void).cxx_destruct
{
}

@end