@interface VSPrewarmService
+ (id)sharedService;
- (OS_dispatch_queue)prewarmQueue;
- (VSPrewarmService)init;
- (VSSpeechEngine)cachedEngine;
- (VSVoiceResourceAsset)loadedResources;
- (id)_cachedEngineForVoice:(id)a3 resources:(id)a4;
- (id)_engineForVoice:(id)a3 resources:(id)a4;
- (id)cachedEngineForVoice:(id)a3 resources:(id)a4;
- (id)loadEngineForVoice:(id)a3 resources:(id)a4;
- (int64_t)activeSessionCount;
- (void)_loadVoiceResources:(id)a3 forEngine:(id)a4;
- (void)handleVoiceSelectionPurge:(id)a3;
- (void)prewarmWithRequest:(id)a3;
- (void)setActiveSessionCount:(int64_t)a3;
- (void)setCachedEngine:(id)a3;
- (void)setLoadedResources:(id)a3;
- (void)setPrewarmQueue:(id)a3;
- (void)unloadCachedEngineWithVoice:(id)a3;
- (void)unloadEngine;
- (void)waitUntilPrewarmFinish;
@end

@implementation VSPrewarmService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmQueue, 0);
  objc_storeStrong((id *)&self->_loadedResources, 0);
  objc_storeStrong((id *)&self->_cachedEngine, 0);
}

- (void)setPrewarmQueue:(id)a3
{
}

- (OS_dispatch_queue)prewarmQueue
{
  return self->_prewarmQueue;
}

- (void)setLoadedResources:(id)a3
{
}

- (VSVoiceResourceAsset)loadedResources
{
  return self->_loadedResources;
}

- (void)setCachedEngine:(id)a3
{
}

- (VSSpeechEngine)cachedEngine
{
  return self->_cachedEngine;
}

- (int64_t)activeSessionCount
{
  return self->_activeSessionCount;
}

- (void)waitUntilPrewarmFinish
{
}

- (void)unloadEngine
{
  v3 = [(VSPrewarmService *)self prewarmQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__VSPrewarmService_unloadEngine__block_invoke;
  block[3] = &unk_2647DCD78;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __32__VSPrewarmService_unloadEngine__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCachedEngine:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setLoadedResources:0];
}

- (void)_loadVoiceResources:(id)a3 forEngine:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v26 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmQueue);
  v7 = [v6 searchPathURL];
  v8 = [v7 path];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v27 = v6;
  v9 = [v6 resourceList];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v29;
    *(void *)&long long v11 = 138412546;
    long long v25 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v16 = objc_msgSend(v8, "stringByAppendingPathComponent:", v15, v25);
        v17 = [MEMORY[0x263F08850] defaultManager];
        char v18 = [v17 fileExistsAtPath:v16];

        if (v18)
        {
          v19 = [v27 resourceMimeTypes];
          v20 = [v19 objectForKeyedSubscript:v15];

          if (([v20 isEqualToString:@"VoiceServices/config"] & 1) == 0
            && ([v20 isEqualToString:@"gryphon_frontend"] & 1) == 0)
          {
            id v21 = (id)[v26 loadResourceAtPath:v16 mimeType:v20 error:0];
          }
        }
        else
        {
          v20 = VSGetLogDefault();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            uint64_t v33 = v15;
            __int16 v34 = 2112;
            v35 = v16;
            _os_log_error_impl(&dword_226CB1000, v20, OS_LOG_TYPE_ERROR, "Specified resource file '%@' does not exist at: '%@'", buf, 0x16u);
          }
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v12);
  }

  [v27 pitch];
  if (v22 == 0.0) {
    [v26 pitch];
  }
  objc_msgSend(v26, "setPitch:");
  [v27 rate];
  if (v23 == 0.0) {
    [v26 rate];
  }
  objc_msgSend(v26, "setRate:");
  [v27 volume];
  if (v24 == 0.0) {
    [v26 volume];
  }
  objc_msgSend(v26, "setVolume:");
}

