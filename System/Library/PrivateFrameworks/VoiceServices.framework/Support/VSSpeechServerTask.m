@interface VSSpeechServerTask
- (BOOL)isEagerCache;
- (BOOL)isNeuralFallbackCondition;
- (BOOL)isSpeaking;
- (BOOL)readyForEagerTask;
- (BOOL)shouldDeferDeviceTTS;
- (BOOL)shouldRelyOnServerTTS;
- (BOOL)shouldSpeak;
- (BOOL)speechStartReported;
- (BOOL)useDeviceSynthesis;
- (BOOL)useServerResponse;
- (NSArray)deferredTTSTimingInfo;
- (NSArray)wordTimingInfo;
- (NSError)error;
- (VSAudioData)serverAudio;
- (VSAudioPlaybackService)playbackService;
- (VSCachingService)cachingService;
- (VSDeviceTTSCore)synthesisCore;
- (VSInstrumentMetrics)instrumentMetrics;
- (VSOspreyTTSCore)ospreyCore;
- (VSSiriInstrumentation)siriInstrumentation;
- (VSSiriServerConfiguration)serverTTSConfig;
- (VSSpeechInternalSettings)internalSettings;
- (VSSpeechRequest)request;
- (VSSpeechServerTask)init;
- (VSSpeechServerTask)initWithRequest:(id)a3 shouldSpeak:(BOOL)a4;
- (VSSpeechServerTask)speakTask;
- (VSSpeechServiceDelegate)delegate;
- (_opaque_pthread_cond_t)timeoutCondition;
- (_opaque_pthread_mutex_t)racingMutex;
- (double)deviceTTSWaitTime;
- (id)audioPowerProvider;
- (id)eagerTaskHashForRequest:(id)a3;
- (id)enqueueAudioData:(id)a3;
- (id)handleDeviceSynthesis:(id)a3 timingInfo:(id)a4;
- (id)handleServerResponse:(id)a3 timingInfo:(id)a4;
- (id)taskHash;
- (id)voiceKey;
- (void)broadcastTimeoutCondition;
- (void)cancel;
- (void)dealloc;
- (void)fallbackToDeviceSynthesis;
- (void)main;
- (void)ospreyCore:(id)a3 didFinishWithError:(id)a4;
- (void)ospreyCore:(id)a3 didReceiveAudio:(id)a4 wordTimingInfo:(id)a5;
- (void)proceedWithServerTTS;
- (void)proceedWithSpeechCache:(id)a3;
- (void)reportFinish;
- (void)reportInstrumentMetrics;
- (void)reportSpeechStart;
- (void)reportTimingInfo;
- (void)resume;
- (void)setCachingService:(id)a3;
- (void)setDeferredTTSTimingInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceTTSWaitTime:(double)a3;
- (void)setError:(id)a3;
- (void)setInstrumentMetrics:(id)a3;
- (void)setInternalSettings:(id)a3;
- (void)setIsEagerCache:(BOOL)a3;
- (void)setIsNeuralFallbackCondition:(BOOL)a3;
- (void)setObserverForWordTimings:(id)a3;
- (void)setOspreyCore:(id)a3;
- (void)setPlaybackService:(id)a3;
- (void)setRacingMutex:(_opaque_pthread_mutex_t *)a3;
- (void)setReadyForEagerTask:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setServerAudio:(id)a3;
- (void)setServerTTSConfig:(id)a3;
- (void)setShouldSpeak:(BOOL)a3;
- (void)setSiriInstrumentation:(id)a3;
- (void)setSpeakTask:(id)a3;
- (void)setSpeechStartReported:(BOOL)a3;
- (void)setSynthesisCore:(id)a3;
- (void)setTimeoutCondition:(_opaque_pthread_cond_t *)a3;
- (void)setUseDeviceSynthesis:(BOOL)a3;
- (void)setUseServerResponse:(BOOL)a3;
- (void)setWordTimingInfo:(id)a3;
- (void)speakRetryPhrase;
- (void)suspend;
- (void)synthesisCore:(id)a3 didReceiveAudio:(id)a4;
- (void)synthesisCore:(id)a3 didReceiveWordTimingInfo:(id)a4;
- (void)writeAudioIfNeeded:(id)a3;
@end

@implementation VSSpeechServerTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverTTSConfig, 0);
  objc_storeStrong((id *)&self->_cachingService, 0);
  objc_storeStrong((id *)&self->_ospreyCore, 0);
  objc_storeStrong((id *)&self->_internalSettings, 0);
  objc_storeStrong((id *)&self->_siriInstrumentation, 0);
  objc_storeStrong((id *)&self->_deferredTTSTimingInfo, 0);
  objc_storeStrong((id *)&self->_serverAudio, 0);
  objc_storeStrong((id *)&self->_synthesisCore, 0);
  objc_storeStrong((id *)&self->_speakTask, 0);
  objc_storeStrong((id *)&self->_wordTimingInfo, 0);
  objc_storeStrong((id *)&self->_playbackService, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setServerTTSConfig:(id)a3
{
}

- (VSSiriServerConfiguration)serverTTSConfig
{
  return self->_serverTTSConfig;
}

- (void)setCachingService:(id)a3
{
}

- (VSCachingService)cachingService
{
  return self->_cachingService;
}

- (void)setOspreyCore:(id)a3
{
}

- (VSOspreyTTSCore)ospreyCore
{
  return self->_ospreyCore;
}

- (void)setInternalSettings:(id)a3
{
}

- (VSSpeechInternalSettings)internalSettings
{
  return self->_internalSettings;
}

- (void)setSiriInstrumentation:(id)a3
{
}

- (VSSiriInstrumentation)siriInstrumentation
{
  return self->_siriInstrumentation;
}

- (void)setDeferredTTSTimingInfo:(id)a3
{
}

- (NSArray)deferredTTSTimingInfo
{
  return self->_deferredTTSTimingInfo;
}

- (void)setServerAudio:(id)a3
{
}

- (VSAudioData)serverAudio
{
  return self->_serverAudio;
}

- (void)setRacingMutex:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__opaque[40];
  long long v5 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  *(_OWORD *)&self->_racingMutex.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_racingMutex.__opaque[40] = v3;
  *(_OWORD *)&self->_racingMutex.__sig = v5;
  *(_OWORD *)&self->_racingMutex.__opaque[8] = v4;
}

- (_opaque_pthread_mutex_t)racingMutex
{
  long long v3 = *(_OWORD *)&self[7].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[6].__opaque[40];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[7].__opaque[24];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[7].__opaque[8];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setIsEagerCache:(BOOL)a3
{
  self->_isEagerCache = a3;
}

- (BOOL)isEagerCache
{
  return self->_isEagerCache;
}

- (void)setSpeechStartReported:(BOOL)a3
{
  self->_speechStartReported = a3;
}

- (BOOL)speechStartReported
{
  return self->_speechStartReported;
}

- (void)setUseDeviceSynthesis:(BOOL)a3
{
  self->_useDeviceSynthesis = a3;
}

- (BOOL)useDeviceSynthesis
{
  return self->_useDeviceSynthesis;
}

- (void)setUseServerResponse:(BOOL)a3
{
  self->_useServerResponse = a3;
}

- (BOOL)useServerResponse
{
  return self->_useServerResponse;
}

- (void)setSynthesisCore:(id)a3
{
}

- (VSDeviceTTSCore)synthesisCore
{
  return self->_synthesisCore;
}

- (void)setSpeakTask:(id)a3
{
}

- (VSSpeechServerTask)speakTask
{
  return self->_speakTask;
}

- (void)setReadyForEagerTask:(BOOL)a3
{
  self->_readyForEagerTask = a3;
}

- (BOOL)readyForEagerTask
{
  return self->_readyForEagerTask;
}

- (void)setDeviceTTSWaitTime:(double)a3
{
  self->_deviceTTSWaitTime = a3;
}

- (void)setTimeoutCondition:(_opaque_pthread_cond_t *)a3
{
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v3 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_timeoutCondition.__sig = *(_OWORD *)&a3->__sig;
  *(_OWORD *)&self->_timeoutCondition.__opaque[8] = v4;
  *(_OWORD *)&self->_timeoutCondition.__opaque[24] = v3;
}

- (_opaque_pthread_cond_t)timeoutCondition
{
  long long v3 = *(_OWORD *)&self[8].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[8].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[8].__opaque[24];
  return self;
}

- (void)setWordTimingInfo:(id)a3
{
}

- (NSArray)wordTimingInfo
{
  return self->_wordTimingInfo;
}

- (void)setPlaybackService:(id)a3
{
}

- (VSAudioPlaybackService)playbackService
{
  return self->_playbackService;
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
  return self->_instrumentMetrics;
}

- (void)setRequest:(id)a3
{
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (void)setIsNeuralFallbackCondition:(BOOL)a3
{
  self->_isNeuralFallbackCondition = a3;
}

- (BOOL)isNeuralFallbackCondition
{
  return self->_isNeuralFallbackCondition;
}

- (void)setShouldSpeak:(BOOL)a3
{
  self->_shouldSpeak = a3;
}

- (BOOL)shouldSpeak
{
  return self->_shouldSpeak;
}

- (void)setDelegate:(id)a3
{
}

- (VSSpeechServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSSpeechServiceDelegate *)WeakRetained;
}

- (void)ospreyCore:(id)a3 didFinishWithError:(id)a4
{
}

- (void)ospreyCore:(id)a3 didReceiveAudio:(id)a4 wordTimingInfo:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(VSSpeechServerTask *)self instrumentMetrics];
  uint64_t v11 = [v10 voiceAssetKey];
  if (v11)
  {
    v12 = (void *)v11;
  }
  else
  {
    v13 = [v21 voice];

    if (!v13) {
      goto LABEL_6;
    }
    v10 = [v21 voice];
    v12 = [v10 voiceKey];
    v14 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v14 setVoiceAssetKey:v12];
  }
