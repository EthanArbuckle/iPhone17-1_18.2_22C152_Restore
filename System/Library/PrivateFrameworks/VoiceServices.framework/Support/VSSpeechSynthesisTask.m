@interface VSSpeechSynthesisTask
- (BOOL)isSpeaking;
- (BOOL)readyForEagerTask;
- (VSSpeechSpeakTask)speakTask;
- (VSSpeechSynthesisTask)initWithRequest:(id)a3;
- (void)main;
- (void)reportFinish;
- (void)reportInstrumentMetrics;
- (void)reportSpeechStart;
- (void)reportTimingInfo;
- (void)setObserverForWordTimings:(id)a3;
- (void)setReadyForEagerTask:(BOOL)a3;
- (void)setSpeakTask:(id)a3;
- (void)synthesize;
@end

@implementation VSSpeechSynthesisTask

- (void).cxx_destruct
{
}

- (void)setReadyForEagerTask:(BOOL)a3
{
  self->_readyForEagerTask = a3;
}

- (BOOL)readyForEagerTask
{
  return self->_readyForEagerTask;
}

- (VSSpeechSpeakTask)speakTask
{
  return self->_speakTask;
}

- (void)reportFinish
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v3 = [(VSSpeechSynthesisTask *)self speakTask];
  v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(VSSpeechSynthesisTask *)self speakTask];
    v7 = [v6 delegate];
    v8 = [(VSSpeechSpeakTask *)self request];
    uint64_t v9 = [(VSSpeechSynthesisTask *)self isCancelled] ^ 1;
    v10 = [(VSSpeechSpeakTask *)self phonemes];
    v11 = [v10 componentsJoinedByString:@" "];
    v12 = [(VSSpeechSpeakTask *)self error];
    [v7 speechRequest:v8 didStopWithSuccess:v9 phonemesSpoken:v11 error:v12];

    v13 = VSGetLogDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v25 = [(VSSpeechSynthesisTask *)self speakTask];
      v26 = [v25 instrumentMetrics];
      uint64_t v27 = [v26 requestCreatedTimestamp];
      v28 = [(VSSpeechSpeakTask *)self error];
      int v32 = 134218242;
      uint64_t v33 = v27;
      __int16 v34 = 2112;
      v35 = v28;
      _os_log_debug_impl(&dword_226CB1000, v13, OS_LOG_TYPE_DEBUG, "Task %llu reported finish, error: %@", (uint8_t *)&v32, 0x16u);
    }
  }
  v14 = [(VSSpeechSpeakTask *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v16 = VSGetLogDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      uint64_t v18 = [v17 requestCreatedTimestamp];
      v19 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      int v32 = 134218242;
      uint64_t v33 = v18;
      __int16 v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_226CB1000, v16, OS_LOG_TYPE_DEFAULT, "Device EagerTask %llu: Instrument metric: %@", (uint8_t *)&v32, 0x16u);
    }
    v20 = [(VSSpeechSpeakTask *)self delegate];
    v21 = [(VSSpeechSpeakTask *)self request];
    v22 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    v23 = [(VSSpeechSpeakTask *)self error];
    [v20 synthesisRequest:v21 didFinishWithInstrumentMetrics:v22 error:v23];

    v24 = VSGetLogDefault();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v29 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      uint64_t v30 = [v29 requestCreatedTimestamp];
      v31 = [(VSSpeechSpeakTask *)self error];
      int v32 = 134218242;
      uint64_t v33 = v30;
      __int16 v34 = 2112;
      v35 = v31;
      _os_log_debug_impl(&dword_226CB1000, v24, OS_LOG_TYPE_DEBUG, "Task %llu reported finish, error: %@", (uint8_t *)&v32, 0x16u);
    }
  }
}

