@interface LTHotfixManager
@end

@implementation LTHotfixManager

uint64_t __26___LTHotfixManager_shared__block_invoke()
{
  shared_shared = objc_alloc_init(_LTHotfixManager);
  return MEMORY[0x270F9A758]();
}

void __34___LTHotfixManager_refreshHotfix___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34___LTHotfixManager_refreshHotfix___block_invoke_2;
  v4[3] = &unk_265546528;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _replaceHotfix:1 completion:v4];
}

void __34___LTHotfixManager_refreshHotfix___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __34___LTHotfixManager_refreshHotfix___block_invoke_2_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __34___LTHotfixManager_refreshHotfix___block_invoke_17;
    v6[3] = &unk_265546F58;
    v6[4] = v5;
    id v7 = *(id *)(a1 + 40);
    [v5 _updateHotfixInternal:v6];
  }
}

void __34___LTHotfixManager_refreshHotfix___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __34___LTHotfixManager_refreshHotfix___block_invoke_17_cold_1();
    }
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = 2;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = 3;
  }
  [v5 _replaceHotfix:v7 completion:v6];
}

uint64_t __33___LTHotfixManager_updateHotfix___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHotfixInternal:*(void *)(a1 + 40)];
}

void __42___LTHotfixManager__updateHotfixInternal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __42___LTHotfixManager__updateHotfixInternal___block_invoke_cold_2();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = [MEMORY[0x263F3B410] minimumSupportedConfigurationVersion];
    int v10 = [v9 intValue];

    v11 = [MEMORY[0x263F3B410] maximumSupportedConfigurationVersion];
    int v12 = [v11 intValue];

    [v5 objectForKeyedSubscript:@"Mapping"];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (!v13) {
      goto LABEL_23;
    }
    uint64_t v14 = v13;
    id v27 = v5;
    v15 = 0;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v19 = [v18 objectForKeyedSubscript:@"FormatVersion"];
        int v20 = [v19 intValue];

        if (v20 >= 1 && v20 >= v10 && v20 <= v12)
        {
          id v23 = v18;

          v15 = v23;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v14);
    id v5 = v27;
    if (v15)
    {
      [*(id *)(a1 + 32) _downloadHotfix:v15 completion:*(void *)(a1 + 40)];
      uint64_t v7 = 0;
    }
    else
    {
LABEL_23:
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      v34 = @"Cannot find any compatible hotfix";
      v25 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v7 = [v24 errorWithDomain:@"HotfixManager" code:0 userInfo:v25];

      v26 = _LTOSLogAssets();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __42___LTHotfixManager__updateHotfixInternal___block_invoke_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      v15 = 0;
    }
  }
}

