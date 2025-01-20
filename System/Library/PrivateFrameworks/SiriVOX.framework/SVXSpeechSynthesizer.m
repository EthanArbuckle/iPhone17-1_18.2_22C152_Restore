@interface SVXSpeechSynthesizer
- (BOOL)_continueContext:(id)a3 error:(id *)a4;
- (BOOL)_isTTSPlaybackDisabled;
- (BOOL)_startPresynthesizedAudioRequestForContext:(id)a3 error:(id *)a4;
- (BOOL)_startSpeechRequestForContext:(id)a3 error:(id *)a4;
- (BOOL)_useStreamingAudio;
- (SVXSpeechSynthesizer)initWithModule:(id)a3;
- (SVXSpeechSynthesizer)initWithModule:(id)a3 speechSynthesisUtils:(id)a4 sessionUtils:(id)a5 voiceGenderConverter:(id)a6 announcer:(id)a7 configurationManager:(id)a8 audioStreamingAnnouncer:(id)a9 ttsSession:(id)a10 speechSynthesisConfigurer:(id)a11 speechRequestConfigurer:(id)a12 voiceConfigurer:(id)a13 notificationCenterRegistrar:(id)a14 speakableUtteranceParserProvider:(id)a15 localizationUtils:(id)a16 speechInstrumentationUtilities:(id)a17 metricsContextFactory:(id)a18;
- (SiriTTSDaemonSession)ttsSession;
- (unint64_t)_numberOfContexts;
- (void)_cancelPendingContextsAtIndexes:(id)a3;
- (void)_cancelPendingContextsWithOperationType:(int64_t)a3;
- (void)_cancelPendingSpeakingContextWithRequest:(id)a3;
- (void)_cancelPendingSpeakingContextsWithPriorityBelow:(int64_t)a3;
- (void)_configureWithConfiguration:(id)a3;
- (void)_duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5;
- (void)_enqueueContext:(id)a3;
- (void)_finalizeContext:(id)a3 withResultType:(int64_t)a4 utterance:(id)a5 error:(id)a6;
- (void)_handleDidFinishPresynthesizedAudioRequest:(id)a3 instrumentMetrics:(id)a4 error:(id)a5;
- (void)_handleDidFinishSpeakingWithSpeechRequest:(id)a3 instrumentMetrics:(id)a4;
- (void)_handleDidFinishSpeakingWithSpeechRequest:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_handleDidFinishSynthesizingForSpeechRequest:(id)a3 instrumentMetrics:(id)a4 error:(id)a5;
- (void)_handleDidGenerateAudioChunkData:(id)a3 forSpeechRequest:(id)a4;
- (void)_handleDidReceiveSpeechWordTimingInfoArray:(id)a3 forSpeechRequest:(id)a4;
- (void)_handleDidStartPresynthesizedAudioRequest:(id)a3 timestamp:(unint64_t)a4;
- (void)_handleDidStartSpeakingWithSpeechRequest:(id)a3 timestamp:(unint64_t)a4;
- (void)_handleDidStopPresynthesizedAudioRequest:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_postcool;
- (void)_prewarm;
- (void)_prewarmWithContext:(id)a3;
- (void)_processPendingContexts;
- (void)_startContext:(id)a3;
- (void)_stopCurrentSpeakingContextWithInterruptionBehavior:(int64_t)a3;
- (void)_stopCurrentSpeakingContextWithRequest:(id)a3 withInterruptionBehavior:(int64_t)a4;
- (void)addListener:(id)a3;
- (void)cancelPendingRequests;
- (void)cancelRequest:(id)a3;
- (void)dealloc;
- (void)didFinishPresynthesizedAudioRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5;
- (void)didFinishSpeakingRequest:(id)a3 successfully:(BOOL)a4 phonemesSpoken:(id)a5 withError:(id)a6;
- (void)didFinishSpeakingRequest:(id)a3 withInstrumentMetrics:(id)a4;
- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5;
- (void)didStartPresynthesizedAudioRequest:(id)a3;
- (void)didStartSpeakingRequest:(id)a3;
- (void)didStopPresynthesizedAudioRequest:(id)a3 atEnd:(BOOL)a4 error:(id)a5;
- (void)duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5;
- (void)enqueueRequest:(id)a3 languageCode:(id)a4 voiceName:(id)a5 gender:(int64_t)a6 audioSessionID:(unsigned int)a7 preparation:(id)a8 finalization:(id)a9 taskTracker:(id)a10 analyticsContext:(id)a11;
- (void)languageCodeChanged:(id)a3;
- (void)outputVoiceChanged:(id)a3;
- (void)postcool;
- (void)prewarm;
- (void)prewarmRequest:(id)a3;
- (void)removeListener:(id)a3;
- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4;
- (void)stopCurrentRequestWithInterruptionBehavior:(int64_t)a3;
- (void)stopRequest:(id)a3 withInterruptionBehavior:(int64_t)a4;
- (void)stopWithModuleInstanceProvider:(id)a3;
- (void)synthesizeRequest:(id)a3 audioChunkHandler:(id)a4 taskTracker:(id)a5 analyticsContext:(id)a6 completion:(id)a7;
- (void)updateWithConfiguration:(id)a3;
- (void)withRequest:(id)a3 didGenerateAudioChunk:(id)a4;
- (void)withRequest:(id)a3 didReceiveTimingInfo:(id)a4;
@end

@implementation SVXSpeechSynthesizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsSession, 0);
  objc_storeStrong((id *)&self->_metricsContextFactory, 0);
  objc_storeStrong((id *)&self->_speechInstrumentationUtilities, 0);
  objc_storeStrong((id *)&self->_localizationUtils, 0);
  objc_storeStrong((id *)&self->_speakableUtteranceParserProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenterRegistrar, 0);
  objc_storeStrong((id *)&self->_voiceConfigurer, 0);
  objc_storeStrong((id *)&self->_speechRequestConfigurer, 0);
  objc_storeStrong((id *)&self->_speechSynthesisConfigurer, 0);
  objc_storeStrong((id *)&self->_voiceGenderConverter, 0);
  objc_storeStrong((id *)&self->_sessionUtils, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
  objc_storeStrong((id *)&self->_synthesizingContexts, 0);
  objc_storeStrong((id *)&self->_pendingContexts, 0);
  objc_storeStrong((id *)&self->_currentSpeakingContext, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_announcer, 0);
  objc_storeStrong((id *)&self->_audioStreamingAnnouncer, 0);
  objc_storeStrong((id *)&self->_module, 0);

  objc_storeStrong((id *)&self->_sessionManager, 0);
}

- (SiriTTSDaemonSession)ttsSession
{
  return self->_ttsSession;
}

- (BOOL)_isTTSPlaybackDisabled
{
  v2 = _AFPreferencesValueForKey();
  char v3 = _AFPreferencesBoolFromValueWithDefault();

  return v3;
}

- (void)_duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  v8 = (void (**)(id, void *))a5;
  ttsSession = self->_ttsSession;
  if (ttsSession)
  {
    *(float *)&double v9 = a3;
    [(SiriTTSDaemonSession *)ttsSession adjustVolume:v8 rampTime:v9 didFinish:a4];
  }
  else if (v8)
  {
    v13 = v8;
    id v11 = objc_alloc(MEMORY[0x263F087E8]);
    v12 = (void *)[v11 initWithDomain:*MEMORY[0x263F28730] code:6 userInfo:0];
    v13[2](v13, v12);
  }

  MEMORY[0x270F9A758]();
}

- (void)duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__SVXSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke;
  v11[3] = &unk_264553998;
  id v12 = v8;
  id v9 = v8;
  *(float *)&double v10 = a3;
  [(SVXSpeechSynthesizer *)self _duckTTSVolumeTo:v11 rampTime:v10 completion:a4];
}

uint64_t __60__SVXSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_finalizeContext:(id)a3 withResultType:(int64_t)a4 utterance:(id)a5 error:(id)a6
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  double v10 = (SVXSpeechSynthesisContext *)a3;
  id v11 = a5;
  id v12 = a6;
  v13 = (os_log_t *)MEMORY[0x263F28348];
  v14 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    if ((unint64_t)a4 > 4) {
      v16 = @"(unknown)";
    }
    else {
      v16 = off_264553160[a4];
    }
    v17 = v16;
    *(_DWORD *)buf = 136316162;
    v85 = "-[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:]";
    __int16 v86 = 2112;
    unint64_t v87 = (unint64_t)v10;
    __int16 v88 = 2112;
    v89 = v17;
    __int16 v90 = 2112;
    id v91 = v11;
    __int16 v92 = 2112;
    id v93 = v12;
    _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s context = %@, resultType = %@, utterance = %@, error = %@", buf, 0x34u);
  }
  if (v10)
  {
    unint64_t v18 = [(SVXSpeechSynthesizer *)self _numberOfContexts];
    if (self->_currentSpeakingContext == v10)
    {
      self->_currentSpeakingContext = 0;

      v19 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
      {
        currentSpeakingContext = self->_currentSpeakingContext;
        *(_DWORD *)buf = 136315394;
        v85 = "-[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:]";
        __int16 v86 = 2112;
        unint64_t v87 = (unint64_t)currentSpeakingContext;
        _os_log_impl(&dword_220062000, v19, OS_LOG_TYPE_INFO, "%s Setting current speaking context. (_currentSpeakingContext = %@)", buf, 0x16u);
      }
    }
    [(NSMutableArray *)self->_pendingContexts removeObject:v10];
    [(NSMutableSet *)self->_synthesizingContexts removeObject:v10];
    v21 = [(SVXSpeechSynthesisContext *)v10 speechWordTimingInfoArray];
    v73 = v21;
    if (v21)
    {
      v22 = v21;
      int64_t v64 = a4;
      id v65 = v12;
      unint64_t v68 = v18;
      v71 = self;
      v75 = v10;
      v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v21, "count"));
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v24 = v22;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v78 objects:v83 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v79;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v79 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            v30 = [SVXSpeechSynthesisWordTiming alloc];
            uint64_t v31 = [v29 textRange];
            uint64_t v33 = v32;
            [v29 startTime];
            v34 = [(SVXSpeechSynthesisWordTiming *)v30 initWithRange:v31 timeInterval:v33];
            [v23 addObject:v34];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v78 objects:v83 count:16];
        }
        while (v26);
      }

      double v10 = v75;
      unint64_t v18 = v68;
      self = v71;
      a4 = v64;
      id v12 = v65;
      v13 = (os_log_t *)MEMORY[0x263F28348];
    }
    else
    {
      v23 = 0;
    }
    v35 = [[SVXSpeechSynthesisUtteranceInfo alloc] initWithUtterance:v11 wordTimings:v23];
    [(SVXSpeechSynthesisContext *)v10 finalizeWithResultType:a4 utteranceInfo:v35 error:v12];
    v76 = [(SVXSpeechSynthesisContext *)v10 request];
    v74 = [(SVXSpeechSynthesisContext *)v10 taskTracker];
    v72 = v35;
    switch(a4)
    {
      case 1:
        v36 = [(SVXModule *)self->_module analytics];
        v37 = [(SVXSpeechSynthesisContext *)v10 analyticsContext];
        [v36 logEventWithType:2704 context:v37];

        v38 = [(SVXSpeechSynthesisContext *)v10 instrumentMetrics];
        v39 = v38;
        if (!v38)
        {
          v44 = 0;
LABEL_35:
          v35 = v72;
          goto LABEL_36;
        }
        uint64_t v40 = [v38 speechBeginTime];
        v41 = v39;
        uint64_t v42 = v40;
        v69 = v41;
        uint64_t v43 = [v41 speechEndTime];
        v44 = 0;
        v35 = v72;
        uint64_t v66 = v42;
        if (v42)
        {
          v39 = v69;
          if (!v43) {
            goto LABEL_36;
          }
          int64_t v64 = v43;
          id v45 = objc_alloc(MEMORY[0x263F28698]);
          v46 = [v69 utterance];
          v44 = (void *)[v45 initWithUtterance:v46 beginTimestamp:v66 endTimestamp:v64];

          goto LABEL_35;
        }
        v39 = v69;
LABEL_36:
        -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:](self->_announcer, "speechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:", v76, v35, v44, v74, v64);

LABEL_37:
        unint64_t v61 = [(SVXSpeechSynthesizer *)self _numberOfContexts];
        v62 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v85 = "-[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:]";
          __int16 v86 = 2048;
          unint64_t v87 = v18;
          __int16 v88 = 2048;
          v89 = (__CFString *)v61;
          _os_log_impl(&dword_220062000, v62, OS_LOG_TYPE_INFO, "%s (numberOfContexts: %tu -> %tu)", buf, 0x20u);
        }
        if (v18 && !v61) {
          [(SVXSpeechSynthesisAnnouncer *)self->_announcer speechSynthesizerDidBecomeIdle];
        }

        break;
      case 2:
        v47 = [(SVXModule *)self->_module analytics];
        v48 = [(SVXSpeechSynthesisContext *)v10 analyticsContext];
        [v47 logEventWithType:2702 context:v48];

        [(SVXSpeechSynthesisAnnouncer *)self->_announcer speechSynthesizerDidCancelRequest:v76 taskTracker:v74];
        goto LABEL_33;
      case 3:
        v49 = [(SVXModule *)self->_module analytics];
        v50 = [(SVXSpeechSynthesisContext *)v10 analyticsContext];
        [v49 logEventWithType:2705 context:v50];

        [(SVXSpeechSynthesisAnnouncer *)self->_announcer speechSynthesizerDidInterruptRequest:v76 taskTracker:v74];
        goto LABEL_33;
      case 4:
        uint64_t v51 = [(SVXSpeechSynthesisContext *)v10 analyticsContext];
        v52 = AFAnalyticsContextCreateWithError();
        v53 = [(SVXModule *)self->_module analytics];
        v54 = (void *)MEMORY[0x263EFFA78];
        v67 = (void *)v51;
        if (v51) {
          uint64_t v55 = v51;
        }
        else {
          uint64_t v55 = MEMORY[0x263EFFA78];
        }
        if (v52) {
          v54 = v52;
        }
        v82[0] = v55;
        v82[1] = v54;
        objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v82, 2, v64);
        unint64_t v70 = v18;
        v57 = v56 = self;
        AFAnalyticsContextsMerge();
        v58 = v13;
        v60 = id v59 = v12;
        [v53 logEventWithType:2703 context:v60];

        id v12 = v59;
        v13 = v58;

        self = v56;
        unint64_t v18 = v70;

        [(SVXSpeechSynthesisAnnouncer *)self->_announcer speechSynthesizerDidFailRequest:v76 taskTracker:v74 error:v12];
