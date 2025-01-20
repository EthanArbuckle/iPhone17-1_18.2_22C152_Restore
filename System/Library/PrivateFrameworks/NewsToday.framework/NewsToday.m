uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void NTPossiblySimulateCrashWithError(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTPossiblySimulateCrashWithError_cold_1();
  }
  if ((FCShouldErrorBeExcludedFromSimulatedCrashes() & 1) == 0)
  {
    v2 = NTSharedLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = [v1 description];
      int v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_22592C000, v2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
    }
    v4 = NTSharedLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = [v1 description];
      int v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_22592C000, v4, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v12, 0xCu);
    }
    id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v6 setNumberStyle:5];
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
    [v6 setLocale:v7];
    v8 = NTSharedLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = [v1 domain];
      v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v1, "code"));
      v11 = [v6 stringFromNumber:v10];
      int v12 = 138543618;
      v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_22592C000, v8, OS_LOG_TYPE_FAULT, "%{public}@-%{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
}

void sub_225930F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id NTSharedLog()
{
  if (NTSharedLog_once != -1) {
    dispatch_once(&NTSharedLog_once, &__block_literal_global_0);
  }
  v0 = (void *)NTSharedLog_result;

  return v0;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

uint64_t __NTSharedLog_block_invoke()
{
  NTSharedLog_result = (uint64_t)os_log_create("com.apple.news", "NewsToday");

  return MEMORY[0x270F9A758]();
}

void NTDeleteOnDiskAssets(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTDeleteOnDiskAssets_cold_1();
  }
  v2 = [MEMORY[0x263F08850] defaultManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __NTDeleteOnDiskAssets_block_invoke;
  v4[3] = &unk_26475C2E0;
  id v5 = v2;
  id v3 = v2;
  [v1 enumerateObjectsUsingBlock:v4];
}

void __NTDeleteOnDiskAssets_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = NTSharedLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22592C000, v4, OS_LOG_TYPE_INFO, "Deleting on disk asset with assetFileURL: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) removeItemAtURL:v3 error:0];
}

id NTPBTodaySectionConfigGenerateArticle(void *a1, BOOL *a2)
{
  id v3 = a1;
  v4 = objc_opt_new();
  int v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59048]];
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTPBTodaySectionConfigGenerateArticle_cold_1();
  }
  [v4 setArticleID:v5];
  id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59050]];
  [v4 setDisplayDateString:v6];
  uint64_t v7 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59080]];
  [v4 setStoryType:v7];
  uint64_t v8 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59078]];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    char v14 = 0;
    v10 = NTPBTodaySectionConfigGenerateArticle(v8, &v14);
    if (v14) {
      [v4 setPaidArticle:v10];
    }
  }
  uint64_t v11 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59088]];
  [v4 setTitle:v11];
  int v12 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59040]];
  [v4 setActionURLString:v12];

  if (a2) {
    *a2 = v5 != 0;
  }

  return v4;
}

id NTPBTodaySectionConfigGenerateArticles(void *a1, unsigned char *a2)
{
  id v3 = a1;
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTPBTodaySectionConfigGenerateArticles_cold_1();
  }
  v4 = objc_opt_new();
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __NTPBTodaySectionConfigGenerateArticles_block_invoke;
  v7[3] = &unk_26475C4B0;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [v3 enumerateObjectsUsingBlock:v7];
  if (a2) {
    *a2 = *((unsigned char *)v11 + 24);
  }

  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_225935E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __NTPBTodaySectionConfigGenerateArticles_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v11 = 0;
  id v6 = NTPBTodaySectionConfigGenerateArticle(a2, &v11);
  [*(id *)(a1 + 32) addObject:v6];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v8 = v11;
  if (*(unsigned char *)(v7 + 24)) {
    BOOL v9 = !v11;
  }
  else {
    BOOL v9 = 1;
  }
  char v10 = !v9;
  *(unsigned char *)(v7 + 24) = v10;
  if (!v8) {
    *a4 = 1;
  }
}

id NTPBTodaySectionConfigGenerateItems(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTPBTodaySectionConfigGenerateItems_cold_1();
  }
  uint64_t v7 = objc_opt_new();
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __NTPBTodaySectionConfigGenerateItems_block_invoke;
  v10[3] = &unk_26475C4B0;
  id v8 = v7;
  id v11 = v8;
  uint64_t v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v10];
  if (a3) {
    *a3 = *((unsigned char *)v14 + 24);
  }

  _Block_object_dispose(&v13, 8);

  return v8;
}

void sub_225936058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __NTPBTodaySectionConfigGenerateItems_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_new();
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F59100]];
  if ([v8 isEqualToString:*MEMORY[0x263F590F8]])
  {
    [v7 setItemType:0];
    BOOL v14 = 0;
    BOOL v9 = NTPBTodaySectionConfigGenerateArticle(v6, &v14);
    [v7 setArticle:v9];

    BOOL v10 = v14;
    [*(id *)(a1 + 32) addObject:v7];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    char v13 = v10 && *(unsigned char *)(v11 + 24) != 0;
    *(unsigned char *)(v11 + 24) = v13;
    if (!v10) {
      *a4 = 1;
    }
  }
}

void sub_2259385EC(_Unwind_Exception *a1)
{
}

uint64_t OUTLINED_FUNCTION_0_1@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(v2 + 24) = a2;
  *(_WORD *)(v2 + 2_Block_object_dispose(&STACK[0x2B0], 8) = 2114;
  *(void *)(v2 + 30) = result;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, v4, 0x26u);
}

