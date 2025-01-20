@interface _LTDConfigurationService
+ (id)_queue;
+ (id)aneConfigurationWithError:(id *)a3;
+ (id)asrConfigurationWithError:(id *)a3;
+ (id)assetConfigurationWithError:(id *)a3;
+ (id)cache;
+ (id)configurationForType:(int64_t)a3 error:(id *)a4;
+ (id)deserializedPlistContentsOf:(id)a3 error:(id *)a4;
+ (id)fileNameForType:(int64_t)a3;
+ (id)offlineConfigurationWithError:(id *)a3;
+ (id)overlay:(id)a3 with:(id)a4;
+ (id)preferenceOverridesFor:(int64_t)a3;
+ (id)siriConfigurationWithError:(id *)a3;
+ (id)supportedLocalePairsForTask:(int64_t)a3 error:(id *)a4;
+ (id)textStreamingConfigurationWithError:(id *)a3;
+ (id)urlForType:(int64_t)a3 source:(int64_t)a4;
+ (void)aneConfigurationWithCompletion:(id)a3;
+ (void)asrConfigurationWithCompletion:(id)a3;
+ (void)assetConfigurationWithCompletion:(id)a3;
+ (void)configurationForType:(int64_t)a3 completion:(id)a4;
+ (void)flushCache;
+ (void)offlineConfigurationWithCompletion:(id)a3;
+ (void)siriConfigurationWithCompletion:(id)a3;
+ (void)supportedLocalePairsForTask:(int64_t)a3 completion:(id)a4;
+ (void)textStreamingConfigurationWithCompletion:(id)a3;
@end

@implementation _LTDConfigurationService

+ (id)fileNameForType:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return &stru_270C008E8;
  }
  else {
    return off_265546628[a3];
  }
}

+ (id)cache
{
  if (cache_onceToken != -1) {
    dispatch_once(&cache_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)cache_cache;
  return v2;
}

+ (id)_queue
{
  if (_queue_onceToken != -1) {
    dispatch_once(&_queue_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)_queue__queue;
  return v2;
}

+ (void)configurationForType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [a1 _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60___LTDConfigurationService_configurationForType_completion___block_invoke;
  block[3] = &unk_2655465C0;
  id v11 = a1;
  int64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

+ (id)configurationForType:(int64_t)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v7 = [a1 cache];
  id v8 = [v7 objectForType:a3 error:0];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (char v11 = objc_msgSend(v10, "lt_ensureTypesForKeys:values:", v9, 0), v12 = v10, (v11 & 1) == 0))
  {

    int64_t v12 = 0;
  }

  if (v12)
  {
    id v13 = v12;
    v14 = v13;
    goto LABEL_54;
  }
  switch(a3)
  {
    case 0:
      v15 = [a1 urlForType:1 source:0];
      v17 = [a1 urlForType:0 source:0];
      v16 = [a1 urlForType:0 source:1];
      goto LABEL_14;
    case 1:
      id v18 = a1;
      uint64_t v19 = 1;
      goto LABEL_13;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
      v15 = [a1 urlForType:a3 source:0];
      v16 = [a1 urlForType:a3 source:1];
      v17 = 0;
      goto LABEL_14;
    case 7:
      id v18 = a1;
      uint64_t v19 = 7;
LABEL_13:
      v15 = [v18 urlForType:v19 source:0];
      v17 = 0;
      v16 = 0;
      goto LABEL_14;
    case 9:
      v37 = _LTOSLogAssets();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        +[_LTDConfigurationService configurationForType:error:].cold.7(v37);
      }
      v15 = [a1 cache];
      [v15 removeObjectForType:9];
      id v13 = 0;
      v14 = 0;
      goto LABEL_53;
    default:
      v17 = 0;
      v16 = 0;
      v15 = 0;
LABEL_14:
      v20 = [a1 fileNameForType:a3];
      if (v15)
      {
        v21 = _LTOSLogAssets();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          +[_LTDConfigurationService configurationForType:error:].cold.6();
        }
        id v50 = 0;
        id v13 = [a1 deserializedPlistContentsOf:v15 error:&v50];
        id v22 = v50;
        if (v22)
        {
          v23 = v22;
          v24 = _LTOSLogAssets();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            +[_LTDConfigurationService configurationForType:error:].cold.5();
            if (!a4) {
              goto LABEL_21;
            }
          }
          else if (!a4)
          {
LABEL_21:
            v25 = [a1 cache];
            [v25 removeObjectForType:a3];

            v14 = 0;
            goto LABEL_52;
          }
          *a4 = v23;
          goto LABEL_21;
        }
      }
      else
      {
        id v13 = 0;
      }
      v46 = v17;
      if (!v17) {
        goto LABEL_32;
      }
      v26 = _LTOSLogAssets();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        +[_LTDConfigurationService configurationForType:error:].cold.4();
      }
      id v49 = 0;
      v27 = [a1 deserializedPlistContentsOf:v17 error:&v49];
      id v28 = v49;
      if (v28)
      {
        v29 = _LTOSLogAssets();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          if (!a4) {
            goto LABEL_31;
          }
          goto LABEL_29;
        }
        +[_LTDConfigurationService configurationForType:error:]();
        if (a4) {
LABEL_29:
        }
          *a4 = v28;
      }
      else
      {
        uint64_t v30 = [a1 overlay:v13 with:v27];

        id v13 = (id)v30;
      }
