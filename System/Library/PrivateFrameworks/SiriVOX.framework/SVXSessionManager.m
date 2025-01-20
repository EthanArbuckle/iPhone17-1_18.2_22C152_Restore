@interface SVXSessionManager
- (SVXSessionManager)initWithModule:(id)a3;
- (id)_currentSession:(BOOL)a3;
- (void)_activateWithContext:(id)a3 activityState:(int64_t)a4 completion:(id)a5;
- (void)_attachToTether;
- (void)_deactivateWithContext:(id)a3 completion:(id)a4;
- (void)_fetchCurrentActivityStateWithCompletion:(id)a3;
- (void)_fetchCurrentAudioPowerWithType:(int64_t)a3 completion:(id)a4;
- (void)_fetchCurrentStateWithCompletion:(id)a3;
- (void)_fetchStereoPairStateWithCompletion:(id)a3;
- (void)_fetchStereoPartnerLastMyriadWinDate;
- (void)_handleDeviceProblemsStateChanged:(id)a3;
- (void)_handleDeviceSetupContextChanged:(id)a3;
- (void)_handleDidFailAppLaunchWithBundleIdentifier:(id)a3;
- (void)_handleFetchedStereoPartnerLastMyriadWinDate:(id)a3;
- (void)_handleLocalDeviceContextChanged:(id)a3;
- (void)_handleMyriadForActivationContext:(id)a3;
- (void)_handleSession:(id)a3 audioSessionDidBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6;
- (void)_handleSession:(id)a3 audioSessionWillBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6;
- (void)_handleSession:(id)a3 didActivateWithContext:(id)a4;
- (void)_handleSession:(id)a3 didBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6;
- (void)_handleSession:(id)a3 didChangeFromState:(int64_t)a4 toState:(int64_t)a5;
- (void)_handleSession:(id)a3 didDeactivateWithContext:(id)a4;
- (void)_handleSession:(id)a3 didEndUpdateAudioPowerWithType:(int64_t)a4;
- (void)_handleSession:(id)a3 didNotActivateWithContext:(id)a4 error:(id)a5;
- (void)_handleSession:(id)a3 didResignActiveWithDeactivationContext:(id)a4 activityUUID:(id)a5;
- (void)_handleSession:(id)a3 didStartSoundWithID:(int64_t)a4;
- (void)_handleSession:(id)a3 didStopSoundWithID:(int64_t)a4 error:(id)a5;
- (void)_handleSession:(id)a3 willActivateWithContext:(id)a4;
- (void)_handleSession:(id)a3 willBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6;
- (void)_handleSession:(id)a3 willBeginUpdateAudioPowerWithType:(int64_t)a4 wrapper:(id)a5;
- (void)_handleSession:(id)a3 willChangeFromState:(int64_t)a4 toState:(int64_t)a5;
- (void)_handleSession:(id)a3 willDeactivateWithContext:(id)a4;
- (void)_handleSession:(id)a3 willResignActiveWithOptions:(unint64_t)a4 duration:(double)a5 activityUUID:(id)a6;
- (void)_handleSession:(id)a3 willStartSoundWithID:(int64_t)a4;
- (void)_handleSessionDidInvalidate:(id)a3;
- (void)_handleSpeechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4;
- (void)_handleSpeechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5;
- (void)_handleSpeechSynthesizerDidFinishRequest:(id)a3 utteranceInfo:(id)a4 record:(id)a5 taskTracker:(id)a6;
- (void)_handleSpeechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4;
- (void)_handleSpeechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5;
- (void)_handleSpeechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4;
- (void)_handleWillProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)_invalidateCurrentSession;
- (void)_myriadStereoPartnerDataChanged;
- (void)_preheatWithActivationSource:(int64_t)a3;
- (void)_prewarmWithContext:(id)a3 completion:(id)a4;
- (void)_processNextOperations;
- (void)activateWithContext:(id)a3 completion:(id)a4;
- (void)addActivationListener:(id)a3;
- (void)addActivityListener:(id)a3;
- (void)addAudioPowerUpdateListener:(id)a3;
- (void)attachToTether;
- (void)continuousVoiceTriggerDetectedWithCompletion:(id)a3;
- (void)deactivateWithContext:(id)a3 completion:(id)a4;
- (void)deviceLostMyriadElection;
- (void)deviceSetupManager:(id)a3 didUpdateContext:(id)a4;
- (void)deviceWonMyriadElection;
- (void)fetchCurrentActivityStateWithCompletion:(id)a3;
- (void)fetchCurrentAlarmAndTimerFiringContextWithCompletion:(id)a3;
- (void)fetchCurrentAudioPowerWithType:(int64_t)a3 completion:(id)a4;
- (void)fetchCurrentStateWithCompletion:(id)a3;
- (void)getAudioSessionProviderWithCompletion:(id)a3;
- (void)getCurrentSessionUsingBlock:(id)a3;
- (void)initiateEmergency:(id)a3;
- (void)localDeviceContextDidUpdate:(id)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)preheatWithActivationSource:(int64_t)a3;
- (void)prewarmWithContext:(id)a3 completion:(id)a4;
- (void)queue:(id)a3 didEnqueueObjects:(id)a4;
- (void)removeActivationListener:(id)a3;
- (void)removeActivityListener:(id)a3;
- (void)removeAudioPowerUpdateListener:(id)a3;
- (void)session:(id)a3 audioSessionDidBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6;
- (void)session:(id)a3 audioSessionWillBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6;
- (void)session:(id)a3 didActivateWithContext:(id)a4;
- (void)session:(id)a3 didBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6;
- (void)session:(id)a3 didChangeFromState:(int64_t)a4 toState:(int64_t)a5;
- (void)session:(id)a3 didDeactivateWithContext:(id)a4;
- (void)session:(id)a3 didEndUpdateAudioPowerWithType:(int64_t)a4;
- (void)session:(id)a3 didFailAppLaunchWithBundleIdentifier:(id)a4;
- (void)session:(id)a3 didNotActivateWithContext:(id)a4 error:(id)a5;
- (void)session:(id)a3 didResignActiveWithDeactivationContext:(id)a4 activityUUID:(id)a5;
- (void)session:(id)a3 didStartSoundWithID:(int64_t)a4;
- (void)session:(id)a3 didStopSoundWithID:(int64_t)a4 error:(id)a5;
- (void)session:(id)a3 willActivateWithContext:(id)a4;
- (void)session:(id)a3 willBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6;
- (void)session:(id)a3 willBeginUpdateAudioPowerWithType:(int64_t)a4 wrapper:(id)a5;
- (void)session:(id)a3 willChangeFromState:(int64_t)a4 toState:(int64_t)a5;
- (void)session:(id)a3 willDeactivateWithContext:(id)a4;
- (void)session:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4;
- (void)session:(id)a3 willResignActiveWithOptions:(unint64_t)a4 duration:(double)a5 activityUUID:(id)a6;
- (void)session:(id)a3 willStartSoundWithID:(int64_t)a4;
- (void)sessionDidInvalidate:(id)a3;
- (void)speechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4;
- (void)speechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5;
- (void)speechSynthesizerDidFinishRequest:(id)a3 utteranceInfo:(id)a4 record:(id)a5 taskTracker:(id)a6;
- (void)speechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4;
- (void)speechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5;
- (void)speechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4;
- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4;
- (void)stopSpeech;
- (void)stopWithModuleInstanceProvider:(id)a3;
- (void)transitionToAutomaticEndpointingWithTimestamp:(unint64_t)a3;
- (void)unduckDevice;
@end