void OUTLINED_FUNCTION_2_1(uint64_t a1@<X8>)
{
  *(void *)(v1 + 14) = a1;
  *(_WORD *)(v1 + 22) = 1024;
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  *(void *)(v1 + 4) = a1;
  *(_WORD *)(v1 + 12) = 2080;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id NNSetupCompanionSyncLog()
{
  if (NNSetupCompanionSyncLog_onceToken != -1) {
    dispatch_once(&NNSetupCompanionSyncLog_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)NNSetupCompanionSyncLog_log;

  return v0;
}

uint64_t __NNSetupCompanionSyncLog_block_invoke()
{
  NNSetupCompanionSyncLog_log = (uint64_t)os_log_create("com.apple.nanonews", "CompanionSync");

  return MEMORY[0x270F9A758]();
}

id NNNanoSoloLog()
{
  if (NNNanoSoloLog_onceToken != -1) {
    dispatch_once(&NNNanoSoloLog_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)NNNanoSoloLog_log;

  return v0;
}

uint64_t __NNNanoSoloLog_block_invoke()
{
  NNNanoSoloLog_log = (uint64_t)os_log_create("com.apple.nanonews", "Solo");

  return MEMORY[0x270F9A758]();
}

id NNHeadlineSyncableResultFromResult(void *a1, int a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = objc_msgSend(v3, "sync_expirationDate");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v5 forKeyedSubscript:@"sync_expirationDate"];
  }
  id v6 = objc_msgSend(v3, "sync_sections");
  uint64_t v7 = (void *)[v6 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = v4;
    id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (![v14 conformsToProtocol:&unk_26D9319C0])
          {
            v4 = v20;
            goto LABEL_14;
          }
          uint64_t v15 = NNHeadlineSyncableSectionFromSection(v14, a2);
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v9 = (id)[v8 copy];
    v4 = v20;
    [v20 setObject:v9 forKeyedSubscript:@"sync_sections"];
LABEL_14:
  }
  uint64_t v16 = objc_msgSend(v3, "sync_headlineCount");
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = [NSNumber numberWithUnsignedInteger:v16];
    [v4 setObject:v17 forKeyedSubscript:@"sync_headlineCount"];
  }
  v18 = (void *)[v4 copy];

  return v18;
}

id NNHeadlineSyncableSectionFromSection(void *a1, int a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = objc_msgSend(v3, "sync_identifier");
  id v6 = (void *)[v5 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v6 forKeyedSubscript:@"sync_identifier"];
  }
  uint64_t v7 = objc_msgSend(v3, "sync_name");
  id v8 = (void *)[v7 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v8 forKeyedSubscript:@"sync_name"];
  }
  id v9 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v8;
    __int16 v36 = 2112;
    unint64_t v37 = (unint64_t)v6;
    _os_log_impl(&dword_22592C000, v9, OS_LOG_TYPE_INFO, "Creating Syncable Section with name=%@ and ID = %@…", buf, 0x16u);
  }

  unint64_t v10 = objc_msgSend(v3, "sync_type");
  if (v10 > 5)
  {
    uint64_t v11 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = v3;
      __int16 v36 = 2048;
      unint64_t v37 = v10;
      _os_log_impl(&dword_22592C000, v11, OS_LOG_TYPE_INFO, "Didn't know what this section type was: %@ %lu", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:v10];
    [v4 setObject:v11 forKeyedSubscript:@"sync_type"];
  }

  uint64_t v12 = objc_msgSend(v3, "sync_colorHexString");
  char v13 = (void *)[v12 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v13 forKeyedSubscript:@"sync_colorHexString"];
  }
  BOOL v14 = objc_msgSend(v3, "sync_headlines");
  uint64_t v15 = (void *)[v14 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = v13;
    v27 = v8;
    v28 = v6;
    uint64_t v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
LABEL_16:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v29 + 1) + 8 * v21);
        if (![v22 conformsToProtocol:&unk_26D931A20]) {
          break;
        }
        long long v23 = NNHeadlineSyncableResultFromHeadline(v22, a2);
        [v16 addObject:v23];

        if (v19 == ++v21)
        {
          uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v19) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:

      id v17 = (id)[v16 copy];
      [v4 setObject:v17 forKeyedSubscript:@"sync_headlines"];
    }

    id v8 = v27;
    id v6 = v28;
    char v13 = v26;
  }
  long long v24 = (void *)[v4 copy];

  return v24;
}

id NNHeadlineSyncableResultFromHeadline(void *a1, int a2)
{
  id v3 = a1;
  v4 = objc_msgSend(v3, "sync_identifier");
  uint64_t v5 = objc_msgSend(v3, "sync_title");
  id v6 = objc_msgSend(v3, "sync_excerpt");
  int v15 = a2;
  if (a2)
  {
    uint64_t v7 = objc_msgSend(v3, "sync_thumbnailImageData");
    id v8 = objc_msgSend(v3, "sync_publisherLogoImageData");
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = 0;
  }
  id v9 = objc_msgSend(v3, "sync_publisherName");
  unint64_t v10 = objc_msgSend(v3, "sync_publisherIdentifier");
  uint64_t v11 = objc_msgSend(v3, "sync_NewsURLString");
  uint64_t v12 = v4;
  char v13 = NNCreateHeadlineSyncableHeadline(v4, v5, v6, v7, v8, v9, v10, v11);

  if (v15)
  {
  }

  return v13;
}

