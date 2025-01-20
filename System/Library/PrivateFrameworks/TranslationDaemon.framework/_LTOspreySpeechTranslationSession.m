@interface _LTOspreySpeechTranslationSession
- (BOOL)_receivedEmptyFinalASRResults;
- (BOOL)isCancelled;
- (NSString)description;
- (_LTOspreySpeechTranslationSession)initWithService:(id)a3 context:(id)a4 delegate:(id)a5 selfLoggingManager:(id)a6;
- (_LTOspreySpeechTranslationSession)initWithService:(id)a3 context:(id)a4 text:(id)a5 delegate:(id)a6 selfLoggingManager:(id)a7;
- (_LTSpeechTranslationDelegate)delegate;
- (_LTTextToSpeechCache)ttsCache;
- (double)endpointTimeout;
- (double)initialOnlineTimeout;
- (double)onlineTimeout;
- (id)_bestSourceTextForResponse:(id)a3;
- (id)_primaryLanguageRecognized;
- (id)_translationForLocale:(id)a3;
- (id)completionBlock;
- (void)_handleAudioLimitExceededResponse:(id)a3;
- (void)_handleFinalBlazarResponse:(id)a3;
- (void)_handleFinalRecognitionResponse:(id)a3;
- (void)_handlePartialRecognitionResponse:(id)a3;
- (void)_handleServerEndpointFeatures:(id)a3;
- (void)_handleTTSResponse:(id)a3;
- (void)_handleTranslationResponse:(id)a3;
- (void)cancel;
- (void)cancelServerTimeout;
- (void)confirmDataIfNeeded;
- (void)didCompressPackets:(id)a3 totalPacketCount:(unint64_t)a4;
- (void)endpoint;
- (void)initCommon;
- (void)sendAnalyticsEvent;
- (void)sendAudioData:(id)a3;
- (void)sendEndAudio;
- (void)serverTimeoutFired;
- (void)setCompletionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointTimeout:(double)a3;
- (void)setInitialOnlineTimeout:(double)a3;
- (void)setLanguagesRecognized:(id)a3;
- (void)setOnlineTimeout:(double)a3;
- (void)setTtsCache:(id)a3;
- (void)startServerTimeoutTimer;
- (void)streamDidReceiveSpeechTranslationStreamingResponse:(id)a3;
- (void)streamFailVerifySpeechTranslationStreamingResponse:(id)a3;
- (void)translationDidFinishWithError:(id)a3;
- (void)updateServerTimeout:(double)a3;
@end

@implementation _LTOspreySpeechTranslationSession

- (void)sendAnalyticsEvent
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  AnalyticsSendEventLazy();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  if (self->_sentAudio) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v27 = v3;
  if (self->_sentEndAudio) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (self->_endpointedSpeech) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v25 = v5;
  if (self->_didReceiveAudioLimitExceededResponse) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (self->_didReceivePartialRecognitionResponse) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (self->_didReceiveFinalRecognitionResponse) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (self->_didReceiveTranslationResponse) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if (self->_didReceiveTTSResponse) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if (self->_didReceiveFinalBlazarResponse) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  if (self->_didTimeout) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v26 = NSString;
  v24 = v12;
  v23 = v11;
  v29 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  v16 = v6;
  v17 = v25;
  v18 = v4;
  v19 = v27;
  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v28 = [v26 stringWithFormat:@"<%@: sentAudio:%@ sentEndAudio:%@ endpointedSpeech:%@ didReceiveAudioLimitExceededResponse:%@ didReceivePartialRecognitionResponse:%@ didReceiveFinalRecognitionResponse:%@ didReceiveTranslationResponse:%@  didReceiveTTSResponse:%@ didReceiveFinalBlazarResponse:%@ didTimeout:%@ error %@>", v21, v19, v18, v17, v16, v15, v14, v13, v29, v23, v24, self->_error];

  return (NSString *)v28;
}

