@interface SiriActivationService
+ (id)new;
+ (id)service;
- (AFPreferences)afPreferences;
- (AFSiriTether)siriTether;
- (BOOL)_buttonIsAVExternalButton:(int64_t)a3;
- (BOOL)_buttonIsTVMicrophoneButton:(int64_t)a3;
- (BOOL)_canActivateForRequest:(id)a3;
- (BOOL)_eyesFreeRedesignOnlySteeringWheelEnabled;
- (BOOL)_isEyesFreeEligibleWithRequest:(id)a3;
- (BOOL)_isInitialRequest;
- (BOOL)_isSAEEnabled;
- (BOOL)_isVoiceActivationMaskNecessaryWithRequestOptions:(id)a3;
- (BOOL)_logCancelledActivationWithButtonIdentifier:(int64_t)a3 duration:(double)a4 targetDuration:(double)a5;
- (BOOL)_pocketStateFetchingInProgressForHeadsetActivation;
- (BOOL)_shouldHandlePocketStateFetchForRequestOptions:(id)a3;
- (BOOL)_shouldRejectActivationWithButtonIdentifier:(int64_t)a3 activationAssertions:(id)a4;
- (BOOL)_shouldRejectNewActivations:(int64_t)a3;
- (BOOL)_shouldShowHintGlowWithRequest:(id)a3;
- (BOOL)_siriIsEnabled;
- (BOOL)buttonDownHasOccurredSinceActivation;
- (BOOL)canActivateFromDirectActionSource;
- (BOOL)handleActivationRequest:(id)a3;
- (BOOL)handleActivationRequest:(id)a3 systemState:(id)a4;
- (BOOL)isConnectedTo188;
- (BOOL)presentationsAreIdleAndQuiet;
- (BOOL)requestOptionsBuilder:(id)a3 isAcousticIdAllowedWithActiviation:(id)a4;
- (BOOL)requestOptionsBuilder:(id)a3 isPredictedRecordRouteIsZLLWithActiviation:(id)a4;
- (BOOL)requestOptionsBuilder:(id)a3 isSiriCarBluetoothRequest:(id)a4;
- (BOOL)requestOptionsBuilder:(id)a3 shouldRequestUseAutomaticEndpointingWithActiviation:(id)a4;
- (BOOL)siriTetherIsAttached;
- (BOOL)voiceTriggerNotifyTokenIsValid;
- (BOOL)xcTestingActive;
- (NSMutableDictionary)activationAssertions;
- (NSMutableDictionary)avExternalButtonEvents;
- (NSMutableDictionary)buttonEventListeners;
- (NSMutableDictionary)sources;
- (SASBluetoothEndpointUtility)bluetoothEndpointUtil;
- (SASBulletinManager)bulletinManager;
- (SASHeater)heater;
- (SASLockStateMonitor)lockStateMonitor;
- (SASPresentationManager)presentationManager;
- (SASRemoteRequestManager)remoteRequestManager;
- (SASSystemState)systemState;
- (SASTestingInputController)testingInputController;
- (SiriActivationService)init;
- (UAFAssetUtilities)assetUtilities;
- (double)activationTimestamp;
- (id)_init;
- (id)_uiPresentationIdentifierWithActivation:(id)a3 activationPresentation:(int64_t)a4;
- (id)_updateRequestOptionsWithTestingContextFromActivationRequest:(id)a3 requestOptions:(id)a4;
- (id)allBulletins;
- (id)bulletinForIdentifier:(id)a3;
- (id)bulletinsOnLockScreen;
- (id)didDismissForAssesmentModeStartedCompeltion;
- (id)requestOptionsBuilder:(id)a3 optionsForOverriding:(id)a4 withActiviation:(id)a5;
- (id)requestOptionsBuilder:(id)a3 uiPresentationIdentifierWithActivation:(id)a4 activationPresentation:(int64_t)a5;
- (int64_t)_requestState;
- (int64_t)presentationWithActivationPriority;
- (unint64_t)requestOptionsBuilder:(id)a3 currentLockStateForActivation:(id)a4;
- (void)_B188ActivationEvent:(int64_t)a3 context:(id)a4 options:(id)a5;
- (void)_activatePresentationWithIdentifier:(int64_t)a3 requestOptions:(id)a4 analyticsContext:(id)a5;
- (void)_attachToTether;
- (void)_cancelActivationPreparationForSetup;
- (void)_cancelPendingActivationEventWithReason:(unint64_t)a3;
- (void)_defrost;
- (void)_dismissSiri:(id)a3;
- (void)_handleDesignModeRequest;
- (void)_handlePocketStateFetchForScreenWakeForPresentationIdentifier:(int64_t)a3;
- (void)_handleTapSynthesisIfNeededForButtonIdentifier:(int64_t)a3 buttonUpTimestamp:(double)a4;
- (void)_logActivationToPowerLogWithReason:(int64_t)a3;
- (void)_notifyListenersOfButtonDownWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4;
- (void)_notifyListenersOfButtonLongPressWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4;
- (void)_notifyListenersOfButtonUpWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4;
- (void)_notifySourcesOfCanActivateFromDirectActionSourceChange:(BOOL)a3;
- (void)_notifySourcesOfPresentationStateChange:(id)a3;
- (void)_preheatPresentation;
- (void)_recordTimeIfNeededForButtonIdentifier:(int64_t)a3 buttonDownTimestamp:(double)a4;
- (void)_setPocketStateFetchingInProgressForHeadsetActivation:(BOOL)a3;
- (void)_unregisterForVoiceTrigger;
- (void)_updateCanActivateFromDirectActionSource;
- (void)activationRequestFromBluetoothKeyboardActivation:(int64_t)a3;
- (void)activationRequestFromBreadcrumb;
- (void)activationRequestFromButtonIdentifier:(int64_t)a3 context:(id)a4;
- (void)activationRequestFromContinuityWithContext:(id)a3;
- (void)activationRequestFromContinuousConversationHearstWithContext:(id)a3;
- (void)activationRequestFromContinuousConversationJarvisWithContext:(id)a3;
- (void)activationRequestFromContinuousConversationWithContext:(id)a3;
- (void)activationRequestFromDirectActionEventWithContext:(id)a3 completion:(id)a4;
- (void)activationRequestFromRemotePresentationBringUpWithContext:(id)a3;
- (void)activationRequestFromSimpleActivation:(int64_t)a3;
- (void)activationRequestFromSpotlightWithContext:(id)a3;
- (void)activationRequestFromTestRunnerWithContext:(id)a3;
- (void)activationRequestFromTestingWithContext:(id)a3;
- (void)activationRequestFromTostadaWithContext:(id)a3;
- (void)activationRequestFromVocalShortcutWithContext:(id)a3;
- (void)activationRequestFromVoiceTrigger;
- (void)activationRequestFromVoiceTriggerWithContext:(id)a3;
- (void)assessmentModeChangedToIsActive:(BOOL)a3 completion:(id)a4;
- (void)bulletinManagerDidChangeBulletins:(id)a3;
- (void)buttonDownFromButtonIdentifier:(int64_t)a3 timestamp:(double)a4 context:(id)a5;
- (void)buttonLongPressFromButtonIdentifier:(int64_t)a3 context:(id)a4;
- (void)buttonLongPressFromButtonIdentifier:(int64_t)a3 deviceIdentifier:(id)a4 context:(id)a5;
- (void)buttonTapFromButtonIdentifier:(int64_t)a3 timestamp:(double)a4 context:(id)a5;
- (void)buttonUpFromButtonIdentifier:(int64_t)a3 deviceIdentifier:(id)a4 timestamp:(double)a5 context:(id)a6;
- (void)callStateChangedToIsActive:(BOOL)a3 isOutgoing:(BOOL)a4;
- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGesture;
- (void)cancelPrewarmFromButtonIdentifier:(int64_t)a3;
- (void)deactivationRequestFromButtonIdentifier:(int64_t)a3 context:(id)a4 options:(id)a5;
- (void)dealloc;
- (void)didChangeLockState:(unint64_t)a3;
- (void)heater:(id)a3 cancelledPreparationWithButtonIdentifier:(int64_t)a4 duration:(double)a5 targetDuration:(double)a6;
- (void)heaterSuggestsPreheating:(id)a3;
- (void)pongWithPresentationIdentifier:(int64_t)a3;
- (void)presentationManager:(id)a3 didChangeAggregateState:(id)a4;
- (void)presentationManager:(id)a3 didEncounterError:(int64_t)a4;
- (void)prewarmForFirstTapOfQuickTypeToSiriGesture;
- (void)prewarmFromButtonIdentifier:(int64_t)a3 longPressInterval:(double)a4;
- (void)registerActivationAssertion:(id)a3 withIdentifier:(id)a4;
- (void)registerActivationSource:(id)a3 withIdentifier:(id)a4;
- (void)registerButtonEventListenerServer:(id)a3 identifier:(id)a4;
- (void)registerSiriPresentation:(id)a3 withIdentifier:(int64_t)a4;
- (void)scdaShouldAbort:(id)a3;
- (void)scdaShouldContinue:(id)a3;
- (void)setActivationAssertions:(id)a3;
- (void)setActivationTimestamp:(double)a3;
- (void)setAfPreferences:(id)a3;
- (void)setAssetUtilities:(id)a3;
- (void)setAvExternalButtonEvents:(id)a3;
- (void)setBluetoothEndpointUtil:(id)a3;
- (void)setBulletinManager:(id)a3;
- (void)setButtonDownHasOccurredSinceActivation:(BOOL)a3;
- (void)setButtonEventListeners:(id)a3;
- (void)setCanActivateFromDirectActionSource:(BOOL)a3;
- (void)setDidDismissForAssesmentModeStartedCompeltion:(id)a3;
- (void)setHeater:(id)a3;
- (void)setHintGlowAssertionFromButtonIdentifier:(int64_t)a3 context:(id)a4;
- (void)setLockStateMonitor:(id)a3;
- (void)setPresentationManager:(id)a3;
- (void)setRemoteRequestManager:(id)a3;
- (void)setSiriTether:(id)a3;
- (void)setSiriTetherIsAttached:(BOOL)a3;
- (void)setSources:(id)a3;
- (void)setSystemState:(id)a3;
- (void)setTestingInputController:(id)a3;
- (void)setVoiceTriggerNotifyTokenIsValid:(BOOL)a3;
- (void)setXcTestingActive:(BOOL)a3;
- (void)siriPresentationDidUpdateState:(id)a3;
- (void)siriPresentationDismissedWithIdentifier:(int64_t)a3;
- (void)siriPresentationDisplayedWithIdentifier:(int64_t)a3;
- (void)siriPresentationFailureWithIdentifier:(int64_t)a3 error:(id)a4;
- (void)siriPresentationWillDismissWithIdentifier:(int64_t)a3;
- (void)speechRequestStateDidChange:(int64_t)a3;
- (void)unregisterActivationAssertionWithIdentifier:(id)a3;
- (void)unregisterActivationSourceIdentifier:(id)a3;
- (void)unregisterButtonEventListenerWithIdentifier:(id)a3;
- (void)unregisterSiriPresentationIdentifier:(int64_t)a3;
- (void)updatePredicatedRecordRoute;
@end

@implementation SiriActivationService

+ (id)service
{
  if (service_onceToken != -1) {
    dispatch_once(&service_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)service_sharedService;
  return v2;
}

- (void)_updateCanActivateFromDirectActionSource
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    v14 = "-[SiriActivationService _updateCanActivateFromDirectActionSource]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _updateCanActivateFromDirectActionSource", (uint8_t *)&v13, 0xCu);
  }
  v4 = objc_opt_new();
  v5 = [SASActivationRequest alloc];
  v6 = [SiriDirectActionContext alloc];
  v7 = [(SiriDirectActionContext *)v6 initWithPayload:MEMORY[0x1E4F1CC08]];
  v8 = [(SASActivationRequest *)v5 initWithDirectActionContext:v7];
  [v4 setRequest:v8];

  [v4 setButtonTriggerStateActive:0];
  v9 = [(SiriActivationService *)self systemState];
  [v4 setSystemState:v9];

  v10 = +[SASSiriPocketStateManager sharedManager];
  [v4 setPocketStateManager:v10];

  v11 = [(SiriActivationService *)self afPreferences];
  [v4 setPreferences:v11];

  objc_msgSend(v4, "setRequestState:", -[SiriActivationService _requestState](self, "_requestState"));
  v12 = [(SiriActivationService *)self assetUtilities];
  [v4 setAssetUtilities:v12];

  objc_msgSend(v4, "setPresentationIdentifier:", -[SASPresentationManager nextPresentationToActivate](self->_presentationManager, "nextPresentationToActivate"));
  [(SiriActivationService *)self setCanActivateFromDirectActionSource:+[SASActivationDecision canActivateForCondition:v4]];
}

- (int64_t)_requestState
{
  return [(SASPresentationManager *)self->_presentationManager requestState];
}

- (SASSystemState)systemState
{
  return self->_systemState;
}

- (void)setCanActivateFromDirectActionSource:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E4F28ED0];
    v7 = v5;
    v8 = [v6 numberWithBool:v3];
    int v9 = 136315394;
    v10 = "-[SiriActivationService setCanActivateFromDirectActionSource:]";
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation setCanActivateFromDirectActionSource: %@", (uint8_t *)&v9, 0x16u);
  }
  if (self->_canActivateFromDirectActionSource != v3)
  {
    self->_canActivateFromDirectActionSource = v3;
    [(SiriActivationService *)self _notifySourcesOfCanActivateFromDirectActionSourceChange:v3];
  }
}

- (void)registerActivationSource:(id)a3 withIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  int v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E4F29060];
    __int16 v11 = v9;
    v12 = [v10 currentThread];
    int v24 = 136315394;
    v25 = "-[SiriActivationService registerActivationSource:withIdentifier:]";
    __int16 v26 = 2048;
    uint64_t v27 = [v12 qualityOfService];
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock about to lock with qos: %zd", (uint8_t *)&v24, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sourcesLock);
  uint64_t v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315138;
    v25 = "-[SiriActivationService registerActivationSource:withIdentifier:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock successfully locked", (uint8_t *)&v24, 0xCu);
  }
  v14 = [(SiriActivationService *)self sources];
  uint64_t v15 = [v14 allKeys];
  int v16 = [v15 containsObject:v7];

  if (v16)
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[SiriActivationService registerActivationSource:withIdentifier:]();
    }
    v17 = [(SiriActivationService *)self sources];
    [v17 removeObjectForKey:v7];
  }
  v18 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315394;
    v25 = "-[SiriActivationService registerActivationSource:withIdentifier:]";
    __int16 v26 = 2112;
    uint64_t v27 = (uint64_t)v7;
    _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation Registering '%@'", (uint8_t *)&v24, 0x16u);
  }
  v19 = [(SiriActivationService *)self sources];
  [v19 setObject:v6 forKey:v7];

  v20 = [v6 connection];
  v21 = [v20 remoteTarget];
  v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SiriActivationService _shouldRejectNewActivations:](self, "_shouldRejectNewActivations:", -[SiriActivationService _requestState](self, "_requestState")));
  [v21 activeChangedTo:v22];

  [v6 specifySenderForInstrumentation:self->_activationEventInstrumentationSender];
  os_unfair_lock_unlock((os_unfair_lock_t)&sourcesLock);
  v23 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315138;
    v25 = "-[SiriActivationService registerActivationSource:withIdentifier:]";
    _os_log_impl(&dword_1D9588000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock unlocked", (uint8_t *)&v24, 0xCu);
  }
  [(SiriActivationService *)self _updateCanActivateFromDirectActionSource];
}