id NNCreateHeadlineSyncableHeadline(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a2;
  id v39 = a3;
  id v16 = a4;
  id v17 = a5;
  id v38 = a6;
  id v37 = a7;
  id v18 = a8;
  uint64_t v19 = (void *)MEMORY[0x263EFF9A0];
  id v20 = a1;
  uint64_t v21 = [v19 dictionary];
  uint64_t v22 = [v20 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 setObject:v22 forKeyedSubscript:@"sync_identifier"];
  }
  v33 = (void *)v22;
  __int16 v36 = v15;
  long long v23 = (void *)[v15 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 setObject:v23 forKeyedSubscript:@"sync_title"];
  }
  long long v24 = (void *)[v39 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 setObject:v24 forKeyedSubscript:@"sync_excerpt"];
  }
  v34 = v18;
  v25 = (void *)[v18 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 setObject:v25 forKeyedSubscript:@"sync_NewsURLString"];
  }
  id v35 = v16;
  uint64_t v26 = (void *)[v16 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 setObject:v26 forKeyedSubscript:@"sync_thumbnailImageData"];
  }
  v27 = v17;
  v28 = (void *)[v17 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 setObject:v28 forKeyedSubscript:@"sync_publisherLogoImageData"];
  }
  long long v29 = (void *)[v38 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 setObject:v29 forKeyedSubscript:@"sync_publisherName"];
  }
  long long v30 = (void *)[v37 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 setObject:v30 forKeyedSubscript:@"sync_publisherIdentifier"];
  }
  long long v31 = (void *)[v21 copy];

  return v31;
}

void sub_22593C388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NTCatchUpOperationArticleIDsRequest *NTArticleIDsRequestWithArticles(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTArticleIDsRequestWithArticles_cold_1();
  }
  uint64_t v2 = objc_opt_new();
  id v3 = objc_opt_new();
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __NTArticleIDsRequestWithArticles_block_invoke;
  uint64_t v12 = &unk_26475C610;
  id v13 = v2;
  id v14 = v3;
  id v4 = v3;
  id v5 = v2;
  [v1 enumerateObjectsUsingBlock:&v9];
  id v6 = [NTCatchUpOperationArticleIDsRequest alloc];
  uint64_t v7 = -[NTCatchUpOperationArticleIDsRequest initWithArticleIDs:overrideHeadlineMetadataByArticleID:](v6, "initWithArticleIDs:overrideHeadlineMetadataByArticleID:", v5, v4, v9, v10, v11, v12);

  return v7;
}

void __NTArticleIDsRequestWithArticles_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 articleID];
  [*(id *)(a1 + 32) addObject:v4];
  [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:v4];
}

uint64_t FCConsumedArticleFilterMethodForReadArticlesFilterMethod(int a1)
{
  if (a1 == 1) {
    return 1;
  }
  else {
    return 2 * (a1 == 0);
  }
}

uint64_t FCConsumedArticleFilterMethodForSeenArticlesFilterMethod(int a1)
{
  if (a1 == 1) {
    return 1;
  }
  else {
    return 2 * (a1 == 2);
  }
}

void sub_22593DDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22593EF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 240), 8);
  _Block_object_dispose((const void *)(v49 - 192), 8);
  _Block_object_dispose((const void *)(v49 - 144), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void sub_2259437D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225944C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225947068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_225948704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225948854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22594D1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

uint64_t NTDesiredHeadlineFieldAssetOptionsWithAssetSizes(unint64_t a1, uint64_t a2)
{
  if (a1 > 3) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_22596E7A8[a1];
  }
  uint64_t v3 = v2 | 0x20;
  uint64_t v4 = v2 | 0x80020;
  if (!a2) {
    v2 |= 0x10uLL;
  }
  if (a2 == 1) {
    uint64_t v2 = v4;
  }
  if (a2 == 2) {
    return v3;
  }
  else {
    return v2;
  }
}

uint64_t NTDesiredHeadlineFieldOptionsWithAssetOptions(uint64_t a1)
{
  return a1 | 1;
}

void sub_22594E340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double NTHeadlineThumbnailLengthFromThumbnailSizePreset(unint64_t a1)
{
  double result = 0.0;
  if (a1 <= 3) {
    return dbl_22596E7C8[a1];
  }
  return result;
}

double NTHeadlineSourceNameImageHeightFromNameImageSizePreset(unint64_t a1)
{
  double result = 0.0;
  if (a1 <= 2) {
    return dbl_22596E7E8[a1];
  }
  return result;
}

id ColorPoint(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F5A300];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F58F70]];
  [v4 doubleValue];
  objc_msgSend(v3, "setX:");

  uint64_t v5 = [v2 objectForKeyedSubscript:*MEMORY[0x263F58F78]];

  [v5 doubleValue];
  objc_msgSend(v3, "setY:");

  return v3;
}

id ColorStop(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F5A2A0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F58F60]];
  [v3 setColor:v4];

  uint64_t v5 = [v2 objectForKeyedSubscript:*MEMORY[0x263F58F50]];

  objc_msgSend(v3, "setLocation:", objc_msgSend(v5, "intValue"));

  return v3;
}

id ColorGradientWithJSONDictionary(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263F5A288]);
  id v3 = [v1 objectForKeyedSubscript:*MEMORY[0x263F58F80]];
  uint64_t v4 = ColorPoint(v3);

  uint64_t v5 = [v1 objectForKeyedSubscript:*MEMORY[0x263F58F68]];
  id v6 = ColorPoint(v5);

  uint64_t v7 = [v1 objectForKeyedSubscript:*MEMORY[0x263F58F58]];
  id v8 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = ColorStop(*(void **)(*((void *)&v16 + 1) + 8 * i));
        objc_msgSend(v8, "addObject:", v14, (void)v16);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v2 setStartPoint:v4];
  [v2 setEndPoint:v6];
  [v2 setColorStops:v8];

  return v2;
}

id ColorGradientPairWithJSONDictionary(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F5A290];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F58FB0]];
  uint64_t v5 = ColorGradientWithJSONDictionary(v4);

  id v6 = [v2 objectForKeyedSubscript:*MEMORY[0x263F58FA8]];

  uint64_t v7 = ColorGradientWithJSONDictionary(v6);

  [v3 setLight:v5];
  [v3 setDark:v7];

  return v3;
}

