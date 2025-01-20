@interface VSDownloadService
+ (id)downloadQueue;
+ (id)inProgressDownloadVoiceKeys;
+ (void)addInProgressDownloadVoiceKey:(id)a3;
+ (void)removeInProgressDownloadVoiceKey:(id)a3;
+ (void)triggerNeuralCompiling;
- (NSLock)updateLock;
- (VSDownloadService)initWithType:(unint64_t)a3;
- (VSDownloadService)initWithType:(unint64_t)a3 assetsManager:(id)a4;
- (VSMobileAssetsManager)assetsManager;
- (VSPreferencesInterface)preferenceInterface;
- (VSSiriServerConfiguration)serverConfig;
- (unint64_t)type;
- (void)cancelDownloadForAssets:(id)a3;
- (void)setAssetsManager:(id)a3;
- (void)setPreferenceInterface:(id)a3;
- (void)setServerConfig:(id)a3;
- (void)setUpdateLock:(id)a3;
- (void)updateTrialVoiceResourceWithLanguage:(id)a3;
- (void)updateVoiceIfNeeded:(id)a3;
- (void)updateVoicesAndVoiceResources;
@end

@implementation VSDownloadService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateLock, 0);
  objc_storeStrong((id *)&self->_preferenceInterface, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong((id *)&self->_assetsManager, 0);
}

- (void)setUpdateLock:(id)a3
{
}

- (NSLock)updateLock
{
  return self->_updateLock;
}

- (void)setPreferenceInterface:(id)a3
{
}

- (VSPreferencesInterface)preferenceInterface
{
  return self->_preferenceInterface;
}

- (void)setServerConfig:(id)a3
{
}

- (VSSiriServerConfiguration)serverConfig
{
  return self->_serverConfig;
}

- (void)setAssetsManager:(id)a3
{
}

- (VSMobileAssetsManager)assetsManager
{
  return self->_assetsManager;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)cancelDownloadForAssets:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSLock *)self->_updateLock lock];
  v5 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v11 voiceKey];
        +[VSDownloadService removeInProgressDownloadVoiceKey:v12];

        v13 = [(VSDownloadService *)self assetsManager];
        v14 = [v13 preferredDownloadForVoice:v11];

        if (v14) {
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  v16 = [(VSDownloadService *)self assetsManager];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__VSDownloadService_cancelDownloadForAssets___block_invoke;
  v18[3] = &unk_2647DCB38;
  dispatch_semaphore_t v19 = v15;
  v17 = v15;
  [v16 cancelDownloads:v5 completion:v18];

  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  [(NSLock *)self->_updateLock unlock];
}

intptr_t __45__VSDownloadService_cancelDownloadForAssets___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)updateTrialVoiceResourceWithLanguage:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = VSGetLogEvent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_226CB1000, v5, OS_LOG_TYPE_DEFAULT, "Updating VoiceResource for '%{public}@'", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x263F84ED0]);
  id v9 = v4;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [v6 setLanguages:v7];

  uint64_t v8 = [(VSDownloadService *)self assetsManager];
  [v8 downloadVoiceResource:v6 options:0 completion:0];
}