LABEL_33:
        v35 = v72;
        goto LABEL_37;
      default:
        goto LABEL_37;
    }
  }
  v63 = [(SVXModule *)self->_module performer];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __72__SVXSpeechSynthesizer__finalizeContext_withResultType_utterance_error___block_invoke;
  v77[3] = &unk_2645548A0;
  v77[4] = self;
  [v63 performBlock:v77 withOptions:0];
}

uint64_t __72__SVXSpeechSynthesizer__finalizeContext_withResultType_utterance_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPendingContexts];
}

- (void)_stopCurrentSpeakingContextWithRequest:(id)a3 withInterruptionBehavior:(int64_t)a4
{
  currentSpeakingContext = self->_currentSpeakingContext;
  id v7 = a3;
  id v8 = [(SVXSpeechSynthesisContext *)currentSpeakingContext request];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    [(SVXSpeechSynthesizer *)self _stopCurrentSpeakingContextWithInterruptionBehavior:a4];
  }
}

- (void)_cancelPendingContextsWithOperationType:(int64_t)a3
{
  if (a3)
  {
    pendingContexts = self->_pendingContexts;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__SVXSpeechSynthesizer__cancelPendingContextsWithOperationType___block_invoke;
    v6[3] = &__block_descriptor_40_e42_B32__0__SVXSpeechSynthesisContext_8Q16_B24l;
    v6[4] = a3;
    v5 = [(NSMutableArray *)pendingContexts indexesOfObjectsPassingTest:v6];
    if ([v5 count]) {
      [(SVXSpeechSynthesizer *)self _cancelPendingContextsAtIndexes:v5];
    }
  }
}

BOOL __64__SVXSpeechSynthesizer__cancelPendingContextsWithOperationType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 operationType] == *(void *)(a1 + 32);
}

- (void)_cancelPendingSpeakingContextsWithPriorityBelow:(int64_t)a3
{
  if (a3)
  {
    pendingContexts = self->_pendingContexts;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __72__SVXSpeechSynthesizer__cancelPendingSpeakingContextsWithPriorityBelow___block_invoke;
    v6[3] = &__block_descriptor_40_e42_B32__0__SVXSpeechSynthesisContext_8Q16_B24l;
    v6[4] = a3;
    v5 = [(NSMutableArray *)pendingContexts indexesOfObjectsPassingTest:v6];
    if ([v5 count]) {
      [(SVXSpeechSynthesizer *)self _cancelPendingContextsAtIndexes:v5];
    }
  }
}

BOOL __72__SVXSpeechSynthesizer__cancelPendingSpeakingContextsWithPriorityBelow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 operationType] == 2)
  {
    v4 = [v3 request];
    BOOL v5 = [v4 priority] < *(void *)(a1 + 32);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_cancelPendingSpeakingContextWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    pendingContexts = self->_pendingContexts;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__SVXSpeechSynthesizer__cancelPendingSpeakingContextWithRequest___block_invoke;
    v8[3] = &unk_264552440;
    id v9 = v4;
    id v7 = [(NSMutableArray *)pendingContexts indexesOfObjectsPassingTest:v8];
    if ([v7 count]) {
      [(SVXSpeechSynthesizer *)self _cancelPendingContextsAtIndexes:v7];
    }
  }
}

uint64_t __65__SVXSpeechSynthesizer__cancelPendingSpeakingContextWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 operationType] == 2)
  {
    id v4 = [v3 request];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_stopCurrentSpeakingContextWithInterruptionBehavior:(int64_t)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    currentSpeakingContext = self->_currentSpeakingContext;
    id v8 = v6;
    if ((unint64_t)a3 > 2) {
      id v9 = @"(unknown)";
    }
    else {
      id v9 = off_264553008[a3];
    }
    double v10 = v9;
    int v25 = 136315650;
    uint64_t v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
    __int16 v27 = 2112;
    v28 = currentSpeakingContext;
    __int16 v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s (_currentSpeakingContext = %@, interruptionBehavior = %@)", (uint8_t *)&v25, 0x20u);
  }
  id v11 = self->_currentSpeakingContext;
  if (v11)
  {
    uint64_t v12 = [(SVXSpeechSynthesisContext *)v11 presynthesizedAudioRequest];
    uint64_t v13 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext speechRequest];
    v14 = (__CFString *)v13;
    if (v12 | v13)
    {
      if (v13)
      {
        v19 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          ttsSession = self->_ttsSession;
          int v25 = 136315650;
          uint64_t v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
          __int16 v27 = 2112;
          v28 = ttsSession;
          __int16 v29 = 2112;
          v30 = v14;
          _os_log_impl(&dword_220062000, v19, OS_LOG_TYPE_INFO, "%s Stopping TTS for current speaking request... (ttsSession = %@, speechRequest = %@)", (uint8_t *)&v25, 0x20u);
        }
        [(SiriTTSDaemonSession *)self->_ttsSession cancelWithRequest:v14];
      }
      if (v12)
      {
        v21 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          v22 = self->_ttsSession;
          int v25 = 136315650;
          uint64_t v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
          __int16 v27 = 2112;
          v28 = v22;
          __int16 v29 = 2112;
          v30 = (__CFString *)v12;
          _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s Stopping TTS with presynthesized audio for current request... (ttsSession = %@, audioRequest = %@)", (uint8_t *)&v25, 0x20u);
        }
        [(SiriTTSDaemonSession *)self->_ttsSession cancelWithRequest:v12];
      }
      v16 = self->_currentSpeakingContext;
      v17 = v14;
    }
    else
    {
      v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        id v24 = self->_currentSpeakingContext;
        int v25 = 136315394;
        uint64_t v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
        __int16 v27 = 2112;
        v28 = v24;
        _os_log_error_impl(&dword_220062000, v15, OS_LOG_TYPE_ERROR, "%s Current speaking context does NOT have an underlying speech request or presynthesized audio request when attempted to stop TTS. (_currentSpeakingContext = %@)", (uint8_t *)&v25, 0x16u);
      }
      v16 = self->_currentSpeakingContext;
      v17 = 0;
    }
    v23 = [(__CFString *)v17 text];
    [(SVXSpeechSynthesizer *)self _finalizeContext:v16 withResultType:3 utterance:v23 error:0];
  }
  else
  {
    unint64_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      int v25 = 136315138;
      uint64_t v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
      _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_INFO, "%s There's no current speaking context to stop.", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (void)_cancelPendingContextsAtIndexes:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[SVXSpeechSynthesizer _cancelPendingContextsAtIndexes:]";
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ([(NSMutableArray *)self->_pendingContexts count])
  {
    unint64_t v7 = [(SVXSpeechSynthesizer *)self _numberOfContexts];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke;
    v21[3] = &unk_2645523F0;
    v21[4] = self;
    id v8 = (void *)MEMORY[0x223C65C40](v21);
    id v9 = v8;
    pendingContexts = self->_pendingContexts;
    if (v4)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_2;
      v19[3] = &unk_264552418;
      id v11 = &v20;
      id v20 = v8;
      [(NSMutableArray *)pendingContexts enumerateObjectsAtIndexes:v4 options:0 usingBlock:v19];
      [(NSMutableArray *)self->_pendingContexts removeObjectsAtIndexes:v4];
    }
    else
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_3;
      v17[3] = &unk_264552418;
      id v11 = &v18;
      id v18 = v8;
      [(NSMutableArray *)pendingContexts enumerateObjectsUsingBlock:v17];
      [(NSMutableArray *)self->_pendingContexts removeAllObjects];
    }

    unint64_t v13 = [(SVXSpeechSynthesizer *)self _numberOfContexts];
    v14 = *v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "-[SVXSpeechSynthesizer _cancelPendingContextsAtIndexes:]";
      __int16 v24 = 2048;
      unint64_t v25 = v7;
      __int16 v26 = 2048;
      unint64_t v27 = v13;
      _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s (numberOfContexts: %tu -> %tu)", buf, 0x20u);
    }
    if (v7 && !v13) {
      [(SVXSpeechSynthesisAnnouncer *)self->_announcer speechSynthesizerDidBecomeIdle];
    }
    v15 = [(SVXModule *)self->_module performer];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_74;
    v16[3] = &unk_2645548A0;
    v16[4] = self;
    [v15 performBlock:v16 withOptions:0];
  }
  else
  {
    uint64_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[SVXSpeechSynthesizer _cancelPendingContextsAtIndexes:]";
      _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s There's no pending context to cancel.", buf, 0xCu);
    }
  }
}

void __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 finalizeWithResultType:2 utteranceInfo:0 error:0];
  id v8 = [v3 request];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) analytics];
  uint64_t v5 = [v3 analyticsContext];
  [v4 logEventWithType:2702 context:v5];

  v6 = *(void **)(*(void *)(a1 + 32) + 48);
  unint64_t v7 = [v3 taskTracker];

  [v6 speechSynthesizerDidCancelRequest:v8 taskTracker:v7];
}

uint64_t __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPendingContexts];
}

- (BOOL)_startSpeechRequestForContext:(id)a3 error:(id *)a4
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (a4) {
    *a4 = 0;
  }
  unint64_t v61 = [v6 languageCode];
  if (![v61 length]
    || ([(SVXSpeechSynthesisUtils *)self->_speechSynthesisUtils createLocaleFromLanguageCode:v61], (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = [(SVXSpeechSynthesisConfigurationStateManager *)self->_configurationManager currentConfiguration];
    id v8 = [v9 locale];

    if (!v8)
    {
      speechSynthesisUtils = self->_speechSynthesisUtils;
      id v11 = [(SVXModule *)self->_module preferences];
      id v8 = [(SVXSpeechSynthesisUtils *)speechSynthesisUtils getLocaleWithAllowsFallback:1 preferences:v11];
    }
  }
  uint64_t v12 = [v6 gender];
  v62 = [(SVXAFSpeakableUtteranceParserProvider *)self->_speakableUtteranceParserProvider getWithLocale:v8];
  [v62 setHandleTTSCodes:1];
  v60 = [v6 request];
  unint64_t v13 = [v60 speakableText];
  if (!v13)
  {
    v14 = [v60 localizationKey];
    if (v14)
    {
      v15 = [(SVXSpeechSynthesisConfigurationStateManager *)self->_configurationManager currentConfiguration];
      v16 = [v15 outputVoiceInfo];
      v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        v19 = self->_speechSynthesisUtils;
        id v20 = [(SVXModule *)self->_module preferences];
        id v18 = [(SVXSpeechSynthesisUtils *)v19 getOutputVoiceInfoWithAllowsFallback:1 preferences:v20];
      }
      if (v61)
      {
        id v21 = v61;
      }
      else
      {
        id v21 = [v18 languageCode];
      }
      v22 = v21;
      if (!v12) {
        uint64_t v12 = -[SVXSpeechSynthesisUtils getGenderFromVoiceGender:](self->_speechSynthesisUtils, "getGenderFromVoiceGender:", [v18 gender]);
      }
      unint64_t v13 = [(SVXLocalizationUtils *)self->_localizationUtils getLocalizedStringWithLanguageCode:v22 gender:v12 key:v14];
    }
    else
    {
      unint64_t v13 = 0;
    }
  }
  unsigned __int8 v89 = 0;
  id v88 = 0;
  v23 = [v62 parseStringWithFormat:v13 error:&v88 containsPrivacySensitiveContents:&v89];
  id v24 = v88;
  if (!v24)
  {
    uint64_t v28 = [v23 length];
    __int16 v29 = *MEMORY[0x263F28348];
    BOOL v30 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO);
    if (!v28)
    {
      if (v30)
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2114;
        v96 = (uint64_t (*)(uint64_t, uint64_t))v62;
        _os_log_impl(&dword_220062000, v29, OS_LOG_TYPE_INFO, "%s Speakable utterance parser parsed an empty speakableUtterance. (speakableText = %{public}@, speakableUtteranceParser = %{public}@", buf, 0x20u);
      }
      id v25 = 0;
      goto LABEL_49;
    }
    if (v30)
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v89;
      _os_log_impl(&dword_220062000, v29, OS_LOG_TYPE_INFO, "%s containsPrivacySensitiveContents = %d", buf, 0x12u);
    }
    BOOL v32 = ([v60 options] & 1) == 0 || v89 != 0;
    objc_initWeak(&location, self);
    uint64_t v33 = [v6 operationType];
    if (v33 == 1)
    {
      speechSynthesisConfigurer = self->_speechSynthesisConfigurer;
      v49 = [(SVXModule *)self->_module preferences];
      v50 = [(SVXSpeechSynthesisConfigurer *)speechSynthesisConfigurer synthesisRequestForContext:v6 preferences:v49];

      [v50 setText:v23];
      [v50 setPrivacySensitive:v32];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v96 = __Block_byref_object_copy_;
      *(void *)&long long v97 = __Block_byref_object_dispose_;
      *((void *)&v97 + 1) = 0;
      v86[0] = MEMORY[0x263EF8330];
      v86[1] = 3221225472;
      v86[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke;
      v86[3] = &unk_264552300;
      v86[4] = buf;
      [v50 setDidReportInstrument:v86];
      objc_initWeak(&v85, v50);
      v82[0] = MEMORY[0x263EF8330];
      v82[1] = 3221225472;
      void v82[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_2;
      v82[3] = &unk_264552328;
      objc_copyWeak(&v83, &location);
      objc_copyWeak(&v84, &v85);
      [v50 setDidGenerateAudio:v82];
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_3;
      v79[3] = &unk_264552350;
      objc_copyWeak(&v80, &location);
      objc_copyWeak(&v81, &v85);
      [v50 setDidGenerateWordTimings:v79];
      uint64_t v51 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        ttsSession = self->_ttsSession;
        *(_DWORD *)from = 136315650;
        *(void *)&from[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
        __int16 v91 = 2112;
        __int16 v92 = ttsSession;
        __int16 v93 = 2112;
        id v94 = v50;
        _os_log_impl(&dword_220062000, v51, OS_LOG_TYPE_INFO, "%s Starting synthesizing context... (ttsSession = %@, synthesisRequest = %@)", from, 0x20u);
      }
      v53 = self->_ttsSession;
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_68;
      v75[3] = &unk_264552378;
      objc_copyWeak(&v78, &location);
      id v54 = v50;
      id v76 = v54;
      v77 = buf;
      [(SiriTTSDaemonSession *)v53 synthesizeWithRequest:v54 didFinish:v75];
      uint64_t v55 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        v56 = self->_ttsSession;
        *(_DWORD *)from = 136315650;
        *(void *)&from[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
        __int16 v91 = 2112;
        __int16 v92 = v56;
        __int16 v93 = 2112;
        id v94 = v54;
        _os_log_impl(&dword_220062000, v55, OS_LOG_TYPE_INFO, "%s Started synthesizing context. (ttsSession = %@, synthesisRequest = %@)", from, 0x20u);
      }
      [v6 setSynthesisRequest:v54];

      objc_destroyWeak(&v78);
      objc_destroyWeak(&v81);
      objc_destroyWeak(&v80);
      objc_destroyWeak(&v84);
      objc_destroyWeak(&v83);
      objc_destroyWeak(&v85);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v33 != 2)
      {
        id v25 = [MEMORY[0x263F087E8] errorWithDomain:@"SVXSpeechSynthesisErrorDomain" code:3 userInfo:0];
        v57 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v25;
          _os_log_error_impl(&dword_220062000, v57, OS_LOG_TYPE_ERROR, "%s Speech synthesizer failed. (error = %{public}@)", buf, 0x16u);
        }
        BOOL v27 = v25 == 0;
        if (a4 && v25)
        {
          id v25 = v25;
          BOOL v27 = 0;
          *a4 = v25;
        }
        goto LABEL_61;
      }
      speechRequestConfigurer = self->_speechRequestConfigurer;
      v35 = [(SVXModule *)self->_module preferences];
      v36 = [(SVXSpeechRequestConfigurer *)speechRequestConfigurer speechRequestForContext:v6 preferences:v35];

      v37 = [v6 taskTracker];
      v38 = [v37 sessionUUID];
      [v36 setSiriRequestId:v38];

      id v39 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v40 = [v6 taskTracker];
      v41 = [v40 aceId];
      id v59 = (id *)[v39 initWithUUIDString:v41];

      [v36 setSiriAceViewId:v59];
      [v36 setText:v23];
      [v36 setPrivacySensitive:v32];
      if (([v60 options] & 2) != 0)
      {
        uint64_t v42 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
          _os_log_impl(&dword_220062000, v42, OS_LOG_TYPE_INFO, "%s Setting minimizeDeviceUsage for TTS request to prefer server side synthesis.", buf, 0xCu);
        }
        [v36 setMinimizeDeviceUsage:1];
      }
      objc_initWeak((id *)from, v36);
      v72[0] = MEMORY[0x263EF8330];
      v72[1] = 3221225472;
      v72[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_69;
      v72[3] = &unk_2645522B0;
      objc_copyWeak(&v73, &location);
      objc_copyWeak(&v74, (id *)from);
      [v36 setDidReportInstrument:v72];
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_2_70;
      v69[3] = &unk_2645523A0;
      objc_copyWeak(&v70, &location);
      objc_copyWeak(&v71, (id *)from);
      [v36 setDidStartSpeaking:v69];
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_3_71;
      v66[3] = &unk_264552350;
      objc_copyWeak(&v67, &location);
      objc_copyWeak(&v68, (id *)from);
      [v36 setDidGenerateWordTimings:v66];
      uint64_t v43 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        v44 = self->_ttsSession;
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2112;
        v96 = (uint64_t (*)(uint64_t, uint64_t))v36;
        _os_log_impl(&dword_220062000, v43, OS_LOG_TYPE_INFO, "%s Starting TTS for speaking context... (ttsSession = %@, speechRequest = %@)", buf, 0x20u);
      }
      id v45 = self->_ttsSession;
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_72;
      v63[3] = &unk_2645523C8;
      objc_copyWeak(&v64, &location);
      objc_copyWeak(&v65, (id *)from);
      [(SiriTTSDaemonSession *)v45 speakWithSpeechRequest:v36 didFinish:v63];
      v46 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        v47 = self->_ttsSession;
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v47;
        *(_WORD *)&buf[22] = 2112;
        v96 = (uint64_t (*)(uint64_t, uint64_t))v36;
        _os_log_impl(&dword_220062000, v46, OS_LOG_TYPE_INFO, "%s Started TTS for speaking context... (ttsSession = %@, speechRequest = %@)", buf, 0x20u);
      }
      [v6 setSpeechRequest:v36];
      objc_destroyWeak(&v65);
      objc_destroyWeak(&v64);
      objc_destroyWeak(&v68);
      objc_destroyWeak(&v67);
      objc_destroyWeak(&v71);
      objc_destroyWeak(&v70);
      objc_destroyWeak(&v74);
      objc_destroyWeak(&v73);
      objc_destroyWeak((id *)from);
    }
    id v25 = 0;
    BOOL v27 = 1;