id ColorPairWithJSONDictionary(void *a1)
{
  if (a1)
  {
    id v1 = (objc_class *)MEMORY[0x263F5A298];
    id v2 = a1;
    id v3 = objc_alloc_init(v1);
    uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F58FD0]];
    uint64_t v5 = [v2 objectForKeyedSubscript:*MEMORY[0x263F58FC8]];

    [v3 setLight:v4];
    [v3 setDark:v5];
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __ColorPairWithJSONDictionary_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_22595170C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_22595383C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NTAssetFileURL(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTAssetFileURL_cold_1();
  }
  uint64_t v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = [v2 UUIDString];
  uint64_t v4 = [v1 URLByAppendingPathComponent:v3];

  return v4;
}

id NTAssetFileURLWithData(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    NTAssetFileURLWithData_cold_2();
    if (v4) {
      goto LABEL_6;
    }
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTAssetFileURLWithData_cold_1();
  }
LABEL_6:
  uint64_t v5 = NTAssetFileURL(v4);
  [v3 writeToURL:v5 atomically:1];

  return v5;
}

id NTAssetFileURLWithFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    NTAssetFileURLWithFile_cold_2();
    if (v4) {
      goto LABEL_6;
    }
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTAssetFileURLWithFile_cold_1();
  }
LABEL_6:
  uint64_t v5 = NTAssetFileURL(v4);
  id v6 = [MEMORY[0x263F08850] defaultManager];
  [v6 copyItemAtURL:v3 toURL:v5 error:0];

  return v5;
}

BOOL NTIsUserInExperiment(void *a1, double a2, double a3)
{
  id v5 = a1;
  unint64_t v6 = vcvtmd_u64_f64(a3 * 100.0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __NTIsUserInExperiment_block_invoke;
  v12[3] = &unk_26475D3B8;
  id v13 = v5;
  uint64_t v14 = 100;
  id v7 = v5;
  id v8 = __NTIsUserInExperiment_block_invoke((uint64_t)v12);
  BOOL v10 = (unint64_t)v8 >= vcvtmd_u64_f64(a2 * 100.0) && (unint64_t)v8 < v6;

  return v10;
}

void *__NTIsUserInExperiment_block_invoke(uint64_t a1)
{
  double result = *(void **)(a1 + 32);
  if (result) {
    return (void *)((unint64_t)[result hash] % *(void *)(a1 + 40));
  }
  return result;
}

unint64_t NTSectionFeedItemsLimit(int a1, void *a2, unint64_t a3, double a4)
{
  id v7 = a2;
  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTSectionFeedItemsLimit_cold_2();
  }
  if (a4 < 0.0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTSectionFeedItemsLimit_cold_1();
  }
  double v8 = 0.0;
  if (a1) {
    objc_msgSend(v7, "sectionTitleSlotCost", 0.0);
  }
  double v9 = a4 - v8;
  [v7 sectionFooterSlotCost];
  double v11 = v9 - v10;
  [v7 headlineSlotCost];
  double v13 = v11 - v12;
  if (v13 >= 0.0)
  {
    [v7 headlineSlotCost];
    unint64_t v14 = (unint64_t)(floor(v13 / v15) + 1.0);
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (v14 < a3) {
    a3 = v14;
  }

  return a3;
}

id NTCKRecordFromArticleJSONDictionary(void *a1)
{
  id v1 = (void *)*MEMORY[0x263F58F30];
  id v2 = a1;
  id v3 = NTNewsEdgeArticleRecordOverrideKeys();
  id v4 = NTNewsEdgeArticleEncodedFields();
  id v5 = NTNewsEdgeArticleDateFields();
  unint64_t v6 = NTCKRecordFromJSONDictionary(v2, v1, v3, v4, v5);

  return v6;
}

id NTCKRecordFromJSONDictionary(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = FCAppConfigurationStringValue();
  double v15 = FCAppConfigurationStringValue();
  long long v16 = FCAppConfigurationStringValue();
  id v17 = 0;
  if (v14 && v15)
  {
    id v18 = objc_alloc(MEMORY[0x263EFD808]);
    long long v24 = (void *)[v18 initWithZoneName:*MEMORY[0x263EFD520] ownerName:*MEMORY[0x263EFD488]];
    id v19 = v10;
    id v20 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v14 zoneID:v24];
    v25 = v19;
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:v19 recordID:v20];
    [v21 setEtag:v15];
    if (v16) {
      objc_msgSend(MEMORY[0x263EFF910], "fc_dateFromStringWithISO8601Format:", v16);
    }
    else {
    uint64_t v22 = [MEMORY[0x263EFF910] date];
    }
    [v21 setModificationDate:v22];

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __NTCKRecordFromJSONDictionary_block_invoke;
    v26[3] = &unk_26475D438;
    id v27 = v11;
    id v28 = v12;
    id v17 = v21;
    id v29 = v17;
    id v30 = v13;
    [v9 enumerateKeysAndObjectsUsingBlock:v26];

    id v10 = v25;
  }

  return v17;
}