LABEL_6:
  v15 = [(VSSpeechServerTask *)self instrumentMetrics];
  uint64_t v16 = [v15 voiceResourceAssetKey];
  if (v16)
  {
    v17 = (void *)v16;
  }
  else
  {
    v18 = [v21 voiceResource];

    if (!v18) {
      goto LABEL_11;
    }
    v15 = [v21 voiceResource];
    v17 = [v15 key];
    v19 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v19 setVoiceResourceAssetKey:v17];
  }
LABEL_11:
  id v20 = [(VSSpeechServerTask *)self handleServerResponse:v8 timingInfo:v9];
}

- (void)synthesisCore:(id)a3 didReceiveWordTimingInfo:(id)a4
{
  id v4 = [(VSSpeechServerTask *)self handleDeviceSynthesis:0 timingInfo:a4];
}

- (void)synthesisCore:(id)a3 didReceiveAudio:(id)a4
{
  id v4 = [(VSSpeechServerTask *)self handleDeviceSynthesis:a4 timingInfo:0];
}

- (id)audioPowerProvider
{
  v2 = [(VSSpeechServerTask *)self playbackService];
  long long v3 = [v2 audioPowerProvider];

  return v3;
}

- (void)writeAudioIfNeeded:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    id v6 = v4;
  }
  else
  {
    objc_opt_class();
    id v6 = 0;
    v7 = 0;
    id v8 = 0;
    id v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
  }
  id v9 = v4;
  v7 = v5;
  id v8 = v6;
LABEL_5:
  v10 = [(VSSpeechServerTask *)self speakTask];
  if (v10)
  {
  }
  else if (![(VSSpeechServerTask *)self shouldSpeak])
  {
    goto LABEL_13;
  }
  if (v8)
  {
    uint64_t v11 = +[VSDiagnosticService defaultService];
    v12 = [(VSSpeechServerTask *)self request];
    [v11 dumpStreamAudio:v8 forRequest:v12];
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    uint64_t v11 = +[VSDiagnosticService defaultService];
    v12 = [(VSSpeechServerTask *)self request];
    [v11 dumpCompressedAudio:v7 forRequest:v12];
  }

LABEL_13:
  v13 = [(VSSpeechServerTask *)self request];
  v14 = [v13 outputPath];
  v15 = [v14 path];

  if (!v15) {
    goto LABEL_22;
  }
  if (v8)
  {
    int v16 = [v8 writeWaveToFilePath:v15];
  }
  else
  {
    if (!v7)
    {
      int v17 = 0;
      goto LABEL_19;
    }
    int v16 = [v7 writeToFilePath:v15];
  }
  int v17 = v16 ^ 1;
LABEL_19:
  v18 = [(VSSpeechServerTask *)self error];

  if (!v18 && v17)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08328];
    v23[0] = @"writeWaveToFilePath failed.";
    id v20 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v21 = [v19 errorWithDomain:@"VoiceServicesErrorDomain" code:501 userInfo:v20];
    [(VSSpeechServerTask *)self setError:v21];
  }
LABEL_22:
}

- (void)reportFinish
{
  v98[1] = *MEMORY[0x263EF8340];
  BOOL shouldSpeak = self->_shouldSpeak;
  id v4 = [(VSSpeechServerTask *)self delegate];
  if (shouldSpeak)
  {
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(VSSpeechServerTask *)self delegate];
      v7 = [(VSSpeechServerTask *)self request];
      uint64_t v8 = [(VSSpeechServerTask *)self isCancelled] ^ 1;
      id v9 = [(VSSpeechServerTask *)self error];
      [v6 speechRequest:v7 didStopWithSuccess:v8 phonemesSpoken:&stru_26DAD0E18 error:v9];
LABEL_6:
    }
  }
  else
  {
    int v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v6 = [(VSSpeechServerTask *)self delegate];
      v7 = [(VSSpeechServerTask *)self request];
      id v9 = [(VSSpeechServerTask *)self instrumentMetrics];
      uint64_t v11 = [(VSSpeechServerTask *)self error];
      [v6 synthesisRequest:v7 didFinishWithInstrumentMetrics:v9 error:v11];

      goto LABEL_6;
    }
  }
  uint64_t v12 = [(VSSpeechServerTask *)self speakTask];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(VSSpeechServerTask *)self speakTask];
    v15 = [v14 delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      int v17 = [(VSSpeechServerTask *)self speakTask];
      v18 = [v17 delegate];
      v19 = [(VSSpeechServerTask *)self speakTask];
      id v20 = [v19 request];
      uint64_t v21 = [(VSSpeechServerTask *)self isCancelled] ^ 1;
      uint64_t v22 = [(VSSpeechServerTask *)self error];
      [v18 speechRequest:v20 didStopWithSuccess:v21 phonemesSpoken:&stru_26DAD0E18 error:v22];
    }
  }
  uint64_t v23 = [(VSSpeechServerTask *)self error];
  if (!v23) {
    goto LABEL_14;
  }
  v24 = (void *)v23;
  v25 = [(VSSpeechServerTask *)self error];
  if ([v25 code] == 400)
  {

LABEL_14:
    v28 = [(VSSpeechServerTask *)self speakTask];
    if (v28) {
      BOOL v29 = 1;
    }
    else {
      BOOL v29 = [(VSSpeechServerTask *)self isEagerCache];
    }

    v30 = [(VSSpeechServerTask *)self voiceKey];
    v31 = VSGetLogDefault();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v83 = [(VSSpeechServerTask *)self instrumentMetrics];
      uint64_t v79 = [v83 requestCreatedTimestamp];
      int v32 = [(VSSpeechServerTask *)self isCancelled];
      v33 = @"Finished";
      if (v32) {
        v33 = @"Cancelled";
      }
      v77 = v33;
      BOOL v34 = [(VSSpeechServerTask *)self isSpeaking];
      v35 = @"synthesizing";
      if (v34) {
        v35 = @"speaking";
      }
      v76 = v35;
      v82 = [(VSSpeechServerTask *)self request];
      uint64_t v36 = [v82 logUtterance];
      v37 = @"(null)";
      if (v30) {
        v37 = v30;
      }
      v87[0] = v37;
      v85 = (void *)v36;
      v86[0] = @"voice";
      v86[1] = @"is_eager";
      v81 = [NSNumber numberWithBool:v29];
      v87[1] = v81;
      v86[2] = @"is_one_shot";
      v38 = NSNumber;
      v80 = [(VSSpeechServerTask *)self instrumentMetrics];
      int v78 = [v80 isServerTTS];
      v84 = v30;
      if (v78)
      {
        v75 = [(VSSpeechServerTask *)self instrumentMetrics];
        if ([v75 isSynthesisCached]) {
          uint64_t v39 = v29 ^ 1;
        }
        else {
          uint64_t v39 = 0;
        }
      }
      else
      {
        uint64_t v39 = 0;
      }
      v40 = [v38 numberWithInt:v39];
      v87[2] = v40;
      v86[3] = @"is_time_out";
      v41 = NSNumber;
      v42 = [(VSSpeechServerTask *)self instrumentMetrics];
      v43 = objc_msgSend(v41, "numberWithBool:", objc_msgSend(v42, "isServerTimeout"));
      v87[3] = v43;
      v86[4] = @"is_device_tts";
      v44 = NSNumber;
      v45 = [(VSSpeechServerTask *)self instrumentMetrics];
      v46 = objc_msgSend(v44, "numberWithInt:", objc_msgSend(v45, "isServerTTS") ^ 1);
      v87[4] = v46;
      v86[5] = @"source_of_tts";
      v47 = (void *)MEMORY[0x263F84E28];
      v48 = [(VSSpeechServerTask *)self instrumentMetrics];
      v49 = objc_msgSend(v47, "stringOfSourceOfTTS:", objc_msgSend(v48, "sourceOfTTS"));
      v87[5] = v49;
      v50 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:6];
      *(_DWORD *)buf = 134219010;
      uint64_t v89 = v79;
      __int16 v90 = 2112;
      v91 = v77;
      __int16 v92 = 2112;
      v93 = v76;
      __int16 v94 = 2112;
      v95 = v85;
      __int16 v96 = 2114;
      v97 = v50;
      _os_log_impl(&dword_226CB1000, v31, OS_LOG_TYPE_DEFAULT, "Server task %llu: %@ %@ utterance: '%@', %{public}@", buf, 0x34u);

      if (v78) {
      v30 = v84;
      }
    }

    int v51 = [(VSSpeechServerTask *)self isCancelled];
    v52 = [(VSSpeechServerTask *)self siriInstrumentation];
    v53 = v52;
    if (v51)
    {
      [v52 instrumentSpeechCancelled];
    }
    else
    {
      v54 = [(VSSpeechServerTask *)self instrumentMetrics];
      [v54 audioDuration];
      double v56 = v55;
      v57 = [(VSSpeechServerTask *)self instrumentMetrics];
      [v57 ttsSynthesisLatency];
      double v59 = v58;
      v60 = [(VSSpeechServerTask *)self instrumentMetrics];
      [v60 cappedRealTimeFactor];
      double v62 = v61;
      v63 = [(VSSpeechServerTask *)self instrumentMetrics];
      uint64_t v64 = [v63 promptCount];
      v65 = [(VSSpeechServerTask *)self instrumentMetrics];
      objc_msgSend(v53, "instrumentSpeechEndedWithAudioDuration:synthesisLatency:realTimeFactor:promptCount:errorCode:", v64, objc_msgSend(v65, "errorCode"), v56, v59, v62);
    }
    v66 = (void *)MEMORY[0x263F84E10];
    v67 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v66 reportInstrumentMetrics:v67];
    goto LABEL_36;
  }
  v26 = [(VSSpeechServerTask *)self error];
  uint64_t v27 = [v26 code];

  if (v27 == 501) {
    goto LABEL_14;
  }
  v68 = VSGetLogDefault();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    v72 = [(VSSpeechServerTask *)self instrumentMetrics];
    uint64_t v73 = [v72 requestCreatedTimestamp];
    v74 = [(VSSpeechServerTask *)self error];
    *(_DWORD *)buf = 134218242;
    uint64_t v89 = v73;
    __int16 v90 = 2112;
    v91 = v74;
    _os_log_error_impl(&dword_226CB1000, v68, OS_LOG_TYPE_ERROR, "Error in server task %llu, error: %@", buf, 0x16u);
  }
  v30 = [(VSSpeechServerTask *)self siriInstrumentation];
  v69 = NSNumber;
  v67 = [(VSSpeechServerTask *)self error];
  v70 = objc_msgSend(v69, "numberWithInteger:", objc_msgSend(v67, "code"));
  v98[0] = v70;
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:1];
  [(__CFString *)v30 instrumentSpeechFailedWithErrorCodes:v71];

