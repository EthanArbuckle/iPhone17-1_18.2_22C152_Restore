@interface NAFConnectionClientServiceDelegate
- (NAFConnectionClientServiceDelegate)initWithConnection:(id)a3 targetQueue:(id)a4;
- (id)_connectionDelegate;
- (void)aceConnectionWillRetryOnError:(id)a3;
- (void)acousticIDRequestDidFinishWithSuccess:(BOOL)a3;
- (void)acousticIDRequestWillStart;
- (void)appLaunchFailedWithBundleIdentifier:(id)a3;
- (void)audioPlaybackRequestDidStart:(id)a3;
- (void)audioPlaybackRequestDidStop:(id)a3 error:(id)a4;
- (void)audioPlaybackRequestWillStart:(id)a3;
- (void)audioSessionDidBecomeActive:(BOOL)a3;
- (void)audioSessionDidBeginInterruptionWithUserInfo:(id)a3;
- (void)audioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4;
- (void)audioSessionIDChanged:(unsigned int)a3;
- (void)audioSessionWillBecomeActive:(BOOL)a3;
- (void)cacheImage:(id)a3;
- (void)extensionRequestFinishedForApplication:(id)a3 error:(id)a4;
- (void)extensionRequestWillStartForApplication:(id)a3;
- (void)getBulletinContext:(id)a3;
- (void)invalidateCurrentUserActivity;
- (void)musicWasDetected;
- (void)networkDidBecomeActive;
- (void)quickStopWasHandledWithActions:(unint64_t)a3;
- (void)requestDidAskForTimeoutExtension:(double)a3;
- (void)requestDidReceiveCommand:(id)a3 reply:(id)a4;
- (void)requestDidUpdateResponseMode:(id)a3;
- (void)requestHandleCommand:(id)a3 reply:(id)a4;
- (void)requestRequestedDismissAssistant;
- (void)requestRequestedDismissAssistantWithReason:(int64_t)a3;
- (void)requestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 reply:(id)a5;
- (void)requestRequestedOpenURL:(id)a3 reply:(id)a4;
- (void)setUserActivityInfo:(id)a3 webpageURL:(id)a4;
- (void)shouldSpeakChanged:(BOOL)a3;
- (void)speechRecognitionDidFail:(id)a3;
- (void)speechRecognized:(id)a3;
- (void)speechRecognizedAdditionalInterpretation:(id)a3 refId:(id)a4;
- (void)speechRecognizedPartialResult:(id)a3;
- (void)speechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 reply:(id)a5;
- (void)speechRecordingDidCancelWithReply:(id)a3;
- (void)speechRecordingDidChangeAVRecordRoute:(id)a3 isDucking:(BOOL)a4 isTwoShot:(BOOL)a5 speechEndHostTime:(unint64_t)a6 reply:(id)a7;
- (void)speechRecordingDidEndWithReply:(id)a3;
- (void)speechRecordingDidFail:(id)a3 reply:(id)a4;
- (void)speechRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5;
- (void)speechRecordingPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4;
- (void)speechRecordingStartpointDetectedWithReply:(id)a3;
- (void)speechRecordingWillBeginRecognitionUpdateForTask:(id)a3;
- (void)speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 reply:(id)a4;
- (void)startPlaybackDidFail:(int64_t)a3;
- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4;
- (void)startUIRequestWithText:(id)a3 completion:(id)a4;
- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)willProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)willStopRecordingWithSignpostID:(unint64_t)a3;
@end

@implementation NAFConnectionClientServiceDelegate

- (NAFConnectionClientServiceDelegate)initWithConnection:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NAFConnectionClientServiceDelegate;
  v8 = [(NAFConnectionClientServiceDelegate *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    if (v7)
    {
      v10 = (OS_dispatch_queue *)v7;
      targetQueue = v9->_targetQueue;
      v9->_targetQueue = v10;
    }
    else
    {
      v12 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v13 = MEMORY[0x263EF83A0];
      targetQueue = v9->_targetQueue;
      v9->_targetQueue = v12;
    }
  }
  return v9;
}

