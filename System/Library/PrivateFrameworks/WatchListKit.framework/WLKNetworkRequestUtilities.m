@interface WLKNetworkRequestUtilities
+ (BOOL)isGDPRAccepted;
+ (id)_defaultAppSessionConfiguration;
+ (id)_prepareEncoder:(id)a3 account:(id)a4 sessionConfiguration:(id)a5 options:(int64_t)a6 error:(id *)a7;
+ (id)_sharedCacheSessionConfiguration;
+ (id)configurationBaseURLString;
+ (id)defaultSessionConfiguration;
+ (void)startNetworkRequest:(id)a3 account:(id)a4 sessionConfiguration:(id)a5 options:(int64_t)a6 activity:(id)a7 completion:(id)a8;
+ (void)startNetworkRequest:(id)a3 account:(id)a4 sessionConfiguration:(id)a5 options:(int64_t)a6 completion:(id)a7;
@end

@implementation WLKNetworkRequestUtilities

+ (BOOL)isGDPRAccepted
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F4DBA8] acknowledgementNeededForPrivacyIdentifier:@"com.apple.onboarding.tvapp"];
  v3 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - is GDPR needed? [%d]", (uint8_t *)v5, 8u);
  }

  return v2 ^ 1;
}

void __61__WLKNetworkRequestUtilities__defaultAppSessionConfiguration__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  v1 = (void *)_defaultAppSessionConfiguration___appSessionConfiguration;
  _defaultAppSessionConfiguration___appSessionConfiguration = v0;

  [(id)_defaultAppSessionConfiguration___appSessionConfiguration setHTTPShouldUsePipelining:1];
  int v2 = (void *)[objc_alloc(MEMORY[0x1E4F18D78]) initWithMemoryCapacity:0x100000 diskCapacity:52428800 diskPath:0];
  v3 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134218240;
    uint64_t v5 = [v2 memoryCapacity];
    __int16 v6 = 2048;
    uint64_t v7 = [v2 diskCapacity];
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - Using TV App custom URL cache: mem capacity %lu disk capacity %lu", (uint8_t *)&v4, 0x16u);
  }

  [(id)_defaultAppSessionConfiguration___appSessionConfiguration setURLCache:v2];
}

+ (id)defaultSessionConfiguration
{
  if (WLKIsTVApp()) {
    [a1 _defaultAppSessionConfiguration];
  }
  else {
  v3 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  }

  return v3;
}

+ (id)_defaultAppSessionConfiguration
{
  if (_defaultAppSessionConfiguration_onceToken != -1) {
    dispatch_once(&_defaultAppSessionConfiguration_onceToken, &__block_literal_global_3);
  }
  int v2 = (void *)_defaultAppSessionConfiguration___appSessionConfiguration;

  return v2;
}

+ (id)_prepareEncoder:(id)a3 account:(id)a4 sessionConfiguration:(id)a5 options:(int64_t)a6 error:(id *)a7
{
  int v8 = a6;
  id v10 = a3;
  id v11 = a4;
  v12 = [MEMORY[0x1E4F1C9C8] date];
  id v13 = objc_alloc(MEMORY[0x1E4F4DE68]);
  v14 = objc_msgSend(MEMORY[0x1E4F4DBD8], "wlk_defaultBag");
  v15 = (void *)[v13 initWithBag:v14];

  if (v8) {
    [v15 setDialogOptions:1];
  }
  if ((v8 & 4) == 0) {
    goto LABEL_6;
  }
  v16 = (void *)[v10 mutableCopy];
  if (+[WLKMescal signNetworkRequest:v16 error:a7])
  {

    id v10 = v16;
LABEL_6:
    [v15 setIncludeClientVersions:0];
    if (+[WLKNetworkRequestUtilities isGDPRAccepted]
      || (*(void *)&v8 & 0x200000) != 0)
    {
      if (v11)
      {
        id v17 = v11;
      }
      else
      {
        v20 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
        objc_msgSend(v20, "ams_activeiTunesAccount");
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      [v15 setAccount:v17];
    }
    id v19 = v15;
    goto LABEL_18;
  }
  if (a7)
  {
    v18 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[WLKNetworkRequestUtilities _prepareEncoder:account:sessionConfiguration:options:error:]((uint64_t *)a7, v18);
    }
  }
  id v19 = 0;
LABEL_18:

  return v19;
}

