@interface TRINamespaceResolver
+ (id)_namespacePathComponentsFromEntitlements;
+ (id)preferredPathForFactorDataWithCandidatePaths:(id)a3;
+ (id)promotionDirForNamespaceName:(id)a3 withPaths:(id)a4;
- (BOOL)_hasBMLTFactorsState;
- (BOOL)_hasExperimentFactorsState;
- (BOOL)_hasRolloutFactorsState;
- (BOOL)_prepareFactorsState:(id)a3;
- (BOOL)_prepareFactorsStateForExperimentsOnFactorPackSetPathForDeployment:(id)a3;
- (BOOL)_prepareFactorsStateForExperimentsOnTreatmentPathForDeployment:(id)a3;
- (NSSet)namespacesInFactorsState;
- (TRIActiveFactorProvidersParser)activeFactorProvidersParser;
- (TRIBMLTDeployment)bmltDeploymentForFactorsState;
- (TRIExperimentDeployment)experimentDeploymentForFactorsState;
- (TRINamespaceResolver)initWithPaths:(id)a3;
- (TRINamespaceResolver)initWithPaths:(id)a3 activeFactorProvidersParser:(id)a4;
- (TRINamespaceResolver)initWithPaths:(id)a3 factorsState:(id)a4;
- (TRINamespaceResolver)initWithPaths:(id)a3 factorsState:(id)a4 activeFactorProvidersParser:(id)a5;
- (TRIRolloutDeployment)rolloutDeploymentForFactorsState;
- (char)_realpathWithFileSystemRepresentation:(const char *)a3 buffer:(char *)a4;
- (id)_factorProviderForNamespaceName:(id)a3 fromNamespaceDescriptorSetWithDir:(id)a4 resolvedPath:(id *)a5;
- (id)_resolveTargetedFactorPackSetForBMLTDeployment:(id)a3;
- (id)_resolveTargetedNamespaceDescriptorSetForExperimentDeployment:(id)a3;
- (id)resolveFactorProviderChainForNamespaceName:(id)a3 faultOnMissingInstalledFactors:(BOOL)a4 installedFactorsAccessible:(BOOL *)a5;
- (void)_faultOnceWithMessage:(id)a3;
- (void)dealloc;
- (void)dispose;
@end

@implementation TRINamespaceResolver

