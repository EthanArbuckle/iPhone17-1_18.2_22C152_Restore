@interface SVXSession
- (BOOL)_isTapToRadarEnabled;
- (NSString)description;
- (NSUUID)sessionUUID;
- (SVXSession)initWithPerformer:(id)a3 serviceCommandHandler:(id)a4 powerLevelManager:(id)a5 speechSynthesizer:(id)a6 instanceContext:(id)a7 preferences:(id)a8 analytics:(id)a9 delegate:(id)a10;
- (id)_connection:(BOOL)a3;
- (id)_createClientConfiguration:(id)a3 storeDemo:(id)a4 preferences:(id)a5;
- (id)_currentAccessoryInfo;
- (id)_stateFeedbackManager;
- (id)_tapToRadarManager;
- (id)activateWithContext:(id)a3 completion:(id)a4;
- (id)activateWithContext:(id)a3 options:(unint64_t)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 speechSynthesisRecord:(id)a8 speechSynthesisState:(int64_t)a9 speechRecordingAlertPolicy:(id)a10 completion:(id)a11;
- (id)beginWaitingForMyriadDecision;
- (id)currentRequestUUID;
- (id)getTaskTrackingCenter;
- (int64_t)_getSRUIFSiriSessionStateFor:(int64_t)a3;
- (void)_activateWithContext:(id)a3 options:(unint64_t)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 speechSynthesisRecord:(id)a8 speechSynthesisState:(int64_t)a9 speechRecordingAlertPolicy:(id)a10 taskTracker:(id)a11 completion:(id)a12;
- (void)_addRequestBarrier:(id)a3;
- (void)_beginThinking;
- (void)_beginWaitingForMyriadDecisionWithToken:(id)a3;
- (void)_cancelRequestWithOptions:(unint64_t)a3 keepTaskTracker:(id)a4;
- (void)_checkIsActiveWithCompletion:(id)a3;
- (void)_clearContext;
- (void)_continuePendingSpeechRequest:(BOOL)a3;
- (void)_deactivateWithContext:(id)a3 completion:(id)a4;
- (void)_didChangeFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)_discardPendingRequestBarriers;
- (void)_dismiss;
- (void)_endThinking;
- (void)_endWaitingForMyriadDecisionWithToken:(id)a3 state:(int64_t)a4;
- (void)_forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)_forceAudioSessionInactiveWithReason:(id)a3 completion:(id)a4;
- (void)_getAlarmAndTimerFiringContextWithCompletion:(id)a3;
- (void)_handleAudioSessionDidBecomeActive:(BOOL)a3;
- (void)_handleAudioSessionDidBeginInterruption;
- (void)_handleAudioSessionDidEndInterruption:(BOOL)a3;
- (void)_handleAudioSessionWillBecomeActive:(BOOL)a3;
- (void)_handleCommand:(id)a3 taskTracker:(id)a4 completion:(id)a5;
- (void)_handleDidChangeAudioSessionID:(unsigned int)a3;
- (void)_handleDidFailStartPlaybackWithDestination:(int64_t)a3;
- (void)_handleDidHandleQuickStopWithActions:(unint64_t)a3;
- (void)_handleDidStartAudioPlaybackRequest:(id)a3;
- (void)_handleDidStopAudioPlaybackRequest:(id)a3 error:(id)a4;
- (void)_handleDismissAssistant;
- (void)_handleReceivedCommand:(id)a3 completion:(id)a4;
- (void)_handleRequestFailedWithError:(id)a3;
- (void)_handleRequestFinished;
- (void)_handleRequestWillStart;
- (void)_handleSessionIdleTimerFireEventWithAssertion:(id)a3 timerInterval:(double)a4;
- (void)_handleShouldSpeak:(BOOL)a3;
- (void)_handleSpeechRecognitionDidFailWithError:(id)a3;
- (void)_handleSpeechRecognized:(id)a3;
- (void)_handleSpeechRecognizedPartialResult:(id)a3;
- (void)_handleSpeechRecordingDidBeginOnAVRecordRoute:(id)a3;
- (void)_handleSpeechRecordingDidCancel;
- (void)_handleSpeechRecordingDidChangeAVRecordRoute:(id)a3;
- (void)_handleSpeechRecordingDidDetectStartpoint;
- (void)_handleSpeechRecordingDidEnd;
- (void)_handleSpeechRecordingDidFailWithError:(id)a3;
- (void)_handleSpeechRecordingPerformTwoShotPromptWithType:(int64_t)a3 completion:(id)a4;
- (void)_handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3;
- (void)_handleSpeechSynthesizerDidBecomeIdle;
- (void)_handleSpeechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4;
- (void)_handleSpeechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5;
- (void)_handleSpeechSynthesizerDidFinishRequest:(id)a3 record:(id)a4 taskTracker:(id)a5;
- (void)_handleSpeechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4;
- (void)_handleSpeechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5;
- (void)_handleSpeechSynthesizerWillBecomeBusy;
- (void)_handleSpeechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4;
- (void)_handleStartListenAfterSpeaking:(id)a3 record:(id)a4 taskTracker:(id)a5;
- (void)_handleWillProcessStartPlaybackWithDestination:(int64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)_handleWillStartAudioPlaybackRequest:(id)a3;
- (void)_invalidate;
- (void)_invalidateConnection;
- (void)_performBlockAfterContinueBlock:(id)a3;
- (void)_performBlockAfterResignActive:(id)a3;
- (void)_performNextPendingRequestBarrier;
- (void)_preheatWithStyle:(int64_t)a3;
- (void)_presentError:(id)a3 taskTracker:(id)a4 completion:(id)a5;
- (void)_promptRadarWithReason:(id)a3 requestID:(id)a4 displayReason:(id)a5 issueTitleName:(id)a6 issueDescName:(id)a7;
- (void)_requestDidEndWithOptions:(unint64_t)a3 error:(id)a4;
- (void)_requestWillBeginWithTaskTracker:(id)a3;
- (void)_resetMyriadDecision;
- (void)_resignActiveForReason:(id)a3;
- (void)_sessionIdleFiredWithAssertion:(id)a3;
- (void)_setApplicationContext:(id)a3;
- (void)_setAudioSessionID:(unsigned int)a3;
- (void)_setCurrentState:(int64_t)a3;
- (void)_setInputAudioPowerWrapper:(id)a3;
- (void)_setOutputAudioPowerWrapper:(id)a3;
- (void)_startActiveAudioSessionRequestForType:(int64_t)a3 taskTracker:(id)a4 completion:(id)a5;
- (void)_startRequestWithInfo:(id)a3 clearsContext:(BOOL)a4 deviceSetupContext:(id)a5 taskTracker:(id)a6 completion:(id)a7;
- (void)_startSessionIdleTimerWithTimeInterval:(double)a3;
- (void)_startSpeechRequestWithOptions:(id)a3 clearsContext:(BOOL)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 taskTracker:(id)a8 completion:(id)a9;
- (void)_startSpeechSynthesisRequest:(id)a3 languageCode:(id)a4 voiceName:(id)a5 gender:(int64_t)a6 audioSessionID:(unsigned int)a7 introductionSoundID:(int64_t)a8 conclusionSoundID:(int64_t)a9 taskTracker:(id)a10 postActivationHandler:(id)a11 completion:(id)a12;
- (void)_stopSessionIdleTimer;
- (void)_stopSpeech;
- (void)_stopSpeechWithCurrentSpeechRequestOptions;
- (void)_transitSpeechToAutomaticEndpointingWithTimestamp:(unint64_t)a3;
- (void)_transitSpeechToManualEndpointing;
- (void)_updateSpeechEndpointerOperationMode:(int64_t)a3;
- (void)_waitForMyriadDecisionUsingHandler:(id)a3;
- (void)_willChangeFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)acquireAudioSessionForReason:(id)a3 completion:(id)a4;
- (void)activateWithSpeechRequestOptions:(id)a3 options:(unint64_t)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 completion:(id)a8;
- (void)addRequestBarrier:(id)a3;
- (void)assistantConnection:(id)a3 appLaunchFailedWithBundleIdentifier:(id)a4;
- (void)assistantConnection:(id)a3 audioSessionDidBecomeActive:(BOOL)a4;
- (void)assistantConnection:(id)a3 audioSessionWillBecomeActive:(BOOL)a4;
- (void)assistantConnection:(id)a3 didChangeAudioSessionID:(unsigned int)a4;
- (void)assistantConnection:(id)a3 didHandleQuickStopWithAction:(unint64_t)a4;
- (void)assistantConnection:(id)a3 didStartAudioPlaybackRequest:(id)a4;
- (void)assistantConnection:(id)a3 didStopAudioPlaybackRequest:(id)a4 error:(id)a5;
- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5;
- (void)assistantConnection:(id)a3 recognitionUpdateWithPhrases:(id)a4 utterances:(id)a5 refId:(id)a6;
- (void)assistantConnection:(id)a3 recognizedAdditionalSpeechInterpretation:(id)a4 refId:(id)a5;
- (void)assistantConnection:(id)a3 requestFailedWithError:(id)a4 requestClass:(id)a5;
- (void)assistantConnection:(id)a3 setUserActivtiyInfoAndMakeCurrent:(id)a4 webpageURL:(id)a5;
- (void)assistantConnection:(id)a3 shouldSpeak:(BOOL)a4;
- (void)assistantConnection:(id)a3 speechRecognitionDidFail:(id)a4;
- (void)assistantConnection:(id)a3 speechRecognized:(id)a4;
- (void)assistantConnection:(id)a3 speechRecognizedPartialResult:(id)a4;
- (void)assistantConnection:(id)a3 speechRecordingDidBeginOnAVRecordRoute:(id)a4 audioSessionID:(unsigned int)a5;
- (void)assistantConnection:(id)a3 speechRecordingDidChangeAVRecordRoute:(id)a4;
- (void)assistantConnection:(id)a3 speechRecordingDidFail:(id)a4;
- (void)assistantConnection:(id)a3 speechRecordingPerformTwoShotPromptWithType:(int64_t)a4 completion:(id)a5;
- (void)assistantConnection:(id)a3 speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a4;
- (void)assistantConnection:(id)a3 startPlaybackDidFail:(int64_t)a4;
- (void)assistantConnection:(id)a3 startUIRequestWithInfo:(id)a4 completion:(id)a5;
- (void)assistantConnection:(id)a3 startUIRequestWithText:(id)a4 completion:(id)a5;
- (void)assistantConnection:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4;
- (void)assistantConnection:(id)a3 willProcessStartPlayback:(int64_t)a4 intent:(id)a5 completion:(id)a6;
- (void)assistantConnection:(id)a3 willStartAudioPlaybackRequest:(id)a4;
- (void)assistantConnectionAudioSessionDidBeginInterruption:(id)a3;
- (void)assistantConnectionAudioSessionDidEndInterruption:(id)a3 shouldResume:(BOOL)a4;
- (void)assistantConnectionDismissAssistant:(id)a3;
- (void)assistantConnectionRequestFinished:(id)a3;
- (void)assistantConnectionRequestWillStart:(id)a3;
- (void)assistantConnectionSpeechRecordingDidCancel:(id)a3;
- (void)assistantConnectionSpeechRecordingDidDetectStartpoint:(id)a3;
- (void)assistantConnectionSpeechRecordingDidEnd:(id)a3;
- (void)assistantConnectionSpeechRecordingWillBegin:(id)a3;
- (void)assistantConnectionUpdatedSpeechEndEstimate:(id)a3 speechEndEstimate:(unint64_t)a4;
- (void)cancelRequest;
- (void)deactivateWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismiss;
- (void)duckTTSToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5;
- (void)endWaitingForMyriadDecisionWithToken:(id)a3 result:(BOOL)a4;
- (void)getActivityStateWithCompletion:(id)a3;
- (void)getAlarmAndTimerFiringContextWithCompletion:(id)a3;
- (void)getAudioPowerWithType:(int64_t)a3 completion:(id)a4;
- (void)getStateWithCompletion:(id)a3;
- (void)handleCommand:(id)a3 taskTracker:(id)a4;
- (void)invalidate;
- (void)performBlock:(id)a3;
- (void)preheatWithStyle:(int64_t)a3;
- (void)prewarmWithContext:(id)a3 completion:(id)a4;
- (void)sendGenericAceCommand:(id)a3 turnIdentifier:(id)a4 conflictHandler:(id)a5;
- (void)speechSynthesizerDidBecomeBusy;
- (void)speechSynthesizerDidBecomeIdle;
- (void)speechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4;
- (void)speechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5;
- (void)speechSynthesizerDidFinishRequest:(id)a3 utteranceInfo:(id)a4 record:(id)a5 taskTracker:(id)a6;
- (void)speechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4;
- (void)speechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5;
- (void)speechSynthesizerWillEnqueueRequest:(id)a3 taskTracker:(id)a4;
- (void)speechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4;
- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)stateFeedbackManagerDidStartPlaybackForStateFeedbackType:(int64_t)a3;
- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4;
- (void)stopSpeech;
- (void)taskTrackingCenter:(id)a3 didBeginTrackingTaskWithContext:(id)a4;
- (void)taskTrackingCenter:(id)a3 didEndTrackingTaskWithContext:(id)a4;
- (void)taskTrackingCenterDidBecomeIdle:(id)a3;
- (void)taskTrackingCenterWillBecomeBusy:(id)a3;
- (void)transitSpeechToAutomaticEndpointingWithTimestamp:(unint64_t)a3;
- (void)transitSpeechToManualEndpointing;
- (void)updateDeviceProblemsState:(id)a3;
- (void)updateDeviceSetupContext:(id)a3;
- (void)updateLocalDeviceContext:(id)a3;
@end

@implementation SVXSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_alarmAndTimerUtils, 0);
  objc_storeStrong((id *)&self->_soundUtils, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
  objc_storeStrong((id *)&self->_aceViewSpeakableTextExtractor, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
  objc_storeStrong((id *)&self->_stateFeedbackManager, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_modesConfiguration, 0);
  objc_storeStrong((id *)&self->_audioDuckingCoordinationAssertion, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_playbackRequestInfo, 0);
  objc_storeStrong((id *)&self->_pendingMyriadDecisionHandlers, 0);
  objc_storeStrong(&self->_myriadToken, 0);
  objc_storeStrong((id *)&self->_currentAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_localDeviceContext, 0);
  objc_storeStrong((id *)&self->_deviceSetupContext, 0);
  objc_storeStrong((id *)&self->_deviceProblemsState, 0);
  objc_storeStrong((id *)&self->_setApplicationContext, 0);
  objc_storeStrong((id *)&self->_pendingRequestBarriers, 0);
  objc_storeStrong((id *)&self->_svxActivationInstrumentation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_powerLevelManager, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_serviceCommandHandler, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_audioSessionAssertions, 0);
  objc_storeStrong((id *)&self->_outputAudioPowerWrapper, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerWrapper, 0);
  objc_storeStrong((id *)&self->_sessionIdleAssertions, 0);
  objc_storeStrong((id *)&self->_taskTrackingCenter, 0);
  objc_storeStrong((id *)&self->_currentRequestInstrumentationContext, 0);
  objc_storeStrong((id *)&self->_previousRequestInstrumentationContext, 0);
  objc_storeStrong((id *)&self->_currentSpeechRequestPendingBlocks, 0);
  objc_storeStrong(&self->_currentSpeechRequestDidStartBlock, 0);
  objc_storeStrong((id *)&self->_currentSpeechRequestOptions, 0);
  objc_storeStrong((id *)&self->_currentRequestUUID, 0);
  objc_storeStrong((id *)&self->_currentDeactivationContext, 0);
  objc_storeStrong((id *)&self->_currentActivationContext, 0);
  objc_storeStrong(&self->_postResignActiveBlock, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)sendGenericAceCommand:(id)a3 turnIdentifier:(id)a4 conflictHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  performer = self->_performer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__SVXSession_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke;
  v15[3] = &unk_264554918;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(SVXPerforming *)performer performBlock:v15];
}

void __67__SVXSession_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection:0];
  [v2 sendGenericAceCommand:*(void *)(a1 + 40) turnIdentifier:*(void *)(a1 + 48) conflictHandler:*(void *)(a1 + 56)];
}

- (id)_createClientConfiguration:(id)a3 storeDemo:(id)a4 preferences:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x263F28458];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__SVXSession__createClientConfiguration_storeDemo_preferences___block_invoke;
  v17[3] = &unk_264554180;
  id v18 = v8;
  id v19 = v9;
  v20 = self;
  id v21 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  v15 = (void *)[v11 newWithBuilder:v17];

  return v15;
}

void __63__SVXSession__createClientConfiguration_storeDemo_preferences___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = [v3 beginDate];
    [v9 setDeviceSetupFlowBeginDate:v4];

    v5 = [*(id *)(a1 + 32) endDate];
    [v9 setDeviceSetupFlowEndDate:v5];
  }
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    [v6 outputVolume];
    objc_msgSend(v9, "setOutputVolume:");
  }
  v7 = [*(id *)(*(void *)(a1 + 48) + 416) createAudioPlaybackRequestFromID:3 preferences:*(void *)(a1 + 56)];
  [v9 setTapToSiriAudioPlaybackRequest:v7];

  id v8 = [*(id *)(*(void *)(a1 + 48) + 416) createAudioPlaybackRequestFromID:1 preferences:*(void *)(a1 + 56)];
  [v9 setTwoShotAudioPlaybackRequest:v8];
}

- (void)duckTTSToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8 = a5;
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__SVXSession_duckTTSToVolume_rampTime_completion___block_invoke;
  v11[3] = &unk_264554158;
  float v14 = a3;
  double v13 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(SVXPerforming *)performer performBlock:v11];
}

uint64_t __50__SVXSession_duckTTSToVolume_rampTime_completion___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  return [*(id *)(*(void *)(a1 + 32) + 192) duckTTSVolumeTo:*(void *)(a1 + 40) rampTime:a2 completion:*(double *)(a1 + 48)];
}

- (void)_promptRadarWithReason:(id)a3 requestID:(id)a4 displayReason:(id)a5 issueTitleName:(id)a6 issueDescName:(id)a7
{
  id v27 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = objc_opt_new();
  id v17 = [(SVXSession *)self _tapToRadarManager];
  id v18 = [v17 getWebSearchIssueDialogIdentifiers];
  LODWORD(self) = [v18 containsObject:v27];

  if (self)
  {
    id v19 = NSString;
    v20 = [v17 getRecognitionText];
    id v21 = [v20 lowercaseString];
    v22 = [v19 stringWithFormat:@"%@_%@", v27, v21];
    [v16 setError:v22];
  }
  else
  {
    [v16 setError:v27];
  }
  [v16 setRequestID:v15];
  [v16 setComponentName:@"Siri UI"];
  [v16 setComponentVersion:@"HomePod"];
  [v16 setComponentID:&unk_26D1FD140];
  [v16 setDisplayReason:v14];

  v23 = [NSString stringWithFormat:@"[AutoTTR] %@ issue %@ detected", v13, v27];

  [v16 setTitle:v23];
  v24 = NSString;
  v25 = [v17 getRecognitionText];
  v26 = [v24 stringWithFormat:@"- Problem Description: %@ issue detected on HomePod. \n\n- Error: %@ \n\n- Request ID: %@\n\n- Recognized User Utterance: %@\n\n", v12, v27, v15, v25];

  [v16 setRadarDescription:v26];
  [v17 createProblem:v16 extraContent:0 completionHandler:&__block_literal_global_296];
  [v17 setRecognitionText:&stru_26D1E1D80];
}

void __90__SVXSession__promptRadarWithReason_requestID_displayReason_issueTitleName_issueDescName___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v4 = @"failed";
    if (a2) {
      v4 = @"success";
    }
    int v5 = 136315394;
    v6 = "-[SVXSession _promptRadarWithReason:requestID:displayReason:issueTitleName:issueDescName:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s Prompt radar %@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)_tapToRadarManager
{
  return +[SVXTapToRadarManager sharedInstance];
}

- (BOOL)_isTapToRadarEnabled
{
  return _os_feature_enabled_impl() && AFIsInternalInstall() && (AFIsHorseman() & 1) != 0;
}

- (void)_sessionIdleFiredWithAssertion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableSet *)self->_sessionIdleAssertions containsObject:v4])
  {
    [(NSMutableSet *)self->_sessionIdleAssertions removeObject:v4];
    uint64_t v5 = [(NSMutableSet *)self->_sessionIdleAssertions count];
    v6 = *MEMORY[0x263F28348];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        sessionIdleAssertions = self->_sessionIdleAssertions;
        *(_DWORD *)buf = 136315650;
        v11 = "-[SVXSession _sessionIdleFiredWithAssertion:]";
        __int16 v12 = 2112;
        id v13 = v4;
        __int16 v14 = 2112;
        id v15 = sessionIdleAssertions;
        _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Fired session idle timer (assertion = %@), but there are still other active timers (assertions = %@).", buf, 0x20u);
      }
    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[SVXSession _sessionIdleFiredWithAssertion:]";
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Fired last session idle timer (assertion = %@).", buf, 0x16u);
      }
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __45__SVXSession__sessionIdleFiredWithAssertion___block_invoke;
      v9[3] = &unk_2645545B8;
      v9[4] = self;
      [(SVXSession *)self _checkIsActiveWithCompletion:v9];
    }
  }
}

void __45__SVXSession__sessionIdleFiredWithAssertion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = (NSObject **)MEMORY[0x263F28348];
    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      id v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Ignored because session is active.", (uint8_t *)&v18, 0xCu);
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
      v6 = v4;
      if (v5 > 4) {
        BOOL v7 = @"(unknown)";
      }
      else {
        BOOL v7 = off_2645542F8[v5];
      }
      __int16 v12 = v7;
      int v18 = 136315394;
      id v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v18, 0x16u);

      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v13 = *(__CFString **)(*(void *)(a1 + 32) + 80);
      int v18 = 136315394;
      id v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s _currentSpeechRequestOptions = %@", (uint8_t *)&v18, 0x16u);
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 88);
      id v15 = v4;
      uint64_t v16 = (__CFString *)MEMORY[0x223C65C40](v14);
      int v18 = 136315394;
      id v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v16;
      _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s _currentSpeechRequestContinueBlock = %@", (uint8_t *)&v18, 0x16u);

      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v17 = *(__CFString **)(*(void *)(a1 + 32) + 96);
      int v18 = 136315394;
      id v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v17;
      v11 = "%s _currentSpeechRequestPendingBlocks = %@";
      goto LABEL_23;
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (v8[3] == 1)
    {
      [v8 _invalidate];
    }
    else
    {
      uint64_t v9 = (NSObject **)MEMORY[0x263F28348];
      id v4 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        id v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
        _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Ignored because session is active.", (uint8_t *)&v18, 0xCu);
        id v4 = *v9;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v10 = *(__CFString **)(*(void *)(a1 + 32) + 24);
        int v18 = 136315394;
        id v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
        __int16 v20 = 2048;
        id v21 = v10;
        v11 = "%s _activityState = %lu";
LABEL_23:
        _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (void)_handleSessionIdleTimerFireEventWithAssertion:(id)a3 timerInterval:(double)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[SVXSession _handleSessionIdleTimerFireEventWithAssertion:timerInterval:]";
    __int16 v10 = 2048;
    double v11 = a4;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s Handle session idle timer(time interval = %lf) fire event (assertion = %@).", (uint8_t *)&v8, 0x20u);
  }
  [(SVXSession *)self _sessionIdleFiredWithAssertion:v6];
}

- (void)_stopSessionIdleTimer
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(NSMutableSet *)self->_sessionIdleAssertions count])
  {
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      sessionIdleAssertions = self->_sessionIdleAssertions;
      int v5 = 136315394;
      id v6 = "-[SVXSession _stopSessionIdleTimer]";
      __int16 v7 = 2112;
      int v8 = sessionIdleAssertions;
      _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s Stopped all session idle timers (assertions = %@).", (uint8_t *)&v5, 0x16u);
    }
    [(NSMutableSet *)self->_sessionIdleAssertions removeAllObjects];
  }
}

- (void)_startSessionIdleTimerWithTimeInterval:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v5 = [[SVXSessionIdleAssertion alloc] initWithTimestamp:mach_absolute_time() session:self];
  [(NSMutableSet *)self->_sessionIdleAssertions addObject:v5];
  objc_initWeak(&location, self);
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__SVXSession__startSessionIdleTimerWithTimeInterval___block_invoke;
  v9[3] = &unk_264554110;
  objc_copyWeak(v11, &location);
  __int16 v7 = v5;
  __int16 v10 = v7;
  v11[1] = *(id *)&a3;
  [(SVXPerforming *)performer performBlock:v9 afterDelay:a3];
  int v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "-[SVXSession _startSessionIdleTimerWithTimeInterval:]";
    __int16 v15 = 2048;
    double v16 = a3;
    __int16 v17 = 2112;
    int v18 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s Started session idle timer for %f seconds (assertion = %@).", buf, 0x20u);
  }

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __53__SVXSession__startSessionIdleTimerWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleSessionIdleTimerFireEventWithAssertion:*(void *)(a1 + 32) timerInterval:*(double *)(a1 + 48)];
}

- (void)_invalidateConnection
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (NSObject **)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[SVXSession _invalidateConnection]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  connection = self->_connection;
  if (connection)
  {
    id v6 = *v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[SVXSession _invalidateConnection]";
      __int16 v10 = 2112;
      double v11 = connection;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Tear down %@", (uint8_t *)&v8, 0x16u);
      connection = self->_connection;
    }
    [(AFConnection *)connection didDismissUI];
    [(AFConnection *)self->_connection cancelRequest];
    [(AFConnection *)self->_connection endSession];
    [(AFConnection *)self->_connection invalidate];
    [(AFConnection *)self->_connection setSpeechDelegate:0];
    [(AFConnection *)self->_connection setDelegate:0];
    __int16 v7 = self->_connection;
    self->_connection = 0;
  }
}

- (id)_connection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    uint64_t v19 = "-[SVXSession _connection:]";
    __int16 v20 = 1024;
    LODWORD(v21) = v3;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s createIfAbsent = %d", (uint8_t *)&v18, 0x12u);
  }
  connection = self->_connection;
  if (connection) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v3;
  }
  if (!v8)
  {
    connectionFactory = self->_connectionFactory;
    __int16 v10 = [(SVXPerforming *)self->_performer queue];
    double v11 = [(SVXAFConnectionFactory *)connectionFactory createWithDispatchQueue:v10 instanceContext:self->_instanceContext];
    uint64_t v12 = self->_connection;
    self->_connection = v11;

    [(AFConnection *)self->_connection setDelegate:self];
    [(AFConnection *)self->_connection setSpeechDelegate:self];
    id v13 = self->_connection;
    uint64_t v14 = [(SVXSession *)self _createClientConfiguration:self->_deviceSetupContext storeDemo:0 preferences:self->_preferences];
    [(AFConnection *)v13 setConfiguration:v14];

    [(SVXSession *)self _handleDidChangeAudioSessionID:[(AFConnection *)self->_connection audioSessionID]];
    [(SVXSession *)self _handleShouldSpeak:[(AFConnection *)self->_connection shouldSpeak]];
    __int16 v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      double v16 = self->_connection;
      int v18 = 136315394;
      uint64_t v19 = "-[SVXSession _connection:]";
      __int16 v20 = 2112;
      id v21 = v16;
      _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s Set up %@", (uint8_t *)&v18, 0x16u);
    }
    [(AFConnection *)self->_connection willPresentUI];
    connection = self->_connection;
  }

  return connection;
}

- (id)_stateFeedbackManager
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_isStateFeedbackEnabled)
  {
    stateFeedbackManager = self->_stateFeedbackManager;
    if (!stateFeedbackManager)
    {
      id v4 = objc_alloc(MEMORY[0x263F754E8]);
      int v5 = [(SVXSession *)self _connection:0];
      id v6 = (void *)[v4 initWithConnection:v5 withPlaybackOptions:0];

      __int16 v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        id v13 = "-[SVXSession _stateFeedbackManager]";
        __int16 v14 = 2048;
        uint64_t v15 = 0;
        _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s #svxstatefeedback create statefeedback manager with Option:%lu", (uint8_t *)&v12, 0x16u);
      }
      BOOL v8 = (SRUIFStateFeedbackManager *)[objc_alloc(MEMORY[0x263F754F0]) initWithStateFeedbackProvider:v6 delegate:self];
      uint64_t v9 = self->_stateFeedbackManager;
      self->_stateFeedbackManager = v8;

      stateFeedbackManager = self->_stateFeedbackManager;
    }
    __int16 v10 = stateFeedbackManager;
  }
  else
  {
    __int16 v10 = 0;
  }

  return v10;
}

- (void)_handleCommand:(id)a3 taskTracker:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (os_log_t *)MEMORY[0x263F28348];
  int v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[SVXSession _handleCommand:taskTracker:completion:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s command = %@, taskTracker = %@", buf, 0x20u);
  }
  if (!self->_currentRequestWillPresentUUFR
    && self->_currentRequestUUID
    && [(SVXServiceCommandHandler *)self->_serviceCommandHandler isCommandUUFR:v8])
  {
    self->_currentRequestWillPresentUUFR = 1;
    int v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[SVXSession _handleCommand:taskTracker:completion:]";
      _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_INFO, "%s UUFR PRESENT", buf, 0xCu);
    }
    uint64_t v19 = [(SVXSession *)self _connection:0];
    [v19 willPresentUsefulUserResultWithType:1 forCommand:v8];
  }
  id v13 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[SVXSession _handleCommand:taskTracker:completion:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s Begin handle command %@ with task tracker %@.", buf, 0x20u);
  }
  serviceCommandHandler = self->_serviceCommandHandler;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __52__SVXSession__handleCommand_taskTracker_completion___block_invoke;
  v20[3] = &unk_2645540E8;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [(SVXServiceCommandHandler *)serviceCommandHandler handleCommand:v17 taskTracker:v16 completion:v20];
}

void __52__SVXSession__handleCommand_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 176);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SVXSession__handleCommand_taskTracker_completion___block_invoke_2;
  v6[3] = &unk_264554918;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  [v4 performBlock:v6];
}

uint64_t __52__SVXSession__handleCommand_taskTracker_completion___block_invoke_2(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v7 = 136315906;
    id v8 = "-[SVXSession _handleCommand:taskTracker:completion:]_block_invoke_2";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s End handle command %@ with task tracker %@ and response %@.", (uint8_t *)&v7, 0x2Au);
  }
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a1[6]);
  }
  return result;
}

- (void)_presentError:(id)a3 taskTracker:(id)a4 completion:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  __int16 v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[SVXSession _presentError:taskTracker:completion:]";
    __int16 v49 = 2112;
    id v50 = v8;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s error = %@", buf, 0x16u);
  }
  uint64_t v12 = [v8 domain];
  uint64_t v13 = [v8 code];
  if ([v12 isEqualToString:@"SiriVOXErrorDomain"] && v13 == 1)
  {
    uint64_t v14 = [v8 userInfo];
    uint64_t v15 = [v14 objectForKey:*MEMORY[0x263F08608]];

    id v16 = [v15 domain];
    id v17 = [v15 domain];
    uint64_t v18 = *MEMORY[0x263F28730];
    int v19 = [v17 isEqualToString:*MEMORY[0x263F28730]];

    if (v19)
    {
      id v20 = v16;

      uint64_t v13 = [v15 code];
      uint64_t v12 = v20;
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v18 = *MEMORY[0x263F28730];
  }
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v12 isEqualToString:v18])
  {
    switch(v13)
    {
      case 1:
        id v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"SIRI_VOX_TIMEOUT_ERROR_%u", arc4random_uniform(4u));
        [v21 addObject:v23];

        [v22 addObject:@"client#errorTimeout"];
        v24 = self->_deviceProblemsState;
        if (([(SVXDeviceProblemsState *)v24 problems] & 0x8030) != 0
          || (uint64_t v25 = [(SVXDeviceProblemsState *)v24 problems], (v25 & 0xE0040) != 0))
        {

LABEL_15:
          __int16 v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"SIRI_VOX_DEVICE_PROBLEM_NETWORK_%u", arc4random_uniform(3u));
          id v27 = @"client#errorNetworkProblems";
          goto LABEL_30;
        }
        __int16 v39 = v25;

        if ((v39 & 0x4000) != 0) {
          goto LABEL_15;
        }
        break;
      case 2:
        goto LABEL_27;
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 13:
        goto LABEL_26;
      case 4:
      case 9:
      case 14:
        goto LABEL_18;
      case 6:
        v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"SIRI_VOX_GENERIC_ERROR_%u", arc4random_uniform(4u));
        [v21 addObject:v32];

        [v22 addObject:@"client#errorGeneric"];
        __int16 v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"SIRI_VOX_DEVICE_PROBLEM_FIXING_%u", arc4random_uniform(4u));
        id v27 = @"client#errorTryAgain";
        goto LABEL_30;
      default:
        if (v13 == 22) {
          goto LABEL_27;
        }
        if (v13 == 52) {
          goto LABEL_18;
        }
LABEL_26:
        if ((unint64_t)(v13 - 200) >= 0x64) {
          break;
        }
LABEL_27:
        if ([v21 count])
        {
          BOOL v31 = 1;
          goto LABEL_42;
        }
        v38 = *MEMORY[0x263F28348];
        BOOL v31 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v48 = "-[SVXSession _presentError:taskTracker:completion:]";
          __int16 v49 = 2112;
          id v50 = v8;
          _os_log_impl(&dword_220062000, v38, OS_LOG_TYPE_INFO, "%s The error %@ is not presented because it is suppressed.", buf, 0x16u);
        }
        goto LABEL_48;
    }
  }
  else if ([v12 isEqualToString:@"SiriVOXErrorDomain"] && v13 == 2)
  {
LABEL_18:
    unint64_t v28 = [(SVXDeviceProblemsState *)self->_deviceProblemsState problems] & 0x8030;
    id v29 = [NSString alloc];
    if (v28)
    {
      if (AFSupportsWAPI()) {
        uint64_t v30 = @"WLAN";
      }
      else {
        uint64_t v30 = @"WIFI";
      }
      __int16 v26 = (void *)[v29 initWithFormat:@"SIRI_VOX_%@_ERROR_%u", v30, arc4random_uniform(2u)];
      id v27 = @"client#errorWiFi";
    }
    else
    {
      __int16 v26 = objc_msgSend(v29, "initWithFormat:", @"SIRI_VOX_NETWORK_ERROR_%u", arc4random_uniform(1u));
      id v27 = @"client#errorNetwork";
    }
LABEL_30:
    [v21 addObject:v26];

    [v22 addObject:v27];
  }
  if (([(SVXDeviceProblemsState *)self->_deviceProblemsState problems] & 0x80) != 0)
  {
    [v21 removeAllObjects];
    [v22 removeAllObjects];
    v33 = (void *)[[NSString alloc] initWithFormat:@"SIRI_VOX_DEVICE_PROBLEM_HARDWARE%@_%u", &stru_26D1E1D80, arc4random_uniform(2u)];
    v34 = @"client#errorHardwareProblems";
  }
  else if (([(SVXDeviceProblemsState *)self->_deviceProblemsState problems] & 0x200) != 0)
  {
    [v21 removeAllObjects];
    [v22 removeAllObjects];
    v33 = (void *)[[NSString alloc] initWithFormat:@"SIRI_VOX_DEVICE_PROBLEM_THERMAL%@_%u", &stru_26D1E1D80, arc4random_uniform(3u)];
    v34 = @"client#errorThermalProblems";
  }
  else
  {
    if ([(SVXDeviceProblemsState *)self->_deviceProblemsState isFixingProblems])
    {
      [v21 removeAllObjects];
      [v22 removeAllObjects];
    }
    else if ([v21 count])
    {
      goto LABEL_40;
    }
    v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"SIRI_VOX_GENERIC_ERROR_%u", arc4random_uniform(4u));
    [v21 addObject:v35];

    [v22 addObject:@"client#errorGeneric"];
    v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"SIRI_VOX_DEVICE_PROBLEM_FIXING_%u", arc4random_uniform(4u));
    v34 = @"client#errorTryAgain";
  }
  [v21 addObject:v33];

  [v22 addObject:v34];