@implementation SVXSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_coreDuetQueue, 0);
  objc_storeStrong((id *)&self->_localDeviceContext, 0);
  objc_storeStrong((id *)&self->_deviceProblemsState, 0);
  objc_storeStrong((id *)&self->_speechSynthesisRecord, 0);
  objc_storeStrong((id *)&self->_deviceSetupContext, 0);
  objc_storeStrong((id *)&self->_queuedOperations, 0);
  objc_storeStrong((id *)&self->_activityAnnouncer, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdateAnnouncer, 0);
  objc_storeStrong((id *)&self->_activationAnnouncer, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_tether, 0);
  objc_storeStrong((id *)&self->_lastStereoPartnerMyriadWin, 0);
  objc_storeStrong((id *)&self->_currentMyriadCoordinatedRequestAssertion, 0);
  objc_storeStrong((id *)&self->_myriadDeviceManager, 0);
  objc_storeStrong(&self->_myriadToken, 0);
  objc_storeStrong((id *)&self->_audioServicesUtils, 0);
  objc_storeStrong((id *)&self->_serviceCommandHandler, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_powerLevelManager, 0);
  objc_storeStrong((id *)&self->_deviceProblemsNotifyObserver, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

- (void)initiateEmergency:(id)a3
{
}

- (void)_handleMyriadForActivationContext:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v4 = (__CFString *)a3;
  v5 = (os_log_t *)MEMORY[0x263F28348];
  v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
    __int16 v46 = 2112;
    v47 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  v7 = [(__CFString *)v4 requestInfo];
  v8 = [v7 speechRequestOptions];
  v9 = [v8 scdaContext];
  switch([(__CFString *)v4 source])
  {
    case 1:
    case 2:
    case 9:
      v10 = [(SVXSessionManager *)self _currentSession:0];
      goto LABEL_5;
    case 6:
      v10 = [(SVXSessionManager *)self _currentSession:0];
      goto LABEL_12;
    case 7:
      if (([v7 isSpeechRequest] & 1) == 0) {
        goto LABEL_30;
      }
      char v32 = [v8 isVoiceTrigger];
      v10 = [(SVXSessionManager *)self _currentSession:0];
      if ((v32 & 1) == 0)
      {
LABEL_5:
        v11 = [v10 beginWaitingForMyriadDecision];
        v12 = *v5;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
          __int16 v46 = 2112;
          v47 = v9;
          _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s Myriad configured for Direct Trigger with scdaContext %@.", buf, 0x16u);
        }
        [(SVXMyriadDeviceManager *)self->_myriadDeviceManager startAdvertising:1 withSCDAGoodnessScoreContext:0 withSCDAAudioContext:v9 completion:0];
        [v10 endWaitingForMyriadDecisionWithToken:v11 result:1];

        goto LABEL_31;
      }
LABEL_12:
      v17 = [v10 beginWaitingForMyriadDecision];
      id myriadToken = self->_myriadToken;
      self->_id myriadToken = v17;

      v19 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        v20 = (__CFString *)self->_myriadToken;
        *(_DWORD *)buf = 136315394;
        v45 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
        __int16 v46 = 2112;
        v47 = v20;
        _os_log_impl(&dword_220062000, v19, OS_LOG_TYPE_INFO, "%s Begin waiting for Myriad token %@.", buf, 0x16u);
      }
      v42 = [(AFDeviceContext *)self->_localDeviceContext playbackStateSnapshot];
      uint64_t v21 = [v42 playbackState];
      v41 = [MEMORY[0x263F08AB0] processInfo];
      [v41 systemUptime];
      double v23 = v22;
      v40 = [(AFDeviceContext *)self->_localDeviceContext playbackStateMetadata];
      v39 = [v40 deliveryDate];
      [v39 timeIntervalSinceNow];
      double v25 = v24;
      v26 = [(AFDeviceContext *)self->_localDeviceContext alarmSnapshot];
      v27 = [(AFDeviceContext *)self->_localDeviceContext timerSnapshot];
      id v28 = v26;
      id v43 = v27;
      v29 = (__CFString *)objc_alloc_init(MEMORY[0x263F6CF78]);
      id v30 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      v31 = v30;
      if (v21 == 4)
      {
        [v30 addObject:&unk_26D1FCC60];
        [(__CFString *)v29 setMediaPlaybackInterruptedTime:v23 + v25];
      }
      else if (v21 == 1)
      {
        [v30 addObject:&unk_26D1FCC48];
      }
      v33 = [v28 notifiedFiringAlarmIDs];
      if ([v33 count])
      {
      }
      else
      {
        [v43 notifiedFiringTimerIDs];
        v34 = v38 = v29;
        uint64_t v37 = [v34 count];

        v29 = v38;
        if (!v37) {
          goto LABEL_25;
        }
      }
      [v31 addObject:&unk_26D1FCC78];
LABEL_25:
      [(__CFString *)v29 setReasons:v31];

      v35 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v45 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
        __int16 v46 = 2112;
        v47 = v29;
        __int16 v48 = 2112;
        v49 = v9;
        _os_log_impl(&dword_220062000, v35, OS_LOG_TYPE_INFO, "%s Myriad configured for Voice Trigger with scdaGoodnessScoreContext: %@ and scdaContext: %@.", buf, 0x20u);
      }
      [(SVXMyriadDeviceManager *)self->_myriadDeviceManager startAdvertising:0 withSCDAGoodnessScoreContext:v29 withSCDAAudioContext:v9 completion:0];

LABEL_31:
      return;
    default:
      os_log_t v13 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        unint64_t v15 = [(__CFString *)v4 source];
        if (v15 > 9) {
          v16 = @"(unknown)";
        }
        else {
          v16 = off_264553510[v15];
        }
        v36 = v16;
        *(_DWORD *)buf = 136315394;
        v45 = "-[SVXSessionManager _handleMyriadForActivationContext:]";
        __int16 v46 = 2112;
        v47 = v36;
        _os_log_error_impl(&dword_220062000, v14, OS_LOG_TYPE_ERROR, "%s Ignored because Myriad behavior undefined for Unspecified Activation Source: %@", buf, 0x16u);
      }
LABEL_30:
      v10 = [(SVXSessionManager *)self _currentSession:0];
      goto LABEL_31;
  }
}

- (void)_handleLocalDeviceContextChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = [v4 identifier];
    int v11 = 136315394;
    v12 = "-[SVXSessionManager _handleLocalDeviceContextChanged:]";
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", (uint8_t *)&v11, 0x16u);
  }
  v8 = (AFDeviceContext *)[v4 copy];
  localDeviceContext = self->_localDeviceContext;
  self->_localDeviceContext = v8;

  v10 = [(SVXSessionManager *)self _currentSession:0];
  [v10 updateLocalDeviceContext:v4];
}

- (void)_handleDeviceSetupContextChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    __int16 v13 = "-[SVXSessionManager _handleDeviceSetupContextChanged:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s deviceSetupContext = %@", (uint8_t *)&v12, 0x16u);
  }
  v6 = (SVXDeviceSetupContext *)[v4 copy];
  deviceSetupContext = self->_deviceSetupContext;
  self->_deviceSetupContext = v6;

  self->_needsClearContext = 1;
  v8 = [v4 beginDate];
  v9 = [v4 endDate];
  uint64_t IsActive = AFDeviceSetupIsActive();

  [(SVXMyriadDeviceManager *)self->_myriadDeviceManager setupEnabled:IsActive];
  int v11 = [(SVXSessionManager *)self _currentSession:0];
  [v11 updateDeviceSetupContext:v4];
}

- (void)_handleDeviceProblemsStateChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "-[SVXSessionManager _handleDeviceProblemsStateChanged:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s deviceProblemsState = %@", (uint8_t *)&v9, 0x16u);
  }
  v6 = (SVXDeviceProblemsState *)[v4 copy];
  deviceProblemsState = self->_deviceProblemsState;
  self->_deviceProblemsState = v6;

  v8 = [(SVXSessionManager *)self _currentSession:0];
  [v8 updateDeviceProblemsState:v4];
}

- (void)_handleSpeechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = @"idle";
    int v9 = 136315394;
    v10 = "-[SVXSessionManager _handleSpeechSynthesizerDidFailRequest:taskTracker:error:]";
    __int16 v11 = 2112;
    id v12 = @"idle";
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v9, 0x16u);
  }
  self->_speechSynthesisState = 1;
}

- (void)_handleSpeechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = @"idle";
    int v8 = 136315394;
    int v9 = "-[SVXSessionManager _handleSpeechSynthesizerDidInterruptRequest:taskTracker:]";
    __int16 v10 = 2112;
    __int16 v11 = @"idle";
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v8, 0x16u);
  }
  self->_speechSynthesisState = 1;
}

- (void)_handleSpeechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = @"idle";
    int v8 = 136315394;
    int v9 = "-[SVXSessionManager _handleSpeechSynthesizerDidCancelRequest:taskTracker:]";
    __int16 v10 = 2112;
    __int16 v11 = @"idle";
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v8, 0x16u);
  }
  self->_speechSynthesisState = 1;
}

- (void)_handleSpeechSynthesizerDidFinishRequest:(id)a3 utteranceInfo:(id)a4 record:(id)a5 taskTracker:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (__CFString *)a5;
  id v13 = a6;
  __int16 v14 = (NSObject **)MEMORY[0x263F28348];
  id v15 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = v15;
    v17 = @"idle";
    int v20 = 136315394;
    uint64_t v21 = "-[SVXSessionManager _handleSpeechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:]";
    __int16 v22 = 2112;
    double v23 = @"idle";
    _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v20, 0x16u);

    id v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "-[SVXSessionManager _handleSpeechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:]";
    __int16 v22 = 2112;
    double v23 = v12;
    _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s speechSynthesisRecord = %@", (uint8_t *)&v20, 0x16u);
  }
  self->_speechSynthesisState = 1;
  v18 = (AFSpeechSynthesisRecord *)[(__CFString *)v12 copy];
  speechSynthesisRecord = self->_speechSynthesisRecord;
  self->_speechSynthesisRecord = v18;
}

- (void)_handleSpeechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = (NSObject **)MEMORY[0x263F28348];
  uint64_t v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    __int16 v14 = @"speaking";
    int v17 = 136315394;
    v18 = "-[SVXSessionManager _handleSpeechSynthesizerDidStartRequest:record:taskTracker:]";
    __int16 v19 = 2112;
    int v20 = @"speaking";
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v17, 0x16u);

    uint64_t v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315394;
    v18 = "-[SVXSessionManager _handleSpeechSynthesizerDidStartRequest:record:taskTracker:]";
    __int16 v19 = 2112;
    int v20 = v9;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s speechSynthesisRecord = %@", (uint8_t *)&v17, 0x16u);
  }
  self->_speechSynthesisState = 2;
  id v15 = (AFSpeechSynthesisRecord *)[(__CFString *)v9 copy];
  speechSynthesisRecord = self->_speechSynthesisRecord;
  self->_speechSynthesisRecord = v15;
}

- (void)_handleSpeechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(a4, "context", a3);
  v6 = [v5 dialogIdentifier];

  if (v6) {
    [(SVXSessionActivityAnnouncer *)self->_activityAnnouncer sessionWillPresentFeedbackWithDialogIdentifier:v6];
  }
  v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    int v9 = @"speaking";
    int v10 = 136315394;
    id v11 = "-[SVXSessionManager _handleSpeechSynthesizerWillStartRequest:taskTracker:]";
    __int16 v12 = 2112;
    id v13 = @"speaking";
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s speechSynthesisState = %@", (uint8_t *)&v10, 0x16u);
  }
  self->_speechSynthesisState = 2;
}

- (void)_handleDidFailAppLaunchWithBundleIdentifier:(id)a3
{
}

- (void)_handleWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
}

- (void)_handleSessionDidInvalidate:(id)a3
{
  id v4 = (SVXSession *)a3;
  v5 = v4;
  if (self->_currentSession == v4)
  {
    self->_currentSession = 0;
  }
  v6 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSessionManager__handleSessionDidInvalidate___block_invoke;
  v7[3] = &unk_2645548A0;
  v7[4] = self;
  [v6 performBlock:v7 withOptions:0];
}

