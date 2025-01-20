@interface VSSpeechSpeakTask
- (BOOL)isSpeaking;
- (BOOL)synthesisHasIssue;
- (NSArray)phonemes;
- (NSArray)timingInfos;
- (NSError)error;
- (OS_dispatch_queue)taskAuxiliaryQueue;
- (OS_dispatch_semaphore)neuralPlaybackSemaphore;
- (VSAudioData)compressedAudio;
- (VSAudioPlaybackService)playbackService;
- (VSCachingService)cachingService;
- (VSInstrumentMetrics)instrumentMetrics;
- (VSPrewarmService)prewarmService;
- (VSSiriInstrumentation)siriInstrumentation;
- (VSSpeechCacheItem)speechCache;
- (VSSpeechEngine)engine;
- (VSSpeechRequest)request;
- (VSSpeechServiceDelegate)delegate;
- (VSSpeechSpeakTask)init;
- (VSSpeechSpeakTask)initWithRequest:(id)a3;
- (VSStreamAudioData)streamAudio;
- (VSVoiceAssetSelection)voiceSelection;
- (VSVoiceBooster)voiceBooster;
- (VSVoiceResourceAsset)voiceResource;
- (id)_fetchVoiceAsset_NoRetry;
- (id)audioPowerProvider;
- (id)taskHash;
- (void)cancel;
- (void)enqueueCache;
- (void)fetchVoiceAsset;
- (void)fetchVoiceResource;
- (void)logFinish;
- (void)main;
- (void)pausePlayback;
- (void)prepareForSynthesis;
- (void)reportFinish;
- (void)reportInstrumentMetrics;
- (void)reportSpeechStart;
- (void)reportTimingInfo;
- (void)resumePlayback;
- (void)setCachingService:(id)a3;
- (void)setCompressedAudio:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEngine:(id)a3;
- (void)setError:(id)a3;
- (void)setInstrumentMetrics:(id)a3;
- (void)setNeuralPlaybackSemaphore:(id)a3;
- (void)setObserverForWordTimings:(id)a3;
- (void)setPhonemes:(id)a3;
- (void)setPlaybackService:(id)a3;
- (void)setPrewarmService:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSiriInstrumentation:(id)a3;
- (void)setSpeechCache:(id)a3;
- (void)setStreamAudio:(id)a3;
- (void)setSynthesisHasIssue:(BOOL)a3;
- (void)setTaskAuxiliaryQueue:(id)a3;
- (void)setTimingInfos:(id)a3;
- (void)setVoiceBooster:(id)a3;
- (void)setVoiceResource:(id)a3;
- (void)setVoiceSelection:(id)a3;
- (void)speakCachedAudio;
- (void)startPlaybackServiceWithAudioSessionID:(unsigned int)a3;
- (void)synthesizeAndSpeak;
- (void)waitUntilAudioFinished;
@end

@implementation VSSpeechSpeakTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neuralPlaybackSemaphore, 0);
  objc_storeStrong((id *)&self->_taskAuxiliaryQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_streamAudio, 0);
  objc_storeStrong((id *)&self->_compressedAudio, 0);
  objc_storeStrong((id *)&self->_phonemes, 0);
  objc_storeStrong((id *)&self->_speechCache, 0);
  objc_storeStrong((id *)&self->_siriInstrumentation, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_prewarmService, 0);
  objc_storeStrong((id *)&self->_cachingService, 0);
  objc_storeStrong((id *)&self->_voiceResource, 0);
  objc_storeStrong((id *)&self->_voiceSelection, 0);
  objc_storeStrong((id *)&self->_playbackService, 0);
  objc_storeStrong((id *)&self->_voiceBooster, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timingInfos, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setNeuralPlaybackSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)neuralPlaybackSemaphore
{
  return self->_neuralPlaybackSemaphore;
}

- (void)setTaskAuxiliaryQueue:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setStreamAudio:(id)a3
{
}

- (VSStreamAudioData)streamAudio
{
  return self->_streamAudio;
}

- (void)setCompressedAudio:(id)a3
{
}

- (VSAudioData)compressedAudio
{
  return self->_compressedAudio;
}

- (void)setPhonemes:(id)a3
{
}

- (NSArray)phonemes
{
  return self->_phonemes;
}

- (void)setSpeechCache:(id)a3
{
}

- (VSSpeechCacheItem)speechCache
{
  return self->_speechCache;
}

- (void)setSiriInstrumentation:(id)a3
{
}

- (VSSiriInstrumentation)siriInstrumentation
{
  return self->_siriInstrumentation;
}

- (void)setInstrumentMetrics:(id)a3
{
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setSynthesisHasIssue:(BOOL)a3
{
  self->_synthesisHasIssue = a3;
}

- (BOOL)synthesisHasIssue
{
  return self->_synthesisHasIssue;
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

- (void)setVoiceResource:(id)a3
{
}

- (VSVoiceResourceAsset)voiceResource
{
  return self->_voiceResource;
}

- (void)setVoiceSelection:(id)a3
{
}

- (VSVoiceAssetSelection)voiceSelection
{
  return self->_voiceSelection;
}

- (void)setPlaybackService:(id)a3
{
}

- (VSAudioPlaybackService)playbackService
{
  return self->_playbackService;
}

- (void)setVoiceBooster:(id)a3
{
}

- (VSVoiceBooster)voiceBooster
{
  return self->_voiceBooster;
}

- (void)setEngine:(id)a3
{
}

- (VSSpeechEngine)engine
{
  return self->_engine;
}

- (void)setDelegate:(id)a3
{
}

- (VSSpeechServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSSpeechServiceDelegate *)WeakRetained;
}

- (void)setTimingInfos:(id)a3
{
}

- (NSArray)timingInfos
{
  return self->_timingInfos;
}

- (void)setRequest:(id)a3
{
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (id)audioPowerProvider
{
  v2 = [(VSSpeechSpeakTask *)self playbackService];
  v3 = [v2 audioPowerProvider];

  return v3;
}

- (void)reportTimingInfo
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(VSSpeechSpeakTask *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(VSSpeechSpeakTask *)self delegate];
    v6 = [(VSSpeechSpeakTask *)self request];
    v7 = [(VSSpeechSpeakTask *)self timingInfos];
    [v5 speechRequest:v6 didReceiveTimingInfo:v7];

    v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      int v10 = 134217984;
      uint64_t v11 = [v9 requestCreatedTimestamp];
      _os_log_debug_impl(&dword_226CB1000, v8, OS_LOG_TYPE_DEBUG, "Task %llu reported word time info", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)setObserverForWordTimings:(id)a3
{
  id v4 = a3;
  v5 = [(VSSpeechSpeakTask *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    v7 = [(VSSpeechSpeakTask *)self playbackService];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__VSSpeechSpeakTask_setObserverForWordTimings___block_invoke;
    v8[3] = &unk_2647DCC70;
    objc_copyWeak(&v9, &location);
    [v7 setBoundaryTimeObserverForTimingInfos:v4 usingBlock:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __47__VSSpeechSpeakTask_setObserverForWordTimings___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained delegate];
    char v6 = [v4 request];
    uint64_t v7 = [v9 textRange];
    objc_msgSend(v5, "speechRequest:didStartWithMark:forRange:", v6, 1, v7, v8);
  }
}

- (void)reportSpeechStart
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [(VSSpeechSpeakTask *)self instrumentMetrics];
  uint64_t v4 = [v3 speechBeginTimestamp];

  if (!v4)
  {
    kdebug_trace();
    uint64_t v5 = mach_absolute_time();
    uint64_t v6 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [(id)v6 setSpeechBeginTimestamp:v5];

    uint64_t v7 = [(VSSpeechSpeakTask *)self delegate];
    LOBYTE(v6) = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v8 = [(VSSpeechSpeakTask *)self delegate];
      id v9 = [(VSSpeechSpeakTask *)self request];
      [v8 speechRequestDidStart:v9];

      int v10 = VSGetLogDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v23 = [(VSSpeechSpeakTask *)self instrumentMetrics];
        *(_DWORD *)buf = 134217984;
        uint64_t v36 = [v23 requestCreatedTimestamp];
        _os_log_debug_impl(&dword_226CB1000, v10, OS_LOG_TYPE_DEBUG, "Task %llu started speaking", buf, 0xCu);
      }
    }
    uint64_t v11 = [(VSSpeechSpeakTask *)self siriInstrumentation];
    v34 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v12 = [v34 sourceOfTTS];
    v33 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v33 timeToSpeakLatency];
    double v14 = v13;
    v32 = [(VSSpeechSpeakTask *)self playbackService];
    v27 = [v32 outputRouteInfo];
    v31 = [(VSSpeechSpeakTask *)self voiceSelection];
    v30 = [v31 voiceData];
    uint64_t v26 = [v30 type];
    v29 = [(VSSpeechSpeakTask *)self voiceSelection];
    v28 = [v29 voiceData];
    uint64_t v25 = [v28 footprint];
    v15 = [(VSSpeechSpeakTask *)self voiceSelection];
    v16 = [v15 voiceData];
    v17 = [v16 contentVersion];
    uint64_t v18 = [v17 unsignedIntegerValue];
    v19 = [(VSSpeechSpeakTask *)self voiceResource];
    v20 = [v19 contentVersion];
    uint64_t v21 = [v20 unsignedIntegerValue];
    v22 = [(VSSpeechSpeakTask *)self request];
    LOBYTE(v24) = [v22 shouldWhisper];
    [v11 instrumentSpeechStartedWithSource:v12 customerPerceivedLatency:v27 audioOutputRoute:v26 voiceType:v25 voiceFootprint:v18 voiceVersion:v21 resourceVersion:v14 isWhisper:v24];
  }
}

