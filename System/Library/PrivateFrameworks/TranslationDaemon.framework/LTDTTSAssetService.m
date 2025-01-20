@interface LTDTTSAssetService
@end

@implementation LTDTTSAssetService

uint64_t __29___LTDTTSAssetService__queue__block_invoke()
{
  _queue__queue_1 = (uint64_t)dispatch_queue_create("com.apple.translationd.TTSAssetService", 0);
  return MEMORY[0x270F9A758]();
}

uint64_t __51___LTDTTSAssetService_ttsAssetForLocaleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(a1 + 32)];
}

void __43___LTDTTSAssetService_setSubscribedVoices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43___LTDTTSAssetService_setSubscribedVoices___block_invoke_cold_1();
    }
    [*(id *)(a1 + 32) setSiriTTSSession:0];
  }
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)(a1 + 32);
  if ([*(id *)(a1 + 32) isTTSModel])
  {
    id v3 = +[_LTDTTSAssetModel modelFromAsset:*v2];
    v4 = [v3 ttsAsset];
    id v5 = v4;
    if (v4)
    {
      if (([v4 locallyAvailable] & 1) == 0 && !objc_msgSend(v5, "downloading"))
      {
        BOOL v17 = (*(void *)(a1 + 56) & 4) == 0;
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_41;
        v23[3] = &unk_265546E18;
        uint64_t v28 = *(void *)(a1 + 64);
        id v3 = v3;
        id v24 = v3;
        id v27 = *(id *)(a1 + 48);
        id v25 = *(id *)(a1 + 32);
        id v26 = v5;
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_45;
        v18[3] = &unk_265546E68;
        uint64_t v22 = *(void *)(a1 + 64);
        id v5 = v26;
        id v19 = v5;
        id v20 = *(id *)(a1 + 32);
        id v21 = *(id *)(a1 + 40);
        [v5 downloadWithReservation:@"TextToSpeech.VoiceResources" useBattery:v17 progress:v23 then:v18];

        goto LABEL_23;
      }
      if ([v5 locallyAvailable]) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
      v7 = [*(id *)(a1 + 32) progress];
      [v7 setOfflineState:v6];

      uint64_t v8 = *(void *)(a1 + 48);
      if (v8) {
        (*(void (**)(uint64_t, void))(v8 + 16))(v8, *v2);
      }
      uint64_t v9 = *(void *)(a1 + 40);
      if (v9)
      {
        v10 = *(void (**)(void))(v9 + 16);
LABEL_16:
        v10();
      }
    }
    else
    {
      v13 = [NSString stringWithFormat:@"TTS asset not found for %@", 0];
      v14 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 16, v13, 0);
      v15 = _LTOSLogAssets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_cold_1();
      }
      uint64_t v16 = *(void *)(a1 + 40);
      if (v16) {
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v14);
      }
    }
  }
  else
  {
    id v3 = [NSString stringWithFormat:@"SiriTTS unsupported asset type"];
    objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 16, v3, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_cold_2();
    }
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      v10 = *(void (**)(void))(v12 + 16);
      goto LABEL_16;
    }
  }
LABEL_23:
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_41(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [a1[8] _queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2;
  block[3] = &unk_265546DF0;
  id v10 = a1[4];
  uint64_t v14 = a3;
  uint64_t v15 = a2;
  id v13 = a1[7];
  id v11 = a1[5];
  id v7 = a1[6];
  id v8 = a1[8];
  id v12 = v7;
  id v16 = v8;
  dispatch_async(v6, block);
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) progress];
  uint64_t v3 = [v2 totalUnitCount];

  uint64_t v4 = *(void *)(a1 + 64);
  if (v3 > v4) {
    uint64_t v4 = v3;
  }
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 100;
  }
  uint64_t v6 = [*(id *)(a1 + 32) progress];
  uint64_t v7 = [v6 completedUnitCount];

  unint64_t v8 = *(void *)(a1 + 72);
  if (v7 > (uint64_t)v8) {
    unint64_t v8 = v7;
  }
  if (v8 <= 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  id v10 = [*(id *)(a1 + 32) progress];
  int v11 = [v10 updateTotalUnitCount:v5 completedUnitCount:v9];

  if (v11)
  {
    id v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = v12;
      uint64_t v15 = [v13 progress];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v15;
      _os_log_impl(&dword_2600DC000, v14, OS_LOG_TYPE_INFO, "SiriTTS progress for %{public}@", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 56))
  {
    id v16 = [*(id *)(a1 + 40) progress];
    int v17 = [v16 isCancelled];

    if (v17)
    {
      v18 = _LTOSLogAssets();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v19;
        _os_log_impl(&dword_2600DC000, v18, OS_LOG_TYPE_INFO, "Cancelling download for %{public}@", buf, 0xCu);
      }
      id v20 = *(void **)(a1 + 48);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_42;
      v23[3] = &unk_265546DC8;
      id v21 = v20;
      uint64_t v22 = *(void *)(a1 + 80);
      id v24 = v21;
      uint64_t v26 = v22;
      id v25 = *(id *)(a1 + 40);
      [v21 cancelDownloadingThen:v23];
    }
  }
}

uint64_t __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_42(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Cancelled download for %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 48) purgeAsset:*(void *)(a1 + 40) completion:0];
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_45(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[7] _queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2_46;
  v6[3] = &unk_265546E40;
  id v7 = v3;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2_46(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = _LTOSLogAssets();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v3;
      _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "SiriTTS downloaded %@", buf, 0xCu);
    }
    uint64_t v4 = [*(id *)(a1 + 48) progress];
    char v5 = [v4 isFinished];

    if (v5)
    {
      uint64_t v6 = 0;
      goto LABEL_10;
    }
    id v7 = [*(id *)(a1 + 48) progress];
    [v7 setOfflineState:2];
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"TTS asset download failed for %@", *(void *)(a1 + 40)];
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 16, v7, 0);
    id v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2_46_cold_1();
    }
  }

LABEL_10:
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v6);
  }
}

void __43___LTDTTSAssetService_setSubscribedVoices___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "SiriTTS subscribe assets failure: %@", v2, v3, v4, v5, v6);
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "SiriTTS asset download failure: %@", v2, v3, v4, v5, v6);
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "SiriTTS failed to download asset %{public}@: %@");
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2_46_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "SiriTTS download %{public}@ failure: %@");
}

@end