- (_LTOspreySpeechTranslationSession)initWithService:(id)a3 context:(id)a4 delegate:(id)a5 selfLoggingManager:(id)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v46.receiver = self;
  v46.super_class = (Class)_LTOspreySpeechTranslationSession;
  v15 = [(_LTOspreySpeechTranslationSession *)&v46 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v16->_context, a4);
    v17 = [[_LTSpeechCompressor alloc] initWithDelegate:v16];
    speechCompressor = v16->_speechCompressor;
    v16->_speechCompressor = v17;

    [(_LTSpeechCompressor *)v16->_speechCompressor startCompressionNarrowband:0];
    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    finalASRResults = v16->_finalASRResults;
    v16->_finalASRResults = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x263EFF980] array];
    mtResults = v16->_mtResults;
    v16->_mtResults = (NSMutableArray *)v21;

    uint64_t v23 = [MEMORY[0x263EFF980] array];
    confirmedTranslations = v16->_confirmedTranslations;
    v16->_confirmedTranslations = (NSMutableArray *)v23;

    v16->_audioPacketCount = 0;
    v16->_didSendTranslationDidFinish = 0;
    *(void *)&v16->_sentAudio = 0;
    v16->_didReceiveFinalBlazarResponse = 0;
    objc_storeStrong((id *)&v16->_selfLoggingManager, a6);
    v25 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      v27 = [v12 uniqueID];
      v28 = [v12 sessionID];
      v29 = _LTPreferencesSessionIDOverride(v28);
      uint64_t v30 = [v12 dataSharingOptInStatus];
      *(_DWORD *)buf = 138543874;
      v48 = v27;
      __int16 v49 = 2114;
      v50 = v29;
      __int16 v51 = 2048;
      uint64_t v52 = v30;
      _os_log_impl(&dword_2600DC000, v26, OS_LOG_TYPE_INFO, "Starting speech translation with request ID: %{public}@ session ID: %{public}@, opt in status: %zd", buf, 0x20u);
    }
    objc_initWeak((id *)buf, v16);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke;
    v44[3] = &unk_265547E08;
    id v31 = v12;
    id v45 = v31;
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_50;
    v41 = &unk_265547E30;
    v32 = v16;
    v42 = v32;
    v43[1] = (id)a2;
    objc_copyWeak(v43, (id *)buf);
    uint64_t v33 = [v11 performSpeechTranslationWithDelegate:v32 requestBuilder:v44 completion:&v38];
    id v34 = v32[1];
    v32[1] = (id)v33;

    v35 = objc_msgSend(v31, "_ospreySpeechTranslationRequestWithHybridEndpointer:", 1, v38, v39, v40, v41);
    [v32[1] sendSpeechTranslationStreamingRequest:v35];
    [v32 initCommon];
    v36 = v32;

    objc_destroyWeak(v43);
    objc_destroyWeak((id *)buf);
  }

  return v16;
}

- (_LTOspreySpeechTranslationSession)initWithService:(id)a3 context:(id)a4 text:(id)a5 delegate:(id)a6 selfLoggingManager:(id)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v43.receiver = self;
  v43.super_class = (Class)_LTOspreySpeechTranslationSession;
  v17 = [(_LTOspreySpeechTranslationSession *)&v43 init];
  if (v17)
  {
    if (!v14)
    {
      v18 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_LTOspreySpeechTranslationSession initWithService:context:text:delegate:selfLoggingManager:]();
      }
    }
    objc_storeWeak((id *)&v17->_delegate, v15);
    objc_storeStrong((id *)&v17->_context, a4);
    uint64_t v19 = [MEMORY[0x263EFF980] array];
    mtResults = v17->_mtResults;
    v17->_mtResults = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x263EFF980] array];
    confirmedTranslations = v17->_confirmedTranslations;
    v17->_confirmedTranslations = (NSMutableArray *)v21;

    uint64_t v23 = [v14 copy];
    cachedUserTypedText = v17->_cachedUserTypedText;
    v17->_cachedUserTypedText = (NSString *)v23;

    objc_storeStrong((id *)&v17->_selfLoggingManager, a7);
    v25 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      v27 = [v13 uniqueID];
      v28 = [v13 sessionID];
      v29 = _LTPreferencesSessionIDOverride(v28);
      uint64_t v30 = [v13 dataSharingOptInStatus];
      *(_DWORD *)buf = 138543874;
      id v45 = v27;
      __int16 v46 = 2114;
      v47 = v29;
      __int16 v48 = 2048;
      uint64_t v49 = v30;
      _os_log_impl(&dword_2600DC000, v26, OS_LOG_TYPE_INFO, "Starting text to speech translation with request ID: %{public}@, session ID: %{public}@, opt in status: %zd", buf, 0x20u);
    }
    objc_initWeak((id *)buf, v17);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke;
    v41[3] = &unk_265547E08;
    id v31 = v13;
    id v42 = v31;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke_2;
    v38[3] = &unk_265547E58;
    v32 = v17;
    uint64_t v39 = v32;
    objc_copyWeak(&v40, (id *)buf);
    uint64_t v33 = [v12 performSpeechTranslationWithDelegate:v32 requestBuilder:v41 completion:v38];
    id v34 = v32[1];
    v32[1] = (id)v33;

    v35 = [v31 _ospreyTextToSpeechTranslationRequestWithText:v14];
    [v32[1] sendSpeechTranslationStreamingRequest:v35];
    [v32 initCommon];
    v36 = v32;

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }

  return v17;
}