- (NSMutableDictionary)sources
{
  return self->_sources;
}

- (UAFAssetUtilities)assetUtilities
{
  return self->_assetUtilities;
}

- (AFPreferences)afPreferences
{
  afPreferences = self->_afPreferences;
  if (!afPreferences)
  {
    v4 = [MEMORY[0x1E4F4E538] sharedPreferences];
    v5 = self->_afPreferences;
    self->_afPreferences = v4;

    afPreferences = self->_afPreferences;
  }
  return afPreferences;
}

- (BOOL)_shouldRejectNewActivations:(int64_t)a3
{
  return [(SASPresentationManager *)self->_presentationManager shouldRejectNewActivationsForRequestState:a3];
}

uint64_t __32__SiriActivationService_service__block_invoke()
{
  service_sharedService = [[SiriActivationService alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v40.receiver = self;
  v40.super_class = (Class)SiriActivationService;
  v2 = [(SiriActivationService *)&v40 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(SiriActivationService *)v2 setSources:v3];

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(SiriActivationService *)v2 setActivationAssertions:v4];

    [(SiriActivationService *)v2 setXcTestingActive:0];
    v5 = objc_alloc_init(SASHeater);
    [(SiriActivationService *)v2 setHeater:v5];

    id v6 = [(SiriActivationService *)v2 heater];
    [v6 setDelegate:v2];

    [(SiriActivationService *)v2 setSiriTetherIsAttached:0];
    id v7 = objc_alloc_init(MEMORY[0x1E4F4E5C0]);
    [(SiriActivationService *)v2 setSiriTether:v7];

    v8 = [(SiriActivationService *)v2 siriTether];
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __30__SiriActivationService__init__block_invoke;
    v37 = &unk_1E6B67960;
    objc_copyWeak(&v38, &location);
    [v8 setAttachmentStatusChangedHandler:&v34];

    int v9 = objc_alloc_init(SASTestingInputController);
    testingInputController = v2->_testingInputController;
    v2->_testingInputController = v9;

    __int16 v11 = +[SASRemoteRequestManager manager];
    [(SiriActivationService *)v2 setRemoteRequestManager:v11];

    v12 = +[SASSystemState sharedSystemState];
    [(SiriActivationService *)v2 setSystemState:v12];

    uint64_t v13 = [(SiriActivationService *)v2 systemState];
    [v13 addStateChangeListener:v2];

    id v14 = objc_alloc_init(MEMORY[0x1E4FB35B8]);
    [v14 startObserversWithOptions:1];
    [(SiriActivationService *)v2 setAssetUtilities:v14];
    uint64_t v15 = objc_alloc_init(SASLockStateMonitor);
    [(SiriActivationService *)v2 setLockStateMonitor:v15];

    int v16 = [(SiriActivationService *)v2 lockStateMonitor];
    [v16 setDelegate:v2];

    v17 = +[SASSystemState sharedSystemState];
    [v17 monitorLockState];

    v18 = objc_alloc_init(SASBulletinManager);
    [(SiriActivationService *)v2 setBulletinManager:v18];

    v19 = [(SiriActivationService *)v2 bulletinManager];
    [v19 setDelegate:v2];

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(SiriActivationService *)v2 setAvExternalButtonEvents:v20];

    [(SiriActivationService *)v2 setButtonDownHasOccurredSinceActivation:0];
    v21 = [[SASMyriadController alloc] initWithDelegate:v2];
    myriadController = v2->_myriadController;
    v2->_myriadController = v21;

    v23 = objc_alloc_init(SASPresentationManager);
    presentationManager = v2->_presentationManager;
    v2->_presentationManager = v23;

    [(SASPresentationManager *)v2->_presentationManager setPresentationManagerDelegate:v2];
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(SiriActivationService *)v2 setButtonEventListeners:v25];

    __int16 v26 = objc_alloc_init(SASBluetoothEndpointUtility);
    bluetoothEndpointUtil = v2->_bluetoothEndpointUtil;
    v2->_bluetoothEndpointUtil = v26;

    uint64_t v28 = [SASActivePresentationInstrumentationSender alloc];
    v29 = [MEMORY[0x1E4F9F9A8] sharedAnalytics];
    v30 = [v29 defaultMessageStream];
    uint64_t v31 = [(SASActivePresentationInstrumentationSender *)v28 initWithAnalyticsStream:v30];
    activationEventInstrumentationSender = v2->_activationEventInstrumentationSender;
    v2->_activationEventInstrumentationSender = (SASActivePresentationInstrumentationSender *)v31;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__SiriActivationService__init__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__SiriActivationService__init__block_invoke_2;
  v3[3] = &unk_1E6B67938;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __30__SiriActivationService__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSiriTetherIsAttached:*(unsigned __int8 *)(a1 + 40)];
}

- (SiriActivationService)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  id v3 = [(SiriActivationService *)self systemState];
  [v3 removeStateChangeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)SiriActivationService;
  [(SiriActivationService *)&v4 dealloc];
}

- (void)_notifySourcesOfPresentationStateChange:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  -[SASActivePresentationInstrumentationSender aggregatePresentationRequestStateDidChange:](self->_activationEventInstrumentationSender, "aggregatePresentationRequestStateDidChange:", [v4 requestState]);
  if ([v4 didNewActivationAcceptanceChange])
  {
    char v5 = (os_log_t *)MEMORY[0x1E4F4E360];
    id v6 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)MEMORY[0x1E4F29060];
      v8 = v6;
      int v9 = [v7 currentThread];
      *(_DWORD *)buf = 136315394;
      v29 = "-[SiriActivationService _notifySourcesOfPresentationStateChange:]";
      __int16 v30 = 2048;
      uint64_t v31 = [v9 qualityOfService];
      _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock about to lock with qos: %zd", buf, 0x16u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&sourcesLock);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[SiriActivationService _notifySourcesOfPresentationStateChange:]";
      _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock successfully locked", buf, 0xCu);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    __int16 v11 = [(SiriActivationService *)self sources];
    v12 = [v11 allValues];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
          uint64_t v18 = [v4 canAcceptNewActivations] ^ 1;
          v19 = [v17 connection];
          id v20 = [v19 remoteTarget];
          v21 = [MEMORY[0x1E4F28ED0] numberWithBool:v18];
          [v20 activeChangedTo:v21];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&sourcesLock);
    v22 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[SiriActivationService _notifySourcesOfPresentationStateChange:]";
      _os_log_impl(&dword_1D9588000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock unlocked", buf, 0xCu);
    }
  }
}

- (void)_notifyListenersOfButtonDownWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = (os_log_t *)MEMORY[0x1E4F4E360];
  v8 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (void *)MEMORY[0x1E4F29060];
    v10 = v8;
    __int16 v11 = [v9 currentThread];
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriActivationService _notifyListenersOfButtonDownWithButtonIdentifier:atTimestamp:]";
    __int16 v18 = 2048;
    uint64_t v19 = [v11 qualityOfService];
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonDownWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", buf, 0xCu);
  }
  uint64_t v13 = [(SiriActivationService *)self buttonEventListeners];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__SiriActivationService__notifyListenersOfButtonDownWithButtonIdentifier_atTimestamp___block_invoke;
  v15[3] = &__block_descriptor_48_e42_v32__0__NSString_8__SASSignalServer_16_B24l;
  *(double *)&v15[4] = a4;
  v15[5] = a3;
  [v13 enumerateKeysAndObjectsUsingBlock:v15];

  os_unfair_lock_unlock(&buttonEventListenerLock);
  uint64_t v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonDownWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", buf, 0xCu);
  }
}

void __86__SiriActivationService__notifyListenersOfButtonDownWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [v5 connection];
  id v7 = [v6 remoteTarget];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:*(double *)(a1 + 32)];
    v10 = [v5 connection];
    __int16 v11 = [v10 remoteTarget];
    v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
    [v11 buttonDownWithButtonIdentifier:v12 forListenerIdentifier:v13 atTimestamp:v9];
  }
}

- (void)_notifyListenersOfButtonUpWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = (os_log_t *)MEMORY[0x1E4F4E360];
  char v8 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (void *)MEMORY[0x1E4F29060];
    v10 = v8;
    __int16 v11 = [v9 currentThread];
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriActivationService _notifyListenersOfButtonUpWithButtonIdentifier:atTimestamp:]";
    __int16 v18 = 2048;
    uint64_t v19 = [v11 qualityOfService];
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonUpWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", buf, 0xCu);
  }
  id v13 = [(SiriActivationService *)self buttonEventListeners];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__SiriActivationService__notifyListenersOfButtonUpWithButtonIdentifier_atTimestamp___block_invoke;
  v15[3] = &__block_descriptor_48_e42_v32__0__NSString_8__SASSignalServer_16_B24l;
  *(double *)&v15[4] = a4;
  v15[5] = a3;
  [v13 enumerateKeysAndObjectsUsingBlock:v15];

  os_unfair_lock_unlock(&buttonEventListenerLock);
  uint64_t v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonUpWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", buf, 0xCu);
  }
}

void __84__SiriActivationService__notifyListenersOfButtonUpWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [v5 connection];
  id v7 = [v6 remoteTarget];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:*(double *)(a1 + 32)];
    v10 = [v5 connection];
    __int16 v11 = [v10 remoteTarget];
    v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
    [v11 buttonUpWithButtonIdentifier:v12 forListenerIdentifier:v13 atTimestamp:v9];
  }
}

- (void)_notifyListenersOfButtonLongPressWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = (os_log_t *)MEMORY[0x1E4F4E360];
  char v8 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (void *)MEMORY[0x1E4F29060];
    v10 = v8;
    __int16 v11 = [v9 currentThread];
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriActivationService _notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:]";
    __int16 v18 = 2048;
    uint64_t v19 = [v11 qualityOfService];
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", buf, 0xCu);
  }
  id v13 = [(SiriActivationService *)self buttonEventListeners];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__SiriActivationService__notifyListenersOfButtonLongPressWithButtonIdentifier_atTimestamp___block_invoke;
  v15[3] = &__block_descriptor_48_e42_v32__0__NSString_8__SASSignalServer_16_B24l;
  *(double *)&v15[4] = a4;
  v15[5] = a3;
  [v13 enumerateKeysAndObjectsUsingBlock:v15];

  os_unfair_lock_unlock(&buttonEventListenerLock);
  uint64_t v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SiriActivationService _notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:]";
    _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", buf, 0xCu);
  }
}

void __91__SiriActivationService__notifyListenersOfButtonLongPressWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [v5 connection];
  id v7 = [v6 remoteTarget];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:*(double *)(a1 + 32)];
    v10 = [v5 connection];
    __int16 v11 = [v10 remoteTarget];
    v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
    [v11 buttonLongPressWithButtonIdentifier:v12 forListenerIdentifier:v13 atTimestamp:v9];
  }
}

- (void)_notifySourcesOfCanActivateFromDirectActionSourceChange:(BOOL)a3
{
  BOOL v24 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x1E4F29060];
    id v7 = v5;
    char v8 = [v6 currentThread];
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[SiriActivationService _notifySourcesOfCanActivateFromDirectActionSourceChange:]";
    __int16 v32 = 2048;
    uint64_t v33 = [v8 qualityOfService];
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sourcesLock);
  int v9 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v31 = "-[SiriActivationService _notifySourcesOfCanActivateFromDirectActionSourceChange:]";
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock successfully locked", buf, 0xCu);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v10 = [(SiriActivationService *)self sources];
  __int16 v11 = [v10 allValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v17 = [v16 connection];
        __int16 v18 = [v17 remoteTarget];
        char v19 = objc_opt_respondsToSelector();

        if (v19)
        {
          uint64_t v20 = [v16 connection];
          v21 = [v20 remoteTarget];
          v22 = [MEMORY[0x1E4F28ED0] numberWithBool:v24];
          [v21 canActivateChangedTo:v22];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sourcesLock);
  long long v23 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v31 = "-[SiriActivationService _notifySourcesOfCanActivateFromDirectActionSourceChange:]";
    _os_log_impl(&dword_1D9588000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock unlocked", buf, 0xCu);
  }
}

- (void)registerSiriPresentation:(id)a3 withIdentifier:(int64_t)a4
{
}

- (void)unregisterSiriPresentationIdentifier:(int64_t)a3
{
}

- (void)siriPresentationDisplayedWithIdentifier:(int64_t)a3
{
}

- (void)siriPresentationWillDismissWithIdentifier:(int64_t)a3
{
}

- (void)siriPresentationDismissedWithIdentifier:(int64_t)a3
{
  didDismissForAssesmentModeStartedCompeltion = (void (**)(id, uint64_t))self->_didDismissForAssesmentModeStartedCompeltion;
  if (didDismissForAssesmentModeStartedCompeltion)
  {
    didDismissForAssesmentModeStartedCompeltion[2](didDismissForAssesmentModeStartedCompeltion, 1);
    id v6 = self->_didDismissForAssesmentModeStartedCompeltion;
    self->_didDismissForAssesmentModeStartedCompeltion = 0;
  }
  presentationManager = self->_presentationManager;
  [(SASPresentationManager *)presentationManager presentationWithPresentationIdentifierBecameOff:a3];
}

- (void)siriPresentationFailureWithIdentifier:(int64_t)a3 error:(id)a4
{
}

- (void)siriPresentationDidUpdateState:(id)a3
{
}

- (void)unregisterActivationSourceIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)MEMORY[0x1E4F29060];
    char v8 = v6;
    int v9 = [v7 currentThread];
    int v18 = 136315394;
    char v19 = "-[SiriActivationService unregisterActivationSourceIdentifier:]";
    __int16 v20 = 2048;
    uint64_t v21 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock about to lock with qos: %zd", (uint8_t *)&v18, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sourcesLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    char v19 = "-[SiriActivationService unregisterActivationSourceIdentifier:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock successfully locked", (uint8_t *)&v18, 0xCu);
  }
  __int16 v11 = [(SiriActivationService *)self sources];
  uint64_t v12 = [v11 allKeys];
  char v13 = [v12 containsObject:v4];

  uint64_t v14 = *v5;
  uint64_t v15 = *v5;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      char v19 = "-[SiriActivationService unregisterActivationSourceIdentifier:]";
      __int16 v20 = 2112;
      uint64_t v21 = (uint64_t)v4;
      _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation Unregistering '%@'", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v16 = [(SiriActivationService *)self sources];
    [v16 removeObjectForKey:v4];
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[SiriActivationService unregisterActivationSourceIdentifier:]();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sourcesLock);
  v17 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    char v19 = "-[SiriActivationService unregisterActivationSourceIdentifier:]";
    _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy sourcesLock unlocked", (uint8_t *)&v18, 0xCu);
  }
}

