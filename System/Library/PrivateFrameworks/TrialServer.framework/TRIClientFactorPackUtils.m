@interface TRIClientFactorPackUtils
+ (BOOL)_enumerateAssetFactorLevelsInFactorPack:(id)a3 trialAssetBlock:(id)a4 maAssetBlock:(id)a5;
+ (BOOL)enumerateMetadataForAssetsInFactorPack:(id)a3 flatbufferFactorLevels:(id)a4 assetStore:(id)a5 maProvider:(id)a6 aliasToUnaliasMap:(id)a7 subscribedFactors:(id)a8 ckBlock:(id)a9 maBlock:(id)a10;
+ (id)aliasesInNamespace:(id)a3;
+ (id)requiredAssetsForInstallationWithFactorPack:(id)a3 assetStore:(id)a4 maProvider:(id)a5 subscriptionSettings:(id)a6 aliasToUnaliasMap:(id)a7;
+ (id)uniqueAssets:(id)a3;
+ (id)unlinkedOnDemandAssetsWithFactorPack:(id)a3 flatbufferFactorLevels:(id)a4 factorPackPath:(id)a5 assetStore:(id)a6 maProvider:(id)a7 aliasToUnaliasMap:(id)a8 subscribedFactors:(id)a9 unlinkedMAAssetsOnDisk:(id *)a10;
+ (void)_enumerateAssetFactorLevelsInFlatBufferStorage:(id)a3 trialAssetBlock:(id)a4 maAssetBlock:(id)a5;
@end

@implementation TRIClientFactorPackUtils

+ (BOOL)_enumerateAssetFactorLevelsInFactorPack:(id)a3 trialAssetBlock:(id)a4 maAssetBlock:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E016E7F0]();
  v11 = [v7 selectedNamespace];
  char v12 = [v11 hasName];

  if (v12)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __97__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFactorPack_trialAssetBlock_maAssetBlock___block_invoke;
    v17[3] = &unk_1E6BBDFE8;
    id v18 = v7;
    p_long long buf = &buf;
    id v19 = v8;
    id v20 = v9;
    [v18 enumerateFactorLevelsWithBlock:v17];
    BOOL v13 = *(unsigned char *)(*((void *)&buf + 1) + 24) == 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = [v7 factorPackId];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", (uint8_t *)&buf, 0xCu);
    }
    BOOL v13 = 0;
  }

  return v13;
}

void __97__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFactorPack_trialAssetBlock_maAssetBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (([v5 hasLevel] & 1) == 0)
  {
    v14 = TRILogCategory_Server();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v15 = [*(id *)(a1 + 32) factorPackId];
    *(_DWORD *)long long buf = 138543362;
    v21 = v15;
    v16 = "Factor pack %{public}@ has missing level.";
LABEL_19:
    _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    goto LABEL_10;
  }
  if ([v5 hasFactor])
  {
    v6 = [v5 factor];
    char v7 = [v6 hasName];

    if (v7)
    {
      buf[0] = 0;
      id v8 = [v5 level];
      id v9 = [v8 fileOrDirectoryLevelWithIsDir:buf];
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 40);
        if (v10)
        {
          char v19 = 0;
          v11 = [v5 factor];
          char v12 = [v11 name];
          BOOL v13 = [v8 metadata];
          (*(void (**)(uint64_t, void *, void *, void *, void, char *))(v10 + 16))(v10, v12, v9, v13, buf[0], &v19);
          goto LABEL_15;
        }
      }
      else if ([v8 levelOneOfCase] == 104)
      {
        uint64_t v17 = *(void *)(a1 + 48);
        if (v17)
        {
          char v19 = 0;
          v11 = [v5 factor];
          char v12 = [v11 name];
          BOOL v13 = [v8 mobileAssetReferenceValue];
          id v18 = [v8 metadata];
          (*(void (**)(uint64_t, void *, void *, void *, char *))(v17 + 16))(v17, v12, v13, v18, &v19);

LABEL_15:
          if (v19) {
            *a3 = 1;
          }
        }
      }

      goto LABEL_11;
    }
  }
  v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = [*(id *)(a1 + 32) factorPackId];
    *(_DWORD *)long long buf = 138543362;
    v21 = v15;
    v16 = "Factor pack %{public}@ has missing factor name.";
    goto LABEL_19;
  }
LABEL_10:

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  *a3 = 1;
LABEL_11:
}

+ (void)_enumerateAssetFactorLevelsInFlatBufferStorage:(id)a3 trialAssetBlock:(id)a4 maAssetBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E016E7F0]();
  v11 = [v7 levels];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke;
  v14[3] = &unk_1E6BBE038;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v11 enumerateObjectsUsingBlock:v14];
}