- (id)resolveFactorProviderChainForNamespaceName:(id)a3 faultOnMissingInstalledFactors:(BOOL)a4 installedFactorsAccessible:(BOOL *)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = +[TRINamespaceFactorProvider factorProviderWithNamespaceName:v9 paths:self->_paths treatmentLayer:1 faultOnMissingFactors:v6 shouldLockFactorDirectory:0];
  if (v11)
  {
    v12 = [TRITypedFactorProvider alloc];
    v13 = [(TRIPaths *)self->_paths namespaceDescriptorsDefaultDir];
    v14 = [(TRITypedFactorProvider *)v12 initWithType:1 provider:v11 logDesc:v13];
    [v10 addObject:v14];
  }
  if (a5) {
    *a5 = v11 != 0;
  }

  if ([(TRINamespaceResolver *)self _hasBMLTFactorsState])
  {
    v15 = [(TRINamespaceResolver *)self namespacesInFactorsState];
    int v16 = [v15 containsObject:v9];

    if (v16)
    {
      v17 = [(TRINamespaceResolver *)self bmltDeploymentForFactorsState];
      if (!v17)
      {
        v57 = [MEMORY[0x1E4F28B00] currentHandler];
        [v57 handleFailureInMethod:a2, self, @"TRINamespaceResolver.m", 436, @"Expression was unexpectedly nil/false: %@", @"self.bmltDeploymentForFactorsState" object file lineNumber description];
      }
      v18 = [(TRINamespaceResolver *)self _resolveTargetedFactorPackSetForBMLTDeployment:v17];
      if (!v18)
      {
        v58 = [MEMORY[0x1E4F28B00] currentHandler];
        [v58 handleFailureInMethod:a2 object:self file:@"TRINamespaceResolver.m" lineNumber:438 description:@"lockedSet for factors state unexpectedly not present"];
      }
      id v63 = 0;
      activeFactorProvidersParser = self->_activeFactorProvidersParser;
      v20 = [v17 backgroundMLTaskId];
      uint64_t v21 = [v17 deploymentId];
      v22 = [v18 path];
      v23 = [(TRIActiveFactorProvidersParser *)activeFactorProvidersParser factorProviderForNamespaceName:v9 parentId:v20 deploymentId:v21 treatmentId:0 fromFactorPackSetWithDir:v22 resolvedPath:&v63];

      if (!v23) {
        goto LABEL_22;
      }
      v24 = [TRITypedFactorProvider alloc];
      id v25 = v63;
      uint64_t v26 = 16;
LABEL_21:
      v33 = [(TRITypedFactorProvider *)v24 initWithType:v26 provider:v23 logDesc:v25];
      [v10 insertObject:v33 atIndex:0];

LABEL_22:
      id v34 = v10;

      goto LABEL_44;
    }
  }
  if ([(TRINamespaceResolver *)self _hasRolloutFactorsState])
  {
    v27 = [(TRINamespaceResolver *)self namespacesInFactorsState];
    int v28 = [v27 containsObject:v9];

    if (v28)
    {
      v17 = [(TRINamespaceResolver *)self rolloutDeploymentForFactorsState];
      if (!v17)
      {
        v59 = [MEMORY[0x1E4F28B00] currentHandler];
        [v59 handleFailureInMethod:a2, self, @"TRINamespaceResolver.m", 460, @"Expression was unexpectedly nil/false: %@", @"self.rolloutDeploymentForFactorsState" object file lineNumber description];
      }
      v18 = [(TRIActiveFactorProvidersParser *)self->_activeFactorProvidersParser resolveTargetedFactorPackSetForRolloutDeployment:v17];
      if (!v18)
      {
        v60 = [MEMORY[0x1E4F28B00] currentHandler];
        [v60 handleFailureInMethod:a2 object:self file:@"TRINamespaceResolver.m" lineNumber:462 description:@"lockedSet for factors state unexpectedly not present"];
      }
      id v63 = 0;
      v29 = self->_activeFactorProvidersParser;
      v30 = [v17 rolloutId];
      uint64_t v31 = [v17 deploymentId];
      v32 = [v18 path];
      v23 = [(TRIActiveFactorProvidersParser *)v29 factorProviderForNamespaceName:v9 parentId:v30 deploymentId:v31 treatmentId:0 fromFactorPackSetWithDir:v32 resolvedPath:&v63];

      if (!v23) {
        goto LABEL_22;
      }
      v24 = [TRITypedFactorProvider alloc];
      id v25 = v63;
      uint64_t v26 = 2;
      goto LABEL_21;
    }
  }
  v35 = [(TRIActiveFactorProvidersParser *)self->_activeFactorProvidersParser resolvePropertyListFactorProviderChainForNamespaceName:v9];
  v36 = (void *)[v35 mutableCopy];

  [v36 addObjectsFromArray:v10];
  v37 = +[TRINamespaceFactorProvider factorProviderWithNamespaceName:v9 paths:self->_paths treatmentLayer:2 faultOnMissingFactors:1 shouldLockFactorDirectory:1];
  if (v37)
  {
    v38 = [TRITypedFactorProvider alloc];
    v39 = [(TRIPaths *)self->_paths namespaceDescriptorsRolloutDir];
    v40 = [(TRITypedFactorProvider *)v38 initWithType:2 provider:v37 logDesc:v39];

    [v36 insertObject:v40 atIndex:0];
  }

  if ([(TRINamespaceResolver *)self _hasExperimentFactorsState])
  {
    v41 = [(TRINamespaceResolver *)self namespacesInFactorsState];
    int v42 = [v41 containsObject:v9];

    if (v42)
    {
      v43 = [(TRINamespaceResolver *)self experimentDeploymentForFactorsState];
      if (!v43)
      {
        v61 = [MEMORY[0x1E4F28B00] currentHandler];
        [v61 handleFailureInMethod:a2, self, @"TRINamespaceResolver.m", 516, @"Expression was unexpectedly nil/false: %@", @"self.experimentDeploymentForFactorsState" object file lineNumber description];
      }
      v44 = [(TRINamespaceResolver *)self _resolveTargetedNamespaceDescriptorSetForExperimentDeployment:v43];
      if (!v44)
      {
        v62 = [MEMORY[0x1E4F28B00] currentHandler];
        [v62 handleFailureInMethod:a2 object:self file:@"TRINamespaceResolver.m" lineNumber:518 description:@"lockedSet for namespace descriptor set unexpectedly not present"];
      }
      id v63 = 0;
      v45 = [v44 path];
      v46 = [(TRINamespaceResolver *)self _factorProviderForNamespaceName:v9 fromNamespaceDescriptorSetWithDir:v45 resolvedPath:&v63];

      if (v46)
      {
        v47 = [TRITypedFactorProvider alloc];
        v48 = [(TRITypedFactorProvider *)v47 initWithType:4 provider:v46 logDesc:v63];
        [v36 insertObject:v48 atIndex:0];
      }
    }
  }
  if (![(TRINamespaceResolver *)self _hasRolloutFactorsState]
    && ![(TRINamespaceResolver *)self _hasExperimentFactorsState])
  {
    v49 = +[TRINamespaceFactorProvider factorProviderWithNamespaceName:v9 paths:self->_paths treatmentLayer:4 faultOnMissingFactors:1 shouldLockFactorDirectory:1];
    if (v49)
    {
      v50 = [TRITypedFactorProvider alloc];
      v51 = [(TRIPaths *)self->_paths namespaceDescriptorsExperimentDir];
      v52 = [(TRITypedFactorProvider *)v50 initWithType:4 provider:v49 logDesc:v51];

      [v36 insertObject:v52 atIndex:0];
    }
    if (_os_feature_enabled_impl()) {
      [v36 triMoveFirstItemToFrontPassingTest:&__block_literal_global_9];
    }
  }
  v17 = +[TRINamespaceFactorProvider factorProviderWithNamespaceName:v9 paths:self->_paths treatmentLayer:8 faultOnMissingFactors:1 shouldLockFactorDirectory:1];
  if (v17)
  {
    v53 = [TRITypedFactorProvider alloc];
    v54 = [(TRIPaths *)self->_paths namespaceDescriptorsExperimentDir];
    v55 = [(TRITypedFactorProvider *)v53 initWithType:8 provider:v17 logDesc:v54];

    [v36 insertObject:v55 atIndex:0];
  }
  id v34 = v36;