uint64_t __49__SVXSessionManager__handleSessionDidInvalidate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextOperations];
}

- (void)_fetchStereoPairStateWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SVXSessionManager _fetchStereoPairStateWithCompletion:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  if (v4)
  {
    v6 = [(SVXModule *)self->_module performer];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__9060;
    uint64_t v16 = __Block_byref_object_dispose__9061;
    id v17 = objc_alloc_init(MEMORY[0x263F285E0]);
    v7 = *(void **)(*((void *)&buf + 1) + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__SVXSessionManager__fetchStereoPairStateWithCompletion___block_invoke;
    v9[3] = &unk_264553438;
    id v8 = v6;
    id v10 = v8;
    id v11 = v4;
    p_long long buf = &buf;
    [v7 getStereoPairState:v9];

    _Block_object_dispose(&buf, 8);
  }
}

void __57__SVXSessionManager__fetchStereoPairStateWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v14 = "-[SVXSessionManager _fetchStereoPairStateWithCompletion:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__SVXSessionManager__fetchStereoPairStateWithCompletion___block_invoke_53;
  v10[3] = &unk_264553410;
  v7 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  char v12 = a2;
  [v7 performBlock:v10];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

uint64_t __57__SVXSessionManager__fetchStereoPairStateWithCompletion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_handleFetchedStereoPartnerLastMyriadWinDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (NSDate *)a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SVXSessionManager _handleFetchedStereoPartnerLastMyriadWinDate:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s lastWin = %@", (uint8_t *)&v7, 0x16u);
  }
  lastStereoPartnerMyriadWin = self->_lastStereoPartnerMyriadWin;
  self->_lastStereoPartnerMyriadWin = v4;
}

- (void)_fetchStereoPartnerLastMyriadWinDate
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SVXSessionManager _fetchStereoPartnerLastMyriadWinDate]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  id v4 = [(SVXModule *)self->_module performer];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__9060;
  __int16 v15 = __Block_byref_object_dispose__9061;
  id v16 = objc_alloc_init(MEMORY[0x263F285E0]);
  objc_initWeak(&location, self);
  id v5 = *(void **)(*((void *)&buf + 1) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__SVXSessionManager__fetchStereoPartnerLastMyriadWinDate__block_invoke;
  v7[3] = &unk_2645533E8;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v10, &location);
  p_long long buf = &buf;
  [v5 getStereoPartnerLastMyriadWinDate:v7];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __57__SVXSessionManager__fetchStereoPartnerLastMyriadWinDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v15 = "-[SVXSessionManager _fetchStereoPartnerLastMyriadWinDate]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__SVXSessionManager__fetchStereoPartnerLastMyriadWinDate__block_invoke_51;
    v11[3] = &unk_264554990;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    id v12 = v5;
    [v8 performBlock:v11];

    objc_destroyWeak(&v13);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void __57__SVXSessionManager__fetchStereoPartnerLastMyriadWinDate__block_invoke_51(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleFetchedStereoPartnerLastMyriadWinDate:*(void *)(a1 + 32)];
}

- (void)_handleSession:(id)a3 audioSessionDidBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6
{
}

- (void)_handleSession:(id)a3 audioSessionWillBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6
{
}

- (void)_handleSession:(id)a3 didDeactivateWithContext:(id)a4
{
  activationAnnouncer = self->_activationAnnouncer;
  id v6 = a4;
  [(SVXSessionActivationAnnouncer *)activationAnnouncer sessionManager:self didDeactivateWithContext:v6];
  [(SVXSessionActivityAnnouncer *)self->_activityAnnouncer sessionDidDeactivateWithContext:v6];

  int v7 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__SVXSessionManager__handleSession_didDeactivateWithContext___block_invoke;
  v8[3] = &unk_2645548A0;
  v8[4] = self;
  [v7 performBlock:v8 withOptions:0];
}

uint64_t __61__SVXSessionManager__handleSession_didDeactivateWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextOperations];
}

- (void)_handleSession:(id)a3 willDeactivateWithContext:(id)a4
{
}

- (void)_handleSession:(id)a3 didNotActivateWithContext:(id)a4 error:(id)a5
{
  myriadDeviceManager = self->_myriadDeviceManager;
  id v8 = a5;
  id v9 = a4;
  [(SVXMyriadDeviceManager *)myriadDeviceManager resetMyriad];
  [(SVXSessionActivationAnnouncer *)self->_activationAnnouncer sessionManager:self didNotActivateWithContext:v9 error:v8];

  id v10 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__SVXSessionManager__handleSession_didNotActivateWithContext_error___block_invoke;
  v11[3] = &unk_2645548A0;
  void v11[4] = self;
  [v10 performBlock:v11 withOptions:0];
}

uint64_t __68__SVXSessionManager__handleSession_didNotActivateWithContext_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextOperations];
}

- (void)_handleSession:(id)a3 didActivateWithContext:(id)a4
{
  [(SVXSessionActivationAnnouncer *)self->_activationAnnouncer sessionManager:self didActivateWithContext:a4];
  id v5 = [(SVXModule *)self->_module performer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__SVXSessionManager__handleSession_didActivateWithContext___block_invoke;
  v6[3] = &unk_2645548A0;
  v6[4] = self;
  [v5 performBlock:v6 withOptions:0];
}

uint64_t __59__SVXSessionManager__handleSession_didActivateWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextOperations];
}

- (void)_handleSession:(id)a3 willActivateWithContext:(id)a4
{
  id v5 = a4;
  [(SVXSessionManager *)self _handleMyriadForActivationContext:v5];
  [(SVXSessionActivationAnnouncer *)self->_activationAnnouncer sessionManager:self willActivateWithContext:v5];
}

- (void)_handleSession:(id)a3 didResignActiveWithDeactivationContext:(id)a4 activityUUID:(id)a5
{
  v28[2] = *MEMORY[0x263EF8340];
  v27[0] = @"sessionUUID";
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 sessionUUID];
  uint64_t v11 = [v10 UUIDString];
  id v12 = (void *)v11;
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = @"unknown";
  }
  v27[1] = @"activityUUID";
  v28[0] = v13;
  uint64_t v14 = [v8 UUIDString];

  if (v14) {
    __int16 v15 = v14;
  }
  else {
    __int16 v15 = @"unknown";
  }
  v28[1] = v15;
  __int16 v16 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  id v17 = [(SVXModule *)self->_module analytics];
  [v17 logEventWithType:1409 context:v16];

  uint64_t v18 = [(SVXModule *)self->_module instanceContext];
  int v19 = [v18 isDefault];

  if (v19)
  {
    AFRecordCoreDuetEvent();
    int v20 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v26 = "-[SVXSessionManager _handleSession:didResignActiveWithDeactivationContext:activityUUID:]";
      _os_log_impl(&dword_220062000, v20, OS_LOG_TYPE_INFO, "%s Donating Siri UI end event to Biome Library", buf, 0xCu);
    }
    _recordStartEndBiomeEvent(self->_biomeQueue, @"com.apple.siri.ui.end", v16);
  }
  uint64_t v21 = [MEMORY[0x263F08AB0] processInfo];
  [v21 systemUptime];
  self->_lastSessionResignActiveTimestamp = v22;

  [(SVXMyriadDeviceManager *)self->_myriadDeviceManager resetMyriad];
  [(SVXSessionActivityAnnouncer *)self->_activityAnnouncer sessionDidResignActiveWithDeactivationContext:v9];

  double v23 = [(SVXModule *)self->_module performer];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__SVXSessionManager__handleSession_didResignActiveWithDeactivationContext_activityUUID___block_invoke;
  v24[3] = &unk_2645548A0;
  v24[4] = self;
  [v23 performBlock:v24 withOptions:0];
}

uint64_t __88__SVXSessionManager__handleSession_didResignActiveWithDeactivationContext_activityUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextOperations];
}

- (void)_handleSession:(id)a3 willResignActiveWithOptions:(unint64_t)a4 duration:(double)a5 activityUUID:(id)a6
{
  v20[2] = *MEMORY[0x263EF8340];
  v19[0] = @"sessionUUID";
  id v10 = a6;
  uint64_t v11 = [a3 sessionUUID];
  uint64_t v12 = [v11 UUIDString];
  id v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = @"unknown";
  }
  v19[1] = @"activityUUID";
  v20[0] = v14;
  __int16 v15 = [v10 UUIDString];

  if (v15) {
    __int16 v16 = v15;
  }
  else {
    __int16 v16 = @"unknown";
  }
  v20[1] = v16;
  id v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  uint64_t v18 = [(SVXModule *)self->_module analytics];
  [v18 logEventWithType:1408 context:v17];

  [(SVXSessionActivityAnnouncer *)self->_activityAnnouncer sessionWillResignActiveWithOptions:a4 duration:a5];
}