LABEL_31:

LABEL_32:
      if (!v16) {
        goto LABEL_49;
      }
      v31 = _LTOSLogAssets();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        +[_LTDConfigurationService configurationForType:error:]();
      }
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __55___LTDConfigurationService_configurationForType_error___block_invoke;
      v48[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
      v48[4] = a1;
      +[_LTDAssetService refreshCatalogIfNeededWithCompletion:v48];
      id v47 = 0;
      v32 = [a1 deserializedPlistContentsOf:v16 error:&v47];
      id v33 = v47;
      if (!v33)
      {
        uint64_t v36 = [a1 overlay:v13 with:v32];

        id v13 = (id)v36;
        goto LABEL_48;
      }
      v34 = _LTOSLogAssets();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v33;
        _os_log_impl(&dword_2600DC000, v34, OS_LOG_TYPE_INFO, "Failed to retrieve managed configuration %@", buf, 0xCu);
      }
      v35 = objc_msgSend(v33, "domain", v20);
      if (v35 != (void *)*MEMORY[0x263F07F70]) {
        goto LABEL_39;
      }
      uint64_t v38 = [v33 code];

      if (v38 == 260)
      {
        v39 = _LTOSLogAssets();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v40 = v39;
          v35 = [v16 path];
          *(_DWORD *)buf = 138543362;
          id v52 = v35;
          _os_log_impl(&dword_2600DC000, v40, OS_LOG_TYPE_INFO, "File not installed at: %{public}@", buf, 0xCu);

LABEL_39:
        }
      }
      v20 = v45;
LABEL_48:

LABEL_49:
      v23 = [a1 preferenceOverridesFor:a3];
      v41 = [a1 overlay:v13 with:v23];

      v42 = _LTOSLogAssets();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        +[_LTDConfigurationService configurationForType:error:]();
      }
      v43 = [a1 cache];
      [v43 setObject:v41 forType:a3];

      id v13 = v41;
      v14 = v13;
      v17 = v46;
LABEL_52:

LABEL_53:
LABEL_54:

      return v14;
  }
}