- (void)reportFinish
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v3 = [(VSSpeechSpeakTask *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(VSSpeechSpeakTask *)self delegate];
    uint64_t v6 = [(VSSpeechSpeakTask *)self request];
    uint64_t v7 = [(VSSpeechSpeakTask *)self isCancelled] ^ 1;
    uint64_t v8 = [(VSSpeechSpeakTask *)self phonemes];
    id v9 = [v8 componentsJoinedByString:@" "];
    int v10 = [(VSSpeechSpeakTask *)self error];
    [v5 speechRequest:v6 didStopWithSuccess:v7 phonemesSpoken:v9 error:v10];

    uint64_t v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v49 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      uint64_t v50 = [v49 requestCreatedTimestamp];
      v51 = [(VSSpeechSpeakTask *)self error];
      *(_DWORD *)buf = 134218242;
      uint64_t v59 = v50;
      __int16 v60 = 2112;
      v61 = v51;
      _os_log_debug_impl(&dword_226CB1000, v11, OS_LOG_TYPE_DEBUG, "Task %llu reported finish, error: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = (void *)MEMORY[0x263F84E10];
  double v13 = [(VSSpeechSpeakTask *)self instrumentMetrics];
  [v12 reportInstrumentMetrics:v13];

  uint64_t v14 = [(VSSpeechSpeakTask *)self error];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(VSSpeechSpeakTask *)self error];
    if ([v16 code] == 400)
    {
    }
    else
    {
      v17 = [(VSSpeechSpeakTask *)self error];
      uint64_t v18 = [v17 code];

      if (v18 != 501)
      {
        v32 = [(VSSpeechSpeakTask *)self siriInstrumentation];
        v45 = NSNumber;
        v46 = [(VSSpeechSpeakTask *)self error];
        v47 = objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "code"));
        v57 = v47;
        v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
        [v32 instrumentSpeechFailedWithErrorCodes:v48];

        goto LABEL_21;
      }
    }
  }
  v19 = [(VSSpeechSpeakTask *)self voiceSelection];
  v20 = [v19 voiceData];
  uint64_t v21 = [v20 languages];
  v22 = [v21 firstObject];
  v23 = [(VSSpeechSpeakTask *)self request];
  uint64_t v24 = [v23 languageCode];
  if (![v22 isEqualToString:v24])
  {

    goto LABEL_14;
  }
  uint64_t v25 = [(VSSpeechSpeakTask *)self request];
  uint64_t v26 = [v25 voiceName];
  if (!v26)
  {

    goto LABEL_16;
  }
  v55 = (void *)v26;
  v54 = [(VSSpeechSpeakTask *)self request];
  v27 = [v54 voiceName];
  v52 = [(VSSpeechSpeakTask *)self voiceSelection];
  [v52 voiceData];
  v28 = v53 = v25;
  v29 = [v28 name];
  char v56 = [v27 isEqualToString:v29];

  if ((v56 & 1) == 0)
  {
LABEL_14:
    v19 = [(VSSpeechSpeakTask *)self siriInstrumentation];
    v20 = [(VSSpeechSpeakTask *)self voiceSelection];
    uint64_t v21 = [v20 voiceData];
    v22 = [(VSSpeechSpeakTask *)self voiceResource];
    [v19 instrumentVoiceFallbackOccurredWithVoice:v21 resource:v22];
LABEL_16:
  }
  int v30 = [(VSSpeechSpeakTask *)self isCancelled];
  v31 = [(VSSpeechSpeakTask *)self siriInstrumentation];
  v32 = v31;
  if (v30)
  {
    [v31 instrumentSpeechCancelled];
  }
  else
  {
    v33 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v33 audioDuration];
    double v35 = v34;
    uint64_t v36 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v36 ttsSynthesisLatency];
    double v38 = v37;
    v39 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v39 cappedRealTimeFactor];
    double v41 = v40;
    v42 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v43 = [v42 promptCount];
    v44 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    objc_msgSend(v32, "instrumentSpeechEndedWithAudioDuration:synthesisLatency:realTimeFactor:promptCount:errorCode:", v43, objc_msgSend(v44, "errorCode"), v35, v38, v41);
  }
LABEL_21:
}

- (void)reportInstrumentMetrics
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(VSSpeechSpeakTask *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      uint64_t v7 = [v6 requestCreatedTimestamp];
      uint64_t v8 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      int v16 = 134218242;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_226CB1000, v5, OS_LOG_TYPE_DEFAULT, "Device task %llu: Instrument metric: %@", (uint8_t *)&v16, 0x16u);
    }
    id v9 = [(VSSpeechSpeakTask *)self delegate];
    int v10 = [(VSSpeechSpeakTask *)self request];
    uint64_t v11 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v9 speechRequest:v10 didReportInstrumentMetrics:v11];

    uint64_t v12 = +[VSDiagnosticService defaultService];
    double v13 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v14 = [v13 dictionaryMetrics];
    v15 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    objc_msgSend(v12, "dumpInstrumentMetrics:withTimestamp:", v14, objc_msgSend(v15, "requestCreatedTimestamp"));
  }
}