- (void)_handleSession:(id)a3 didBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6
{
  v30[2] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  v29[0] = @"sessionUUID";
  id v12 = a5;
  id v13 = [a3 sessionUUID];
  uint64_t v14 = [v13 UUIDString];
  __int16 v15 = (void *)v14;
  if (v14) {
    __int16 v16 = (__CFString *)v14;
  }
  else {
    __int16 v16 = @"unknown";
  }
  v29[1] = @"activityUUID";
  v30[0] = v16;
  id v17 = [v12 UUIDString];

  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = @"unknown";
  }
  v30[1] = v18;
  int v19 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

  if (!v11)
  {
    int v20 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v28 = "-[SVXSessionManager _handleSession:didBecomeActiveWithActivationContext:activityUUID:turnID:]";
      _os_log_fault_impl(&dword_220062000, v20, OS_LOG_TYPE_FAULT, "%s turnID is nil", buf, 0xCu);
    }
  }
  uint64_t v21 = [(SVXModule *)self->_module analytics];
  [v21 logEventWithType:1407 context:v19];

  double v22 = [(SVXModule *)self->_module instanceContext];
  int v23 = [v22 isDefault];

  if (v23)
  {
    AFRecordCoreDuetEvent();
    uint64_t v24 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v28 = "-[SVXSessionManager _handleSession:didBecomeActiveWithActivationContext:activityUUID:turnID:]";
      _os_log_impl(&dword_220062000, v24, OS_LOG_TYPE_INFO, "%s Donating Siri UI begin event to Biome Library", buf, 0xCu);
    }
    _recordStartEndBiomeEvent(self->_biomeQueue, @"com.apple.siri.ui.begin", v19);
  }
  [(SVXSessionActivityAnnouncer *)self->_activityAnnouncer sessionDidBecomeActiveWithActivationContext:v10 turnID:v11];
  double v25 = [(SVXModule *)self->_module performer];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __93__SVXSessionManager__handleSession_didBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke;
  v26[3] = &unk_2645548A0;
  v26[4] = self;
  [v25 performBlock:v26 withOptions:0];
}

uint64_t __93__SVXSessionManager__handleSession_didBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextOperations];
}

- (void)_handleSession:(id)a3 willBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6
{
  v25[2] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  v24[0] = @"sessionUUID";
  id v12 = a5;
  id v13 = [a3 sessionUUID];
  uint64_t v14 = [v13 UUIDString];
  __int16 v15 = (void *)v14;
  if (v14) {
    __int16 v16 = (__CFString *)v14;
  }
  else {
    __int16 v16 = @"unknown";
  }
  v24[1] = @"activityUUID";
  v25[0] = v16;
  id v17 = [v12 UUIDString];

  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = @"unknown";
  }
  v25[1] = v18;
  int v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  int v20 = [(SVXModule *)self->_module analytics];
  [v20 logEventWithType:1406 context:v19];

  if (!v11)
  {
    uint64_t v21 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_FAULT))
    {
      int v22 = 136315138;
      int v23 = "-[SVXSessionManager _handleSession:willBecomeActiveWithActivationContext:activityUUID:turnID:]";
      _os_log_fault_impl(&dword_220062000, v21, OS_LOG_TYPE_FAULT, "%s turnID is nil", (uint8_t *)&v22, 0xCu);
    }
  }
  [(SVXSessionActivityAnnouncer *)self->_activityAnnouncer sessionWillBecomeActiveWithActivationContext:v10 turnID:v11];
}

- (void)_handleSession:(id)a3 didStopSoundWithID:(int64_t)a4 error:(id)a5
{
}

- (void)_handleSession:(id)a3 didStartSoundWithID:(int64_t)a4
{
}

- (void)_handleSession:(id)a3 willStartSoundWithID:(int64_t)a4
{
}

- (void)_handleSession:(id)a3 didEndUpdateAudioPowerWithType:(int64_t)a4
{
}

- (void)_handleSession:(id)a3 willBeginUpdateAudioPowerWithType:(int64_t)a4 wrapper:(id)a5
{
}

- (void)_handleSession:(id)a3 didChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
}

- (void)_handleSession:(id)a3 willChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
}

- (void)_fetchCurrentAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    id v9 = v6;
    int v7 = [(SVXSessionManager *)self _currentSession:0];
    id v8 = v7;
    if (v7) {
      [v7 getAudioPowerWithType:a3 completion:v9];
    }
    else {
      v9[2](v9, 0);
    }

    id v6 = v9;
  }
}

- (void)_fetchCurrentActivityStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    int v7 = v4;
    id v5 = [(SVXSessionManager *)self _currentSession:0];
    id v6 = v5;
    if (v5) {
      [v5 getActivityStateWithCompletion:v7];
    }
    else {
      v7[2](v7, 1);
    }

    id v4 = v7;
  }
}

- (void)_fetchCurrentStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    int v7 = v4;
    id v5 = [(SVXSessionManager *)self _currentSession:0];
    id v6 = v5;
    if (v5) {
      [v5 getStateWithCompletion:v7];
    }
    else {
      v7[2](v7, 1);
    }

    id v4 = v7;
  }
}

- (void)_deactivateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[SVXSessionManager _deactivateWithContext:completion:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [(SVXSessionManager *)self _currentSession:0];
  id v10 = v9;
  if (v9)
  {
    [v9 deactivateWithContext:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (void)_activateWithContext:(id)a3 activityState:(int64_t)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v18 = "-[SVXSessionManager _activateWithContext:activityState:completion:]";
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s context = %@, activityState = %ld", buf, 0x20u);
  }
  if (a4 == 1
    && (([MEMORY[0x263F08AB0] processInfo],
         int v11 = objc_claimAutoreleasedReturnValue(),
         [v11 systemUptime],
         double v13 = v12 - self->_lastSessionResignActiveTimestamp,
         v11,
         v13 > 60.0)
     || self->_needsClearContext))
  {
    self->_needsClearContext = 0;
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = [(SVXSessionManager *)self _currentSession:1];
  id v16 = (id)[v15 activateWithContext:v8 options:v14 deviceSetupContext:self->_deviceSetupContext deviceProblemsState:self->_deviceProblemsState localDeviceContext:self->_localDeviceContext speechSynthesisRecord:self->_speechSynthesisRecord speechSynthesisState:self->_speechSynthesisState speechRecordingAlertPolicy:0 completion:v9];
}

- (void)_prewarmWithContext:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    int v11 = "-[SVXSessionManager _prewarmWithContext:completion:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v10, 0x16u);
  }
  [(SVXMyriadDeviceManager *)self->_myriadDeviceManager preheatMyriad];
  id v9 = [(SVXSessionManager *)self _currentSession:1];
  [v9 prewarmWithContext:v6 completion:v7];
}

- (void)_preheatWithActivationSource:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    if ((unint64_t)a3 > 9) {
      id v8 = @"(unknown)";
    }
    else {
      id v8 = off_264553510[a3];
    }
    id v9 = v8;
    int v17 = 136315394;
    uint64_t v18 = "-[SVXSessionManager _preheatWithActivationSource:]";
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s activationSource = %@", (uint8_t *)&v17, 0x16u);
  }
  if (a3 == 6)
  {
    int v10 = [(SVXSessionManager *)self _currentSession:1];
    int v11 = v10;
    uint64_t v12 = 2;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    int v10 = [(SVXSessionManager *)self _currentSession:1];
    int v11 = v10;
    uint64_t v12 = 0;
LABEL_10:
    [v10 preheatWithStyle:v12];

    return;
  }
  os_log_t v13 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = v13;
    if ((unint64_t)a3 > 9) {
      uint64_t v15 = @"(unknown)";
    }
    else {
      uint64_t v15 = off_264553510[a3];
    }
    id v16 = v15;
    int v17 = 136315394;
    uint64_t v18 = "-[SVXSessionManager _preheatWithActivationSource:]";
    __int16 v19 = 2112;
    id v20 = v16;
    _os_log_error_impl(&dword_220062000, v14, OS_LOG_TYPE_ERROR, "%s Ignored because activation source %@ does not support preheat.", (uint8_t *)&v17, 0x16u);
  }
}

- (void)_processNextOperations
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (NSObject **)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v15 = "-[SVXSessionManager _processNextOperations]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__SVXSessionManager__processNextOperations__block_invoke;
  v13[3] = &unk_264553568;
  v13[4] = self;
  id v5 = (void (**)(void, void))MEMORY[0x223C65C40](v13);
  id v6 = [(SVXSessionManager *)self _currentSession:0];
  id v7 = *v3;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v15 = "-[SVXSessionManager _processNextOperations]";
    __int16 v16 = 2112;
    int v17 = v6;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s currentSession = %@", buf, 0x16u);
  }
  if (v6)
  {
    id v8 = [(SVXModule *)self->_module performer];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__SVXSessionManager__processNextOperations__block_invoke_37;
    v10[3] = &unk_2645533C0;
    id v11 = v8;
    uint64_t v12 = v5;
    id v9 = v8;
    [v6 getActivityStateWithCompletion:v10];
  }
  else
  {
    v5[2](v5, 1);
  }
}

void __43__SVXSessionManager__processNextOperations__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 136) dequeueObject];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v11 = "-[SVXSessionManager _processNextOperations]_block_invoke";
    __int16 v12 = 2112;
    os_log_t v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s dequeuedOperation = %@", buf, 0x16u);
  }
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__SVXSessionManager__processNextOperations__block_invoke_34;
    v7[3] = &unk_264553348;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__SVXSessionManager__processNextOperations__block_invoke_2;
    v6[3] = &unk_264553370;
    v6[4] = v8;
    [v4 handleOperationUsingActivationBlock:v7 deactivationBlock:v6];
  }
}

void __43__SVXSessionManager__processNextOperations__block_invoke_37(uint64_t a1, unint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    if (a2 > 4) {
      id v6 = @"(unknown)";
    }
    else {
      id v6 = off_264552F68[a2];
    }
    id v7 = v6;
    *(_DWORD *)long long buf = 136315394;
    os_log_t v13 = "-[SVXSessionManager _processNextOperations]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s activityState = %@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__SVXSessionManager__processNextOperations__block_invoke_38;
  v9[3] = &unk_264553398;
  unint64_t v11 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  [v8 performBlock:v9];
}

uint64_t __43__SVXSessionManager__processNextOperations__block_invoke_38(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1 == 4 || v1 == 1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __43__SVXSessionManager__processNextOperations__block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _activateWithContext:a2 activityState:*(void *)(a1 + 40) completion:a3];
}

uint64_t __43__SVXSessionManager__processNextOperations__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _deactivateWithContext:a2 completion:a3];
}

