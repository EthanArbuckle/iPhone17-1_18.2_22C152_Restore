@interface VSDeviceTTSCore
- (NSError)error;
- (VSAudioData)compressedAudio;
- (VSCachingService)cachingService;
- (VSDeviceTTSCore)initWithRequest:(id)a3;
- (VSDeviceTTSCoreDelegate)delegate;
- (VSInstrumentMetrics)instrumentMetrics;
- (VSPrewarmService)prewarmService;
- (VSSpeechEngine)engine;
- (VSSpeechRequest)request;
- (VSStreamAudioData)streamAudio;
- (VSVoiceAssetSelection)selectedVoice;
- (VSVoiceBooster)voiceBooster;
- (VSVoiceResourceAsset)selectedVoiceResource;
- (id)getCacheForHash:(id)a3;
- (id)prepareForSynthesis;
- (id)taskHash;
- (id)voiceSelectionWithRequest:(id)a3 error:(id *)a4;
- (id)voiceSelection_noRetry_WithRequest:(id)a3 error:(id *)a4;
- (void)cancel;
- (void)main;
- (void)reportAudio:(id)a3;
- (void)reportProcessingWordTimingInfo:(id)a3;
- (void)reportWordTimingInfo:(id)a3;
- (void)setCachingService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEngine:(id)a3;
- (void)setError:(id)a3;
- (void)setInstrumentMetrics:(id)a3;
- (void)setPrewarmService:(id)a3;
- (void)setSelectedVoice:(id)a3;
- (void)setSelectedVoiceResource:(id)a3;
- (void)setVoiceBooster:(id)a3;
@end

@implementation VSDeviceTTSCore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceBooster, 0);
  objc_storeStrong((id *)&self->_selectedVoiceResource, 0);
  objc_storeStrong((id *)&self->_selectedVoice, 0);
  objc_storeStrong((id *)&self->_prewarmService, 0);
  objc_storeStrong((id *)&self->_cachingService, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_streamAudio, 0);
  objc_storeStrong((id *)&self->_compressedAudio, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_instrumentMetrics);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setVoiceBooster:(id)a3
{
}

- (VSVoiceBooster)voiceBooster
{
  return self->_voiceBooster;
}

- (void)setSelectedVoiceResource:(id)a3
{
}

- (void)setSelectedVoice:(id)a3
{
}

- (void)setPrewarmService:(id)a3
{
}

- (VSPrewarmService)prewarmService
{
  return self->_prewarmService;
}

- (void)setCachingService:(id)a3
{
}

- (VSCachingService)cachingService
{
  return self->_cachingService;
}

- (VSSpeechEngine)engine
{
  return self->_engine;
}

- (VSStreamAudioData)streamAudio
{
  return self->_streamAudio;
}

- (VSAudioData)compressedAudio
{
  return self->_compressedAudio;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setInstrumentMetrics:(id)a3
{
}

- (VSInstrumentMetrics)instrumentMetrics
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instrumentMetrics);
  return (VSInstrumentMetrics *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSDeviceTTSCoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSDeviceTTSCoreDelegate *)WeakRetained;
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (void)reportAudio:(id)a3
{
  id v7 = a3;
  v4 = [(VSDeviceTTSCore *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(VSDeviceTTSCore *)self delegate];
    [v6 synthesisCore:self didReceiveAudio:v7];
  }
}

- (void)reportWordTimingInfo:(id)a3
{
  id v7 = a3;
  v4 = [(VSDeviceTTSCore *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(VSDeviceTTSCore *)self delegate];
    [v6 synthesisCore:self didReceiveWordTimingInfo:v7];
  }
}

- (void)reportProcessingWordTimingInfo:(id)a3
{
  id v7 = a3;
  v4 = [(VSDeviceTTSCore *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(VSDeviceTTSCore *)self delegate];
    [v6 synthesisCore:self didReceiveProcessingWordTimingInfo:v7];
  }
}

