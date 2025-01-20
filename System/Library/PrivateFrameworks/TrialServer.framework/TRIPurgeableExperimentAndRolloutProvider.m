@interface TRIPurgeableExperimentAndRolloutProvider
- (BOOL)_checkForPurgeableFactorsInEagerFactors:(id)a3 factorLevel:(id)a4 legacyPath:(id)a5 overriddenFactors:(id)a6 purgeableNamespaces:(id)a7 returningAssets:(id)a8;
- (BOOL)_factorPackSetHasPurgeableFactorsWithFPSId:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5 purgeableNamespaces:(id)a6 returningAssets:(id)a7;
- (TRIPurgeableExperimentAndRolloutProvider)initWithPaths:(id)a3 experimentDatabase:(id)a4 rolloutDatabase:(id)a5;
- (id)purgeableExperimentAssetsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5;
- (id)purgeableExperimentsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5;
- (id)purgeableRolloutAssetsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5;
- (id)purgeableRolloutsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5;
- (void)_purgeablesForExperimentsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5 shouldGenerateAssetPaths:(BOOL)a6 purgeableExperiments:(id *)a7 purgeableAssets:(id *)a8;
- (void)_purgeablesForRolloutsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5 shouldGenerateAssetPaths:(BOOL)a6 purgeableExperiments:(id *)a7 purgeableAssets:(id *)a8;
@end

@implementation TRIPurgeableExperimentAndRolloutProvider

- (TRIPurgeableExperimentAndRolloutProvider)initWithPaths:(id)a3 experimentDatabase:(id)a4 rolloutDatabase:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIPurgeableExperimentAndRolloutProvider;
  v12 = [(TRIPurgeableExperimentAndRolloutProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paths, a3);
    objc_storeStrong((id *)&v13->_experimentDatabase, a4);
    objc_storeStrong((id *)&v13->_rolloutDatabase, a5);
  }

  return v13;
}

- (id)purgeableExperimentsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v17 = [v8 set];
  v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purgeable experiments.", buf, 2u);
  }

  [(TRIPurgeableExperimentAndRolloutProvider *)self _purgeablesForExperimentsFromNamespaces:v11 eagerFactors:v10 overriddenFactors:v9 shouldGenerateAssetPaths:0 purgeableExperiments:&v17 purgeableAssets:0];
  v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v17 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v14;
    _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable experiments.", buf, 0xCu);
  }

  id v15 = v17;
  return v15;
}

- (id)purgeableExperimentAssetsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v17 = [v8 dictionary];
  v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purgeable experiment regular (not on-demand) assets.", buf, 2u);
  }

  [(TRIPurgeableExperimentAndRolloutProvider *)self _purgeablesForExperimentsFromNamespaces:v11 eagerFactors:v10 overriddenFactors:v9 shouldGenerateAssetPaths:1 purgeableExperiments:0 purgeableAssets:&v17];
  v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v17 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v14;
    _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable experiment assets.", buf, 0xCu);
  }

  id v15 = v17;
  return v15;
}

- (id)purgeableRolloutsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v17 = [v8 set];
  v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purgeable rollouts.", buf, 2u);
  }

  [(TRIPurgeableExperimentAndRolloutProvider *)self _purgeablesForRolloutsFromNamespaces:v11 eagerFactors:v10 overriddenFactors:v9 shouldGenerateAssetPaths:0 purgeableExperiments:&v17 purgeableAssets:0];
  v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v17 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v14;
    _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable rollouts.", buf, 0xCu);
  }

  id v15 = v17;
  return v15;
}

- (id)purgeableRolloutAssetsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v17 = [v8 dictionary];
  v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purgeable rollout regular (not on-demand) assets.", buf, 2u);
  }

  [(TRIPurgeableExperimentAndRolloutProvider *)self _purgeablesForRolloutsFromNamespaces:v11 eagerFactors:v10 overriddenFactors:v9 shouldGenerateAssetPaths:1 purgeableExperiments:0 purgeableAssets:&v17];
  v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v17 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v14;
    _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable rollout assets.", buf, 0xCu);
  }

  id v15 = v17;
  return v15;
}

