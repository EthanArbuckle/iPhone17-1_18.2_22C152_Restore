@interface TRIPurgeableOnDemandFactorsEnumerator
- (TRIPurgeableOnDemandFactorsEnumerator)initWithPaths:(id)a3 namespaceResolver:(id)a4;
- (void)_enumerateExperimentOnDemandFactorsWithNamespaceName:(id)a3 block:(id)a4;
- (void)_enumerateRolloutOnDemandFactorsWithNamespaceName:(id)a3 block:(id)a4;
- (void)_filterOndemandAssetsForFactorLevels:(id)a3 forFactorPackId:(id)a4 treatmentId:(id)a5 block:(id)a6;
- (void)enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames:(id)a3 purgeableFactorFilterBlock:(id)a4 block:(id)a5;
- (void)enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames:(id)a3 purgeableFactorFilterBlock:(id)a4 block:(id)a5;
@end

@implementation TRIPurgeableOnDemandFactorsEnumerator

- (TRIPurgeableOnDemandFactorsEnumerator)initWithPaths:(id)a3 namespaceResolver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIPurgeableOnDemandFactorsEnumerator;
  v9 = [(TRIPurgeableOnDemandFactorsEnumerator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_namespaceResolver, a4);
  }

  return v10;
}

- (void)enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames:(id)a3 purgeableFactorFilterBlock:(id)a4 block:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v25 = a4;
  v9 = (void (**)(id, void *, id, unsigned char *))a5;
  v26 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v10)
  {
    uint64_t v23 = *(void *)v42;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v42 != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1E016E7F0]();
      v14 = objc_opt_new();
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__50;
      v39 = __Block_byref_object_dispose__50;
      id v40 = 0;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __139__TRIPurgeableOnDemandFactorsEnumerator_enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames_purgeableFactorFilterBlock_block___block_invoke;
      v28[3] = &unk_1E6BBDF18;
      id v32 = v25;
      v33 = &v35;
      v28[4] = v12;
      id v15 = v14;
      id v29 = v15;
      id v16 = v26;
      SEL v34 = a2;
      id v30 = v16;
      v31 = self;
      v17 = (void *)MEMORY[0x1E016EA80](v28);
      [(TRIPurgeableOnDemandFactorsEnumerator *)self _enumerateRolloutOnDemandFactorsWithNamespaceName:v12 block:v17];
      BOOL v21 = 1;
      if (v36[5])
      {
        char v27 = 0;
        v18 = [TRIPurgeableConstruct alloc];
        v19 = [(TRIPurgeableConstruct *)v18 initWithFactorPackId:v36[5] treatmentId:0 namespaceName:v12 purgeableAssetFactorNames:v15];
        v9[2](v9, v19, v16, &v27);
        BOOL v20 = v27 == 0;

        if (!v20) {
          BOOL v21 = 0;
        }
      }

      _Block_object_dispose(&v35, 8);
      if (!v21) {
        break;
      }
      if (v10 == ++v11)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __139__TRIPurgeableOnDemandFactorsEnumerator_enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames_purgeableFactorFilterBlock_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 64);
  if (!v5
    || ([v3 factorName],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = (*(uint64_t (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, *(void *)(a1 + 32)),
        v6,
        v7))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v10;
    }
    else
    {
      uint64_t v12 = [v4 factorPackId];
      uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v11 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }

    v14 = [v4 filePath];
    if (v14)
    {
      id v15 = *(void **)(a1 + 40);
      id v16 = [v4 factorName];
      [v15 addObject:v16];

      v17 = [v4 assetId];
      v18 = [*(id *)(a1 + 48) objectForKeyedSubscript:v17];
      if (v18)
      {
        [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:v17];
      }
      else
      {
        v19 = objc_opt_new();
        [*(id *)(a1 + 48) setObject:v19 forKeyedSubscript:v17];
      }
      BOOL v20 = [*(id *)(a1 + 48) objectForKeyedSubscript:v17];
      [v20 addObject:v14];

      if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
      {
        SEL v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 56) file:@"TRIPurgeableOnDemandFactorsEnumerator.m" lineNumber:62 description:@"Expected a valid factorPackId."];
      }
      BOOL v21 = [[TRIFactorPackStorage alloc] initWithPaths:*(void *)(*(void *)(a1 + 56) + 8)];
      uint64_t v22 = [(TRIFactorPackStorage *)v21 legacyPathForFactorPackWithId:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) namespaceName:*(void *)(a1 + 32)];
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        if (_os_feature_enabled_impl())
        {
          v24 = [[TRIFBFactorPackStorage alloc] initWithPaths:*(void *)(*(void *)(a1 + 56) + 8)];
          id v25 = [(TRIFBFactorPackStorage *)v24 legacyPathForFactorLevelsWithFactorPackId:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) namespaceName:*(void *)(a1 + 32)];
          if ([v25 isEqualToString:v23])
          {
            if (_os_feature_enabled_impl())
            {
              id v26 = v25;

              uint64_t v23 = v26;
            }
          }
          else
          {
            char v27 = TRILogCategory_Server();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
              *(_DWORD *)buf = 138543874;
              uint64_t v37 = v25;
              __int16 v38 = 2114;
              v39 = v23;
              __int16 v40 = 2114;
              uint64_t v41 = v33;
              _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Legacy path from flatbuffers: %{public}@ does not match path from protobuf: %{public}@ for factor pack id: %{public}@", buf, 0x20u);
            }
          }
        }
        v28 = [v14 lastPathComponent];
        id v29 = NSString;
        v35[0] = v23;
        v35[1] = @"assets";
        v35[2] = v28;
        id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
        v31 = [v29 pathWithComponents:v30];

        id v32 = [*(id *)(a1 + 48) objectForKeyedSubscript:v17];
        [v32 addObject:v31];
      }
    }
  }
}

