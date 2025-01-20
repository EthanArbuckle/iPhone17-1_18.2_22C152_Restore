@interface NAFConnection
+ (BOOL)assistantIsSupportedForLanguageCode:(id)a3 error:(id *)a4;
+ (BOOL)isAvailable;
+ (BOOL)isNetworkAvailable;
+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 deviceProductVersion:(id)a4 error:(id *)a5;
+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 productName:(id)a4 productVersion:(id)a5 error:(id *)a6;
+ (id)currentLanguageCode;
+ (id)outputVoice;
+ (void)beginMonitoringAvailability;
+ (void)defrost;
+ (void)stopMonitoringAvailability;
- (BOOL)_shouldEmitUEIRequestLinkForRequestInfo:(id)a3 speechRequestOptions:(id)a4;
- (BOOL)_startInputAudioPowerUpdatesWithXPCWrapper:(id)a3;
- (BOOL)hasActiveRequest;
- (BOOL)isRecording;
- (BOOL)shouldSpeak;
- (NAFAssistantUIService)delegate;
- (NAFConnection)init;
- (NAFConnection)initWithTargetQueue:(id)a3;
- (NAFConnection)initWithTargetQueue:(id)a3 instanceContext:(id)a4;
- (NAFSpeechDelegate)speechDelegate;
- (float)averagePower;
- (float)peakPower;
- (id)_activeRequestUUID;
- (id)_cachedBulletins;
- (id)_clientConfiguration;
- (id)_clientService;
- (id)_clientServiceWithErrorHandler:(id)a3;
- (id)_connection;
- (id)_metricContextValueForUseDeviceSpeakerForTTS:(int64_t)a3;
- (id)_siriClientStateManager;
- (id)_startRequestMetricSettings;
- (id)acquireUserInteractionAssertion;
- (id)startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:(id)a3;
- (int64_t)_getActiveSpeechEvent;
- (unsigned)audioSessionID;
- (void)_aceConnectionWillRetryOnError:(id)a3;
- (void)_barrier;
- (void)_beginInterstitialsForReason:(id)a3;
- (void)_cancelRequestTimeoutForReason:(id)a3;
- (void)_checkAndSetIsCapturingSpeech:(BOOL)a3;
- (void)_clearAssistantInfoForAccountWithIdentifier:(id)a3;
- (void)_clearConnection;
- (void)_completeRequestWithUUID:(id)a3 forReason:(int64_t)a4 error:(id)a5;
- (void)_connectionFailedWithError:(id)a3;
- (void)_dispatchCallbackGroupBlock:(id)a3;
- (void)_dispatchCommand:(id)a3 isInterstitial:(BOOL)a4 interstitialPhase:(int64_t)a5 interstitialDelay:(double)a6 reply:(id)a7;
- (void)_endInterstitialsForReason:(id)a3;
- (void)_enqueueInterstitialCommand:(id)a3;
- (void)_extendExistingRequestTimeoutForReason:(id)a3;
- (void)_extendExpiringRequestTimeout;
- (void)_extendRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4;
- (void)_fetchShouldSpeak:(id)a3;
- (void)_handleCommand:(id)a3 reply:(id)a4;
- (void)_handleInterstitialPhase:(int64_t)a3 fromProvider:(id)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9;
- (void)_invokeRequestTimeoutForReason:(id)a3;
- (void)_markIsDucking;
- (void)_markIsTwoShot;
- (void)_markNetworkDidBecomeActive;
- (void)_markSpeechRecognized;
- (void)_pauseRequestTimeoutForReason:(id)a3;
- (void)_requestDidEnd;
- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 analyticsEventProvider:(id)a7;
- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 isBackgroundRequest:(BOOL)a7 analyticsEventProvider:(id)a8;
- (void)_resumeRequestTimeoutForReason:(id)a3;
- (void)_scheduleRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4;
- (void)_setAudioSessionID:(unsigned int)a3;
- (void)_setRecordRoute:(id)a3;
- (void)_setShouldSpeak:(BOOL)a3;
- (void)_speechRecordingDidFailWithError:(id)a3;
- (void)_startRequestTimeoutTimerWithTimeInterval:(double)a3 reason:(id)a4;
- (void)_startRequestWithAceCommand:(id)a3 turnIdentifier:(id)a4 suppressAlert:(BOOL)a5;
- (void)_startRequestWithInfo:(id)a3;
- (void)_startUIRequestWithInfo:(id)a3 completion:(id)a4;
- (void)_startUIRequestWithText:(id)a3 completion:(id)a4;
- (void)_stopInputAudioPowerUpdates;
- (void)_tellDelegateAudioPlaybackRequestDidStart:(id)a3;
- (void)_tellDelegateAudioPlaybackRequestDidStop:(id)a3 error:(id)a4;
- (void)_tellDelegateAudioPlaybackRequestWillStart:(id)a3;
- (void)_tellDelegateAudioSessionDidBecomeActive:(BOOL)a3;
- (void)_tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:(id)a3;
- (void)_tellDelegateAudioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4;
- (void)_tellDelegateAudioSessionIDChanged:(unsigned int)a3;
- (void)_tellDelegateAudioSessionWillBecomeActive:(BOOL)a3;
- (void)_tellDelegateCacheImage:(id)a3;
- (void)_tellDelegateDidDetectMusic;
- (void)_tellDelegateDidFinishAcousticIDRequestWithSuccess:(BOOL)a3;
- (void)_tellDelegateExtensionRequestFinishedForApplication:(id)a3 error:(id)a4;
- (void)_tellDelegateExtensionRequestWillStartForApplication:(id)a3;
- (void)_tellDelegateFailedToLaunchAppWithBundleIdentifier:(id)a3;
- (void)_tellDelegateInvalidateCurrentUserActivity;
- (void)_tellDelegateRequestWillStart;
- (void)_tellDelegateSetUserActivityInfo:(id)a3 webpageURL:(id)a4;
- (void)_tellDelegateShouldSpeakChanged:(BOOL)a3;
- (void)_tellDelegateStartPlaybackDidFail:(int64_t)a3;
- (void)_tellDelegateWillProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)_tellDelegateWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)_tellDelegateWillStartAcousticIDRequest;
- (void)_tellSpeechDelegateRecognitionDidFail:(id)a3;
- (void)_tellSpeechDelegateRecognitionUpdateWillBeginForTask:(id)a3;
- (void)_tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4;
- (void)_tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4;
- (void)_tellSpeechDelegateRecordingDidCancel;
- (void)_tellSpeechDelegateRecordingDidChangeAVRecordRoute:(id)a3;
- (void)_tellSpeechDelegateRecordingDidDetectStartpoint;
- (void)_tellSpeechDelegateRecordingDidEnd;
- (void)_tellSpeechDelegateRecordingDidFail:(id)a3;
- (void)_tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5;
- (void)_tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3;
- (void)_tellSpeechDelegateSpeechRecognized:(id)a3;
- (void)_tellSpeechDelegateSpeechRecognizedPartialResult:(id)a3;
- (void)_tellSpeechDelegateToPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4;
- (void)_updateClientConfiguration;
- (void)_updateSpeechEndHostTime:(unint64_t)a3;
- (void)_updateState;
- (void)_updateStateIfNotInSync;
- (void)_willCancelRequest;
- (void)_willCompleteRequest;
- (void)_willEndSession;
- (void)_willFailRequestWithError:(id)a3;
- (void)_willPresentUsefulUserResultWithType:(int64_t)a3;
- (void)_willStartRequestWithSpeech:(BOOL)a3 speechRequestOptions:(id)a4 requestInfo:(id)a5 analyticsEventProvider:(id)a6;
- (void)_willStopRecordingWithSignpostID:(unint64_t)a3;
- (void)accessibilityObserver:(id)a3 stateDidChangeFrom:(id)a4 to:(id)a5;
- (void)acquireAudioSessionWithContext:(id)a3 completion:(id)a4;
- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5;
- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4;
- (void)broadcastCommandDictionary:(id)a3;
- (void)cancelRequest;
- (void)cancelRequestForReason:(int64_t)a3;
- (void)cancelSpeech;
- (void)checkLanguageReady:(id)a3 completion:(id)a4;
- (void)clearContext;
- (void)dealloc;
- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4;
- (void)didDismissUI;
- (void)endSession;
- (void)failRequestWithError:(id)a3;
- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5;
- (void)forceAudioSessionActive;
- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4;
- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 speechRequestOptions:(id)a5 completion:(id)a6;
- (void)forceAudioSessionInactive;
- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3;
- (void)interstitialProvider:(id)a3 handlePhase:(int64_t)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9;
- (void)invalidate;
- (void)preheatWithStyle:(int64_t)a3;
- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4;
- (void)prepareForPhoneCall;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6;
- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5;
- (void)requestBarrier:(id)a3;
- (void)requestBarrierIfNecessary:(id)a3;
- (void)requestDidAskForTimeoutExtension:(double)a3;
- (void)resumeInterruptedAudioPlaybackIfNeeded;
- (void)rollbackClearContext;
- (void)rollbackRequest;
- (void)sendGenericAceCommand:(id)a3;
- (void)sendGenericAceCommand:(id)a3 conflictHandler:(id)a4;
- (void)sendGenericAceCommand:(id)a3 turnIdentifier:(id)a4 conflictHandler:(id)a5;
- (void)sendReplyCommand:(id)a3;
- (void)setAccessibilityState:(id)a3;
- (void)setAlertContextWithBulletins:(id)a3;
- (void)setAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3;
- (void)setApplicationContext:(id)a3;
- (void)setApplicationContextForApplicationInfos:(id)a3;
- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceRingerSwitchState:(int64_t)a3;
- (void)setIsDeviceInStarkMode:(BOOL)a3;
- (void)setLockState:(BOOL)a3 screenLocked:(BOOL)a4;
- (void)setModesConfiguration:(id)a3;
- (void)setMyriadDecisionResult:(BOOL)a3;
- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4;
- (void)setShouldWaitForMyriad:(BOOL)a3;
- (void)setSpeechDelegate:(id)a3;
- (void)setSupportsCarPlayVehicleData:(BOOL)a3;
- (void)setVoiceOverIsActive:(BOOL)a3;
- (void)setWatchAuthenticated:(BOOL)a3;
- (void)startAcousticIDRequestWithOptions:(id)a3;
- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)startContinuationRequestWithUserInfo:(id)a3;
- (void)startDirectActionRequestWithString:(id)a3;
- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 completion:(id)a4;
- (void)startRequestWithAceCommand:(id)a3;
- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5;
- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5 turnIdentifier:(id)a6;
- (void)startRequestWithInfo:(id)a3 activationEvent:(int64_t)a4;
- (void)startRequestWithText:(id)a3;
- (void)startSpeechPronunciationRequestWithOptions:(id)a3 pronunciationContext:(id)a4;
- (void)startSpeechRequestWithOptions:(id)a3;
- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3;
- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3 isNarrowBand:(BOOL)a4;
- (void)stopAllAudioPlaybackRequests:(BOOL)a3;
- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4;
- (void)stopSpeech;
- (void)stopSpeechWithOptions:(id)a3;
- (void)telephonyRequestCompleted;
- (void)updateSpeechOptions:(id)a3;
- (void)updateSpeechSynthesisRecord:(id)a3;
- (void)usefulUserResultWillPresent;
- (void)willPresentUI;
- (void)willPresentUsefulUserResultWithType:(int64_t)a3;
- (void)willPresentUsefulUserResultWithType:(int64_t)a3 forCommand:(id)a4;
- (void)willSetApplicationContextWithRefId:(id)a3;
@end

@implementation NAFConnection

- (NAFConnection)initWithTargetQueue:(id)a3 instanceContext:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)NAFConnection;
  v9 = [(NAFConnection *)&v37 init];
  v10 = v9;
  if (v9)
  {
    v9->_clientID = v9;
    if (v4 && (memset(&v38, 0, sizeof(v38)), dladdr(v4, &v38)))
    {
      if (v38.dli_fname && *v38.dli_fname)
      {
        id v11 = [NSString alloc];
        v12 = (void *)[v11 initWithUTF8String:v38.dli_fname];
      }
      else
      {
        v12 = 0;
      }
      if (v38.dli_sname && *v38.dli_sname)
      {
        id v14 = [NSString alloc];
        v15 = (void *)[v14 initWithUTF8String:v38.dli_sname];
      }
      else
      {
        v15 = 0;
      }
      v16 = (void *)MEMORY[0x263F28448];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __53__NAFConnection_initWithTargetQueue_instanceContext___block_invoke;
      v34[3] = &unk_26550E1D8;
      id v35 = v12;
      id v36 = v15;
      id v17 = v15;
      id v18 = v12;
      uint64_t v13 = [v16 newWithBuilder:v34];
    }
    else
    {
      uint64_t v13 = 0;
    }
    initiationCallSiteInfo = v10->_initiationCallSiteInfo;
    v10->_initiationCallSiteInfo = (AFCallSiteInfo *)v13;

    if (v7)
    {
      v20 = (OS_dispatch_queue *)v7;
      targetQueue = v10->_targetQueue;
      v10->_targetQueue = v20;
    }
    else
    {
      v22 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v23 = MEMORY[0x263EF83A0];
      targetQueue = v10->_targetQueue;
      v10->_targetQueue = v22;
    }

    *((unsigned char *)v10 + 216) |= 2u;
    if (v8)
    {
      v24 = (AFInstanceContext *)v8;
    }
    else
    {
      getAFInstanceContextClass();
      v24 = [(id)objc_claimAutoreleasedReturnValue() defaultContext];
    }
    instanceContext = v10->_instanceContext;
    v10->_instanceContext = v24;

    getAFAnalyticsClass();
    uint64_t v26 = [objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue()) initWithInstanceContext:v8];
    analytics = v10->_analytics;
    v10->_analytics = (AFAnalytics *)v26;

    atomic_store(0, &v10->_activePlaybackCount);
    v10->_uufrID = 0;
    getAFPreferencesClass();
    uint64_t v28 = [(id)objc_claimAutoreleasedReturnValue() sharedPreferences];
    preferences = v10->_preferences;
    v10->_preferences = (AFPreferences *)v28;

    v30 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      v31 = v10->_instanceContext;
      v32 = v10->_initiationCallSiteInfo;
      LODWORD(v38.dli_fname) = 136315906;
      *(const char **)((char *)&v38.dli_fname + 4) = "-[NAFConnection initWithTargetQueue:instanceContext:]";
      WORD2(v38.dli_fbase) = 2048;
      *(void **)((char *)&v38.dli_fbase + 6) = v10;
      HIWORD(v38.dli_sname) = 2112;
      v38.dli_saddr = v31;
      __int16 v39 = 2112;
      v40 = v32;
      _os_log_impl(&dword_25D830000, v30, OS_LOG_TYPE_INFO, "%s %p (instanceContext = %@, caller = %@)", (uint8_t *)&v38, 0x2Au);
    }
  }

  return v10;
}

void __53__NAFConnection_initWithTargetQueue_instanceContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setImagePath:v3];
  [v4 setSymbolName:*(void *)(a1 + 40)];
}

- (NAFConnection)initWithTargetQueue:(id)a3
{
  return [(NAFConnection *)self initWithTargetQueue:a3 instanceContext:0];
}

- (NAFConnection)init
{
  return [(NAFConnection *)self initWithTargetQueue:0];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F28508] errorWithCode:24];
  [(NAFConnection *)self _connectionFailedWithError:v3];
  [(NAFConnection *)self _clearConnection];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[NAFConnection dealloc]";
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)NAFConnection;
  [(NAFConnection *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = objc_storeWeak((id *)&self->_delegate, a3);
  id v5 = a3;
  if (!a3)
  {
    [(NAFConnection *)self _clearConnection];
    id v5 = 0;
  }
}

- (void)_checkAndSetIsCapturingSpeech:(BOOL)a3
{
  if (a3)
  {
    *((unsigned char *)self + 216) |= 4u;
    id v4 = [(NAFConnection *)self _siriClientStateManager];
    [v4 beginListeningForClient:self->_clientID];
  }
  else
  {
    [(NAFConnection *)self _stopInputAudioPowerUpdates];
    *((unsigned char *)self + 216) &= ~4u;
    id v4 = [(NAFConnection *)self _siriClientStateManager];
    [v4 endListeningForClient:self->_clientID];
  }
}

- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 analyticsEventProvider:(id)a7
{
}

- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 isBackgroundRequest:(BOOL)a7 analyticsEventProvider:(id)a8
{
  BOOL v9 = a7;
  BOOL v12 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  v15 = (NSString *)a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v19 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136316418;
    id v23 = "-[NAFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroun"
          "dRequest:analyticsEventProvider:]";
    __int16 v24 = 2048;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v15;
    __int16 v28 = 1024;
    BOOL v29 = v12;
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 1024;
    BOOL v33 = v9;
    _os_log_impl(&dword_25D830000, v19, OS_LOG_TYPE_DEFAULT, "%s %p (requestClass = %@, isSpeechRequest = %d (%@), isBackgroundRequest = %d)", (uint8_t *)&v22, 0x36u);
  }
  if (!v9)
  {
    [(NAFConnection *)self _willStartRequestWithSpeech:v12 speechRequestOptions:v16 requestInfo:v17 analyticsEventProvider:v18];
    [(NAFConnection *)self _tellDelegateRequestWillStart];
    if (!v12)
    {
      v20 = NSStringFromSelector(a2);
      [(NAFConnection *)self _scheduleRequestTimeoutForReason:v20 durationInSeconds:0.0];
      [(NAFConnection *)self _beginInterstitialsForReason:v20];
    }
  }
  *((unsigned char *)self + 216) |= 8u;
  outstandingRequestClass = self->_outstandingRequestClass;
  self->_outstandingRequestClass = v15;
}

- (void)_requestDidEnd
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "-[NAFConnection _requestDidEnd]";
    __int16 v9 = 2048;
    uint64_t v10 = self;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v7, 0x16u);
  }
  *((unsigned char *)self + 216) &= ~8u;
  outstandingRequestClass = self->_outstandingRequestClass;
  self->_outstandingRequestClass = 0;

  v6 = NSStringFromSelector(a2);
  [(NAFConnection *)self _endInterstitialsForReason:v6];
  [(NAFConnection *)self _cancelRequestTimeoutForReason:v6];
}

- (void)_startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self startUIRequestWithText:v10 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)_startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self startUIRequestWithInfo:v10 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)_handleCommand:(id)a3 reply:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, id, void))a4;
  char v8 = (os_log_t *)MEMORY[0x263F28348];
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    id v14 = "-[NAFConnection _handleCommand:reply:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_25D830000, v9, OS_LOG_TYPE_DEFAULT, "%s command = %@", (uint8_t *)&v13, 0x16u);
  }
  if (AFInterstitialIsCommandInterstitial())
  {
    if (self->_activeRequestType && !self->_activeRequestUsefulUserResultType)
    {
      [(NAFConnection *)self _enqueueInterstitialCommand:v6];
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
        -[NAFConnection _handleCommand:reply:]();
      }
      id v10 = (Class *)0x263F64830;
    }
    else
    {
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
        -[NAFConnection _handleCommand:reply:]();
      }
      id v10 = (Class *)0x263F64828;
    }
    id v11 = objc_alloc_init(*v10);
    BOOL v12 = [v6 aceId];
    [v11 setRefId:v12];

    if (v7) {
      v7[2](v7, v11, 0);
    }
  }
  else
  {
    [(NAFConnection *)self _dispatchCommand:v6 isInterstitial:0 interstitialPhase:0 interstitialDelay:v7 reply:0.0];
  }
}