- (void)synthesizeAndSpeak
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  [(VSSpeechSpeakTask *)self prepareForSynthesis];
  v3 = [(VSSpeechSpeakTask *)self error];

  if (!v3)
  {
    char v4 = [(VSSpeechSpeakTask *)self request];
    -[VSSpeechSpeakTask startPlaybackServiceWithAudioSessionID:](self, "startPlaybackServiceWithAudioSessionID:", [v4 audioSessionID]);

    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    uint64_t v67 = 0;
    uint64_t v67 = mach_absolute_time();
    uint64_t v5 = [(VSSpeechSpeakTask *)self voiceSelection];
    uint64_t v6 = [v5 voiceData];
    BOOL v7 = [v6 type] == 4;

    if (v7)
    {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      [(VSSpeechSpeakTask *)self setNeuralPlaybackSemaphore:v8];

      id v9 = [(VSSpeechSpeakTask *)self taskAuxiliaryQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke;
      block[3] = &unk_2647DCD78;
      block[4] = self;
      dispatch_async(v9, block);
    }
    int v10 = [(VSSpeechSpeakTask *)self error];

    if (!v10 && ([(VSSpeechSpeakTask *)self isCancelled] & 1) == 0)
    {
      uint64_t v11 = mach_absolute_time();
      uint64_t v12 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      [v12 setSynthesisBeginTimestamp:v11];

      double v13 = [MEMORY[0x263EFF980] array];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v14 = [(VSSpeechSpeakTask *)self request];
      v15 = [v14 customResourceURLs];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v75 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v62 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v61 + 1) + 8 * i);
            uint64_t v20 = [(VSSpeechSpeakTask *)self engine];
            uint64_t v21 = [v20 loadResource:v19 error:0];

            if (v21) {
              [v13 addObject:v21];
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v75 count:16];
        }
        while (v16);
      }

      v22 = [(VSSpeechSpeakTask *)self engine];
      v23 = v22;
      if (v22)
      {
        [v22 asbd];
        unsigned int v24 = DWORD2(v59);
      }
      else
      {
        unsigned int v24 = 0;
        uint64_t v60 = 0;
        long long v58 = 0u;
        long long v59 = 0u;
      }
      uint64_t v25 = [(VSSpeechSpeakTask *)self engine];
      uint64_t v26 = v25;
      if (v25)
      {
        [v25 asbd];
        double v27 = *(double *)&v55;
      }
      else
      {
        uint64_t v57 = 0;
        long long v55 = 0u;
        long long v56 = 0u;
        double v27 = 0.0;
      }

      kdebug_trace();
      v28 = [(VSSpeechSpeakTask *)self engine];
      v29 = [(VSSpeechSpeakTask *)self request];
      int v30 = [v29 utterance];
      v31 = [(VSSpeechSpeakTask *)self request];
      uint64_t v32 = [v31 canLogRequestText];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_45;
      v54[3] = &unk_2647DC7A8;
      v54[4] = self;
      v54[5] = v66;
      v54[6] = (unint64_t)(v27 * (double)v24);
      v33 = [v28 synthesizeText:v30 loggable:v32 callback:v54];

      if (v33) {
        [(VSSpeechSpeakTask *)self setError:v33];
      }
      double v34 = [(VSSpeechSpeakTask *)self neuralPlaybackSemaphore];

      if (v34)
      {
        double v35 = [(VSSpeechSpeakTask *)self neuralPlaybackSemaphore];
        dispatch_semaphore_signal(v35);
      }
      uint64_t v36 = VSGetLogDefault();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        double v37 = [(VSSpeechSpeakTask *)self request];
        double v38 = [v37 utterance];
        uint64_t v39 = [v38 length];
        double v40 = [(VSSpeechSpeakTask *)self streamAudio];
        [v40 duration];
        uint64_t v42 = v41;
        uint64_t v43 = [(VSSpeechSpeakTask *)self error];
        *(_DWORD *)buf = 134218498;
        uint64_t v70 = v39;
        __int16 v71 = 2048;
        uint64_t v72 = v42;
        __int16 v73 = 2112;
        v74 = v43;
        _os_log_impl(&dword_226CB1000, v36, OS_LOG_TYPE_INFO, "SpeakTask done synthesize %lu characters, audio duration %f, error %@", buf, 0x20u);
      }
      notify_post((const char *)[(id)*MEMORY[0x263F84F10] UTF8String]);
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v44 = v13;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v50 objects:v68 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v51 != v46) {
              objc_enumerationMutation(v44);
            }
            uint64_t v48 = *(void *)(*((void *)&v50 + 1) + 8 * j);
            v49 = [(VSSpeechSpeakTask *)self engine];
            [v49 unloadResource:v48];
          }
          uint64_t v45 = [v44 countByEnumeratingWithState:&v50 objects:v68 count:16];
        }
        while (v45);
      }

      [(VSSpeechSpeakTask *)self waitUntilAudioFinished];
    }
    _Block_object_dispose(v66, 8);
  }
}

void __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke(uint64_t a1)
{
  v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_226CB1000, v2, OS_LOG_TYPE_INFO, "Holding audio playback before we get fast synthesis.", v6, 2u);
  }

  v3 = [*(id *)(a1 + 32) neuralPlaybackSemaphore];

  if (v3)
  {
    char v4 = [*(id *)(a1 + 32) neuralPlaybackSemaphore];
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v4, v5);
  }
}

id __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_45(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  if (v4 == 3)
  {
    uint64_t v7 = mach_absolute_time();
    dispatch_semaphore_t v8 = [*(id *)(a1 + 32) instrumentMetrics];
    [v8 setSynthesisEndTimestamp:v7];

    if ([v3 neuralDidFallback]) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [v3 hasAudioClick];
    }
    [*(id *)(a1 + 32) setSynthesisHasIssue:v9];
    uint64_t v10 = [v3 numOfPromptsTriggered];
    uint64_t v11 = [*(id *)(a1 + 32) instrumentMetrics];
    [v11 setPromptCount:v10];

    kdebug_trace();
    uint64_t v12 = [*(id *)(a1 + 32) timingInfos];

    if (!v12)
    {
      double v13 = [v3 wordTimingInfos];
      [*(id *)(a1 + 32) setTimingInfos:v13];

      uint64_t v14 = (void *)MEMORY[0x263F84EB0];
      v15 = [*(id *)(a1 + 32) timingInfos];
      uint64_t v16 = [*(id *)(a1 + 32) request];
      uint64_t v17 = [v16 contextInfo];
      [v14 adjustWordTimingInfo:v15 forContext:v17];
    }
    __int16 v18 = *(void **)(a1 + 32);
    uint64_t v19 = [v18 timingInfos];
    [v18 setObserverForWordTimings:v19];

    uint64_t v20 = [v3 phonemes];
    [*(id *)(a1 + 32) setPhonemes:v20];

    [*(id *)(a1 + 32) reportTimingInfo];
    uint64_t v21 = [v3 hasAlignmentStall];
    v22 = [*(id *)(a1 + 32) instrumentMetrics];
    [v22 setNeuralAlignmentStall:v21];

    uint64_t v23 = [v3 hasAudioClick];
    unsigned int v24 = [*(id *)(a1 + 32) instrumentMetrics];
    [v24 setNeuralAudioClick:v23];

    uint64_t v25 = [v3 neuralDidFallback];
    uint64_t v26 = [*(id *)(a1 + 32) instrumentMetrics];
    [v26 setNeuralFallback:v25];

    goto LABEL_11;
  }
  if (v4 != 2)
  {
LABEL_11:
    id v6 = 0;
    goto LABEL_15;
  }
  dispatch_time_t v5 = [*(id *)(a1 + 32) error];
  if (!v5)
  {
    double v27 = (void *)MEMORY[0x22A667AA0]();
    v28 = [v3 mutablePCMData];
    v29 = [*(id *)(a1 + 32) voiceBooster];
    int v30 = [v29 processData:v28];

    if (v30)
    {
      id v6 = v30;

      goto LABEL_14;
    }
    uint64_t v32 = [*(id *)(a1 + 32) neuralPlaybackSemaphore];

    if (v32)
    {
      uint64_t v33 = mach_absolute_time();
      double v34 = (double)(unint64_t)[v28 length] / (double)*(unint64_t *)(a1 + 48);
      VSAbsoluteTimeToSecond();
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v33;
      if (v34 / v35 > 1.2)
      {
        uint64_t v36 = [*(id *)(a1 + 32) neuralPlaybackSemaphore];
        dispatch_semaphore_signal(v36);
      }
    }
    double v37 = [*(id *)(a1 + 32) streamAudio];
    [v37 appendAudioData:v28 packetCount:0 packetDescriptions:0];

    double v38 = [*(id *)(a1 + 32) taskAuxiliaryQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_2;
    block[3] = &unk_2647DCED8;
    block[4] = *(void *)(a1 + 32);
    id v49 = v28;
    id v39 = v28;
    dispatch_async(v38, block);

    double v40 = [*(id *)(a1 + 32) taskAuxiliaryQueue];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_3;
    v47[3] = &unk_2647DCD78;
    v47[4] = *(void *)(a1 + 32);
    dispatch_async(v40, v47);

    uint64_t v41 = [*(id *)(a1 + 32) timingInfos];
    if (!v41)
    {
      id v42 = objc_alloc(MEMORY[0x263EFF8C0]);
      uint64_t v43 = [v3 wordTimingInfos];
      uint64_t v41 = (void *)[v42 initWithArray:v43 copyItems:1];

      id v44 = (void *)MEMORY[0x263F84EB0];
      uint64_t v45 = [*(id *)(a1 + 32) request];
      uint64_t v46 = [v45 contextInfo];
      [v44 adjustWordTimingInfo:v41 forContext:v46];
    }
    [*(id *)(a1 + 32) setObserverForWordTimings:v41];

    goto LABEL_11;
  }
  id v6 = v5;
LABEL_14:

LABEL_15:
  return v6;
}