- (void)registerActivationAssertion:(id)a3 withIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  int v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E4F29060];
    __int16 v11 = v9;
    uint64_t v12 = [v10 currentThread];
    int v21 = 136315394;
    uint64_t v22 = "-[SiriActivationService registerActivationAssertion:withIdentifier:]";
    __int16 v23 = 2048;
    uint64_t v24 = [v12 qualityOfService];
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", (uint8_t *)&v21, 0x16u);
  }
  os_unfair_lock_lock(&assertionLock);
  char v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    uint64_t v22 = "-[SiriActivationService registerActivationAssertion:withIdentifier:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v14 = [(SiriActivationService *)self activationAssertions];
  uint64_t v15 = [v14 allKeys];
  int v16 = [v15 containsObject:v7];

  if (v16)
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[SiriActivationService registerActivationAssertion:withIdentifier:]();
    }
    v17 = [(SiriActivationService *)self activationAssertions];
    [v17 removeObjectForKey:v7];
  }
  int v18 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    uint64_t v22 = "-[SiriActivationService registerActivationAssertion:withIdentifier:]";
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v7;
    _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation Registering assertion with Id -  '%@'", (uint8_t *)&v21, 0x16u);
  }
  char v19 = [(SiriActivationService *)self activationAssertions];
  [v19 setObject:v6 forKey:v7];

  os_unfair_lock_unlock(&assertionLock);
  __int16 v20 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    uint64_t v22 = "-[SiriActivationService registerActivationAssertion:withIdentifier:]";
    _os_log_impl(&dword_1D9588000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", (uint8_t *)&v21, 0xCu);
  }
}

- (void)unregisterActivationAssertionWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)MEMORY[0x1E4F29060];
    char v8 = v6;
    int v9 = [v7 currentThread];
    int v18 = 136315394;
    char v19 = "-[SiriActivationService unregisterActivationAssertionWithIdentifier:]";
    __int16 v20 = 2048;
    uint64_t v21 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", (uint8_t *)&v18, 0x16u);
  }
  os_unfair_lock_lock(&assertionLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    char v19 = "-[SiriActivationService unregisterActivationAssertionWithIdentifier:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", (uint8_t *)&v18, 0xCu);
  }
  __int16 v11 = [(SiriActivationService *)self activationAssertions];
  uint64_t v12 = [v11 allKeys];
  char v13 = [v12 containsObject:v4];

  uint64_t v14 = *v5;
  uint64_t v15 = *v5;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      char v19 = "-[SiriActivationService unregisterActivationAssertionWithIdentifier:]";
      __int16 v20 = 2112;
      uint64_t v21 = (uint64_t)v4;
      _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation Unregistering assertion %@'", (uint8_t *)&v18, 0x16u);
    }
    int v16 = [(SiriActivationService *)self activationAssertions];
    [v16 removeObjectForKey:v4];
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[SiriActivationService unregisterActivationAssertionWithIdentifier:]();
  }
  os_unfair_lock_unlock(&assertionLock);
  v17 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    char v19 = "-[SiriActivationService unregisterActivationAssertionWithIdentifier:]";
    _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", (uint8_t *)&v18, 0xCu);
  }
}

- (void)registerButtonEventListenerServer:(id)a3 identifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  int v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E4F29060];
    __int16 v11 = v9;
    uint64_t v12 = [v10 currentThread];
    int v21 = 136315394;
    uint64_t v22 = "-[SiriActivationService registerButtonEventListenerServer:identifier:]";
    __int16 v23 = 2048;
    uint64_t v24 = [v12 qualityOfService];
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", (uint8_t *)&v21, 0x16u);
  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  char v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    uint64_t v22 = "-[SiriActivationService registerButtonEventListenerServer:identifier:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v14 = [(SiriActivationService *)self buttonEventListeners];
  uint64_t v15 = [v14 allKeys];
  int v16 = [v15 containsObject:v7];

  if (v16)
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[SiriActivationService registerButtonEventListenerServer:identifier:]();
    }
    v17 = [(SiriActivationService *)self buttonEventListeners];
    [v17 removeObjectForKey:v7];
  }
  int v18 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    uint64_t v22 = "-[SiriActivationService registerButtonEventListenerServer:identifier:]";
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v7;
    _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation Registering listener with Id -  '%@'", (uint8_t *)&v21, 0x16u);
  }
  char v19 = [(SiriActivationService *)self buttonEventListeners];
  [v19 setObject:v6 forKey:v7];

  os_unfair_lock_unlock(&buttonEventListenerLock);
  __int16 v20 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    uint64_t v22 = "-[SiriActivationService registerButtonEventListenerServer:identifier:]";
    _os_log_impl(&dword_1D9588000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", (uint8_t *)&v21, 0xCu);
  }
}

- (void)unregisterButtonEventListenerWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)MEMORY[0x1E4F29060];
    char v8 = v6;
    int v9 = [v7 currentThread];
    int v18 = 136315394;
    char v19 = "-[SiriActivationService unregisterButtonEventListenerWithIdentifier:]";
    __int16 v20 = 2048;
    uint64_t v21 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock about to lock with qos: %zd", (uint8_t *)&v18, 0x16u);
  }
  os_unfair_lock_lock(&buttonEventListenerLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    char v19 = "-[SiriActivationService unregisterButtonEventListenerWithIdentifier:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock successfully locked", (uint8_t *)&v18, 0xCu);
  }
  __int16 v11 = [(SiriActivationService *)self buttonEventListeners];
  uint64_t v12 = [v11 allKeys];
  char v13 = [v12 containsObject:v4];

  uint64_t v14 = *v5;
  uint64_t v15 = *v5;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      char v19 = "-[SiriActivationService unregisterButtonEventListenerWithIdentifier:]";
      __int16 v20 = 2112;
      uint64_t v21 = (uint64_t)v4;
      _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation Unregistering listener %@'", (uint8_t *)&v18, 0x16u);
    }
    int v16 = [(SiriActivationService *)self buttonEventListeners];
    [v16 removeObjectForKey:v4];
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[SiriActivationService unregisterButtonEventListenerWithIdentifier:]();
  }
  os_unfair_lock_unlock(&buttonEventListenerLock);
  v17 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    char v19 = "-[SiriActivationService unregisterButtonEventListenerWithIdentifier:]";
    _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy buttonEventListenerLock unlocked", (uint8_t *)&v18, 0xCu);
  }
}

- (BOOL)presentationsAreIdleAndQuiet
{
  return [(SASPresentationManager *)self->_presentationManager activePresentationsAreIdleAndQuiet];
}

- (BOOL)isConnectedTo188
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F50B70], "sharedInstance", 0);
  id v3 = [v2 connectedDevices];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 productId] == 8194 && objc_msgSend(v7, "vendorId") == 76)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_B188ActivationEvent:(int64_t)a3 context:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SiriActivationService__B188ActivationEvent_context_options___block_invoke;
  v13[3] = &unk_1E6B679D0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v10 = v9;
  id v11 = v8;
  long long v12 = self;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __62__SiriActivationService__B188ActivationEvent_context_options___block_invoke(uint64_t a1)
{
  v2 = *(id **)(a1 + 32);
  id v3 = v2[5];
  if (v3)
  {
    int v4 = [v3 isValid];
    v2 = *(id **)(a1 + 32);
    if (v4)
    {
      [v2[5] invalidate];
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = 0;

      v2 = *(id **)(a1 + 32);
    }
  }
  objc_initWeak(&location, v2);
  id v7 = (void *)MEMORY[0x1E4F1CB00];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SiriActivationService__B188ActivationEvent_context_options___block_invoke_2;
  v11[3] = &unk_1E6B679A8;
  objc_copyWeak(v14, &location);
  v14[1] = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v11 block:0.1];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __62__SiriActivationService__B188ActivationEvent_context_options___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = [WeakRetained presentationsAreIdleAndQuiet];

  uint64_t v5 = (void *)*MEMORY[0x1E4F4E360];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = v5;
      id v8 = objc_loadWeakRetained(v2);
      uint64_t v9 = SASRequestStateGetName([v8 _requestState]);
      int v16 = 136315394;
      v17 = "-[SiriActivationService _B188ActivationEvent:context:options:]_block_invoke_2";
      __int16 v18 = 2112;
      char v19 = v9;
      _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation B188ActivationEvent with Siri state %@. Activating.", (uint8_t *)&v16, 0x16u);
    }
    id v10 = [[SASActivationRequest alloc] initWithButtonIdentifier:*(void *)(a1 + 56) context:*(void *)(a1 + 32)];
    id v11 = (SiriDismissalOptions *)objc_loadWeakRetained(v2);
    [(SiriDismissalOptions *)v11 handleActivationRequest:v10];
    goto LABEL_10;
  }
  if (v6)
  {
    id v12 = v5;
    id v13 = objc_loadWeakRetained(v2);
    id v14 = SASRequestStateGetName([v13 _requestState]);
    int v16 = 136315394;
    v17 = "-[SiriActivationService _B188ActivationEvent:context:options:]_block_invoke";
    __int16 v18 = 2112;
    char v19 = v14;
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation B188ActivationEvent with Siri state %@. Deactivating.", (uint8_t *)&v16, 0x16u);
  }
  id v15 = (SASActivationRequest *)objc_loadWeakRetained(v2);
  id v10 = v15;
  if (!*(void *)(a1 + 40))
  {
    id v11 = [[SiriDismissalOptions alloc] initWithDeactivationOptions:0];
    [(SASActivationRequest *)v10 dismissSiriWithOptions:v11];
LABEL_10:

    goto LABEL_11;
  }
  -[SASActivationRequest dismissSiriWithOptions:](v15, "dismissSiriWithOptions:");
LABEL_11:
}

- (void)activationRequestFromButtonIdentifier:(int64_t)a3 context:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 == 3)
  {
    if ([(SiriActivationService *)self isConnectedTo188])
    {
      [(SiriActivationService *)self _B188ActivationEvent:3 context:v6 options:0];
      goto LABEL_18;
    }
    if ([(SiriActivationService *)self _requestState] == 3)
    {
      id v7 = (void *)*MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v7;
        uint64_t v9 = SASRequestStateGetName([(SiriActivationService *)self _requestState]);
        int v21 = 136315650;
        uint64_t v22 = "-[SiriActivationService activationRequestFromButtonIdentifier:context:]";
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        long long v26 = v9;
        _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation SiriButtonIdentifierLongPressBTHeadset, context %@, but Siri state is %@. Treating as button long press.", (uint8_t *)&v21, 0x20u);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v6 address];
      }
      else
      {
        id v10 = 0;
      }
      v17 = [SiriLongPressButtonContext alloc];
      __int16 v18 = [v6 contextOverride];
      char v19 = [(SiriContext *)v17 initWithContextOverride:v18];

      uint64_t v20 = [MEMORY[0x1E4F28F80] processInfo];
      [v20 systemUptime];
      -[SiriLongPressButtonContext setButtonDownTimestamp:](v19, "setButtonDownTimestamp:");

      [(SiriActivationService *)self buttonLongPressFromButtonIdentifier:3 deviceIdentifier:v10 context:v19];
LABEL_17:

      goto LABEL_18;
    }
  }
  int64_t v11 = [(SiriActivationService *)self _requestState];
  id v12 = (void *)*MEMORY[0x1E4F4E360];
  if (v11 != 3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = NSString;
      id v14 = v12;
      id v15 = [v13 stringWithSiriButtonIdentifier:a3];
      int v16 = SASRequestStateGetName([(SiriActivationService *)self _requestState]);
      int v21 = 136315650;
      uint64_t v22 = "-[SiriActivationService activationRequestFromButtonIdentifier:context:]";
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 2112;
      long long v26 = v16;
      _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s activationRequestFromButtonIdentifier:%@, with Siri state %@. Activating.", (uint8_t *)&v21, 0x20u);
    }
    [(SiriActivationService *)self setButtonDownHasOccurredSinceActivation:0];
    id v10 = [[SASActivationRequest alloc] initWithButtonIdentifier:a3 context:v6];
    [(SiriActivationService *)self handleActivationRequest:v10];
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    -[SiriActivationService activationRequestFromButtonIdentifier:context:](v12, a3, self);
  }
LABEL_18:
}

- (void)deactivationRequestFromButtonIdentifier:(int64_t)a3 context:(id)a4 options:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3 == 3 && [(SiriActivationService *)self isConnectedTo188])
  {
    [(SiriActivationService *)self _B188ActivationEvent:3 context:v8 options:v9];
  }
  else
  {
    id v10 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = NSString;
      id v12 = v10;
      id v13 = [v11 stringWithSiriButtonIdentifier:a3];
      id v14 = SASRequestStateGetName([(SiriActivationService *)self _requestState]);
      int v15 = 136315650;
      int v16 = "-[SiriActivationService deactivationRequestFromButtonIdentifier:context:options:]";
      __int16 v17 = 2112;
      __int16 v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s deactivationRequestFromButtonIdentifier:%@, with Siri state %@. Deactivating.", (uint8_t *)&v15, 0x20u);
    }
    [(SiriActivationService *)self dismissSiriWithOptions:v9];
  }
}

- (BOOL)_shouldRejectActivationWithButtonIdentifier:(int64_t)a3 activationAssertions:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 - 1;
  uint64_t v5 = [a4 count];
  id v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    id v10 = "-[SiriActivationService _shouldRejectActivationWithButtonIdentifier:activationAssertions:]";
    __int16 v11 = 1024;
    BOOL v12 = v4 < 2;
    __int16 v13 = 1024;
    BOOL v14 = v5 != 0;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s  #activation _shouldRejectActivationWithButtonIdentifier - isBlockableButton:%d assertionsAvailable :%d", (uint8_t *)&v9, 0x18u);
  }
  return v4 < 2 && v5 != 0;
}

- (void)prewarmFromButtonIdentifier:(int64_t)a3 longPressInterval:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSString;
    int v9 = v7;
    id v10 = [v8 stringWithSiriButtonIdentifier:a3];
    __int16 v11 = SASRequestStateGetName([(SiriActivationService *)self _requestState]);
    *(_DWORD *)buf = 136315906;
    __int16 v23 = "-[SiriActivationService prewarmFromButtonIdentifier:longPressInterval:]";
    __int16 v24 = 2112;
    __int16 v25 = v10;
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    __int16 v28 = 2048;
    double v29 = a4;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation %@ button prewarm request, current request state: %@, longPressInterval: %f", buf, 0x2Au);
  }
  BOOL v12 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v13 = [v12 assistantIsEnabled];

  if (v13)
  {
    BOOL v14 = objc_msgSend(NSString, "stringWithSiriActivationEventType:", 0, @"activationEvent");
    v21[0] = v14;
    v20[1] = @"eventSource";
    uint64_t v15 = [NSString stringWithSiriButtonIdentifier:a3];
    v21[1] = v15;
    v20[2] = @"interval";
    int v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
    v21[2] = v16;
    __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

    __int16 v18 = +[SASAnalytics analytics];
    [v18 enqueueCurrentAnalyticsEventWithType:1402 context:v17];

    [(SiriActivationService *)self _defrost];
    __int16 v19 = [(SiriActivationService *)self heater];
    [v19 prepareForUseAfterTimeInterval:a4];
  }
}

- (void)setHintGlowAssertionFromButtonIdentifier:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [[SASActivationRequest alloc] initWithButtonIdentifier:a3 context:v6];
  if ([(SiriActivationService *)self _shouldShowHintGlowWithRequest:v7])
  {
    int64_t v8 = [(SASPresentationManager *)self->_presentationManager nextPresentationToActivate];
    if (a3 == 2 && v8 == 1)
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__SiriActivationService_setHintGlowAssertionFromButtonIdentifier_context___block_invoke;
      v9[3] = &unk_1E6B675D8;
      objc_copyWeak(&v10, &location);
      SiriInvokeOnMainQueue(v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __74__SiriActivationService_setHintGlowAssertionFromButtonIdentifier_context___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = WeakRetained[24];
      int v4 = 136315394;
      uint64_t v5 = "-[SiriActivationService setHintGlowAssertionFromButtonIdentifier:context:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v3;
      _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s SiriActivationService request hint glow for next presentation, presentationManager: %@", (uint8_t *)&v4, 0x16u);
    }
    [WeakRetained[24] requestHintGlowForNextPresentation];
  }
}

