@interface PASAsset2
@end

@implementation PASAsset2

intptr_t __37___PASAsset2_callAssetUpdateHandlers__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __28___PASAsset2_clearOverrides__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 56);
  *(void *)(a2 + 56) = 0;
}

uint64_t __58___PASAsset2_addOverridePath_forResourceWithRelativePath___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[7];
  if (!v3)
  {
    v5 = a2;
    uint64_t v6 = objc_opt_new();
    v7 = (void *)a2[7];
    a2[7] = v6;

    v3 = (void *)a2[7];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);

  return [v3 setObject:v8 forKeyedSubscript:v9];
}

uint64_t __24___PASAsset2_bundlePath__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 8) copy];

  return MEMORY[0x1F41817F8]();
}

void __52___PASAsset2_overrideDefaultBundleWithBundleAtPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3) {
    id v4 = (id)[v3 copy];
  }
  else {
    id v4 = *(id *)(*(void *)(a1 + 40) + 16);
  }
  id v5 = v6[1];
  v6[1] = v4;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) _loadDefaultBundleVersionWithGuardedData:v6];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_storeStrong(v6 + 1, *(id *)(*(void *)(a1 + 40) + 16));
    [*(id *)(a1 + 40) _loadDefaultBundleVersionWithGuardedData:v6];
  }
}

uint64_t __52___PASAsset2__issueUpdateNotificationsWithCallback___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 24);
  return result;
}

uint64_t __70___PASAsset2__purgeObsoleteInstalledAssetsFromCandidates_guardedData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = [v3 state];
  if (v4 > 6) {
    goto LABEL_6;
  }
  if (((1 << v4) & 0x4C) != 0)
  {
    uint64_t v7 = 1;
    goto LABEL_8;
  }
  if (((1 << v4) & 0x11) == 0) {
    goto LABEL_6;
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[5];
  uint64_t v7 = 0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v6;
    uint64_t v9 = [v5 _assetDescription];
    v10 = [v3 attributes];
    v11 = [v10 objectForKeyedSubscript:@"_ContentVersion"];
    int v13 = 138412802;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = [v3 state];
    _os_log_impl(&dword_1A32C4000, v8, OS_LOG_TYPE_DEFAULT, "Found MAAsset \"%@\" with obsolete version %@, but not removing because state is %ld.", (uint8_t *)&v13, 0x20u);

LABEL_6:
    uint64_t v7 = 0;
  }
LABEL_8:

  return v7;
}

void __70___PASAsset2__purgeObsoleteInstalledAssetsFromCandidates_guardedData___block_invoke_379(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = *(os_log_t **)(a1 + 32);
  os_log_t v4 = v3[5];
  if (a2)
  {
    if (os_log_type_enabled(v3[5], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = v4;
      uint64_t v7 = [(os_log_t *)v3 _assetDescription];
      uint64_t v8 = *(void *)(a1 + 40);
      int v12 = 138412802;
      int v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = a2;
      _os_log_error_impl(&dword_1A32C4000, v6, OS_LOG_TYPE_ERROR, "Failed to purge installed MAAsset \"%@\" with obsolete version %@: error %ld", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled(v3[5], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v4;
    v10 = [(os_log_t *)v3 _assetDescription];
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138412546;
    int v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1A32C4000, v9, OS_LOG_TYPE_DEFAULT, "Successfully purged installed MAAsset \"%@\" with obsolete version %@.", (uint8_t *)&v12, 0x16u);
  }
}

uint64_t __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 72);
  uint64_t v8 = [v5 attributes];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"_CompatibilityVersion"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  uint64_t v11 = *(void *)(a1 + 32);
  if (v7 != v10)
  {
    uint64_t v18 = *(NSObject **)(v11 + 40);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v24 = v18;
      v25 = [v5 attributes];
      v26 = [v25 objectForKeyedSubscript:@"_ContentVersion"];
      v27 = [v5 attributes];
      v28 = [v27 objectForKeyedSubscript:@"_CompatibilityVersion"];
      uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 72);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v37 = v29;
      _os_log_debug_impl(&dword_1A32C4000, v24, OS_LOG_TYPE_DEBUG, "Ignoring MAAsset version %@ with compat version %@ (required compat version: %lu)", buf, 0x20u);
    }
    goto LABEL_8;
  }
  int v12 = *(void **)(v11 + 24);
  if (v12)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v37) = 0;
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_371;
    v33 = &unk_1E5AEBD18;
    id v34 = v5;
    v35 = buf;
    [v12 enumerateKeysAndObjectsUsingBlock:&v30];
    BOOL v13 = *(unsigned char *)(*(void *)&buf[8] + 24) == 0;

    _Block_object_dispose(buf, 8);
    if (!v13)
    {
LABEL_8:
      uint64_t v17 = 0;
      goto LABEL_9;
    }
  }
  __int16 v14 = objc_msgSend(v5, "attributes", v30, v31, v32, v33);
  uint64_t v15 = [v14 objectForKeyedSubscript:@"_ContentVersion"];
  int v16 = [v15 intValue];

  if (v16 < 0)
  {
    v20 = *(void **)(a1 + 32);
    v21 = v20[5];
    uint64_t v17 = 0;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    v22 = v21;
    v23 = [v20 _assetDescription];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v16;
    _os_log_impl(&dword_1A32C4000, v22, OS_LOG_TYPE_DEFAULT, "Found MAAsset for \"%@\" with invalid version %d", buf, 0x12u);

    goto LABEL_8;
  }
  uint64_t v17 = 1;