- (void)enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames:(id)a3 purgeableFactorFilterBlock:(id)a4 block:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v24 = a4;
  v9 = (void (**)(id, void *, id, unsigned char *))a5;
  id v25 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v10)
  {
    uint64_t v23 = *(void *)v47;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v47 != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * v11);
      uint64_t v13 = (void *)MEMORY[0x1E016E7F0]();
      v14 = objc_opt_new();
      uint64_t v40 = 0;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x3032000000;
      long long v43 = __Block_byref_object_copy__50;
      long long v44 = __Block_byref_object_dispose__50;
      id v45 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = &v34;
      uint64_t v36 = 0x3032000000;
      uint64_t v37 = __Block_byref_object_copy__50;
      __int16 v38 = __Block_byref_object_dispose__50;
      id v39 = 0;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __142__TRIPurgeableOnDemandFactorsEnumerator_enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames_purgeableFactorFilterBlock_block___block_invoke;
      v27[3] = &unk_1E6BBDF40;
      id v31 = v24;
      id v32 = &v40;
      v27[4] = v12;
      uint64_t v33 = &v34;
      id v15 = v14;
      id v28 = v15;
      id v16 = v25;
      id v29 = v16;
      id v30 = self;
      v17 = (void *)MEMORY[0x1E016EA80](v27);
      [(TRIPurgeableOnDemandFactorsEnumerator *)self _enumerateExperimentOnDemandFactorsWithNamespaceName:v12 block:v17];
      if (!v41[5] && !v35[5]) {
        goto LABEL_10;
      }
      char v26 = 0;
      v18 = [TRIPurgeableConstruct alloc];
      v19 = [(TRIPurgeableConstruct *)v18 initWithFactorPackId:v41[5] treatmentId:v35[5] namespaceName:v12 purgeableAssetFactorNames:v15];
      v9[2](v9, v19, v16, &v26);
      BOOL v20 = v26 == 0;

      if (!v20) {
        int v21 = 0;
      }
      else {
LABEL_10:
      }
        int v21 = 1;

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v40, 8);

      if (!v21) {
        break;
      }
      if (v10 == ++v11)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __142__TRIPurgeableOnDemandFactorsEnumerator_enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames_purgeableFactorFilterBlock_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 64);
  if (!v5
    || ([v3 factorName],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = (*(uint64_t (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, *(void *)(a1 + 32)),
        v6,
        v7))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v10;
    }
    else
    {
      uint64_t v12 = [v4 factorPackId];
      uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v11 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }

    uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
    id v15 = *(void **)(v14 + 40);
    if (v15)
    {
      id v16 = v15;
      v17 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v16;
    }
    else
    {
      uint64_t v18 = [v4 treatmentId];
      uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
      v17 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    BOOL v20 = [v4 filePath];
    if (v20)
    {
      int v21 = *(void **)(a1 + 40);
      uint64_t v22 = [v4 factorName];
      [v21 addObject:v22];

      uint64_t v23 = [v4 assetId];
      id v24 = [*(id *)(a1 + 48) objectForKeyedSubscript:v23];
      if (v24)
      {
        [*(id *)(a1 + 48) setObject:v24 forKeyedSubscript:v23];
      }
      else
      {
        id v25 = objc_opt_new();
        [*(id *)(a1 + 48) setObject:v25 forKeyedSubscript:v23];
      }
      char v26 = [*(id *)(a1 + 48) objectForKeyedSubscript:v23];
      [v26 addObject:v20];

      char v27 = [v4 factorPackId];

      if (v27)
      {
        id v28 = [[TRIFactorPackStorage alloc] initWithPaths:*(void *)(*(void *)(a1 + 56) + 8)];
        id v29 = [v4 factorPackId];
        id v30 = [(TRIFactorPackStorage *)v28 legacyPathForFactorPackWithId:v29 namespaceName:*(void *)(a1 + 32)];

        if (v30)
        {
          if (_os_feature_enabled_impl())
          {
            id v31 = [[TRIFBFactorPackStorage alloc] initWithPaths:*(void *)(*(void *)(a1 + 56) + 8)];
            id v32 = [v4 factorPackId];
            uint64_t v33 = [(TRIFBFactorPackStorage *)v31 legacyPathForFactorLevelsWithFactorPackId:v32 namespaceName:*(void *)(a1 + 32)];

            if ([v33 isEqualToString:v30])
            {
              if (_os_feature_enabled_impl())
              {
                id v34 = v33;

                id v30 = v34;
              }
            }
            else
            {
              uint64_t v35 = TRILogCategory_Server();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
                *(_DWORD *)buf = 138543874;
                long long v44 = v33;
                __int16 v45 = 2114;
                long long v46 = v30;
                __int16 v47 = 2114;
                uint64_t v48 = v41;
                _os_log_error_impl(&dword_1DA291000, v35, OS_LOG_TYPE_ERROR, "Legacy path from flatbuffers: %{public}@ does not match path from protobuf: %{public}@ for factor pack id: %{public}@", buf, 0x20u);
              }
            }
          }
          uint64_t v36 = [v20 lastPathComponent];
          uint64_t v37 = NSString;
          v42[0] = v30;
          v42[1] = @"assets";
          v42[2] = v36;
          __int16 v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
          id v39 = [v37 pathWithComponents:v38];

          uint64_t v40 = [*(id *)(a1 + 48) objectForKeyedSubscript:v23];
          [v40 addObject:v39];
        }
      }
    }
  }
}

