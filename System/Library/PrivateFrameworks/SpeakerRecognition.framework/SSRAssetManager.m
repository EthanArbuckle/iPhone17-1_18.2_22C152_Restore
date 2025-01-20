@interface SSRAssetManager
+ (id)sharedManager;
+ (id)sharedManagerOnDeviceCompilationDisable;
- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler;
- (NSArray)assetProviders;
- (NSMutableSet)compiledAssets;
- (NSString)currentLanguageCode;
- (OS_dispatch_queue)queue;
- (SSRAssetManager)init;
- (SSRAssetManager)initWithOnDeviceCompilationDisable:(BOOL)a3;
- (SSRAssetManagerDelegate)delegate;
- (SSRAssetProviding)mobileAssetProvider;
- (SSRAssetProviding)uafAssetProvider;
- (float)_convertVersionStringToFloat:(id)a3;
- (id)_allInstalledSpeakerRecognitionAssetsForLanguage:(id)a3;
- (id)_compileAssets:(id)a3;
- (id)_getSSRAssetFromMAProviderWithLanguage:(id)a3;
- (id)_getSpeakerRecognitionOverrideAsset;
- (id)allInstalledAssetsOfType:(unint64_t)a3 forLanguage:(id)a4;
- (id)allInstalledSpeakerRecognitionAssetsForLanguage:(id)a3;
- (id)installedAssetOfType:(unint64_t)a3 forLanguage:(id)a4;
- (id)installedSpeakerRecognitionAssetForLanguage:(id)a3;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)_compileCurrentInstalledAssets:(id)a3;
- (void)_loadUAFAssetsIfNecessary;
- (void)dealloc;
- (void)getSpeakerRecognitionAssetWithLanguage:(id)a3 completion:(id)a4;
- (void)releaseAssetsLocksIfNecessary;
- (void)setAssetProviders:(id)a3;
- (void)setCompiledAssets:(id)a3;
- (void)setCurrentLanguageCode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMobileAssetProvider:(id)a3;
- (void)setOnDeviceCompilationHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUafAssetProvider:(id)a3;
- (void)start;
@end

@implementation SSRAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uafAssetProvider, 0);
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
  objc_storeStrong((id *)&self->_compiledAssets, 0);
  objc_storeStrong((id *)&self->_onDeviceCompilationHandler, 0);
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
  objc_storeStrong((id *)&self->_assetProviders, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setUafAssetProvider:(id)a3
{
}

- (SSRAssetProviding)uafAssetProvider
{
  return self->_uafAssetProvider;
}

- (void)setMobileAssetProvider:(id)a3
{
}

- (SSRAssetProviding)mobileAssetProvider
{
  return self->_mobileAssetProvider;
}

- (void)setCompiledAssets:(id)a3
{
}

- (NSMutableSet)compiledAssets
{
  return self->_compiledAssets;
}

- (void)setOnDeviceCompilationHandler:(id)a3
{
}

- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler
{
  return self->_onDeviceCompilationHandler;
}

- (void)setCurrentLanguageCode:(id)a3
{
}

- (NSString)currentLanguageCode
{
  return self->_currentLanguageCode;
}

- (void)setAssetProviders:(id)a3
{
}

- (NSArray)assetProviders
{
  return self->_assetProviders;
}

- (void)setDelegate:(id)a3
{
}

- (SSRAssetManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRAssetManagerDelegate *)WeakRetained;
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__SSRAssetManager_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __77__SSRAssetManager_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F380D0] getSiriLanguageWithFallback:@"en-US"];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[3];

  return [v5 _compileCurrentInstalledAssets:v6];
}

- (void)_compileCurrentInstalledAssets:(id)a3
{
  id v3 = [(SSRAssetManager *)self _allInstalledSpeakerRecognitionAssetsForLanguage:a3];
}

- (float)_convertVersionStringToFloat:(id)a3
{
  float v8 = 0.0;
  id v3 = (void *)MEMORY[0x263F08B08];
  v4 = [a3 configVersion];
  v5 = [v3 scannerWithString:v4];

  [v5 scanFloat:&v8];
  float v6 = v8;

  return v6;
}

