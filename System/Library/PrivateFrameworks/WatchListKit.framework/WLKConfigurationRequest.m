@interface WLKConfigurationRequest
+ (id)_configURLString:(id *)a3;
+ (void)_fetchV3WithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 sessionConfiguration:(id)a5 queryParameters:(id)a6 completion:(id)a7;
+ (void)fetchWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 wlkCachePolicy:(unint64_t)a5 extendedCacheExpireDuration:(double)a6 sessionConfiguration:(id)a7 queryParameters:(id)a8 fileStorage:(id)a9 completion:(id)a10;
@end

@implementation WLKConfigurationRequest

void __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.DiskCacheRead", "", buf, 2u);
  }

  [v5 setFromDiskCache:1];
  uint64_t v7 = *(void *)(a1 + 64);
  if ((unint64_t)(v7 - 1) < 2) {
    goto LABEL_7;
  }
  if (v7 == 4)
  {
    if ([v5 isValidIgnoringExpiration]) {
      goto LABEL_7;
    }
  }
  else if (v7 == 5)
  {
    if ([v5 isValidWithinExtendedExpiration:*(double *)(a1 + 72)])
    {
LABEL_7:
      v8 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKConfigurationRequest - Disk cache hit", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_17;
    }
  }
  else if ([v5 isValid])
  {
    goto LABEL_7;
  }
  if (v5 && !a3)
  {
    v9 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v5 expirationDate];
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKConfigurationRequest - Disk cache is invalid. Expiration:%@", buf, 0xCu);
    }
  }
  v11 = dispatch_get_global_queue(17, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_8;
  v12[3] = &unk_1E620B918;
  uint64_t v16 = *(void *)(a1 + 80);
  long long v17 = *(_OWORD *)(a1 + 88);
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 56);
  dispatch_async(v11, v12);

LABEL_17:
}

+ (void)fetchWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 wlkCachePolicy:(unint64_t)a5 extendedCacheExpireDuration:(double)a6 sessionConfiguration:(id)a7 queryParameters:(id)a8 fileStorage:(id)a9 completion:(id)a10
{
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke;
  v36[3] = &unk_1E620B8F0;
  id v21 = v19;
  id v37 = v21;
  id v22 = v20;
  id v38 = v22;
  v23 = (void *)MEMORY[0x1BA9E94D0](v36);
  if (a4 == 1 || !v21)
  {
    [a1 _fetchV3WithOptions:a3 cachePolicy:a4 sessionConfiguration:v17 queryParameters:v18 completion:v23];
  }
  else
  {
    v24 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.DiskCacheRead", "", buf, 2u);
    }

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_7;
    v25[3] = &unk_1E620B940;
    unint64_t v30 = a5;
    double v31 = a6;
    id v28 = v22;
    id v32 = a1;
    int64_t v33 = a3;
    unint64_t v34 = a4;
    id v26 = v17;
    id v27 = v18;
    id v29 = v23;
    [v21 read:v25];
  }
}

void __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 requiredRequestKeyValuePairsDictionary];
    uint64_t v8 = [v7 count];
    BOOL v9 = v8 != 0;

    if (!v6 && v8)
    {
      v10 = WLKStartupSignpostLogObject();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.DiskCacheWrite", "", buf, 2u);
      }

      v11 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_4;
      v14[3] = &unk_1E620B8C8;
      id v15 = v5;
      id v16 = *(id *)(a1 + 40);
      [v11 write:v15 completion:v14];

      goto LABEL_11;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  v12 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v6 localizedDescription];
    *(_DWORD *)buf = 138412546;
    id v18 = v13;
    __int16 v19 = 1024;
    BOOL v20 = v9;
    _os_log_impl(&dword_1BA2E8000, v12, OS_LOG_TYPE_DEFAULT, "WLKConfigurationRequest - Not persisting config on disk. Error:%@; isResponseValid:%d",
      buf,
      0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

void __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) expirationDate];
    int v9 = 138412802;
    v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKConfigurationRequest - Wrote to disk. Exp:%@ Success:%d err:%@", (uint8_t *)&v9, 0x1Cu);
  }
  uint64_t v8 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.DiskCacheWrite", "", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 56) _fetchV3WithOptions:*(void *)(a1 + 64) cachePolicy:*(void *)(a1 + 72) sessionConfiguration:*(void *)(a1 + 32) queryParameters:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