- (void)_purgeablesForExperimentsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5 shouldGenerateAssetPaths:(BOOL)a6 purgeableExperiments:(id *)a7 purgeableAssets:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if ([v14 count] || objc_msgSend(v15, "count"))
  {
    *(void *)buf = 0;
    v53 = buf;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__34;
    v56 = __Block_byref_object_dispose__34;
    v57 = 0;
    uint64_t v46 = 0;
    v47 = (uint8_t *)&v46;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__34;
    v50 = __Block_byref_object_dispose__34;
    id v51 = 0;
    if (v10)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v18 = v53;
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v18 = v47;
    }
    uint64_t v19 = (void *)*((void *)v18 + 5);
    *((void *)v18 + 5) = v17;

    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy__34;
    v44[4] = __Block_byref_object_dispose__34;
    v45 = [[TRIClientTreatmentStorage alloc] initWithPaths:self->_paths];
    experimentDatabase = self->_experimentDatabase;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __177__TRIPurgeableExperimentAndRolloutProvider__purgeablesForExperimentsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke;
    v35 = &unk_1E6BBC970;
    id v36 = v14;
    id v37 = v15;
    BOOL v43 = v10;
    id v38 = v16;
    v39 = self;
    v40 = v44;
    v41 = buf;
    v42 = &v46;
    [(TRIExperimentDatabase *)experimentDatabase enumerateExperimentRecordsWithBlock:&v32];
    if (a8)
    {
      v21 = (void *)*((void *)v53 + 5);
      if (v21)
      {
        v22 = objc_msgSend(v21, "copy", v32, v33, v34, v35, v36, v37);
        id v23 = *a8;
        *a8 = v22;
      }
    }
    if (a7)
    {
      v24 = (void *)*((void *)v47 + 5);
      if (v24)
      {
        v25 = (void *)[v24 copy];
        id v26 = *a7;
        *a7 = v25;
      }
    }

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(buf, 8);
    id v27 = v57;
    goto LABEL_13;
  }
  v28 = TRILogCategory_Server();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEFAULT, "Stopping search for purgeable experiments as there are no purgeable namespaces or factors", buf, 2u);
  }

  if (a8)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v30 = *a8;
    *a8 = v29;
  }
  if (a7)
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v27 = *a7;
    *a7 = v31;
LABEL_13:
  }
}