void __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playbackService];
  [v2 enqueue:*(void *)(a1 + 40) packetCount:0 packetDescriptions:0];
}

uint64_t __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportSpeechStart];
}

- (void)cancel
{
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"VoiceServicesErrorDomain" code:400 userInfo:0];
  [(VSSpeechSpeakTask *)self setError:v3];

  if (([(VSSpeechSpeakTask *)self isExecuting] & 1) != 0
    || ([(VSSpeechSpeakTask *)self isCancelled] & 1) != 0
    || ([(VSSpeechSpeakTask *)self isFinished] & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)VSSpeechSpeakTask;
    [(VSSpeechSpeakTask *)&v9 cancel];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VSSpeechSpeakTask;
    [(VSSpeechSpeakTask *)&v10 cancel];
    [(VSSpeechSpeakTask *)self reportFinish];
  }
  uint64_t v4 = [(VSSpeechSpeakTask *)self engine];
  [v4 stopAtMarker:0];

  dispatch_time_t v5 = [(VSSpeechSpeakTask *)self neuralPlaybackSemaphore];

  if (v5)
  {
    id v6 = [(VSSpeechSpeakTask *)self neuralPlaybackSemaphore];
    dispatch_semaphore_signal(v6);
  }
  uint64_t v7 = [(VSSpeechSpeakTask *)self taskAuxiliaryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__VSSpeechSpeakTask_cancel__block_invoke;
  block[3] = &unk_2647DCD78;
  block[4] = self;
  dispatch_async(v7, block);
}

void __27__VSSpeechSpeakTask_cancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) playbackService];
  [v1 stop];
}

- (void)main
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  kdebug_trace();
  kdebug_trace();
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v74 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    *(_DWORD *)buf = 134217984;
    uint64_t v80 = [v74 requestCreatedTimestamp];
    _os_log_debug_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEBUG, "Starting speech task %llu", buf, 0xCu);
  }
  uint64_t v4 = [(VSSpeechSpeakTask *)self cachingService];
  dispatch_time_t v5 = [(VSSpeechSpeakTask *)self request];
  id v6 = [v5 text];
  uint64_t v7 = [v4 popShortTermCacheForHash:v6];

  if (v7)
  {
    dispatch_semaphore_t v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v9 = [(VSSpeechSpeakTask *)self request];
      objc_super v10 = [v9 logText];
      *(_DWORD *)buf = 138412290;
      uint64_t v80 = (uint64_t)v10;
      _os_log_impl(&dword_226CB1000, v8, OS_LOG_TYPE_DEFAULT, "Short-term cached synthesis is found for text '%@'", buf, 0xCu);
    }
    uint64_t v11 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v11 setIsServerTTS:1];

    uint64_t v12 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v12 setIsCacheHitFromMemory:1];

    double v13 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v13 setSourceOfTTS:6];

    uint64_t v14 = [v7 voiceKey];
    v15 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v15 setVoiceAssetKey:v14];

    uint64_t v16 = [v7 voiceResourceKey];
    uint64_t v17 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v17 setVoiceResourceAssetKey:v16];

    __int16 v18 = [v7 timingInfos];
    [(VSSpeechSpeakTask *)self setTimingInfos:v18];

    uint64_t v19 = [v7 audio];
    [v19 duration];
    double v21 = v20;
    v22 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v22 setAudioDuration:v21];

    [(VSSpeechSpeakTask *)self setSpeechCache:v7];
  }
  else
  {
    uint64_t v23 = objc_opt_new();
    unsigned int v24 = [(VSSpeechSpeakTask *)self request];
    uint64_t v25 = [v24 text];
    uint64_t v26 = [(VSSpeechSpeakTask *)self request];
    double v27 = [v26 languageCode];
    v28 = [(VSSpeechSpeakTask *)self request];
    v29 = [v28 voiceName];
    int v30 = [v23 estimatedTTSWordTimingForText:v25 withLanguage:v27 voiceName:v29];
    [(VSSpeechSpeakTask *)self setTimingInfos:v30];

    v31 = (void *)MEMORY[0x263F84EB0];
    uint64_t v32 = [(VSSpeechSpeakTask *)self timingInfos];
    uint64_t v33 = [(VSSpeechSpeakTask *)self request];
    double v34 = [v33 contextInfo];
    [v31 adjustWordTimingInfo:v32 forContext:v34];

    [(VSSpeechSpeakTask *)self fetchVoiceResource];
    [(VSSpeechSpeakTask *)self fetchVoiceAsset];
    double v35 = [(VSSpeechSpeakTask *)self error];

    if (!v35)
    {
      uint64_t v36 = [(VSSpeechSpeakTask *)self cachingService];
      [v36 fetchCacheForTask:self];
    }
  }
  double v37 = [(VSSpeechSpeakTask *)self error];

  if (!v37)
  {
    double v38 = [(VSSpeechSpeakTask *)self speechCache];

    if (v38)
    {
      [(VSSpeechSpeakTask *)self reportTimingInfo];
      [(VSSpeechSpeakTask *)self speakCachedAudio];
    }
    else
    {
      [(VSSpeechSpeakTask *)self synthesizeAndSpeak];
      id v39 = [(VSSpeechSpeakTask *)self error];

      if (!v39)
      {
        double v40 = [(VSSpeechSpeakTask *)self streamAudio];
        [v40 duration];
        double v42 = v41;
        uint64_t v43 = [(VSSpeechSpeakTask *)self instrumentMetrics];
        [v43 setAudioDuration:v42];
      }
    }
    uint64_t v44 = mach_absolute_time();
    uint64_t v45 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v45 setSpeechEndTimestamp:v44];

    uint64_t v46 = [(VSSpeechSpeakTask *)self playbackService];
    LODWORD(v45) = [v46 discontinuedDuringPlayback];

    if (v45)
    {
      v47 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      [v47 setErrorCode:452];
    }
    uint64_t v48 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v48 setIsSpeechRequest:1];
  }
  if ([(VSSpeechSpeakTask *)self isCancelled])
  {
    id v49 = (void *)MEMORY[0x263F087E8];
    uint64_t v77 = *MEMORY[0x263F08328];
    v78 = @"Speech is cancelled/interrupted.";
    long long v50 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    long long v51 = [v49 errorWithDomain:@"VoiceServicesErrorDomain" code:400 userInfo:v50];
    [(VSSpeechSpeakTask *)self setError:v51];
  }
  long long v52 = [(VSSpeechSpeakTask *)self error];

  if (!v52)
  {
    [(VSSpeechSpeakTask *)self reportInstrumentMetrics];
    long long v53 = [(VSSpeechSpeakTask *)self streamAudio];

    if (v53)
    {
      v54 = +[VSDiagnosticService defaultService];
      long long v55 = [(VSSpeechSpeakTask *)self streamAudio];
      long long v56 = [(VSSpeechSpeakTask *)self request];
      [v54 dumpStreamAudio:v55 forRequest:v56];
    }
    else
    {
      uint64_t v57 = [(VSSpeechSpeakTask *)self compressedAudio];

      if (!v57)
      {
LABEL_25:
        long long v58 = [(VSSpeechSpeakTask *)self speechCache];
        if (v58)
        {
        }
        else
        {
          long long v59 = [(VSSpeechSpeakTask *)self request];
          if ([v59 shouldCache])
          {
            BOOL v60 = [(VSSpeechSpeakTask *)self synthesisHasIssue];

            if (!v60) {
              [(VSSpeechSpeakTask *)self enqueueCache];
            }
          }
          else
          {
          }
        }
        long long v61 = [(VSSpeechSpeakTask *)self request];
        long long v62 = [v61 outputPath];
        long long v63 = [v62 path];

        if (v63)
        {
          long long v64 = [(VSSpeechSpeakTask *)self streamAudio];
          char v65 = [v64 writeWaveToFilePath:v63];

          if ((v65 & 1) == 0)
          {
            v66 = (void *)MEMORY[0x263F087E8];
            uint64_t v75 = *MEMORY[0x263F08328];
            uint64_t v76 = @"writeWaveToFilePath failed.";
            uint64_t v67 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
            v68 = [v66 errorWithDomain:@"VoiceServicesErrorDomain" code:501 userInfo:v67];
            [(VSSpeechSpeakTask *)self setError:v68];
          }
        }
        v69 = [(VSSpeechSpeakTask *)self instrumentMetrics];
        uint64_t v70 = [v69 errorCode];
        char v71 = VSSpeakTaskTailSpinDumpInProgress;

        if (v70 == 452 && (v71 & 1) == 0)
        {
          uint64_t v72 = VSGetLogDefault();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_226CB1000, v72, OS_LOG_TYPE_INFO, "Detected synthesis stall, starting tailspin", buf, 2u);
          }

          VSSpeakTaskTailSpinDumpInProgress = 1;
          __int16 v73 = +[VSDiagnosticService defaultService];
          [v73 collectTailspin:&__block_literal_global_273];
        }
        goto LABEL_40;
      }
      v54 = +[VSDiagnosticService defaultService];
      long long v55 = [(VSSpeechSpeakTask *)self compressedAudio];
      long long v56 = [(VSSpeechSpeakTask *)self request];
      [v54 dumpCompressedAudio:v55 forRequest:v56];
    }

    goto LABEL_25;
  }