- (void)initCommon
{
  self->_initialOnlineTimeout = _LTPreferencesServerSpeechSessionInitialOnlineTimeout();
  self->_onlineTimeout = _LTPreferencesServerSpeechSessionOnlineTimeout();
  self->_endpointTimeout = _LTPreferencesServerSpeechSessionEndpointTimeout();
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.translation.speech-timer", 0);
  timerQueue = self->_timerQueue;
  self->_timerQueue = v3;

  [(_LTOspreySpeechTranslationSession *)self startServerTimeoutTimer];
  selfLoggingManager = self->_selfLoggingManager;
  id v7 = [(_LTTranslationContext *)self->_context logIdentifier];
  v6 = [(_LTTranslationContext *)self->_context uniqueID];
  [(_LTDSELFLoggingManager *)selfLoggingManager sendSpeechTranslationFrameworkRequestSentWithInvocationId:v7 qssSessionId:v6 requestRoute:1 payloadSizeInBytes:0];
}

- (void)startServerTimeoutTimer
{
  if (!self->_serverTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_timerQueue);
    serverTimer = self->_serverTimer;
    self->_serverTimer = v3;

    [(_LTOspreySpeechTranslationSession *)self updateServerTimeout:self->_initialOnlineTimeout];
    v5 = self->_serverTimer;
    dispatch_resume(v5);
  }
}

- (void)updateServerTimeout:(double)a3
{
  if (self->_serverTimer)
  {
    objc_initWeak(&location, self);
    serverTimer = self->_serverTimer;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57___LTOspreySpeechTranslationSession_updateServerTimeout___block_invoke;
    v11[3] = &unk_265545E20;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(serverTimer, v11);
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_LTOspreySpeechTranslationSession updateServerTimeout:](v6, a3, v7, v8);
    }
    v9 = self->_serverTimer;
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)cancelServerTimeout
{
  serverTimer = self->_serverTimer;
  if (serverTimer)
  {
    dispatch_source_cancel(serverTimer);
    v4 = self->_serverTimer;
    self->_serverTimer = 0;
  }
}

- (void)serverTimeoutFired
{
  v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Server timeout triggered", v5, 2u);
  }
  self->_didTimeout = 1;
  v4 = objc_msgSend(MEMORY[0x263F087E8], "lt_translationTimeout");
  [(_LTOspreySpeechTranslationSession *)self translationDidFinishWithError:v4];

  [(_LTOspreySpeechTranslationSession *)self cancel];
}

- (void)sendAudioData:(id)a3
{
  id v4 = a3;
  if (self->_didReceiveFinalRecognitionResponse)
  {
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_LTOspreySpeechTranslationSession sendAudioData:]();
    }
  }
  else if (self->_sentEndAudio)
  {
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_LTOspreySpeechTranslationSession sendAudioData:]();
    }
  }
  else
  {
    BOOL endpointedSpeech = self->_endpointedSpeech;
    uint64_t v8 = _LTOSLogTranslationEngine();
    v9 = v8;
    if (endpointedSpeech)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[_LTOspreySpeechTranslationSession sendAudioData:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)dispatch_time_t v10 = 0;
        _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "sendAudioData: Start compressing audio", v10, 2u);
      }
      [(_LTSpeechCompressor *)self->_speechCompressor addAudioSampleData:v4];
      self->_sentAudio = 1;
    }
  }
}