LABEL_44:

  return v34;
}

- (BOOL)_hasExperimentFactorsState
{
  v3 = [(TRINamespaceResolver *)self namespacesInFactorsState];
  if (v3)
  {
    v4 = [(TRINamespaceResolver *)self experimentDeploymentForFactorsState];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_hasRolloutFactorsState
{
  v3 = [(TRINamespaceResolver *)self namespacesInFactorsState];
  if (v3)
  {
    v4 = [(TRINamespaceResolver *)self rolloutDeploymentForFactorsState];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSSet)namespacesInFactorsState
{
  return self->_namespacesInFactorsState;
}

- (BOOL)_hasBMLTFactorsState
{
  v3 = [(TRINamespaceResolver *)self namespacesInFactorsState];
  if (v3)
  {
    v4 = [(TRINamespaceResolver *)self bmltDeploymentForFactorsState];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __31__TRINamespaceResolver_dispose__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_159];
}

- (TRINamespaceResolver)initWithPaths:(id)a3 factorsState:(id)a4 activeFactorProvidersParser:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)TRINamespaceResolver;
  v12 = [(TRINamespaceResolver *)&v26 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v12->_paths, a3);
  uint64_t v14 = objc_opt_new();
  uint64_t v15 = objc_opt_new();
  int v16 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = v15;

  *(unsigned char *)(v14 + 24) = 0;
  id v17 = objc_alloc(MEMORY[0x1E4F93B70]);
  v18 = objc_opt_new();
  uint64_t v19 = [v17 initWithGuardedData:v18];

  lock = v13->_lock;
  v13->_lock = (_PASLock *)v19;

  uint64_t v21 = v11
      ? (TRIActiveFactorProvidersParser *)v11
      : [[TRIActiveFactorProvidersParser alloc] initWithPaths:v9];
  activeFactorProvidersParser = v13->_activeFactorProvidersParser;
  v13->_activeFactorProvidersParser = v21;

  if (![(TRINamespaceResolver *)v13 _prepareFactorsState:v10])
  {
    v24 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v10;
      _os_log_error_impl(&dword_19D909000, v24, OS_LOG_TYPE_ERROR, "Failed to prepare factorsState: %{public}@", buf, 0xCu);
    }

    v23 = 0;
  }
  else
  {
LABEL_6:
    v23 = v13;
  }

  return v23;
}

