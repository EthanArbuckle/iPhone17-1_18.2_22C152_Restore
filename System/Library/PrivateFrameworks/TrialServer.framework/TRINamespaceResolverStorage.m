@interface TRINamespaceResolverStorage
- (BOOL)_createDeploymentDirectoryAndAddFactorPackSetWithTempDirRef:(id)a3 newDeploymentDir:(id)a4 factorPackSetPath:(id)a5;
- (BOOL)_overwriteActiveFactorProvidersUsingGlobalPath:(BOOL)a3 withNamespaceMap:(id)a4 rolloutDeploymentMap:(id)a5 experimentDeploymentMap:(id)a6 experimentTreatmentMap:(id)a7 factorPackMap:(id)a8;
- (BOOL)_removeUnreferencedBMLTDeploymentsWithRefStore:(id)a3 parentDir:(id)a4 removedCount:(unsigned int *)a5;
- (BOOL)_removeUnreferencedBMLTDeploymentsWithRefStore:(id)a3 topLevelDir:(id)a4 removedCount:(unsigned int *)a5;
- (BOOL)_removeUnreferencedDeploymentsWithRefStore:(id)a3 parentDir:(id)a4 removedCount:(unsigned int *)a5;
- (BOOL)_removeUnreferencedDeploymentsWithRefStore:(id)a3 topLevelDir:(id)a4 removedCount:(unsigned int *)a5;
- (BOOL)_rewriteExperimentDeployment:(id)a3 targetedTreatmentId:(id)a4 factorPackSetId:(id)a5;
- (BOOL)_rewriteExperimentDeploymentForFPSPath:(id)a3 targetedTreatmentId:(id)a4 factorPackSetId:(id)a5;
- (BOOL)_rewriteExperimentDeploymentForTreatmentPath:(id)a3 targetedTreatmentId:(id)a4;
- (BOOL)_setProvisionalFactorpackMetadata:(id)a3 forNamespaceName:(id)a4 error:(id *)a5;
- (BOOL)_updateTargetedFactorPackSetWithTempDirRef:(id)a3 existingDeploymentDir:(id)a4 factorPackSetPath:(id)a5;
- (BOOL)_writeRampId:(id)a3 parentDir:(id)a4;
- (BOOL)overwriteActiveFactorProvidersUsingTransaction:(id)a3 fromContext:(id)a4;
- (BOOL)overwriteGlobalActiveFactorProvidersWithNamespaceMap:(id)a3 factorPackMap:(id)a4 rolloutDeploymentMap:(id)a5;
- (BOOL)promoteFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6;
- (BOOL)rejectFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6;
- (BOOL)removeUnneededPromotionsWithRemovedCount:(unsigned int *)a3 removeAll:(BOOL)a4;
- (BOOL)removeUnreferencedBMLTDeploymentsWithServerContext:(id)a3 removedCount:(unsigned int *)a4;
- (BOOL)removeUnreferencedExperimentDeploymentsWithServerContext:(id)a3 removedCount:(unsigned int *)a4;
- (BOOL)removeUnreferencedRolloutDeploymentsWithServerContext:(id)a3 removedCount:(unsigned int *)a4;
- (BOOL)rewriteBMLTDeployment:(id)a3 targetedFactorPackSetId:(id)a4;
- (BOOL)rewriteExperimentDeployment:(id)a3 targetedTreatmentId:(id)a4;
- (BOOL)rewriteRolloutDeployment:(id)a3 rampId:(id)a4 targetedFactorPackSetId:(id)a5;
- (BOOL)setProvisionalFactorPackId:(id)a3 forNamespaceName:(id)a4 error:(id *)a5;
- (TRINamespaceResolverStorage)initWithPaths:(id)a3;
- (id)_getProvisionalFactorpackMetadataForNamespaceName:(id)a3 mustExist:(BOOL)a4 error:(id *)a5;
- (id)_pathForBMLTDeployment:(id)a3;
- (id)_pathForExperimentDeployment:(id)a3;
- (id)_pathForRolloutDeployment:(id)a3;
- (id)parentDirForBMLTDeployments;
- (id)parentDirForExperimentDeployments;
- (id)parentDirForRolloutDeployments;
- (id)pathForBMLTDeployment:(id)a3;
- (id)pathForExperimentDeployment:(id)a3;
- (id)pathForRolloutDeployment:(id)a3;
- (id)pathForTargetedFactorPackSetWithDeployment:(id)a3;
- (id)pathForTargetedFactorPackSetWithTaskDeployment:(id)a3;
@end

@implementation TRINamespaceResolverStorage

- (TRINamespaceResolverStorage)initWithPaths:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRINamespaceResolverStorage;
  v6 = [(TRINamespaceResolverStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_paths, a3);
  }

  return v7;
}

- (BOOL)rewriteRolloutDeployment:(id)a3 rampId:(id)a4 targetedFactorPackSetId:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 345, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  v12 = [v9 rolloutId];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    if (!v11)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 347, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];
    }
    v14 = [[TRIFactorPackSetStorage alloc] initWithPaths:self->_paths];
    id v43 = 0;
    if ([(TRIFactorPackSetStorage *)v14 hasFactorPackSetWithId:v11 path:&v43])
    {
      if (!v43)
      {
        v38 = [MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 357, @"Invalid parameter not satisfying: %@", @"factorPackSetPath" object file lineNumber description];
      }
      id v15 = objc_alloc(MEMORY[0x1E4FB0218]);
      v16 = [v15 initWithDir:v43];
      if (v16)
      {
        v17 = [TRITempDirScopeGuard alloc];
        v18 = [(TRIPaths *)self->_paths localTempDir];
        v42 = [(TRITempDirScopeGuard *)v17 initWithPath:v18];

        if (!v42)
        {
          char v25 = 0;
LABEL_32:

          [v16 unlock];
          goto LABEL_33;
        }
        v40 = [(TRINamespaceResolverStorage *)self pathForRolloutDeployment:v9];
        if (v40)
        {
          if (v10 && ![(TRINamespaceResolverStorage *)self _writeRampId:v10 parentDir:v40])
          {
            char v25 = 0;
            goto LABEL_31;
          }
          v19 = [(TRITempDirScopeGuard *)v42 path];
          id v20 = [NSString alloc];
          v21 = objc_opt_new();
          v22 = [v21 UUIDString];
          v23 = (void *)[v20 initWithFormat:@"targeting-link-%@", v22];
          v41 = [v19 stringByAppendingPathComponent:v23];

          v24 = [v40 stringByAppendingPathComponent:@"targetedFactorPackSet"];
          if (+[TRIReferenceManagedDir symlinkFromCurrentPath:v41 withFuturePath:v24 toManagedPath:v43])
          {
            goto LABEL_15;
          }
        }
        else
        {
          v39 = [(TRITempDirScopeGuard *)v42 path];
          id v26 = [NSString alloc];
          v27 = objc_opt_new();
          v28 = [v27 UUIDString];
          v29 = (void *)[v26 initWithFormat:@"new-deployment-%@", v28];
          v41 = [v39 stringByAppendingPathComponent:v29];

          v24 = [(TRINamespaceResolverStorage *)self _pathForRolloutDeployment:v9];
          if (v24)
          {
            [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v41];
            v30 = (void *)MEMORY[0x1E4F28CB8];
            uint64_t v31 = [v24 stringByDeletingLastPathComponent];
            [v30 triIdempotentCreateDirectoryOrFaultWithPath:v31];

            v32 = [v41 stringByAppendingPathComponent:@"targetedFactorPackSet"];
            v33 = [v24 stringByAppendingPathComponent:@"targetedFactorPackSet"];
            LOBYTE(v31) = +[TRIReferenceManagedDir symlinkFromCurrentPath:v32 withFuturePath:v33 toManagedPath:v43];

            if ((v31 & 1) != 0
              && +[TRIReferenceManagedDir createFromDir:v41]
              && (!v10
               || [(TRINamespaceResolverStorage *)self _writeRampId:v10 parentDir:v41]))
            {
LABEL_15:
              char v25 = [MEMORY[0x1E4F28CB8] triRenameOrFaultWithSourcePath:v41 destPath:v24];
LABEL_30:

LABEL_31:
              goto LABEL_32;
            }
          }
        }
        char v25 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v35 = [v9 shortDesc];
        *(_DWORD *)buf = 138543618;
        v45 = v35;
        __int16 v46 = 2114;
        id v47 = v11;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Unable to update rollout %{public}@; targeted factor pack set %{public}@ is missing.",
          buf,
          0x16u);
      }
    }
    char v25 = 0;
LABEL_33:

    goto LABEL_34;
  }
  TRILogCategory_Server();
  v14 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[TRINamespaceResolverStorage rewriteRolloutDeployment:rampId:targetedFactorPackSetId:]";
    _os_log_error_impl(&dword_1DA291000, &v14->super, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.rolloutId", buf, 0xCu);
  }
  char v25 = 0;
LABEL_34:

  return v25 & 1;
}

- (BOOL)_writeRampId:(id)a3 parentDir:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a4 stringByAppendingPathComponent:@"rampId"];
  v7 = [v5 dataUsingEncoding:4];

  id v12 = 0;
  char v8 = [v7 writeToFile:v6 options:268435457 error:&v12];
  id v9 = v12;
  if ((v8 & 1) == 0)
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to write ramp ID into namespace resolver storage at %{public}@: %{public}@", buf, 0x16u);
    }
  }
  return v8;
}