LABEL_36:
}

- (id)voiceKey
{
  long long v3 = [(VSSpeechServerTask *)self instrumentMetrics];
  char v4 = [v3 isServerTTS];

  if ((v4 & 1) == 0)
  {
    v7 = [(VSSpeechServerTask *)self synthesisCore];
    uint64_t v8 = [v7 selectedVoice];
    int v10 = [v8 voiceData];
    id v9 = [v10 descriptiveKey];

    goto LABEL_5;
  }
  char v5 = [(VSSpeechServerTask *)self instrumentMetrics];
  uint64_t v6 = [v5 sourceOfTTS];

  if (v6 == 5)
  {
    v7 = [(VSSpeechServerTask *)self ospreyCore];
    uint64_t v8 = [v7 voice];
    id v9 = [v8 descriptiveKey];
LABEL_5:

    goto LABEL_7;
  }
  v7 = [(VSSpeechServerTask *)self instrumentMetrics];
  id v9 = [v7 voiceAssetKey];
LABEL_7:

  return v9;
}

- (void)reportInstrumentMetrics
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (self->_shouldSpeak)
  {
    long long v3 = [(VSSpeechServerTask *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      char v5 = [(VSSpeechServerTask *)self delegate];
      uint64_t v6 = [(VSSpeechServerTask *)self request];
      v7 = [(VSSpeechServerTask *)self instrumentMetrics];
      [v5 speechRequest:v6 didReportInstrumentMetrics:v7];
    }
  }
  uint64_t v8 = [(VSSpeechServerTask *)self speakTask];
  id v9 = [v8 delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(VSSpeechServerTask *)self speakTask];
    uint64_t v12 = [v11 instrumentMetrics];

    v13 = [(VSSpeechServerTask *)self instrumentMetrics];
    v14 = [v13 voiceAssetKey];
    [v12 setVoiceAssetKey:v14];

    v15 = [(VSSpeechServerTask *)self instrumentMetrics];
    char v16 = [v15 voiceResourceAssetKey];
    [v12 setVoiceResourceAssetKey:v16];

    int v17 = [(VSSpeechServerTask *)self instrumentMetrics];
    v18 = [v17 utterance];
    [v12 setUtterance:v18];

    v19 = [(VSSpeechServerTask *)self instrumentMetrics];
    objc_msgSend(v12, "setSynthesisBeginTimestamp:", objc_msgSend(v19, "synthesisBeginTimestamp"));

    id v20 = [(VSSpeechServerTask *)self instrumentMetrics];
    objc_msgSend(v12, "setSynthesisEndTimestamp:", objc_msgSend(v20, "synthesisEndTimestamp"));

    uint64_t v21 = [(VSSpeechServerTask *)self instrumentMetrics];
    objc_msgSend(v12, "setSpeechBeginTimestamp:", objc_msgSend(v21, "speechBeginTimestamp"));

    uint64_t v22 = [(VSSpeechServerTask *)self instrumentMetrics];
    objc_msgSend(v12, "setSpeechEndTimestamp:", objc_msgSend(v22, "speechEndTimestamp"));

    uint64_t v23 = [(VSSpeechServerTask *)self instrumentMetrics];
    objc_msgSend(v12, "setAudioStartTimestampDiffs:", objc_msgSend(v23, "audioStartTimestampDiffs"));

    v24 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v24 audioDuration];
    objc_msgSend(v12, "setAudioDuration:");

    uint64_t v25 = [v12 requestCreatedTimestamp];
    v26 = [(VSSpeechServerTask *)self instrumentMetrics];
    objc_msgSend(v12, "setEagerRequestCreatedTimestampDiffs:", v25 - objc_msgSend(v26, "requestCreatedTimestamp"));

    uint64_t v27 = [(VSSpeechServerTask *)self instrumentMetrics];
    objc_msgSend(v12, "setIsServerTimeout:", objc_msgSend(v27, "isServerTimeout"));

    v28 = [(VSSpeechServerTask *)self speakTask];
    BOOL v29 = [v28 delegate];
    v30 = [(VSSpeechServerTask *)self speakTask];
    v31 = [v30 request];
    int v32 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v29 speechRequest:v31 didReportInstrumentMetrics:v32];
  }
  v33 = VSGetLogDefault();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v34 = [(VSSpeechServerTask *)self instrumentMetrics];
    uint64_t v35 = [v34 requestCreatedTimestamp];
    uint64_t v36 = [(VSSpeechServerTask *)self instrumentMetrics];
    int v41 = 134218242;
    uint64_t v42 = v35;
    __int16 v43 = 2112;
    v44 = v36;
    _os_log_impl(&dword_226CB1000, v33, OS_LOG_TYPE_DEFAULT, "Server task %llu: Instrument metric: %@", (uint8_t *)&v41, 0x16u);
  }
  v37 = +[VSDiagnosticService defaultService];
  v38 = [(VSSpeechServerTask *)self instrumentMetrics];
  uint64_t v39 = [v38 dictionaryMetrics];
  v40 = [(VSSpeechServerTask *)self instrumentMetrics];
  objc_msgSend(v37, "dumpInstrumentMetrics:withTimestamp:", v39, objc_msgSend(v40, "requestCreatedTimestamp"));
}