- (id)_connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v3 = [WeakRetained delegate];

  return v3;
}

- (void)startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__NAFConnectionClientServiceDelegate_startUIRequestWithText_completion___block_invoke;
  block[3] = &unk_26550EA18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __72__NAFConnectionClientServiceDelegate_startUIRequestWithText_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _startUIRequestWithText:a1[5] completion:a1[6]];
}

- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__NAFConnectionClientServiceDelegate_startUIRequestWithInfo_completion___block_invoke;
  block[3] = &unk_26550EA18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __72__NAFConnectionClientServiceDelegate_startUIRequestWithInfo_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _startUIRequestWithInfo:a1[5] completion:a1[6]];
}

- (void)requestDidReceiveCommand:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__NAFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke;
  block[3] = &unk_26550EA18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __69__NAFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__NAFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke_2;
  v4[3] = &unk_26550E608;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [WeakRetained _handleCommand:v3 reply:v4];
}

uint64_t __69__NAFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestHandleCommand:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke;
  block[3] = &unk_26550EA18;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke(uint64_t a1)
{
  if (WL_AFIsInternalInstall() && (_AFPreferencesGetClientCommandDeliveryDelay(), v2 > 0.0))
  {
    double v3 = v2;
    v4 = [MEMORY[0x263F08AB0] processInfo];
    [v4 systemUptime];
    uint64_t v6 = v5;

    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
      __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_cold_1();
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    v8 = [WeakRetained _activeRequestUUID];

    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = *(NSObject **)(v10 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_717;
    block[3] = &unk_26550EA40;
    void block[4] = v10;
    id v15 = v8;
    id v16 = *(id *)(a1 + 32);
    uint64_t v18 = v6;
    id v17 = *(id *)(a1 + 48);
    id v12 = v8;
    dispatch_after(v9, v11, block);
  }
  else
  {
    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    [v13 _handleCommand:*(void *)(a1 + 32) reply:*(void *)(a1 + 48)];
  }
}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_717(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  double v3 = [WeakRetained _activeRequestUUID];
  int v4 = [v3 isEqual:a1[5]];

  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_717_cold_1((uint64_t)a1, v5);
    }
    id v7 = objc_loadWeakRetained((id *)(a1[4] + 8));
    [v7 _handleCommand:a1[6] reply:a1[7]];
  }
  else if (v6)
  {
    __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_717_cold_2();
  }
}

- (void)requestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  targetQueue = self->_targetQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __92__NAFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke;
  v15[3] = &unk_26550EA68;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(targetQueue, v15);
}

void __92__NAFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v11 = [*(id *)(a1 + 40) _connectionDelegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      [v11 assistantConnection:WeakRetained openApplicationWithBundleID:*(void *)(a1 + 32) URL:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    double v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __92__NAFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)requestRequestedOpenURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__NAFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke;
  block[3] = &unk_26550EA18;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __68__NAFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v11 = [*(id *)(a1 + 40) _connectionDelegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      [v11 assistantConnection:WeakRetained openURL:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    double v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __68__NAFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)requestRequestedDismissAssistant
{
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__NAFConnectionClientServiceDelegate_requestRequestedDismissAssistant__block_invoke;
  block[3] = &unk_26550E2A0;
  void block[4] = self;
  dispatch_async(targetQueue, block);
}

void __70__NAFConnectionClientServiceDelegate_requestRequestedDismissAssistant__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    uint64_t v7 = "-[NAFConnectionClientServiceDelegate requestRequestedDismissAssistant]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_25D830000, v2, OS_LOG_TYPE_INFO, "%s %@ Got dismiss assistant message", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v4 = [*(id *)(a1 + 32) _connectionDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v4 assistantConnectionDismissAssistant:WeakRetained];
  }
}