LABEL_61:
    objc_destroyWeak(&location);
    goto LABEL_62;
  }
  id v25 = v24;
  __int16 v26 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v96 = (uint64_t (*)(uint64_t, uint64_t))v62;
    LOWORD(v97) = 2114;
    *(void *)((char *)&v97 + 2) = v25;
    _os_log_error_impl(&dword_220062000, v26, OS_LOG_TYPE_ERROR, "%s Speakable utterance parser failed to parse speakable text. (speakableText = %{public}@, speakableUtteranceParser = %{public}@, error = %{public}@)", buf, 0x2Au);
    if (a4) {
      goto LABEL_25;
    }
LABEL_49:
    BOOL v27 = 0;
    goto LABEL_62;
  }
  if (!a4) {
    goto LABEL_49;
  }
LABEL_25:
  id v25 = v25;
  BOOL v27 = 0;
  *a4 = v25;
LABEL_62:

  return v27;
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke(uint64_t a1, void *a2)
{
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained withRequest:v5 didGenerateAudioChunk:v4];
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained withRequest:v5 didReceiveTimingInfo:v4];
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained didFinishSynthesisRequest:*(void *)(a1 + 32) withInstrumentMetrics:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:v4];
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didFinishSpeakingRequest:v5 withInstrumentMetrics:v4];
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_2_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didStartSpeakingRequest:v2];
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_3_71(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained withRequest:v5 didReceiveTimingInfo:v4];
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_72(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didFinishSpeakingRequest:v5 successfully:v4 == 0 phonemesSpoken:0 withError:v4];
}

- (BOOL)_startPresynthesizedAudioRequestForContext:(id)a3 error:(id *)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
    __int16 v76 = 2112;
    uint64_t v77 = (uint64_t)v5;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (a4) {
    *a4 = 0;
  }
  id v54 = [v5 request];
  unint64_t v7 = [v54 presynthesizedAudio];
  uint64_t v53 = [v54 streamID];
  if (v7)
  {
    id v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v7;
      _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s presynthesizedAudio = %@", buf, 0x16u);
    }
    id v9 = objc_alloc_init(MEMORY[0x263F74DF8]);
    double v10 = [v7 data];
    [v9 setAudioData:v10];

    id v11 = [v7 decoderASBD];
    [v11 sampleRate];
    uint64_t v65 = v12;
    int v66 = [v11 formatID];
    int v67 = [v11 formatFlags];
    int v68 = [v11 bytesPerPacket];
    int v69 = [v11 framesPerPacket];
    int v70 = [v11 bytesPerFrame];
    int v71 = [v11 channelsPerFrame];
    int v72 = [v11 bitsPerChannel];
    int v13 = [v11 reserved];

    int v73 = v13;
    [v9 setAsbd:&v65];

    uint64_t v14 = [objc_alloc(MEMORY[0x263F74E18]) initWithAudio:v9];
  }
  else
  {
    if (v53)
    {
      v16 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
        __int16 v76 = 2112;
        uint64_t v77 = v53;
        _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, "%s streamID = %@", buf, 0x16u);
      }
      uint64_t v14 = 0;
LABEL_16:
      uint64_t v17 = [v5 operationType];
      BOOL v18 = v7 != 0;
      if (!v53) {
        BOOL v18 = 1;
      }
      if (!v18 && v17 == 2)
      {
        v19 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
          __int16 v76 = 2112;
          uint64_t v77 = v53;
          _os_log_error_impl(&dword_220062000, v19, OS_LOG_TYPE_ERROR, "%s operationType is speaking but presynthesizedAudio is nil for streamID:(%@). Updated to synthesizing.", buf, 0x16u);
        }
        goto LABEL_22;
      }
      if (v14 && v17 == 2)
      {
        uint64_t v31 = [v5 audioSessionID];
        if (!v31)
        {
          BOOL v32 = [v5 audioSessionAssertion];
          uint64_t v31 = [v32 audioSessionID];
          if (!v31)
          {
            uint64_t v33 = [(SVXSpeechSynthesisConfigurationStateManager *)self->_configurationManager currentConfiguration];
            uint64_t v31 = [v33 audioSessionID];
          }
        }
        v34 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
          __int16 v76 = 2048;
          uint64_t v77 = v31;
          _os_log_impl(&dword_220062000, v34, OS_LOG_TYPE_INFO, "%s audioSessionID = %lu", buf, 0x16u);
        }
        [(id)v14 setAudioSessionId:v31];
      }
      else if (v17 != 2)
      {
        if (v17 != 1)
        {
          id v29 = [MEMORY[0x263F087E8] errorWithDomain:@"SVXSpeechSynthesisErrorDomain" code:3 userInfo:0];
          v35 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
            __int16 v76 = 2114;
            uint64_t v77 = (uint64_t)v29;
            _os_log_error_impl(&dword_220062000, v35, OS_LOG_TYPE_ERROR, "%s Speech synthesizer failed. (error = %{public}@)", buf, 0x16u);
          }
LABEL_59:
          if (v29)
          {
            if (a4)
            {
              id v29 = v29;
              BOOL v15 = 0;
              *a4 = v29;
            }
            else
            {
              BOOL v15 = 0;
            }
            goto LABEL_64;
          }
LABEL_62:
          [v5 setPresynthesizedAudioRequest:v14];
          id v29 = 0;
          BOOL v15 = 1;
LABEL_64:

          goto LABEL_65;
        }
LABEL_22:
        id v20 = [v5 request];
        id v21 = [v20 speakableText];

        if ([v21 length])
        {
          uint64_t v51 = [v5 languageCode];
          if (![v51 length]
            || ([(SVXSpeechSynthesisUtils *)self->_speechSynthesisUtils createLocaleFromLanguageCode:v51], (v22 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            v23 = [(SVXSpeechSynthesisConfigurationStateManager *)self->_configurationManager currentConfiguration];
            v22 = [v23 locale];

            if (!v22)
            {
              speechSynthesisUtils = self->_speechSynthesisUtils;
              id v25 = [(SVXModule *)self->_module preferences];
              v22 = [(SVXSpeechSynthesisUtils *)speechSynthesisUtils getLocaleWithAllowsFallback:1 preferences:v25];
            }
          }
          __int16 v26 = [(SVXAFSpeakableUtteranceParserProvider *)self->_speakableUtteranceParserProvider getWithLocale:v22];
          [v26 setHandleTTSCodes:1];
          id v64 = 0;
          BOOL v27 = [v26 parseStringWithFormat:v21 error:&v64];
          id v28 = v64;
          if (v28)
          {
            id v29 = v28;
            BOOL v30 = *MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
              __int16 v76 = 2114;
              uint64_t v77 = (uint64_t)v21;
              __int16 v78 = 2114;
              uint64_t v79 = (uint64_t)v26;
              __int16 v80 = 2114;
              id v81 = v29;
              _os_log_error_impl(&dword_220062000, v30, OS_LOG_TYPE_ERROR, "%s Speakable utterance parser failed to parse speakable text. (speakableText = %{public}@, speakableUtteranceParser = %{public}@, error = %{public}@)", buf, 0x2Au);
            }
          }
          else if ([v27 length] && objc_msgSend((id)v53, "length"))
          {
            v47 = (void *)[objc_alloc(MEMORY[0x263F74E38]) initWithText:v27 identifier:v53];
            [(SiriTTSDaemonSession *)self->_ttsSession signalWithInlineStreaming:v47];
            v48 = *MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
            {
              ttsSession = self->_ttsSession;
              *(_DWORD *)buf = 136315650;
              v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
              __int16 v76 = 2112;
              uint64_t v77 = (uint64_t)ttsSession;
              __int16 v78 = 2112;
              uint64_t v79 = (uint64_t)v47;
              _os_log_impl(&dword_220062000, v48, OS_LOG_TYPE_INFO, "%s Signaled inline streaming. (session = %@, signal = %@)", buf, 0x20u);
            }

            id v29 = 0;
          }
          else
          {
            id v29 = [MEMORY[0x263F087E8] errorWithDomain:@"SVXSpeechSynthesisErrorDomain" code:5 userInfo:0];
          }
        }
        else
        {
          id v29 = [MEMORY[0x263F087E8] errorWithDomain:@"SVXSpeechSynthesisErrorDomain" code:4 userInfo:0];
        }

        goto LABEL_59;
      }
      v36 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        v37 = self->_ttsSession;
        *(_DWORD *)buf = 136315650;
        v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v37;
        __int16 v78 = 2112;
        uint64_t v79 = v14;
        _os_log_impl(&dword_220062000, v36, OS_LOG_TYPE_INFO, "%s Starting TTS with presynthesized audio for speaking context... (session = %@, audioRequest = %@)", buf, 0x20u);
      }
      v38 = [v5 taskTracker];
      id v39 = [v38 sessionUUID];
      [(id)v14 setSiriRequestId:v39];

      id v40 = objc_alloc(MEMORY[0x263F08C38]);
      v41 = [v5 taskTracker];
      uint64_t v42 = [v41 aceId];
      uint64_t v43 = (void *)[v40 initWithUUIDString:v42];

      [(id)v14 setSiriAceViewId:v43];
      objc_initWeak(&location, (id)v14);
      objc_initWeak(&from, self);
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke;
      v59[3] = &unk_2645522B0;
      objc_copyWeak(&v60, &from);
      objc_copyWeak(&v61, &location);
      [(id)v14 setDidReportInstrument:v59];
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke_2;
      v57[3] = &unk_264554990;
      v57[4] = self;
      objc_copyWeak(&v58, &location);
      [(id)v14 setDidStartSpeaking:v57];
      v44 = self->_ttsSession;
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke_3;
      v55[3] = &unk_2645522D8;
      v55[4] = self;
      objc_copyWeak(&v56, &location);
      [(SiriTTSDaemonSession *)v44 speakWithAudioRequest:v14 didFinish:v55];
      id v45 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        v46 = self->_ttsSession;
        *(_DWORD *)buf = 136315650;
        v75 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v46;
        __int16 v78 = 2112;
        uint64_t v79 = v14;
        _os_log_impl(&dword_220062000, v45, OS_LOG_TYPE_INFO, "%s Started TTS with presynthesized audio for speaking context. (session = %@, audioRequest = %@)", buf, 0x20u);
      }
      objc_destroyWeak(&v56);
      objc_destroyWeak(&v58);
      objc_destroyWeak(&v61);
      objc_destroyWeak(&v60);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      goto LABEL_62;
    }
    uint64_t v14 = 0;
  }
  if (v14 | v53) {
    goto LABEL_16;
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"SVXSpeechSynthesisErrorDomain" code:1 userInfo:0];
    BOOL v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_65:

  return v15;
}