LABEL_40:
  [(VSSpeechSpeakTask *)self reportFinish];
  [(VSSpeechSpeakTask *)self logFinish];
  kdebug_trace();
}

void __25__VSSpeechSpeakTask_main__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  VSSpeakTaskTailSpinDumpInProgress = 0;
  dispatch_time_t v5 = VSGetLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_226CB1000, v5, OS_LOG_TYPE_INFO, "Finished tail spin, success:%d, file: %@", (uint8_t *)v6, 0x12u);
  }
}

- (id)taskHash
{
  v22 = NSString;
  uint64_t v25 = [(VSSpeechSpeakTask *)self request];
  double v20 = [v25 utterance];
  unsigned int v24 = [(VSSpeechSpeakTask *)self voiceSelection];
  id v3 = [v24 key];
  uint64_t v23 = [(VSSpeechSpeakTask *)self voiceResource];
  id v4 = [v23 key];
  double v21 = [(VSSpeechSpeakTask *)self request];
  [v21 rate];
  uint64_t v6 = v5;
  __int16 v7 = [(VSSpeechSpeakTask *)self request];
  [v7 pitch];
  uint64_t v9 = v8;
  objc_super v10 = [(VSSpeechSpeakTask *)self request];
  [v10 volume];
  uint64_t v12 = v11;
  double v13 = [(VSSpeechSpeakTask *)self request];
  uint64_t v14 = [v13 contextInfo];
  v15 = [(VSSpeechSpeakTask *)self request];
  uint64_t v16 = [v15 customResourceURLs];
  uint64_t v17 = [v22 stringWithFormat:@"%@ %@ %@ %@ %.2f %.2f %.2f %@ %@", @"2", v20, v3, v4, v6, v9, v12, v14, v16];

  __int16 v18 = [v17 sha256hex];

  return v18;
}

- (BOOL)isSpeaking
{
  return 1;
}

- (OS_dispatch_queue)taskAuxiliaryQueue
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_taskAuxiliaryQueue)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create(0, v3);
    taskAuxiliaryQueue = v2->_taskAuxiliaryQueue;
    v2->_taskAuxiliaryQueue = (OS_dispatch_queue *)v4;
  }
  objc_sync_exit(v2);

  uint64_t v6 = v2->_taskAuxiliaryQueue;
  return v6;
}

- (VSSpeechSpeakTask)initWithRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VSSpeechSpeakTask;
  uint64_t v6 = [(VSSpeechSpeakTask *)&v21 init];
  __int16 v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    uint64_t v8 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x263F84E28]);
    instrumentMetrics = v7->_instrumentMetrics;
    v7->_instrumentMetrics = v8;

    if ([v5 requestCreatedTimestamp])
    {
      uint64_t v10 = [v5 requestCreatedTimestamp];
    }
    else
    {
      uint64_t v11 = VSGetLogDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v11, OS_LOG_TYPE_ERROR, "Using timestamp inside voiced for task", buf, 2u);
      }

      uint64_t v10 = mach_absolute_time();
    }
    [(VSInstrumentMetrics *)v7->_instrumentMetrics setRequestCreatedTimestamp:v10];
    uint64_t v12 = VSGetLogDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [(VSInstrumentMetrics *)v7->_instrumentMetrics requestCreatedTimestamp];
      *(_DWORD *)buf = 134218240;
      uint64_t v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = v7;
      _os_log_impl(&dword_226CB1000, v12, OS_LOG_TYPE_INFO, "Created Task %llu (%p)", buf, 0x16u);
    }

    kdebug_trace();
    uint64_t v14 = [v5 text];
    [(VSInstrumentMetrics *)v7->_instrumentMetrics setUtterance:v14];

    -[VSInstrumentMetrics setCanUseServerTTS:](v7->_instrumentMetrics, "setCanUseServerTTS:", [v5 canUseServerTTS]);
    v15 = [v5 clientBundleIdentifier];
    [(VSInstrumentMetrics *)v7->_instrumentMetrics setClientBundleIdentifier:v15];

    [(VSInstrumentMetrics *)v7->_instrumentMetrics setSourceOfTTS:1];
    uint64_t v16 = +[VSCachingService standardService];
    cachingService = v7->_cachingService;
    v7->_cachingService = (VSCachingService *)v16;

    uint64_t v18 = +[VSPrewarmService sharedService];
    prewarmService = v7->_prewarmService;
    v7->_prewarmService = (VSPrewarmService *)v18;
  }
  return v7;
}

- (VSSpeechSpeakTask)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)enqueueCache
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(VSSpeechSpeakTask *)self taskHash];
  dispatch_queue_t v4 = [(VSSpeechSpeakTask *)self streamAudio];

  id v5 = [(VSSpeechSpeakTask *)self cachingService];
  if (v4)
  {
    uint64_t v6 = [(VSSpeechSpeakTask *)self streamAudio];
    __int16 v7 = [(VSSpeechSpeakTask *)self timingInfos];
    uint64_t v8 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v9 = [v8 voiceAssetKey];
    uint64_t v10 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v11 = [v10 voiceResourceAssetKey];
    [v5 enqueueCacheWithHash:v3 streamAudio:v6 timingInfo:v7 voiceKey:v9 voiceResourceKey:v11 completion:0];

    uint64_t v12 = VSGetLogDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      int v21 = 134218242;
      uint64_t v22 = [v13 requestCreatedTimestamp];
      __int16 v23 = 2112;
      __int16 v24 = v3;
      uint64_t v14 = "Cached streamAudio in task %llu with hash %@ in memory";
LABEL_6:
      _os_log_impl(&dword_226CB1000, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    v15 = [(VSSpeechSpeakTask *)self compressedAudio];
    uint64_t v16 = [(VSSpeechSpeakTask *)self timingInfos];
    uint64_t v17 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v18 = [v17 voiceAssetKey];
    uint64_t v19 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    double v20 = [v19 voiceResourceAssetKey];
    [v5 enqueueCacheWithHash:v3 audio:v15 timingInfo:v16 voiceKey:v18 voiceResourceKey:v20 completion:0];

    uint64_t v12 = VSGetLogDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      int v21 = 134218242;
      uint64_t v22 = [v13 requestCreatedTimestamp];
      __int16 v23 = 2112;
      __int16 v24 = v3;
      uint64_t v14 = "Cached audio in task %llu with hash %@ in memory";
      goto LABEL_6;
    }
  }
}

