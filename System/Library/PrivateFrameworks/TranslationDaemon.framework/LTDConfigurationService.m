@interface LTDConfigurationService
@end

@implementation LTDConfigurationService

uint64_t __33___LTDConfigurationService_cache__block_invoke()
{
  cache_cache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

uint64_t __34___LTDConfigurationService__queue__block_invoke()
{
  _queue__queue = (uint64_t)dispatch_queue_create("com.apple.translationd.ConfigurationService", 0);
  return MEMORY[0x270F9A758]();
}

void __60___LTDConfigurationService_configurationForType_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v6 = 0;
  v4 = [v2 configurationForType:v3 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[4] + 16))();
}

void __55___LTDConfigurationService_configurationForType_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __55___LTDConfigurationService_configurationForType_error___block_invoke_cold_1();
      if (!a2) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  if (a2)
  {
LABEL_4:
    v7 = [*(id *)(a1 + 32) cache];
    [v7 removeAllObjects];
  }
LABEL_5:
}

void __59___LTDConfigurationService_asrConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v6 = 0;
  uint64_t v3 = [v2 asrConfigurationWithError:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

void __63___LTDConfigurationService_offlineConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v6 = 0;
  uint64_t v3 = [v2 offlineConfigurationWithError:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

void __60___LTDConfigurationService_siriConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v6 = 0;
  uint64_t v3 = [v2 siriConfigurationWithError:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

void __69___LTDConfigurationService_textStreamingConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v6 = 0;
  uint64_t v3 = [v2 textStreamingConfigurationWithError:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

void __61___LTDConfigurationService_assetConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v6 = 0;
  uint64_t v3 = [v2 assetConfigurationWithError:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

void __59___LTDConfigurationService_aneConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v6 = 0;
  uint64_t v3 = [v2 aneConfigurationWithError:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

uint64_t __62___LTDConfigurationService_supportedLocalePairsForTask_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F1C0F8] pairWithIdentifiers:a2];
}

void __67___LTDConfigurationService_supportedLocalePairsForTask_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v7 = 0;
  id v4 = [v2 supportedLocalePairsForTask:v3 error:&v7];
  id v5 = v7;
  uint64_t v6 = a1[4];
  if (v6) {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v4, v5);
  }
}

void __55___LTDConfigurationService_configurationForType_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to refresh asset catalog %@", v2, v3, v4, v5, v6);
}

@end