- (void)updateVoiceIfNeeded:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = VSGetLogEvent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v46 = v4;
    _os_log_impl(&dword_226CB1000, v5, OS_LOG_TYPE_DEFAULT, "Updating target voice: %@", buf, 0xCu);
  }

  id v6 = [(VSDownloadService *)self assetsManager];
  uint64_t v7 = [v4 languages];
  uint64_t v8 = [v7 firstObject];
  id v9 = [v4 name];
  v10 = objc_msgSend(v6, "selectVoiceForLang:name:type:gender:footprint:", v8, v9, objc_msgSend(v4, "type"), objc_msgSend(v4, "gender"), objc_msgSend(v4, "footprint"));

  if (v10)
  {
    id v11 = [v10 voiceData];
    BOOL v12 = [v11 footprint] == 1;
  }
  else
  {
    BOOL v12 = 1;
  }
  v13 = [v4 name];
  if (v13)
  {
    v14 = [v4 name];
    dispatch_semaphore_t v15 = [v10 voiceData];
    v16 = [v15 name];
    int v17 = [v14 isEqual:v16] ^ 1;
  }
  else
  {
    int v17 = 0;
  }

  v18 = [(VSDownloadService *)self preferenceInterface];
  uint64_t v19 = [v18 lastTTSRequestDate];

  if (v19)
  {
    long long v20 = [MEMORY[0x263EFF910] date];
    [v20 timeIntervalSinceDate:v19];
    BOOL v22 = v21 < 604800.0;
  }
  else
  {
    BOOL v22 = 1;
  }
  long long v23 = [(VSDownloadService *)self serverConfig];
  int v24 = [v23 shouldDelayVoiceUpdate];

  v41 = (void *)v19;
  switch(self->_type)
  {
    case 0uLL:
      BOOL v25 = v12;
      if ((v12 | v17)) {
        goto LABEL_17;
      }
      uint64_t v26 = 0;
      int v27 = v22 & ~v24;
      break;
    case 1uLL:
      BOOL v25 = v12;
      if (v12)
      {
LABEL_17:
        uint64_t v26 = 0;
        goto LABEL_21;
      }
      uint64_t v26 = 0;
      int v27 = v17 | v24 ^ 1;
      break;
    case 2uLL:
      BOOL v25 = v12;
      if (v12) {
        int v27 = 1;
      }
      else {
        int v27 = [MEMORY[0x263F84EB8] isHomeHub] & v17;
      }
      uint64_t v26 = [MEMORY[0x263F84EB8] isWatch] ^ 1;
      break;
    case 3uLL:
      BOOL v25 = v12;
      uint64_t v26 = 1;
LABEL_21:
      int v27 = 1;
      break;
    default:
      BOOL v25 = v12;
      uint64_t v26 = 0;
      int v27 = 0;
      break;
  }
  v28 = VSGetLogEvent();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t type = self->_type;
    *(_DWORD *)buf = 67110656;
    *(_DWORD *)v46 = v27;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v26;
    __int16 v47 = 1024;
    int v48 = type;
    __int16 v49 = 1024;
    BOOL v50 = v25;
    __int16 v51 = 1024;
    int v52 = v17;
    __int16 v53 = 1024;
    BOOL v54 = v22;
    __int16 v55 = 1024;
    int v56 = v24;
    _os_log_impl(&dword_226CB1000, v28, OS_LOG_TYPE_DEFAULT, "Voice update decision: shouldDownload:%d, canUseBattery:%d. Reason: triggerType:%d, compactVoiceSelected:%d, mismatchedVoiceName:%d, activeSiriUser:%d, serverExperimentDelay:%d", buf, 0x2Cu);
  }

  if (v27)
  {
    v30 = [v4 voiceKey];
    +[VSDownloadService addInProgressDownloadVoiceKey:v30];
    v31 = [MEMORY[0x263F84E40] downloadOptionsWithBattery:v26];
    [v31 setAllowsCellularAccess:0];
    v32 = [(VSDownloadService *)self assetsManager];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __41__VSDownloadService_updateVoiceIfNeeded___block_invoke;
    v42[3] = &unk_2647DCB10;
    id v43 = v4;
    id v44 = v30;
    id v33 = v30;
    [v32 downloadVoiceAsset:v43 options:v31 progressUpdateHandler:v42];

LABEL_34:
    v36 = v41;
    goto LABEL_35;
  }
  v34 = [v10 voiceData];
  if ([v34 type] != 4 || !objc_msgSend(MEMORY[0x263F84E48], "isANECompilationPlatform"))
  {

    goto LABEL_34;
  }
  v35 = [v10 voiceData];
  v36 = v41;
  if ([v35 isVoiceReadyToUse])
  {
  }
  else
  {
    char v37 = [MEMORY[0x263F84EB8] isWatch];

    if ((v37 & 1) == 0)
    {
      v38 = VSGetLogDefault();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = [v10 voiceData];
        v40 = [v39 voiceKey];
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = v40;
        _os_log_impl(&dword_226CB1000, v38, OS_LOG_TYPE_DEFAULT, "Downloaded voice is not ready to use. Start ANE compiling immediately for voice: %@", buf, 0xCu);
      }
      +[VSDownloadService triggerNeuralCompiling];
    }
  }
LABEL_35:
}