- (id)prepareForSynthesis
{
  v51[1] = *MEMORY[0x263EF8340];
  if (self->_engine) {
    goto LABEL_3;
  }
  prewarmService = self->_prewarmService;
  v4 = [(VSDeviceTTSCore *)self selectedVoice];
  char v5 = [(VSDeviceTTSCore *)self selectedVoiceResource];
  v6 = [(VSPrewarmService *)prewarmService cachedEngineForVoice:v4 resources:v5];
  engine = self->_engine;
  self->_engine = v6;

  if (self->_engine)
  {
LABEL_3:
    v8 = [(VSDeviceTTSCore *)self instrumentMetrics];
    v9 = v8;
    uint64_t v10 = 1;
  }
  else
  {
    v40 = self->_prewarmService;
    v41 = [(VSDeviceTTSCore *)self selectedVoice];
    v42 = [(VSDeviceTTSCore *)self selectedVoiceResource];
    v43 = [(VSPrewarmService *)v40 loadEngineForVoice:v41 resources:v42];
    v44 = self->_engine;
    self->_engine = v43;

    v8 = [(VSDeviceTTSCore *)self instrumentMetrics];
    v9 = v8;
    uint64_t v10 = 0;
  }
  [v8 setIsWarmStart:v10];

  if (self->_engine)
  {
    v11 = [VSStreamAudioData alloc];
    v12 = self->_engine;
    if (v12)
    {
      [(VSSpeechEngine *)v12 asbd];
    }
    else
    {
      uint64_t v49 = 0;
      memset(v48, 0, sizeof(v48));
    }
    v16 = [(VSStreamAudioData *)v11 initWithASBD:v48];
    streamAudio = self->_streamAudio;
    self->_streamAudio = v16;

    v18 = [(VSDeviceTTSCore *)self request];
    [v18 volume];
    if (v19 == 0.0)
    {
      v20 = [(VSDeviceTTSCore *)self selectedVoiceResource];
      [v20 volume];
      if (v21 == 0.0) {
        [(VSSpeechEngine *)self->_engine volume];
      }
      -[VSSpeechEngine setVolume:](self->_engine, "setVolume:");
    }
    else
    {
      *(float *)&double v19 = v19;
      [(VSSpeechEngine *)self->_engine setVolume:v19];
    }

    v22 = [(VSDeviceTTSCore *)self request];
    [v22 pitch];
    if (v23 == 0.0)
    {
      v24 = [(VSDeviceTTSCore *)self selectedVoiceResource];
      [v24 pitch];
      if (v25 == 0.0) {
        [(VSSpeechEngine *)self->_engine pitch];
      }
      -[VSSpeechEngine setPitch:](self->_engine, "setPitch:");
    }
    else
    {
      *(float *)&double v23 = v23;
      [(VSSpeechEngine *)self->_engine setPitch:v23];
    }

    v26 = [(VSDeviceTTSCore *)self request];
    [v26 rate];
    if (v27 == 0.0)
    {
      v28 = [(VSDeviceTTSCore *)self selectedVoiceResource];
      [v28 rate];
      if (v29 == 0.0) {
        [(VSSpeechEngine *)self->_engine rate];
      }
      -[VSSpeechEngine setRate:](self->_engine, "setRate:");
    }
    else
    {
      *(float *)&double v27 = v27;
      [(VSSpeechEngine *)self->_engine setRate:v27];
    }

    v30 = [VSVoiceBooster alloc];
    v31 = self->_engine;
    if (v31)
    {
      [(VSSpeechEngine *)v31 asbd];
      v31 = self->_engine;
    }
    else
    {
      uint64_t v47 = 0;
      long long v45 = 0u;
      long long v46 = 0u;
    }
    v32 = [(VSVoiceBooster *)v30 initWithStreamDescription:&v45 pcmBufferSize:[(VSSpeechEngine *)v31 pcmBufferSize]];
    [(VSDeviceTTSCore *)self setVoiceBooster:v32];

    v14 = [(VSDeviceTTSCore *)self selectedVoice];
    v33 = [v14 voiceData];
    v34 = [(VSDeviceTTSCore *)self request];
    [v34 volume];
    objc_msgSend(v33, "gainDecibelWithVolume:");
    int v36 = v35;
    v37 = [(VSDeviceTTSCore *)self voiceBooster];
    LODWORD(v38) = v36;
    [v37 setVoiceBoostGainDecibels:v38];

    v15 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F08338];
    v51[0] = @"Can't create VSSpeechEngine";
    v14 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
    v15 = [v13 errorWithDomain:@"VoiceServicesErrorDomain" code:0 userInfo:v14];
  }

  return v15;
}