- (void)reportSpeechStart
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(VSSpeechSpeakTask *)self instrumentMetrics];
  uint64_t v4 = [v3 speechBeginTimestamp];

  if (!v4)
  {
    kdebug_trace();
    uint64_t v5 = mach_absolute_time();
    v6 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v6 setSpeechBeginTimestamp:v5];

    v7 = [(VSSpeechSynthesisTask *)self speakTask];
    v8 = [v7 delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(VSSpeechSynthesisTask *)self speakTask];
      v11 = [v10 delegate];
      v12 = [(VSSpeechSpeakTask *)self request];
      [v11 speechRequestDidStart:v12];

      v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = [(VSSpeechSpeakTask *)self instrumentMetrics];
        int v15 = 134217984;
        uint64_t v16 = [v14 requestCreatedTimestamp];
        _os_log_debug_impl(&dword_226CB1000, v13, OS_LOG_TYPE_DEBUG, "Task %llu started speaking", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)reportInstrumentMetrics
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  v3 = [(VSSpeechSynthesisTask *)self speakTask];
  uint64_t v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    v7 = [v6 utterance];
    v8 = [(VSSpeechSynthesisTask *)self speakTask];
    char v9 = [v8 instrumentMetrics];
    [v9 setUtterance:v7];

    v10 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    v11 = [v10 voiceAssetKey];
    v12 = [(VSSpeechSynthesisTask *)self speakTask];
    v13 = [v12 instrumentMetrics];
    [v13 setVoiceAssetKey:v11];

    v14 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    int v15 = [v14 voiceResourceAssetKey];
    uint64_t v16 = [(VSSpeechSynthesisTask *)self speakTask];
    uint64_t v17 = [v16 instrumentMetrics];
    [v17 setVoiceResourceAssetKey:v15];

    uint64_t v18 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v19 = [v18 synthesisBeginTimestamp];
    v20 = [(VSSpeechSynthesisTask *)self speakTask];
    v21 = [v20 instrumentMetrics];
    [v21 setSynthesisBeginTimestamp:v19];

    v22 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v23 = [v22 synthesisEndTimestamp];
    v24 = [(VSSpeechSynthesisTask *)self speakTask];
    v25 = [v24 instrumentMetrics];
    [v25 setSynthesisEndTimestamp:v23];

    v26 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v27 = [v26 speechBeginTimestamp];
    v28 = [(VSSpeechSynthesisTask *)self speakTask];
    v29 = [v28 instrumentMetrics];
    [v29 setSpeechBeginTimestamp:v27];

    uint64_t v30 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v31 = [v30 speechEndTimestamp];
    int v32 = [(VSSpeechSynthesisTask *)self speakTask];
    uint64_t v33 = [v32 instrumentMetrics];
    [v33 setSpeechEndTimestamp:v31];

    __int16 v34 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v35 = [v34 audioStartTimestampDiffs];
    uint64_t v36 = [(VSSpeechSynthesisTask *)self speakTask];
    v37 = [v36 instrumentMetrics];
    [v37 setAudioStartTimestampDiffs:v35];

    v38 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v38 audioDuration];
    double v40 = v39;
    v41 = [(VSSpeechSynthesisTask *)self speakTask];
    v42 = [v41 instrumentMetrics];
    [v42 setAudioDuration:v40];

    v43 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v44 = [v43 isWarmStart];
    v45 = [(VSSpeechSynthesisTask *)self speakTask];
    v46 = [v45 instrumentMetrics];
    [v46 setIsWarmStart:v44];

    v47 = [(VSSpeechSynthesisTask *)self speakTask];
    v48 = [v47 instrumentMetrics];
    uint64_t v49 = [v48 requestCreatedTimestamp];
    v50 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v51 = v49 - [v50 requestCreatedTimestamp];
    v52 = [(VSSpeechSynthesisTask *)self speakTask];
    v53 = [v52 instrumentMetrics];
    [v53 setEagerRequestCreatedTimestampDiffs:v51];

    v54 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v55 = [v54 promptCount];
    v56 = [(VSSpeechSynthesisTask *)self speakTask];
    v57 = [v56 instrumentMetrics];
    [v57 setPromptCount:v55];

    v58 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v59 = [v58 errorCode];
    v60 = [(VSSpeechSynthesisTask *)self speakTask];
    v61 = [v60 instrumentMetrics];
    [v61 setErrorCode:v59];

    v62 = VSGetLogDefault();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = [(VSSpeechSynthesisTask *)self speakTask];
      v64 = [v63 instrumentMetrics];
      uint64_t v65 = [v64 requestCreatedTimestamp];
      v66 = [(VSSpeechSynthesisTask *)self speakTask];
      v67 = [v66 instrumentMetrics];
      int v80 = 134218242;
      uint64_t v81 = v65;
      __int16 v82 = 2112;
      v83 = v67;
      _os_log_impl(&dword_226CB1000, v62, OS_LOG_TYPE_DEFAULT, "Device SpeakTask %llu: Instrument metric: %@", (uint8_t *)&v80, 0x16u);
    }
    v68 = [(VSSpeechSynthesisTask *)self speakTask];
    v69 = [v68 delegate];
    v70 = [(VSSpeechSynthesisTask *)self speakTask];
    v71 = [v70 request];
    v72 = [(VSSpeechSynthesisTask *)self speakTask];
    v73 = [v72 instrumentMetrics];
    [v69 speechRequest:v71 didReportInstrumentMetrics:v73];

    v74 = +[VSDiagnosticService defaultService];
    v75 = [(VSSpeechSynthesisTask *)self speakTask];
    v76 = [v75 instrumentMetrics];
    v77 = [v76 dictionaryMetrics];
    v78 = [(VSSpeechSynthesisTask *)self speakTask];
    v79 = [v78 instrumentMetrics];
    objc_msgSend(v74, "dumpInstrumentMetrics:withTimestamp:", v77, objc_msgSend(v79, "requestCreatedTimestamp"));
  }
}