+ (id)urlForType:(int64_t)a3 source:(int64_t)a4
{
  v5 = [a1 fileNameForType:a3];
  if (a4 == 2)
  {
    uint64_t v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[_LTDConfigurationService urlForType:source:].cold.4(v9);
    }
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    id v16 = 0;
    id v6 = +[_LTDAssetService configAssetIfAvailableWithError:&v16];
    id v10 = v16;
    if (v6 && ([v6 isInstalled] & 1) == 0)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 8, @"Not installed", 0);

      v7 = 0;
      id v10 = (id)v12;
    }
    else if (v10)
    {
      char v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[_LTDConfigurationService urlForType:source:]();
      }
      v7 = 0;
    }
    else
    {
      id v10 = [v6 getLocalFileUrl];
      id v13 = [v10 URLByAppendingPathComponent:v5];
      v7 = [v13 URLByAppendingPathExtension:@"plist"];

      v14 = _LTOSLogAssets();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        +[_LTDConfigurationService urlForType:source:]();
      }
    }

    goto LABEL_19;
  }
  if (a4)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_20;
  }
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 URLForResource:v5 withExtension:@"plist"];
  id v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[_LTDConfigurationService urlForType:source:]();
  }
LABEL_19:

LABEL_20:
  return v7;
}

+ (id)preferenceOverridesFor:(int64_t)a3
{
  v3 = [a1 fileNameForType:a3];
  v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v5 = [v4 objectForKey:v3];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (!v7
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (char v8 = objc_msgSend(v7, "lt_ensureTypesForKeys:values:", v6, 0), v9 = v7, (v8 & 1) == 0))
  {

    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)overlay:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = (void *)[v5 mutableCopy];
    [v7 addEntriesFromDictionary:v6];
    id v8 = (id)[v7 copy];
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

+ (id)deserializedPlistContentsOf:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [NSString stringWithFormat:@"Invalid configuration URL: %@", 0];
    objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 12, v8, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[_LTDConfigurationService deserializedPlistContentsOf:error:]();
    }
    goto LABEL_9;
  }
  id v6 = _LTOSLogAssets();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[_LTDConfigurationService deserializedPlistContentsOf:error:].cold.5();
  }
  id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:0 error:a4];
  id v8 = v7;
  if (*a4)
  {
    uint64_t v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[_LTDConfigurationService deserializedPlistContentsOf:error:].cold.4();
    }
LABEL_9:
    id v11 = 0;
    goto LABEL_10;
  }
  if (![v7 length])
  {
    objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 10, @"Failed to read configuration file", MEMORY[0x263EFFA78]);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = _LTOSLogAssets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[_LTDConfigurationService deserializedPlistContentsOf:error:]();
    }
    goto LABEL_9;
  }
  id v13 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:0 format:0 error:a4];
  v14 = v13;
  if (*a4)
  {
    v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[_LTDConfigurationService deserializedPlistContentsOf:error:]();
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v13;
  }

LABEL_10:
  return v11;
}

+ (void)flushCache
{
  id v2 = [a1 cache];
  [v2 removeAllObjects];
}

+ (id)asrConfigurationWithError:(id *)a3
{
  v3 = [a1 configurationForType:8 error:0];
  v4 = [[_LTDASRConfigurationModel alloc] initWithDictionary:v3];

  return v4;
}

+ (void)asrConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59___LTDConfigurationService_asrConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_265546608;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)offlineConfigurationWithError:(id *)a3
{
  v3 = [a1 configurationForType:2 error:a3];
  id v4 = [[_LTDOfflineConfigurationModel alloc] initWithDictionary:v3];

  return v4;
}

+ (void)offlineConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63___LTDConfigurationService_offlineConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_265546608;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)siriConfigurationWithError:(id *)a3
{
  v3 = [a1 configurationForType:5 error:a3];
  id v4 = [[_LTDSiriConfigurationModel alloc] initWithDictionary:v3];

  return v4;
}

+ (void)siriConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60___LTDConfigurationService_siriConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_265546608;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)textStreamingConfigurationWithError:(id *)a3
{
  v3 = [a1 configurationForType:0 error:a3];
  id v4 = [[_LTDTextStreamingConfigurationModel alloc] initWithDictionary:v3];

  return v4;
}

+ (void)textStreamingConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69___LTDConfigurationService_textStreamingConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_265546608;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)assetConfigurationWithError:(id *)a3
{
  v3 = [a1 configurationForType:1 error:a3];
  id v4 = [[_LTDAssetConfigurationModel alloc] initWithDictionary:v3];

  return v4;
}