- (void)_attachToTether
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (AFDeviceSupportsSiriMUX())
  {
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      id v5 = "-[SVXSessionManager _attachToTether]";
      _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s Setting _needsClearContext to YES for MUX", (uint8_t *)&v4, 0xCu);
    }
    self->_needsClearContext = 1;
  }
  [(AFSiriTether *)self->_tether attach:0];
}

- (void)_invalidateCurrentSession
{
  currentSession = self->_currentSession;
  if (currentSession)
  {
    [(SVXSession *)currentSession invalidate];
    int v4 = self->_currentSession;
    self->_currentSession = 0;
  }
}

- (id)_currentSession:(BOOL)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  currentSession = self->_currentSession;
  if (currentSession) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v34 = "-[SVXSessionManager _currentSession:]";
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Creating new session...", buf, 0xCu);
    }
    id v7 = [SVXSession alloc];
    uint64_t v8 = [(SVXModule *)self->_module performer];
    speechSynthesizer = self->_speechSynthesizer;
    serviceCommandHandler = self->_serviceCommandHandler;
    powerLevelManager = self->_powerLevelManager;
    __int16 v12 = [(SVXModule *)self->_module instanceContext];
    os_log_t v13 = [(SVXModule *)self->_module preferences];
    __int16 v14 = [(SVXModule *)self->_module analytics];
    uint64_t v15 = [(SVXSession *)v7 initWithPerformer:v8 serviceCommandHandler:serviceCommandHandler powerLevelManager:powerLevelManager speechSynthesizer:speechSynthesizer instanceContext:v12 preferences:v13 analytics:v14 delegate:self];
    uint64_t v16 = self->_currentSession;
    self->_currentSession = v15;

    int v17 = (os_log_t *)MEMORY[0x263F28348];
    uint64_t v18 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      __int16 v19 = self->_currentSession;
      module = self->_module;
      uint64_t v21 = v18;
      int64_t v22 = [(SVXModule *)module performer];
      uint64_t v24 = self->_speechSynthesizer;
      uint64_t v23 = self->_serviceCommandHandler;
      *(_DWORD *)long long buf = 136316162;
      v34 = "-[SVXSessionManager _currentSession:]";
      __int16 v35 = 2112;
      v36 = v19;
      __int16 v37 = 2112;
      v38 = v22;
      __int16 v39 = 2112;
      v40 = v23;
      __int16 v41 = 2112;
      v42 = v24;
      _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_INFO, "%s New session %@ created with (%@, %@, %@), configuring...", buf, 0x34u);
    }
    [(SVXSession *)self->_currentSession updateDeviceProblemsState:self->_deviceProblemsState];
    [(SVXSession *)self->_currentSession updateDeviceSetupContext:self->_deviceSetupContext];
    [(SVXSession *)self->_currentSession updateLocalDeviceContext:self->_localDeviceContext];
    os_log_t v25 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
    {
      v26 = self->_currentSession;
      deviceSetupContext = self->_deviceSetupContext;
      deviceProblemsState = self->_deviceProblemsState;
      localDeviceContext = self->_localDeviceContext;
      id v30 = v25;
      v31 = [(AFDeviceContext *)localDeviceContext identifier];
      *(_DWORD *)long long buf = 136316162;
      v34 = "-[SVXSessionManager _currentSession:]";
      __int16 v35 = 2112;
      v36 = v26;
      __int16 v37 = 2112;
      v38 = deviceProblemsState;
      __int16 v39 = 2112;
      v40 = deviceSetupContext;
      __int16 v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_220062000, v30, OS_LOG_TYPE_INFO, "%s New session %@ configured with (%@, %@, %@) and is ready to go.", buf, 0x34u);
    }
    currentSession = self->_currentSession;
  }

  return currentSession;
}

- (void)attachToTether
{
  v3 = [(SVXModule *)self->_module performer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__SVXSessionManager_attachToTether__block_invoke;
  v4[3] = &unk_2645548A0;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __35__SVXSessionManager_attachToTether__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attachToTether];
}

- (void)queue:(id)a3 didEnqueueObjects:(id)a4
{
  if (self->_queuedOperations == a3)
  {
    BOOL v5 = [(SVXModule *)self->_module performer];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__SVXSessionManager_queue_didEnqueueObjects___block_invoke;
    v7[3] = &unk_2645548C8;
    void v7[4] = self;
    id v8 = v5;
    id v6 = v5;
    [v6 performBlock:v7];
  }
}

uint64_t __45__SVXSessionManager_queue_didEnqueueObjects___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) count];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    id v8 = "-[SVXSessionManager queue:didEnqueueObjects:]_block_invoke";
    __int16 v9 = 2048;
    unint64_t v10 = v2;
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s numberOfQueuedOperations = %lu", buf, 0x16u);
  }
  if (v2 < 2) {
    return [*(id *)(a1 + 32) _processNextOperations];
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SVXSessionManager_queue_didEnqueueObjects___block_invoke_32;
  v6[3] = &unk_2645548A0;
  int v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  return [v4 performBlock:v6 withOptions:0];
}

uint64_t __45__SVXSessionManager_queue_didEnqueueObjects___block_invoke_32(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextOperations];
}

- (void)localDeviceContextDidUpdate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSessionManager_localDeviceContextDidUpdate___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __49__SVXSessionManager_localDeviceContextDidUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLocalDeviceContextChanged:*(void *)(a1 + 40)];
}

- (void)deviceSetupManager:(id)a3 didUpdateContext:(id)a4
{
  id v5 = a4;
  id v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__SVXSessionManager_deviceSetupManager_didUpdateContext___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlock:v8];
}

uint64_t __57__SVXSessionManager_deviceSetupManager_didUpdateContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDeviceSetupContextChanged:*(void *)(a1 + 40)];
}

- (void)speechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SVXModule *)self->_module performer];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__SVXSessionManager_speechSynthesizerDidFailRequest_taskTracker_error___block_invoke;
  v15[3] = &unk_264554210;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBlock:v15];
}

uint64_t __71__SVXSessionManager_speechSynthesizerDidFailRequest_taskTracker_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidFailRequest:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)speechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__SVXSessionManager_speechSynthesizerDidInterruptRequest_taskTracker___block_invoke;
  v11[3] = &unk_2645547B0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

uint64_t __70__SVXSessionManager_speechSynthesizerDidInterruptRequest_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidInterruptRequest:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48)];
}

- (void)speechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__SVXSessionManager_speechSynthesizerDidCancelRequest_taskTracker___block_invoke;
  v11[3] = &unk_2645547B0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

uint64_t __67__SVXSessionManager_speechSynthesizerDidCancelRequest_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidCancelRequest:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48)];
}

- (void)speechSynthesizerDidFinishRequest:(id)a3 utteranceInfo:(id)a4 record:(id)a5 taskTracker:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SVXModule *)self->_module performer];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __88__SVXSessionManager_speechSynthesizerDidFinishRequest_utteranceInfo_record_taskTracker___block_invoke;
  v19[3] = &unk_264554450;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 performBlock:v19];
}

uint64_t __88__SVXSessionManager_speechSynthesizerDidFinishRequest_utteranceInfo_record_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidFinishRequest:*(void *)(a1 + 40) utteranceInfo:*(void *)(a1 + 48) record:*(void *)(a1 + 56) taskTracker:*(void *)(a1 + 64)];
}

- (void)speechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SVXModule *)self->_module performer];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__SVXSessionManager_speechSynthesizerDidStartRequest_record_taskTracker___block_invoke;
  v15[3] = &unk_264554210;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBlock:v15];
}

uint64_t __73__SVXSessionManager_speechSynthesizerDidStartRequest_record_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerDidStartRequest:*(void *)(a1 + 40) record:*(void *)(a1 + 48) taskTracker:*(void *)(a1 + 56)];
}

- (void)speechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__SVXSessionManager_speechSynthesizerWillStartRequest_taskTracker___block_invoke;
  v11[3] = &unk_2645547B0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

uint64_t __67__SVXSessionManager_speechSynthesizerWillStartRequest_taskTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpeechSynthesizerWillStartRequest:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48)];
}

- (void)deactivateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v24 = "-[SVXSessionManager deactivateWithContext:completion:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  id v9 = objc_alloc(MEMORY[0x263F285B8]);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __54__SVXSessionManager_deactivateWithContext_completion___block_invoke;
  v21[3] = &unk_264554480;
  id v22 = v7;
  id v10 = v7;
  id v11 = (void *)[v9 initWithBlock:v21];
  id v12 = [SVXSessionOperation alloc];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __54__SVXSessionManager_deactivateWithContext_completion___block_invoke_2;
  v19[3] = &unk_2645548A0;
  id v20 = v11;
  id v13 = v11;
  id v14 = [(SVXSessionOperation *)v12 initWithDeactivationContext:v6 completion:v19];
  id v15 = [(SVXModule *)self->_module performer];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__SVXSessionManager_deactivateWithContext_completion___block_invoke_3;
  v17[3] = &unk_2645548C8;
  v17[4] = self;
  id v18 = v14;
  id v16 = v14;
  [v15 performBlock:v17];
}

uint64_t __54__SVXSessionManager_deactivateWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __54__SVXSessionManager_deactivateWithContext_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

uint64_t __54__SVXSessionManager_deactivateWithContext_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) enqueueObject:*(void *)(a1 + 40)];
}

- (void)transitionToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
}

- (void)stopSpeech
{
}