- (void)reportTimingInfo
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(VSSpeechSpeakTask *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(VSSpeechSpeakTask *)self delegate];
    v6 = [(VSSpeechSpeakTask *)self request];
    v7 = [(VSSpeechSpeakTask *)self timingInfos];
    [v5 synthesisRequest:v6 didReceiveTimingInfo:v7];

    v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      int v22 = 134217984;
      uint64_t v23 = [v18 requestCreatedTimestamp];
      _os_log_debug_impl(&dword_226CB1000, v8, OS_LOG_TYPE_DEBUG, "Task %llu reported word time info", (uint8_t *)&v22, 0xCu);
    }
  }
  char v9 = [(VSSpeechSynthesisTask *)self speakTask];
  v10 = [v9 delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(VSSpeechSynthesisTask *)self speakTask];
    v13 = [v12 delegate];
    v14 = [(VSSpeechSynthesisTask *)self speakTask];
    int v15 = [v14 request];
    uint64_t v16 = [(VSSpeechSpeakTask *)self timingInfos];
    [v13 speechRequest:v15 didReceiveTimingInfo:v16];

    uint64_t v17 = VSGetLogDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = [(VSSpeechSynthesisTask *)self speakTask];
      v20 = [v19 instrumentMetrics];
      uint64_t v21 = [v20 requestCreatedTimestamp];
      int v22 = 134217984;
      uint64_t v23 = v21;
      _os_log_debug_impl(&dword_226CB1000, v17, OS_LOG_TYPE_DEBUG, "Task %llu reported word time info", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)setObserverForWordTimings:(id)a3
{
  id v4 = a3;
  char v5 = [(VSSpeechSynthesisTask *)self speakTask];
  v6 = [v5 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    objc_initWeak(&location, self);
    v8 = [(VSSpeechSpeakTask *)self playbackService];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__VSSpeechSynthesisTask_setObserverForWordTimings___block_invoke;
    v9[3] = &unk_2647DCC70;
    objc_copyWeak(&v10, &location);
    [v8 setBoundaryTimeObserverForTimingInfos:v4 usingBlock:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __51__VSSpeechSynthesisTask_setObserverForWordTimings___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    char v5 = [WeakRetained speakTask];
    v6 = [v5 delegate];
    char v7 = [v4 request];
    uint64_t v8 = [v10 textRange];
    objc_msgSend(v6, "speechRequest:didStartWithMark:forRange:", v7, 1, v8, v9);
  }
}

- (void)setSpeakTask:(id)a3
{
  id v4 = (VSSpeechSpeakTask *)a3;
  kdebug_trace();
  kdebug_trace();
  speakTask = self->_speakTask;
  self->_speakTask = v4;
}

- (void)synthesize
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [(VSSpeechSpeakTask *)self prepareForSynthesis];
  v3 = [(VSSpeechSpeakTask *)self error];

  if (!v3 && ([(VSSpeechSynthesisTask *)self isCancelled] & 1) == 0)
  {
    id v4 = [(VSSpeechSynthesisTask *)self speakTask];

    if (v4)
    {
      char v5 = [(VSSpeechSynthesisTask *)self speakTask];
      v6 = [v5 request];
      -[VSSpeechSpeakTask startPlaybackServiceWithAudioSessionID:](self, "startPlaybackServiceWithAudioSessionID:", [v6 audioSessionID]);
    }
    uint64_t v7 = mach_absolute_time();
    uint64_t v8 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    [v8 setSynthesisBeginTimestamp:v7];

    kdebug_trace();
    uint64_t v9 = [(VSSpeechSpeakTask *)self engine];
    id v10 = [(VSSpeechSpeakTask *)self request];
    char v11 = [v10 utterance];
    v12 = [(VSSpeechSpeakTask *)self request];
    uint64_t v13 = [v12 canLogRequestText];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __35__VSSpeechSynthesisTask_synthesize__block_invoke;
    v23[3] = &unk_2647DC710;
    v23[4] = self;
    v14 = [v9 synthesizeText:v11 loggable:v13 callback:v23];

    if (v14) {
      [(VSSpeechSpeakTask *)self setError:v14];
    }
    int v15 = VSGetLogDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [(VSSpeechSpeakTask *)self request];
      uint64_t v17 = [v16 utterance];
      uint64_t v18 = [v17 length];
      uint64_t v19 = [(VSSpeechSpeakTask *)self streamAudio];
      [v19 duration];
      uint64_t v21 = v20;
      int v22 = [(VSSpeechSpeakTask *)self error];
      *(_DWORD *)buf = 134218498;
      uint64_t v25 = v18;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_226CB1000, v15, OS_LOG_TYPE_INFO, "SynthesisTask done synthesize %lu characters, audio duration %f, error %@", buf, 0x20u);
    }
    [(VSSpeechSpeakTask *)self waitUntilAudioFinished];
  }
}