void __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didFinishPresynthesizedAudioRequest:v5 withInstrumentMetrics:v4 error:0];
}

void __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 didStartPresynthesizedAudioRequest:WeakRetained];
}

void __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v2 didStopPresynthesizedAudioRequest:WeakRetained atEnd:v4 == 0 error:v4];
}

- (BOOL)_continueContext:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = (os_log_t *)MEMORY[0x263F28348];
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[SVXSpeechSynthesizer _continueContext:error:]";
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    uint64_t v9 = [v6 operationType];
    if (v9 == 2)
    {
      if ([v6 handledPresynthesizedAudioRequest])
      {
        id v10 = 0;
      }
      else
      {
        BOOL v12 = 1;
        [v6 setHandledPresynthesizedAudioRequest:1];
        id v22 = 0;
        BOOL v16 = [(SVXSpeechSynthesizer *)self _startPresynthesizedAudioRequestForContext:v6 error:&v22];
        id v10 = v22;
        if (v16) {
          goto LABEL_32;
        }
      }
      if (([v6 handledSpeechRequest] & 1) == 0)
      {
        BOOL v12 = 1;
        [v6 setHandledSpeechRequest:1];
        id v21 = v10;
        BOOL v14 = [(SVXSpeechSynthesizer *)self _startSpeechRequestForContext:v6 error:&v21];
        BOOL v15 = v21;
LABEL_22:
        id v17 = v15;

        id v10 = v17;
        if (!v14) {
          goto LABEL_23;
        }
LABEL_32:

        goto LABEL_33;
      }
    }
    else if (v9 == 1)
    {
      if ([v6 handledPresynthesizedAudioRequest])
      {
        id v10 = 0;
      }
      else
      {
        [v6 setHandledPresynthesizedAudioRequest:1];
        id v24 = 0;
        BOOL v13 = [(SVXSpeechSynthesizer *)self _startPresynthesizedAudioRequestForContext:v6 error:&v24];
        id v10 = v24;
        if (v13)
        {
LABEL_31:
          BOOL v12 = 0;
          goto LABEL_32;
        }
      }
      if (([v6 handledSpeechRequest] & 1) == 0)
      {
        BOOL v12 = 1;
        [v6 setHandledSpeechRequest:1];
        id v23 = v10;
        BOOL v14 = [(SVXSpeechSynthesizer *)self _startSpeechRequestForContext:v6 error:&v23];
        BOOL v15 = v23;
        goto LABEL_22;
      }
    }
    else
    {
      id v10 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SVXSpeechSynthesisErrorDomain" code:3 userInfo:0];
    }
LABEL_23:
    if (a4) {
      *a4 = v10;
    }
    BOOL v18 = *v7;
    v19 = *v7;
    if (v10)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v26 = "-[SVXSpeechSynthesizer _continueContext:error:]";
        __int16 v27 = 2112;
        id v28 = v6;
        __int16 v29 = 2112;
        id v30 = v10;
        _os_log_error_impl(&dword_220062000, v18, OS_LOG_TYPE_ERROR, "%s Unable to continue context (context = %@, error = %@).", buf, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v26 = "-[SVXSpeechSynthesizer _continueContext:error:]";
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_INFO, "%s Unable to continue context (context = %@).", buf, 0x16u);
      }
      id v10 = 0;
    }
    goto LABEL_31;
  }
  id v11 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v26 = "-[SVXSpeechSynthesizer _continueContext:error:]";
    _os_log_error_impl(&dword_220062000, v11, OS_LOG_TYPE_ERROR, "%s There's no context to continue.", buf, 0xCu);
  }
  BOOL v12 = 0;
LABEL_33:

  return v12;
}

- (void)_startContext:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = (SVXSpeechSynthesisContext *)a3;
  id v6 = (os_log_t *)MEMORY[0x263F28348];
  unint64_t v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "-[SVXSpeechSynthesizer _startContext:]";
    __int16 v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (v5)
  {
    [(SVXSpeechSynthesisContext *)v5 prepare];
    id v8 = [(SVXSpeechSynthesisContext *)v5 request];
    announcer = self->_announcer;
    id v10 = [(SVXSpeechSynthesisContext *)v5 taskTracker];
    [(SVXSpeechSynthesisAnnouncer *)announcer speechSynthesizerWillStartRequest:v8 taskTracker:v10];

    uint64_t v11 = [(SVXSpeechSynthesisContext *)v5 operationType];
    if (v11 == 2)
    {
      if ([(SVXSpeechSynthesizer *)self _isTTSPlaybackDisabled])
      {
        v19 = *MEMORY[0x263F28350];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v33 = "-[SVXSpeechSynthesizer _startContext:]";
          __int16 v34 = 2112;
          v35 = v5;
          _os_log_impl(&dword_220062000, v19, OS_LOG_TYPE_DEFAULT, "%s TTS is disabled. Cancel speaking context %@.", buf, 0x16u);
        }
        [(SVXSpeechSynthesizer *)self _finalizeContext:v5 withResultType:2 utterance:0 error:0];
        goto LABEL_16;
      }
      p_currentSpeakingContext = &self->_currentSpeakingContext;
      currentSpeakingContext = self->_currentSpeakingContext;
      if (currentSpeakingContext)
      {
        id v22 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v33 = "-[SVXSpeechSynthesizer _startContext:]";
          __int16 v34 = 2112;
          v35 = currentSpeakingContext;
          _os_log_error_impl(&dword_220062000, v22, OS_LOG_TYPE_ERROR, "%s Attempted to start a new speaking context when the current speaking context still exists. (_currentSpeakingContext = %@)", buf, 0x16u);
          currentSpeakingContext = *p_currentSpeakingContext;
        }
        id v23 = [(SVXSpeechSynthesisContext *)currentSpeakingContext speechRequest];
        id v24 = [v23 text];

        [(SVXSpeechSynthesizer *)self _finalizeContext:self->_currentSpeakingContext withResultType:3 utterance:v24 error:0];
      }
      if ([(SVXSpeechSynthesisUtils *)self->_speechSynthesisUtils requestHasSpeakableContents:v8])
      {
        BOOL v12 = [(SVXSpeechSynthesisContext *)v5 audioSessionID] == 0;
      }
      else
      {
        BOOL v12 = 0;
      }
      objc_storeStrong((id *)&self->_currentSpeakingContext, a3);
      id v25 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
      {
        __int16 v26 = *p_currentSpeakingContext;
        *(_DWORD *)buf = 136315394;
        uint64_t v33 = "-[SVXSpeechSynthesizer _startContext:]";
        __int16 v34 = 2112;
        v35 = v26;
        _os_log_impl(&dword_220062000, v25, OS_LOG_TYPE_INFO, "%s Setting current speaking context. (_currentSpeakingContext = %@)", buf, 0x16u);
      }
    }
    else
    {
      if (v11 == 1) {
        [(NSMutableSet *)self->_synthesizingContexts addObject:v5];
      }
      BOOL v12 = 0;
    }
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __38__SVXSpeechSynthesizer__startContext___block_invoke;
    v30[3] = &unk_2645548C8;
    v30[4] = self;
    BOOL v13 = v5;
    uint64_t v31 = v13;
    uint64_t v14 = MEMORY[0x223C65C40](v30);
    BOOL v15 = (void *)v14;
    if (v12)
    {
      BOOL v16 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v33 = "-[SVXSpeechSynthesizer _startContext:]";
        _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, "%s Acquiring active audio session...", buf, 0xCu);
      }
      sessionManager = self->_sessionManager;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __38__SVXSpeechSynthesizer__startContext___block_invoke_53;
      v27[3] = &unk_264552288;
      v27[4] = self;
      id v28 = v13;
      id v29 = v15;
      [(SVXSessionManager *)sessionManager getAudioSessionProviderWithCompletion:v27];
    }
    else
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }

LABEL_16:
    goto LABEL_17;
  }
  BOOL v18 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v33 = "-[SVXSpeechSynthesizer _startContext:]";
    _os_log_error_impl(&dword_220062000, v18, OS_LOG_TYPE_ERROR, "%s There's no context to start.", buf, 0xCu);
  }
LABEL_17:
}

void __38__SVXSpeechSynthesizer__startContext___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = 0;
  char v4 = [v2 _continueContext:v3 error:&v11];
  id v5 = v11;
  if ((v4 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 40) speechRequest];
    unint64_t v7 = [v6 text];

    if (v5)
    {
      uint64_t v8 = 4;
      uint64_t v9 = v7;
      id v10 = v5;
    }
    else
    {
      uint64_t v8 = 1;
      uint64_t v9 = v7;
      id v10 = 0;
    }
    [*(id *)(a1 + 32) _finalizeContext:*(void *)(a1 + 40) withResultType:v8 utterance:v9 error:v10];
  }
}

void __38__SVXSpeechSynthesizer__startContext___block_invoke_53(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SVXSpeechSynthesizer__startContext___block_invoke_2;
  v5[3] = &unk_264552260;
  char v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [a2 acquireAudioSessionForReason:@"Speech Synthesis" completion:v5];
}

void __38__SVXSpeechSynthesizer__startContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v18 = "-[SVXSpeechSynthesizer _startContext:]_block_invoke_2";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, "%s Failed to acquire active audio session. (error = %@)", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v18 = "-[SVXSpeechSynthesizer _startContext:]_block_invoke";
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s Acquired active audio session. (assertion = %@)", buf, 0x16u);
  }
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 32) performer];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__SVXSpeechSynthesizer__startContext___block_invoke_58;
  v12[3] = &unk_264553C68;
  uint64_t v9 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v9;
  id v14 = v5;
  id v15 = v6;
  id v16 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  [v8 performBlock:v12];
}

uint64_t __38__SVXSpeechSynthesizer__startContext___block_invoke_58(void *a1)
{
  id v2 = (void *)a1[5];
  uint64_t v3 = *(void **)(a1[4] + 64);
  uint64_t v4 = a1[6];
  if (v3 == v2)
  {
    [v3 setAudioSessionAssertion:v4];
    id v7 = (void *)a1[7];
    if (!v7
      || SVXAudioSessionIsNoRoutesAvailableError(v7)
      && [(id)a1[6] audioSessionID])
    {
      uint64_t v8 = *(uint64_t (**)(void))(a1[8] + 16);
      return v8();
    }
    else
    {
      uint64_t v9 = (void *)a1[4];
      uint64_t v10 = a1[5];
      uint64_t v11 = a1[7];
      return [v9 _finalizeContext:v10 withResultType:4 utterance:0 error:v11];
    }
  }
  else
  {
    id v5 = (void *)a1[6];
    return objc_msgSend(v5, "relinquish", v4);
  }
}

- (void)_processPendingContexts
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SVXSpeechSynthesizer _processPendingContexts]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  id v5 = [(SVXSpeechSynthesisConfigurationStateManager *)self->_configurationManager currentConfiguration];
  int v6 = [v5 audioSessionID];

  if (self->_needsPrewarm)
  {
    if (v6)
    {
      [(SVXSpeechSynthesizer *)self _prewarm];
    }
    else
    {
      id v7 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[SVXSpeechSynthesizer _processPendingContexts]";
        _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s Skipped prewarming because there's no audio session ID configured.", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  if ([(NSMutableArray *)self->_pendingContexts count])
  {
    id v8 = objc_alloc_init(MEMORY[0x263F089C8]);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    pendingContexts = self->_pendingContexts;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __47__SVXSpeechSynthesizer__processPendingContexts__block_invoke;
    v26[3] = &unk_264552218;
    id v10 = v8;
    id v27 = v10;
    id v28 = self;
    p_long long buf = &buf;
    id v30 = v31;
    [(NSMutableArray *)pendingContexts enumerateObjectsUsingBlock:v26];
    if (*(void *)(*((void *)&buf + 1) + 24) != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v10, "addIndex:");
    }
    if ([v10 count])
    {
      uint64_t v11 = [(NSMutableArray *)self->_pendingContexts objectsAtIndexes:v10];
      [(NSMutableArray *)self->_pendingContexts removeObjectsAtIndexes:v10];
      BOOL v12 = *v3;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v11 count];
        *(_DWORD *)uint64_t v33 = 136315394;
        __int16 v34 = "-[SVXSpeechSynthesizer _processPendingContexts]";
        __int16 v35 = 2048;
        uint64_t v36 = v13;
        _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s Dequeued %tu pending contexts to process.", v33, 0x16u);
      }

      if ([(SVXSpeechSynthesizer *)self _isInternalInstall]
        || ([(SVXModule *)self->_module preferences],
            id v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v14 shouldLogForQA],
            v14,
            v15))
      {
        [v11 enumerateObjectsUsingBlock:&__block_literal_global_52];
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v16 = v11;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(v16);
            }
            -[SVXSpeechSynthesizer _startContext:](self, "_startContext:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v32 count:16];
        }
        while (v17);
      }
    }
    else
    {
      uint64_t v21 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v33 = 136315138;
        __int16 v34 = "-[SVXSpeechSynthesizer _processPendingContexts]";
        _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s Skipped processing pending contexts because there's no suitable pending context.", v33, 0xCu);
      }
    }

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v20 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[SVXSpeechSynthesizer _processPendingContexts]";
      _os_log_impl(&dword_220062000, v20, OS_LOG_TYPE_INFO, "%s Skipped processing next pending context because there is no pending context.", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __47__SVXSpeechSynthesizer__processPendingContexts__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = [v5 request];
  uint64_t v6 = [v5 operationType];

  if (v6 == 2)
  {
    if (!*(void *)(*(void *)(a1 + 40) + 64))
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
        || (uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v7 < [v8 priority]))
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 priority];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