void __177__TRIPurgeableExperimentAndRolloutProvider__purgeablesForExperimentsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 status] == 1 && !objc_msgSend(v3, "deploymentEnvironment"))
  {
    v7 = [v3 namespaces];
    uint64_t v8 = [v7 count];

    if (v8 != 1)
    {
      id v9 = TRILogCategory_Server();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Purgeable experiment candidate has too many namespace associated with it.", buf, 2u);
      }
    }
    BOOL v10 = [v3 namespaces];
    id v11 = [v10 firstObject];
    v4 = [v11 name];

    if (v4)
    {
      v12 = [v3 treatmentId];

      if (v12)
      {
        int v13 = [*(id *)(a1 + 32) containsObject:v4];
        id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
        if (!v14 && (v13 & 1) == 0)
        {
          id v15 = TRILogCategory_Server();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = [v3 experimentDeployment];
            id v17 = [v16 experimentId];
            *(_DWORD *)buf = 138543362;
            v81 = v17;
            _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Skipping experiment %{public}@ without eager factors or purgeable namespace while looking for purgeable experiments", buf, 0xCu);
          }
          goto LABEL_63;
        }
        int v66 = v13;
        v68 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
        if (*(unsigned char *)(a1 + 88)) {
          id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        else {
          id v67 = 0;
        }
        v21 = [v3 factorPackSetId];

        if (v21)
        {
          v22 = *(void **)(a1 + 56);
          id v23 = [v3 factorPackSetId];
          int v69 = [v22 _factorPackSetHasPurgeableFactorsWithFPSId:v23 eagerFactors:*(void *)(a1 + 40) overriddenFactors:*(void *)(a1 + 48) purgeableNamespaces:*(void *)(a1 + 32) returningAssets:v67];
        }
        else
        {
          int v69 = 0;
        }
        v24 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        v25 = [v3 treatmentId];
        uint64_t v26 = [v24 loadTreatmentWithTreatmentId:v25 isFilePresent:0];

        v63 = (void *)v26;
        if (v26)
        {
          if (*(unsigned char *)(a1 + 88))
          {
            id v27 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
            v28 = [v3 treatmentId];
            v65 = [v27 urlForFactorsWithTreatmentId:v28 namespaceName:v4];
          }
          else
          {
            v65 = 0;
          }
          int v29 = v66;
          uint64_t v71 = a1;
          v61 = v4;
          id v62 = v3;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id obj = [v63 factorLevelArray];
          uint64_t v30 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v72 = *(void *)v75;
            v64 = v14;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v75 != v72) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v33 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                v34 = fileFromFactor(v33);
                v35 = v34;
                if (v34)
                {
                  id v36 = [v34 asset];
                  id v37 = [v36 assetId];
                  id v38 = TRIValidateAssetId();

                  if (*(unsigned char *)(v71 + 88))
                  {
                    v39 = [v35 path];
                    uint64_t v40 = [v39 length];

                    if (v40 && v38 != 0)
                    {
                      v42 = [v67 objectForKeyedSubscript:v38];
                      if (v42)
                      {
                        [v67 setObject:v42 forKeyedSubscript:v38];
                      }
                      else
                      {
                        BOOL v43 = objc_opt_new();
                        [v67 setObject:v43 forKeyedSubscript:v38];
                      }
                      v44 = [v67 objectForKeyedSubscript:v38];
                      v45 = [v35 path];
                      [v44 addObject:v45];

                      uint64_t v46 = [v65 triPathAsOwner:0];
                      v47 = [v46 stringByDeletingLastPathComponent];

                      uint64_t v48 = [v35 path];
                      v49 = [v48 lastPathComponent];

                      v50 = NSString;
                      v78[0] = v47;
                      v78[1] = @"assets";
                      v78[2] = v49;
                      id v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:3];
                      v52 = [v50 pathWithComponents:v51];

                      v53 = [v67 objectForKeyedSubscript:v38];
                      [v53 addObject:v52];

                      id v14 = v64;
                      int v29 = v66;
                    }
                  }
                }
                if (factorIsValidRegularFileFactor(v33))
                {
                  uint64_t v54 = [v33 factor];
                  v55 = [v54 name];

                  if (v29 && ![v68 containsObject:v55]
                    || [v14 containsObject:v55])
                  {
                    LOBYTE(v69) = 1;
                  }
                }
              }
              uint64_t v31 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
            }
            while (v31);
          }

          v4 = v61;
          id v3 = v62;
          a1 = v71;
          if ((v69 & 1) == 0) {
            goto LABEL_62;
          }
        }
        else if (!v69)
        {
LABEL_62:

          id v15 = v68;
LABEL_63:

          goto LABEL_64;
        }
        v56 = TRILogCategory_Server();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = [v3 experimentDeployment];
          v58 = [v57 experimentId];
          *(_DWORD *)buf = 138543362;
          v81 = v58;
          _os_log_impl(&dword_1DA291000, v56, OS_LOG_TYPE_DEFAULT, "Found purgeable experiment %{public}@", buf, 0xCu);
        }
        if (*(unsigned char *)(a1 + 88))
        {
          v73[0] = MEMORY[0x1E4F143A8];
          v73[1] = 3221225472;
          v73[2] = __177__TRIPurgeableExperimentAndRolloutProvider__purgeablesForExperimentsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke_25;
          v73[3] = &unk_1E6BBC948;
          v73[4] = *(void *)(a1 + 72);
          [v67 enumerateKeysAndObjectsUsingBlock:v73];
        }
        else
        {
          v59 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          v60 = [v3 experimentDeployment];
          [v59 addObject:v60];
        }
        goto LABEL_62;
      }
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = [v3 experimentDeployment];
        uint64_t v19 = [v18 experimentId];
        *(_DWORD *)buf = 138543362;
        v81 = v19;
        uint64_t v20 = "Skipping experiment %{public}@ with no treatment ID.";
        goto LABEL_19;
      }
    }
    else
    {
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = [v3 experimentDeployment];
        uint64_t v19 = [v18 experimentId];
        *(_DWORD *)buf = 138543362;
        v81 = v19;
        uint64_t v20 = "Skipping experiment %{public}@ with no namespace name.";
LABEL_19:
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
      }
    }
LABEL_64:

    goto LABEL_65;
  }
  v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 experimentDeployment];
    v6 = [v5 experimentId];
    *(_DWORD *)buf = 138543362;
    v81 = v6;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Skipping inactive experiment %{public}@ while looking for purgeable experiments", buf, 0xCu);
  }
LABEL_65:
}