LABEL_40:
  if ([v21 count])
  {
    BOOL v31 = 0;
LABEL_42:
    v36 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SVXSession _presentError:taskTracker:completion:]";
      _os_log_impl(&dword_220062000, v36, OS_LOG_TYPE_INFO, "%s Begin waiting for Myriad decision...", buf, 0xCu);
    }
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke;
    v40[3] = &unk_2645540C0;
    id v41 = v8;
    id v42 = v21;
    id v43 = v22;
    v44 = self;
    id v45 = v9;
    v46 = v10;
    [(SVXSession *)self _waitForMyriadDecisionUsingHandler:v40];
  }
  else
  {
    v37 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[SVXSession _presentError:taskTracker:completion:]";
      __int16 v49 = 2112;
      id v50 = v8;
      _os_log_error_impl(&dword_220062000, v37, OS_LOG_TYPE_ERROR, "%s The error %@ is not presented. Please take a sysdiagnose and file a radar.", buf, 0x16u);
    }
    BOOL v31 = 0;
LABEL_48:
    if (v10) {
      v10[2](v10);
    }
  }
  self->_isMostRecentRequestSuppressedError = v31;
}

void __51__SVXSession__presentError_taskTracker_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = (NSObject **)MEMORY[0x263F28348];
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[SVXSession _presentError:taskTracker:completion:]_block_invoke";
    __int16 v33 = 1024;
    LODWORD(v34) = a2;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s End waiting for Myriad decision with result %d.", buf, 0x12u);
    uint64_t v5 = *v4;
  }
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v32 = "-[SVXSession _presentError:taskTracker:completion:]_block_invoke";
      __int16 v33 = 2112;
      uint64_t v34 = v7;
      _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s Begin presenting error %@...", buf, 0x16u);
    }
    id v8 = dispatch_group_create();
    unint64_t v9 = [*(id *)(a1 + 40) count];
    unint64_t v10 = [*(id *)(a1 + 48) count];
    if (v9 >= v10) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        dispatch_group_enter(v8);
        uint64_t v13 = *(void **)(*(void *)(a1 + 56) + 192);
        uint64_t v14 = [SVXSpeechSynthesisRequest alloc];
        uint64_t v15 = [*(id *)(a1 + 40) objectAtIndex:i];
        id v16 = [(SVXSpeechSynthesisRequest *)v14 initWithPriority:1 options:1 speakableText:0 speakableContext:0 localizationKey:v15 presynthesizedAudio:0 streamID:0];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke_268;
        v29[3] = &unk_264554070;
        uint64_t v30 = v8;
        id v17 = *(void **)(a1 + 64);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke_2;
        v26[3] = &unk_264554098;
        id v27 = *(id *)(a1 + 48);
        uint64_t v28 = i;
        id v18 = +[SVXTaskContext newWithBuilder:v26];
        int v19 = [v17 beginChildWithContext:v18];
        [v13 enqueueRequest:v16 languageCode:0 voiceName:0 gender:0 audioSessionID:0 preparation:0 finalization:v29 taskTracker:v19 analyticsContext:0];
      }
    }
    id v20 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke_3;
    block[3] = &unk_264554788;
    block[4] = *(void *)(a1 + 56);
    id v24 = *(id *)(a1 + 32);
    id v25 = *(id *)(a1 + 72);
    dispatch_group_notify(v8, v20, block);
  }
  else
  {
    if (v6)
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v32 = "-[SVXSession _presentError:taskTracker:completion:]_block_invoke";
      __int16 v33 = 2112;
      uint64_t v34 = v21;
      _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s The error %@ is not presented because of Myriad decision.", buf, 0x16u);
    }
    uint64_t v22 = *(void *)(a1 + 72);
    if (v22) {
      (*(void (**)(void))(v22 + 16))();
    }
  }
}

void __51__SVXSession__presentError_taskTracker_completion___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 176);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke_4;
  v3[3] = &unk_2645547D8;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performBlock:v3];
}

void __51__SVXSession__presentError_taskTracker_completion___block_invoke_268(uint64_t a1)
{
}

void __51__SVXSession__presentError_taskTracker_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 objectAtIndex:v3];
  [v4 setDialogIdentifier:v5];
}

uint64_t __51__SVXSession__presentError_taskTracker_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    BOOL v6 = "-[SVXSession _presentError:taskTracker:completion:]_block_invoke_4";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s End presented error %@.", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleStartListenAfterSpeaking:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = mach_absolute_time();
  uint64_t v12 = [v10 context];
  if ([v12 listensAfterSpeaking] && objc_msgSend(v12, "origin") == 11)
  {
    uint64_t v13 = (os_log_t *)MEMORY[0x263F28348];
    uint64_t v14 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v28 = "-[SVXSession _handleStartListenAfterSpeaking:record:taskTracker:]";
      _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s listensAfterSpeaking = YES", buf, 0xCu);
    }
    uint64_t v15 = [SVXActivationContext alloc];
    id v16 = SVXClientInfoGetCurrent();
    id v17 = [(SVXActivationContext *)v15 initWithSource:4 timestamp:v11 buttonEvent:0 systemEvent:0 clientInfo:v16 requestInfo:0 userInfo:0];

    objc_initWeak(&location, self);
    id v18 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[SVXSession _handleStartListenAfterSpeaking:record:taskTracker:]";
      __int16 v29 = 2112;
      uint64_t v30 = v17;
      _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_INFO, "%s listensAfterSpeaking: Scheduled activation context %@ in request barrier.", buf, 0x16u);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__SVXSession__handleStartListenAfterSpeaking_record_taskTracker___block_invoke;
    v20[3] = &unk_264554048;
    int v19 = v17;
    uint64_t v21 = v19;
    objc_copyWeak(&v25, &location);
    id v22 = v9;
    id v23 = v12;
    id v24 = v10;
    [(SVXSession *)self _addRequestBarrier:v20];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

void __65__SVXSession__handleStartListenAfterSpeaking_record_taskTracker___block_invoke(uint64_t a1, char a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v20 = "-[SVXSession _handleStartListenAfterSpeaking:record:taskTracker:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s listensAfterSpeaking: Cancelled request barrier with activation context %@.", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v20 = "-[SVXSession _handleStartListenAfterSpeaking:record:taskTracker:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v6;
      _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s listensAfterSpeaking: Executing request barrier with activation context %@.", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v10 = WeakRetained[35];
      uint64_t v9 = WeakRetained[36];
      uint64_t v11 = WeakRetained[37];
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v14 = [*(id *)(a1 + 48) listenAfterSpeakingBehavior];
      uint64_t v15 = v14;
      if (v14)
      {
        id v16 = [v14 startAlertSoundID];
        if ([v16 isEqualToString:*MEMORY[0x263F65F08]]) {
          id v17 = (void *)[MEMORY[0x263F28688] newWithBuilder:&__block_literal_global_740];
        }
        else {
          id v17 = 0;
        }
      }
      else
      {
        id v17 = 0;
      }
      id v18 = (id)[v8 activateWithContext:v13 options:0 deviceSetupContext:v9 deviceProblemsState:v10 localDeviceContext:v11 speechSynthesisRecord:v12 speechSynthesisState:1 speechRecordingAlertPolicy:v17 completion:0];
    }
  }
}

- (void)_handleSpeechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a5;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[SVXSession _handleSpeechSynthesizerDidFailRequest:taskTracker:error:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s request = %@, error = %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_handleSpeechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[SVXSession _handleSpeechSynthesizerDidInterruptRequest:taskTracker:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_handleSpeechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[SVXSession _handleSpeechSynthesizerDidCancelRequest:taskTracker:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_handleSpeechSynthesizerDidFinishRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    id v14 = "-[SVXSession _handleSpeechSynthesizerDidFinishRequest:record:taskTracker:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s request = %@, record = %@", (uint8_t *)&v13, 0x20u);
  }
  id v12 = [(SVXSession *)self _connection:0];
  [v12 updateSpeechSynthesisRecord:v9];

  [(SVXSession *)self _handleStartListenAfterSpeaking:v8 record:v9 taskTracker:v10];
}

- (void)_handleSpeechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[SVXSession _handleSpeechSynthesizerDidStartRequest:record:taskTracker:]";
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s request = %@, record = %@", buf, 0x20u);
  }
  id v12 = [(SVXSession *)self _connection:0];
  [v12 updateSpeechSynthesisRecord:v9];

  if ([v10 origin] == 11)
  {
    taskTrackingCenter = self->_taskTrackingCenter;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__SVXSession__handleSpeechSynthesizerDidStartRequest_record_taskTracker___block_invoke;
    v14[3] = &unk_264554020;
    id v15 = v10;
    id v16 = self;
    [(SVXTaskTrackingCenter *)taskTrackingCenter getContextsOfAllTrackedTasksUsingBlock:v14];
  }
}

void __73__SVXSession__handleSpeechSynthesizerDidStartRequest_record_taskTracker___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 context];
  int v6 = [v4 containsObject:v5];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 176);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73__SVXSession__handleSpeechSynthesizerDidStartRequest_record_taskTracker___block_invoke_2;
    v9[3] = &unk_2645548C8;
    void v9[4] = v7;
    id v10 = *(id *)(a1 + 32);
    [v8 performBlock:v9];
  }
}

void __73__SVXSession__handleSpeechSynthesizerDidStartRequest_record_taskTracker___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 105) && *(void *)(v2 + 72) && [*(id *)(a1 + 40) isUUFR]) {
    *(unsigned char *)(*(void *)(a1 + 32) + 105) = 1;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = [*(id *)(a1 + 40) dialogPhase];
  if (v3) {
    [v5 setObject:v3 forKey:@"dialogPhase"];
  }
  id v4 = [*(id *)(a1 + 40) dialogIdentifier];
  if (v4) {
    [v5 setObject:v4 forKey:@"dialogIdentifier"];
  }
  [*(id *)(*(void *)(a1 + 32) + 224) logEventWithType:1924 context:v5];
}

- (void)_handleSpeechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[SVXSession _handleSpeechSynthesizerWillStartRequest:taskTracker:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  unint64_t v9 = [v7 origin];
  if (v9 <= 0xB)
  {
    unint64_t v10 = v9;
    if (((1 << v9) & 0xB02) != 0)
    {
      taskTrackingCenter = self->_taskTrackingCenter;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __67__SVXSession__handleSpeechSynthesizerWillStartRequest_taskTracker___block_invoke;
      v12[3] = &unk_264553FF8;
      id v13 = v7;
      id v14 = self;
      id v15 = v6;
      unint64_t v16 = v10;
      [(SVXTaskTrackingCenter *)taskTrackingCenter getContextsOfAllTrackedTasksUsingBlock:v12];
    }
  }
}

void __67__SVXSession__handleSpeechSynthesizerWillStartRequest_taskTracker___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 context];
  int v6 = [v4 containsObject:v5];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 176);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    id v11[2] = __67__SVXSession__handleSpeechSynthesizerWillStartRequest_taskTracker___block_invoke_2;
    v11[3] = &unk_264553FD0;
    v11[4] = v7;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = v9;
    uint64_t v14 = v10;
    id v13 = *(id *)(a1 + 32);
    [v8 performBlock:v11];
  }
}

uint64_t __67__SVXSession__handleSpeechSynthesizerWillStartRequest_taskTracker___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 408) requestHasSpeakableContents:*(void *)(a1 + 40)];
  if (result)
  {
    if (*(void *)(a1 + 56) != 11 || (uint64_t result = [*(id *)(a1 + 48) isUUFR], result))
    {
      [*(id *)(*(void *)(a1 + 32) + 368) dispatchEvent:9];
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 _setCurrentState:4];
    }
  }
  return result;
}

- (void)_handleSpeechSynthesizerDidBecomeIdle
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SVXSession _handleSpeechSynthesizerDidBecomeIdle]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(SVXPowerLevelManager *)self->_powerLevelManager endUpdateAudioPower];
  [(SVXSession *)self _setOutputAudioPowerWrapper:0];
  id v5 = NSStringFromSelector(a2);
  [(SVXSession *)self _resignActiveForReason:v5];
}

- (void)_handleSpeechSynthesizerWillBecomeBusy
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v16 = "-[SVXSession _handleSpeechSynthesizerWillBecomeBusy]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (([(AFInstanceContext *)self->_instanceContext supportsAudioPowerUpdate] & 1) == 0)
  {
    os_log_t v11 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    unint64_t v16 = "-[SVXSession _handleSpeechSynthesizerWillBecomeBusy]";
    uint64_t v8 = "%s Output audio power updater not supported.";
    id v9 = v11;
    uint32_t v10 = 12;
    goto LABEL_10;
  }
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  if (currentSpeechRequestOptions
    && [(AFSpeechRequestOptions *)currentSpeechRequestOptions disableOutputAudioPowerUpdate])
  {
    os_log_t v6 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v7 = self->_currentSpeechRequestOptions;
    *(_DWORD *)buf = 136315394;
    unint64_t v16 = "-[SVXSession _handleSpeechSynthesizerWillBecomeBusy]";
    __int16 v17 = 2112;
    id v18 = v7;
    uint64_t v8 = "%s Output audio power updater disabled by current speech request options %@.";
    id v9 = v6;
    uint32_t v10 = 22;
LABEL_10:
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    return;
  }
  objc_initWeak((id *)buf, self);
  powerLevelManager = self->_powerLevelManager;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__SVXSession__handleSpeechSynthesizerWillBecomeBusy__block_invoke;
  v13[3] = &unk_264553FA8;
  objc_copyWeak(&v14, (id *)buf);
  [(SVXPowerLevelManager *)powerLevelManager beginUpdateAudioPowerWithCompletion:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __52__SVXSession__handleSpeechSynthesizerWillBecomeBusy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SVXSession__handleSpeechSynthesizerWillBecomeBusy__block_invoke_2;
  v7[3] = &unk_264554990;
  objc_copyWeak(&v9, v4);
  id v6 = v3;
  id v8 = v6;
  [WeakRetained performBlock:v7];

  objc_destroyWeak(&v9);
}

void __52__SVXSession__handleSpeechSynthesizerWillBecomeBusy__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setOutputAudioPowerWrapper:*(void *)(a1 + 32)];
}

- (void)_endThinking
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[SVXSession _endThinking]";
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_beginThinking
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[SVXSession _beginThinking]";
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (int64_t)_getSRUIFSiriSessionStateFor:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int64_t result = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 4)
  {
    uint64_t v5 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      if ((unint64_t)a3 > 4) {
        uint64_t v7 = @"(unknown)";
      }
      else {
        uint64_t v7 = off_2645542F8[a3];
      }
      id v8 = v7;
      int v9 = 136315394;
      uint32_t v10 = "-[SVXSession _getSRUIFSiriSessionStateFor:]";
      __int16 v11 = 2112;
      id v12 = v8;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported SVXSessionState: %@. Converting to SRUIFSiriSessionStateIdle", (uint8_t *)&v9, 0x16u);
    }
    return 0;
  }
  return result;
}

- (void)_didChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v7 = (os_log_t *)MEMORY[0x263F28348];
  id v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = v8;
    if ((unint64_t)a3 > 4) {
      uint32_t v10 = @"(unknown)";
    }
    else {
      uint32_t v10 = off_2645542F8[a3];
    }
    __int16 v11 = v10;
    if ((unint64_t)a4 > 4) {
      id v12 = @"(unknown)";
    }
    else {
      id v12 = off_2645542F8[a4];
    }
    uint64_t v13 = v12;
    int v22 = 136315650;
    uint64_t v23 = "-[SVXSession _didChangeFromState:toState:]";
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", (uint8_t *)&v22, 0x20u);
  }
  if (a4 != 2)
  {
    [(SVXSession *)self _setInputAudioPowerWrapper:0];
    if (a4 == 3)
    {
      [(SVXSession *)self _beginThinking];
    }
    else if (a4 == 1)
    {
      [(SVXSession *)self _setOutputAudioPowerWrapper:0];
    }
  }
  if (a3 == 3)
  {
    [(SVXSession *)self _endThinking];
    currentRequestInstrumentationContext = self->_currentRequestInstrumentationContext;
    uint64_t currentInstrumentationUIState = self->_currentInstrumentationUIState;
    int64_t v16 = 3;
  }
  else
  {
    currentRequestInstrumentationContext = self->_currentRequestInstrumentationContext;
    uint64_t currentInstrumentationUIState = self->_currentInstrumentationUIState;
    int64_t v16 = a3;
  }
  self->_uint64_t currentInstrumentationUIState = SVXInstrumentationEmitUIStateTransition(currentRequestInstrumentationContext, v16, a4, currentInstrumentationUIState);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained session:self didChangeFromState:a3 toState:a4];

  if (self->_isStateFeedbackEnabled)
  {
    int64_t v18 = [(SVXSession *)self _getSRUIFSiriSessionStateFor:a3];
    int64_t v19 = [(SVXSession *)self _getSRUIFSiriSessionStateFor:a4];
    id v20 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315650;
      uint64_t v23 = "-[SVXSession _didChangeFromState:toState:]";
      __int16 v24 = 2048;
      id v25 = (__CFString *)v18;
      __int16 v26 = 2048;
      id v27 = (__CFString *)v19;
      _os_log_impl(&dword_220062000, v20, OS_LOG_TYPE_INFO, "%s Converted fromState: %ld, Converted toState: %ld", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v21 = [(SVXSession *)self _stateFeedbackManager];
    [v21 didTransitionFromState:v18 toState:v19];
  }
}

- (void)_willChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)a3 > 4) {
      int v9 = @"(unknown)";
    }
    else {
      int v9 = off_2645542F8[a3];
    }
    uint32_t v10 = v9;
    if ((unint64_t)a4 > 4) {
      __int16 v11 = @"(unknown)";
    }
    else {
      __int16 v11 = off_2645542F8[a4];
    }
    id v12 = v11;
    int v14 = 136315650;
    id v15 = "-[SVXSession _willChangeFromState:toState:]";
    __int16 v16 = 2112;
    __int16 v17 = v10;
    __int16 v18 = 2112;
    int64_t v19 = v12;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", (uint8_t *)&v14, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained session:self willChangeFromState:a3 toState:a4];

  if ((unint64_t)(a4 - 1) <= 3) {
    [(AFAnalytics *)self->_analytics logEventWithType:a4 + 1415 context:0];
  }
}

- (void)_handleAudioSessionDidBecomeActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[SVXSession _handleAudioSessionDidBecomeActive:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s flag = %d", (uint8_t *)&v7, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained session:self audioSessionDidBecomeActive:v3 activationContext:self->_currentActivationContext deactivationContext:self->_currentDeactivationContext];
}

- (void)_handleAudioSessionWillBecomeActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[SVXSession _handleAudioSessionWillBecomeActive:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s flag = %d", (uint8_t *)&v7, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained session:self audioSessionWillBecomeActive:v3 activationContext:self->_currentActivationContext deactivationContext:self->_currentDeactivationContext];
}

- (void)_handleDidFailStartPlaybackWithDestination:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    __int16 v9 = "-[SVXSession _handleDidFailStartPlaybackWithDestination:]";
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s destination = %ld", (uint8_t *)&v8, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    self->_isMostRecentRequestStartingMediaPlaybackLocally = 0;
  }
  else
  {
    int v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      __int16 v9 = "-[SVXSession _handleDidFailStartPlaybackWithDestination:]";
      _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_handleWillProcessStartPlaybackWithDestination:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = (os_log_t *)MEMORY[0x263F28348];
  int64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    int v14 = "-[SVXSession _handleWillProcessStartPlaybackWithDestination:intent:completion:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s destination = %ld, intent = %@", (uint8_t *)&v13, 0x20u);
  }
  if (!self->_currentRequestUUID)
  {
    uint64_t v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      int v14 = "-[SVXSession _handleWillProcessStartPlaybackWithDestination:intent:completion:]";
      _os_log_error_impl(&dword_220062000, v12, OS_LOG_TYPE_ERROR, "%s Failing without setting flags because _currentRequestUUID is nil (mostly likely a -prepareForAudioHandoffWithCompletion: call is happening outside of a request.", (uint8_t *)&v13, 0xCu);
      if (!v9) {
        goto LABEL_9;
      }
    }
    else if (!v9)
    {
      goto LABEL_9;
    }
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    goto LABEL_9;
  }
  self->_isMostRecentRequestStartingMediaPlaybackLocally = a3 == 1;
  if (v9) {
    (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, 1, 1);
  }
LABEL_9:
}

- (void)_handleDidHandleQuickStopWithActions:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[SVXSession _handleDidHandleQuickStopWithActions:]";
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s actions = %tu", (uint8_t *)&v8, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    [(SVXSession *)self _dismiss];
  }
  else
  {
    int v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[SVXSession _handleDidHandleQuickStopWithActions:]";
      _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_handleDidStopAudioPlaybackRequest:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_t *)MEMORY[0x263F28348];
  id v9 = *MEMORY[0x263F28348];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315650;
      __int16 v17 = "-[SVXSession _handleDidStopAudioPlaybackRequest:error:]";
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_error_impl(&dword_220062000, v9, OS_LOG_TYPE_ERROR, "%s request = %@, error = %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    __int16 v17 = "-[SVXSession _handleDidStopAudioPlaybackRequest:error:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v16, 0x16u);
  }
  __int16 v10 = [(NSMutableDictionary *)self->_playbackRequestInfo objectForKey:v6];
  if (v10)
  {
    unint64_t v11 = [MEMORY[0x263F08AB0] processInfo];
    [v11 systemUptime];
    objc_msgSend(v10, "setFinish:");

    [v10 setDidFinish:1];
    uint64_t v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315394;
      __int16 v17 = "-[SVXSession _handleDidStopAudioPlaybackRequest:error:]";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s updating finish time for request: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  int64_t v13 = [(SVXSoundUtils *)self->_soundUtils getIDFromAudioPlaybackRequest:v6];
  if (v13)
  {
    int64_t v14 = v13;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained session:self didStopSoundWithID:v14 error:v7];
  }
}

- (void)_handleDidStartAudioPlaybackRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    __int16 v15 = "-[SVXSession _handleDidStartAudioPlaybackRequest:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v14, 0x16u);
  }
  id v7 = [(NSMutableDictionary *)self->_playbackRequestInfo objectForKey:v4];
  if (v7)
  {
    int v8 = [MEMORY[0x263F08AB0] processInfo];
    [v8 systemUptime];
    objc_msgSend(v7, "setStart:");

    [v7 setDidStart:1];
    id v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      __int16 v15 = "-[SVXSession _handleDidStartAudioPlaybackRequest:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s updating start time for request: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  int64_t v10 = [(SVXSoundUtils *)self->_soundUtils getIDFromAudioPlaybackRequest:v4];
  if (v10)
  {
    int64_t v11 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained session:self didStartSoundWithID:v11];
  }
  if (self->_isStateFeedbackEnabled)
  {
    int64_t v13 = [(SVXSession *)self _stateFeedbackManager];
    [v13 audioPlaybackRequestDidStartForRequest:v4];
  }
}

- (void)_handleWillStartAudioPlaybackRequest:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    int64_t v10 = "-[SVXSession _handleWillStartAudioPlaybackRequest:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v9, 0x16u);
  }
  int64_t v6 = [(SVXSoundUtils *)self->_soundUtils getIDFromAudioPlaybackRequest:v4];
  if (v6)
  {
    int64_t v7 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained session:self willStartSoundWithID:v7];

    if (v7 == 3 && self->_currentRequestUUID && self->_currentState == 1)
    {
      [(SRSTClient *)self->_client dispatchEvent:0];
      [(SRSTClient *)self->_client dispatchEvent:5];
      [(SVXSession *)self _setCurrentState:2];
    }
  }
}

- (void)_handleAudioSessionDidEndInterruption:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int64_t v6 = "-[SVXSession _handleAudioSessionDidEndInterruption:]";
    __int16 v7 = 1024;
    BOOL v8 = v3;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s shouldResume = %d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)_handleAudioSessionDidBeginInterruption
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[SVXSession _handleAudioSessionDidBeginInterruption]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(SVXSession *)self _cancelRequestWithOptions:6 keepTaskTracker:0];
}

- (void)_handleDidChangeAudioSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    __int16 v7 = "-[SVXSession _handleDidChangeAudioSessionID:]";
    __int16 v8 = 2048;
    uint64_t v9 = v3;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s audioSessionID = %lu", (uint8_t *)&v6, 0x16u);
  }
  [(SVXSession *)self _setAudioSessionID:v3];
}

- (void)_handleShouldSpeak:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "-[SVXSession _handleShouldSpeak:]";
    __int16 v7 = 1024;
    BOOL v8 = v3;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s shouldSpeak = %d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)_handleRequestFailedWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (os_log_t *)MEMORY[0x263F28348];
  int v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[SVXSession _handleRequestFailedWithError:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v8, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    [(SVXSession *)self _requestDidEndWithOptions:0 error:v4];
  }
  else
  {
    __int16 v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[SVXSession _handleRequestFailedWithError:]";
      _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_handleReceivedCommand:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  int v6 = (__CFString *)a3;
  id v7 = a4;
  uint64_t v8 = mach_absolute_time();
  uint64_t v9 = (os_log_t *)MEMORY[0x263F28348];
  __int16 v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v43 = "-[SVXSession _handleReceivedCommand:completion:]";
    __int16 v44 = 2112;
    id v45 = v6;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s command = %@", buf, 0x16u);
  }
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __48__SVXSession__handleReceivedCommand_completion___block_invoke;
  v39[3] = &unk_2645547D8;
  id v11 = v7;
  id v41 = v11;
  uint64_t v12 = v6;
  v40 = v12;
  uint64_t v13 = (void (**)(void))MEMORY[0x223C65C40](v39);
  if (!self->_currentRequestUUID)
  {
    id v19 = [(__CFString *)v12 refId];

    if (v19)
    {
      __int16 v20 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v43 = "-[SVXSession _handleReceivedCommand:completion:]";
        _os_log_error_impl(&dword_220062000, v20, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil and the command.refId is not nil.", buf, 0xCu);
      }
LABEL_11:
      v13[2](v13);
      goto LABEL_27;
    }
  }
  int64_t v14 = [(SVXActivationContext *)self->_currentActivationContext source];
  int64_t v15 = v14;
  if (v14 == 5 || v14 == 3)
  {
    os_log_t v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      id v17 = v16;
      uint64_t v18 = off_264553510[v15];
      *(_DWORD *)buf = 136315394;
      id v43 = "-[SVXSession _handleReceivedCommand:completion:]";
      __int16 v44 = 2112;
      id v45 = v18;
      _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s Ignoring as current activation context is from %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  id v21 = [(__CFString *)v12 af_dialogPhase];
  int v22 = [v21 isExpository];

  if (!v22) {
    goto LABEL_26;
  }
  if (![(SVXAceViewSpeakableTextExtractor *)self->_aceViewSpeakableTextExtractor hasSpeakableTexts:v12])
  {
    uint64_t v23 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315394;
    id v43 = "-[SVXSession _handleReceivedCommand:completion:]";
    __int16 v44 = 2112;
    id v45 = v12;
    __int16 v24 = "%s Ignored %@ because it does not contain speakable texts.";
    goto LABEL_20;
  }
  if (self->_currentRequestDidPresentUUFR)
  {
    uint64_t v23 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315394;
    id v43 = "-[SVXSession _handleReceivedCommand:completion:]";
    __int16 v44 = 2112;
    id v45 = v12;
    __int16 v24 = "%s Ignored %@ because it is expository and UUFR has already been presented.";
    goto LABEL_20;
  }
  if (!self->_currentRequestWillPresentUUFR)
  {
LABEL_26:
    BOOL v38 = [(SVXServiceCommandHandler *)self->_serviceCommandHandler isCommandUUFR:v12];
    uint64_t v37 = v8;
    id v27 = [SVXTaskContext alloc];
    id v28 = objc_alloc(MEMORY[0x263F08C38]);
    __int16 v29 = [(__CFString *)v12 refId];
    uint64_t v30 = (void *)[v28 initWithUUIDString:v29];
    currentRequestUUID = self->_currentRequestUUID;
    v32 = [(__CFString *)v12 aceId];
    __int16 v33 = [(__CFString *)v12 refId];
    LOWORD(v36) = v38;
    uint64_t v34 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:](v27, "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", 11, v37, v30, currentRequestUUID, v32, v33, 0, 0, v36, 0, 0, 0, 0);

    uint64_t v35 = [(SVXTaskTrackingCenter *)self->_taskTrackingCenter beginTrackingTaskWithContext:v34 instrumentationContext:self->_currentRequestInstrumentationContext];
    [(SVXSession *)self _handleCommand:v12 taskTracker:v35 completion:v11];

    goto LABEL_27;
  }
  uint64_t v23 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v43 = "-[SVXSession _handleReceivedCommand:completion:]";
    __int16 v44 = 2112;
    id v45 = v12;
    __int16 v24 = "%s Ignored %@ because it is expository and UUFR is going to be presented.";
LABEL_20:
    _os_log_impl(&dword_220062000, v23, OS_LOG_TYPE_INFO, v24, buf, 0x16u);
  }
LABEL_21:
  if (v11)
  {
    id v25 = objc_alloc_init(MEMORY[0x263F64830]);
    __int16 v26 = [(__CFString *)v12 aceId];
    [v25 setRefId:v26];

    (*((void (**)(id, id))v11 + 2))(v11, v25);
  }
LABEL_27:
}

void __48__SVXSession__handleReceivedCommand_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = objc_alloc_init(MEMORY[0x263F64828]);
    uint64_t v2 = [*(id *)(a1 + 32) aceId];
    [v3 setRefId:v2];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_handleRequestFinished
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[SVXSession _handleRequestFinished]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    [(SVXSession *)self _requestDidEndWithOptions:0 error:0];
  }
  else
  {
    int v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[SVXSession _handleRequestFinished]";
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_handleDismissAssistant
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[SVXSession _handleDismissAssistant]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    [(SVXSession *)self _dismiss];
  }
  else
  {
    int v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[SVXSession _handleDismissAssistant]";
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_handleRequestWillStart
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[SVXSession _handleRequestWillStart]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }
  if (!self->_currentRequestUUID) {
    [(SVXSession *)self _requestWillBeginWithTaskTracker:0];
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0 && self->_activityState == 3)
  {
    self->_activityState = 4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    currentActivationContext = self->_currentActivationContext;
    activityUUID = self->_activityUUID;
    uint64_t v8 = [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentRequestInstrumentationContext turnIdentifier];
    [WeakRetained session:self didBecomeActiveWithActivationContext:currentActivationContext activityUUID:activityUUID turnID:v8];

    uint64_t v9 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = self->_activityUUID;
      int v11 = 136315394;
      uint64_t v12 = "-[SVXSession _handleRequestWillStart]";
      __int16 v13 = 2112;
      int64_t v14 = v10;
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", (uint8_t *)&v11, 0x16u);
    }
    SVXInstrumentationEmitViewAppearContextEnd(self->_currentRequestInstrumentationContext);
  }
}

- (void)_handleSpeechRecognizedPartialResult:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (SVXActivationContext *)a3;
  int v5 = (os_log_t *)MEMORY[0x263F28348];
  int v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    int64_t v14 = "-[SVXSession _handleSpeechRecognizedPartialResult:]";
    __int16 v15 = 2112;
    os_log_t v16 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s partialResult = %@", (uint8_t *)&v13, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    os_log_t v7 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v13 = 136315138;
    int64_t v14 = "-[SVXSession _handleSpeechRecognizedPartialResult:]";
    uint64_t v8 = "%s Ignored because _currentRequestUUID is nil.";
    uint64_t v9 = v7;
    uint32_t v10 = 12;
LABEL_11:
    _os_log_error_impl(&dword_220062000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    goto LABEL_9;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    os_log_t v11 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    currentActivationContext = self->_currentActivationContext;
    int v13 = 136315394;
    int64_t v14 = "-[SVXSession _handleSpeechRecognizedPartialResult:]";
    __int16 v15 = 2112;
    os_log_t v16 = currentActivationContext;
    uint64_t v8 = "%s _currentActivationContext does not allow speech recording and recognition. (_currentActivationContext = %@)";
    uint64_t v9 = v11;
    uint32_t v10 = 22;
    goto LABEL_11;
  }
  [(SVXSession *)self _handleReceivedCommand:v4 completion:&__block_literal_global_198];
LABEL_9:
}

void __51__SVXSession__handleSpeechRecognizedPartialResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    int v5 = "-[SVXSession _handleSpeechRecognizedPartialResult:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s response = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_handleSpeechRecognized:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v4 = (__CFString *)a3;
  int v5 = (os_log_t *)MEMORY[0x263F28348];
  __int16 v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    __int16 v20 = "-[SVXSession _handleSpeechRecognized:]";
    __int16 v21 = 2112;
    int v22 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s speechRecognized = %@", (uint8_t *)&v19, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    os_log_t v13 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v19 = 136315138;
    __int16 v20 = "-[SVXSession _handleSpeechRecognized:]";
    int64_t v14 = "%s Ignored because _currentRequestUUID is nil.";
    __int16 v15 = v13;
    uint32_t v16 = 12;
LABEL_13:
    _os_log_error_impl(&dword_220062000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, v16);
    goto LABEL_17;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    os_log_t v17 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    currentActivationContext = self->_currentActivationContext;
    int v19 = 136315394;
    __int16 v20 = "-[SVXSession _handleSpeechRecognized:]";
    __int16 v21 = 2112;
    int v22 = (__CFString *)currentActivationContext;
    int64_t v14 = "%s _currentActivationContext does not allow speech recording and recognition. (_currentActivationContext = %@)";
    __int16 v15 = v17;
    uint32_t v16 = 22;
    goto LABEL_13;
  }
  id v7 = [(SVXActivationContext *)self->_currentActivationContext requestInfo];
  uint64_t v8 = [v7 speechRequestOptions];
  uint64_t v9 = [v8 activationEvent];

  if (v9 == 30)
  {
    if (self->_currentState == 2)
    {
      os_log_t v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        os_log_t v11 = v10;
        uint64_t v12 = @"listening";
        int v19 = 136315394;
        __int16 v20 = "-[SVXSession _handleSpeechRecognized:]";
        __int16 v21 = 2112;
        int v22 = @"listening";
        _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s _currentState is %@ when speech is recognized and state transitions should be skipped", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    [(SRSTClient *)self->_client dispatchEvent:6];
    if (self->_currentState == 2 && !self->_isStateFeedbackEnabled) {
      [(SVXSession *)self _setCurrentState:3];
    }
  }
LABEL_17:
}

- (void)_handleSpeechRecognitionDidFailWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v4 = (SVXActivationContext *)a3;
  int v5 = (os_log_t *)MEMORY[0x263F28348];
  __int16 v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    int64_t v14 = "-[SVXSession _handleSpeechRecognitionDidFailWithError:]";
    __int16 v15 = 2112;
    uint32_t v16 = v4;
    _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v13, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
    {
      os_log_t v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        currentActivationContext = self->_currentActivationContext;
        int v13 = 136315394;
        int64_t v14 = "-[SVXSession _handleSpeechRecognitionDidFailWithError:]";
        __int16 v15 = 2112;
        uint32_t v16 = currentActivationContext;
        uint64_t v9 = "%s _currentActivationContext does not allow speech recording and recognition. (_currentActivationContext = %@)";
        os_log_t v10 = v7;
        uint32_t v11 = 22;
LABEL_10:
        _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, v11);
      }
    }
  }
  else
  {
    os_log_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      int64_t v14 = "-[SVXSession _handleSpeechRecognitionDidFailWithError:]";
      uint64_t v9 = "%s Ignored because _currentRequestUUID is nil.";
      os_log_t v10 = v12;
      uint32_t v11 = 12;
      goto LABEL_10;
    }
  }
}

- (void)_handleSpeechRecordingDidFailWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v4 = (__CFString *)a3;
  int v5 = (os_log_t *)MEMORY[0x263F28348];
  __int16 v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315394;
    __int16 v20 = "-[SVXSession _handleSpeechRecordingDidFailWithError:]";
    __int16 v21 = 2112;
    int v22 = v4;
    _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v19, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    os_log_t v8 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v19 = 136315138;
    __int16 v20 = "-[SVXSession _handleSpeechRecordingDidFailWithError:]";
    uint64_t v9 = "%s Ignored because _currentRequestUUID is nil.";
    os_log_t v10 = v8;
    uint32_t v11 = 12;
LABEL_13:
    _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v19, v11);
    goto LABEL_11;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    os_log_t v12 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    currentActivationContext = self->_currentActivationContext;
    int v19 = 136315394;
    __int16 v20 = "-[SVXSession _handleSpeechRecordingDidFailWithError:]";
    __int16 v21 = 2112;
    int v22 = (__CFString *)currentActivationContext;
    uint64_t v9 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    os_log_t v10 = v12;
    uint32_t v11 = 22;
    goto LABEL_13;
  }
  if (self->_currentState != 2)
  {
    os_log_t v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      int64_t v14 = v7;
      __int16 v15 = @"listening";
      unint64_t currentState = self->_currentState;
      if (currentState > 4) {
        uint64_t v17 = @"(unknown)";
      }
      else {
        uint64_t v17 = off_2645542F8[currentState];
      }
      uint64_t v18 = v17;
      int v19 = 136315650;
      __int16 v20 = "-[SVXSession _handleSpeechRecordingDidFailWithError:]";
      __int16 v21 = 2112;
      int v22 = @"listening";
      __int16 v23 = 2112;
      __int16 v24 = v18;
      _os_log_error_impl(&dword_220062000, v14, OS_LOG_TYPE_ERROR, "%s _currentState is expected to be %@ when the speech recording is failed. (_unint64_t currentState = %@)", (uint8_t *)&v19, 0x20u);
    }
    [(SVXSession *)self _continuePendingSpeechRequest:0];
  }
LABEL_11:
}

- (void)_handleSpeechRecordingDidCancel
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    uint64_t v18 = "-[SVXSession _handleSpeechRecordingDidCancel]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v17, 0xCu);
  }
  if (!self->_currentRequestUUID)
  {
    os_log_t v10 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v17 = 136315138;
    uint64_t v18 = "-[SVXSession _handleSpeechRecordingDidCancel]";
    uint32_t v11 = "%s Ignored because _currentRequestUUID is nil.";
    os_log_t v12 = v10;
    uint32_t v13 = 12;
    goto LABEL_14;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    os_log_t v14 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      return;
    }
    currentActivationContext = self->_currentActivationContext;
    int v17 = 136315394;
    uint64_t v18 = "-[SVXSession _handleSpeechRecordingDidCancel]";
    __int16 v19 = 2112;
    __int16 v20 = (__CFString *)currentActivationContext;
    uint32_t v11 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    os_log_t v12 = v14;
    uint32_t v13 = 22;
LABEL_14:
    _os_log_error_impl(&dword_220062000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v17, v13);
    return;
  }
  if (self->_currentState != 2)
  {
    os_log_t v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      __int16 v6 = v5;
      os_log_t v7 = @"listening";
      unint64_t currentState = self->_currentState;
      if (currentState > 4) {
        uint64_t v9 = @"(unknown)";
      }
      else {
        uint64_t v9 = off_2645542F8[currentState];
      }
      uint32_t v16 = v9;
      int v17 = 136315650;
      uint64_t v18 = "-[SVXSession _handleSpeechRecordingDidCancel]";
      __int16 v19 = 2112;
      __int16 v20 = @"listening";
      __int16 v21 = 2112;
      int v22 = v16;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s _currentState is expected to be %@ when the speech recording is canceled. (_unint64_t currentState = %@)", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)_handleSpeechRecordingDidEnd
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    uint64_t v18 = "-[SVXSession _handleSpeechRecordingDidEnd]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v17, 0xCu);
  }
  if (!self->_currentRequestUUID)
  {
    os_log_t v5 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v17 = 136315138;
    uint64_t v18 = "-[SVXSession _handleSpeechRecordingDidEnd]";
    __int16 v6 = "%s Ignored because _currentRequestUUID is nil.";
    os_log_t v7 = v5;
    uint32_t v8 = 12;
    goto LABEL_12;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    os_log_t v9 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      return;
    }
    currentActivationContext = self->_currentActivationContext;
    int v17 = 136315394;
    uint64_t v18 = "-[SVXSession _handleSpeechRecordingDidEnd]";
    __int16 v19 = 2112;
    __int16 v20 = (__CFString *)currentActivationContext;
    __int16 v6 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    os_log_t v7 = v9;
    uint32_t v8 = 22;
LABEL_12:
    _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v17, v8);
    return;
  }
  [(SRSTClient *)self->_client dispatchEvent:6];
  if (self->_currentState == 2)
  {
    if (!self->_isStateFeedbackEnabled) {
      [(SVXSession *)self _setCurrentState:3];
    }
  }
  else
  {
    os_log_t v11 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      os_log_t v12 = v11;
      uint32_t v13 = @"listening";
      unint64_t currentState = self->_currentState;
      if (currentState > 4) {
        __int16 v15 = @"(unknown)";
      }
      else {
        __int16 v15 = off_2645542F8[currentState];
      }
      uint32_t v16 = v15;
      int v17 = 136315650;
      uint64_t v18 = "-[SVXSession _handleSpeechRecordingDidEnd]";
      __int16 v19 = 2112;
      __int16 v20 = @"listening";
      __int16 v21 = 2112;
      int v22 = v16;
      _os_log_error_impl(&dword_220062000, v12, OS_LOG_TYPE_ERROR, "%s _currentState is expected to be %@ when the speech recording is ended. (_unint64_t currentState = %@)", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)_handleSpeechRecordingPerformTwoShotPromptWithType:(int64_t)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  __int16 v6 = (void (**)(id, void *, __n128, __n128))a4;
  os_log_t v7 = (os_log_t *)MEMORY[0x263F28348];
  uint32_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v24 = "-[SVXSession _handleSpeechRecordingPerformTwoShotPromptWithType:completion:]";
    __int16 v25 = 2048;
    int64_t v26 = a3;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s type = %ld", buf, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    os_log_t v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v24 = "-[SVXSession _handleSpeechRecordingPerformTwoShotPromptWithType:completion:]";
      _os_log_error_impl(&dword_220062000, v12, OS_LOG_TYPE_ERROR, "%s Failing with invalid times because _currentRequestUUID is nil.", buf, 0xCu);
      if (!v6) {
        goto LABEL_17;
      }
    }
    else if (!v6)
    {
      goto LABEL_17;
    }
    os_log_t v11 = [MEMORY[0x263F28508] errorWithCode:28];
    v13.n128_u64[0] = -1.0;
    v14.n128_u64[0] = -1.0;
    v6[2](v6, v11, v13, v14);
    goto LABEL_16;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    __int16 v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      currentActivationContext = self->_currentActivationContext;
      *(_DWORD *)buf = 136315394;
      __int16 v24 = "-[SVXSession _handleSpeechRecordingPerformTwoShotPromptWithType:completion:]";
      __int16 v25 = 2112;
      int64_t v26 = (int64_t)currentActivationContext;
      _os_log_error_impl(&dword_220062000, v15, OS_LOG_TYPE_ERROR, "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)", buf, 0x16u);
      if (!v6) {
        goto LABEL_17;
      }
    }
    else if (!v6)
    {
      goto LABEL_17;
    }
    os_log_t v11 = [MEMORY[0x263F28508] errorWithCode:15 description:@"Current activation context does not allow speech recording." underlyingError:0];
LABEL_15:
    v16.n128_u64[0] = 0;
    v17.n128_u64[0] = 0;
    v6[2](v6, v11, v16, v17);
    goto LABEL_16;
  }
  if (a3 == 2)
  {
    speechSynthesizer = self->_speechSynthesizer;
    os_log_t v10 = [(SVXSpeechSynthesisUtils *)self->_speechSynthesisUtils createPhaticPrompt];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __76__SVXSession__handleSpeechRecordingPerformTwoShotPromptWithType_completion___block_invoke;
    v21[3] = &unk_2645546C8;
    int v22 = v6;
    [(SVXSpeechSynthesizer *)speechSynthesizer enqueueRequest:v10 languageCode:0 voiceName:0 gender:0 audioSessionID:0 preparation:0 finalization:v21 taskTracker:0 analyticsContext:0];

    os_log_t v11 = v22;
LABEL_16:

    goto LABEL_17;
  }
  if (v6)
  {
    uint64_t v18 = (void *)MEMORY[0x263F28508];
    __int16 v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unsupported Two-Shot prompt type %ld.", a3);
    os_log_t v11 = [v18 errorWithCode:15 description:v19 underlyingError:0];

    goto LABEL_15;
  }
LABEL_17:
}

void __76__SVXSession__handleSpeechRecordingPerformTwoShotPromptWithType_completion___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = [a2 error];
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = (id)v3;
    if (v3)
    {
      os_log_t v5 = [MEMORY[0x263F28508] errorWithCode:15 description:@"Failed to play phatic prompt." underlyingError:v3];
      (*(void (**)(uint64_t, void *, double, double))(v4 + 16))(v4, v5, 0.0, 0.0);
    }
    else
    {
      (*(void (**)(uint64_t, void, double, double))(v4 + 16))(v4, 0, 0.0, 0.0);
    }
  }
}

- (void)_handleSpeechRecordingDidDetectStartpoint
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    os_log_t v12 = "-[SVXSession _handleSpeechRecordingDidDetectStartpoint]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
    {
      os_log_t v5 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        currentActivationContext = self->_currentActivationContext;
        int v11 = 136315394;
        os_log_t v12 = "-[SVXSession _handleSpeechRecordingDidDetectStartpoint]";
        __int16 v13 = 2112;
        __n128 v14 = currentActivationContext;
        os_log_t v7 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
        uint32_t v8 = v5;
        uint32_t v9 = 22;
LABEL_10:
        _os_log_error_impl(&dword_220062000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
      }
    }
  }
  else
  {
    os_log_t v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      os_log_t v12 = "-[SVXSession _handleSpeechRecordingDidDetectStartpoint]";
      os_log_t v7 = "%s Ignored because _currentRequestUUID is nil.";
      uint32_t v8 = v10;
      uint32_t v9 = 12;
      goto LABEL_10;
    }
  }
}

- (void)_handleSpeechRecordingDidChangeAVRecordRoute:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (SVXActivationContext *)a3;
  os_log_t v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    __n128 v14 = "-[SVXSession _handleSpeechRecordingDidChangeAVRecordRoute:]";
    __int16 v15 = 2112;
    __n128 v16 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s recordRoute = %@", (uint8_t *)&v13, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
    {
      os_log_t v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        currentActivationContext = self->_currentActivationContext;
        int v13 = 136315394;
        __n128 v14 = "-[SVXSession _handleSpeechRecordingDidChangeAVRecordRoute:]";
        __int16 v15 = 2112;
        __n128 v16 = currentActivationContext;
        uint32_t v9 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
        os_log_t v10 = v7;
        uint32_t v11 = 22;
LABEL_10:
        _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, v11);
      }
    }
  }
  else
  {
    os_log_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      __n128 v14 = "-[SVXSession _handleSpeechRecordingDidChangeAVRecordRoute:]";
      uint32_t v9 = "%s Ignored because _currentRequestUUID is nil.";
      os_log_t v10 = v12;
      uint32_t v11 = 12;
      goto LABEL_10;
    }
  }
}

- (void)_handleSpeechRecordingDidBeginOnAVRecordRoute:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (SVXActivationContext *)a3;
  os_log_t v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    __n128 v14 = "-[SVXSession _handleSpeechRecordingDidBeginOnAVRecordRoute:]";
    __int16 v15 = 2112;
    __n128 v16 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s recordRoute = %@", (uint8_t *)&v13, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    os_log_t v7 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v13 = 136315138;
    __n128 v14 = "-[SVXSession _handleSpeechRecordingDidBeginOnAVRecordRoute:]";
    uint32_t v8 = "%s Ignored because _currentRequestUUID is nil.";
    uint32_t v9 = v7;
    uint32_t v10 = 12;
LABEL_11:
    _os_log_error_impl(&dword_220062000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    goto LABEL_9;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    os_log_t v11 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    currentActivationContext = self->_currentActivationContext;
    int v13 = 136315394;
    __n128 v14 = "-[SVXSession _handleSpeechRecordingDidBeginOnAVRecordRoute:]";
    __int16 v15 = 2112;
    __n128 v16 = currentActivationContext;
    uint32_t v8 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    uint32_t v9 = v11;
    uint32_t v10 = 22;
    goto LABEL_11;
  }
  [(SRSTClient *)self->_client dispatchEvent:0];
  [(SVXSession *)self _setCurrentState:2];
  [(SVXSpeechSynthesizer *)self->_speechSynthesizer prewarm];
LABEL_9:
}

- (void)_handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_t v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    uint64_t v23 = "-[SVXSession _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s wrapper = %@", (uint8_t *)&v22, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    os_log_t v16 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v22 = 136315138;
    uint64_t v23 = "-[SVXSession _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
    uint64_t v17 = "%s Ignored because _currentRequestUUID is nil.";
    uint64_t v18 = v16;
    uint32_t v19 = 12;
LABEL_21:
    _os_log_error_impl(&dword_220062000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, v19);
    goto LABEL_19;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    os_log_t v20 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    currentActivationContext = self->_currentActivationContext;
    int v22 = 136315394;
    uint64_t v23 = "-[SVXSession _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
    __int16 v24 = 2112;
    id v25 = currentActivationContext;
    uint64_t v17 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    uint64_t v18 = v20;
    uint32_t v19 = 22;
    goto LABEL_21;
  }
  if (self->_activityState == 3)
  {
    self->_activityState = 4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint32_t v8 = self->_currentActivationContext;
    activityUUID = self->_activityUUID;
    uint32_t v10 = [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentRequestInstrumentationContext turnIdentifier];
    [WeakRetained session:self didBecomeActiveWithActivationContext:v8 activityUUID:activityUUID turnID:v10];

    os_log_t v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      os_log_t v12 = self->_activityUUID;
      int v22 = 136315394;
      uint64_t v23 = "-[SVXSession _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", (uint8_t *)&v22, 0x16u);
    }
    int v13 = (id)*MEMORY[0x263F28378];
    __n128 v14 = v13;
    os_signpost_id_t launchSignpostID = self->_launchSignpostID;
    if (launchSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_220062000, v14, OS_SIGNPOST_INTERVAL_END, launchSignpostID, "voiceUILaunch", (const char *)&unk_2200FF23F, (uint8_t *)&v22, 2u);
    }

    SVXInstrumentationEmitViewAppearContextEnd(self->_currentRequestInstrumentationContext);
  }
  [(SVXSession *)self _setInputAudioPowerWrapper:v4];
  if ([(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions activationEvent] != 1
    || ([(AFPreferences *)self->_preferences startAlertEnabled] & 1) == 0)
  {
    [(SRSTClient *)self->_client dispatchEvent:0];
    [(SVXSession *)self _setCurrentState:2];
  }
  [(SVXSession *)self _continuePendingSpeechRequest:1];
LABEL_19:
}

- (void)_requestDidEndWithOptions:(unint64_t)a3 error:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = mach_absolute_time();
  uint32_t v9 = (os_log_t *)MEMORY[0x263F28348];
  uint32_t v10 = *MEMORY[0x263F28348];
  if (v7)
  {
    uint64_t v11 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
      __int16 v38 = 2048;
      unint64_t v39 = a3;
      __int16 v40 = 2112;
      unint64_t v41 = (unint64_t)v7;
      _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, "%s options = %tu, error = %@", buf, 0x20u);
    }
    p_currentRequestUUID = &self->_currentRequestUUID;
    if (self->_currentRequestUUID)
    {
      if ((a3 & 2) != 0)
      {
        os_log_t v14 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
          __int16 v38 = 2112;
          unint64_t v39 = (unint64_t)v7;
          __int16 v40 = 2048;
          unint64_t v41 = a3;
          __int16 v15 = "%s Ignored presenting %@ because request ending options = %tu.";
          os_log_t v16 = v14;
          uint32_t v17 = 32;
LABEL_17:
          _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
        }
      }
      else
      {
        if (self->_currentRequestWillPresentUUFR)
        {
          int v13 = *v9;
        }
        else
        {
          int v13 = *v9;
          if (!self->_currentRequestDidPresentUUFR)
          {
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
              _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s Using built-in error dialogs.", buf, 0xCu);
            }
            LOWORD(v34) = 0;
            v32 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:]([SVXTaskContext alloc], "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", 9, v11, 0, self->_currentRequestUUID, 0, 0, 0, 0, v34, 0, 0, 0, v7);
            __int16 v33 = [(SVXTaskTrackingCenter *)self->_taskTrackingCenter beginTrackingTaskWithContext:v32 instrumentationContext:self->_currentRequestInstrumentationContext];
            [(SVXSession *)self _presentError:v7 taskTracker:v33 completion:0];

            goto LABEL_18;
          }
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
          __int16 v38 = 2112;
          unint64_t v39 = (unint64_t)v7;
          __int16 v15 = "%s Ignored presenting %@ because UUFR was presented.";
          os_log_t v16 = v13;
          uint32_t v17 = 22;
          goto LABEL_17;
        }
      }
LABEL_18:
      uint64_t v18 = *v9;
      BOOL v19 = os_log_type_enabled(*v9, OS_LOG_TYPE_INFO);
      os_log_t v20 = *p_currentRequestUUID;
      if (v19)
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
        __int16 v38 = 2112;
        unint64_t v39 = (unint64_t)v20;
        _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_INFO, "%s END REQUEST (_currentRequestUUID = %@)", buf, 0x16u);
        os_log_t v20 = *p_currentRequestUUID;
      }
      *p_currentRequestUUID = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
      __int16 v38 = 2048;
      unint64_t v39 = a3;
      _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s options = %tu", buf, 0x16u);
    }
    p_currentRequestUUID = &self->_currentRequestUUID;
    if (self->_currentRequestUUID) {
      goto LABEL_18;
    }
  }
  currentRequestInstrumentationContext = self->_currentRequestInstrumentationContext;
  if (currentRequestInstrumentationContext)
  {
    objc_storeStrong((id *)&self->_previousRequestInstrumentationContext, currentRequestInstrumentationContext);
    int v22 = self->_currentRequestInstrumentationContext;
  }
  else
  {
    int v22 = 0;
  }
  self->_currentRequestInstrumentationContext = 0;

  *(_WORD *)&self->_currentRequestWillPresentUUFR = 0;
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  self->_currentSpeechRequestOptions = 0;

  [(SVXSession *)self _continuePendingSpeechRequest:0];
  if ((a3 & 4) == 0)
  {
    performer = self->_performer;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __46__SVXSession__requestDidEndWithOptions_error___block_invoke;
    v35[3] = &unk_2645548A0;
    v35[4] = self;
    [(SVXPerforming *)performer performBlock:v35 withOptions:0];
    if (a3) {
      goto LABEL_26;
    }
LABEL_29:
    uint64_t v26 = NSString;
    uint64_t v27 = NSStringFromSelector(a2);
    id v28 = [v26 stringWithFormat:@"%@ %@", v27, v7];
    [(SVXSession *)self _resignActiveForReason:v28];

    goto LABEL_30;
  }
  [(SVXSession *)self _discardPendingRequestBarriers];
  if ((a3 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_26:
  id v25 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
    __int16 v38 = 2048;
    unint64_t v39 = a3;
    _os_log_impl(&dword_220062000, v25, OS_LOG_TYPE_INFO, "%s Ignored resign active because request ending options = %tu", buf, 0x16u);
  }
LABEL_30:
  if (self->_isStateFeedbackEnabled && self->_stateFeedbackManager)
  {
    __int16 v29 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
      _os_log_impl(&dword_220062000, v29, OS_LOG_TYPE_INFO, "%s #svxstatefeedback Ending StateFeedbackManager.", buf, 0xCu);
    }
    uint64_t v30 = [(SVXSession *)self _stateFeedbackManager];
    [v30 siriSessionDidEnd];

    stateFeedbackManager = self->_stateFeedbackManager;
    self->_stateFeedbackManager = 0;
  }
}

uint64_t __46__SVXSession__requestDidEndWithOptions_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextPendingRequestBarrier];
}

- (void)_requestWillBeginWithTaskTracker:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
    __int16 v79 = 2112;
    id v80 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s taskTracker = %@", buf, 0x16u);
  }
  id v6 = [v4 context];
  [(SVXSession *)self _stopSessionIdleTimer];
  p_currentRequestUUID = &self->_currentRequestUUID;
  if (self->_currentRequestUUID)
  {
    [(SVXSession *)self _cancelRequestWithOptions:7 keepTaskTracker:v4];
  }
  else
  {
    [(SVXServiceCommandHandler *)self->_serviceCommandHandler reset];
    [(SVXSpeechSynthesizer *)self->_speechSynthesizer cancelPendingRequests];
    [(SVXSpeechSynthesizer *)self->_speechSynthesizer stopCurrentRequestWithInterruptionBehavior:1];
    taskTrackingCenter = self->_taskTrackingCenter;
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __47__SVXSession__requestWillBeginWithTaskTracker___block_invoke;
    v75[3] = &unk_264553DC0;
    id v76 = v6;
    [(SVXTaskTrackingCenter *)taskTrackingCenter endTrackingTasksPassingTest:v75];
    [(SVXSession *)self _discardPendingRequestBarriers];
    if (([v4 listensAfterSpeaking] & 1) == 0)
    {
      [(SRSTClient *)self->_client dispatchEvent:10];
      [(SVXSession *)self _setCurrentState:1];
    }
  }
  currentRequestUUID = self->_currentRequestUUID;
  self->_currentRequestUUID = 0;

  currentActivationContext = self->_currentActivationContext;
  self->_currentActivationContext = 0;

  currentDeactivationContext = self->_currentDeactivationContext;
  self->_currentDeactivationContext = 0;

  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  self->_currentSpeechRequestOptions = 0;

  *(_WORD *)&self->_currentRequestWillPresentUUFR = 0;
  p_currentRequestInstrumentationContext = (id *)&self->_currentRequestInstrumentationContext;
  currentRequestInstrumentationContext = self->_currentRequestInstrumentationContext;
  self->_currentRequestInstrumentationContext = 0;

  [(SVXSession *)self _continuePendingSpeechRequest:0];
  *(_WORD *)&self->_isMostRecentRequestStartingMediaPlaybackLocally = 0;
  uint64_t v15 = [v6 origin];
  id v72 = 0;
  obj = 0;
  if (v15 == 1)
  {
    obj = [v6 activationContext];
    id v72 = [v6 requestUUID];
  }
  id v74 = [v4 instrumentationContext];
  os_log_t v16 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
    __int16 v79 = 2112;
    id v80 = v74;
    _os_log_debug_impl(&dword_220062000, v16, OS_LOG_TYPE_DEBUG, "%s instrumentationContext = %@", buf, 0x16u);
  }
  if ((unint64_t)(self->_activityState - 1) <= 1)
  {
    uint32_t v17 = v6;
    self->_activityState = 3;
    uint64_t v18 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    activityUUID = self->_activityUUID;
    self->_activityUUID = v18;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v21 = obj;
    if (!obj) {
      __int16 v21 = self->_currentActivationContext;
    }
    int v22 = self->_activityUUID;
    uint64_t v23 = [v74 turnIdentifier];
    [WeakRetained session:self willBecomeActiveWithActivationContext:v21 activityUUID:v22 turnID:v23];

    __int16 v24 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      id v25 = self->_activityUUID;
      *(_DWORD *)buf = 136315394;
      v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
      __int16 v79 = 2112;
      id v80 = v25;
      _os_log_impl(&dword_220062000, v24, OS_LOG_TYPE_INFO, "%s SESSION GOING ACTIVE (%@)", buf, 0x16u);
    }
    uint64_t v26 = (objc_class *)MEMORY[0x263F6EE10];
    id v27 = v74;
    id v28 = objc_alloc_init(v26);
    id v29 = objc_alloc_init(MEMORY[0x263F6EE20]);
    [v29 setExists:1];
    [v28 setStartedOrChanged:v29];
    [v27 emitInstrumentation:v28];

    id v6 = v17;
    p_currentRequestUUID = &self->_currentRequestUUID;
  }
  if (v15 == 1)
  {
    objc_storeStrong((id *)&self->_currentActivationContext, obj);
    objc_storeStrong((id *)p_currentRequestUUID, v72);
  }
  if (!*p_currentRequestUUID)
  {
    uint64_t v30 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    uint64_t v31 = *p_currentRequestUUID;
    *p_currentRequestUUID = v30;
  }
  objc_storeStrong((id *)&self->_currentRequestInstrumentationContext, v74);
  if (v15 == 1)
  {
    id v32 = *p_currentRequestInstrumentationContext;
    id v33 = [v4 activationContext];
    uint64_t v34 = (objc_class *)MEMORY[0x263F6ED78];
    id v70 = v32;
    id v35 = objc_alloc_init(v34);
    uint64_t v36 = [v33 source];
    uint64_t v37 = [v33 requestInfo];
    __int16 v38 = [v37 speechRequestOptions];

    uint64_t SchemaInvocationSourceForVoiceTrigger = 0;
    __int16 v40 = v38;
    switch(v36)
    {
      case 1:
        unint64_t v41 = [v33 buttonEvent];
        if ([v41 type] == 2)
        {
          uint64_t v42 = *MEMORY[0x263F28348];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO)) {
            goto LABEL_41;
          }
          *(_DWORD *)buf = 136315138;
          v78 = "SVXInstrumentationEmitInvocation";
          id v43 = "%s button_track SVXButtonEventTypeUp";
          __int16 v44 = v42;
        }
        else
        {
          uint64_t v46 = [v41 type];
          v47 = *MEMORY[0x263F28348];
          BOOL v48 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO);
          if (v46 == 1)
          {
            if (!v48) {
              goto LABEL_41;
            }
            *(_DWORD *)buf = 136315138;
            v78 = "SVXInstrumentationEmitInvocation";
            id v43 = "%s button_track SVXButtonEventTypeDown";
          }
          else
          {
            if (!v48) {
              goto LABEL_41;
            }
            *(_DWORD *)buf = 136315138;
            v78 = "SVXInstrumentationEmitInvocation";
            id v43 = "%s Different button event";
          }
          __int16 v44 = v47;
        }
        _os_log_impl(&dword_220062000, v44, OS_LOG_TYPE_INFO, v43, buf, 0xCu);
LABEL_41:

        uint64_t SchemaInvocationSourceForVoiceTrigger = 18;
LABEL_46:
        objc_msgSend(v35, "setInvocationSource:", SchemaInvocationSourceForVoiceTrigger, v70);
        v53 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          if ((SchemaInvocationSourceForVoiceTrigger - 1) > 0x53) {
            v54 = @"INVOCATIONSOURCE_UNKNOWN_INVOCATION_SOURCE";
          }
          else {
            v54 = off_264552860[(SchemaInvocationSourceForVoiceTrigger - 1)];
          }
          *(_DWORD *)buf = 136315394;
          v78 = "SVXInstrumentationEmitInvocation";
          __int16 v79 = 2112;
          id v80 = v54;
          v55 = v53;
          _os_log_impl(&dword_220062000, v55, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit invocation event (source %@)", buf, 0x16u);
        }
        [v71 emitInstrumentation:v35];

        v56 = [v4 activationContext];
        uint64_t v57 = [v56 source];

        BOOL v58 = v57 == 1;
        p_currentRequestUUID = &self->_currentRequestUUID;
        if (v58)
        {
          v59 = [*p_currentRequestInstrumentationContext turnIdentifier];
          v60 = [v4 activationContext];
          v61 = [v60 buttonEvent];
          uint64_t v62 = [v61 timestamp];

          v63 = (void *)*MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
          {
            v68 = v63;
            v69 = MEMORY[0x223C655B0](v59);
            *(_DWORD *)buf = 136315650;
            v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
            __int16 v79 = 2112;
            id v80 = v69;
            __int16 v81 = 2048;
            uint64_t v82 = v62;
            _os_log_debug_impl(&dword_220062000, v68, OS_LOG_TYPE_DEBUG, "%s Button down event: turnId = %@, timestamp = %lld", buf, 0x20u);
          }
          v64 = [[SVXActivationInstrumentation alloc] initWithTurnIdentifier:v59 buttonTimestamp:v62];
          svxActivationInstrumentation = self->_svxActivationInstrumentation;
          self->_svxActivationInstrumentation = v64;

          p_currentRequestUUID = &self->_currentRequestUUID;
        }
        break;
      case 2:
        uint64_t SchemaInvocationSourceForVoiceTrigger = 50;
        goto LABEL_46;
      case 3:
      case 5:
        goto LABEL_46;
      case 4:
        uint64_t SchemaInvocationSourceForVoiceTrigger = 52;
        goto LABEL_46;
      case 6:
        goto LABEL_30;
      case 7:
        if ([v38 isVoiceTrigger])
        {
LABEL_30:
          id v45 = objc_msgSend(v38, "voiceTriggerEventInfo", v70);
          uint64_t SchemaInvocationSourceForVoiceTrigger = _getSchemaInvocationSourceForVoiceTrigger(v45);
        }
        else
        {
          __int16 v49 = [v33 requestInfo];
          uint64_t v50 = [v49 activationEvent];

          if (v50 == 8)
          {
            uint64_t SchemaInvocationSourceForVoiceTrigger = 50;
          }
          else
          {
            uint64_t v51 = [v33 requestInfo];
            uint64_t v52 = [v51 activationEvent];

            if (v52 == 6) {
              uint64_t SchemaInvocationSourceForVoiceTrigger = 84;
            }
            else {
              uint64_t SchemaInvocationSourceForVoiceTrigger = 0;
            }
          }
LABEL_45:
          __int16 v40 = v38;
        }
        goto LABEL_46;
      case 8:
        uint64_t SchemaInvocationSourceForVoiceTrigger = 79;
        goto LABEL_46;
      default:
        goto LABEL_45;
    }
  }
  v66 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v67 = *p_currentRequestUUID;
    *(_DWORD *)buf = 136315394;
    v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
    __int16 v79 = 2112;
    id v80 = v67;
    _os_log_impl(&dword_220062000, v66, OS_LOG_TYPE_INFO, "%s BEGIN REQUEST (_currentRequestUUID = %@)", buf, 0x16u);
  }
}

uint64_t __47__SVXSession__requestWillBeginWithTaskTracker___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

- (void)_invalidate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (NSObject **)MEMORY[0x263F28348];
  os_log_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[SVXSession _invalidate]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  postResignActiveBlock = (void (**)(void))self->_postResignActiveBlock;
  if (postResignActiveBlock)
  {
    postResignActiveBlock[2]();
    id v7 = self->_postResignActiveBlock;
    self->_postResignActiveBlock = 0;
  }
  audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
  if (audioDuckingCoordinationAssertion)
  {
    uint32_t v9 = *v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[SVXSession _invalidate]";
      __int16 v16 = 2112;
      uint32_t v17 = audioDuckingCoordinationAssertion;
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Relinquishing audio ducking coordination assertion %@...", buf, 0x16u);
      audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __25__SVXSession__invalidate__block_invoke;
    v13[3] = &__block_descriptor_40_e38_v16__0___AFAssertionContextMutating__8l;
    void v13[4] = a2;
    uint32_t v10 = (void *)[MEMORY[0x263F28418] newWithBuilder:v13];
    [(AFRelinquishableAssertion *)audioDuckingCoordinationAssertion relinquishWithContext:v10 options:0];

    uint64_t v11 = self->_audioDuckingCoordinationAssertion;
    self->_audioDuckingCoordinationAssertion = 0;
  }
  [(SVXSpeechSynthesizer *)self->_speechSynthesizer removeListener:self];
  [(SVXSpeechSynthesizer *)self->_speechSynthesizer postcool];
  [(SVXSession *)self _resetMyriadDecision];
  [(SVXSession *)self _stopSessionIdleTimer];
  [(SVXSession *)self _invalidateConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sessionDidInvalidate:self];

  objc_storeWeak((id *)&self->_delegate, 0);
}

void __25__SVXSession__invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTimestamp:mach_absolute_time()];
  NSStringFromSelector(*(SEL *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setReason:v4];
}

- (void)_resignActiveForReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint32_t v10 = "-[SVXSession _resignActiveForReason:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SVXSession__resignActiveForReason___block_invoke;
  v7[3] = &unk_264554678;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SVXSession *)self _checkIsActiveWithCompletion:v7];
}