- (void)logFinish
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(VSSpeechSpeakTask *)self error];
  if (v3
    && (dispatch_queue_t v4 = (void *)v3,
        [(VSSpeechSpeakTask *)self error],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 code],
        v5,
        v4,
        v6 != 400))
  {
    uint64_t v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v21 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      uint64_t v22 = [v21 requestCreatedTimestamp];
      __int16 v23 = [(VSSpeechSpeakTask *)self error];
      *(_DWORD *)buf = 134218242;
      uint64_t v68 = v22;
      __int16 v69 = 2112;
      uint64_t v70 = v23;
      _os_log_error_impl(&dword_226CB1000, v8, OS_LOG_TYPE_ERROR, "Error in device task %llu, error: %@", buf, 0x16u);
    }
  }
  else
  {
    __int16 v7 = [(VSSpeechSpeakTask *)self voiceSelection];
    uint64_t v8 = [v7 voiceData];

    uint64_t v9 = [(VSSpeechSpeakTask *)self voiceResource];
    uint64_t v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v62 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      uint64_t v55 = [v62 requestCreatedTimestamp];
      int v11 = [(VSSpeechSpeakTask *)self isCancelled];
      uint64_t v12 = @"Finished";
      if (v11) {
        uint64_t v12 = @"Cancelled";
      }
      v54 = v12;
      BOOL v13 = [(VSSpeechSpeakTask *)self isSpeaking];
      uint64_t v14 = @"synthesizing";
      if (v13) {
        uint64_t v14 = @"speaking";
      }
      long long v53 = v14;
      long long v61 = [(VSSpeechSpeakTask *)self request];
      long long v64 = [v61 logUtterance];
      v65[0] = @"voice";
      BOOL v60 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      v15 = [v60 voiceAssetKey];
      long long v59 = v15;
      if (!v15)
      {
        uint64_t v16 = [v8 voiceKey];
        uint64_t v46 = (void *)v16;
        if (v16) {
          v15 = (__CFString *)v16;
        }
        else {
          v15 = @"(null)";
        }
      }
      v66[0] = v15;
      v65[1] = @"voice_resource";
      uint64_t v17 = [v9 key];
      long long v58 = (void *)v17;
      if (v17) {
        uint64_t v18 = (__CFString *)v17;
      }
      else {
        uint64_t v18 = @"(null)";
      }
      v66[1] = v18;
      v65[2] = @"rate";
      uint64_t v19 = NSNumber;
      uint64_t v57 = [(VSSpeechSpeakTask *)self speechCache];
      if (v57)
      {
        long long v56 = [(VSSpeechSpeakTask *)self request];
        [v56 rate];
      }
      else
      {
        long long v56 = [(VSSpeechSpeakTask *)self engine];
        [v56 rate];
        double v20 = v24;
      }
      long long v52 = [v19 numberWithDouble:v20];
      v66[2] = v52;
      v65[3] = @"pitch";
      uint64_t v25 = NSNumber;
      long long v51 = [(VSSpeechSpeakTask *)self speechCache];
      if (v51)
      {
        long long v50 = [(VSSpeechSpeakTask *)self request];
        [v50 pitch];
      }
      else
      {
        long long v50 = [(VSSpeechSpeakTask *)self engine];
        [v50 pitch];
        double v26 = v27;
      }
      id v49 = [v25 numberWithDouble:v26];
      void v66[3] = v49;
      v65[4] = @"volume";
      v28 = NSNumber;
      uint64_t v48 = [(VSSpeechSpeakTask *)self speechCache];
      long long v63 = v9;
      if (v48)
      {
        v47 = [(VSSpeechSpeakTask *)self request];
        [v47 volume];
      }
      else
      {
        v47 = [(VSSpeechSpeakTask *)self engine];
        [v47 volume];
        double v29 = v30;
      }
      v31 = [v28 numberWithDouble:v29];
      v66[4] = v31;
      v65[5] = @"isEager";
      uint64_t v32 = NSNumber;
      BOOL v33 = [(VSSpeechSpeakTask *)self isSpeaking];
      if (v33)
      {
        uint64_t v45 = [(VSSpeechSpeakTask *)self instrumentMetrics];
        BOOL v34 = [v45 eagerRequestCreatedTimestampDiffs] > 0;
      }
      else
      {
        BOOL v34 = 0;
      }
      double v35 = [v32 numberWithInt:v34];
      v66[5] = v35;
      v65[6] = @"neuralIssue";
      uint64_t v36 = NSNumber;
      double v37 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      char v38 = [v37 neuralAlignmentStall];
      if (v38)
      {
        int v39 = 0;
        uint64_t v40 = 1;
      }
      else
      {
        uint64_t v44 = [(VSSpeechSpeakTask *)self instrumentMetrics];
        if ([v44 neuralAudioClick])
        {
          int v39 = 0;
          uint64_t v40 = 1;
        }
        else
        {
          uint64_t v43 = [(VSSpeechSpeakTask *)self instrumentMetrics];
          uint64_t v40 = [v43 neuralFallback];
          int v39 = 1;
        }
      }
      double v41 = [v36 numberWithInt:v40];
      v66[6] = v41;
      double v42 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:7];
      *(_DWORD *)buf = 134219010;
      uint64_t v68 = v55;
      __int16 v69 = 2112;
      uint64_t v70 = v54;
      __int16 v71 = 2112;
      uint64_t v72 = v53;
      __int16 v73 = 2112;
      v74 = v64;
      __int16 v75 = 2114;
      uint64_t v76 = v42;
      _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_DEFAULT, "Device task %llu: %@ %@ utterance: '%@', %{public}@", buf, 0x34u);

      if (v39) {
      if ((v38 & 1) == 0)
      }

      if (v33) {
      if (!v59)
      }

      uint64_t v9 = v63;
    }
  }
}

- (id)_fetchVoiceAsset_NoRetry
{
  v44[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F84E40] sharedManager];
  uint64_t v36 = [(VSSpeechSpeakTask *)self request];
  dispatch_queue_t v4 = [v36 languageCode];
  id v5 = [(VSSpeechSpeakTask *)self request];
  uint64_t v6 = [v5 voiceName];
  __int16 v7 = [(VSSpeechSpeakTask *)self request];
  uint64_t v8 = [v7 voiceType];
  uint64_t v9 = [(VSSpeechSpeakTask *)self request];
  uint64_t v10 = [v9 gender];
  int v11 = [(VSSpeechSpeakTask *)self request];
  uint64_t v12 = objc_msgSend(v3, "selectVoiceForLang:name:type:gender:footprint:", v4, v6, v8, v10, objc_msgSend(v11, "footprint"));

  if (!v12)
  {
    int v21 = VSGetLogDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_226CB1000, v21, OS_LOG_TYPE_ERROR, "No voice available", buf, 2u);
    }

    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    v44[0] = @"No voice available";
    uint64_t v18 = NSDictionary;
    uint64_t v19 = (__CFString **)v44;
    double v20 = &v43;
    goto LABEL_10;
  }
  BOOL v13 = [(VSSpeechSpeakTask *)self request];
  if ([v13 disableCompactVoiceFallback])
  {
    uint64_t v14 = [v12 voiceData];
    uint64_t v15 = [v14 footprint];

    if (v15 == 1)
    {
      uint64_t v16 = VSGetLogDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v16, OS_LOG_TYPE_ERROR, "Compact voice is explicitly disabled.", buf, 2u);
      }

      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v41 = *MEMORY[0x263F08320];
      double v42 = @"Compact voice is explicitly disabled.";
      uint64_t v18 = NSDictionary;
      uint64_t v19 = &v42;
      double v20 = &v41;
LABEL_10:
      uint64_t v22 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
      __int16 v23 = v17;
      uint64_t v24 = 401;
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v25 = [MEMORY[0x263F08850] defaultManager];
  double v26 = [v12 voicePath];
  char v27 = [v25 fileExistsAtPath:v26];

  if (v27)
  {
    [(VSSpeechSpeakTask *)self setVoiceSelection:v12];
    v28 = [(VSSpeechSpeakTask *)self voiceSelection];
    double v29 = [v28 key];
    float v30 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v30 setVoiceAssetKey:v29];

    v31 = 0;
    goto LABEL_18;
  }
  uint64_t v32 = VSGetLogDefault();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    double v35 = [v12 voicePath];
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = v35;
    _os_log_error_impl(&dword_226CB1000, v32, OS_LOG_TYPE_ERROR, "Voice is deleted at path '%@'", buf, 0xCu);
  }
  BOOL v33 = (void *)MEMORY[0x263F087E8];
  uint64_t v37 = *MEMORY[0x263F08320];
  char v38 = @"Voice is deleted already.";
  uint64_t v22 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  __int16 v23 = v33;
  uint64_t v24 = 402;