- (BOOL)_prepareFactorsState:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [v5 deployment];
      v7 = [(TRIActiveFactorProvidersParser *)self->_activeFactorProvidersParser resolveTargetedFactorPackSetForRolloutDeployment:v6];
      v8 = v7;
      if (!v7)
      {
        LOBYTE(a2) = 0;
LABEL_24:

        goto LABEL_25;
      }
      id v9 = [v7 path];
      id v10 = [v9 stringByAppendingPathComponent:@"factorPacks"];

      a2 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v28 = 0;
      id v11 = [(id)a2 contentsOfDirectoryAtPath:v10 error:&v28];
      id v12 = v28;

      LOBYTE(a2) = v11 != 0;
      if (v11)
      {
        v13 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
        namespacesInFactorsState = self->_namespacesInFactorsState;
        self->_namespacesInFactorsState = v13;

        uint64_t v15 = v6;
        p_super = &self->_rolloutDeploymentForFactorsState->super;
        self->_rolloutDeploymentForFactorsState = v15;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      p_super = TRILogCategory_ClientFramework();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      id v30 = v12;
      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [v5 deployment];
      BOOL v17 = [(TRINamespaceResolver *)self _prepareFactorsStateForExperimentsOnTreatmentPathForDeployment:v6];
      LODWORD(a2) = v17 | [(TRINamespaceResolver *)self _prepareFactorsStateForExperimentsOnFactorPackSetPathForDeployment:v6];
LABEL_25:

      goto LABEL_26;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [v5 deployment];
      v18 = [(TRINamespaceResolver *)self _resolveTargetedFactorPackSetForBMLTDeployment:v6];
      v8 = v18;
      if (!v18)
      {
        id v10 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v6;
          _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "Failed to resolve targeted namespace descriptor for deployment: %@", buf, 0xCu);
        }
        LOBYTE(a2) = 0;
        goto LABEL_23;
      }
      uint64_t v19 = [v18 path];
      id v10 = [v19 stringByAppendingPathComponent:@"factorPacks"];

      a2 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v27 = 0;
      id v11 = [(id)a2 contentsOfDirectoryAtPath:v10 error:&v27];
      id v12 = v27;

      LOBYTE(a2) = v11 != 0;
      if (v11)
      {
        v20 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
        uint64_t v21 = self->_namespacesInFactorsState;
        self->_namespacesInFactorsState = v20;

        v22 = v6;
        p_super = &self->_bmltDeploymentForFactorsState->super;
        self->_bmltDeploymentForFactorsState = v22;
        goto LABEL_22;
      }
      p_super = TRILogCategory_ClientFramework();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      id v30 = v12;
LABEL_17:
      _os_log_error_impl(&dword_19D909000, p_super, OS_LOG_TYPE_ERROR, "Failed to enumerate namespace names: %@", buf, 0xCu);
      goto LABEL_22;
    }
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v24);
    [v23 handleFailureInMethod:a2, self, @"TRINamespaceResolver.m", 178, @"Unrecognized TRIFactorsState subclass: %@", v25 object file lineNumber description];

    LOBYTE(a2) = 0;
  }
  else
  {
    LOBYTE(a2) = 1;
  }
LABEL_26:

  return (char)a2;
}

- (TRINamespaceResolver)initWithPaths:(id)a3 factorsState:(id)a4
{
  return [(TRINamespaceResolver *)self initWithPaths:a3 factorsState:a4 activeFactorProvidersParser:0];
}

BOOL __125__TRINamespaceResolver_resolveFactorProviderChainForNamespaceName_faultOnMissingInstalledFactors_installedFactorsAccessible___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFactorProvidersParser, 0);
  objc_storeStrong((id *)&self->_bmltDeploymentForFactorsState, 0);
  objc_storeStrong((id *)&self->_experimentDeploymentForFactorsState, 0);
  objc_storeStrong((id *)&self->_rolloutDeploymentForFactorsState, 0);
  objc_storeStrong((id *)&self->_namespacesInFactorsState, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (void)dealloc
{
  [(TRINamespaceResolver *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)TRINamespaceResolver;
  [(TRINamespaceResolver *)&v3 dealloc];
}

- (void)dispose
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_156];
  activeFactorProvidersParser = self->_activeFactorProvidersParser;
  [(TRIActiveFactorProvidersParser *)activeFactorProvidersParser dispose];
}