id NTNewsEdgeArticleRecordOverrideKeys()
{
  if (NTNewsEdgeArticleRecordOverrideKeys_onceToken != -1) {
    dispatch_once(&NTNewsEdgeArticleRecordOverrideKeys_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)NTNewsEdgeArticleRecordOverrideKeys_result;

  return v0;
}

id NTNewsEdgeArticleEncodedFields()
{
  if (NTNewsEdgeArticleEncodedFields_onceToken != -1) {
    dispatch_once(&NTNewsEdgeArticleEncodedFields_onceToken, &__block_literal_global_33);
  }
  v0 = (void *)NTNewsEdgeArticleEncodedFields_result;

  return v0;
}

id NTNewsEdgeArticleDateFields()
{
  if (NTNewsEdgeArticleDateFields_onceToken != -1) {
    dispatch_once(&NTNewsEdgeArticleDateFields_onceToken, &__block_literal_global_37_0);
  }
  v0 = (void *)NTNewsEdgeArticleDateFields_result;

  return v0;
}

id NTCKRecordFromTagJSONDictionary(void *a1)
{
  id v1 = (void *)*MEMORY[0x263F58FA0];
  id v2 = a1;
  id v3 = NTNewsEdgeTagRecordOverrideKeys();
  id v4 = NTNewsEdgeTagEncodedFields();
  id v5 = NTCKRecordFromJSONDictionary(v2, v1, v3, v4, 0);

  return v5;
}

id NTNewsEdgeTagRecordOverrideKeys()
{
  if (NTNewsEdgeTagRecordOverrideKeys_onceToken != -1) {
    dispatch_once(&NTNewsEdgeTagRecordOverrideKeys_onceToken, &__block_literal_global_31_0);
  }
  v0 = (void *)NTNewsEdgeTagRecordOverrideKeys_result;

  return v0;
}

id NTNewsEdgeTagEncodedFields()
{
  if (NTNewsEdgeTagEncodedFields_onceToken != -1) {
    dispatch_once(&NTNewsEdgeTagEncodedFields_onceToken, &__block_literal_global_39_0);
  }
  v0 = (void *)NTNewsEdgeTagEncodedFields_result;

  return v0;
}

id NTCKRecordFromArticleListJSONDictionary(void *a1)
{
  id v1 = (void *)*MEMORY[0x263F58F18];
  id v2 = a1;
  id v3 = NTNewsEdgeArticleListRecordOverrideKeys();
  id v4 = NTCKRecordFromJSONDictionary(v2, v1, v3, 0, 0);

  return v4;
}

id NTNewsEdgeArticleListRecordOverrideKeys()
{
  if (NTNewsEdgeArticleListRecordOverrideKeys_onceToken != -1) {
    dispatch_once(&NTNewsEdgeArticleListRecordOverrideKeys_onceToken, &__block_literal_global_29);
  }
  v0 = (void *)NTNewsEdgeArticleListRecordOverrideKeys_result;

  return v0;
}

void __NTCKRecordFromJSONDictionary_block_invoke(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [a1[4] objectForKeyedSubscript:v6];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = v6;
  }
  id v11 = v10;

  char v12 = [a1[5] containsObject:v6];
  if (v12) {
    goto LABEL_6;
  }
  id v13 = a1[5];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __NTCKRecordFromJSONDictionary_block_invoke_2;
  v18[3] = &unk_26475D410;
  id v3 = &v19;
  id v14 = v6;
  id v19 = v14;
  if (objc_msgSend(v13, "fc_containsObjectPassingTest:", v18))
  {
LABEL_6:
    double v15 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v7 options:0];
    [a1[6] setObject:v15 forKeyedSubscript:v11];

    if (v12) {
      goto LABEL_14;
    }
  }
  else if ([a1[7] containsObject:v14])
  {
    long long v16 = objc_msgSend(MEMORY[0x263EFF910], "fc_dateFromStringWithISO8601Format:", v7);
    [a1[6] setObject:v16 forKeyedSubscript:v11];
  }
  else if (v7)
  {
    id v17 = [MEMORY[0x263EFF9D0] null];

    if (v17 != v7) {
      [a1[6] setObject:v7 forKeyedSubscript:v11];
    }
  }

LABEL_14:
}

uint64_t __NTCKRecordFromJSONDictionary_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPrefix:a2];
}

void __NTNewsEdgeArticleRecordOverrideKeys_block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  id v2 = @"scoreTopicTagIDs";
  v3[0] = *MEMORY[0x263F58F40];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  id v1 = (void *)NTNewsEdgeArticleRecordOverrideKeys_result;
  NTNewsEdgeArticleRecordOverrideKeys_double result = v0;
}

void __NTNewsEdgeArticleListRecordOverrideKeys_block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  id v2 = @"articleIds";
  v3[0] = *MEMORY[0x263F58F10];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  id v1 = (void *)NTNewsEdgeArticleListRecordOverrideKeys_result;
  NTNewsEdgeArticleListRecordOverrideKeys_double result = v0;
}

void __NTNewsEdgeTagRecordOverrideKeys_block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  id v2 = @"publisherPaidDescriptionStrings";
  v3[0] = *MEMORY[0x263F58F98];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  id v1 = (void *)NTNewsEdgeTagRecordOverrideKeys_result;
  NTNewsEdgeTagRecordOverrideKeys_double result = v0;
}

void __NTNewsEdgeArticleEncodedFields_block_invoke()
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F58F38];
  v6[0] = *MEMORY[0x263F58F08];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F58EF8];
  v6[2] = *MEMORY[0x263F58F00];
  v6[3] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  id v5 = (void *)NTNewsEdgeArticleEncodedFields_result;
  NTNewsEdgeArticleEncodedFields_double result = v4;
}

void __NTNewsEdgeArticleDateFields_block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F58F28];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)NTNewsEdgeArticleDateFields_result;
  NTNewsEdgeArticleDateFields_double result = v2;
}

void __NTNewsEdgeTagEncodedFields_block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F58F90];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)NTNewsEdgeTagEncodedFields_result;
  NTNewsEdgeTagEncodedFields_double result = v2;
}

id NTHeadlineThumbnailFromFCHeadline(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTHeadlineThumbnailFromFCHeadline_cold_1();
  }
  switch(a2)
  {
    case 0:
      uint64_t v4 = [v3 thumbnailWidgetLQ];
      goto LABEL_10;
    case 1:
      uint64_t v4 = [v3 thumbnailWidget];
      goto LABEL_10;
    case 2:
      uint64_t v4 = [v3 thumbnailWidgetHQ];
      goto LABEL_10;
    case 3:
      uint64_t v4 = FCThumbnailForHeadlineMinimumSizeInPixels();
LABEL_10:
      id v5 = (void *)v4;
      break;
    default:
      id v5 = 0;
      break;
  }

  return v5;
}

id NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline_cold_1();
  }
  uint64_t v4 = [v3 sourceChannel];
  id v5 = v4;
  switch(a2)
  {
    case 2:
      goto LABEL_10;
    case 1:
      id v7 = [v4 nameImageCompactAssetHandle];

      if (v7)
      {
        uint64_t v6 = [v5 nameImageCompactAssetHandle];
        goto LABEL_11;
      }
LABEL_10:
      uint64_t v6 = [v5 nameImageMaskWidgetHQAssetHandle];
      goto LABEL_11;
    case 0:
      uint64_t v6 = [v4 nameImageMaskWidgetLQAssetHandle];
LABEL_11:
      uint64_t v8 = (void *)v6;
      goto LABEL_13;
  }
  uint64_t v8 = 0;
LABEL_13:

  return v8;
}

id NTHeadlineAdElementFromFCHeadline(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTHeadlineAdElementFromFCHeadline_cold_1();
  }
  uint64_t v2 = objc_opt_new();
  id v3 = [v1 articleID];
  [v2 setArticleID:v3];

  uint64_t v4 = [v1 primaryAudience];
  [v2 setArticleRating:v4];

  objc_msgSend(v2, "setPaidArticle:", objc_msgSend(v1, "isPaid"));
  objc_msgSend(v2, "setSponsoredArticle:", objc_msgSend(v1, "isSponsored"));
  objc_msgSend(v2, "setDraftArticle:", objc_msgSend(v1, "isDraft"));
  id v5 = [v1 sourceChannel];
  uint64_t v6 = [v5 primaryAudience];
  [v2 setChannelRating:v6];

  id v7 = [v1 sourceChannel];
  uint64_t v8 = [v7 identifier];
  [v2 setChannelID:v8];

  id v9 = [v1 iAdCategories];
  id v10 = (void *)[v9 mutableCopy];
  [v2 setArticleIAdCategories:v10];

  id v11 = [v1 iAdKeywords];
  char v12 = (void *)[v11 mutableCopy];
  [v2 setArticleIAdKeywords:v12];

  id v13 = [v1 iAdSectionIDs];
  id v14 = (void *)[v13 mutableCopy];
  [v2 setArticleIAdSectionIDs:v14];

  double v15 = [v1 sourceChannel];
  long long v16 = [v15 iAdKeywords];
  id v17 = (void *)[v16 mutableCopy];
  [v2 setChannelIAdKeywords:v17];

  id v18 = [v1 sourceChannel];
  id v19 = [v18 iAdCategories];
  id v20 = (void *)[v19 mutableCopy];
  [v2 setChannelIAdCategories:v20];

  uint64_t v21 = [v1 sourceChannel];
  objc_msgSend(v2, "setChannelContentProviderID:", objc_msgSend(v21, "contentProvider"));

  return v2;
}

id NTHeadlineAnalyticsElementFromFCHeadline(void *a1, int a2)
{
  id v3 = a1;
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTHeadlineAnalyticsElementFromFCHeadline_cold_1();
  }
  uint64_t v4 = [v3 articleID];
  uint64_t v5 = MEMORY[0x22A638180](v3);
  if (a2 == 2)
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@-%lld", v4, v5];
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    uint64_t v6 = [v4 copy];
LABEL_8:
    id v7 = (void *)v6;
    goto LABEL_10;
  }
  id v7 = 0;
LABEL_10:
  uint64_t v8 = objc_opt_new();
  [v8 setArticleID:v4];
  [v8 setArticleVersion:v5];
  [v8 setNeedsSeenStateTracking:v7 != 0];
  id v9 = [v3 sourceChannel];
  id v10 = [v9 identifier];
  [v8 setChannelID:v10];

  [v8 setPreseenCountTrackingIdentifier:v7];

  return v8;
}

id NTHeadlineBackingElementFromFCHeadline(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v1 backingArticleRecordData];
    [v2 setArticleRecordData:v3];
  }
  uint64_t v4 = [v1 sourceChannel];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [v1 sourceChannel];
    id v7 = [v6 backingTagRecordData];
    [v2 setSourceChannelRecordData:v7];
  }

  return v2;
}