- (BOOL)_shouldShowHintGlowWithRequest:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F4E638] isSAEEnabled]) {
    BOOL v5 = [(SiriActivationService *)self _canActivateForRequest:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isSAEEnabled
{
  return [MEMORY[0x1E4F4E638] isSAEEnabled];
}

- (BOOL)_canActivateForRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  [v5 setRequest:v4];

  [v5 setButtonTriggerStateActive:0];
  __int16 v6 = [(SiriActivationService *)self systemState];
  [v5 setSystemState:v6];

  id v7 = +[SASSiriPocketStateManager sharedManager];
  [v5 setPocketStateManager:v7];

  uint64_t v8 = [(SiriActivationService *)self afPreferences];
  [v5 setPreferences:v8];

  objc_msgSend(v5, "setRequestState:", -[SiriActivationService _requestState](self, "_requestState"));
  int v9 = [(SiriActivationService *)self assetUtilities];
  [v5 setAssetUtilities:v9];

  objc_msgSend(v5, "setPresentationIdentifier:", -[SASPresentationManager nextPresentationToActivate](self->_presentationManager, "nextPresentationToActivate"));
  LOBYTE(self) = +[SASActivationDecision canActivateForCondition:v5];

  return (char)self;
}

- (BOOL)_eyesFreeRedesignOnlySteeringWheelEnabled
{
  return _os_feature_enabled_impl();
}

- (void)_defrost
{
  kdebug_trace();
  [(SiriActivationService *)self _attachToTether];
}

- (void)cancelPrewarmFromButtonIdentifier:(int64_t)a3
{
  [(SASHeater *)self->_heater cancelPreparationForButtonIdentifier:a3];
  presentationManager = self->_presentationManager;
  [(SASPresentationManager *)presentationManager cancelAllPreheatedPresentations];
}

- (void)buttonDownFromButtonIdentifier:(int64_t)a3 timestamp:(double)a4 context:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v9 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v10 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = NSString;
    BOOL v12 = v10;
    int v13 = [v11 stringWithSiriButtonIdentifier:a3];
    *(_DWORD *)buf = 136315394;
    uint64_t v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
    __int16 v35 = 2112;
    uint64_t v36 = (uint64_t)v13;
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation buttonDownFromButtonIdentifier:%@", buf, 0x16u);
  }
  if ([(SiriActivationService *)self _requestState] == 4)
  {
    BOOL v14 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
      _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation button down used while stopping. Ignoring.", buf, 0xCu);
    }
  }
  else
  {
    [(SiriActivationService *)self _notifyListenersOfButtonDownWithButtonIdentifier:a3 atTimestamp:a4];
    os_log_t v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = (void *)MEMORY[0x1E4F29060];
      __int16 v17 = v15;
      __int16 v18 = [v16 currentThread];
      uint64_t v19 = [v18 qualityOfService];
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
      __int16 v35 = 2048;
      uint64_t v36 = v19;
      _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", buf, 0x16u);
    }
    os_unfair_lock_lock(&assertionLock);
    uint64_t v20 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
      _os_log_impl(&dword_1D9588000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", buf, 0xCu);
    }
    BOOL v21 = [(SiriActivationService *)self _shouldRejectActivationWithButtonIdentifier:a3 activationAssertions:self->_activationAssertions];
    os_unfair_lock_unlock(&assertionLock);
    uint64_t v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
      _os_log_impl(&dword_1D9588000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", buf, 0xCu);
    }
    if (v21)
    {
      os_log_t v23 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = NSString;
        __int16 v25 = v23;
        __int16 v26 = [v24 stringWithSiriButtonIdentifier:a3];
        activationAssertions = self->_activationAssertions;
        *(_DWORD *)buf = 136315650;
        uint64_t v34 = "-[SiriActivationService buttonDownFromButtonIdentifier:timestamp:context:]";
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v26;
        __int16 v37 = 2112;
        id v38 = activationAssertions;
        _os_log_impl(&dword_1D9588000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation Rejecting Button Down as we have valid activation assertions. ButtonIdentifier - %@ Activation assertions - %@", buf, 0x20u);
      }
    }
    else
    {
      [(SiriActivationService *)self setButtonDownHasOccurredSinceActivation:1];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__SiriActivationService_buttonDownFromButtonIdentifier_timestamp_context___block_invoke;
      aBlock[3] = &unk_1E6B679F8;
      int64_t v31 = a3;
      double v32 = a4;
      id v30 = v8;
      __int16 v28 = _Block_copy(aBlock);
      [(SASPresentationManager *)self->_presentationManager sendButtonEventCompletionToPresentations:v28 forButtonEventType:1];
      [(SiriActivationService *)self _recordTimeIfNeededForButtonIdentifier:a3 buttonDownTimestamp:a4];
    }
  }
}

void __74__SiriActivationService_buttonDownFromButtonIdentifier_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 connection];
  id v3 = [v6 remoteTarget];
  id v4 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:*(void *)(a1 + 40)];
  BOOL v5 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:*(double *)(a1 + 48)];
  [v3 handleButtonDownFromButtonIdentifier:v4 timestamp:v5 context:*(void *)(a1 + 32)];
}

- (void)buttonUpFromButtonIdentifier:(int64_t)a3 deviceIdentifier:(id)a4 timestamp:(double)a5 context:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = (os_log_t *)MEMORY[0x1E4F4E360];
  int v13 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = NSString;
    os_log_t v15 = v13;
    int v16 = [v14 stringWithSiriButtonIdentifier:a3];
    *(_DWORD *)buf = 136315394;
    objc_super v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    __int16 v41 = 2112;
    uint64_t v42 = (uint64_t)v16;
    _os_log_impl(&dword_1D9588000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation buttonUpFromButtonIdentifier:%@", buf, 0x16u);
  }
  [(SiriActivationService *)self _notifyListenersOfButtonUpWithButtonIdentifier:a3 atTimestamp:a5];
  os_log_t v17 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = (void *)MEMORY[0x1E4F29060];
    uint64_t v19 = v17;
    uint64_t v20 = [v18 currentThread];
    uint64_t v21 = [v20 qualityOfService];
    *(_DWORD *)buf = 136315394;
    objc_super v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    __int16 v41 = 2048;
    uint64_t v42 = v21;
    _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&assertionLock);
  uint64_t v22 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    _os_log_impl(&dword_1D9588000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", buf, 0xCu);
  }
  BOOL v23 = [(SiriActivationService *)self _shouldRejectActivationWithButtonIdentifier:a3 activationAssertions:self->_activationAssertions];
  os_unfair_lock_unlock(&assertionLock);
  __int16 v24 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    _os_log_impl(&dword_1D9588000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", buf, 0xCu);
  }
  if (v23)
  {
    os_log_t v25 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = NSString;
      uint64_t v27 = v25;
      __int16 v28 = [v26 stringWithSiriButtonIdentifier:a3];
      activationAssertions = self->_activationAssertions;
      *(_DWORD *)buf = 136315650;
      objc_super v40 = "-[SiriActivationService buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v28;
      __int16 v43 = 2112;
      v44 = activationAssertions;
      _os_log_impl(&dword_1D9588000, v27, OS_LOG_TYPE_DEFAULT, "%s #activation Rejecting Button Up as we have valid activation assertions. ButtonIdentifier - %@ Activation assertions - %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    uint64_t v33 = __89__SiriActivationService_buttonUpFromButtonIdentifier_deviceIdentifier_timestamp_context___block_invoke;
    uint64_t v34 = &unk_1E6B67A20;
    int64_t v37 = a3;
    id v35 = v10;
    double v38 = a5;
    id v36 = v11;
    id v30 = _Block_copy(&v31);
    -[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:](self->_presentationManager, "sendButtonEventCompletionToPresentations:forButtonEventType:", v30, 2, v31, v32, v33, v34);
    [(SiriActivationService *)self _handleTapSynthesisIfNeededForButtonIdentifier:a3 buttonUpTimestamp:a5];
  }
}

void __89__SiriActivationService_buttonUpFromButtonIdentifier_deviceIdentifier_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 connection];
  id v3 = [v7 remoteTarget];
  id v4 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:*(double *)(a1 + 56)];
  [v3 handleButtonUpFromButtonIdentifier:v4 deviceIdentifier:v5 timestamp:v6 context:*(void *)(a1 + 40)];
}

- (void)buttonTapFromButtonIdentifier:(int64_t)a3 timestamp:(double)a4 context:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v9 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v10 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSString;
    BOOL v12 = v10;
    int v13 = [v11 stringWithSiriButtonIdentifier:a3];
    *(_DWORD *)buf = 136315394;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    __int16 v53 = 2112;
    uint64_t v54 = (uint64_t)v13;
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation buttonTapFromButtonIdentifier:%@", buf, 0x16u);
  }
  os_log_t v14 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v15 = (void *)MEMORY[0x1E4F29060];
    int v16 = v14;
    os_log_t v17 = [v15 currentThread];
    uint64_t v18 = [v17 qualityOfService];
    *(_DWORD *)buf = 136315394;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    __int16 v53 = 2048;
    uint64_t v54 = v18;
    _os_log_impl(&dword_1D9588000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&assertionLock);
  uint64_t v19 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", buf, 0xCu);
  }
  BOOL v20 = [(SiriActivationService *)self _shouldRejectActivationWithButtonIdentifier:a3 activationAssertions:self->_activationAssertions];
  os_unfair_lock_unlock(&assertionLock);
  uint64_t v21 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    _os_log_impl(&dword_1D9588000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", buf, 0xCu);
  }
  if (!v20)
  {
    if ([(SiriActivationService *)self _requestState] == 3)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __73__SiriActivationService_buttonTapFromButtonIdentifier_timestamp_context___block_invoke;
      aBlock[3] = &unk_1E6B679F8;
      int64_t v49 = a3;
      double v50 = a4;
      id v48 = v8;
      uint64_t v27 = _Block_copy(aBlock);
      [(SASPresentationManager *)self->_presentationManager sendButtonEventCompletionToPresentations:v27 forButtonEventType:3];

LABEL_31:
      [(SiriActivationService *)self _cancelPendingActivationEventWithReason:3];
      goto LABEL_32;
    }
    BOOL v28 = [(SiriActivationService *)self _buttonIsTVMicrophoneButton:a3];
    os_log_t v29 = *v9;
    BOOL v30 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v30)
      {
        uint64_t v31 = v29;
        uint64_t v32 = SASRequestStateGetName([(SiriActivationService *)self _requestState]);
        *(_DWORD *)buf = 136315394;
        v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
        __int16 v53 = 2112;
        uint64_t v54 = (uint64_t)v32;
        _os_log_impl(&dword_1D9588000, v31, OS_LOG_TYPE_DEFAULT, "%s #activation activating due to TV remote microphone button short tap with Siri state %@", buf, 0x16u);
      }
      if ([MEMORY[0x1E4F4E488] isTVPushToTalkEnabled]
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v33 = v8;
      }
      else
      {
        uint64_t v33 = 0;
      }
      if ([v33 isPTTEligible])
      {
        [(SiriActivationService *)self activationRequestFromButtonIdentifier:a3 context:v33];
      }
      else
      {
        int64_t v37 = objc_alloc_init(SiriShortPressButtonContext);
        [(SiriActivationService *)self activationRequestFromButtonIdentifier:a3 context:v37];
      }
      if ([v33 isPTTEligible])
      {
        double v38 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
          _os_log_impl(&dword_1D9588000, v38, OS_LOG_TYPE_DEFAULT, "%s #activation PTT Eligible Remote, Sending handleButtonTap", buf, 0xCu);
        }
        uint64_t v40 = MEMORY[0x1E4F143A8];
        uint64_t v41 = 3221225472;
        uint64_t v42 = __73__SiriActivationService_buttonTapFromButtonIdentifier_timestamp_context___block_invoke_132;
        __int16 v43 = &unk_1E6B679F8;
        int64_t v45 = a3;
        double v46 = a4;
        id v44 = v8;
        uint64_t v39 = _Block_copy(&v40);
        -[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:](self->_presentationManager, "sendButtonEventCompletionToPresentations:forButtonEventType:", v39, 3, v40, v41, v42, v43);
      }
    }
    else
    {
      if (!v30) {
        goto LABEL_31;
      }
      uint64_t v34 = NSString;
      uint64_t v33 = v29;
      id v35 = [v34 stringWithSiriButtonIdentifier:a3];
      SASRequestStateGetName([(SiriActivationService *)self _requestState]);
      id v36 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
      __int16 v53 = 2112;
      uint64_t v54 = (uint64_t)v35;
      __int16 v55 = 2112;
      v56 = v36;
      _os_log_impl(&dword_1D9588000, v33, OS_LOG_TYPE_DEFAULT, "%s buttonTapFromButtonIdentifier:%@, with Siri state %@. Ignoring.", buf, 0x20u);
    }
    goto LABEL_31;
  }
  os_log_t v22 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v23 = NSString;
    __int16 v24 = v22;
    os_log_t v25 = [v23 stringWithSiriButtonIdentifier:a3];
    activationAssertions = self->_activationAssertions;
    *(_DWORD *)buf = 136315650;
    v52 = "-[SiriActivationService buttonTapFromButtonIdentifier:timestamp:context:]";
    __int16 v53 = 2112;
    uint64_t v54 = (uint64_t)v25;
    __int16 v55 = 2112;
    v56 = activationAssertions;
    _os_log_impl(&dword_1D9588000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation Rejecting Button Tap as we have valid activation assertions. ButtonIdentifier - %@ Activation assertions - %@", buf, 0x20u);
  }
LABEL_32:
}

void __73__SiriActivationService_buttonTapFromButtonIdentifier_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 connection];
  id v3 = [v6 remoteTarget];
  id v4 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:*(void *)(a1 + 40)];
  uint64_t v5 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:*(double *)(a1 + 48)];
  [v3 handleButtonTapFromButtonIdentifier:v4 timestamp:v5 context:*(void *)(a1 + 32)];
}

void __73__SiriActivationService_buttonTapFromButtonIdentifier_timestamp_context___block_invoke_132(uint64_t a1, void *a2)
{
  id v6 = [a2 connection];
  id v3 = [v6 remoteTarget];
  id v4 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:*(void *)(a1 + 40)];
  uint64_t v5 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:*(double *)(a1 + 48)];
  [v3 handleButtonTapFromButtonIdentifier:v4 timestamp:v5 context:*(void *)(a1 + 32)];
}

- (void)buttonLongPressFromButtonIdentifier:(int64_t)a3 context:(id)a4
{
}

