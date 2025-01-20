@interface TRIDefaultFactorProvider
- (BOOL)hasRegisteredNamespaceWithName:(id)a3;
- (BOOL)hasTreatmentInAnyOfLayers:(unint64_t)a3 withNamespaceName:(id)a4;
- (TRIDefaultFactorProvider)initWithPaths:(id)a3 factorsState:(id)a4;
- (id)_experimentDeploymentWithNamespaceName:(id)a3 treatmentLayer:(unint64_t)a4;
- (id)_providerForNamespace:(id)a3;
- (id)_treatmentIdWithNamespaceName:(id)a3 treatmentLayer:(unint64_t)a4;
- (id)bmltDeploymentWithNamespaceName:(id)a3;
- (id)experimentDeploymentWithNamespaceName:(id)a3;
- (id)factorLevelsWithNamespace:(unsigned int)a3;
- (id)factorLevelsWithNamespaceName:(id)a3;
- (id)factorPackIdForBmltWithNamespaceName:(id)a3;
- (id)factorPackIdForRolloutWithNamespaceName:(id)a3;
- (id)levelForFactor:(id)a3 withNamespace:(unsigned int)a4;
- (id)levelForFactor:(id)a3 withNamespaceName:(id)a4;
- (id)promotableFactorPackIdForNamespaceName:(id)a3;
- (id)rolloutDeploymentWithNamespaceName:(id)a3;
- (id)treatmentIdWithNamespaceName:(id)a3;
- (unsigned)compatibilityVersionWithNamespaceName:(id)a3;
- (void)cacheFactorLevelsWithNamespaceName:(id)a3;
- (void)invalidateAllFactorProviders;
- (void)setContainer:(id)a3 forNamespaceName:(id)a4;
@end

@implementation TRIDefaultFactorProvider

void __50__TRIDefaultFactorProvider__providerForNamespace___block_invoke(void *a1, void *a2)
{
  v14 = a2;
  uint64_t v3 = [v14[2] objectForKeyedSubscript:a1[4]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v6 = [v14[3] objectForKeyedSubscript:a1[4]];
    if (v6)
    {
      v7 = [*(id *)(a1[5] + 8) pathsForContainer:v6 asClientProcess:1];
      if (!v7)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a1[7], a1[5], @"TRIDefaultFactorProvider.m", 119, @"Expression was unexpectedly nil/false: %@", @"[_paths pathsForContainer:container asClientProcess:YES]" object file lineNumber description];
      }
      v8 = [[TRINamespaceResolver alloc] initWithPaths:v7];
      v9 = [(TRINamespaceResolver *)v8 resolveFactorProviderChainForNamespaceName:a1[4] faultOnMissingInstalledFactors:1 installedFactorsAccessible:0];
      [(TRINamespaceResolver *)v8 dispose];
    }
    else
    {
      v9 = [v14[1] resolveFactorProviderChainForNamespaceName:a1[4] faultOnMissingInstalledFactors:1 installedFactorsAccessible:0];
    }
    v10 = [[TRINamespaceFactorProviderChain alloc] initWithNamespaceName:a1[4] typedProviderChain:v9 paths:*(void *)(a1[5] + 8)];
    uint64_t v11 = *(void *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    [v14[2] setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:a1[4]];
  }
}