NTHeadline *NTHeadlineFromFCHeadline(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  id v17 = a1;
  id v95 = a2;
  id v91 = a3;
  id v94 = a6;
  id v93 = a7;
  id v92 = a8;
  id v90 = a9;
  id v18 = a10;
  id v19 = a11;
  if (!v17 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NTHeadlineFromFCHeadline_cold_1();
  }
  id v20 = [NTHeadline alloc];
  uint64_t v21 = [v17 identifier];
  uint64_t v22 = [(NTHeadline *)v20 initWithIdentifier:v21];

  long long v23 = [v17 title];
  [(NTHeadline *)v22 setTitle:v23];

  long long v24 = [v17 titleCompact];
  [(NTHeadline *)v22 setTitleCompact:v24];

  v25 = [v17 shortExcerpt];
  [(NTHeadline *)v22 setShortExcerpt:v25];

  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = __NTHeadlineFromFCHeadline_block_invoke;
  v99[3] = &unk_26475D488;
  char v102 = 1;
  id v89 = v19;
  id v100 = v89;
  id v88 = v18;
  id v101 = v88;
  uint64_t v26 = MEMORY[0x22A638590](v99);
  id v27 = NTHeadlineThumbnailFromFCHeadline(v17, a4);
  id v28 = [v27 thumbnailAssetHandle];

  id v29 = (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v28);
  [(NTHeadline *)v22 setThumbnailRemoteURL:v29];

  v85 = v28;
  id v30 = [v28 uniqueKey];
  [(NTHeadline *)v22 setThumbnailIdentifier:v30];

  [(NTHeadline *)v22 setThumbnailSizePreset:a4];
  if (a4 == 3)
  {
    [v17 thumbnailFocalFrame];
  }
  else
  {
    double v31 = 0.0;
    double v32 = 0.0;
    double v33 = 1.0;
    double v34 = 1.0;
  }
  -[NTHeadline setThumbnailFocalFrame:](v22, "setThumbnailFocalFrame:", v31, v32, v33, v34);
  NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline(v17, a5);
  v84 = v87 = (void *)v26;
  id v35 = (*(void (**)(uint64_t))(v26 + 16))(v26);
  [(NTHeadline *)v22 setSourceNameImageRemoteURL:v35];

  __int16 v36 = [v17 sourceChannel];
  id v37 = [v36 theme];
  [v37 bannerImageScale];
  double v39 = v38;

  if (fabs(v39) >= 0.1) {
    double v40 = v39;
  }
  else {
    double v40 = 1.0;
  }
  [(NTHeadline *)v22 setSourceNameImageScale:v40];
  v41 = [v36 theme];
  v42 = [v41 bannerImageForMask];
  v43 = [v42 assetHandle];
  v44 = [v43 remoteURL];
  [(NTHeadline *)v22 setCompactSourceNameImageRemoteURL:v44];

  uint64_t v45 = [v36 name];
  v46 = (void *)v45;
  if (v45) {
    v47 = (__CFString *)v45;
  }
  else {
    v47 = &stru_26D9160F8;
  }
  [(NTHeadline *)v22 setSourceName:v47];

  v48 = [v36 nameCompact];
  [(NTHeadline *)v22 setCompactSourceName:v48];

  uint64_t v49 = [v17 sourceChannel];
  v50 = [v49 identifier];
  [(NTHeadline *)v22 setSourceTagID:v50];

  v51 = [v17 language];
  [(NTHeadline *)v22 setLanguage:v51];

  v52 = [v17 displayDate];
  if (v52)
  {
    [(NTHeadline *)v22 setAgeDisplayDate:v52];
  }
  else
  {
    v53 = [v17 publishDate];
    [(NTHeadline *)v22 setAgeDisplayDate:v53];
  }
  if (v95)
  {
    [(NTHeadline *)v22 setNewsURL:v95];
  }
  else
  {
    v54 = [v17 routeURL];
    if (v54)
    {
      [(NTHeadline *)v22 setNewsURL:v54];
    }
    else
    {
      v55 = NSURL;
      v56 = [v17 articleID];
      v57 = objc_msgSend(v55, "fc_NewsURLForArticleID:hardPaywall:", v56, 1);
      [(NTHeadline *)v22 setNewsURL:v57];
    }
  }
  v58 = [v17 storyStyle];
  v59 = [v17 storyStyle];
  v60 = [v59 label];
  [(NTHeadline *)v22 setStoryType:v60];

  v61 = objc_msgSend(v58, "foreground_color");
  v62 = [v61 hex];
  [(NTHeadline *)v22 setStoryTypeColorLight:v62];

  v63 = objc_msgSend(v58, "dark_style_foreground_color");
  v64 = [v63 hex];
  [(NTHeadline *)v22 setStoryTypeColorDark:v64];

  v65 = [v17 topicIDs];
  [(NTHeadline *)v22 setTopicIDs:v65];

  [(NTHeadline *)v22 setAnalyticsElement:v93];
  [(NTHeadline *)v22 setAdElement:v94];
  [(NTHeadline *)v22 setBackingElement:v92];
  [(NTHeadline *)v22 setSupportsSavingForLater:1];
  -[NTHeadline setHiddenFromAutoFavorites:](v22, "setHiddenFromAutoFavorites:", [v17 isHiddenFromAutoFavorites]);
  v66 = [v17 contentWithContext:v91];
  v67 = [v66 anfContent];

  v68 = [v67 anfDocumentAssetHandles];
  v69 = [v68 firstObject];
  v70 = [v69 remoteURL];
  [(NTHeadline *)v22 setFlintDocumentURL:v70];

  v71 = [v17 videoCallToActionTitle];
  [(NTHeadline *)v22 setVideoCallToActionTitle:v71];

  v72 = [v17 videoCallToActionURL];
  [(NTHeadline *)v22 setVideoCallToActionURL:v72];

  v73 = objc_opt_new();
  v74 = [v90 purchasedTagIDs];
  v75 = [v17 sourceChannelID];
  int v76 = [v74 containsObject:v75];

  v96[0] = MEMORY[0x263EF8330];
  v96[1] = 3221225472;
  v96[2] = __NTHeadlineFromFCHeadline_block_invoke_21;
  v96[3] = &unk_26475D4B0;
  int v98 = v76;
  id v97 = v73;
  id v77 = v73;
  [v17 enumerateTopicCohortsWithBlock:v96];
  v78 = [NTHeadlinePersonalizationMetadata alloc];
  v79 = [v17 articleID];
  v80 = [v17 publisherID];
  v81 = [(NTHeadlinePersonalizationMetadata *)v78 initWithArticleID:v79 publisherID:v80 scoredTopicIDs:v77];
  [(NTHeadline *)v22 setPersonalizationMetadata:v81];

  v82 = [v90 bundleSubscription];
  -[NTHeadline setIsBundlePaid:](v22, "setIsBundlePaid:", [v82 containsHeadline:v17]);

  return v22;
}

id __NTHeadlineFromFCHeadline_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 remoteURL];
  char v5 = [v3 filePath];

  if (*(unsigned char *)(a1 + 48))
  {
    if (v5)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      if (v6)
      {
        if (*(void *)(a1 + 40))
        {
          id v7 = [v6 objectForKeyedSubscript:v4];

          if (v7) {
            goto LABEL_16;
          }
          uint64_t v8 = [NSURL fileURLWithPath:v5 isDirectory:0];
          id v9 = NTAssetFileURLWithFile(v8, *(void **)(a1 + 40));
          [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v4];

          id v10 = NTSharedLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = *(void *)(a1 + 40);
            int v15 = 138412802;
            long long v16 = v4;
            __int16 v17 = 2112;
            id v18 = v5;
            __int16 v19 = 2112;
            uint64_t v20 = v11;
            _os_log_impl(&dword_22592C000, v10, OS_LOG_TYPE_INFO, "Copying asset with remoteURL: %@ and assetInternalFilePath: %@ to assetsDirectoryFileURL: %@", (uint8_t *)&v15, 0x20u);
          }

          goto LABEL_15;
        }
      }
    }
    char v12 = NTSharedLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      long long v16 = v4;
      _os_log_impl(&dword_22592C000, v12, OS_LOG_TYPE_INFO, "Failed to copy asset with remoteURL: %@, missing internalFilePath", (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v5)
  {
    id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

    if (!v13)
    {
      uint64_t v8 = [NSURL fileURLWithPath:v5 isDirectory:0];
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v4];
LABEL_15:
    }
  }