- (void)buttonLongPressFromButtonIdentifier:(int64_t)a3 deviceIdentifier:(id)a4 context:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v9 = (NSMutableDictionary *)a5;
  id v10 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v11 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = NSString;
    int v13 = v11;
    os_log_t v14 = [v12 stringWithSiriButtonIdentifier:a3];
    *(_DWORD *)buf = 136315394;
    uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
    __int16 v58 = 2112;
    uint64_t v59 = (uint64_t)v14;
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation buttonLongPressFromButtonIdentifier:%@", buf, 0x16u);
  }
  [(NSMutableDictionary *)v9 buttonDownTimestamp];
  -[SiriActivationService _notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:](self, "_notifyListenersOfButtonLongPressWithButtonIdentifier:atTimestamp:", a3);
  os_log_t v15 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = (void *)MEMORY[0x1E4F29060];
    os_log_t v17 = v15;
    uint64_t v18 = [v16 currentThread];
    uint64_t v19 = [v18 qualityOfService];
    *(_DWORD *)buf = 136315394;
    uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
    __int16 v58 = 2048;
    uint64_t v59 = v19;
    _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&assertionLock);
  BOOL v20 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
    _os_log_impl(&dword_1D9588000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock successfully locked", buf, 0xCu);
  }
  BOOL v21 = [(SiriActivationService *)self _shouldRejectActivationWithButtonIdentifier:a3 activationAssertions:self->_activationAssertions];
  os_unfair_lock_unlock(&assertionLock);
  os_log_t v22 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
    _os_log_impl(&dword_1D9588000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy assertionLock unlocked", buf, 0xCu);
  }
  if (v21)
  {
    os_log_t v23 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = NSString;
      os_log_t v25 = v23;
      __int16 v26 = [v24 stringWithSiriButtonIdentifier:a3];
      activationAssertions = self->_activationAssertions;
      *(_DWORD *)buf = 136315650;
      uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)v26;
      __int16 v60 = 2112;
      v61 = activationAssertions;
      _os_log_impl(&dword_1D9588000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation Rejecting Button Long Press as we have valid activation assertions. ButtonIdentifier - %@ Activation assertions - %@", buf, 0x20u);
LABEL_12:
    }
  }
  else
  {
    if ([(SiriActivationService *)self _shouldRejectNewActivations:[(SiriActivationService *)self _requestState]])
    {
      if ([(SiriActivationService *)self _requestState] == 2
        || [(SiriActivationService *)self _requestState] == 4)
      {
        os_log_t v28 = *v10;
        if (!os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        os_log_t v29 = NSString;
        os_log_t v25 = v28;
        __int16 v26 = [v29 stringWithSiriButtonIdentifier:a3];
        SASRequestStateGetName([(SiriActivationService *)self _requestState]);
        BOOL v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)v26;
        __int16 v60 = 2112;
        v61 = v9;
        __int16 v62 = 2112;
        v63 = v30;
        _os_log_error_impl(&dword_1D9588000, v25, OS_LOG_TYPE_ERROR, "%s #activation buttonLongPressFromButtonIdentifier:%@, context %@, but Siri state is %@. Ignoring.", buf, 0x2Au);
      }
      else
      {
        if ([(SiriActivationService *)self _requestState] == 3)
        {
          BOOL v36 = [(SiriActivationService *)self _buttonIsAVExternalButton:a3];
          os_log_t v37 = *v10;
          BOOL v38 = os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT);
          if (!v36)
          {
            if (v38)
            {
              __int16 v43 = NSString;
              id v44 = v37;
              int64_t v45 = [v43 stringWithSiriButtonIdentifier:a3];
              SASRequestStateGetName([(SiriActivationService *)self _requestState]);
              double v46 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
              __int16 v58 = 2112;
              uint64_t v59 = (uint64_t)v45;
              __int16 v60 = 2112;
              v61 = v9;
              __int16 v62 = 2112;
              v63 = v46;
              _os_log_impl(&dword_1D9588000, v44, OS_LOG_TYPE_DEFAULT, "%s #activation buttonLongPressFromButtonIdentifier:%@, context %@, but Siri state is %@. Passing to the Presentation Shell.", buf, 0x2Au);
            }
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __86__SiriActivationService_buttonLongPressFromButtonIdentifier_deviceIdentifier_context___block_invoke;
            aBlock[3] = &unk_1E6B67A48;
            v47 = v9;
            __int16 v53 = v47;
            id v54 = v8;
            int64_t v55 = a3;
            id v48 = _Block_copy(aBlock);
            int64_t v49 = +[SASSystemState sharedSystemState];
            int v50 = [v49 isATV];

            if (v50)
            {
              v51 = [[SASActivationRequest alloc] initWithButtonIdentifier:a3 context:v47];
              [(SASMyriadController *)self->_myriadController activateForRequest:v51 visible:[(SiriActivationService *)self _requestState] == 3];
            }
            [(SASPresentationManager *)self->_presentationManager sendButtonEventCompletionToPresentations:v48 forButtonEventType:4];

            goto LABEL_21;
          }
          if (!v38) {
            goto LABEL_21;
          }
          uint64_t v39 = NSString;
          os_log_t v25 = v37;
          __int16 v26 = [v39 stringWithSiriButtonIdentifier:a3];
          SASRequestStateGetName([(SiriActivationService *)self _requestState]);
          BOOL v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v26;
          __int16 v60 = 2112;
          v61 = v9;
          __int16 v62 = 2112;
          v63 = v30;
          uint64_t v40 = "%s #activation buttonLongPressFromButtonIdentifier:%@, context %@, but Siri state is %@ and we are in Ca"
                "rPlay. Ignoring because we should also be getting a button down/up.";
        }
        else
        {
          os_log_t v41 = *v10;
          if (!os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          uint64_t v42 = NSString;
          os_log_t v25 = v41;
          __int16 v26 = [v42 stringWithSiriButtonIdentifier:a3];
          SASRequestStateGetName([(SiriActivationService *)self _requestState]);
          BOOL v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v26;
          __int16 v60 = 2112;
          v61 = v30;
          __int16 v62 = 2112;
          v63 = v9;
          uint64_t v40 = "%s #activation buttonLongPressFromButtonIdentifier:%@, with Siri state %@, context: %@. Ignoring";
        }
        _os_log_impl(&dword_1D9588000, v25, OS_LOG_TYPE_DEFAULT, v40, buf, 0x2Au);
      }

      goto LABEL_12;
    }
    os_log_t v31 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = NSString;
      uint64_t v33 = v31;
      uint64_t v34 = [v32 stringWithSiriButtonIdentifier:a3];
      SASRequestStateGetName([(SiriActivationService *)self _requestState]);
      id v35 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      uint64_t v57 = "-[SiriActivationService buttonLongPressFromButtonIdentifier:deviceIdentifier:context:]";
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)v34;
      __int16 v60 = 2112;
      v61 = v35;
      __int16 v62 = 2112;
      v63 = v9;
      _os_log_impl(&dword_1D9588000, v33, OS_LOG_TYPE_DEFAULT, "%s #activation buttonLongPressFromButtonIdentifier:%@, with Siri state %@, context %@. Activating.", buf, 0x2Au);
    }
    [(SiriActivationService *)self activationRequestFromButtonIdentifier:a3 context:v9];
  }
LABEL_21:
}

void __86__SiriActivationService_buttonLongPressFromButtonIdentifier_deviceIdentifier_context___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [SASTimeIntervalTransport alloc];
  [*(id *)(a1 + 32) buttonDownTimestamp];
  id v4 = -[SASTimeIntervalTransport initWithTimeInterval:](v3, "initWithTimeInterval:");
  id v5 = *(id *)(a1 + 40);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(a1 + 32) activeDeviceBluetoothIdentifier];

    id v5 = (id)v6;
  }
  id v7 = [v10 connection];
  id v8 = [v7 remoteTarget];
  int v9 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:*(void *)(a1 + 48)];
  [v8 handleButtonLongPressFromButtonIdentifier:v9 deviceIdentifier:v5 timestamp:v4 context:*(void *)(a1 + 32)];
}

- (BOOL)_buttonIsTVMicrophoneButton:(int64_t)a3
{
  return a3 == 201;
}

- (void)_handleTapSynthesisIfNeededForButtonIdentifier:(int64_t)a3 buttonUpTimestamp:(double)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (-[SiriActivationService _buttonIsAVExternalButton:](self, "_buttonIsAVExternalButton:")
    && [(SiriActivationService *)self buttonDownHasOccurredSinceActivation])
  {
    id v7 = [(SiriActivationService *)self avExternalButtonEvents];
    id v8 = [NSString stringWithSiriButtonIdentifier:a3];
    int v9 = [v7 objectForKey:v8];

    if (v9)
    {
      id v10 = [(SiriActivationService *)self avExternalButtonEvents];
      id v11 = [NSString stringWithSiriButtonIdentifier:a3];
      [v10 removeObjectForKey:v11];

      [v9 doubleValue];
      double v13 = v12;
      os_log_t v14 = (os_log_t *)MEMORY[0x1E4F4E360];
      os_log_t v15 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315650;
        os_log_t v22 = "-[SiriActivationService _handleTapSynthesisIfNeededForButtonIdentifier:buttonUpTimestamp:]";
        __int16 v23 = 2048;
        double v24 = a4;
        __int16 v25 = 2048;
        double v26 = v13;
        _os_log_impl(&dword_1D9588000, v15, OS_LOG_TYPE_DEFAULT, "%s buttonUpTimestamp: %f, buttonDownTimestamp: %f", (uint8_t *)&v21, 0x20u);
      }
      [(SiriActivationService *)self activationTimestamp];
      if (a4 - v13 < 0.4 && v16 != v13)
      {
        int64_t v18 = [(SiriActivationService *)self _requestState];
        uint64_t v19 = *v14;
        BOOL v20 = os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT);
        if (v18 == 3)
        {
          if (v20)
          {
            int v21 = 136315138;
            os_log_t v22 = "-[SiriActivationService _handleTapSynthesisIfNeededForButtonIdentifier:buttonUpTimestamp:]";
            _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation synthesizing button tap", (uint8_t *)&v21, 0xCu);
          }
          [(SiriActivationService *)self buttonTapFromButtonIdentifier:a3 timestamp:0 context:a4];
        }
        else if (v20)
        {
          int v21 = 136315138;
          os_log_t v22 = "-[SiriActivationService _handleTapSynthesisIfNeededForButtonIdentifier:buttonUpTimestamp:]";
          _os_log_impl(&dword_1D9588000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation button tap occurred, but Siri is not yet up. Not synthesizing tap event.", (uint8_t *)&v21, 0xCu);
        }
      }
    }
  }
}

- (void)_recordTimeIfNeededForButtonIdentifier:(int64_t)a3 buttonDownTimestamp:(double)a4
{
  if (-[SiriActivationService _buttonIsAVExternalButton:](self, "_buttonIsAVExternalButton:"))
  {
    id v9 = [(SiriActivationService *)self avExternalButtonEvents];
    id v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
    id v8 = [NSString stringWithSiriButtonIdentifier:a3];
    [v9 setObject:v7 forKey:v8];
  }
}

- (BOOL)_buttonIsAVExternalButton:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (void)prewarmForFirstTapOfQuickTypeToSiriGesture
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = SASRequestStateGetName([(SiriActivationService *)self _requestState]);
    int v13 = 136315394;
    os_log_t v14 = "-[SiriActivationService prewarmForFirstTapOfQuickTypeToSiriGesture]";
    __int16 v15 = 2112;
    double v16 = v5;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation #quickTypeGate Quick Type-to-Siri prewarm request, current request state: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v6 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v7 = [v6 assistantIsEnabled];

  if (v7)
  {
    presentationManager = self->_presentationManager;
    id v9 = [SASPreheatOptions alloc];
    id v10 = [(SiriActivationService *)self systemState];
    id v11 = [v10 lockStateMonitor];
    double v12 = -[SASPreheatOptions initWithRequestSource:lockState:](v9, "initWithRequestSource:lockState:", 47, [v11 lockState]);
    [(SASPresentationManager *)presentationManager preheatNextPresentationToActivateWithOptions:v12];
  }
}

- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGesture
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = SASRequestStateGetName([(SiriActivationService *)self _requestState]);
    int v6 = 136315394;
    int v7 = "-[SiriActivationService cancelPrewarmForFirstTapOfQuickTypeToSiriGesture]";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation #quickTypeGate Cancel Quick Type-to-Siri prewarm request, current request state: %@", (uint8_t *)&v6, 0x16u);
  }
  [(SASPresentationManager *)self->_presentationManager cancelAllPreheatedPresentations];
}

- (void)activationRequestFromDirectActionEventWithContext:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *, void))a4;
  __int16 v8 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    [v6 directActionEvent];
    uint64_t v10 = AFDirectActionEventGetName();
    int v14 = 136315394;
    __int16 v15 = "-[SiriActivationService activationRequestFromDirectActionEventWithContext:completion:]";
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromDirectActionEventWithContext:%@", (uint8_t *)&v14, 0x16u);
  }
  id v11 = [[SASActivationRequest alloc] initWithDirectActionContext:v6];
  BOOL v12 = [(SiriActivationService *)self handleActivationRequest:v11];
  if (v7)
  {
    int v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v12];
    v7[2](v7, v13, 0);
  }
}

- (void)activationRequestFromContinuityWithContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    BOOL v12 = "-[SiriActivationService activationRequestFromContinuityWithContext:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuityWithContext", (uint8_t *)&v11, 0xCu);
  }
  if (!AFIsInternalInstall()) {
    goto LABEL_7;
  }
  uint64_t v6 = [v4 speechRequestOptions];
  if (!v6) {
    goto LABEL_7;
  }
  int v7 = (void *)v6;
  __int16 v8 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v9 = [v8 designModeIsEnabled];

  if (v9)
  {
    [(SiriActivationService *)self _handleDesignModeRequest];
  }
  else
  {
LABEL_7:
    uint64_t v10 = [[SASActivationRequest alloc] initWithContinuityContext:v4];
    [(SiriActivationService *)self handleActivationRequest:v10];
  }
}

- (void)activationRequestFromVoiceTriggerWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[SiriActivationService activationRequestFromVoiceTriggerWithContext:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromVoiceTriggerWithContext", (uint8_t *)&v9, 0xCu);
  }
  if (AFIsInternalInstall()
    && ([MEMORY[0x1E4F4E538] sharedPreferences],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 designModeIsEnabled],
        v6,
        v7))
  {
    [(SiriActivationService *)self _handleDesignModeRequest];
  }
  else
  {
    __int16 v8 = [[SASActivationRequest alloc] initWithVoiceTriggerContext:v4];
    [(SiriActivationService *)self handleActivationRequest:v8];
  }
}

- (void)activationRequestFromContinuousConversationWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[SiriActivationService activationRequestFromContinuousConversationWithContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuousConversationWithContext with context: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [[SASActivationRequest alloc] initWithContinuousConversationContext:v4];
  [(SiriActivationService *)self handleActivationRequest:v6];
}

- (void)activationRequestFromContinuousConversationHearstWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[SiriActivationService activationRequestFromContinuousConversationHearstWithContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuousConversationHearstWithContext with context: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [[SASActivationRequest alloc] initWithContinuousConversationHearstContext:v4];
  [(SiriActivationService *)self handleActivationRequest:v6];
}

- (void)activationRequestFromContinuousConversationJarvisWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[SiriActivationService activationRequestFromContinuousConversationJarvisWithContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuousConversationJarvisWithContext with context: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [[SASActivationRequest alloc] initWithContinuousConversationJarvisContext:v4];
  [(SiriActivationService *)self handleActivationRequest:v6];
}

- (void)activationRequestFromBreadcrumb
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SiriActivationService activationRequestFromBreadcrumb]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromBreadcrumb", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [[SASActivationRequest alloc] initWithBreadcrumbRequest];
  [(SiriActivationService *)self handleActivationRequest:v4];
}

- (void)activationRequestFromBluetoothKeyboardActivation:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = SASRequestSourceGetName(a3);
    int v9 = 136315394;
    id v10 = "-[SiriActivationService activationRequestFromBluetoothKeyboardActivation:]";
    __int16 v11 = 2112;
    BOOL v12 = v7;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSimpleActivation:%@", (uint8_t *)&v9, 0x16u);
  }
  __int16 v8 = [[SASActivationRequest alloc] initWithBluetoothKeyboardShortcutActivation:a3];
  [(SiriActivationService *)self handleActivationRequest:v8];
}