- (void)_enumerateRolloutOnDemandFactorsWithNamespaceName:(id)a3 block:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E016E7F0]();
  v9 = [MEMORY[0x1E4FB01B0] factorProviderWithPaths:self->_paths namespaceName:v6 resolver:self->_namespaceResolver];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__TRIPurgeableOnDemandFactorsEnumerator__enumerateRolloutOnDemandFactorsWithNamespaceName_block___block_invoke;
  v19[3] = &unk_1E6BB82F8;
  id v10 = v9;
  id v20 = v10;
  uint64_t v11 = (void (**)(void))MEMORY[0x1E016EA80](v19);
  if ([v10 hasAnyTreatmentInLayers:2])
  {
    uint64_t v12 = [v10 providerForTreatmentLayer:2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v12;
      uint64_t v13 = [v18 factorPackId];
      if (v13
        && ([v18 factorPackId],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            TRIValidateFactorPackId(),
            id v15 = objc_claimAutoreleasedReturnValue(),
            v14,
            v13,
            v15))
      {
        id v16 = [v18 factorLevels];
        [(TRIPurgeableOnDemandFactorsEnumerator *)self _filterOndemandAssetsForFactorLevels:v16 forFactorPackId:v15 treatmentId:0 block:v7];
      }
      else
      {
        id v15 = TRILogCategory_Server();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v17 = [v18 rolloutId];
          *(_DWORD *)buf = 138543618;
          id v22 = v6;
          __int16 v23 = 2114;
          id v24 = v17;
          _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Found invalid factor pack ID for namespace %{public}@ from rollout provider with rolloutId %{public}@", buf, 0x16u);
        }
      }
    }
  }
  if (v11) {
    v11[2](v11);
  }
}