void __33___LTHotfixManager_deleteHotfix___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = _LTOSLogHotfix();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = hotfixBasePath;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Attempting to delete hotfix at base path %{public}@", buf, 0xCu);
  }
  v4 = [(id)hotfixBasePath path];
  int v5 = [v2 fileExistsAtPath:v4];

  if (v5)
  {
    id v10 = 0;
    [v2 removeItemAtURL:hotfixBasePath error:&v10];
    id v6 = v10;
    if (v6)
    {
      uint64_t v7 = _LTOSLogHotfix();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __33___LTHotfixManager_deleteHotfix___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __48___LTHotfixManager__downloadWithURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (!a2 || v6)
  {
    v9 = _LTOSLogHotfix();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __48___LTHotfixManager__downloadWithURL_completion___block_invoke_cold_1(a1, (uint64_t)v7, v9);
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

void __42___LTHotfixManager__downloadMappingPlist___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v8[1] = (id)MEMORY[0x263EF8330];
    v8[2] = (id)3221225472;
    v8[3] = __42___LTHotfixManager__downloadMappingPlist___block_invoke_2;
    v8[4] = &unk_265546FF8;
    id v6 = v5;
    v8[5] = v6;
    AnalyticsSendEventLazy();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v7 = v6;
  }
  else
  {
    v8[0] = 0;
    uint64_t v7 = [MEMORY[0x263F08AC0] propertyListWithData:a2 options:0 format:0 error:v8];
    id v6 = v8[0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id __42___LTHotfixManager__downloadMappingPlist___block_invoke_2(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"code";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  id v3 = [v2 stringValue];
  v8[0] = v3;
  v7[1] = @"domain";
  v4 = [*(id *)(a1 + 32) domain];
  v7[2] = @"file";
  v8[1] = v4;
  v8[2] = &unk_270C33898;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

uint64_t __47___LTHotfixManager__downloadHotfix_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = _LTOSLogHotfix();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Found existing hotfix", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    int v20 = __47___LTHotfixManager__downloadHotfix_completion___block_invoke_2;
    v21 = &unk_265546FF8;
    uint64_t v8 = &v22;
    id v22 = v6;
    AnalyticsSendEventLazy();
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47___LTHotfixManager__downloadHotfix_completion___block_invoke_69;
    v12[3] = &unk_265547070;
    uint64_t v8 = &v13;
    id v13 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v5;
    dispatch_async(v9, v12);
  }
}

id __47___LTHotfixManager__downloadHotfix_completion___block_invoke_2(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"code";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  id v3 = [v2 stringValue];
  v8[0] = v3;
  v7[1] = @"domain";
  v4 = [*(id *)(a1 + 32) domain];
  v7[2] = @"file";
  v8[1] = v4;
  v8[2] = &unk_270C338B0;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_69(void *a1)
{
  v2 = (void *)a1[4];
  id v3 = [(id)hotfixBasePath path];
  LODWORD(v2) = [v2 fileExistsAtPath:v3];

  if (v2)
  {
    v4 = (void *)a1[4];
    id v27 = 0;
    [v4 removeItemAtURL:hotfixBasePath error:&v27];
    id v5 = v27;
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = _LTOSLogHotfix();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __47___LTHotfixManager__downloadHotfix_completion___block_invoke_69_cold_3();
      }
      (*(void (**)(void))(a1[8] + 16))();
      uint64_t v8 = (void *)a1[4];
      v26 = v6;
      [v8 removeItemAtURL:hotfixBasePath error:&v26];
      v9 = v26;
LABEL_14:
      id v21 = v9;

      return;
    }
  }
  id v10 = (void *)a1[4];
  uint64_t v11 = a1[5];
  id v25 = 0;
  [v10 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v12 = v25;
  if (v12)
  {
    id v6 = v12;
    id v13 = _LTOSLogHotfix();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __47___LTHotfixManager__downloadHotfix_completion___block_invoke_69_cold_2();
    }
    (*(void (**)(void))(a1[8] + 16))();
    id v14 = (void *)a1[4];
    v24 = v6;
    [v14 removeItemAtURL:hotfixBasePath error:&v24];
    v9 = v24;
    goto LABEL_14;
  }
  uint64_t v15 = (void *)a1[6];
  uint64_t v16 = a1[7];
  uint64_t v17 = a1[5];
  id v23 = 0;
  [v15 _decompressArchive:v16 to:v17 error:&v23];
  id v18 = v23;
  if (v18)
  {
    id v6 = v18;
    uint64_t v19 = _LTOSLogHotfix();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __47___LTHotfixManager__downloadHotfix_completion___block_invoke_69_cold_1();
    }
    (*(void (**)(void))(a1[8] + 16))();
    int v20 = (void *)a1[4];
    id v22 = v6;
    [v20 removeItemAtURL:hotfixBasePath error:&v22];
    v9 = v22;
    goto LABEL_14;
  }
  objc_storeStrong((id *)(a1[6] + 16), (id)a1[5]);
  (*(void (**)(void))(a1[8] + 16))();
}

void __34___LTHotfixManager_refreshHotfix___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Hotfix asset refresh prepare failure: %@", v2, v3, v4, v5, v6);
}

void __34___LTHotfixManager_refreshHotfix___block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Hotfix asset refresh update failure: %@", v2, v3, v4, v5, v6);
}

void __42___LTHotfixManager__updateHotfixInternal___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Update of hotfix assets failed: %@", v2, v3, v4, v5, v6);
}

void __42___LTHotfixManager__updateHotfixInternal___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Update of hotfix map failed: %@", v2, v3, v4, v5, v6);
}

void __33___LTHotfixManager_deleteHotfix___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to delete hotfix: %@", v2, v3, v4, v5, v6);
}

void __48___LTHotfixManager__downloadWithURL_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Failed to download hotfix at URL '%{public}@' with error: %@", (uint8_t *)&v4, 0x16u);
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Decompression failed: %@", v2, v3, v4, v5, v6);
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_69_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Create folder failed: %@", v2, v3, v4, v5, v6);
}

void __47___LTHotfixManager__downloadHotfix_completion___block_invoke_69_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Remove folder failed: %@", v2, v3, v4, v5, v6);
}

@end