id __35__VSSpeechSynthesisTask_synthesize__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  if (v4 == 3)
  {
    kdebug_trace();
    uint64_t v10 = mach_absolute_time();
    char v11 = [*(id *)(a1 + 32) instrumentMetrics];
    [v11 setSynthesisEndTimestamp:v10];

    if ([v3 neuralDidFallback]) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = [v3 hasAudioClick];
    }
    [*(id *)(a1 + 32) setSynthesisHasIssue:v12];
    uint64_t v13 = [v3 numOfPromptsTriggered];
    v14 = [*(id *)(a1 + 32) instrumentMetrics];
    [v14 setPromptCount:v13];

    int v15 = [*(id *)(a1 + 32) timingInfos];

    if (!v15)
    {
      uint64_t v16 = [v3 wordTimingInfos];
      [*(id *)(a1 + 32) setTimingInfos:v16];

      uint64_t v17 = (void *)MEMORY[0x263F84EB0];
      uint64_t v18 = [*(id *)(a1 + 32) timingInfos];
      uint64_t v19 = [*(id *)(a1 + 32) request];
      uint64_t v20 = [v19 contextInfo];
      [v17 adjustWordTimingInfo:v18 forContext:v20];
    }
    [*(id *)(a1 + 32) reportTimingInfo];
    uint64_t v21 = [v3 hasAlignmentStall];
    int v22 = [*(id *)(a1 + 32) instrumentMetrics];
    [v22 setNeuralAlignmentStall:v21];

    uint64_t v23 = [v3 hasAudioClick];
    uint64_t v24 = [*(id *)(a1 + 32) instrumentMetrics];
    [v24 setNeuralAudioClick:v23];

    uint64_t v25 = [v3 neuralDidFallback];
    __int16 v26 = [*(id *)(a1 + 32) instrumentMetrics];
    [v26 setNeuralFallback:v25];
  }
  else if (v4 == 2)
  {
    id v5 = [*(id *)(a1 + 32) error];
    if (v5) {
      goto LABEL_13;
    }
    v6 = (void *)MEMORY[0x22A667AA0]();
    uint64_t v7 = [v3 mutablePCMData];
    uint64_t v8 = [*(id *)(a1 + 32) voiceBooster];
    uint64_t v9 = [v8 processData:v7];

    if (v9) {
      goto LABEL_5;
    }
    __int16 v28 = [*(id *)(a1 + 32) streamAudio];
    [v28 appendAudioData:v7 packetCount:0 packetDescriptions:0];

    v29 = [*(id *)(a1 + 32) request];
    int v30 = [v29 shouldStreamAudioData];

    if (v30)
    {
      id v31 = objc_alloc_init(MEMORY[0x263F84E18]);
      int v32 = [*(id *)(a1 + 32) engine];
      uint64_t v33 = v32;
      if (v32)
      {
        [v32 asbd];
      }
      else
      {
        uint64_t v53 = 0;
        long long v51 = 0u;
        long long v52 = 0u;
      }
      v49[0] = v51;
      v49[1] = v52;
      uint64_t v50 = v53;
      [v31 setAsbd:v49];

      [v31 setAudioData:v7];
      __int16 v34 = [*(id *)(a1 + 32) delegate];
      uint64_t v35 = [*(id *)(a1 + 32) request];
      [v34 synthesisRequest:v35 didGenerateAudioChunk:v31];
    }
    uint64_t v36 = [*(id *)(a1 + 32) speakTask];

    if (v36)
    {
      v37 = *(void **)(a1 + 32);
      v38 = [v37 speakTask];
      double v39 = [v38 request];
      objc_msgSend(v37, "startPlaybackServiceWithAudioSessionID:", objc_msgSend(v39, "audioSessionID"));

      uint64_t v9 = [*(id *)(a1 + 32) error];
      if (v9)
      {
LABEL_5:
        id v5 = v9;

        goto LABEL_13;
      }
      double v40 = [*(id *)(a1 + 32) playbackService];
      [v40 enqueue:v7 packetCount:0 packetDescriptions:0];

      v41 = [*(id *)(a1 + 32) taskAuxiliaryQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __35__VSSpeechSynthesisTask_synthesize__block_invoke_2;
      block[3] = &unk_2647DCD78;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v41, block);

      v42 = [*(id *)(a1 + 32) timingInfos];
      if (!v42)
      {
        id v43 = objc_alloc(MEMORY[0x263EFF8C0]);
        uint64_t v44 = [v3 wordTimingInfos];
        v42 = (void *)[v43 initWithArray:v44 copyItems:1];

        v45 = (void *)MEMORY[0x263F84EB0];
        v46 = [*(id *)(a1 + 32) request];
        v47 = [v46 contextInfo];
        [v45 adjustWordTimingInfo:v42 forContext:v47];
      }
      [*(id *)(a1 + 32) setObserverForWordTimings:v42];
    }
  }
  id v5 = 0;