void __37__SVXSession__resignActiveForReason___block_invoke(uint64_t a1, int a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = (NSObject **)MEMORY[0x263F28348];
    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Ignored because session is still active.", buf, 0xCu);
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v33 = *(void *)(*(void *)(a1 + 32) + 16);
      uint64_t v34 = v4;
      if (v33 > 4) {
        id v35 = @"(unknown)";
      }
      else {
        id v35 = off_2645542F8[v33];
      }
      *(double *)&__int16 v40 = COERCE_DOUBLE(v35);
      *(_DWORD *)buf = 136315394;
      v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v55 = 2112;
      double v56 = *(double *)&v40;
      _os_log_debug_impl(&dword_220062000, v34, OS_LOG_TYPE_DEBUG, "%s _unint64_t currentState = %@", buf, 0x16u);

      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      double v36 = *(double *)(*(void *)(a1 + 32) + 80);
      *(_DWORD *)buf = 136315394;
      v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v55 = 2112;
      double v56 = v36;
      _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestOptions = %@", buf, 0x16u);
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 88);
      __int16 v38 = v4;
      double v39 = COERCE_DOUBLE(MEMORY[0x223C65C40](v37));
      *(_DWORD *)buf = 136315394;
      v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v55 = 2112;
      double v56 = v39;
      _os_log_debug_impl(&dword_220062000, v38, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestContinueBlock = %@", buf, 0x16u);

      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      double v5 = *(double *)(*(void *)(a1 + 32) + 96);
      *(_DWORD *)buf = 136315394;
      v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v55 = 2112;
      double v56 = v5;
      _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestPendingBlocks = %@", buf, 0x16u);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 368) dispatchEvent:7];
    [*(id *)(a1 + 32) _setCurrentState:1];
    [*(id *)(*(void *)(a1 + 32) + 184) reset];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 64) options];
    [v6 audioSessionDeactivationDelay];
    double v8 = v7;

    if (v8 > 0.0)
    {
      uint32_t v9 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
        __int16 v55 = 2048;
        double v56 = v8;
        _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s audioSessionDeactivationDelay = %f", buf, 0x16u);
      }
    }
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __37__SVXSession__resignActiveForReason___block_invoke_174;
    v52[3] = &unk_2645545B8;
    v52[4] = *(void *)(a1 + 32);
    uint32_t v10 = (void *)MEMORY[0x223C65C40](v52);
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __37__SVXSession__resignActiveForReason___block_invoke_175;
    v50[3] = &unk_264553F10;
    __int16 v11 = *(void **)(a1 + 40);
    v50[4] = *(void *)(a1 + 32);
    id v51 = v11;
    id v12 = (void *)MEMORY[0x223C65C40](v50);
    id v13 = *(id *)(*(void *)(a1 + 32) + 64);
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    id v43 = __37__SVXSession__resignActiveForReason___block_invoke_178;
    __int16 v44 = &unk_264553F60;
    double v49 = v8;
    id v14 = v10;
    uint64_t v15 = *(void *)(a1 + 32);
    id v47 = v14;
    uint64_t v45 = v15;
    id v16 = v13;
    id v46 = v16;
    id v17 = v12;
    id v48 = v17;
    uint64_t v18 = (void (**)(void))MEMORY[0x223C65C40](&v41);
    uint64_t v19 = *(void *)(a1 + 32);
    switch(*(void *)(v19 + 24))
    {
      case 0:
        uint64_t v31 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[SVXSession _resignActiveForReason:]_block_invoke_3";
          id v32 = "%s Session unspecified.";
          goto LABEL_28;
        }
        break;
      case 1:
        uint64_t v31 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          id v32 = "%s Session is already inactive.";
          goto LABEL_28;
        }
        break;
      case 2:
        uint64_t v31 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          id v32 = "%s Session is already resigning active.";
LABEL_28:
          _os_log_impl(&dword_220062000, v31, OS_LOG_TYPE_INFO, v32, buf, 0xCu);
        }
        break;
      case 3:
      case 4:
        os_log_t v20 = (os_log_t *)MEMORY[0x263F28348];
        __int16 v21 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s Session is ready to resign active.", buf, 0xCu);
          uint64_t v19 = *(void *)(a1 + 32);
        }
        *(void *)(v19 + 24) = 2;
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
        objc_msgSend(WeakRetained, "session:willResignActiveWithOptions:duration:activityUUID:", *(void *)(a1 + 32), 0, *(void *)(*(void *)(a1 + 32) + 32), 0.0, v41, v42, v43, v44, v45, v46, v47);

        uint64_t v23 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        {
          double v24 = *(double *)(*(void *)(a1 + 32) + 32);
          *(_DWORD *)buf = 136315394;
          v54 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          __int16 v55 = 2112;
          double v56 = v24;
          _os_log_impl(&dword_220062000, v23, OS_LOG_TYPE_INFO, "%s SESSION GOING INACTIVE (%@)", buf, 0x16u);
        }
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(void **)(v25 + 120);
        if (!v26) {
          uint64_t v26 = *(void **)(v25 + 112);
        }
        id v27 = (objc_class *)MEMORY[0x263F6EE28];
        id v28 = v26;
        id v29 = objc_alloc_init(v27);
        id v30 = objc_alloc_init(MEMORY[0x263F6EE38]);
        [v30 setExists:1];
        [v29 setStartedOrChanged:v30];
        [v28 emitInstrumentation:v29];

        v18[2](v18);
        break;
      default:
        break;
    }
  }
}

void __37__SVXSession__resignActiveForReason___block_invoke_174(uint64_t a1, int a2)
{
  int v2 = a2;
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 == 2)
  {
    *(void *)(v4 + 24) = 1;
    id v41 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = 0;

    double v8 = *(void **)(a1 + 32);
    uint32_t v9 = (void *)v8[8];
    if (v9)
    {
      uint64_t v10 = [v9 source];
      double v8 = *(void **)(a1 + 32);
      unint64_t v11 = v10 - 1;
    }
    else
    {
      unint64_t v11 = -1;
    }
    id v12 = (void *)v8[15];
    if (!v12) {
      id v12 = (void *)v8[14];
    }
    id v13 = v12;
    uint64_t v14 = *(unsigned int *)(*(void *)(a1 + 32) + 240);
    id v15 = v13;
    id v16 = objc_alloc_init(MEMORY[0x263F6EE90]);
    [v16 setPresentationType:6];
    id v17 = objc_alloc_init(MEMORY[0x263F6EE88]);
    uint64_t v18 = v17;
    if (v11 > 4) {
      uint64_t v19 = 4;
    }
    else {
      uint64_t v19 = dword_2200ED6F8[v11];
    }
    objc_msgSend(v17, "setDismissalReason:", v19, v41);
    id v20 = objc_alloc_init(MEMORY[0x263F6EE98]);
    [v20 setPresenting:v16];
    [v20 setPreviousState:v14];
    [v20 setCurrentState:4];
    [v20 setDismissed:v18];
    __int16 v21 = (os_log_t *)MEMORY[0x263F28348];
    int v22 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      if ((v14 - 1) > 4) {
        uint64_t v23 = @"SIRIUISTATE_UNKNOWN_SIRI_UI_STATE";
      }
      else {
        uint64_t v23 = off_264552B00[(v14 - 1)];
      }
      if ((v19 - 1) > 9) {
        double v24 = @"DISMISSALREASON_UNKNOWN_DISMISSAL_REASON";
      }
      else {
        double v24 = off_264552B28[(v19 - 1)];
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v45 = "SVXInstrumentationEmitDismissalUIStateTransition";
      __int16 v46 = 2112;
      id v47 = v23;
      __int16 v48 = 2112;
      double v49 = v24;
      uint64_t v25 = v22;
      _os_log_impl(&dword_220062000, v25, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit state transition (dismissed) event (current: %@, dismissalReason: %@)", buf, 0x20u);
    }
    [v15 emitInstrumentation:v20];
    id v26 = objc_alloc_init(MEMORY[0x263F6EE98]);

    [v26 setPresenting:v16];
    [v26 setPreviousState:v14];
    [v26 setCurrentState:1];
    id v27 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v45 = "SVXInstrumentationEmitDismissalUIStateTransition";
      _os_log_impl(&dword_220062000, v27, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit state transition (idle) event", buf, 0xCu);
    }
    [v15 emitInstrumentation:v26];

    *(_DWORD *)(*(void *)(a1 + 32) + 240) = 1;
    id v28 = (objc_class *)MEMORY[0x263F6EE28];
    id v29 = v15;
    id v30 = objc_alloc_init(v28);
    id v31 = objc_alloc_init(MEMORY[0x263F6EE30]);
    [v31 setExists:1];
    [v30 setEnded:v31];
    [v29 emitInstrumentation:v30];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
    [WeakRetained session:*(void *)(a1 + 32) didResignActiveWithDeactivationContext:*(void *)(*(void *)(a1 + 32) + 64) activityUUID:*(void *)(*(void *)(a1 + 32) + 32)];

    unint64_t v33 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v45 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v46 = 2112;
      id v47 = v42;
      _os_log_impl(&dword_220062000, v33, OS_LOG_TYPE_INFO, "%s SESSION IS INACTIVE (%@)", buf, 0x16u);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 24);
    int v2 = a2;
  }
  if (v5 == 1)
  {
    uint64_t v34 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    if (v2)
    {
      uint64_t v35 = *(void *)(a1 + 32);
      double v36 = *(void **)(v35 + 64);
      *(void *)(v35 + 64) = 0;
    }
    [*(id *)(a1 + 32) _setCurrentState:1];
    uint64_t v37 = *(void **)(a1 + 32);
    uint64_t v38 = v37[5];
    if (v38)
    {
      (*(void (**)(void))(v38 + 16))(v37[5]);
      uint64_t v39 = *(void *)(a1 + 32);
      __int16 v40 = *(void **)(v39 + 40);
      *(void *)(v39 + 40) = 0;

      uint64_t v37 = *(void **)(a1 + 32);
    }
    if (v2) {
      [v37 _startSessionIdleTimerWithTimeInterval:8.0];
    }
    else {
      [v37 _stopSessionIdleTimer];
    }
  }
}

void __37__SVXSession__resignActiveForReason___block_invoke_175(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v11 = "-[SVXSession _resignActiveForReason:]_block_invoke";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Force audio session inactive now...", buf, 0xCu);
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SVXSession__resignActiveForReason___block_invoke_176;
  v8[3] = &unk_2645547D8;
  v8[4] = v6;
  id v9 = v3;
  id v7 = v3;
  [v6 _forceAudioSessionInactiveWithReason:v5 completion:v8];
}

void __37__SVXSession__resignActiveForReason___block_invoke_178(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*(double *)(a1 + 64) <= 0.0)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__SVXSession__resignActiveForReason___block_invoke_2_181;
    v8[3] = &unk_264553B00;
    uint64_t v7 = *(void *)(a1 + 56);
    id v9 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    uint64_t v6 = v9;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    int v2 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 136315394;
      id v20 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v21 = 2048;
      uint64_t v22 = v3;
      _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s Force audio session inactive in %f seconds.", buf, 0x16u);
    }
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 176) queue];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __37__SVXSession__resignActiveForReason___block_invoke_179;
    id v13 = &unk_264553F60;
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 64);
    id v15 = v5;
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 48);
    AFDispatchScheduleWithDelay();

    uint64_t v6 = v15;
  }
}

void __37__SVXSession__resignActiveForReason___block_invoke_179(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__SVXSession__resignActiveForReason___block_invoke_2;
  v3[3] = &unk_264553F38;
  uint64_t v7 = *(void *)(a1 + 64);
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 _checkIsActiveWithCompletion:v3];
}

uint64_t __37__SVXSession__resignActiveForReason___block_invoke_2_181(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37__SVXSession__resignActiveForReason___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = (NSObject **)MEMORY[0x263F28348];
    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      id v5 = *(__CFString **)(a1 + 64);
      *(_DWORD *)buf = 136315394;
      id v30 = "-[SVXSession _resignActiveForReason:]_block_invoke_2";
      __int16 v31 = 2048;
      id v32 = v5;
      _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Skipped force audio session inactive after %f seconds delay, because session is active again.", buf, 0x16u);
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
      id v20 = v4;
      if (v19 > 4) {
        __int16 v21 = @"(unknown)";
      }
      else {
        __int16 v21 = off_2645542F8[v19];
      }
      id v26 = v21;
      *(_DWORD *)buf = 136315394;
      id v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v31 = 2112;
      id v32 = v26;
      _os_log_debug_impl(&dword_220062000, v20, OS_LOG_TYPE_DEBUG, "%s _unint64_t currentState = %@", buf, 0x16u);

      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *(__CFString **)(*(void *)(a1 + 32) + 80);
      *(_DWORD *)buf = 136315394;
      id v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v31 = 2112;
      id v32 = v22;
      _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestOptions = %@", buf, 0x16u);
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 88);
      double v24 = v4;
      uint64_t v25 = (__CFString *)MEMORY[0x223C65C40](v23);
      *(_DWORD *)buf = 136315394;
      id v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v31 = 2112;
      id v32 = v25;
      _os_log_debug_impl(&dword_220062000, v24, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestContinueBlock = %@", buf, 0x16u);

      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v6 = *(__CFString **)(*(void *)(a1 + 32) + 96);
      *(_DWORD *)buf = 136315394;
      id v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestPendingBlocks = %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    unint64_t v8 = *(void *)(v7 + 24);
    if (v8 == 1)
    {
      id v9 = *(__CFString **)(a1 + 40);
      uint64_t v10 = *(__CFString **)(v7 + 64);
      if (v9 == v10)
      {
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __37__SVXSession__resignActiveForReason___block_invoke_180;
        v27[3] = &unk_264553B00;
        uint64_t v17 = *(void *)(a1 + 48);
        id v28 = *(id *)(a1 + 56);
        (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v27);
      }
      else
      {
        uint64_t v11 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = *(__CFString **)(a1 + 64);
          *(_DWORD *)buf = 136315906;
          id v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          __int16 v31 = 2048;
          id v32 = v12;
          __int16 v33 = 2112;
          uint64_t v34 = v9;
          __int16 v35 = 2112;
          double v36 = v10;
          _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s Skipped force audio session inactive after %f seconds delay, because deactivation context changed from %@ to %@ while waiting.", buf, 0x2Au);
        }
      }
    }
    else
    {
      id v13 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(__CFString **)(a1 + 64);
        id v15 = v13;
        if (v8 > 4) {
          id v16 = @"(unknown)";
        }
        else {
          id v16 = off_264552F68[v8];
        }
        uint64_t v18 = v16;
        *(_DWORD *)buf = 136315650;
        id v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
        __int16 v31 = 2048;
        id v32 = v14;
        __int16 v33 = 2112;
        uint64_t v34 = v18;
        _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s Skipped force audio session inactive after %f seconds delay, because activity state is %@.", buf, 0x20u);
      }
    }
  }
}

uint64_t __37__SVXSession__resignActiveForReason___block_invoke_180(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37__SVXSession__resignActiveForReason___block_invoke_176(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[SVXSession _resignActiveForReason:]_block_invoke";
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s Done force audio session inactive.", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    return [*(id *)(*(void *)(a1 + 32) + 368) dispatchEvent:7];
  }
  return result;
}

- (void)_performBlockAfterResignActive:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self->_activityState == 1)
    {
      (*((void (**)(id))v4 + 2))(v4);
    }
    else if (self->_postResignActiveBlock)
    {
      uint64_t v6 = (void *)MEMORY[0x223C65C40]();
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __45__SVXSession__performBlockAfterResignActive___block_invoke;
      v12[3] = &unk_264553EE8;
      id v13 = v6;
      id v14 = v5;
      id v7 = v6;
      unint64_t v8 = (void *)MEMORY[0x223C65C40](v12);
      id postResignActiveBlock = self->_postResignActiveBlock;
      self->_id postResignActiveBlock = v8;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x223C65C40](v4);
      id v11 = self->_postResignActiveBlock;
      self->_id postResignActiveBlock = v10;
    }
  }
}

uint64_t __45__SVXSession__performBlockAfterResignActive___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_checkIsActiveWithCompletion:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v4)
  {
    currentRequestUUID = self->_currentRequestUUID;
    if (currentRequestUUID)
    {
      os_log_t v8 = *v5;
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
LABEL_26:
        v4[2](v4, 1);
        goto LABEL_27;
      }
      *(_DWORD *)buf = 136315650;
      __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
      __int16 v34 = 2112;
      __int16 v35 = self;
      __int16 v36 = 2112;
      uint64_t v37 = currentRequestUUID;
      id v9 = "%s %@ is active. (_currentRequestUUID = %@)";
      uint64_t v10 = v8;
      uint32_t v11 = 32;
    }
    else
    {
      uint64_t v12 = [(NSMutableSet *)self->_audioSessionAssertions count];
      if (!v12)
      {
        taskTrackingCenter = self->_taskTrackingCenter;
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __43__SVXSession__checkIsActiveWithCompletion___block_invoke;
        v25[3] = &unk_264553EC0;
        v25[4] = self;
        id v26 = v4;
        [(SVXTaskTrackingCenter *)taskTrackingCenter getContextsOfAllTrackedTasksUsingBlock:v25];

        goto LABEL_27;
      }
      uint64_t v13 = v12;
      id v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
        __int16 v34 = 2112;
        __int16 v35 = self;
        __int16 v36 = 2048;
        uint64_t v37 = (NSUUID *)v13;
        _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s %@ is active. (_audioSessionAssertions.count = %tu)", buf, 0x20u);
      }
      if ((AFIsInternalInstall() & 1) == 0
        && ![(AFPreferences *)self->_preferences shouldLogForQA])
      {
        goto LABEL_26;
      }
      id v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
        _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s _audioSessionAssertions = (", buf, 0xCu);
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = self->_audioSessionAssertions;
      uint64_t v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            __int16 v21 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
            {
              uint64_t v22 = *(SVXSession **)(*((void *)&v27 + 1) + 8 * i);
              *(_DWORD *)buf = 136315394;
              __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
              __int16 v34 = 2112;
              __int16 v35 = v22;
              _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s     %@", buf, 0x16u);
            }
          }
          uint64_t v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v18);
      }

      os_log_t v23 = *v5;
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 136315138;
      __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
      id v9 = "%s)";
      uint64_t v10 = v23;
      uint32_t v11 = 12;
    }
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    goto LABEL_26;
  }
LABEL_27:
}

void __43__SVXSession__checkIsActiveWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 count];
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v6 = *MEMORY[0x263F28348];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke";
      __int16 v34 = 2112;
      uint64_t v35 = v8;
      __int16 v36 = 2048;
      uint64_t v37 = v4;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s %@ is active. (_taskTrackingCenter.contextsOfAllTrackedTasks.count = %tu)", buf, 0x20u);
    }
    if ((AFIsInternalInstall() & 1) != 0
      || [*(id *)(*(void *)(a1 + 32) + 216) shouldLogForQA])
    {
      uint64_t v22 = a1;
      id v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke";
        _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s _taskTrackingCenter.contextsOfAllTrackedTasks = (", buf, 0xCu);
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v10 = v3;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
            {
              uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              *(_DWORD *)buf = 136315394;
              __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke";
              __int16 v34 = 2112;
              uint64_t v35 = v16;
              _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s     %@", buf, 0x16u);
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v12);
      }

      uint64_t v17 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke";
        _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s)", buf, 0xCu);
      }
    }
    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 176);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __43__SVXSession__checkIsActiveWithCompletion___block_invoke_170;
    v25[3] = &unk_264553B00;
    uint64_t v19 = &v26;
    id v26 = *(id *)(a1 + 40);
    id v20 = v25;
  }
  else
  {
    if (v7)
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      __int16 v33 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke_2";
      __int16 v34 = 2112;
      uint64_t v35 = v21;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s %@ is NOT active.", buf, 0x16u);
    }
    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 176);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __43__SVXSession__checkIsActiveWithCompletion___block_invoke_172;
    v23[3] = &unk_264553B00;
    uint64_t v19 = &v24;
    id v24 = *(id *)(a1 + 40);
    id v20 = v23;
  }
  objc_msgSend(v18, "performBlock:", v20, v22);
}

uint64_t __43__SVXSession__checkIsActiveWithCompletion___block_invoke_170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__SVXSession__checkIsActiveWithCompletion___block_invoke_172(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_currentAccessoryInfo
{
  currentAccessoryInfo = self->_currentAccessoryInfo;
  if (!currentAccessoryInfo)
  {
    uint64_t v4 = dispatch_group_create();
    id v5 = (void *)[objc_alloc(MEMORY[0x263F285E0]) initWithInstanceContext:self->_instanceContext];
    dispatch_group_enter(v4);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__SVXSession__currentAccessoryInfo__block_invoke;
    v9[3] = &unk_264553E98;
    void v9[4] = self;
    id v10 = v4;
    uint64_t v6 = v4;
    [v5 getCurrentAccessoryInfoWithCompletion:v9];
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    dispatch_group_wait(v6, v7);

    currentAccessoryInfo = self->_currentAccessoryInfo;
  }

  return currentAccessoryInfo;
}

void __35__SVXSession__currentAccessoryInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[SVXSession _currentAccessoryInfo]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s currentAccessoryInfo = %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_getAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, id))a3;
  if (v4)
  {
    uint64_t v5 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      localDeviceContext = self->_localDeviceContext;
      id v7 = v5;
      int v8 = [(AFDeviceContext *)localDeviceContext identifier];
      *(_DWORD *)buf = 136315394;
      uint64_t v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      __int16 v46 = 2112;
      id v47 = v8;
      _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", buf, 0x16u);
    }
    id v9 = [(AFDeviceContext *)self->_localDeviceContext alarmSnapshot];
    __int16 v10 = [(AFDeviceContext *)self->_localDeviceContext timerSnapshot];
    id v11 = (NSObject **)MEMORY[0x263F28348];
    uint64_t v12 = *MEMORY[0x263F28348];
    uint64_t v13 = *MEMORY[0x263F28348];
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
        __int16 v46 = 2112;
        id v47 = v9;
        _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s clockAlarmSnapshot = %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      _os_log_error_impl(&dword_220062000, v12, OS_LOG_TYPE_ERROR, "%s No clock alarm snapshot.", buf, 0xCu);
    }
    id v14 = *v11;
    id v15 = *v11;
    if (v10)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
        __int16 v46 = 2112;
        id v47 = v10;
        _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s clockTimerSnapshot = %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      _os_log_error_impl(&dword_220062000, v14, OS_LOG_TYPE_ERROR, "%s No clock timer snapshot.", buf, 0xCu);
    }
    id v16 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    id v17 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    uint64_t v18 = [v9 firingAlarms];
    if ([v18 count]) {
      [v16 unionSet:v18];
    }
    [v16 sortUsingComparator:&__block_literal_global_161];
    uint64_t v19 = [v10 firingTimers];
    if ([v19 count]) {
      [v17 unionSet:v19];
    }
    [v17 sortUsingComparator:&__block_literal_global_164];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = [v10 timersByID];
    uint64_t v21 = [v20 allValues];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v22)
    {
      __int16 v33 = v18;
      __int16 v34 = v4;
      os_log_t v23 = v10;
      id v24 = v9;
      uint64_t v25 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v25) {
            objc_enumerationMutation(v21);
          }
          long long v27 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v27 state] == 3 && !objc_msgSend(v19, "containsObject:", v27))
          {
            LODWORD(v22) = 1;
            goto LABEL_29;
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v22) {
          continue;
        }
        break;
      }
LABEL_29:
      id v9 = v24;
      __int16 v10 = v23;
      uint64_t v18 = v33;
      uint64_t v4 = v34;
    }

    long long v28 = (NSObject **)MEMORY[0x263F28348];
    long long v29 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      __int16 v46 = 2112;
      id v47 = v16;
      _os_log_impl(&dword_220062000, v29, OS_LOG_TYPE_INFO, "%s orderedFiringAlarms = %@", buf, 0x16u);
      long long v29 = *v28;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      __int16 v46 = 2112;
      id v47 = v17;
      _os_log_impl(&dword_220062000, v29, OS_LOG_TYPE_INFO, "%s orderedFiringTimers = %@", buf, 0x16u);
      long long v29 = *v28;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      __int16 v46 = 1024;
      LODWORD(v47) = v22;
      _os_log_impl(&dword_220062000, v29, OS_LOG_TYPE_INFO, "%s hasOtherRunningTimers = %d", buf, 0x12u);
    }
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __59__SVXSession__getAlarmAndTimerFiringContextWithCompletion___block_invoke_166;
    v35[3] = &unk_264553E70;
    id v36 = v16;
    id v37 = v17;
    char v38 = v22;
    id v30 = v17;
    id v31 = v16;
    id v32 = +[SVXAlarmAndTimerFiringContext newWithBuilder:v35];
    v4[2](v4, v32);
  }
}

void __59__SVXSession__getAlarmAndTimerFiringContextWithCompletion___block_invoke_166(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setOrderedFiringAlarms:v3];
  [v4 setOrderedFiringTimers:*(void *)(a1 + 40)];
  [v4 setHasOtherRunningTimers:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __59__SVXSession__getAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 firedDate];
  uint64_t v6 = [v4 firedDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __59__SVXSession__getAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 firedDate];
  uint64_t v6 = [v4 firedDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[SVXSession _setAudioSessionID:]";
    __int16 v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s audioSessionID = %lu", (uint8_t *)&v7, 0x16u);
  }
  self->_audioSessionID = v3;
  uint64_t v6 = +[SVXSpeechSynthesisConfiguration configurationWithAudioSessionID:v3];
  [(SVXSpeechSynthesizer *)self->_speechSynthesizer updateWithConfiguration:v6];
}

- (void)_forceAudioSessionInactiveWithReason:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v7 = (AFRelinquishableAssertion *)a3;
  id v8 = a4;
  __int16 v9 = (NSObject **)MEMORY[0x263F28348];
  uint64_t v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v29 = "-[SVXSession _forceAudioSessionInactiveWithReason:completion:]";
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s BEGIN -forceAudioSessionInactive (reason = %@)", buf, 0x16u);
  }
  uint64_t v11 = mach_absolute_time();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke;
  v23[3] = &unk_264553A38;
  uint64_t v27 = v11;
  uint64_t v12 = v7;
  id v24 = v12;
  uint64_t v25 = self;
  id v13 = v8;
  id v26 = v13;
  id v14 = (void (**)(void))MEMORY[0x223C65C40](v23);
  audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
  if (audioDuckingCoordinationAssertion)
  {
    id v16 = *v9;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v29 = "-[SVXSession _forceAudioSessionInactiveWithReason:completion:]";
      __int16 v30 = 2112;
      id v31 = audioDuckingCoordinationAssertion;
      _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, "%s Relinquishing audio ducking coordination assertion %@...", buf, 0x16u);
      audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_155;
    v22[3] = &__block_descriptor_40_e38_v16__0___AFAssertionContextMutating__8l;
    v22[4] = a2;
    id v17 = (void *)[MEMORY[0x263F28418] newWithBuilder:v22];
    [(AFRelinquishableAssertion *)audioDuckingCoordinationAssertion relinquishWithContext:v17 options:0];

    uint64_t v18 = self->_audioDuckingCoordinationAssertion;
    self->_audioDuckingCoordinationAssertion = 0;
  }
  uint64_t v19 = [(SVXSession *)self _connection:1];
  if (v19)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_2;
    v20[3] = &unk_264553B00;
    uint64_t v21 = v14;
    [v19 forceAudioSessionInactiveWithOptions:0 completion:v20];
  }
  else
  {
    v14[2](v14);
  }
}

void __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  uint64_t v3 = v2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "-[SVXSession _forceAudioSessionInactiveWithReason:completion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = v3;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s END -forceAudioSessionInactive (reason = %@, duration = %f)", buf, 0x20u);
  }
  uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 176);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_154;
  v7[3] = &unk_264553B00;
  id v8 = *(id *)(a1 + 48);
  [v6 performBlock:v7];
}

void __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_155(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTimestamp:mach_absolute_time()];
  NSStringFromSelector(*(SEL *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setReason:v4];
}

uint64_t __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_154(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a5;
  __int16 v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "-[SVXSession _forceAudioSessionActiveWithOptions:reason:completion:]";
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s BEGIN -forceAudioSessionActive (options = %lu, reason = %ld)", buf, 0x20u);
  }
  uint64_t v10 = mach_absolute_time();
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  if (currentSpeechRequestOptions) {
    uint64_t v12 = currentSpeechRequestOptions;
  }
  else {
    uint64_t v12 = (AFSpeechRequestOptions *)[objc_alloc(MEMORY[0x263F28690]) initWithActivationEvent:1];
  }
  __int16 v13 = v12;
  uint64_t v14 = [(SVXSession *)self _connection:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__SVXSession__forceAudioSessionActiveWithOptions_reason_completion___block_invoke;
  v16[3] = &unk_264553DE8;
  uint64_t v18 = v10;
  unint64_t v19 = a3;
  int64_t v20 = a4;
  v16[4] = self;
  id v17 = v8;
  id v15 = v8;
  [v14 forceAudioSessionActiveWithOptions:a3 reason:a4 speechRequestOptions:v13 completion:v16];
}

void __68__SVXSession__forceAudioSessionActiveWithOptions_reason_completion___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  uint64_t v7 = v6;
  id v8 = *MEMORY[0x263F28348];
  __int16 v9 = *MEMORY[0x263F28348];
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 136316418;
      __int16 v23 = "-[SVXSession _forceAudioSessionActiveWithOptions:reason:completion:]_block_invoke";
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      __int16 v26 = 2048;
      uint64_t v27 = v11;
      __int16 v28 = 2048;
      uint64_t v29 = v7;
      __int16 v30 = 2048;
      uint64_t v31 = a2;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_error_impl(&dword_220062000, v8, OS_LOG_TYPE_ERROR, "%s END -forceAudioSessionActive (options = %lu, reason = %ld, duration = %f, audioSessionID = %lu, error = %@)", buf, 0x3Eu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 136316162;
    __int16 v23 = "-[SVXSession _forceAudioSessionActiveWithOptions:reason:completion:]_block_invoke";
    __int16 v24 = 2048;
    uint64_t v25 = v12;
    __int16 v26 = 2048;
    uint64_t v27 = v13;
    __int16 v28 = 2048;
    uint64_t v29 = v7;
    __int16 v30 = 2048;
    uint64_t v31 = a2;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s END -forceAudioSessionActive (options = %lu, reason = %ld, duration = %f, audioSessionID = %lu)", buf, 0x34u);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 176);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__SVXSession__forceAudioSessionActiveWithOptions_reason_completion___block_invoke_153;
  v18[3] = &unk_264553D30;
  v18[4] = v14;
  unsigned int v21 = a2;
  id v16 = *(id *)(a1 + 40);
  id v19 = v5;
  id v20 = v16;
  id v17 = v5;
  [v15 performBlock:v18];
}

uint64_t __68__SVXSession__forceAudioSessionActiveWithOptions_reason_completion___block_invoke_153(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _setAudioSessionID:*(unsigned int *)(a1 + 56)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24) == 3)
  {
    *(void *)(v2 + 24) = 4;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 56);
    uint64_t v6 = *(void *)(v4 + 32);
    uint64_t v7 = [*(id *)(v4 + 120) turnIdentifier];
    [WeakRetained session:v4 didBecomeActiveWithActivationContext:v5 activityUUID:v6 turnID:v7];

    id v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
      int v11 = 136315394;
      uint64_t v12 = "-[SVXSession _forceAudioSessionActiveWithOptions:reason:completion:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", (uint8_t *)&v11, 0x16u);
    }
    SVXInstrumentationEmitViewAppearContextEnd(*(void **)(*(void *)(a1 + 32) + 120));
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));
  }
  return result;
}

- (void)_setOutputAudioPowerWrapper:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = (AFXPCWrapper *)a3;
  if (!v5) {
    goto LABEL_7;
  }
  if ([(AFInstanceContext *)self->_instanceContext supportsAudioPowerUpdate])
  {
    currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
    if (currentSpeechRequestOptions
      && [(AFSpeechRequestOptions *)currentSpeechRequestOptions disableOutputAudioPowerUpdate])
    {
      uint64_t v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        id v8 = self->_currentSpeechRequestOptions;
        int v17 = 136315394;
        uint64_t v18 = "-[SVXSession _setOutputAudioPowerWrapper:]";
        __int16 v19 = 2112;
        id v20 = v8;
        uint64_t v9 = "%s Output audio power updater disabled by current speech request options %@.";
        uint64_t v10 = v7;
        uint32_t v11 = 22;
LABEL_16:
        _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v17, v11);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_7:
    uint64_t v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      uint64_t v18 = "-[SVXSession _setOutputAudioPowerWrapper:]";
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s wrapper = %@", (uint8_t *)&v17, 0x16u);
    }
    outputAudioPowerWrapper = self->_outputAudioPowerWrapper;
    if (outputAudioPowerWrapper != v5)
    {
      if (outputAudioPowerWrapper)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained session:self didEndUpdateAudioPowerWithType:2];
      }
      objc_storeStrong((id *)&self->_outputAudioPowerWrapper, a3);
      if (self->_outputAudioPowerWrapper)
      {
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v15 session:self willBeginUpdateAudioPowerWithType:2 wrapper:v5];
      }
    }
    goto LABEL_17;
  }
  id v16 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    uint64_t v18 = "-[SVXSession _setOutputAudioPowerWrapper:]";
    uint64_t v9 = "%s Output audio power updater not supported.";
    uint64_t v10 = v16;
    uint32_t v11 = 12;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)_setInputAudioPowerWrapper:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = (AFXPCWrapper *)a3;
  if (!v5) {
    goto LABEL_7;
  }
  if ([(AFInstanceContext *)self->_instanceContext supportsAudioPowerUpdate])
  {
    currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
    if (currentSpeechRequestOptions
      && [(AFSpeechRequestOptions *)currentSpeechRequestOptions disableInputAudioPowerUpdate])
    {
      uint64_t v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        id v8 = self->_currentSpeechRequestOptions;
        int v17 = 136315394;
        uint64_t v18 = "-[SVXSession _setInputAudioPowerWrapper:]";
        __int16 v19 = 2112;
        id v20 = v8;
        uint64_t v9 = "%s Input audio power updater disabled by current speech request options %@.";
        uint64_t v10 = v7;
        uint32_t v11 = 22;
LABEL_16:
        _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v17, v11);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_7:
    uint64_t v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      uint64_t v18 = "-[SVXSession _setInputAudioPowerWrapper:]";
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s wrapper = %@", (uint8_t *)&v17, 0x16u);
    }
    inputAudioPowerWrapper = self->_inputAudioPowerWrapper;
    if (inputAudioPowerWrapper != v5)
    {
      if (inputAudioPowerWrapper)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained session:self didEndUpdateAudioPowerWithType:1];
      }
      objc_storeStrong((id *)&self->_inputAudioPowerWrapper, a3);
      if (self->_inputAudioPowerWrapper)
      {
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v15 session:self willBeginUpdateAudioPowerWithType:1 wrapper:v5];
      }
    }
    goto LABEL_17;
  }
  id v16 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    uint64_t v18 = "-[SVXSession _setInputAudioPowerWrapper:]";
    uint64_t v9 = "%s Input audio power updater not supported.";
    uint64_t v10 = v16;
    uint32_t v11 = 12;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)_discardPendingRequestBarriers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[SVXSession _discardPendingRequestBarriers]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = self->_pendingRequestBarriers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_pendingRequestBarriers removeAllObjects];
}

- (void)_performNextPendingRequestBarrier
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v10 = "-[SVXSession _performNextPendingRequestBarrier]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    uint64_t v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v10 = "-[SVXSession _performNextPendingRequestBarrier]";
      _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s Ignored because _currentRequestUUID is not nil.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_pendingRequestBarriers firstObject];
    if (v6)
    {
      [(NSMutableArray *)self->_pendingRequestBarriers removeObjectAtIndex:0];
      v6[2](v6, 0);
      performer = self->_performer;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __47__SVXSession__performNextPendingRequestBarrier__block_invoke;
      v8[3] = &unk_2645548A0;
      void v8[4] = self;
      [(SVXPerforming *)performer performBlock:v8 withOptions:0];
    }
  }
}

uint64_t __47__SVXSession__performNextPendingRequestBarrier__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextPendingRequestBarrier];
}

- (void)_addRequestBarrier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[SVXSession _addRequestBarrier:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  pendingRequestBarriers = self->_pendingRequestBarriers;
  uint64_t v7 = (void *)MEMORY[0x223C65C40](v4);
  [(NSMutableArray *)pendingRequestBarriers addObject:v7];

  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__SVXSession__addRequestBarrier___block_invoke;
  v9[3] = &unk_2645548A0;
  void v9[4] = self;
  [(SVXPerforming *)performer performBlock:v9 withOptions:0];
}