- (void)_dispatchCommand:(id)a3 isInterstitial:(BOOL)a4 interstitialPhase:(int64_t)a5 interstitialDelay:(double)a6 reply:(id)a7
{
  BOOL v10 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v16 = objc_opt_respondsToSelector();
  uint64_t v17 = *MEMORY[0x263F28348];
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v41 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]";
      __int16 v42 = 2112;
      id v43 = v13;
      __int16 v44 = 1024;
      BOOL v45 = v10;
      _os_log_impl(&dword_25D830000, v17, OS_LOG_TYPE_DEFAULT, "%s command = %@, isInterstitial = %d", buf, 0x1Cu);
    }
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke;
    v31[3] = &unk_26550E250;
    id v18 = v13;
    id v32 = v18;
    BOOL v33 = self;
    BOOL v39 = v10;
    int64_t v36 = a5;
    SEL v37 = a2;
    double v38 = a6;
    id v34 = WeakRetained;
    id v19 = v14;
    id v35 = v19;
    v20 = (void (**)(void))MEMORY[0x2611B6890](v31);
    if (AFSpeechEventIsVoiceTrigger())
    {
      targetQueue = self->_targetQueue;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_109;
      v25[3] = &unk_26550E278;
      BOOL v30 = v10;
      v25[4] = self;
      id v26 = v18;
      id v27 = v19;
      __int16 v28 = v20;
      SEL v29 = a2;
      dispatch_async(targetQueue, v25);
    }
    else
    {
      v20[2](v20);
      if (!v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          __int16 v24 = NSStringFromSelector(a2);
          [(NAFConnection *)self _cancelRequestTimeoutForReason:v24];
        }
      }
    }

    id v23 = v32;
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    -[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]((uint64_t)WeakRetained, v17, v13);
  }
  int v22 = [MEMORY[0x263F28508] errorWithCode:26];
  (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v22);

  if (!v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v23 = NSStringFromSelector(a2);
      [(NAFConnection *)self _cancelRequestTimeoutForReason:v23];
LABEL_15:
    }
  }
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke(uint64_t a1)
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  v2 = AFAnalyticsContextCreateWithCommand();
  [*(id *)(*(void *)(a1 + 40) + 328) logEventWithType:1421 context:v2 contextNoCopy:1];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 56);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) encodedClassName];
    id v5 = [*(id *)(a1 + 32) aceId];
    id v6 = v3;
    id v7 = v4;
    char v8 = [v6 UUIDString];
    id v9 = _ConvertIdToSchemaUUID(v8);

    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F6E888]);
      id v11 = objc_alloc_init(MEMORY[0x263F6E890]);
      [v11 setRequestId:v9];
      [v10 setEventMetadata:v11];
      v100 = v2;
      id v12 = objc_alloc_init(MEMORY[0x263F6E850]);
      id v13 = objc_alloc_init(MEMORY[0x263F6E860]);
      [v13 setAceCommandType:2];
      [v13 setAceCommandName:v7];
      [v12 setStartedOrChanged:v13];
      id v14 = _ConvertIdToSchemaUUID(v5);
      [v12 setAceId:v14];

      [v10 setAceCommandContext:v12];
      __int16 v15 = [MEMORY[0x263F6C818] sharedStream];
      [v15 emitMessage:v10];

      v2 = v100;
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
    {
      __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_cold_2();
    }
  }
  char v16 = (id *)MEMORY[0x263F28378];
  os_signpost_id_t v17 = os_signpost_id_generate((os_log_t)*MEMORY[0x263F28378]);
  id v18 = *v16;
  id v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 136315394;
    v110 = "SiriX";
    __int16 v111 = 2080;
    v112 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_25D830000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "UICommandHandle", "%s %s", buf, 0x16u);
  }

  if (!*(unsigned char *)(a1 + 88))
  {
    uint64_t v45 = *(void *)(a1 + 40);
    uint64_t v46 = *(void **)(v45 + 200);
    if (!v46) {
      goto LABEL_63;
    }
    v47 = *(void **)(a1 + 32);
    id v48 = *(id *)(v45 + 328);
    id v49 = v47;
    id v50 = v46;
    id v51 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v49, "af_dialogPhase");
      v52 = (char *)objc_claimAutoreleasedReturnValue();
      v53 = *MEMORY[0x263F28348];
      v101 = v2;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v110 = "_LogUUFRReadyConditionally";
        __int16 v111 = 2112;
        v112 = v52;
        _os_log_impl(&dword_25D830000, v53, OS_LOG_TYPE_INFO, "%s Logging uufr for phase= %@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_62;
        }
      }
      v101 = v2;
      v52 = 0;
    }
    id v54 = objc_alloc_init(MEMORY[0x263F6EE70]);
    v96 = v52;
    objc_msgSend(v54, "setDialogPhase:", objc_msgSend(v52, "UEIUUFRReadyDialogPhase"));
    id v97 = v51;
    id v55 = v51;
    id v99 = v49;
    id v56 = v49;
    id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_opt_class();
    id v98 = v50;
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      os_signpost_id_t v95 = v17;
      id v58 = v48;
      v59 = NSString;
      v60 = [v56 groupIdentifier];
      v61 = [v56 encodedClassName];
      v62 = [v59 stringWithFormat:@"%@.%@", v60, v61];

      v63 = [v55 objectForKey:v62];
      v64 = v63;
      if (v63)
      {
        uint64_t v65 = [v63 objectForKey:@"dialogIdentifiers"];

        id v57 = (id)v65;
      }

      id v48 = v58;
      os_signpost_id_t v17 = v95;
    }

    [v54 setDialogIdentifiers:v57];
    id v66 = v55;
    id v67 = v56;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v69 = [v66 objectForKey:@"com.apple.ace.assistant.AddViews"];
      v70 = [v69 objectForKey:@"views"];
      v71 = v70;
      if (v70 && [v70 count])
      {
        v72 = [v71 objectAtIndex:0];
        v73 = _ExtractAceViewId(v72);
      }
      else
      {
        v73 = 0;
      }
    }
    else
    {
      v73 = 0;
    }

    [v54 setAceViewId:v73];
    [v54 setUufrReadySource:1];
    v86 = (objc_class *)objc_opt_class();
    v87 = NSStringFromClass(v86);
    [v54 setAceCommandClass:v87];

    v88 = [v67 aceId];
    v89 = _ConvertIdToSchemaUUID(v88);
    [v54 setAceCommandId:v89];

    id v50 = v98;
    [v48 logInstrumentation:v54 machAbsoluteTime:mach_absolute_time() turnIdentifier:v98];

    id v49 = v99;
    v2 = v101;
    id v51 = v97;
LABEL_62:

    if (!*(unsigned char *)(a1 + 88)) {
      goto LABEL_63;
    }
  }
  v20 = (os_log_t *)MEMORY[0x263F28348];
  v21 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v22 = v21;
    AFInterstitialPhaseGetName();
    id v23 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
    __int16 v111 = 2112;
    v112 = v23;
    _os_log_impl(&dword_25D830000, v22, OS_LOG_TYPE_INFO, "%s interstitialPhase = %@", buf, 0x16u);
  }
  __int16 v24 = *(void **)(a1 + 40);
  v25 = NSStringFromSelector(*(SEL *)(a1 + 72));
  [v24 _pauseRequestTimeoutForReason:v25];

  if (WL_AFIsInternalInstall() && *(void *)(a1 + 64) == 1)
  {
    mach_absolute_time();
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v27 = v26;
    __int16 v28 = [MEMORY[0x263F08AB0] processInfo];
    [v28 systemUptime];
    double v30 = v29;

    *(double *)(*(void *)(a1 + 40) + 192) = v27;
    id v31 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
    {
      id v32 = *(const char **)(a1 + 80);
      *(_DWORD *)buf = 136315394;
      v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      __int16 v111 = 2048;
      v112 = v32;
      _os_log_impl(&dword_25D830000, v31, OS_LOG_TYPE_INFO, "%s interstitialDelay = %f (expected)", buf, 0x16u);
    }
    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v34 = *(void *)(v33 + 64);
    double v35 = 0.0;
    if (v34 == 2)
    {
      double v74 = *(double *)(v33 + 120);
      if (v74 > 0.0)
      {
        double v75 = v30 - v74;
        v76 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          __int16 v111 = 2048;
          v112 = *(const char **)&v75;
          _os_log_impl(&dword_25D830000, v76, OS_LOG_TYPE_INFO, "%s durationFromRequestBegin = %f", buf, 0x16u);
        }
        double v35 = fmax(v75, 0.0);
      }
    }
    else if (v34 == 1)
    {
      double v36 = *(double *)(v33 + 176);
      if (v36 > 0.0)
      {
        double v37 = v27 - v36;
        double v38 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          __int16 v111 = 2048;
          v112 = *(const char **)&v37;
          _os_log_impl(&dword_25D830000, v38, OS_LOG_TYPE_INFO, "%s durationFromSpeechRecordingEnd = %f", buf, 0x16u);
        }
        double v35 = fmax(v37, 0.0);
        uint64_t v33 = *(void *)(a1 + 40);
      }
      double v39 = *(double *)(v33 + 184);
      if (v39 > 0.0)
      {
        double v40 = v27 - v39;
        uint64_t v41 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          __int16 v111 = 2048;
          v112 = *(const char **)&v40;
          _os_log_impl(&dword_25D830000, v41, OS_LOG_TYPE_INFO, "%s durationFromSpeechRecognition = %f", buf, 0x16u);
        }
        double v35 = fmax(v35, v40);
        uint64_t v33 = *(void *)(a1 + 40);
      }
      if (*(void *)(v33 + 128))
      {
        AFMachAbsoluteTimeGetTimeInterval();
        double v43 = v42;
        __int16 v44 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          __int16 v111 = 2048;
          v112 = *(const char **)&v43;
          _os_log_impl(&dword_25D830000, v44, OS_LOG_TYPE_INFO, "%s durationFromSpeechEnd = %f", buf, 0x16u);
        }
        double v35 = fmax(v35, v43);
      }
    }
    v77 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      __int16 v111 = 2048;
      v112 = *(const char **)&v35;
      _os_log_impl(&dword_25D830000, v77, OS_LOG_TYPE_INFO, "%s interstitialDelay = %f (actual)", buf, 0x16u);
    }
    if (v35 < *(double *)(a1 + 80) + -0.2)
    {
      v78 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR)) {
        __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_cold_1(v78, v79, v80, v81, v82, v83, v84, v85);
      }
      [*(id *)(a1 + 40) reportIssueForType:@"Interstitial" subtype:@"Early Fire" context:0];
    }
  }
LABEL_63:
  uint64_t v91 = *(void *)(a1 + 40);
  v90 = *(void **)(a1 + 48);
  uint64_t v92 = *(void *)(a1 + 32);
  v102[0] = MEMORY[0x263EF8330];
  v102[1] = 3221225472;
  v102[2] = __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_106;
  v102[3] = &unk_26550E228;
  char v108 = *(unsigned char *)(a1 + 88);
  uint64_t v93 = *(void *)(a1 + 72);
  v102[4] = v91;
  uint64_t v106 = v93;
  id v105 = *(id *)(a1 + 56);
  id v103 = v2;
  id v104 = *(id *)(a1 + 32);
  os_signpost_id_t v107 = v17;
  id v94 = v2;
  [v90 assistantConnection:v91 receivedCommand:v92 completion:v102];
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_106(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2;
  block[3] = &unk_26550E200;
  char v17 = *(unsigned char *)(a1 + 80);
  block[4] = v4;
  long long v10 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v10;
  long long v15 = v10;
  id v12 = v3;
  id v13 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 72);
  id v14 = v7;
  uint64_t v16 = v8;
  id v9 = v3;
  dispatch_async(v5, block);
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2(uint64_t a1)
{
  v26[2] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 88))
  {
    v2 = *(void **)(a1 + 32);
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    [v2 _resumeRequestTimeoutForReason:v3];
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 40), 0);
  }
  v26[0] = *(void *)(a1 + 48);
  id v5 = AFAnalyticsContextCreateWithCommand();
  v26[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  id v7 = AFAnalyticsContextsMerge();

  [*(id *)(*(void *)(a1 + 32) + 328) logEventWithType:1422 context:v7 contextNoCopy:1];
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v8)
  {
    id v9 = [*(id *)(a1 + 56) aceId];
    id v10 = v8;
    id v11 = [v10 UUIDString];
    id v12 = _ConvertIdToSchemaUUID(v11);

    if (v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x263F6E888]);
      id v14 = objc_alloc_init(MEMORY[0x263F6E890]);
      [v14 setRequestId:v12];
      [v13 setEventMetadata:v14];
      id v15 = objc_alloc_init(MEMORY[0x263F6E850]);
      id v16 = objc_alloc_init(MEMORY[0x263F6E858]);
      [v16 setExists:1];
      [v16 setAceCommandType:2];
      [v15 setEnded:v16];
      char v17 = _ConvertIdToSchemaUUID(v9);
      [v15 setAceId:v17];

      [v13 setAceCommandContext:v15];
      id v18 = [MEMORY[0x263F6C818] sharedStream];
      [v18 emitMessage:v13];
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
    {
      __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2_cold_1();
    }
  }
  id v19 = (id)*MEMORY[0x263F28378];
  v20 = v19;
  os_signpost_id_t v21 = *(void *)(a1 + 80);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    int v22 = 136315394;
    id v23 = "SiriX";
    __int16 v24 = 2080;
    v25 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_25D830000, v20, OS_SIGNPOST_INTERVAL_END, v21, "UICommandHandle", "%s %s", (uint8_t *)&v22, 0x16u);
  }
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_109(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 72) && *(void *)(*(void *)(a1 + 32) + 72))
  {
    v2 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v9 = 136315394;
      id v10 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v3;
      _os_log_impl(&dword_25D830000, v2, OS_LOG_TYPE_INFO, "%s Drop command %@ because UUFR has been presented.", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v5 = [MEMORY[0x263F28508] errorWithCode:38];
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
LABEL_12:
    }
  }
  else
  {
    id v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 136315394;
      id v10 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_25D830000, v6, OS_LOG_TYPE_INFO, "%s Dispatching command %@", (uint8_t *)&v9, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (!*(unsigned char *)(a1 + 72))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v8 = *(void **)(a1 + 32);
        id v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
        [v8 _cancelRequestTimeoutForReason:v5];
        goto LABEL_12;
      }
    }
  }
}

- (void)_setShouldSpeak:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    -[NAFConnection _setShouldSpeak:](v3, v5);
  }
  if ([(NAFConnection *)self shouldSpeak] != v3)
  {
    if (v3) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 216) = *((unsigned char *)self + 216) & 0xFD | v6;
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__NAFConnection__setShouldSpeak___block_invoke;
    block[3] = &unk_26550E2A0;
    block[4] = self;
    dispatch_async(targetQueue, block);
  }
}

uint64_t __33__NAFConnection__setShouldSpeak___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellDelegateShouldSpeakChanged:(*(unsigned __int8 *)(*(void *)(a1 + 32) + 216) >> 1) & 1];
}

- (void)_aceConnectionWillRetryOnError:(id)a3
{
}

- (BOOL)_startInputAudioPowerUpdatesWithXPCWrapper:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NAFConnection *)self _stopInputAudioPowerUpdates];
  if (v4
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate),
        char v6 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v6 & 1) != 0))
  {
    getAFAudioPowerXPCProviderClass();
    uint64_t v7 = (void *)[objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue()) initWithXPCWrapper:v4];
    getAFAudioPowerUpdaterClass();
    uint64_t v8 = (AFAudioPowerUpdater *)[objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue()) initWithProvider:v7 queue:self->_targetQueue frequency:1 delegate:self];
    inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = v8;

    id v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[NAFConnection _startInputAudioPowerUpdatesWithXPCWrapper:]";
      _os_log_impl(&dword_25D830000, v10, OS_LOG_TYPE_INFO, "%s Prepared for input audio power updates. Waiting for _speechCallbackGroup...", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__NAFConnection__startInputAudioPowerUpdatesWithXPCWrapper___block_invoke;
    v13[3] = &unk_26550E2C8;
    objc_copyWeak(&v14, (id *)buf);
    [(NAFConnection *)self _dispatchCallbackGroupBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __60__NAFConnection__startInputAudioPowerUpdatesWithXPCWrapper___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = (void *)*((void *)WeakRetained + 30);
    if (v3)
    {
      [v3 beginUpdate];
      id v4 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        int v5 = 136315138;
        char v6 = "-[NAFConnection _startInputAudioPowerUpdatesWithXPCWrapper:]_block_invoke";
        _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s Started input audio power updates.", (uint8_t *)&v5, 0xCu);
      }
    }
  }
}

- (void)_stopInputAudioPowerUpdates
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  if (inputAudioPowerUpdater)
  {
    [(AFAudioPowerUpdater *)inputAudioPowerUpdater endUpdate];
    [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater invalidate];
    id v4 = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = 0;

    int v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[NAFConnection _stopInputAudioPowerUpdates]";
      _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s Stopped input audio power updates.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    -[NAFConnection _setAudioSessionID:]();
  }
  if (self->_audioSessionID != a3)
  {
    self->_audioSessionID = a3;
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__NAFConnection__setAudioSessionID___block_invoke;
    block[3] = &unk_26550E2A0;
    block[4] = self;
    dispatch_async(targetQueue, block);
  }
}

uint64_t __36__NAFConnection__setAudioSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellDelegateAudioSessionIDChanged:*(unsigned int *)(*(void *)(a1 + 32) + 220)];
}

- (void)_setRecordRoute:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[NAFConnection _setRecordRoute:]";
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s recordRoute = %@", (uint8_t *)&v9, 0x16u);
  }
  recordRoute = self->_recordRoute;
  if (recordRoute != v4 && ![(NSString *)recordRoute isEqualToString:v4])
  {
    uint64_t v7 = (NSString *)[(NSString *)v4 copy];
    uint64_t v8 = self->_recordRoute;
    self->_recordRoute = v7;
  }
}

- (void)_markIsDucking
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_25D830000, v0, v1, "%s Unable to mark isDucking because the active request is not a speech request. (_activeRequestType = %zd, _activeRequestUUID = %@)", v2);
}

- (void)_markIsTwoShot
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_25D830000, v0, v1, "%s Unable to mark isTwoShot because the active request is not a speech request. (_activeRequestType = %zd, _activeRequestUUID = %@)", v2);
}

- (void)_markSpeechRecognized
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_25D830000, v0, v1, "%s Unable to mark speech recognized because the active request is not a speech request. (_activeRequestType = %ld, _activeRequestUUID = %@)", v2);
}

- (void)_markNetworkDidBecomeActive
{
  self->_connectionHadActiveNetwork = 1;
  if ((WL_AFIsVision() & 1) == 0)
  {
    if (!WL_AFDeviceSupportsSiriUOD()
      || (getAFFeatureFlagsClass(),
          id v3 = (id)objc_claimAutoreleasedReturnValue(),
          +[NAFConnection currentLanguageCode],
          id v4 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v3) = [v3 isSiriUODAvailableForLanguage:v4],
          v4,
          (v3 & 1) == 0))
    {
      [(NAFConnection *)self _extendExpiringRequestTimeout];
    }
  }
}

- (void)_updateSpeechEndHostTime:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = (os_log_t *)MEMORY[0x263F28348];
  if (self->_activeRequestType == 1)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
      -[NAFConnection _updateSpeechEndHostTime:]();
    }
    if (self->_activeRequestSpeechEndHostTime != a3)
    {
      self->_activeRequestSpeechEndHostTime = a3;
      getAFFeatureFlagsClass();
      if ([(id)objc_claimAutoreleasedReturnValue() isStateFeedbackEnabled])
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __42__NAFConnection__updateSpeechEndHostTime___block_invoke;
        v18[3] = &unk_26550E2F0;
        v18[4] = self;
        v18[5] = a3;
        [(NAFConnection *)self _dispatchCallbackGroupBlock:v18];
      }
      else
      {
        unint64_t activeRequestNumberOfPresentedInterstitials = self->_activeRequestNumberOfPresentedInterstitials;
        if (activeRequestNumberOfPresentedInterstitials == 1)
        {
          id v10 = *v4;
          if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
            -[NAFConnection _updateSpeechEndHostTime:](v10, v11, v12, v13, v14, v15, v16, v17);
          }
        }
        else if (activeRequestNumberOfPresentedInterstitials)
        {
          if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
            -[NAFConnection _updateSpeechEndHostTime:]();
          }
        }
        else
        {
          uint64_t v8 = *v4;
          if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "-[NAFConnection _updateSpeechEndHostTime:]";
            __int16 v21 = 2048;
            unint64_t v22 = a3;
            _os_log_impl(&dword_25D830000, v8, OS_LOG_TYPE_INFO, "%s No interstitial has been presented yet, adjusting timings based on updated speech end host time %llu.", buf, 0x16u);
          }
          int v9 = NSStringFromSelector(a2);
          [(NAFConnection *)self _endInterstitialsForReason:v9];
          [(NAFConnection *)self _beginInterstitialsForReason:v9];
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    -[NAFConnection _updateSpeechEndHostTime:].cold.4();
  }
}