- (void)sendEndAudio
{
  if (self->_sentAudio && !self->_sentEndAudio)
  {
    self->_sentEndAudio = 1;
    v3 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Sending end audio", v6, 2u);
    }
    id v4 = objc_alloc_init(FTMutableFinishAudio);
    [(FTMutableFinishAudio *)v4 setPacket_count:LODWORD(self->_audioPacketCount)];
    v5 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
    [(FTMutableSpeechTranslationStreamingRequest *)v5 setContent_type:5];
    [(FTMutableSpeechTranslationStreamingRequest *)v5 setContentAsFTFinishAudio:v4];
    [(FTSpeechTranslationStreamingContext *)self->_streamContext sendSpeechTranslationStreamingRequest:v5];
  }
}

- (void)endpoint
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Ending audio due to endpointer trigger", v2, v3, v4, v5, v6);
}

- (void)cancel
{
  [(_LTOspreySpeechTranslationSession *)self sendEndAudio];
  [(FTSpeechTranslationStreamingContext *)self->_streamContext closeStream];
  self->_isCancelled = 1;
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)setLanguagesRecognized:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_lidResult, a3);
  char v6 = [v5 isFinal];
  uint64_t v7 = _LTOSLogTranslationEngine();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      dispatch_time_t v10 = [(_LTOspreySpeechTranslationSession *)self _primaryLanguageRecognized];
      id v11 = [v10 _ltLocaleIdentifier];
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "LID result received. Primary language recognized: %{public}@", buf, 0xCu);
    }
    v28 = self;
    [(_LTOspreySpeechTranslationSession *)self confirmDataIfNeeded];
    id v12 = objc_alloc_init(FTMutableLanguageDetected);
    id v13 = [v5 dominantLanguage];
    id v14 = [v13 _ltLocaleIdentifier];
    [(FTMutableLanguageDetected *)v12 setDetected_locale:v14];

    id v15 = [MEMORY[0x263EFF980] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = [v5 confidences];
    v17 = [v16 allKeys];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v23 = objc_alloc_init(FTMutableLanguageDetectionPrediction);
          v24 = [v22 _ltLocaleIdentifier];
          [(FTMutableLanguageDetectionPrediction *)v23 setLocale:v24];

          v25 = [v5 confidences];
          v26 = [v25 objectForKeyedSubscript:v22];
          [v26 floatValue];
          -[FTMutableLanguageDetectionPrediction setConfidence:](v23, "setConfidence:");

          [v15 addObject:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }

    [(FTMutableLanguageDetected *)v12 setPredictions:v15];
    v27 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
    [(FTMutableSpeechTranslationStreamingRequest *)v27 setContent_type:2];
    [(FTMutableSpeechTranslationStreamingRequest *)v27 setContentAsFTLanguageDetected:v12];
    [(FTSpeechTranslationStreamingContext *)v28->_streamContext sendSpeechTranslationStreamingRequest:v27];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[_LTOspreySpeechTranslationSession setLanguagesRecognized:]();
  }
}

- (id)_primaryLanguageRecognized
{
  if ([(_LTTranslationContext *)self->_context autodetectLanguage])
  {
    lidResult = self->_lidResult;
    if (lidResult)
    {
      uint64_t v4 = [(_LTLanguageDetectionResult *)lidResult dominantLanguage];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    id v5 = [(_LTTranslationContext *)self->_context localePair];
    uint64_t v4 = [v5 sourceLocale];
  }
  return v4;
}

- (id)_translationForLocale:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_mtResults;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        dispatch_time_t v10 = objc_msgSend(v9, "locale", (void)v13);
        char v11 = [v10 _ltEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)translationDidFinishWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_error, a3);
  [(_LTOspreySpeechTranslationSession *)self sendEndAudio];
  [(_LTOspreySpeechTranslationSession *)self cancelServerTimeout];
  if (!self->_didSendTranslationDidFinish)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      self->_didSendTranslationDidFinish = 1;
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 translationDidFinishWithError:v5];
    }
    else
    {
      v9 = _LTOSLogTranslationEngine();
      dispatch_time_t v10 = v9;
      if (v5)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          -[_LTOspreySpeechTranslationSession translationDidFinishWithError:]();
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        id v12 = self;
        _os_log_impl(&dword_2600DC000, v10, OS_LOG_TYPE_INFO, "Warning: Speech session %p finished successfully but there's no delegate to inform", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)confirmDataIfNeeded
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Sending MT responses if needed", v2, v3, v4, v5, v6);
}