LABEL_9:

  return v17;
}

void __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v39 = *((void *)v3 + 3);
  uint64_t v40 = *((void *)v3 + 4);
  os_log_t v4 = (void *)*((void *)v3 + 5);
  *((void *)v3 + 5) = 0;

  uint64_t v5 = *((void *)v3 + 2);
  *((void *)v3 + 3) = v5;
  *((void *)v3 + 4) = v5;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (!v6) {
    goto LABEL_34;
  }
  uint64_t v8 = v6;
  char v41 = 0;
  uint64_t v9 = *(void *)v53;
  *(void *)&long long v7 = 138412546;
  long long v38 = v7;
  uint64_t v43 = a1;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v53 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      int v12 = objc_msgSend(v11, "attributes", v38);
      BOOL v13 = [v12 objectForKeyedSubscript:@"_ContentVersion"];

      if (*((void *)v3 + 2) != 0x7FFFFFFFFFFFFFFFLL)
      {
        __int16 v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        uint64_t v15 = [v14 compare:v13];

        if (v15 != -1)
        {
          a1 = v43;
          v32 = *(void **)(v43 + 40);
          v33 = v32[5];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            id v34 = v33;
            v35 = [v32 _assetDescription];
            *(_DWORD *)buf = 138412290;
            v57 = v35;
            _os_log_impl(&dword_1A32C4000, v34, OS_LOG_TYPE_INFO, "Baseline asset for \"%@\" is still current. Not using MobileAsset.", buf, 0xCu);
          }
          goto LABEL_33;
        }
      }
      uint64_t v47 = MEMORY[0x1E4F143A8];
      uint64_t v48 = 3221225472;
      v49 = __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_375;
      v50 = &unk_1E5AEBD88;
      v51 = v11;
      unint64_t v16 = [v11 state];
      if (v16 <= 6 && ((1 << v16) & 0x64) != 0)
      {
        uint64_t v18 = [v11 getLocalUrl];
        uint64_t v19 = *(os_log_t **)(v43 + 40);
        os_log_t v20 = v19[5];
        if (!v18)
        {
          if (os_log_type_enabled(v19[5], OS_LOG_TYPE_ERROR))
          {
            v21 = v20;
            v22 = [(os_log_t *)v19 _assetDescription];
            *(_DWORD *)buf = 138412290;
            v57 = v22;
            _os_log_error_impl(&dword_1A32C4000, v21, OS_LOG_TYPE_ERROR, "MAAsset for \"%@\" is missing localURL", buf, 0xCu);
          }
          goto LABEL_21;
        }
        v27 = (void *)v18;
        if (os_log_type_enabled(v19[5], OS_LOG_TYPE_DEFAULT))
        {
          v28 = v20;
          uint64_t v29 = [(os_log_t *)v19 _assetDescription];
          *(_DWORD *)buf = v38;
          v57 = v29;
          __int16 v58 = 2112;
          v59 = v13;
          _os_log_impl(&dword_1A32C4000, v28, OS_LOG_TYPE_DEFAULT, "Using installed MAAsset for \"%@\", version %@.", buf, 0x16u);
        }
        *((void *)v3 + 3) = [v13 unsignedIntegerValue];
        objc_storeStrong((id *)v3 + 5, v11);
        a1 = v43;
        if ((v41 & 1) == 0)
        {
          uint64_t v30 = *(void **)(v43 + 40);
          uint64_t v31 = v30[5];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v36 = v31;
            uint64_t v37 = [v30 _assetDescription];
            *(_DWORD *)buf = v38;
            v57 = v37;
            __int16 v58 = 2112;
            v59 = v13;
            _os_log_debug_impl(&dword_1A32C4000, v36, OS_LOG_TYPE_DEBUG, "Already-installed MAAsset for \"%@\" (version %@) is also the most current known to be available.", buf, 0x16u);
          }
          *((void *)v3 + 4) = [v13 unsignedIntegerValue];
        }