uint64_t __33__SVXSession__addRequestBarrier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextPendingRequestBarrier];
}

- (void)_setApplicationContext:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[SVXSession _setApplicationContext:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [(SVXSession *)self _connection:1];
  [v6 setApplicationContext:v4];
}

- (void)_clearContext
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SVXSession _clearContext]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(SVXSession *)self _connection:1];
  [v4 clearContext];
}

- (void)_continuePendingSpeechRequest:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[SVXSession _continuePendingSpeechRequest:]";
    __int16 v20 = 1024;
    BOOL v21 = v3;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s success = %d", buf, 0x12u);
  }
  currentSpeechRequestDidStartBlock = (void (**)(void))self->_currentSpeechRequestDidStartBlock;
  if (currentSpeechRequestDidStartBlock)
  {
    currentSpeechRequestDidStartBlock[2]();
    id v7 = self->_currentSpeechRequestDidStartBlock;
    self->_currentSpeechRequestDidStartBlock = 0;
  }
  if (v3 && self->_currentRequestUUID)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = self->_currentSpeechRequestPendingBlocks;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
  [(NSMutableArray *)self->_currentSpeechRequestPendingBlocks removeAllObjects];
}

- (void)_performBlockAfterContinueBlock:(id)a3
{
  if (self->_currentSpeechRequestDidStartBlock)
  {
    currentSpeechRequestPendingBlocks = self->_currentSpeechRequestPendingBlocks;
    id v5 = (id)MEMORY[0x223C65C40](a3, a2);
    [(NSMutableArray *)currentSpeechRequestPendingBlocks addObject:v5];
  }
  else
  {
    id v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
}

- (void)_setCurrentState:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t currentState = self->_currentState;
  if (currentState != a3)
  {
    uint64_t v6 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      if (currentState > 4) {
        uint64_t v8 = @"(unknown)";
      }
      else {
        uint64_t v8 = off_2645542F8[currentState];
      }
      uint64_t v9 = v8;
      if ((unint64_t)a3 > 4) {
        uint64_t v10 = @"(unknown)";
      }
      else {
        uint64_t v10 = off_2645542F8[a3];
      }
      uint64_t v11 = v10;
      int v12 = 136315650;
      long long v13 = "-[SVXSession _setCurrentState:]";
      __int16 v14 = 2112;
      long long v15 = v9;
      __int16 v16 = 2112;
      int v17 = v11;
      _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s %@ -> %@", (uint8_t *)&v12, 0x20u);
    }
    [(SVXSession *)self _willChangeFromState:currentState toState:a3];
    self->_unint64_t currentState = a3;
    [(SVXSession *)self _didChangeFromState:currentState toState:a3];
  }
}

- (void)_dismiss
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[SVXSession _dismiss]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(SVXSpeechSynthesizer *)self->_speechSynthesizer cancelPendingRequests];
  [(SVXSpeechSynthesizer *)self->_speechSynthesizer stopCurrentRequestWithInterruptionBehavior:1];
  [(SVXTaskTrackingCenter *)self->_taskTrackingCenter endTrackingAllTasks];
  [(SRSTClient *)self->_client dispatchEvent:13];
  [(SVXSession *)self _setCurrentState:1];
  [(SVXSession *)self _requestDidEndWithOptions:6 error:0];
}

- (void)_cancelRequestWithOptions:(unint64_t)a3 keepTaskTracker:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v16 = "-[SVXSession _cancelRequestWithOptions:keepTaskTracker:]";
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  uint64_t v8 = [(SVXSession *)self _connection:0];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 cancelRequest];
    if (self->_currentState != 1 && !self->_currentRequestDidPresentUUFR) {
      [v9 rollbackRequest];
    }
  }
  [(SVXServiceCommandHandler *)self->_serviceCommandHandler reset];
  [(SVXSpeechSynthesizer *)self->_speechSynthesizer cancelPendingRequests];
  [(SVXSpeechSynthesizer *)self->_speechSynthesizer stopCurrentRequestWithInterruptionBehavior:1];
  uint64_t v10 = [v6 context];
  uint64_t v11 = v10;
  taskTrackingCenter = self->_taskTrackingCenter;
  if (v10)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __56__SVXSession__cancelRequestWithOptions_keepTaskTracker___block_invoke;
    v13[3] = &unk_264553DC0;
    id v14 = v10;
    [(SVXTaskTrackingCenter *)taskTrackingCenter endTrackingTasksPassingTest:v13];
  }
  else
  {
    [(SVXTaskTrackingCenter *)self->_taskTrackingCenter endTrackingAllTasks];
  }
  [(SRSTClient *)self->_client dispatchEvent:10];
  [(SVXSession *)self _setCurrentState:1];
  [(SVXSession *)self _requestDidEndWithOptions:a3 error:0];
}

uint64_t __56__SVXSession__cancelRequestWithOptions_keepTaskTracker___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

- (void)_waitForMyriadDecisionUsingHandler:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  switch(self->_myriadState)
  {
    case 0:
    case 2:
    case 4:
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
      goto LABEL_7;
    case 1:
      pendingMyriadDecisionHandlers = self->_pendingMyriadDecisionHandlers;
      if (!pendingMyriadDecisionHandlers)
      {
        id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        id v7 = self->_pendingMyriadDecisionHandlers;
        self->_pendingMyriadDecisionHandlers = v6;

        pendingMyriadDecisionHandlers = self->_pendingMyriadDecisionHandlers;
      }
      uint64_t v8 = (void *)MEMORY[0x223C65C40](v9);
      [(NSMutableArray *)pendingMyriadDecisionHandlers addObject:v8];

      goto LABEL_7;
    case 3:
      (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_7:
      id v4 = v9;
      break;
    default:
      break;
  }
}

- (void)_resetMyriadDecision
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v3 = (NSObject **)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int64_t myriadState = self->_myriadState;
    *(_DWORD *)buf = 136315650;
    BOOL v21 = "-[SVXSession _resetMyriadDecision]";
    __int16 v22 = 2048;
    int64_t v23 = myriadState;
    __int16 v24 = 2048;
    uint64_t v25 = 0;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s _myriadState (%ld -> %ld)", buf, 0x20u);
    id v4 = *v3;
  }
  self->_int64_t myriadState = 0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id myriadToken = self->_myriadToken;
    *(_DWORD *)buf = 136315650;
    BOOL v21 = "-[SVXSession _resetMyriadDecision]";
    __int16 v22 = 2112;
    int64_t v23 = (int64_t)myriadToken;
    __int16 v24 = 2112;
    uint64_t v25 = 0;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s _myriadToken (%@ -> %@)", buf, 0x20u);
  }
  id v7 = self->_myriadToken;
  self->_id myriadToken = 0;

  uint64_t v8 = self->_pendingMyriadDecisionHandlers;
  pendingMyriadDecisionHandlers = self->_pendingMyriadDecisionHandlers;
  self->_pendingMyriadDecisionHandlers = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = v8;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)_endWaitingForMyriadDecisionWithToken:(id)a3 state:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
    __int16 v31 = 2048;
    int64_t v32 = a4;
    __int16 v33 = 2112;
    int64_t v34 = (int64_t)v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s state = %ld, token = %@", buf, 0x20u);
  }
  char v9 = [v6 isEqual:self->_myriadToken];
  uint64_t v10 = *v7;
  BOOL v11 = os_log_type_enabled(*v7, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      int64_t myriadState = self->_myriadState;
      *(_DWORD *)buf = 136315650;
      __int16 v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
      __int16 v31 = 2048;
      int64_t v32 = myriadState;
      __int16 v33 = 2048;
      int64_t v34 = a4;
      _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s _myriadState (%ld -> %ld)", buf, 0x20u);
      uint64_t v10 = *v7;
    }
    self->_int64_t myriadState = a4;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id myriadToken = self->_myriadToken;
      *(_DWORD *)buf = 136315650;
      __int16 v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
      __int16 v31 = 2112;
      int64_t v32 = (int64_t)myriadToken;
      __int16 v33 = 2112;
      int64_t v34 = 0;
      _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s _myriadToken (%@ -> %@)", buf, 0x20u);
    }
    id v14 = self->_myriadToken;
    self->_id myriadToken = 0;

    long long v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
      __int16 v31 = 1024;
      LODWORD(v32) = a4 == 2;
      _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s uint64_t result = %d", buf, 0x12u);
    }
    long long v16 = self->_pendingMyriadDecisionHandlers;
    pendingMyriadDecisionHandlers = self->_pendingMyriadDecisionHandlers;
    self->_pendingMyriadDecisionHandlers = 0;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v18 = v16;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * v22) + 16))(*(void *)(*((void *)&v24 + 1) + 8 * v22));
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v20);
    }
  }
  else if (v11)
  {
    id v23 = self->_myriadToken;
    *(_DWORD *)buf = 136315650;
    __int16 v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
    __int16 v31 = 2112;
    int64_t v32 = (int64_t)v6;
    __int16 v33 = 2112;
    int64_t v34 = (int64_t)v23;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s Ignored because input token (%@) does not match _myriadToken (%@).", buf, 0x20u);
  }
}

- (void)_beginWaitingForMyriadDecisionWithToken:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[SVXSession _beginWaitingForMyriadDecisionWithToken:]";
    __int16 v13 = 2112;
    int64_t v14 = (int64_t)v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s token = %@", (uint8_t *)&v11, 0x16u);
  }
  [(SVXSession *)self _resetMyriadDecision];
  id v7 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    int64_t myriadState = self->_myriadState;
    int v11 = 136315650;
    uint64_t v12 = "-[SVXSession _beginWaitingForMyriadDecisionWithToken:]";
    __int16 v13 = 2048;
    int64_t v14 = myriadState;
    __int16 v15 = 2048;
    uint64_t v16 = 1;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s _myriadState (%ld -> %ld)", (uint8_t *)&v11, 0x20u);
    id v7 = *v5;
  }
  self->_int64_t myriadState = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id myriadToken = self->_myriadToken;
    int v11 = 136315650;
    uint64_t v12 = "-[SVXSession _beginWaitingForMyriadDecisionWithToken:]";
    __int16 v13 = 2112;
    int64_t v14 = (int64_t)myriadToken;
    __int16 v15 = 2112;
    uint64_t v16 = (uint64_t)v4;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s _myriadToken (%@ -> %@)", (uint8_t *)&v11, 0x20u);
  }
  id v10 = self->_myriadToken;
  self->_id myriadToken = v4;
}

- (void)endWaitingForMyriadDecisionWithToken:(id)a3 result:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int64_t v14 = "-[SVXSession endWaitingForMyriadDecisionWithToken:result:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s token = %@, uint64_t result = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__SVXSession_endWaitingForMyriadDecisionWithToken_result___block_invoke;
  v10[3] = &unk_264553A60;
  v10[4] = self;
  id v11 = v6;
  BOOL v12 = v4;
  id v9 = v6;
  [(SVXPerforming *)performer performBlock:v10];
}

uint64_t __58__SVXSession_endWaitingForMyriadDecisionWithToken_result___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 3;
  }
  return [*(id *)(a1 + 32) _endWaitingForMyriadDecisionWithToken:*(void *)(a1 + 40) state:v1];
}

- (id)beginWaitingForMyriadDecision
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  BOOL v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[SVXSession beginWaitingForMyriadDecision]";
    __int16 v18 = 2112;
    uint64_t v19 = v3;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s token = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__SVXSession_beginWaitingForMyriadDecision__block_invoke;
  v14[3] = &unk_2645548C8;
  void v14[4] = self;
  id v6 = v3;
  id v15 = v6;
  [(SVXPerforming *)performer performBlock:v14];
  id v7 = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__SVXSession_beginWaitingForMyriadDecision__block_invoke_2;
  v12[3] = &unk_2645548C8;
  void v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  [(SVXPerforming *)v7 performBlock:v12 afterDelay:8.0];
  id v9 = v13;
  id v10 = v8;

  return v10;
}

uint64_t __43__SVXSession_beginWaitingForMyriadDecision__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginWaitingForMyriadDecisionWithToken:*(void *)(a1 + 40)];
}

uint64_t __43__SVXSession_beginWaitingForMyriadDecision__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endWaitingForMyriadDecisionWithToken:*(void *)(a1 + 40) state:4];
}

- (void)_startActiveAudioSessionRequestForType:(int64_t)a3 taskTracker:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (os_log_t *)MEMORY[0x263F28348];
  BOOL v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v28 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]";
    __int16 v29 = 2048;
    int64_t v30 = a3;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s type = %zd, taskTracker = %@", buf, 0x20u);
  }
  [(SVXSession *)self _requestWillBeginWithTaskTracker:v9];
  id v13 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v28 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]";
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s Acquiring audio ducking coordination assertion...", buf, 0xCu);
  }
  int64_t v14 = AFAudioSessionAssertionGetCurrentAcquisitionService();
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __76__SVXSession__startActiveAudioSessionRequestForType_taskTracker_completion___block_invoke;
  v26[3] = &__block_descriptor_48_e38_v16__0___AFAssertionContextMutating__8l;
  void v26[4] = a2;
  v26[5] = a3;
  id v15 = (void *)[MEMORY[0x263F28418] newWithBuilder:v26];
  id v16 = [v14 acquireAudioSessionAssertionWithContext:v15 relinquishmentHandler:&__block_literal_global_11742];
  audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
  self->_audioDuckingCoordinationAssertion = v16;

  __int16 v18 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = self->_audioDuckingCoordinationAssertion;
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]";
    __int16 v29 = 2112;
    int64_t v30 = (int64_t)v19;
    _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_INFO, "%s Acquired audio ducking coordination assertion %@.", buf, 0x16u);
  }
  if (self->_activityState == 3)
  {
    self->_activityState = 4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    currentActivationContext = self->_currentActivationContext;
    activityUUID = self->_activityUUID;
    id v23 = [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentRequestInstrumentationContext turnIdentifier];
    [WeakRetained session:self didBecomeActiveWithActivationContext:currentActivationContext activityUUID:activityUUID turnID:v23];

    long long v24 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      long long v25 = self->_activityUUID;
      *(_DWORD *)buf = 136315394;
      __int16 v28 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]";
      __int16 v29 = 2112;
      int64_t v30 = (int64_t)v25;
      _os_log_impl(&dword_220062000, v24, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", buf, 0x16u);
    }
    SVXInstrumentationEmitViewAppearContextEnd(self->_currentRequestInstrumentationContext);
  }
  if (v10) {
    v10[2](v10, 0);
  }
}

void __76__SVXSession__startActiveAudioSessionRequestForType_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 setTimestamp:mach_absolute_time()];
  BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
  [v7 setReason:v3];

  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = (void *)[objc_alloc(MEMORY[0x263F28690]) initWithActivationEvent:1];
  uint64_t v6 = MEMORY[0x263F28278];
  [v4 setObject:v5 forKey:*MEMORY[0x263F28278]];

  [v4 setObject:&unk_26D1FD128 forKey:*(void *)(v6 + 16)];
  if (*(void *)(a1 + 40) == 1) {
    [v4 setObject:MEMORY[0x263EFFA88] forKey:*(void *)(v6 + 32)];
  }
  [v7 setUserInfo:v4];
}

void __76__SVXSession__startActiveAudioSessionRequestForType_taskTracker_completion___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F28348];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s Relinquished audio ducking coordination assertion with error %@.", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Relinquished audio ducking coordination assertion with context %@.", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_startSpeechSynthesisRequest:(id)a3 languageCode:(id)a4 voiceName:(id)a5 gender:(int64_t)a6 audioSessionID:(unsigned int)a7 introductionSoundID:(int64_t)a8 conclusionSoundID:(int64_t)a9 taskTracker:(id)a10 postActivationHandler:(id)a11 completion:(id)a12
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a10;
  id v20 = a11;
  id v45 = a12;
  uint64_t v21 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = v21;
    int64_t v47 = a8;
    if ((unint64_t)a6 > 3) {
      id v23 = @"(unknown)";
    }
    else {
      id v23 = off_264552568[a6];
    }
    long long v24 = v23;
    id v44 = v20;
    if ((unint64_t)a8 > 6) {
      long long v25 = @"(unknown)";
    }
    else {
      long long v25 = off_2645530B0[a8];
    }
    long long v26 = v25;
    if ((unint64_t)a9 > 6) {
      long long v27 = @"(unknown)";
    }
    else {
      long long v27 = off_2645530B0[a9];
    }
    __int16 v28 = v27;
    *(_DWORD *)buf = 136316930;
    v78 = "-[SVXSession _startSpeechSynthesisRequest:languageCode:voiceName:gender:audioSessionID:introductionSoundID:con"
          "clusionSoundID:taskTracker:postActivationHandler:completion:]";
    __int16 v79 = 2112;
    id v80 = v50;
    __int16 v81 = 2112;
    id v82 = v17;
    __int16 v83 = 2112;
    id v84 = v18;
    __int16 v85 = 2112;
    v86 = v24;
    __int16 v87 = 2112;
    v88 = v26;
    __int16 v89 = 2112;
    v90 = v28;
    __int16 v91 = 2112;
    id v92 = v19;
    _os_log_impl(&dword_220062000, v22, OS_LOG_TYPE_INFO, "%s speechSynthesisRequest = %@, languageCode = %@, name = %@, gender = %@, introductionSoundID = %@, conclusionSoundID = %@, taskTracker = %@", buf, 0x52u);

    a8 = v47;
    id v20 = v44;
  }
  -[SVXSession _requestWillBeginWithTaskTracker:](self, "_requestWillBeginWithTaskTracker:", v19, v44);
  __int16 v29 = self->_performer;
  int64_t v30 = [(SVXSession *)self _connection:1];
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke;
  v73[3] = &unk_264553C90;
  v73[4] = self;
  uint64_t v48 = v29;
  id v74 = v48;
  id v46 = v30;
  id v75 = v46;
  id v31 = v19;
  id v76 = v31;
  id v32 = (void *)MEMORY[0x223C65C40](v73);
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_5;
  v61[3] = &unk_264553D08;
  v61[4] = self;
  id v33 = v32;
  id v66 = v33;
  int64_t v69 = a8;
  id v34 = v20;
  id v67 = v34;
  id v51 = v50;
  id v62 = v51;
  id v35 = v17;
  id v63 = v35;
  id v36 = v18;
  id v64 = v36;
  unsigned int v72 = a7;
  int64_t v70 = a6;
  int64_t v71 = a9;
  id v37 = v45;
  id v68 = v37;
  id v38 = v31;
  id v65 = v38;
  uint64_t v39 = MEMORY[0x223C65C40](v61);
  long long v40 = (void *)v39;
  if (a7)
  {
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_9;
    v57[3] = &unk_264553D30;
    unsigned int v60 = a7;
    v57[4] = self;
    v59 = (void *)v39;
    id v58 = v38;
    id v41 = v40;
    [(SVXSession *)self _forceAudioSessionInactiveWithReason:@"Start Speech Synthesis Request (External)" completion:v57];

    long long v42 = v59;
  }
  else
  {
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_143;
    v52[3] = &unk_264553D58;
    v54 = (void *)v39;
    id v55 = v34;
    v52[4] = self;
    id v56 = v37;
    id v53 = v38;
    id v43 = v40;
    [(SVXSession *)self _forceAudioSessionActiveWithOptions:0 reason:3 completion:v52];

    long long v42 = v54;
  }
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 416) createAudioPlaybackRequestFromID:a2 preferences:*(void *)(*(void *)(a1 + 32) + 216)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_2;
  v10[3] = &unk_264553C68;
  id v11 = v6;
  int v7 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  id v15 = v5;
  id v14 = *(id *)(a1 + 56);
  id v8 = v5;
  id v9 = v6;
  [v7 performBlock:v10];
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 368) dispatchEvent:9];
  [*(id *)(a1 + 32) _setCurrentState:4];
  uint64_t v2 = *(void *)(a1 + 96);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_6;
  v11[3] = &unk_264553CE0;
  uint64_t v3 = *(void *)(a1 + 72);
  id v4 = *(id *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v16 = v4;
  v11[4] = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 104);
  id v14 = v7;
  uint64_t v19 = v8;
  int v21 = *(_DWORD *)(a1 + 120);
  id v9 = *(id *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 112);
  id v17 = v9;
  uint64_t v20 = v10;
  id v18 = *(id *)(a1 + 88);
  id v15 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v11);
}

uint64_t __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24) == 3)
  {
    *(void *)(v2 + 24) = 4;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 56);
    uint64_t v6 = *(void *)(v4 + 32);
    id v7 = [*(id *)(v4 + 120) turnIdentifier];
    [WeakRetained session:v4 didBecomeActiveWithActivationContext:v5 activityUUID:v6 turnID:v7];

    uint64_t v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
      int v10 = *(_DWORD *)(a1 + 56);
      int v12 = 136315650;
      id v13 = "-[SVXSession _startSpeechSynthesisRequest:languageCode:voiceName:gender:audioSessionID:introductionSoundID:c"
            "onclusionSoundID:taskTracker:postActivationHandler:completion:]_block_invoke_9";
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      int v17 = v10;
      _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@) (with external audio session %u) ", (uint8_t *)&v12, 0x1Cu);
    }
    SVXInstrumentationEmitViewAppearContextEnd(*(void **)(*(void *)(a1 + 32) + 120));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  return [*(id *)(a1 + 32) _requestDidEndWithOptions:6 error:0];
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_143(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  if (!v8 || (int IsNoRoutesAvailableError = SVXAudioSessionIsNoRoutesAvailableError(v8), a2) && IsNoRoutesAvailableError)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) _requestDidEndWithOptions:6 error:0];
    id v6 = 0;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v6 = v8;
    [*(id *)(a1 + 32) _requestDidEndWithOptions:6 error:v6];
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    }
  }
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 192);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v7 = *(unsigned int *)(a1 + 112);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_7;
  v10[3] = &unk_264553CB8;
  id v8 = *(id *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 104);
  id v11 = v8;
  uint64_t v13 = v9;
  id v12 = *(id *)(a1 + 88);
  [v3 enqueueRequest:v2 languageCode:v4 voiceName:v5 gender:v6 audioSessionID:v7 preparation:0 finalization:v10 taskTracker:*(void *)(a1 + 64) analyticsContext:0];
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_8;
  v9[3] = &unk_2645547D8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v6;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, void *))(v5 + 16);
  id v8 = v3;
  v7(v5, v4, v9);
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_3;
    v6[3] = &unk_264553C40;
    id v3 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 64);
    id v8 = *(id *)(a1 + 56);
    [v3 startAudioPlaybackRequest:v2 options:3 completion:v6];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_4;
  v3[3] = &unk_2645547D8;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 performBlock:v3];
}

uint64_t __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_startRequestWithInfo:(id)a3 clearsContext:(BOOL)a4 deviceSetupContext:(id)a5 taskTracker:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void))a7;
  __int16 v16 = (os_log_t *)MEMORY[0x263F28348];
  int v17 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v29 = 136316162;
    int64_t v30 = "-[SVXSession _startRequestWithInfo:clearsContext:deviceSetupContext:taskTracker:completion:]";
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 1024;
    BOOL v34 = v10;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v14;
    _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s requestInfo = %@, clearsContext = %d, deviceSetupContext = %@, taskTracker = %@", (uint8_t *)&v29, 0x30u);
  }
  [(SVXSession *)self _requestWillBeginWithTaskTracker:v14];
  if (v10)
  {
    uint64_t v18 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315138;
      int64_t v30 = "-[SVXSession _startRequestWithInfo:clearsContext:deviceSetupContext:taskTracker:completion:]";
      _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_DEFAULT, "%s clearContext", (uint8_t *)&v29, 0xCu);
    }
    uint64_t v19 = [(SVXSession *)self _connection:1];
    [v19 clearContext];

    setApplicationContext = self->_setApplicationContext;
    self->_setApplicationContext = 0;
  }
  int v21 = _SVXSessionCreateSetApplicationContext(v13);
  if (([(SASetApplicationContext *)self->_setApplicationContext isEqual:v21] & 1) == 0)
  {
    os_log_t v22 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v22;
      long long v24 = [v21 dictionary];
      int v29 = 136315394;
      int64_t v30 = "-[SVXSession _startRequestWithInfo:clearsContext:deviceSetupContext:taskTracker:completion:]";
      __int16 v31 = 2112;
      id v32 = v24;
      _os_log_impl(&dword_220062000, v23, OS_LOG_TYPE_DEFAULT, "%s setApplicationContext: %@", (uint8_t *)&v29, 0x16u);
    }
    long long v25 = [(SVXSession *)self _connection:1];
    [v25 setApplicationContext:v21];

    long long v26 = (SASetApplicationContext *)[v21 copy];
    long long v27 = self->_setApplicationContext;
    self->_setApplicationContext = v26;
  }
  __int16 v28 = [(SVXSession *)self _connection:1];
  [v28 startRequestWithInfo:v12];

  if (v15) {
    v15[2](v15, 0);
  }
}

- (void)assistantConnectionUpdatedSpeechEndEstimate:(id)a3 speechEndEstimate:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_isStateFeedbackEnabled)
  {
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315394;
      BOOL v10 = "-[SVXSession assistantConnectionUpdatedSpeechEndEstimate:speechEndEstimate:]";
      __int16 v11 = 2048;
      unint64_t v12 = a4;
      _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s #svxstatefeedback SpeechEndEstimate: %llu", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [(SVXSession *)self _stateFeedbackManager];
    [v8 didUpdateSpeechEndEstimate:a4];
  }
}

- (void)_updateSpeechEndpointerOperationMode:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = AFSpeechEndpointerOperationModeGetName();
    int v13 = 136315394;
    id v14 = "-[SVXSession _updateSpeechEndpointerOperationMode:]";
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s speechEndpointerOperationMode = %@", (uint8_t *)&v13, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    __int16 v11 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v13 = 136315138;
    id v14 = "-[SVXSession _updateSpeechEndpointerOperationMode:]";
    unint64_t v12 = "%s Ignored because _currentRequestUUID is nil.";
LABEL_11:
    _os_log_error_impl(&dword_220062000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0xCu);
    return;
  }
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  if (currentSpeechRequestOptions)
  {
    [(AFSpeechRequestOptions *)currentSpeechRequestOptions setEndpointerOperationMode:a3];
    BOOL v10 = [(SVXSession *)self _connection:0];
    [v10 updateSpeechOptions:self->_currentSpeechRequestOptions];

    return;
  }
  __int16 v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315138;
    id v14 = "-[SVXSession _updateSpeechEndpointerOperationMode:]";
    unint64_t v12 = "%s Ignored because _currentSpeechRequestOptions is nil.";
    goto LABEL_11;
  }
}

- (void)_transitSpeechToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v43 = "-[SVXSession _transitSpeechToAutomaticEndpointingWithTimestamp:]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  svxActivationInstrumentation = self->_svxActivationInstrumentation;
  uint64_t v39 = [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentRequestInstrumentationContext turnIdentifier];
  id v6 = MEMORY[0x223C655B0](v39);
  id v7 = svxActivationInstrumentation;
  id v8 = v6;
  if (v7)
  {
    int v9 = [(SVXActivationInstrumentation *)v7 turnIdentifier];
    id v38 = MEMORY[0x223C655B0]();

    uint64_t v33 = [(SVXActivationInstrumentation *)v7 buttonDownTimestamp];
    uint64_t v32 = mach_absolute_time();
    BOOL v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316418;
      id v43 = "SVXInstrumentationEmitButtonEvents";
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v38;
      __int16 v46 = 2048;
      unint64_t v47 = v33;
      __int16 v48 = 2112;
      id v49 = v8;
      __int16 v50 = 2048;
      unint64_t v51 = a3;
      __int16 v52 = 2048;
      uint64_t v53 = v32;
      _os_log_debug_impl(&dword_220062000, v10, OS_LOG_TYPE_DEBUG, "%s #SVXInstrumentation - button down: turnId = %@, time = %lld button up: turnId = %@, time = %lld, turnEventTime = %lld", buf, 0x3Eu);
    }
    if ([v8 isEqualToString:v38])
    {
      id v37 = objc_alloc_init(MEMORY[0x263F6D988]);
      id v11 = objc_alloc(MEMORY[0x263F6EEE0]);
      id v12 = objc_alloc_init(MEMORY[0x263F08C38]);
      int v13 = (void *)[v11 initWithNSUUID:v12];
      [v37 setActivationEventId:v13];

      id v36 = objc_alloc_init(MEMORY[0x263F6D978]);
      [v36 setButtonName:@"Topcap"];
      [v36 setButtonInteractionType:1];
      id v35 = objc_alloc_init(MEMORY[0x263F6D980]);
      [v35 setEventMetadata:v37];
      [v35 setButtonInteractionDetected:v36];
      id v14 = objc_alloc_init(MEMORY[0x263F6D978]);
      [v14 setButtonName:@"Topcap"];
      [v14 setButtonInteractionType:2];
      id v15 = objc_alloc_init(MEMORY[0x263F6D980]);
      [v15 setEventMetadata:v37];
      [v15 setButtonInteractionDetected:v14];
      id v16 = objc_alloc_init(MEMORY[0x263F6D990]);
      id v17 = objc_alloc(MEMORY[0x263F6EEE0]);
      uint64_t v18 = [(SVXActivationInstrumentation *)v7 turnIdentifier];
      uint64_t v19 = (void *)[v17 initWithNSUUID:v18];
      [v16 setTurnId:v19];

      id v20 = objc_alloc_init(MEMORY[0x263F6D980]);
      [v20 setEventMetadata:v37];
      [v20 setTurnActivated:v16];
      int v21 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        id v43 = "SVXInstrumentationEmitButtonEvents";
        __int16 v44 = 2048;
        uint64_t v45 = v33;
        __int16 v46 = 2048;
        unint64_t v47 = a3;
        _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit button activation event (button down time: %lld, button up time: %lld)", buf, 0x20u);
      }
      os_log_t v22 = [MEMORY[0x263F6C818] sharedAnalytics];
      id v23 = [v22 defaultMessageStream];
      [v23 emitMessage:v35 timestamp:v33];

      long long v24 = [MEMORY[0x263F6C818] sharedAnalytics];
      long long v25 = [v24 defaultMessageStream];
      [v25 emitMessage:v15 timestamp:a3];

      long long v26 = [MEMORY[0x263F6C818] sharedAnalytics];
      long long v27 = [v26 defaultMessageStream];
      [v27 emitMessage:v20 timestamp:v32];
    }
    else
    {
      int v29 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v43 = "SVXInstrumentationEmitButtonEvents";
        _os_log_error_impl(&dword_220062000, v29, OS_LOG_TYPE_ERROR, "%s #SVXInstrumentation - turnId doesn't match between button down and up event. Skip button activation instrumentation.", buf, 0xCu);
      }
    }
  }
  else
  {
    __int16 v28 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v43 = "SVXInstrumentationEmitButtonEvents";
      _os_log_error_impl(&dword_220062000, v28, OS_LOG_TYPE_ERROR, "%s #SVXInstrumentation - svxActivationInstrumentation is nil. Button down event was missed.", buf, 0xCu);
    }
  }

  int64_t v30 = self->_svxActivationInstrumentation;
  self->_svxActivationInstrumentation = 0;

  if (self->_currentRequestUUID)
  {
    objc_initWeak((id *)buf, self);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __64__SVXSession__transitSpeechToAutomaticEndpointingWithTimestamp___block_invoke;
    v40[3] = &unk_264554968;
    objc_copyWeak(&v41, (id *)buf);
    [(SVXSession *)self _performBlockAfterContinueBlock:v40];
    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v31 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v43 = "-[SVXSession _transitSpeechToAutomaticEndpointingWithTimestamp:]";
      _os_log_error_impl(&dword_220062000, v31, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", buf, 0xCu);
    }
  }
}

void __64__SVXSession__transitSpeechToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSpeechEndpointerOperationMode:3];
}

- (void)_transitSpeechToManualEndpointing
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v9 = "-[SVXSession _transitSpeechToManualEndpointing]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__SVXSession__transitSpeechToManualEndpointing__block_invoke;
    v6[3] = &unk_264554968;
    objc_copyWeak(&v7, (id *)buf);
    [(SVXSession *)self _performBlockAfterContinueBlock:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v9 = "-[SVXSession _transitSpeechToManualEndpointing]";
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", buf, 0xCu);
    }
  }
}

void __47__SVXSession__transitSpeechToManualEndpointing__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSpeechEndpointerOperationMode:1];
}

- (void)_stopSpeechWithCurrentSpeechRequestOptions
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int v9 = "-[SVXSession _stopSpeechWithCurrentSpeechRequestOptions]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  if (!self->_currentRequestUUID)
  {
    id v6 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v8 = 136315138;
    int v9 = "-[SVXSession _stopSpeechWithCurrentSpeechRequestOptions]";
    id v7 = "%s Ignored because _currentRequestUUID is nil.";
LABEL_11:
    _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v8, 0xCu);
    return;
  }
  if (self->_currentSpeechRequestOptions)
  {
    id v5 = [(SVXSession *)self _connection:0];
    [v5 stopSpeechWithOptions:self->_currentSpeechRequestOptions];

    return;
  }
  id v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315138;
    int v9 = "-[SVXSession _stopSpeechWithCurrentSpeechRequestOptions]";
    id v7 = "%s Ignored because _currentSpeechRequestOptions is nil.";
    goto LABEL_11;
  }
}

- (void)_stopSpeech
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v9 = "-[SVXSession _stopSpeech]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __25__SVXSession__stopSpeech__block_invoke;
    v6[3] = &unk_264554968;
    objc_copyWeak(&v7, (id *)buf);
    [(SVXSession *)self _performBlockAfterContinueBlock:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v9 = "-[SVXSession _stopSpeech]";
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", buf, 0xCu);
    }
  }
}

void __25__SVXSession__stopSpeech__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopSpeechWithCurrentSpeechRequestOptions];
}