- (id)parentDirForRolloutDeployments
{
  v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  v4 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  id v5 = [v4 stringByAppendingPathComponent:@"v2/rolloutV2"];

  return v5;
}

- (id)_pathForRolloutDeployment:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 447, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  v6 = [v5 rolloutId];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    char v8 = (void *)MEMORY[0x1E016E7F0]();
    id v9 = [(TRINamespaceResolverStorage *)self parentDirForRolloutDeployments];
    id v10 = [NSString alloc];
    id v11 = [v5 rolloutId];
    id v12 = (void *)[v10 initWithFormat:@"%@/%d", v11, objc_msgSend(v5, "deploymentId")];
    uint64_t v13 = [v9 stringByAppendingPathComponent:v12];
  }
  else
  {
    v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[TRINamespaceResolverStorage _pathForRolloutDeployment:]";
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.rolloutId", buf, 0xCu);
    }

    uint64_t v13 = 0;
  }

  return v13;
}

- (id)pathForRolloutDeployment:(id)a3
{
  v3 = [(TRINamespaceResolverStorage *)self _pathForRolloutDeployment:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v4 fileExistsAtPath:v3]) {
      id v5 = v3;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)pathForTargetedFactorPackSetWithDeployment:(id)a3
{
  v3 = [(TRINamespaceResolverStorage *)self pathForRolloutDeployment:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 stringByAppendingPathComponent:@"targetedFactorPackSet"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_removeUnreferencedDeploymentsWithRefStore:(id)a3 topLevelDir:(id)a4 removedCount:(unsigned int *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
  uint64_t v13 = [v11 enumeratorAtURL:v12 includingPropertiesForKeys:0 options:1 errorHandler:0];

  v14 = objc_opt_new();
  __int16 v15 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v16 = [v13 nextObject];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    SEL v23 = a2;
    do
    {
      v18 = [v17 path];
      if (!v18)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:v23, self, @"TRINamespaceResolverStorage.m", 487, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
      }
      [v14 addString:v18];

      __int16 v15 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v17 = [v13 nextObject];
    }
    while (v17);
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__TRINamespaceResolverStorage__removeUnreferencedDeploymentsWithRefStore_topLevelDir_removedCount___block_invoke;
  v24[3] = &unk_1E6BB9B98;
  id v26 = &v28;
  v24[4] = self;
  id v19 = v9;
  id v25 = v19;
  v27 = a5;
  if ([v14 enumerateStringsWithBlock:v24]) {
    BOOL v20 = *((unsigned char *)v29 + 24) != 0;
  }
  else {
    BOOL v20 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v20;
}

uint64_t __99__TRINamespaceResolverStorage__removeUnreferencedDeploymentsWithRefStore_topLevelDir_removedCount___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _removeUnreferencedDeploymentsWithRefStore:*(void *)(a1 + 40) parentDir:a2 removedCount:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = result;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

- (BOOL)_removeUnreferencedDeploymentsWithRefStore:(id)a3 parentDir:(id)a4 removedCount:(unsigned int *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
  uint64_t v13 = [v11 enumeratorAtURL:v12 includingPropertiesForKeys:0 options:1 errorHandler:0];

  v14 = objc_opt_new();
  __int16 v15 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v16 = [v13 nextObject];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    do
    {
      v18 = [v17 path];
      if (!v18)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 516, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
      }
      [v14 addString:v18];

      __int16 v15 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v17 = [v13 nextObject];
    }
    while (v17);
  }
  id v19 = [TRITempDirScopeGuard alloc];
  BOOL v20 = [(TRIPaths *)self->_paths localTempDir];
  v21 = [(TRITempDirScopeGuard *)v19 initWithPath:v20];

  if (v21)
  {
    uint64_t v30 = 0;
    char v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __97__TRINamespaceResolverStorage__removeUnreferencedDeploymentsWithRefStore_parentDir_removedCount___block_invoke;
    v25[3] = &unk_1E6BB9B98;
    uint64_t v28 = &v30;
    id v26 = v9;
    v27 = v21;
    v29 = a5;
    int v22 = [v14 enumerateStringsWithBlock:v25];
    rmdir((const char *)[v10 fileSystemRepresentation]);
    if (v22) {
      LOBYTE(v22) = *((unsigned char *)v31 + 24) != 0;
    }

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

void __97__TRINamespaceResolverStorage__removeUnreferencedDeploymentsWithRefStore_parentDir_removedCount___block_invoke(uint64_t a1, void *a2)
{
  char v10 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 path];
  BOOL v7 = +[TRIReferenceManagedDir collectGarbageForManagedDir:v5 withExternalReferenceStore:v3 usingTempDir:v6 managedDirWasDeleted:&v10];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    BOOL v9 = v7;
  }
  else {
    BOOL v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;

  if (v10) {
    ++**(_DWORD **)(a1 + 56);
  }
}

- (BOOL)removeUnreferencedRolloutDeploymentsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v6 = a3;
  BOOL v7 = [[TRIRolloutDeploymentRefStore alloc] initWithServerContext:v6];

  unsigned int v11 = 0;
  uint64_t v8 = [(TRINamespaceResolverStorage *)self parentDirForRolloutDeployments];
  BOOL v9 = [(TRINamespaceResolverStorage *)self _removeUnreferencedDeploymentsWithRefStore:v7 topLevelDir:v8 removedCount:&v11];

  if (a4) {
    *a4 = v11;
  }

  return v9;
}

- (BOOL)rewriteExperimentDeployment:(id)a3 targetedTreatmentId:(id)a4
{
  return [(TRINamespaceResolverStorage *)self _rewriteExperimentDeployment:a3 targetedTreatmentId:a4 factorPackSetId:0];
}

- (BOOL)_rewriteExperimentDeployment:(id)a3 targetedTreatmentId:(id)a4 factorPackSetId:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 572, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  id v12 = [v9 experimentId];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    if (!v10)
    {
      id v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 574, @"Invalid parameter not satisfying: %@", @"treatmentId" object file lineNumber description];
    }
    char v14 = _os_feature_enabled_impl();
    int v15 = _os_feature_enabled_impl();
    if (v11) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
    int v17 = _os_feature_enabled_impl();
    if (v11 && (v14 & 1) != 0)
    {
      BOOL v18 = 0;
      if (!v16) {
        goto LABEL_23;
      }
    }
    else
    {
      BOOL v18 = [(TRINamespaceResolverStorage *)self _rewriteExperimentDeploymentForTreatmentPath:v9 targetedTreatmentId:v10];
      if (!v16) {
        goto LABEL_23;
      }
    }
    BOOL v20 = [(TRINamespaceResolverStorage *)self _rewriteExperimentDeploymentForFPSPath:v9 targetedTreatmentId:v10 factorPackSetId:v11];
    if (!v20)
    {
      v21 = TRILogCategory_Server();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        SEL v23 = [v9 shortDesc];
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        __int16 v28 = 2114;
        id v29 = v11;
        _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Unable to update experiment deployment %{public}@ for targeted factor pack set %{public}@.", buf, 0x16u);
      }
    }
    if (v17) {
      BOOL v18 = v20;
    }
  }
  else
  {
    id v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[TRINamespaceResolverStorage _rewriteExperimentDeployment:targetedTreatmentId:factorPackSetId:]";
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.experimentId", buf, 0xCu);
    }

    BOOL v18 = 0;
  }
LABEL_23:

  return v18;
}