void __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 levelType] == 5)
  {
    id v7 = objc_opt_new();
    id v8 = [v6 levelAsTrialAssetVal];
    id v9 = [v8 path];
    [v7 setPath:v9];

    if ([v8 hasDownloadSize])
    {
      uint64_t v10 = [v8 downloadSize];
      v11 = [v7 asset];
      [v11 setSize:v10];
    }
    if ([v8 hasIsOnDemand]) {
      objc_msgSend(v7, "setIsOnDemand:", objc_msgSend(v8, "isOnDemand"));
    }
    id v12 = [v8 assetId];
    id v13 = [v7 asset];
    [v13 setAssetId:v12];

    int v14 = [v8 cloudKitMetadataType];
    if (v14 != 1)
    {
      if (v14)
      {
LABEL_31:
        int v34 = [v8 fileType];
        if (!*(void *)(a1 + 32))
        {
LABEL_36:

          goto LABEL_37;
        }
        BOOL v35 = v34 == 0;
        v36 = objc_opt_new();
        v37 = [v6 metadataAsDict];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke_288;
        v46[3] = &unk_1E6BBE010;
        uint64_t v22 = &v47;
        v47 = v36;
        id v23 = v36;
        [v37 enumerateKeysAndObjectsUsingBlock:v46];

        buf[0] = 0;
        uint64_t v38 = *(void *)(a1 + 32);
        v39 = [v6 name];
        (*(void (**)(uint64_t, void *, void *, id, BOOL, uint8_t *))(v38 + 16))(v38, v39, v7, v23, v35, buf);

LABEL_33:
        if (buf[0]) {
          *a4 = 1;
        }

        goto LABEL_36;
      }
      id v15 = TRILogCategory_Server();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_30:

        goto LABEL_31;
      }
      id v16 = [v6 name];
      *(_DWORD *)long long buf = 138543618;
      v49 = v16;
      __int16 v50 = 2112;
      v51 = @"test";
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "cloud kit meta data type as none for: %{public}@: %@", buf, 0x16u);
LABEL_29:

      goto LABEL_30;
    }
    id v15 = [v8 cloudKitMetadataAsTreatment];
    int v26 = [v15 container];
    if (v26 == 2)
    {
      v28 = [v7 asset];
      v29 = v28;
      uint64_t v30 = 2;
    }
    else if (v26 == 1)
    {
      v28 = [v7 asset];
      v29 = v28;
      uint64_t v30 = 1;
    }
    else
    {
      if (v26)
      {
LABEL_26:
        if ([v15 hasAssetIndex])
        {
          uint64_t v31 = [v15 assetIndex];
          v32 = [v7 asset];
          [v32 setCloudKitIndex:v31];
        }
        id v16 = [v15 treatmentId];
        v33 = [v7 asset];
        [v33 setTreatmentId:v16];

        goto LABEL_29;
      }
      v27 = TRILogCategory_Server();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v40 = [v6 name];
        *(_DWORD *)long long buf = 138543362;
        v49 = v40;
        _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "cloudkit container unknown for: %{public}@", buf, 0xCu);
      }
      v28 = [v7 asset];
      v29 = v28;
      uint64_t v30 = 0;
    }
    [v28 setCloudKitContainer:v30];

    goto LABEL_26;
  }
  if ([v6 levelType] == 6 && *(void *)(a1 + 40))
  {
    id v7 = [v6 levelAsMaRefVal];
    id v8 = objc_opt_new();
    if ([v7 hasIsOnDemand]) {
      objc_msgSend(v8, "setIsOnDemand:", objc_msgSend(v7, "isOnDemand"));
    }
    if ([v7 hasDownloadSize]) {
      objc_msgSend(v8, "setSize:", objc_msgSend(v7, "downloadSize"));
    }
    uint64_t v17 = [v7 type];
    [v8 setAssetType:v17];

    id v18 = [v7 specifier];
    [v8 setAssetSpecifier:v18];

    char v19 = [v7 version];
    [v8 setAssetVersion:v19];

    id v20 = objc_opt_new();
    v21 = [v6 metadataAsDict];
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    v43 = __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke_2;
    v44 = &unk_1E6BBE010;
    uint64_t v22 = &v45;
    v45 = v20;
    id v23 = v20;
    [v21 enumerateKeysAndObjectsUsingBlock:&v41];

    buf[0] = 0;
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = objc_msgSend(v6, "name", v41, v42, v43, v44);
    (*(void (**)(uint64_t, void *, void *, id, uint8_t *))(v24 + 16))(v24, v25, v8, v23, buf);

    goto LABEL_33;
  }