- (void)activationRequestFromRemotePresentationBringUpWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[SiriActivationService activationRequestFromRemotePresentationBringUpWithContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromRemotePresentationBringUpWithContext:%@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [[SASActivationRequest alloc] initWithRemotePresentationBringUpContext:v4];
  [(SiriActivationService *)self handleActivationRequest:v6];
}

- (void)activationRequestFromSimpleActivation:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    int v7 = SASRequestSourceGetName(a3);
    int v9 = 136315394;
    id v10 = "-[SiriActivationService activationRequestFromSimpleActivation:]";
    __int16 v11 = 2112;
    BOOL v12 = v7;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSimpleActivation:%@", (uint8_t *)&v9, 0x16u);
  }
  __int16 v8 = [[SASActivationRequest alloc] initWithSimpleActivation:a3];
  [(SiriActivationService *)self handleActivationRequest:v8];
}

- (void)activationRequestFromSpotlightWithContext:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    __int16 v8 = "-[SiriActivationService activationRequestFromSpotlightWithContext:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSpotlightWithContext", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [[SASActivationRequest alloc] initWithSpotlightContext:v4];
  [(SiriActivationService *)self handleActivationRequest:v6];
}

- (void)activationRequestFromVoiceTrigger
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SiriActivationService activationRequestFromVoiceTrigger]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromVoiceTrigger", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [[SASActivationRequest alloc] initWithVoiceTriggerRequest];
  [(SiriActivationService *)self handleActivationRequest:v4];
}

- (void)activationRequestFromTestingWithContext:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    __int16 v8 = "-[SiriActivationService activationRequestFromTestingWithContext:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromTestingWithContext", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [[SASActivationRequest alloc] initWithTestingContext:v4];
  [(SiriActivationService *)self handleActivationRequest:v6];
}

- (void)activationRequestFromVocalShortcutWithContext:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    __int16 v8 = "-[SiriActivationService activationRequestFromVocalShortcutWithContext:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromVocalShortcutWithContext", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [[SASActivationRequest alloc] initWithVocalShortcutContext:v4];
  [(SiriActivationService *)self handleActivationRequest:v6];
}

- (void)activationRequestFromTostadaWithContext:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    __int16 v8 = "-[SiriActivationService activationRequestFromTostadaWithContext:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromTostadaWithContext", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [[SASActivationRequest alloc] initWithTostadaContext:v4];
  [(SiriActivationService *)self handleActivationRequest:v6];
}

- (void)speechRequestStateDidChange:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[SiriActivationService speechRequestStateDidChange:]";
    __int16 v8 = 2048;
    int64_t v9 = a3;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation speech request state did change (state = %ld)", (uint8_t *)&v6, 0x16u);
  }
  if (a3 == 1) {
    [(SASMyriadController *)self->_myriadController activateForInTaskRequest:0 isVisible:[(SiriActivationService *)self _requestState] == 3];
  }
}

- (BOOL)handleActivationRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(SiriActivationService *)self systemState];
  LOBYTE(self) = [(SiriActivationService *)self handleActivationRequest:v4 systemState:v5];

  return (char)self;
}

- (BOOL)handleActivationRequest:(id)a3 systemState:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  int64_t v9 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    __int16 v11 = v9;
    BOOL v12 = [v10 currentThread];
    *(_DWORD *)buf = 136315394;
    v72 = "-[SiriActivationService handleActivationRequest:systemState:]";
    __int16 v73 = 2048;
    double v74 = COERCE_DOUBLE([v12 qualityOfService]);
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy handleActivationLock about to lock with qos: %zd", buf, 0x16u);
  }
  os_unfair_lock_lock(&handleActivationLock);
  uint64_t v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v72 = "-[SiriActivationService handleActivationRequest:systemState:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy handleActivationLock successfully locked", buf, 0xCu);
  }
  int v14 = (SASOverriddenSystemState *)v7;
  __int16 v15 = [v6 context];
  __int16 v16 = [v15 contextOverride];

  uint64_t v17 = v14;
  if (v16)
  {
    uint64_t v18 = [v6 context];
    uint64_t v19 = [v18 contextOverride];

    uint64_t v17 = [[SASOverriddenSystemState alloc] initWithSystemState:v14 contextOverride:v19];
  }
  BOOL v20 = [(SiriActivationService *)self systemState];
  int v21 = [v20 lockStateMonitor];

  v67 = v21;
  v68 = v14;
  if (v21) {
    BOOL v22 = [v21 lockState] == 0;
  }
  else {
    BOOL v22 = 1;
  }
  v69[0] = @"activationEvent";
  __int16 v23 = objc_msgSend(NSString, "stringWithSiriActivationEventType:", objc_msgSend(v6, "activationType"));
  v70[0] = v23;
  v69[1] = @"eventSource";
  double v24 = [v6 eventSource];
  v70[1] = v24;
  v69[2] = @"isDeviceUnlocked";
  __int16 v25 = [MEMORY[0x1E4F28ED0] numberWithBool:v22];
  v70[2] = v25;
  v69[3] = @"clockTime";
  double v26 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
  [v27 timeIntervalSince1970];
  os_log_t v28 = objc_msgSend(v26, "numberWithDouble:");
  v70[3] = v28;
  os_log_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:4];
  BOOL v30 = (void *)[v29 mutableCopy];

  os_log_t v31 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SASOverriddenSystemState carDNDActive](v17, "carDNDActive"));
  [v30 setObject:v31 forKeyedSubscript:@"carDNDActive"];

  uint64_t v32 = [(SASSystemState *)v17 vehicleName];
  [v30 setObject:v32 forKeyedSubscript:@"carVehicleName"];

  uint64_t v33 = [(SASSystemState *)v17 vehicleModel];
  [v30 setObject:v33 forKeyedSubscript:@"carVehicleModelName"];

  uint64_t v34 = [(SASSystemState *)v17 vehicleManufacturer];
  [v30 setObject:v34 forKeyedSubscript:@"carVehicleManufacturer"];

  id v35 = +[SASAnalytics analytics];
  [v35 enqueueCurrentAnalyticsEventWithType:1404 context:v30];

  kdebug_trace();
  BOOL v36 = (os_log_t *)MEMORY[0x1E4F4E360];
  os_log_t v37 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[SiriActivationService handleActivationRequest:systemState:]";
    __int16 v73 = 2112;
    double v74 = *(double *)&v6;
    _os_log_impl(&dword_1D9588000, v37, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequest = %@", buf, 0x16u);
  }
  int64_t v38 = [(SASPresentationManager *)self->_presentationManager nextPresentationToActivate];
  uint64_t v39 = objc_opt_new();
  [v39 setRequest:v6];
  [v39 setButtonTriggerStateActive:self->_buttonTrigger != 0];
  [v39 setSystemState:v17];
  uint64_t v40 = +[SASSiriPocketStateManager sharedManager];
  [v39 setPocketStateManager:v40];

  os_log_t v41 = [(SiriActivationService *)self afPreferences];
  [v39 setPreferences:v41];

  objc_msgSend(v39, "setRequestState:", -[SiriActivationService _requestState](self, "_requestState"));
  uint64_t v42 = [(SiriActivationService *)self assetUtilities];
  [v39 setAssetUtilities:v42];

  [v39 setPresentationIdentifier:v38];
  __int16 v43 = [(SiriActivationService *)self _uiPresentationIdentifierWithActivation:v6 activationPresentation:v38];
  [v39 setUiPresentationIdentifier:v43];

  if (+[SASActivationDecision canActivateForCondition:v39])
  {
    if (![(SiriActivationService *)self _siriIsEnabled]) {
      [(SiriActivationService *)self _cancelActivationPreparationForSetup];
    }
    if (([v6 isUIFreeRequestSource] & 1) == 0
      && ([v6 isContinuousConversationRequest] & 1) == 0
      && [v6 requestSource] != 53)
    {
      if ([v6 isVoiceRequest]
        && [(SASOverriddenSystemState *)v17 isConnectedToCarPlay])
      {
        id v44 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithFloat:0.0];
        int64_t v45 = *v36;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          double v46 = v45;
          [v44 floatValue];
          *(_DWORD *)buf = 136315394;
          v72 = "-[SiriActivationService handleActivationRequest:systemState:]";
          __int16 v73 = 2048;
          double v74 = v47;
          _os_log_impl(&dword_1D9588000, v46, OS_LOG_TYPE_DEFAULT, "%s #activation Voice request on CarPlay, delaying Myriad decision by %f ms", buf, 0x16u);
        }
        BOOL v48 = [(SASMyriadController *)self->_myriadController activateForRequest:v6 withTimeout:v44 visible:[(SiriActivationService *)self _requestState] == 3];

        BOOL v36 = (os_log_t *)MEMORY[0x1E4F4E360];
        if (!v48)
        {
LABEL_23:
          [(SiriActivationService *)self _cancelPendingActivationEventWithReason:4];
          os_unfair_lock_unlock(&handleActivationLock);
          int64_t v49 = *v36;
          BOOL v50 = 0;
          v51 = v68;
          if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v72 = "-[SiriActivationService handleActivationRequest:systemState:]";
LABEL_27:
            _os_log_impl(&dword_1D9588000, v49, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy handleActivationLock unlocked", buf, 0xCu);
            BOOL v50 = 0;
            goto LABEL_41;
          }
          goto LABEL_41;
        }
      }
      else if (![(SASMyriadController *)self->_myriadController activateForRequest:v6 withTimeout:0 visible:[(SiriActivationService *)self _requestState] == 3])
      {
        goto LABEL_23;
      }
    }
    v52 = +[SASAnalytics analytics];
    [v52 flushPendingAnalyticsEventQueue];

    __int16 v53 = objc_alloc_init(SASRequestOptionsBuilder);
    id v54 = [(SASRequestOptionsBuilder *)v53 buildOptionsWithRequest:v6 presentationIdentifier:v38 dataSource:self];

    if (v38 == 2)
    {
      id v55 = objc_alloc_init(MEMORY[0x1E4FA1278]);
      v56 = [(SASSystemState *)v17 vehicleManufacturer];
      [v55 setVehicleManufacturer:v56];

      uint64_t v57 = [(SASSystemState *)v17 vehicleModel];
      [v55 setVehicleModel:v57];

      __int16 v58 = [(SASSystemState *)v17 vehicleName];
      [v55 setVehicleName:v58];

      uint64_t v59 = [v54 instrumentationEvents];
      [v59 addObject:v55];
    }
    __int16 v60 = [(SiriActivationService *)self testingInputController];
    v61 = [v60 dequeuePreloadedTestingContext];

    if (v61
      && ([v54 testingContext], __int16 v62 = objc_claimAutoreleasedReturnValue(),
                                               v62,
                                               !v62))
    {
      v63 = [v61 testingContext];
      [v54 setTestingContext:v63];
    }
    else
    {
      [(SiriActivationService *)self _updateRequestOptionsWithTestingContextFromActivationRequest:v6 requestOptions:v54];
      id v54 = v63 = v54;
    }

    v51 = v68;
    if ([(SiriActivationService *)self _requestState] == 3)
    {
      [(SASPresentationManager *)self->_presentationManager activePresentations_handleRequestWithOptions:v54];
    }
    else
    {
      [(SiriActivationService *)self _activatePresentationWithIdentifier:v38 requestOptions:v54 analyticsContext:v30];
      -[SiriActivationService _logActivationToPowerLogWithReason:](self, "_logActivationToPowerLogWithReason:", [v6 activationType]);
    }
    uint64_t v64 = (NSObject **)MEMORY[0x1E4F4E360];
    os_unfair_lock_unlock(&handleActivationLock);
    v65 = *v64;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v72 = "-[SiriActivationService handleActivationRequest:systemState:]";
      _os_log_impl(&dword_1D9588000, v65, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy handleActivationLock unlocked", buf, 0xCu);
    }

    BOOL v50 = 1;
    goto LABEL_41;
  }
  [(SiriActivationService *)self _cancelPendingActivationEventWithReason:4];
  os_unfair_lock_unlock(&handleActivationLock);
  int64_t v49 = *v36;
  BOOL v50 = 0;
  v51 = v68;
  if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v72 = "-[SiriActivationService handleActivationRequest:systemState:]";
    goto LABEL_27;
  }
LABEL_41:

  return v50;
}

- (void)_logActivationToPowerLogWithReason:(int64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  int v5 = @"ReasonStart";
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  PLLogRegisteredEvent();
}

- (void)_activatePresentationWithIdentifier:(int64_t)a3 requestOptions:(id)a4 analyticsContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = NSString;
    BOOL v12 = v10;
    uint64_t v13 = [v11 stringWithSiriPresentationIdentifier:a3];
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[SiriActivationService _activatePresentationWithIdentifier:requestOptions:analyticsContext:]";
    __int16 v20 = 2112;
    int v21 = v13;
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation _activatePresentation %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke;
  v15[3] = &unk_1E6B676D0;
  objc_copyWeak(v17, (id *)buf);
  id v14 = v8;
  id v16 = v14;
  v17[1] = (id)a3;
  SiriInvokeOnMainQueue(v15);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

void __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [[SiriPresentationOptions alloc] initWithBuilder:0];
    uint64_t v4 = [WeakRetained _shouldHandlePocketStateFetchForRequestOptions:*(void *)(a1 + 32)];
    int v5 = (os_log_t *)MEMORY[0x1E4F4E360];
    id v6 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "-[SiriActivationService _activatePresentationWithIdentifier:requestOptions:analyticsContext:]_block_invoke";
      __int16 v28 = 1024;
      int v29 = v4;
      _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation Deferring wake, shouldHandlePocketStateFetch: (%{BOOL}d)", buf, 0x12u);
    }
    [WeakRetained[24] presentationWithPresentationIdentifier:*(void *)(a1 + 48) activationDeterminedShouldDeferWake:v4];
    if (v4) {
      [WeakRetained _handlePocketStateFetchForScreenWakeForPresentationIdentifier:*(void *)(a1 + 48)];
    }
    if ([*(id *)(a1 + 32) isHTTRequestSource])
    {
      [*(id *)(a1 + 32) buttonDownTimestamp];
      objc_msgSend(WeakRetained, "setActivationTimestamp:");
    }
    [WeakRetained[24] presentationWithPresentationIdentifierBeganStarting:*(void *)(a1 + 48)];
    id v7 = [*(id *)(a1 + 32) uiPresentationIdentifier];
    char v8 = [v7 isEqualToString:@"com.apple.siri.UIFree"];
    int v9 = [WeakRetained _isVoiceActivationMaskNecessaryWithRequestOptions:*(void *)(a1 + 32)] | v4;
    if ([v7 isEqualToString:@"com.apple.siri.Compact"])
    {
      unint64_t v10 = 2;
    }
    else if ([v7 isEqualToString:@"com.apple.siri.SystemAssistantExperience"])
    {
      unint64_t v10 = 2;
    }
    else
    {
      unint64_t v10 = 1;
    }
    char v11 = v9 | v8;
    os_log_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
      __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_cold_2(v12, v10, (uint64_t)v7);
    }
    char v13 = v11 ^ 1;
    uint64_t v14 = [*(id *)(a1 + 32) requestSource];
    __int16 v15 = *v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_cold_1(v14 == 53, v15);
    }
    if (_SiriActivationDeviceSupportsPearlID_onceToken != -1) {
      dispatch_once(&_SiriActivationDeviceSupportsPearlID_onceToken, &__block_literal_global_560);
    }
    char v16 = _SiriActivationDeviceSupportsPearlID_deviceSupportsPearlID;
    int v17 = [MEMORY[0x1E4F4E638] isSAEEnabled] ^ 1;
    if (v14 == 53) {
      LOBYTE(v17) = 1;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_163;
    v19[3] = &unk_1E6B67A70;
    BOOL v22 = v14 == 53;
    char v23 = v16;
    char v24 = v17;
    char v25 = v13;
    unint64_t v21 = v10;
    id v20 = *(id *)(a1 + 32);
    uint64_t v18 = [(SiriPresentationOptions *)v3 mutatedCopyWithMutator:v19];

    [WeakRetained[24] presentationRequestedWithPresentationIdentifier:*(void *)(a1 + 48) presentationOptions:v18 requestOptions:*(void *)(a1 + 32)];
  }
}