- (void)requestRequestedDismissAssistantWithReason:(int64_t)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__NAFConnectionClientServiceDelegate_requestRequestedDismissAssistantWithReason___block_invoke;
  v4[3] = &unk_26550E458;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __81__NAFConnectionClientServiceDelegate_requestRequestedDismissAssistantWithReason___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 136315650;
    __int16 v8 = "-[NAFConnectionClientServiceDelegate requestRequestedDismissAssistantWithReason:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_25D830000, v2, OS_LOG_TYPE_INFO, "%s %@ Got dismiss assistant message with reason : %ld", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) _connectionDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v5 assistantConnection:WeakRetained dismissAssistantWithReason:*(void *)(a1 + 40)];
LABEL_7:

    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v5 assistantConnectionDismissAssistant:WeakRetained];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)requestDidUpdateResponseMode:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__NAFConnectionClientServiceDelegate_requestDidUpdateResponseMode___block_invoke;
  v7[3] = &unk_26550E158;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __67__NAFConnectionClientServiceDelegate_requestDidUpdateResponseMode___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  getAFFeatureFlagsClass();
  if ([(id)objc_claimAutoreleasedReturnValue() isStateFeedbackEnabled])
  {
    double v2 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v7 = 136315650;
      id v8 = "-[NAFConnectionClientServiceDelegate requestDidUpdateResponseMode:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_25D830000, v2, OS_LOG_TYPE_INFO, "%s #modes %@ Got update to response mode : %@", (uint8_t *)&v7, 0x20u);
    }
    uint64_t v5 = [*(id *)(a1 + 32) _connectionDelegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      [v5 assistantConnection:WeakRetained didUpdateResponseMode:*(void *)(a1 + 40)];
    }
  }
}

- (void)requestDidAskForTimeoutExtension:(double)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__NAFConnectionClientServiceDelegate_requestDidAskForTimeoutExtension___block_invoke;
  v4[3] = &unk_26550E458;
  void v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __71__NAFConnectionClientServiceDelegate_requestDidAskForTimeoutExtension___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained requestDidAskForTimeoutExtension:*(double *)(a1 + 40)];
}

- (void)quickStopWasHandledWithActions:(unint64_t)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__NAFConnectionClientServiceDelegate_quickStopWasHandledWithActions___block_invoke;
  v4[3] = &unk_26550E458;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __69__NAFConnectionClientServiceDelegate_quickStopWasHandledWithActions___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 136315650;
    id v8 = "-[NAFConnectionClientServiceDelegate quickStopWasHandledWithActions:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_25D830000, v2, OS_LOG_TYPE_INFO, "%s %@ Got quick stop handled message with actions %tu taken.", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) _connectionDelegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v5 assistantConnection:WeakRetained didHandleQuickStopWithAction:*(void *)(a1 + 40)];
  }
}

- (void)getBulletinContext:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__NAFConnectionClientServiceDelegate_getBulletinContext___block_invoke;
  v7[3] = &unk_26550EA90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __57__NAFConnectionClientServiceDelegate_getBulletinContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    double v2 = [WeakRetained _cachedBulletins];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
  }
}

- (void)acousticIDRequestWillStart
{
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__NAFConnectionClientServiceDelegate_acousticIDRequestWillStart__block_invoke;
  block[3] = &unk_26550E2A0;
  void block[4] = self;
  dispatch_async(targetQueue, block);
}

void __64__NAFConnectionClientServiceDelegate_acousticIDRequestWillStart__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateWillStartAcousticIDRequest];
}

- (void)musicWasDetected
{
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NAFConnectionClientServiceDelegate_musicWasDetected__block_invoke;
  block[3] = &unk_26550E2A0;
  void block[4] = self;
  dispatch_async(targetQueue, block);
}

void __54__NAFConnectionClientServiceDelegate_musicWasDetected__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateDidDetectMusic];
}

- (void)acousticIDRequestDidFinishWithSuccess:(BOOL)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__NAFConnectionClientServiceDelegate_acousticIDRequestDidFinishWithSuccess___block_invoke;
  v4[3] = &unk_26550EAB8;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __76__NAFConnectionClientServiceDelegate_acousticIDRequestDidFinishWithSuccess___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateDidFinishAcousticIDRequestWithSuccess:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setUserActivityInfo:(id)a3 webpageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__NAFConnectionClientServiceDelegate_setUserActivityInfo_webpageURL___block_invoke;
  block[3] = &unk_26550E8B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __69__NAFConnectionClientServiceDelegate_setUserActivityInfo_webpageURL___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellDelegateSetUserActivityInfo:a1[5] webpageURL:a1[6]];
}