LABEL_37:
}

void __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke_288(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 val];
  [v4 setObject:v6 forKey:v5];
}

void __104__TRIClientFactorPackUtils__enumerateAssetFactorLevelsInFlatBufferStorage_trialAssetBlock_maAssetBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 val];
  [v4 setObject:v6 forKey:v5];
}

+ (BOOL)enumerateMetadataForAssetsInFactorPack:(id)a3 flatbufferFactorLevels:(id)a4 assetStore:(id)a5 maProvider:(id)a6 aliasToUnaliasMap:(id)a7 subscribedFactors:(id)a8 ckBlock:(id)a9 maBlock:(id)a10
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  unint64_t v16 = (unint64_t)a3;
  unint64_t v17 = (unint64_t)a4;
  id v46 = a5;
  id v49 = a6;
  id v18 = a7;
  id v19 = a8;
  id v47 = a9;
  id v48 = a10;
  if (!(v16 | v17))
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, a1, @"TRIClientFactorPackUtils.m", 202, @"Invalid parameter not satisfying: %@", @"factorLevels != nil || factorPack != nil" object file lineNumber description];
  }
  context = (void *)MEMORY[0x1E016E7F0]();
  id v20 = objc_opt_new();
  v21 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__53;
  v86 = __Block_byref_object_dispose__53;
  id v87 = (id)objc_opt_new();
  *(void *)v76 = 0;
  v77 = v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__53;
  v80 = __Block_byref_object_dispose__53;
  id v81 = (id)objc_opt_new();
  if (v16)
  {
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke;
    v71[3] = &unk_1E6BBE060;
    id v72 = v18;
    id v73 = v19;
    id v74 = (id)v16;
    v75 = &v82;
    char v22 = [a1 _enumerateAssetFactorLevelsInFactorPack:v74 trialAssetBlock:0 maAssetBlock:v71];

    if ((v22 & 1) == 0) {
      goto LABEL_20;
    }
  }
  int v23 = _os_feature_enabled_impl();
  if (v17) {
    int v24 = v23;
  }
  else {
    int v24 = 0;
  }
  if (v24 != 1) {
    goto LABEL_17;
  }
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_307;
  v67[3] = &unk_1E6BBE088;
  id v68 = v18;
  id v69 = v19;
  v70 = v76;
  [a1 _enumerateAssetFactorLevelsInFlatBufferStorage:v17 trialAssetBlock:0 maAssetBlock:v67];
  if (v16 && ([(id)v83[5] isEqualToSet:*((void *)v77 + 5)] & 1) == 0)
  {
    v27 = TRILogCategory_Server();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = *((void *)v77 + 5);
      uint64_t v42 = v83[5];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v89 = v41;
      __int16 v90 = 2112;
      uint64_t v91 = v42;
      _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "asset factor levels for flatbuffers: %@ and protobufs: %@ do not match", buf, 0x16u);
    }
    goto LABEL_15;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v25 = v83;
    id v26 = *((id *)v77 + 5);
    v27 = v25[5];
    v25[5] = (uint64_t)v26;
LABEL_15:
  }
LABEL_17:
  if (!v83[5])
  {
LABEL_20:
    int v29 = 1;
    goto LABEL_23;
  }
  v28 = objc_msgSend(v49, "installedAssetsMatchingFullAssetIds:");
  if (v28)
  {
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_309;
    v65[3] = &unk_1E6BBE0B0;
    id v66 = v20;
    [v28 enumerateKeysAndObjectsUsingBlock:v65];

    int v29 = 0;
  }
  else
  {
    int v29 = 1;
  }