void __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_163(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = a2;
  [v4 setHideOtherWindowsDuringAppearance:v3];
  [v4 setShouldAllowBiometricAutoUnlock:*(unsigned __int8 *)(a1 + 49)];
  [v4 setShouldDeactivateScenesBelow:*(unsigned __int8 *)(a1 + 50)];
  [v4 setWakeScreen:*(unsigned __int8 *)(a1 + 51)];
  [v4 setRotationStyle:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setRequestSource:", objc_msgSend(*(id *)(a1 + 32), "requestSource"));
  objc_msgSend(v4, "setInputType:", objc_msgSend(*(id *)(a1 + 32), "inputType"));
  id v5 = [*(id *)(a1 + 32) launchActions];
  [v4 setLaunchActions:v5];
}

- (BOOL)_shouldHandlePocketStateFetchForRequestOptions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 isWiredMicOrBTHeadsetOrWx]) {
    goto LABEL_10;
  }
  id v5 = soft_SBUIGetUserAgent();
  int v6 = [v5 isScreenOn];

  if (_SiriActivationDeviceSupportsProxSensor_onceToken != -1) {
    dispatch_once(&_SiriActivationDeviceSupportsProxSensor_onceToken, &__block_literal_global_555);
  }
  int v7 = _SiriActivationDeviceSupportsProxSensor_deviceSupportsProxSensor;
  char v8 = [v4 uiPresentationIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.siri.EyesFree"];

  unint64_t v10 = [v4 uiPresentationIdentifier];
  int v11 = [v10 isEqualToString:@"com.apple.siri.BluetoothCar"];

  os_log_t v12 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136316162;
    int v17 = "-[SiriActivationService _shouldHandlePocketStateFetchForRequestOptions:]";
    __int16 v18 = 1024;
    int v19 = v6 ^ 1;
    __int16 v20 = 1024;
    int v21 = v7;
    __int16 v22 = 1024;
    int v23 = v9;
    __int16 v24 = 1024;
    int v25 = v11;
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation should handle pocket state fetch via isScreenOff (%{BOOL}d) && siriActivationDeviceSupportsProxSensor (%{BOOL}d) && !(requestIsEyesFree (%{BOOL}d) || requestIsBluetoothCar (%{BOOL}d))", (uint8_t *)&v16, 0x24u);
  }
  int v13 = v7 ? v6 : 1;
  if (((v13 | v9 | v11) & 1) == 0) {
    BOOL v14 = ![(SiriActivationService *)self _pocketStateFetchingInProgressForHeadsetActivation];
  }
  else {
LABEL_10:
  }
    LOBYTE(v14) = 0;

  return v14;
}

- (void)_handlePocketStateFetchForScreenWakeForPresentationIdentifier:(int64_t)a3
{
  [(SiriActivationService *)self _setPocketStateFetchingInProgressForHeadsetActivation:1];
  objc_initWeak(&location, self);
  id v5 = +[SASSiriPocketStateManager sharedManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke;
  v6[3] = &unk_1E6B67A98;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  [v5 queryForPocketStateWithCompletion:v6];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  int v7 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_8;
  }
  [WeakRetained _setPocketStateFetchingInProgressForHeadsetActivation:0];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke_cold_1();
    }
  }
  else
  {
    unint64_t v10 = a2 & 0xFFFFFFFFFFFFFFFDLL;
    int v11 = *MEMORY[0x1E4F4E360];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT);
    if (v10 == 1)
    {
      if (v12)
      {
        int v13 = 136315138;
        BOOL v14 = "-[SiriActivationService _handlePocketStateFetchForScreenWakeForPresentationIdentifier:]_block_invoke";
        _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #SiriPocketStateManager: Device is face down on table or in pocket. Leaving screen off.", (uint8_t *)&v13, 0xCu);
      }
      int v8 = 0;
      goto LABEL_6;
    }
    if (v12)
    {
      int v13 = 136315138;
      BOOL v14 = "-[SiriActivationService _handlePocketStateFetchForScreenWakeForPresentationIdentifier:]_block_invoke";
      _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #SiriPocketStateManager: Turning on the screen...", (uint8_t *)&v13, 0xCu);
    }
  }
  int v8 = 1;
LABEL_6:
  char v9 = v8 ^ 1;
  [v7[24] presentationWithPresentationIdentifier:*(void *)(a1 + 40) activationDeterminedShouldDeferWake:v8 ^ 1u];
  if ((v9 & 1) == 0) {
    [v7[24] presentationWithPresentationIdentifierWakeScreenAfterActivation:*(void *)(a1 + 40) reason:@"PocketStateFetch"];
  }
LABEL_8:
}

- (void)_dismissSiri:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[SiriActivationService _dismissSiri:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v6, 0xCu);
  }
  [(SASPresentationManager *)self->_presentationManager startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions:v4];
}

- (void)_preheatPresentation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    unint64_t v10 = "-[SiriActivationService _preheatPresentation]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v9, 0xCu);
  }
  presentationManager = self->_presentationManager;
  id v5 = [SASPreheatOptions alloc];
  int v6 = [(SiriActivationService *)self systemState];
  int v7 = [v6 lockStateMonitor];
  uint64_t v8 = -[SASPreheatOptions initWithRequestSource:lockState:](v5, "initWithRequestSource:lockState:", 0, [v7 lockState]);
  [(SASPresentationManager *)presentationManager preheatNextPresentationToActivateWithOptions:v8];
}

- (void)_attachToTether
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[SiriActivationService _attachToTether]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _attachToTether", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(SiriActivationService *)self siriTether];
  [v4 attach:0];
}

- (void)_cancelActivationPreparationForSetup
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[SiriActivationService _cancelActivationPreparationForSetup]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _cancelActivationPreparationForSetup", (uint8_t *)&v4, 0xCu);
  }
  [(SiriActivationService *)self _cancelPendingActivationEventWithReason:1];
}

- (void)_cancelPendingActivationEventWithReason:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSString;
    uint64_t v7 = v5;
    uint64_t v8 = [v6 stringWithSiriPresentationActivationCancelReason:a3];
    int v9 = 136315394;
    unint64_t v10 = "-[SiriActivationService _cancelPendingActivationEventWithReason:]";
    __int16 v11 = 2112;
    BOOL v12 = v8;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation _cancelPendingActivationEventWithReason:%@", (uint8_t *)&v9, 0x16u);
  }
  [(SASPresentationManager *)self->_presentationManager startingPresentations_cancelPendingActivationWithReason:a3];
}

- (void)_handleDesignModeRequest
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[SiriActivationService _handleDesignModeRequest]";
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation activating in design mode", (uint8_t *)&v4, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.internal.activation", 0, 0, 1u);
}

- (BOOL)_siriIsEnabled
{
  uint64_t v3 = [(SiriActivationService *)self systemState];
  if ([v3 siriIsEnabled])
  {
    int v4 = [(SiriActivationService *)self systemState];
    int v5 = [v4 siriIsRestricted] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isVoiceActivationMaskNecessaryWithRequestOptions:(id)a3
{
  id v3 = a3;
  int v4 = soft_SBUIGetUserAgent();
  int v5 = [v4 isScreenOn] ^ 1;

  uint64_t v6 = [v3 requestSource];
  if (v6 == 8) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)requestOptionsBuilder:(id)a3 shouldRequestUseAutomaticEndpointingWithActiviation:(id)a4
{
  return 1;
}

- (BOOL)requestOptionsBuilder:(id)a3 isPredictedRecordRouteIsZLLWithActiviation:(id)a4
{
  int v4 = [(SiriActivationService *)self heater];
  char v5 = [v4 predictedRecordRouteIsZLL];

  return v5;
}

- (BOOL)requestOptionsBuilder:(id)a3 isAcousticIdAllowedWithActiviation:(id)a4
{
  id v5 = a4;
  if ([(SiriActivationService *)self _isInitialRequest]) {
    int v6 = [v5 isVoiceRequest] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)requestOptionsBuilder:(id)a3 uiPresentationIdentifierWithActivation:(id)a4 activationPresentation:(int64_t)a5
{
  return [(SiriActivationService *)self _uiPresentationIdentifierWithActivation:a4 activationPresentation:a5];
}

- (id)_uiPresentationIdentifierWithActivation:(id)a3 activationPresentation:(int64_t)a4
{
  id v6 = a3;
  int v7 = [v6 isUIFreeRequestSource];
  BOOL v8 = [(SiriActivationService *)self _isEyesFreeEligibleWithRequest:v6];

  if ([(SiriActivationService *)self _eyesFreeRedesignOnlySteeringWheelEnabled])
  {
    int v9 = 0;
  }
  else
  {
    unint64_t v10 = [(SiriActivationService *)self bluetoothEndpointUtil];
    int v9 = [v10 isConnectedToBluetoothVehicle];
  }
  BOOL v11 = [(SiriActivationService *)self _isSAEEnabled];
  if (a4 == 2)
  {
    BOOL v12 = @"com.apple.siri.CarDisplay";
    if (v7) {
      BOOL v12 = @"com.apple.siri.CarDisplay.UIFree";
    }
    uint64_t v13 = v12;
  }
  else
  {
    BOOL v14 = @"com.apple.siri.Compact";
    uint64_t v15 = @"com.apple.siri.SystemAssistantExperience";
    if (!v11) {
      uint64_t v15 = @"com.apple.siri.Compact";
    }
    if (v9) {
      uint64_t v15 = @"com.apple.siri.BluetoothCar";
    }
    if (v8) {
      uint64_t v15 = @"com.apple.siri.EyesFree";
    }
    if (a4 == 1) {
      BOOL v14 = v15;
    }
    if (a4 == 4) {
      BOOL v14 = @"com.apple.siri.SiriTVPresentation";
    }
    if (v7) {
      uint64_t v13 = @"com.apple.siri.UIFree";
    }
    else {
      uint64_t v13 = v14;
    }
  }
  return v13;
}

- (BOOL)_isEyesFreeEligibleWithRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SiriActivationService *)self systemState];
  int v6 = [v5 isConnectedToEyesFreeDevice];

  int v7 = [(SiriActivationService *)self systemState];
  int v8 = [v7 carDNDActive];

  int v9 = AFPreferencesAlwaysEyesFreeEnabled();
  BOOL v10 = [v4 requestSource] == 5 || objc_msgSend(v4, "requestSource") == 43;
  BOOL v11 = [v4 requestSource] == 52 || objc_msgSend(v4, "requestSource") == 53;
  char v12 = _os_feature_enabled_impl();
  char v13 = _os_feature_enabled_impl();
  BOOL v14 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136316162;
    int v19 = "-[SiriActivationService _isEyesFreeEligibleWithRequest:]";
    __int16 v20 = 1024;
    int v21 = v8;
    __int16 v22 = 1024;
    int v23 = v9;
    __int16 v24 = 1024;
    int v25 = v6;
    __int16 v26 = 1024;
    BOOL v27 = v10;
    _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation checking if EyesFree is eligible: isCarDND = %d, isDebugSettingOn = %d, isEyesFreeDevice = %d, isRequestSourceEyesFreeEligible = %d", (uint8_t *)&v18, 0x24u);
  }
  char v15 = v11 | v8 | v9;
  char v16 = v11 ^ v15;
  if ((v15 & 1) == 0 && ((v6 ^ 1) & 1) == 0) {
    char v16 = (v10 | ~v12) & (v13 ^ 1);
  }

  return v16;
}

- (id)requestOptionsBuilder:(id)a3 optionsForOverriding:(id)a4 withActiviation:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if ([v7 isTestingRequest])
  {
    int v8 = [v7 context];
    int v9 = [v8 testingContext];
    [v6 setTestingContext:v9];
  }
  return v6;
}

- (unint64_t)requestOptionsBuilder:(id)a3 currentLockStateForActivation:(id)a4
{
  id v4 = [(SiriActivationService *)self systemState];
  id v5 = [v4 lockStateMonitor];
  unint64_t v6 = [v5 lockState];

  return v6;
}

- (BOOL)requestOptionsBuilder:(id)a3 isSiriCarBluetoothRequest:(id)a4
{
  return [(SASBluetoothEndpointUtility *)self->_bluetoothEndpointUtil isConnectedToBluetoothVehicle];
}

- (void)updatePredicatedRecordRoute
{
}

- (BOOL)_isInitialRequest
{
  return [(SiriActivationService *)self _requestState] != 3;
}

- (void)heaterSuggestsPreheating:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SiriActivationService *)self _requestState];
  id v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = v5;
    id v7 = SASRequestStateGetName(v4);
    int v8 = 136315394;
    int v9 = "-[SiriActivationService heaterSuggestsPreheating:]";
    __int16 v10 = 2112;
    BOOL v11 = v7;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation preheat; request state = %@",
      (uint8_t *)&v8,
      0x16u);
  }
  kdebug_trace();
  [(SiriActivationService *)self _preheatPresentation];
}

- (void)heater:(id)a3 cancelledPreparationWithButtonIdentifier:(int64_t)a4 duration:(double)a5 targetDuration:(double)a6
{
}

- (BOOL)_logCancelledActivationWithButtonIdentifier:(int64_t)a3 duration:(double)a4 targetDuration:(double)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (fabs(a5 + -0.4) < 2.22044605e-16 || fabs(a5 + -0.65) >= 2.22044605e-16 || _AXSHomeButtonAssistant()) {
    return 0;
  }
  int v8 = +[SASSystemState sharedSystemState];
  if (([v8 siriIsSupported] & 1) == 0)
  {

    return 0;
  }
  int v9 = +[SASSystemState sharedSystemState];
  int v10 = [v9 siriIsEnabled];

  if (!v10) {
    return 0;
  }
  BOOL v11 = [NSString stringWithSiriButtonIdentifier:a3];
  BOOL v12 = a4 > 0.2;
  char v13 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    int v17 = "-[SiriActivationService _logCancelledActivationWithButtonIdentifier:duration:targetDuration:]";
    __int16 v18 = 2112;
    int v19 = v11;
    __int16 v20 = 2048;
    double v21 = a4;
    __int16 v22 = 1024;
    BOOL v23 = a4 > 0.2;
    __int16 v24 = 2048;
    double v25 = a5;
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation cancelledPreparationWithButtonIdentifier: %@ duration: %f, willSendEvent: %d, targetDuration: %f, ", buf, 0x30u);
  }
  if (a4 > 0.2)
  {
    id v15 = v11;
    AnalyticsSendEventLazy();
  }
  return v12;
}