- (void)_startSpeechRequestWithOptions:(id)a3 clearsContext:(BOOL)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 taskTracker:(id)a8 completion:(id)a9
{
  BOOL v13 = a4;
  v60[2] = *MEMORY[0x263EF8340];
  id v15 = (NSUUID *)a3;
  id v16 = (NSUUID *)a5;
  id v17 = a6;
  id v51 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = (os_log_t *)MEMORY[0x263F28348];
  int v21 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    __int16 v57 = 2112;
    id v58 = v15;
    __int16 v59 = 1024;
    LODWORD(v60[0]) = v13;
    WORD2(v60[0]) = 2112;
    *(void *)((char *)v60 + 6) = v18;
    _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s options = %@, clearsContext = %d, taskTracker = %@", buf, 0x26u);
    int v21 = *v20;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    __int16 v57 = 2112;
    id v58 = v16;
    __int16 v59 = 2112;
    v60[0] = v17;
    _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s deviceSetupContext = %@, deviceProblemsState = %@", buf, 0x20u);
    int v21 = *v20;
  }
  os_log_t v22 = v17;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v23 = v21;
    long long v24 = [v51 identifier];
    *(_DWORD *)buf = 136315394;
    id v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    __int16 v57 = 2112;
    id v58 = v24;
    _os_log_impl(&dword_220062000, v23, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", buf, 0x16u);

    int v21 = *v20;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    currentRequestUUID = self->_currentRequestUUID;
    *(_DWORD *)buf = 136315394;
    id v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    __int16 v57 = 2112;
    id v58 = currentRequestUUID;
    _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s _currentRequestUUID = %@", buf, 0x16u);
    int v21 = *v20;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    preferences = self->_preferences;
    long long v27 = v21;
    int v28 = [(AFPreferences *)preferences startAlertEnabled];
    *(_DWORD *)buf = 136315394;
    id v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    __int16 v57 = 1024;
    LODWORD(v58) = v28;
    _os_log_impl(&dword_220062000, v27, OS_LOG_TYPE_INFO, "%s startAlertEnabled = %d", buf, 0x12u);
  }
  int v29 = -[SVXSession _connection:](self, "_connection:", 0, v51);
  int v30 = [v29 isRecording];

  if (!v30)
  {
    uint64_t v33 = [v18 instrumentationContext];
    BOOL v34 = [v33 turnIdentifier];
    [(NSUUID *)v15 setTurnIdentifier:v34];

    [(SVXSession *)self _requestWillBeginWithTaskTracker:v18];
    id v35 = [(SVXSession *)self _connection:1];
    uint64_t v32 = [v35 startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:v15];

    if (v13)
    {
      id v36 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDevi"
              "ceContext:taskTracker:completion:]";
        _os_log_impl(&dword_220062000, v36, OS_LOG_TYPE_DEFAULT, "%s clearContext", buf, 0xCu);
      }
      id v37 = [(SVXSession *)self _connection:1];
      [v37 clearContext];

      setApplicationContext = self->_setApplicationContext;
      self->_setApplicationContext = 0;
    }
    uint64_t v39 = _SVXSessionCreateSetApplicationContext(v16);
    if (([(SASetApplicationContext *)self->_setApplicationContext isEqual:v39] & 1) == 0)
    {
      os_log_t v40 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = v40;
        long long v42 = [v39 dictionary];
        *(_DWORD *)buf = 136315394;
        id v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDevi"
              "ceContext:taskTracker:completion:]";
        __int16 v57 = 2112;
        id v58 = v42;
        _os_log_impl(&dword_220062000, v41, OS_LOG_TYPE_DEFAULT, "%s setApplicationContext: %@", buf, 0x16u);
      }
      id v43 = [(SVXSession *)self _connection:1];
      [v43 setApplicationContext:v39];

      __int16 v44 = (SASetApplicationContext *)[v39 copy];
      uint64_t v45 = self->_setApplicationContext;
      self->_setApplicationContext = v44;
    }
    if (v32) {
      v32[2](v32);
    }
    __int16 v46 = (AFSpeechRequestOptions *)[(NSUUID *)v15 copy];
    currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
    self->_currentSpeechRequestOptions = v46;

    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __140__SVXSession__startSpeechRequestWithOptions_clearsContext_deviceSetupContext_deviceProblemsState_localDeviceContext_taskTracker_completion___block_invoke;
    v53[3] = &unk_264553B00;
    id v54 = v19;
    __int16 v48 = (void *)MEMORY[0x223C65C40](v53);
    id currentSpeechRequestDidStartBlock = self->_currentSpeechRequestDidStartBlock;
    self->_id currentSpeechRequestDidStartBlock = v48;

    __int16 v50 = [(SVXSession *)self _connection:0];

    if (v50)
    {
      if ([(AFSpeechRequestOptions *)self->_currentSpeechRequestOptions activationEvent] != 1
        || ([(AFPreferences *)self->_preferences startAlertEnabled] & 1) == 0)
      {
        [(SRSTClient *)self->_client dispatchEvent:0];
        [(SRSTClient *)self->_client dispatchEvent:5];
        [(SVXSession *)self _setCurrentState:2];
      }
    }
    else
    {
      [(SVXSession *)self _requestDidEndWithOptions:0 error:0];
    }

    goto LABEL_31;
  }
  __int16 v31 = *v20;
  if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    _os_log_error_impl(&dword_220062000, v31, OS_LOG_TYPE_ERROR, "%s Attempting to start a new speech request during an existing speech recording.", buf, 0xCu);
    if (!v19) {
      goto LABEL_32;
    }
    goto LABEL_14;
  }
  if (v19)
  {
LABEL_14:
    uint64_t v32 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, void (**)(void)))v19 + 2))(v19, v32);
LABEL_31:
  }
LABEL_32:
}

uint64_t __140__SVXSession__startSpeechRequestWithOptions_clearsContext_deviceSetupContext_deviceProblemsState_localDeviceContext_taskTracker_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_preheatWithStyle:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[SVXSession _preheatWithStyle:]";
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s style = %ld", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [(SVXSession *)self _connection:1];
  [v6 preheatWithStyle:a3];

  [(SVXSession *)self _startSessionIdleTimerWithTimeInterval:4.0];
}

- (void)_deactivateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  int v8 = *MEMORY[0x263F283A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v27 = "-[SVXSession _deactivateWithContext:completion:]";
    __int16 v28 = 2112;
    unint64_t v29 = (unint64_t)v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_DEFAULT, "%s context = %@", buf, 0x16u);
  }
  if ([v6 source] != 3) {
    goto LABEL_11;
  }
  __int16 v9 = self->_currentActivationContext;
  uint64_t v10 = [(SVXActivationContext *)v9 source];
  if (v10 != 7)
  {
    if (v10 == 6)
    {

      goto LABEL_8;
    }

LABEL_17:
    int v21 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      currentActivationContext = self->_currentActivationContext;
      *(_DWORD *)buf = 136315394;
      long long v27 = "-[SVXSession _deactivateWithContext:completion:]";
      __int16 v28 = 2112;
      unint64_t v29 = (unint64_t)currentActivationContext;
      id v16 = "%s Rejected Myriad deactivation because the current activation context is %@.";
      id v17 = v21;
LABEL_22:
      _os_log_error_impl(&dword_220062000, v17, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v11 = [(SVXActivationContext *)v9 requestInfo];
  id v12 = [v11 speechRequestOptions];
  char v13 = [v12 isVoiceTrigger];

  if ((v13 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_8:
  unint64_t v14 = [(SVXActivationContext *)self->_currentActivationContext timestamp];
  if (v14 <= [v6 timestamp])
  {
LABEL_11:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained session:self willDeactivateWithContext:v6];

    if ((unint64_t)(self->_activityState - 3) <= 1)
    {
      id v19 = (SVXDeactivationContext *)[v6 copy];
      currentDeactivationContext = self->_currentDeactivationContext;
      self->_currentDeactivationContext = v19;
    }
    [(SVXSession *)self _cancelRequestWithOptions:6 keepTaskTracker:0];
    if ([v6 source] == 1) {
      [(SVXSession *)self _clearContext];
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __48__SVXSession__deactivateWithContext_completion___block_invoke;
    v23[3] = &unk_264554788;
    void v23[4] = self;
    id v24 = v6;
    long long v25 = v7;
    [(SVXSession *)self _performBlockAfterResignActive:v23];

    goto LABEL_20;
  }
  id v15 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v27 = "-[SVXSession _deactivateWithContext:completion:]";
    __int16 v28 = 2048;
    unint64_t v29 = v14;
    id v16 = "%s Rejected Myriad deactivation because the current activation timestamp is %llu.";
    id v17 = v15;
    goto LABEL_22;
  }
LABEL_18:
  if (v7) {
LABEL_19:
  }
    v7[2](v7);
LABEL_20:
}

uint64_t __48__SVXSession__deactivateWithContext_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  [WeakRetained session:a1[4] didDeactivateWithContext:a1[5]];

  [*(id *)(a1[4] + 344) invalidate];
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 344);
  *(void *)(v3 + 344) = 0;

  uint64_t result = a1[6];
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_activateWithContext:(id)a3 options:(unint64_t)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 speechSynthesisRecord:(id)a8 speechSynthesisState:(int64_t)a9 speechRecordingAlertPolicy:(id)a10 taskTracker:(id)a11 completion:(id)a12
{
  uint64_t v232 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v189 = a5;
  v185 = (__CFString *)a6;
  id v18 = a7;
  id v19 = a8;
  id v187 = a10;
  v186 = (__CFString *)a11;
  id v184 = a12;
  id v20 = (id *)MEMORY[0x263F28348];
  int v21 = (id)*MEMORY[0x263F28348];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    if (a4)
    {
      id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v23 = v22;
      if (a4) {
        [v22 addObject:@"clearsContext"];
      }
      id v24 = (void *)[v23 copy];
    }
    else
    {
      id v24 = (void *)MEMORY[0x263EFFA68];
    }
    long long v25 = v24;
    *(_DWORD *)buf = 136315906;
    v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    __int16 v227 = 2112;
    *(void *)v228 = v17;
    *(_WORD *)&v228[8] = 2112;
    v229 = v25;
    __int16 v230 = 2112;
    v231 = v186;
    _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s context = %@, options = %@, taskTracker = %@", buf, 0x2Au);
  }
  long long v26 = *v20;
  long long v27 = v185;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    __int16 v227 = 2112;
    *(void *)v228 = v189;
    *(_WORD *)&v228[8] = 2112;
    v229 = v185;
    _os_log_impl(&dword_220062000, v26, OS_LOG_TYPE_INFO, "%s deviceSetupContext = %@, deviceProblemsState = %@", buf, 0x20u);
  }

  __int16 v28 = *v20;
  unint64_t v29 = v18;
  uint64_t v30 = self;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v31 = [v18 identifier];
    *(_DWORD *)buf = 136315394;
    v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    __int16 v227 = 2112;
    *(void *)v228 = v31;
    _os_log_impl(&dword_220062000, v28, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", buf, 0x16u);
  }
  uint64_t v32 = *v20;
  uint64_t v33 = v19;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a9 > 2) {
      BOOL v34 = @"(unknown)";
    }
    else {
      BOOL v34 = off_2645534D0[a9];
    }
    id v35 = v34;
    *(_DWORD *)buf = 136315650;
    v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    __int16 v227 = 2112;
    *(void *)v228 = v19;
    *(_WORD *)&v228[8] = 2112;
    v229 = v35;
    _os_log_impl(&dword_220062000, v32, OS_LOG_TYPE_INFO, "%s speechSynthesisRecord = %@, speechSynthesisState = %@", buf, 0x20u);
  }
  id v36 = *v20;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    __int16 v227 = 2112;
    *(void *)v228 = v187;
    _os_log_impl(&dword_220062000, v36, OS_LOG_TYPE_INFO, "%s speechRecordingAlertPolicy = %@", buf, 0x16u);
  }

  unint64_t v37 = [v17 source];
  if (v37 <= 9
    && ((1 << v37) & 0x3D6) != 0
    && ([(AFPreferences *)self->_preferences assistantIsEnabled] & 1) == 0)
  {
    id v38 = [v17 requestInfo];
    uint64_t v39 = [v38 activationEvent];

    os_log_t v40 = *v20;
    if (v39 != 6)
    {
      if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speec"
               "hSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
        _os_log_error_impl(&dword_220062000, v40, OS_LOG_TYPE_ERROR, "%s Siri is not enabled.", buf, 0xCu);
      }
      id v66 = (void *)MEMORY[0x263F087E8];
      uint64_t v223 = *MEMORY[0x263F08608];
      id v67 = [MEMORY[0x263F28508] errorWithCode:18];
      v224 = v67;
      id v68 = [NSDictionary dictionaryWithObjects:&v224 forKeys:&v223 count:1];
      id v54 = [v66 errorWithDomain:@"SiriVOXErrorDomain" code:1 userInfo:v68];

      id v63 = v186;
      id v65 = v184;
      if (v184) {
        (*((void (**)(id, id))v184 + 2))(v184, v54);
      }
      goto LABEL_204;
    }
    id v41 = v40;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechS"
             "ynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
      _os_log_error_impl(&dword_220062000, v41, OS_LOG_TYPE_ERROR, "%s Siri is not enabled, but since this is a critical security alert, we will allow this announcement", buf, 0xCu);
    }
  }
  [(SVXSession *)self _resetMyriadDecision];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained session:self willActivateWithContext:v17];

  unint64_t v44 = [v17 source];
  if (v44 <= 9 && ((1 << v44) & 0x3C6) != 0 && ([MEMORY[0x263F284A0] isAvailable] & 1) == 0)
  {
    v61 = *v20;
    if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechS"
             "ynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
      _os_log_error_impl(&dword_220062000, v61, OS_LOG_TYPE_ERROR, "%s Siri is not reachable.", buf, 0xCu);
    }
    id v62 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:2 userInfo:0];
    id v63 = v186;
    [(SVXSession *)self _requestWillBeginWithTaskTracker:v186];
    v215[0] = MEMORY[0x263EF8330];
    v215[1] = 3221225472;
    v215[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke;
    v215[3] = &unk_264553BA0;
    v216 = v186;
    v217 = self;
    id v218 = v62;
    id v219 = v17;
    id v220 = v184;
    id v64 = v62;
    id v65 = v184;
    id v54 = v64;
    [(SVXSession *)self _waitForMyriadDecisionUsingHandler:v215];
    [(SVXSession *)self _requestDidEndWithOptions:6 error:0];
  }
  else
  {
    if (a4)
    {
      uint64_t v45 = *v20;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speec"
               "hSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
        _os_log_impl(&dword_220062000, v45, OS_LOG_TYPE_DEFAULT, "%s clearContext", buf, 0xCu);
      }

      __int16 v46 = [(SVXSession *)self _connection:1];
      [v46 clearContext];

      setApplicationContext = self->_setApplicationContext;
      self->_setApplicationContext = 0;
    }
    v183 = v17;
    id v180 = v19;
    switch([v17 source])
    {
      case 1:
      case 9:
        __int16 v48 = [v17 requestInfo];
        id v49 = *v20;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2112;
          *(void *)v228 = v48;
          _os_log_impl(&dword_220062000, v49, OS_LOG_TYPE_INFO, "%s requestInfo = %@", buf, 0x16u);
        }

        __int16 v50 = *v20;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          int v51 = [v48 isSpeechRequest];
          int v52 = AFPreferencesTypeToSiriEnabled();
          *(_DWORD *)buf = 136315650;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 1024;
          *(_DWORD *)v228 = v51;
          *(_WORD *)&v228[4] = 1024;
          *(_DWORD *)&v228[6] = v52;
          _os_log_impl(&dword_220062000, v50, OS_LOG_TYPE_INFO, "%s isSpeechRequest = %d, isTypeToSiriEnabled = %d.", buf, 0x18u);
        }

        if (![v48 isSpeechRequest]
          || ([v48 speechRequestOptions],
              uint64_t v53 = objc_claimAutoreleasedReturnValue(),
              v48,
              __int16 v48 = 0,
              id v54 = 0,
              !v53))
        {
          uint64_t v53 = (void *)[objc_alloc(MEMORY[0x263F28690]) initWithActivationEvent:1];
          id v54 = v48;
        }
        id v55 = [v183 buttonEvent];
        if ([v55 type] == 1)
        {
          id v56 = *v20;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            uint64_t v57 = [v183 timestamp];
            uint64_t v58 = [v55 timestamp];
            *(_DWORD *)buf = 136315650;
            v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:s"
                   "peechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
            __int16 v227 = 2048;
            *(void *)v228 = v57;
            *(_WORD *)&v228[8] = 2048;
            v229 = (__CFString *)v58;
            _os_log_impl(&dword_220062000, v56, OS_LOG_TYPE_INFO, "%s button_track typedown context = %lld button = %lld", buf, 0x20u);
          }

          uint64_t v59 = [v55 timestamp];
          if (v59)
          {
            uint64_t v60 = v59;
            AFMachAbsoluteTimeGetTimeInterval();
            objc_msgSend(v53, "setHomeButtonDownEventTime:");
            [v53 setHomeButtonDownEventMachAbsoluteTime:v60];
LABEL_101:
            AFMachAbsoluteTimeGetTimeInterval();
            objc_msgSend(v53, "setActivationEventTime:");
            [v53 setActivationEventMachAbsoluteTime:v60];
LABEL_102:
            [v53 setSpeechSynthesisRecord:v33];

            uint64_t v30 = self;
            if (v53) {
              goto LABEL_122;
            }
            goto LABEL_103;
          }
        }
        else if ([v55 type] == 2)
        {
          __int16 v89 = *v20;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            uint64_t v90 = [v183 timestamp];
            uint64_t v91 = [v55 timestamp];
            *(_DWORD *)buf = 136315650;
            v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:s"
                   "peechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
            __int16 v227 = 2048;
            *(void *)v228 = v90;
            *(_WORD *)&v228[8] = 2048;
            v229 = (__CFString *)v91;
            _os_log_impl(&dword_220062000, v89, OS_LOG_TYPE_INFO, "%s button_track typeup context = %lld button = %lld", buf, 0x20u);
          }
        }
        uint64_t v60 = [v183 timestamp];
        if (!v60) {
          goto LABEL_102;
        }
        goto LABEL_101;
      case 2:
      case 8:
        int64_t v69 = [v17 requestInfo];
        id v54 = v69;
        if (v69)
        {
          if ([v69 isSpeechRequest])
          {
            uint64_t v53 = [v54 speechRequestOptions];

            id v54 = 0;
          }
          else
          {
            uint64_t v53 = 0;
          }
        }
        else
        {
          uint64_t v53 = (void *)[objc_alloc(MEMORY[0x263F28690]) initWithActivationEvent:0];
        }
        goto LABEL_113;
      case 3:
        int64_t v70 = v185;
        unsigned int v72 = *v20;
        if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          _os_log_impl(&dword_220062000, v72, OS_LOG_TYPE_INFO, "%s Starting active audio session request for Myriad...", buf, 0xCu);
        }
        v212[0] = MEMORY[0x263EF8330];
        v212[1] = 3221225472;
        v212[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_123;
        v212[3] = &unk_264553C40;
        v212[4] = self;
        id v213 = v17;
        id v65 = v184;
        id v214 = v184;
        id v63 = v186;
        [(SVXSession *)self _startActiveAudioSessionRequestForType:2 taskTracker:v186 completion:v212];

        id v54 = 0;
        goto LABEL_105;
      case 4:
        uint64_t v53 = (void *)[objc_alloc(MEMORY[0x263F28690]) initWithActivationEvent:5];
        [v53 setEndpointerOperationMode:3];
        if (v19 && (v73 = [v19 beginTimestamp], unint64_t v74 = objc_msgSend(v19, "endTimestamp"), v73) && v74)
        {
          if (v73 <= v74) {
            unint64_t v73 = v74;
          }
        }
        else
        {
          unint64_t v73 = [v183 timestamp];
          if (!v73) {
            goto LABEL_110;
          }
        }
        AFMachAbsoluteTimeGetTimeInterval();
        objc_msgSend(v53, "setActivationEventTime:");
        [v53 setActivationEventMachAbsoluteTime:v73];
LABEL_110:
        [v53 setRecordingAlertPolicy:v187];
        id v54 = 0;
        if (!v53) {
          goto LABEL_103;
        }
        goto LABEL_122;
      case 5:
        id v75 = [v17 systemEvent];
        switch([v75 type])
        {
          case 1:
            int64_t v70 = v185;
            id v76 = [[SVXSpeechSynthesisRequest alloc] initWithPriority:3 options:1 speakableText:0 speakableContext:0 localizationKey:@"SIRI_VOX_SYSTEM_DEVICE_SETUP_COMPLETION" presynthesizedAudio:0 streamID:0];
            unsigned int log = [v75 audioSessionID];
            int64_t v71 = 0;
            uint64_t v77 = 0;
            uint64_t v78 = 0;
            uint64_t v79 = 4;
            goto LABEL_242;
          case 2:
            int64_t v70 = v185;
            id v76 = [[SVXSpeechSynthesisRequest alloc] initWithPriority:3 options:1 speakableText:0 speakableContext:0 localizationKey:@"SIRI_VOX_SYSTEM_FACTORY_RESET_CONFIRMATION" presynthesizedAudio:0 streamID:0];
            goto LABEL_229;
          case 3:
            int64_t v70 = v185;
            v151 = *v20;
            if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              _os_log_impl(&dword_220062000, v151, OS_LOG_TYPE_INFO, "%s Starting active audio session request for Audio Ducking Coordination...", buf, 0xCu);
            }
            v209[0] = MEMORY[0x263EF8330];
            v209[1] = 3221225472;
            v209[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_124;
            v209[3] = &unk_264553C40;
            v209[4] = self;
            id v210 = v17;
            id v65 = v184;
            id v211 = v184;
            id v63 = v186;
            [(SVXSession *)self _startActiveAudioSessionRequestForType:1 taskTracker:v186 completion:v209];

            v152 = v210;
            goto LABEL_231;
          case 7:
            v153 = [v75 deviceSetupFlowScene];
            unint64_t v154 = [v153 sceneID];
            if (v154 == 5) {
              uint64_t v78 = 5;
            }
            else {
              uint64_t v78 = 0;
            }
            id v155 = *v20;
            if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_INFO))
            {
              loga = v155;
              if (v154 > 9) {
                v156 = @"(unknown)";
              }
              else {
                v156 = off_2645542A8[v154];
              }
              v172 = v156;
              v173 = @"unspecified";
              v174 = off_2645530B0[v78];
              *(_DWORD *)buf = 136315906;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              __int16 v227 = 2112;
              *(void *)v228 = v172;
              *(_WORD *)&v228[8] = 2112;
              v229 = @"unspecified";
              __int16 v230 = 2112;
              v231 = v174;
              _os_log_impl(&dword_220062000, loga, OS_LOG_TYPE_INFO, "%s deviceSetupFlowSceneID = %@, introductionSoundID = %@, conclusionSoundID = %@", buf, 0x2Au);

              long long v27 = v185;
            }
            int64_t v70 = v27;
            SVXDeviceSetupCreateSpeechSynthesisRequestForSceneWithID([v153 sceneID]);
            id v76 = (SVXSpeechSynthesisRequest *)objc_claimAutoreleasedReturnValue();
            unsigned int log = [v75 audioSessionID];

            int64_t v71 = 0;
            uint64_t v77 = 0;
            goto LABEL_241;
          case 8:
            int64_t v70 = v185;
            contexta = [v75 storeDemo];
            v157 = *v20;
            if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              __int16 v227 = 2112;
              *(void *)v228 = contexta;
              _os_log_impl(&dword_220062000, v157, OS_LOG_TYPE_INFO, "%s storeDemo = %@", buf, 0x16u);
            }
            int64_t v71 = [contexta languageCode];
            uint64_t v77 = [contexta gender];
            v158 = SVXStoreDemoGetLocalizationKey([contexta transcriptID]);
            if (v158)
            {
              [(SVXSession *)self _connection:1];
              uint64_t v159 = v77;
              v161 = v160 = v75;
              v162 = [(SVXSession *)self _createClientConfiguration:v189 storeDemo:contexta preferences:self->_preferences];
              [v161 setConfiguration:v162];

              id v75 = v160;
              uint64_t v77 = v159;
              id v76 = [[SVXSpeechSynthesisRequest alloc] initWithPriority:3 options:1 speakableText:0 speakableContext:0 localizationKey:v158 presynthesizedAudio:0 streamID:0];
            }
            else
            {
              v171 = *v20;
              if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceConte"
                       "xt:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                _os_log_impl(&dword_220062000, v171, OS_LOG_TYPE_INFO, "%s No valid localizationKey", buf, 0xCu);
              }
              id v76 = 0;
            }
            unsigned int log = [v75 audioSessionID];

            goto LABEL_237;
          case 12:
            if (SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext))
            {
              v163 = v75;
              v164 = *v20;
              if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_ERROR))
              {
                currentActivationContext = self->_currentActivationContext;
                *(_DWORD *)buf = 136315650;
                v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceConte"
                       "xt:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                __int16 v227 = 2112;
                *(void *)v228 = v17;
                *(_WORD *)&v228[8] = 2112;
                v229 = (__CFString *)currentActivationContext;
                _os_log_error_impl(&dword_220062000, v164, OS_LOG_TYPE_ERROR, "%s Unable to activate with context %@ because the current activation context %@ is a speech request.", buf, 0x20u);
              }
              int64_t v70 = v185;
              v165 = (void *)MEMORY[0x263F087E8];
              uint64_t v221 = *MEMORY[0x263F08320];
              v222 = @"Rejected alarms and timers announcement activation because there's an ongoing speech request.";
              v166 = [NSDictionary dictionaryWithObjects:&v222 forKeys:&v221 count:1];
              v167 = [v165 errorWithDomain:@"SiriVOXErrorDomain" code:5 userInfo:v166];

              id v168 = objc_loadWeakRetained((id *)p_delegate);
              [v168 session:self didNotActivateWithContext:v17 error:v167];

              id v65 = v184;
              if (v184) {
                (*((void (**)(id, void *))v184 + 2))(v184, v167);
              }

              id v63 = v186;
              id v75 = v163;
            }
            else
            {
              int64_t v70 = v185;
              int v170 = [v75 audioSessionID];
              v200[0] = MEMORY[0x263EF8330];
              v200[1] = 3221225472;
              v200[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_128;
              v200[3] = &unk_264553C18;
              v200[4] = self;
              v201 = 0;
              int v208 = v170;
              uint64_t v206 = 0;
              uint64_t v207 = 0;
              uint64_t v205 = 0;
              id v63 = v186;
              v202 = v186;
              id v203 = v17;
              id v65 = v184;
              id v204 = v184;
              [(SVXSession *)self _getAlarmAndTimerFiringContextWithCompletion:v200];

              v152 = v201;
LABEL_231:
            }
            id v54 = 0;
            uint64_t v53 = 0;
            id v76 = 0;
            int64_t v71 = 0;
            uint64_t v30 = self;
            goto LABEL_202;
          case 13:
            int64_t v70 = v185;
            id v76 = [v75 speechSynthesisRequest];
            v169 = *v20;
            if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              __int16 v227 = 2112;
              *(void *)v228 = v76;
              _os_log_impl(&dword_220062000, v169, OS_LOG_TYPE_INFO, "%s speechSynthesisRequest = %@", buf, 0x16u);
            }
LABEL_229:
            unsigned int log = [v75 audioSessionID];
            int64_t v71 = 0;
            uint64_t v77 = 0;
LABEL_237:
            uint64_t v78 = 0;
LABEL_241:
            uint64_t v79 = 0;
LABEL_242:

            if (!v76) {
              goto LABEL_58;
            }
            contextb = (void *)MEMORY[0x223C65A20]();
            v192[0] = MEMORY[0x263EF8330];
            v192[1] = 3221225472;
            v192[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_3_137;
            v192[3] = &unk_264553BC8;
            uint64_t v175 = v77;
            uint64_t v30 = self;
            v192[4] = self;
            id v193 = v183;
            v190[0] = MEMORY[0x263EF8330];
            v190[1] = 3221225472;
            v190[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_4;
            v190[3] = &unk_264553BF0;
            v190[4] = self;
            id v65 = v184;
            id v191 = v184;
            int64_t v70 = v185;
            id v63 = v186;
            [(SVXSession *)self _startSpeechSynthesisRequest:v76 languageCode:v71 voiceName:0 gender:v175 audioSessionID:log introductionSoundID:v79 conclusionSoundID:v78 taskTracker:v186 postActivationHandler:v192 completion:v190];

            id v54 = 0;
            uint64_t v53 = 0;
            break;
          default:
            int64_t v70 = v185;

            goto LABEL_57;
        }
        goto LABEL_202;
      case 6:
        id v80 = [v17 requestInfo];
        __int16 v81 = *v20;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2112;
          *(void *)v228 = v80;
          _os_log_impl(&dword_220062000, v81, OS_LOG_TYPE_INFO, "%s requestInfo = %@", buf, 0x16u);
        }

        id v82 = (id *)MEMORY[0x263F28378];
        os_signpost_id_t v83 = os_signpost_id_generate((os_log_t)*MEMORY[0x263F28378]);
        id v84 = *v82;
        __int16 v85 = v84;
        if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_220062000, v85, OS_SIGNPOST_INTERVAL_BEGIN, v83, "voiceUILaunch", "enableTelemetry=YES", buf, 2u);
        }

        self->_os_signpost_id_t launchSignpostID = v83;
        uint64_t v30 = self;
        if (![v80 isSpeechRequest]
          || ([v80 speechRequestOptions],
              uint64_t v53 = objc_claimAutoreleasedReturnValue(),
              v80,
              id v80 = 0,
              id v54 = 0,
              !v53))
        {
          uint64_t v53 = (void *)[objc_alloc(MEMORY[0x263F28690]) initWithActivationEvent:8];
          id v54 = v80;
        }
LABEL_113:
        if (![v53 endpointerOperationMode]) {
          [v53 setEndpointerOperationMode:3];
        }
        [v53 activationEventTime];
        if (v93 == 0.0)
        {
          if (![v54 timestamp] && !objc_msgSend(v183, "timestamp")) {
            mach_absolute_time();
          }
          AFMachAbsoluteTimeGetTimeInterval();
          objc_msgSend(v53, "setActivationEventTime:");
        }
        if ([v53 activationEventMachAbsoluteTime])
        {
          if (v53) {
            goto LABEL_122;
          }
        }
        else
        {
          uint64_t v107 = [v54 timestamp];
          if (!v107)
          {
            uint64_t v107 = [v183 timestamp];
            if (!v107) {
              uint64_t v107 = mach_absolute_time();
            }
          }
          [v53 setActivationEventMachAbsoluteTime:v107];
          if (v53) {
            goto LABEL_122;
          }
        }
LABEL_103:
        int64_t v70 = v185;
        if (!v54)
        {
          int64_t v71 = 0;
          uint64_t v53 = 0;
          goto LABEL_127;
        }
        id v92 = (void *)MEMORY[0x223C65A20]();
        v194[0] = MEMORY[0x263EF8330];
        v194[1] = 3221225472;
        v194[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2_136;
        v194[3] = &unk_264553C40;
        v194[4] = v30;
        id v195 = v183;
        id v65 = v184;
        id v196 = v184;
        id v63 = v186;
        [(SVXSession *)v30 _startRequestWithInfo:v54 clearsContext:0 deviceSetupContext:v189 taskTracker:v186 completion:v194];

LABEL_105:
        uint64_t v53 = 0;
        goto LABEL_201;
      case 7:
        id v54 = [v17 requestInfo];
        v86 = *v20;
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2112;
          *(void *)v228 = v54;
          _os_log_impl(&dword_220062000, v86, OS_LOG_TYPE_INFO, "%s requestInfo = %@", buf, 0x16u);
        }

        if (![v54 isSpeechRequest]) {
          goto LABEL_103;
        }
        uint64_t v53 = [v54 speechRequestOptions];

        if (!v53)
        {
          int64_t v70 = v185;
          int64_t v71 = 0;
LABEL_59:
          id v54 = 0;
          goto LABEL_127;
        }
        if (![v53 endpointerOperationMode]) {
          [v53 setEndpointerOperationMode:3];
        }
        [v53 activationEventTime];
        if (v87 == 0.0)
        {
          if (![0 timestamp] && !objc_msgSend(v183, "timestamp")) {
            mach_absolute_time();
          }
          AFMachAbsoluteTimeGetTimeInterval();
          objc_msgSend(v53, "setActivationEventTime:");
        }
        if (![v53 activationEventMachAbsoluteTime])
        {
          uint64_t v88 = [0 timestamp];
          if (!v88)
          {
            uint64_t v88 = [v183 timestamp];
            if (!v88) {
              uint64_t v88 = mach_absolute_time();
            }
          }
          [v53 setActivationEventMachAbsoluteTime:v88];
        }
        id v54 = 0;