LABEL_23:
  _Block_object_dispose(v76, 8);

  _Block_object_dispose(&v82, 8);
  if (!v29)
  {
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x2020000000;
    LOBYTE(v85) = 0;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_2;
    v58[3] = &unk_1E6BBE0D8;
    id v31 = v18;
    id v59 = v31;
    id v32 = (id)v17;
    id v60 = v32;
    id v33 = (id)v16;
    id v61 = v33;
    v64 = &v82;
    id v62 = v46;
    id v63 = v47;
    int v34 = (void *)MEMORY[0x1E016EA80](v58);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_315;
    v50[3] = &unk_1E6BBE100;
    id v51 = v31;
    SEL v56 = a2;
    id v57 = a1;
    id v35 = v32;
    id v52 = v35;
    id v36 = v33;
    id v53 = v36;
    id v54 = v20;
    id v55 = v48;
    v37 = (void *)MEMORY[0x1E016EA80](v50);
    int v38 = _os_feature_enabled_impl() ^ 1;
    if (!v17) {
      LOBYTE(v38) = 1;
    }
    if ((v38 & 1) == 0)
    {
      [a1 _enumerateAssetFactorLevelsInFlatBufferStorage:v35 trialAssetBlock:v34 maAssetBlock:v37];
LABEL_31:
      BOOL v30 = *((unsigned char *)v83 + 24) == 0;
LABEL_36:

      _Block_object_dispose(&v82, 8);
      goto LABEL_37;
    }
    if (v16)
    {
      if ([a1 _enumerateAssetFactorLevelsInFactorPack:v36 trialAssetBlock:v34 maAssetBlock:v37])goto LABEL_31; {
    }
      }
    else
    {
      v39 = TRILogCategory_Server();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v76 = 0;
        _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "Could not enumerate factor levels in factor pack since pack file is nil", v76, 2u);
      }
    }
    BOOL v30 = 0;
    goto LABEL_36;
  }
  BOOL v30 = 0;
LABEL_37:

  return v30;
}

void __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = *(void **)(a1 + 32);
  id v10 = a2;
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  id v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = v10;
  }
  id v14 = v13;

  if (![v8 isOnDemand]
    || [*(id *)(a1 + 40) containsObject:v14])
  {
    if ([v8 hasAssetType]
      && [v8 hasAssetSpecifier]
      && ([v8 hasAssetVersion] & 1) != 0)
    {
      id v15 = objc_alloc(MEMORY[0x1E4FB0178]);
      unint64_t v16 = [v8 assetType];
      unint64_t v17 = [v8 assetSpecifier];
      id v18 = [v8 assetVersion];
      id v19 = (void *)[v15 initWithType:v16 specifier:v17 version:v18];

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v19];
    }
    else
    {
      id v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v23 = [*(id *)(a1 + 48) factorPackId];
        int v24 = 138543362;
        uint64_t v25 = v23;
        _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has MA reference with missing information.", (uint8_t *)&v24, 0xCu);
      }
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      char v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = 0;

      *a5 = 1;
    }
  }
}

void __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_307(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = *(void **)(a1 + 32);
  id v10 = a2;
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  id v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = v10;
  }
  id v14 = v13;

  if (![v8 isOnDemand]
    || [*(id *)(a1 + 40) containsObject:v14])
  {
    if ([v8 hasAssetType]
      && [v8 hasAssetSpecifier]
      && ([v8 hasAssetVersion] & 1) != 0)
    {
      id v15 = objc_alloc(MEMORY[0x1E4FB0178]);
      unint64_t v16 = [v8 assetType];
      unint64_t v17 = [v8 assetSpecifier];
      id v18 = [v8 assetVersion];
      id v19 = (void *)[v15 initWithType:v16 specifier:v17 version:v18];

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v19];
    }
    else
    {
      id v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v23 = 138543362;
        id v24 = v14;
        _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has MA reference with missing information.", (uint8_t *)&v23, 0xCu);
      }

      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      char v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = 0;

      *a5 = 1;
    }
  }
}

