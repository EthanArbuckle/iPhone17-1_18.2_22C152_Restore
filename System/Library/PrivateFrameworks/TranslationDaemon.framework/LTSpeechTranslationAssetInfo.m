@interface LTSpeechTranslationAssetInfo
@end

@implementation LTSpeechTranslationAssetInfo

void __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_25(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = a1 + 5;
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_25_cold_1();
    }
  }
  else
  {
    +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:*(void *)(*(void *)(a1[6] + 8) + 40) assets:*(void *)(*(void *)(a1[7] + 8) + 40) validateIfNeeded:0];
    id v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "All asset downloads for language pair %{public}@ completed successfully", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*v2 + 8) + 40));
  }
  return result;
}

void __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_cold_1(a1);
    }
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v6 + 40);
  int v7 = (id *)(v6 + 40);
  uint64_t v8 = v9;
  if (v9) {
    v10 = v8;
  }
  else {
    v10 = v4;
  }
  objc_storeStrong(v7, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_28(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v4 = _LTOSLogAssets();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_28_cold_1();
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = (void *)WeakRetained[2];
      int v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "All assets purged for language pair %{public}@ finished", (uint8_t *)&v12, 0xCu);
    }
    int v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = (void *)WeakRetained[1];
      uint64_t v9 = v7;
      v10 = [v8 assetIdentifierReferenceCountDictionary];
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Reference counts after purge %@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    }
  }
}

void __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed asset downloads for language pair %{public}@ with error: %@");
}

void __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_5_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Finished downloads; some assets downloads for language pair %{public}@ failed: %@");
}

void __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v1, v2, "error purging asset %{public}@: %@", (void)v3, DWORD2(v3));
}

void __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to finish purging assets for language pair %{public}@: %@");
}

@end