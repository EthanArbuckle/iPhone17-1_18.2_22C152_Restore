@interface _LTDMAAssetService
+ (BOOL)isInvalidPallasCatalog:(id)a3;
+ (id)_errorFromDownloadResult:(int64_t)a3;
+ (id)_errorFromQueryResult:(int64_t)a3;
+ (id)_queue;
+ (id)maDownloadOptionsFrom:(unint64_t)a3;
+ (id)queryAssetType:(id)a3 filter:(unint64_t)a4 error:(id *)a5;
+ (int64_t)_returnTypeForFilter:(unint64_t)a3;
+ (void)downloadAsset:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6;
+ (void)downloadCatalogForAssetType:(id)a3 completion:(id)a4;
+ (void)purgeAsset:(id)a3 completion:(id)a4;
+ (void)queryAssetType:(id)a3 filter:(unint64_t)a4 completion:(id)a5;
@end

@implementation _LTDMAAssetService

+ (id)_queue
{
  if (_queue_onceToken_0 != -1) {
    dispatch_once(&_queue_onceToken_0, &__block_literal_global_12);
  }
  v2 = (void *)_queue__queue_0;
  return v2;
}

+ (BOOL)isInvalidPallasCatalog:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    v4 = [v3 firstObject];
    BOOL v5 = [v4 assetType] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)_errorFromQueryResult:(int64_t)a3
{
  id v3 = 0;
  v10[1] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
    case 14:
      goto LABEL_8;
    case 1:
    case 4:
    case 11:
      id v3 = @"Mobile asset query failed due to XPC error";
      uint64_t v4 = 13;
      goto LABEL_7;
    case 2:
      id v3 = @"Mobile asset query failed due to catalog not downloaded";
      uint64_t v4 = 14;
      goto LABEL_7;
    case 3:
    case 5:
    case 6:
    case 7:
    case 9:
    case 12:
      id v3 = @"Mobile asset query failed due to query error";
      uint64_t v4 = 21;
      goto LABEL_7;
    case 8:
    case 10:
    case 13:
      id v3 = @"Mobile asset query failed due to encode error";
      uint64_t v4 = 4;
      goto LABEL_7;
    default:
      uint64_t v4 = 0;
LABEL_7:
      BOOL v5 = [NSString stringWithFormat:@"MAQueryResult %zd: %@", a3, v3];
      v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F08320];
      v10[0] = v5;
      v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
      id v3 = [v6 errorWithDomain:@"LTTranslationDaemonErrorDomain" code:v4 userInfo:v7];

LABEL_8:
      return v3;
  }
}

+ (int64_t)_returnTypeForFilter:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return qword_26027B650[a3];
  }
}

+ (void)queryAssetType:(id)a3 filter:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke;
  v13[3] = &unk_265546BB0;
  id v16 = a1;
  unint64_t v17 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

+ (id)queryAssetType:(id)a3 filter:(unint64_t)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:v8];
  [v9 setDoNotBlockOnNetworkStatus:1];
  objc_msgSend(v9, "returnTypes:", objc_msgSend(a1, "_returnTypeForFilter:", a4));
  v10 = objc_msgSend(a1, "_errorFromQueryResult:", objc_msgSend(v9, "queryMetaDataSync"));
  id v11 = v10;
  if (v10)
  {
    id v12 = 0;
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    v13 = [v9 results];
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v13, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[_LTDMAAssetModel alloc] initWithMAAsset:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          v20 = [[_LTDAssetModel alloc] initWithProvider:v19];
          if (v20) {
            [v12 addObject:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v16);
    }

    v21 = _LTOSLogAssets();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      uint64_t v23 = [v12 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v23;
      _os_log_impl(&dword_2600DC000, v22, OS_LOG_TYPE_INFO, "Asset query sync found %zu assets", buf, 0xCu);
    }
    id v11 = 0;
  }

  return v12;
}