- (BOOL)_rewriteExperimentDeploymentForTreatmentPath:(id)a3 targetedTreatmentId:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [[TRINamespaceDescriptorSetStorage alloc] initWithPaths:self->_paths];
  id v36 = 0;
  if ([(TRINamespaceDescriptorSetStorage *)v9 hasNamespaceDescriptorsForTreatmentWithId:v8 path:&v36])
  {
    if (!v36)
    {
      char v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 617, @"Invalid parameter not satisfying: %@", @"namespaceDescriptorSetPath" object file lineNumber description];
    }
    id v10 = objc_alloc(MEMORY[0x1E4FB0218]);
    id v11 = [v10 initWithDir:v36];
    if (v11)
    {
      id v12 = [TRITempDirScopeGuard alloc];
      uint64_t v13 = [(TRIPaths *)self->_paths localTempDir];
      char v14 = [(TRITempDirScopeGuard *)v12 initWithPath:v13];

      if (!v14)
      {
        char v22 = 0;
LABEL_18:

        [v11 unlock];
        goto LABEL_19;
      }
      v35 = [(TRINamespaceResolverStorage *)self pathForExperimentDeployment:v7];
      if (v35)
      {
        int v15 = [(TRITempDirScopeGuard *)v14 path];
        id v16 = [NSString alloc];
        int v17 = objc_opt_new();
        BOOL v18 = [v17 UUIDString];
        id v19 = (void *)[v16 initWithFormat:@"targeting-link-%@", v18];
        BOOL v20 = [v15 stringByAppendingPathComponent:v19];

        v21 = [v35 stringByAppendingPathComponent:@"targetedNamespaceDescriptorSet"];
        if (+[TRIReferenceManagedDir symlinkFromCurrentPath:v20 withFuturePath:v21 toManagedPath:v36])
        {
LABEL_8:
          char v22 = [MEMORY[0x1E4F28CB8] triRenameOrFaultWithSourcePath:v20 destPath:v21];
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        v34 = [(TRITempDirScopeGuard *)v14 path];
        id v23 = [NSString alloc];
        v24 = objc_opt_new();
        id v25 = [v24 UUIDString];
        id v26 = (void *)[v23 initWithFormat:@"new-deployment-%@", v25];
        BOOL v20 = [v34 stringByAppendingPathComponent:v26];

        v21 = [(TRINamespaceResolverStorage *)self _pathForExperimentDeployment:v7];
        if (v21)
        {
          [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v20];
          v27 = (void *)MEMORY[0x1E4F28CB8];
          __int16 v28 = [v21 stringByDeletingLastPathComponent];
          [v27 triIdempotentCreateDirectoryOrFaultWithPath:v28];

          id v29 = [v20 stringByAppendingPathComponent:@"targetedNamespaceDescriptorSet"];
          uint64_t v30 = [v21 stringByAppendingPathComponent:@"targetedNamespaceDescriptorSet"];
          LOBYTE(v27) = +[TRIReferenceManagedDir symlinkFromCurrentPath:v29 withFuturePath:v30 toManagedPath:v36];

          if (v27)
          {
            if (+[TRIReferenceManagedDir createFromDir:v20]) {
              goto LABEL_8;
            }
          }
        }
      }
      char v22 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    id v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = [v7 shortDesc];
      *(_DWORD *)buf = 138543618;
      v38 = v32;
      __int16 v39 = 2112;
      id v40 = v8;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Unable to update experiment %{public}@; targeted treatment set %@ is missing.",
        buf,
        0x16u);
    }
  }
  char v22 = 0;
LABEL_19:

  return v22 & 1;
}

- (BOOL)_rewriteExperimentDeploymentForFPSPath:(id)a3 targetedTreatmentId:(id)a4 factorPackSetId:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 684, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];
  }
  id v12 = [[TRIFactorPackSetStorage alloc] initWithPaths:self->_paths];
  id v25 = 0;
  if (![(TRIFactorPackSetStorage *)v12 hasFactorPackSetWithId:v11 path:&v25])
  {
    char v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v21 = [v9 shortDesc];
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      __int16 v28 = 2114;
      id v29 = v11;
      _os_log_fault_impl(&dword_1DA291000, v14, OS_LOG_TYPE_FAULT, "Unable to update experiment %{public}@; targeted factor pack set %{public}@ is missing.",
        buf,
        0x16u);
    }
    goto LABEL_12;
  }
  if (!v25)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 695, @"Invalid parameter not satisfying: %@", @"factorPackSetPath" object file lineNumber description];
  }
  id v13 = objc_alloc(MEMORY[0x1E4FB0218]);
  char v14 = [v13 initWithDir:v25];
  if (!v14)
  {
LABEL_12:
    BOOL v19 = 0;
    goto LABEL_20;
  }
  int v15 = [TRITempDirScopeGuard alloc];
  id v16 = [(TRIPaths *)self->_paths localTempDir];
  int v17 = [(TRITempDirScopeGuard *)v15 initWithPath:v16];

  if (v17)
  {
    BOOL v18 = [(TRINamespaceResolverStorage *)self pathForExperimentDeployment:v9];
    if (v18)
    {
      BOOL v19 = [(TRINamespaceResolverStorage *)self _updateTargetedFactorPackSetWithTempDirRef:v17 existingDeploymentDir:v18 factorPackSetPath:v25];
    }
    else
    {
      BOOL v20 = [(TRINamespaceResolverStorage *)self _pathForExperimentDeployment:v9];
      if (v20) {
        BOOL v19 = [(TRINamespaceResolverStorage *)self _createDeploymentDirectoryAndAddFactorPackSetWithTempDirRef:v17 newDeploymentDir:v20 factorPackSetPath:v25];
      }
      else {
        BOOL v19 = 0;
      }
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  [v14 unlock];
LABEL_20:

  return v19;
}

- (BOOL)_updateTargetedFactorPackSetWithTempDirRef:(id)a3 existingDeploymentDir:(id)a4 factorPackSetPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [a3 path];
  id v10 = [NSString alloc];
  id v11 = objc_opt_new();
  id v12 = [v11 UUIDString];
  id v13 = (void *)[v10 initWithFormat:@"targeting-link-%@", v12];
  char v14 = [v9 stringByAppendingPathComponent:v13];

  int v15 = [v8 stringByAppendingPathComponent:@"targetedFactorPackSet"];

  LODWORD(v8) = +[TRIReferenceManagedDir symlinkFromCurrentPath:v14 withFuturePath:v15 toManagedPath:v7];
  if (v8) {
    char v16 = [MEMORY[0x1E4F28CB8] triRenameOrFaultWithSourcePath:v14 destPath:v15];
  }
  else {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)_createDeploymentDirectoryAndAddFactorPackSetWithTempDirRef:(id)a3 newDeploymentDir:(id)a4 factorPackSetPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [a3 path];
  id v10 = [NSString alloc];
  id v11 = objc_opt_new();
  id v12 = [v11 UUIDString];
  id v13 = (void *)[v10 initWithFormat:@"new-deployment-%@", v12];
  char v14 = [v9 stringByAppendingPathComponent:v13];

  [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v14];
  int v15 = (void *)MEMORY[0x1E4F28CB8];
  char v16 = [v7 stringByDeletingLastPathComponent];
  [v15 triIdempotentCreateDirectoryOrFaultWithPath:v16];

  int v17 = [v14 stringByAppendingPathComponent:@"targetedFactorPackSet"];
  BOOL v18 = [v7 stringByAppendingPathComponent:@"targetedFactorPackSet"];
  LODWORD(v15) = +[TRIReferenceManagedDir symlinkFromCurrentPath:v17 withFuturePath:v18 toManagedPath:v8];

  if (v15
    && +[TRIReferenceManagedDir createFromDir:v14])
  {
    char v19 = [MEMORY[0x1E4F28CB8] triRenameOrFaultWithSourcePath:v14 destPath:v7];
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (id)parentDirForExperimentDeployments
{
  uint64_t v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  uint64_t v4 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  id v5 = [v4 stringByAppendingPathComponent:@"v2/experiment"];

  return v5;
}

- (id)_pathForExperimentDeployment:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 856, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  id v6 = [v5 experimentId];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E016E7F0]();
    id v9 = [(TRINamespaceResolverStorage *)self parentDirForExperimentDeployments];
    id v10 = [NSString alloc];
    id v11 = [v5 experimentId];
    id v12 = (void *)[v10 initWithFormat:@"%@/%d", v11, objc_msgSend(v5, "deploymentId")];
    id v13 = [v9 stringByAppendingPathComponent:v12];
  }
  else
  {
    char v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v18 = "-[TRINamespaceResolverStorage _pathForExperimentDeployment:]";
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.experimentId", buf, 0xCu);
    }

    id v13 = 0;
  }

  return v13;
}

- (id)pathForExperimentDeployment:(id)a3
{
  uint64_t v3 = [(TRINamespaceResolverStorage *)self _pathForExperimentDeployment:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v4 fileExistsAtPath:v3]) {
      id v5 = v3;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)removeUnreferencedExperimentDeploymentsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v6 = a3;
  uint64_t v7 = [[TRIExperimentDeploymentRefStore alloc] initWithServerContext:v6];

  unsigned int v11 = 0;
  id v8 = [(TRINamespaceResolverStorage *)self parentDirForExperimentDeployments];
  BOOL v9 = [(TRINamespaceResolverStorage *)self _removeUnreferencedDeploymentsWithRefStore:v7 topLevelDir:v8 removedCount:&v11];

  if (a4) {
    *a4 = v11;
  }

  return v9;
}

- (BOOL)overwriteActiveFactorProvidersUsingTransaction:(id)a3 fromContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  v34 = v7;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 885, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 886, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

LABEL_3:
  context = (void *)MEMORY[0x1E016E7F0]();
  id v10 = objc_opt_new();
  unsigned int v11 = objc_opt_new();
  id v12 = objc_opt_new();
  id v13 = objc_opt_new();
  uint64_t v30 = objc_opt_new();
  SEL v14 = a2;
  int v15 = [[TRIFactorPackSetStorage alloc] initWithPaths:self->_paths];
  char v16 = [v9 rolloutDatabase];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke;
  v43[3] = &unk_1E6BB9BE8;
  id v31 = v12;
  id v44 = v31;
  id v17 = v10;
  id v45 = v17;
  BOOL v18 = v15;
  SEL v49 = v14;
  __int16 v46 = v18;
  id v47 = self;
  id v19 = v11;
  id v48 = v19;
  int v20 = [v16 enumerateActiveRecordsWithVisibility:1 usingTransaction:v34 block:v43];

  uint64_t v32 = v9;
  if (!_os_feature_enabled_impl())
  {
    char v22 = v13;
    id v23 = v30;
    if (!v20) {
      goto LABEL_5;
    }
LABEL_7:
    id v26 = v31;
    BOOL v25 = [(TRINamespaceResolverStorage *)self _overwriteActiveFactorProvidersUsingGlobalPath:0 withNamespaceMap:v17 rolloutDeploymentMap:v31 experimentDeploymentMap:v22 experimentTreatmentMap:v23 factorPackMap:0];
    goto LABEL_8;
  }
  v21 = [v9 experimentDatabase];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_2;
  v35[3] = &unk_1E6BB9C10;
  char v22 = v13;
  id v36 = v13;
  id v23 = v30;
  id v37 = v30;
  id v38 = v17;
  SEL v42 = v14;
  __int16 v39 = v18;
  id v40 = self;
  id v41 = v19;
  char v24 = v20 & [v21 enumerateActiveExperimentRecordsWithVisibility:1 block:v35];

  if (v24) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v25 = 0;
  id v26 = v31;