- (void)didCompressPackets:(id)a3 totalPacketCount:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint8_t v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = v6;
    int v11 = 134217984;
    uint64_t v12 = [v5 count];
    _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Sending %zu packets from compressor", (uint8_t *)&v11, 0xCu);
  }
  id v8 = [v5 _ltCompactMap:&__block_literal_global_22];
  v9 = objc_alloc_init(FTMutableSpeechTranslationAudioPacket);
  [(FTMutableSpeechTranslationAudioPacket *)v9 setAudio_frames:v8];
  dispatch_time_t v10 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
  [(FTMutableSpeechTranslationStreamingRequest *)v10 setContent_type:4];
  [(FTMutableSpeechTranslationStreamingRequest *)v10 setContentAsFTSpeechTranslationAudioPacket:v9];
  [(FTSpeechTranslationStreamingContext *)self->_streamContext sendSpeechTranslationStreamingRequest:v10];
  self->_audioPacketCount += [v8 count];
}

- (void)_handleAudioLimitExceededResponse:(id)a3
{
  self->_didReceiveAudioLimitExceededResponse = 1;
  uint64_t v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[_LTOspreySpeechTranslationSession _handleAudioLimitExceededResponse:]();
  }
  id v5 = objc_msgSend(MEMORY[0x263F087E8], "lt_speechLimitExceeded");
  [(_LTOspreySpeechTranslationSession *)self translationDidFinishWithError:v5];
}

- (void)_handlePartialRecognitionResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_didReceivePartialRecognitionResponse = 1;
  id v5 = objc_msgSend(v4, "source_locale");

  if (v5)
  {
    [(_LTOspreySpeechTranslationSession *)self updateServerTimeout:self->_onlineTimeout];
    uint8_t v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = v6;
      id v8 = objc_msgSend(v4, "source_locale");
      int v14 = 138543362;
      long long v15 = v8;
      _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Always sending ASR partial %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1C130]), "initWithOspreyPartialRecognitionResponse:isSanitized:", v4, -[_LTTranslationContext censorSpeech](self->_context, "censorSpeech"));
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)p_delegate);
      [v13 speechRecognitionResult:v9];
    }
  }
}

- (void)_handleFinalRecognitionResponse:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Received final recognition response", v20, 2u);
  }
  uint8_t v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_LTOspreySpeechTranslationSession _handleFinalRecognitionResponse:](v6, v4);
  }
  self->_didReceiveFinalRecognitionResponse = 1;
  id v7 = objc_alloc(MEMORY[0x263EFF960]);
  id v8 = objc_msgSend(v4, "source_locale");
  v9 = (void *)[v7 initWithLocaleIdentifier:v8];

  uint64_t v10 = _LTPreferencesServerASRConfidenceThreshold(v9);
  if (([(_LTTranslationContext *)self->_context asrConfidenceThreshold] & 0x8000000000000000) == 0) {
    uint64_t v10 = [(_LTTranslationContext *)self->_context asrConfidenceThreshold];
  }
  int v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C130]), "initWithOspreyResponse:confidenceThreshold:isSanitized:", v4, v10, -[_LTTranslationContext censorSpeech](self->_context, "censorSpeech"));
  char v12 = [v11 transcriptions];
  id v13 = [v12 _ltCompactMap:&__block_literal_global_72];

  int v14 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[_LTOspreySpeechTranslationSession _handleFinalRecognitionResponse:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    [v17 speechRecognitionResult:v11];
  }
  finalASRResults = self->_finalASRResults;
  uint64_t v19 = [v11 locale];
  [(NSMutableDictionary *)finalASRResults setObject:v11 forKeyedSubscript:v19];

  [(_LTOspreySpeechTranslationSession *)self confirmDataIfNeeded];
}

- (void)_handleServerEndpointFeatures:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "source_locale");
  if (v5
    && (uint8_t v6 = (void *)v5,
        objc_msgSend(v4, "server_endpoint_features"),
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    [(_LTOspreySpeechTranslationSession *)self updateServerTimeout:self->_onlineTimeout];
    id v8 = objc_alloc(MEMORY[0x263F1C110]);
    v9 = objc_msgSend(v4, "server_endpoint_features");
    uint64_t v10 = (void *)[v8 initWithResponse:v9];

    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)p_delegate);
      id v15 = objc_alloc(MEMORY[0x263EFF960]);
      char v16 = objc_msgSend(v4, "source_locale");
      id v17 = (void *)[v15 initWithLocaleIdentifier:v16];
      [v14 serverEndpointerFeatures:v10 locale:v17];
    }
  }
  else
  {
    uint64_t v18 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[_LTOspreySpeechTranslationSession _handleServerEndpointFeatures:]();
    }
  }
}