uint64_t __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_309(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = *(void **)(a1 + 32);
  id v14 = a2;
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];
  unint64_t v16 = (void *)v15;
  if (v15) {
    unint64_t v17 = (void *)v15;
  }
  else {
    unint64_t v17 = v14;
  }
  id v18 = v17;

  int v19 = _os_feature_enabled_impl();
  id v20 = *(void **)(a1 + 40);
  if (v20 && v19)
  {
    uint64_t v21 = [v20 sourceAsFactorPackId];
  }
  else
  {
    uint64_t v21 = [*(id *)(a1 + 48) factorPackId];
  }
  char v22 = (void *)v21;
  if ([v11 hasAsset]
    && ([v11 asset],
        int v23 = objc_claimAutoreleasedReturnValue(),
        char v24 = [v23 hasAssetId],
        v23,
        (v24 & 1) != 0))
  {
    v44 = a6;
    uint64_t v25 = [v11 asset];
    uint64_t v26 = [v25 assetId];
    uint64_t v27 = TRIValidateAssetId();

    v45 = (void *)v27;
    if (v27)
    {
      BOOL v28 = +[TRIAssetMetadataReservedKeys isEncryptedForMetadata:v12];
      v42.var0 = (unint64_t)+[TRIAssetMetadataReservedKeys compressionModeForMetadata:v12];
      int v29 = *(void **)(a1 + 40);
      if (v29) {
        int v30 = v19;
      }
      else {
        int v30 = 0;
      }
      if (v30 == 1)
      {
        id v31 = [v29 namespaceName];
      }
      else
      {
        int v34 = [*(id *)(a1 + 48) selectedNamespace];
        id v31 = [v34 name];
      }
      id v35 = [TRICKAssetMetadata alloc];
      if (v28) {
        id v36 = v31;
      }
      else {
        id v36 = 0;
      }
      v37 = objc_msgSend(v11, "asset", v42.var0);
      int v38 = -[TRICKAssetMetadata initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:](v35, "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", a5, v36, 0, [v37 size], v43);

      v39 = -[TRIRequiredCloudKitAsset initWithFactorName:isInstalled:isOnDemand:assetId:metadata:]([TRIRequiredCloudKitAsset alloc], "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", v18, [*(id *)(a1 + 56) hasAssetWithIdentifier:v45 type:0], objc_msgSend(v11, "isOnDemand"), v45, v38);
      buf[0] = 0;
      (*(void (**)(void, TRIRequiredCloudKitAsset *, uint64_t, uint8_t *))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v39, [v11 hasPath], buf);
      if (buf[0]) {
        unsigned char *v44 = 1;
      }
    }
    else
    {
      id v33 = TRILogCategory_Server();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v40 = [v11 asset];
        uint64_t v41 = [v40 assetId];
        *(_DWORD *)long long buf = 138543874;
        id v47 = v22;
        __int16 v48 = 2112;
        id v49 = v41;
        __int16 v50 = 2114;
        id v51 = v18;
        _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has unsuitable asset id \"{public}%@\" for factor %{public}@.", buf, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      unsigned char *v44 = 1;
    }
  }
  else
  {
    id v32 = TRILogCategory_Server();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v47 = v22;
      __int16 v48 = 2114;
      id v49 = v18;
      _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing asset id for factor %{public}@.", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    *a6 = 1;
  }
}

void __164__TRIClientFactorPackUtils_enumerateMetadataForAssetsInFactorPack_flatbufferFactorLevels_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_ckBlock_maBlock___block_invoke_315(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = *(void **)(a1 + 32);
  id v9 = a4;
  id v10 = a2;
  uint64_t v11 = [v8 objectForKeyedSubscript:v10];
  id v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = v10;
  }
  id v14 = v13;

  if (([v7 hasAssetType] & 1) == 0)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 80), @"TRIClientFactorPackUtils.m", 350, @"Invalid parameter not satisfying: %@", @"maRef.hasAssetType" object file lineNumber description];
  }
  if (([v7 hasAssetSpecifier] & 1) == 0)
  {
    id v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 80), @"TRIClientFactorPackUtils.m", 351, @"Invalid parameter not satisfying: %@", @"maRef.hasAssetSpecifier" object file lineNumber description];
  }
  if (([v7 hasAssetVersion] & 1) == 0)
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 80), @"TRIClientFactorPackUtils.m", 352, @"Invalid parameter not satisfying: %@", @"maRef.hasAssetVersion" object file lineNumber description];
  }
  id v15 = objc_alloc(MEMORY[0x1E4FB0178]);
  unint64_t v16 = [v7 assetType];
  unint64_t v17 = [v7 assetSpecifier];
  id v18 = [v7 assetVersion];
  int v19 = (void *)[v15 initWithType:v16 specifier:v17 version:v18];

  BOOL v20 = +[TRIAssetMetadataReservedKeys isEncryptedForMetadata:v9];
  if (*(void *)(a1 + 40) && _os_feature_enabled_impl())
  {
    uint64_t v21 = [*(id *)(a1 + 40) namespaceName];
  }
  else
  {
    char v22 = [*(id *)(a1 + 48) selectedNamespace];
    uint64_t v21 = [v22 name];
  }
  int v23 = [TRIMAAssetMetadata alloc];
  uint64_t v24 = [v7 size];
  if (v20) {
    uint64_t v25 = v21;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = [(TRIMAAssetMetadata *)v23 initWithDownloadSize:v24 namespaceNameForEncryptionKey:v25];
  uint64_t v27 = [*(id *)(a1 + 56) containsObject:v19];
  BOOL v28 = [TRIRequiredMAAsset alloc];
  if ([v7 hasIsOnDemand]) {
    uint64_t v29 = [v7 isOnDemand];
  }
  else {
    uint64_t v29 = 0;
  }
  int v30 = [(TRIRequiredMAAsset *)v28 initWithFactorName:v14 isInstalled:v27 isOnDemand:v29 metadata:v26 fullAssetId:v19];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

+ (id)requiredAssetsForInstallationWithFactorPack:(id)a3 assetStore:(id)a4 maProvider:(id)a5 subscriptionSettings:(id)a6 aliasToUnaliasMap:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = [v12 selectedNamespace];
  char v18 = [v17 hasName];

  if (v18)
  {
    id v33 = v13;
    int v19 = (void *)MEMORY[0x1E4F1CBF0];
    id v32 = a1;
    if (v15)
    {
      BOOL v20 = [v12 selectedNamespace];
      uint64_t v21 = [v20 name];
      uint64_t v22 = [v15 subscribedFactorsForNamespaceName:v21];

      if (v22) {
        int v19 = (void *)v22;
      }
    }
    int v23 = objc_opt_new();
    uint64_t v24 = objc_opt_new();
    if (v16) {
      id v25 = v16;
    }
    else {
      id v25 = (id)MEMORY[0x1E4F1CC08];
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __133__TRIClientFactorPackUtils_requiredAssetsForInstallationWithFactorPack_assetStore_maProvider_subscriptionSettings_aliasToUnaliasMap___block_invoke;
    v37[3] = &unk_1E6BBE128;
    id v38 = v19;
    id v26 = v23;
    id v39 = v26;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __133__TRIClientFactorPackUtils_requiredAssetsForInstallationWithFactorPack_assetStore_maProvider_subscriptionSettings_aliasToUnaliasMap___block_invoke_2;
    v34[3] = &unk_1E6BBE150;
    uint64_t v27 = v38;
    id v35 = v27;
    id v28 = v24;
    id v36 = v28;
    id v13 = v33;
    uint64_t v29 = 0;
    if ([v32 enumerateMetadataForAssetsInFactorPack:v12 flatbufferFactorLevels:0 assetStore:v33 maProvider:v14 aliasToUnaliasMap:v25 subscribedFactors:v27 ckBlock:v37 maBlock:v34])uint64_t v29 = -[TRIGenericRequiredAssets initWithCloudKit:mobileAsset:]([TRIGenericRequiredAssets alloc], "initWithCloudKit:mobileAsset:", v26, v28); {
  }
    }
  else
  {
    uint64_t v27 = TRILogCategory_Server();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v31 = [v12 factorPackId];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v41 = v31;
      _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", buf, 0xCu);
    }
    uint64_t v29 = 0;
  }

  return v29;
}