+ (void)_fetchV3WithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 sessionConfiguration:(id)a5 queryParameters:(id)a6 completion:(id)a7
{
  id v40 = a5;
  id v12 = a6;
  id v13 = a7;
  if (!v13) {
    +[WLKConfigurationRequest _fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:]();
  }
  id v14 = (void (**)(void, void, void))v13;
  id v46 = 0;
  uint64_t v15 = [a1 _configURLString:&v46];
  id v16 = v46;
  if ([v15 length])
  {
    int64_t v37 = a3;
    id v38 = v16;
    id v17 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.RequestCreation", "", buf, 2u);
    }

    id v18 = +[WLKUserEnvironment currentEnvironment];
    id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
    BOOL v20 = [v18 _queryParametersV3];
    uint64_t v21 = (void *)[v19 initWithDictionary:v20];

    id v39 = v12;
    [v21 addEntriesFromDictionary:v12];
    id v22 = [v21 objectForKeyedSubscript:@"caller"];

    if (!v22) {
      [v21 setObject:@"wlk" forKeyedSubscript:@"caller"];
    }
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v15];
    v36 = objc_msgSend(MEMORY[0x1E4F1CB10], "wlk_sortedQueryItemsFromDictionary:", v21);
    objc_msgSend(v23, "setQueryItems:");
    id v24 = objc_alloc(MEMORY[0x1E4F18D50]);
    v25 = [v23 URL];
    id v26 = (void *)[v24 initWithURL:v25 cachePolicy:a4 timeoutInterval:10.0];

    [v18 _queryPostV3];
    v35 = uint64_t v44 = 0;
    id v27 = objc_msgSend(MEMORY[0x1E4F28D90], "dataWithJSONObject:options:error:");
    id v28 = 0;
    if (!v27)
    {
      id v29 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        +[WLKConfigurationRequest _fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:]((uint64_t)v28, v29);
      }
    }
    [v26 setHTTPMethod:@"POST"];
    [v26 setHTTPBody:v27];
    [v26 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    unint64_t v30 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.RequestCreation", "", buf, 2u);
    }

    double v31 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.NetworkRequest", "", buf, 2u);
    }

    id v32 = (void *)[v26 copy];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __107__WLKConfigurationRequest__fetchV3WithOptions_cachePolicy_sessionConfiguration_queryParameters_completion___block_invoke;
    v41[3] = &unk_1E620B968;
    id v42 = v18;
    v43 = v14;
    id v33 = v18;
    unint64_t v34 = v40;
    +[WLKNetworkRequestUtilities startNetworkRequest:v32 account:0 sessionConfiguration:v40 options:v37 completion:v41];

    id v16 = v38;
    id v12 = v39;
  }
  else
  {
    uint64_t v21 = WLKError(100, v16, @"WLKConfigurationRequest: Error: UTS init/config (v3) not available in the URL bag.");
    ((void (**)(void, void, void *))v14)[2](v14, 0, v21);
    unint64_t v34 = v40;
  }
}

void __107__WLKConfigurationRequest__fetchV3WithOptions_cachePolicy_sessionConfiguration_queryParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.NetworkRequest", "", buf, 2u);
  }

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)id v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.ResponseParse", "", v16, 2u);
    }

    int v9 = objc_alloc_init(WLKDictionaryResponseProcessor);
    [(WLKDictionaryResponseProcessor *)v9 setDictionaryKeyPath:@"data"];
    v10 = [v5 data];
    id v15 = 0;
    __int16 v11 = [(WLKDictionaryResponseProcessor *)v9 processResponseData:v10 error:&v15];
    id v6 = v15;

    id v12 = -[WLKServerConfigurationResponse initWithServerResponseDictionary:expirationDate:environmentHash:]([WLKServerConfigurationResponse alloc], "initWithServerResponseDictionary:expirationDate:environmentHash:", v11, 0, [*(id *)(a1 + 32) hash]);
    id v13 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)id v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.ResponseParse", "", v14, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)_configURLString:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  v4 = WLKBaseURLReturningError();
  id v5 = 0;
  if ([v4 length])
  {
    id v6 = kBagKeyUVSearchRoutesInitConfigPathV3;
    uint64_t v7 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)id v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.initConfigEndpointFromBag", "", v15, 2u);
    }

    uint64_t v8 = [MEMORY[0x1E4FA9C70] app];
    int v9 = [v8 cachedStringForKey:v6];

    v10 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)id v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.initConfigEndpointFromBag", "", v15, 2u);
    }

    if ([v9 length])
    {
      __int16 v11 = v9;
    }
    else
    {
      if (a3) {
        *a3 = 0;
      }
      __int16 v11 = @"uts/v3/configurations";
    }
    v17[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    id v12 = objc_msgSend(v4, "wlk_stringByAppendingPathComponents:", v13);
  }
  else
  {
    id v12 = 0;
    if (a3) {
      *a3 = v5;
    }
  }

  return v12;
}

+ (void)_fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:.cold.1()
{
}

+ (void)_fetchV3WithOptions:(uint64_t)a1 cachePolicy:(NSObject *)a2 sessionConfiguration:queryParameters:completion:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BA2E8000, a2, OS_LOG_TYPE_ERROR, "WLKConfigurationRequest - Failed to construct POST payload... continuing with empty body.%@", (uint8_t *)&v2, 0xCu);
}

@end