LABEL_122:
        v94 = [v189 beginDate];
        v95 = [v189 endDate];
        if (AFDeviceSetupIsActive())
        {
          int64_t activityState = self->_activityState;

          if (activityState != 1)
          {
            int64_t v70 = v185;
            v97 = *v20;
            if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              _os_log_error_impl(&dword_220062000, v97, OS_LOG_TYPE_ERROR, "%s Siri is in device setup mode and is active.", buf, 0xCu);
            }
            int64_t v71 = 0;
LABEL_127:
            v98 = *v20;
            if (os_log_type_enabled((os_log_t)*v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              __int16 v227 = 2112;
              *(void *)v228 = v183;
              _os_log_error_impl(&dword_220062000, v98, OS_LOG_TYPE_ERROR, "%s Unable to activate with context %@.", buf, 0x16u);
            }
            v99 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:4 userInfo:0];
            id v100 = objc_loadWeakRetained((id *)p_delegate);
            [v100 session:self didNotActivateWithContext:v183 error:v99];

            id v63 = v186;
            id v65 = v184;
            if (v184) {
              (*((void (**)(id, void *))v184 + 2))(v184, v99);
            }

            id v76 = 0;
            goto LABEL_203;
          }
        }
        else
        {
        }
        context = (void *)MEMORY[0x223C65A20]();
        v101 = [v29 playbackStateSnapshot];
        uint64_t v102 = [v101 playbackState];

        v103 = v189;
        if ([v53 isVoiceTrigger])
        {
          if (self->_currentRequestUUID)
          {
            v104 = *v20;
            int64_t v105 = a9;
            if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              _os_log_impl(&dword_220062000, v104, OS_LOG_TYPE_INFO, "%s Barged-in over Siri request.", buf, 0xCu);
            }

            uint64_t v106 = 2;
          }
          else
          {
            uint64_t v106 = 0;
            int64_t v105 = a9;
          }
          if (v105 == 2)
          {
            v108 = *v20;
            if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              _os_log_impl(&dword_220062000, v108, OS_LOG_TYPE_INFO, "%s Barged-in over Siri voice output.", buf, 0xCu);
            }

            v106 |= 4uLL;
          }
          v109 = [v29 homeAnnouncementSnapshot];
          char v110 = [v109 state];

          if (v110)
          {
            v111 = *v20;
            if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              _os_log_impl(&dword_220062000, v111, OS_LOG_TYPE_INFO, "%s Barged-in over home announcement playback.", buf, 0xCu);
            }

            v106 |= 0x20uLL;
          }
          if (v102 == 1)
          {
            v112 = *v20;
            if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              _os_log_impl(&dword_220062000, v112, OS_LOG_TYPE_INFO, "%s Barged-in over media playback.", buf, 0xCu);
            }

            v106 |= 1uLL;
          }
          v113 = [v29 alarmSnapshot];
          int v114 = [v113 hasFiringAlarms];

          if (v114)
          {
            v115 = *v20;
            if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              _os_log_impl(&dword_220062000, v115, OS_LOG_TYPE_INFO, "%s Barged-in over firing alarms.", buf, 0xCu);
            }

            v106 |= 8uLL;
          }
          v116 = [v29 timerSnapshot];
          int v117 = [v116 hasFiringTimers];

          if (v117)
          {
            v118 = *v20;
            v103 = v189;
            if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              _os_log_impl(&dword_220062000, v118, OS_LOG_TYPE_INFO, "%s Barged-in over firing timers.", buf, 0xCu);
            }

            v106 |= 0x10uLL;
          }
          else
          {
            v103 = v189;
          }
          [v53 setBargeInOptions:v106];
        }
        uint64_t v30 = self;
        if (([(AFInstanceContext *)self->_instanceContext supportsAudioPowerUpdate] & 1) == 0)
        {
          v119 = *v20;
          if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:s"
                   "peechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
            _os_log_impl(&dword_220062000, v119, OS_LOG_TYPE_INFO, "%s Disabled input and output audio power updates.", buf, 0xCu);
          }

          [v53 setDisableInputAudioPowerUpdate:1];
          [v53 setDisableOutputAudioPowerUpdate:1];
        }
        [v53 setIsMediaPlaying:v102 == 1];
        [v53 setSpeechSynthesisRecord:v33];
        uint64_t v120 = [v103 beginDate];
        v121 = v103;
        v122 = (void *)v120;
        v123 = [v121 endDate];
        int IsActive = AFDeviceSetupIsActive();

        if (IsActive) {
          [v53 setClientAnalyticsContext:&unk_26D1FD6D8];
        }
        if ([v183 source] != 4) {
          [v53 setReloadSmartSiriVolume:1];
        }
        v125 = *v20;
        if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
        {
          [v53 activationEvent];
          AFSpeechEventGetDescription();
          id v126 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2112;
          *(void *)v228 = v126;
          _os_log_impl(&dword_220062000, v125, OS_LOG_TYPE_INFO, "%s speechRequestOptions.activationEvent = %@", buf, 0x16u);
        }
        v127 = *v20;
        if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
        {
          [v53 activationEventTime];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2048;
          *(void *)v228 = v128;
          _os_log_impl(&dword_220062000, v127, OS_LOG_TYPE_INFO, "%s speechRequestOptions.activationEventTime = %f", buf, 0x16u);
        }

        v129 = *v20;
        if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
        {
          uint64_t v130 = [v53 activationEventMachAbsoluteTime];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2048;
          *(void *)v228 = v130;
          _os_log_impl(&dword_220062000, v129, OS_LOG_TYPE_INFO, "%s speechRequestOptions.activationEventMachAbsoluteTime = %llu", buf, 0x16u);
        }

        v131 = *v20;
        if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
        {
          uint64_t v132 = [v53 bargeInOptions];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2048;
          *(void *)v228 = v132;
          _os_log_impl(&dword_220062000, v131, OS_LOG_TYPE_INFO, "%s speechRequestOptions.bargeInOptions = %lu", buf, 0x16u);
        }

        v133 = *v20;
        if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
        {
          int v134 = [v53 disableInputAudioPowerUpdate];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 1024;
          *(_DWORD *)v228 = v134;
          _os_log_impl(&dword_220062000, v133, OS_LOG_TYPE_INFO, "%s speechRequestOptions.disableInputAudioPowerUpdate = %d", buf, 0x12u);
        }

        v135 = *v20;
        if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
        {
          int v136 = [v53 disableOutputAudioPowerUpdate];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 1024;
          *(_DWORD *)v228 = v136;
          _os_log_impl(&dword_220062000, v135, OS_LOG_TYPE_INFO, "%s speechRequestOptions.disableOutputAudioPowerUpdate = %d", buf, 0x12u);
        }

        v137 = *v20;
        if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
        {
          [v53 endpointerOperationMode];
          AFSpeechEndpointerOperationModeGetName();
          id v138 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2112;
          *(void *)v228 = v138;
          _os_log_impl(&dword_220062000, v137, OS_LOG_TYPE_INFO, "%s speechRequestOptions.endpointerOperationMode = %@", buf, 0x16u);
        }
        v139 = *v20;
        if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
        {
          [v53 homeButtonDownEventTime];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2048;
          *(void *)v228 = v140;
          _os_log_impl(&dword_220062000, v139, OS_LOG_TYPE_INFO, "%s speechRequestOptions.homeButtonDownEventTime = %f", buf, 0x16u);
        }

        v141 = *v20;
        if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
        {
          uint64_t v142 = [v53 homeButtonDownEventMachAbsoluteTime];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2048;
          *(void *)v228 = v142;
          _os_log_impl(&dword_220062000, v141, OS_LOG_TYPE_INFO, "%s speechRequestOptions.homeButtonDownEventMachAbsoluteTime = %llu", buf, 0x16u);
        }

        v143 = *v20;
        if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
        {
          int v144 = [v53 isMediaPlaying];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 1024;
          *(_DWORD *)v228 = v144;
          _os_log_impl(&dword_220062000, v143, OS_LOG_TYPE_INFO, "%s speechRequestOptions.isMediaPlaying = %d", buf, 0x12u);
        }

        v145 = *v20;
        if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
        {
          id v146 = [v53 speechSynthesisRecord];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2112;
          *(void *)v228 = v146;
          _os_log_impl(&dword_220062000, v145, OS_LOG_TYPE_INFO, "%s speechRequestOptions.speechSynthesisRecord = %@", buf, 0x16u);
        }
        v147 = *v20;
        if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
        {
          id v148 = [v53 recordingAlertPolicy];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 2112;
          *(void *)v228 = v148;
          _os_log_impl(&dword_220062000, v147, OS_LOG_TYPE_INFO, "%s speechRequestOptions.recordingAlertPolicy = %@", buf, 0x16u);
        }
        v149 = *v20;
        if (os_log_type_enabled(v149, OS_LOG_TYPE_INFO))
        {
          int v150 = [v53 reloadSmartSiriVolume];
          *(_DWORD *)buf = 136315394;
          v226 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          __int16 v227 = 1024;
          *(_DWORD *)v228 = v150;
          _os_log_impl(&dword_220062000, v149, OS_LOG_TYPE_INFO, "%s speechRequestOptions.reloadSmartSiriVolume = %d", buf, 0x12u);
        }

        v197[0] = MEMORY[0x263EF8330];
        v197[1] = 3221225472;
        v197[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_135;
        v197[3] = &unk_264553C40;
        v197[4] = self;
        id v198 = v183;
        id v65 = v184;
        id v199 = v184;
        int64_t v70 = v185;
        id v63 = v186;
        [(SVXSession *)self _startSpeechRequestWithOptions:v53 clearsContext:0 deviceSetupContext:v189 deviceProblemsState:v185 localDeviceContext:v29 taskTracker:v186 completion:v197];

LABEL_201:
        id v76 = 0;
        int64_t v71 = 0;
LABEL_202:
        [(NSUserActivity *)v30->_userActivity becomeCurrent];
LABEL_203:

        id v17 = v183;
        long long v27 = v70;
        uint64_t v33 = v180;
        break;
      default:
        int64_t v70 = v185;
LABEL_57:
        int64_t v71 = 0;
LABEL_58:
        uint64_t v53 = 0;
        goto LABEL_59;
    }
  }
LABEL_204:
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v16 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynt"
          "hesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]_block_invoke";
    __int16 v17 = 1024;
    int v18 = a2;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Presenting error %d for task tracker %@", buf, 0x1Cu);
  }
  id v6 = *(id **)(a1 + 40);
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    id v11[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_121;
    v11[3] = &unk_264554918;
    v11[4] = v6;
    uint64_t v8 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 64);
    [v6 _presentError:v8 taskTracker:v7 completion:v11];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(v6 + 29);
    [WeakRetained session:*(void *)(a1 + 40) didNotActivateWithContext:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];

    uint64_t v10 = *(void *)(a1 + 64);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, *(void *)(a1 + 48));
    }
  }
}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_123(void *a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  id v4 = WeakRetained;
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  if (v9) {
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6);
  }
  else {
    [WeakRetained session:v5 didActivateWithContext:v6];
  }

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_124(void *a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  id v4 = WeakRetained;
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  if (v9) {
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6);
  }
  else {
    [WeakRetained session:v5 didActivateWithContext:v6];
  }

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
  }

  return MEMORY[0x270F9A758]();
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_128(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynt"
          "hesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]_block_invoke";
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s alarmAndTimerFiringContext = %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(v5 + 424) createSpeechSynthesisRequestWithContext:v3 instanceContext:*(void *)(v5 + 208)];
  unsigned int v12 = *(_DWORD *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_129;
  v15[3] = &unk_264553BC8;
  v15[4] = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 56);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2_130;
  v13[3] = &unk_264553BF0;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 64);
  [(id)v5 _startSpeechSynthesisRequest:v6 languageCode:v10 voiceName:0 gender:v7 audioSessionID:v12 introductionSoundID:v8 conclusionSoundID:v9 taskTracker:v11 postActivationHandler:v15 completion:v13];
}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_135(void *a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  id v4 = WeakRetained;
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  if (v9) {
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6);
  }
  else {
    [WeakRetained session:v5 didActivateWithContext:v6];
  }

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2_136(void *a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  id v4 = WeakRetained;
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  if (v9) {
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6);
  }
  else {
    [WeakRetained session:v5 didActivateWithContext:v6];
  }

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
  }

  return MEMORY[0x270F9A758]();
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_3_137(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v7) {
    [WeakRetained session:v5 didNotActivateWithContext:v6 error:v7];
  }
  else {
    [WeakRetained session:v5 didActivateWithContext:v6];
  }
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_5;
  v7[3] = &unk_2645547D8;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 _performBlockAfterResignActive:v7];
}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_129(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v7) {
    [WeakRetained session:v5 didNotActivateWithContext:v6 error:v7];
  }
  else {
    [WeakRetained session:v5 didActivateWithContext:v6];
  }
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2_130(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_3;
  v7[3] = &unk_2645547D8;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 _performBlockAfterResignActive:v7];
}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_121(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2;
  v3[3] = &unk_264554918;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 _performBlockAfterResignActive:v3];
}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  [WeakRetained session:a1[4] didNotActivateWithContext:a1[5] error:a1[6]];

  uint64_t result = a1[7];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)taskTrackingCenterDidBecomeIdle:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "-[SVXSession taskTrackingCenterDidBecomeIdle:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s taskTrackingCenter = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__SVXSession_taskTrackingCenterDidBecomeIdle___block_invoke;
  v8[3] = &unk_264554548;
  void v8[4] = self;
  void v8[5] = a2;
  [(SVXPerforming *)performer performBlock:v8];
}

void __46__SVXSession_taskTrackingCenterDidBecomeIdle___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _resignActiveForReason:v2];
}

- (void)taskTrackingCenter:(id)a3 didEndTrackingTaskWithContext:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    id v9 = "-[SVXSession taskTrackingCenter:didEndTrackingTaskWithContext:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s taskTrackingCenter = %@, context = %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)taskTrackingCenter:(id)a3 didBeginTrackingTaskWithContext:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    id v9 = "-[SVXSession taskTrackingCenter:didBeginTrackingTaskWithContext:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s taskTrackingCenter = %@, context = %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)taskTrackingCenterWillBecomeBusy:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXSession taskTrackingCenterWillBecomeBusy:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s taskTrackingCenter = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SVXSession_taskTrackingCenterWillBecomeBusy___block_invoke;
  v7[3] = &unk_2645548A0;
  void v7[4] = self;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __47__SVXSession_taskTrackingCenterWillBecomeBusy___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSessionIdleTimer];
}

- (void)stateFeedbackManagerDidStartPlaybackForStateFeedbackType:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a3 && self->_isStateFeedbackEnabled && self->_currentState == 2)
  {
    id v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      id v5 = v4;
      id v6 = SRUIFSiriSessionEventGetDescription();
      int v7 = 136315650;
      int v8 = "-[SVXSession stateFeedbackManagerDidStartPlaybackForStateFeedbackType:]";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s #statefeedback SRUIFSiriStateFeedbackType:%ld SRUIFSiriSessionEvent: %@", (uint8_t *)&v7, 0x20u);
    }
    [(SVXSession *)self _setCurrentState:3];
  }
}

- (void)speechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = "-[SVXSession speechSynthesizerDidFailRequest:taskTracker:error:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@, error = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__SVXSession_speechSynthesizerDidFailRequest_taskTracker_error___block_invoke;
  v16[3] = &unk_264554210;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(SVXPerforming *)performer performBlock:v16];
}

uint64_t __64__SVXSession_speechSynthesizerDidFailRequest_taskTracker_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidFailRequest:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)speechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v16 = "-[SVXSession speechSynthesizerDidInterruptRequest:taskTracker:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SVXSession_speechSynthesizerDidInterruptRequest_taskTracker___block_invoke;
  v12[3] = &unk_2645547B0;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

uint64_t __63__SVXSession_speechSynthesizerDidInterruptRequest_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidInterruptRequest:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48)];
}

- (void)speechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v16 = "-[SVXSession speechSynthesizerDidCancelRequest:taskTracker:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__SVXSession_speechSynthesizerDidCancelRequest_taskTracker___block_invoke;
  v12[3] = &unk_2645547B0;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

uint64_t __60__SVXSession_speechSynthesizerDidCancelRequest_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidCancelRequest:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48)];
}

- (void)speechSynthesizerDidFinishRequest:(id)a3 utteranceInfo:(id)a4 record:(id)a5 taskTracker:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "-[SVXSession speechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:]";
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_debug_impl(&dword_220062000, v14, OS_LOG_TYPE_DEBUG, "%s request = %@, utteranceInfo = %@, record = %@, taskTracker = %@", buf, 0x34u);
  }
  performer = self->_performer;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __81__SVXSession_speechSynthesizerDidFinishRequest_utteranceInfo_record_taskTracker___block_invoke;
  v19[3] = &unk_264554210;
  v19[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v22 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  [(SVXPerforming *)performer performBlock:v19];
}

uint64_t __81__SVXSession_speechSynthesizerDidFinishRequest_utteranceInfo_record_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidFinishRequest:*(void *)(a1 + 40) record:*(void *)(a1 + 48) taskTracker:*(void *)(a1 + 56)];
}

- (void)speechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v21 = "-[SVXSession speechSynthesizerDidStartRequest:record:taskTracker:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s request = %@, record = %@, taskTracker = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__SVXSession_speechSynthesizerDidStartRequest_record_taskTracker___block_invoke;
  v16[3] = &unk_264554210;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(SVXPerforming *)performer performBlock:v16];
}

uint64_t __66__SVXSession_speechSynthesizerDidStartRequest_record_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidStartRequest:*(void *)(a1 + 40) record:*(void *)(a1 + 48) taskTracker:*(void *)(a1 + 56)];
}

- (void)speechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_t *)MEMORY[0x263F28348];
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v38 = "-[SVXSession speechSynthesizerWillStartRequest:taskTracker:]";
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2112;
    id v42 = v7;
    _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@", buf, 0x20u);
  }
  if ([(SVXSession *)self _isTapToRadarEnabled])
  {
    id v10 = [v7 dialogIdentifier];
    id v11 = [(SVXSession *)self _tapToRadarManager];
    id v12 = [v11 getRMVIssueDialogIdentifiers];
    int v13 = [v12 containsObject:v10];

    if (v13)
    {
      id v14 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v38 = "-[SVXSession speechSynthesizerWillStartRequest:taskTracker:]";
        __int16 v39 = 2112;
        id v40 = v10;
        _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s RMV issue (%@) detected, initiating auto tap-to-radar", buf, 0x16u);
      }
      id v15 = [v7 context];
      id v16 = [v15 requestUUID];
      id v17 = @"Siri detected a voice recognition error";
      id v18 = @"RMV";
      id v19 = @"Recognize My Voice";
    }
    else
    {
      id v23 = [v11 getDomainFatalIssueDialogIdentifiers];
      int v24 = [v23 containsObject:v10];

      if (v24)
      {
        id v25 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v38 = "-[SVXSession speechSynthesizerWillStartRequest:taskTracker:]";
          __int16 v39 = 2112;
          id v40 = v10;
          _os_log_impl(&dword_220062000, v25, OS_LOG_TYPE_INFO, "%s Domain Fatal issue (%@) detected, initiating auto tap-to-radar", buf, 0x16u);
        }
        id v15 = [v7 context];
        id v16 = [v15 requestUUID];
        id v17 = @"Siri detected a domain error";
        id v18 = @"Domain Fatal";
        id v20 = self;
        id v21 = v10;
        __int16 v22 = v16;
        id v19 = @"Domain Fatal";
        goto LABEL_13;
      }
      id v15 = [v11 getWebSearchIssueDialogIdentifiers];
      if (![v15 containsObject:v10]) {
        goto LABEL_14;
      }
      __int16 v29 = [v11 getEarlyCutoffUtterances];
      id v30 = [v11 getRecognitionText];
      __int16 v31 = [v30 lowercaseString];
      int v33 = [v29 containsObject:v31];

      if (!v33) {
        goto LABEL_15;
      }
      id v32 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v38 = "-[SVXSession speechSynthesizerWillStartRequest:taskTracker:]";
        __int16 v39 = 2112;
        id v40 = v10;
        _os_log_impl(&dword_220062000, v32, OS_LOG_TYPE_INFO, "%s Early cutoff issue (%@) detected, initiating auto tap-to-radar", buf, 0x16u);
      }
      id v15 = [v7 context];
      id v16 = [v15 requestUUID];
      id v17 = @"Siri detected a potential speech problem";
      id v18 = @"ASR Early Cutoff";
      id v19 = @"Speech Recognition early cutoff caused web search";
    }
    id v20 = self;
    id v21 = v10;
    __int16 v22 = v16;
LABEL_13:
    [(SVXSession *)v20 _promptRadarWithReason:v21 requestID:v22 displayReason:v17 issueTitleName:v18 issueDescName:v19];

LABEL_14:
LABEL_15:
  }
  performer = self->_performer;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __60__SVXSession_speechSynthesizerWillStartRequest_taskTracker___block_invoke;
  v34[3] = &unk_2645547B0;
  v34[4] = self;
  id v35 = v6;
  id v36 = v7;
  id v27 = v7;
  id v28 = v6;
  [(SVXPerforming *)performer performBlock:v34];
}

uint64_t __60__SVXSession_speechSynthesizerWillStartRequest_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerWillStartRequest:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48)];
}

- (void)speechSynthesizerWillEnqueueRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    id v9 = "-[SVXSession speechSynthesizerWillEnqueueRequest:taskTracker:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)speechSynthesizerDidBecomeIdle
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SVXSession speechSynthesizerDidBecomeIdle]";
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SVXSession_speechSynthesizerDidBecomeIdle__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXPerforming *)performer performBlock:v5];
}

uint64_t __44__SVXSession_speechSynthesizerDidBecomeIdle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidBecomeIdle];
}

- (void)speechSynthesizerDidBecomeBusy
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SVXSession speechSynthesizerDidBecomeBusy]";
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SVXSession_speechSynthesizerDidBecomeBusy__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXPerforming *)performer performBlock:v5];
}

uint64_t __44__SVXSession_speechSynthesizerDidBecomeBusy__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerWillBecomeBusy];
}

- (void)acquireAudioSessionForReason:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[SVXSession acquireAudioSessionForReason:completion:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  LOWORD(v15) = 0;
  id v9 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:]([SVXTaskContext alloc], "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", 12, mach_absolute_time(), 0, self->_currentRequestUUID, 0, 0, 0, 0, v15, 0, 0, 0, 0);
  __int16 v10 = [(SVXTaskTrackingCenter *)self->_taskTrackingCenter beginTrackingTaskWithContext:v9 instrumentationContext:self->_currentRequestInstrumentationContext];
  performer = self->_performer;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke;
  v16[3] = &unk_264554918;
  v16[4] = self;
  id v17 = v6;
  id v18 = v10;
  id v19 = v7;
  id v12 = v10;
  id v13 = v6;
  id v14 = v7;
  [(SVXPerforming *)performer performBlock:v16];
}

void __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_2;
  v15[3] = &unk_264553B28;
  v15[4] = a1[4];
  id v2 = (void *)[MEMORY[0x263F285D0] newWithBuilder:v15];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[SVXSession acquireAudioSessionForReason:completion:]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v2;
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s BEGIN -acquireAudioSession (context = %@)", buf, 0x16u);
  }
  uint64_t v4 = mach_absolute_time();
  id v5 = [a1[4] _connection:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_89;
  v8[3] = &unk_264553B78;
  uint64_t v14 = v4;
  id v6 = a1[4];
  id v9 = v2;
  id v10 = v6;
  id v13 = a1[7];
  id v11 = a1[5];
  id v12 = a1[6];
  id v7 = v2;
  [v5 acquireAudioSessionWithContext:v7 completion:v8];
}

void __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setReason:3];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) requestInfo];
  uint64_t v4 = [v3 activationEvent];

  if (v4 == 6)
  {
    [v6 setOptions:2];
  }
  else if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    objc_msgSend(v6, "setSpeechRequestOptions:");
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F28690]) initWithActivationEvent:0];
    [v6 setSpeechRequestOptions:v5];
  }
}

void __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  uint64_t v8 = v7;
  id v9 = [v5 error];
  id v10 = *MEMORY[0x263F28348];
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      __int16 v26 = "-[SVXSession acquireAudioSessionForReason:completion:]_block_invoke";
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      __int16 v29 = 2048;
      uint64_t v30 = v8;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, "%s END -acquireAudioSession (context = %@, duration = %f, uint64_t result = %@)", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    __int16 v26 = "-[SVXSession acquireAudioSessionForReason:completion:]_block_invoke";
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    __int16 v29 = 2048;
    uint64_t v30 = v8;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s END -acquireAudioSession (context = %@, duration = %f, uint64_t result = %@)", buf, 0x2Au);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void **)(v13 + 176);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_90;
  v18[3] = &unk_264553B50;
  v18[4] = v13;
  id v19 = v5;
  id v23 = *(id *)(a1 + 64);
  id v20 = v9;
  id v21 = *(id *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  id v24 = v6;
  id v15 = v6;
  id v16 = v9;
  id v17 = v5;
  [v14 performBlock:v18];
}

void __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_90(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", objc_msgSend(*(id *)(a1 + 40), "audioSessionID"));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24) == 3)
  {
    *(void *)(v2 + 24) = 4;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 56);
    uint64_t v6 = *(void *)(v4 + 32);
    uint64_t v7 = [*(id *)(v4 + 120) turnIdentifier];
    [WeakRetained session:v4 didBecomeActiveWithActivationContext:v5 activityUUID:v6 turnID:v7];

    uint64_t v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 136315394;
      id v19 = "-[SVXSession acquireAudioSessionForReason:completion:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", buf, 0x16u);
    }
    SVXInstrumentationEmitViewAppearContextEnd(*(void **)(*(void *)(a1 + 32) + 120));
  }
  uint64_t v10 = *(void *)(a1 + 72);
  if (v10)
  {
    if (*(void *)(a1 + 48))
    {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
    else
    {
      uint64_t v11 = [SVXAudioSessionAssertion alloc];
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = [*(id *)(a1 + 40) audioSessionID];
      uint64_t v14 = *(void *)(a1 + 64);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_92;
      v16[3] = &unk_264553B00;
      id v17 = *(id *)(a1 + 80);
      id v15 = [(SVXAudioSessionAssertion *)v11 initWithReason:v12 audioSessionID:v13 taskTracker:v14 relinquishHandler:v16];
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
}

uint64_t __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_92(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)assistantConnection:(id)a3 appLaunchFailedWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__SVXSession_assistantConnection_appLaunchFailedWithBundleIdentifier___block_invoke;
  v8[3] = &unk_2645548C8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(SVXPerforming *)performer performBlock:v8];
}

void __70__SVXSession_assistantConnection_appLaunchFailedWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
  [WeakRetained session:*(void *)(a1 + 32) didFailAppLaunchWithBundleIdentifier:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__SVXSession_assistantConnection_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  v8[3] = &unk_2645548C8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(SVXPerforming *)performer performBlock:v8];
}

void __75__SVXSession_assistantConnection_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
  [WeakRetained session:*(void *)(a1 + 32) willProcessAppLaunchWithBundleIdentifier:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 startUIRequestWithInfo:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v17 = "-[SVXSession assistantConnection:startUIRequestWithInfo:completion:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, info = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__SVXSession_assistantConnection_startUIRequestWithInfo_completion___block_invoke;
  v14[3] = &unk_264553B00;
  id v15 = v10;
  id v13 = v10;
  [(SVXPerforming *)performer performBlock:v14];
}

uint64_t __68__SVXSession_assistantConnection_startUIRequestWithInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)assistantConnection:(id)a3 startUIRequestWithText:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v17 = "-[SVXSession assistantConnection:startUIRequestWithText:completion:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, text = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__SVXSession_assistantConnection_startUIRequestWithText_completion___block_invoke;
  v14[3] = &unk_2645547D8;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [(SVXPerforming *)performer performBlock:v14];
}

uint64_t __68__SVXSession_assistantConnection_startUIRequestWithText_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 368) dispatchEvent:0];
  [*(id *)(*(void *)(a1 + 32) + 368) dispatchEvent:5];
  [*(id *)(*(void *)(a1 + 32) + 368) dispatchEvent:6];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)assistantConnection:(id)a3 audioSessionDidBecomeActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[SVXSession assistantConnection:audioSessionDidBecomeActive:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, flag = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__SVXSession_assistantConnection_audioSessionDidBecomeActive___block_invoke;
  v9[3] = &unk_264553AD8;
  void v9[4] = self;
  BOOL v10 = v4;
  [(SVXPerforming *)performer performBlock:v9];
}

uint64_t __62__SVXSession_assistantConnection_audioSessionDidBecomeActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAudioSessionDidBecomeActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 audioSessionWillBecomeActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[SVXSession assistantConnection:audioSessionWillBecomeActive:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, flag = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SVXSession_assistantConnection_audioSessionWillBecomeActive___block_invoke;
  v9[3] = &unk_264553AD8;
  void v9[4] = self;
  BOOL v10 = v4;
  [(SVXPerforming *)performer performBlock:v9];
}

uint64_t __63__SVXSession_assistantConnection_audioSessionWillBecomeActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAudioSessionWillBecomeActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 startPlaybackDidFail:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[SVXSession assistantConnection:startPlaybackDidFail:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2048;
    int64_t v15 = a4;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, playbackType = %ld", buf, 0x20u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__SVXSession_assistantConnection_startPlaybackDidFail___block_invoke;
  v9[3] = &unk_264554548;
  void v9[4] = self;
  void v9[5] = a4;
  [(SVXPerforming *)performer performBlock:v9];
}

uint64_t __55__SVXSession_assistantConnection_startPlaybackDidFail___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidFailStartPlaybackWithDestination:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 willProcessStartPlayback:(int64_t)a4 intent:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v22 = "-[SVXSession assistantConnection:willProcessStartPlayback:intent:completion:]";
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_debug_impl(&dword_220062000, v13, OS_LOG_TYPE_DEBUG, "%s connection = %@, playbackType = %ld, intent = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__SVXSession_assistantConnection_willProcessStartPlayback_intent_completion___block_invoke;
  v17[3] = &unk_264553A38;
  void v17[4] = self;
  id v18 = v11;
  id v19 = v12;
  int64_t v20 = a4;
  id v15 = v12;
  id v16 = v11;
  [(SVXPerforming *)performer performBlock:v17];
}

uint64_t __77__SVXSession_assistantConnection_willProcessStartPlayback_intent_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleWillProcessStartPlaybackWithDestination:*(void *)(a1 + 56) intent:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)assistantConnection:(id)a3 didHandleQuickStopWithAction:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v11 = "-[SVXSession assistantConnection:didHandleQuickStopWithAction:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, actions = %tu", buf, 0x20u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SVXSession_assistantConnection_didHandleQuickStopWithAction___block_invoke;
  v9[3] = &unk_264554548;
  void v9[4] = self;
  void v9[5] = a4;
  [(SVXPerforming *)performer performBlock:v9];
}

uint64_t __63__SVXSession_assistantConnection_didHandleQuickStopWithAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidHandleQuickStopWithActions:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 didStopAudioPlaybackRequest:(id)a4 error:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    int64_t v26 = "-[SVXSession assistantConnection:didStopAudioPlaybackRequest:error:]";
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, request = %@, error = %@", buf, 0x2Au);
  }
  int64_t v12 = [(SVXSoundUtils *)self->_soundUtils getIDFromAudioPlaybackRequest:v9];
  switch(v12)
  {
    case 3:
      analytics = self->_analytics;
      __int16 v14 = AFAnalyticsContextCreateWithError();
      unint64_t v15 = analytics;
      uint64_t v16 = 2712;
      goto LABEL_9;
    case 2:
      id v18 = self->_analytics;
      __int16 v14 = AFAnalyticsContextCreateWithError();
      unint64_t v15 = v18;
      uint64_t v16 = 2710;
      goto LABEL_9;
    case 1:
      id v13 = self->_analytics;
      __int16 v14 = AFAnalyticsContextCreateWithError();
      unint64_t v15 = v13;
      uint64_t v16 = 2708;
LABEL_9:
      [(AFAnalytics *)v15 logEventWithType:v16 context:v14];

      break;
  }
  performer = self->_performer;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __68__SVXSession_assistantConnection_didStopAudioPlaybackRequest_error___block_invoke;
  v22[3] = &unk_2645547B0;
  v22[4] = self;
  id v23 = v9;
  id v24 = v10;
  id v20 = v10;
  id v21 = v9;
  [(SVXPerforming *)performer performBlock:v22];
}

uint64_t __68__SVXSession_assistantConnection_didStopAudioPlaybackRequest_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidStopAudioPlaybackRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)assistantConnection:(id)a3 didStartAudioPlaybackRequest:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v15 = "-[SVXSession assistantConnection:didStartAudioPlaybackRequest:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, request = %@", buf, 0x20u);
  }
  int64_t v9 = [(SVXSoundUtils *)self->_soundUtils getIDFromAudioPlaybackRequest:v7];
  if ((unint64_t)(v9 - 1) <= 2) {
    [(AFAnalytics *)self->_analytics logEventWithType:2 * (v9 - 1) + 2707 context:0];
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SVXSession_assistantConnection_didStartAudioPlaybackRequest___block_invoke;
  v12[3] = &unk_2645548C8;
  void v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(SVXPerforming *)performer performBlock:v12];
}

uint64_t __63__SVXSession_assistantConnection_didStartAudioPlaybackRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidStartAudioPlaybackRequest:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 willStartAudioPlaybackRequest:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[SVXSession assistantConnection:willStartAudioPlaybackRequest:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, request = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __64__SVXSession_assistantConnection_willStartAudioPlaybackRequest___block_invoke;
  v11[3] = &unk_2645548C8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(SVXPerforming *)performer performBlock:v11];
}

uint64_t __64__SVXSession_assistantConnection_willStartAudioPlaybackRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleWillStartAudioPlaybackRequest:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 setUserActivtiyInfoAndMakeCurrent:(id)a4 webpageURL:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[SVXSession assistantConnection:setUserActivtiyInfoAndMakeCurrent:webpageURL:]";
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, info = %@, url = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__SVXSession_assistantConnection_setUserActivtiyInfoAndMakeCurrent_webpageURL___block_invoke;
  v15[3] = &unk_2645547B0;
  v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v13 = v9;
  id v14 = v10;
  [(SVXPerforming *)performer performBlock:v15];
}

uint64_t __79__SVXSession_assistantConnection_setUserActivtiyInfoAndMakeCurrent_webpageURL___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 344) resignCurrent];
  [*(id *)(a1[4] + 344) invalidate];
  if (MEMORY[0x263F84190])
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263F08D38]) initWithActivityType:*MEMORY[0x263F84190]];
    uint64_t v3 = a1[4];
    BOOL v4 = *(void **)(v3 + 344);
    *(void *)(v3 + 344) = v2;
  }
  if (a1[5]) {
    objc_msgSend(*(id *)(a1[4] + 344), "setWebpageURL:");
  }
  if (a1[6]) {
    objc_msgSend(*(id *)(a1[4] + 344), "setUserInfo:");
  }
  id v5 = *(void **)(a1[4] + 344);

  return [v5 becomeCurrent];
}

- (void)assistantConnectionAudioSessionDidEndInterruption:(id)a3 shouldResume:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v12 = "-[SVXSession assistantConnectionAudioSessionDidEndInterruption:shouldResume:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, shouldResume = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__SVXSession_assistantConnectionAudioSessionDidEndInterruption_shouldResume___block_invoke;
  v9[3] = &unk_264553AD8;
  void v9[4] = self;
  BOOL v10 = v4;
  [(SVXPerforming *)performer performBlock:v9];
}

uint64_t __77__SVXSession_assistantConnectionAudioSessionDidEndInterruption_shouldResume___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAudioSessionDidEndInterruption:*(unsigned __int8 *)(a1 + 40)];
}

- (void)assistantConnectionAudioSessionDidBeginInterruption:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXSession assistantConnectionAudioSessionDidBeginInterruption:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__SVXSession_assistantConnectionAudioSessionDidBeginInterruption___block_invoke;
  v7[3] = &unk_2645548A0;
  void v7[4] = self;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __66__SVXSession_assistantConnectionAudioSessionDidBeginInterruption___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAudioSessionDidBeginInterruption];
}

- (void)assistantConnection:(id)a3 didChangeAudioSessionID:(unsigned int)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[SVXSession assistantConnection:didChangeAudioSessionID:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = a4;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, sessionID = %lu", buf, 0x20u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__SVXSession_assistantConnection_didChangeAudioSessionID___block_invoke;
  v9[3] = &unk_264554A08;
  void v9[4] = self;
  unsigned int v10 = a4;
  [(SVXPerforming *)performer performBlock:v9];
}

uint64_t __58__SVXSession_assistantConnection_didChangeAudioSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidChangeAudioSessionID:*(unsigned int *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 shouldSpeak:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[SVXSession assistantConnection:shouldSpeak:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, shouldSpeak = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__SVXSession_assistantConnection_shouldSpeak___block_invoke;
  v9[3] = &unk_264553AD8;
  void v9[4] = self;
  BOOL v10 = v4;
  [(SVXPerforming *)performer performBlock:v9];
}

uint64_t __46__SVXSession_assistantConnection_shouldSpeak___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleShouldSpeak:*(unsigned __int8 *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 requestFailedWithError:(id)a4 requestClass:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v17 = "-[SVXSession assistantConnection:requestFailedWithError:requestClass:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, error = %@, requestClass = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__SVXSession_assistantConnection_requestFailedWithError_requestClass___block_invoke;
  v14[3] = &unk_2645548C8;
  void v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [(SVXPerforming *)performer performBlock:v14];
}

uint64_t __70__SVXSession_assistantConnection_requestFailedWithError_requestClass___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRequestFailedWithError:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "-[SVXSession assistantConnection:receivedCommand:completion:]";
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, command = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__SVXSession_assistantConnection_receivedCommand_completion___block_invoke;
  v15[3] = &unk_264554788;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v13 = v10;
  id v14 = v9;
  [(SVXPerforming *)performer performBlock:v15];
}

uint64_t __61__SVXSession_assistantConnection_receivedCommand_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleReceivedCommand:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)assistantConnectionRequestFinished:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXSession assistantConnectionRequestFinished:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSession_assistantConnectionRequestFinished___block_invoke;
  v7[3] = &unk_2645548A0;
  void v7[4] = self;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __49__SVXSession_assistantConnectionRequestFinished___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRequestFinished];
}

- (void)assistantConnectionDismissAssistant:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXSession assistantConnectionDismissAssistant:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SVXSession_assistantConnectionDismissAssistant___block_invoke;
  v7[3] = &unk_2645548A0;
  void v7[4] = self;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __50__SVXSession_assistantConnectionDismissAssistant___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDismissAssistant];
}