void __133__TRIClientFactorPackUtils_requiredAssetsForInstallationWithFactorPack_assetStore_maProvider_subscriptionSettings_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (![v5 isOnDemand]
    || (v3 = *(void **)(a1 + 32),
        [v5 factorName],
        v4 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = [v3 containsObject:v4],
        v4,
        v3))
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __133__TRIClientFactorPackUtils_requiredAssetsForInstallationWithFactorPack_assetStore_maProvider_subscriptionSettings_aliasToUnaliasMap___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (![v5 isOnDemand]
    || (v3 = *(void **)(a1 + 32),
        [v5 factorName],
        v4 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = [v3 containsObject:v4],
        v4,
        v3))
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

+ (id)unlinkedOnDemandAssetsWithFactorPack:(id)a3 flatbufferFactorLevels:(id)a4 factorPackPath:(id)a5 assetStore:(id)a6 maProvider:(id)a7 aliasToUnaliasMap:(id)a8 subscribedFactors:(id)a9 unlinkedMAAssetsOnDisk:(id *)a10
{
  unint64_t v16 = (unint64_t)a3;
  unint64_t v17 = (unint64_t)a4;
  id v18 = a5;
  id v40 = a6;
  id v19 = a7;
  id v20 = a8;
  id v38 = a9;
  uint64_t v41 = (void *)v16;
  if (!(v16 | v17))
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"TRIClientFactorPackUtils.m", 460, @"Invalid parameter not satisfying: %@", @"factorPack != nil || factorLevels != nil" object file lineNumber description];
  }
  uint64_t v21 = objc_opt_new();
  id v36 = objc_opt_new();
  uint64_t v22 = objc_opt_new();
  int v23 = objc_opt_new();
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke;
  v50[3] = &unk_1E6BB8670;
  id v24 = v23;
  id v51 = v24;
  [v20 enumerateKeysAndObjectsUsingBlock:v50];
  v37 = v20;
  if (v20) {
    id v25 = v20;
  }
  else {
    id v25 = (id)MEMORY[0x1E4F1CC08];
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke_2;
  v48[3] = &unk_1E6BBE178;
  id v26 = v21;
  id v49 = v26;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke_3;
  v42[3] = &unk_1E6BBE1A0;
  id v27 = v24;
  id v43 = v27;
  id v28 = v18;
  id v44 = v28;
  id v29 = v19;
  id v45 = v29;
  int v30 = v22;
  id v31 = v22;
  id v46 = v31;
  id v32 = v36;
  id v47 = v32;
  if (objc_msgSend(a1, "enumerateMetadataForAssetsInFactorPack:flatbufferFactorLevels:assetStore:maProvider:aliasToUnaliasMap:subscribedFactors:ckBlock:maBlock:", v41, v17, v40, v29, v25, v48, v42))
  {
    objc_storeStrong(a10, v30);
    id v33 = [[TRIGenericRequiredAssets alloc] initWithCloudKit:v26 mobileAsset:v32];
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

uint64_t __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a2 forKey:a3];
}