- (id)voiceSelection_noRetry_WithRequest:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F84E40] sharedManager];
  id v7 = [v5 languageCode];
  v8 = [v5 voiceName];
  v9 = objc_msgSend(v6, "selectVoiceForLang:name:type:gender:footprint:", v7, v8, objc_msgSend(v5, "voiceType"), objc_msgSend(v5, "gender"), objc_msgSend(v5, "footprint"));

  if (v9)
  {
    if ([v5 disableCompactVoiceFallback]
      && ([v9 voiceData],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 footprint],
          v10,
          v11 == 1))
    {
      v12 = VSGetLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v12, OS_LOG_TYPE_ERROR, "Compact voice is explicitly disabled.", buf, 2u);
      }

      if (a4)
      {
        v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = *MEMORY[0x263F08320];
        v33 = @"Compact voice is explicitly disabled.";
        v14 = NSDictionary;
        v15 = &v33;
        v16 = &v32;
LABEL_14:
        float v21 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
        v22 = v13;
        uint64_t v23 = 401;
LABEL_19:
        *a4 = [v22 errorWithDomain:@"VoiceServicesErrorDomain" code:v23 userInfo:v21];

        a4 = 0;
      }
    }
    else
    {
      v17 = [MEMORY[0x263F08850] defaultManager];
      v18 = [v9 voicePath];
      char v19 = [v17 fileExistsAtPath:v18];

      if (v19)
      {
        a4 = v9;
        goto LABEL_20;
      }
      v24 = VSGetLogDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        double v27 = [v9 voicePath];
        *(_DWORD *)buf = 138412290;
        v31 = v27;
        _os_log_error_impl(&dword_226CB1000, v24, OS_LOG_TYPE_ERROR, "Voice is deleted at path '%@'", buf, 0xCu);
      }
      if (a4)
      {
        float v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v28 = *MEMORY[0x263F08320];
        float v29 = @"Voice is deleted already.";
        float v21 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v22 = v25;
        uint64_t v23 = 402;
        goto LABEL_19;
      }
    }
  }
  else
  {
    v20 = VSGetLogDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_226CB1000, v20, OS_LOG_TYPE_ERROR, "No voice available", buf, 2u);
    }

    if (a4)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F08320];
      v35[0] = @"No voice available";
      v14 = NSDictionary;
      v15 = (__CFString **)v35;
      v16 = &v34;
      goto LABEL_14;
    }
  }
LABEL_20:

  return a4;
}

- (id)voiceSelectionWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v17 = 0;
  id v7 = [(VSDeviceTTSCore *)self voiceSelection_noRetry_WithRequest:v6 error:&v17];
  id v8 = v17;
  v9 = v8;
  if (v8 && [v8 code] == 402)
  {
    notify_post((const char *)[@"com.apple.voiceservices.notification.voice-update" UTF8String]);
    uint64_t v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_INFO, "Reset MobileAsset query cache and retry selecting voice", buf, 2u);
    }

    uint64_t v11 = [MEMORY[0x263F84E40] sharedManager];
    [v11 resetCache];

    id v15 = v9;
    uint64_t v12 = [(VSDeviceTTSCore *)self voiceSelection_noRetry_WithRequest:v6 error:&v15];
    id v13 = v15;

    id v7 = (void *)v12;
    v9 = v13;
  }
  if (a4) {
    *a4 = v9;
  }

  return v7;
}

- (id)getCacheForHash:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(VSDeviceTTSCore *)self cachingService];
  id v6 = [v5 inMemoryCacheForHash:v4];

  if (v6)
  {
    id v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 key];
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_226CB1000, v7, OS_LOG_TYPE_DEFAULT, "In-memory cached synthesis %@ is found.", (uint8_t *)&v14, 0xCu);
    }
    v9 = [(VSDeviceTTSCore *)self instrumentMetrics];
    [v9 setIsCacheHitFromMemory:1];
  }
  else
  {
    uint64_t v10 = [(VSDeviceTTSCore *)self cachingService];
    id v6 = [v10 onDiskCacheForHash:v4];

    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 key];
      int v14 = 138412290;
      id v15 = v12;
      _os_log_impl(&dword_226CB1000, v11, OS_LOG_TYPE_DEFAULT, "On-disk cached synthesis %@ is found.", (uint8_t *)&v14, 0xCu);
    }
    v9 = [(VSDeviceTTSCore *)self instrumentMetrics];
    [v9 setIsCacheHitFromDisk:1];
  }