- (id)_bestSourceTextForResponse:(id)a3
{
  cachedUserTypedText = self->_cachedUserTypedText;
  if (cachedUserTypedText)
  {
    id v4 = cachedUserTypedText;
  }
  else
  {
    uint8_t v6 = objc_msgSend(a3, "translation_locale_pair");
    id v7 = objc_msgSend(v6, "source_locale");

    id v8 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v7];
    v9 = [(NSMutableDictionary *)self->_finalASRResults objectForKeyedSubscript:v8];
    uint64_t v10 = [v9 bestTranscription];
    id v4 = [v10 formattedString];
  }
  return v4;
}

- (void)_handleTranslationResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_LTOspreySpeechTranslationSession *)self _bestSourceTextForResponse:v4];
  uint8_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F1C190]), "initWithOspreySpeechTranslationMTResponse:sourceText:censorSpeech:", v4, v5, -[_LTTranslationContext censorSpeech](self->_context, "censorSpeech"));
  [(_LTOspreySpeechTranslationSession *)self updateServerTimeout:self->_onlineTimeout];
  int v7 = objc_msgSend(v4, "is_final");

  if (v7) {
    self->_didReceiveTranslationResponse = 1;
  }
  id v8 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_LTOspreySpeechTranslationSession _handleTranslationResponse:](v8, v6);
  }
  [(NSMutableArray *)self->_mtResults addObject:v6];
  [(_LTOspreySpeechTranslationSession *)self confirmDataIfNeeded];
}

- (void)_handleTTSResponse:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_didReceiveTTSResponse = 1;
  uint64_t v5 = _LTOSLogTTS();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint8_t v6 = v5;
    int v7 = objc_msgSend(v4, "target_locale");
    id v8 = objc_msgSend(v4, "text_to_speech_response");
    *(_DWORD *)buf = 138543618;
    uint64_t v38 = v7;
    __int16 v39 = 2048;
    uint64_t v40 = objc_msgSend(v8, "audio_type");
    _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Received TTS response: %{public}@ (%zd)", buf, 0x16u);
  }
  [(_LTOspreySpeechTranslationSession *)self updateServerTimeout:self->_onlineTimeout];
  v9 = (void *)MEMORY[0x263EFF960];
  uint64_t v10 = objc_msgSend(v4, "target_locale");
  uint64_t v11 = [v9 localeWithLocaleIdentifier:v10];

  id v34 = (void *)v11;
  uint64_t v33 = [(_LTOspreySpeechTranslationSession *)self _translationForLocale:v11];
  char v12 = [v33 translations];
  char v13 = [v12 firstObject];

  id v14 = [v13 sanitizedFormattedString];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v13 formattedString];
  }
  id v17 = v16;

  uint64_t v18 = (void *)MEMORY[0x263F1C1C8];
  uint64_t v19 = objc_msgSend(v4, "text_to_speech_response");
  uint64_t v20 = objc_msgSend(v19, "word_timing_info");
  uint64_t v21 = [v18 wordTimingInfoFromArray:v20 text:v17];

  v22 = [_LTAudioData alloc];
  uint64_t v23 = objc_msgSend(v4, "text_to_speech_response");
  v24 = objc_msgSend(v23, "decoder_description");
  v25 = v24;
  if (v24)
  {
    [v24 audioStreamBasicDescription];
  }
  else
  {
    uint64_t v36 = 0;
    memset(v35, 0, sizeof(v35));
  }
  v26 = objc_msgSend(v4, "text_to_speech_response");
  v27 = [v26 audio];
  v28 = [(_LTAudioData *)v22 initWithASBD:v35 rawData:v27 wordTimingInfo:v21];

  if (!v28)
  {
    long long v29 = _LTOSLogTTS();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[_LTOspreySpeechTranslationSession _handleTTSResponse:]();
    }
  }
  long long v30 = NSString;
  long long v31 = objc_msgSend(v4, "target_locale");
  long long v32 = [v30 stringWithFormat:@"%@-%@", v31, v17];

  [(_LTTextToSpeechCache *)self->_ttsCache cacheAudioData:v28 forKey:v32];
}

