@interface LTDAnalyticsAssetSnapshotProvider
@end

@implementation LTDAnalyticsAssetSnapshotProvider

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[_LTDAssetService filterConfigAssetFromAssets:a2];
  v7 = (void *)v6;
  if (!v5 && v6) {
    goto LABEL_5;
  }
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_3((uint64_t)v5, v8);
    if (v7) {
      goto LABEL_5;
    }
  }
  else if (v7)
  {
LABEL_5:
    uint64_t v9 = [v7 assetVersion];
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", v9);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    goto LABEL_6;
  }
  v18 = _LTOSLogAssets();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_2(v18);
  }
LABEL_6:
  v13 = [v7 assetBuild];

  if (!v13)
  {
    v14 = _LTOSLogAssets();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_1(v14);
    }
  }
  uint64_t v15 = [v7 assetBuild];
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[_LTDAssetService filterConfigAssetFromAssets:a2];
  v7 = v6;
  if (v5 || !v6)
  {
    v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_3_cold_1((uint64_t)v5, v12);
    }
  }
  else
  {
    uint64_t v8 = [v6 assetVersion];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_4(void *a1)
{
  v2 = [[_LTDAnalyticsAssetSnapshot alloc] initWithAssetBuild:*(void *)(*(void *)(a1[5] + 8) + 40) expectedAssetVersion:*(void *)(*(void *)(a1[6] + 8) + 40) installedAssetVersion:*(void *)(*(void *)(a1[7] + 8) + 40)];
  (*(void (**)(void))(a1[4] + 16))();
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Failed to lookup version of MobileAsset config file", v1, 2u);
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Failed to lookup catalog asset, so can't get the expected version", v1, 2u);
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Failed to lookup catalog asset: %@", (uint8_t *)&v2, 0xCu);
}

void __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Failed to lookup installed catalog asset: %@", (uint8_t *)&v2, 0xCu);
}

@end