- (void)unloadCachedEngineWithVoice:(id)a3
{
  id v4 = a3;
  v5 = [(VSPrewarmService *)self prewarmQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__VSPrewarmService_unloadCachedEngineWithVoice___block_invoke;
  v7[3] = &unk_2647DCED8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __48__VSPrewarmService_unloadCachedEngineWithVoice___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    v3 = [v2 voicePath];
    id v4 = [*(id *)(a1 + 40) voicePath];
    int v5 = [v3 isEqualToString:v4];

    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(void **)(v6 + 16);
      *(void *)(v6 + 16) = 0;

      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 24);
      *(void *)(v8 + 24) = 0;
    }
  }
}

- (id)loadEngineForVoice:(id)a3 resources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3201;
  id v21 = __Block_byref_object_dispose__3202;
  id v22 = 0;
  uint64_t v8 = [(VSPrewarmService *)self prewarmQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__VSPrewarmService_loadEngineForVoice_resources___block_invoke;
  v13[3] = &unk_2647DCCB8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __49__VSPrewarmService_loadEngineForVoice_resources___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[2];
  if (v3)
  {
    id v4 = [v2 _cachedEngineForVoice:*(void *)(a1 + 40) resources:*(void *)(a1 + 48)];
    int v5 = *(void **)(*(void *)(a1 + 32) + 16);

    if (v4 == v5) {
      return;
    }
    v2 = *(void **)(a1 + 32);
    v3 = (void *)v2[2];
  }
  v2[2] = 0;

  uint64_t v6 = [*(id *)(a1 + 32) _engineForVoice:*(void *)(a1 + 40) resources:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (![MEMORY[0x263F84E20] lowInactiveMemory]
    || (id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) == 0
    || (uint64_t v10 = *(void *)(a1 + 32), *(uint64_t *)(v10 + 8) <= 0))
  {
    if ([MEMORY[0x263F84E20] lowInactiveMemory]) {
      return;
    }
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v9) {
      return;
    }
    uint64_t v10 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v10 + 16), v9);
  id v11 = *(void **)(a1 + 48);
  uint64_t v12 = (id *)(*(void *)(a1 + 32) + 24);
  objc_storeStrong(v12, v11);
}

- (id)_engineForVoice:(id)a3 resources:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmQueue);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v8 = [v7 resourceMimeTypes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v40 = self;
    uint64_t v11 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        id v14 = [v7 resourceMimeTypes];
        id v15 = [v14 objectForKeyedSubscript:v13];

        if ([v15 isEqualToString:@"gryphon_frontend"])
        {
          uint64_t v17 = [v7 searchPathURL];
          char v18 = [v17 path];
          v16 = [v18 stringByAppendingPathComponent:v13];

          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    v16 = 0;
LABEL_11:
    self = v40;
  }
  else
  {
    v16 = 0;
  }

  id v19 = objc_alloc(MEMORY[0x263F84E88]);
  v20 = [v6 voicePath];
  id v21 = (void *)[v19 initWithVoicePath:v20 resourcePath:v16];

  if (v21)
  {
    if (v7) {
      [(VSPrewarmService *)self _loadVoiceResources:v7 forEngine:v21];
    }
    id v22 = NSURL;
    float v23 = [v6 voicePath];
    uint64_t v24 = *MEMORY[0x263F84F18];
    v45[0] = v23;
    v45[1] = v24;
    long long v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
    id v26 = [v22 fileURLWithPathComponents:v25];

    v27 = [MEMORY[0x263F08850] defaultManager];
    long long v28 = [v26 path];
    int v29 = [v27 fileExistsAtPath:v28];

    if (v29)
    {
      long long v30 = VSGetLogDefault();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_226CB1000, v30, OS_LOG_TYPE_DEBUG, "Voice specific resources found.", buf, 2u);
      }

      id v31 = objc_alloc_init(MEMORY[0x263F84ED0]);
      v32 = NSURL;
      uint64_t v33 = [v6 voicePath];
      __int16 v34 = [v32 fileURLWithPath:v33];
      [v31 setSearchPathURL:v34];

      [(VSPrewarmService *)self _loadVoiceResources:v31 forEngine:v21];
    }
    id v35 = v21;
  }
  else
  {
    v36 = VSGetLogDefault();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v39 = [v6 voicePath];
      *(_DWORD *)buf = 138412290;
      v47 = v39;
      _os_log_error_impl(&dword_226CB1000, v36, OS_LOG_TYPE_ERROR, "Can't create engine with path '%@'", buf, 0xCu);
    }
    id v26 = [MEMORY[0x263F84E40] sharedManager];
    id v37 = (id)[v26 purgeAsset:v6];
  }

  return v21;
}