- (void)reportSpeechStart
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (self->_shouldSpeak)
  {
    long long v3 = [(VSSpeechServerTask *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      char v5 = [(VSSpeechServerTask *)self delegate];
      uint64_t v6 = [(VSSpeechServerTask *)self request];
      [v5 speechRequestDidStart:v6];
    }
  }
  uint64_t v7 = [(VSSpeechServerTask *)self speakTask];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(VSSpeechServerTask *)self speakTask];
    char v10 = [v9 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v12 = [(VSSpeechServerTask *)self speakTask];
      v13 = [v12 delegate];
      v14 = [(VSSpeechServerTask *)self speakTask];
      v15 = [v14 request];
      [v13 speechRequestDidStart:v15];
    }
  }
  if ([(VSSpeechServerTask *)self useServerResponse])
  {
    char v16 = [(VSSpeechServerTask *)self ospreyCore];
    int v17 = [v16 voice];
  }
  else
  {
    char v16 = [(VSSpeechServerTask *)self synthesisCore];
    v18 = [v16 selectedVoice];
    int v17 = [v18 voiceData];
  }
  if ([(VSSpeechServerTask *)self useServerResponse])
  {
    v19 = [(VSSpeechServerTask *)self ospreyCore];
    [v19 voiceResource];
  }
  else
  {
    v19 = [(VSSpeechServerTask *)self synthesisCore];
    [v19 selectedVoiceResource];
  v38 = };

  id v20 = [(VSSpeechServerTask *)self siriInstrumentation];
  v37 = [(VSSpeechServerTask *)self instrumentMetrics];
  uint64_t v34 = [v37 sourceOfTTS];
  uint64_t v36 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v36 timeToSpeakLatency];
  double v22 = v21;
  uint64_t v35 = [(VSSpeechServerTask *)self playbackService];
  uint64_t v23 = [v35 outputRouteInfo];
  uint64_t v24 = [v17 type];
  uint64_t v25 = [v17 footprint];
  [v17 contentVersion];
  v26 = uint64_t v39 = v17;
  uint64_t v27 = [v26 unsignedIntegerValue];
  v28 = [v38 contentVersion];
  uint64_t v29 = [v28 unsignedIntegerValue];
  v30 = [(VSSpeechServerTask *)self request];
  LOBYTE(v33) = [v30 shouldWhisper];
  [v20 instrumentSpeechStartedWithSource:v34 customerPerceivedLatency:v23 audioOutputRoute:v24 voiceType:v25 voiceFootprint:v27 voiceVersion:v29 resourceVersion:v22 isWhisper:v33];

  v31 = VSGetLogDefault();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    int v32 = [(VSSpeechServerTask *)self instrumentMetrics];
    *(_DWORD *)buf = 134217984;
    uint64_t v41 = [v32 requestCreatedTimestamp];
    _os_log_debug_impl(&dword_226CB1000, v31, OS_LOG_TYPE_DEBUG, "Server task %llu started speaking", buf, 0xCu);
  }
}

- (void)reportTimingInfo
{
  BOOL shouldSpeak = self->_shouldSpeak;
  char v4 = [(VSSpeechServerTask *)self delegate];
  if (shouldSpeak)
  {
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v6 = [(VSSpeechServerTask *)self delegate];
    uint64_t v7 = [(VSSpeechServerTask *)self request];
    uint64_t v8 = [(VSSpeechServerTask *)self wordTimingInfo];
    [v6 speechRequest:v7 didReceiveTimingInfo:v8];
  }
  else
  {
    int v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v6 = [(VSSpeechServerTask *)self delegate];
    uint64_t v7 = [(VSSpeechServerTask *)self request];
    uint64_t v8 = [(VSSpeechServerTask *)self wordTimingInfo];
    [v6 synthesisRequest:v7 didReceiveTimingInfo:v8];
  }

LABEL_7:
  char v10 = [(VSSpeechServerTask *)self speakTask];
  char v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v17 = [(VSSpeechServerTask *)self speakTask];
    v13 = [v17 delegate];
    v14 = [(VSSpeechServerTask *)self speakTask];
    v15 = [v14 request];
    char v16 = [(VSSpeechServerTask *)self wordTimingInfo];
    [v13 speechRequest:v15 didReceiveTimingInfo:v16];
  }
}

- (void)setObserverForWordTimings:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  char v5 = [(VSSpeechServerTask *)self playbackService];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__VSSpeechServerTask_setObserverForWordTimings___block_invoke;
  v6[3] = &unk_2647DCC70;
  objc_copyWeak(&v7, &location);
  [v5 setBoundaryTimeObserverForTimingInfos:v4 usingBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__VSSpeechServerTask_setObserverForWordTimings___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[248])
    {
      char v5 = [WeakRetained delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v7 = [v4 delegate];
        uint64_t v8 = [v4 request];
        uint64_t v9 = [v21 textRange];
        objc_msgSend(v7, "speechRequest:didStartWithMark:forRange:", v8, 1, v9, v10);
      }
    }
    uint64_t v11 = [v4 speakTask];
    if (v11)
    {
      char v12 = (void *)v11;
      v13 = [v4 speakTask];
      v14 = [v13 delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        char v16 = [v4 speakTask];
        id v17 = [v16 delegate];
        v18 = [v4 request];
        uint64_t v19 = [v21 textRange];
        objc_msgSend(v17, "speechRequest:didStartWithMark:forRange:", v18, 1, v19, v20);
      }
    }
  }
}

- (BOOL)isSpeaking
{
  if (self->_shouldSpeak) {
    return 1;
  }
  long long v3 = [(VSSpeechServerTask *)self speakTask];
  BOOL v2 = v3 != 0;

  return v2;
}

- (id)taskHash
{
  return &stru_26DAD0E18;
}

- (void)resume
{
  id v3 = [(VSSpeechServerTask *)self playbackService];
  id v2 = (id)[v3 start];
}

- (void)suspend
{
  id v2 = [(VSSpeechServerTask *)self playbackService];
  [v2 pause];
}

- (void)cancel
{
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"VoiceServicesErrorDomain" code:400 userInfo:0];
  [(VSSpeechServerTask *)self setError:v3];

  if (([(VSSpeechServerTask *)self isExecuting] & 1) != 0
    || ([(VSSpeechServerTask *)self isCancelled] & 1) != 0
    || ([(VSSpeechServerTask *)self isFinished] & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)VSSpeechServerTask;
    [(VSSpeechServerTask *)&v7 cancel];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VSSpeechServerTask;
    [(VSSpeechServerTask *)&v8 cancel];
    [(VSSpeechServerTask *)self reportFinish];
  }
  id v4 = [(VSSpeechServerTask *)self playbackService];
  [v4 stop];

  char v5 = [(VSSpeechServerTask *)self synthesisCore];
  [v5 cancel];

  char v6 = [(VSSpeechServerTask *)self ospreyCore];
  [v6 cancel];

  pthread_cond_broadcast(&self->_timeoutCondition);
}

- (void)proceedWithServerTTS
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v3 = mach_absolute_time();
  id v4 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v4 setSynthesisBeginTimestamp:v3];

  kdebug_trace();
  char v5 = [MEMORY[0x263F84E40] sharedManager];
  char v6 = [(VSSpeechServerTask *)self request];
  objc_super v7 = [v6 languageCode];
  objc_super v8 = [v5 selectVoiceResourceAssetForLanguage:v7];

  uint64_t v9 = [(VSSpeechServerTask *)self request];
  uint64_t v10 = [v9 voiceName];
  uint64_t v11 = [v10 length];

  if (!v11)
  {
    char v12 = [(VSSpeechServerTask *)self request];
    uint64_t v13 = [v12 gender];

    if (!v13)
    {
      uint64_t v14 = [v8 defaultVoiceGender];
      char v15 = [(VSSpeechServerTask *)self request];
      [v15 setGender:v14];
    }
    char v16 = [(VSSpeechServerTask *)self request];
    id v17 = objc_msgSend(v8, "defaultVoiceNameForGender:", objc_msgSend(v16, "gender"));
    v18 = [(VSSpeechServerTask *)self request];
    [v18 setVoiceName:v17];
  }
  uint64_t v19 = objc_opt_new();
  uint64_t v20 = [(VSSpeechServerTask *)self request];
  id v21 = [v20 text];
  double v22 = [(VSSpeechServerTask *)self request];
  uint64_t v23 = [v22 languageCode];
  uint64_t v24 = [(VSSpeechServerTask *)self request];
  uint64_t v25 = [v24 voiceName];
  v26 = [v19 estimatedTTSWordTimingForText:v21 withLanguage:v23 voiceName:v25];
  [(VSSpeechServerTask *)self setWordTimingInfo:v26];

  uint64_t v27 = [(VSSpeechServerTask *)self wordTimingInfo];

  if (v27) {
    [(VSSpeechServerTask *)self reportTimingInfo];
  }
  v28 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__VSSpeechServerTask_proceedWithServerTTS__block_invoke;
  block[3] = &unk_2647DCD78;
  block[4] = self;
  dispatch_async(v28, block);

  uint64_t v29 = [(VSSpeechServerTask *)self request];
  char v30 = [v29 disableDeviceRacing];

  if (v30)
  {
    v31 = VSGetLogDefault();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    int v32 = "Device TTS will not race";
    uint64_t v33 = v31;
    uint32_t v34 = 2;
    goto LABEL_14;
  }
  uint64_t v35 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v35 setIsServerTTSRacing:1];

  uint64_t v36 = VSGetLogDefault();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226CB1000, v36, OS_LOG_TYPE_DEFAULT, "Device TTS is racing with Server TTS", buf, 2u);
  }

  v37 = [(VSSpeechServerTask *)self synthesisCore];
  [v37 start];

  v31 = VSGetLogDefault();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    [(VSSpeechServerTask *)self deviceTTSWaitTime];
    *(_DWORD *)buf = 134217984;
    uint64_t v53 = v38;
    int v32 = "Device TTS wait time for server audio: %.2f";
    uint64_t v33 = v31;
    uint32_t v34 = 12;