- (TRINamespaceResolver)initWithPaths:(id)a3
{
  v4 = [(TRINamespaceResolver *)self initWithPaths:a3 factorsState:0];
  if (!v4)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, 0, @"TRINamespaceResolver.m", 73, @"Expression was unexpectedly nil/false: %@", @"[self initWithPaths:paths factorsState:nil]" object file lineNumber description];
  }
  return v4;
}

- (TRINamespaceResolver)initWithPaths:(id)a3 activeFactorProvidersParser:(id)a4
{
  id v5 = [(TRINamespaceResolver *)self initWithPaths:a3 factorsState:0 activeFactorProvidersParser:a4];
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, 0, @"TRINamespaceResolver.m", 78, @"Expression was unexpectedly nil/false: %@", @"[self initWithPaths:paths factorsState:nil activeFactorProvidersParser:activeFactorProvidersParser]" object file lineNumber description];
  }
  return v5;
}

- (BOOL)_prepareFactorsStateForExperimentsOnTreatmentPathForDeployment:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(TRINamespaceResolver *)self _resolveTargetedNamespaceDescriptorSetForExperimentDeployment:v5];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 path];
    id v9 = [v8 stringByAppendingPathComponent:@"legacyNamespaceDescriptors"];

    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v38 = 0;
    id v11 = [v10 contentsOfDirectoryAtPath:v9 error:&v38];
    id v12 = v38;

    BOOL v13 = v11 != 0;
    if (v11)
    {
      id v28 = self;
      id v29 = v12;
      id obj = a3;
      uint64_t v31 = v9;
      v32 = v7;
      id v33 = v5;
      uint64_t v14 = (NSSet *)objc_opt_new();
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v15 = v11;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v21 = objc_msgSend(v20, "componentsSeparatedByString:", @".", v28);
            if ([v21 count] == 3
              && ([v21 objectAtIndexedSubscript:1],
                  v22 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v23 = [v22 length],
                  v22,
                  v23))
            {
              v24 = [v21 objectAtIndexedSubscript:1];
              [(NSSet *)v14 addObject:v24];
            }
            else
            {
              v24 = TRILogCategory_ClientFramework();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v41 = v20;
                _os_log_fault_impl(&dword_19D909000, v24, OS_LOG_TYPE_FAULT, "Unexpected namespace descriptor filename: %@", buf, 0xCu);
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v17);
      }

      namespacesInFactorsState = v28->_namespacesInFactorsState;
      v28->_namespacesInFactorsState = v14;
      objc_super v26 = v14;

      objc_storeStrong((id *)&v28->_experimentDeploymentForFactorsState, obj);
      v7 = v32;
      id v5 = v33;
      id v9 = v31;
      BOOL v13 = v11 != 0;
      id v12 = v29;
    }
    else
    {
      objc_super v26 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v12;
        _os_log_fault_impl(&dword_19D909000, v26, OS_LOG_TYPE_FAULT, "Failed to enumerate namespace descriptor filenames: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_prepareFactorsStateForExperimentsOnFactorPackSetPathForDeployment:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(TRIActiveFactorProvidersParser *)self->_activeFactorProvidersParser resolveTargetedFactorPackSetForExperimentDeployment:v4];
    BOOL v6 = v5;
    if (v5)
    {
      v7 = [v5 path];
      v8 = [v7 stringByAppendingPathComponent:@"factorPacks"];

      id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v18 = 0;
      id v10 = [v9 contentsOfDirectoryAtPath:v8 error:&v18];
      id v11 = v18;

      BOOL v12 = v10 != 0;
      if (v10)
      {
        BOOL v13 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];
        namespacesInFactorsState = self->_namespacesInFactorsState;
        self->_namespacesInFactorsState = v13;

        id v15 = (TRIExperimentDeployment *)v4;
        p_super = &self->_experimentDeploymentForFactorsState->super;
        self->_experimentDeploymentForFactorsState = v15;
      }
      else
      {
        p_super = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v11;
          _os_log_fault_impl(&dword_19D909000, p_super, OS_LOG_TYPE_FAULT, "Failed to enumerate namespace names: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v8 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_19D909000, v8, OS_LOG_TYPE_INFO, "Failed to resolve targeted experiment factor pack set for deployment: %@. This is expected for old experiments downloaded before FPE was enabled.", buf, 0xCu);
      }
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_faultOnceWithMessage:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__TRINamespaceResolver__faultOnceWithMessage___block_invoke;
  v7[3] = &unk_1E596AC60;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __46__TRINamespaceResolver__faultOnceWithMessage___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a2[24])
  {
    id v4 = a2;
    id v5 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }

    a2[24] = 1;
  }
}