LABEL_16:

  return v4;
}

void __NTHeadlineFromFCHeadline_block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(unsigned int *)(a1 + 40);
  id v6 = a2;
  id v13 = [a3 cohortWithPreferredType:v5];
  [v13 impressions];
  double v8 = v7;
  id v9 = NSNumber;
  double v10 = 0.0;
  if (v8 != 0.0)
  {
    objc_msgSend(v13, "clicks", 0.0);
    double v10 = v11 / v8;
  }
  char v12 = [v9 numberWithDouble:v10];
  [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v6];
}

void sub_225958160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v64 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_225958B70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void NTDeleteOnDiskAssets_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetFileURLs", v6, 2u);
}

void NTPBTodaySectionConfigGenerateArticle_cold_1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"articleIDs section config articles JSON requires an articleID for every article"];
  int v1 = 136315906;
  int v2 = "NTPBTodaySectionConfigArticle *NTPBTodaySectionConfigGenerateArticle(NSDictionary<NSString *,id> *__strong, BOOL *)";
  __int16 v3 = 2080;
  int v4 = "NTPBTodaySectionConfig+NTAdditions.m";
  __int16 v5 = 1024;
  int v6 = 29;
  __int16 v7 = 2114;
  double v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void NTPBTodaySectionConfigGenerateArticles_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleDictionaries", v6, 2u);
}

void NTPBTodaySectionConfigGenerateItems_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemDictionaries", v6, 2u);
}

void NTArticleIDsRequestWithArticles_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articles");
  *(_DWORD *)buf = 136315906;
  int v2 = "NTCatchUpOperationArticleIDsRequest * _Nonnull NTArticleIDsRequestWithArticles(NSArray<NTPBTodaySectionConfigArti"
       "cle *> *__strong _Nonnull)";
  __int16 v3 = 2080;
  int v4 = "NTItemsSectionFetchDescriptor.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void NTPossiblySimulateCrashWithError_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"error", v6, 2u);
}

void NTAssetFileURL_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetsDirectoryFileURL", v6, 2u);
}

void NTAssetFileURLWithData_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetsDirectoryFileURL", v6, 2u);
}

void NTAssetFileURLWithData_cold_2()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"data", v6, 2u);
}

void NTAssetFileURLWithFile_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetsDirectoryFileURL", v6, 2u);
}

void NTAssetFileURLWithFile_cold_2()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fileURL", v6, 2u);
}

void NTSectionFeedItemsLimit_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"slotsLimit >= 0", v6, 2u);
}

void NTSectionFeedItemsLimit_cold_2()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"costInfo", v6, 2u);
}

void NTHeadlineThumbnailFromFCHeadline_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void NTHeadlineAdElementFromFCHeadline_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void NTHeadlineAnalyticsElementFromFCHeadline_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void NTHeadlineFromFCHeadline_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

uint64_t FCAppConfigurationDictionaryValue()
{
  return MEMORY[0x270F4EFC0]();
}

uint64_t FCAppConfigurationStringValue()
{
  return MEMORY[0x270F4EFC8]();
}

uint64_t FCBundle()
{
  return MEMORY[0x270F4EFD8]();
}

uint64_t FCCheckedDynamicCast()
{
  return MEMORY[0x270F4EFE8]();
}

uint64_t FCClamp()
{
  return MEMORY[0x270F4EFF0]();
}

uint64_t FCDispatchGroupWrap()
{
  return MEMORY[0x270F4F010]();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return MEMORY[0x270F4F018]();
}

uint64_t FCDynamicCast()
{
  return MEMORY[0x270F4F020]();
}

uint64_t FCFeedTransformationItemReadingHistoryArticleVersion()
{
  return MEMORY[0x270F4F028]();
}

uint64_t FCInferRelativePriorityFromQualityOfService()
{
  return MEMORY[0x270F4F038]();
}

uint64_t FCPerformIfNonNil()
{
  return MEMORY[0x270F4F048]();
}

uint64_t FCRandom()
{
  return MEMORY[0x270F4F058]();
}

uint64_t FCShouldErrorBeExcludedFromSimulatedCrashes()
{
  return MEMORY[0x270F4F060]();
}

uint64_t FCThumbnailForHeadlineMinimumSizeInPixels()
{
  return MEMORY[0x270F4F070]();
}

uint64_t FCURLForTodayDropbox()
{
  return MEMORY[0x270F4F090]();
}

uint64_t FCURLForTodayPersonalizationUpdateStore()
{
  return MEMORY[0x270F4F098]();
}

uint64_t FCURLForTodayPrivateDataTransactionQueue()
{
  return MEMORY[0x270F4F0A0]();
}

uint64_t FCXPCSuitableError()
{
  return MEMORY[0x270F4F0A8]();
}

uint64_t NDTodayFeedServiceXPCConnection()
{
  return MEMORY[0x270F4F168]();
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x270F50028]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NewsCoreSensitiveUserDefaults()
{
  return MEMORY[0x270F4F0B0]();
}

uint64_t NewsCoreUserDefaults()
{
  return MEMORY[0x270F4F0B8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}