LABEL_14:
    _os_log_impl(&dword_226CB1000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
  }
LABEL_15:

  BOOL v39 = [(VSSpeechServerTask *)self shouldRelyOnServerTTS];
  if (([(VSSpeechServerTask *)self isCancelled] & 1) == 0)
  {
    if (v39)
    {
      v40 = [(VSSpeechServerTask *)self ospreyCore];
      [v40 waitUntilFinished];
    }
    else
    {
      [(VSSpeechServerTask *)self deviceTTSWaitTime];
      if (v41 <= 0.0) {
        goto LABEL_27;
      }
      v40 = [(VSSpeechServerTask *)self ospreyCore];
      [(VSSpeechServerTask *)self deviceTTSWaitTime];
      objc_msgSend(v40, "waitUntilFinishedIfAudioReceivedWithin:");
    }

    if (([(VSSpeechServerTask *)self isCancelled] & 1) == 0)
    {
      uint64_t v42 = [(VSSpeechServerTask *)self ospreyCore];
      __int16 v43 = [v42 error];
      uint64_t v44 = [v43 code];

      if (v44 != 603)
      {
        v46 = [(VSSpeechServerTask *)self ospreyCore];
        v47 = [v46 error];
        if (v47)
        {
        }
        else
        {
          v48 = [(VSSpeechServerTask *)self error];
          v49 = [v48 domain];
          int v50 = [v49 isEqualToString:@"ServerTTSErrorDomain"];

          if (!v50) {
            goto LABEL_27;
          }
        }
        [(VSSpeechServerTask *)self fallbackToDeviceSynthesis];
        goto LABEL_27;
      }
      uint64_t v45 = [(VSSpeechServerTask *)self instrumentMetrics];
      [v45 setErrorCode:603];

      [(VSSpeechServerTask *)self speakRetryPhrase];
    }
  }
LABEL_27:
}

void __42__VSSpeechServerTask_proceedWithServerTTS__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) ospreyCore];
  [v1 start];
}

- (void)broadcastTimeoutCondition
{
}

- (void)proceedWithSpeechCache:(id)a3
{
  id v4 = a3;
  [(VSSpeechServerTask *)self setUseServerResponse:1];
  char v5 = [v4 voiceKey];
  char v6 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v6 setVoiceAssetKey:v5];

  objc_super v7 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v7 setIsCacheHitFromMemory:1];

  objc_super v8 = [v4 timingInfos];
  [(VSSpeechServerTask *)self setWordTimingInfo:v8];

  [(VSSpeechServerTask *)self reportTimingInfo];
  uint64_t v9 = [v4 audio];
  id v10 = [(VSSpeechServerTask *)self enqueueAudioData:v9];

  uint64_t v11 = [(VSSpeechServerTask *)self wordTimingInfo];
  [(VSSpeechServerTask *)self setObserverForWordTimings:v11];

  id v12 = [v4 audio];

  [(VSSpeechServerTask *)self setServerAudio:v12];
}

- (void)main
{
  kdebug_trace();
  uint64_t v3 = [(VSSpeechServerTask *)self serverTTSConfig];
  id v4 = [v3 experimentIdentifier];
  char v5 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v5 setExperimentIdentifier:v4];

  char v6 = [(VSSpeechServerTask *)self cachingService];
  objc_super v7 = [(VSSpeechServerTask *)self request];
  objc_super v8 = [v7 text];
  uint64_t v9 = [v6 popShortTermCacheForHash:v8];

  if (v9)
  {
    id v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_INFO, "Inline server TTS is previously cached.", buf, 2u);
    }

    uint64_t v11 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v11 setSourceOfTTS:6];
  }
  else
  {
    id v12 = [(VSSpeechServerTask *)self cachingService];
    objc_super v7 = [(VSSpeechServerTask *)self request];
    uint64_t v13 = [(VSSpeechServerTask *)self eagerTaskHashForRequest:v7];
    uint64_t v9 = [v12 popShortTermCacheForHash:v13];

    if (!v9)
    {
      [(VSSpeechServerTask *)self proceedWithServerTTS];
      goto LABEL_10;
    }
    uint64_t v14 = VSGetLogDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_226CB1000, v14, OS_LOG_TYPE_INFO, "Eager server TTS is previously cached.", v44, 2u);
    }

    [(VSSpeechServerTask *)self setIsEagerCache:1];
  }
  [(VSSpeechServerTask *)self proceedWithSpeechCache:v9];
LABEL_10:
  notify_post((const char *)[(id)*MEMORY[0x263F84F10] UTF8String]);
  [(VSSpeechServerTask *)self setReadyForEagerTask:0];
  if ([(VSSpeechServerTask *)self shouldSpeak]
    || ([(VSSpeechServerTask *)self speakTask],
        char v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    char v16 = [(VSSpeechServerTask *)self playbackService];
    [v16 flushAndStop];

    id v17 = [(VSSpeechServerTask *)self error];

    if (!v17)
    {
      v18 = [(VSSpeechServerTask *)self playbackService];
      uint64_t v19 = [v18 error];
      [(VSSpeechServerTask *)self setError:v19];
    }
    objc_super v7 = (void *)mach_absolute_time();
    uint64_t v20 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v20 setSpeechEndTimestamp:v7];
    goto LABEL_15;
  }
  uint64_t v20 = [(VSSpeechServerTask *)self request];
  if (![v20 shouldCache]
    || ![(VSSpeechServerTask *)self useServerResponse]
    || ([(VSSpeechServerTask *)self isCancelled] & 1) != 0)
  {
LABEL_15:

    goto LABEL_16;
  }
  objc_super v7 = [(VSSpeechServerTask *)self error];

  if (!v7)
  {
    uint64_t v20 = [(VSSpeechServerTask *)self cachingService];
    __int16 v43 = [(VSSpeechServerTask *)self request];
    uint64_t v33 = [(VSSpeechServerTask *)self eagerTaskHashForRequest:v43];
    uint32_t v34 = [(VSSpeechServerTask *)self serverAudio];
    uint64_t v35 = [(VSSpeechServerTask *)self wordTimingInfo];
    uint64_t v42 = [(VSSpeechServerTask *)self instrumentMetrics];
    uint64_t v36 = [v42 voiceAssetKey];
    v37 = [(VSSpeechServerTask *)self instrumentMetrics];
    objc_super v7 = [v37 voiceResourceAssetKey];
    [v20 enqueueShortTermCacheWithHash:v33 audio:v34 timingInfo:v35 voiceKey:v36 voiceResourceKey:v7 completion:0];

    goto LABEL_15;
  }
LABEL_16:
  BOOL v21 = [(VSSpeechServerTask *)self useServerResponse];
  if (v21)
  {
    uint64_t v22 = [(VSSpeechServerTask *)self error];
    if (!v22)
    {
LABEL_24:
      [(VSSpeechServerTask *)self reportInstrumentMetrics];
      goto LABEL_25;
    }
    objc_super v7 = (void *)v22;
    if (![(VSSpeechServerTask *)self useDeviceSynthesis])
    {

      goto LABEL_25;
    }
  }
  else if (![(VSSpeechServerTask *)self useDeviceSynthesis])
  {
    goto LABEL_25;
  }
  uint64_t v23 = [(VSSpeechServerTask *)self synthesisCore];
  uint64_t v24 = [v23 error];

  if (v21) {
  if (!v24)
  }
    goto LABEL_24;