LABEL_8:

  return v25;
}

void __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 activeFactorPackSetId];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 deployment];
    id v7 = [v6 rolloutId];
    id v8 = [v5 objectForKeyedSubscript:v7];

    id v40 = v3;
    if (v8)
    {
      BOOL v9 = TRILogCategory_Server();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        char v33 = [v3 deployment];
        v34 = [v33 rolloutId];
        v35 = *(void **)(a1 + 32);
        id v36 = [v3 deployment];
        id v37 = [v36 rolloutId];
        id v38 = [v35 objectForKeyedSubscript:v37];
        __int16 v39 = [v3 deployment];
        *(_DWORD *)buf = 138543874;
        id v52 = v34;
        __int16 v53 = 2112;
        v54 = v38;
        __int16 v55 = 1024;
        int v56 = [v39 deploymentId];
        _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Rollout database has conflicting active deployments for rollout %{public}@: (%@, %d)", buf, 0x1Cu);

        id v3 = v40;
      }
    }
    id v10 = NSNumber;
    unsigned int v11 = objc_msgSend(v3, "deployment", v40);
    id v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "deploymentId"));
    id v13 = *(void **)(a1 + 32);
    SEL v14 = [v3 deployment];
    int v15 = [v14 rolloutId];
    [v13 setObject:v12 forKeyedSubscript:v15];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    char v16 = [v3 namespaces];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          id v22 = objc_alloc(MEMORY[0x1E4FB0158]);
          id v23 = [v3 deployment];
          char v24 = [v23 rolloutId];
          BOOL v25 = (void *)[v22 initWithType:0 value:v24];

          id v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:v21];
          if (v26)
          {
            v27 = [*(id *)(a1 + 40) objectForKeyedSubscript:v21];
            __int16 v28 = [v27 arrayByAddingObject:v25];
            [*(id *)(a1 + 40) setObject:v28 forKeyedSubscript:v21];

            id v3 = v41;
          }
          else
          {
            SEL v49 = v25;
            v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
            [*(id *)(a1 + 40) setObject:v27 forKeyedSubscript:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v18);
    }

    id v29 = *(void **)(a1 + 48);
    uint64_t v30 = [v3 activeFactorPackSetId];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_179;
    v43[3] = &unk_1E6BB9BC0;
    void v43[4] = *(void *)(a1 + 56);
    long long v42 = *(_OWORD *)(a1 + 64);
    id v31 = (id)v42;
    long long v44 = v42;
    [v29 enumerateCompatibleFactorPacksForFactorPackSet:v30 usingLegacyPaths:0 withBlock:v43];
  }
  else
  {
    uint64_t v32 = TRILogCategory_Server();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v52 = v3;
      _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Found \"active\" rollout with missing activeFactorPackSetId: %{public}@", buf, 0xCu);
    }
  }
}

void __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      id v8 = [(id)v6 namespaceName];
      uint64_t v9 = [v7 sourceAsFactorPackId];
      goto LABEL_6;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRINamespaceResolverStorage.m", 926, @"Invalid parameter not satisfying: %@", @"pbFactorPack || fbFactorLevel" object file lineNumber description];
  }
  unsigned int v11 = [(id)v5 selectedNamespace];
  id v8 = [v11 name];

  uint64_t v9 = [(id)v5 factorPackId];
LABEL_6:
  id v12 = (void *)v9;
  if (v9)
  {
    if (v8) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRINamespaceResolverStorage.m", 929, @"Invalid parameter not satisfying: %@", @"factorPackId" object file lineNumber description];

    if (v8) {
      goto LABEL_8;
    }
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRINamespaceResolverStorage.m", 930, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_8:
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB0158]) initWithType:0 value:v12];
  SEL v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
  if (v14)
  {
    int v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
    char v16 = [v15 arrayByAddingObject:v13];
    [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:v8];
  }
  else
  {
    v19[0] = v13;
    int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:v8];
  }
}

void __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  unint64_t v5 = [v4 factorPackSetId];

  if (v5)
  {
    unint64_t v6 = [v4 experimentDeployment];
    id v7 = [v6 experimentId];

    id v8 = [v4 experimentDeployment];
    uint64_t v9 = [v8 deploymentId];

    uint64_t v10 = [v4 treatmentId];
    uint64_t v34 = a1;
    unsigned int v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

    if (v11)
    {
      id v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v29 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        *(_DWORD *)buf = 138543874;
        SEL v49 = v7;
        __int16 v50 = 2112;
        v51 = v29;
        __int16 v52 = 1024;
        int v53 = v9;
        _os_log_fault_impl(&dword_1DA291000, v12, OS_LOG_TYPE_FAULT, "Experiment database has conflicting active deployments for experiment %{public}@: (%@, %d)", buf, 0x1Cu);
      }
    }
    id v13 = [NSNumber numberWithInt:v9];
    uint64_t v14 = v34;
    [*(id *)(v34 + 32) setObject:v13 forKeyedSubscript:v7];

    uint64_t v30 = (void *)v10;
    [*(id *)(v34 + 40) setObject:v10 forKeyedSubscript:v7];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v31 = v4;
    id obj = [v4 namespaces];
    uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v35)
    {
      uint64_t v33 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(obj);
          }
          char v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FB0158]) initWithType:2 value:v7];
          uint64_t v18 = *(void **)(v14 + 48);
          uint64_t v19 = [v16 name];
          int v20 = [v18 objectForKeyedSubscript:v19];
          if (v20)
          {
            uint64_t v21 = *(void **)(v14 + 48);
            uint64_t v38 = [v16 name];
            id v37 = objc_msgSend(v21, "objectForKeyedSubscript:");
            uint64_t v22 = [v37 arrayByAddingObject:v17];
            id v36 = (void *)v22;
          }
          else
          {
            long long v46 = v17;
            uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
            uint64_t v22 = v2;
          }
          id v23 = *(void **)(v14 + 48);
          char v24 = [v16 name];
          [v23 setObject:v22 forKeyedSubscript:v24];

          BOOL v25 = (void *)v2;
          if (v20)
          {

            BOOL v25 = (void *)v38;
          }

          uint64_t v14 = v34;
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v35);
    }

    id v26 = *(void **)(v14 + 56);
    uint64_t v4 = v31;
    v27 = [v31 factorPackSetId];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_191;
    v40[3] = &unk_1E6BB9BC0;
    v40[4] = *(void *)(v14 + 64);
    long long v39 = *(_OWORD *)(v14 + 72);
    id v28 = (id)v39;
    long long v41 = v39;
    [v26 enumerateCompatibleFactorPacksForFactorPackSet:v27 usingLegacyPaths:0 withBlock:v40];
  }
  else
  {
    id v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      SEL v49 = v4;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Found \"active\" experiment with missing factorPackSetId: %{public}@", buf, 0xCu);
    }
  }
}

void __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_191(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      id v8 = [(id)v6 namespaceName];
      uint64_t v9 = [v7 sourceAsFactorPackId];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRINamespaceResolverStorage.m", 963, @"Invalid parameter not satisfying: %@", @"pbFactorPack || fbFactorLevel" object file lineNumber description];
  }
  unsigned int v11 = [(id)v5 selectedNamespace];
  id v8 = [v11 name];

  uint64_t v9 = [(id)v5 factorPackId];
LABEL_6:
  id v12 = (void *)v9;
  if (v9)
  {
    if (v8) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRINamespaceResolverStorage.m", 966, @"Invalid parameter not satisfying: %@", @"factorPackId" object file lineNumber description];

    if (v8) {
      goto LABEL_8;
    }
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRINamespaceResolverStorage.m", 967, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_8:
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB0158]) initWithType:2 value:v12];
  uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
  if (v14)
  {
    int v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
    char v16 = [v15 arrayByAddingObject:v13];
    [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:v8];
  }
  else
  {
    v19[0] = v13;
    int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:v8];
  }
}

- (BOOL)overwriteGlobalActiveFactorProvidersWithNamespaceMap:(id)a3 factorPackMap:(id)a4 rolloutDeploymentMap:(id)a5
{
  return [(TRINamespaceResolverStorage *)self _overwriteActiveFactorProvidersUsingGlobalPath:1 withNamespaceMap:a3 rolloutDeploymentMap:a5 experimentDeploymentMap:0 experimentTreatmentMap:0 factorPackMap:a4];
}