- (BOOL)_receivedEmptyFinalASRResults
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (![(NSMutableDictionary *)self->_finalASRResults count]) {
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_finalASRResults allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = [v8 bestTranscription];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [v8 bestTranscription];
          char v12 = [v11 formattedString];
          int v13 = [v12 isEqualToString:&stru_270C008E8];

          if (!v13)
          {
            BOOL v14 = 0;
            goto LABEL_14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (void)_handleFinalBlazarResponse:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(_LTOspreySpeechTranslationSession *)self cancelServerTimeout];
  self->_didReceiveFinalBlazarResponse = 1;
  [(FTSpeechTranslationStreamingContext *)self->_streamContext closeStream];
  if (_LTRemoteStatusIsSuccess(objc_msgSend(v4, "return_code")))
  {
    if (![(_LTOspreySpeechTranslationSession *)self _receivedEmptyFinalASRResults])
    {
      char v12 = 0;
      goto LABEL_11;
    }
    uint64_t v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_LTOspreySpeechTranslationSession _handleFinalBlazarResponse:]();
    }
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F1C1D0];
    v16[0] = *MEMORY[0x263F08320];
    uint64_t v9 = [v6 localizedStringForKey:@"EMPTY_RECOGNITION_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
    v17[0] = v9;
    v16[1] = *MEMORY[0x263F08338];
    uint64_t v10 = [v6 localizedStringForKey:@"SPEECH_NOT_RECOGNIZED_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
    v17[1] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    char v12 = [v7 errorWithDomain:v8 code:10 userInfo:v11];
  }
  else
  {
    int v13 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_LTOspreySpeechTranslationSession _handleFinalBlazarResponse:](v13, v4);
    }
    unsigned int v14 = objc_msgSend(v4, "return_code");
    uint64_t v6 = objc_msgSend(v4, "return_str");
    char v12 = _LTErrorFromRemoteFailure(v14, v6);
  }

LABEL_11:
  [(_LTOspreySpeechTranslationSession *)self translationDidFinishWithError:v12];
  if (!self->_isCancelled)
  {
    completionBlock = (void (**)(id, void *))self->_completionBlock;
    if (completionBlock) {
      completionBlock[2](completionBlock, v12);
    }
  }
}

- (void)streamFailVerifySpeechTranslationStreamingResponse:(id)a3
{
  id v4 = a3;
  [(_LTOspreySpeechTranslationSession *)self translationDidFinishWithError:v4];
  uint64_t v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_LTOspreySpeechTranslationSession streamFailVerifySpeechTranslationStreamingResponse:]();
  }
}

- (void)streamDidReceiveSpeechTranslationStreamingResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Received server message", v7, 2u);
  }
  switch(objc_msgSend(v4, "content_type"))
  {
    case 0:
      [(_LTOspreySpeechTranslationSession *)self cancelServerTimeout];
      break;
    case 1:
      uint64_t v6 = [v4 contentAsFTSpeechTranslationPartialRecognitionResponse];
      [(_LTOspreySpeechTranslationSession *)self _handlePartialRecognitionResponse:v6];
      goto LABEL_12;
    case 2:
      uint64_t v6 = [v4 contentAsFTSpeechTranslationFinalRecognitionResponse];
      [(_LTOspreySpeechTranslationSession *)self _handleFinalRecognitionResponse:v6];
      goto LABEL_12;
    case 3:
      uint64_t v6 = [v4 contentAsFTAudioLimitExceeded];
      [(_LTOspreySpeechTranslationSession *)self _handleAudioLimitExceededResponse:v6];
      goto LABEL_12;
    case 4:
      uint64_t v6 = [v4 contentAsFTSpeechTranslationMtResponse];
      [(_LTOspreySpeechTranslationSession *)self _handleTranslationResponse:v6];
      goto LABEL_12;
    case 5:
      uint64_t v6 = [v4 contentAsFTSpeechTranslationTextToSpeechResponse];
      [(_LTOspreySpeechTranslationSession *)self _handleTTSResponse:v6];
      goto LABEL_12;
    case 6:
      uint64_t v6 = [v4 contentAsFTFinalBlazarResponse];
      [(_LTOspreySpeechTranslationSession *)self _handleFinalBlazarResponse:v6];
      goto LABEL_12;
    case 12:
      uint64_t v6 = [v4 contentAsFTSpeechTranslationServerEndpointFeatures];
      [(_LTOspreySpeechTranslationSession *)self _handleServerEndpointFeatures:v6];
LABEL_12:

      break;
    default:
      break;
  }
}