LABEL_25:
  if (![(VSSpeechServerTask *)self useDeviceSynthesis]) {
    goto LABEL_28;
  }
  uint64_t v25 = [(VSSpeechServerTask *)self error];
  v26 = [(VSSpeechServerTask *)self ospreyCore];
  uint64_t v27 = [v26 error];
  if (v25 == (void *)v27)
  {

LABEL_36:
    [(VSSpeechServerTask *)self setError:0];
    if (v9) {
      goto LABEL_29;
    }
    goto LABEL_37;
  }
  v28 = (void *)v27;
  uint64_t v29 = [(VSSpeechServerTask *)self error];
  char v30 = [v29 domain];
  int v31 = [v30 isEqualToString:@"ServerTTSErrorDomain"];

  if (v31) {
    goto LABEL_36;
  }
LABEL_28:
  if (v9)
  {
LABEL_29:
    uint64_t v32 = [v9 audio];
LABEL_39:
    uint64_t v38 = (void *)v32;
    [(VSSpeechServerTask *)self writeAudioIfNeeded:v32];
    goto LABEL_40;
  }
LABEL_37:
  if ([(VSSpeechServerTask *)self useServerResponse])
  {
    uint64_t v32 = [(VSSpeechServerTask *)self serverAudio];
    goto LABEL_39;
  }
  if (![(VSSpeechServerTask *)self useDeviceSynthesis]) {
    goto LABEL_41;
  }
  uint64_t v38 = [(VSSpeechServerTask *)self synthesisCore];
  BOOL v39 = [v38 streamAudio];
  if (v39)
  {
    [(VSSpeechServerTask *)self writeAudioIfNeeded:v39];
  }
  else
  {
    v40 = [(VSSpeechServerTask *)self synthesisCore];
    double v41 = [v40 compressedAudio];
    [(VSSpeechServerTask *)self writeAudioIfNeeded:v41];
  }
LABEL_40:

LABEL_41:
  [(VSSpeechServerTask *)self reportFinish];
  kdebug_trace();
}

- (id)eagerTaskHashForRequest:(id)a3
{
  v18 = NSString;
  id v3 = a3;
  id v4 = [v3 languageCode];
  char v5 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "gender"));
  char v6 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "voiceType"));
  objc_super v7 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "footprint"));
  objc_super v8 = [v3 text];
  uint64_t v9 = NSNumber;
  [v3 rate];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v11 = NSNumber;
  [v3 pitch];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v13 = NSNumber;
  [v3 volume];
  uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  char v15 = [v3 contextInfo];

  char v16 = [v18 stringWithFormat:@"EagerTTS:%@:%@:%@:%@:%@:%@:%@:%@:%@", v4, v5, v6, v7, v8, v10, v12, v14, v15];

  return v16;
}

- (id)enqueueAudioData:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(VSSpeechServerTask *)self setReadyForEagerTask:0];
  char v5 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v4 duration];
  double v7 = v6;
  [v5 audioDuration];
  [v5 setAudioDuration:v7 + v8];

  if (![(VSSpeechServerTask *)self shouldSpeak])
  {
    uint64_t v9 = [(VSSpeechServerTask *)self speakTask];

    if (!v9)
    {
      uint64_t v19 = [(VSSpeechServerTask *)self request];
      int v20 = [v19 shouldStreamAudioData];

      if (v20)
      {
        BOOL v21 = [(VSSpeechServerTask *)self delegate];
        uint64_t v22 = [(VSSpeechServerTask *)self request];
        [v21 synthesisRequest:v22 didGenerateAudioChunk:v4];
      }
      goto LABEL_10;
    }
  }
  id v10 = [(VSSpeechServerTask *)self playbackService];

  if (v10)
  {
LABEL_4:
    uint64_t v11 = [(VSSpeechServerTask *)self playbackService];
    id v12 = [v4 audioData];
    uint64_t v13 = [v4 packetCount];
    uint64_t v14 = [v4 packetDescriptions];
    [v11 enqueue:v12 packetCount:v13 packetDescriptions:v14];

    if (![(VSSpeechServerTask *)self speechStartReported])
    {
      uint64_t v15 = mach_absolute_time();
      char v16 = [(VSSpeechServerTask *)self instrumentMetrics];
      [v16 setSpeechBeginTimestamp:v15];

      [(VSSpeechServerTask *)self reportSpeechStart];
      [(VSSpeechServerTask *)self setSpeechStartReported:1];
    }
LABEL_10:
    uint64_t v23 = 0;
    goto LABEL_11;
  }
  if (self->_shouldSpeak)
  {
    id v17 = [(VSSpeechServerTask *)self request];
    uint64_t v18 = [v17 audioSessionID];
  }
  else
  {
    id v17 = [(VSSpeechServerTask *)self speakTask];
    uint64_t v25 = [v17 request];
    uint64_t v18 = [v25 audioSessionID];
  }
  v26 = [VSAudioPlaybackService alloc];
  if (v4)
  {
    [v4 asbd];
  }
  else
  {
    uint64_t v43 = 0;
    long long v41 = 0u;
    long long v42 = 0u;
  }
  uint64_t v27 = [(VSSpeechServerTask *)self request];
  v28 = [v27 accessoryID];
  uint64_t v29 = [(VSAudioPlaybackService *)v26 initWithAudioSessionID:v18 asbd:&v41 useAVSBAR:v28 != 0];
  [(VSSpeechServerTask *)self setPlaybackService:v29];

  char v30 = [(VSSpeechServerTask *)self playbackService];
  int v31 = [v30 outputRouteInfo];
  uint64_t v32 = [v31 audioRouteName];
  uint64_t v33 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v33 setAudioOutputRoute:v32];

  uint32_t v34 = [(VSSpeechServerTask *)self playbackService];

  if (v34)
  {
    uint64_t v35 = mach_absolute_time();
    uint64_t v36 = [(VSSpeechServerTask *)self playbackService];
    uint64_t v23 = [v36 start];

    if (!v23)
    {
      uint64_t v37 = mach_absolute_time() - v35;
      uint64_t v38 = [(VSSpeechServerTask *)self instrumentMetrics];
      [v38 setAudioStartTimestampDiffs:v37];

      goto LABEL_4;
    }
  }
  else
  {
    BOOL v39 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F08320];
    v45[0] = @"Unable to create playback service";
    v40 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
    uint64_t v23 = [v39 errorWithDomain:@"VoiceServicesErrorDomain" code:450 userInfo:v40];
  }
LABEL_11:

  return v23;
}

- (id)handleDeviceSynthesis:(id)a3 timingInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_racingMutex = &self->_racingMutex;
  pthread_mutex_lock(&self->_racingMutex);
  if ([(VSSpeechServerTask *)self useServerResponse])
  {
    uint64_t v9 = VSGetLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v9, OS_LOG_TYPE_INFO, "Received server TTS previously, ignore device TTS", buf, 2u);
    }

LABEL_5:
    id v10 = 0;
    goto LABEL_22;
  }
  if (v6)
  {
    uint64_t v11 = [(VSSpeechServerTask *)self instrumentMetrics];
    uint64_t v12 = [v11 synthesisEndTimestamp];

    if (!v12)
    {
      uint64_t v13 = mach_absolute_time();
      uint64_t v14 = [(VSSpeechServerTask *)self instrumentMetrics];
      [v14 setSynthesisEndTimestamp:v13];

      kdebug_trace();
    }
  }
  if (![(VSSpeechServerTask *)self useDeviceSynthesis]
    && [(VSSpeechServerTask *)self shouldDeferDeviceTTS])
  {
    uint64_t v15 = VSGetLogDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v30 = 0;
      _os_log_impl(&dword_226CB1000, v15, OS_LOG_TYPE_INFO, "Received audio from device synthesis, but it's deferred.", v30, 2u);
    }

    if (v7) {
      [(VSSpeechServerTask *)self setDeferredTTSTimingInfo:v7];
    }
    goto LABEL_5;
  }
  if (![(VSSpeechServerTask *)self useDeviceSynthesis])
  {
    char v16 = VSGetLogDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v31 = 0;
      _os_log_impl(&dword_226CB1000, v16, OS_LOG_TYPE_INFO, "Received audio from device synthesis. Use device synthesis immediately.", v31, 2u);
    }

    [(VSSpeechServerTask *)self setUseDeviceSynthesis:1];
    id v17 = [(VSSpeechServerTask *)self ospreyCore];
    [v17 cancel];

    uint64_t v18 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v18 setIsServerTTS:0];

    uint64_t v19 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v19 setSourceOfTTS:1];
  }
  if (v6)
  {
    int v20 = [(VSSpeechServerTask *)self synthesisCore];
    BOOL v21 = [v20 selectedVoice];
    uint64_t v22 = [v21 key];
    uint64_t v23 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v23 setVoiceAssetKey:v22];

    uint64_t v24 = [(VSSpeechServerTask *)self synthesisCore];
    uint64_t v25 = [v24 selectedVoiceResource];
    v26 = [v25 key];
    uint64_t v27 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v27 setVoiceResourceAssetKey:v26];

    id v10 = [(VSSpeechServerTask *)self enqueueAudioData:v6];
    if (!v7) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  id v10 = 0;
  if (v7)
  {
LABEL_21:
    [(VSSpeechServerTask *)self setWordTimingInfo:v7];
    v28 = [(VSSpeechServerTask *)self wordTimingInfo];
    [(VSSpeechServerTask *)self setObserverForWordTimings:v28];

    [(VSSpeechServerTask *)self reportTimingInfo];
  }
