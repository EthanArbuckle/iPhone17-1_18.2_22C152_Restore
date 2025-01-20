@interface TRIClientTreatment(TRIUtil)
- (TRIGenericRequiredAssets)requiredAssetsForInstallationForNamespace:()TRIUtil assetStore:maProvider:subscriptionSettings:aliasToUnaliasMap:;
- (id)_triCollectMetadataForAssetsWithTest:()TRIUtil;
- (id)_triRequiredCKAssetsForInstallationWithAssetStore:()TRIUtil subscriptionSettings:aliasToUnaliasMap:;
- (id)_triRequiredMAAssetsForInstallationWithAssetStore:()TRIUtil subscriptionSettings:maProvider:aliasToUnaliasMap:;
- (id)unlinkedOnDemandAssets;
- (uint64_t)_triEnumerateMAFactorLevelsWithBlock:()TRIUtil;
@end

@implementation TRIClientTreatment(TRIUtil)

- (id)_triCollectMetadataForAssetsWithTest:()TRIUtil
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E016E7F0]();
  v6 = objc_opt_new();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v65 = a1;
  v7 = [a1 factorLevelArray];
  uint64_t v69 = [v7 countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (v69)
  {
    uint64_t v8 = *(void *)v73;
    v62 = v6;
    v63 = v4;
    v64 = v7;
    v59 = v5;
    uint64_t v68 = *(void *)v73;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v73 != v8) {
        objc_enumerationMutation(v7);
      }
      v10 = *(void **)(*((void *)&v72 + 1) + 8 * v9);
      v11 = objc_msgSend(v10, "factor", v59);
      char v12 = [v11 hasName];

      if ((v12 & 1) == 0) {
        break;
      }
      v13 = [v10 factor];
      char v14 = [v13 hasNamespaceName];

      if ((v14 & 1) == 0)
      {
        v49 = TRILogCategory_Server();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        v50 = [v65 treatmentId];
        *(_DWORD *)buf = 138412290;
        v77 = v50;
        v51 = "Treatment %@ has missing namespace name.";
        goto LABEL_37;
      }
      unsigned __int8 v71 = 0;
      v15 = [v10 level];
      v16 = [v15 fileOrDirectoryLevelWithIsDir:&v71];
      v17 = v16;
      if (v16)
      {
        if (![v16 hasAsset]
          || ([v17 asset],
              v18 = objc_claimAutoreleasedReturnValue(),
              char v19 = [v18 hasAssetId],
              v18,
              (v19 & 1) == 0))
        {
          v45 = TRILogCategory_Server();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = [v65 treatmentId];
            v47 = [v10 factor];
            v48 = [v47 name];
            *(_DWORD *)buf = 138412546;
            v77 = v46;
            __int16 v78 = 2114;
            v79 = v48;
            _os_log_error_impl(&dword_1DA291000, v45, OS_LOG_TYPE_ERROR, "Treatment %@ has missing asset id for factor %{public}@.", buf, 0x16u);
          }
LABEL_31:
          v5 = v59;

LABEL_32:
          id v44 = 0;
          goto LABEL_33;
        }
        v20 = [v17 asset];
        v21 = [v20 assetId];
        v22 = TRIValidateAssetId();

        if (!v22)
        {
          v45 = TRILogCategory_Server();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v53 = [v65 treatmentId];
            v54 = [v17 asset];
            [v54 assetId];
            v56 = v55 = v15;
            v57 = [v10 factor];
            v58 = [v57 name];
            *(_DWORD *)buf = 138412802;
            v77 = v53;
            __int16 v78 = 2114;
            v79 = v56;
            __int16 v80 = 2114;
            v81 = v58;
            _os_log_error_impl(&dword_1DA291000, v45, OS_LOG_TYPE_ERROR, "Treatment %@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);

            v7 = v64;
            v15 = v55;
          }
          goto LABEL_31;
        }
        v70 = v15;
        unsigned int v23 = v71;
        v24 = (void *)MEMORY[0x1E016E7F0]();
        if (v4[2](v4, v22, v10, v17))
        {
          unsigned int v66 = v23;
          v67 = v24;
          v25 = [v15 metadata];
          BOOL v26 = +[TRIAssetMetadataReservedKeys isEncryptedForMetadata:v25];

          v27 = [TRITreatmentQualifiedAssetIndex alloc];
          v28 = [v65 treatmentId];
          v29 = [v17 asset];
          uint64_t v30 = -[TRITreatmentQualifiedAssetIndex initWithTreatmentId:index:](v27, "initWithTreatmentId:index:", v28, [v29 cloudKitIndex]);

          v31 = [v70 metadata];
          v32.var0 = (unint64_t)+[TRIAssetMetadataReservedKeys compressionModeForMetadata:v31];

          v33 = [TRICKAssetMetadata alloc];
          if (v26)
          {
            v61 = [v10 factor];
            uint64_t v34 = [v61 namespaceName];
            v60 = (void *)v34;
          }
          else
          {
            uint64_t v34 = 0;
          }
          v35 = [v17 asset];
          uint64_t v36 = [v35 size];
          v37 = v33;
          v38 = (void *)v30;
          v39 = [(TRICKAssetMetadata *)v37 initWithType:v66 namespaceNameForEncryptionKey:v34 treatmentIndex:v30 downloadSize:v36 compressionMode:v32.var0];

          if (v26)
          {
          }
          v40 = [TRIRequiredCloudKitAsset alloc];
          v41 = [v10 factor];
          v42 = [v41 name];
          v43 = -[TRIRequiredCloudKitAsset initWithFactorName:isInstalled:isOnDemand:assetId:metadata:](v40, "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", v42, 0, [v17 isOnDemand], v22, v39);

          v6 = v62;
          [v62 addObject:v43];

          v4 = v63;
          v7 = v64;
          v24 = v67;
        }

        v15 = v70;
        uint64_t v8 = v68;
      }

      if (v69 == ++v9)
      {
        v5 = v59;
        uint64_t v69 = [v7 countByEnumeratingWithState:&v72 objects:v82 count:16];
        if (v69) {
          goto LABEL_3;
        }
        goto LABEL_22;
      }
    }
    v49 = TRILogCategory_Server();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
