@interface TRIFactorDownloadValidator
+ (BOOL)validateDownloadForFactors:(id)a3 withNamespace:(id)a4 paths:(id)a5 container:(int *)a6 factorsState:(id)a7 assetIndexesByTreatment:(id *)a8 experimentIds:(id *)a9 assetIdsByFactorPack:(id *)a10 rolloutFactorNames:(id *)location rolloutDeployments:(id *)a12 error:(id *)a13;
@end

@implementation TRIFactorDownloadValidator

+ (BOOL)validateDownloadForFactors:(id)a3 withNamespace:(id)a4 paths:(id)a5 container:(int *)a6 factorsState:(id)a7 assetIndexesByTreatment:(id *)a8 experimentIds:(id *)a9 assetIdsByFactorPack:(id *)a10 rolloutFactorNames:(id *)location rolloutDeployments:(id *)a12 error:(id *)a13
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  context = (void *)MEMORY[0x19F3AD060]();
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__6;
  v66 = __Block_byref_object_dispose__6;
  id v67 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  int v61 = 0;
  id v56 = 0;
  id v57 = 0;
  id obj = 0;
  id v55 = 0;
  v52[4] = &v62;
  id v53 = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke;
  v52[3] = &unk_1E596AF60;
  v20 = (void *)MEMORY[0x19F3AD290](v52);
  char v21 = (char)a13;
  if (![v16 count])
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v76 = *MEMORY[0x1E4F28568];
    v77[0] = @"Factors must be non-empty.";
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
    uint64_t v32 = [v31 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v30];
LABEL_12:
    id v34 = (id)v32;
LABEL_14:
    v28 = 0;
    goto LABEL_15;
  }
  if (!v17)
  {
    id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v74 = *MEMORY[0x1E4F28568];
    v75 = @"Namespace name must be non-nil.";
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    uint64_t v32 = [v33 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v30];
    goto LABEL_12;
  }
  if (!+[TRIXPCUtils validateSafeASCIISubsetIdentifier:v17])
  {
    v30 = (void *)[[NSString alloc] initWithFormat:@"namespaceName(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)", v17];
    id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v72 = *MEMORY[0x1E4F28568];
    v73 = v30;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    id v34 = (id)[v35 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v36];

    goto LABEL_14;
  }
  v22 = [[TRINamespaceResolver alloc] initWithPaths:v18 factorsState:v19];
  v23 = v22;
  if (v22)
  {
    char v51 = 0;
    v24 = [(TRINamespaceResolver *)v22 resolveFactorProviderChainForNamespaceName:v17 faultOnMissingInstalledFactors:0 installedFactorsAccessible:&v51];
    v25 = v24;
    if (!v51)
    {
      uint64_t v26 = objc_msgSend(v24, "_pas_filteredArrayWithTest:", &__block_literal_global_14);

      v27 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v17;
        _os_log_impl(&dword_19D909000, v27, OS_LOG_TYPE_DEFAULT, "encountered inaccessible installed factors during on-demand validation for namespace %@", buf, 0xCu);
      }

      v25 = (void *)v26;
    }
    v28 = [[TRINamespaceFactorProviderChain alloc] initWithNamespaceName:v17 typedProviderChain:v25 paths:v18];

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke_92;
    v46[3] = &unk_1E596AFA8;
    v49 = &v62;
    id v47 = v17;
    v50 = &v58;
    id v48 = v20;
    [(TRINamespaceFactorProviderChain *)v28 computeTreatmentAssetIndexes:&v57 withAssociatedExperimentIds:&v56 andFactorPackAssetIds:&v55 withAssociatedRolloutDeployments:&v53 withExperimentFactorNames:0 andRolloutFactorNames:&obj forFactors:v16 usingFilter:v46];

    int v29 = 0;
    v30 = 0;
  }
  else
  {
    v38 = (void *)[[NSString alloc] initWithFormat:@"Unable to resolve namespaces for stale factorsState: %@", v19];
    id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v70 = *MEMORY[0x1E4F28568];
    v71 = v38;
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    v30 = (void *)[v39 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v40];

    v28 = 0;
    int v29 = 2;
  }
  [(TRINamespaceFactorProviderChain *)v28 dispose];
  if (v29 == 2)
  {
    id v34 = v30;
    if (!a13) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (location) {
    objc_storeStrong(location, obj);
  }
  v41 = (void *)v63[5];
  if (v41)
  {
    id v34 = v41;
LABEL_15:

    if (!a13)
    {
LABEL_17:
      v30 = v34;
      goto LABEL_18;
    }
LABEL_16:
    objc_storeStrong(a13, v34);
    char v21 = 0;
    goto LABEL_17;
  }
  if (a13)
  {
    id v42 = *a13;
    *a13 = 0;
  }
  if (a8) {
    objc_storeStrong(a8, v57);
  }
  if (a9) {
    objc_storeStrong(a9, v56);
  }
  if (a10) {
    objc_storeStrong(a10, v55);
  }
  if (a12) {
    objc_storeStrong(a12, v53);
  }
  if (a6) {
    *a6 = *((_DWORD *)v59 + 6);
  }
  char v21 = 1;
LABEL_18:

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v21 & 1;
}