LABEL_22:
  pthread_mutex_unlock(p_racingMutex);

  return v10;
}

- (BOOL)shouldDeferDeviceTTS
{
  if ([(VSSpeechServerTask *)self shouldRelyOnServerTTS]) {
    return 1;
  }
  [(VSSpeechServerTask *)self deviceTTSWaitTime];
  return v4 > 0.0;
}

- (BOOL)shouldRelyOnServerTTS
{
  id v3 = [(VSSpeechServerTask *)self request];
  if ([v3 disableDeviceRacing])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(VSSpeechServerTask *)self synthesisCore];
    if ([v5 isCancelled])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(VSSpeechServerTask *)self synthesisCore];
      id v7 = [v6 error];
      if (v7)
      {
        BOOL v4 = 1;
      }
      else
      {
        double v8 = [(VSSpeechServerTask *)self synthesisCore];
        uint64_t v9 = [v8 selectedVoice];
        id v10 = [v9 voiceData];
        if ([v10 footprint] == 1)
        {
          BOOL v4 = 1;
        }
        else
        {
          uint64_t v14 = [(VSSpeechServerTask *)self synthesisCore];
          uint64_t v11 = [v14 selectedVoice];
          uint64_t v12 = [v11 voiceData];
          BOOL v4 = [v12 type] == 4 && self->_isNeuralFallbackCondition;
        }
      }
    }
  }

  return v4;
}

- (double)deviceTTSWaitTime
{
  return self->_deviceTTSWaitTime;
}

- (void)fallbackToDeviceSynthesis
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = [(VSSpeechServerTask *)self error];

  if (v3)
  {
    BOOL v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v49 = [(VSSpeechServerTask *)self error];
      int v50 = [v49 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = v50;
      _os_log_error_impl(&dword_226CB1000, v4, OS_LOG_TYPE_ERROR, "Server network error: %@", buf, 0xCu);
    }
  }
  char v5 = [(VSSpeechServerTask *)self ospreyCore];
  if (([v5 isCancelled] & 1) == 0)
  {

    goto LABEL_9;
  }
  id v6 = [(VSSpeechServerTask *)self ospreyCore];
  id v7 = [v6 error];
  uint64_t v8 = [v7 code];

  if (v8 == 602)
  {
LABEL_9:
    uint64_t v9 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v9 setIsServerTimeout:1];
  }
  id v10 = [(VSSpeechServerTask *)self request];
  int v11 = [v10 disableDeviceRacing];

  if (v11)
  {
    uint64_t v12 = VSGetLogDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v12, OS_LOG_TYPE_DEFAULT, "Start device synthesis fallback.", buf, 2u);
    }

    uint64_t v13 = [(VSSpeechServerTask *)self synthesisCore];
    [v13 start];
  }
  uint64_t v14 = [(VSSpeechServerTask *)self synthesisCore];
  uint64_t v15 = [v14 error];
  if (v15)
  {

    return;
  }
  char v16 = [(VSSpeechServerTask *)self synthesisCore];
  id v17 = [v16 streamAudio];
  if (v17)
  {
  }
  else
  {
    uint64_t v18 = [(VSSpeechServerTask *)self synthesisCore];
    uint64_t v19 = [v18 compressedAudio];

    if (!v19) {
      return;
    }
  }
  int v20 = VSGetLogDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226CB1000, v20, OS_LOG_TYPE_DEFAULT, "Start playing device synthesis instead.", buf, 2u);
  }

  [(VSSpeechServerTask *)self setUseDeviceSynthesis:1];
  BOOL v21 = [(VSSpeechServerTask *)self deferredTTSTimingInfo];
  [(VSSpeechServerTask *)self setWordTimingInfo:v21];

  uint64_t v22 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v22 setIsServerTTS:0];

  uint64_t v23 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v23 setSourceOfTTS:1];

  uint64_t v24 = [(VSSpeechServerTask *)self synthesisCore];
  uint64_t v25 = [v24 selectedVoice];
  v26 = [v25 key];
  uint64_t v27 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v27 setVoiceAssetKey:v26];

  v28 = [(VSSpeechServerTask *)self synthesisCore];
  uint64_t v29 = [v28 selectedVoiceResource];
  char v30 = [v29 key];
  int v31 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v31 setVoiceResourceAssetKey:v30];

  uint64_t v32 = [(VSSpeechServerTask *)self synthesisCore];
  uint64_t v33 = [v32 streamAudio];

  uint32_t v34 = [(VSSpeechServerTask *)self synthesisCore];
  uint64_t v35 = v34;
  if (v33)
  {
    uint64_t v36 = [v34 streamAudio];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __47__VSSpeechServerTask_fallbackToDeviceSynthesis__block_invoke;
    v51[3] = &unk_2647DCDC8;
    v51[4] = self;
    [v36 enumerateAudioWithBlock:v51];
  }
  else
  {
    uint64_t v37 = [v34 compressedAudio];

    if (!v37) {
      goto LABEL_26;
    }
    uint64_t v35 = [(VSSpeechServerTask *)self synthesisCore];
    uint64_t v36 = [v35 compressedAudio];
    id v38 = [(VSSpeechServerTask *)self enqueueAudioData:v36];
  }

LABEL_26:
  BOOL v39 = [(VSSpeechServerTask *)self wordTimingInfo];
  [(VSSpeechServerTask *)self setObserverForWordTimings:v39];

  [(VSSpeechServerTask *)self reportTimingInfo];
  v40 = [(VSSpeechServerTask *)self ospreyCore];
  long long v41 = [v40 error];
  if (v41)
  {
  }
  else
  {
    long long v42 = [(VSSpeechServerTask *)self error];
    char v30 = [v42 domain];
    int v43 = [v30 isEqualToString:@"ServerTTSErrorDomain"];

    if (!v43) {
      return;
    }
  }
  uint64_t v44 = [(VSSpeechServerTask *)self ospreyCore];
  uint64_t v45 = [v44 error];
  if (v45)
  {
    char v30 = [(VSSpeechServerTask *)self ospreyCore];
    [v30 error];
  }
  else
  {
    [(VSSpeechServerTask *)self error];
  v46 = };
  uint64_t v47 = [v46 code];
  v48 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v48 setErrorCode:v47];

  if (v45)
  {

    v46 = v30;
  }

  [(VSSpeechServerTask *)self setError:0];
}

void __47__VSSpeechServerTask_fallbackToDeviceSynthesis__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, unsigned char *a5)
{
  uint64_t v9 = (objc_class *)MEMORY[0x263F84E18];
  id v10 = a4;
  id v11 = a2;
  id v12 = objc_alloc_init(v9);
  uint64_t v13 = [*(id *)(a1 + 32) synthesisCore];
  uint64_t v14 = [v13 streamAudio];
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 asbd];
  }
  else
  {
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
  }
  v17[0] = v19;
  v17[1] = v20;
  uint64_t v18 = v21;
  [v12 setAsbd:v17];

  [v12 setPacketCount:a3];
  [v12 setPacketDescriptions:v10];

  [v12 setAudioData:v11];
  char v16 = [*(id *)(a1 + 32) enqueueAudioData:v12];
  if (v16) {
    *a5 = 1;
  }
}