LABEL_10:
  return v6;
}

- (void)setEngine:(id)a3
{
  id v5 = a3;
  if (([(VSDeviceTTSCore *)self isExecuting] & 1) == 0) {
    objc_storeStrong((id *)&self->_engine, a3);
  }
}

- (VSVoiceResourceAsset)selectedVoiceResource
{
  selectedVoiceResource = self->_selectedVoiceResource;
  if (!selectedVoiceResource)
  {
    id v4 = [MEMORY[0x263F84E40] sharedManager];
    id v5 = [(VSDeviceTTSCore *)self request];
    id v6 = [v5 languageCode];
    id v7 = [v4 selectVoiceResourceAssetForLanguage:v6];
    id v8 = self->_selectedVoiceResource;
    self->_selectedVoiceResource = v7;

    selectedVoiceResource = self->_selectedVoiceResource;
  }
  return selectedVoiceResource;
}

- (VSVoiceAssetSelection)selectedVoice
{
  selectedVoice = self->_selectedVoice;
  if (!selectedVoice)
  {
    id v4 = [(VSDeviceTTSCore *)self request];
    id v5 = [(VSDeviceTTSCore *)self voiceSelectionWithRequest:v4 error:0];
    id v6 = self->_selectedVoice;
    self->_selectedVoice = v5;

    selectedVoice = self->_selectedVoice;
  }
  return selectedVoice;
}

- (void)cancel
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)VSDeviceTTSCore;
  [(VSDeviceTTSCore *)&v5 cancel];
  v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = self;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_INFO, "Device core %p is cancelled", buf, 0xCu);
  }

  id v4 = [(VSDeviceTTSCore *)self engine];
  [v4 stopAtMarker:0];
}