void __177__TRIPurgeableExperimentAndRolloutProvider__purgeablesForExperimentsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:v10];
  uint64_t v8 = v7;
  if (!v7) {
    uint64_t v8 = objc_opt_new();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v8 forKeyedSubscript:v10];
  if (!v7) {

  }
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v10];
  [v9 unionSet:v6];
}

- (BOOL)_checkForPurgeableFactorsInEagerFactors:(id)a3 factorLevel:(id)a4 legacyPath:(id)a5 overriddenFactors:(id)a6 purgeableNamespaces:(id)a7 returningAssets:(id)a8
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = fileFromFactor(v14);
  uint64_t v20 = v19;
  v53 = v18;
  if (v19)
  {
    v21 = [v19 asset];
    v22 = [v21 assetId];
    id v23 = TRIValidateAssetId();

    if (v18)
    {
      v24 = [v20 path];
      uint64_t v25 = [v24 length];

      if (v25)
      {
        if (v23)
        {
          uint64_t v26 = [v18 objectForKeyedSubscript:v23];
          if (v26)
          {
            [v18 setObject:v26 forKeyedSubscript:v23];
          }
          else
          {
            id v27 = objc_opt_new();
            [v18 setObject:v27 forKeyedSubscript:v23];
          }
          v28 = [v18 objectForKeyedSubscript:v23];
          int v29 = [v20 path];
          [v28 addObject:v29];

          if ([v15 length])
          {
            uint64_t v30 = [v20 path];
            [v30 lastPathComponent];
            id v31 = v17;
            id v32 = v15;
            v34 = id v33 = v13;

            v35 = NSString;
            v54[0] = v32;
            v54[1] = @"assets";
            v54[2] = v34;
            id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
            id v37 = [v35 pathWithComponents:v36];

            id v38 = [v53 objectForKeyedSubscript:v23];
            [v38 addObject:v37];

            id v13 = v33;
            id v15 = v32;
            id v17 = v31;
          }
        }
      }
    }
  }
  if (factorIsValidRegularFileFactor(v14))
  {
    v52 = v13;
    v39 = [v14 factor];
    uint64_t v40 = [v39 namespaceName];

    v41 = [v14 factor];
    v42 = [v41 name];

    int v43 = [v17 containsObject:v40];
    if (v43)
    {
      v44 = [v16 objectForKeyedSubscript:v40];
      if (![v44 containsObject:v42])
      {
        char v49 = 1;
LABEL_19:

LABEL_20:
        id v13 = v52;
        goto LABEL_21;
      }
      id v51 = v44;
    }
    [v52 objectForKeyedSubscript:v40];
    id v45 = v17;
    id v46 = v16;
    uint64_t v48 = v47 = v15;
    char v49 = [v48 containsObject:v42];

    id v15 = v47;
    id v16 = v46;
    id v17 = v45;
    v44 = v51;
    if (!v43) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  char v49 = 0;
LABEL_21:

  return v49;
}

- (void)_purgeablesForRolloutsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5 shouldGenerateAssetPaths:(BOOL)a6 purgeableExperiments:(id *)a7 purgeableAssets:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if ([v14 count] || objc_msgSend(v15, "count"))
  {
    *(void *)buf = 0;
    id v47 = buf;
    uint64_t v48 = 0x3032000000;
    char v49 = __Block_byref_object_copy__34;
    v50 = __Block_byref_object_dispose__34;
    id v51 = 0;
    uint64_t v40 = 0;
    v41 = (uint8_t *)&v40;
    uint64_t v42 = 0x3032000000;
    int v43 = __Block_byref_object_copy__34;
    v44 = __Block_byref_object_dispose__34;
    id v45 = 0;
    if (v10)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v18 = v47;
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v18 = v41;
    }
    uint64_t v19 = (void *)*((void *)v18 + 5);
    *((void *)v18 + 5) = v17;

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __174__TRIPurgeableExperimentAndRolloutProvider__purgeablesForRolloutsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke;
    v32[3] = &unk_1E6BBC998;
    id v33 = v14;
    BOOL v39 = v10;
    id v34 = v15;
    v35 = self;
    id v36 = v16;
    id v37 = buf;
    id v38 = &v40;
    uint64_t v20 = (void *)MEMORY[0x1E016EA80](v32);
    [(TRIRolloutDatabase *)self->_rolloutDatabase enumerateRecordsUsingTransaction:0 block:v20];
    if (a8)
    {
      v21 = (void *)*((void *)v47 + 5);
      if (v21)
      {
        v22 = (void *)[v21 copy];
        id v23 = *a8;
        *a8 = v22;
      }
    }
    if (a7)
    {
      v24 = (void *)*((void *)v41 + 5);
      if (v24)
      {
        uint64_t v25 = (void *)[v24 copy];
        id v26 = *a7;
        *a7 = v25;
      }
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(buf, 8);
    id v27 = v51;
    goto LABEL_13;
  }
  v28 = TRILogCategory_Server();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEFAULT, "Stopping search for purgeable rollouts as there are no purgeable namespaces or factors", buf, 2u);
  }

  if (a8)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v30 = *a8;
    *a8 = v29;
  }
  if (a7)
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v27 = *a7;
    *a7 = v31;