+ (id)_errorFromDownloadResult:(int64_t)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  if (a3 > 47)
  {
    if ((unint64_t)(a3 - 59) < 3)
    {
      uint64_t v4 = @"Mobile asset failed to reach asset host";
      uint64_t v5 = 22;
LABEL_17:
      id v8 = [NSString stringWithFormat:@"MAQueryResult %zd: %@", a3, v4];
      id v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F08320];
      v13[0] = v8;
      v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v6 = [v9 errorWithDomain:@"LTTranslationDaemonErrorDomain" code:v5 userInfo:v10];

      goto LABEL_18;
    }
    if (a3 == 48)
    {
      uint64_t v4 = @"Mobile asset install cancelled";
      uint64_t v5 = 17;
      goto LABEL_17;
    }
    if (a3 == 53)
    {
      uint64_t v4 = @"Mobile asset timed out during download";
      uint64_t v5 = 11;
      goto LABEL_17;
    }
LABEL_16:
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v7 localizedStringForKey:@"MOBILE_ASSET_DOWNLOAD_FAILURE_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];

    uint64_t v5 = 0;
    goto LABEL_17;
  }
  if (a3 > 11)
  {
    if (a3 == 12)
    {
      uint64_t v4 = @"Mobile asset failed to download due to missing entitlement";
      uint64_t v5 = 5;
      goto LABEL_17;
    }
    if (a3 == 44)
    {
      uint64_t v4 = @"Mobile asset failed to download since not found";
      uint64_t v5 = 7;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v6 = 0;
  if (a3 && a3 != 10) {
    goto LABEL_16;
  }
LABEL_18:
  return v6;
}

+ (id)maDownloadOptionsFrom:(unint64_t)a3
{
  uint64_t v4 = objc_opt_new();
  [v4 setAllowsCellularAccess:a3 & 1];
  [v4 setDiscretionary:(a3 & 2) == 0];
  [v4 setRequiresPowerPluggedIn:(a3 >> 2) & 1];
  return v4;
}

+ (void)downloadCatalogForAssetType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  [v8 setDiscretionary:0];
  [v8 setRequiresPowerPluggedIn:0];
  [v8 setAllowsCellularAccess:0];
  id v9 = [a1 _queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke;
  v13[3] = &unk_265546C00;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v17 = a1;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v9, v13);
}

+ (void)downloadAsset:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  v13 = [a1 maDownloadOptionsFrom:a4];
  id v14 = _LTOSLogAssets();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v10;
    _os_log_impl(&dword_2600DC000, v14, OS_LOG_TYPE_INFO, "Requested MobileAsset download of asset %{public}@", buf, 0xCu);
  }
  if ([v10 isTTSModel])
  {
    id v15 = [NSString stringWithFormat:@"MA asset service unsupported asset type"];
    id v16 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 16, v15, 0);
    id v17 = _LTOSLogAssets();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[_LTDMAAssetService downloadAsset:options:progress:completion:]((uint64_t)v10);
    }
    v12[2](v12, v16);
  }
  else
  {
    v18 = [v10 progress];
    [v18 setOfflineState:1];

    v19 = +[_LTDMAAssetModel modelFromAsset:v10];
    v20 = [v19 maAsset];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke;
    v32[3] = &unk_265546C50;
    id v36 = a1;
    id v21 = v10;
    id v33 = v21;
    id v22 = v11;
    id v35 = v22;
    id v23 = v19;
    id v34 = v23;
    [v20 attachProgressCallBack:v32];

    v24 = [a1 _queue];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_317;
    v25[3] = &unk_265546CC8;
    id v26 = v23;
    id v27 = v13;
    id v31 = a1;
    id v28 = v21;
    v29 = v12;
    id v30 = v22;
    id v15 = v23;
    dispatch_async(v24, v25);

    id v16 = v33;
  }
}

+ (void)purgeAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44___LTDMAAssetService_purgeAsset_completion___block_invoke;
  block[3] = &unk_2655463D0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

+ (void)downloadAsset:(uint64_t)a1 options:progress:completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v1, v2, "MobileAsset failed to download asset %{public}@: %@", (void)v3, DWORD2(v3));
}

@end