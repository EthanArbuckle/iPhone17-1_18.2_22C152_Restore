@interface VSPostInstallService
- (void)clearSynthesisCache;
- (void)registerPostInstallActivity;
- (void)resetMobileAssetDefaults;
@end

@implementation VSPostInstallService

- (void)clearSynthesisCache
{
  id v2 = +[VSSpeechCache defaultCacheStore];
  [v2 deleteCache];
}

- (void)resetMobileAssetDefaults
{
  id v2 = [MEMORY[0x263F84E90] standardInstance];
  int v3 = [v2 disableMobileAssetURLReset];

  v4 = VSGetLogEvent();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v4, OS_LOG_TYPE_DEFAULT, "Defaults disables reset, skip resetting MobileAsset default URL", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_226CB1000, v4, OS_LOG_TYPE_DEFAULT, "Resetting MobileAsset default URL", v6, 2u);
    }

    MEMORY[0x22A667650](@"com.apple.MobileAsset.VoiceServicesVocalizerVoice", 0);
    MEMORY[0x22A667650](@"com.apple.MobileAsset.VoiceServices.CustomVoice", 0);
    MEMORY[0x22A667650](@"com.apple.MobileAsset.VoiceServices.GryphonVoice", 0);
    MEMORY[0x22A667650](@"com.apple.MobileAsset.VoiceServices.VoiceResources", 0);
    ASSetAssetServerURLForAssetType();
    ASSetAssetServerURLForAssetType();
    ASSetAssetServerURLForAssetType();
    ASSetAssetServerURLForAssetType();
    ASSetDefaultAssetServerURLForAssetType();
    ASSetDefaultAssetServerURLForAssetType();
    ASSetDefaultAssetServerURLForAssetType();
    ASSetDefaultAssetServerURLForAssetType();
  }
}

- (void)registerPostInstallActivity
{
  id v2 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __51__VSPostInstallService_registerPostInstallActivity__block_invoke;
  handler[3] = &unk_2647DC9B0;
  handler[4] = self;
  xpc_activity_register("com.apple.voiced.postInstall", v2, handler);
}

void __51__VSPostInstallService_registerPostInstallActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    int v5 = state;
    if (state)
    {
      v15 = VSGetLogEvent();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v29 = v5;
        _os_log_impl(&dword_226CB1000, v15, OS_LOG_TYPE_DEFAULT, "Unexpected xpc activity state %d for 'com.apple.voiced.postInstall'", buf, 8u);
      }
    }
    else
    {
      xpc_object_t v6 = xpc_activity_copy_criteria(v3);
      if (v6)
      {

        goto LABEL_17;
      }
      v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x263EF8268], 1);
      xpc_activity_set_criteria(v3, v15);
      v16 = VSGetLogEvent();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226CB1000, v16, OS_LOG_TYPE_DEFAULT, "Registered xpc activity com.apple.voiced.postInstall", buf, 2u);
      }
    }
    goto LABEL_17;
  }
  v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226CB1000, v7, OS_LOG_TYPE_DEFAULT, "Running activity com.apple.voiced.postInstall", buf, 2u);
  }

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __51__VSPostInstallService_registerPostInstallActivity__block_invoke_275;
  v26[3] = &unk_2647DCD78;
  v8 = v3;
  v27 = v8;
  v9 = (void (**)(void))MEMORY[0x22A667CC0](v26);
  [*(id *)(a1 + 32) resetMobileAssetDefaults];
  v10 = [MEMORY[0x263F84E40] sharedManager];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __51__VSPostInstallService_registerPostInstallActivity__block_invoke_277;
  v24 = &unk_2647DC988;
  v11 = v8;
  v25 = v11;
  char v12 = [v10 migrateAssetsWithProgress:&v21];

  if ((v12 & 1) != 0
    || (v13 = [VSDownloadService alloc],
        v14 = -[VSDownloadService initWithType:](v13, "initWithType:", 2, v21, v22, v23, v24),
        [(VSDownloadService *)v14 updateVoicesAndVoiceResources],
        v14,
        xpc_activity_should_defer(v11)))
  {
    v9[2](v9);
  }
  else
  {
    [*(id *)(a1 + 32) clearSynthesisCache];
    if ([MEMORY[0x263F84E48] isANECompilationPlatform]
      && ([MEMORY[0x263F84EB8] isWatch] & 1) == 0)
    {
      v17 = VSGetLogDefault();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226CB1000, v17, OS_LOG_TYPE_DEFAULT, "Re-triggering neural compiling afer OS upgrade.", buf, 2u);
      }

      v18 = dispatch_get_global_queue(9, 0);
      dispatch_async(v18, &__block_literal_global_908);
    }
    v19 = VSGetLogEvent();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v19, OS_LOG_TYPE_DEFAULT, "Migration service finished.", buf, 2u);
    }

    if (!xpc_activity_set_state(v11, 5))
    {
      v20 = VSGetLogDefault();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v20, OS_LOG_TYPE_ERROR, "xpc activity com.apple.voiced.postInstall, failed to set state to done.", buf, 2u);
      }
    }
  }

LABEL_17:
}

void __51__VSPostInstallService_registerPostInstallActivity__block_invoke_275(uint64_t a1)
{
  id v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_226CB1000, v2, OS_LOG_TYPE_ERROR, "com.apple.voiced.postInstall is requested to be deferred.", buf, 2u);
  }

  if (xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
  {
    int v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_226CB1000, v3, OS_LOG_TYPE_ERROR, "Unable to set defer state for com.apple.voiced.postInstall", v4, 2u);
    }
  }
}

BOOL __51__VSPostInstallService_registerPostInstallActivity__block_invoke_277(uint64_t a1, unsigned char *a2, float a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  xpc_object_t v6 = VSGetLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    double v9 = a3;
    _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_INFO, "Assets migration progress: %f", (uint8_t *)&v8, 0xCu);
  }

  BOOL result = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  if (result) {
    *a2 = 1;
  }
  return result;
}

uint64_t __51__VSPostInstallService_registerPostInstallActivity__block_invoke_282()
{
  return +[VSDownloadService triggerNeuralCompiling];
}

@end