uint64_t __97__TRIPurgeableOnDemandFactorsEnumerator__enumerateRolloutOnDemandFactorsWithNamespaceName_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispose];
}

- (void)_enumerateExperimentOnDemandFactorsWithNamespaceName:(id)a3 block:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v8 = [MEMORY[0x1E4FB01B0] factorProviderWithPaths:self->_paths namespaceName:v6 resolver:self->_namespaceResolver];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __100__TRIPurgeableOnDemandFactorsEnumerator__enumerateExperimentOnDemandFactorsWithNamespaceName_block___block_invoke;
  v23[3] = &unk_1E6BB82F8;
  id v9 = v8;
  id v24 = v9;
  id v10 = (void (**)(void))MEMORY[0x1E016EA80](v23);
  if ([v9 hasAnyTreatmentInLayers:32])
  {
    uint64_t v11 = [v9 providerForTreatmentLayer:32];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      uint64_t v13 = [v12 factorPackId];
      if (v13
        && ([v12 factorPackId],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            TRIValidateFactorPackId(),
            id v15 = objc_claimAutoreleasedReturnValue(),
            v14,
            v13,
            v15))
      {
        id v16 = [v12 factorLevels];
        [(TRIPurgeableOnDemandFactorsEnumerator *)self _filterOndemandAssetsForFactorLevels:v16 forFactorPackId:v15 treatmentId:0 block:v7];
      }
      else
      {
        id v15 = TRILogCategory_Server();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v21 = [v12 experimentId];
          *(_DWORD *)buf = 138543618;
          id v26 = v6;
          __int16 v27 = 2114;
          id v28 = v21;
          _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Found invalid treatmentID or factorPackId for namespace %{public}@ from experiment provider with experiment %{public}@", buf, 0x16u);
        }
      }
    }
  }
  if ([v9 hasAnyTreatmentInLayers:4])
  {
    v17 = [v9 providerForTreatmentLayer:4];
    id v18 = [v17 treatmentId];
    if (v18)
    {
      uint64_t v19 = [v17 factorLevels];
      [(TRIPurgeableOnDemandFactorsEnumerator *)self _filterOndemandAssetsForFactorLevels:v19 forFactorPackId:0 treatmentId:v18 block:v7];
    }
    else
    {
      uint64_t v19 = TRILogCategory_Server();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v17 experimentId];
        *(_DWORD *)buf = 138543618;
        id v26 = v6;
        __int16 v27 = 2114;
        id v28 = v20;
        _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Found invalid treatmentID for namespace %{public}@ from experiment provider with experiment %{public}@", buf, 0x16u);
      }
    }
  }
  if (v10) {
    v10[2](v10);
  }
}

uint64_t __100__TRIPurgeableOnDemandFactorsEnumerator__enumerateExperimentOnDemandFactorsWithNamespaceName_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispose];
}

- (void)_filterOndemandAssetsForFactorLevels:(id)a3 forFactorPackId:(id)a4 treatmentId:(id)a5 block:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v30 = a4;
  id v29 = a5;
  id v31 = (void (**)(id, NSObject *))a6;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    id v28 = (char *)(v31 + 2);
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "factor", v28);
        id v16 = [v15 name];

        if (v16)
        {
          v17 = [v14 level];
          id v18 = [v17 fileOrDirectoryLevelWithIsDir:0];
          uint64_t v19 = v18;
          if (v18)
          {
            if ([v18 isOnDemand])
            {
              id v20 = [v19 path];
              uint64_t v21 = [v20 length];

              if (v21)
              {
                id v22 = [v19 asset];
                __int16 v23 = [v22 assetId];
                id v24 = TRIValidateAssetId();

                if (v24)
                {
                  uint64_t v25 = [TRIPurgeableAsset alloc];
                  id v26 = [v19 path];
                  __int16 v27 = [(TRIPurgeableAsset *)v25 initWithFactorName:v16 assetId:v24 filePath:v26 factorPackId:v30 treatmentId:v29];

                  v31[2](v31, v27);
                }
                else
                {
                  __int16 v27 = TRILogCategory_Server();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v37 = v19;
                    _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Invalid asset id for fileLevel %{public}@", buf, 0xCu);
                  }
                }
              }
            }
          }
        }
        else
        {
          v17 = TRILogCategory_Server();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v37 = v14;
            _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Got nil factorName for factorLevel %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceResolver, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end