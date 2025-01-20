@interface VUIPlaybackErrorMessage
+ (id)sharedInstance;
- (id)_getLanguageCode;
- (id)_getSessionInfoFor:(id)a3;
- (void)getLocalizedErrorMessageFor:(id)a3 withError:(id)a4 completion:(id)a5;
@end

@implementation VUIPlaybackErrorMessage

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_28 != -1) {
    dispatch_once(&sharedInstance_onceToken_28, &__block_literal_global_129);
  }
  v2 = (void *)sharedInstance_sharedInstance_10;
  return v2;
}

void __41__VUIPlaybackErrorMessage_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIPlaybackErrorMessage);
  v1 = (void *)sharedInstance_sharedInstance_10;
  sharedInstance_sharedInstance_10 = (uint64_t)v0;
}

- (void)getLocalizedErrorMessageFor:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(VUIPlaybackErrorMessage *)self _getLanguageCode];
  v12 = [(VUIPlaybackErrorMessage *)self _getSessionInfoFor:v10];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F94278]) initWithAppTarget:0 locale:v11];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F94280]) initWithConfig:v13 logger:&__block_literal_global_24_1 metricsRecorder:&__block_literal_global_29 defaultAlert:&__block_literal_global_33_0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_3;
  v16[3] = &unk_1E6DFB558;
  id v17 = v8;
  id v15 = v8;
  [v14 fetchLocalizedErrorMessageForItems:v12 usingError:v9 completionHandler:v16];
}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!a2)
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [MEMORY[0x1E4F29060] currentThread];
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUIPlaybackErrorMessage [%@] - emitting message:%@", (uint8_t *)&v7, 0x16u);
    }
    goto LABEL_7;
  }
  if (a2 == 1)
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_cold_1((uint64_t)v4, v5);
    }
LABEL_7:
  }
}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[VUIMetricsController sharedInstance];
  [v3 recordDialog:v2];
}

id __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x1E4F94270]);
  v1 = +[VUILocalizationManager sharedInstance];
  id v2 = [v1 localizedStringForKey:@"AV_PLAYBACK_ERROR"];
  id v3 = (void *)[v0 initWithTitle:&stru_1F3E921E0 body:v2];

  return v3;
}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_4;
  v6[3] = &unk_1E6DF41E8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) title];
  id v3 = [*(id *)(a1 + 32) body];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (id)_getLanguageCode
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 arrayForKey:@"AppleLanguages"];

  id v4 = [v3 firstObject];

  return v4;
}

- (id)_getSessionInfoFor:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  if (v4)
  {
    int v6 = [v4 hasTrait:*MEMORY[0x1E4FAA180]];
    id v7 = @"VOD";
    if (v6) {
      id v7 = @"LIVE";
    }
    id v8 = v7;
    v25[0] = v8;
    __int16 v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v5 setObject:v9 forKey:@"contentType"];

    id v10 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FA8]];
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = objc_msgSend(v10, "vui_stringForKey:", @"MediaIdentifier");
      v13 = (void *)v12;
      if (v12)
      {
        uint64_t v24 = v12;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
        [v5 setObject:v14 forKey:@"mediaIdentifier"];
      }
    }
    uint64_t v15 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E10]];
    v16 = (void *)v15;
    if (v15)
    {
      uint64_t v23 = v15;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      [v5 setObject:v17 forKey:@"brandId"];
    }
    uint64_t v18 = [(VUIPlaybackErrorMessage *)self _getLanguageCode];
    v19 = (void *)v18;
    if (v18)
    {
      uint64_t v22 = v18;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      [v5 setObject:v20 forKey:@"locale"];
    }
  }

  return v5;
}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F29060] currentThread];
  int v5 = 138412546;
  int v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIPlaybackErrorMessage [%@] - emitting message:%@", (uint8_t *)&v5, 0x16u);
}

@end