- (double)initialOnlineTimeout
{
  return self->_initialOnlineTimeout;
}

- (void)setInitialOnlineTimeout:(double)a3
{
  self->_initialOnlineTimeout = a3;
}

- (double)onlineTimeout
{
  return self->_onlineTimeout;
}

- (void)setOnlineTimeout:(double)a3
{
  self->_onlineTimeout = a3;
}

- (double)endpointTimeout
{
  return self->_endpointTimeout;
}

- (void)setEndpointTimeout:(double)a3
{
  self->_endpointTimeout = a3;
}

- (_LTTextToSpeechCache)ttsCache
{
  return self->_ttsCache;
}

- (void)setTtsCache:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (_LTSpeechTranslationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_LTSpeechTranslationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_ttsCache, 0);
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_serverTimer, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_speechCompressor, 0);
  objc_storeStrong((id *)&self->_confirmedTranslations, 0);
  objc_storeStrong((id *)&self->_mtResults, 0);
  objc_storeStrong((id *)&self->_cachedUserTypedText, 0);
  objc_storeStrong((id *)&self->_finalASRResults, 0);
  objc_storeStrong((id *)&self->_lidResult, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_streamContext, 0);
}

- (void)initWithService:context:text:delegate:selfLoggingManager:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Initializing LTOspreySpeechTranslationSession with no text to translate. This may not be what you want.", v2, v3, v4, v5, v6);
}

- (void)updateServerTimeout:(uint64_t)a3 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 134217984;
  double v5 = a2;
  OUTLINED_FUNCTION_2_4(&dword_2600DC000, a1, a4, "Setting server timeout for %.2fs", (uint8_t *)&v4);
}

- (void)sendAudioData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "sendAudioData: Already endpointed, do not need to send additional audio", v2, v3, v4, v5, v6);
}

- (void)sendAudioData:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "sendAudioData: Already sent end audio, not sending audio", v2, v3, v4, v5, v6);
}

- (void)sendAudioData:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "sendAudioData: Final ASR response received, not sending audio", v2, v3, v4, v5, v6);
}

- (void)setLanguagesRecognized:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Ignoring non-final LID result", v2, v3, v4, v5, v6);
}

- (void)translationDidFinishWithError:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_2600DC000, v1, OS_LOG_TYPE_FAULT, "Speech session %p finished with error, but there's no delegate to inform; error: %@",
    v2,
    0x16u);
}

- (void)_handleAudioLimitExceededResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Audio limit exceeded", v2, v3, v4, v5, v6);
}

- (void)_handleFinalRecognitionResponse:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_2600DC000, v0, v1, "Recognition: %{sensitive}@", v2);
}

- (void)_handleFinalRecognitionResponse:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  objc_msgSend(a2, "return_code");
  uint64_t v4 = objc_msgSend(a2, "return_str");
  OUTLINED_FUNCTION_5_2();
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "Final recognition status: %d: %@", v5, 0x12u);
}

- (void)_handleServerEndpointFeatures:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Insufficient information in server endpointer features response", v2, v3, v4, v5, v6);
}

- (void)_handleTranslationResponse:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 locale];
  uint64_t v5 = [v4 _ltLocaleIdentifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_2600DC000, v3, v6, "Received translation response: %{public}@", v7);
}

- (void)_handleTTSResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unable to process TTS audio data", v2, v3, v4, v5, v6);
}

- (void)_handleFinalBlazarResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Send out no translation results caused by empty recognition", v2, v3, v4, v5, v6);
}

- (void)_handleFinalBlazarResponse:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  objc_msgSend(a2, "return_code");
  uint64_t v4 = objc_msgSend(a2, "return_str");
  OUTLINED_FUNCTION_5_2();
  _os_log_error_impl(&dword_2600DC000, v3, OS_LOG_TYPE_ERROR, "Remote service error %d: %@", v5, 0x12u);
}

- (void)streamFailVerifySpeechTranslationStreamingResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Speech translation stream error: %@", v2, v3, v4, v5, v6);
}

@end