LABEL_17:
  v31 = [v23 errorWithDomain:@"VoiceServicesErrorDomain" code:v24 userInfo:v22];

LABEL_18:
  return v31;
}

- (void)fetchVoiceAsset
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(VSSpeechSpeakTask *)self _fetchVoiceAsset_NoRetry];
  [(VSSpeechSpeakTask *)self setError:v3];

  uint64_t v4 = [(VSSpeechSpeakTask *)self error];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [(VSSpeechSpeakTask *)self error];
    uint64_t v7 = [v6 code];

    if (v7 == 402)
    {
      notify_post((const char *)[@"com.apple.voiceservices.notification.voice-update" UTF8String]);
      uint64_t v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_226CB1000, v8, OS_LOG_TYPE_INFO, "Reset MobileAsset query cache and retry selecting voice", (uint8_t *)&v16, 2u);
      }

      uint64_t v9 = [MEMORY[0x263F84E40] sharedManager];
      [v9 resetCache];

      uint64_t v10 = [(VSSpeechSpeakTask *)self _fetchVoiceAsset_NoRetry];
      [(VSSpeechSpeakTask *)self setError:v10];
    }
  }
  int v11 = VSGetLogDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v13 = [v12 requestCreatedTimestamp];
    uint64_t v14 = [(VSSpeechSpeakTask *)self voiceSelection];
    uint64_t v15 = [v14 voiceData];
    int v16 = 134218242;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    _os_log_impl(&dword_226CB1000, v11, OS_LOG_TYPE_INFO, "Task %llu fetched voice %@", (uint8_t *)&v16, 0x16u);
  }
}

- (void)fetchVoiceResource
{
  uint64_t v3 = [MEMORY[0x263F84E40] sharedManager];
  uint64_t v4 = [(VSSpeechSpeakTask *)self request];
  id v5 = [v4 languageCode];
  uint64_t v6 = [v3 selectVoiceResourceAssetForLanguage:v5];
  [(VSSpeechSpeakTask *)self setVoiceResource:v6];

  id v9 = [(VSSpeechSpeakTask *)self voiceResource];
  uint64_t v7 = [v9 key];
  uint64_t v8 = [(VSSpeechSpeakTask *)self instrumentMetrics];
  [v8 setVoiceResourceAssetKey:v7];
}

- (void)resumePlayback
{
  uint64_t v3 = [(VSSpeechSpeakTask *)self taskAuxiliaryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__VSSpeechSpeakTask_Utilities__resumePlayback__block_invoke;
  block[3] = &unk_2647DCD78;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __46__VSSpeechSpeakTask_Utilities__resumePlayback__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) playbackService];
    id v3 = (id)[v2 start];

    if ([*(id *)(a1 + 32) isCancelled])
    {
      id v4 = [*(id *)(a1 + 32) playbackService];
      [v4 stop];
    }
  }
}

- (void)pausePlayback
{
  id v3 = [(VSSpeechSpeakTask *)self taskAuxiliaryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__VSSpeechSpeakTask_Utilities__pausePlayback__block_invoke;
  block[3] = &unk_2647DCD78;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __45__VSSpeechSpeakTask_Utilities__pausePlayback__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) playbackService];
  [v1 pause];
}

- (void)waitUntilAudioFinished
{
  id v3 = [(VSSpeechSpeakTask *)self taskAuxiliaryQueue];
  dispatch_sync(v3, &__block_literal_global_35);

  id v4 = [(VSSpeechSpeakTask *)self playbackService];
  [v4 flushAndStop];

  id v5 = [(VSSpeechSpeakTask *)self error];

  if (!v5)
  {
    id v7 = [(VSSpeechSpeakTask *)self playbackService];
    uint64_t v6 = [v7 error];
    [(VSSpeechSpeakTask *)self setError:v6];
  }
}

- (void)startPlaybackServiceWithAudioSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v38[1] = *MEMORY[0x263EF8340];
  id v5 = [(VSSpeechSpeakTask *)self playbackService];

  if (v5)
  {
    uint64_t v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_226CB1000, v6, OS_LOG_TYPE_DEBUG, "playbackService is initialized already.", buf, 2u);
    }
  }
  else
  {
    kdebug_trace();
    id v7 = [VSAudioPlaybackService alloc];
    uint64_t v8 = [(VSSpeechSpeakTask *)self streamAudio];
    if (v8) {
      [(VSSpeechSpeakTask *)self streamAudio];
    }
    else {
    id v9 = [(VSSpeechSpeakTask *)self compressedAudio];
    }
    uint64_t v10 = v9;
    if (v9)
    {
      [v9 asbd];
    }
    else
    {
      uint64_t v35 = 0;
      memset(v34, 0, sizeof(v34));
    }
    int v11 = [(VSSpeechSpeakTask *)self request];
    uint64_t v12 = [v11 accessoryID];
    uint64_t v13 = [(VSAudioPlaybackService *)v7 initWithAudioSessionID:v3 asbd:v34 useAVSBAR:v12 != 0];
    [(VSSpeechSpeakTask *)self setPlaybackService:v13];

    uint64_t v14 = [(VSSpeechSpeakTask *)self playbackService];
    uint64_t v15 = [v14 outputRouteInfo];
    int v16 = [v15 audioRouteName];
    uint64_t v17 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v17 setAudioOutputRoute:v16];

    __int16 v18 = [(VSSpeechSpeakTask *)self playbackService];

    if (v18)
    {
      uint64_t v19 = [(VSSpeechSpeakTask *)self taskAuxiliaryQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke;
      block[3] = &unk_2647DCD78;
      block[4] = self;
      dispatch_async(v19, block);

      uint64_t v20 = [(VSSpeechSpeakTask *)self streamAudio];
      [v20 duration];
      double v22 = v21;

      if (v22 <= 0.0)
      {
        v28 = [(VSSpeechSpeakTask *)self compressedAudio];
        [v28 duration];
        double v30 = v29;

        if (v30 <= 0.0) {
          return;
        }
        __int16 v23 = [(VSSpeechSpeakTask *)self taskAuxiliaryQueue];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_3;
        v31[3] = &unk_2647DCD78;
        v31[4] = self;
        dispatch_async(v23, v31);
      }
      else
      {
        __int16 v23 = [(VSSpeechSpeakTask *)self streamAudio];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_32;
        v32[3] = &unk_2647DCDC8;
        v32[4] = self;
        [v23 enumerateAudioWithBlock:v32];
      }
    }
    else
    {
      uint64_t v24 = VSGetLogDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v24, OS_LOG_TYPE_ERROR, "Can't create VSAudioPlaybackService", buf, 2u);
      }

      uint64_t v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08338];
      v38[0] = @"Can't create VSAudioPlaybackService";
      double v26 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
      char v27 = [v25 errorWithDomain:@"VoiceServicesErrorDomain" code:0 userInfo:v26];
      [(VSSpeechSpeakTask *)self setError:v27];
    }
  }
}

void __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) instrumentMetrics];
  uint64_t v3 = [v2 audioStartTimestampDiffs];

  if (!v3)
  {
    if ([*(id *)(a1 + 32) isCancelled])
    {
      kdebug_trace();
    }
    else
    {
      id v4 = VSGetLogDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int v11 = 0;
        _os_log_debug_impl(&dword_226CB1000, v4, OS_LOG_TYPE_DEBUG, "Starting AudioQueue", v11, 2u);
      }

      uint64_t v5 = mach_absolute_time();
      uint64_t v6 = [*(id *)(a1 + 32) playbackService];
      id v7 = [v6 start];
      [*(id *)(a1 + 32) setError:v7];

      uint64_t v8 = mach_absolute_time() - v5;
      id v9 = [*(id *)(a1 + 32) instrumentMetrics];
      [v9 setAudioStartTimestampDiffs:v8];

      kdebug_trace();
      if ([*(id *)(a1 + 32) isCancelled])
      {
        uint64_t v10 = [*(id *)(a1 + 32) playbackService];
        [v10 stop];
      }
    }
  }
}