void __41__VSDownloadService_updateVoiceIfNeeded___block_invoke(uint64_t a1, double a2, float a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = VSGetLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(a1 + 32) descriptiveKey];
    int v10 = 134218498;
    double v11 = a3;
    __int16 v12 = 2048;
    double v13 = a2;
    __int16 v14 = 2112;
    dispatch_semaphore_t v15 = v7;
    _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_INFO, "Voice asset downloading progress: %.2f, remainingTime: %.2f, voice: %@", (uint8_t *)&v10, 0x20u);
  }
  if (a3 < 0.0 || a3 >= 1.0) {
    +[VSDownloadService removeInProgressDownloadVoiceKey:*(void *)(a1 + 40)];
  }
  if (a3 >= 1.0
    && [*(id *)(a1 + 32) type] == 4
    && [MEMORY[0x263F84E48] isANECompilationPlatform]
    && ([MEMORY[0x263F84EB8] isWatch] & 1) == 0)
  {
    uint64_t v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = [*(id *)(a1 + 32) voiceKey];
      int v10 = 138412290;
      double v11 = v9;
      _os_log_impl(&dword_226CB1000, v8, OS_LOG_TYPE_DEFAULT, "Start ANE compiling immediately for voice: %@", (uint8_t *)&v10, 0xCu);
    }
    +[VSDownloadService triggerNeuralCompiling];
  }
}

- (void)updateVoicesAndVoiceResources
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F84E90] standardInstance];
  int v5 = [v4 disableAssetUpdate];

  if (v5)
  {
    id v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_DEFAULT, "Asset update is disabled in internal settings.", buf, 2u);
    }
  }
  else
  {
    [(NSLock *)self->_updateLock lock];
    uint64_t v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v7, OS_LOG_TYPE_DEFAULT, "Start updating voice and voice resources.", buf, 2u);
    }

    v42 = self;
    uint64_t v8 = [(VSDownloadService *)self preferenceInterface];
    double v9 = [v8 subscribedVoicesForClientID:0 accessoryID:0];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    int v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v65 count:16];
    id v43 = v10;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v54 != v13) {
            objc_enumerationMutation(v10);
          }
          dispatch_semaphore_t v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v16 = VSGetLogDefault();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = [v15 clientID];
            v18 = [v15 accessoryID];
            if (v18)
            {
              uint64_t v19 = NSString;
              v2 = [v15 accessoryID];
              self = [v19 stringWithFormat:@"on accessory %@", v2];
              long long v20 = self;
            }
            else
            {
              long long v20 = (VSDownloadService *)&stru_26DAD0E18;
            }
            double v21 = [v15 voice];
            *(_DWORD *)buf = 138412802;
            v60 = v17;
            __int16 v61 = 2112;
            v62 = v20;
            __int16 v63 = 2114;
            v64 = v21;
            _os_log_impl(&dword_226CB1000, v16, OS_LOG_TYPE_DEFAULT, "%@ %@ has a subscribed voice: %{public}@", buf, 0x20u);

            if (v18)
            {
            }
            int v10 = v43;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v12);
    }

    BOOL v22 = [v10 valueForKey:@"voice"];
    long long v23 = [v22 sortedArrayUsingComparator:&__block_literal_global_40];

    int v24 = [(VSDownloadService *)v42 assetsManager];
    [v24 resetCache];

    BOOL v25 = [MEMORY[0x263EFF9B0] orderedSet];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = v23;
    uint64_t v26 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v50 != v28) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          v31 = [v30 languages];
          [v25 addObjectsFromArray:v31];

          v32 = +[VSDownloadService inProgressDownloadVoiceKeys];
          id v33 = [v30 voiceKey];
          int v34 = [v32 containsObject:v33];

          if (v34)
          {
            v35 = VSGetLogDefault();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = [v30 descriptiveKey];
              *(_DWORD *)buf = 138412290;
              v60 = v36;
              _os_log_impl(&dword_226CB1000, v35, OS_LOG_TYPE_DEFAULT, "Voice download is in progress, skip new download. %@", buf, 0xCu);
            }
          }
          else
          {
            [(VSDownloadService *)v42 updateVoiceIfNeeded:v30];
          }
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v27);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v37 = v25;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(v37);
          }
          [(VSDownloadService *)v42 updateTrialVoiceResourceWithLanguage:*(void *)(*((void *)&v45 + 1) + 8 * k)];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v39);
    }

    [(NSLock *)v42->_updateLock unlock];
    id v6 = v43;
  }
}