- (id)rolloutDeploymentWithNamespaceName:(id)a3
{
  id v4 = a3;
  v5 = [(TRIDefaultFactorProvider *)self _providerForNamespace:v4];
  v6 = [v5 providerForTreatmentLayer:2];

  v7 = [v6 experimentId];
  if (v7)
  {
    v8 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:]([TRIRolloutDeployment alloc], "initWithRolloutId:deploymentId:", v7, [v6 deploymentId]);
  }
  else
  {
    v9 = [v6 treatmentId];
    if (v9)
    {
      v10 = +[TRITreatmentInfo loadInfoForTreatment:v9 namespaceName:v4 paths:self->_paths];
      uint64_t v11 = v10;
      if (v10)
      {
        v8 = [v10 experimentId];

        if (v8)
        {
          v12 = [TRIRolloutDeployment alloc];
          v13 = [v11 experimentId];
          v8 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:](v12, "initWithRolloutId:deploymentId:", v13, [v11 deploymentId]);
        }
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

- (id)_providerForNamespace:(id)a3
{
  id v5 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__TRIDefaultFactorProvider__providerForNamespace___block_invoke;
  v10[3] = &unk_1E596A950;
  v13 = &v15;
  id v7 = v5;
  id v11 = v7;
  v12 = self;
  SEL v14 = a2;
  [(_PASLock *)lock runWithLockAcquired:v10];
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)levelForFactor:(id)a3 withNamespaceName:(id)a4
{
  id v6 = a3;
  id v7 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a4];
  id v8 = [v7 levelForFactor:v6];

  return v8;
}

- (id)factorPackIdForRolloutWithNamespaceName:(id)a3
{
  uint64_t v3 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  id v4 = [v3 providerForTreatmentLayer:2];

  id v5 = [v4 treatmentId];

  return v5;
}

- (id)treatmentIdWithNamespaceName:(id)a3
{
  id v4 = a3;
  if (!_os_feature_enabled_impl()
    || ([(TRIDefaultFactorProvider *)self _treatmentIdWithNamespaceName:v4 treatmentLayer:32], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [(TRIDefaultFactorProvider *)self _treatmentIdWithNamespaceName:v4 treatmentLayer:4];
  }

  return v5;
}

- (id)_treatmentIdWithNamespaceName:(id)a3 treatmentLayer:(unint64_t)a4
{
  id v5 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  id v6 = [v5 providerForTreatmentLayer:a4];

  id v7 = [v6 treatmentId];

  return v7;
}

- (id)experimentDeploymentWithNamespaceName:(id)a3
{
  id v4 = a3;
  if (!_os_feature_enabled_impl()
    || ([(TRIDefaultFactorProvider *)self _experimentDeploymentWithNamespaceName:v4 treatmentLayer:32], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [(TRIDefaultFactorProvider *)self _experimentDeploymentWithNamespaceName:v4 treatmentLayer:4];
  }

  return v5;
}

- (id)_experimentDeploymentWithNamespaceName:(id)a3 treatmentLayer:(unint64_t)a4
{
  id v5 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  id v6 = [v5 providerForTreatmentLayer:a4];

  if (v6)
  {
    id v7 = [v6 experimentId];
    uint64_t v8 = [v6 deploymentId];
    if (v7) {
      v9 = [[TRIExperimentDeployment alloc] initWithExperimentId:v7 deploymentId:v8];
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)invalidateAllFactorProviders
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[TRINamespaceResolver alloc] initWithPaths:self->_paths factorsState:self->_factorsState];
  id v4 = TRILogCategory_ClientFramework();
  p_super = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19D909000, p_super, OS_LOG_TYPE_DEBUG, "Clearing memory cache and file locks.", buf, 2u);
    }

    lock = self->_lock;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__TRIDefaultFactorProvider_invalidateAllFactorProviders__block_invoke;
    v8[3] = &unk_1E596A900;
    v9 = v3;
    [(_PASLock *)lock runWithLockAcquired:v8];
    p_super = &v9->super;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    factorsState = self->_factorsState;
    *(_DWORD *)buf = 138412290;
    id v11 = factorsState;
    _os_log_impl(&dword_19D909000, p_super, OS_LOG_TYPE_DEFAULT, "Not invalidating namespace because factorsState is stale: %@", buf, 0xCu);
  }
}

- (TRIDefaultFactorProvider)initWithPaths:(id)a3 factorsState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TRIDefaultFactorProvider;
  v9 = [(TRIDefaultFactorProvider *)&v22 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v9->_paths, a3);
  objc_storeStrong((id *)&v10->_factorsState, a4);
  id v11 = [[TRINamespaceResolver alloc] initWithPaths:v7 factorsState:v10->_factorsState];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    v13 = (void *)v12[1];
    v12[1] = v11;
    SEL v14 = v11;

    uint64_t v15 = objc_opt_new();
    v16 = (void *)v12[2];
    v12[2] = v15;

    uint64_t v17 = objc_opt_new();
    v18 = (void *)v12[3];
    v12[3] = v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v12];
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v19;