- (void)invalidateCurrentUserActivity
{
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NAFConnectionClientServiceDelegate_invalidateCurrentUserActivity__block_invoke;
  block[3] = &unk_26550E2A0;
  void block[4] = self;
  dispatch_async(targetQueue, block);
}

void __67__NAFConnectionClientServiceDelegate_invalidateCurrentUserActivity__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateInvalidateCurrentUserActivity];
}

- (void)cacheImage:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__NAFConnectionClientServiceDelegate_cacheImage___block_invoke;
  v7[3] = &unk_26550E158;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __49__NAFConnectionClientServiceDelegate_cacheImage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateCacheImage:*(void *)(a1 + 40)];
}

- (void)extensionRequestWillStartForApplication:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__NAFConnectionClientServiceDelegate_extensionRequestWillStartForApplication___block_invoke;
  v7[3] = &unk_26550E158;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __78__NAFConnectionClientServiceDelegate_extensionRequestWillStartForApplication___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateExtensionRequestWillStartForApplication:*(void *)(a1 + 40)];
}

- (void)extensionRequestFinishedForApplication:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__NAFConnectionClientServiceDelegate_extensionRequestFinishedForApplication_error___block_invoke;
  block[3] = &unk_26550E8B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __83__NAFConnectionClientServiceDelegate_extensionRequestFinishedForApplication_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellDelegateExtensionRequestFinishedForApplication:a1[5] error:a1[6]];
}

- (void)shouldSpeakChanged:(BOOL)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__NAFConnectionClientServiceDelegate_shouldSpeakChanged___block_invoke;
  v4[3] = &unk_26550EAB8;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __57__NAFConnectionClientServiceDelegate_shouldSpeakChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setShouldSpeak:*(unsigned __int8 *)(a1 + 40)];
}

- (void)audioSessionIDChanged:(unsigned int)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__NAFConnectionClientServiceDelegate_audioSessionIDChanged___block_invoke;
  v4[3] = &unk_26550EAE0;
  void v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __60__NAFConnectionClientServiceDelegate_audioSessionIDChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setAudioSessionID:*(unsigned int *)(a1 + 40)];
}

- (void)aceConnectionWillRetryOnError:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__NAFConnectionClientServiceDelegate_aceConnectionWillRetryOnError___block_invoke;
  v7[3] = &unk_26550E158;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __68__NAFConnectionClientServiceDelegate_aceConnectionWillRetryOnError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _aceConnectionWillRetryOnError:*(void *)(a1 + 40)];
}

- (void)speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__NAFConnectionClientServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper_reply___block_invoke;
  block[3] = &unk_26550EA18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

uint64_t __98__NAFConnectionClientServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper_reply___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  char v3 = [WeakRetained _startInputAudioPowerUpdatesWithXPCWrapper:a1[5]];

  id v4 = objc_loadWeakRetained((id *)(a1[4] + 8));
  unsigned int v5 = v4;
  if (v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = a1[5];
  }
  [v4 _tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:v6];

  uint64_t result = a1[6];
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)speechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  kdebug_trace();
  targetQueue = self->_targetQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __98__NAFConnectionClientServiceDelegate_speechRecordingDidBeginOnAVRecordRoute_audioSessionID_reply___block_invoke;
  v13[3] = &unk_26550EB08;
  unsigned int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(targetQueue, v13);
}