LABEL_33:
        goto LABEL_34;
      }
      if ((v41 & 1) == 0)
      {
        *((void *)v3 + 4) = [v13 unsignedIntegerValue];
        if (v40 != [v13 unsignedIntegerValue])
        {
          v23 = [*(id *)(v43 + 40) _assetDescription];
          uint64_t v24 = *(void *)(v43 + 40);
          v25 = *(NSObject **)(v24 + 40);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v38;
            v57 = v23;
            __int16 v58 = 2112;
            v59 = v13;
            _os_log_impl(&dword_1A32C4000, v25, OS_LOG_TYPE_DEFAULT, "New MAAsset for \"%@\" available (version %@), requesting download.", buf, 0x16u);
            uint64_t v24 = *(void *)(v43 + 40);
          }
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_377;
          v44[3] = &unk_1E5AEBDB0;
          v44[4] = v24;
          id v45 = v23;
          id v46 = v13;
          id v26 = v23;
          [v11 startDownload:v44];
        }
      }
      char v41 = 1;
LABEL_21:
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    a1 = v43;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_34:

  if (*((unsigned char *)v3 + 48))
  {
    [*(id *)(a1 + 40) _purgeObsoleteInstalledAssetsFromCandidates:*(void *)(a1 + 32) guardedData:v3];
    *((unsigned char *)v3 + 48) = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *((void *)v3 + 3) != v39;
}

uint64_t __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_375(uint64_t a1)
{
  unint64_t v1 = [*(id *)(a1 + 32) state];
  return (v1 < 7) & (0x64u >> v1);
}

void __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_377(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_log_t v4 = *(NSObject **)(a1[4] + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_1A32C4000, v4, OS_LOG_TYPE_DEFAULT, "MAAsset download for \"%@\" (version %@) completed with result: %ld", (uint8_t *)&v7, 0x20u);
  }
}

uint64_t __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_373(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 attributes];
  int v7 = [v6 objectForKeyedSubscript:@"_ContentVersion"];
  uint64_t v8 = [v4 attributes];
  __int16 v9 = [v8 objectForKeyedSubscript:@"_ContentVersion"];
  uint64_t v10 = [v7 compare:v9];

  if (!v10)
  {
    BOOL v11 = [v4 state] == 2;
    BOOL v12 = [v5 state] == 2;
    uint64_t v13 = [NSNumber numberWithBool:v12];
    __int16 v14 = [NSNumber numberWithBool:v11];
    uint64_t v10 = [v13 compare:v14];
  }
  return v10;
}

void __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_371(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  int v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v7 attributes];
  id v11 = [v10 objectForKeyedSubscript:v9];

  LOBYTE(v9) = [v8 isEqual:v11];
  if ((v9 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __34___PASAsset2__updateAssetMetadata__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addKeyValuePair:a2 with:a3];
}