- (char)_realpathWithFileSystemRepresentation:(const char *)a3 buffer:(char *)a4
{
  *__error() = 0;
  return realpath_DARWIN_EXTSN(a3, a4);
}

- (id)_resolveTargetedFactorPackSetForBMLTDeployment:(id)a3
{
  id v5 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__TRINamespaceResolver__resolveTargetedFactorPackSetForBMLTDeployment___block_invoke;
  v10[3] = &unk_1E596AC88;
  BOOL v13 = &v15;
  id v7 = v5;
  id v11 = v7;
  BOOL v12 = self;
  SEL v14 = a2;
  [(_PASLock *)lock runWithLockAcquired:v10];
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __71__TRINamespaceResolver__resolveTargetedFactorPackSetForBMLTDeployment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  uint64_t v4 = [v3[2] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = [*(id *)(*(void *)(a1 + 40) + 8) namespaceDescriptorsDir];
    id v8 = [NSString alloc];
    uint64_t v9 = [*(id *)(a1 + 32) backgroundMLTaskId];
    id v10 = (void *)[v8 initWithFormat:@"v2/bmlt/%@/%d/%@", v9, objc_msgSend(*(id *)(a1 + 32), "deploymentId"), @"targetedFactorPackSet"];
    id v11 = [v7 stringByAppendingPathComponent:v10];

    bzero(v32, 0x400uLL);
    *__error() = 0;
    id v12 = v11;
    BOOL v13 = realpath_DARWIN_EXTSN((const char *)[v12 fileSystemRepresentation], v32);
    if (v13)
    {
      SEL v14 = [[NSString alloc] initWithUTF8String:v13];
      if (!v14)
      {
        id v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"TRINamespaceResolver.m", 306, @"Expression was unexpectedly nil/false: %@", @"[[NSString alloc] initWithUTF8String:rp]" object file lineNumber description];
      }
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = TRIValidateFactorPackSetId(v15);
      if (v16)
      {
        uint64_t v17 = [[TRIReferenceManagedDirReaderLock alloc] initWithDir:v14];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = [[TRILockedFactorPackSet alloc] initWithFactorPackSetId:v16 path:v14 lock:v17];
          uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;

          [v3[2] setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
        }
      }
    }
    else
    {
      if (*__error() == 2)
      {
LABEL_13:

        goto LABEL_14;
      }
      SEL v14 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v22 = __error();
        uint64_t v23 = strerror(*v22);
        int v24 = *__error();
        *(_DWORD *)buf = 138412802;
        id v27 = v12;
        __int16 v28 = 2080;
        id v29 = v23;
        __int16 v30 = 1024;
        int v31 = v24;
        _os_log_error_impl(&dword_19D909000, v14, OS_LOG_TYPE_ERROR, "Unable to resolve BMLT deployment %@: %s (%d)", buf, 0x1Cu);
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (id)_resolveTargetedNamespaceDescriptorSetForExperimentDeployment:(id)a3
{
  id v5 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__TRINamespaceResolver__resolveTargetedNamespaceDescriptorSetForExperimentDeployment___block_invoke;
  v10[3] = &unk_1E596AC88;
  BOOL v13 = &v15;
  id v7 = v5;
  id v11 = v7;
  id v12 = self;
  SEL v14 = a2;
  [(_PASLock *)lock runWithLockAcquired:v10];
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __86__TRINamespaceResolver__resolveTargetedNamespaceDescriptorSetForExperimentDeployment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  uint64_t v4 = [v3[1] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = [*(id *)(*(void *)(a1 + 40) + 8) namespaceDescriptorsDir];
    id v8 = [NSString alloc];
    uint64_t v9 = [*(id *)(a1 + 32) experimentId];
    id v10 = (void *)[v8 initWithFormat:@"v2/experiment/%@/%d/%@", v9, objc_msgSend(*(id *)(a1 + 32), "deploymentId"), @"targetedNamespaceDescriptorSet"];
    id v11 = [v7 stringByAppendingPathComponent:v10];

    bzero(v33, 0x400uLL);
    id v12 = *(void **)(a1 + 40);
    id v13 = v11;
    uint64_t v14 = objc_msgSend(v12, "_realpathWithFileSystemRepresentation:buffer:", objc_msgSend(v13, "fileSystemRepresentation"), v33);
    if (v14)
    {
      uint64_t v15 = [[NSString alloc] initWithUTF8String:v14];
      if (!v15)
      {
        objc_super v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"TRINamespaceResolver.m", 345, @"Expression was unexpectedly nil/false: %@", @"[[NSString alloc] initWithUTF8String:expandedPath]" object file lineNumber description];
      }
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = TRIValidateFactorPackSetId(v16);
      if (v17)
      {
        id v18 = [[TRIReferenceManagedDirReaderLock alloc] initWithDir:v15];
        if (v18)
        {
          uint64_t v19 = v18;
          id v20 = [[TRILockedFactorPackSet alloc] initWithFactorPackSetId:v17 path:v15 lock:v18];
          uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
          v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = v20;

          [v3[1] setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
        }
      }
    }
    else
    {
      if (*__error() == 2)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v15 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = __error();
        int v24 = strerror(*v23);
        int v25 = *__error();
        *(_DWORD *)buf = 138412802;
        id v28 = v13;
        __int16 v29 = 2080;
        __int16 v30 = v24;
        __int16 v31 = 1024;
        int v32 = v25;
        _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "Unable to resolve experiment deployment %@: %s (%d)", buf, 0x1Cu);
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

+ (id)promotionDirForNamespaceName:(id)a3 withPaths:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 namespaceDescriptorsDir];
  id v7 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", @"v2/promotion", v5];

  id v8 = [v6 stringByAppendingPathComponent:v7];

  return v8;
}

- (id)_factorProviderForNamespaceName:(id)a3 fromNamespaceDescriptorSetWithDir:(id)a4 resolvedPath:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [a4 stringByAppendingPathComponent:@"legacyNamespaceDescriptors"];
  id v10 = [v9 triStringByResolvingSymlinksInPath];
  id v11 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    uint64_t v17 = v10;
    _os_log_debug_impl(&dword_19D909000, v11, OS_LOG_TYPE_DEBUG, "Opening treatment via id-based namespace descriptor path: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_storeStrong(a5, v9);
  id v12 = +[TRINamespaceDescriptor loadWithNamespaceName:v8 fromDirectory:v9];

  if (v12)
  {
    id v13 = +[TRINamespaceFactorProvider factorProviderWithNamespaceDescriptor:v12 paths:self->_paths faultOnMissingFactors:1 shouldLockFactorDirectory:1];
  }
  else
  {
    uint64_t v14 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      uint64_t v17 = v9;
      _os_log_error_impl(&dword_19D909000, v14, OS_LOG_TYPE_ERROR, "Failed to load namespace descriptor from parent dir: %@", (uint8_t *)&v16, 0xCu);
    }

    id v13 = 0;
  }

  return v13;
}

void __31__TRINamespaceResolver_dispose__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 lock];
  [v3 unlock];
}