- (id)_compileAssets:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_onDeviceCompilationHandler)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      v9 = 0;
      uint64_t v10 = *(void *)v25;
      v11 = (os_log_t *)MEMORY[0x263F37FA8];
      *(void *)&long long v7 = 136315650;
      long long v22 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v5);
          }
          v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ((!objc_msgSend(v13, "assetType", v22) || objc_msgSend(v13, "assetType") == 3)
            && ([(NSMutableSet *)self->_compiledAssets containsObject:v13] & 1) == 0)
          {
            onDeviceCompilationHandler = self->_onDeviceCompilationHandler;
            uint64_t v15 = [v13 assetType];
            id v23 = v9;
            [(CSOnDeviceCompilationHandler *)onDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:v13 assetType:v15 endpointId:0 errOut:&v23];
            id v16 = v23;

            if (v16)
            {
              v17 = *v11;
              if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v22;
                v31 = "-[SSRAssetManager _compileAssets:]";
                __int16 v32 = 2112;
                v33 = v13;
                __int16 v34 = 2112;
                id v35 = v16;
                _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s compile asset: %@ with error: %@", buf, 0x20u);
              }
              v9 = v16;
            }
            else
            {
              [(NSMutableSet *)self->_compiledAssets addObject:v13];
              v9 = 0;
            }
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v19 = [NSString stringWithFormat:@"onDeviceCompilationHandler not set or assets are nil"];
    v29 = v19;
    v20 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v9 = [v18 errorWithDomain:@"com.apple.speakerrecognition" code:0 userInfo:v20];
  }

  return v9;
}

- (id)_allInstalledSpeakerRecognitionAssetsForLanguage:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SSRAssetManager *)self _getSpeakerRecognitionOverrideAsset];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    v11[0] = v5;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }
  else
  {
    uint64_t v7 = [(SSRAssetProviding *)self->_mobileAssetProvider allInstalledSpeakerRecognitionAssetForLanguage:v4];
  }
  uint64_t v8 = (void *)v7;
  id v9 = [(SSRAssetManager *)self _compileAssets:v7];

  return v8;
}

- (id)_getSpeakerRecognitionOverrideAsset
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F38068] sharedPreferences];
  id v3 = [v2 fakeSpeakerRecognitionAssetPath];

  if (v3
    && ([MEMORY[0x263F08850] defaultManager],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 fileExistsAtPath:v3],
        v4,
        v5))
  {
    uint64_t v6 = [v3 stringByDeletingLastPathComponent];
    uint64_t v7 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "-[SSRAssetManager _getSpeakerRecognitionOverrideAsset]";
      __int16 v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Returning the speakerRecognition override asset： %@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = [MEMORY[0x263F37FB0] assetForAssetType:3 resourcePath:v6 configVersion:@"override-asset" assetProvider:0];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_getSSRAssetFromMAProviderWithLanguage:(id)a3
{
  id v4 = a3;
  int v5 = [(SSRAssetManager *)self _getSpeakerRecognitionOverrideAsset];
  if (!v5)
  {
    int v5 = [(SSRAssetProviding *)self->_mobileAssetProvider installedSpeakerRecognitionAssetForLanguage:v4];
  }

  return v5;
}

- (void)releaseAssetsLocksIfNecessary
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SSRAssetManager_releaseAssetsLocksIfNecessary__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__SSRAssetManager_releaseAssetsLocksIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SSRAssetManager releaseAssetsLocksIfNecessary]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = 0;
}

- (void)_loadUAFAssetsIfNecessary
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SSRAssetManager _loadUAFAssetsIfNecessary]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (!self->_uafAssetProvider)
  {
    id v4 = objc_alloc_init(SSRUafAssetProvider);
    uafAssetProvider = self->_uafAssetProvider;
    self->_uafAssetProvider = (SSRAssetProviding *)v4;
  }
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 forLanguage:(id)a4
{
  id v6 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__7553;
  long long v24 = __Block_byref_object_dispose__7554;
  id v25 = [MEMORY[0x263EFF980] array];
  queue = self->_queue;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __56__SSRAssetManager_allInstalledAssetsOfType_forLanguage___block_invoke;
  uint64_t v15 = &unk_26442A1D8;
  id v16 = self;
  unint64_t v19 = a3;
  id v8 = v6;
  id v17 = v8;
  v18 = &v20;
  dispatch_sync(queue, &v12);
  if (objc_msgSend((id)v21[5], "count", v12, v13, v14, v15, v16)) {
    id v9 = (void *)v21[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  _Block_object_dispose(&v20, 8);

  return v10;
}

void __56__SSRAssetManager_allInstalledAssetsOfType_forLanguage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SSRAssetManager_allInstalledAssetsOfType_forLanguage___block_invoke_2;
  v6[3] = &unk_26442A1B0;
  uint64_t v9 = *(void *)(a1 + 56);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 enumerateObjectsUsingBlock:v6];
  id v5 = (id)[*(id *)(a1 + 32) _compileAssets:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __56__SSRAssetManager_allInstalledAssetsOfType_forLanguage___block_invoke_2(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(__CFString *)v3 getAssetProviderType];
  id v5 = @"MA";
  if (v4 == 1) {
    id v5 = @"Trial";
  }
  id v6 = v5;
  id v7 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v8 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    id v16 = "-[SSRAssetManager allInstalledAssetsOfType:forLanguage:]_block_invoke_2";
    __int16 v17 = 2112;
    v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s parsing provider: %@ name: %@", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v9 = [(__CFString *)v3 getAssetProviderType];
  uint64_t v10 = a1[6];
  uint64_t v11 = a1[4];
  if (v9 != 1)
  {
    uint64_t v13 = [(__CFString *)v3 allInstalledAssetsOfType:v10 forLanguage:v11];
    uint64_t v12 = v13;
    if (v13 && [v13 count])
    {
      [*(id *)(*(void *)(a1[5] + 8) + 40) addObjectsFromArray:v12];
      goto LABEL_14;
    }
    uint64_t v14 = *v7;
    if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
LABEL_15:
    int v15 = 136315394;
    id v16 = "-[SSRAssetManager allInstalledAssetsOfType:forLanguage:]_block_invoke";
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s ERR: got nil assets from provider: %@", (uint8_t *)&v15, 0x16u);
    goto LABEL_14;
  }
  uint64_t v12 = [(__CFString *)v3 installedAssetOfType:v10 forLanguageCode:v11];
  if (!v12)
  {
    uint64_t v14 = *v7;
    if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) insertObject:v12 atIndex:0];
LABEL_14:
}