void __68___PASAsset2_filesystemPathsForAssetDataRelativePaths_assetVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v21 = 0;
  uint64_t v4 = [*(id *)(a1 + 32) _maFilesystemPathsForAssetDataRelativePaths:*(void *)(a1 + 40) guardedData:v3 isMissingData:&v21 assetVersion:*(void *)(a1 + 56)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    BOOL v7 = v21 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) _defaultBundleFilesystemPathsForAssetDataRelativePaths:*(void *)(a1 + 40) guardedData:v3 assetVersion:*(void *)(a1 + 56)];
    id v9 = (void *)v8;
    if (v21)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      id v11 = v10[5];
      if (!v8)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = v11;
          uint64_t v18 = [v10 _assetDescription];
          *(_DWORD *)buf = 138412290;
          v23 = v18;
          _os_log_impl(&dword_1A32C4000, v17, OS_LOG_TYPE_DEFAULT, "MAAsset for \"%@\" was missing data, and no default bundle was available for fallback!", buf, 0xCu);
        }
        goto LABEL_13;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = v11;
        os_log_t v20 = [v10 _assetDescription];
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_fault_impl(&dword_1A32C4000, v19, OS_LOG_TYPE_FAULT, "Using default bundle fallback for \"%@\" due to missing MAAsset data.", buf, 0xCu);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
    }
    else if (!v8)
    {
LABEL_13:

      goto LABEL_14;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v9);
    goto LABEL_13;
  }
LABEL_14:
  if (v3[7])
  {
    BOOL v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v12) {
      uint64_t v13 = (void *)[v12 mutableCopy];
    }
    else {
      uint64_t v13 = objc_opt_new();
    }
    __int16 v14 = v13;
    [v13 addEntriesFromDictionary:v3[7]];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

uint64_t __38___PASAsset2_bestAssetVersionObserved__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 32);
  return result;
}

void __31___PASAsset2__assetDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 description];
  [v3 addObject:v4];
}

uint64_t __26___PASAsset2_assetVersion__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 24);
  return result;
}

uint64_t __45___PASAsset2_downloadMetadataWithCompletion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  id v4 = *(NSObject **)(v3 + 40);
  if (a2)
  {
    if (os_log_type_enabled(*(os_log_t *)(v3 + 40), OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[5];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2048;
      uint64_t v13 = a2;
      _os_log_error_impl(&dword_1A32C4000, v4, OS_LOG_TYPE_ERROR, "Failed to download catalog for asset type \"%@\": error %td", (uint8_t *)&v10, 0x16u);
    }
    uint64_t result = a1[6];
    if (result)
    {
      BOOL v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(v3 + 40), OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[5];
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1A32C4000, v4, OS_LOG_TYPE_INFO, "Completed download of catalog for asset type \"%@\".", (uint8_t *)&v10, 0xCu);
    }
    uint64_t result = a1[6];
    if (result)
    {
      BOOL v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

void __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 _loadDefaultBundleVersionWithGuardedData:v4];
  uint64_t v3 = v4[2];
  v4[3] = v3;
  v4[4] = v3;
}

void __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[5];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = v3;
      uint64_t v5 = [v2 _assetDescription];
      int v6 = 138412290;
      BOOL v7 = v5;
      _os_log_impl(&dword_1A32C4000, v4, OS_LOG_TYPE_INFO, "Received new asset installation notification: %@", (uint8_t *)&v6, 0xCu);
    }
    [v2 _updateAssetMetadata];
  }
}

void __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke_339(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[5];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = v3;
      uint64_t v5 = [v2 _assetDescription];
      int v6 = 138412290;
      BOOL v7 = v5;
      _os_log_impl(&dword_1A32C4000, v4, OS_LOG_TYPE_INFO, "Received asset metadata update notification: %@", (uint8_t *)&v6, 0xCu);
    }
    [v2 _updateAssetMetadata];
  }
}

id __162___PASAsset2_initWithAssetTypeDescriptorPath_defaultBundlePath_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  BYTE1(v5) = *(unsigned char *)(a1 + 72);
  LOBYTE(v5) = 0;
  uint64_t v3 = objc_msgSend(v2, "_initWithAssetTypeIdentifier:defaultBundlePath:compatibilityVersion:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:purgeObsoleteInstalledAssets:", @"com.apple.MobileAsset.ProactiveSupport.BrokenAssetTypeDescriptor", *(void *)(a1 + 40), 0x7FFFFFFFFFFFFFFFLL, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), v5);

  return v3;
}

@end