void __47__SVXSpeechSynthesizer__processPendingContexts__block_invoke_50(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[SVXSpeechSynthesizer _processPendingContexts]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = a3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s Dequeued[%tu] = %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_enqueueContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  int v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _enqueueContext:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  unint64_t v7 = [(SVXSpeechSynthesizer *)self _numberOfContexts];
  uint64_t v8 = [v4 operationType];
  uint64_t v9 = [v4 request];
  uint64_t v10 = [v9 priority];
  if (v8 != 2) {
    goto LABEL_19;
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v33) = 0;
  if (v10 == 3)
  {
    [(SVXSpeechSynthesizer *)self _cancelPendingSpeakingContextsWithPriorityBelow:3];
    int v15 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext request];
    BOOL v16 = [v15 priority] < 3;

    if (v16) {
      [(SVXSpeechSynthesizer *)self _stopCurrentSpeakingContextWithInterruptionBehavior:1];
    }
    goto LABEL_16;
  }
  if (v10 == 2)
  {
    [(SVXSpeechSynthesizer *)self _cancelPendingSpeakingContextsWithPriorityBelow:2];
  }
  else
  {
    if (v10 == 1)
    {
      id v11 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext request];
      BOOL v12 = [v11 priority] > 1;

      if (!v12)
      {
        if (!*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          pendingContexts = self->_pendingContexts;
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __40__SVXSpeechSynthesizer__enqueueContext___block_invoke;
          v27[3] = &unk_2645521F0;
          v27[4] = buf;
          void v27[5] = 1;
          [(NSMutableArray *)pendingContexts enumerateObjectsUsingBlock:v27];
        }
        goto LABEL_16;
      }
      uint64_t v13 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        currentSpeakingContext = self->_currentSpeakingContext;
        *(_DWORD *)id v28 = 136315394;
        id v29 = "-[SVXSpeechSynthesizer _enqueueContext:]";
        __int16 v30 = 2112;
        uint64_t v31 = currentSpeakingContext;
        _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s Ignored because current speaking context (%@) has a higher priority.", v28, 0x16u);
      }
    }
    else
    {
      uint64_t v17 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v28 = 136315138;
        id v29 = "-[SVXSpeechSynthesizer _enqueueContext:]";
        _os_log_error_impl(&dword_220062000, v17, OS_LOG_TYPE_ERROR, "%s Ignored because no priority is specified.", v28, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)&buf[8] + 24) = 1;
  }
LABEL_16:
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    [(SVXSpeechSynthesizer *)self _finalizeContext:v4 withResultType:2 utterance:0 error:0];
    _Block_object_dispose(buf, 8);
    goto LABEL_25;
  }
  kdebug_trace();
  _Block_object_dispose(buf, 8);
LABEL_19:
  announcer = self->_announcer;
  __int16 v19 = [v4 taskTracker];
  [(SVXSpeechSynthesisAnnouncer *)announcer speechSynthesizerWillEnqueueRequest:v9 taskTracker:v19];

  [(NSMutableArray *)self->_pendingContexts addObject:v4];
  unint64_t v20 = [(SVXSpeechSynthesizer *)self _numberOfContexts];
  uint64_t v21 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SVXSpeechSynthesizer _enqueueContext:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v33 = v20;
    _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s (numberOfContexts: %tu -> %tu)", buf, 0x20u);
  }
  if (!v7 && v20) {
    [(SVXSpeechSynthesisAnnouncer *)self->_announcer speechSynthesizerDidBecomeBusy];
  }
  long long v22 = [(SVXModule *)self->_module analytics];
  long long v23 = [v4 analyticsContext];
  [v22 logEventWithType:2701 context:v23];

  long long v24 = [(SVXModule *)self->_module performer];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __40__SVXSpeechSynthesizer__enqueueContext___block_invoke_48;
  v26[3] = &unk_2645548A0;
  void v26[4] = self;
  [v24 performBlock:v26 withOptions:0];

LABEL_25:
}

void __40__SVXSpeechSynthesizer__enqueueContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if ([v6 operationType] == 2)
  {
    unint64_t v7 = [v6 request];
    uint64_t v8 = [v7 priority];
    uint64_t v9 = *(void *)(a1 + 40);

    if (v8 > v9)
    {
      uint64_t v10 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        int v11 = 136315394;
        BOOL v12 = "-[SVXSpeechSynthesizer _enqueueContext:]_block_invoke";
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s Ignored because pending speaking context (%@) has a higher priority.", (uint8_t *)&v11, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

uint64_t __40__SVXSpeechSynthesizer__enqueueContext___block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPendingContexts];
}

- (unint64_t)_numberOfContexts
{
  unint64_t result = [(NSMutableArray *)self->_pendingContexts count];
  if (self->_currentSpeakingContext) {
    ++result;
  }
  return result;
}

- (void)_handleDidFinishSynthesizingForSpeechRequest:(id)a3 instrumentMetrics:(id)a4 error:(id)a5
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    id v83 = "-[SVXSpeechSynthesizer _handleDidFinishSynthesizingForSpeechRequest:instrumentMetrics:error:]";
    __int16 v84 = 2112;
    id v85 = v8;
    __int16 v86 = 2112;
    id v87 = v9;
    __int16 v88 = 2112;
    id v89 = v10;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s speechRequest = %@, instrumentMetrics = %@, error = %@", buf, 0x2Au);
  }
  synthesizingContexts = self->_synthesizingContexts;
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __93__SVXSpeechSynthesizer__handleDidFinishSynthesizingForSpeechRequest_instrumentMetrics_error___block_invoke;
  v72[3] = &unk_2645521C8;
  id v60 = v8;
  id v73 = v60;
  __int16 v13 = [(NSMutableSet *)synthesizingContexts objectsPassingTest:v72];
  if ([v13 count])
  {
    [(NSMutableSet *)self->_synthesizingContexts minusSet:v13];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v57 = v13;
    id obj = v13;
    uint64_t v63 = [obj countByEnumeratingWithState:&v68 objects:v81 count:16];
    if (!v63) {
      goto LABEL_36;
    }
    uint64_t v62 = *(void *)v69;
    int v67 = self;
    id v59 = v10;
    while (1)
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v69 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        [v15 setInstrumentMetrics:v9];
        if (v9)
        {
          int v66 = [v15 request];
          BOOL v16 = [MEMORY[0x263F08C38] UUID];
          uint64_t v17 = [v16 UUIDString];

          [(SVXSpeechSynthesisMetricsContextFactory *)self->_metricsContextFactory creationContextFromInstrumentMetrics:v9];
          v65 = id v64 = (void *)v17;
          uint64_t v79 = @"id";
          uint64_t v80 = v17;
          uint64_t v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          uint64_t v19 = [v15 analyticsContext];
          unint64_t v20 = (void *)v19;
          uint64_t v21 = (void *)MEMORY[0x263EFFA78];
          if (v19) {
            uint64_t v21 = (void *)v19;
          }
          id v22 = v21;

          BOOL v23 = [(SVXSpeechSynthesizer *)self _isInternalInstall];
          if (!v23)
          {
            id v61 = [(SVXModule *)self->_module preferences];
            int v24 = [v61 shouldLogForQA];
            long long v25 = (void *)MEMORY[0x263EFFA78];
            if (!v24) {
              goto LABEL_21;
            }
          }
          v77[0] = @"text";
          __int16 v26 = [v66 speakableText];
          id v27 = v26;
          id v28 = v26 ? v26 : &stru_26D1E1D80;
          v77[1] = @"utterance";
          v78[0] = v28;
          id v29 = [v9 utterance];
          __int16 v30 = v29;
          uint64_t v31 = v29 ? v29 : &stru_26D1E1D80;
          v78[1] = v31;
          long long v25 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];

          if (!v23) {
LABEL_21:
          }

          uint64_t v32 = [v9 requestCreatedTime];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = [(SVXModule *)self->_module analytics];
            v76[0] = v65;
            v76[1] = v18;
            v76[2] = v22;
            v76[3] = v25;
            __int16 v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:4];
            uint64_t v36 = AFAnalyticsContextsMerge();
            [v34 logEventWithType:1801 machAbsoluteTime:v33 context:v36];

            speechInstrumentationUtilities = v67->_speechInstrumentationUtilities;
            uint64_t v38 = [(SVXSpeechSynthesisContext *)v67->_currentSpeakingContext taskTracker];
            uint64_t v39 = [v38 instrumentationContext];
            uint64_t v40 = speechInstrumentationUtilities;
            self = v67;
            [(SVXSpeechInstrumentationUtilities *)v40 emitTextToSpeechRequestReceived:v39 instrumentMetrics:v9];
          }
          uint64_t v41 = [v9 synthesisBeginTime];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = [(SVXModule *)self->_module analytics];
            v75[0] = v18;
            v75[1] = v22;
            v75[2] = v25;
            v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:3];
            id v45 = AFAnalyticsContextsMerge();
            [v43 logEventWithType:1804 machAbsoluteTime:v42 context:v45];

            self = v67;
          }
          uint64_t v46 = [v9 synthesisEndTime];
          if (v46)
          {
            uint64_t v47 = v46;
            v48 = [(SVXModule *)self->_module analytics];
            v74[0] = v18;
            v74[1] = v22;
            v74[2] = v25;
            v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:3];
            v50 = AFAnalyticsContextsMerge();
            [v48 logEventWithType:1805 machAbsoluteTime:v47 context:v50];

            self = v67;
          }

          id v10 = v59;
        }
        if (v10)
        {
          if ([(SVXSpeechSynthesizer *)self _continueContext:v15 error:0]) {
            continue;
          }
          uint64_t v51 = [v60 text];
          v52 = self;
          uint64_t v53 = v15;
          uint64_t v54 = 4;
          uint64_t v55 = v51;
          id v56 = v10;
        }
        else
        {
          uint64_t v51 = [v60 text];
          v52 = self;
          uint64_t v53 = v15;
          uint64_t v54 = 1;
          uint64_t v55 = v51;
          id v56 = 0;
        }
        [(SVXSpeechSynthesizer *)v52 _finalizeContext:v53 withResultType:v54 utterance:v55 error:v56];
      }
      uint64_t v63 = [obj countByEnumeratingWithState:&v68 objects:v81 count:16];
      if (!v63)
      {
LABEL_36:

        __int16 v13 = v57;
        break;
      }
    }
  }
}