+ (void)startNetworkRequest:(id)a3 account:(id)a4 sessionConfiguration:(id)a5 options:(int64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = (void (**)(id, void, id))a7;
  v14 = (void *)MEMORY[0x1E4F1C9C8];
  id v15 = a4;
  v16 = [v14 date];
  id v38 = 0;
  id v17 = +[WLKNetworkRequestUtilities _prepareEncoder:v11 account:v15 sessionConfiguration:v12 options:a6 error:&v38];

  id v18 = v38;
  if (!v17) {
    v13[2](v13, 0, v18);
  }
  id v19 = [v17 requestByEncodingRequest:v11 parameters:0];
  id v37 = 0;
  v20 = [v19 resultWithError:&v37];
  id v21 = v37;
  if (v20)
  {
    id v30 = v18;
    v31 = v16;
    v22 = +[WLKLaunchConfiguration sharedInstance];
    int v23 = [v22 useSharedURLSession];

    if (v23)
    {
      v24 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA2E8000, v24, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - Request uses shared urlSession", buf, 2u);
      }

      v25 = +[WLKURLSessionManager sharedInstance];
      v26 = [v25 urlSession];
    }
    else
    {
      if (v12)
      {
        id v27 = v12;
      }
      else
      {
        id v27 = +[WLKNetworkRequestUtilities defaultSessionConfiguration];
      }
      v25 = v27;
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F4DE88]) initWithConfiguration:v27];
      v28 = objc_alloc_init(WLKURLResponseDecoder);
      [v26 setResponseDecoder:v28];
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __98__WLKNetworkRequestUtilities_startNetworkRequest_account_sessionConfiguration_options_completion___block_invoke;
    v32[3] = &unk_1E620A298;
    v16 = v31;
    id v33 = v31;
    id v34 = v20;
    v35 = v13;
    v29 = [v26 dataTaskWithRequest:v34 completionHandler:v32];
    [v29 resume];

    id v18 = v30;
  }
  else
  {
    v13[2](v13, 0, v21);
  }
}

void __98__WLKNetworkRequestUtilities_startNetworkRequest_account_sessionConfiguration_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v9 = v8;

  if (v6)
  {
    id v10 = [v6 description];
  }
  else
  {
    id v10 = &stru_1F13BCF18;
  }
  id v11 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v5 responseStatusCode];
    id v13 = [v5 logUUID];
    v14 = [*(id *)(a1 + 40) HTTPMethod];
    id v15 = [*(id *)(a1 + 40) URL];
    v16 = [v15 relativePath];
    int v17 = 134219266;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    v22 = v13;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - Request status: %lu elapsed time: %.5f id: %@ url: %@ %@ %@", (uint8_t *)&v17, 0x3Eu);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)startNetworkRequest:(id)a3 account:(id)a4 sessionConfiguration:(id)a5 options:(int64_t)a6 activity:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v34 = a7;
  v16 = (void (**)(id, void, id))a8;
  int v17 = [MEMORY[0x1E4F1C9C8] date];
  v43[0] = 0;
  uint64_t v18 = +[WLKNetworkRequestUtilities _prepareEncoder:v13 account:v14 sessionConfiguration:v15 options:a6 error:v43];
  id v19 = v43[0];
  if (!v18) {
    v16[2](v16, 0, v19);
  }
  uint64_t v20 = [v18 requestByEncodingRequest:v13 parameters:0];
  id v42 = 0;
  __int16 v21 = [v20 resultWithError:&v42];
  id v22 = v42;
  if (v21)
  {
    id v30 = v22;
    id v31 = v19;
    id v32 = v14;
    id v33 = v17;
    if (v15)
    {
      id v23 = v15;
    }
    else
    {
      id v23 = +[WLKNetworkRequestUtilities defaultSessionConfiguration];
    }
    uint64_t v29 = v23;
    __int16 v25 = (void *)[objc_alloc(MEMORY[0x1E4F4DE88]) initWithConfiguration:v23];
    v26 = objc_alloc_init(WLKURLResponseDecoder);
    [v25 setResponseDecoder:v26];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__0;
    v40[4] = __Block_byref_object_dispose__0;
    id v41 = 0;
    id v41 = v34;
    __int16 v27 = [v41 activity];
    v28 = [v25 dataTaskPromiseWithRequest:v21 activity:v27];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __107__WLKNetworkRequestUtilities_startNetworkRequest_account_sessionConfiguration_options_activity_completion___block_invoke;
    v35[3] = &unk_1E620A2C0;
    id v36 = v33;
    id v37 = v21;
    v39 = v40;
    id v38 = v16;
    [v28 addFinishBlock:v35];

    _Block_object_dispose(v40, 8);
    id v14 = v32;
    int v17 = v33;
    v24 = v30;
    id v19 = v31;
  }
  else
  {
    v24 = v22;
    v16[2](v16, 0, v22);
  }
}