- (id)allInstalledSpeakerRecognitionAssetsForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__7553;
  id v16 = __Block_byref_object_dispose__7554;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SSRAssetManager_allInstalledSpeakerRecognitionAssetsForLanguage___block_invoke;
  block[3] = &unk_26442A4D8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __67__SSRAssetManager_allInstalledSpeakerRecognitionAssetsForLanguage___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _allInstalledSpeakerRecognitionAssetsForLanguage:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)installedSpeakerRecognitionAssetForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__7553;
  id v16 = __Block_byref_object_dispose__7554;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SSRAssetManager_installedSpeakerRecognitionAssetForLanguage___block_invoke;
  block[3] = &unk_26442A4D8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__SSRAssetManager_installedSpeakerRecognitionAssetForLanguage___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _getSSRAssetFromMAProviderWithLanguage:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    v9[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    id v8 = (id)[v6 _compileAssets:v7];
  }
}

- (void)getSpeakerRecognitionAssetWithLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__SSRAssetManager_getSpeakerRecognitionAssetWithLanguage_completion___block_invoke;
  block[3] = &unk_26442A188;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __69__SSRAssetManager_getSpeakerRecognitionAssetWithLanguage_completion___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _getSSRAssetFromMAProviderWithLanguage:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v10 = v2;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
    id v6 = [v4 _compileAssets:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v5 = [NSString stringWithFormat:@"speakerRecognition asset not available for mobileAsset Provider"];
    v12[0] = v5;
    id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v6 = [v7 errorWithDomain:@"com.apple.speakerrecognition" code:802 userInfo:v8];
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v3, v6);
  }
}

- (id)installedAssetOfType:(unint64_t)a3 forLanguage:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7553;
  __int16 v19 = __Block_byref_object_dispose__7554;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __52__SSRAssetManager_installedAssetOfType_forLanguage___block_invoke;
  v11[3] = &unk_26442A1D8;
  id v13 = &v15;
  unint64_t v14 = a3;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __52__SSRAssetManager_installedAssetOfType_forLanguage___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F38068] sharedPreferences];
  int v3 = [v2 isVoiceTriggerAssetOverridingEnabled];

  if (v3)
  {
    id v4 = [MEMORY[0x263F38068] sharedPreferences];
    uint64_t v5 = [v4 fakeVoiceTriggerAssetPath];

    id v6 = [v5 stringByDeletingLastPathComponent];
    id v7 = [MEMORY[0x263F08850] defaultManager];
    int v8 = [v7 fileExistsAtPath:v5];

    if (v8)
    {
      id v9 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v25 = "-[SSRAssetManager installedAssetOfType:forLanguage:]_block_invoke";
        _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Retuning the VoiceTrigger override asset", buf, 0xCu);
      }
      uint64_t v10 = [MEMORY[0x263F37FB0] assetForAssetType:0 resourcePath:v6 configVersion:@"override-asset" assetProvider:1];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    goto LABEL_11;
  }
  [*(id *)(a1 + 32) _loadUAFAssetsIfNecessary];
  uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 56) installedAssetOfType:*(void *)(a1 + 56) forLanguageCode:*(void *)(a1 + 40)];
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v16)
  {
    uint64_t v17 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v25 = "-[SSRAssetManager installedAssetOfType:forLanguage:]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s UAF Asset being nil, falling back to MA asset", buf, 0xCu);
    }
    uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 48) installedAssetOfType:*(void *)(a1 + 56) forLanguageCode:*(void *)(a1 + 40)];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