- (void)activateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  audioServicesUtils = self->_audioServicesUtils;
  id v8 = a3;
  [(SVXAudioServicesUtils *)audioServicesUtils audioServicesActivateWithTimeout];
  id v9 = objc_alloc(MEMORY[0x263F28580]);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __52__SVXSessionManager_activateWithContext_completion___block_invoke;
  v23[3] = &unk_264553998;
  id v24 = v6;
  id v10 = (void *)MEMORY[0x263F087E8];
  id v11 = v6;
  id v12 = [v10 errorWithDomain:@"SiriVOXErrorDomain" code:5 userInfo:0];
  id v13 = (void *)[v9 initWithBlock:v23 defaultValue:v12];

  id v14 = [SVXSessionOperation alloc];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__SVXSessionManager_activateWithContext_completion___block_invoke_30;
  v21[3] = &unk_2645539C0;
  id v22 = v13;
  id v15 = v13;
  id v16 = [(SVXSessionOperation *)v14 initWithActivationContext:v8 completion:v21];

  id v17 = [(SVXModule *)self->_module performer];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __52__SVXSessionManager_activateWithContext_completion___block_invoke_2;
  v19[3] = &unk_2645548C8;
  void v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 performBlock:v19];
}

void __52__SVXSessionManager_activateWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v4;
    id v7 = (void *)MEMORY[0x223C65C40](v5);
    int v9 = 136315394;
    id v10 = "-[SVXSessionManager activateWithContext:completion:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_DEFAULT, "%s completion:%@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

uint64_t __52__SVXSessionManager_activateWithContext_completion___block_invoke_30(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

uint64_t __52__SVXSessionManager_activateWithContext_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) enqueueObject:*(void *)(a1 + 40)];
}

- (void)continuousVoiceTriggerDetectedWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__SVXSessionManager_continuousVoiceTriggerDetectedWithCompletion___block_invoke;
  v7[3] = &unk_2645547D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __66__SVXSessionManager_continuousVoiceTriggerDetectedWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) startAdvertising:3 withSCDAGoodnessScoreContext:0 withSCDAAudioContext:0 completion:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)prewarmWithContext:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v17 = "-[SVXSessionManager prewarmWithContext:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if ([(SVXAudioServicesUtils *)self->_audioServicesUtils shouldPrewarmAudioServicesActivate])
  {
    [(SVXAudioServicesUtils *)self->_audioServicesUtils audioServicesActivateWithTimeout];
  }
  int v9 = [(SVXModule *)self->_module analytics];
  [v9 logEventWithType:1402 context:0];

  id v10 = [(SVXModule *)self->_module performer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__SVXSessionManager_prewarmWithContext_completion___block_invoke;
  v13[3] = &unk_264554788;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 performBlock:v13];
}

uint64_t __51__SVXSessionManager_prewarmWithContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prewarmWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didFailAppLaunchWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__SVXSessionManager_session_didFailAppLaunchWithBundleIdentifier___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlock:v8];
}

uint64_t __66__SVXSessionManager_session_didFailAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidFailAppLaunchWithBundleIdentifier:*(void *)(a1 + 40)];
}

- (void)session:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__SVXSessionManager_session_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlock:v8];
}

uint64_t __70__SVXSessionManager_session_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleWillProcessAppLaunchWithBundleIdentifier:*(void *)(a1 + 40)];
}

- (void)sessionDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SVXSessionManager_sessionDidInvalidate___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __42__SVXSessionManager_sessionDidInvalidate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSessionDidInvalidate:*(void *)(a1 + 40)];
}

- (void)session:(id)a3 audioSessionDidBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(SVXModule *)self->_module performer];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __95__SVXSessionManager_session_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke;
  v17[3] = &unk_264553320;
  v17[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v13 performBlock:v17];
}

uint64_t __95__SVXSessionManager_session_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) audioSessionDidBecomeActive:*(unsigned __int8 *)(a1 + 64) activationContext:*(void *)(a1 + 48) deactivationContext:*(void *)(a1 + 56)];
}

- (void)session:(id)a3 audioSessionWillBecomeActive:(BOOL)a4 activationContext:(id)a5 deactivationContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(SVXModule *)self->_module performer];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __96__SVXSessionManager_session_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke;
  v17[3] = &unk_264553320;
  v17[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v13 performBlock:v17];
}

uint64_t __96__SVXSessionManager_session_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) audioSessionWillBecomeActive:*(unsigned __int8 *)(a1 + 64) activationContext:*(void *)(a1 + 48) deactivationContext:*(void *)(a1 + 56)];
}

- (void)session:(id)a3 didDeactivateWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__SVXSessionManager_session_didDeactivateWithContext___block_invoke;
  v11[3] = &unk_2645547B0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

uint64_t __54__SVXSessionManager_session_didDeactivateWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) didDeactivateWithContext:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 willDeactivateWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__SVXSessionManager_session_willDeactivateWithContext___block_invoke;
  v11[3] = &unk_2645547B0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

uint64_t __55__SVXSessionManager_session_willDeactivateWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) willDeactivateWithContext:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didNotActivateWithContext:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SVXModule *)self->_module performer];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__SVXSessionManager_session_didNotActivateWithContext_error___block_invoke;
  v15[3] = &unk_264554210;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBlock:v15];
}

uint64_t __61__SVXSessionManager_session_didNotActivateWithContext_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) didNotActivateWithContext:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)session:(id)a3 didActivateWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__SVXSessionManager_session_didActivateWithContext___block_invoke;
  v11[3] = &unk_2645547B0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

uint64_t __52__SVXSessionManager_session_didActivateWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) didActivateWithContext:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 willActivateWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__SVXSessionManager_session_willActivateWithContext___block_invoke;
  v11[3] = &unk_2645547B0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

uint64_t __53__SVXSessionManager_session_willActivateWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) willActivateWithContext:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didResignActiveWithDeactivationContext:(id)a4 activityUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SVXModule *)self->_module performer];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__SVXSessionManager_session_didResignActiveWithDeactivationContext_activityUUID___block_invoke;
  v15[3] = &unk_264554210;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBlock:v15];
}

uint64_t __81__SVXSessionManager_session_didResignActiveWithDeactivationContext_activityUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) didResignActiveWithDeactivationContext:*(void *)(a1 + 48) activityUUID:*(void *)(a1 + 56)];
}

- (void)session:(id)a3 willResignActiveWithOptions:(unint64_t)a4 duration:(double)a5 activityUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(SVXModule *)self->_module performer];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__SVXSessionManager_session_willResignActiveWithOptions_duration_activityUUID___block_invoke;
  v15[3] = &unk_2645532F8;
  v15[4] = self;
  id v16 = v10;
  double v19 = a5;
  id v17 = v11;
  unint64_t v18 = a4;
  id v13 = v11;
  id v14 = v10;
  [v12 performBlock:v15];
}

uint64_t __79__SVXSessionManager_session_willResignActiveWithOptions_duration_activityUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) willResignActiveWithOptions:*(void *)(a1 + 56) duration:*(void *)(a1 + 48) activityUUID:*(double *)(a1 + 64)];
}

- (void)session:(id)a3 didBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SVXModule *)self->_module performer];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __86__SVXSessionManager_session_didBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke;
  v19[3] = &unk_264554450;
  void v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 performBlock:v19];
}

uint64_t __86__SVXSessionManager_session_didBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) didBecomeActiveWithActivationContext:*(void *)(a1 + 48) activityUUID:*(void *)(a1 + 56) turnID:*(void *)(a1 + 64)];
}

- (void)session:(id)a3 willBecomeActiveWithActivationContext:(id)a4 activityUUID:(id)a5 turnID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SVXModule *)self->_module performer];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __87__SVXSessionManager_session_willBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke;
  v19[3] = &unk_264554450;
  void v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 performBlock:v19];
}

uint64_t __87__SVXSessionManager_session_willBecomeActiveWithActivationContext_activityUUID_turnID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) willBecomeActiveWithActivationContext:*(void *)(a1 + 48) activityUUID:*(void *)(a1 + 56) turnID:*(void *)(a1 + 64)];
}

- (void)session:(id)a3 didStopSoundWithID:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SVXModule *)self->_module performer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__SVXSessionManager_session_didStopSoundWithID_error___block_invoke;
  v13[3] = &unk_264553FD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

uint64_t __54__SVXSessionManager_session_didStopSoundWithID_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) didStopSoundWithID:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didStartSoundWithID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SVXModule *)self->_module performer];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__SVXSessionManager_session_didStartSoundWithID___block_invoke;
  v9[3] = &unk_264554738;
  void v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [v7 performBlock:v9];
}

uint64_t __49__SVXSessionManager_session_didStartSoundWithID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) didStartSoundWithID:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 willStartSoundWithID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SVXModule *)self->_module performer];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__SVXSessionManager_session_willStartSoundWithID___block_invoke;
  v9[3] = &unk_264554738;
  void v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [v7 performBlock:v9];
}

uint64_t __50__SVXSessionManager_session_willStartSoundWithID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) willStartSoundWithID:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didEndUpdateAudioPowerWithType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SVXModule *)self->_module performer];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SVXSessionManager_session_didEndUpdateAudioPowerWithType___block_invoke;
  v9[3] = &unk_264554738;
  void v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [v7 performBlock:v9];
}

uint64_t __60__SVXSessionManager_session_didEndUpdateAudioPowerWithType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) didEndUpdateAudioPowerWithType:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 willBeginUpdateAudioPowerWithType:(int64_t)a4 wrapper:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SVXModule *)self->_module performer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__SVXSessionManager_session_willBeginUpdateAudioPowerWithType_wrapper___block_invoke;
  v13[3] = &unk_264553FD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

uint64_t __71__SVXSessionManager_session_willBeginUpdateAudioPowerWithType_wrapper___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) willBeginUpdateAudioPowerWithType:*(void *)(a1 + 56) wrapper:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__SVXSessionManager_session_didChangeFromState_toState___block_invoke;
  v11[3] = &unk_2645532D0;
  void v11[4] = self;
  id v12 = v8;
  int64_t v13 = a4;
  int64_t v14 = a5;
  id v10 = v8;
  [v9 performBlock:v11];
}