void __107__WLKNetworkRequestUtilities_startNetworkRequest_account_sessionConfiguration_options_activity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v9 = v8;

  if (v6)
  {
    id v10 = [v6 description];
  }
  else
  {
    id v10 = &stru_1F13BCF18;
  }
  id v11 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v5 responseStatusCode];
    id v13 = [v5 logUUID];
    id v14 = [*(id *)(a1 + 40) HTTPMethod];
    id v15 = [*(id *)(a1 + 40) URL];
    v16 = [v15 relativePath];
    int v17 = 134219266;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - Request status: %lu elapsed time: %.5f id: %@ url: %@ %@ %@", (uint8_t *)&v17, 0x3Eu);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) finish:v6];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)configurationBaseURLString
{
  return (id)+[WLKConfigurationRequest _configURLString];
}

+ (id)_sharedCacheSessionConfiguration
{
  if (_sharedCacheSessionConfiguration_onceToken != -1) {
    dispatch_once(&_sharedCacheSessionConfiguration_onceToken, &__block_literal_global_22);
  }
  int v2 = (void *)_sharedCacheSessionConfiguration___sessionConfiguration;

  return v2;
}

void __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke()
{
  v16[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  v1 = (void *)_sharedCacheSessionConfiguration___sessionConfiguration;
  _sharedCacheSessionConfiguration___sessionConfiguration = v0;

  int v2 = NSString;
  v16[0] = CPSharedResourcesDirectory();
  v16[1] = @"Library";
  v16[2] = @"Caches";
  v16[3] = @"sharedCaches";
  v16[4] = @"com.apple.WatchListKit.NSURLCache";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];
  int v4 = [v2 pathWithComponents:v3];

  id v5 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - Using shared cache path: %@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v6 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v8 = [v7 isWritableFileAtPath:v4];

  if (v8)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F18F48], (const void *)*MEMORY[0x1E4F1CFD0]);
    id v10 = (const void *)_CFURLStorageSessionCreate();
    CFRelease(Mutable);
    if (v10)
    {
      id v11 = (const void *)_CFURLStorageSessionCopyCache();
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F18D78]) _initWithExistingCFURLCache:v11];
      [(id)_sharedCacheSessionConfiguration___sessionConfiguration setURLCache:v12];
      CFRelease(v10);
      CFRelease(v11);
      goto LABEL_11;
    }
  }
  else
  {
    id v13 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke_cold_2(v13);
    }
  }
  uint64_t v12 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke_cold_1(v12);
  }
LABEL_11:
}

+ (void)_prepareEncoder:(uint64_t *)a1 account:(NSObject *)a2 sessionConfiguration:options:error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BA2E8000, a2, OS_LOG_TYPE_ERROR, "WLKNetworkRequestUtilities - _prepareEncoder failed with error: %@", (uint8_t *)&v3, 0xCu);
}

void __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BA2E8000, log, OS_LOG_TYPE_ERROR, "WLKNetworkRequestUtilities - Failed to create URL Storage Session", v1, 2u);
}

void __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BA2E8000, log, OS_LOG_TYPE_ERROR, "WLKNetworkRequestUtilities - Failed to write to shared URL cache folder. Process is likely missing WLK private entitlement.", v1, 2u);
}

@end