void __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if ([v5 isOnDemand] && (a3 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __184__TRIClientFactorPackUtils_unlinkedOnDemandAssetsWithFactorPack_flatbufferFactorLevels_factorPackPath_assetStore_maProvider_aliasToUnaliasMap_subscribedFactors_unlinkedMAAssetsOnDisk___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 factorName];
  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v3 factorName];
  }
  id v9 = v8;

  id v10 = +[TRIFactorPackStorage relPathForMAReferenceWithFactorName:v9];
  uint64_t v11 = [*(id *)(a1 + 40) stringByAppendingPathComponent:v10];
  if ([v3 isOnDemand])
  {
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v13 = [v12 fileExistsAtPath:v11];

    if (v13)
    {
      id v39 = 0;
      id v14 = *(void **)(a1 + 48);
      id v15 = [v3 fullAssetId];
      unint64_t v16 = [v14 createAutoAssetWithId:v15 decryptionKey:0 error:&v39];

      if (!v16)
      {
        id v29 = TRILogCategory_Server();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          id v33 = v39;
          int v34 = [v3 fullAssetId];
          *(_DWORD *)long long buf = 138543618;
          id v41 = v33;
          __int16 v42 = 2114;
          id v43 = v34;
          _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Failed to init MAAutoAsset: %{public}@, treating as unlinked: %{public}@", buf, 0x16u);
        }
        [*(id *)(a1 + 64) addObject:v3];
        goto LABEL_32;
      }
      uint64_t v17 = [v16 lockContentSync:@"test asset presence" withUsagePolicy:0 withTimeout:0 lockedAssetSelector:0 newerInProgress:0 error:0];
      id v18 = (void *)v17;
      if (!v17)
      {
        int v30 = TRILogCategory_Server();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v41 = v16;
          _os_log_impl(&dword_1DA291000, v30, OS_LOG_TYPE_DEFAULT, "Linked MAAutoAsset appears to be missing, treating as unlinked: %{public}@", buf, 0xCu);
        }

        [*(id *)(a1 + 64) addObject:v3];
        goto LABEL_31;
      }
      v37 = (void *)v17;
      id v19 = (id)[v16 endLockUsageSync:@"test asset presence"];
      id v38 = 0;
      id v20 = [NSString stringWithContentsOfFile:v11 encoding:4 error:&v38];
      id v21 = v38;
      uint64_t v22 = [v20 triTrim];

      if (!v22)
      {
        id v31 = TRILogCategory_Server();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v41 = v11;
          _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Unable to read MA path, even though it should exist at path: %{public}@", buf, 0xCu);
        }

        goto LABEL_30;
      }
      if ([v22 length])
      {
        id v36 = v21;
        int v23 = [v37 path];
        char v24 = [v23 isEqualToString:v22];

        if ((v24 & 1) == 0)
        {
          id v32 = TRILogCategory_Server();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            id v35 = [v37 path];
            *(_DWORD *)long long buf = 138543618;
            id v41 = v35;
            __int16 v42 = 2114;
            id v43 = v22;
            _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Path vended by MA: %{public}@ differs from path held in cache: %{public}@, re-downloading", buf, 0x16u);
          }
          [*(id *)(a1 + 64) addObject:v3];
          id v21 = v36;
          goto LABEL_30;
        }
        id v25 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v26 = [v25 fileExistsAtPath:v22];

        id v21 = v36;
        if (v26)
        {
LABEL_30:

          id v18 = v37;
LABEL_31:

LABEL_32:
          goto LABEL_33;
        }
        id v27 = TRILogCategory_Server();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v41 = v22;
          _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Asset at path held in cache: %{public}@ doesn't exist, re-downloading", buf, 0xCu);
        }

        id v28 = *(void **)(a1 + 64);
      }
      else
      {
        id v28 = *(void **)(a1 + 56);
      }
      [v28 addObject:v3];
      goto LABEL_30;
    }
    [*(id *)(a1 + 64) addObject:v3];
  }
LABEL_33:
}

