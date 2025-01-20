@interface LTDMAAssetService
@end

@implementation LTDMAAssetService

uint64_t __28___LTDMAAssetService__queue__block_invoke()
{
  _queue__queue_0 = (uint64_t)dispatch_queue_create("com.apple.translationd.MAAssetService", 0);
  return MEMORY[0x270F9A758]();
}

void __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:*(void *)(a1 + 32)];
  [v2 setDoNotBlockOnNetworkStatus:1];
  objc_msgSend(v2, "returnTypes:", objc_msgSend(*(id *)(a1 + 48), "_returnTypeForFilter:", *(void *)(a1 + 56)));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke_2;
  v6[3] = &unk_265546B88;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v5;
  long long v8 = v5;
  id v7 = v2;
  id v4 = v2;
  [v4 queryMetaData:v6];
}

void __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 48) _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke_3;
  block[3] = &unk_265546B60;
  uint64_t v10 = a2;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v9 = v6;
  id v8 = *(id *)(a1 + 32);
  dispatch_async(v4, block);
}

void __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 48) _errorFromQueryResult:*(void *)(a1 + 56)];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) results];
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [[_LTDMAAssetModel alloc] initWithMAAsset:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          v11 = [[_LTDAssetModel alloc] initWithProvider:v10];
          if (v11) {
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v7);
    }

    v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      uint64_t v14 = [v4 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v14;
      _os_log_impl(&dword_2600DC000, v13, OS_LOG_TYPE_INFO, "Asset query async found %zu assets", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    v2 = 0;
  }
}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F55938];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_2;
  v6[3] = &unk_265546BD8;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  [v1 startCatalogDownload:v2 options:v3 then:v6];
}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 40) _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3;
  block[3] = &unk_2655465C0;
  uint64_t v9 = a2;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v6;
  long long v8 = v6;
  dispatch_async(v4, block);
}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) _errorFromDownloadResult:*(void *)(a1 + 48)];
  uint64_t v3 = _LTOSLogAssets();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_3((uint64_t)v2, v4);
    }
    if ([v2 code] == 22)
    {
      id v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_2(v5);
      }
      if (_LTIsInternalInstall())
      {
        long long v6 = _LTOSLogAssets();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_1(v6);
        }
      }
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      long long v8 = *(void (**)(void))(v7 + 16);
LABEL_16:
      v8();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Asset catalog finished downloading", v10, 2u);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      long long v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_16;
    }
  }
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[7] _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2;
  block[3] = &unk_265546C28;
  id v9 = v3;
  id v10 = a1[4];
  id v12 = a1[6];
  id v5 = a1[5];
  id v6 = a1[7];
  id v11 = v5;
  id v13 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isStalled])
  {
    uint64_t v2 = _LTOSLogAssets();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = *(void **)(a1 + 40);
      int v14 = 138543362;
      id v15 = v3;
      _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "MobileAsset downloading asset stalled: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    id v4 = (id *)(a1 + 40);
    id v5 = [*(id *)(a1 + 40) progress];
    int v6 = objc_msgSend(v5, "updateTotalUnitCount:completedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalExpected"), objc_msgSend(*(id *)(a1 + 32), "totalWritten"));

    if (v6)
    {
      id v7 = _LTOSLogAssets();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2_cold_1((uint64_t *)(a1 + 40), v7);
      }
      uint64_t v8 = *(void *)(a1 + 56);
      if (v8)
      {
        (*(void (**)(uint64_t, id))(v8 + 16))(v8, *v4);
        id v9 = [*v4 progress];
        int v10 = [v9 isCancelled];

        if (v10)
        {
          id v11 = _LTOSLogAssets();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            id v12 = *v4;
            int v14 = 138543362;
            id v15 = v12;
            _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_INFO, "Cancelling download for %{public}@", (uint8_t *)&v14, 0xCu);
          }
          id v13 = [*(id *)(a1 + 48) maAsset];
          [v13 cancelDownloadSync];

          [*(id *)(a1 + 64) purgeAsset:*(void *)(a1 + 40) completion:0];
        }
      }
    }
  }
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_317(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) maAsset];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2_318;
  v4[3] = &unk_265546CA0;
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 startDownload:v3 then:v4];
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2_318(id *a1, uint64_t a2)
{
  id v4 = [a1[7] _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3;
  block[3] = &unk_265546C78;
  id v9 = a1[7];
  uint64_t v10 = a2;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  dispatch_async(v4, block);
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 56) _errorFromDownloadResult:*(void *)(a1 + 64)];
  if (v2)
  {
    uint64_t v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3_cold_2(a1);
    }
    id v4 = [*(id *)(a1 + 32) progress];
    [v4 cancel];

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
LABEL_15:
      v6();
    }
  }
  else
  {
    id v7 = (void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 32) progress];
    char v9 = [v8 isFinished];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3_cold_1((uint64_t *)(a1 + 32), v10);
      }
      id v11 = [*(id *)(a1 + 32) progress];
      [v11 setOfflineState:2];

      uint64_t v12 = *(void *)(a1 + 48);
      if (v12) {
        (*(void (**)(uint64_t, void))(v12 + 16))(v12, *v7);
      }
    }
    id v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *v7;
      int v16 = 138543362;
      uint64_t v17 = v14;
      _os_log_impl(&dword_2600DC000, v13, OS_LOG_TYPE_INFO, "MobileAsset completed downloading asset %{public}@", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15)
    {
      id v6 = *(void (**)(void))(v15 + 16);
      goto LABEL_15;
    }
  }
}

void __44___LTDMAAssetService_purgeAsset_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[_LTDMAAssetModel modelFromAsset:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 maAsset];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44___LTDMAAssetService_purgeAsset_completion___block_invoke_2;
  v4[3] = &unk_265546CF0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 purge:v4];
}

void __44___LTDMAAssetService_purgeAsset_completion___block_invoke_2(id *a1, uint64_t a2)
{
  id v4 = [a1[6] _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44___LTDMAAssetService_purgeAsset_completion___block_invoke_3;
  block[3] = &unk_2655463D0;
  uint64_t v8 = a2;
  id v6 = a1[4];
  id v7 = a1[5];
  dispatch_async(v4, block);
}

void __44___LTDMAAssetService_purgeAsset_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 3 || v2 == 0)
  {
    id v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v5;
      _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "MobileAsset finished purging asset %{public}@", buf, 0xCu);
    }
    id v6 = [*(id *)(a1 + 32) progress];
    [v6 setOfflineState:0];

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, *(void *)(a1 + 32), 0);
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Failed asset purge: %zd", v2);
    char v9 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 20, v8, 0);
    uint64_t v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __44___LTDMAAssetService_purgeAsset_completion___block_invoke_3_cold_1(a1);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v9);
    }
  }
}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Internal installs must be on the internal network to access staging assets", v1, 2u);
}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Asset catalog endpoint is not reachable from the current network", v1, 2u);
}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Error when downloading asset catalog: %@", (uint8_t *)&v2, 0xCu);
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "MobileAsset download asset progressed: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "MobileAsset forcing progress update for asset %{public}@", (uint8_t *)&v3, 0xCu);
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v1, v2, "MobileAsset failed to download asset %{public}@: %@", (void)v3, DWORD2(v3));
}

void __44___LTDMAAssetService_purgeAsset_completion___block_invoke_3_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v1, v2, "MobileAsset failed to purge asset %{public}@: %@", (void)v3, DWORD2(v3));
}

@end