LABEL_28:

      v5 = v59;
      goto LABEL_32;
    }
    v50 = [v65 treatmentId];
    *(_DWORD *)buf = 138412290;
    v77 = v50;
    v51 = "Treatment %@ has missing factor name.";
LABEL_37:
    _os_log_error_impl(&dword_1DA291000, v49, OS_LOG_TYPE_ERROR, v51, buf, 0xCu);

    goto LABEL_28;
  }
LABEL_22:

  id v44 = v6;
LABEL_33:

  return v44;
}

- (id)_triRequiredCKAssetsForInstallationWithAssetStore:()TRIUtil subscriptionSettings:aliasToUnaliasMap:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__TRIClientTreatment_TRIUtil___triRequiredCKAssetsForInstallationWithAssetStore_subscriptionSettings_aliasToUnaliasMap___block_invoke;
  v16[3] = &unk_1E6BBE5F0;
  id v17 = v9;
  id v18 = v10;
  id v19 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  char v14 = [a1 _triCollectMetadataForAssetsWithTest:v16];

  return v14;
}

- (TRIGenericRequiredAssets)requiredAssetsForInstallationForNamespace:()TRIUtil assetStore:maProvider:subscriptionSettings:aliasToUnaliasMap:
{
  if (a7) {
    id v11 = a7;
  }
  else {
    id v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = [a1 _triRequiredCKAssetsForInstallationWithAssetStore:v15 subscriptionSettings:v13 aliasToUnaliasMap:v11];
  id v17 = [a1 _triRequiredMAAssetsForInstallationWithAssetStore:v15 subscriptionSettings:v13 maProvider:v14 aliasToUnaliasMap:v11];

  id v18 = [TRIGenericRequiredAssets alloc];
  if (v16) {
    id v19 = v16;
  }
  else {
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v20 = [(TRIGenericRequiredAssets *)v18 initWithCloudKit:v19 mobileAsset:v17];

  return v20;
}

- (id)_triRequiredMAAssetsForInstallationWithAssetStore:()TRIUtil subscriptionSettings:maProvider:aliasToUnaliasMap:
{
  id v26 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E016E7F0]();
  id v14 = objc_opt_new();
  id v15 = objc_opt_new();
  v16 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__58;
  v41 = __Block_byref_object_dispose__58;
  id v42 = (id)objc_opt_new();
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke;
  v36[3] = &unk_1E6BBE618;
  v36[4] = a1;
  v36[5] = &v37;
  if (([a1 _triEnumerateMAFactorLevelsWithBlock:v36] & 1) != 0 && v38[5])
  {
    id v17 = objc_msgSend(v11, "installedAssetsMatchingFullAssetIds:");
    if (v17)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke_289;
      v34[3] = &unk_1E6BBE0B0;
      id v35 = v15;
      [v17 enumerateKeysAndObjectsUsingBlock:v34];

      int v18 = 0;
    }
    else
    {
      id v20 = v14;
      int v18 = 1;
    }
  }
  else
  {
    id v19 = v14;
    int v18 = 1;
  }
  _Block_object_dispose(&v37, 8);

  v21 = v14;
  if (!v18)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke_2;
    v27[3] = &unk_1E6BBE640;
    uint64_t v33 = a2;
    id v28 = v12;
    v29 = a1;
    id v30 = v15;
    id v31 = v10;
    id v22 = v14;
    id v32 = v22;
    if ([a1 _triEnumerateMAFactorLevelsWithBlock:v27]) {
      id v23 = v22;
    }
    else {
      id v23 = (id)objc_opt_new();
    }
    v21 = v23;
  }

  return v21;
}