void __98__NAFConnectionClientServiceDelegate_speechRecordingDidBeginOnAVRecordRoute_audioSessionID_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setAudioSessionID:*(unsigned int *)(a1 + 56)];
  [WeakRetained _setRecordRoute:*(void *)(a1 + 40)];
  [WeakRetained _tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:*(void *)(a1 + 40) audioSessionID:*(unsigned int *)(a1 + 56)];
  [WeakRetained _updateStateIfNotInSync];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)speechRecordingDidChangeAVRecordRoute:(id)a3 isDucking:(BOOL)a4 isTwoShot:(BOOL)a5 speechEndHostTime:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__NAFConnectionClientServiceDelegate_speechRecordingDidChangeAVRecordRoute_isDucking_isTwoShot_speechEndHostTime_reply___block_invoke;
  block[3] = &unk_26550EB30;
  void block[4] = self;
  id v18 = v12;
  BOOL v21 = a4;
  BOOL v22 = a5;
  id v19 = v13;
  unint64_t v20 = a6;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(targetQueue, block);
}

void __120__NAFConnectionClientServiceDelegate_speechRecordingDidChangeAVRecordRoute_isDucking_isTwoShot_speechEndHostTime_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setRecordRoute:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 64)) {
    [WeakRetained _markIsDucking];
  }
  if (*(unsigned char *)(a1 + 65)) {
    [WeakRetained _markIsTwoShot];
  }
  uint64_t v2 = WeakRetained;
  if (*(void *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "_updateSpeechEndHostTime:");
    uint64_t v2 = WeakRetained;
  }
  [v2 _tellSpeechDelegateRecordingDidChangeAVRecordRoute:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)speechRecordingStartpointDetectedWithReply:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__NAFConnectionClientServiceDelegate_speechRecordingStartpointDetectedWithReply___block_invoke;
  v7[3] = &unk_26550EB58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

uint64_t __81__NAFConnectionClientServiceDelegate_speechRecordingStartpointDetectedWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellSpeechDelegateRecordingDidDetectStartpoint];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)speechRecordingPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__NAFConnectionClientServiceDelegate_speechRecordingPerformTwoShotPromptWithType_reply___block_invoke;
  block[3] = &unk_26550EB80;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(targetQueue, block);
}

void __88__NAFConnectionClientServiceDelegate_speechRecordingPerformTwoShotPromptWithType_reply___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellSpeechDelegateToPerformTwoShotPromptWithType:a1[6] reply:a1[5]];
}

- (void)speechRecordingDidEndWithReply:(id)a3
{
  id v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__NAFConnectionClientServiceDelegate_speechRecordingDidEndWithReply___block_invoke;
  block[3] = &unk_26550EB80;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(targetQueue, block);
}

void __69__NAFConnectionClientServiceDelegate_speechRecordingDidEndWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [WeakRetained _extendRequestTimeoutForReason:v2 durationInSeconds:0.0];
  [WeakRetained _checkAndSetIsCapturingSpeech:0];
  [WeakRetained _tellSpeechDelegateRecordingDidEnd];
  [WeakRetained _beginInterstitialsForReason:v2];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)speechRecordingDidCancelWithReply:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__NAFConnectionClientServiceDelegate_speechRecordingDidCancelWithReply___block_invoke;
  v7[3] = &unk_26550EB58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __72__NAFConnectionClientServiceDelegate_speechRecordingDidCancelWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _updateStateIfNotInSync];
  [WeakRetained _checkAndSetIsCapturingSpeech:0];
  [WeakRetained _tellSpeechDelegateRecordingDidCancel];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)speechRecordingDidFail:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NAFConnectionClientServiceDelegate_speechRecordingDidFail_reply___block_invoke;
  block[3] = &unk_26550EA18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

uint64_t __67__NAFConnectionClientServiceDelegate_speechRecordingDidFail_reply___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _speechRecordingDidFailWithError:a1[5]];

  uint64_t result = a1[6];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)willStopRecordingWithSignpostID:(unint64_t)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__NAFConnectionClientServiceDelegate_willStopRecordingWithSignpostID___block_invoke;
  v4[3] = &unk_26550E458;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __70__NAFConnectionClientServiceDelegate_willStopRecordingWithSignpostID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _willStopRecordingWithSignpostID:*(void *)(a1 + 40)];
}

- (void)speechRecognized:(id)a3
{
  id v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NAFConnectionClientServiceDelegate_speechRecognized___block_invoke;
  block[3] = &unk_26550EBA8;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(targetQueue, block);
}