LABEL_4:
    id v11 = v10;
  }

  return (TRIDefaultFactorProvider *)v11;
}

void __56__TRIDefaultFactorProvider_invalidateAllFactorProviders__block_invoke(uint64_t a1, id *a2)
{
  id v4 = a2[2];
  id v5 = a2;
  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_8];
  [a2[2] removeAllObjects];
  [v5[1] dispose];
  objc_storeStrong(v5 + 1, *(id *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_factorsState, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (id)factorLevelsWithNamespaceName:(id)a3
{
  uint64_t v3 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  id v4 = [v3 factorLevels];

  return v4;
}

uint64_t __56__TRIDefaultFactorProvider_invalidateAllFactorProviders__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 dispose];
}

- (void)setContainer:(id)a3 forNamespaceName:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_19D909000, v8, OS_LOG_TYPE_DEFAULT, "Setting container %@ for namespace %@", buf, 0x16u);
  }

  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__TRIDefaultFactorProvider_setContainer_forNamespaceName___block_invoke;
  v12[3] = &unk_1E596A928;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = self;
  id v10 = v7;
  id v11 = v6;
  [(_PASLock *)lock runWithLockAcquired:v12];
}

uint64_t __58__TRIDefaultFactorProvider_setContainer_forNamespaceName___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 24);
  if (a1[4])
  {
    return objc_msgSend(v3, "setObject:forKeyedSubscript:");
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:a1[5]];
    id v5 = (void *)a1[6];
    return [v5 invalidateAllFactorProviders];
  }
}

- (BOOL)hasRegisteredNamespaceWithName:(id)a3
{
  uint64_t v3 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isRegistered];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unsigned)compatibilityVersionWithNamespaceName:(id)a3
{
  uint64_t v3 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v4 = [v3 namespaceCompatibilityVersion];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTreatmentInAnyOfLayers:(unint64_t)a3 withNamespaceName:(id)a4
{
  id v5 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 hasAnyTreatmentInLayers:a3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)cacheFactorLevelsWithNamespaceName:(id)a3
{
  id v3 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  [v3 cacheFactorLevels];
}

- (id)bmltDeploymentWithNamespaceName:(id)a3
{
  id v3 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  unsigned int v4 = [v3 providerForTreatmentLayer:16];

  id v5 = [v4 experimentId];
  if (v5) {
    char v6 = -[TRIBMLTDeployment initWithBackgroundMLTaskId:deploymentId:]([TRIBMLTDeployment alloc], "initWithBackgroundMLTaskId:deploymentId:", v5, [v4 deploymentId]);
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)factorPackIdForBmltWithNamespaceName:(id)a3
{
  id v3 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  unsigned int v4 = [v3 providerForTreatmentLayer:16];

  id v5 = [v4 treatmentId];

  return v5;
}

- (id)promotableFactorPackIdForNamespaceName:(id)a3
{
  id v3 = [(TRIDefaultFactorProvider *)self _providerForNamespace:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = [v3 promotableFactorPackId];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

- (id)levelForFactor:(id)a3 withNamespace:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  char v6 = (void *)MEMORY[0x1E4FB05B8];
  id v7 = a3;
  id v8 = [v6 namespaceNameFromId:v4];
  v9 = [(TRIDefaultFactorProvider *)self levelForFactor:v7 withNamespaceName:v8];

  return v9;
}

- (id)factorLevelsWithNamespace:(unsigned int)a3
{
  uint64_t v4 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:*(void *)&a3];
  id v5 = [(TRIDefaultFactorProvider *)self factorLevelsWithNamespaceName:v4];

  return v5;
}

@end