+ (id)_namespacePathComponentsFromEntitlements
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = +[TRIEntitlement objectForCurrentProcessEntitlement:@"com.apple.trial.client"];
  if (!v2)
  {
LABEL_16:
    id v8 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    uint64_t v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = [MEMORY[0x1E4F28F80] processInfo];
      id v12 = [v11 processName];
      id v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412802;
      id v20 = v12;
      __int16 v21 = 2112;
      v22 = @"com.apple.trial.client";
      __int16 v23 = 2112;
      int v24 = v14;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "Process \"%@\" has incorrectly-typed entitlement \"%@\" (expected array of string, decoded %@)", buf, 0x20u);
    }
    goto LABEL_16;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v8 = v3;
LABEL_17:

  return v8;
}

+ (id)preferredPathForFactorDataWithCandidatePaths:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"TRINamespaceResolver.m", 617, @"Invalid parameter not satisfying: %@", @"candidatePaths.count > 0" object file lineNumber description];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__TRINamespaceResolver_preferredPathForFactorDataWithCandidatePaths___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB3B77E0 != -1) {
    dispatch_once(&qword_1EB3B77E0, block);
  }
  id v6 = (id)_MergedGlobals_8;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 count];
    if ((unint64_t)([v5 count] * v8) > 0x64)
    {
      uint64_t v9 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D909000, v9, OS_LOG_TYPE_DEFAULT, "Warning: suppressing entitlement-based path resolution due to high complexity.", buf, 2u);
      }
    }
    else
    {
      long long v37 = v7;
      uint64_t v9 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_173);
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v38 = v5;
      id obj = v5;
      uint64_t v10 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v40 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v50 != v40) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            uint64_t v14 = (void *)MEMORY[0x19F3AD060]();
            long long v15 = [v13 triStringByResolvingSymlinksInPath];
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v16 = v9;
            long long v17 = v9;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v46;