BOOL __93__SVXSpeechSynthesizer__handleDidFinishSynthesizingForSpeechRequest_instrumentMetrics_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 synthesisRequest];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_handleDidGenerateAudioChunkData:(id)a3 forSpeechRequest:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    BOOL v23 = "-[SVXSpeechSynthesizer _handleDidGenerateAudioChunkData:forSpeechRequest:]";
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s speechRequest = %@, audioChunkData = %@", buf, 0x20u);
  }
  id v9 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext speechRequest];

  if (v9 == v7)
  {
    if ([(SVXSpeechSynthesisContext *)self->_currentSpeakingContext isStreamingSynthesisRequest])
    {
      [(SVXAudioStreamingAnnouncer *)self->_audioStreamingAnnouncer audioStreamDidProvideAudio:v6];
    }
    else
    {
      [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext handleAudioChunkData:v6];
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = self->_synthesizingContexts;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v15, "speechRequest", (void)v17);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v7)
        {
          if ([v15 isStreamingSynthesisRequest]) {
            [(SVXAudioStreamingAnnouncer *)self->_audioStreamingAnnouncer audioStreamDidProvideAudio:v6];
          }
          else {
            [v15 handleAudioChunkData:v6];
          }
        }
      }
      uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (void)_handleDidReceiveSpeechWordTimingInfoArray:(id)a3 forSpeechRequest:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    BOOL v23 = "-[SVXSpeechSynthesizer _handleDidReceiveSpeechWordTimingInfoArray:forSpeechRequest:]";
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s speechRequest = %@, speechWordTimingInfoArray = %@", buf, 0x20u);
  }
  id v9 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext speechRequest];

  if (v9 == v7) {
    [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext setSpeechWordTimingInfoArray:v6];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = self->_synthesizingContexts;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v15, "speechRequest", (void)v17);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v7) {
          [v15 setSpeechWordTimingInfoArray:v6];
        }
      }
      uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (void)_handleDidFinishPresynthesizedAudioRequest:(id)a3 instrumentMetrics:(id)a4 error:(id)a5
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v8 = (SVXSpeechSynthesisContext *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    id v85 = "-[SVXSpeechSynthesizer _handleDidFinishPresynthesizedAudioRequest:instrumentMetrics:error:]";
    __int16 v86 = 2112;
    id v87 = v8;
    __int16 v88 = 2112;
    id v89 = v9;
    __int16 v90 = 2112;
    id v91 = v10;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s presynthesizedAudioRequest = %@, instrumentMetrics = %@, error = %@", buf, 0x2Au);
  }
  uint64_t v13 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext presynthesizedAudioRequest];

  if (v13 == v8)
  {
    id v14 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      *(_DWORD *)long long buf = 136315394;
      id v85 = "-[SVXSpeechSynthesizer _handleDidFinishPresynthesizedAudioRequest:instrumentMetrics:error:]";
      __int16 v86 = 2112;
      id v87 = currentSpeakingContext;
      _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s Stopped TTS with presynthesized audio for current speaking context. (_currentSpeakingContext = %@)", buf, 0x16u);
    }
    [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext setInstrumentMetrics:v9];
    if (v9)
    {
      int v72 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext request];
      id v16 = [MEMORY[0x263F08C38] UUID];
      uint64_t v17 = [v16 UUIDString];

      id v73 = [(SVXSpeechSynthesisMetricsContextFactory *)self->_metricsContextFactory creationContextFromInstrumentMetrics:v9];
      uint64_t v82 = @"id";
      long long v71 = (void *)v17;
      uint64_t v83 = v17;
      v75 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      uint64_t v18 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext analyticsContext];
      long long v19 = (void *)v18;
      long long v20 = (void *)MEMORY[0x263EFFA78];
      if (v18) {
        uint64_t v21 = (void *)v18;
      }
      else {
        uint64_t v21 = (void *)MEMORY[0x263EFFA78];
      }
      id v74 = v21;

      if ([(SVXSpeechSynthesizer *)self _isInternalInstall])
      {
        v80[0] = @"text";
        uint64_t v22 = [v72 speakableText];
        BOOL v23 = (void *)v22;
        if (v22) {
          __int16 v24 = (__CFString *)v22;
        }
        else {
          __int16 v24 = &stru_26D1E1D80;
        }
        v80[1] = @"utterance";
        v81[0] = v24;
        uint64_t v25 = [v9 utterance];
        __int16 v26 = (void *)v25;
        if (v25) {
          id v27 = (__CFString *)v25;
        }
        else {
          id v27 = &stru_26D1E1D80;
        }
        v81[1] = v27;
        long long v20 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
      }
      uint64_t v28 = [v9 requestCreatedTime];
      if (v28)
      {
        uint64_t v29 = v28;
        __int16 v30 = [(SVXModule *)self->_module analytics];
        v79[0] = v73;
        v79[1] = v75;
        v79[2] = v74;
        v79[3] = v20;
        uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:4];
        uint64_t v32 = AFAnalyticsContextsMerge();
        [v30 logEventWithType:1801 machAbsoluteTime:v29 context:v32];

        speechInstrumentationUtilities = self->_speechInstrumentationUtilities;
        uint64_t v34 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        __int16 v35 = [v34 instrumentationContext];
        [(SVXSpeechInstrumentationUtilities *)speechInstrumentationUtilities emitTextToSpeechRequestReceived:v35 instrumentMetrics:v9];
      }
      uint64_t v36 = [v9 speechBeginTime];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = [(SVXModule *)self->_module analytics];
        v78[0] = v75;
        v78[1] = v74;
        void v78[2] = v20;
        uint64_t v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:3];
        uint64_t v40 = AFAnalyticsContextsMerge();
        [v38 logEventWithType:1802 machAbsoluteTime:v37 context:v40];

        uint64_t v41 = (SVXSpeechSynthesisContext *)objc_alloc_init(MEMORY[0x263F6EDF0]);
        uint64_t v42 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        uint64_t v43 = [v42 aceId];
        [(SVXSpeechSynthesisContext *)v41 setAceID:v43];

        v44 = *MEMORY[0x263F283A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          id v85 = "-[SVXSpeechSynthesizer _handleDidFinishPresynthesizedAudioRequest:instrumentMetrics:error:]";
          __int16 v86 = 2112;
          id v87 = v41;
          _os_log_impl(&dword_220062000, v44, OS_LOG_TYPE_INFO, "%s Emit instrumentation: %@", buf, 0x16u);
        }
        id v45 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        uint64_t v46 = [v45 instrumentationContext];
        [v46 emitInstrumentation:v41 machAbsoluteTime:v37];
      }
      uint64_t v47 = [v9 speechEstimatedOutputBeginTime];
      if (v47 >= 1)
      {
        uint64_t v48 = v47;
        v49 = [(SVXModule *)self->_module analytics];
        v77[0] = v75;
        v77[1] = v74;
        void v77[2] = v20;
        v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:3];
        uint64_t v51 = AFAnalyticsContextsMerge();
        [v49 logEventWithType:1806 machAbsoluteTime:v48 context:v51];
      }
      uint64_t v52 = [v9 speechEndTime];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = [(SVXModule *)self->_module analytics];
        v76[0] = v75;
        v76[1] = v74;
        v76[2] = v20;
        uint64_t v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:3];
        id v56 = AFAnalyticsContextsMerge();
        [v54 logEventWithType:1803 machAbsoluteTime:v53 context:v56];

        v57 = (SVXSpeechSynthesisContext *)objc_alloc_init(MEMORY[0x263F6EDF8]);
        id v58 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        id v59 = [v58 aceId];
        [(SVXSpeechSynthesisContext *)v57 setAceID:v59];

        id v60 = *MEMORY[0x263F283A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          id v85 = "-[SVXSpeechSynthesizer _handleDidFinishPresynthesizedAudioRequest:instrumentMetrics:error:]";
          __int16 v86 = 2112;
          id v87 = v57;
          _os_log_impl(&dword_220062000, v60, OS_LOG_TYPE_INFO, "%s Emit instrumentation: %@", buf, 0x16u);
        }
        id v61 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        uint64_t v62 = [v61 instrumentationContext];
        [v62 emitInstrumentation:v57 machAbsoluteTime:v53];
      }
    }
    if (!v10)
    {
      long long v70 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext speechRequest];
      id v64 = [v70 text];

      uint64_t v65 = self->_currentSpeakingContext;
      int v66 = self;
      uint64_t v67 = 1;
      long long v68 = v64;
      id v69 = 0;
      goto LABEL_35;
    }
    if (![(SVXSpeechSynthesizer *)self _continueContext:self->_currentSpeakingContext error:0])
    {
      uint64_t v63 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext speechRequest];
      id v64 = [v63 text];

      uint64_t v65 = self->_currentSpeakingContext;
      int v66 = self;
      uint64_t v67 = 4;
      long long v68 = v64;
      id v69 = v10;
LABEL_35:
      [(SVXSpeechSynthesizer *)v66 _finalizeContext:v65 withResultType:v67 utterance:v68 error:v69];
    }
  }
}

- (void)_handleDidStopPresynthesizedAudioRequest:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = (SVXSpeechSynthesisContext *)a3;
  id v9 = a5;
  id v10 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v15 = 136315906;
    id v16 = "-[SVXSpeechSynthesizer _handleDidStopPresynthesizedAudioRequest:success:error:]";
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s presynthesizedAudioRequest = %@, success = %d, error = %@", (uint8_t *)&v15, 0x26u);
  }
  uint64_t v12 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext presynthesizedAudioRequest];

  if (v12 == v8)
  {
    uint64_t v13 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      int v15 = 136315394;
      id v16 = "-[SVXSpeechSynthesizer _handleDidStopPresynthesizedAudioRequest:success:error:]";
      __int16 v17 = 2112;
      uint64_t v18 = currentSpeakingContext;
      _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s Stopped TTS with presynthesized audio for current speaking context. (_currentSpeakingContext = %@)", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_handleDidStartPresynthesizedAudioRequest:(id)a3 timestamp:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v6 = (SVXSpeechSynthesisContext *)a3;
  id v7 = (os_log_t *)MEMORY[0x263F28348];
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    __int16 v19 = "-[SVXSpeechSynthesizer _handleDidStartPresynthesizedAudioRequest:timestamp:]";
    __int16 v20 = 2112;
    __int16 v21 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s presynthesizedAudioRequest = %@", (uint8_t *)&v18, 0x16u);
  }
  id v9 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext presynthesizedAudioRequest];

  if (v9 == v6)
  {
    id v10 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      int v18 = 136315394;
      __int16 v19 = "-[SVXSpeechSynthesizer _handleDidStartPresynthesizedAudioRequest:timestamp:]";
      __int16 v20 = 2112;
      __int16 v21 = currentSpeakingContext;
      _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s Started TTS with presynthesized audio for current speaking context. (_currentSpeakingContext = %@)", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v12 = [(SVXModule *)self->_module analytics];
    uint64_t v13 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext analyticsContext];
    [v12 logEventWithType:2706 context:v13];

    announcer = self->_announcer;
    int v15 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext request];
    id v16 = (void *)[objc_alloc(MEMORY[0x263F28698]) initWithUtterance:0 beginTimestamp:a4 endTimestamp:0];
    __int16 v17 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
    [(SVXSpeechSynthesisAnnouncer *)announcer speechSynthesizerDidStartRequest:v15 record:v16 taskTracker:v17];
  }
}

- (void)_handleDidFinishSpeakingWithSpeechRequest:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = (SVXSpeechSynthesisContext *)a3;
  id v9 = a5;
  id v10 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v23 = 136315906;
    __int16 v24 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:success:error:]";
    __int16 v25 = 2112;
    __int16 v26 = v8;
    __int16 v27 = 1024;
    BOOL v28 = v6;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s speechRequest = %@, success = %d, error = %@", (uint8_t *)&v23, 0x26u);
  }
  uint64_t v12 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext speechRequest];

  if (v12 == v8)
  {
    uint64_t v13 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      int v23 = 136315394;
      __int16 v24 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:success:error:]";
      __int16 v25 = 2112;
      __int16 v26 = currentSpeakingContext;
      _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s Stopped TTS for current speaking context. (_currentSpeakingContext = %@)", (uint8_t *)&v23, 0x16u);
    }
    int v15 = self->_currentSpeakingContext;
    if (!v9)
    {
      __int16 v17 = [(SVXSpeechSynthesisContext *)v8 text];
      int v18 = self;
      __int16 v19 = v15;
      uint64_t v20 = 1;
      __int16 v21 = v17;
      id v22 = 0;
      goto LABEL_10;
    }
    if (![(SVXSpeechSynthesizer *)self _continueContext:self->_currentSpeakingContext error:0])
    {
      id v16 = self->_currentSpeakingContext;
      __int16 v17 = [(SVXSpeechSynthesisContext *)v8 text];
      int v18 = self;
      __int16 v19 = v16;
      uint64_t v20 = 4;
      __int16 v21 = v17;
      id v22 = v9;
LABEL_10:
      [(SVXSpeechSynthesizer *)v18 _finalizeContext:v19 withResultType:v20 utterance:v21 error:v22];
    }
  }
}

- (void)_handleDidFinishSpeakingWithSpeechRequest:(id)a3 instrumentMetrics:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v73 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:instrumentMetrics:]";
    __int16 v74 = 2112;
    id v75 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s speechRequest = %@", buf, 0x16u);
  }
  id v9 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext speechRequest];

  if (v9 == v6)
  {
    [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext setInstrumentMetrics:v7];
    if (v7)
    {
      id v10 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext request];
      uint64_t v11 = [MEMORY[0x263F08C38] UUID];
      uint64_t v12 = [v11 UUIDString];

      id v61 = [MEMORY[0x263EFF9A0] dictionary];
      [v61 setObject:v12 forKey:@"id"];
      long long v70 = @"id";
      uint64_t v71 = v12;
      id v60 = (void *)v12;
      uint64_t v62 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      uint64_t v13 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext analyticsContext];
      id v14 = (void *)v13;
      int v15 = (void *)MEMORY[0x263EFFA78];
      if (v13) {
        int v15 = (void *)v13;
      }
      id v16 = v15;

      BOOL v17 = [(SVXSpeechSynthesizer *)self _isInternalInstall];
      uint64_t v63 = v10;
      if (v17
        || ([(SVXModule *)self->_module preferences],
            id v14 = objc_claimAutoreleasedReturnValue(),
            [v14 shouldLogForQA]))
      {
        v68[0] = @"text";
        uint64_t v18 = [v10 speakableText];
        __int16 v19 = (void *)v18;
        if (v18) {
          uint64_t v20 = (__CFString *)v18;
        }
        else {
          uint64_t v20 = &stru_26D1E1D80;
        }
        v68[1] = @"utterance";
        v69[0] = v20;
        uint64_t v21 = [v7 utterance];
        id v22 = (void *)v21;
        if (v21) {
          int v23 = (__CFString *)v21;
        }
        else {
          int v23 = &stru_26D1E1D80;
        }
        v69[1] = v23;
        __int16 v24 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];

        id v10 = v63;
        if (v17) {
          goto LABEL_19;
        }
      }
      else
      {
        __int16 v24 = (void *)MEMORY[0x263EFFA78];
      }

LABEL_19:
      uint64_t v25 = [v7 requestCreatedTime];
      if (v25)
      {
        uint64_t v26 = v25;
        __int16 v27 = [(SVXModule *)self->_module analytics];
        v67[0] = v61;
        v67[1] = v16;
        v67[2] = v24;
        BOOL v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];
        __int16 v29 = AFAnalyticsContextsMerge();
        [v27 logEventWithType:1801 machAbsoluteTime:v26 context:v29];

        speechInstrumentationUtilities = self->_speechInstrumentationUtilities;
        uint64_t v31 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        uint64_t v32 = [v31 instrumentationContext];
        [(SVXSpeechInstrumentationUtilities *)speechInstrumentationUtilities emitTextToSpeechRequestReceived:v32 instrumentMetrics:v7];

        id v10 = v63;
      }
      uint64_t v33 = [v7 speechBeginTime];
      if (v33)
      {
        uint64_t v34 = v33;
        __int16 v35 = [(SVXModule *)self->_module analytics];
        v66[0] = v62;
        v66[1] = v16;
        v66[2] = v24;
        uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:3];
        uint64_t v37 = AFAnalyticsContextsMerge();
        [v35 logEventWithType:1802 machAbsoluteTime:v34 context:v37];

        id v38 = objc_alloc_init(MEMORY[0x263F6EDF0]);
        uint64_t v39 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        uint64_t v40 = [v39 aceId];
        [v38 setAceID:v40];

        uint64_t v41 = *MEMORY[0x263F283A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          id v73 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:instrumentMetrics:]";
          __int16 v74 = 2112;
          id v75 = v38;
          _os_log_impl(&dword_220062000, v41, OS_LOG_TYPE_INFO, "%s Emit instrumentation: %@", buf, 0x16u);
        }
        uint64_t v42 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        uint64_t v43 = [v42 instrumentationContext];
        [v43 emitInstrumentation:v38 machAbsoluteTime:v34];

        id v10 = v63;
      }
      uint64_t v44 = [v7 speechEstimatedOutputBeginTime];
      if (v44 >= 1)
      {
        uint64_t v45 = v44;
        uint64_t v46 = [(SVXModule *)self->_module analytics];
        v65[0] = v62;
        v65[1] = v16;
        v65[2] = v24;
        uint64_t v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:3];
        uint64_t v48 = AFAnalyticsContextsMerge();
        [v46 logEventWithType:1806 machAbsoluteTime:v45 context:v48];

        id v10 = v63;
      }
      uint64_t v49 = [v7 speechEndTime];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = [(SVXModule *)self->_module analytics];
        v64[0] = v62;
        v64[1] = v16;
        v64[2] = v24;
        uint64_t v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:3];
        uint64_t v53 = AFAnalyticsContextsMerge();
        [v51 logEventWithType:1803 machAbsoluteTime:v50 context:v53];

        id v54 = objc_alloc_init(MEMORY[0x263F6EDF8]);
        uint64_t v55 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        id v56 = [v55 aceId];
        [v54 setAceID:v56];

        v57 = *MEMORY[0x263F283A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          id v73 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:instrumentMetrics:]";
          __int16 v74 = 2112;
          id v75 = v54;
          _os_log_impl(&dword_220062000, v57, OS_LOG_TYPE_INFO, "%s Emit instrumentation: %@", buf, 0x16u);
        }
        id v58 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
        id v59 = [v58 instrumentationContext];
        [v59 emitInstrumentation:v54 machAbsoluteTime:v50];

        id v10 = v63;
      }
    }
  }
}