void __55__NAFConnectionClientServiceDelegate_speechRecognized___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [WeakRetained _markSpeechRecognized];
  [WeakRetained _extendRequestTimeoutForReason:v2 durationInSeconds:0.0];
  [WeakRetained _tellSpeechDelegateSpeechRecognized:*(void *)(a1 + 40)];
  [WeakRetained _beginInterstitialsForReason:v2];
}

- (void)speechRecognizedAdditionalInterpretation:(id)a3 refId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NAFConnectionClientServiceDelegate_speechRecognizedAdditionalInterpretation_refId___block_invoke;
  block[3] = &unk_26550E8B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __85__NAFConnectionClientServiceDelegate_speechRecognizedAdditionalInterpretation_refId___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:a1[5] refId:a1[6]];
}

- (void)speechRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  targetQueue = self->_targetQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__NAFConnectionClientServiceDelegate_speechRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke;
  v15[3] = &unk_26550EBD0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(targetQueue, v15);
}

void __98__NAFConnectionClientServiceDelegate_speechRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:a1[5] utterances:a1[6] refId:a1[7]];
}

- (void)speechRecordingWillBeginRecognitionUpdateForTask:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__NAFConnectionClientServiceDelegate_speechRecordingWillBeginRecognitionUpdateForTask___block_invoke;
  v7[3] = &unk_26550E158;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __87__NAFConnectionClientServiceDelegate_speechRecordingWillBeginRecognitionUpdateForTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellSpeechDelegateRecognitionUpdateWillBeginForTask:*(void *)(a1 + 40)];
}

- (void)speechRecognizedPartialResult:(id)a3
{
  id v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__NAFConnectionClientServiceDelegate_speechRecognizedPartialResult___block_invoke;
  block[3] = &unk_26550EBA8;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(targetQueue, block);
}

void __68__NAFConnectionClientServiceDelegate_speechRecognizedPartialResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [WeakRetained _extendExistingRequestTimeoutForReason:v3];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [v4 _tellSpeechDelegateSpeechRecognizedPartialResult:*(void *)(a1 + 40)];
}

- (void)speechRecognitionDidFail:(id)a3
{
  id v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NAFConnectionClientServiceDelegate_speechRecognitionDidFail___block_invoke;
  block[3] = &unk_26550EBA8;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(targetQueue, block);
}

void __63__NAFConnectionClientServiceDelegate_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [WeakRetained _cancelRequestTimeoutForReason:v3];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [v4 _tellSpeechDelegateRecognitionDidFail:*(void *)(a1 + 40)];
}

- (void)audioSessionDidBeginInterruptionWithUserInfo:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__NAFConnectionClientServiceDelegate_audioSessionDidBeginInterruptionWithUserInfo___block_invoke;
  v7[3] = &unk_26550E158;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __83__NAFConnectionClientServiceDelegate_audioSessionDidBeginInterruptionWithUserInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:*(void *)(a1 + 40)];
}

- (void)audioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4
{
  id v6 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__NAFConnectionClientServiceDelegate_audioSessionDidEndInterruption_userInfo___block_invoke;
  block[3] = &unk_26550EBF8;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(targetQueue, block);
}

void __78__NAFConnectionClientServiceDelegate_audioSessionDidEndInterruption_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioSessionDidEndInterruption:*(unsigned __int8 *)(a1 + 48) userInfo:*(void *)(a1 + 40)];
}

- (void)audioPlaybackRequestWillStart:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__NAFConnectionClientServiceDelegate_audioPlaybackRequestWillStart___block_invoke;
  v7[3] = &unk_26550E158;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __68__NAFConnectionClientServiceDelegate_audioPlaybackRequestWillStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioPlaybackRequestWillStart:*(void *)(a1 + 40)];
}

- (void)audioPlaybackRequestDidStart:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__NAFConnectionClientServiceDelegate_audioPlaybackRequestDidStart___block_invoke;
  v7[3] = &unk_26550E158;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

void __67__NAFConnectionClientServiceDelegate_audioPlaybackRequestDidStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioPlaybackRequestDidStart:*(void *)(a1 + 40)];
}