uint64_t __50__VSDownloadService_updateVoicesAndVoiceResources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if ([a2 type]) {
    uint64_t v5 = [v4 type] == 0;
  }
  else {
    uint64_t v5 = -1;
  }

  return v5;
}

- (VSDownloadService)initWithType:(unint64_t)a3 assetsManager:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VSDownloadService;
  uint64_t v8 = [(VSDownloadService *)&v17 init];
  double v9 = v8;
  if (v8)
  {
    v8->_unint64_t type = a3;
    int v10 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    updateLocuint64_t k = v9->_updateLock;
    v9->_updateLocuint64_t k = v10;

    objc_storeStrong((id *)&v9->_assetsManager, a4);
    uint64_t v12 = +[VSSiriServerConfiguration defaultConfig];
    serverConfig = v9->_serverConfig;
    v9->_serverConfig = (VSSiriServerConfiguration *)v12;

    uint64_t v14 = [MEMORY[0x263F84E68] defaultInstance];
    preferenceInterface = v9->_preferenceInterface;
    v9->_preferenceInterface = (VSPreferencesInterface *)v14;
  }
  return v9;
}

- (VSDownloadService)initWithType:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x263F84E40] sharedManager];
  id v6 = [(VSDownloadService *)self initWithType:a3 assetsManager:v5];

  return v6;
}

+ (void)triggerNeuralCompiling
{
  if ([MEMORY[0x263F84E20] useSiriTTSService])
  {
    v2 = "com.apple.sirittsd.neuralCompiling";
    v3 = &__block_literal_global_55;
  }
  else
  {
    v2 = "com.apple.voiced.neural-compiling";
    v3 = &__block_literal_global_59;
  }
  MEMORY[0x270EDBCD0](v2, v3);
}

void __43__VSDownloadService_triggerNeuralCompiling__block_invoke_57(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4[0] = 67109120;
      v4[1] = a2;
      _os_log_error_impl(&dword_226CB1000, v3, OS_LOG_TYPE_ERROR, "Triggered 'com.apple.voiced.neural-compiling' with error %d", (uint8_t *)v4, 8u);
    }
  }
}

void __43__VSDownloadService_triggerNeuralCompiling__block_invoke(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4[0] = 67109120;
      v4[1] = a2;
      _os_log_error_impl(&dword_226CB1000, v3, OS_LOG_TYPE_ERROR, "Triggered 'com.apple.sirittsd.neuralCompiling' with error %d", (uint8_t *)v4, 8u);
    }
  }
}

+ (void)removeInProgressDownloadVoiceKey:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&__inProgressDownloadVoiceKeysLock);
  uint64_t v5 = [a1 inProgressDownloadVoiceKeys];
  [v5 removeObject:v4];

  pthread_mutex_unlock(&__inProgressDownloadVoiceKeysLock);
}

+ (void)addInProgressDownloadVoiceKey:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&__inProgressDownloadVoiceKeysLock);
  uint64_t v5 = [a1 inProgressDownloadVoiceKeys];
  [v5 addObject:v4];

  pthread_mutex_unlock(&__inProgressDownloadVoiceKeysLock);
}

+ (id)inProgressDownloadVoiceKeys
{
  if (inProgressDownloadVoiceKeys_onceToken != -1) {
    dispatch_once(&inProgressDownloadVoiceKeys_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)inProgressDownloadVoiceKeys___inProgressDownloads;
  return v2;
}

uint64_t __48__VSDownloadService_inProgressDownloadVoiceKeys__block_invoke()
{
  inProgressDownloadVoiceKeys___inProgressDownloads = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9C0]);
  return MEMORY[0x270F9A758]();
}

+ (id)downloadQueue
{
  if (downloadQueue_onceToken != -1) {
    dispatch_once(&downloadQueue_onceToken, &__block_literal_global_2014);
  }
  v2 = (void *)downloadQueue_downloadQueue;
  return v2;
}

void __34__VSDownloadService_downloadQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.voiced.downloadQueue", v2);
  v1 = (void *)downloadQueue_downloadQueue;
  downloadQueue_downloadQueue = (uint64_t)v0;
}

@end