LABEL_13:
  }
}

void __174__TRIPurgeableExperimentAndRolloutProvider__purgeablesForRolloutsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 status] != 1)
  {
    id v14 = TRILogCategory_Server();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    id v15 = [v3 deployment];
    id v16 = [v15 rolloutId];
    *(_DWORD *)buf = 138543362;
    id v33 = v16;
    id v17 = "Skipping inactive rollout %{public}@ while looking for purgeable rollouts";
    goto LABEL_20;
  }
  v4 = [v3 activeFactorPackSetId];

  if (v4)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v5 = [v3 namespaces];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      unsigned __int8 v9 = 0;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v8 |= [*(id *)(a1 + 32) containsObject:v12];
          id v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
          v9 |= v13 != 0;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v7);

      if ((v9 | v8))
      {
        if (*(unsigned char *)(a1 + 80)) {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        else {
          id v14 = 0;
        }
        id v18 = *(void **)(a1 + 48);
        uint64_t v19 = [v3 activeFactorPackSetId];
        LODWORD(v18) = [v18 _factorPackSetHasPurgeableFactorsWithFPSId:v19 eagerFactors:*(void *)(a1 + 40) overriddenFactors:*(void *)(a1 + 56) purgeableNamespaces:*(void *)(a1 + 32) returningAssets:v14];

        if (v18)
        {
          uint64_t v20 = TRILogCategory_Server();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [v3 deployment];
            v22 = [v21 rolloutId];
            *(_DWORD *)buf = 138543362;
            id v33 = v22;
            _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "Found purgeable rollout %{public}@", buf, 0xCu);
          }
          if (*(unsigned char *)(a1 + 80))
          {
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __174__TRIPurgeableExperimentAndRolloutProvider__purgeablesForRolloutsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke_28;
            v26[3] = &unk_1E6BBC948;
            v26[4] = *(void *)(a1 + 64);
            [v14 enumerateKeysAndObjectsUsingBlock:v26];
          }
          else
          {
            id v23 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            v24 = [v3 deployment];
            uint64_t v25 = [v24 rolloutId];
            [v23 addObject:v25];
          }
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
    id v14 = TRILogCategory_Server();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    id v15 = [v3 deployment];
    id v16 = [v15 rolloutId];
    *(_DWORD *)buf = 138543362;
    id v33 = v16;
    id v17 = "Skipping rollout %{public}@ without eager factors or purgeable namespace while looking for purgeable rollouts";
LABEL_20:
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);

    goto LABEL_21;
  }
  id v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v3;
    _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Found \"active\" rollout with missing activeFactorPackSetId: %{public}@", buf, 0xCu);
  }
LABEL_21:
}

void __174__TRIPurgeableExperimentAndRolloutProvider__purgeablesForRolloutsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:v10];
  int v8 = v7;
  if (!v7) {
    int v8 = objc_opt_new();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v8 forKeyedSubscript:v10];
  if (!v7) {

  }
  unsigned __int8 v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v10];
  [v9 unionSet:v6];
}

- (BOOL)_factorPackSetHasPurgeableFactorsWithFPSId:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5 purgeableNamespaces:(id)a6 returningAssets:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [[TRIFactorPackSetStorage alloc] initWithPaths:self->_paths];
  id v18 = [[TRIFactorPackStorage alloc] initWithPaths:self->_paths];
  uint64_t v19 = [[TRIFBFactorPackStorage alloc] initWithPaths:self->_paths];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke;
  v27[3] = &unk_1E6BBCA10;
  uint64_t v20 = v19;
  long long v28 = v20;
  long long v29 = self;
  id v21 = v13;
  id v30 = v21;
  id v22 = v14;
  id v31 = v22;
  id v23 = v15;
  id v32 = v23;
  id v24 = v16;
  id v33 = v24;
  v35 = &v36;
  uint64_t v25 = v18;
  uint64_t v34 = v25;
  [(TRIFactorPackSetStorage *)v17 enumerateFactorPacksForFactorPackSet:v12 usingLegacyPaths:0 withBlock:v27];
  LOBYTE(v13) = *((unsigned char *)v37 + 24);

  _Block_object_dispose(&v36, 8);
  return (char)v13;
}