- (void)audioPlaybackRequestDidStop:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__NAFConnectionClientServiceDelegate_audioPlaybackRequestDidStop_error___block_invoke;
  block[3] = &unk_26550E8B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(targetQueue, block);
}

void __72__NAFConnectionClientServiceDelegate_audioPlaybackRequestDidStop_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellDelegateAudioPlaybackRequestDidStop:a1[5] error:a1[6]];
}

- (void)willProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  targetQueue = self->_targetQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__NAFConnectionClientServiceDelegate_willProcessStartPlayback_intent_completion___block_invoke;
  v13[3] = &unk_26550EC20;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(targetQueue, v13);
}

void __81__NAFConnectionClientServiceDelegate_willProcessStartPlayback_intent_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained _tellDelegateWillProcessStartPlayback:a1[7] intent:a1[5] completion:a1[6]];
}

- (void)startPlaybackDidFail:(int64_t)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__NAFConnectionClientServiceDelegate_startPlaybackDidFail___block_invoke;
  v4[3] = &unk_26550E458;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __59__NAFConnectionClientServiceDelegate_startPlaybackDidFail___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateStartPlaybackDidFail:*(void *)(a1 + 40)];
}

- (void)audioSessionWillBecomeActive:(BOOL)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__NAFConnectionClientServiceDelegate_audioSessionWillBecomeActive___block_invoke;
  v4[3] = &unk_26550EAB8;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __67__NAFConnectionClientServiceDelegate_audioSessionWillBecomeActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioSessionWillBecomeActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)audioSessionDidBecomeActive:(BOOL)a3
{
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__NAFConnectionClientServiceDelegate_audioSessionDidBecomeActive___block_invoke;
  v4[3] = &unk_26550EAB8;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __66__NAFConnectionClientServiceDelegate_audioSessionDidBecomeActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellDelegateAudioSessionDidBecomeActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__NAFConnectionClientServiceDelegate_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  block[3] = &unk_26550EC48;
  objc_copyWeak(&v9, &to);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);
}

void __79__NAFConnectionClientServiceDelegate_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _tellDelegateWillProcessAppLaunchWithBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)appLaunchFailedWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__NAFConnectionClientServiceDelegate_appLaunchFailedWithBundleIdentifier___block_invoke;
  block[3] = &unk_26550EC48;
  objc_copyWeak(&v9, &to);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);
}

void __74__NAFConnectionClientServiceDelegate_appLaunchFailedWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _tellDelegateFailedToLaunchAppWithBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)networkDidBecomeActive
{
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__NAFConnectionClientServiceDelegate_networkDidBecomeActive__block_invoke;
  v4[3] = &unk_26550E4A8;
  objc_copyWeak(&v5, &to);
  dispatch_async(targetQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&to);
}

void __60__NAFConnectionClientServiceDelegate_networkDidBecomeActive__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _markNetworkDidBecomeActive];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_10();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_25D830000, v1, OS_LOG_TYPE_DEBUG, "%s Delaying delivery of client command %@ by %f seconds...", (uint8_t *)v2, 0x20u);
}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_717_cold_1(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = (void *)MEMORY[0x263F08AB0];
  uint64_t v5 = a2;
  id v6 = [v4 processInfo];
  [v6 systemUptime];
  double v8 = v7 - *(double *)(a1 + 64);
  int v9 = 136315650;
  id v10 = "-[NAFConnectionClientServiceDelegate requestHandleCommand:reply:]_block_invoke";
  __int16 v11 = 2112;
  uint64_t v12 = v3;
  __int16 v13 = 2048;
  double v14 = v8;
  _os_log_debug_impl(&dword_25D830000, v5, OS_LOG_TYPE_DEBUG, "%s Delayed delivery of client command %@ by %f seconds.", (uint8_t *)&v9, 0x20u);
}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_717_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_25D830000, v0, v1, "%s Dropping delayed client command %@ because request already ended.", v2, v3, v4, v5, 2u);
}

void __92__NAFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__NAFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end