uint64_t __56__SVXSessionManager_session_didChangeFromState_toState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) didChangeFromState:*(void *)(a1 + 48) toState:*(void *)(a1 + 56)];
}

- (void)session:(id)a3 willChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__SVXSessionManager_session_willChangeFromState_toState___block_invoke;
  v11[3] = &unk_2645532D0;
  void v11[4] = self;
  id v12 = v8;
  int64_t v13 = a4;
  int64_t v14 = a5;
  id v10 = v8;
  [v9 performBlock:v11];
}

uint64_t __57__SVXSessionManager_session_willChangeFromState_toState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSession:*(void *)(a1 + 40) willChangeFromState:*(void *)(a1 + 48) toState:*(void *)(a1 + 56)];
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = (AFNotifyObserver *)a3;
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315906;
    int64_t v14 = "-[SVXSessionManager notifyObserver:didChangeStateFrom:to:]";
    __int16 v15 = 2112;
    int64_t v16 = v8;
    __int16 v17 = 2048;
    unint64_t v18 = a4;
    __int16 v19 = 2048;
    unint64_t v20 = a5;
    _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s notifyObserver = %@, fromState = %llu, toState = %llu", buf, 0x2Au);
  }
  if (self->_deviceProblemsNotifyObserver == v8)
  {
    id v10 = [(SVXModule *)self->_module performer];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__SVXSessionManager_notifyObserver_didChangeStateFrom_to___block_invoke;
    v11[3] = &unk_2645548C8;
    void v11[4] = self;
    id v12 = 0;
    [v10 performBlock:v11];
  }
}

uint64_t __58__SVXSessionManager_notifyObserver_didChangeStateFrom_to___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDeviceProblemsStateChanged:*(void *)(a1 + 40)];
}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  tether = self->_tether;
  self->_tether = 0;
  id v5 = a3;

  id v6 = (id)[(AFQueue *)self->_queuedOperations dequeueAllObjects];
  [(AFNotifyObserver *)self->_deviceProblemsNotifyObserver invalidate];
  deviceProblemsNotifyObserver = self->_deviceProblemsNotifyObserver;
  self->_deviceProblemsNotifyObserver = 0;

  deviceProblemsState = self->_deviceProblemsState;
  self->_deviceProblemsState = 0;

  [(SVXSessionManager *)self _invalidateCurrentSession];
  [(SVXAnnouncer *)self->_activationAnnouncer removeAllListeners];
  [(SVXAnnouncer *)self->_audioPowerUpdateAnnouncer removeAllListeners];
  [(SVXAnnouncer *)self->_activityAnnouncer removeAllListeners];
  [(SVXSpeechSynthesizer *)self->_speechSynthesizer removeListener:self];
  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = 0;

  powerLevelManager = self->_powerLevelManager;
  self->_powerLevelManager = 0;

  id v14 = [v5 deviceSetupManager];
  [v14 removeListener:self];
  deviceSetupContext = self->_deviceSetupContext;
  self->_deviceSetupContext = 0;

  id v12 = [v5 systemObserver];

  [v12 removeDeviceContextListener:self];
  localDeviceContext = self->_localDeviceContext;
  self->_localDeviceContext = 0;

  [MEMORY[0x263F284A0] stopMonitoringAvailability];
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v6 = a4;
  [MEMORY[0x263F284A0] beginMonitoringAvailability];
  if (!self->_tether)
  {
    id v7 = objc_alloc(MEMORY[0x263F28628]);
    id v8 = [(SVXModule *)self->_module instanceContext];
    id v9 = (AFSiriTether *)[v7 initWithInstanceContext:v8];
    tether = self->_tether;
    self->_tether = v9;

    objc_initWeak(&location, self);
    id v11 = self->_tether;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke;
    v47[3] = &unk_264553258;
    objc_copyWeak(&v48, &location);
    [(AFSiriTether *)v11 setAttachmentStatusChangedHandler:v47];
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
  [(SVXSessionManager *)self _attachToTether];
  id v12 = [v36 speechSynthesizer];
  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = v12;

  [(SVXSpeechSynthesizer *)self->_speechSynthesizer addListener:self];
  self->_speechSynthesisState = 1;
  id v14 = [SVXPowerLevelManager alloc];
  module = self->_module;
  int64_t v16 = [(SVXSpeechSynthesizer *)self->_speechSynthesizer ttsSession];
  __int16 v17 = [(SVXPowerLevelManager *)v14 initWithModule:module audioPowerProvider:v16];
  powerLevelManager = self->_powerLevelManager;
  self->_powerLevelManager = v17;

  __int16 v19 = [v36 serviceCommandHandler];
  serviceCommandHandler = self->_serviceCommandHandler;
  self->_serviceCommandHandler = v19;

  objc_initWeak(&location, self);
  uint64_t v21 = [(SVXModule *)self->_module performer];
  deviceSetupContext = self->_deviceSetupContext;
  self->_deviceSetupContext = 0;

  id v23 = [v36 deviceSetupManager];
  [v23 addListener:self];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_2;
  v44[3] = &unk_264553280;
  id v24 = v21;
  id v45 = v24;
  objc_copyWeak(&v46, &location);
  [v23 getContextWithCompletion:v44];
  localDeviceContext = self->_localDeviceContext;
  self->_localDeviceContext = 0;

  id v26 = [v36 systemObserver];
  [v26 addDeviceContextListener:self];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_4;
  v41[3] = &unk_2645532A8;
  id v35 = v24;
  id v42 = v35;
  objc_copyWeak(&v43, &location);
  [v26 getLocalDeviceContextWithCompletion:v41];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v27 = v6;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v27);
        }
        v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ([v31 type] == 2)
        {
          activityAnnouncer = self->_activityAnnouncer;
          v33 = [v31 activityListener];
          [(SVXAnnouncer *)activityAnnouncer addListener:v33];
        }
        else
        {
          if ([v31 type] != 3) {
            continue;
          }
          audioPowerUpdateAnnouncer = self->_audioPowerUpdateAnnouncer;
          v33 = [v31 audioPowerUpdateListener];
          [(SVXAnnouncer *)audioPowerUpdateAnnouncer addListener:v33];
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v28);
  }

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v46);

  objc_destroyWeak(&location);
}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained attachToTether];
  }
}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_3;
  v6[3] = &unk_264554990;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v5 = v3;
  id v7 = v5;
  [v4 performBlock:v6];

  objc_destroyWeak(&v8);
}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_5;
  v6[3] = &unk_264554990;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v5 = v3;
  id v7 = v5;
  [v4 performBlock:v6];

  objc_destroyWeak(&v8);
}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleLocalDeviceContextChanged:*(void *)(a1 + 32)];
}

void __74__SVXSessionManager_startWithModuleInstanceProvider_platformDependencies___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDeviceSetupContextChanged:*(void *)(a1 + 32)];
}

- (SVXSessionManager)initWithModule:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SVXSessionManager;
  id v6 = [(SVXSessionManager *)&v37 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_module, a3);
    id v8 = [v5 instanceContext];
    if (AFIsHorseman())
    {
      id v9 = [SVXMyriadDeviceManager alloc];
      id v10 = [v5 analytics];
      id v11 = [v5 preferences];
      uint64_t v12 = [(SVXMyriadDeviceManager *)v9 initWithInstanceContext:v8 analytics:v10 preferences:v11 delegate:v7];
      myriadDeviceManager = v7->_myriadDeviceManager;
      v7->_myriadDeviceManager = (SVXMyriadDeviceManager *)v12;

      id v14 = [v5 preferences];
      v7->_myriadDuckingAllowed = [v14 myriadDuckingEnabled];
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_myriadStereoPartnerDataChanged, (CFStringRef)*MEMORY[0x263F28768], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if ([v8 isDefault])
    {
      int64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      __int16 v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v18 = dispatch_queue_create(0, v17);
      coreDuetQueue = v7->_coreDuetQueue;
      v7->_coreDuetQueue = (OS_dispatch_queue *)v18;

      unint64_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v22 = dispatch_queue_create(0, v21);
      biomeQueue = v7->_biomeQueue;
      v7->_biomeQueue = (OS_dispatch_queue *)v22;
    }
    id v24 = [(SVXModule *)v7->_module performer];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __36__SVXSessionManager_initWithModule___block_invoke;
    v35[3] = &unk_2645548A0;
    __int16 v25 = v7;
    id v36 = v25;
    [v24 performBlock:v35];

    id v26 = objc_alloc_init(SVXSessionActivationAnnouncer);
    activationAnnouncer = v25->_activationAnnouncer;
    v25->_activationAnnouncer = v26;

    uint64_t v28 = objc_alloc_init(SVXAudioPowerUpdateAnnouncer);
    audioPowerUpdateAnnouncer = v25->_audioPowerUpdateAnnouncer;
    v25->_audioPowerUpdateAnnouncer = v28;

    id v30 = objc_alloc_init(SVXSessionActivityAnnouncer);
    activityAnnouncer = v25->_activityAnnouncer;
    v25->_activityAnnouncer = v30;

    char v32 = (AFQueue *)objc_alloc_init(MEMORY[0x263F285A8]);
    queuedOperations = v25->_queuedOperations;
    v25->_queuedOperations = v32;

    [(AFQueue *)v25->_queuedOperations setDelegate:v25];
  }

  return v7;
}

uint64_t __36__SVXSessionManager_initWithModule___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStereoPartnerLastMyriadWinDate];
}

- (void)_myriadStereoPartnerDataChanged
{
  id v3 = [(SVXModule *)self->_module performer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SVXSessionManager__myriadStereoPartnerDataChanged__block_invoke;
  v4[3] = &unk_2645548A0;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __52__SVXSessionManager__myriadStereoPartnerDataChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchStereoPartnerLastMyriadWinDate];
}