- (uint64_t)_triEnumerateMAFactorLevelsWithBlock:()TRIUtil
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E016E7F0]();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v6 = [a1 factorLevelArray];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v23 = a1;
    v24 = v5;
    uint64_t v9 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v11, "hasLevel", v23) & 1) == 0)
        {
          id v14 = TRILogCategory_Server();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v22 = [v23 treatmentId];
            *(_DWORD *)buf = 138543362;
            id v30 = v22;
            _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has missing level.", buf, 0xCu);
          }
          uint64_t v19 = 0;
          goto LABEL_23;
        }
        if (![v11 hasFactor]
          || ([v11 factor],
              id v12 = objc_claimAutoreleasedReturnValue(),
              char v13 = [v12 hasName],
              v12,
              (v13 & 1) == 0))
        {
          id v14 = TRILogCategory_Server();
          v5 = v24;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v21 = [v23 treatmentId];
            *(_DWORD *)buf = 138543362;
            id v30 = v21;
            _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has missing factor name.", buf, 0xCu);

            v5 = v24;
          }
          uint64_t v19 = 0;
          goto LABEL_24;
        }
        id v14 = [v11 level];
        int v15 = [v14 levelOneOfCase];
        if (v4)
        {
          if (v15 == 104)
          {
            buf[0] = 0;
            v16 = [v11 factor];
            id v17 = [v14 mobileAssetReferenceValue];
            int v18 = [v14 metadata];
            v4[2](v4, v16, v17, v18, buf);

            if (buf[0])
            {
              uint64_t v19 = 1;
LABEL_23:
              v5 = v24;
LABEL_24:

              goto LABEL_25;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
      uint64_t v19 = 1;
      v5 = v24;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v19 = 1;
  }
LABEL_25:

  return v19;
}

- (id)unlinkedOnDemandAssets
{
  v2 = objc_opt_new();
  v3 = [a1 _triCollectMetadataForAssetsWithTest:&__block_literal_global_35];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__TRIClientTreatment_TRIUtil__unlinkedOnDemandAssets__block_invoke_2;
  v6[3] = &unk_1E6BBA900;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:v6];

  return v4;
}

@end