+ (id)uniqueAssets:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v6 = [v3 cloudKit];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__TRIClientFactorPackUtils_uniqueAssets___block_invoke;
  v18[3] = &unk_1E6BBA900;
  id v19 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v18];

  id v8 = [v3 mobileAsset];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __41__TRIClientFactorPackUtils_uniqueAssets___block_invoke_2;
  unint64_t v16 = &unk_1E6BB9EF8;
  id v17 = v5;
  id v9 = v5;
  [v8 enumerateObjectsUsingBlock:&v13];

  id v10 = [TRIGenericUniqueRequiredAssets alloc];
  uint64_t v11 = -[TRIGenericUniqueRequiredAssets initWithCloudKit:mobileAsset:](v10, "initWithCloudKit:mobileAsset:", v7, v9, v13, v14, v15, v16);

  return v11;
}

void __41__TRIClientFactorPackUtils_uniqueAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 metadata];
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 assetId];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

void __41__TRIClientFactorPackUtils_uniqueAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 metadata];
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 fullAssetId];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

+ (id)aliasesInNamespace:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    unint64_t v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Couldn't calculate aliases for namespace name. Provided namespace name is nil", buf, 2u);
    }
    goto LABEL_37;
  }
  v4 = (void *)MEMORY[0x1E016E7F0]();
  id v5 = (void *)MEMORY[0x1E4FB01A0];
  id v6 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  id v7 = [v6 namespaceDescriptorsDefaultDir];
  id v8 = [v5 loadWithNamespaceName:v3 fromDirectory:v7];

  if (!v8
    || ([v8 namespaceName],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqualToString:v3],
        v9,
        !v10))
  {

    unint64_t v16 = 0;
LABEL_37:
    id v32 = 0;
    goto LABEL_38;
  }
  uint64_t v11 = [v8 factorsAbsolutePathAsOwner:0];
  if (v11)
  {
    id v47 = 0;
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v11 options:8 error:&v47];
    uint64_t v13 = v47;
    if (v12)
    {
      id v46 = v13;
      uint64_t v14 = [MEMORY[0x1E4FB0548] parseFromData:v12 error:&v46];
      id v15 = v46;

      id v40 = v14;
      if (v14)
      {
        unint64_t v16 = objc_opt_new();
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v17 = [v14 factorLevelArray];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          int v34 = v15;
          id v35 = v12;
          id v41 = v16;
          id v36 = v11;
          v37 = v8;
          id v38 = v4;
          id v39 = v3;
          uint64_t v20 = *(void *)v43;
          while (1)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v43 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              int v23 = objc_msgSend(v22, "factor", v34, v35, v36, v37, v38, v39);
              if ([v23 hasName])
              {
                char v24 = [v22 factor];
                if ([v24 hasAlias])
                {
                  id v25 = [v22 factor];
                  char v26 = [v25 alias];
                  char v27 = [v26 isEqualToString:&stru_1F3455898];

                  if (v27) {
                    continue;
                  }
                  int v23 = [v22 factor];
                  char v24 = [v23 name];
                  id v28 = [v22 factor];
                  id v29 = [v28 alias];
                  [v41 setObject:v24 forKey:v29];
                }
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v48 count:16];
            if (!v19)
            {
              int v30 = 0;
              v4 = v38;
              id v3 = v39;
              uint64_t v11 = v36;
              id v8 = v37;
              id v15 = v34;
              id v12 = v35;
              unint64_t v16 = v41;
              goto LABEL_34;
            }
          }
        }
        int v30 = 0;
      }
      else
      {
        id v17 = TRILogCategory_Server();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          id v50 = v11;
          __int16 v51 = 2114;
          uint64_t v52 = v15;
          _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Failed to parse treatment from file %{public}@: %{public}@", buf, 0x16u);
        }
        unint64_t v16 = 0;
        int v30 = 1;
      }
LABEL_34:

      id v31 = v40;
    }
    else
    {
      id v31 = TRILogCategory_Server();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        id v50 = v11;
        __int16 v51 = 2114;
        uint64_t v52 = v13;
        _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Failed to read data from file %{public}@: %{public}@", buf, 0x16u);
      }
      unint64_t v16 = 0;
      int v30 = 1;
      id v15 = v13;
    }
  }
  else
  {
    id v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v50 = v3;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Unable to read factors URL for namespace: %{public}@", buf, 0xCu);
    }
    unint64_t v16 = 0;
    int v30 = 1;
  }

  if (v30) {
    goto LABEL_37;
  }
  unint64_t v16 = v16;
  id v32 = v16;
LABEL_38:

  return v32;
}

@end