void sub_25E379FC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25E37A7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(location);
  _Block_object_dispose(&a72, 8);
  objc_destroyWeak((id *)&STACK[0x228]);
  _Unwind_Resume(a1);
}

id localeIdentifierForLocale(void *a1)
{
  if (!a1)
  {
    v8 = 0;
    goto LABEL_14;
  }
  id v1 = a1;
  v2 = [v1 countryCode];
  v3 = getValidRegions();
  v4 = v3;
  if (!v2 || ([v3 containsObject:v2] & 1) == 0)
  {

    v2 = @"US";
  }
  v5 = [v1 languageCode];
  v6 = [v1 scriptCode];

  if (v5 && v6)
  {
    uint64_t v7 = [[NSString alloc] initWithFormat:@"%@-%@_%@", v5, v6, v2];
  }
  else
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_13;
    }
    uint64_t v7 = [[NSString alloc] initWithFormat:@"%@_%@", v5, v2, v10];
  }
  v8 = (void *)v7;
LABEL_13:

LABEL_14:
  return v8;
}

id normalizedLocaleForIdentifier(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v1];
  }
  else
  {
    v2 = [MEMORY[0x263EFF960] currentLocale];
  }
  v3 = v2;
  if (!v2)
  {
    v11 = 0;
    goto LABEL_17;
  }
  v4 = [v2 countryCode];
  v5 = getValidRegions();
  v6 = v5;
  if (!v4 || ([v5 containsObject:v4] & 1) == 0)
  {

    v4 = @"US";
  }
  uint64_t v7 = [v3 languageCode];
  uint64_t v8 = [v3 scriptCode];
  v9 = (void *)v8;
  if (v7 && v8)
  {
    uint64_t v10 = [[NSString alloc] initWithFormat:@"%@-%@_%@", v7, v8, v4];
  }
  else
  {
    if (!v7)
    {
      v11 = 0;
      goto LABEL_16;
    }
    uint64_t v10 = [[NSString alloc] initWithFormat:@"%@_%@", v7, v4, v14];
  }
  v12 = (void *)v10;
  v11 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v10];

LABEL_16:
LABEL_17:

  return v11;
}

id getValidRegions()
{
  if (getValidRegions_onceToken != -1) {
    dispatch_once(&getValidRegions_onceToken, &__block_literal_global_59);
  }
  v0 = (void *)getValidRegions_gRegions;
  return v0;
}

id languageCodeForLocale(void *a1)
{
  id v1 = a1;
  v2 = [v1 languageCode];
  v3 = [v1 scriptCode];
  if ([v2 isEqualToString:@"zh"])
  {
    uint64_t v4 = [v1 countryCode];
    v5 = (void *)v4;
    if (v3)
    {
      [NSString stringWithFormat:@"%@_%@", v2, v3];
    }
    else if (v4 && [&unk_270B1D628 containsObject:v4])
    {
      [NSString stringWithFormat:@"%@_Hant", v2, v9];
    }
    else
    {
      [NSString stringWithFormat:@"%@_Hans", v2, v9];
    }
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v2;
  }
  id v7 = v6;

  return v7;
}

void sub_25E37D24C(_Unwind_Exception *a1)
{
}

void sub_25E37D450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E37D56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SRLogCategoryGeneral()
{
  if (SRLogCategoryGeneral_onceToken != -1) {
    dispatch_once(&SRLogCategoryGeneral_onceToken, &__block_literal_global);
  }
  v0 = (void *)SRLogCategoryGeneral_generalLog;
  return v0;
}

void sub_25E37E644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E37E86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SRIsAppleInternalInstall()
{
  if (SRIsAppleInternalInstall_onceToken != -1) {
    dispatch_once(&SRIsAppleInternalInstall_onceToken, &__block_literal_global_2);
  }
  return SRIsAppleInternalInstall_isInternalInstall;
}

void sub_25E37EC10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SRLogCategoryLifeCycle()
{
  if (SRLogCategoryLifeCycle_onceToken != -1) {
    dispatch_once(&SRLogCategoryLifeCycle_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)SRLogCategoryLifeCycle_lifecycleLog;
  return v0;
}

uint64_t __SRLogCategoryGeneral_block_invoke()
{
  SRLogCategoryGeneral_generalLog = (uint64_t)os_log_create("com.apple.spotlight.resources", "General");
  return MEMORY[0x270F9A758]();
}

uint64_t __SRLogCategoryLifeCycle_block_invoke()
{
  SRLogCategoryLifeCycle_lifecycleLog = (uint64_t)os_log_create("com.apple.spotlight.resources", "LifeCycle");
  return MEMORY[0x270F9A758]();
}

id SRLogCategorySafety()
{
  if (SRLogCategorySafety_onceToken != -1) {
    dispatch_once(&SRLogCategorySafety_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)SRLogCategorySafety_safetyLog;
  return v0;
}

uint64_t __SRLogCategorySafety_block_invoke()
{
  SRLogCategorySafety_safetyLog = (uint64_t)os_log_create("com.apple.spotlight.resources", "Safety");
  return MEMORY[0x270F9A758]();
}

uint64_t trialFlagsForProcess()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (trialFlagsForProcess_onceToken != -1) {
    dispatch_once(&trialFlagsForProcess_onceToken, &__block_literal_global_0);
  }
  v0 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v2[0] = 67109120;
    v2[1] = trialFlagsForProcess_sTrialFlagsForProcess;
    _os_log_impl(&dword_25E378000, v0, OS_LOG_TYPE_INFO, "Process has trial access flags 0x%x", (uint8_t *)v2, 8u);
  }

  return trialFlagsForProcess_sTrialFlagsForProcess;
}