- (void)main
{
  v86[1] = *MEMORY[0x263EF8340];
  v3 = [(VSDeviceTTSCore *)self request];
  id v4 = [v3 utterance];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v85 = *MEMORY[0x263F08320];
    v86[0] = @"Missing utterance in the request (preprocessing missing?).";
    id v10 = [NSDictionary dictionaryWithObjects:v86 forKeys:&v85 count:1];
    uint64_t v16 = [v15 errorWithDomain:@"VoiceServicesErrorDomain" code:100 userInfo:v10];
    [(VSDeviceTTSCore *)self setError:v16];

    goto LABEL_35;
  }
  id v6 = [(VSDeviceTTSCore *)self selectedVoiceResource];
  id v7 = [(VSDeviceTTSCore *)self selectedVoice];
  uint64_t v8 = [(VSDeviceTTSCore *)self selectedVoice];

  if (!v8)
  {
    id v17 = [(VSDeviceTTSCore *)self request];
    id v82 = 0;
    id v18 = [(VSDeviceTTSCore *)self voiceSelectionWithRequest:v17 error:&v82];
    id v10 = v82;

    [(VSDeviceTTSCore *)self setError:v10];
    goto LABEL_35;
  }
  if ([(VSDeviceTTSCore *)self isCancelled]) {
    return;
  }
  v9 = [(VSDeviceTTSCore *)self taskHash];
  id v10 = [(VSDeviceTTSCore *)self getCacheForHash:v9];

  if (!v10)
  {
    if ([(VSDeviceTTSCore *)self isCancelled])
    {
LABEL_34:
      id v10 = 0;
      goto LABEL_35;
    }
    char v19 = [(VSDeviceTTSCore *)self prepareForSynthesis];
    if (v19)
    {
      [(VSDeviceTTSCore *)self setError:v19];

      goto LABEL_34;
    }
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__1809;
    v80 = __Block_byref_object_dispose__1810;
    id v81 = 0;
    v20 = objc_opt_new();
    float v21 = [(VSDeviceTTSCore *)self request];
    v22 = [v21 text];
    uint64_t v23 = [(VSDeviceTTSCore *)self request];
    v24 = [v23 languageCode];
    float v25 = [(VSDeviceTTSCore *)self request];
    v26 = [v25 voiceName];
    uint64_t v27 = [v20 estimatedTTSWordTimingForText:v22 withLanguage:v24 voiceName:v26];
    uint64_t v28 = (void *)v77[5];
    v77[5] = v27;

    float v29 = (void *)MEMORY[0x263F84EB0];
    uint64_t v30 = v77[5];
    v31 = [(VSDeviceTTSCore *)self request];
    uint64_t v32 = [v31 contextInfo];
    [v29 adjustWordTimingInfo:v30 forContext:v32];

    v33 = [MEMORY[0x263EFF980] array];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v34 = [(VSDeviceTTSCore *)self request];
    int v35 = [v34 customResourceURLs];

    uint64_t v36 = [v35 countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v73;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v73 != v37) {
            objc_enumerationMutation(v35);
          }
          uint64_t v39 = *(void *)(*((void *)&v72 + 1) + 8 * v38);
          v40 = [(VSDeviceTTSCore *)self engine];
          v41 = [v40 loadResource:v39 error:0];

          if (v41) {
            [v33 addObject:v41];
          }

          ++v38;
        }
        while (v36 != v38);
        uint64_t v36 = [v35 countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v36);
    }

    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2020000000;
    char v71 = 0;
    v42 = [(VSDeviceTTSCore *)self engine];
    v43 = [(VSDeviceTTSCore *)self request];
    v44 = [v43 utterance];
    long long v45 = [(VSDeviceTTSCore *)self request];
    uint64_t v46 = [v45 canLogRequestText];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __23__VSDeviceTTSCore_main__block_invoke;
    v67[3] = &unk_2647DCA78;
    v67[4] = self;
    v67[5] = &v76;
    v67[6] = &v68;
    uint64_t v47 = [v42 synthesizeText:v44 loggable:v46 callback:v67];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v48 = v33;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v63 objects:v83 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v64;
      do
      {
        uint64_t v51 = 0;
        do
        {
          if (*(void *)v64 != v50) {
            objc_enumerationMutation(v48);
          }
          uint64_t v52 = *(void *)(*((void *)&v63 + 1) + 8 * v51);
          v53 = [(VSDeviceTTSCore *)self engine];
          [v53 unloadResource:v52];

          ++v51;
        }
        while (v49 != v51);
        uint64_t v49 = [v48 countByEnumeratingWithState:&v63 objects:v83 count:16];
      }
      while (v49);
    }

    if (!v47 && ([(VSDeviceTTSCore *)self isCancelled] & 1) == 0)
    {
      v54 = [(VSDeviceTTSCore *)self request];
      if (![v54 shouldCache])
      {
LABEL_32:

        goto LABEL_33;
      }
      BOOL v55 = *((unsigned char *)v69 + 24) == 0;

      if (v55)
      {
        v54 = [(VSDeviceTTSCore *)self taskHash];
        v62 = [(VSDeviceTTSCore *)self cachingService];
        streamAudio = self->_streamAudio;
        uint64_t v57 = v77[5];
        v58 = [(VSDeviceTTSCore *)self selectedVoice];
        v59 = [v58 key];
        v60 = [(VSDeviceTTSCore *)self selectedVoiceResource];
        v61 = [v60 key];
        [v62 enqueueCacheWithHash:v54 streamAudio:streamAudio timingInfo:v57 voiceKey:v59 voiceResourceKey:v61 completion:0];

        goto LABEL_32;
      }
    }
LABEL_33:
    [(VSDeviceTTSCore *)self setError:v47];
    _Block_object_dispose(&v68, 8);

    _Block_object_dispose(&v76, 8);
    goto LABEL_34;
  }
  uint64_t v11 = [v10 audio];
  compressedAudio = self->_compressedAudio;
  self->_compressedAudio = v11;

  id v13 = [v10 timingInfos];
  [(VSDeviceTTSCore *)self reportWordTimingInfo:v13];

  int v14 = [v10 audio];
  [(VSDeviceTTSCore *)self reportAudio:v14];

LABEL_35:
}