- (void)_handleDidStartSpeakingWithSpeechRequest:(id)a3 timestamp:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = (SVXSpeechSynthesisContext *)a3;
  id v7 = (os_log_t *)MEMORY[0x263F28348];
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "-[SVXSpeechSynthesizer _handleDidStartSpeakingWithSpeechRequest:timestamp:]";
    __int16 v22 = 2112;
    int v23 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s speechRequest = %@", (uint8_t *)&v20, 0x16u);
  }
  id v9 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext speechRequest];

  if (v9 == v6)
  {
    id v10 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      int v20 = 136315394;
      uint64_t v21 = "-[SVXSpeechSynthesizer _handleDidStartSpeakingWithSpeechRequest:timestamp:]";
      __int16 v22 = 2112;
      int v23 = currentSpeakingContext;
      _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s Started TTS for current speaking context. (_currentSpeakingContext = %@)", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v12 = [(SVXModule *)self->_module analytics];
    uint64_t v13 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext analyticsContext];
    [v12 logEventWithType:2706 context:v13];

    announcer = self->_announcer;
    int v15 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext request];
    id v16 = objc_alloc(MEMORY[0x263F28698]);
    BOOL v17 = [(SVXSpeechSynthesisContext *)v6 text];
    uint64_t v18 = (void *)[v16 initWithUtterance:v17 beginTimestamp:a4 endTimestamp:0];
    __int16 v19 = [(SVXSpeechSynthesisContext *)self->_currentSpeakingContext taskTracker];
    [(SVXSpeechSynthesisAnnouncer *)announcer speechSynthesizerDidStartRequest:v15 record:v18 taskTracker:v19];
  }
}

- (void)_configureWithConfiguration:(id)a3
{
  if ([(SVXSpeechSynthesisConfigurationStateManager *)self->_configurationManager updateConfiguration:a3])
  {
    BOOL v4 = [(SVXModule *)self->_module performer];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__SVXSpeechSynthesizer__configureWithConfiguration___block_invoke;
    v5[3] = &unk_2645548A0;
    v5[4] = self;
    [v4 performBlock:v5 withOptions:0];
  }
}

uint64_t __52__SVXSpeechSynthesizer__configureWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPendingContexts];
}

- (void)_prewarmWithContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[SVXSpeechSynthesizer _prewarmWithContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v10, 0x16u);
  }
  voiceConfigurer = self->_voiceConfigurer;
  id v7 = [(SVXModule *)self->_module preferences];
  id v8 = [(SVXSynthesisVoiceConfigurer *)voiceConfigurer voiceForContext:v4 preferences:v7];

  id v9 = [(SVXSpeechSynthesisConfigurer *)self->_speechSynthesisConfigurer synthesisRequestForText:&stru_26D1E1D80 voice:v8];
  [(SiriTTSDaemonSession *)self->_ttsSession prewarmWithRequest:v9 didFinish:&__block_literal_global_2286];
}

void __44__SVXSpeechSynthesizer__prewarmWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      id v5 = "-[SVXSpeechSynthesizer _prewarmWithContext:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts Unable to prewarm session, error=%@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)_postcool
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[SVXSpeechSynthesizer _postcool]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(SiriTTSDaemonSession *)self->_ttsSession setKeepActive:0];
}

- (void)_prewarm
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F28348];
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[SVXSpeechSynthesizer _prewarm]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  [(SiriTTSDaemonSession *)self->_ttsSession setKeepActive:1];
  id v5 = [(SVXSpeechSynthesisConfigurationStateManager *)self->_configurationManager currentConfiguration];
  int v6 = [v5 audioSessionID];

  if (v6)
  {
    self->_needsPrewarm = 0;
    [(SVXSpeechSynthesizer *)self _prewarmWithContext:0];
  }
  else
  {
    id v7 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[SVXSpeechSynthesizer _prewarm]";
      _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s Skipped prewarming because audio session ID is unknown.", (uint8_t *)&v8, 0xCu);
    }
    self->_needsPrewarm = 1;
  }
}

- (BOOL)_useStreamingAudio
{
  return 0;
}

- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)long long buf = 136316162;
    __int16 v22 = "-[SVXSpeechSynthesizer didFinishSynthesisRequest:withInstrumentMetrics:error:]";
    __int16 v23 = 2112;
    uint64_t v24 = ttsSession;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, instrumentMetrics = %@, error = %@", buf, 0x34u);
  }
  id v13 = [(SVXModule *)self->_module performer];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__SVXSpeechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error___block_invoke;
  v17[3] = &unk_264554210;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [v13 performBlock:v17];
}

uint64_t __78__SVXSpeechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidFinishSynthesizingForSpeechRequest:*(void *)(a1 + 40) instrumentMetrics:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)withRequest:(id)a3 didGenerateAudioChunk:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)long long buf = 136315906;
    BOOL v17 = "-[SVXSpeechSynthesizer withRequest:didGenerateAudioChunk:]";
    __int16 v18 = 2112;
    id v19 = ttsSession;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, audio = %@", buf, 0x2Au);
  }
  id v10 = [(SVXModule *)self->_module performer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__SVXSpeechSynthesizer_withRequest_didGenerateAudioChunk___block_invoke;
  v13[3] = &unk_2645547B0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [v10 performBlock:v13];
}

uint64_t __58__SVXSpeechSynthesizer_withRequest_didGenerateAudioChunk___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidGenerateAudioChunkData:*(void *)(a1 + 40) forSpeechRequest:*(void *)(a1 + 48)];
}

- (void)withRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    id v10 = v8;
    *(_DWORD *)long long buf = 136315906;
    id v19 = "-[SVXSpeechSynthesizer withRequest:didReceiveTimingInfo:]";
    __int16 v20 = 2112;
    id v21 = ttsSession;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2048;
    uint64_t v25 = [v7 count];
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, timingInfo.count = %tu", buf, 0x2Au);
  }
  id v11 = [(SVXModule *)self->_module performer];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__SVXSpeechSynthesizer_withRequest_didReceiveTimingInfo___block_invoke;
  v14[3] = &unk_2645547B0;
  id v15 = v7;
  id v16 = self;
  id v17 = v6;
  id v12 = v6;
  id v13 = v7;
  [v11 performBlock:v14];
}

uint64_t __57__SVXSpeechSynthesizer_withRequest_didReceiveTimingInfo___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v26 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    id v5 = (os_log_t *)MEMORY[0x263F28348];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v1);
        }
        os_log_t v7 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v9 = v7;
          v28.id location = [v8 textRange];
          id v10 = NSStringFromRange(v28);
          [v8 startTime];
          *(_DWORD *)long long buf = 136315906;
          id v19 = "-[SVXSpeechSynthesizer withRequest:didReceiveTimingInfo:]_block_invoke";
          __int16 v20 = 2112;
          id v21 = v8;
          __int16 v22 = 2112;
          id v23 = v10;
          __int16 v24 = 2048;
          uint64_t v25 = v11;
          _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s %@ {textRange = %@, startTime = %f}", buf, 0x2Au);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v14 objects:v26 count:16];
    }
    while (v3);
  }

  return [*(id *)(a1 + 40) _handleDidReceiveSpeechWordTimingInfoArray:*(void *)(a1 + 32) forSpeechRequest:*(void *)(a1 + 48)];
}

- (void)didFinishPresynthesizedAudioRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  uint64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)long long buf = 136316162;
    __int16 v22 = "-[SVXSpeechSynthesizer didFinishPresynthesizedAudioRequest:withInstrumentMetrics:error:]";
    __int16 v23 = 2112;
    __int16 v24 = ttsSession;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, instrumentMetrics = %@, error = %@", buf, 0x34u);
  }
  id v13 = [(SVXModule *)self->_module performer];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__SVXSpeechSynthesizer_didFinishPresynthesizedAudioRequest_withInstrumentMetrics_error___block_invoke;
  v17[3] = &unk_264554210;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [v13 performBlock:v17];
}

uint64_t __88__SVXSpeechSynthesizer_didFinishPresynthesizedAudioRequest_withInstrumentMetrics_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidFinishPresynthesizedAudioRequest:*(void *)(a1 + 40) instrumentMetrics:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)didStopPresynthesizedAudioRequest:(id)a3 atEnd:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)long long buf = 136316162;
    id v20 = "-[SVXSpeechSynthesizer didStopPresynthesizedAudioRequest:atEnd:error:]";
    __int16 v21 = 2112;
    __int16 v22 = ttsSession;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 1024;
    BOOL v26 = v6;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, atEnd = %d, error = %@", buf, 0x30u);
  }
  id v12 = [(SVXModule *)self->_module performer];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__SVXSpeechSynthesizer_didStopPresynthesizedAudioRequest_atEnd_error___block_invoke;
  v15[3] = &unk_2645549E0;
  v15[4] = self;
  id v16 = v8;
  BOOL v18 = v6;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [v12 performBlock:v15];
}

uint64_t __70__SVXSpeechSynthesizer_didStopPresynthesizedAudioRequest_atEnd_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidStopPresynthesizedAudioRequest:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)didStartPresynthesizedAudioRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  kdebug_trace();
  BOOL v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)long long buf = 136315650;
    id v14 = "-[SVXSpeechSynthesizer didStartPresynthesizedAudioRequest:]";
    __int16 v15 = 2112;
    id v16 = ttsSession;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@", buf, 0x20u);
  }
  id v8 = [(SVXModule *)self->_module performer];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__SVXSpeechSynthesizer_didStartPresynthesizedAudioRequest___block_invoke;
  v10[3] = &unk_264554738;
  v10[4] = self;
  id v11 = v4;
  uint64_t v12 = v5;
  id v9 = v4;
  [v8 performBlock:v10];
}

uint64_t __59__SVXSpeechSynthesizer_didStartPresynthesizedAudioRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidStartPresynthesizedAudioRequest:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 48)];
}

- (void)didFinishSpeakingRequest:(id)a3 successfully:(BOOL)a4 phonemesSpoken:(id)a5 withError:(id)a6
{
  BOOL v7 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  kdebug_trace();
  id v11 = (id)*MEMORY[0x263F28378];
  uint64_t v12 = v11;
  os_signpost_id_t ttsSignpostInterval = self->_ttsSignpostInterval;
  if (ttsSignpostInterval - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_220062000, v12, OS_SIGNPOST_INTERVAL_END, ttsSignpostInterval, "TextToSpeech", (const char *)&unk_2200FF23F, buf, 2u);
  }

  id v14 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)long long buf = 136316162;
    id v24 = "-[SVXSpeechSynthesizer didFinishSpeakingRequest:successfully:phonemesSpoken:withError:]";
    __int16 v25 = 2112;
    BOOL v26 = ttsSession;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 1024;
    BOOL v30 = v7;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, finishedSpeaking = %d, error = %@", buf, 0x30u);
  }
  id v16 = [(SVXModule *)self->_module performer];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __87__SVXSpeechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke;
  v19[3] = &unk_2645549E0;
  void v19[4] = self;
  id v20 = v9;
  BOOL v22 = v7;
  id v21 = v10;
  id v17 = v10;
  id v18 = v9;
  [v16 performBlock:v19];
}

uint64_t __87__SVXSpeechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidFinishSpeakingWithSpeechRequest:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)didFinishSpeakingRequest:(id)a3 withInstrumentMetrics:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)long long buf = 136315650;
    id v17 = "-[SVXSpeechSynthesizer didFinishSpeakingRequest:withInstrumentMetrics:]";
    __int16 v18 = 2112;
    uint64_t v19 = ttsSession;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@", buf, 0x20u);
  }
  id v10 = [(SVXModule *)self->_module performer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__SVXSpeechSynthesizer_didFinishSpeakingRequest_withInstrumentMetrics___block_invoke;
  v13[3] = &unk_2645547B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 performBlock:v13];
}

uint64_t __71__SVXSpeechSynthesizer_didFinishSpeakingRequest_withInstrumentMetrics___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidFinishSpeakingWithSpeechRequest:*(void *)(a1 + 40) instrumentMetrics:*(void *)(a1 + 48)];
}

- (void)didStartSpeakingRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  kdebug_trace();
  id v6 = (id *)MEMORY[0x263F28378];
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)*MEMORY[0x263F28378]);
  id v8 = *v6;
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_220062000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TextToSpeech", (const char *)&unk_2200FF23F, buf, 2u);
  }

  self->_os_signpost_id_t ttsSignpostInterval = v7;
  id v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)long long buf = 136315650;
    __int16 v18 = "-[SVXSpeechSynthesizer didStartSpeakingRequest:]";
    __int16 v19 = 2112;
    __int16 v20 = ttsSession;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@", buf, 0x20u);
  }
  id v12 = [(SVXModule *)self->_module performer];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__SVXSpeechSynthesizer_didStartSpeakingRequest___block_invoke;
  v14[3] = &unk_264554738;
  void v14[4] = self;
  id v15 = v4;
  uint64_t v16 = v5;
  id v13 = v4;
  [v12 performBlock:v14];
}

uint64_t __48__SVXSpeechSynthesizer_didStartSpeakingRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidStartSpeakingWithSpeechRequest:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 48)];
}

- (void)languageCodeChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v8 = "-[SVXSpeechSynthesizer languageCodeChanged:]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SVXSpeechSynthesizer_languageCodeChanged___block_invoke;
  v6[3] = &unk_2645548A0;
  v6[4] = self;
  [v5 performBlock:v6];
}

void __44__SVXSpeechSynthesizer_languageCodeChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 88);
  id v4 = [*(id *)(v2 + 32) preferences];
  id v6 = [v3 getLocaleWithAllowsFallback:0 preferences:v4];

  uint64_t v5 = +[SVXSpeechSynthesisConfiguration configurationWithLocale:v6];
  [*(id *)(a1 + 32) _configureWithConfiguration:v5];
}

- (void)outputVoiceChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v8 = "-[SVXSpeechSynthesizer outputVoiceChanged:]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SVXSpeechSynthesizer_outputVoiceChanged___block_invoke;
  v6[3] = &unk_2645548A0;
  v6[4] = self;
  [v5 performBlock:v6];
}

void __43__SVXSpeechSynthesizer_outputVoiceChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 88);
  id v4 = [*(id *)(v2 + 32) preferences];
  id v6 = [v3 getOutputVoiceInfoWithAllowsFallback:0 preferences:v4];

  uint64_t v5 = +[SVXSpeechSynthesisConfiguration configurationWithOutputVoiceInfo:v6];
  [*(id *)(a1 + 32) _configureWithConfiguration:v5];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SVXSpeechSynthesizer_removeListener___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __39__SVXSpeechSynthesizer_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeListener:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SVXSpeechSynthesizer_addListener___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __36__SVXSpeechSynthesizer_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addListener:*(void *)(a1 + 40)];
}