void __42__NAFConnection__updateSpeechEndHostTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnectionUpdatedSpeechEndEstimate:*(void *)(a1 + 32) speechEndEstimate:*(void *)(a1 + 40)];
  }
}

- (id)_siriClientStateManager
{
  siriClientStateManager = self->_siriClientStateManager;
  if (!siriClientStateManager)
  {
    id v4 = [MEMORY[0x263F28608] sharedManager];
    int v5 = self->_siriClientStateManager;
    self->_siriClientStateManager = v4;

    siriClientStateManager = self->_siriClientStateManager;
  }
  return siriClientStateManager;
}

- (int64_t)_getActiveSpeechEvent
{
  return self->_activeRequestSpeechEvent;
}

- (void)_tellDelegateRequestWillStart
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 assistantConnectionRequestWillStart:self];
  }
}

- (void)_completeRequestWithUUID:(id)a3 forReason:(int64_t)a4 error:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v8 = (NSUUID *)a3;
  id v9 = a5;
  id v10 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    activeTurnIdentifier = self->_activeTurnIdentifier;
    int v29 = 136316162;
    double v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    int64_t v34 = (int64_t)activeTurnIdentifier;
    __int16 v35 = 2048;
    int64_t v36 = a4;
    __int16 v37 = 2112;
    id v38 = v9;
    _os_log_impl(&dword_25D830000, v11, OS_LOG_TYPE_INFO, "%s requestUUID = %@, turnId = %@, reason %ld, error = %@", (uint8_t *)&v29, 0x34u);
  }
  int64_t activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    int v14 = [(NSUUID *)self->_activeRequestUUID isEqual:v8];
    if (self->_activeRequestType) {
      goto LABEL_5;
    }
LABEL_10:
    id v19 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      int v29 = 136315138;
      double v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
      _os_log_impl(&dword_25D830000, v19, OS_LOG_TYPE_INFO, "%s Dropping delegate callback because request is complete", (uint8_t *)&v29, 0xCu);
    }
    p_activeRequestUUID = (id *)&self->_activeRequestUUID;
    if ([(NSUUID *)self->_activeRequestUUID isEqual:v8]) {
      goto LABEL_18;
    }
LABEL_13:
    v20 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      unint64_t v22 = self->_activeTurnIdentifier;
      int v29 = 136315906;
      double v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
      __int16 v31 = 2112;
      id v32 = activeRequestUUID;
      __int16 v33 = 2112;
      int64_t v34 = (int64_t)v8;
      __int16 v35 = 2112;
      int64_t v36 = (int64_t)v22;
      _os_log_impl(&dword_25D830000, v20, OS_LOG_TYPE_INFO, "%s Dropping delegate callback because request is different (_activeRequestUUID = %@, requestUUID = %@, turnId = %@)", (uint8_t *)&v29, 0x2Au);
    }
    goto LABEL_18;
  }
  int v14 = 0;
  if (!activeRequestType) {
    goto LABEL_10;
  }
LABEL_5:
  p_activeRequestUUID = (id *)&self->_activeRequestUUID;
  if (([(NSUUID *)self->_activeRequestUUID isEqual:v8] & 1) == 0) {
    goto LABEL_13;
  }
  if (v9)
  {
    [(NAFConnection *)self _willFailRequestWithError:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 assistantConnection:self requestFailedWithError:v9 requestClass:self->_outstandingRequestClass];
LABEL_17:
    }
  }
  else
  {
    [(NAFConnection *)self _willCompleteRequest];
    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 assistantConnectionRequestFinished:self];
      goto LABEL_17;
    }
  }
LABEL_18:
  if (*p_activeRequestUUID && ![*p_activeRequestUUID isEqual:v8])
  {
    double v26 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      double v27 = self->_activeRequestUUID;
      __int16 v28 = self->_activeTurnIdentifier;
      int v29 = 136315906;
      double v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
      __int16 v31 = 2112;
      id v32 = v27;
      __int16 v33 = 2112;
      int64_t v34 = (int64_t)v8;
      __int16 v35 = 2112;
      int64_t v36 = (int64_t)v28;
      _os_log_impl(&dword_25D830000, v26, OS_LOG_TYPE_INFO, "%s Not ending the ongoing request because the active request ID is different than the completed request ID: (_activeRequestUUID = %@, requestUUID = %@, turnId = %@)", (uint8_t *)&v29, 0x2Au);
    }
  }
  else
  {
    [(NAFConnection *)self _requestDidEnd];
  }
  if (v14)
  {
    v25 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      int v29 = 136315650;
      double v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2048;
      int64_t v34 = a4;
      _os_log_impl(&dword_25D830000, v25, OS_LOG_TYPE_INFO, "%s Resetting isCapturingSpeech for %@ for reason: %ld", (uint8_t *)&v29, 0x20u);
    }
    [(NAFConnection *)self _checkAndSetIsCapturingSpeech:0];
  }
}

- (void)_tellDelegateShouldSpeakChanged:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self shouldSpeak:v3];
  }
}

- (void)_tellDelegateAudioSessionIDChanged:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self didChangeAudioSessionID:v3];
  }
}

- (void)_tellDelegateWillStartAcousticIDRequest
{
  [(AFAnalytics *)self->_analytics logEventWithType:1916 context:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 assistantConnectionWillStartAcousticIDRequest:self];
  }
}

- (void)_tellDelegateDidDetectMusic
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 assistantConnectionDidDetectMusic:self];
  }
}

- (void)_tellDelegateDidFinishAcousticIDRequestWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x263EF8340];
  analytics = self->_analytics;
  id v10 = @"success";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:");
  v11[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(AFAnalytics *)analytics logEventWithType:1917 context:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self didFinishAcousticIDRequestWithSuccess:v3];
  }
}

- (void)_tellDelegateSetUserActivityInfo:(id)a3 webpageURL:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self setUserActivtiyInfoAndMakeCurrent:v10 webpageURL:v6];
  }
}

- (void)_tellDelegateInvalidateCurrentUserActivity
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 assistantConnectionInvalidateCurrentUserActivity:self];
  }
}

- (void)_tellDelegateCacheImage:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self wantsToCacheImage:v7];
  }
}

- (void)_tellDelegateExtensionRequestWillStartForApplication:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self extensionRequestWillStartForApplication:v7];
  }
}

- (void)_tellDelegateExtensionRequestFinishedForApplication:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self extensionRequestFinishedForApplication:v10 error:v6];
  }
}

- (void)_tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = v6;
  if (v5)
  {
    [v6 assistantConnectionAudioSessionDidBeginInterruption:self userInfo:v9];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_6;
    }
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 assistantConnectionAudioSessionDidBeginInterruption:self];
  }

LABEL_6:
}

- (void)_tellDelegateAudioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = v8;
  if (v7)
  {
    [v8 assistantConnectionAudioSessionDidEndInterruption:self shouldResume:v4 userInfo:v11];
  }
  else
  {
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_6;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnectionAudioSessionDidEndInterruption:self shouldResume:v4];
  }

LABEL_6:
}

- (void)_tellDelegateAudioPlaybackRequestWillStart:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self willStartAudioPlaybackRequest:v7];
  }
}

- (void)_tellDelegateAudioPlaybackRequestDidStart:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self didStartAudioPlaybackRequest:v7];
  }
}

- (void)_tellDelegateAudioPlaybackRequestDidStop:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self didStopAudioPlaybackRequest:v10 error:v6];
  }
}

- (void)_tellDelegateWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v15 = a4;
  char v8 = (void (**)(id, uint64_t, uint64_t))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v12 = v11;
  if (v10)
  {
    [v11 assistantConnection:self willProcessStartPlayback:a3 intent:v15 completion:v8];
  }
  else
  {
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 assistantConnection:self willProcessStartPlayback:a3];
    }
    if (v8) {
      v8[2](v8, 1, 1);
    }
  }
}

- (void)_tellDelegateStartPlaybackDidFail:(int64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self startPlaybackDidFail:a3];
  }
}

- (void)_tellDelegateAudioSessionWillBecomeActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self audioSessionWillBecomeActive:v3];
  }
}

- (void)_tellDelegateAudioSessionDidBecomeActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self audioSessionDidBecomeActive:v3];
  }
}

- (void)_tellDelegateWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self willProcessAppLaunchWithBundleIdentifier:v7];
  }
}

- (void)_tellDelegateFailedToLaunchAppWithBundleIdentifier:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self appLaunchFailedWithBundleIdentifier:v7];
  }
}

- (void)_dispatchCallbackGroupBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_speechCallbackGroup)
    {
      objc_copyWeak(&to, (id *)&self->_speechDelegate);
      speechCallbackGroup = self->_speechCallbackGroup;
      targetQueue = self->_targetQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__NAFConnection__dispatchCallbackGroupBlock___block_invoke;
      block[3] = &unk_26550E318;
      id v9 = v4;
      objc_copyWeak(&v10, &to);
      dispatch_group_notify(speechCallbackGroup, targetQueue, block);
      objc_destroyWeak(&v10);

      objc_destroyWeak(&to);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
      (*((void (**)(id, id))v4 + 2))(v4, WeakRetained);
    }
  }
}

void __45__NAFConnection__dispatchCallbackGroupBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

- (void)_tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__NAFConnection__tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke;
  v6[3] = &unk_26550E340;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __84__NAFConnection__tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingWillBeginWithInputAudioPowerXPCWrapper:*(void *)(a1 + 40)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 assistantConnectionSpeechRecordingWillBegin:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__NAFConnection__tellSpeechDelegateRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke;
  v8[3] = &unk_26550E368;
  v8[4] = self;
  id v9 = v6;
  unsigned int v10 = a4;
  id v7 = v6;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v8];
}

void __84__NAFConnection__tellSpeechDelegateRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingDidBeginOnAVRecordRoute:*(void *)(a1 + 40) audioSessionID:*(unsigned int *)(a1 + 48)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingDidBeginOnAVRecordRoute:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecordingDidChangeAVRecordRoute:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__NAFConnection__tellSpeechDelegateRecordingDidChangeAVRecordRoute___block_invoke;
  v6[3] = &unk_26550E340;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __68__NAFConnection__tellSpeechDelegateRecordingDidChangeAVRecordRoute___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingDidChangeAVRecordRoute:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecordingDidDetectStartpoint
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __64__NAFConnection__tellSpeechDelegateRecordingDidDetectStartpoint__block_invoke;
  v2[3] = &unk_26550E390;
  v2[4] = self;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v2];
}

void __64__NAFConnection__tellSpeechDelegateRecordingDidDetectStartpoint__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnectionSpeechRecordingDidDetectStartpoint:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateToPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__NAFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke;
  v8[3] = &unk_26550E3E0;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v8];
}

void __73__NAFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 64);
  if (v5 == 1 && !*(void *)(v4 + 72))
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = *(void *)(a1 + 48);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __73__NAFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke_2;
      v13[3] = &unk_26550E3B8;
      uint64_t v11 = *(void *)(a1 + 32);
      id v14 = *(id *)(a1 + 40);
      [v3 assistantConnection:v11 speechRecordingPerformTwoShotPromptWithType:v10 completion:v13];

      goto LABEL_6;
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      goto LABEL_6;
    }
    id v7 = (void *)MEMORY[0x263F28508];
    [NSString stringWithFormat:@"Speech delegate %@ is incapable of performing two-shot prompt.", v3, v12];
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F28508];
    [NSString stringWithFormat:@"Active request type is %ld and active request UUFR type is %ld, two-shot prompt is ignored.", v5, *(void *)(v4 + 72)];
    id v8 = LABEL_5:;
    id v9 = [v7 errorWithCode:15 description:v8 underlyingError:0];
    (*(void (**)(uint64_t, void *, double, double))(v6 + 16))(v6, v9, 0.0, 0.0);
  }
LABEL_6:
}

uint64_t __73__NAFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_tellSpeechDelegateRecordingDidEnd
{
  if (self->_activeRequestType == 1)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_activeRequestSpeechRecordingEndTimeInterval = v3;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__NAFConnection__tellSpeechDelegateRecordingDidEnd__block_invoke;
  v4[3] = &unk_26550E390;
  v4[4] = self;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v4];
}

void __51__NAFConnection__tellSpeechDelegateRecordingDidEnd__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnectionSpeechRecordingDidEnd:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateRecordingDidCancel
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__NAFConnection__tellSpeechDelegateRecordingDidCancel__block_invoke;
  v2[3] = &unk_26550E390;
  v2[4] = self;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v2];
}

void __54__NAFConnection__tellSpeechDelegateRecordingDidCancel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnectionSpeechRecordingDidCancel:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateRecordingDidFail:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__NAFConnection__tellSpeechDelegateRecordingDidFail___block_invoke;
  v6[3] = &unk_26550E340;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __53__NAFConnection__tellSpeechDelegateRecordingDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingDidFail:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateSpeechRecognized:(id)a3
{
  id v4 = a3;
  if (self->_activeRequestType == 1)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_activeRequestSpeechRecognitionTimeInterval = v5;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__NAFConnection__tellSpeechDelegateSpeechRecognized___block_invoke;
  v7[3] = &unk_26550E340;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v7];
}

void __53__NAFConnection__tellSpeechDelegateSpeechRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecognized:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__NAFConnection__tellSpeechDelegateRecognizedAdditionalSpeechInterpretation_refId___block_invoke;
  v10[3] = &unk_26550E408;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v10];
}

void __83__NAFConnection__tellSpeechDelegateRecognizedAdditionalSpeechInterpretation_refId___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:a1[4] recognizedAdditionalSpeechInterpretation:a1[5] refId:a1[6]];
  }
}

- (void)_tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__NAFConnection__tellSpeechDelegateRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke;
  v14[3] = &unk_26550E430;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v14];
}

void __90__NAFConnection__tellSpeechDelegateRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:a1[4] recognitionUpdateWithPhrases:a1[5] utterances:a1[6] refId:a1[7]];
  }
}

- (void)_tellSpeechDelegateRecognitionUpdateWillBeginForTask:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__NAFConnection__tellSpeechDelegateRecognitionUpdateWillBeginForTask___block_invoke;
  v6[3] = &unk_26550E340;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __70__NAFConnection__tellSpeechDelegateRecognitionUpdateWillBeginForTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) recognitionUpdateWillBeginForTask:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateSpeechRecognizedPartialResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__NAFConnection__tellSpeechDelegateSpeechRecognizedPartialResult___block_invoke;
  v6[3] = &unk_26550E340;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __66__NAFConnection__tellSpeechDelegateSpeechRecognizedPartialResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecognizedPartialResult:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecognitionDidFail:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__NAFConnection__tellSpeechDelegateRecognitionDidFail___block_invoke;
  v6[3] = &unk_26550E340;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NAFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __55__NAFConnection__tellSpeechDelegateRecognitionDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecognitionDidFail:*(void *)(a1 + 40)];
  }
}

- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5
{
  if (self->_inputAudioPowerUpdater == a3)
  {
    p_speechDelegate = &self->_speechDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_speechDelegate);
      [v9 assistantConnectionDidChangeAudioRecordingPower:self];
    }
  }
}

- (void)accessibilityObserver:(id)a3 stateDidChangeFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  targetQueue = self->_targetQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__NAFConnection_accessibilityObserver_stateDidChangeFrom_to___block_invoke;
  v9[3] = &unk_26550E158;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(targetQueue, v9);
}

uint64_t __61__NAFConnection_accessibilityObserver_stateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccessibilityState:*(void *)(a1 + 40)];
}

- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4
{
  targetQueue = self->_targetQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__NAFConnection_deviceRingerObserver_didChangeState___block_invoke;
  v5[3] = &unk_26550E458;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(targetQueue, v5);
}

uint64_t __53__NAFConnection_deviceRingerObserver_didChangeState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeviceRingerSwitchState:*(void *)(a1 + 40)];
}

- (void)interstitialProvider:(id)a3 handlePhase:(int64_t)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  targetQueue = self->_targetQueue;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __109__NAFConnection_interstitialProvider_handlePhase_displayText_speakableText_expectedDelay_context_completion___block_invoke;
  v27[3] = &unk_26550E480;
  id v32 = v20;
  int64_t v33 = a4;
  v27[4] = self;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  double v34 = a7;
  id v31 = v19;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  dispatch_async(targetQueue, v27);
}

uint64_t __109__NAFConnection_interstitialProvider_handlePhase_displayText_speakableText_expectedDelay_context_completion___block_invoke(double *a1)
{
  getAFFeatureFlagsClass();
  if ([(id)objc_claimAutoreleasedReturnValue() isStateFeedbackEnabled])
  {
    uint64_t result = *((void *)a1 + 9);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  else
  {
    uint64_t v5 = *((void *)a1 + 9);
    uint64_t v4 = *((void *)a1 + 10);
    id v6 = (void *)*((void *)a1 + 4);
    uint64_t v7 = *((void *)a1 + 5);
    uint64_t v8 = *((void *)a1 + 6);
    uint64_t v9 = *((void *)a1 + 7);
    double v10 = a1[11];
    uint64_t v11 = *((void *)a1 + 8);
    return [v6 _handleInterstitialPhase:v4 fromProvider:v7 displayText:v8 speakableText:v9 expectedDelay:v11 context:v5 completion:v10];
  }
  return result;
}

- (void)_connectionFailedWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NAFConnection *)self _siriClientStateManager];
  [v5 beginTransaction];

  char v6 = *((unsigned char *)self + 216);
  *((unsigned char *)self + 216) = v6 & 0xFE;
  *((unsigned char *)self + 272) &= ~1u;
  if ((v6 & 4) != 0)
  {
    *((unsigned char *)self + 216) = v6 & 0xFA;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);

    if (WeakRetained)
    {
      uint64_t v8 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        -[NAFConnection _connectionFailedWithError:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
      [(NAFConnection *)self _tellSpeechDelegateRecordingDidFail:v4];
    }
    if (!_AFConnectionIsErrorDeallocation(v4))
    {
      id v16 = [(NAFConnection *)self _siriClientStateManager];
      [v16 endListeningForClient:self->_clientID];
    }
  }
  [(NAFConnection *)self _completeRequestWithUUID:self->_activeRequestUUID forReason:4 error:v4];
  [(NAFConnection *)self _stopInputAudioPowerUpdates];
  id v17 = [(NAFConnection *)self _siriClientStateManager];
  [v17 endTransaction];
}

- (void)_clearConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    id v4 = self->_connection;
    self->_connection = 0;
  }
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    instanceContext = self->_instanceContext;
    if (instanceContext)
    {
      uint64_t v5 = instanceContext;
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263F28528] defaultContext];
    }
    char v6 = v5;
    uint64_t v7 = [(AFInstanceContext *)v5 createXPCConnectionWithMachServiceName:*MEMORY[0x263F28780] options:0];
    uint64_t v8 = self->_connection;
    self->_connection = v7;

    objc_initWeak(&location, self);
    uint64_t v9 = self->_targetQueue;
    uint64_t v10 = self->_connection;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __28__NAFConnection__connection__block_invoke;
    v27[3] = &unk_26550E4D0;
    uint64_t v11 = v9;
    id v28 = v11;
    objc_copyWeak(&v29, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:v27];
    uint64_t v12 = self->_connection;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __28__NAFConnection__connection__block_invoke_217;
    v24[3] = &unk_26550E4D0;
    uint64_t v13 = v11;
    id v25 = v13;
    objc_copyWeak(&v26, &location);
    [(NSXPCConnection *)v12 setInterruptionHandler:v24];
    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.siri.SiriOrchestration.NAFConnection", v15);
    [(NSXPCConnection *)self->_connection _setQueue:v16];
    id v17 = self->_connection;
    id v18 = AFClientServiceXPCInterface();
    [(NSXPCConnection *)v17 setRemoteObjectInterface:v18];

    id v19 = self->_connection;
    id v20 = AFClientServiceDelegateXPCInterface();
    [(NSXPCConnection *)v19 setExportedInterface:v20];

    __int16 v21 = self->_connection;
    id v22 = [[NAFConnectionClientServiceDelegate alloc] initWithConnection:self targetQueue:self->_targetQueue];
    [(NSXPCConnection *)v21 setExportedObject:v22];

    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    connection = self->_connection;
  }
  return connection;
}