LABEL_13:

  return v5;
}

uint64_t __35__VSSpeechSynthesisTask_synthesize__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportSpeechStart];
}

- (void)main
{
  v59[1] = *MEMORY[0x263EF8340];
  kdebug_trace();
  [(VSSpeechSpeakTask *)self fetchVoiceResource];
  [(VSSpeechSpeakTask *)self fetchVoiceAsset];
  id v3 = objc_opt_new();
  uint64_t v4 = [(VSSpeechSpeakTask *)self request];
  id v5 = [v4 text];
  v6 = [(VSSpeechSpeakTask *)self request];
  uint64_t v7 = [v6 languageCode];
  uint64_t v8 = [(VSSpeechSpeakTask *)self request];
  uint64_t v9 = [v8 voiceName];
  uint64_t v10 = [v3 estimatedTTSWordTimingForText:v5 withLanguage:v7 voiceName:v9];
  [(VSSpeechSpeakTask *)self setTimingInfos:v10];

  char v11 = (void *)MEMORY[0x263F84EB0];
  uint64_t v12 = [(VSSpeechSpeakTask *)self timingInfos];
  uint64_t v13 = [(VSSpeechSpeakTask *)self request];
  v14 = [v13 contextInfo];
  [v11 adjustWordTimingInfo:v12 forContext:v14];

  int v15 = [(VSSpeechSpeakTask *)self error];

  if (!v15)
  {
    uint64_t v35 = [(VSSpeechSpeakTask *)self cachingService];
    [v35 fetchCacheForTask:self];

    uint64_t v36 = [(VSSpeechSpeakTask *)self speechCache];

    if (v36)
    {
      [(VSSpeechSynthesisTask *)self reportTimingInfo];
      v37 = [(VSSpeechSpeakTask *)self request];
      int v38 = [v37 shouldStreamAudioData];

      if (v38)
      {
        double v39 = [(VSSpeechSpeakTask *)self speechCache];
        double v40 = [(VSSpeechSpeakTask *)self delegate];
        v41 = [(VSSpeechSpeakTask *)self request];
        v42 = [v39 audio];
        [v40 synthesisRequest:v41 didGenerateAudioChunk:v42];
      }
      id v43 = [(VSSpeechSynthesisTask *)self speakTask];

      if (v43) {
        [(VSSpeechSpeakTask *)self speakCachedAudio];
      }
    }
    else
    {
      [(VSSpeechSynthesisTask *)self synthesize];
      uint64_t v44 = [(VSSpeechSpeakTask *)self error];

      if (!v44)
      {
        v45 = [(VSSpeechSpeakTask *)self streamAudio];
        [v45 duration];
        double v47 = v46;
        v48 = [(VSSpeechSpeakTask *)self instrumentMetrics];
        [v48 setAudioDuration:v47];
      }
    }
    uint64_t v49 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v50 = [v49 speechBeginTimestamp];

    if (v50 >= 1)
    {
      uint64_t v51 = mach_absolute_time();
      long long v52 = [(VSSpeechSpeakTask *)self instrumentMetrics];
      [v52 setSpeechEndTimestamp:v51];

      uint64_t v53 = [(VSSpeechSpeakTask *)self playbackService];
      LODWORD(v52) = [v53 discontinuedDuringPlayback];

      if (v52)
      {
        v54 = [(VSSpeechSpeakTask *)self instrumentMetrics];
        [v54 setErrorCode:452];
      }
    }
  }
  [(VSSpeechSynthesisTask *)self setReadyForEagerTask:0];
  if ([(VSSpeechSynthesisTask *)self isCancelled])
  {
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v58 = *MEMORY[0x263F08328];
    v59[0] = @"Synthesis is cancelled/interrupted.";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v59 forKeys:&v58 count:1];
    uint64_t v18 = [v16 errorWithDomain:@"VoiceServicesErrorDomain" code:400 userInfo:v17];
    [(VSSpeechSpeakTask *)self setError:v18];
  }
  uint64_t v19 = [(VSSpeechSpeakTask *)self error];

  if (!v19) {
    [(VSSpeechSynthesisTask *)self reportInstrumentMetrics];
  }
  uint64_t v20 = [(VSSpeechSpeakTask *)self error];
  if (!v20)
  {
    uint64_t v21 = [(VSSpeechSynthesisTask *)self speakTask];

    if (!v21) {
      goto LABEL_10;
    }
    kdebug_trace();
    uint64_t v20 = +[VSDiagnosticService defaultService];
    int v22 = [(VSSpeechSpeakTask *)self streamAudio];
    uint64_t v23 = [(VSSpeechSpeakTask *)self request];
    [v20 dumpStreamAudio:v22 forRequest:v23];
  }