- (BOOL)_overwriteActiveFactorProvidersUsingGlobalPath:(BOOL)a3 withNamespaceMap:(id)a4 rolloutDeploymentMap:(id)a5 experimentDeploymentMap:(id)a6 experimentTreatmentMap:(id)a7 factorPackMap:(id)a8
{
  BOOL v12 = a3;
  v69[2] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v54 = a6;
  id v55 = a7;
  id v16 = a8;
  paths = self->_paths;
  id v18 = a4;
  uint64_t v19 = [(TRIPaths *)paths namespaceDescriptorsDirUsingGlobal:v12];
  int v20 = v19;
  if (v12) {
    uint64_t v21 = @"v2/globalActiveFactorProviders.plplist";
  }
  else {
    uint64_t v21 = @"v2/activeFactorProviders.plplist";
  }
  uint64_t v22 = [v19 stringByAppendingPathComponent:v21];

  int v53 = v22;
  v51 = [v22 stringByDeletingLastPathComponent];
  objc_msgSend(MEMORY[0x1E4F28CB8], "triIdempotentCreateDirectoryOrFaultWithPath:");
  id v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v18, "count"));
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __177__TRINamespaceResolverStorage__overwriteActiveFactorProvidersUsingGlobalPath_withNamespaceMap_rolloutDeploymentMap_experimentDeploymentMap_experimentTreatmentMap_factorPackMap___block_invoke;
  v59[3] = &unk_1E6BB9C38;
  SEL v61 = a2;
  v59[4] = self;
  id v24 = v23;
  id v60 = v24;
  [v18 enumerateKeysAndObjectsUsingBlock:v59];

  v68[0] = @"namespaceMap";
  v68[1] = @"rolloutV2Deployments";
  v69[0] = v24;
  v69[1] = v15;
  __int16 v52 = v15;
  BOOL v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
  id v26 = (void *)[v25 mutableCopy];

  if (_os_feature_enabled_impl())
  {
    if (v54 && [v54 count]) {
      [v26 setObject:v54 forKeyedSubscript:@"experimentDeployments"];
    }
    if (v55 && [v55 count]) {
      [v26 setObject:v55 forKeyedSubscript:@"experimentTreatments"];
    }
  }
  if (v16)
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v16, "count"));
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __177__TRINamespaceResolverStorage__overwriteActiveFactorProvidersUsingGlobalPath_withNamespaceMap_rolloutDeploymentMap_experimentDeploymentMap_experimentTreatmentMap_factorPackMap___block_invoke_2;
    v57[3] = &unk_1E6BB9C60;
    id v58 = v27;
    id v28 = v27;
    [v16 enumerateKeysAndObjectsUsingBlock:v57];
    [v26 setObject:v28 forKeyedSubscript:@"namespaceFactorPackMap"];
  }
  if (v12)
  {
    id v29 = NSTemporaryDirectory();
    uint64_t v30 = objc_opt_new();
    id v31 = [v30 UUIDString];
    uint64_t v32 = [v29 stringByAppendingPathComponent:v31];
  }
  else
  {
    uint64_t v32 = [(TRIPaths *)self->_paths localTempDir];
  }
  uint64_t v33 = [[TRITempDirScopeGuard alloc] initWithPath:v32];
  uint64_t v34 = v33;
  if (v33)
  {
    uint64_t v35 = [(TRITempDirScopeGuard *)v33 path];
    id v36 = [NSString alloc];
    id v37 = objc_opt_new();
    uint64_t v38 = [v37 UUIDString];
    long long v39 = (void *)[v36 initWithFormat:@"plplist-%@", v38];
    id v40 = [v35 stringByAppendingPathComponent:v39];

    id v56 = 0;
    long long v41 = [MEMORY[0x1E4F93B50] fileBackedDataWithPropertyList:v26 writtenToPath:v40 error:&v56];
    id v42 = v56;
    if (v41)
    {
      uint64_t v22 = v53;
      if ([MEMORY[0x1E4F28CB8] triRemoveFileProtectionIfPresentForPath:v40])
      {
        id v43 = v40;
        if (!chmod((const char *)[v43 fileSystemRepresentation], 0x124u))
        {
          char v44 = [MEMORY[0x1E4F28CB8] triRenameOrFaultWithSourcePath:v43 destPath:v53];
          goto LABEL_28;
        }
        log = TRILogCategory_Server();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          long long v47 = __error();
          long long v48 = strerror(*v47);
          int v49 = *__error();
          *(_DWORD *)buf = 138543874;
          id v63 = v43;
          __int16 v64 = 2080;
          v65 = v48;
          uint64_t v22 = v53;
          __int16 v66 = 1024;
          int v67 = v49;
          _os_log_error_impl(&dword_1DA291000, log, OS_LOG_TYPE_ERROR, "Failed to set permissions on plplist %{public}@: %s (%d))", buf, 0x1Cu);
        }
      }
    }
    else
    {
      long long v45 = TRILogCategory_Server();
      uint64_t v22 = v53;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v63 = v42;
        _os_log_error_impl(&dword_1DA291000, v45, OS_LOG_TYPE_ERROR, "Failed to write plplist: %{public}@", buf, 0xCu);
      }
    }
    char v44 = 0;
LABEL_28:

    goto LABEL_29;
  }
  char v44 = 0;
LABEL_29:

  return v44;
}

void __177__TRINamespaceResolverStorage__overwriteActiveFactorProvidersUsingGlobalPath_withNamespaceMap_rolloutDeploymentMap_experimentDeploymentMap_experimentTreatmentMap_factorPackMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = a1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v4 = a3;
  unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "type", v18);
        if (v12 == 2)
        {
          v24[0] = @"experiment";
          id v13 = [v11 value];
          v24[1] = v13;
          uint64_t v14 = v24;
        }
        else
        {
          if (v12) {
            continue;
          }
          v25[0] = @"rolloutV2";
          id v13 = [v11 value];
          v25[1] = v13;
          uint64_t v14 = v25;
        }
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  uint64_t v16 = [v5 count];
  if (v16 != [v6 count])
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(v18 + 48) object:*(void *)(v18 + 32) file:@"TRINamespaceResolverStorage.m" lineNumber:1043 description:@"unhandled factor provider type"];
  }
  objc_msgSend(*(id *)(v18 + 40), "setObject:forKeyedSubscript:", v5, v19, v18);
}

void __177__TRINamespaceResolverStorage__overwriteActiveFactorProvidersUsingGlobalPath_withNamespaceMap_rolloutDeploymentMap_experimentDeploymentMap_experimentTreatmentMap_factorPackMap___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  memset(v8, 0, sizeof(v8));
  if ([a3 countByEnumeratingWithState:v8 objects:v9 count:16])
  {
    uint64_t v6 = [**((id **)&v8[0] + 1) value];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
    }
  }
}

- (BOOL)_setProvisionalFactorpackMetadata:(id)a3 forNamespaceName:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__12;
  void v35[4] = __Block_byref_object_dispose__12;
  id v36 = 0;
  if (a5)
  {
    id v10 = *a5;
    *a5 = 0;
  }
  unsigned int v11 = [MEMORY[0x1E4FB01D0] promotionDirForNamespaceName:v9 withPaths:self->_paths];
  int v12 = [TRITempDirScopeGuard alloc];
  id v13 = [(TRIPaths *)self->_paths localTempDir];
  uint64_t v14 = [(TRITempDirScopeGuard *)v12 initWithPath:v13];

  if (v14)
  {
    id v15 = [(TRITempDirScopeGuard *)v14 path];
    id v16 = [NSString alloc];
    uint64_t v17 = objc_opt_new();
    uint64_t v18 = [v17 UUIDString];
    id v19 = (void *)[v16 initWithFormat:@"fp-provisional-%@", v18];
    long long v20 = [v15 stringByAppendingPathComponent:v19];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __88__TRINamespaceResolverStorage__setProvisionalFactorpackMetadata_forNamespaceName_error___block_invoke;
    v29[3] = &unk_1E6BB9C88;
    id v30 = v11;
    id v21 = v20;
    id v31 = v21;
    id v22 = v8;
    id v32 = v22;
    uint64_t v34 = v35;
    id v23 = v9;
    id v33 = v23;
    char v24 = __88__TRINamespaceResolverStorage__setProvisionalFactorpackMetadata_forNamespaceName_error___block_invoke((uint64_t)v29);
    BOOL v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v25 triForceRemoveItemAtPath:v21 error:0];

    if ((v24 & 1) == 0)
    {
      id v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v28 = [v22 factorPackId];
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v28;
        __int16 v39 = 2114;
        id v40 = v23;
        _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Failed to set factor pack %{public}@ as provisional for namespace %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    char v24 = 0;
  }

  _Block_object_dispose(v35, 8);
  return v24;
}