void __28__NAFConnection__connection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__NAFConnection__connection__block_invoke_2;
  block[3] = &unk_26550E4A8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __28__NAFConnection__connection__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[NAFConnection _connection]_block_invoke_2";
    _os_log_impl(&dword_25D830000, v2, OS_LOG_TYPE_INFO, "%s Connection invalidated", (uint8_t *)&v7, 0xCu);
  }
  id v3 = [MEMORY[0x263F28508] errorWithCode:23];
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _connectionFailedWithError:v3];

  id v6 = objc_loadWeakRetained(v4);
  [v6 _clearConnection];
}

void __28__NAFConnection__connection__block_invoke_217(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__NAFConnection__connection__block_invoke_2_218;
  block[3] = &unk_26550E4A8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __28__NAFConnection__connection__block_invoke_2_218(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[NAFConnection _connection]_block_invoke_2";
    _os_log_impl(&dword_25D830000, v2, OS_LOG_TYPE_INFO, "%s Connection interrupted", (uint8_t *)&v8, 0xCu);
  }
  id v3 = [MEMORY[0x263F28508] errorWithCode:7];
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _connectionFailedWithError:v3];

  id v6 = objc_loadWeakRetained(v4);
  [v6 _updateState];

  id v7 = objc_loadWeakRetained(v4);
  [v7 _updateClientConfiguration];
}

- (void)requestDidAskForTimeoutExtension:(double)a3
{
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEBUG)) {
    -[NAFConnection requestDidAskForTimeoutExtension:]();
  }
  id v6 = NSStringFromSelector(a2);
  [(NAFConnection *)self _extendRequestTimeoutForReason:v6 durationInSeconds:a3];
}

- (void)_scheduleRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4
{
  id v6 = a3;
  [(NAFConnection *)self _cancelRequestTimeoutForReason:v6];
  if (!self->_requestTimeoutTimer)
  {
    if (a4 == 0.0)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.assistant"];
      [v7 doubleForKey:@"defaultTimeout"];
      if (v8 == 0.0)
      {
        a4 = 12.0;
        if (WL_AFDeviceSupportsSAE())
        {
          uint64_t v9 = *MEMORY[0x263F28348];
          a4 = 20.0;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
            -[NAFConnection _scheduleRequestTimeoutForReason:durationInSeconds:](v9, v10, v11, v12, v13, v14, v15, v16);
          }
        }
      }
      else
      {
        a4 = v8;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
          -[NAFConnection _scheduleRequestTimeoutForReason:durationInSeconds:]();
        }
      }
    }
    [(NAFConnection *)self _startRequestTimeoutTimerWithTimeInterval:v6 reason:a4];
  }
}

- (void)_startRequestTimeoutTimerWithTimeInterval:(double)a3 reason:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[NAFConnection _startRequestTimeoutTimerWithTimeInterval:reason:]";
    __int16 v21 = 2048;
    double v22 = a3;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl(&dword_25D830000, v8, OS_LOG_TYPE_DEFAULT, "%s Scheduling request timeout for %f seconds for reason %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  id v9 = objc_alloc(MEMORY[0x263F286E8]);
  targetQueue = self->_targetQueue;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __66__NAFConnection__startRequestTimeoutTimerWithTimeInterval_reason___block_invoke;
  id v17 = &unk_26550E4F8;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a2;
  uint64_t v11 = [v9 initWithTimeoutInterval:targetQueue onQueue:&v14 timeoutHandler:a3];
  requestTimeoutTimer = self->_requestTimeoutTimer;
  p_requestTimeoutTimer = (id *)&self->_requestTimeoutTimer;
  id *p_requestTimeoutTimer = (id)v11;

  objc_msgSend(*p_requestTimeoutTimer, "start", v14, v15, v16, v17);
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

void __66__NAFConnection__startRequestTimeoutTimerWithTimeInterval_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = NSStringFromSelector(*(SEL *)(a1 + 40));
  [WeakRetained _invokeRequestTimeoutForReason:v2];
}

- (void)_invokeRequestTimeoutForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[NAFConnection _invokeRequestTimeoutForReason:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_DEFAULT, "%s Invoking request timeout for reason %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(NAFConnection *)self _cancelRequestTimeoutForReason:v4];
  if (self->_connectionHadActiveNetwork
    || (WL_AFIsVision() & 1) != 0
    || WL_AFDeviceSupportsSiriUOD()
    && (getAFFeatureFlagsClass(),
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        [(id)objc_opt_class() currentLanguageCode],
        id v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = [v6 isSiriUODAvailableForLanguage:v7],
        v7,
        v6))
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 52;
  }
  id v9 = [MEMORY[0x263F28508] errorWithCode:v8 description:0 underlyingError:self->_lastRetryError];
  uint64_t v10 = [(NAFConnection *)self _clientService];
  [v10 cancelRequestForReason:4 withError:v9];

  [(NAFConnection *)self _completeRequestWithUUID:self->_activeRequestUUID forReason:3 error:v9];
}

- (void)_pauseRequestTimeoutForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_requestTimeoutTimer)
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      id v7 = "-[NAFConnection _pauseRequestTimeoutForReason:]";
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_DEFAULT, "%s Pausing request timeout for reason %{public}@", (uint8_t *)&v6, 0x16u);
    }
    [(AFWatchdogTimer *)self->_requestTimeoutTimer stop];
  }
}

- (void)_resumeRequestTimeoutForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_requestTimeoutTimer)
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      id v7 = "-[NAFConnection _resumeRequestTimeoutForReason:]";
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_DEFAULT, "%s Resuming request timeout for reason %{public}@", (uint8_t *)&v6, 0x16u);
    }
    [(AFWatchdogTimer *)self->_requestTimeoutTimer start];
  }
}

- (void)_cancelRequestTimeoutForReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_requestTimeoutTimer)
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      __int16 v8 = "-[NAFConnection _cancelRequestTimeoutForReason:]";
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_DEFAULT, "%s Canceling request timeout for reason %{public}@", (uint8_t *)&v7, 0x16u);
    }
    [(AFWatchdogTimer *)self->_requestTimeoutTimer cancel];
    requestTimeoutTimer = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0;
  }
}

- (void)_extendRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    __int16 v9 = "-[NAFConnection _extendRequestTimeoutForReason:durationInSeconds:]";
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2050;
    double v13 = a4;
    _os_log_impl(&dword_25D830000, v7, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@, durationInSeconds: %{public}f", (uint8_t *)&v8, 0x20u);
  }
  [(NAFConnection *)self _cancelRequestTimeoutForReason:v6];
  if (self->_activeRequestType && !self->_activeRequestUsefulUserResultType) {
    [(NAFConnection *)self _scheduleRequestTimeoutForReason:v6 durationInSeconds:a4];
  }
}

- (void)_extendExistingRequestTimeoutForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[NAFConnection _extendExistingRequestTimeoutForReason:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  if (self->_requestTimeoutTimer) {
    [(NAFConnection *)self _extendRequestTimeoutForReason:v4 durationInSeconds:0.0];
  }
}

- (void)_extendExpiringRequestTimeout
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [(AFWatchdogTimer *)self->_requestTimeoutTimer timeRemaining];
  double v4 = v3;
  if (self->_requestTimeoutTimer) {
    BOOL v5 = v3 < 4.0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    int v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      __int16 v8 = "-[NAFConnection _extendExpiringRequestTimeout]";
      __int16 v9 = 2048;
      double v10 = v4;
      _os_log_impl(&dword_25D830000, v6, OS_LOG_TYPE_DEFAULT, "%s Extending timeout with time remaining %.2f", (uint8_t *)&v7, 0x16u);
    }
    [(NAFConnection *)self _extendRequestTimeoutForReason:@"ExtendOnlyIfExpiring" durationInSeconds:4.0];
  }
}

- (void)_updateStateIfNotInSync
{
  if ((*((unsigned char *)self + 216) & 1) == 0) {
    [(NAFConnection *)self _updateState];
  }
}

- (void)_fetchShouldSpeak:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NAFConnection *)self _clientService];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__NAFConnection__fetchShouldSpeak___block_invoke;
  v7[3] = &unk_26550E548;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 requestShouldSpeakStateWithReply:v7];
}

void __35__NAFConnection__fetchShouldSpeak___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__NAFConnection__fetchShouldSpeak___block_invoke_2;
  block[3] = &unk_26550E520;
  char v6 = a2;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

uint64_t __35__NAFConnection__fetchShouldSpeak___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    double v3 = NSNumber;
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    id v5 = v2;
    char v6 = [v3 numberWithBool:v4];
    int v8 = 136315394;
    __int16 v9 = "-[NAFConnection _fetchShouldSpeak:]_block_invoke_2";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s Updated internal state. ShouldSpeak %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) _setShouldSpeak:*(unsigned __int8 *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)_updateState
{
  double v3 = [(NAFConnection *)self _clientService];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__NAFConnection__updateState__block_invoke;
  v4[3] = &unk_26550E598;
  v4[4] = self;
  [v3 requestStateUpdateWithReply:v4];
}

void __29__NAFConnection__updateState__block_invoke(uint64_t a1, char a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__NAFConnection__updateState__block_invoke_2;
  v5[3] = &unk_26550E570;
  v5[4] = v3;
  char v7 = a2;
  int v6 = a3;
  dispatch_async(v4, v5);
}

uint64_t __29__NAFConnection__updateState__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 216) |= 1u;
  uint64_t v2 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v3 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = NSNumber;
    uint64_t v5 = *(unsigned __int8 *)(a1 + 44);
    int v6 = v3;
    char v7 = [v4 numberWithBool:v5];
    int v14 = 136315394;
    uint64_t v15 = "-[NAFConnection _updateState]_block_invoke_2";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_25D830000, v6, OS_LOG_TYPE_INFO, "%s Updated internal state. ShouldSpeak %@", (uint8_t *)&v14, 0x16u);
  }
  [*(id *)(a1 + 32) _setShouldSpeak:*(unsigned __int8 *)(a1 + 44)];
  os_log_t v8 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = NSNumber;
    uint64_t v10 = *(unsigned int *)(a1 + 40);
    uint64_t v11 = v8;
    uint64_t v12 = [v9 numberWithUnsignedInt:v10];
    int v14 = 136315394;
    uint64_t v15 = "-[NAFConnection _updateState]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v12;
    _os_log_impl(&dword_25D830000, v11, OS_LOG_TYPE_INFO, "%s Updated internal state. AudioSessionID %@", (uint8_t *)&v14, 0x16u);
  }
  return [*(id *)(a1 + 32) _setAudioSessionID:*(unsigned int *)(a1 + 40)];
}

- (void)_updateClientConfiguration
{
  if ((*((unsigned char *)self + 272) & 1) == 0)
  {
    uint64_t v3 = [(NAFConnection *)self _clientService];
    uint64_t v4 = [(NAFConnection *)self _clientConfiguration];
    [v3 setConfiguration:v4];

    *((unsigned char *)self + 272) |= 1u;
  }
}

- (BOOL)_shouldEmitUEIRequestLinkForRequestInfo:(id)a3 speechRequestOptions:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 activationEvent];
  uint64_t v7 = [v5 activationEvent];

  return v6 == 6 || (unint64_t)(v6 - 9) < 2 || v7 == 17;
}

- (void)_willStartRequestWithSpeech:(BOOL)a3 speechRequestOptions:(id)a4 requestInfo:(id)a5 analyticsEventProvider:(id)a6
{
  BOOL v78 = a3;
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v81 = a4;
  id v9 = a5;
  v77 = (uint64_t (**)(id, id))a6;
  v76 = self->_activeRequestUUID;
  uint64_t v80 = v9;
  uint64_t v10 = [v9 startRequest];
  if (v10)
  {
    uint64_t v11 = [v80 startRequest];
    uint64_t v12 = [v11 aceId];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v15 = [v80 startRequest];
      uint64_t v16 = [v15 aceId];
LABEL_7:
      __int16 v21 = (void *)v16;
      double v22 = (void *)[v14 initWithUUIDString:v16];

      goto LABEL_9;
    }
  }
  id v17 = [v80 startLocalRequest];
  if (v17)
  {
    uint64_t v18 = [v80 startLocalRequest];
    id v19 = [v18 aceId];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      id v14 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v15 = [v80 startLocalRequest];
      uint64_t v16 = [v15 aceId];
      goto LABEL_7;
    }
  }
  double v22 = 0;
LABEL_9:
  __int16 v23 = [v81 intuitiveConversationRequestId];

  if (v23)
  {
    id v24 = [v81 intuitiveConversationRequestId];

    uint64_t v25 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      id v26 = v25;
      double v27 = [v24 UUIDString];
      *(_DWORD *)buf = 136315394;
      v89 = "-[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
      __int16 v90 = 2112;
      uint64_t v91 = v27;
      _os_log_impl(&dword_25D830000, v26, OS_LOG_TYPE_INFO, "%s Setting IntuitiveConversationRequestId = %@ from AFSpeechRequestOptions", buf, 0x16u);
    }
  }
  else
  {
    id v24 = v22;
  }
  id obj = v24;
  if (!v24)
  {
    id obj = [MEMORY[0x263F08C38] UUID];
  }
  id v28 = [(NAFConnection *)self _siriClientStateManager];
  [v28 beginRequestWithUUID:obj forClient:self->_clientID];

  [(NAFConnection *)self _willCancelRequest];
  [(NAFConnection *)self _completeRequestWithUUID:v76 forReason:1 error:0];
  id v29 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v89 = "-[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
    __int16 v90 = 2048;
    uint64_t v91 = self;
    __int16 v92 = 2112;
    id v93 = obj;
    __int16 v94 = 1024;
    BOOL v95 = v78;
    __int16 v96 = 2112;
    id v97 = v81;
    _os_log_impl(&dword_25D830000, v29, OS_LOG_TYPE_INFO, "%s %p %@ %d (%@)", buf, 0x30u);
  }
  id v30 = [MEMORY[0x263F08AB0] processInfo];
  [v30 systemUptime];
  double v32 = v31;

  if (v77 && (double v34 = (void *)v77[2](v77, obj)) != 0)
  {
    int v35 = v33;
  }
  else
  {
    v85[0] = @"isSpeechRequest";
    int64_t v36 = [NSNumber numberWithBool:v78];
    v86[0] = v36;
    v85[1] = @"id";
    __int16 v37 = [obj UUIDString];
    v86[1] = v37;
    v85[2] = @"unixTime";
    id v38 = NSNumber;
    uint64_t v39 = [MEMORY[0x263EFF910] date];
    [v39 timeIntervalSince1970];
    double v40 = objc_msgSend(v38, "numberWithDouble:");
    v86[2] = v40;
    v85[3] = @"systemVersion";
    uint64_t v41 = WL_AFProductAndBuildVersion();
    v86[3] = v41;
    double v42 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:4];
    v87[0] = v42;
    double v43 = [(NAFConnection *)self _startRequestMetricSettings];
    v87[1] = v43;
    __int16 v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
    uint64_t v45 = AFAnalyticsContextsMerge();

    if (WL_AFIsInternalInstall())
    {
      v84[0] = v45;
      uint64_t v46 = AFAnalyticsTurnContextCreateWithRequestInfo();
      v84[1] = v46;
      v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
      uint64_t v48 = AFAnalyticsContextsMerge();

      uint64_t v45 = (void *)v48;
    }
    double v34 = AFAnalyticsEventCreateCurrent();

    int v35 = 3;
  }
  [(AFAnalytics *)self->_analytics logEvent:v34];
  if (v78) {
    id v49 = v81;
  }
  else {
    id v49 = v80;
  }
  id v50 = [v49 turnIdentifier];
  objc_storeStrong((id *)&self->_activeTurnIdentifier, v50);
  id v51 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    -[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:](v51);
  }
  id v52 = obj;
  if (v50)
  {
    v53 = (objc_class *)MEMORY[0x263F6EEE0];
    id v54 = v50;
    id v55 = (void *)[[v53 alloc] initWithNSUUID:v52];
    id v56 = objc_alloc_init(MEMORY[0x263F6EE08]);
    [v56 setMteRequestId:v55];

    id v57 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v57 logInstrumentation:v56 machAbsoluteTime:mach_absolute_time() turnIdentifier:v54];
  }
  if ([(NAFConnection *)self _shouldEmitUEIRequestLinkForRequestInfo:v80 speechRequestOptions:v81])
  {
    id v58 = (id)*MEMORY[0x263F28348];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      MEMORY[0x2611B63E0](v50);
      v59 = (NAFConnection *)(id)objc_claimAutoreleasedReturnValue();
      v60 = [v52 UUIDString];
      *(_DWORD *)buf = 136315650;
      v89 = "-[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
      __int16 v90 = 2112;
      uint64_t v91 = v59;
      __int16 v92 = 2112;
      id v93 = v60;
      _os_log_impl(&dword_25D830000, v58, OS_LOG_TYPE_INFO, "%s Emitting Request link message between turnID: %@ and RequestID: %@", buf, 0x20u);
    }
    v61 = [v52 UUIDString];
    MEMORY[0x2611B63E0](v50);
    id v62 = (id)objc_claimAutoreleasedReturnValue();
    v63 = ADCreateRequestLinkInfo();
    v64 = ADCreateRequestLinkInfo();

    ADEmitRequestLinkEventMessage();
  }
  objc_storeStrong((id *)&self->_activeRequestUUID, obj);
  int64_t v65 = 1;
  if (!v78) {
    int64_t v65 = 2;
  }
  self->_int64_t activeRequestType = v65;
  self->_activeRequestSpeechEvent = [v81 activationEvent];
  self->_activeRequestActivationEvent = [v80 activationEvent];
  self->_activeRequestBeginTime = v32;
  self->_activeRequestTypeForRequestCategorization = v35;
  if (!v78)
  {
    self->_activeRequestStartSpeechTimeRequested = 0.0;
    self->_activeRequestStartSpeechTimeAPICalled = 0.0;
    goto LABEL_44;
  }
  self->_activeRequestStartSpeechTimeAPICalled = v32;
  if (!v81) {
    goto LABEL_44;
  }
  [v81 activationEventTime];
  if (v66 <= 0.0)
  {
    if (![v81 activationEventMachAbsoluteTime]) {
      goto LABEL_44;
    }
    [v81 activationEventMachAbsoluteTime];
    AFMachAbsoluteTimeGetTimeInterval();
  }
  else
  {
    [v81 activationEventTime];
  }
  self->_activeRequestStartSpeechTimeRequested = v67;
LABEL_44:
  self->_activeRequestUsefulUserResultType = 0;
  *(_WORD *)&self->_activeRequestIsDucking = 0;
  self->_activeRequestSpeechEndHostTime = 0;
  self->_unint64_t activeRequestNumberOfPresentedInterstitials = 0;
  *(_OWORD *)&self->_activeRequestStopSpeechTimeRequested = 0u;
  *(_OWORD *)&self->_activeRequestSpeechRecordingEndTimeInterval = 0u;
  self->_activeRequestInitialInterstitialBeginTimeInterval = 0.0;
  lastRetryError = self->_lastRetryError;
  self->_lastRetryError = 0;

  self->_uufrID = 0;
  [(NAFConnection *)self _updateClientConfiguration];
  _EmitHomePodLaunchContextTime(self->_analytics, self->_activeRequestUUID, self->_activeTurnIdentifier, v81);
  if (v78)
  {
    [MEMORY[0x263F283F0] logSiriSpeechRequestStarted];
  }
  else
  {
    [MEMORY[0x263F283F0] logSiriOtherRequestStarted];
    [(NAFConnection *)self _updateStateIfNotInSync];
  }
  v69 = [MEMORY[0x263F28568] currentCoordinator];
  v70 = v69;
  if (v69)
  {
    [v69 setCurrentRequestId:v52];
  }
  else
  {
    v71 = [MEMORY[0x263F087C8] defaultCenter];
    uint64_t v82 = @"requestId";
    v72 = [v52 UUIDString];
    uint64_t v83 = v72;
    v73 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    [v71 postNotificationName:@"RequestIdForMyriad" object:0 userInfo:v73 deliverImmediately:1];
  }
  double v74 = [MEMORY[0x263F283E0] sharedObserver];
  [v74 addListener:self];

  double v75 = [MEMORY[0x263F284D0] sharedObserver];
  [v75 addListener:self];
}