- (void)speakRetryPhrase
{
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEFAULT, "Encountered Osprey streaming network stall. Retry with device TTS.", buf, 2u);
  }

  BOOL v4 = (void *)MEMORY[0x263F84E30];
  uint64_t v5 = *MEMORY[0x263F84F08];
  id v6 = [(VSSpeechServerTask *)self request];
  id v7 = [v6 languageCode];
  uint64_t v8 = [v4 localizedInterstitialStringForKey:v5 language:v7];

  uint64_t v9 = [(VSSpeechServerTask *)self request];
  id v10 = (void *)[v9 copy];

  id v11 = NSString;
  id v12 = [(VSSpeechServerTask *)self synthesisCore];
  uint64_t v13 = [v12 request];
  uint64_t v14 = [v13 utterance];
  uint64_t v15 = [v11 stringWithFormat:@"%@ %@", v8, v14];
  [v10 setUtterance:v15];

  char v16 = NSString;
  id v17 = [(VSSpeechServerTask *)self synthesisCore];
  uint64_t v18 = [v17 request];
  long long v19 = [v18 text];
  long long v20 = [v16 stringWithFormat:@"%@ %@", v8, v19];
  [v10 setText:v20];

  uint64_t v21 = [(VSSpeechServerTask *)self playbackService];
  [v21 stop];

  [(VSSpeechServerTask *)self setPlaybackService:0];
  [(VSSpeechServerTask *)self setUseServerResponse:0];
  [(VSSpeechServerTask *)self setUseDeviceSynthesis:1];
  uint64_t v22 = [[VSDeviceTTSCore alloc] initWithRequest:v10];
  [(VSDeviceTTSCore *)v22 setDelegate:self];
  [(VSDeviceTTSCore *)v22 start];
}

- (id)handleServerResponse:(id)a3 timingInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_racingMutex = &self->_racingMutex;
  pthread_mutex_lock(&self->_racingMutex);
  if ([(VSSpeechServerTask *)self useDeviceSynthesis])
  {
    uint64_t v9 = [(VSSpeechServerTask *)self synthesisCore];
    id v10 = [v9 selectedVoice];
    id v11 = [v10 voiceData];
    uint64_t v12 = [v11 footprint];

    if (v12 != 1)
    {
      uint64_t v32 = VSGetLogDefault();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint32_t v34 = 0;
        _os_log_impl(&dword_226CB1000, v32, OS_LOG_TYPE_INFO, "Received device synthesis previously, ignore server TTS.", v34, 2u);
      }
      goto LABEL_16;
    }
  }
  if (![(VSSpeechServerTask *)self useServerResponse])
  {
    uint64_t v13 = VSGetLogDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v13, OS_LOG_TYPE_DEFAULT, "Received server TTS response. Use Server TTS.", buf, 2u);
    }

    [(VSSpeechServerTask *)self setUseServerResponse:1];
    uint64_t v14 = [(VSSpeechServerTask *)self instrumentMetrics];
    [v14 setIsServerTTS:1];
  }
  uint64_t v15 = mach_absolute_time();
  char v16 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v16 setSynthesisEndTimestamp:v15];

  kdebug_trace();
  id v17 = [(VSSpeechServerTask *)self ospreyCore];
  uint64_t v18 = [v17 voice];
  long long v19 = [v18 voiceKey];
  long long v20 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v20 setVoiceAssetKey:v19];

  uint64_t v21 = [(VSSpeechServerTask *)self ospreyCore];
  uint64_t v22 = [v21 voiceResource];
  uint64_t v23 = [v22 key];
  uint64_t v24 = [(VSSpeechServerTask *)self instrumentMetrics];
  [v24 setVoiceResourceAssetKey:v23];

  uint64_t v25 = [(VSSpeechServerTask *)self wordTimingInfo];

  if (!v25)
  {
    [(VSSpeechServerTask *)self setWordTimingInfo:v7];
    [(VSSpeechServerTask *)self reportTimingInfo];
  }
  id v26 = [(VSSpeechServerTask *)self enqueueAudioData:v6];
  uint64_t v27 = [(VSSpeechServerTask *)self wordTimingInfo];
  [(VSSpeechServerTask *)self setObserverForWordTimings:v27];

  v28 = [(VSSpeechServerTask *)self serverAudio];

  if (v28)
  {
    uint64_t v29 = [(VSSpeechServerTask *)self serverAudio];
    [v29 concatenateWithAudio:v6];
  }
  else
  {
    [(VSSpeechServerTask *)self setServerAudio:v6];
  }
  char v30 = [(VSSpeechServerTask *)self synthesisCore];
  char v31 = [v30 isCancelled];

  if ((v31 & 1) == 0)
  {
    uint64_t v32 = [(VSSpeechServerTask *)self synthesisCore];
    [v32 cancel];
LABEL_16:
  }
  pthread_mutex_unlock(p_racingMutex);

  return 0;
}

- (void)dealloc
{
  pthread_cond_destroy(&self->_timeoutCondition);
  v3.receiver = self;
  v3.super_class = (Class)VSSpeechServerTask;
  [(VSSpeechServerTask *)&v3 dealloc];
}

- (VSSpeechServerTask)initWithRequest:(id)a3 shouldSpeak:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v32.receiver = self;
  v32.super_class = (Class)VSSpeechServerTask;
  uint64_t v8 = [(VSSpeechServerTask *)&v32 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_request, a3);
    v9->_BOOL shouldSpeak = v4;
    v9->_isNeuralFallbackCondition = [MEMORY[0x263F84E48] isNeuralFallbackCondition];
    id v10 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x263F84E28]);
    instrumentMetrics = v9->_instrumentMetrics;
    v9->_instrumentMetrics = v10;

    if ([v7 requestCreatedTimestamp])
    {
      uint64_t v12 = [v7 requestCreatedTimestamp];
    }
    else
    {
      uint64_t v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226CB1000, v13, OS_LOG_TYPE_ERROR, "Using requestCreatedTimestamp inside voiced for Server task", buf, 2u);
      }

      uint64_t v12 = mach_absolute_time();
    }
    [(VSInstrumentMetrics *)v9->_instrumentMetrics setRequestCreatedTimestamp:v12];
    uint64_t v14 = VSGetLogDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [(VSSpeechServerTask *)v9 instrumentMetrics];
      uint64_t v16 = [v15 requestCreatedTimestamp];
      *(_DWORD *)buf = 134218240;
      uint64_t v34 = v16;
      __int16 v35 = 1024;
      BOOL v36 = v4;
      _os_log_impl(&dword_226CB1000, v14, OS_LOG_TYPE_INFO, "Created Server task %llu: shouldSpeak %{BOOL}d", buf, 0x12u);
    }
    v9->_readyForEagerTask = !v4;
    id v17 = [v7 text];
    [(VSInstrumentMetrics *)v9->_instrumentMetrics setUtterance:v17];

    [(VSInstrumentMetrics *)v9->_instrumentMetrics setIsServerTTS:1];
    [(VSInstrumentMetrics *)v9->_instrumentMetrics setIsSpeechRequest:v4];
    -[VSInstrumentMetrics setCanUseServerTTS:](v9->_instrumentMetrics, "setCanUseServerTTS:", [v7 canUseServerTTS]);
    uint64_t v18 = [v7 clientBundleIdentifier];
    [(VSInstrumentMetrics *)v9->_instrumentMetrics setClientBundleIdentifier:v18];

    v9->_timeoutCondition.__sig = 1018212795;
    *(_OWORD *)v9->_timeoutCondition.__opaque = 0u;
    *(_OWORD *)&v9->_timeoutCondition.__opaque[16] = 0u;
    *(void *)&v9->_timeoutCondition.__opaque[32] = 0;
    v9->_deviceTTSWaitTime = NAN;
    long long v19 = [[VSDeviceTTSCore alloc] initWithRequest:v7];
    synthesisCore = v9->_synthesisCore;
    v9->_synthesisCore = v19;

    uint64_t v21 = [(VSSpeechServerTask *)v9 instrumentMetrics];
    [(VSDeviceTTSCore *)v9->_synthesisCore setInstrumentMetrics:v21];

    [(VSDeviceTTSCore *)v9->_synthesisCore setDelegate:v9];
    uint64_t v22 = [[VSOspreyTTSCore alloc] initWithRequest:v7];
    ospreyCore = v9->_ospreyCore;
    v9->_ospreyCore = v22;

    uint64_t v24 = [(VSSpeechServerTask *)v9 instrumentMetrics];
    [(VSOspreyTTSCore *)v9->_ospreyCore setInstrumentMetrics:v24];

    [(VSOspreyTTSCore *)v9->_ospreyCore setDelegate:v9];
    uint64_t v25 = [MEMORY[0x263F84E90] standardInstance];
    internalSettings = v9->_internalSettings;
    v9->_internalSettings = (VSSpeechInternalSettings *)v25;

    uint64_t v27 = +[VSCachingService standardService];
    cachingService = v9->_cachingService;
    v9->_cachingService = (VSCachingService *)v27;

    uint64_t v29 = +[VSSiriServerConfiguration defaultConfig];
    serverTTSConfig = v9->_serverTTSConfig;
    v9->_serverTTSConfig = (VSSiriServerConfiguration *)v29;

    pthread_mutex_init(&v9->_racingMutex, 0);
  }

  return v9;
}

- (VSSpeechServerTask)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end