- (void)unduckDevice
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v7 = "-[SVXSessionManager unduckDevice]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s BTLE Device should unduck audio", buf, 0xCu);
  }
  id v4 = [(SVXModule *)self->_module performer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__SVXSessionManager_unduckDevice__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [v4 performBlock:v5];
}

void __33__SVXSessionManager_unduckDevice__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 72);
  if (v2)
  {
    *(void *)(v1 + 72) = 0;

    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      id v5 = "-[SVXSessionManager unduckDevice]_block_invoke";
      _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s BTLE released audio session tracker", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)deviceWonMyriadElection
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v7 = "-[SVXSessionManager deviceWonMyriadElection]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s BTLE Device continues to interact", buf, 0xCu);
  }
  int v4 = [(SVXModule *)self->_module performer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SVXSessionManager_deviceWonMyriadElection__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [v4 performBlock:v5];
}

void __44__SVXSessionManager_deviceWonMyriadElection__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[7];
  if (v2)
  {
    int v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      id v9 = "-[SVXSessionManager deviceWonMyriadElection]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v2;
      _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s End waiting for Myriad token %@ as won.", (uint8_t *)&v8, 0x16u);
      uint64_t v1 = *(void **)(a1 + 32);
    }
    id v5 = [v1 _currentSession:0];
    [v5 endWaitingForMyriadDecisionWithToken:*(void *)(*(void *)(a1 + 32) + 56) result:1];

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = 0;
  }
}

- (void)deviceLostMyriadElection
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = mach_absolute_time();
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v12 = "-[SVXSessionManager deviceLostMyriadElection]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s BTLE Device should abort session", buf, 0xCu);
  }
  id v5 = [(SVXModule *)self->_module analytics];
  [v5 logEventWithType:1403 context:0];

  uint64_t v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SVXSessionManager_deviceLostMyriadElection__block_invoke;
  v8[3] = &unk_264554738;
  id v9 = v6;
  uint64_t v10 = v3;
  v8[4] = self;
  id v7 = v6;
  [v7 performBlock:v8];
}

void __45__SVXSessionManager_deviceLostMyriadElection__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  int v4 = (os_log_t *)MEMORY[0x263F28348];
  if (v3)
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      v31 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke";
      __int16 v32 = 2112;
      uint64_t v33 = v3;
      _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s End waiting for Myriad token %@ as lost.", buf, 0x16u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    uint64_t v6 = [(id)v2 _currentSession:0];
    [v6 endWaitingForMyriadDecisionWithToken:*(void *)(*(void *)(a1 + 32) + 56) result:0];

    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 80))
  {
    id v9 = [SVXActivationContext alloc];
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = SVXClientInfoGetCurrent();
    uint64_t v12 = [(SVXActivationContext *)v9 initWithSource:3 timestamp:v10 buttonEvent:0 systemEvent:0 clientInfo:v11 requestInfo:0 userInfo:0];

    uint64_t v13 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v31 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke";
      _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s BTLE willObtainTracker", buf, 0xCu);
    }
    id v14 = [*(id *)(a1 + 32) _currentSession:1];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    void v27[2] = __45__SVXSessionManager_deviceLostMyriadElection__block_invoke_13;
    v27[3] = &unk_264553BC8;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 32);
    id v28 = v15;
    uint64_t v29 = v16;
    uint64_t v17 = [v14 activateWithContext:v12 completion:v27];
    uint64_t v18 = *(void *)(a1 + 32);
    __int16 v19 = *(void **)(v18 + 72);
    *(void *)(v18 + 72) = v17;

    unint64_t v20 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 72);
      *(_DWORD *)long long buf = 136315394;
      v31 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke";
      __int16 v32 = 2112;
      uint64_t v33 = v21;
      _os_log_impl(&dword_220062000, v20, OS_LOG_TYPE_INFO, "%s BTLE didObtainTracker = %@", buf, 0x16u);
    }
    dispatch_queue_t v22 = v28;
  }
  else
  {
    id v23 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v31 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke";
      _os_log_impl(&dword_220062000, v23, OS_LOG_TYPE_INFO, "%s BTLE deactivate", buf, 0xCu);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    uint64_t v12 = [(id)v2 _currentSession:0];
    id v24 = [SVXDeactivationContext alloc];
    uint64_t v25 = *(void *)(a1 + 48);
    dispatch_queue_t v22 = SVXClientInfoGetCurrent();
    id v26 = [(SVXDeactivationContext *)v24 initWithSource:3 timestamp:v25 buttonEvent:0 clientInfo:v22 userInfo:0 options:0];
    [(SVXActivationContext *)v12 deactivateWithContext:v26 completion:0];
  }
}

void __45__SVXSessionManager_deviceLostMyriadElection__block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SVXSessionManager_deviceLostMyriadElection__block_invoke_2;
  v7[3] = &unk_2645548C8;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 performBlock:v7];
}

void __45__SVXSessionManager_deviceLostMyriadElection__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(v2 + 72);
    *(void *)(v2 + 72) = 0;

    uint64_t v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315394;
      uint64_t v7 = "-[SVXSessionManager deviceLostMyriadElection]_block_invoke_2";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s BTLE released audio session tracker (error = %@)", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)removeActivityListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SVXSessionManager_removeActivityListener___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __44__SVXSessionManager_removeActivityListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) removeListener:*(void *)(a1 + 40)];
}

- (void)addActivityListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SVXSessionManager_addActivityListener___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __41__SVXSessionManager_addActivityListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) addListener:*(void *)(a1 + 40)];
}

- (void)removeAudioPowerUpdateListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SVXSessionManager_removeAudioPowerUpdateListener___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __52__SVXSessionManager_removeAudioPowerUpdateListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) removeListener:*(void *)(a1 + 40)];
}

- (void)addAudioPowerUpdateListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSessionManager_addAudioPowerUpdateListener___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __49__SVXSessionManager_addAudioPowerUpdateListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) addListener:*(void *)(a1 + 40)];
}

- (void)removeActivationListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__SVXSessionManager_removeActivationListener___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __46__SVXSessionManager_removeActivationListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) removeListener:*(void *)(a1 + 40)];
}

- (void)addActivationListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SVXSessionManager_addActivationListener___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __43__SVXSessionManager_addActivationListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) addListener:*(void *)(a1 + 40)];
}

- (void)getAudioSessionProviderWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(SVXModule *)self->_module performer];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__SVXSessionManager_getAudioSessionProviderWithCompletion___block_invoke;
    v6[3] = &unk_2645547D8;
    void v6[4] = self;
    id v7 = v4;
    [v5 performBlock:v6];
  }
}

void __59__SVXSessionManager_getAudioSessionProviderWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _currentSession:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)getCurrentSessionUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(SVXModule *)self->_module performer];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__SVXSessionManager_getCurrentSessionUsingBlock___block_invoke;
    v6[3] = &unk_2645547D8;
    void v6[4] = self;
    id v7 = v4;
    [v5 performBlock:v6];
  }
}

void __49__SVXSessionManager_getCurrentSessionUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _currentSession:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)fetchCurrentAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__SVXSessionManager_fetchCurrentAlarmAndTimerFiringContextWithCompletion___block_invoke;
  v7[3] = &unk_2645547D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __74__SVXSessionManager_fetchCurrentAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _currentSession:1];
  [v2 getAlarmAndTimerFiringContextWithCompletion:*(void *)(a1 + 40)];
}

- (void)fetchCurrentAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(SVXModule *)self->_module performer];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SVXSessionManager_fetchCurrentAudioPowerWithType_completion___block_invoke;
  v9[3] = &unk_264554650;
  id v10 = v6;
  int64_t v11 = a3;
  void v9[4] = self;
  id v8 = v6;
  [v7 performBlock:v9];
}

uint64_t __63__SVXSessionManager_fetchCurrentAudioPowerWithType_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentAudioPowerWithType:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)fetchCurrentActivityStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SVXSessionManager_fetchCurrentActivityStateWithCompletion___block_invoke;
  v7[3] = &unk_2645547D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __61__SVXSessionManager_fetchCurrentActivityStateWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __61__SVXSessionManager_fetchCurrentActivityStateWithCompletion___block_invoke_2;
  v2[3] = &unk_264554480;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _fetchCurrentActivityStateWithCompletion:v2];
}

uint64_t __61__SVXSessionManager_fetchCurrentActivityStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 4);
}

- (void)fetchCurrentStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SVXSessionManager_fetchCurrentStateWithCompletion___block_invoke;
  v7[3] = &unk_2645547D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __53__SVXSessionManager_fetchCurrentStateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentStateWithCompletion:*(void *)(a1 + 40)];
}

- (void)preheatWithActivationSource:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    if ((unint64_t)a3 > 9) {
      id v7 = @"(unknown)";
    }
    else {
      id v7 = off_264553510[a3];
    }
    id v8 = v7;
    *(_DWORD *)long long buf = 136315394;
    uint64_t v13 = "-[SVXSessionManager preheatWithActivationSource:]";
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s activationSource = %@", buf, 0x16u);
  }
  if ([(SVXAudioServicesUtils *)self->_audioServicesUtils shouldPrewarmAudioServicesActivate])
  {
    [(SVXAudioServicesUtils *)self->_audioServicesUtils audioServicesActivateWithTimeout];
  }
  uint64_t v9 = [(SVXModule *)self->_module analytics];
  [v9 logEventWithType:1402 context:0];

  id v10 = [(SVXModule *)self->_module performer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__SVXSessionManager_preheatWithActivationSource___block_invoke;
  v11[3] = &unk_264554548;
  void v11[4] = self;
  void v11[5] = a3;
  [v10 performBlock:v11];
}

uint64_t __49__SVXSessionManager_preheatWithActivationSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preheatWithActivationSource:*(void *)(a1 + 40)];
}

@end