- (void)_willEndSession
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[NAFConnection _willEndSession]";
    __int16 v7 = 2048;
    os_log_t v8 = self;
    _os_log_impl(&dword_25D830000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  if (self->_activeRequestUsefulUserResultType == 2) {
    [(NAFConnection *)self _willCompleteRequest];
  }
  else {
    [(NAFConnection *)self _willCancelRequest];
  }
  uint64_t v4 = [(NAFConnection *)self _siriClientStateManager];
  [v4 endSessionForClient:self->_clientID];
}

- (void)_willCancelRequest
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_int64_t activeRequestType = &self->_activeRequestType;
  if (self->_activeRequestType)
  {
    int v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "-[NAFConnection _willCancelRequest]";
      __int16 v21 = 2048;
      double v22 = self;
      __int16 v23 = 2112;
      id v24 = activeRequestUUID;
      _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    __int16 v7 = NSStringFromSelector(a2);
    [(NAFConnection *)self _endInterstitialsForReason:v7];

    *p_int64_t activeRequestType = 0;
    p_activeRequestType[1] = 0;
    analytics = self->_analytics;
    uint64_t v9 = self->_activeRequestUUID;
    if (v9)
    {
      uint64_t v10 = [(NSUUID *)v9 UUIDString];
      uint64_t v18 = v10;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [(AFAnalytics *)analytics logEventWithType:1912 context:v11];
    }
    else
    {
      [(AFAnalytics *)self->_analytics logEventWithType:1912 context:0];
    }
    [MEMORY[0x263F283F0] logSiriRequestCancelled];
    uint64_t v12 = [MEMORY[0x263F284D0] sharedObserver];
    [v12 removeListener:self];

    uint64_t v13 = [MEMORY[0x263F283E0] sharedObserver];
    [v13 removeListener:self];

    id v14 = [(NAFConnection *)self _siriClientStateManager];
    [v14 endRequestWithUUID:self->_activeRequestUUID forClient:self->_clientID];

    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 1, self->_activeRequestTypeForRequestCategorization);
    activeTurnIdentifier = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_activeRequestActivationEvent = 0;
    self->_activeRequestSpeechEvent = 0;
    *(int64_t *)((char *)&self->_activeRequestSpeechEvent + 7) = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_unint64_t activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    uint64_t v16 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;
  }
}

- (void)_willFailRequestWithError:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v6 = (NSUUID *)a3;
  if (self->_activeRequestType)
  {
    __int16 v7 = (os_log_t *)MEMORY[0x263F28348];
    os_log_t v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      [(NAFConnection *)(uint64_t)self _willFailRequestWithError:v8];
    }
    uint64_t v9 = NSStringFromSelector(a2);
    [(NAFConnection *)self _endInterstitialsForReason:v9];

    self->_int64_t activeRequestType = 0;
    self->_activeRequestUsefulUserResultType = 0;
    uint64_t v10 = [(NSUUID *)v6 domain];
    char v11 = [v10 isEqualToString:*MEMORY[0x263F28730]];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "-[NAFConnection _willFailRequestWithError:]";
        __int16 v54 = 2112;
        id v55 = v6;
        _os_log_impl(&dword_25D830000, v12, OS_LOG_TYPE_INFO, "%s Wrapping up non-siri error in generic error %@", buf, 0x16u);
      }
      uint64_t v13 = [MEMORY[0x263F28508] errorWithCode:0 description:0 underlyingError:v6];

      uint64_t v6 = (NSUUID *)v13;
    }
    int v14 = AFErrorSetUnderlyingError();
    id v15 = 0;
    if (v14)
    {
      uint64_t v16 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "-[NAFConnection _willFailRequestWithError:]";
        __int16 v54 = 2112;
        id v55 = v6;
        _os_log_impl(&dword_25D830000, v16, OS_LOG_TYPE_INFO, "%s Appending additional details to error %@", buf, 0x16u);
      }
      uint64_t v17 = (NSUUID *)v15;

      uint64_t v6 = v17;
    }
    activeRequestUUID = self->_activeRequestUUID;
    if (activeRequestUUID)
    {
      id v49 = @"id";
      uint64_t v3 = [(NSUUID *)activeRequestUUID UUIDString];
      id v50 = v3;
      id v19 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    }
    else
    {
      id v19 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v48 = v15;
    v51[0] = v19;
    uint64_t v20 = AFAnalyticsContextCreateWithError();
    v51[1] = v20;
    __int16 v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
    double v22 = AFAnalyticsContextsMerge();

    if (activeRequestUUID)
    {
    }
    [(AFAnalytics *)self->_analytics logEventWithType:1913 context:v22];
    __int16 v23 = self->_activeRequestUUID;
    activeTurnIdentifier = self->_activeTurnIdentifier;
    uint64_t v25 = self->_analytics;
    id v26 = v23;
    double v27 = activeTurnIdentifier;
    uint64_t v6 = v6;
    if (v6)
    {
      id v28 = *v7;
      id v29 = *v7;
      if (v27)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v53 = "_EmitPNRFatalError";
          __int16 v54 = 2112;
          id v55 = v26;
          __int16 v56 = 2112;
          id v57 = v27;
          __int16 v58 = 2112;
          v59 = v6;
          _os_log_impl(&dword_25D830000, v28, OS_LOG_TYPE_INFO, "%s Logging instrumentation for requestUUID = %@ turnId = %@ error = %@", buf, 0x2Au);
        }
        id v30 = objc_alloc_init(MEMORY[0x263F6ED90]);
        double v31 = _PNRFatalErrorInfo(v6);
        [v30 setError:v31];

        double v32 = [(NSUUID *)v6 userInfo];
        uint64_t v33 = *MEMORY[0x263F08608];
        double v34 = [v32 objectForKey:*MEMORY[0x263F08608]];

        if (v34)
        {
          int v35 = _PNRFatalErrorInfo(v34);
          [v30 setUnderlyingError:v35];

          int64_t v36 = [v34 userInfo];
          __int16 v37 = [v36 objectForKey:v33];

          if (v37)
          {
            id v38 = _PNRFatalErrorInfo(v37);
            [v30 setUnderUnderlyingError:v38];
          }
        }
        [(AFAnalytics *)v25 logInstrumentation:v30 machAbsoluteTime:mach_absolute_time() turnIdentifier:v27];
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        -[NAFConnection _willFailRequestWithError:]();
      }
    }
    else if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      -[NAFConnection _willFailRequestWithError:]();
    }

    [MEMORY[0x263F283F0] logSiriRequestFailedWithError:v6];
    if (WL_AFIsInternalInstall())
    {
      uint64_t v39 = [(NAFConnection *)self _clientService];
      double v40 = AFSpeechEventGetDescription();
      [v39 reportIssueForError:v6 type:1913 subtype:v40 context:v22];
    }
    if (!_AFConnectionIsErrorDeallocation(v6))
    {
      uint64_t v41 = [MEMORY[0x263F284D0] sharedObserver];
      [v41 removeListener:self];

      double v42 = [MEMORY[0x263F283E0] sharedObserver];
      [v42 removeListener:self];

      double v43 = [(NAFConnection *)self _siriClientStateManager];
      [v43 endRequestWithUUID:self->_activeRequestUUID forClient:self->_clientID];
    }
    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 2, self->_activeRequestTypeForRequestCategorization);
    __int16 v44 = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_activeRequestTypeForRequestCategorization = 0;
    if ((WL_AFIsHorseman() & 1) != 0
      || (WL_AFIsATV() & 1) != 0
      || (WL_AFIsPad() & 1) != 0
      || WL_AFIsMac())
    {
      uint64_t v45 = [(NAFConnection *)self _clientService];
      [v45 emitHomeMetricInvocationEvent];
    }
    *(_WORD *)&self->_activeRequestHasSpeechRecognition = 0;
    self->_activeRequestIsTwoShot = 0;
    self->_activeRequestActivationEvent = 0;
    self->_activeRequestSpeechEvent = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_unint64_t activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    uint64_t v46 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;

    v47 = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;
  }
}

BOOL __43__NAFConnection__willFailRequestWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F283B0]];

  if (!v4)
  {
    __int16 v7 = [v2 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F28730]];

    if (v8)
    {
      BOOL v6 = [v2 code] == 211;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = [v2 code];
  if (v5 != 1 && v5 != 201 && v5 != 102) {
    goto LABEL_8;
  }
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

id __43__NAFConnection__willFailRequestWithError___block_invoke_2(uint64_t a1)
{
  id v2 = _AFConnectionGetBucketStringFromTimeIntervals(*(double *)(*(void *)(a1 + 32) + 152), *(double *)(*(void *)(a1 + 32) + 168));
  uint64_t v3 = *(double **)(a1 + 32);
  double v4 = v3[18];
  if (v4 == 0.0) {
    double v4 = v3[19];
  }
  double v5 = v3[20];
  if (v5 == 0.0) {
    double v5 = v3[21];
  }
  BOOL v6 = _AFConnectionGetBucketStringFromTimeIntervals(v4, v5);
  if ([v2 isEqualToString:v6]) {
    id v7 = v2;
  }
  else {
    id v7 = (id)[[NSString alloc] initWithFormat:@"%@,%@", v2, v6];
  }
  int v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"SpeechErrorHints[StartStopSpeechDelta:%@]", v7];
  char v11 = [v9 errorWithDomain:v10 code:0 userInfo:0];

  return v11;
}

- (void)_willCompleteRequest
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_int64_t activeRequestType = &self->_activeRequestType;
  if (self->_activeRequestType)
  {
    double v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      *(_DWORD *)buf = 136315650;
      double v22 = "-[NAFConnection _willCompleteRequest]";
      __int16 v23 = 2048;
      id v24 = self;
      __int16 v25 = 2112;
      id v26 = activeRequestUUID;
      _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    id v7 = NSStringFromSelector(a2);
    [(NAFConnection *)self _endInterstitialsForReason:v7];

    *p_int64_t activeRequestType = 0;
    p_activeRequestType[1] = 0;
    analytics = self->_analytics;
    uint64_t v9 = self->_activeRequestUUID;
    if (v9)
    {
      uint64_t v10 = [(NSUUID *)v9 UUIDString];
      uint64_t v20 = v10;
      char v11 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [(AFAnalytics *)analytics logEventWithType:1914 context:v11];
    }
    else
    {
      [(AFAnalytics *)self->_analytics logEventWithType:1914 context:0];
    }
    [MEMORY[0x263F283F0] logSiriRequestSucceeded];
    uint64_t v12 = [(NAFConnection *)self _clientService];
    [v12 recordAWDSuccessMetrics];

    uint64_t v13 = [MEMORY[0x263F284D0] sharedObserver];
    [v13 removeListener:self];

    int v14 = [MEMORY[0x263F283E0] sharedObserver];
    [v14 removeListener:self];

    id v15 = [(NAFConnection *)self _siriClientStateManager];
    [v15 endRequestWithUUID:self->_activeRequestUUID forClient:self->_clientID];

    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 3, self->_activeRequestTypeForRequestCategorization);
    activeTurnIdentifier = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_activeRequestTypeForRequestCategorization = 0;
    if ((WL_AFIsHorseman() & 1) != 0
      || (WL_AFIsATV() & 1) != 0
      || (WL_AFIsPad() & 1) != 0
      || WL_AFIsMac())
    {
      uint64_t v17 = [(NAFConnection *)self _clientService];
      [v17 emitHomeMetricInvocationEvent];
    }
    *(_WORD *)&self->_activeRequestHasSpeechRecognition = 0;
    self->_activeRequestIsTwoShot = 0;
    self->_activeRequestActivationEvent = 0;
    self->_activeRequestSpeechEvent = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_unint64_t activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    uint64_t v18 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;
  }
}

- (void)_willPresentUsefulUserResultWithType:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v5 = NSStringFromSelector(a2);
  [(NAFConnection *)self _endInterstitialsForReason:v5];
  [(NAFConnection *)self _cancelRequestTimeoutForReason:v5];
  if (self->_activeRequestType)
  {
    BOOL v6 = (os_log_t *)MEMORY[0x263F28348];
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v9 = 136315650;
      uint64_t v10 = "-[NAFConnection _willPresentUsefulUserResultWithType:]";
      __int16 v11 = 2048;
      uint64_t v12 = self;
      __int16 v13 = 2048;
      int64_t v14 = a3;
      _os_log_impl(&dword_25D830000, v7, OS_LOG_TYPE_INFO, "%s %p %ld", (uint8_t *)&v9, 0x20u);
    }
    self->_activeRequestUsefulUserResultType = a3;
    if (WL_AFIsInternalInstall())
    {
      if (self->_activeRequestInitialInterstitialBeginTimeInterval > 0.0)
      {
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        if (v8 - self->_activeRequestInitialInterstitialBeginTimeInterval < 0.5)
        {
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
            -[NAFConnection _willPresentUsefulUserResultWithType:]();
          }
          [(NAFConnection *)self reportIssueForType:@"Interstitial" subtype:@"Near Fire before UUFR" context:0];
        }
      }
    }
  }
  else
  {
    self->_activeRequestUsefulUserResultType = 0;
  }
}

- (void)_enqueueInterstitialCommand:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    -[NAFConnection _enqueueInterstitialCommand:]();
  }
  interstitialCommandQueue = self->_interstitialCommandQueue;
  if (!interstitialCommandQueue)
  {
    getAFQueueClass();
    BOOL v6 = (AFQueue *)objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
    id v7 = self->_interstitialCommandQueue;
    self->_interstitialCommandQueue = v6;

    interstitialCommandQueue = self->_interstitialCommandQueue;
  }
  [(AFQueue *)interstitialCommandQueue enqueueObject:v4];
}

- (void)_beginInterstitialsForReason:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_interstitialProvider
    && self->_activeRequestType
    && !self->_activeRequestUsefulUserResultType
    && AFInterstitialSupportsRequestWithEvent())
  {
    if (!WL_AFIsInternalInstall()
      || (uint64_t ForcedInterstitialStyle = _AFPreferencesGetForcedInterstitialStyle()) == 0)
    {
      if (WL_AFIsHorseman())
      {
        uint64_t ForcedInterstitialStyle = 4;
      }
      else if (AFRecordRouteIsHearst())
      {
        uint64_t ForcedInterstitialStyle = 3;
      }
      else if ([(AFClientConfiguration *)self->_clientConfiguration isDeviceInStarkMode])
      {
        uint64_t ForcedInterstitialStyle = 6;
      }
      else if ([(AFClientConfiguration *)self->_clientConfiguration isDeviceInCarDNDMode])
      {
        uint64_t ForcedInterstitialStyle = 5;
      }
      else if (AFPlaybackRouteIsHandsFree())
      {
        uint64_t ForcedInterstitialStyle = 2;
      }
      else if (WL_AFIsNano())
      {
        uint64_t ForcedInterstitialStyle = 8;
      }
      else
      {
        uint64_t ForcedInterstitialStyle = 1;
      }
    }
    BOOL v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v11 = "-[NAFConnection _beginInterstitialsForReason:]";
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_25D830000, v6, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@", buf, 0x16u);
    }
    getAFInterstitialProviderClass();
    id v7 = objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue());
    double v8 = (AFInterstitialProvider *)[v7 initWithStyle:ForcedInterstitialStyle recordRoute:self->_recordRoute isVoiceTrigger:AFSpeechEventIsVoiceTrigger() isDucking:self->_activeRequestIsDucking isTwoShot:self->_activeRequestIsTwoShot speechEndHostTime:self->_activeRequestSpeechEndHostTime context:self->_activeRequestUUID preferences:self->_preferences delegate:self];
    interstitialProvider = self->_interstitialProvider;
    self->_interstitialProvider = v8;
  }
}

- (void)_handleInterstitialPhase:(int64_t)a3 fromProvider:(id)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v17 = (AFInterstitialProvider *)a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  __int16 v21 = (void (**)(void))a9;
  if (self->_interstitialProvider == v17 && ([(NSUUID *)self->_activeRequestUUID isEqual:v20] & 1) != 0)
  {
    double v22 = (os_log_t *)MEMORY[0x263F28348];
    __int16 v23 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      id v24 = v23;
      __int16 v25 = AFInterstitialPhaseGetName();
      *(_DWORD *)buf = 136316418;
      double v34 = "-[NAFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
      __int16 v35 = 2112;
      int64_t v36 = v25;
      __int16 v37 = 2112;
      id v38 = v18;
      __int16 v39 = 2112;
      id v40 = v19;
      __int16 v41 = 2048;
      double v42 = a7;
      __int16 v43 = 2112;
      id v44 = v20;
      _os_log_impl(&dword_25D830000, v24, OS_LOG_TYPE_INFO, "%s phase = %@, displayText = %@, speakableText = %@, expectedDelay = %f, context = %@", buf, 0x3Eu);

      double v22 = (os_log_t *)MEMORY[0x263F28348];
    }
    if ((unint64_t)(a3 - 1) >= 3)
    {
      if (a3 == 4)
      {
        id v29 = NSStringFromSelector(a2);
        [(NAFConnection *)self _endInterstitialsForReason:v29];
        [(NAFConnection *)self _invokeRequestTimeoutForReason:v29];
      }
    }
    else
    {
      id v26 = [(AFQueue *)self->_interstitialCommandQueue dequeueObject];
      if (!v26)
      {
        if ([v18 length] || objc_msgSend(v19, "length"))
        {
          uint64_t v27 = [(NSUUID *)self->_activeRequestUUID UUIDString];
          id v26 = AFInterstitialCreateCommand();
        }
        else
        {
          id v30 = *v22;
          if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            double v34 = "-[NAFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
            _os_log_impl(&dword_25D830000, v30, OS_LOG_TYPE_INFO, "%s Unable to create an interstitial command because display text and speakable text are both empty.", buf, 0xCu);
          }
          id v26 = 0;
        }
      }
      id v28 = *v22;
      if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        double v34 = "-[NAFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
        __int16 v35 = 2112;
        int64_t v36 = v26;
        _os_log_impl(&dword_25D830000, v28, OS_LOG_TYPE_INFO, "%s interstitialCommand = %@", buf, 0x16u);
      }
      if (v26)
      {
        ++self->_activeRequestNumberOfPresentedInterstitials;
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __114__NAFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke;
        v31[3] = &unk_26550E608;
        double v32 = v21;
        [(NAFConnection *)self _dispatchCommand:v26 isInterstitial:1 interstitialPhase:a3 interstitialDelay:v31 reply:a7];
      }
      else if (v21)
      {
        v21[2](v21);
      }
    }
  }
  else if (v21)
  {
    v21[2](v21);
  }
}

void __114__NAFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (os_log_t *)MEMORY[0x263F28348];
  if (v5)
  {
    double v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      __int16 v11 = "-[NAFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:comple"
            "tion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_25D830000, v8, OS_LOG_TYPE_INFO, "%s interstitialReply = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  if (v6 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
    __114__NAFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke_cold_1();
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)_endInterstitialsForReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_interstitialProvider)
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[NAFConnection _endInterstitialsForReason:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v8, 0x16u);
    }
    getAFFeatureFlagsClass();
    -[NAFConnection stopAllAudioPlaybackRequests:](self, "stopAllAudioPlaybackRequests:", [(id)objc_claimAutoreleasedReturnValue() isStateFeedbackEnabled] ^ 1);
    [(AFInterstitialProvider *)self->_interstitialProvider invalidate];
    interstitialProvider = self->_interstitialProvider;
    self->_interstitialProvider = 0;
  }
  interstitialCommandQueue = self->_interstitialCommandQueue;
  self->_interstitialCommandQueue = 0;
}