id __93__SiriActivationService__logCancelledActivationWithButtonIdentifier_duration_targetDuration___block_invoke(uint64_t a1)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"duration";
  v2 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = @"buttonIdentifier";
  v8[2] = @"targetDuration";
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 48)];
  v9[2] = v4;
  v8[3] = @"targetDurationEnum";
  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v9[3] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)activationRequestFromTestRunnerWithContext:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[SASActivationRequest alloc] initWithTestingContext:v4];

  id v5 = [(SiriActivationService *)self systemState];
  [(SiriActivationService *)self handleActivationRequest:v6 systemState:v5];
}

- (void)_unregisterForVoiceTrigger
{
  if (self->_voiceTriggerNotifyTokenIsValid)
  {
    notify_cancel(self->_voiceTriggerNotifyToken);
    self->_voiceTriggerNotifyTokenIsValid = 0;
  }
}

- (int64_t)presentationWithActivationPriority
{
  return [(SASPresentationManager *)self->_presentationManager nextPresentationToActivate];
}

- (void)scdaShouldAbort:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SiriActivationService scdaShouldAbort:]";
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #myriad SCDA should abort session", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [[SiriDismissalOptions alloc] initWithDeactivationOptions:0 animated:1 requestCancellationReason:1 dismissalReason:8 shouldTurnScreenOff:0];
  [(SiriActivationService *)self dismissSiriWithOptions:v5];
}

- (void)scdaShouldContinue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[SiriActivationService scdaShouldContinue:]";
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #myriad SCDA continues to interact, device won election", (uint8_t *)&v5, 0xCu);
  }
  [(SASPresentationManager *)self->_presentationManager activePresentations_deviceWonMyriadElection];
}

- (void)didChangeLockState:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v7 = v5;
    uint64_t v8 = [v6 numberWithUnsignedInteger:a3];
    int v9 = 136315394;
    int v10 = "-[SiriActivationService didChangeLockState:]";
    __int16 v11 = 2112;
    BOOL v12 = v8;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation lockState: %@", (uint8_t *)&v9, 0x16u);
  }
  [(SASPresentationManager *)self->_presentationManager activeAndStartingPresentations_updateCurrentLockState:a3];
}

- (id)allBulletins
{
  v2 = [(SiriActivationService *)self bulletinManager];
  uint64_t v3 = [v2 allBulletins];

  return v3;
}

- (id)bulletinsOnLockScreen
{
  v2 = [(SiriActivationService *)self bulletinManager];
  uint64_t v3 = [v2 bulletinsOnLockScreen];

  return v3;
}

- (id)bulletinForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(SiriActivationService *)self bulletinManager];
  int v6 = [v5 bulletinForIdentifier:v4];

  return v6;
}

- (void)bulletinManagerDidChangeBulletins:(id)a3
{
}

- (void)callStateChangedToIsActive:(BOOL)a3 isOutgoing:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
    int v9 = v7;
    int v10 = [v8 numberWithBool:v5];
    __int16 v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    int v12 = 136315650;
    uint64_t v13 = "-[SiriActivationService callStateChangedToIsActive:isOutgoing:]";
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2112;
    int v17 = v11;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation callStateChangedToIsActive: %@ isOutgoing: %@", (uint8_t *)&v12, 0x20u);
  }
  [(SiriActivationService *)self _updateCanActivateFromDirectActionSource];
}

- (void)assessmentModeChangedToIsActive:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
    int v9 = v7;
    int v10 = [v8 numberWithBool:v4];
    int v15 = 136315394;
    __int16 v16 = "-[SiriActivationService assessmentModeChangedToIsActive:completion:]";
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation assessmentModeChangedToIsActive: %@", (uint8_t *)&v15, 0x16u);
  }
  [(SiriActivationService *)self _updateCanActivateFromDirectActionSource];
  int64_t v11 = [(SiriActivationService *)self _requestState];
  if (v4 && v11 == 3)
  {
    int v12 = _Block_copy(v6);
    id didDismissForAssesmentModeStartedCompeltion = self->_didDismissForAssesmentModeStartedCompeltion;
    self->_id didDismissForAssesmentModeStartedCompeltion = v12;

    __int16 v14 = [[SiriDismissalOptions alloc] initWithDeactivationOptions:0 animated:0 dismissalReason:60];
    [(SiriActivationService *)self _dismissSiri:v14];
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

- (void)presentationManager:(id)a3 didChangeAggregateState:(id)a4
{
  [(SiriActivationService *)self _notifySourcesOfPresentationStateChange:a4];
  [(SiriActivationService *)self _updateCanActivateFromDirectActionSource];
}

- (void)presentationManager:(id)a3 didEncounterError:(int64_t)a4
{
  id v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    -[SiriActivationService presentationManager:didEncounterError:](v6, a4);
  }
  uint64_t v7 = [[SiriDismissalOptions alloc] initWithDeactivationOptions:0 animated:0 dismissalReason:28];
  [(SiriActivationService *)self _dismissSiri:v7];
}

- (void)pongWithPresentationIdentifier:(int64_t)a3
{
}

- (id)_updateRequestOptionsWithTestingContextFromActivationRequest:(id)a3 requestOptions:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 activationType] == 7)
  {
    uint64_t v7 = [v5 context];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v9 = [v5 context];
      int v10 = [v9 testingContext];
      if (([v9 containsRecognitionStrings] & 1) != 0
        || [v9 containsAudioInput])
      {
        int64_t v11 = [v9 testingContext];
        int v12 = [v11 objectForKeyedSubscript:@"SiriTestingContextAudioInputKey"];

        if (v12)
        {
          uint64_t v13 = [v11 objectForKeyedSubscript:@"SiriTestingContextAudioInputKey"];
        }
        else
        {
          uint64_t v13 = 0;
        }
        __int16 v14 = [v11 objectForKeyedSubscript:@"SiriTestingContextRecognitionStringKey"];

        if (v14)
        {
          int v15 = [v11 objectForKeyedSubscript:@"SiriTestingContextRecognitionStringKey"];
          __int16 v16 = [v15 firstObject];
        }
        else
        {
          __int16 v16 = 0;
        }

        __int16 v17 = 0;
      }
      else
      {
        __int16 v17 = [v10 objectForKey:@"testOptions"];

        if (v17)
        {
          __int16 v17 = [v10 objectForKey:@"testOptions"];
          uint64_t v13 = [v17 objectForKey:@"speechFile"];
          __int16 v16 = 0;
        }
        else
        {
          __int16 v16 = 0;
          uint64_t v13 = 0;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v13;
        if ([v18 length])
        {
          uint64_t v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18 isDirectory:0];
          if ([v19 checkResourceIsReachableAndReturnError:0])
          {
            [v6 setSpeechFileURL:v19];
          }
          else
          {
            os_log_t v31 = v10;
            uint64_t v20 = [v17 objectForKey:@"testName"];
            double v21 = (void *)v20;
            __int16 v22 = &stru_1F336E7E8;
            if (v20) {
              __int16 v22 = (__CFString *)v20;
            }
            uint64_t v30 = v22;

            BOOL v23 = [v6 testingContext];

            __int16 v24 = (void *)MEMORY[0x1E4F1CA60];
            if (v23)
            {
              double v25 = [v6 testingContext];
              uint64_t v26 = [v24 dictionaryWithDictionary:v25];
            }
            else
            {
              uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
            }
            v32[0] = @"SiriTestingContextFailedTestNameKey";
            v32[1] = @"SiriTestingContextFailedTestMessageKey";
            v33[0] = v30;
            v33[1] = @"Speech file not found";
            BOOL v27 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v33, v32, 2, v19);
            [v26 setObject:v27 forKeyedSubscript:@"SiriTestingContextFailedTestIdentifierKey"];

            [v6 setTestingContext:v26];
            int v10 = v31;
            uint64_t v19 = v29;
          }
        }
      }
      if ([v16 length]) {
        [v6 setText:v16];
      }
    }
  }

  return v6;
}

- (void)setSystemState:(id)a3
{
}

- (void)setAfPreferences:(id)a3
{
}

- (SASLockStateMonitor)lockStateMonitor
{
  return self->_lockStateMonitor;
}

- (void)setLockStateMonitor:(id)a3
{
}

- (void)setAssetUtilities:(id)a3
{
}

- (BOOL)xcTestingActive
{
  return self->_xcTestingActive;
}

- (void)setXcTestingActive:(BOOL)a3
{
  self->_xcTestingActive = a3;
}

- (void)setSources:(id)a3
{
}

- (NSMutableDictionary)activationAssertions
{
  return self->_activationAssertions;
}

- (void)setActivationAssertions:(id)a3
{
}

- (NSMutableDictionary)buttonEventListeners
{
  return self->_buttonEventListeners;
}

- (void)setButtonEventListeners:(id)a3
{
}

- (SASHeater)heater
{
  return self->_heater;
}

- (void)setHeater:(id)a3
{
}

- (AFSiriTether)siriTether
{
  return self->_siriTether;
}

- (void)setSiriTether:(id)a3
{
}

- (BOOL)siriTetherIsAttached
{
  return self->_siriTetherIsAttached;
}

- (void)setSiriTetherIsAttached:(BOOL)a3
{
  self->_siriTetherIsAttached = a3;
}

- (double)activationTimestamp
{
  return self->_activationTimestamp;
}

- (void)setActivationTimestamp:(double)a3
{
  self->_activationTimestamp = a3;
}

- (BOOL)voiceTriggerNotifyTokenIsValid
{
  return self->_voiceTriggerNotifyTokenIsValid;
}

- (void)setVoiceTriggerNotifyTokenIsValid:(BOOL)a3
{
  self->_voiceTriggerNotifyTokenIsValid = a3;
}

- (SASBulletinManager)bulletinManager
{
  return self->_bulletinManager;
}

- (void)setBulletinManager:(id)a3
{
}

- (SASRemoteRequestManager)remoteRequestManager
{
  return self->_remoteRequestManager;
}

- (void)setRemoteRequestManager:(id)a3
{
}

- (SASTestingInputController)testingInputController
{
  return self->_testingInputController;
}

- (void)setTestingInputController:(id)a3
{
}

- (NSMutableDictionary)avExternalButtonEvents
{
  return self->_avExternalButtonEvents;
}

- (void)setAvExternalButtonEvents:(id)a3
{
}

- (BOOL)buttonDownHasOccurredSinceActivation
{
  return self->_buttonDownHasOccurredSinceActivation;
}

- (void)setButtonDownHasOccurredSinceActivation:(BOOL)a3
{
  self->_buttonDownHasOccurredSinceActivation = a3;
}

- (BOOL)canActivateFromDirectActionSource
{
  return self->_canActivateFromDirectActionSource;
}

- (BOOL)_pocketStateFetchingInProgressForHeadsetActivation
{
  return self->_pocketStateFetchingInProgressForHeadsetActivation;
}

- (void)_setPocketStateFetchingInProgressForHeadsetActivation:(BOOL)a3
{
  self->_pocketStateFetchingInProgressForHeadsetActivation = a3;
}

- (SASBluetoothEndpointUtility)bluetoothEndpointUtil
{
  return self->_bluetoothEndpointUtil;
}

- (void)setBluetoothEndpointUtil:(id)a3
{
}

- (SASPresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (void)setPresentationManager:(id)a3
{
}

- (id)didDismissForAssesmentModeStartedCompeltion
{
  return self->_didDismissForAssesmentModeStartedCompeltion;
}

- (void)setDidDismissForAssesmentModeStartedCompeltion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didDismissForAssesmentModeStartedCompeltion, 0);
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_storeStrong((id *)&self->_bluetoothEndpointUtil, 0);
  objc_storeStrong((id *)&self->_avExternalButtonEvents, 0);
  objc_storeStrong((id *)&self->_testingInputController, 0);
  objc_storeStrong((id *)&self->_remoteRequestManager, 0);
  objc_storeStrong((id *)&self->_bulletinManager, 0);
  objc_storeStrong((id *)&self->_siriTether, 0);
  objc_storeStrong((id *)&self->_heater, 0);
  objc_storeStrong((id *)&self->_buttonEventListeners, 0);
  objc_storeStrong((id *)&self->_activationAssertions, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_assetUtilities, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_afPreferences, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_activationEventInstrumentationSender, 0);
  objc_storeStrong((id *)&self->_myriadController, 0);
  objc_storeStrong((id *)&self->_B188ActivationTimer, 0);
  objc_storeStrong((id *)&self->_voiceTriggerDispatchQueue, 0);
  objc_storeStrong((id *)&self->_preheatedPresentation, 0);
  objc_storeStrong(&self->_buttonTrigger, 0);
}

- (void)registerActivationSource:withIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation Registration of '%@' when it is already registered. Removing", v2, v3, v4, v5, 2u);
}

- (void)unregisterActivationSourceIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation Unregister request of '%@' when it is not registered.", v2, v3, v4, v5, 2u);
}

- (void)registerActivationAssertion:withIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation Registration of '%@' assertion when it is already present. Removing", v2, v3, v4, v5, 2u);
}

- (void)unregisterActivationAssertionWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation Unregister assertion for '%@' when it is not registered.", v2, v3, v4, v5, 2u);
}

- (void)registerButtonEventListenerServer:identifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation Registration of '%@' listener when it is already present. Removing", v2, v3, v4, v5, 2u);
}

- (void)unregisterButtonEventListenerWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation Unregister listener for '%@' when it is not registered.", v2, v3, v4, v5, 2u);
}

- (void)activationRequestFromButtonIdentifier:(void *)a3 context:.cold.1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSString;
  id v6 = a1;
  uint64_t v7 = [v5 stringWithSiriButtonIdentifier:a2];
  uint64_t v8 = SASRequestStateGetName([a3 _requestState]);
  int v9 = 136315650;
  int v10 = "-[SiriActivationService activationRequestFromButtonIdentifier:context:]";
  __int16 v11 = 2112;
  int v12 = v7;
  __int16 v13 = 2112;
  __int16 v14 = v8;
  _os_log_error_impl(&dword_1D9588000, v6, OS_LOG_TYPE_ERROR, "%s activationRequestFromButtonIdentifier:%@, with Siri state %@. Ignoring.", (uint8_t *)&v9, 0x20u);
}

void __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[SiriActivationService _activatePresentationWithIdentifier:requestOptions:analyticsContext:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_1D9588000, a2, OS_LOG_TYPE_DEBUG, "%s #activation is Visual Intelligence Launch: %d", (uint8_t *)&v2, 0x12u);
}

void __93__SiriActivationService__activatePresentationWithIdentifier_requestOptions_analyticsContext___block_invoke_cold_2(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = a1;
  uint64_t v6 = SiriPresentationRotationStyleGetName(a2);
  v8[0] = 136315650;
  OUTLINED_FUNCTION_1();
  __int16 v9 = v7;
  uint64_t v10 = a3;
  _os_log_debug_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEBUG, "%s #activation Setting rotation style for presentation { rotationStyle: %@, presentation: %@ }", (uint8_t *)v8, 0x20u);
}

void __87__SiriActivationService__handlePocketStateFetchForScreenWakeForPresentationIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9588000, v0, v1, "%s #activation #SiriPocketStateManager: error querying the pocket state for screen wake: %@ Turning on the screen...", v2, v3, v4, v5, 2u);
}

- (void)presentationManager:(void *)a1 didEncounterError:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = SASPresentationManagerErrorGetName(a2);
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D9588000, v3, OS_LOG_TYPE_ERROR, "%s #activation error: %@", (uint8_t *)v5, 0x16u);
}

@end