LABEL_11:

    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v16) {
      return;
    }
  }
  id v20 = *(void **)(a1 + 32);
  uint64_t v23 = v16;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  id v22 = (id)[v20 _compileAssets:v21];
}

- (SSRAssetManager)initWithOnDeviceCompilationDisable:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)SSRAssetManager;
  id v4 = [(SSRAssetManager *)&v24 init];
  if (!v4)
  {
LABEL_10:
    uint64_t v21 = v4;
    goto LABEL_14;
  }
  dispatch_queue_t v5 = dispatch_queue_create("Serial SSRAssetManager queue", 0);
  queue = v4->_queue;
  v4->_queue = (OS_dispatch_queue *)v5;

  uint64_t v7 = [MEMORY[0x263F380D0] getSiriLanguageWithFallback:@"en-US"];
  currentLanguageCode = v4->_currentLanguageCode;
  v4->_currentLanguageCode = (NSString *)v7;

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = objc_alloc_init(SSRMobileAssetProvider);
  mobileAssetProvider = v4->_mobileAssetProvider;
  v4->_mobileAssetProvider = (SSRAssetProviding *)v10;

  if (v4->_mobileAssetProvider) {
    objc_msgSend(v9, "addObject:");
  }
  id v12 = objc_alloc_init(SSRTrialAssetProvider);
  if (v12) {
    [v9 addObject:v12];
  }
  uint64_t v13 = objc_alloc_init(SSRUafAssetProvider);
  uafAssetProvider = v4->_uafAssetProvider;
  v4->_uafAssetProvider = (SSRAssetProviding *)v13;

  if ([v9 count])
  {
    uint64_t v15 = [v9 copy];
    assetProviders = v4->_assetProviders;
    v4->_assetProviders = (NSArray *)v15;

    compiledAssets = v4->_compiledAssets;
    v4->_compiledAssets = 0;

    onDeviceCompilationHandler = v4->_onDeviceCompilationHandler;
    v4->_onDeviceCompilationHandler = 0;

    if (!a3)
    {
      uint64_t v19 = [MEMORY[0x263F380A0] sharedHandler];
      id v20 = v4->_onDeviceCompilationHandler;
      v4->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v19;
    }
    [(SSRAssetManager *)v4 start];

    goto LABEL_10;
  }
  id v22 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[SSRAssetManager initWithOnDeviceCompilationDisable:]";
    _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create asset providers - Bailing out", buf, 0xCu);
  }

  uint64_t v21 = 0;
LABEL_14:

  return v21;
}

- (SSRAssetManager)init
{
  return [(SSRAssetManager *)self initWithOnDeviceCompilationDisable:0];
}

- (void)dealloc
{
  int v3 = [MEMORY[0x263F38088] sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SSRAssetManager;
  [(SSRAssetManager *)&v4 dealloc];
}

- (void)start
{
  id v3 = [MEMORY[0x263F38088] sharedInstance];
  [v3 addObserver:self];
}

+ (id)sharedManagerOnDeviceCompilationDisable
{
  if (sharedManagerOnDeviceCompilationDisable_onceToken != -1) {
    dispatch_once(&sharedManagerOnDeviceCompilationDisable_onceToken, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)sharedManagerOnDeviceCompilationDisable_sharedManager;

  return v2;
}

uint64_t __58__SSRAssetManager_sharedManagerOnDeviceCompilationDisable__block_invoke()
{
  SSRLogInitIfNeeded();
  sharedManagerOnDeviceCompilationDisable_sharedManager = [[SSRAssetManager alloc] initWithOnDeviceCompilationDisable:1];

  return MEMORY[0x270F9A758]();
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_7585 != -1) {
    dispatch_once(&sharedManager_onceToken_7585, &__block_literal_global_7586);
  }
  uint64_t v2 = (void *)sharedManager_sharedManager;

  return v2;
}

uint64_t __32__SSRAssetManager_sharedManager__block_invoke()
{
  SSRLogInitIfNeeded();
  sharedManager_sharedManager = [[SSRAssetManager alloc] initWithOnDeviceCompilationDisable:0];

  return MEMORY[0x270F9A758]();
}

@end