uint64_t __88__TRINamespaceResolverStorage__setProvisionalFactorpackMetadata_forNamespaceName_error___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v2 = *(void *)(a1 + 40);
  v42[0] = *(void *)(a1 + 32);
  v42[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:*(void *)(*((void *)&v30 + 1) + 8 * v7)])
        {
          uint64_t v15 = 0;
          goto LABEL_22;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v43 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v3 = [*(id *)(a1 + 40) stringByAppendingPathComponent:@"provisional.pb"];
  id v8 = [*(id *)(a1 + 32) stringByAppendingPathComponent:@"provisional.pb"];
  id v9 = [*(id *)(a1 + 48) data];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v10 + 40);
  char v11 = [v9 writeToFile:v3 options:0x10000000 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);

  if (v11)
  {
    if ([MEMORY[0x1E4F28CB8] triRenameOrFaultWithSourcePath:v3 destPath:v8])
    {
      int v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [*(id *)(a1 + 48) factorPackId];
        uint64_t v14 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        id v37 = v13;
        __int16 v38 = 2114;
        uint64_t v39 = v14;
        _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Set factor pack %{public}@ as provisional for namespace %{public}@", buf, 0x16u);
      }
      uint64_t v15 = 1;
      goto LABEL_21;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v34 = *MEMORY[0x1E4F28568];
    int v12 = [[NSString alloc] initWithFormat:@"Failed to rename %@ to %@", v3, v8];
    uint64_t v35 = v12;
    char v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v25 = [v23 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v24];
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F28568];
      uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to write %@", v3];
      uint64_t v41 = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      uint64_t v19 = [v16 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v18];
      uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
    int v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v37 = v3;
      __int16 v38 = 2114;
      uint64_t v39 = v22;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed write \"%{public}@\": %{public}@", buf, 0x16u);
    }
  }
  uint64_t v15 = 0;
LABEL_21:

LABEL_22:
  return v15;
}

- (id)_getProvisionalFactorpackMetadataForNamespaceName:(id)a3 mustExist:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5)
  {
    id v9 = *a5;
    *a5 = 0;
  }
  uint64_t v10 = [MEMORY[0x1E4FB01D0] promotionDirForNamespaceName:v8 withPaths:self->_paths];
  char v11 = [v10 stringByAppendingPathComponent:@"provisional.pb"];

  int v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v13 = [v12 fileExistsAtPath:v11];

  if (v13)
  {
    id v23 = 0;
    uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v11 options:0 error:&v23];
    id v15 = v23;
    if (v14)
    {
      id v22 = v15;
      id v16 = [MEMORY[0x1E4FB0608] parseFromData:v14 error:&v22];
      id v17 = v22;

      if (v16)
      {
        uint64_t v18 = v16;
        uint64_t v19 = v18;
      }
      else
      {
        uint64_t v20 = TRILogCategory_Server();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v25 = v11;
          __int16 v26 = 2114;
          id v27 = v8;
          __int16 v28 = 2114;
          id v29 = v17;
          _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Error parsing provisional file \"%{public}@\" for namespace \"%{public}@\": %{public}@", buf, 0x20u);
        }

        uint64_t v18 = 0;
        uint64_t v19 = 0;
      }
    }
    else
    {
      uint64_t v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v25 = v11;
        __int16 v26 = 2114;
        id v27 = v8;
        __int16 v28 = 2114;
        id v29 = v15;
        _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Error opening provisional file \"%{public}@\" for namespace \"%{public}@\": %{public}@", buf, 0x20u);
      }
      uint64_t v19 = 0;
      id v17 = v15;
    }
  }
  else
  {
    if (!v6)
    {
      id v17 = 0;
      uint64_t v19 = 0;
      goto LABEL_20;
    }
    uint64_t v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Provisional file \"%{public}@\" for namespace \"%{public}@\" does not exist", buf, 0x16u);
    }
    id v17 = 0;
    uint64_t v19 = 0;
  }

LABEL_20:
  return v19;
}

- (BOOL)setProvisionalFactorPackId:(id)a3 forNamespaceName:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4FB0608]);
  [v10 setFactorPackId:v8];
  [v10 setAttempts:1];
  char v11 = [(TRINamespaceResolverStorage *)self _getProvisionalFactorpackMetadataForNamespaceName:v9 mustExist:0 error:0];
  int v12 = v11;
  if (v11 && [v11 hasFactorPackId])
  {
    char v13 = [v12 factorPackId];
    if ([v13 isEqualToString:v8])
    {
      int v14 = [v12 hasAttempts];

      if (v14) {
        objc_msgSend(v10, "setAttempts:", objc_msgSend(v10, "attempts") + objc_msgSend(v12, "attempts"));
      }
    }
    else
    {
    }
  }
  BOOL v15 = [(TRINamespaceResolverStorage *)self _setProvisionalFactorpackMetadata:v10 forNamespaceName:v9 error:a5];
  if (v15)
  {
    id v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      id v19 = v8;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Set factor pack %{public}@ as provisional for namespace %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
  return v15;
}

- (BOOL)rejectFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v24 = 0;
  if (a6)
  {
    id v13 = *a6;
    *a6 = 0;
  }
  int v14 = [(TRINamespaceResolverStorage *)self _getProvisionalFactorpackMetadataForNamespaceName:v11 mustExist:1 error:&v24];
  BOOL v15 = v14;
  if (v14)
  {
    if ([v14 hasFactorPackId])
    {
      id v16 = [v15 factorPackId];
      char v17 = [v16 isEqualToString:v10];

      if (v17)
      {
        if ([v15 hasRejected] && objc_msgSend(v15, "rejected"))
        {
          int v18 = TRILogCategory_Server();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
LABEL_22:
            BOOL v22 = 1;
            goto LABEL_16;
          }
          *(_DWORD *)buf = 138543618;
          id v26 = v10;
          __int16 v27 = 2114;
          id v28 = v11;
          id v19 = "Skipping setting factor pack %{public}@ as rejected for namespace %{public}@ as it is already set";
        }
        else
        {
          [v15 setRejected:1];
          if (![(TRINamespaceResolverStorage *)self _setProvisionalFactorpackMetadata:v15 forNamespaceName:v11 error:a6])
          {
            BOOL v22 = 0;
            goto LABEL_17;
          }
          int v18 = TRILogCategory_Server();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 138543618;
          id v26 = v10;
          __int16 v27 = 2114;
          id v28 = v11;
          id v19 = "Set factor pack %{public}@ as rejected for namespace %{public}@";
        }
        _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
        goto LABEL_22;
      }
    }
    int v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = [v15 hasFactorPackId];
      if (v20)
      {
        id v21 = [v15 factorPackId];
      }
      else
      {
        id v21 = &stru_1F3455898;
      }
      *(_DWORD *)buf = 138543874;
      id v26 = v10;
      __int16 v27 = 2114;
      id v28 = v11;
      __int16 v29 = 2114;
      uint64_t v30 = v21;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Can't reject factorpack \"%{public}@\" when currently provisional factorpack for namespace \"%{public}@\" is \"%{public}@\"", buf, 0x20u);
      if (v20) {
    }
      }
  }
  else
  {
    int v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = v11;
      __int16 v27 = 2114;
      id v28 = v24;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to get provisional file for namespace \"%{public}@\": %{public}@", buf, 0x16u);
    }
  }
  BOOL v22 = 0;
LABEL_16:

LABEL_17:
  return v22;
}

- (BOOL)promoteFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v60 = a5;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__12;
  v75 = __Block_byref_object_dispose__12;
  id v76 = 0;
  if (a6)
  {
    id v13 = *a6;
    *a6 = 0;
  }
  int v14 = [[TRIFactorPackStorage alloc] initWithPaths:self->_paths];
  *((void *)&v62 + 1) = [(TRIFactorPackStorage *)v14 pathForFactorPackWithId:v11 namespaceName:v12];
  v59 = v14;
  *(void *)&long long v62 = [(TRIFactorPackStorage *)v14 legacyPathForFactorPackWithId:v11 namespaceName:v12];
  if (_os_feature_enabled_impl())
  {
    BOOL v15 = [[TRIFBFactorPackStorage alloc] initWithPaths:self->_paths];
    id v16 = [(TRIFBFactorPackStorage *)v15 pathForFactorLevelsWithFactorPackId:v11 namespaceName:v12];
    char v17 = [(TRIFBFactorPackStorage *)v15 legacyPathForFactorLevelsWithFactorPackId:v11 namespaceName:v12];
    int v18 = 0;
    if (*((void *)&v62 + 1) && v16) {
      int v18 = [*((id *)&v62 + 1) isEqualToString:v16];
    }
    char v19 = 0;
    if (void)v62 && v17 && (int v20 = [(id)v62 isEqualToString:v17], v19 = v20, (v18 & v20))
    {
      if (!_os_feature_enabled_impl())
      {
LABEL_20:

        goto LABEL_21;
      }
      id v21 = v16;

      BOOL v22 = v62;
      *(void *)&long long v62 = v17;
      *((void *)&v62 + 1) = v21;
    }
    else
    {
      if ((v18 & 1) == 0)
      {
        id v23 = TRILogCategory_Server();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v82 = v11;
          __int16 v83 = 2112;
          id v84 = (id)*((void *)&v62 + 1);
          __int16 v85 = 2112;
          v86 = v16;
          _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "pb and factor paths do not match for factor pack id:%@, pb path:%@, fb path:%@", buf, 0x20u);
        }
      }
      if (v19) {
        goto LABEL_20;
      }
      BOOL v22 = TRILogCategory_Server();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v82 = v11;
        __int16 v83 = 2112;
        id v84 = (id)v62;
        __int16 v85 = 2112;
        v86 = v17;
        _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "pb and  factor paths do not match for factor pack id:%@, pb path:%@, fb path:%@", buf, 0x20u);
      }
    }

    goto LABEL_20;
  }