+ (void)assetConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61___LTDConfigurationService_assetConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_265546608;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)aneConfigurationWithError:(id *)a3
{
  v3 = +[_LTDConfigurationService configurationForType:7 error:a3];
  id v4 = [[_LTDANEConfigurationModel alloc] initWithDictionary:v3];

  return v4;
}

+ (void)aneConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59___LTDConfigurationService_aneConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_265546608;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)supportedLocalePairsForTask:(int64_t)a3 error:(id *)a4
{
  uint64_t v4 = 3;
  if (a3 == 4) {
    uint64_t v4 = 5;
  }
  if (a3 == 2) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v10 = 0;
  id v6 = +[_LTDConfigurationService configurationForType:v5 error:&v10];
  id v7 = [v6 objectForKeyedSubscript:@"LanguagePairs"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v7, "lt_ensureElementType:", objc_opt_class()))
    {
      id v8 = [v7 _ltCompactMap:&__block_literal_global_65];
      goto LABEL_12;
    }
  }
  else
  {

    id v7 = 0;
  }
  id v8 = (void *)MEMORY[0x263EFFA68];
LABEL_12:

  return v8;
}

+ (void)supportedLocalePairsForTask:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67___LTDConfigurationService_supportedLocalePairsForTask_completion___block_invoke;
  block[3] = &unk_2655465C0;
  id v11 = a1;
  int64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

+ (void)configurationForType:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Caching config for %{public}@", v2, v3, v4, v5, v6);
}

+ (void)configurationForType:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Retrieve managed config for %{public}@", v2, v3, v4, v5, v6);
}

+ (void)configurationForType:error:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to retrieve overlay configuration %@", v2, v3, v4, v5, v6);
}

+ (void)configurationForType:error:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Retrieve overlay config for %{public}@", v2, v3, v4, v5, v6);
}

+ (void)configurationForType:error:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to retrieve bundled configuration %@", v2, v3, v4, v5, v6);
}

+ (void)configurationForType:error:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Retrieve bundled config for %{public}@", v2, v3, v4, v5, v6);
}

+ (void)configurationForType:(os_log_t)log error:.cold.7(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 9;
  _os_log_fault_impl(&dword_2600DC000, log, OS_LOG_TYPE_FAULT, "Invalid configuration base type %zd", (uint8_t *)&v1, 0xCu);
}

+ (void)urlForType:source:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2600DC000, v0, v1, "URL for type: %{public}@ source: bundled result: %{public}@");
}

+ (void)urlForType:source:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_2600DC000, v0, v1, "URL for type: %{public}@ source: config result: %{public}@");
}

+ (void)urlForType:source:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2600DC000, v1, OS_LOG_TYPE_ERROR, "Config source URL for type: %{public}@ lookup failure: %@", v2, 0x16u);
}

+ (void)urlForType:(os_log_t)log source:.cold.4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_2600DC000, log, OS_LOG_TYPE_FAULT, "Invalid configuration source request", v1, 2u);
}

+ (void)deserializedPlistContentsOf:error:.cold.1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  _os_log_fault_impl(&dword_2600DC000, v0, OS_LOG_TYPE_FAULT, "Failed to get asset URL for installed MobileAsset; will attempt to fall back to bundled asset %@",
    v1,
    0xCu);
}

+ (void)deserializedPlistContentsOf:error:.cold.2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Empty plist %@", v2, v3, v4, v5, v6);
}

+ (void)deserializedPlistContentsOf:error:.cold.3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to deserialize plist %@", v2, v3, v4, v5, v6);
}

+ (void)deserializedPlistContentsOf:error:.cold.4()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read plist %@", v2, v3, v4, v5, v6);
}

+ (void)deserializedPlistContentsOf:error:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2600DC000, v0, v1, "Reading configuration plist at URL: %{public}@", v2, v3, v4, v5, v6);
}

@end