void __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a2;
    id v7 = [v5 alloc];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v9 = [v7 initWithDomain:@"TRIGeneralErrorDomain" code:a3 userInfo:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

BOOL __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] != 1;
}

uint64_t __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke_92(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v31 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v33 = v31;
      _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "Error downloading on-demand asset, %@", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void *)(v11 + 40);
    uint64_t v12 = (id *)(v11 + 40);
    if (!v13) {
      objc_storeStrong(v12, a4);
    }
    goto LABEL_23;
  }
  if ([v8 isOnDemand])
  {
    if (![v8 hasPath]
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v8 path],
          v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v14 fileExistsAtPath:v15],
          v15,
          v14,
          !v16))
    {
      v22 = [v8 asset];
      int v23 = [v22 hasCloudKitContainer];

      if (v23)
      {
        v24 = [v8 asset];
        uint64_t v25 = [v24 cloudKitContainer];
      }
      else
      {
        uint64_t v25 = 1;
      }
      uint64_t v26 = *(void *)(a1[7] + 8);
      int v27 = *(_DWORD *)(v26 + 24);
      if (v27)
      {
        if (v27 != v25)
        {
          id v17 = [[NSString alloc] initWithFormat:@"Factor \"%@\" in namespace \"%@\" has mismatched cloudKitContainer (%d, %d) and cannot be downloaded on-demand.", v7, a1[4], *(unsigned int *)(*(void *)(a1[7] + 8) + 24), v25];
          v28 = TRILogCategory_ClientFramework();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v17;
            _os_log_error_impl(&dword_19D909000, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          (*(void (**)(void))(a1[5] + 16))();
          goto LABEL_22;
        }
      }
      else
      {
        *(_DWORD *)(v26 + 24) = v25;
      }
      uint64_t v29 = 1;
      goto LABEL_24;
    }
    id v17 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = a1[4];
      id v19 = [v8 path];
      *(_DWORD *)buf = 138412802;
      id v33 = v7;
      __int16 v34 = 2112;
      uint64_t v35 = v18;
      __int16 v36 = 2112;
      v37 = v19;
      v20 = "Skipping on-demand fetch of factor \"%@\" in namespace \"%@\" which already has local path: %@";
LABEL_13:
      _os_log_impl(&dword_19D909000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0x20u);
    }
  }
  else
  {
    id v17 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = a1[4];
      id v19 = [v8 path];
      *(_DWORD *)buf = 138412802;
      id v33 = v7;
      __int16 v34 = 2112;
      uint64_t v35 = v21;
      __int16 v36 = 2112;
      v37 = v19;
      v20 = "Skipping on-demand fetch of factor \"%@\" in namespace \"%@\" which is not on-demand: %@";
      goto LABEL_13;
    }
  }
LABEL_22:

LABEL_23:
  uint64_t v29 = 0;
LABEL_24:

  return v29;
}

@end