void __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = [v6 levels];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke_2;
    v32[3] = &unk_1E6BBC9C0;
    unsigned __int8 v9 = &v33;
    id v33 = v7;
    id v10 = (id *)v34;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(a1 + 48);
    v34[0] = v11;
    v34[1] = v12;
    id v14 = &v35;
    id v35 = v13;
    id v15 = &v36;
    id v36 = *(id *)(a1 + 56);
    id v16 = &v37;
    id v37 = *(id *)(a1 + 64);
    id v17 = (id *)v38;
    id v18 = *(id *)(a1 + 72);
    uint64_t v19 = *(void *)(a1 + 88);
    v38[0] = v18;
    v38[1] = v19;
    [v8 enumerateObjectsUsingBlock:v32];
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke_35;
    v25[3] = &unk_1E6BBC9E8;
    unsigned __int8 v9 = &v26;
    id v26 = *(id *)(a1 + 80);
    id v10 = (id *)v27;
    id v20 = v5;
    uint64_t v21 = *(void *)(a1 + 40);
    id v22 = *(void **)(a1 + 48);
    v27[0] = v20;
    v27[1] = v21;
    id v14 = &v28;
    id v28 = v22;
    id v15 = &v29;
    id v29 = *(id *)(a1 + 56);
    id v16 = &v30;
    id v30 = *(id *)(a1 + 64);
    id v17 = (id *)v31;
    id v23 = *(id *)(a1 + 72);
    uint64_t v24 = *(void *)(a1 + 88);
    v31[0] = v23;
    v31[1] = v24;
    [v20 enumerateFactorLevelsWithBlock:v25];
  }
}

void __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E016E7F0]();
  id v5 = [*(id *)(a1 + 32) sourceAsFactorPackId];
  id v6 = TRIValidateFactorPackId();

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    int v8 = [*(id *)(a1 + 32) namespaceName];
    unsigned __int8 v9 = [v7 pathForFactorLevelsWithFactorPackId:v6 namespaceName:v8];

    id v10 = (void *)MEMORY[0x1E4FB0170];
    id v11 = [*(id *)(a1 + 32) namespaceName];
    uint64_t v12 = [v10 convertFBFactorLevelToProtoFactorLevel:v3 parentDir:v9 namespaceName:v11 isRelativePath:0];

    id v13 = *(void **)(a1 + 40);
    id v14 = [*(id *)(a1 + 32) namespaceName];
    id v15 = [v13 legacyPathForFactorLevelsWithFactorPackId:v6 namespaceName:v14];

    if ([*(id *)(a1 + 48) _checkForPurgeableFactorsInEagerFactors:*(void *)(a1 + 56) factorLevel:v12 legacyPath:v15 overriddenFactors:*(void *)(a1 + 64) purgeableNamespaces:*(void *)(a1 + 72) returningAssets:*(void *)(a1 + 80)])*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1; {
  }
    }
  else
  {
    unsigned __int8 v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v16 = [*(id *)(a1 + 32) sourceAsFactorPackId];
      int v17 = 138412290;
      id v18 = v16;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Invalid factor pack id %@ while enumerating factor levels:", (uint8_t *)&v17, 0xCu);
    }
  }
}

void __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 factorPackId];
  uint64_t v7 = [*(id *)(a1 + 40) selectedNamespace];
  int v8 = [v7 name];
  id v9 = [v3 legacyPathForFactorPackWithId:v6 namespaceName:v8];

  LODWORD(v3) = [*(id *)(a1 + 48) _checkForPurgeableFactorsInEagerFactors:*(void *)(a1 + 56) factorLevel:v5 legacyPath:v9 overriddenFactors:*(void *)(a1 + 64) purgeableNamespaces:*(void *)(a1 + 72) returningAssets:*(void *)(a1 + 80)];
  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutDatabase, 0);
  objc_storeStrong((id *)&self->_experimentDatabase, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end