void __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_32(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) taskAuxiliaryQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_2;
  v12[3] = &unk_2647DCDA0;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = v8;
  uint64_t v15 = a3;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

void __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_3(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) playbackService];
  id v2 = [*(id *)(a1 + 32) compressedAudio];
  uint64_t v3 = [v2 audioData];
  id v4 = [*(id *)(a1 + 32) compressedAudio];
  uint64_t v5 = [v4 packetCount];
  uint64_t v6 = [*(id *)(a1 + 32) compressedAudio];
  id v7 = [v6 packetDescriptions];
  [v8 enqueue:v3 packetCount:v5 packetDescriptions:v7];
}

void __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playbackService];
  [v2 enqueue:*(void *)(a1 + 40) packetCount:*(void *)(a1 + 56) packetDescriptions:*(void *)(a1 + 48)];
}

- (void)speakCachedAudio
{
  uint64_t v3 = mach_absolute_time();
  id v4 = [(VSSpeechSpeakTask *)self instrumentMetrics];
  [v4 setSynthesisBeginTimestamp:v3];

  uint64_t v5 = [(VSSpeechSpeakTask *)self instrumentMetrics];
  uint64_t v6 = [v5 synthesisBeginTimestamp];
  id v7 = [(VSSpeechSpeakTask *)self instrumentMetrics];
  [v7 setSynthesisEndTimestamp:v6];

  id v17 = [(VSSpeechSpeakTask *)self speechCache];
  id v8 = [v17 audio];
  [(VSSpeechSpeakTask *)self setCompressedAudio:v8];

  id v9 = [v17 timingInfos];
  [(VSSpeechSpeakTask *)self setTimingInfos:v9];

  id v10 = [(VSSpeechSpeakTask *)self request];
  -[VSSpeechSpeakTask startPlaybackServiceWithAudioSessionID:](self, "startPlaybackServiceWithAudioSessionID:", [v10 audioSessionID]);

  id v11 = [(VSSpeechSpeakTask *)self taskAuxiliaryQueue];
  dispatch_sync(v11, &__block_literal_global_3376);

  if (([(VSSpeechSpeakTask *)self isCancelled] & 1) == 0)
  {
    uint64_t v12 = [(VSSpeechSpeakTask *)self error];

    if (!v12)
    {
      [(VSSpeechSpeakTask *)self reportSpeechStart];
      id v13 = [v17 timingInfos];
      [(VSSpeechSpeakTask *)self setObserverForWordTimings:v13];

      id v14 = [(VSSpeechSpeakTask *)self playbackService];
      [v14 flushAndStop];

      uint64_t v15 = [(VSSpeechSpeakTask *)self playbackService];
      int v16 = [v15 error];
      [(VSSpeechSpeakTask *)self setError:v16];
    }
  }
}

- (void)prepareForSynthesis
{
  v57[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(VSSpeechSpeakTask *)self instrumentMetrics];
  [v3 setSourceOfTTS:1];

  id v4 = +[VSSiriServerConfiguration defaultConfig];
  uint64_t v5 = [v4 experimentIdentifier];
  uint64_t v6 = [(VSSpeechSpeakTask *)self instrumentMetrics];
  [v6 setExperimentIdentifier:v5];

  id v7 = [(VSSpeechSpeakTask *)self prewarmService];
  id v8 = [(VSSpeechSpeakTask *)self voiceSelection];
  id v9 = [(VSSpeechSpeakTask *)self voiceResource];
  id v10 = [v7 cachedEngineForVoice:v8 resources:v9];

  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    id v13 = v12;
    uint64_t v14 = 1;
    goto LABEL_5;
  }
  uint64_t v15 = [(VSSpeechSpeakTask *)self prewarmService];
  int v16 = [(VSSpeechSpeakTask *)self voiceSelection];
  id v17 = [(VSSpeechSpeakTask *)self voiceResource];
  id v11 = [v15 loadEngineForVoice:v16 resources:v17];

  if (v11)
  {
    uint64_t v12 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    id v13 = v12;
    uint64_t v14 = 0;
LABEL_5:
    [v12 setIsWarmStart:v14];

    __int16 v18 = [VSStreamAudioData alloc];
    [v11 asbd];
    uint64_t v19 = [(VSStreamAudioData *)v18 initWithASBD:v53];
    [(VSSpeechSpeakTask *)self setStreamAudio:v19];

    uint64_t v20 = [(VSSpeechSpeakTask *)self request];
    [v20 volume];
    if (v21 == 0.0)
    {
      double v22 = [(VSSpeechSpeakTask *)self voiceResource];
      [v22 volume];
      if (v23 == 0.0) {
        [v11 volume];
      }
      objc_msgSend(v11, "setVolume:");
    }
    else
    {
      *(float *)&double v21 = v21;
      [v11 setVolume:v21];
    }

    uint64_t v24 = [(VSSpeechSpeakTask *)self request];
    [v24 pitch];
    if (v25 == 0.0)
    {
      double v26 = [(VSSpeechSpeakTask *)self voiceResource];
      [v26 pitch];
      if (v27 == 0.0) {
        [v11 pitch];
      }
      objc_msgSend(v11, "setPitch:");
    }
    else
    {
      *(float *)&double v25 = v25;
      [v11 setPitch:v25];
    }

    v28 = [(VSSpeechSpeakTask *)self request];
    [v28 rate];
    if (v29 == 0.0)
    {
      double v30 = [(VSSpeechSpeakTask *)self voiceResource];
      [v30 rate];
      if (v31 == 0.0) {
        [v11 rate];
      }
      objc_msgSend(v11, "setRate:");
    }
    else
    {
      *(float *)&double v29 = v29;
      [v11 setRate:v29];
    }

    uint64_t v32 = [(VSSpeechSpeakTask *)self request];
    uint64_t v33 = [v32 powerProfile];

    if (v33) {
      goto LABEL_30;
    }
    id v34 = objc_alloc_init(MEMORY[0x263F28588]);
    id v52 = 0;
    uint64_t v35 = [v34 currentPowerPolicyWithError:&v52];
    id v36 = v52;
    if (v35)
    {
      [v35 ttsPolicy];
      if (v51 <= 2)
      {
        uint64_t v33 = qword_226CFFD70[v51];
LABEL_29:

LABEL_30:
        [v11 setPowerProfile:v33];
        uint64_t v41 = [VSVoiceBooster alloc];
        [v11 asbd];
        double v42 = -[VSVoiceBooster initWithStreamDescription:pcmBufferSize:](v41, "initWithStreamDescription:pcmBufferSize:", &v50, [v11 pcmBufferSize]);
        [(VSSpeechSpeakTask *)self setVoiceBooster:v42];

        uint64_t v43 = [(VSSpeechSpeakTask *)self voiceSelection];
        uint64_t v44 = [v43 voiceData];
        uint64_t v45 = [(VSSpeechSpeakTask *)self request];
        [v45 volume];
        objc_msgSend(v44, "gainDecibelWithVolume:");
        int v47 = v46;
        uint64_t v48 = [(VSSpeechSpeakTask *)self voiceBooster];
        LODWORD(v49) = v47;
        [v48 setVoiceBoostGainDecibels:v49];

        [(VSSpeechSpeakTask *)self setEngine:v11];
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v40 = VSGetLogDefault();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v36;
        _os_log_error_impl(&dword_226CB1000, v40, OS_LOG_TYPE_ERROR, "Unable to get power policy from Siri, error: %@", buf, 0xCu);
      }
    }
    uint64_t v33 = 0;
    goto LABEL_29;
  }
  uint64_t v37 = (void *)MEMORY[0x263F087E8];
  uint64_t v56 = *MEMORY[0x263F08338];
  v57[0] = @"Can't create VSSpeechEngine";
  char v38 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
  int v39 = [v37 errorWithDomain:@"VoiceServicesErrorDomain" code:0 userInfo:v38];
  [(VSSpeechSpeakTask *)self setError:v39];

  id v11 = 0;
LABEL_31:
}

@end