LABEL_14:
              uint64_t v21 = 0;
              while (1)
              {
                if (*(void *)v46 != v20) {
                  objc_enumerationMutation(v17);
                }
                if ([v15 containsString:*(void *)(*((void *)&v45 + 1) + 8 * v21)]) {
                  break;
                }
                if (v19 == ++v21)
                {
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
                  if (v19) {
                    goto LABEL_14;
                  }
                  goto LABEL_26;
                }
              }
              id v22 = v13;
              if (!access((const char *)[v22 fileSystemRepresentation], 4))
              {
                id v34 = v22;

                id v7 = v37;
                id v5 = v38;
                goto LABEL_49;
              }
              if (*__error() == 1)
              {
                __int16 v23 = TRILogCategory_ClientFramework();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v56 = obj;
                  _os_log_impl(&dword_19D909000, v23, OS_LOG_TYPE_INFO, "Sandbox/datavault prevents accessing candidate path: %@", buf, 0xCu);
                }
              }
            }
LABEL_26:

            uint64_t v9 = v16;
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v11);
      }

      id v7 = v37;
      id v5 = v38;
    }
  }
  int v24 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D909000, v24, OS_LOG_TYPE_DEFAULT, "Unable to resolve candidate path based on calling process entitlement; falling back on naive access() check.",
      buf,
      2u);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = v5;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    while (2)
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        __int16 v30 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        __int16 v31 = (void *)MEMORY[0x19F3AD060]();
        id v32 = v30;
        if (!access((const char *)[v32 fileSystemRepresentation], 4))
        {
          id v34 = v32;

          goto LABEL_49;
        }
        if (*__error() == 1)
        {
          uint64_t v33 = TRILogCategory_ClientFramework();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v25;
            _os_log_impl(&dword_19D909000, v33, OS_LOG_TYPE_INFO, "Sandbox/datavault prevents accessing candidate path: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v54 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }

  id v34 = [v25 objectAtIndexedSubscript:0];
LABEL_49:

  return v34;
}

void __69__TRINamespaceResolver_preferredPathForFactorDataWithCandidatePaths___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v3 = [*(id *)(a1 + 32) _namespacePathComponentsFromEntitlements];
  uint64_t v4 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = v3;
}

id __69__TRINamespaceResolver_preferredPathForFactorDataWithCandidatePaths___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithFormat:@"/Treatments/%@/", v3];

  return v4;
}

- (TRIRolloutDeployment)rolloutDeploymentForFactorsState
{
  return self->_rolloutDeploymentForFactorsState;
}

- (TRIExperimentDeployment)experimentDeploymentForFactorsState
{
  return self->_experimentDeploymentForFactorsState;
}

- (TRIBMLTDeployment)bmltDeploymentForFactorsState
{
  return self->_bmltDeploymentForFactorsState;
}

- (TRIActiveFactorProvidersParser)activeFactorProvidersParser
{
  return self->_activeFactorProvidersParser;
}

@end