LABEL_10:
  uint64_t v24 = [(VSSpeechSpeakTask *)self error];

  if (!v24)
  {
    uint64_t v25 = [(VSSpeechSpeakTask *)self request];
    __int16 v26 = [v25 outputPath];
    uint64_t v27 = [v26 path];

    if (v27)
    {
      __int16 v28 = [(VSSpeechSpeakTask *)self streamAudio];
      char v29 = [v28 writeWaveToFilePath:v27];

      if ((v29 & 1) == 0)
      {
        int v30 = (void *)MEMORY[0x263F087E8];
        uint64_t v56 = *MEMORY[0x263F08328];
        v57 = @"writeWaveToFilePath failed.";
        id v31 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        int v32 = [v30 errorWithDomain:@"VoiceServicesErrorDomain" code:501 userInfo:v31];
        [(VSSpeechSpeakTask *)self setError:v32];
      }
    }
    if ([(VSSpeechSynthesisTask *)self isCancelled]) {
      goto LABEL_19;
    }
    uint64_t v33 = [(VSSpeechSpeakTask *)self request];
    if ([v33 shouldCache])
    {
      __int16 v34 = [(VSSpeechSpeakTask *)self speechCache];
      if (!v34)
      {
        BOOL v55 = [(VSSpeechSpeakTask *)self synthesisHasIssue];

        if (!v55) {
          [(VSSpeechSpeakTask *)self enqueueCache];
        }
        goto LABEL_19;
      }
    }
LABEL_19:
  }
  [(VSSpeechSynthesisTask *)self reportFinish];
  [(VSSpeechSpeakTask *)self logFinish];
  kdebug_trace();
}

- (BOOL)isSpeaking
{
  v2 = [(VSSpeechSynthesisTask *)self speakTask];

  return v2 != 0;
}

- (VSSpeechSynthesisTask)initWithRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSSpeechSynthesisTask;
  result = [(VSSpeechSpeakTask *)&v4 initWithRequest:a3];
  if (result) {
    result->_readyForEagerTask = 1;
  }
  return result;
}

@end