void __trialFlagsForProcess_block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v0 bundleIdentifier];

  id v1 = [MEMORY[0x263F08AB0] processInfo];
  v2 = [v1 processName];

  if ([v4 isEqualToString:@"com.apple.Search.framework"]
    && ([v2 isEqualToString:@"searchd"] & 1) != 0)
  {
    int v3 = 7;
LABEL_11:
    trialFlagsForProcess_sTrialFlagsForProcess = v3;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"com.apple.Spotlight"]) {
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"com.apple.CoreSpotlight.framework"]
    && ([v2 isEqualToString:@"spotlightknowledged"] & 1) != 0)
  {
    int v3 = 2;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"com.apple.mobilemail"])
  {
    int v3 = 4;
    goto LABEL_11;
  }
  if (([v4 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v4 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0
    || [v4 hasPrefix:@"com.apple.ondeviceeval"])
  {
LABEL_5:
    int v3 = 1;
    goto LABEL_11;
  }
LABEL_12:
}

void sub_25E37FD18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_25E384E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void __SRIsAppleInternalInstall_block_invoke()
{
  id v1 = (id)MGCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v0 = [v1 isEqualToString:@"Internal"];
  }
  else {
    char v0 = 0;
  }
  SRIsAppleInternalInstall_isInternalInstall = v0;
}

id getMobileAssetPropertiesFromPath(uint64_t a1)
{
  id v1 = [NSString stringWithFormat:@"%@/Info.plist", a1];
  v2 = [NSURL fileURLWithPath:v1 isDirectory:0];
  int v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = [v2 path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    uint64_t v10 = 0;
    id v6 = [NSDictionary dictionaryWithContentsOfURL:v2 error:&v10];
    id v7 = v6;
    uint64_t v8 = 0;
    if (!v10)
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:@"MobileAssetProperties"];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __getValidRegions_block_invoke()
{
  char v0 = (void *)getValidRegions_gRegions;
  getValidRegions_gRegions = (uint64_t)&unk_270B1D640;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x430], 8) = a1;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x430], 8) = a1;
}

id loadAssetsFromResourcePath(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v25 = a2;
  v27 = v3;
  uint64_t v4 = getMobileAssetPropertiesFromPath((uint64_t)v3);
  int v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"AssetLocale"],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v7 = (void *)v6,
        [v5 objectForKeyedSubscript:@"Contents"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v23 = v5;
    id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v5 objectForKeyedSubscript:@"Contents"];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v14 = [v13 objectForKeyedSubscript:@"ContentType"];
          v15 = [v13 objectForKeyedSubscript:@"ContentPath"];
          v16 = [v13 objectForKeyedSubscript:@"Locale"];
          v17 = [NSString stringWithFormat:@"%@/AssetData/%@", v27, v15];
          v18 = [MEMORY[0x263F08850] defaultManager];
          uint64_t v28 = 0;
          v19 = [v18 contentsOfDirectoryAtPath:v17 error:&v28];
          uint64_t v20 = v28;

          if (!v20)
          {
            v21 = +[SRAsset assetWithLocaleIdentifier:contentType:deliveryType:resourceRoot:pathNames:](SRAsset, "assetWithLocaleIdentifier:contentType:deliveryType:resourceRoot:pathNames:", v16, v14, +[SRAsset deliveryTypeFromString:v25], v17, v19);
            if (v21) {
              [v24 addObject:v21];
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v10);
    }

    int v5 = v23;
  }
  else
  {
    id v24 = (id)MEMORY[0x263EFFA68];
  }

  return v24;
}

void sub_25E38A628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_25E38C0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E38C238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E38C648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E38C888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E38D18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E38D85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

id assetQueryForLocale(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [v5 localeIdentifier];
    int v15 = 138412802;
    v16 = v14;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl(&dword_25E378000, v8, OS_LOG_TYPE_DEBUG, "(assetQuery) %@, %@, %@", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v9 = [MEMORY[0x263F393F0] attributeFilter];
  uint64_t v10 = languageCodeForLocale(v5);
  [v9 addAllowedValue:v10 forKey:*MEMORY[0x263F393D0]];
  int v11 = [v6 isEqualToString:@"com.apple.MobileAsset.SpotlightResources"];
  if (v7 && v11) {
    [v9 addAllowedValue:v7 forKey:@"SRDeliveryType"];
  }
  v12 = (void *)[objc_alloc(MEMORY[0x263F393E8]) initWithAssetType:v6 filter:v9];

  return v12;
}

void sub_25E390388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E390750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E391028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_25E391244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E391594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MDPlistContainerCopyRootObject()
{
  return MEMORY[0x270F4A738]();
}

uint64_t _MDPlistContainerCreateWithBytes()
{
  return MEMORY[0x270F4A748]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}