id __23__VSDeviceTTSCore_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  if (v4 == 3)
  {
    if ([v3 neuralDidFallback]) {
      char v9 = 1;
    }
    else {
      char v9 = [v3 hasAudioClick];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
    uint64_t v10 = [v3 numOfPromptsTriggered];
    uint64_t v11 = [*(id *)(a1 + 32) instrumentMetrics];
    [v11 setPromptCount:v10];

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v12)
    {
      uint64_t v13 = [v3 wordTimingInfos];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      uint64_t v16 = (void *)MEMORY[0x263F84EB0];
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v18 = [*(id *)(a1 + 32) request];
      char v19 = [v18 contextInfo];
      [v16 adjustWordTimingInfo:v17 forContext:v19];

      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [*(id *)(a1 + 32) reportWordTimingInfo:v12];
    uint64_t v20 = [v3 hasAlignmentStall];
    float v21 = [*(id *)(a1 + 32) instrumentMetrics];
    [v21 setNeuralAlignmentStall:v20];

    uint64_t v22 = [v3 hasAudioClick];
    uint64_t v23 = [*(id *)(a1 + 32) instrumentMetrics];
    [v23 setNeuralAudioClick:v22];

    uint64_t v24 = [v3 neuralDidFallback];
    float v25 = [*(id *)(a1 + 32) instrumentMetrics];
    [v25 setNeuralFallback:v24];
  }
  else if (v4 == 2)
  {
    uint64_t v5 = (void *)MEMORY[0x22A667AA0]();
    id v6 = [v3 mutablePCMData];
    id v7 = [*(id *)(a1 + 32) voiceBooster];
    uint64_t v8 = [v7 processData:v6];

    if (v8)
    {

      goto LABEL_18;
    }
    v26 = [*(id *)(a1 + 32) streamAudio];
    [v26 appendAudioData:v6 packetCount:0 packetDescriptions:0];

    id v27 = objc_alloc_init(MEMORY[0x263F84E18]);
    uint64_t v28 = [*(id *)(a1 + 32) engine];
    float v29 = v28;
    if (v28)
    {
      [v28 asbd];
    }
    else
    {
      uint64_t v41 = 0;
      long long v39 = 0u;
      long long v40 = 0u;
    }
    v37[0] = v39;
    v37[1] = v40;
    uint64_t v38 = v41;
    [v27 setAsbd:v37];

    [v27 setAudioData:v6];
    [v27 setPacketCount:0];
    [v27 setPacketDescriptions:0];
    [*(id *)(a1 + 32) reportAudio:v27];
    id v30 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v30)
    {
      id v31 = objc_alloc(MEMORY[0x263EFF8C0]);
      uint64_t v32 = [v3 wordTimingInfos];
      id v30 = (id)[v31 initWithArray:v32 copyItems:1];

      v33 = (void *)MEMORY[0x263F84EB0];
      uint64_t v34 = [*(id *)(a1 + 32) request];
      int v35 = [v34 contextInfo];
      [v33 adjustWordTimingInfo:v30 forContext:v35];
    }
    [*(id *)(a1 + 32) reportProcessingWordTimingInfo:v30];
  }
  uint64_t v8 = 0;
LABEL_18:

  return v8;
}

- (id)taskHash
{
  uint64_t v22 = NSString;
  float v25 = [(VSDeviceTTSCore *)self request];
  uint64_t v20 = [v25 utterance];
  uint64_t v24 = [(VSDeviceTTSCore *)self selectedVoice];
  id v3 = [v24 key];
  uint64_t v23 = [(VSDeviceTTSCore *)self selectedVoiceResource];
  uint64_t v4 = [v23 key];
  float v21 = [(VSDeviceTTSCore *)self request];
  [v21 rate];
  uint64_t v6 = v5;
  id v7 = [(VSDeviceTTSCore *)self request];
  [v7 pitch];
  uint64_t v9 = v8;
  uint64_t v10 = [(VSDeviceTTSCore *)self request];
  [v10 volume];
  uint64_t v12 = v11;
  uint64_t v13 = [(VSDeviceTTSCore *)self request];
  uint64_t v14 = [v13 contextInfo];
  id v15 = [(VSDeviceTTSCore *)self request];
  uint64_t v16 = [v15 customResourceURLs];
  uint64_t v17 = [v22 stringWithFormat:@"%@ %@ %@ %@ %.2f %.2f %.2f %@ %@", @"2", v20, v3, v4, v6, v9, v12, v14, v16];

  id v18 = [v17 sha256hex];

  return v18;
}

- (VSDeviceTTSCore)initWithRequest:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSDeviceTTSCore;
  uint64_t v6 = [(VSDeviceTTSCore *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    uint64_t v8 = +[VSCachingService standardService];
    cachingService = v7->_cachingService;
    v7->_cachingService = (VSCachingService *)v8;

    uint64_t v10 = +[VSPrewarmService sharedService];
    prewarmService = v7->_prewarmService;
    v7->_prewarmService = (VSPrewarmService *)v10;
  }
  return v7;
}

@end