+ (BOOL)assistantIsSupportedForLanguageCode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (WL_AFAssistantCapable())
  {
    id v6 = [MEMORY[0x263F285A0] sharedPreferences];
    char v7 = [v6 isLocaleIdentifierNativelySupported:v5];

    if (v7)
    {
      int v8 = 0;
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    uint64_t v9 = 401;
  }
  else
  {
    uint64_t v9 = 400;
  }
  int v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F28730] code:v9 userInfo:0];
  if (a4) {
LABEL_8:
  }
    *a4 = v8;
LABEL_9:

  return v8 == 0;
}

+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 deviceProductVersion:(id)a4 error:(id *)a5
{
  return [a1 siriIsSupportedForLanguageCode:a3 productName:0 productVersion:a4 error:a5];
}

+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 productName:(id)a4 productVersion:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (!v9 || !v11)
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F28730] code:402 userInfo:0];
    if (!a6) {
      goto LABEL_7;
    }
LABEL_6:
    *a6 = v14;
    goto LABEL_7;
  }
  id v13 = AFPreferencesSupportedLanguagesForRemote();
  if ([v13 containsObject:v9])
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F28730] code:401 userInfo:0];
  }

  if (a6) {
    goto LABEL_6;
  }
LABEL_7:

  return v14 == 0;
}

+ (void)beginMonitoringAvailability
{
  if (!sAvailabilityObserver)
  {
    id v2 = objc_alloc_init(NAFConnectionAvailabilityObserver);
    uint64_t v3 = (void *)sAvailabilityObserver;
    sAvailabilityObserver = (uint64_t)v2;

    id v4 = +[NAFNetworkAvailability sharedAvailability];
    [v4 addObserver:sAvailabilityObserver];
  }
}

+ (BOOL)isNetworkAvailable
{
  if (!sAvailabilityObserver) {
    [a1 beginMonitoringAvailability];
  }
  id v2 = +[NAFNetworkAvailability sharedAvailability];
  char v3 = [v2 isAvailable];

  return v3;
}

+ (BOOL)isAvailable
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(id)objc_opt_class() isNetworkAvailable])
  {
    id v2 = *MEMORY[0x263F28348];
    LOBYTE(v3) = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "+[NAFConnection isAvailable]";
      _os_log_impl(&dword_25D830000, v2, OS_LOG_TYPE_INFO, "%s Network is available. Evaluating NAFConnection as available.", (uint8_t *)&v10, 0xCu);
    }
    return v3;
  }
  if (WL_AFDeviceSupportsSiriUOD())
  {
    id v4 = [(id)objc_opt_class() currentLanguageCode];
    getAFFeatureFlagsClass();
    int v3 = [(id)objc_claimAutoreleasedReturnValue() isSiriUODAvailableForLanguage:v4];
    id v5 = *MEMORY[0x263F28348];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        int v10 = 136315394;
        id v11 = "+[NAFConnection isAvailable]";
        __int16 v12 = 2112;
        id v13 = v4;
        char v7 = "%s Network is not available but device supports Understanding On Device for %@. Evaluating NAFConnection as available.";
LABEL_13:
        _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, 0x16u);
      }
    }
    else if (v6)
    {
      int v10 = 136315394;
      id v11 = "+[NAFConnection isAvailable]";
      __int16 v12 = 2112;
      id v13 = v4;
      char v7 = "%s Network is not available and language %@ is not supported for Understanding On Device. Evaluating NAFConne"
           "ction as NOT available.";
      goto LABEL_13;
    }

    return v3;
  }
  int v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "+[NAFConnection isAvailable]";
    _os_log_impl(&dword_25D830000, v8, OS_LOG_TYPE_INFO, "%s Network is not available and device does not support Understanding On Device. Evaluating NAFConnection as NOT available.", (uint8_t *)&v10, 0xCu);
  }
  LOBYTE(v3) = 0;
  return v3;
}

+ (void)stopMonitoringAvailability
{
  if (sAvailabilityObserver)
  {
    id v2 = +[NAFNetworkAvailability sharedAvailability];
    [v2 removeObserver:sAvailabilityObserver];

    int v3 = (void *)sAvailabilityObserver;
    sAvailabilityObserver = 0;
  }
}

+ (id)currentLanguageCode
{
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
  int v3 = [v2 languageCode];

  return v3;
}

+ (id)outputVoice
{
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
  int v3 = [v2 outputVoice];

  return v3;
}

- (void)endSession
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[NAFConnection endSession]";
    __int16 v9 = 2048;
    int v10 = self;
    _os_log_impl(&dword_25D830000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v7, 0x16u);
  }
  [(NAFConnection *)self _willEndSession];
  id v4 = [MEMORY[0x263F28568] currentCoordinator];
  id v5 = v4;
  if (v4) {
    [v4 endTask];
  }
  BOOL v6 = [(NAFConnection *)self _clientService];
  [v6 endSession];
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "-[NAFConnection invalidate]";
    __int16 v7 = 2048;
    int v8 = self;
    _os_log_impl(&dword_25D830000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  [(NAFConnection *)self _clearConnection];
  id v4 = [(NAFConnection *)self _siriClientStateManager];
  [v4 invalidateClient:self->_clientID];
}

+ (void)defrost
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v10 = "+[NAFConnection defrost]";
    _os_log_impl(&dword_25D830000, v2, OS_LOG_TYPE_INFO, "%s Begin sending defrost XPC message.", buf, 0xCu);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.assistant.sync", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_268);
  xpc_connection_resume(mach_service);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "name", "defrost");
  uint64_t v5 = mach_absolute_time();
  xpc_dictionary_set_uint64(v4, "mach_time", v5);
  xpc_connection_send_message(mach_service, v4);
  barrier[0] = MEMORY[0x263EF8330];
  barrier[1] = 3221225472;
  barrier[2] = __24__NAFConnection_defrost__block_invoke_2;
  barrier[3] = &unk_26550E2A0;
  int v8 = mach_service;
  BOOL v6 = mach_service;
  xpc_connection_send_barrier(v6, barrier);
}

void __24__NAFConnection_defrost__block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  uint64_t v1 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    int v3 = "+[NAFConnection defrost]_block_invoke_2";
    _os_log_impl(&dword_25D830000, v1, OS_LOG_TYPE_INFO, "%s End sending defrost XPC message.", (uint8_t *)&v2, 0xCu);
  }
}

- (void)preheatWithStyle:(int64_t)a3
{
}

- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  __int16 v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315906;
    __int16 v12 = "-[NAFConnection preheatWithStyle:forOptions:]";
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_25D830000, v7, OS_LOG_TYPE_INFO, "%s %p %ld %@", (uint8_t *)&v11, 0x2Au);
  }
  [(AFAnalytics *)self->_analytics logEventWithType:1915 context:0];
  int v8 = [(NAFConnection *)self _clientService];
  [v8 preheatWithStyle:a3 forOptions:v6];

  id v9 = (id)[MEMORY[0x263F283E0] sharedObserver];
  id v10 = (id)[MEMORY[0x263F284D0] sharedObserver];
}

- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  __int16 v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[NAFConnection boostedPreheatWithStyle:completion:]";
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl(&dword_25D830000, v7, OS_LOG_TYPE_INFO, "%s %p %ld", buf, 0x20u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__NAFConnection_boostedPreheatWithStyle_completion___block_invoke;
  v12[3] = &unk_26550E650;
  id v13 = v6;
  id v8 = v6;
  id v9 = [(NAFConnection *)self _clientServiceWithErrorHandler:v12];
  id v10 = v9;
  if (v8) {
    int v11 = v8;
  }
  else {
    int v11 = &__block_literal_global_274;
  }
  [v9 boostedPreheatWithStyle:a3 completion:v11];
}

uint64_t __52__NAFConnection_boostedPreheatWithStyle_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)forceAudioSessionActive
{
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 speechRequestOptions:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = (void *)MEMORY[0x263F285D0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  id v18[2] = __91__NAFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke;
  v18[3] = &unk_26550E678;
  unint64_t v20 = a3;
  int64_t v21 = a4;
  id v19 = v10;
  id v13 = v10;
  uint64_t v14 = (void *)[v12 newWithBuilder:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__NAFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke_2;
  v16[3] = &unk_26550E6A0;
  id v17 = v11;
  id v15 = v11;
  [(NAFConnection *)self forceAudioSessionActiveWithContext:v14 completion:v16];
}

void __91__NAFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = a2;
  [v4 setOptions:v3];
  [v4 setReason:a1[6]];
  [v4 setSpeechRequestOptions:a1[4]];
}

void __91__NAFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    uint64_t v4 = [v3 audioSessionID];
    id v5 = [v3 error];

    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
  }
}

- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v24 = "-[NAFConnection forceAudioSessionActiveWithContext:completion:]";
    __int16 v25 = 2048;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_25D830000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }
  getAFOneArgumentSafetyBlockClass();
  id v9 = objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue());
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke;
  v21[3] = &unk_26550E6C8;
  v21[4] = self;
  id v22 = v7;
  id v10 = (void *)MEMORY[0x263F285D8];
  id v11 = v7;
  __int16 v12 = (void *)[v10 newWithBuilder:&__block_literal_global_282];
  id v13 = (void *)[v9 initWithBlock:v21 defaultValue:v12];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2;
  v19[3] = &unk_26550E738;
  id v14 = v13;
  id v20 = v14;
  id v15 = [(NAFConnection *)self _clientServiceWithErrorHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2_290;
  v17[3] = &unk_26550E760;
  id v18 = v14;
  id v16 = v14;
  [v15 forceAudioSessionActiveWithContext:v6 completion:v17];
}

void __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 136315650;
    id v8 = "-[NAFConnection forceAudioSessionActiveWithContext:completion:]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_DEFAULT, "%s %p %@", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_279(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAudioSessionID:0];
  id v3 = [MEMORY[0x263F28508] errorWithCode:40 description:@"Safety completion of -forceAudioSessionActive is deallocated without invocation."];
  [v2 setError:v3];
}

void __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[NAFConnection forceAudioSessionActiveWithContext:completion:]_block_invoke_2";
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = (void *)MEMORY[0x263F285D8];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_286;
  v9[3] = &unk_26550E710;
  id v10 = v3;
  id v7 = v3;
  id v8 = (void *)[v6 newWithBuilder:v9];
  [v5 invokeWithValue:v8];
}

void __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_286(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAudioSessionID:0];
  id v4 = [MEMORY[0x263F28508] errorWithCode:7 description:@"XPC connection encountered an error during -forceAudioSessionActive." underlyingError:*(void *)(a1 + 32)];
  [v3 setError:v4];
}

uint64_t __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2_290(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

- (void)acquireAudioSessionWithContext:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[NAFConnection acquireAudioSessionWithContext:completion:]";
    __int16 v19 = 2048;
    id v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_25D830000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }
  __int16 v9 = [(NAFConnection *)self _siriClientStateManager];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke;
  v13[3] = &unk_26550E7B0;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v9;
  id v11 = v6;
  id v12 = v7;
  [(NAFConnection *)self forceAudioSessionActiveWithContext:v11 completion:v13];
}

void __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v22 = "-[NAFConnection acquireAudioSessionWithContext:completion:]_block_invoke";
    __int16 v23 = 2048;
    uint64_t v24 = v5;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", buf, 0x20u);
  }
  if (*(void *)(a1 + 56))
  {
    uint64_t v6 = [*(id *)(a1 + 40) reason];
    id v7 = [v3 error];
    BOOL v8 = v7 != 0;

    BOOL v9 = v6 == 3;
    if (v9 && !v7 && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 344), 1uLL)) {
      [*(id *)(a1 + 48) beginSpeakingForClient:*(void *)(a1 + 32)];
    }
    getAFSafetyBlockClass();
    id v10 = objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue());
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke_291;
    v17[3] = &unk_26550E788;
    BOOL v19 = v9;
    BOOL v20 = v8;
    void v17[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 48);
    id v11 = (void *)[v10 initWithBlock:v17];
    uint64_t v12 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke_2;
    v15[3] = &unk_26550E2A0;
    id v16 = v11;
    __int16 v13 = *(void (**)(uint64_t, id, void *))(v12 + 16);
    id v14 = v11;
    v13(v12, v3, v15);
  }
}

uint64_t __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke_291(uint64_t result)
{
  if (*(unsigned char *)(result + 48)
    && !*(unsigned char *)(result + 49)
    && atomic_fetch_add((atomic_ullong *volatile)(*(void *)(result + 32) + 344), 0xFFFFFFFFFFFFFFFFLL) == 1)
  {
    return [*(id *)(result + 40) endSpeakingForClient:*(void *)(result + 32)];
  }
  return result;
}

uint64_t __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithSignal:0];
}

- (void)forceAudioSessionInactive
{
}

- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v20 = "-[NAFConnection forceAudioSessionInactiveWithOptions:completion:]";
    __int16 v21 = 2048;
    id v22 = self;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    _os_log_impl(&dword_25D830000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %lu", buf, 0x20u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__NAFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke;
  v17[3] = &unk_26550E7D8;
  id v18 = v6;
  id v8 = v6;
  BOOL v9 = (void *)MEMORY[0x2611B6890](v17);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __65__NAFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke_2;
  id v15 = &unk_26550E650;
  id v16 = v9;
  id v10 = v9;
  id v11 = [(NAFConnection *)self _clientServiceWithErrorHandler:&v12];
  objc_msgSend(v11, "forceAudioSessionInactiveWithOptions:completion:", a3, v10, v12, v13, v14, v15);
}

uint64_t __65__NAFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__NAFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[NAFConnection forceAudioSessionInactiveWithOptions:completion:]_block_invoke_2";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  id v2 = [(NAFConnection *)self _clientServiceWithErrorHandler:&__block_literal_global_294];
  [v2 resumeInterruptedAudioPlaybackIfNeeded];
}

void __55__NAFConnection_resumeInterruptedAudioPlaybackIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[NAFConnection resumeInterruptedAudioPlaybackIfNeeded]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_impl(&dword_25D830000, v3, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)willPresentUI
{
  id v3 = [(NAFConnection *)self _clientService];
  [v3 willPresentUIWithReply:&__block_literal_global_296];

  id v4 = [(NAFConnection *)self _siriClientStateManager];
  [v4 beginSessionForClient:self->_clientID];
}

void __30__NAFConnection_willPresentUI__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    id v2 = "-[NAFConnection willPresentUI]_block_invoke";
    _os_log_impl(&dword_25D830000, v0, OS_LOG_TYPE_INFO, "%s Received reply.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)didDismissUI
{
  uint64_t v3 = [(NAFConnection *)self _clientService];
  [v3 didDismissUI];

  id v4 = [(NAFConnection *)self _siriClientStateManager];
  [v4 endSessionForClient:self->_clientID];
}

- (void)setLockState:(BOOL)a3 screenLocked:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(NAFConnection *)self _clientService];
  [v6 setLockState:v5 showingLockScreen:v4];
}