- (void)assistantConnectionRequestWillStart:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (AFModesConfiguration *)a3;
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[SVXSession assistantConnectionRequestWillStart:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_debug_impl(&dword_220062000, v6, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  if ([MEMORY[0x263F28510] isResponseFrameworkEnabled])
  {
    id v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      modesConfiguration = self->_modesConfiguration;
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[SVXSession assistantConnectionRequestWillStart:]";
      __int16 v13 = 2112;
      id v14 = modesConfiguration;
      _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s #modes Sending modes configuration : %@", buf, 0x16u);
    }
    [(AFModesConfiguration *)v4 setModesConfiguration:self->_modesConfiguration];
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__SVXSession_assistantConnectionRequestWillStart___block_invoke;
  v10[3] = &unk_2645548A0;
  void v10[4] = self;
  [(SVXPerforming *)performer performBlock:v10];
}

uint64_t __50__SVXSession_assistantConnectionRequestWillStart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRequestWillStart];
}

- (void)assistantConnection:(id)a3 recognitionUpdateWithPhrases:(id)a4 utterances:(id)a5 refId:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136316162;
    uint64_t v15 = "-[SVXSession assistantConnection:recognitionUpdateWithPhrases:utterances:refId:]";
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_debug_impl(&dword_220062000, v13, OS_LOG_TYPE_DEBUG, "%s connection = %@, phrases = %@, utterances = %@, refId = %@", (uint8_t *)&v14, 0x34u);
  }
}

- (void)assistantConnection:(id)a3 recognizedAdditionalSpeechInterpretation:(id)a4 refId:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315906;
    id v12 = "-[SVXSession assistantConnection:recognizedAdditionalSpeechInterpretation:refId:]";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_debug_impl(&dword_220062000, v10, OS_LOG_TYPE_DEBUG, "%s connection = %@, interpretation = %@, refId = %@", (uint8_t *)&v11, 0x2Au);
  }
}

- (void)assistantConnection:(id)a3 speechRecognizedPartialResult:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v11 = v8;
    id v12 = objc_msgSend(v7, "af_bestTextInterpretation");
    *(_DWORD *)buf = 136315906;
    id v16 = "-[SVXSession assistantConnection:speechRecognizedPartialResult:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    __int16 v22 = v12;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, partialResult = %@, text = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__SVXSession_assistantConnection_speechRecognizedPartialResult___block_invoke;
  v13[3] = &unk_2645548C8;
  void v13[4] = self;
  id v14 = v7;
  id v10 = v7;
  [(SVXPerforming *)performer performBlock:v13];
}

uint64_t __64__SVXSession_assistantConnection_speechRecognizedPartialResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecognizedPartialResult:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 speechRecognized:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = v8;
    id v14 = objc_msgSend(v7, "af_bestTextInterpretation");
    *(_DWORD *)buf = 136315906;
    id v18 = "-[SVXSession assistantConnection:speechRecognized:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    _os_log_debug_impl(&dword_220062000, v13, OS_LOG_TYPE_DEBUG, "%s connection = %@, speechRecognized = %@, text = %@", buf, 0x2Au);
  }
  if ([(SVXSession *)self _isTapToRadarEnabled])
  {
    id v9 = [(SVXSession *)self _tapToRadarManager];
    id v10 = objc_msgSend(v7, "af_bestTextInterpretation");
    [v9 setRecognitionText:v10];
  }
  performer = self->_performer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__SVXSession_assistantConnection_speechRecognized___block_invoke;
  v15[3] = &unk_2645548C8;
  v15[4] = self;
  id v16 = v7;
  id v12 = v7;
  [(SVXPerforming *)performer performBlock:v15];
}

uint64_t __51__SVXSession_assistantConnection_speechRecognized___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecognized:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[SVXSession assistantConnection:speechRecognitionDidFail:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, error = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __59__SVXSession_assistantConnection_speechRecognitionDidFail___block_invoke;
  v11[3] = &unk_2645548C8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(SVXPerforming *)performer performBlock:v11];
}

uint64_t __59__SVXSession_assistantConnection_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecognitionDidFailWithError:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[SVXSession assistantConnection:speechRecordingDidFail:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, error = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __57__SVXSession_assistantConnection_speechRecordingDidFail___block_invoke;
  v11[3] = &unk_2645548C8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(SVXPerforming *)performer performBlock:v11];
}

uint64_t __57__SVXSession_assistantConnection_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecordingDidFailWithError:*(void *)(a1 + 40)];
}

- (void)assistantConnectionSpeechRecordingDidCancel:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXSession assistantConnectionSpeechRecordingDidCancel:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SVXSession_assistantConnectionSpeechRecordingDidCancel___block_invoke;
  v7[3] = &unk_2645548A0;
  void v7[4] = self;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __58__SVXSession_assistantConnectionSpeechRecordingDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecordingDidCancel];
}

- (void)assistantConnectionSpeechRecordingDidEnd:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXSession assistantConnectionSpeechRecordingDidEnd:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SVXSession_assistantConnectionSpeechRecordingDidEnd___block_invoke;
  v7[3] = &unk_2645548A0;
  void v7[4] = self;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __55__SVXSession_assistantConnectionSpeechRecordingDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecordingDidEnd];
}

- (void)assistantConnection:(id)a3 speechRecordingPerformTwoShotPromptWithType:(int64_t)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[SVXSession assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2048;
    int64_t v21 = a4;
    _os_log_debug_impl(&dword_220062000, v10, OS_LOG_TYPE_DEBUG, "%s connection = %@, type = %ld", buf, 0x20u);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__SVXSession_assistantConnection_speechRecordingPerformTwoShotPromptWithType_completion___block_invoke;
  v13[3] = &unk_264554650;
  id v14 = v9;
  int64_t v15 = a4;
  void v13[4] = self;
  id v12 = v9;
  [(SVXPerforming *)performer performBlock:v13];
}

uint64_t __89__SVXSession_assistantConnection_speechRecordingPerformTwoShotPromptWithType_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecordingPerformTwoShotPromptWithType:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)assistantConnectionSpeechRecordingDidDetectStartpoint:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXSession assistantConnectionSpeechRecordingDidDetectStartpoint:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__SVXSession_assistantConnectionSpeechRecordingDidDetectStartpoint___block_invoke;
  v7[3] = &unk_2645548A0;
  void v7[4] = self;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __68__SVXSession_assistantConnectionSpeechRecordingDidDetectStartpoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecordingDidDetectStartpoint];
}

- (void)assistantConnection:(id)a3 speechRecordingDidChangeAVRecordRoute:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[SVXSession assistantConnection:speechRecordingDidChangeAVRecordRoute:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, route = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __72__SVXSession_assistantConnection_speechRecordingDidChangeAVRecordRoute___block_invoke;
  v11[3] = &unk_2645548C8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(SVXPerforming *)performer performBlock:v11];
}

uint64_t __72__SVXSession_assistantConnection_speechRecordingDidChangeAVRecordRoute___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecordingDidChangeAVRecordRoute:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 speechRecordingDidBeginOnAVRecordRoute:(id)a4 audioSessionID:(unsigned int)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v17 = "-[SVXSession assistantConnection:speechRecordingDidBeginOnAVRecordRoute:audioSessionID:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2048;
    uint64_t v23 = a5;
    _os_log_debug_impl(&dword_220062000, v10, OS_LOG_TYPE_DEBUG, "%s connection = %@, route = %@, audioSessionID = %lu", buf, 0x2Au);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__SVXSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke;
  v13[3] = &unk_264553AB0;
  unsigned int v15 = a5;
  void v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [(SVXPerforming *)performer performBlock:v13];
}

uint64_t __88__SVXSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setAudioSessionID:*(unsigned int *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _handleSpeechRecordingDidBeginOnAVRecordRoute:v3];
}

- (void)assistantConnection:(id)a3 speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[SVXSession assistantConnection:speechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, wrapper = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __88__SVXSession_assistantConnection_speechRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke;
  v11[3] = &unk_2645548C8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(SVXPerforming *)performer performBlock:v11];
}

uint64_t __88__SVXSession_assistantConnection_speechRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:*(void *)(a1 + 40)];
}

- (void)assistantConnectionSpeechRecordingWillBegin:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXSession assistantConnectionSpeechRecordingWillBegin:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SVXSession_assistantConnectionSpeechRecordingWillBegin___block_invoke;
  v7[3] = &unk_2645548A0;
  void v7[4] = self;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __58__SVXSession_assistantConnectionSpeechRecordingWillBegin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:0];
}

- (void)activateWithSpeechRequestOptions:(id)a3 options:(unint64_t)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  performer = self->_performer;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __124__SVXSession_activateWithSpeechRequestOptions_options_deviceSetupContext_deviceProblemsState_localDeviceContext_completion___block_invoke;
  v25[3] = &unk_264553A88;
  void v25[4] = self;
  id v26 = v14;
  id v30 = v18;
  unint64_t v31 = a4;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  [(SVXPerforming *)performer performBlock:v25];
}

uint64_t __124__SVXSession_activateWithSpeechRequestOptions_options_deviceSetupContext_deviceProblemsState_localDeviceContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSpeechRequestWithOptions:*(void *)(a1 + 40) clearsContext:*(_DWORD *)(a1 + 80) & 1 deviceSetupContext:*(void *)(a1 + 48) deviceProblemsState:*(void *)(a1 + 56) localDeviceContext:*(void *)(a1 + 64) taskTracker:0 completion:*(void *)(a1 + 72)];
}

- (id)currentRequestUUID
{
  return self->_currentRequestUUID;
}

- (id)getTaskTrackingCenter
{
  return self->_taskTrackingCenter;
}

- (void)updateLocalDeviceContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXSession updateLocalDeviceContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__SVXSession_updateLocalDeviceContext___block_invoke;
  v8[3] = &unk_2645548C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

uint64_t __39__SVXSession_updateLocalDeviceContext___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 296) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (void)updateDeviceSetupContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXSession updateDeviceSetupContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s deviceSetupContext = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__SVXSession_updateDeviceSetupContext___block_invoke;
  v8[3] = &unk_2645548C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __39__SVXSession_updateDeviceSetupContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 288);
  *(void *)(v3 + 288) = v2;

  id v6 = [*(id *)(a1 + 32) _connection:0];
  if (v6)
  {
    id v5 = [*(id *)(a1 + 32) _createClientConfiguration:*(void *)(*(void *)(a1 + 32) + 288) storeDemo:0 preferences:*(void *)(*(void *)(a1 + 32) + 216)];
    [v6 setConfiguration:v5];
  }
}

- (void)updateDeviceProblemsState:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXSession updateDeviceProblemsState:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s deviceProblemsState = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__SVXSession_updateDeviceProblemsState___block_invoke;
  v8[3] = &unk_2645548C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

uint64_t __40__SVXSession_updateDeviceProblemsState___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 280) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (void)invalidate
{
  performer = self->_performer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __24__SVXSession_invalidate__block_invoke;
  v3[3] = &unk_2645548A0;
  void v3[4] = self;
  [(SVXPerforming *)performer performBlock:v3];
}

uint64_t __24__SVXSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)handleCommand:(id)a3 taskTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    performer = self->_performer;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40__SVXSession_handleCommand_taskTracker___block_invoke;
    v9[3] = &unk_2645547B0;
    void v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(SVXPerforming *)performer performBlock:v9];
  }
}

uint64_t __40__SVXSession_handleCommand_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCommand:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48) completion:0];
}

- (void)addRequestBarrier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__SVXSession_addRequestBarrier___block_invoke;
    v7[3] = &unk_2645547D8;
    void v7[4] = self;
    id v8 = v4;
    [(SVXPerforming *)performer performBlock:v7];
  }
}

uint64_t __32__SVXSession_addRequestBarrier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRequestBarrier:*(void *)(a1 + 40)];
}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  id v6 = a3;
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__SVXSession_stopAudioPlaybackRequest_immediately___block_invoke;
  v9[3] = &unk_264553A60;
  void v9[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [(SVXPerforming *)performer performBlock:v9];
}

void __51__SVXSession_stopAudioPlaybackRequest_immediately___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection:1];
  [v2 stopAudioPlaybackRequest:*(void *)(a1 + 40) immediately:*(unsigned __int8 *)(a1 + 48)];
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke;
  v13[3] = &unk_264553A38;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  [(SVXPerforming *)performer performBlock:v13];
}

void __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void **)(*(void *)(a1 + 40) + 336);
    if (!v2)
    {
      uint64_t v3 = objc_opt_new();
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = *(void **)(v4 + 336);
      *(void *)(v4 + 336) = v3;

      id v2 = *(void **)(*(void *)(a1 + 40) + 336);
    }
    id v6 = objc_opt_new();
    [v2 setObject:v6 forKey:*(void *)(a1 + 32)];
  }
  id v7 = [*(id *)(a1 + 40) _connection:1];
  uint64_t v8 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke_2;
  v11[3] = &unk_264553C40;
  int8x16_t v10 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  id v13 = *(id *)(a1 + 48);
  [v7 startAudioPlaybackRequest:v9 options:v8 completion:v11];
}

void __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 176);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke_3;
  v8[3] = &unk_264554918;
  void v8[4] = v4;
  id v9 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  [v5 performBlock:v8];
}

void __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke_3(void *a1)
{
  id v6 = [*(id *)(a1[4] + 336) objectForKey:a1[5]];
  [*(id *)(a1[4] + 336) removeObjectForKey:a1[5]];
  if (![*(id *)(a1[4] + 336) count])
  {
    uint64_t v2 = a1[4];
    id v3 = *(void **)(v2 + 336);
    *(void *)(v2 + 336) = 0;
  }
  uint64_t v4 = a1[7];
  id v5 = v6;
  if (v4)
  {
    [v6 duration];
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, a1[6]);
    id v5 = v6;
  }
}

- (void)getAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    performer = self->_performer;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__SVXSession_getAlarmAndTimerFiringContextWithCompletion___block_invoke;
    v8[3] = &unk_264554650;
    void v8[4] = self;
    id v9 = v5;
    SEL v10 = a2;
    [(SVXPerforming *)performer performBlock:v8];
  }
}

void __58__SVXSession_getAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SVXSession_getAlarmAndTimerFiringContextWithCompletion___block_invoke_2;
  v4[3] = &unk_264553A10;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  [v2 _getAlarmAndTimerFiringContextWithCompletion:v4];
}

void __58__SVXSession_getAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _resignActiveForReason:v3];
}

- (void)getAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    performer = self->_performer;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__SVXSession_getAudioPowerWithType_completion___block_invoke;
    v9[3] = &unk_264554650;
    int64_t v11 = a3;
    void v9[4] = self;
    id v10 = v6;
    [(SVXPerforming *)performer performBlock:v9];
  }
}

void __47__SVXSession_getAudioPowerWithType_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2 == 1)
  {
    uint64_t v3 = 144;
    goto LABEL_5;
  }
  if (v2 == 2)
  {
    uint64_t v3 = 152;
LABEL_5:
    id v4 = *(id *)(a1[4] + v3);
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:
  id v5 = v4;
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)getActivityStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__SVXSession_getActivityStateWithCompletion___block_invoke;
    v7[3] = &unk_2645547D8;
    void v7[4] = self;
    id v8 = v4;
    [(SVXPerforming *)performer performBlock:v7];
  }
}

uint64_t __45__SVXSession_getActivityStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 24));
}

- (void)getStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SVXSession_getStateWithCompletion___block_invoke;
    v7[3] = &unk_2645547D8;
    void v7[4] = self;
    id v8 = v4;
    [(SVXPerforming *)performer performBlock:v7];
  }
}

uint64_t __37__SVXSession_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (void)dismiss
{
  performer = self->_performer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __21__SVXSession_dismiss__block_invoke;
  v3[3] = &unk_2645548A0;
  void v3[4] = self;
  [(SVXPerforming *)performer performBlock:v3];
}

uint64_t __21__SVXSession_dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

- (void)cancelRequest
{
  performer = self->_performer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __27__SVXSession_cancelRequest__block_invoke;
  v3[3] = &unk_2645548A0;
  void v3[4] = self;
  [(SVXPerforming *)performer performBlock:v3];
}

uint64_t __27__SVXSession_cancelRequest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelRequestWithOptions:6 keepTaskTracker:0];
}

- (void)transitSpeechToManualEndpointing
{
  performer = self->_performer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__SVXSession_transitSpeechToManualEndpointing__block_invoke;
  v3[3] = &unk_2645548A0;
  void v3[4] = self;
  [(SVXPerforming *)performer performBlock:v3];
}

uint64_t __46__SVXSession_transitSpeechToManualEndpointing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitSpeechToManualEndpointing];
}

- (void)transitSpeechToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  performer = self->_performer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SVXSession_transitSpeechToAutomaticEndpointingWithTimestamp___block_invoke;
  v4[3] = &unk_264554548;
  v4[4] = self;
  void v4[5] = a3;
  [(SVXPerforming *)performer performBlock:v4];
}

uint64_t __63__SVXSession_transitSpeechToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitSpeechToAutomaticEndpointingWithTimestamp:*(void *)(a1 + 40)];
}

- (void)stopSpeech
{
  performer = self->_performer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __24__SVXSession_stopSpeech__block_invoke;
  v3[3] = &unk_2645548A0;
  void v3[4] = self;
  [(SVXPerforming *)performer performBlock:v3];
}

uint64_t __24__SVXSession_stopSpeech__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpeech];
}

- (void)preheatWithStyle:(int64_t)a3
{
  performer = self->_performer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__SVXSession_preheatWithStyle___block_invoke;
  v4[3] = &unk_264554548;
  v4[4] = self;
  void v4[5] = a3;
  [(SVXPerforming *)performer performBlock:v4];
}

uint64_t __31__SVXSession_preheatWithStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preheatWithStyle:*(void *)(a1 + 40)];
}

- (void)performBlock:(id)a3
{
  if (a3) {
    -[SVXPerforming performBlock:](self->_performer, "performBlock:");
  }
}

- (void)deactivateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __47__SVXSession_deactivateWithContext_completion___block_invoke;
  v11[3] = &unk_264554788;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(SVXPerforming *)performer performBlock:v11];
}

void __47__SVXSession_deactivateWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F285B8]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SVXSession_deactivateWithContext_completion___block_invoke_2;
  v9[3] = &unk_264554480;
  id v10 = *(id *)(a1 + 48);
  uint64_t v3 = (void *)[v2 initWithBlock:v9];
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SVXSession_deactivateWithContext_completion___block_invoke_3;
  v7[3] = &unk_2645548A0;
  id v8 = v3;
  id v6 = v3;
  [v5 _deactivateWithContext:v4 completion:v7];
}

uint64_t __47__SVXSession_deactivateWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __47__SVXSession_deactivateWithContext_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithSignal:0];
}

- (id)activateWithContext:(id)a3 options:(unint64_t)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 speechSynthesisRecord:(id)a8 speechSynthesisState:(int64_t)a9 speechRecordingAlertPolicy:(id)a10 completion:(id)a11
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v58 = a5;
  id v57 = a6;
  id v54 = a7;
  id v17 = a8;
  id v53 = a10;
  id v55 = a11;
  id v18 = [SVXTaskContext alloc];
  uint64_t v19 = [v16 timestamp];
  if (!v19) {
    uint64_t v19 = mach_absolute_time();
  }
  id v20 = objc_alloc_init(MEMORY[0x263F08C38]);
  LOWORD(v51) = 0;
  uint64_t v59 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:](v18, "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", 1, v19, 0, v20, 0, 0, 0, 0, v51, 0, v16, 0, 0);

  uint64_t v21 = [v16 source];
  id v22 = (os_log_t *)MEMORY[0x263F28348];
  if (v21 == 4 && (previousRequestInstrumentationContext = self->_previousRequestInstrumentationContext) != 0)
  {
    analytics = self->_analytics;
    uint64_t v25 = previousRequestInstrumentationContext;
    id v26 = analytics;
    id v27 = v22;
    id v28 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v72 = "SVXInstrumentationNextTurnBasedContextfromContext";
      __int16 v73 = 2112;
      unint64_t v74 = v26;
      __int16 v75 = 2112;
      id v76 = v25;
      _os_log_impl(&dword_220062000, v28, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Start turn (for analytics %@) from current turn (%@)", buf, 0x20u);
    }
    id v29 = [(AFAnalytics *)v25 nextTurnBasedContextForAnalytics:v26];
  }
  else
  {
    uint64_t v25 = self->_analytics;
    id v30 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v72 = "SVXInstrumentationNewTurnBasedContext";
      __int16 v73 = 2112;
      unint64_t v74 = v25;
      _os_log_impl(&dword_220062000, v30, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Start new turn for analytics (%@)", buf, 0x16u);
      id v27 = v22;
      id v30 = *v22;
    }
    else
    {
      id v27 = v22;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v72 = "SVXInstrumentationNewTurnBasedContext";
      __int16 v73 = 2112;
      unint64_t v74 = 0;
      _os_log_impl(&dword_220062000, v30, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Previous turn ID (%@)", buf, 0x16u);
    }
    id v29 = (void *)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:0 analytics:v25];
    id v26 = 0;
  }

  unint64_t v31 = [v16 requestInfo];

  if (v31)
  {
    id v32 = [v16 requestInfo];
    uint64_t v33 = [v29 turnIdentifier];
    [v32 setTurnIdentifier:v33];
  }
  os_log_t v34 = *v27;
  if (os_log_type_enabled(*v27, OS_LOG_TYPE_INFO))
  {
    id v35 = v34;
    id v36 = [v29 turnIdentifier];
    unint64_t v37 = [(AFAnalyticsTurnBasedInstrumentationContext *)self->_previousRequestInstrumentationContext turnIdentifier];
    *(_DWORD *)buf = 136315650;
    unsigned int v72 = "-[SVXSession activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynth"
          "esisRecord:speechSynthesisState:speechRecordingAlertPolicy:completion:]";
    __int16 v73 = 2112;
    unint64_t v74 = v36;
    __int16 v75 = 2112;
    id v76 = v37;
    _os_log_impl(&dword_220062000, v35, OS_LOG_TYPE_INFO, "%s turnID = %@, previousTurnID = %@", buf, 0x20u);
  }
  int v52 = v29;
  id v38 = [(SVXTaskTrackingCenter *)self->_taskTrackingCenter beginTrackingTaskWithContext:v59 instrumentationContext:v29];
  performer = self->_performer;
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke;
  void v60[3] = &unk_2645539E8;
  v60[4] = self;
  id v61 = v16;
  id v62 = v58;
  id v63 = v57;
  id v64 = v54;
  id v65 = v17;
  unint64_t v69 = a4;
  int64_t v70 = a9;
  id v68 = v55;
  id v66 = v53;
  id v40 = v38;
  id v67 = v40;
  id v41 = v53;
  id v42 = v17;
  id v43 = v54;
  id v44 = v57;
  id v45 = v58;
  id v46 = v16;
  id v47 = v55;
  [(SVXPerforming *)performer performBlock:v60];
  __int16 v48 = v67;
  id v49 = v40;

  return v49;
}

void __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F28580]);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke_2;
  v18[3] = &unk_264553998;
  id v19 = *(id *)(a1 + 96);
  uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:5 userInfo:0];
  uint64_t v4 = (void *)[v2 initWithBlock:v18 defaultValue:v3];

  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 104);
  uint64_t v9 = *(void *)(a1 + 112);
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 88);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke_3;
  v16[3] = &unk_2645539C0;
  id v17 = v4;
  id v12 = v4;
  [v15 _activateWithContext:v14 options:v8 deviceSetupContext:v13 deviceProblemsState:v5 localDeviceContext:v6 speechSynthesisRecord:v7 speechSynthesisState:v9 speechRecordingAlertPolicy:v10 taskTracker:v11 completion:v16];
}

uint64_t __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

- (id)activateWithContext:(id)a3 completion:(id)a4
{
  return [(SVXSession *)self activateWithContext:a3 options:0 deviceSetupContext:0 deviceProblemsState:0 localDeviceContext:0 speechSynthesisRecord:0 speechSynthesisState:0 speechRecordingAlertPolicy:0 completion:a4];
}

- (void)prewarmWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __44__SVXSession_prewarmWithContext_completion___block_invoke;
  v11[3] = &unk_264554788;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(SVXPerforming *)performer performBlock:v11];
}

uint64_t __44__SVXSession_prewarmWithContext_completion___block_invoke(uint64_t a1)
{
  switch([*(id *)(a1 + 32) source])
  {
    case 1:
    case 2:
    case 4:
    case 8:
    case 9:
      id v2 = *(void **)(a1 + 40);
      uint64_t v3 = 0;
      goto LABEL_3;
    case 5:
      uint64_t v4 = [*(id *)(a1 + 32) systemEvent];
      uint64_t v5 = [v4 type];
      if (v5 == 2)
      {
        id v6 = *(void **)(*(void *)(a1 + 40) + 192);
        id v7 = [[SVXSpeechSynthesisRequest alloc] initWithPriority:3 options:1 speakableText:0 speakableContext:0 localizationKey:@"SIRI_VOX_SYSTEM_FACTORY_RESET_CONFIRMATION" presynthesizedAudio:0 streamID:0];
      }
      else
      {
        if (v5 != 1) {
          goto LABEL_15;
        }
        id v6 = *(void **)(*(void *)(a1 + 40) + 192);
        id v7 = [[SVXSpeechSynthesisRequest alloc] initWithPriority:3 options:1 speakableText:0 speakableContext:0 localizationKey:@"SIRI_VOX_SYSTEM_DEVICE_SETUP_COMPLETION" presynthesizedAudio:0 streamID:0];
      }
      uint64_t v11 = v7;
      [v6 synthesizeRequest:v7 audioChunkHandler:0 taskTracker:0 analyticsContext:0 completion:0];

LABEL_15:
LABEL_16:
      uint64_t result = *(void *)(a1 + 48);
      if (result)
      {
        uint64_t v13 = *(uint64_t (**)(void))(result + 16);
        return v13();
      }
      return result;
    case 6:
      id v2 = *(void **)(a1 + 40);
      uint64_t v3 = 2;
LABEL_3:
      [v2 _preheatWithStyle:v3];
      goto LABEL_16;
    case 7:
      uint64_t v4 = [*(id *)(a1 + 32) requestInfo];
      if ([v4 isSpeechRequest])
      {
        uint64_t v8 = [v4 speechRequestOptions];
        int v9 = [v8 isVoiceTrigger];

        if (v9) {
          uint64_t v10 = 2;
        }
        else {
          uint64_t v10 = 0;
        }
        [*(id *)(a1 + 40) _preheatWithStyle:v10];
      }
      goto LABEL_15;
    default:
      goto LABEL_16;
  }
}

- (SVXSession)initWithPerformer:(id)a3 serviceCommandHandler:(id)a4 powerLevelManager:(id)a5 speechSynthesizer:(id)a6 instanceContext:(id)a7 preferences:(id)a8 analytics:(id)a9 delegate:(id)a10
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v16 = (NSUUID *)a3;
  id v97 = a4;
  id v17 = a4;
  id v18 = a5;
  id v101 = a6;
  id v100 = a7;
  id v99 = a8;
  id v98 = a9;
  id v19 = a10;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x263F08690] currentHandler];
    id v54 = a7;
    v56 = id v55 = v19;
    [v56 handleFailureInMethod:a2, self, @"SVXSession.m", 361, @"Invalid parameter not satisfying: %@", @"performer != nil" object file lineNumber description];

    id v19 = v55;
    a7 = v54;
    id v16 = 0;
    if (v17) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x263F08690] currentHandler];
  id v88 = a5;
  id v57 = a6;
  id v58 = v16;
  id v59 = a7;
  v61 = id v60 = v19;
  [v61 handleFailureInMethod:a2, self, @"SVXSession.m", 362, @"Invalid parameter not satisfying: %@", @"serviceCommandHandler != nil" object file lineNumber description];

  id v19 = v60;
  a7 = v59;
  id v16 = v58;
  a6 = v57;
  a5 = v88;
LABEL_3:
  if (v101)
  {
    if (v18) {
      goto LABEL_5;
    }
  }
  else
  {
    [MEMORY[0x263F08690] currentHandler];
    id v89 = a5;
    id v62 = a6;
    id v63 = v16;
    id v64 = a7;
    v66 = id v65 = v19;
    [v66 handleFailureInMethod:a2, self, @"SVXSession.m", 363, @"Invalid parameter not satisfying: %@", @"speechSynthesizer != nil" object file lineNumber description];

    id v19 = v65;
    a7 = v64;
    id v16 = v63;
    a6 = v62;
    a5 = v89;
    if (v18) {
      goto LABEL_5;
    }
  }
  [MEMORY[0x263F08690] currentHandler];
  id v90 = a5;
  id v67 = a6;
  id v68 = v16;
  id v69 = a7;
  v71 = id v70 = v19;
  [v71 handleFailureInMethod:a2, self, @"SVXSession.m", 364, @"Invalid parameter not satisfying: %@", @"powerLevelManager != nil" object file lineNumber description];

  id v19 = v70;
  a7 = v69;
  id v16 = v68;
  a6 = v67;
  a5 = v90;
LABEL_5:
  if (!v100)
  {
    [MEMORY[0x263F08690] currentHandler];
    id v91 = a5;
    id v72 = a6;
    __int16 v73 = v16;
    id v74 = a7;
    id v76 = v75 = v19;
    [v76 handleFailureInMethod:a2, self, @"SVXSession.m", 365, @"Invalid parameter not satisfying: %@", @"instanceContext != nil" object file lineNumber description];

    id v19 = v75;
    a7 = v74;
    id v16 = v73;
    a6 = v72;
    a5 = v91;
  }
  if (!v99)
  {
    [MEMORY[0x263F08690] currentHandler];
    id v92 = a5;
    id v77 = a6;
    uint64_t v78 = v16;
    id v79 = a7;
    v81 = id v80 = v19;
    [v81 handleFailureInMethod:a2, self, @"SVXSession.m", 366, @"Invalid parameter not satisfying: %@", @"preferences != nil" object file lineNumber description];

    id v19 = v80;
    a7 = v79;
    id v16 = v78;
    a6 = v77;
    a5 = v92;
  }
  if (!v98)
  {
    [MEMORY[0x263F08690] currentHandler];
    id v93 = a5;
    id v82 = a6;
    os_signpost_id_t v83 = v16;
    id v84 = a7;
    v86 = id v85 = v19;
    [v86 handleFailureInMethod:a2, self, @"SVXSession.m", 367, @"Invalid parameter not satisfying: %@", @"analytics != nil" object file lineNumber description];

    id v19 = v85;
    a7 = v84;
    id v16 = v83;
    a6 = v82;
    a5 = v93;
  }
  v102.receiver = self;
  v102.super_class = (Class)SVXSession;
  id v20 = [(SVXSession *)&v102 init];
  if (v20)
  {
    v95 = v16;
    id v21 = a7;
    id v22 = v19;
    id v87 = v18;
    id v23 = (os_log_t *)MEMORY[0x263F28348];
    id v24 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316930;
      v104 = "-[SVXSession initWithPerformer:serviceCommandHandler:powerLevelManager:speechSynthesizer:instanceContext:pr"
             "eferences:analytics:delegate:]";
      __int16 v105 = 2112;
      uint64_t v106 = v95;
      __int16 v107 = 2112;
      id v108 = v17;
      __int16 v109 = 2112;
      id v110 = v101;
      __int16 v111 = 2112;
      id v112 = v100;
      __int16 v113 = 2112;
      id v114 = v99;
      __int16 v115 = 2112;
      id v116 = v98;
      __int16 v117 = 2112;
      v118 = v22;
      _os_log_impl(&dword_220062000, v24, OS_LOG_TYPE_INFO, "%s performer = %@, serviceCommandHandler = %@, speechSynthesizer = %@, instanceContext = %@, preferences = %@, analytics = %@, delegate = %@", buf, 0x52u);
    }
    v20->_int64_t activityState = 1;
    uint64_t v25 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    sessionUUID = v20->_sessionUUID;
    v20->_sessionUUID = v25;

    id v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    sessionIdleAssertions = v20->_sessionIdleAssertions;
    v20->_sessionIdleAssertions = v27;

    id v29 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_INFO))
    {
      id v30 = v20->_sessionUUID;
      *(_DWORD *)buf = 136315394;
      v104 = "-[SVXSession initWithPerformer:serviceCommandHandler:powerLevelManager:speechSynthesizer:instanceContext:pr"
             "eferences:analytics:delegate:]";
      __int16 v105 = 2112;
      uint64_t v106 = v30;
      _os_log_impl(&dword_220062000, v29, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v20->_performer, a3);
    objc_storeStrong((id *)&v20->_serviceCommandHandler, v97);
    objc_storeStrong((id *)&v20->_powerLevelManager, a5);
    objc_storeStrong((id *)&v20->_speechSynthesizer, a6);
    [(SVXSpeechSynthesizer *)v20->_speechSynthesizer addListener:v20];
    objc_storeStrong((id *)&v20->_instanceContext, v21);
    objc_storeStrong((id *)&v20->_preferences, a8);
    objc_storeStrong((id *)&v20->_analytics, a9);
    id v19 = v22;
    objc_storeWeak((id *)&v20->_delegate, v22);
    v20->_uint64_t currentInstrumentationUIState = 1;
    v20->_unint64_t currentState = 1;
    unint64_t v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    currentSpeechRequestPendingBlocks = v20->_currentSpeechRequestPendingBlocks;
    v20->_currentSpeechRequestPendingBlocks = v31;

    uint64_t v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingRequestBarriers = v20->_pendingRequestBarriers;
    v20->_pendingRequestBarriers = v33;

    id v16 = v95;
    id v35 = [[SVXTaskTrackingCenter alloc] initWithPerformer:v95 delegate:v20];
    taskTrackingCenter = v20->_taskTrackingCenter;
    v20->_taskTrackingCenter = v35;

    unint64_t v37 = objc_alloc_init(SVXAceViewSpeakableTextExtractor);
    aceViewSpeakableTextExtractor = v20->_aceViewSpeakableTextExtractor;
    v20->_aceViewSpeakableTextExtractor = v37;

    __int16 v39 = objc_alloc_init(SVXSpeechSynthesisUtils);
    speechSynthesisUtils = v20->_speechSynthesisUtils;
    v20->_speechSynthesisUtils = v39;

    id v41 = objc_alloc_init(SVXSoundUtils);
    soundUtils = v20->_soundUtils;
    v20->_soundUtils = v41;

    id v43 = objc_alloc_init(SVXAlarmAndTimerUtilities);
    alarmAndTimerUtils = v20->_alarmAndTimerUtils;
    v20->_alarmAndTimerUtils = v43;

    id v45 = objc_alloc_init(SVXAFConnectionFactory);
    connectionFactory = v20->_connectionFactory;
    v20->_connectionFactory = v45;

    v20->_audioSessionID = 0;
    id v47 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    audioSessionAssertions = v20->_audioSessionAssertions;
    v20->_audioSessionAssertions = v47;

    id v49 = (AFModesConfiguration *)objc_alloc_init(MEMORY[0x263F28558]);
    modesConfiguration = v20->_modesConfiguration;
    v20->_modesConfiguration = v49;

    uint64_t v51 = (SRSTClient *)objc_alloc_init(MEMORY[0x263F74758]);
    client = v20->_client;
    v20->_client = v51;

    v20->_isStateFeedbackEnabled = [MEMORY[0x263F28510] isStateFeedbackEnabled];
    id v18 = v87;
  }

  return v20;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[SVXSession dealloc]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SVXSession;
  [(SVXSession *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)SVXSession;
  objc_super v4 = [(SVXSession *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ {sessionUUID = %@, instanceContext = %@}", v4, self->_sessionUUID, self->_instanceContext];

  return (NSString *)v5;
}

@end