- (void)updateWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SVXSpeechSynthesizer_updateWithConfiguration___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __48__SVXSpeechSynthesizer_updateWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureWithConfiguration:*(void *)(a1 + 40)];
}

- (void)postcool
{
  uint64_t v3 = [(SVXModule *)self->_module performer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SVXSpeechSynthesizer_postcool__block_invoke;
  v4[3] = &unk_2645548A0;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __32__SVXSpeechSynthesizer_postcool__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postcool];
}

- (void)prewarm
{
  uint64_t v3 = [(SVXModule *)self->_module performer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__SVXSpeechSynthesizer_prewarm__block_invoke;
  v4[3] = &unk_2645548A0;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __31__SVXSpeechSynthesizer_prewarm__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prewarm];
}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  id v4 = [(SVXModule *)self->_module performer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SVXSpeechSynthesizer_stopWithModuleInstanceProvider___block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [v4 performBlock:v5];
}

uint64_t __55__SVXSpeechSynthesizer_stopWithModuleInstanceProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  [*(id *)(a1 + 32) _cancelPendingContextsWithOperationType:2];
  id v4 = *(void **)(a1 + 32);

  return [v4 _stopCurrentSpeakingContextWithInterruptionBehavior:1];
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SVXModule *)self->_module performer];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __77__SVXSpeechSynthesizer_startWithModuleInstanceProvider_platformDependencies___block_invoke;
  v25[3] = &unk_2645547B0;
  v25[4] = self;
  id v9 = v6;
  id v26 = v9;
  id v10 = v7;
  id v27 = v10;
  [v8 performBlock:v25];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v16, "type", (void)v21) == 5)
        {
          audioStreamingAnnouncer = self->_audioStreamingAnnouncer;
          __int16 v18 = [v16 audioStreamingListener];
          [(SVXAnnouncer *)audioStreamingAnnouncer addListener:v18];
        }
        if ([v16 type] == 7)
        {
          configurationManager = self->_configurationManager;
          __int16 v20 = [v16 clientAudioSystemService];
          [(SVXSpeechSynthesisConfigurationStateManager *)configurationManager setClientAudioSystemServicing:v20];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v13);
  }
}

void __77__SVXSpeechSynthesizer_startWithModuleInstanceProvider_platformDependencies___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [a1[4] _cancelPendingContextsWithOperationType:2];
  [a1[4] _stopCurrentSpeakingContextWithInterruptionBehavior:1];
  uint64_t v2 = [a1[5] sessionManager];
  uint64_t v3 = a1[4];
  id v4 = (void *)v3[1];
  v3[1] = v2;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1[6];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v13) == 6)
        {
          id v11 = a1[4];
          uint64_t v12 = [v10 speechSynthesisListener];
          [v11 addListener:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (SVXSpeechSynthesizer)initWithModule:(id)a3 speechSynthesisUtils:(id)a4 sessionUtils:(id)a5 voiceGenderConverter:(id)a6 announcer:(id)a7 configurationManager:(id)a8 audioStreamingAnnouncer:(id)a9 ttsSession:(id)a10 speechSynthesisConfigurer:(id)a11 speechRequestConfigurer:(id)a12 voiceConfigurer:(id)a13 notificationCenterRegistrar:(id)a14 speakableUtteranceParserProvider:(id)a15 localizationUtils:(id)a16 speechInstrumentationUtilities:(id)a17 metricsContextFactory:(id)a18
{
  id v54 = a3;
  id v53 = a4;
  id v52 = a5;
  id v51 = a6;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v44 = a13;
  id v43 = a14;
  id v42 = a15;
  id v41 = a16;
  id v40 = a17;
  id v39 = a18;
  v55.receiver = self;
  v55.super_class = (Class)SVXSpeechSynthesizer;
  long long v23 = [(SVXSpeechSynthesizer *)&v55 init];
  long long v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_speechSynthesisUtils, a4);
    objc_storeStrong((id *)&v24->_sessionUtils, a5);
    objc_storeStrong((id *)&v24->_voiceGenderConverter, a6);
    objc_storeStrong((id *)&v24->_module, a3);
    objc_storeStrong((id *)&v24->_announcer, a7);
    objc_storeStrong((id *)&v24->_configurationManager, a8);
    objc_storeStrong((id *)&v24->_audioStreamingAnnouncer, a9);
    objc_storeStrong((id *)&v24->_ttsSession, a10);
    objc_storeStrong((id *)&v24->_speechSynthesisConfigurer, a11);
    objc_storeStrong((id *)&v24->_speechRequestConfigurer, a12);
    objc_storeStrong((id *)&v24->_voiceConfigurer, a13);
    objc_storeStrong((id *)&v24->_notificationCenterRegistrar, a14);
    objc_storeStrong((id *)&v24->_speakableUtteranceParserProvider, a15);
    objc_storeStrong((id *)&v24->_speechInstrumentationUtilities, a17);
    objc_storeStrong((id *)&v24->_localizationUtils, a16);
    objc_storeStrong((id *)&v24->_metricsContextFactory, a18);
    uint64_t v25 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:16];
    pendingContexts = v24->_pendingContexts;
    v24->_pendingContexts = (NSMutableArray *)v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:16];
    synthesizingContexts = v24->_synthesizingContexts;
    v24->_synthesizingContexts = (NSMutableSet *)v27;

    speechSynthesisUtils = v24->_speechSynthesisUtils;
    BOOL v30 = [(SVXModule *)v24->_module preferences];
    __int16 v31 = [(SVXSpeechSynthesisUtils *)speechSynthesisUtils getLocaleWithAllowsFallback:0 preferences:v30];

    id v32 = v24->_speechSynthesisUtils;
    uint64_t v33 = [(SVXModule *)v24->_module preferences];
    uint64_t v34 = [(SVXSpeechSynthesisUtils *)v32 getOutputVoiceInfoWithAllowsFallback:0 preferences:v33];

    __int16 v35 = [[SVXSpeechSynthesisConfiguration alloc] initWithLocale:v31 outputVoiceInfo:v34 audioSessionID:0];
    [(SVXSpeechSynthesizer *)v24 _configureWithConfiguration:v35];
    [(SVXDefaultNotificationCenterRegistrar *)v24->_notificationCenterRegistrar addObserver:v24 selector:sel_outputVoiceChanged_ name:*MEMORY[0x263F28310] object:0];
    [(SVXDefaultNotificationCenterRegistrar *)v24->_notificationCenterRegistrar addObserver:v24 selector:sel_languageCodeChanged_ name:*MEMORY[0x263F282E8] object:0];
  }
  return v24;
}

- (SVXSpeechSynthesizer)initWithModule:(id)a3
{
  id v23 = a3;
  uint64_t v3 = objc_alloc_init(SVXSpeechSynthesisUtils);
  id v4 = objc_alloc_init(SVXSessionUtils);
  id v5 = objc_alloc_init(SVXVoiceGenderConverter);
  long long v22 = objc_alloc_init(SVXSpeechSynthesisAnnouncer);
  uint64_t v6 = objc_alloc_init(SVXSpeechSynthesisConfigurationStateManager);
  long long v21 = objc_alloc_init(SVXAudioStreamingAnnouncer);
  uint64_t v7 = objc_alloc_init(SVXDefaultNotificationCenterRegistrar);
  id v19 = objc_alloc_init(MEMORY[0x263F74E28]);
  uint64_t v8 = v5;
  id v26 = v5;
  __int16 v20 = [[SVXSynthesisVoiceConfigurer alloc] initWithConfigurationManager:v6 speechSynthesisUtils:v3 sessionUtils:v4 voiceGenderConverter:v5];
  id v17 = [[SVXSpeechSynthesisConfigurer alloc] initWithVoiceConfigurer:v20];
  long long v16 = [[SVXSpeechRequestConfigurer alloc] initWithConfigurationManager:v6 voiceConfigurer:v20];
  id v9 = v3;
  uint64_t v18 = v3;
  long long v15 = [[SVXSynthesisVoiceConfigurer alloc] initWithConfigurationManager:v6 speechSynthesisUtils:v3 sessionUtils:v4 voiceGenderConverter:v8];
  long long v14 = objc_alloc_init(SVXAFSpeakableUtteranceParserProvider);
  id v10 = objc_alloc_init(SVXLocalizationUtils);
  id v11 = objc_alloc_init(SVXSpeechInstrumentationUtilities);
  uint64_t v12 = objc_alloc_init(SVXSpeechSynthesisMetricsContextFactory);
  uint64_t v25 = -[SVXSpeechSynthesizer initWithModule:speechSynthesisUtils:sessionUtils:voiceGenderConverter:announcer:configurationManager:audioStreamingAnnouncer:ttsSession:speechSynthesisConfigurer:speechRequestConfigurer:voiceConfigurer:notificationCenterRegistrar:speakableUtteranceParserProvider:localizationUtils:speechInstrumentationUtilities:metricsContextFactory:](self, "initWithModule:speechSynthesisUtils:sessionUtils:voiceGenderConverter:announcer:configurationManager:audioStreamingAnnouncer:ttsSession:speechSynthesisConfigurer:speechRequestConfigurer:voiceConfigurer:notificationCenterRegistrar:speakableUtteranceParserProvider:localizationUtils:speechInstrumentationUtilities:metricsContextFactory:", v23, v9, v4, v26, v22, v6, v21, v19, v17, v16, v15, v7, v14, v10, v11,
          v12);

  return v25;
}

- (void)stopCurrentRequestWithInterruptionBehavior:(int64_t)a3
{
  id v5 = [(SVXModule *)self->_module performer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__SVXSpeechSynthesizer_stopCurrentRequestWithInterruptionBehavior___block_invoke;
  v6[3] = &unk_264554548;
  v6[4] = self;
  void v6[5] = a3;
  [v5 performBlock:v6];
}

uint64_t __67__SVXSpeechSynthesizer_stopCurrentRequestWithInterruptionBehavior___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopCurrentSpeakingContextWithInterruptionBehavior:*(void *)(a1 + 40)];
}

- (void)cancelPendingRequests
{
  uint64_t v3 = [(SVXModule *)self->_module performer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__SVXSpeechSynthesizer_cancelPendingRequests__block_invoke;
  v4[3] = &unk_2645548A0;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __45__SVXSpeechSynthesizer_cancelPendingRequests__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelPendingContextsWithOperationType:2];
}

- (void)stopRequest:(id)a3 withInterruptionBehavior:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SVXModule *)self->_module performer];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__SVXSpeechSynthesizer_stopRequest_withInterruptionBehavior___block_invoke;
  v9[3] = &unk_264554738;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [v7 performBlock:v9];
}

uint64_t __61__SVXSpeechSynthesizer_stopRequest_withInterruptionBehavior___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopCurrentSpeakingContextWithRequest:*(void *)(a1 + 40) withInterruptionBehavior:*(void *)(a1 + 48)];
}

- (void)cancelRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SVXSpeechSynthesizer_cancelRequest___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __38__SVXSpeechSynthesizer_cancelRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelPendingSpeakingContextWithRequest:*(void *)(a1 + 40)];
}

- (void)enqueueRequest:(id)a3 languageCode:(id)a4 voiceName:(id)a5 gender:(int64_t)a6 audioSessionID:(unsigned int)a7 preparation:(id)a8 finalization:(id)a9 taskTracker:(id)a10 analyticsContext:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  if ([(SVXSpeechSynthesizer *)self _useStreamingAudio]) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = 2;
  }
  uint64_t v25 = [[SVXSpeechSynthesisContext alloc] initWithOperationType:v24 request:v23 languageCode:v22 voiceName:v21 gender:a6 audioSessionID:a7 preparation:v20 audioChunkHandler:0 finalization:v19 taskTracker:v18 analyticsContext:v17];

  if ([(SVXSpeechSynthesizer *)self _useStreamingAudio]) {
    [(SVXSpeechSynthesisContext *)v25 setIsStreamingSynthesisRequest:1];
  }
  id v26 = [(SVXModule *)self->_module performer];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __138__SVXSpeechSynthesizer_enqueueRequest_languageCode_voiceName_gender_audioSessionID_preparation_finalization_taskTracker_analyticsContext___block_invoke;
  v29[3] = &unk_2645548C8;
  v29[4] = self;
  BOOL v30 = v25;
  uint64_t v27 = v25;
  [v26 performBlock:v29];
}

uint64_t __138__SVXSpeechSynthesizer_enqueueRequest_languageCode_voiceName_gender_audioSessionID_preparation_finalization_taskTracker_analyticsContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueContext:*(void *)(a1 + 40)];
}

- (void)synthesizeRequest:(id)a3 audioChunkHandler:(id)a4 taskTracker:(id)a5 analyticsContext:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[SVXSpeechSynthesisContext alloc] initWithOperationType:1 request:v16 languageCode:0 voiceName:0 gender:0 audioSessionID:0 preparation:0 audioChunkHandler:v15 finalization:v12 taskTracker:v14 analyticsContext:v13];

  id v18 = [(SVXModule *)self->_module performer];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __100__SVXSpeechSynthesizer_synthesizeRequest_audioChunkHandler_taskTracker_analyticsContext_completion___block_invoke;
  v20[3] = &unk_2645548C8;
  v20[4] = self;
  id v21 = v17;
  id v19 = v17;
  [v18 performBlock:v20];
}

uint64_t __100__SVXSpeechSynthesizer_synthesizeRequest_audioChunkHandler_taskTracker_analyticsContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueContext:*(void *)(a1 + 40)];
}

- (void)prewarmRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SVXSpeechSynthesizer_prewarmRequest___block_invoke;
  v7[3] = &unk_2645548C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __39__SVXSpeechSynthesizer_prewarmRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[SVXSpeechSynthesisContext alloc] initWithOperationType:1 request:*(void *)(a1 + 32) languageCode:0 voiceName:0 gender:0 audioSessionID:0 preparation:0 audioChunkHandler:0 finalization:0 taskTracker:0 analyticsContext:0];
  [*(id *)(a1 + 40) _prewarmWithContext:v2];
}

- (void)dealloc
{
  [(SVXDefaultNotificationCenterRegistrar *)self->_notificationCenterRegistrar removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SVXSpeechSynthesizer;
  [(SVXSpeechSynthesizer *)&v3 dealloc];
}

@end