- (void)setIsDeviceInStarkMode:(BOOL)a3
{
  BOOL v5 = [(NAFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__NAFConnection_setIsDeviceInStarkMode___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(NAFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __40__NAFConnection_setIsDeviceInStarkMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsDeviceInStarkMode:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  BOOL v5 = [(NAFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__NAFConnection_setSupportsCarPlayVehicleData___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(NAFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __47__NAFConnection_setSupportsCarPlayVehicleData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSupportsCarPlayVehicleData:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setCarDNDActive:(BOOL)a3
{
  BOOL v5 = [(NAFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__NAFConnection_setCarDNDActive___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(NAFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __33__NAFConnection_setCarDNDActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsDeviceInCarDNDMode:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setModesConfiguration:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  getAFFeatureFlagsClass();
  if ([(id)objc_claimAutoreleasedReturnValue() isResponseFrameworkEnabled])
  {
    BOOL v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[NAFConnection setModesConfiguration:]";
      _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s #modes set modesConfiguration", (uint8_t *)&v7, 0xCu);
    }
    id v6 = [(NAFConnection *)self _clientService];
    [v6 setModesConfiguration:v4];
  }
}

- (void)setAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3
{
  BOOL v5 = [(NAFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__NAFConnection_setAnnouncementRequestsPermittedByPresentationWhileActive___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(NAFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __75__NAFConnection_setAnnouncementRequestsPermittedByPresentationWhileActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAreAnnouncementRequestsPermittedByPresentationWhileActive:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setWatchAuthenticated:(BOOL)a3
{
  BOOL v5 = [(NAFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__NAFConnection_setWatchAuthenticated___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(NAFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __39__NAFConnection_setWatchAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsDeviceWatchAuthenticated:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setAccessibilityState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NAFConnection *)self _clientConfiguration];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__NAFConnection_setAccessibilityState___block_invoke;
  v9[3] = &unk_26550E840;
  id v6 = v4;
  id v10 = v6;
  int v7 = [v5 mutatedCopyWithMutator:v9];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v7;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(NAFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __39__NAFConnection_setAccessibilityState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccessibilityState:*(void *)(a1 + 32)];
}

- (void)setDeviceRingerSwitchState:(int64_t)a3
{
  BOOL v5 = [(NAFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__NAFConnection_setDeviceRingerSwitchState___block_invoke;
  v8[3] = &__block_descriptor_40_e41_v16__0___AFClientConfigurationMutating__8l;
  void v8[4] = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(NAFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __44__NAFConnection_setDeviceRingerSwitchState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeviceRingerSwitchState:*(void *)(a1 + 32)];
}

- (void)setShouldWaitForMyriad:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[NAFConnection setShouldWaitForMyriad:]";
    _os_log_impl(&dword_25D830000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setMyriadDecisionResult:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[NAFConnection setMyriadDecisionResult:]";
    _os_log_impl(&dword_25D830000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setVoiceOverIsActive:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 272) = *((unsigned char *)self + 272) & 0xFD | v3;
}

- (void)setConfiguration:(id)a3
{
  int v4 = (AFClientConfiguration *)[a3 copy];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v4;

  *((unsigned char *)self + 272) &= ~1u;
  [(NAFConnection *)self _updateClientConfiguration];
}

- (void)startRequestWithText:(id)a3
{
  id v4 = a3;
  getAFRequestInfoClass();
  id v5 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  [v5 setActivationEvent:5];
  [v5 setText:v4];

  [(NAFConnection *)self _startRequestWithInfo:v5];
}

- (void)startDirectActionRequestWithString:(id)a3
{
  id v4 = a3;
  getAFRequestInfoClass();
  id v5 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  [v5 setActivationEvent:2];
  [v5 setLegacyDirectActionIdentifier:v4];

  [(NAFConnection *)self _startRequestWithInfo:v5];
}

- (void)startContinuationRequestWithUserInfo:(id)a3
{
  id v4 = a3;
  getAFRequestInfoClass();
  id v6 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  id v5 = [v4 objectForKey:@"Data"];

  [v6 setHandoffRequestData:v5];
  [(NAFConnection *)self _startRequestWithInfo:v6];
}

- (void)startRequestWithAceCommand:(id)a3
{
}

- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5
{
}

- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5 turnIdentifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  getAFRequestInfoClass();
  id v14 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  [v14 setActivationEvent:4];
  [v14 setCorrectedSpeech:v13];

  [v14 setCorrectedSpeechContext:v12];
  [v14 setTurnIdentifier:v11];

  id v24 = v10;
  id v15 = [v24 combinedRank];
  [v14 setCombinedRank:v15];

  id v16 = [v24 combinedScore];
  [v14 setCombinedScore:v16];

  id v17 = [v24 interactionId];
  [v14 setInteractionId:v17];

  id v18 = [v24 onDeviceUtterancesPresent];
  [v14 setOnDeviceUtterancesPresent:v18];

  BOOL v19 = [v24 originalRank];
  [v14 setOriginalRank:v19];

  BOOL v20 = [v24 originalScore];
  [v14 setOriginalScore:v20];

  __int16 v21 = [v24 previousUtterance];
  [v14 setPreviousUtterance:v21];

  id v22 = [v24 sessionId];
  [v14 setSessionId:v22];

  __int16 v23 = [v24 utteranceSource];

  [v14 setUtteranceSource:v23];
  [(NAFConnection *)self _startRequestWithInfo:v14];
}

- (void)startRequestWithInfo:(id)a3 activationEvent:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v7;
    BOOL v9 = AFActivationEventGetDescription();
    int v10 = 136315650;
    id v11 = "-[NAFConnection startRequestWithInfo:activationEvent:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_25D830000, v8, OS_LOG_TYPE_INFO, "%s Overriding activation event in info %@ %@", (uint8_t *)&v10, 0x20u);
  }
  [v6 setActivationEvent:a4];
  [(NAFConnection *)self _startRequestWithInfo:v6];
}

- (void)_startRequestWithInfo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v21 = "-[NAFConnection _startRequestWithInfo:]";
    __int16 v22 = 2048;
    __int16 v23 = self;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  if ([v4 activationEvent] == 2)
  {
    id v6 = [v4 speechRequestOptions];
    uint64_t v7 = [v6 activationEvent];

    if (v7 == 9) {
      kdebug_trace();
    }
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __39__NAFConnection__startRequestWithInfo___block_invoke;
  v17[3] = &unk_26550E888;
  id v18 = v4;
  BOOL v19 = self;
  id v8 = v4;
  [(NAFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:0 speechRequestOptions:0 requestInfo:v8 analyticsEventProvider:v17];
  BOOL v9 = self->_activeRequestUUID;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__NAFConnection__startRequestWithInfo___block_invoke_2;
  v15[3] = &unk_26550E8D8;
  void v15[4] = self;
  int v10 = v9;
  uint64_t v16 = v10;
  id v11 = [(NAFConnection *)self _clientServiceWithErrorHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__NAFConnection__startRequestWithInfo___block_invoke_2_305;
  v13[3] = &unk_26550E8D8;
  void v13[4] = self;
  __int16 v14 = v10;
  __int16 v12 = v10;
  [v11 startRequestWithInfo:v8 completion:v13];
}

uint64_t __39__NAFConnection__startRequestWithInfo___block_invoke(uint64_t a1, void *a2)
{
  v22[3] = *MEMORY[0x263EF8340];
  id v18 = a2;
  [*(id *)(a1 + 32) activationEvent];
  char v3 = AFAnalyticsContextCreateWithRequestInfo();
  v22[0] = v3;
  v20[0] = @"unixTime";
  id v4 = NSNumber;
  id v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSince1970];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  v21[0] = v6;
  v20[1] = @"id";
  uint64_t v7 = [v18 UUIDString];
  v21[1] = v7;
  v20[2] = @"systemVersion";
  id v8 = WL_AFProductAndBuildVersion();
  v21[2] = v8;
  BOOL v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  v22[1] = v9;
  int v10 = [*(id *)(a1 + 40) _startRequestMetricSettings];
  v22[2] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  __int16 v12 = AFAnalyticsContextsMerge();

  if (WL_AFIsInternalInstall())
  {
    v19[0] = v12;
    id v13 = AFAnalyticsTurnContextCreateWithRequestInfo();
    v19[1] = v13;
    __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    uint64_t v15 = AFAnalyticsContextsMerge();

    __int16 v12 = (void *)v15;
  }
  uint64_t v16 = AFAnalyticsEventCreateCurrent();
  [*(id *)(a1 + 32) activationEvent];

  return v16;
}

void __39__NAFConnection__startRequestWithInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[NAFConnection _startRequestWithInfo:]_block_invoke_2";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  id v5 = [MEMORY[0x263F28508] errorWithCode:7 description:0 underlyingError:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__NAFConnection__startRequestWithInfo___block_invoke_304;
  block[3] = &unk_26550E8B0;
  void block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __39__NAFConnection__startRequestWithInfo___block_invoke_304(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:4 error:*(void *)(a1 + 48)];
}

void __39__NAFConnection__startRequestWithInfo___block_invoke_2_305(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v5 = &stru_270A7CBE8;
    if (v3) {
      id v5 = v3;
    }
    *(_DWORD *)buf = 136315394;
    id v13 = "-[NAFConnection _startRequestWithInfo:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s Complete %@", buf, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__NAFConnection__startRequestWithInfo___block_invoke_309;
  block[3] = &unk_26550E8B0;
  void block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v7, block);
}

uint64_t __39__NAFConnection__startRequestWithInfo___block_invoke_309(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:2 error:*(void *)(a1 + 48)];
}

- (id)_startRequestMetricSettings
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = self->_preferences;
  id v5 = [(AFPreferences *)v4 languageCode];
  if (v5) {
    [v3 setValue:v5 forKey:@"siriInputLanguage"];
  }
  if ((WL_AFIsHorseman() & 1) == 0)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = [NSNumber numberWithBool:WL_AFPreferencesTypeToSiriEnabled()];
    [v6 setObject:v7 forKey:@"typeToSiri"];

    id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[AFPreferences alwaysShowRecognizedSpeech](v4, "alwaysShowRecognizedSpeech"));
    [v6 setObject:v8 forKey:@"showRecognizedSpeech"];

    BOOL v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AFPreferences siriResponseShouldAlwaysPrint](v4, "siriResponseShouldAlwaysPrint"));
    [v6 setObject:v9 forKey:@"captionVoiceFeedback"];

    id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[AFPreferences alwaysObscureBackgroundContentWhenActive](v4, "alwaysObscureBackgroundContentWhenActive"));
    [v6 setObject:v10 forKey:@"hideBackgroundContent"];

    id v11 = [(NAFConnection *)self _metricContextValueForUseDeviceSpeakerForTTS:[(AFPreferences *)v4 useDeviceSpeakerForTTS]];
    if (v11) {
      [v6 setObject:v11 forKey:@"useSpeakerForTTS"];
    }
    [v3 setValue:v6 forKey:@"requestSettings"];
  }
  return v3;
}

- (id)_metricContextValueForUseDeviceSpeakerForTTS:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_26550EC68[a3 - 1];
  }
}

- (void)_startRequestWithAceCommand:(id)a3 turnIdentifier:(id)a4 suppressAlert:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  getAFRequestInfoClass();
  id v9 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  [v9 setActivationEvent:0];
  [v9 setTurnIdentifier:v8];

  if (v5) {
    [v9 setOptions:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 setStartLocalRequest:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 setStartRequest:v10];
    }
  }
  [(NAFConnection *)self _startRequestWithInfo:v9];
}

- (void)startSpeechRequestWithOptions:(id)a3
{
  id v3 = [(NAFConnection *)self startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:a3];
  v3[2]();
}

- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = [(NAFConnection *)self startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:a3];
  v6[2](v6, v7);
}

- (id)startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v39 = "-[NAFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]";
    __int16 v40 = 2048;
    __int16 v41 = self;
    __int16 v42 = 2112;
    id v43 = v4;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x263F283F0], "logSiriInvokedVia:", objc_msgSend(v4, "activationEvent"));
  id v6 = [(NAFConnection *)self _siriClientStateManager];
  [v6 beginTransaction];

  [(NAFConnection *)self _checkAndSetIsCapturingSpeech:1];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke;
  v35[3] = &unk_26550E888;
  id v7 = v4;
  id v36 = v7;
  __int16 v37 = self;
  [(NAFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:1 speechRequestOptions:v7 requestInfo:0 analyticsEventProvider:v35];
  unint64_t pendingSpeechRequestCounter = self->_pendingSpeechRequestCounter;
  self->_unint64_t pendingSpeechRequestCounter = pendingSpeechRequestCounter + 1;
  id v9 = self->_activeRequestUUID;
  kdebug_trace();
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2;
  v33[3] = &unk_26550E8D8;
  v33[4] = self;
  id v10 = v9;
  double v34 = v10;
  id v11 = [(NAFConnection *)self _clientServiceWithErrorHandler:v33];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2_323;
  v31[3] = &unk_26550E8D8;
  void v31[4] = self;
  __int16 v12 = v10;
  double v32 = v12;
  [v11 startRecordingForPendingSpeechRequestWithOptions:v7 requestId:pendingSpeechRequestCounter sessionUUID:v12 completion:v31];

  if ([v7 pendCallbacksUntilAfterContinuation])
  {
    id v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    id v14 = objc_alloc(MEMORY[0x263F285B8]);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_4;
    v29[3] = &unk_26550E900;
    id v15 = v13;
    id v30 = v15;
    uint64_t v16 = (void *)[v14 initWithBlock:v29];
    speechCallbackGroup = self->_speechCallbackGroup;
    self->_speechCallbackGroup = (OS_dispatch_group *)v15;
    id v18 = v15;
  }
  else
  {
    uint64_t v16 = 0;
    id v18 = self->_speechCallbackGroup;
    self->_speechCallbackGroup = 0;
  }

  BOOL v19 = [(NAFConnection *)self _siriClientStateManager];
  [v19 endTransaction];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_5;
  v24[3] = &unk_26550E928;
  id v25 = v7;
  uint64_t v26 = self;
  id v27 = v16;
  unint64_t v28 = pendingSpeechRequestCounter;
  id v20 = v16;
  id v21 = v7;
  __int16 v22 = (void *)MEMORY[0x2611B6890](v24);

  return v22;
}

uint64_t __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void v21[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = AFAnalyticsContextCreateWithSpeechRequestOptions();
  v21[0] = v4;
  v19[0] = @"unixTime";
  BOOL v5 = NSNumber;
  id v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v19[1] = @"id";
  v20[0] = v7;
  id v8 = [v3 UUIDString];
  v20[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v21[1] = v9;
  id v10 = [*(id *)(a1 + 40) _startRequestMetricSettings];
  v21[2] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  __int16 v12 = AFAnalyticsContextsMerge();

  if (WL_AFIsInternalInstall())
  {
    v18[0] = v12;
    id v13 = AFAnalyticsTurnContextCreateWithSpeechRequestOptions();
    v18[1] = v13;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    uint64_t v15 = AFAnalyticsContextsMerge();

    __int16 v12 = (void *)v15;
  }
  uint64_t v16 = AFAnalyticsEventCreateCurrent();

  return v16;
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[NAFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke_2";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  BOOL v5 = [MEMORY[0x263F28508] errorWithCode:7 description:0 underlyingError:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_322;
  block[3] = &unk_26550E8B0;
  void block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_322(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:4 error:*(void *)(a1 + 48)];
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2_323(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_3;
  block[3] = &unk_26550E8B0;
  void block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:2 error:*(void *)(a1 + 48)];
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_4(uint64_t a1)
{
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  [v2 systemUptime];
  double v4 = v3;

  BOOL v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[NAFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke_5";
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s Continuing pending speech request %p", buf, 0x16u);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_325;
  v9[3] = &unk_26550E738;
  id v7 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v8 = [v7 _clientServiceWithErrorHandler:v9];
  [v8 continuePendingSpeechRequestWithId:*(void *)(a1 + 56) fromTimestamp:v4];

  [*(id *)(a1 + 48) invoke];
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_325(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_325_cold_1();
  }
}

- (void)startSpeechPronunciationRequestWithOptions:(id)a3 pronunciationContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v24 = "-[NAFConnection startSpeechPronunciationRequestWithOptions:pronunciationContext:]";
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_25D830000, v9, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  [(NAFConnection *)self _checkAndSetIsCapturingSpeech:1];
  id v10 = [v7 serverCommandId];

  if (v10)
  {
    id v11 = NSStringFromSelector(a2);
    [(NAFConnection *)self _extendRequestTimeoutForReason:v11 durationInSeconds:0.0];
  }
  else
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    void v20[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke;
    void v20[3] = &unk_26550E888;
    id v21 = v7;
    __int16 v22 = self;
    [(NAFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:1 speechRequestOptions:v21 requestInfo:0 analyticsEventProvider:v20];
    id v11 = v21;
  }

  __int16 v12 = self->_activeRequestUUID;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2;
  v18[3] = &unk_26550E8D8;
  void v18[4] = self;
  __int16 v13 = v12;
  BOOL v19 = v13;
  uint64_t v14 = [(NAFConnection *)self _clientServiceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2_327;
  v16[3] = &unk_26550E8D8;
  void v16[4] = self;
  id v17 = v13;
  uint64_t v15 = v13;
  [v14 startSpeechPronunciationRequestWithOptions:v7 context:v8 completion:v16];
}

uint64_t __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke(uint64_t a1, void *a2)
{
  void v21[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = AFAnalyticsContextCreateWithSpeechRequestOptions();
  v21[0] = v4;
  v19[0] = @"unixTime";
  BOOL v5 = NSNumber;
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v19[1] = @"id";
  v20[0] = v7;
  id v8 = [v3 UUIDString];
  v20[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v21[1] = v9;
  id v10 = [*(id *)(a1 + 40) _startRequestMetricSettings];
  v21[2] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  __int16 v12 = AFAnalyticsContextsMerge();

  if (WL_AFIsInternalInstall())
  {
    v18[0] = v12;
    __int16 v13 = AFAnalyticsTurnContextCreateWithSpeechRequestOptions();
    v18[1] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    uint64_t v15 = AFAnalyticsContextsMerge();

    __int16 v12 = (void *)v15;
  }
  uint64_t v16 = AFAnalyticsEventCreateCurrent();

  return v16;
}

void __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[NAFConnection startSpeechPronunciationRequestWithOptions:pronunciationContext:]_block_invoke_2";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  BOOL v5 = [MEMORY[0x263F28508] errorWithCode:7 description:0 underlyingError:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_326;
  block[3] = &unk_26550E8B0;
  void block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_326(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:4 error:*(void *)(a1 + 48)];
}

void __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2_327(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_3;
  block[3] = &unk_26550E8B0;
  void block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:2 error:*(void *)(a1 + 48)];
}

- (void)startAcousticIDRequestWithOptions:(id)a3
{
  id v4 = a3;
  [(NAFConnection *)self _checkAndSetIsCapturingSpeech:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke;
  v14[3] = &unk_26550E888;
  id v15 = v4;
  uint64_t v16 = self;
  id v5 = v4;
  [(NAFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:1 speechRequestOptions:v5 requestInfo:0 analyticsEventProvider:v14];
  id v6 = self->_activeRequestUUID;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_2;
  v12[3] = &unk_26550E8D8;
  void v12[4] = self;
  id v7 = v6;
  __int16 v13 = v7;
  id v8 = [(NAFConnection *)self _clientServiceWithErrorHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_2_329;
  v10[3] = &unk_26550E8D8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 startAcousticIDRequestWithOptions:v5 context:0 completion:v10];
}

uint64_t __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void v21[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = AFAnalyticsContextCreateWithSpeechRequestOptions();
  v21[0] = v4;
  v19[0] = @"unixTime";
  id v5 = NSNumber;
  id v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v19[1] = @"id";
  v20[0] = v7;
  id v8 = [v3 UUIDString];
  v20[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v21[1] = v9;
  id v10 = [*(id *)(a1 + 40) _startRequestMetricSettings];
  v21[2] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  __int16 v12 = AFAnalyticsContextsMerge();

  if (WL_AFIsInternalInstall())
  {
    v18[0] = v12;
    __int16 v13 = AFAnalyticsTurnContextCreateWithSpeechRequestOptions();
    v18[1] = v13;
    __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    uint64_t v15 = AFAnalyticsContextsMerge();

    __int16 v12 = (void *)v15;
  }
  uint64_t v16 = AFAnalyticsEventCreateCurrent();

  return v16;
}

void __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[NAFConnection startAcousticIDRequestWithOptions:]_block_invoke_2";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_25D830000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  id v5 = [MEMORY[0x263F28508] errorWithCode:7 description:0 underlyingError:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_328;
  block[3] = &unk_26550E8B0;
  void block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_328(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:4 error:*(void *)(a1 + 48)];
}

void __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_2_329(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_3;
  block[3] = &unk_26550E8B0;
  void block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:2 error:*(void *)(a1 + 48)];
}

- (void)cancelSpeech
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[NAFConnection cancelSpeech]";
    __int16 v6 = 2048;
    id v7 = self;
    _os_log_impl(&dword_25D830000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  [(NAFConnection *)self cancelRequest];
}

- (void)cancelRequest
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[NAFConnection cancelRequest]";
    __int16 v6 = 2048;
    id v7 = self;
    _os_log_impl(&dword_25D830000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  [(NAFConnection *)self cancelRequestForReason:13];
}

- (void)cancelRequestForReason:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[NAFConnection cancelRequestForReason:]";
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s reason = %ld", (uint8_t *)&v9, 0x16u);
  }
  __int16 v6 = [(NAFConnection *)self _siriClientStateManager];
  [v6 beginTransaction];

  [(NAFConnection *)self _willCancelRequest];
  [(NAFConnection *)self _requestDidEnd];
  [(NAFConnection *)self _checkAndSetIsCapturingSpeech:0];
  id v7 = [(NAFConnection *)self _clientService];
  [v7 cancelRequestForReason:a3 withError:0];

  uint64_t v8 = [(NAFConnection *)self _siriClientStateManager];
  [v8 endTransaction];
}

- (void)failRequestWithError:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    -[NAFConnection failRequestWithError:]();
  }
  id v5 = [(NAFConnection *)self _siriClientStateManager];
  [v5 beginTransaction];

  __int16 v6 = [v4 domain];
  uint64_t v7 = *MEMORY[0x263F28730];
  if (![v6 isEqualToString:*MEMORY[0x263F28730]]) {
    goto LABEL_8;
  }
  uint64_t v8 = [v4 code];

  if (v8 == 1)
  {
    if (self->_lastRetryError)
    {
      int v9 = [v4 userInfo];
      id v10 = [v9 objectForKey:*MEMORY[0x263F08608]];

      if (!v10)
      {
        [MEMORY[0x263F28508] errorWithCode:1 description:v7 underlyingError:self->_lastRetryError];
        __int16 v6 = v4;
        id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      }
    }
  }
  [(NAFConnection *)self _willFailRequestWithError:v4];
  [(NAFConnection *)self _requestDidEnd];
  [(NAFConnection *)self _checkAndSetIsCapturingSpeech:0];
  __int16 v11 = [(NAFConnection *)self _clientService];
  [v11 cancelRequestForReason:3 withError:v4];

  int64_t v12 = [(NAFConnection *)self _siriClientStateManager];
  [v12 endTransaction];
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if (WL_AFIsInternalInstall())
  {
    int v9 = [(NAFConnection *)self _clientService];
    [v9 reportIssueForError:v10 type:a4 context:v8];
  }
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6
{
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  if (WL_AFIsInternalInstall())
  {
    int64_t v12 = [(NAFConnection *)self _clientService];
    [v12 reportIssueForError:v13 type:a4 subtype:v10 context:v11];
  }
}

- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (WL_AFIsInternalInstall())
  {
    id v10 = [(NAFConnection *)self _clientService];
    [v10 reportIssueForType:v11 subtype:v8 context:v9];
  }
}

- (void)stopSpeech
{
}

- (void)stopSpeechWithOptions:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    __int16 v14 = "-[NAFConnection stopSpeechWithOptions:]";
    __int16 v15 = 2048;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v13, 0x20u);
  }
  [(NAFConnection *)self _checkAndSetIsCapturingSpeech:0];
  analytics = self->_analytics;
  uint64_t v7 = AFAnalyticsContextCreateWithSpeechRequestOptions();
  [(AFAnalytics *)analytics logEventWithType:1910 context:v7 contextNoCopy:0];

  id v8 = [(NAFConnection *)self _clientService];
  [v8 stopSpeechWithOptions:v4];

  if (self->_activeRequestType == 1 && self->_activeRequestStopSpeechTimeAPICalled == 0.0)
  {
    id v9 = [MEMORY[0x263F08AB0] processInfo];
    [v9 systemUptime];
    self->_activeRequestStopSpeechTimeAPICalled = v10;

    if (v4)
    {
      if ([v4 stopRecordingHostTime])
      {
        [v4 stopRecordingHostTime];
      }
      else
      {
        [v4 activationEventTime];
        if (v12 > 0.0)
        {
          [v4 activationEventTime];
          goto LABEL_11;
        }
        if (![v4 activationEventMachAbsoluteTime]) {
          goto LABEL_12;
        }
        [v4 activationEventMachAbsoluteTime];
      }
      AFMachAbsoluteTimeGetTimeInterval();
LABEL_11:
      self->_activeRequestStopSpeechTimeRequested = v11;
    }
  }
LABEL_12:
}