LABEL_21:
  if (v62 == 0)
  {
    id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v79 = *MEMORY[0x1E4F28568];
    SEL v61 = (void *)[[NSString alloc] initWithFormat:@"FactorPackId %@ unknown", v11];
    v80 = v61;
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    uint64_t v37 = [v36 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v28];
    char v35 = 0;
    id v31 = (id)v72[5];
    v72[5] = v37;
    goto LABEL_47;
  }
  id v24 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  uint64_t v25 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", @"v2/promotion", v12];
  SEL v61 = [v24 stringByAppendingPathComponent:v25];

  id v26 = [v61 stringByAppendingPathComponent:@"promoted"];
  __int16 v27 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v28 = v26;
  if (!v28)
  {
    uint64_t v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 1363, @"Expression was unexpectedly nil/false: %@", @"existingPromotedPath" object file lineNumber description];
  }
  int v29 = [v27 fileExistsAtPath:v28];

  if (!v29)
  {
LABEL_34:
    __int16 v38 = (void *)*((void *)&v62 + 1);
    if (!*((void *)&v62 + 1)) {
      __int16 v38 = (void *)v62;
    }
    id v31 = v38;
    id v58 = (void *)[objc_alloc(MEMORY[0x1E4FB0218]) initWithDir:v31];
    if (v58)
    {
      uint64_t v39 = [TRITempDirScopeGuard alloc];
      uint64_t v40 = [(TRIPaths *)self->_paths localTempDir];
      uint64_t v41 = [(TRITempDirScopeGuard *)v39 initWithPath:v40];

      if (!v41)
      {
        char v35 = 0;
        goto LABEL_46;
      }
      id v42 = [(TRITempDirScopeGuard *)v41 path];
      id v43 = [NSString alloc];
      uint64_t v44 = objc_opt_new();
      long long v45 = [v44 UUIDString];
      long long v46 = (void *)[v43 initWithFormat:@"fp-promotion-%@", v45];
      long long v47 = [v42 stringByAppendingPathComponent:v46];

      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke;
      v63[3] = &unk_1E6BB9CD8;
      id v64 = v61;
      id v48 = v47;
      id v65 = v48;
      v70 = &v71;
      id v66 = *((id *)&v62 + 1);
      id v67 = (id)v62;
      id v49 = v11;
      id v68 = v49;
      id v50 = v12;
      id v69 = v50;
      char v35 = __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke((uint64_t)v63);
      v51 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v51 triForceRemoveItemAtPath:v48 error:0];

      [v58 unlock];
      if ((v35 & 1) == 0)
      {
        __int16 v52 = TRILogCategory_Server();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v82 = v49;
          __int16 v83 = 2114;
          id v84 = v50;
          _os_log_error_impl(&dword_1DA291000, v52, OS_LOG_TYPE_ERROR, "Failed to promote factor pack %{public}@ for namespace %{public}@", buf, 0x16u);
        }
      }
      int v53 = v64;
    }
    else
    {
      id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v77 = *MEMORY[0x1E4F28568];
      uint64_t v41 = (TRITempDirScopeGuard *)[[NSString alloc] initWithFormat:@"Failed to lock %@", v31];
      v78 = v41;
      id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      uint64_t v55 = [v54 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v48];
      char v35 = 0;
      int v53 = (void *)v72[5];
      v72[5] = v55;
    }

LABEL_46:
    goto LABEL_47;
  }
  uint64_t v30 = [v28 triStringByResolvingSymlinksInPath];
  id v31 = v30;
  if (!v30)
  {
LABEL_33:

    goto LABEL_34;
  }
  long long v32 = [v30 lastPathComponent];
  long long v33 = TRIValidateFactorPackId();

  if (!v33 || ![v33 isEqualToString:v11])
  {

    goto LABEL_33;
  }
  uint64_t v34 = TRILogCategory_Server();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v82 = v11;
    __int16 v83 = 2114;
    id v84 = v12;
    _os_log_impl(&dword_1DA291000, v34, OS_LOG_TYPE_DEFAULT, "Skipping promotion of factor pack %{public}@ for namespace %{public}@ as it is already promoted", buf, 0x16u);
  }

  char v35 = 1;
LABEL_47:

  _Block_object_dispose(&v71, 8);
  return v35;
}

uint64_t __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v2 = *(void *)(a1 + 40);
  v38[0] = *(void *)(a1 + 32);
  v38[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if (![MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v8])
        {
          id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F28568];
          int v18 = (void *)[[NSString alloc] initWithFormat:@"Failed to create %@", v8];
          uint64_t v37 = v18;
          char v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          uint64_t v20 = [v17 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v19];
          uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
          BOOL v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = v20;

          uint64_t v16 = 0;
          goto LABEL_19;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v39 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2;
  v24[3] = &unk_1E6BB9CB0;
  id v25 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 80);
  id v26 = v9;
  uint64_t v27 = v10;
  uint64_t v11 = MEMORY[0x1E016EA80](v24);
  id v12 = (unsigned int (**)(void, void))v11;
  if (*(void *)(a1 + 48)
    && !(*(unsigned int (**)(uint64_t, __CFString *))(v11 + 16))(v11, @"promoted")
    || *(void *)(a1 + 56)
    && !((unsigned int (**)(void, __CFString *))v12)[2](v12, @"legacyPromoted"))
  {
    uint64_t v16 = 0;
  }
  else
  {
    id v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v15 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v14;
      __int16 v34 = 2114;
      uint64_t v35 = v15;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Promoted factor pack %{public}@ for namespace %{public}@", buf, 0x16u);
    }

    uint64_t v16 = 1;
  }

  id v3 = v25;
LABEL_19:

  return v16;
}

uint64_t __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 stringByAppendingPathComponent:v7];
  id v9 = [*(id *)(a1 + 40) stringByAppendingPathComponent:v7];

  if (+[TRIReferenceManagedDir symlinkFromCurrentPath:v8 withFuturePath:v9 toManagedPath:v5])
  {
    uint64_t v10 = [MEMORY[0x1E4F28CB8] triRenameOrFaultWithSourcePath:v8 destPath:v9];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F28568];
    id v12 = (void *)[[NSString alloc] initWithFormat:@"Failed to symlink to %@ for %@ from %@", v8, v9, v5, v18];
    v19[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v14 = [v11 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)removeUnneededPromotionsWithRemovedCount:(unsigned int *)a3 removeAll:(BOOL)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E016E7F0]();
  __int16 v34 = self;
  uint64_t v6 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  uint64_t v7 = [v6 stringByAppendingPathComponent:@"v2/promotion"];

  LOBYTE(v8) = 1;
  uint64_t v35 = (void *)v7;
  uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:1];
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v39 = *MEMORY[0x1E4F1C628];
  v51[0] = *MEMORY[0x1E4F1C628];
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  long long v32 = (void *)v9;
  id v12 = [v10 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:v11 options:0 error:0];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    SEL v31 = a2;
    uint64_t v15 = *(void *)v43;
    int v8 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x1E016E7F0]();
        id v40 = 0;
        id v41 = 0;
        char v19 = [v17 getResourceValue:&v41 forKey:v39 error:&v40];
        id v20 = v41;
        id v21 = v40;
        if ((v19 & 1) == 0)
        {
          long long v29 = TRILogCategory_Server();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            long long v47 = v17;
            __int16 v48 = 2114;
            id v49 = v21;
            _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Failed to determine if %{public}@ is a directory: %{public}@", buf, 0x16u);
          }

          LOBYTE(v8) = 0;
          goto LABEL_25;
        }
        if ([v20 BOOLValue])
        {
          BOOL v22 = [v17 lastPathComponent];
          if (!v22)
          {
            long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
            [v28 handleFailureInMethod:v31, v34, @"TRINamespaceResolverStorage.m", 1480, @"Expression was unexpectedly nil/false: %@", @"dirEntry.lastPathComponent" object file lineNumber description];
          }
          if (a4
            || ([MEMORY[0x1E4FB01B0] factorProviderWithPaths:v34->_paths namespaceName:v22],
                id v23 = objc_claimAutoreleasedReturnValue(),
                [v23 providerForTreatmentLayer:2],
                id v24 = objc_claimAutoreleasedReturnValue(),
                v24,
                v23,
                !v24))
          {
            id v25 = TRILogCategory_Server();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              long long v47 = v22;
              _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Removing promotion dir for %{public}@", buf, 0xCu);
            }

            id v26 = [v35 stringByAppendingPathComponent:v22];
            uint64_t v27 = [MEMORY[0x1E4F28CB8] defaultManager];
            v8 &= [v27 triForceRemoveItemAtPath:v26 error:0];

            if (a3 && v8) {
              ++*a3;
            }
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  return v8 & 1;
}