- (id)cachedEngineForVoice:(id)a3 resources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3201;
  id v21 = __Block_byref_object_dispose__3202;
  id v22 = 0;
  uint64_t v8 = [(VSPrewarmService *)self prewarmQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__VSPrewarmService_cachedEngineForVoice_resources___block_invoke;
  v13[3] = &unk_2647DCCB8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __51__VSPrewarmService_cachedEngineForVoice_resources___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _cachedEngineForVoice:*(void *)(a1 + 40) resources:*(void *)(a1 + 48)];
  return MEMORY[0x270F9A758]();
}

- (id)_cachedEngineForVoice:(id)a3 resources:(id)a4
{
  id v6 = a4;
  prewarmQueue = self->_prewarmQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(prewarmQueue);
  id v9 = [(VSSpeechEngine *)self->_cachedEngine voicePath];
  id v10 = [v8 voicePath];

  if ([v9 isEqualToString:v10])
  {
    id v11 = [(VSVoiceResourceAsset *)self->_loadedResources key];
    uint64_t v12 = [v6 key];
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      id v14 = self->_cachedEngine;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v14 = 0;
LABEL_6:

  return v14;
}

- (void)prewarmWithRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(VSPrewarmService *)self prewarmQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__VSPrewarmService_prewarmWithRequest___block_invoke;
  v7[3] = &unk_2647DCED8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __39__VSPrewarmService_prewarmWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v27 = *(NSObject **)(a1 + 32);
    int v31 = 138412290;
    v32 = v27;
    _os_log_debug_impl(&dword_226CB1000, v2, OS_LOG_TYPE_DEBUG, "Prewarming: Invoked with request: '%@'", (uint8_t *)&v31, 0xCu);
  }

  kdebug_trace();
  mach_absolute_time();
  v3 = +[OspreyTTSService sharedInstance];
  [v3 initializeDeviceAuthenticationSessionWithCompletion:&__block_literal_global_28];

  id v4 = [[VSSpeechSpeakTask alloc] initWithRequest:*(void *)(a1 + 32)];
  [(VSSpeechSpeakTask *)v4 fetchVoiceAsset];
  [(VSSpeechSpeakTask *)v4 fetchVoiceResource];
  int v5 = [(VSSpeechSpeakTask *)v4 error];

  if (v5)
  {
    id v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(VSSpeechSpeakTask *)v4 error];
      int v31 = 138412290;
      v32 = v7;
      _os_log_error_impl(&dword_226CB1000, v6, OS_LOG_TYPE_ERROR, "Unable to prewarm, error: %@", (uint8_t *)&v31, 0xCu);