- (void)updateSpeechOptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    double v10 = "-[NAFConnection updateSpeechOptions:]";
    __int16 v11 = 2048;
    double v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_25D830000, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v9, 0x20u);
  }
  analytics = self->_analytics;
  uint64_t v7 = AFAnalyticsContextCreateWithSpeechRequestOptions();
  [(AFAnalytics *)analytics logEventWithType:1909 context:v7 contextNoCopy:0];

  id v8 = [(NAFConnection *)self _clientService];
  [v8 updateSpeechOptions:v4];
}

- (void)rollbackClearContext
{
  id v2 = [(NAFConnection *)self _clientService];
  [v2 rollbackClearContext];
}

- (void)rollbackRequest
{
  id v3 = NSStringFromSelector(a2);
  [(NAFConnection *)self _cancelRequestTimeoutForReason:v3];

  id v4 = [(NAFConnection *)self _clientService];
  [v4 rollbackRequest];
}

- (BOOL)isRecording
{
  return (*((unsigned __int8 *)self + 216) >> 2) & 1;
}

- (BOOL)hasActiveRequest
{
  return self->_activeRequestType != 0;
}

- (BOOL)shouldSpeak
{
  return (*((unsigned __int8 *)self + 216) >> 1) & 1;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (float)averagePower
{
  [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater _unsafeAveragePower];
  return result;
}

- (float)peakPower
{
  [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater _unsafePeakPower];
  return result;
}

- (void)sendGenericAceCommand:(id)a3
{
}

- (void)sendGenericAceCommand:(id)a3 conflictHandler:(id)a4
{
}

- (void)sendGenericAceCommand:(id)a3 turnIdentifier:(id)a4 conflictHandler:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v34 = a4;
  id v9 = a5;
  if (v8)
  {
    double v10 = [v8 aceId];

    if (!v10)
    {
      __int16 v11 = [MEMORY[0x263F08C38] UUID];
      double v12 = [v11 UUIDString];

      __int16 v13 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v45 = "-[NAFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:]";
        __int16 v46 = 2112;
        v47 = v12;
        _os_log_impl(&dword_25D830000, v13, OS_LOG_TYPE_INFO, "%s passed command without ACE ID; inventing one (%@)",
          buf,
          0x16u);
      }
      [v8 setAceId:v12];
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v30 = v8;
    if (isKindOfClass)
    {
      uint64_t v15 = [v8 commands];
    }
    else
    {
      id v43 = v8;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v39;
      uint64_t v33 = *MEMORY[0x263F65CB8];
      uint64_t v31 = *MEMORY[0x263F65CB0];
      unsigned int v32 = isKindOfClass & 1;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(id *)(*((void *)&v38 + 1) + 8 * i);
          id v21 = [v20 encodedClassName];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v20;
            objc_opt_class();
            LOBYTE(v23) = objc_opt_isKindOfClass();
          }
          else
          {
            if (([v21 isEqualToString:v33] & 1) == 0
              && ![v21 isEqualToString:v31])
            {
              LOBYTE(v23) = 0;
LABEL_22:
              id v22 = 0;
              goto LABEL_25;
            }
            uint64_t v23 = objc_opt_class();
            if (!v23) {
              goto LABEL_22;
            }
            if (objc_opt_isKindOfClass())
            {
              id v22 = v20;
            }
            else
            {
              id v24 = objc_alloc((Class)v23);
              __int16 v25 = [v20 dictionary];
              id v22 = (id)[v24 initWithDictionary:v25];
            }
            LOBYTE(v23) = 0;
          }
LABEL_25:

          if (!v22 || (v23 & 1) != 0)
          {
            if (v23)
            {
              id v26 = *MEMORY[0x263F28348];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v45 = "-[NAFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:]";
                _os_log_impl(&dword_25D830000, v26, OS_LOG_TYPE_INFO, "%s Performing BackgroundUpdateRequest outside normal request processing flow.", buf, 0xCu);
              }
              __int16 v27 = [v20 encodedClassName];
              [(NAFConnection *)self _requestWillBeginWithRequestClass:v27 isSpeechRequest:0 speechRequestOptions:0 requestInfo:0 isBackgroundRequest:1 analyticsEventProvider:0];
            }
            id v28 = [(NAFConnection *)self _clientService];
            uint64_t v29 = [v20 dictionary];
            v36[0] = MEMORY[0x263EF8330];
            v36[1] = 3221225472;
            v36[2] = __70__NAFConnection_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke;
            v36[3] = &unk_26550E950;
            id v37 = v9;
            [v28 performGenericAceCommand:v29 interruptOutstandingRequest:v9 == 0 reply:v36];
          }
          else
          {
            [(NAFConnection *)self _startRequestWithAceCommand:v22 turnIdentifier:v34 suppressAlert:v32];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v17);
    }

    id v8 = v30;
  }
}

uint64_t __70__NAFConnection_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    float result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)sendReplyCommand:(id)a3
{
  id v7 = a3;
  id v4 = [v7 refId];
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_replyHandlerForAceId objectForKey:v4];
    __int16 v6 = (void *)v5;
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
      [(NSMutableDictionary *)self->_replyHandlerForAceId removeObjectForKey:v4];
    }
  }
}

- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NAFConnection *)self _clientService];
  [v8 getDeferredObjectsWithIdentifiers:v7 completion:v6];
}

- (void)getCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NAFConnection *)self _clientService];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__NAFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke;
  v10[3] = &unk_26550E978;
  id v11 = v6;
  id v9 = v6;
  [v8 getSerializedCachedObjectsWithIdentifiers:v7 completion:v10];
}

uint64_t __60__NAFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__NAFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke;
    v10[3] = &unk_26550E650;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(NAFConnection *)self _clientServiceWithErrorHandler:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__NAFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke_2;
    v8[3] = &unk_26550E9A0;
    id v9 = v6;
    [v7 getRemoteClockTimerSnapshotWithCompletion:v8];
  }
}

uint64_t __59__NAFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__NAFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearContext
{
  id v2 = [(NAFConnection *)self _clientService];
  [v2 clearContext];
}

- (void)willSetApplicationContextWithRefId:(id)a3
{
  id v4 = a3;
  id v5 = [(NAFConnection *)self _clientService];
  [v5 willSetApplicationContextWithRefId:v4];
}

- (void)setApplicationContext:(id)a3
{
  id v4 = a3;
  id v5 = [(NAFConnection *)self _clientService];
  [v5 setApplicationContext:v4];
}

- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NAFConnection *)self _clientService];
  [v11 fetchAppicationContextForApplicationInfo:v10 supplementalContext:v9 refID:v8];
}

- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NAFConnection *)self _clientService];
  [v8 fetchAppicationContextForApplicationInfo:v7 supplementalContext:0 refID:v6];
}

- (void)setApplicationContextForApplicationInfos:(id)a3
{
  id v4 = a3;
  id v5 = [(NAFConnection *)self _clientService];
  [v5 fetchAppicationContextForApplicationInfo:v4 supplementalContext:0 refID:0];
}

- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NAFConnection *)self _clientService];
  [v8 setOverriddenApplicationContext:v7 withContext:v6];
}

- (void)setAlertContextWithBulletins:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  cachedBulletins = self->_cachedBulletins;
  self->_cachedBulletins = v4;

  id v6 = [(NAFConnection *)self _clientService];
  [v6 setAlertContextDirty];
}

- (void)prepareForPhoneCall
{
  id v2 = [(NAFConnection *)self _clientService];
  [v2 prepareForPhoneCall];
}

- (void)telephonyRequestCompleted
{
  id v2 = [(NAFConnection *)self _clientService];
  [v2 telephonyRequestCompleted];
}

- (void)usefulUserResultWillPresent
{
}

- (void)willPresentUsefulUserResultWithType:(int64_t)a3
{
}

- (void)willPresentUsefulUserResultWithType:(int64_t)a3 forCommand:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  analytics = self->_analytics;
  id v7 = AFAnalyticsContextCreateWithCommand();
  [(AFAnalytics *)analytics logEventWithType:1420 context:v7];

  if (self->_uufrID && self->_activeRequestUUID && self->_activeRequestType)
  {
    id v8 = (id)*MEMORY[0x263F28348];
    id v9 = v8;
    os_signpost_id_t uufrID = self->_uufrID;
    if (uufrID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      int v11 = 136315394;
      double v12 = "SiriX";
      __int16 v13 = 2080;
      id v14 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_25D830000, v9, OS_SIGNPOST_INTERVAL_END, uufrID, "UsefulUserFacingResults", "%s %s", (uint8_t *)&v11, 0x16u);
    }
  }
  [(NAFConnection *)self _willPresentUsefulUserResultWithType:a3];
}

- (void)checkLanguageReady:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __62__NAFConnection_startAudioPlaybackRequest_options_completion___block_invoke;
  uint64_t v16 = &unk_26550E9C8;
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  double v12 = [(NAFConnection *)self _clientServiceWithErrorHandler:&v13];
  objc_msgSend(v12, "startAudioPlaybackRequest:options:reply:", v11, a4, v10, v13, v14, v15, v16);
}

void __62__NAFConnection_startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __62__NAFConnection_startAudioPlaybackRequest_options_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NAFConnection *)self _clientService];
  [v7 stopAudioPlaybackRequest:v6 immediately:v4];
}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NAFConnection *)self _clientService];
  [v4 stopAllAudioPlaybackRequests:v3];
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(NAFConnection *)self _clientService];
  [v5 updateSpeechSynthesisRecord:v4];
}

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NAFConnection *)self _clientService];
  [v4 adviseSessionArbiterToContinueWithPreviousWinner:v3];
}

- (void)_speechRecordingDidFailWithError:(id)a3
{
  id v6 = a3;
  if (self->_activeRequestType == 1)
  {
    id v5 = NSStringFromSelector(a2);
    [(NAFConnection *)self _cancelRequestTimeoutForReason:v5];
  }
  [(NAFConnection *)self _updateStateIfNotInSync];
  [(NAFConnection *)self _checkAndSetIsCapturingSpeech:0];
  [(NAFConnection *)self _tellSpeechDelegateRecordingDidFail:v6];
}

- (void)_willStopRecordingWithSignpostID:(unint64_t)a3
{
  self->_os_signpost_id_t uufrID = a3;
}

- (id)acquireUserInteractionAssertion
{
  return 0;
}

- (NAFAssistantUIService)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NAFAssistantUIService *)WeakRetained;
}

- (NAFSpeechDelegate)speechDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
  return (NAFSpeechDelegate *)WeakRetained;
}

- (void)setSpeechDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_speechDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_siriClientStateManager, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_speechCallbackGroup, 0);
  objc_storeStrong((id *)&self->_lastRetryError, 0);
  objc_storeStrong((id *)&self->_interstitialCommandQueue, 0);
  objc_storeStrong((id *)&self->_interstitialProvider, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_playbackRoute, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_replyHandlerForAceId, 0);
  objc_storeStrong((id *)&self->_activeTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_activeRequestUUID, 0);
  objc_storeStrong((id *)&self->_cachedBulletins, 0);
  objc_storeStrong((id *)&self->_initiationCallSiteInfo, 0);
  objc_storeStrong((id *)&self->_outstandingRequestClass, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3
{
}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3 isNarrowBand:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(NAFConnection *)self _checkAndSetIsCapturingSpeech:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__NAFConnection_Private__startSpeechRequestWithSpeechFileAtURL_isNarrowBand___block_invoke;
  v8[3] = &unk_26550E9F0;
  BOOL v9 = v4;
  void v8[4] = self;
  [(NAFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:1 speechRequestOptions:0 requestInfo:0 analyticsEventProvider:v8];
  id v7 = [(NAFConnection *)self _clientService];
  [v7 _startSpeechWithURL:v6 isNarrowBand:v4];
}

uint64_t __77__NAFConnection_Private__startSpeechRequestWithSpeechFileAtURL_isNarrowBand___block_invoke(uint64_t a1, void *a2)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v16[0] = @"File";
  v15[0] = @"speechEvent";
  v15[1] = @"isNarrowBand";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v16[1] = v4;
  v15[2] = @"unixTime";
  id v5 = NSNumber;
  id v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v16[2] = v7;
  v15[3] = @"id";
  id v8 = [v3 UUIDString];
  v16[3] = v8;
  BOOL v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v17[0] = v9;
  id v10 = [*(id *)(a1 + 32) _startRequestMetricSettings];
  v17[1] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  double v12 = AFAnalyticsContextsMerge();
  uint64_t v13 = AFAnalyticsEventCreateCurrent();

  return v13;
}

- (void)requestBarrier:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__NAFConnection_Private__requestBarrier___block_invoke;
  v7[3] = &unk_26550E650;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(NAFConnection *)self _clientServiceWithErrorHandler:v7];
  [v6 _requestBarrierWithReply:v5];
}

uint64_t __41__NAFConnection_Private__requestBarrier___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestBarrierIfNecessary:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__NAFConnection_Private__requestBarrierIfNecessary___block_invoke;
  v7[3] = &unk_26550E650;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(NAFConnection *)self _clientServiceWithErrorHandler:v7];
  [v6 _requestBarrierIfNecessaryWithReply:v5];
}

uint64_t __52__NAFConnection_Private__requestBarrierIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)broadcastCommandDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(NAFConnection *)self _clientService];
  [v5 _broadcastCommandDictionary:v4];
}

- (id)_activeRequestUUID
{
  return self->_activeRequestUUID;
}

- (void)_barrier
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__NAFConnection_Internal___barrier__block_invoke;
  v10[3] = &unk_26550E738;
  id v4 = v3;
  id v11 = v4;
  id v5 = [(NAFConnection *)self _clientServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__NAFConnection_Internal___barrier__block_invoke_2;
  v8[3] = &unk_26550E2A0;
  BOOL v9 = v4;
  id v6 = v4;
  [v5 _barrierWithReply:v8];

  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v6, v7);
}

intptr_t __35__NAFConnection_Internal___barrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __35__NAFConnection_Internal___barrier__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_clearAssistantInfoForAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NAFConnection *)self _clientService];
  [v5 _clearAssistantInfoForAccountIdentifier:v4];
}

- (id)_clientService
{
  id v2 = [(NAFConnection *)self _connection];
  dispatch_semaphore_t v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_clientServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NAFConnection *)self _connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_cachedBulletins
{
  return self->_cachedBulletins;
}

- (id)_clientConfiguration
{
  clientConfiguration = self->_clientConfiguration;
  if (!clientConfiguration)
  {
    id v4 = [MEMORY[0x263F283E0] sharedObserver];
    id v5 = [MEMORY[0x263F284D0] sharedObserver];
    getAFClientConfigurationClass();
    id v6 = objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue());
    dispatch_time_t v7 = [v4 currentState];
    LOBYTE(v12) = 0;
    id v8 = (AFClientConfiguration *)objc_msgSend(v6, "initWithAccessibilityState:deviceRingerSwitchState:isDeviceInCarDNDMode:isDeviceInStarkMode:supportsCarPlayVehicleData:isDeviceWatchAuthenticated:areAnnouncementRequestsPermittedByPresentationWhileActive:outputVolume:tapToSiriAudioPlaybackRequest:twoShotAudioPlaybackRequest:deviceSetupFlowBeginDate:deviceSetupFlowEndDate:", v7, objc_msgSend(v5, "state"), 0, 0, 0, 0, 0.0, v12, 0, 0, 0, 0);
    BOOL v9 = self->_clientConfiguration;
    self->_clientConfiguration = v8;

    *((unsigned char *)self + 272) &= ~1u;
    clientConfiguration = self->_clientConfiguration;
  }
  id v10 = (void *)[(AFClientConfiguration *)clientConfiguration copy];
  return v10;
}

- (void)_handleCommand:reply:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_25D830000, v0, v1, "%s Ignored command %@ because it is an interstitial but there's no active request or active request has presented UUFR already.", v2, v3, v4, v5, 2u);
}

- (void)_handleCommand:reply:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_25D830000, v0, v1, "%s Enqueued command %@ because it is an interstitial and active request has not presented UUFR yet.", v2, v3, v4, v5, 2u);
}

- (void)_dispatchCommand:(void *)a3 isInterstitial:interstitialPhase:interstitialDelay:reply:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  id v6 = [a3 encodedClassName];
  int v7 = 136315650;
  id v8 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_25D830000, v5, OS_LOG_TYPE_ERROR, "%s no delegate method on %@ to handle command: %@", (uint8_t *)&v7, 0x20u);
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_25D830000, v0, v1, "%s The requestId=%@ is malformed, unable to log SELF command", v2, v3, v4, v5, 2u);
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_25D830000, v0, v1, "%s The requestId=%@ is malformed, unable to log SELF command", v2, v3, v4, v5, 2u);
}

- (void)_setShouldSpeak:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[NAFConnection _setShouldSpeak:]";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_25D830000, a2, OS_LOG_TYPE_DEBUG, "%s shouldSpeak = %d", (uint8_t *)&v2, 0x12u);
}

- (void)_setAudioSessionID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_25D830000, v0, v1, "%s audioSessionID = %lu", v2, v3, v4, v5, 2u);
}

- (void)_updateSpeechEndHostTime:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_25D830000, v0, v1, "%s Skipped timing adjustment because %lu interstitials have been presented.", v2, v3, v4, v5, 2u);
}

- (void)_updateSpeechEndHostTime:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateSpeechEndHostTime:.cold.3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_25D830000, v0, v1, "%s updating speech end host time: %llu", v2, v3, v4, v5, 2u);
}

- (void)_updateSpeechEndHostTime:.cold.4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_25D830000, v0, v1, "%s Unable to update speech end host time. (_int64_t activeRequestType = %zd, _activeRequestUUID = %@)", v2);
}

- (void)_connectionFailedWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestDidAskForTimeoutExtension:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_25D830000, v0, v1, "%s durationInSeconds: %f", v2, v3, v4, v5, 2u);
}

- (void)_scheduleRequestTimeoutForReason:durationInSeconds:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_25D830000, v0, v1, "%s Using timeout interval of %f seconds based on UserDefaults", v2, v3, v4, v5, 2u);
}

- (void)_scheduleRequestTimeoutForReason:(uint64_t)a3 durationInSeconds:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_willStartRequestWithSpeech:(os_log_t)log speechRequestOptions:requestInfo:analyticsEventProvider:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
  _os_log_debug_impl(&dword_25D830000, log, OS_LOG_TYPE_DEBUG, "%s Logging TurnMTE From _willStartRequestWithSpeech", (uint8_t *)&v1, 0xCu);
}

- (void)_willFailRequestWithError:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_25D830000, v0, v1, "%s error is nil. Instrumentation logging is skipped. requestUUID = %@ turnId = %@", v2);
}

- (void)_willFailRequestWithError:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_25D830000, v0, v1, "%s turnId is nil. Instrumentation logging is skipped. requestUUID = %@ error = %@", v2);
}

- (void)_willFailRequestWithError:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 200);
  int v5 = 136316162;
  uint64_t v6 = "-[NAFConnection _willFailRequestWithError:]";
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v3;
  __int16 v11 = 2112;
  uint64_t v12 = v4;
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_error_impl(&dword_25D830000, log, OS_LOG_TYPE_ERROR, "%s %p activeRequestUUID = %@ turnId = %@ %@", (uint8_t *)&v5, 0x34u);
}

- (void)_willPresentUsefulUserResultWithType:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_25D830000, v0, v1, "%s Initial interstitial fired %f seconds right before UUFR!", v2, v3, v4, v5, 2u);
}

- (void)_enqueueInterstitialCommand:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_25D830000, v0, v1, "%s command = %@", v2, v3, v4, v5, 2u);
}

void __114__NAFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_25D830000, v0, v1, "%s interstitialError = %@", v2, v3, v4, v5, 2u);
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_325_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_25D830000, v0, v1, "%s Failed continuing pending speech request %p %{public}@", v2);
}

- (void)failRequestWithError:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_25D830000, v0, v1, "%s %p %@", v2);
}

void __62__NAFConnection_startAudioPlaybackRequest_options_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[NAFConnection startAudioPlaybackRequest:options:completion:]_block_invoke";
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *(void *)(a1 + 32);
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_0(&dword_25D830000, a2, a3, "%s Fail to start audio playback request %{public}@ due to error %{public}@.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

@end