- (BOOL)rewriteBMLTDeployment:(id)a3 targetedFactorPackSetId:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 1509, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  uint64_t v9 = [v7 backgroundMLTaskId];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    if (!v8)
    {
      uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 1511, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];
    }
    id v11 = [[TRIFactorPackSetStorage alloc] initWithPaths:self->_paths];
    id v40 = 0;
    if ([(TRIFactorPackSetStorage *)v11 hasFactorPackSetWithId:v8 path:&v40])
    {
      if (!v40)
      {
        uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 1521, @"Invalid parameter not satisfying: %@", @"factorPackSetPath" object file lineNumber description];
      }
      id v12 = objc_alloc(MEMORY[0x1E4FB0218]);
      uint64_t v13 = [v12 initWithDir:v40];
      if (v13)
      {
        uint64_t v14 = [TRITempDirScopeGuard alloc];
        uint64_t v15 = [(TRIPaths *)self->_paths localTempDir];
        uint64_t v16 = [(TRITempDirScopeGuard *)v14 initWithPath:v15];

        if (!v16)
        {
          char v24 = 0;
LABEL_26:

          [v13 unlock];
          goto LABEL_27;
        }
        uint64_t v39 = [(TRINamespaceResolverStorage *)self pathForBMLTDeployment:v7];
        if (v39)
        {
          id v17 = [(TRITempDirScopeGuard *)v16 path];
          id v18 = [NSString alloc];
          char v19 = objc_opt_new();
          id v20 = [v19 UUIDString];
          id v21 = (void *)[v18 initWithFormat:@"targeting-link-%@", v20];
          BOOL v22 = [v17 stringByAppendingPathComponent:v21];

          id v23 = [v39 stringByAppendingPathComponent:@"targetedFactorPackSet"];
          if (+[TRIReferenceManagedDir symlinkFromCurrentPath:v22 withFuturePath:v23 toManagedPath:v40])
          {
LABEL_13:
            char v24 = [MEMORY[0x1E4F28CB8] triRenameOrFaultWithSourcePath:v22 destPath:v23];
LABEL_25:

            goto LABEL_26;
          }
        }
        else
        {
          __int16 v38 = [(TRITempDirScopeGuard *)v16 path];
          id v25 = [NSString alloc];
          id v26 = objc_opt_new();
          uint64_t v27 = [v26 UUIDString];
          long long v28 = (void *)[v25 initWithFormat:@"new-deployment-%@", v27];
          BOOL v22 = [v38 stringByAppendingPathComponent:v28];

          id v23 = [(TRINamespaceResolverStorage *)self _pathForBMLTDeployment:v7];
          if (v23)
          {
            [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v22];
            long long v29 = (void *)MEMORY[0x1E4F28CB8];
            long long v30 = [v23 stringByDeletingLastPathComponent];
            [v29 triIdempotentCreateDirectoryOrFaultWithPath:v30];

            SEL v31 = [v22 stringByAppendingPathComponent:@"targetedFactorPackSet"];
            long long v32 = [v23 stringByAppendingPathComponent:@"targetedFactorPackSet"];
            LOBYTE(v29) = +[TRIReferenceManagedDir symlinkFromCurrentPath:v31 withFuturePath:v32 toManagedPath:v40];

            if (v29)
            {
              if (+[TRIReferenceManagedDir createFromDir:v22]) {
                goto LABEL_13;
              }
            }
          }
        }
        char v24 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = [v7 shortDesc];
        *(_DWORD *)buf = 138543618;
        long long v42 = v34;
        __int16 v43 = 2114;
        id v44 = v8;
        _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unable to update BMLT %{public}@; targeted factor pack set %{public}@ is missing.",
          buf,
          0x16u);
      }
    }
    char v24 = 0;
LABEL_27:

    goto LABEL_28;
  }
  TRILogCategory_Server();
  id v11 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    long long v42 = "-[TRINamespaceResolverStorage rewriteBMLTDeployment:targetedFactorPackSetId:]";
    _os_log_error_impl(&dword_1DA291000, &v11->super, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.backgroundMLTaskId", buf, 0xCu);
  }
  char v24 = 0;
LABEL_28:

  return v24 & 1;
}

- (id)parentDirForBMLTDeployments
{
  id v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  uint64_t v4 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  id v5 = [v4 stringByAppendingPathComponent:@"v2/bmlt"];

  return v5;
}

- (id)_pathForBMLTDeployment:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 1585, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  uint64_t v6 = [v5 backgroundMLTaskId];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v9 = [(TRINamespaceResolverStorage *)self parentDirForBMLTDeployments];
    id v10 = [NSString alloc];
    id v11 = [v5 backgroundMLTaskId];
    id v12 = (void *)[v10 initWithFormat:@"%@/%d", v11, objc_msgSend(v5, "deploymentId")];
    uint64_t v13 = [v9 stringByAppendingPathComponent:v12];
  }
  else
  {
    uint64_t v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[TRINamespaceResolverStorage _pathForBMLTDeployment:]";
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.backgroundMLTaskId", buf, 0xCu);
    }

    uint64_t v13 = 0;
  }

  return v13;
}

- (id)pathForBMLTDeployment:(id)a3
{
  id v3 = [(TRINamespaceResolverStorage *)self _pathForBMLTDeployment:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v4 fileExistsAtPath:v3]) {
      id v5 = v3;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)pathForTargetedFactorPackSetWithTaskDeployment:(id)a3
{
  id v3 = [(TRINamespaceResolverStorage *)self pathForBMLTDeployment:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 stringByAppendingPathComponent:@"targetedFactorPackSet"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_removeUnreferencedBMLTDeploymentsWithRefStore:(id)a3 topLevelDir:(id)a4 removedCount:(unsigned int *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
  uint64_t v13 = [v11 enumeratorAtURL:v12 includingPropertiesForKeys:0 options:1 errorHandler:0];

  uint64_t v14 = objc_opt_new();
  uint64_t v15 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v16 = [v13 nextObject];
  if (v16)
  {
    id v17 = (void *)v16;
    SEL v23 = a2;
    do
    {
      id v18 = [v17 path];
      if (!v18)
      {
        BOOL v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:v23, self, @"TRINamespaceResolverStorage.m", 1625, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
      }
      [v14 addString:v18];

      uint64_t v15 = (void *)MEMORY[0x1E016E7F0]();
      id v17 = [v13 nextObject];
    }
    while (v17);
  }
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __103__TRINamespaceResolverStorage__removeUnreferencedBMLTDeploymentsWithRefStore_topLevelDir_removedCount___block_invoke;
  v24[3] = &unk_1E6BB9B98;
  id v26 = &v28;
  void v24[4] = self;
  id v19 = v9;
  id v25 = v19;
  uint64_t v27 = a5;
  if ([v14 enumerateStringsWithBlock:v24]) {
    BOOL v20 = *((unsigned char *)v29 + 24) != 0;
  }
  else {
    BOOL v20 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v20;
}

uint64_t __103__TRINamespaceResolverStorage__removeUnreferencedBMLTDeploymentsWithRefStore_topLevelDir_removedCount___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _removeUnreferencedDeploymentsWithRefStore:*(void *)(a1 + 40) parentDir:a2 removedCount:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = result;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

- (BOOL)_removeUnreferencedBMLTDeploymentsWithRefStore:(id)a3 parentDir:(id)a4 removedCount:(unsigned int *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
  uint64_t v13 = [v11 enumeratorAtURL:v12 includingPropertiesForKeys:0 options:1 errorHandler:0];

  uint64_t v14 = objc_opt_new();
  uint64_t v15 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v16 = [v13 nextObject];
  if (v16)
  {
    id v17 = (void *)v16;
    do
    {
      id v18 = [v17 path];
      if (!v18)
      {
        char v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2, self, @"TRINamespaceResolverStorage.m", 1654, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
      }
      [v14 addString:v18];

      uint64_t v15 = (void *)MEMORY[0x1E016E7F0]();
      id v17 = [v13 nextObject];
    }
    while (v17);
  }
  id v19 = [TRITempDirScopeGuard alloc];
  BOOL v20 = [(TRIPaths *)self->_paths localTempDir];
  id v21 = [(TRITempDirScopeGuard *)v19 initWithPath:v20];

  if (v21)
  {
    uint64_t v30 = 0;
    char v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __101__TRINamespaceResolverStorage__removeUnreferencedBMLTDeploymentsWithRefStore_parentDir_removedCount___block_invoke;
    v25[3] = &unk_1E6BB9B98;
    uint64_t v28 = &v30;
    id v26 = v9;
    uint64_t v27 = v21;
    long long v29 = a5;
    int v22 = [v14 enumerateStringsWithBlock:v25];
    rmdir((const char *)[v10 fileSystemRepresentation]);
    if (v22) {
      LOBYTE(v22) = *((unsigned char *)v31 + 24) != 0;
    }

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

void __101__TRINamespaceResolverStorage__removeUnreferencedBMLTDeploymentsWithRefStore_parentDir_removedCount___block_invoke(uint64_t a1, void *a2)
{
  char v10 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 path];
  BOOL v7 = +[TRIReferenceManagedDir collectGarbageForManagedDir:v5 withExternalReferenceStore:v3 usingTempDir:v6 managedDirWasDeleted:&v10];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    BOOL v9 = v7;
  }
  else {
    BOOL v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;

  if (v10) {
    ++**(_DWORD **)(a1 + 56);
  }
}

- (BOOL)removeUnreferencedBMLTDeploymentsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v6 = a3;
  BOOL v7 = [[TRIBMLTDeploymentRefStore alloc] initWithServerContext:v6];

  unsigned int v11 = 0;
  uint64_t v8 = [(TRINamespaceResolverStorage *)self parentDirForBMLTDeployments];
  BOOL v9 = [(TRINamespaceResolverStorage *)self _removeUnreferencedDeploymentsWithRefStore:v7 topLevelDir:v8 removedCount:&v11];

  if (a4) {
    *a4 = v11;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end