LABEL_19:
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [(VSSpeechSpeakTask *)v4 voiceSelection];
    id v10 = [(VSSpeechSpeakTask *)v4 voiceResource];
    id v6 = [v8 _cachedEngineForVoice:v9 resources:v10];

    if (!v6)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void **)(v11 + 16);
      *(void *)(v11 + 16) = 0;

      int v13 = *(void **)(a1 + 40);
      id v14 = [(VSSpeechSpeakTask *)v4 voiceSelection];
      id v15 = [(VSSpeechSpeakTask *)v4 voiceResource];
      id v6 = [v13 _engineForVoice:v14 resources:v15];

      if (!v6)
      {
        id v7 = VSGetLogDefault();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v29 = [(VSSpeechSpeakTask *)v4 voiceSelection];
          long long v30 = [v29 voicePath];
          int v31 = 138412290;
          v32 = v30;
          _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "Can't prewarm engine with path '%@'", (uint8_t *)&v31, 0xCu);
        }
        id v6 = 0;
        goto LABEL_19;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), v6);
      uint64_t v16 = [(VSSpeechSpeakTask *)v4 voiceResource];
      uint64_t v17 = *(void *)(a1 + 40);
      char v18 = *(void **)(v17 + 24);
      *(void *)(v17 + 24) = v16;

      uint64_t v19 = [*(id *)(a1 + 32) languageCode];
      id v20 = (id)objc_msgSend(@"Prewarm textify emoji", "vs_textifyEmojiWithLanguage:", v19);
    }
    [v6 preheat];
    mach_absolute_time();
    id v21 = VSGetLogDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      VSAbsoluteTimeToSecond();
      int v31 = 134217984;
      v32 = v22;
      _os_log_impl(&dword_226CB1000, v21, OS_LOG_TYPE_INFO, "Prewarm finished. Latency: %.3f", (uint8_t *)&v31, 0xCu);
    }

    float v23 = VSGetLogDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      long long v28 = *(NSObject **)(a1 + 32);
      int v31 = 138412290;
      v32 = v28;
      _os_log_debug_impl(&dword_226CB1000, v23, OS_LOG_TYPE_DEBUG, "Prewarming: Completed with request: '%@'", (uint8_t *)&v31, 0xCu);
    }

    kdebug_trace();
    if ([MEMORY[0x263F84E20] lowInactiveMemory])
    {
      uint64_t v24 = *(void *)(a1 + 40);
      if (!*(void *)(v24 + 8))
      {
        long long v25 = *(void **)(v24 + 16);
        *(void *)(v24 + 16) = 0;

        uint64_t v26 = *(void *)(a1 + 40);
        id v7 = *(NSObject **)(v26 + 24);
        *(void *)(v26 + 24) = 0;
        goto LABEL_19;
      }
    }
  }
}

void __39__VSPrewarmService_prewarmWithRequest___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = VSGetLogDefault();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_226CB1000, v4, OS_LOG_TYPE_ERROR, "Unable to initialize Device Authentication session: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_226CB1000, v4, OS_LOG_TYPE_INFO, "Device Authentication session is initialized", (uint8_t *)&v5, 2u);
  }
}

- (void)setActiveSessionCount:(int64_t)a3
{
  self->_activeSessionCount = a3 & ~(a3 >> 63);
  if (a3 <= 0) {
    [(VSPrewarmService *)self unloadEngine];
  }
}

- (void)handleVoiceSelectionPurge:(id)a3
{
  id v8 = [a3 object];
  id v4 = [v8 voicePath];
  int v5 = [(VSPrewarmService *)self cachedEngine];
  id v6 = [v5 voicePath];
  int v7 = [v4 isEqualToString:v6];

  if (v7) {
    [(VSPrewarmService *)self unloadEngine];
  }
}

- (VSPrewarmService)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSPrewarmService;
  id v2 = [(VSPrewarmService *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.voiced.prewarmQueue", v3);
    prewarmQueue = v2->_prewarmQueue;
    v2->_prewarmQueue = (OS_dispatch_queue *)v4;

    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_handleVoiceSelectionPurge_ name:@"com.apple.voiceservices.notification.voice-purge" object:0];
  }
  return v2;
}

+ (id)sharedService
{
  if (sharedService_onceToken_3235 != -1) {
    dispatch_once(&sharedService_onceToken_3235, &__block_literal_global_3236);
  }
  id v2 = (void *)sharedService___prewarmService;
  return v2;
}

uint64_t __33__VSPrewarmService_sharedService__block_invoke()
{
  sharedService___prewarmService = objc_alloc_init(VSPrewarmService);
  return MEMORY[0x270F9A758]();
}

@end